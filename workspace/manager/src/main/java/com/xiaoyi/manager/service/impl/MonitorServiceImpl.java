package com.xiaoyi.manager.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.FeedBack;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.common.utils.MathUtils;
import com.xiaoyi.manager.dao.IMonitorDao;
import com.xiaoyi.manager.service.MonitorService;
@Service("MonitorService")
public class MonitorServiceImpl implements MonitorService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	private IMonitorDao iMonitorDao;
	@Override
	public List<JSONObject> getTeachingProcess(JSONObject reqData) {
		List<JSONObject> result = null;
		try {
			result = iMonitorDao.getTeachersList(reqData);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		//查询每位绑定的老师课时
		if(!CollectionUtils.isEmpty(result)) {
			for (JSONObject teacher : result) {
				JSONObject params = new JSONObject();
				params.put("teacherId", teacher.getString("teacherId"));
				params.put("memberId", teacher.getString("memberId"));
				params.put("parentId", teacher.getString("parentId"));
				logger.info(teacher.getString("teacherId")+"该教师所绑定的学生姓名"+teacher.getString("name"));
				Integer latestWeekTeachingNum = iMonitorDao.getLatestWeekTeachingNum(params);
				if(null != latestWeekTeachingNum) {
					teacher.put("latestWeekTeachingNum", latestWeekTeachingNum);
				}
				Integer currentWeekTeachingNum = iMonitorDao.getCurrentWeekTeachingNum(params);
				if(null != currentWeekTeachingNum) {
					teacher.put("currentWeekTeachingNum", currentWeekTeachingNum);
				}
				Integer totalTeachingNum = iMonitorDao.getTotalTeachingNum(params);
				if(null != totalTeachingNum) {
					teacher.put("totalTeachingNum", totalTeachingNum);
				}
				//转换教师等级
				Integer teachingLevel = teacher.getInteger("teachingLevel");
				if(null!=teachingLevel) {
					for(TeachingLevel level : TeachingLevel.values()) {
						if(teachingLevel==level.getValue()) {
							teacher.put("teachingLevel", level.toString());
							break;
						}
					}
				}
			}
			Integer lessThan = reqData.getInteger("lessThan");
			Iterator<JSONObject> iterator = result.iterator();
			if(null != lessThan) {
				while(iterator.hasNext()) {
					JSONObject teacher = iterator.next();
					logger.info(teacher.getString("teacherId")+"该教师所提现的课时"+"上周课时"+teacher.getString("latestWeekTeachingNum")+"本周课时"+teacher.getString("currentWeekTeachingNum")+"总课时"+teacher.getString("totalTeachingNum"));
					Integer latestWeekTeachingNum = teacher.getInteger("latestWeekTeachingNum");
					if(null != latestWeekTeachingNum) {
						if(latestWeekTeachingNum > lessThan) {
							iterator.remove();
						}
					}
					
				}
			}
			
		}
		return result;
	}
	@Override
	public JSONObject getCustomFeedback(JSONObject reqData) {
		JSONObject result = new JSONObject();
		//求整体满意度百分比
		try {
			List<JSONObject> evaluatioList = iMonitorDao.getEvaluatioList(reqData.getString("teachingId"));
			if(CollectionUtils.isNotEmpty(evaluatioList)) {
				Integer count = 0;
				for (JSONObject jsonObject : evaluatioList) {
					if(jsonObject.getInteger("feedback") == 1) {
						count ++;
					}
				}
				String probability = MathUtils.percentage(count, evaluatioList.size());
				result.put("satisfy", probability);
			}
			//按照月份查询教师评价与建议
			JSONObject monthEvaluatio = iMonitorDao.getMonthEvaluatio(reqData);
			if(null != monthEvaluatio) {
				result.put("feedback", FeedBack.convert(monthEvaluatio.getInteger("feedback")));
				result.put("suggestion", monthEvaluatio.getString("notes"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}
}
