package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.dao.IStudentDao;
import com.xiaoyi.manager.dao.IParentStuRelationDao;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Student;
import com.xiaoyi.manager.service.ICommonService;

@Service("commonService")
public class CommonServiceImpl implements ICommonService {
	@Resource  
    private IScheduleDao scheduleDao;  
	
	@Resource
	private IStudentDao studentDao;
	
	@Resource
	private IParentsDao parentsDao;
	
	@Resource 
	private IParentStuRelationDao relationDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Transactional
	@Override
	public JSONObject addOrGetPSR(JSONObject params) {
		JSONObject result = new JSONObject();
		ParentStuRelation relation=new ParentStuRelation();
		Parents parents= null;
		Student student = new Student();
		
		// 预约默认不安排老师
		try {			
			//查询/生成家长ID、学生Id
			String parentId = null;
			String studentId = null;
			String stuName = params.getString("studentName");		
			String wechatNum = params.getString("wechatNum") ;
			String telNum = params.getString("telNum");
			String parentName = params.getString("parentName");
			
			//去空格
			if(null!=stuName){
				stuName = stuName.trim();
			}
			if(wechatNum!=null){
				wechatNum = wechatNum.trim();
			}
			if(telNum!=null){
				telNum = telNum.trim();
			}
			if(parentName!=null){
				parentName = parentName.trim();
			}
			
			boolean hasRelation = false;			
			StringBuffer sb =new StringBuffer();
			try {
				List<ParentStuRelation> relations = null;
				
				logger.info("query params:{openId+"+params.getString("openId")+"}");
				try {
					logger.info("根据openId查询家长角色【params】：{openId:"+params.get("openId")+"}");
					parents = parentsDao.selectByOpenId(params.getString("openId"));	//一般情况（家长付费）
					if(null==parents) {		//管理员手动录入
						logger.info("根据telNum查询家长角色【params】：{根据telNum:"+params.get("telNum")+"}");
						parents = parentsDao.selectByTelNum(telNum);
					}
					
					if(null!=parents){
						parentId = parents.getParentid();
						
						//代买
						if(null!=telNum 
								&& !telNum.equals(parents.getTelnum())
								/*&& null!=parentsDao.selectByTelNum(params.getString("telNum"))*/){
							//暂时记录该家长信息（孤立信息, 没有任何绑定）
							if(null==parentsDao.selectByTelNum(telNum)){
								Parents addParent = new Parents();
								addParent.setOpenid(UUID.randomUUID().toString());
								addParent.setParentid(UUID.randomUUID().toString());
								addParent.setParentname(parentName);
								addParent.setTelnum(telNum);
								addParent.setWechatnum(wechatNum);
								
								parentsDao.insertSelective(addParent);
							}
							//parents.setTelnum(params.getString("telNum"));
							//代买（手机号 + 家长姓名）
							sb.append("(");
							sb.append(telNum);
							sb.append("-");
														
							sb.append(params.get("parentName"));
							sb.append(")");
							/*if(!StringUtils.isEmpty(parents.getParentname())
									&& params.get("parentName")!=null){
							}*/
						}

						//更新微信号(预约字段)
						if(null!=wechatNum 
								&& !wechatNum.trim().equals(parents.getWechatnum())) {
							parents.setWechatnum(wechatNum);
							try {
								parentsDao.updateByPrimaryKeySelective(parents);
							} catch (Exception e) {
								logger.info("更新家长微信号出错！");
							}
						}
												
						try {
							relations = relationDao.selectRelationsByParentId(parentId);							
						} catch (Exception e) {
							logger.info("查询学生-家长关系出错！");
							throw e;
						}
					}else{
						logger.info("openId\'"+params.getString("openId")+"\'没有关联家长");
						logger.info("开始新增家长账号：");
						parentId = UUID.randomUUID().toString();
						parents = new Parents();
						parents.setParentid(parentId);
						parents.setOpenid(params.getString("openId"));
						parents.setTelnum(telNum);
						parents.setWechatnum(wechatNum);
						parents.setParentname(parentName);
						
						//新增家长(必然不存在家长-学生关系)
						try {
							logger.info("插入家长账号：【params】"+parents.toString());
							parentsDao.insertSelective(parents);
						} catch (Exception e) {
							logger.info("插入家长失败！");
							throw e;
						}
					}
				} catch (Exception e) {
					logger.info("查询家长出错！");
					throw e;
				}							
				
				//查询家长-学生关系
				try {
					List<String> stuIds = new ArrayList<String>();
					
					//已存在该家长（判断已存在的关系是否包含即将插入的学生-家长关系）
					if(!CollectionUtils.isEmpty(relations)){
						for(ParentStuRelation r : relations){
							stuIds.add(r.getMemberid());
						}
						if(!CollectionUtils.isEmpty(stuIds)){
							try {
								logger.info("根据学生Id查询学生：【params】"+stuIds);
								List<Student> stuList = studentDao.selectByStuIds(stuIds);
								if(null!=stuList){
									for(Student s : stuList){
										if(null!=s.getName() 
												&& (s.getName().equals(stuName) || s.getName().equals(stuName + sb.toString()))
												|| (StringUtils.isEmpty(s.getName()) && StringUtils.isEmpty(stuName))){
											hasRelation = true;
											studentId = s.getMemberid();
											
											relation.setMemberid(studentId);
											relation.setParentid(parentId);
											break;
										}
									}
								}
							} catch (Exception e) {
								e.printStackTrace();
								throw e;							
							}							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					logger.info("内部错误！");
					throw e;
				}								
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("查询家长角色出错！！");
				throw e;
			}
			
			//之前没有添加过该家长-学生的对应关系（添加关系）								
			if(!hasRelation){
				logger.info("之前没有添加过该家长-学生的对应关系（添加关系）");
				studentId = UUID.randomUUID().toString();													
				student.setMemberid(studentId);
				student.setName(stuName + sb.toString());
				student.setMemberid(studentId);
				
				
				//添加学生
				try {
					logger.info("添加学生：【params】"+student);
					studentDao.insertSelective(student);					
				} catch (Exception e) {
					logger.info("插入学生失败！");
					throw e;
				}
				
				//添加家长-学生关系
				try {					
					relation.setMemberid(studentId);
					relation.setParentid(parentId);
					logger.info("新增家长-学生关系：【params】"+relation.toString());
					relationDao.insert(relation);
				} catch (Exception e) {
					logger.info("插入家长-学生关系出错！");
					throw e;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		result.put("parents", parents);
		result.put("student", student);
		result.put("relation", relation);
		logger.info("返回结果："+result.toJSONString());
		
		return result;
	}

}
