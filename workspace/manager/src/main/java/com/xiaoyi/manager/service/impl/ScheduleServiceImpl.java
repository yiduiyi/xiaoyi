package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.junit.experimental.theories.Theory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.dao.IStudentDao;
import com.xiaoyi.manager.dao.IParentStuRelationDao;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.manager.domain.Student;
import com.xiaoyi.manager.service.IScheduleService;

@Service("scheduleService")
public class ScheduleServiceImpl implements IScheduleService {
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
	public int addSchedule(JSONObject schedule) {
		// 预约默认不安排老师
		try {			
			//查询/生成家长ID、学生Id
			String parentId = null;
			String studentId = null;
			String stuName = schedule.getString("studentName");
			
			boolean hasRelation = false;
			
			try {
				logger.info("query params:{openId+"+schedule.getString("openId")+"}");
				try {
					logger.info("根据openId查询家长角色【params】：{openId:"+schedule.get("openId")+"}");
					Parents parents = parentsDao.selectByOpenId(schedule.getString("openId"));
					if(null!=parents){
						parentId = parents.getParentid();
					}else{
						parentId = UUID.randomUUID().toString();
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
						Parents parent = new Parents();
						parent.setParentid(UUID.randomUUID().toString());
						parent.setOpenid(schedule.getString("openId"));
						parent.setTelnum(schedule.getString("telNum"));
						parent.setWechatnum(schedule.getString("weChatNum"));
						
						//新增家长
						try {
							parentsDao.insertSelective(parent);
						} catch (Exception e) {
							logger.info("插入家长失败！");
							throw e;
						}
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
			if(!hasRelation){
				studentId = UUID.randomUUID().toString();					
				Student student = new Student();
				student.setName(stuName);
				student.setMemberid(studentId);
				
				//添加学生
				try {
					studentDao.insertSelective(student);					
				} catch (Exception e) {
					logger.info("插入学生失败！");
				}
				
				//添加家长-学生关系
				try {					
					ParentStuRelation relation = new ParentStuRelation();
					relation.setMemberid(studentId);
					relation.setParentid(parentId);
	
					relationDao.insert(relation);
				} catch (Exception e) {
					logger.info("插入家长-学生关系出错！");
					throw e;
				}
			}
			
			//添加预约条目
			try {
				Schedule newSchedule = new Schedule();
				newSchedule.setCreatetime(new Date());
				newSchedule.setScheduleid(UUID.randomUUID().toString());
				newSchedule.setParentid(parentId);
				newSchedule.setMemberid(studentId);
				newSchedule.setLessontype(schedule.getInteger("lessonType"));
				newSchedule.setNotes("未处理");
				
				scheduleDao.insertSelective(newSchedule);
			} catch (Exception e) {
				logger.info("插入预约条目失败！");
				throw new Exception(e);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		return 0;
	}

	@Override
	public int deleteSchedule(String scheduleId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSchedule(JSONObject schedule) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<JSONObject> getScheduleList(JSONObject params) {
		// TODO Auto-generated method stub
		return null;
	}



}
