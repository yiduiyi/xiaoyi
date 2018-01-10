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
			
			
			boolean hasRelation = false;
			
			try {
				logger.info("query params:{openId+"+params.getString("openId")+"}");
				try {
					logger.info("根据openId查询家长角色【params】：{openId:"+params.get("openId")+"}");
					parents = parentsDao.selectByOpenId(params.getString("openId"));
					if(null!=parents){
						parentId = parents.getParentid();
						
						//更新家长信息（名字）
						if(StringUtils.isEmpty(parents.getParentname())
								&& params.get("parentName")!=null){
							//更新联系方式
							if(null!=params.getString("telNum") && params.getString("telNum").equals(parents.getTelnum())){
								parents.setTelnum(params.getString("telNum"));
							}
							parents.setParentname(params.getString("parentName"));
							parentsDao.updateByPrimaryKeySelective(parents);
						}
					}else{
						parentId = UUID.randomUUID().toString();
						parents = new Parents();
						parents.setParentid(UUID.randomUUID().toString());
						parents.setOpenid(params.getString("openId"));
						parents.setTelnum(params.getString("telNum"));
						parents.setWechatnum(params.getString("weChatNum"));
						parents.setParentname(params.getString("parentName"));
						
						//新增家长
						try {
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
					List<ParentStuRelation> relations = relationDao.selectRelationsByParentId(parentId);
					//已存在该家长
					if(!CollectionUtils.isEmpty(relations)){
						for(ParentStuRelation r : relations){
							stuIds.add(r.getMemberid());
						}
						if(!CollectionUtils.isEmpty(stuIds)){
							try {
								List<Student> stuList = studentDao.selectByStuIds(stuIds);
								if(null!=stuList){
									for(Student s : stuList){
										if(s.getName().equals(stuName)){
											hasRelation = true;
											studentId = s.getMemberid();
											break;
										}
									}
								}
							} catch (Exception e) {
								throw e;							
							}							
						}
					}else{						
						/*parents = new Parents();
						parents.setParentid(UUID.randomUUID().toString());
						parents.setOpenid(params.getString("openId"));
						parents.setTelnum(params.getString("telNum"));
						parents.setWechatnum(params.getString("weChatNum"));
						parents.setParentname(params.getString("parentName"));
						
						//新增家长
						try {
							parentsDao.insertSelective(parents);
						} catch (Exception e) {
							logger.info("插入家长失败！");
							throw e;
						}*/
					}
				} catch (Exception e) {
					logger.info("内部错误！");
					throw e;
				}								
			} catch (Exception e) {
				logger.info("查询家长角色出错！！");
				throw e;
			}
			
			//之前没有添加过该家长-学生的对应关系（添加关系）
			
			
			relation.setMemberid(studentId);
			relation.setParentid(parentId);
			student.setName(stuName);
			student.setMemberid(studentId);
			
			if(!hasRelation){
				studentId = UUID.randomUUID().toString();													
				student.setMemberid(studentId);
				relation.setMemberid(studentId);
				
				//添加学生
				try {
					studentDao.insertSelective(student);					
				} catch (Exception e) {
					logger.info("插入学生失败！");
					throw e;
				}
				
				//添加家长-学生关系
				try {					
					//relation = new ParentStuRelation();						
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
		
		return result;
	}

}
