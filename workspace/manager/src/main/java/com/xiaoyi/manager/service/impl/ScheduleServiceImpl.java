package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.manager.service.ICommonService;
import com.xiaoyi.manager.service.IScheduleService;

@Service("scheduleService")
public class ScheduleServiceImpl implements IScheduleService {
	@Resource  
    private IScheduleDao scheduleDao;  
	
	@Resource
	private ICommonService commonService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Transactional
	@Override
	public int addSchedule(JSONObject schedule) {
		// 预约默认不安排老师
		try {			
			//查询/生成家长ID、学生Id
			String parentId = null;
			String studentId = null;			
			
			try {
				JSONObject relations = commonService.addOrGetPSR(schedule);
				if(null==relations){
					return -1;
				}
				
				ParentStuRelation relation = (ParentStuRelation) relations.get("relation");
				studentId = relation.getMemberid();
				parentId = relation.getParentid();
			} catch (Exception e) {
				logger.error("添加/获取家长-学生关系失败！");
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
		try {
			return scheduleDao.deleteByPrimaryKey(scheduleId);
		} catch (Exception e) {
			logger.info("删除预约失败！");			
			return -1;
		}
	}

	@Override
	public int updateSchedule(JSONObject schedule) {
		try {
			Schedule recode = new Schedule();
			recode.setScheduleid(schedule.getString("scheduleId"));
			recode.setNotes(schedule.getString("notes"));
			recode.setStatus(schedule.getByte("status"));
			
			return scheduleDao.updateByPrimaryKeySelective(recode);
		} catch (Exception e) {
			return -1;
		}		
	}

	@Override
	public List<JSONObject> getScheduleList(JSONObject params) throws Exception{
		// TODO Auto-generated method stub
		try {
			return scheduleDao.selectListByConditions(params);
		} catch (Exception e) {
			logger.info("查询预约失败！");
			throw e;
		}		
	}



}
