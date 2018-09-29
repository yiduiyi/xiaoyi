package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.FeedBack;
import com.xiaoyi.common.utils.ConstantUtil.Sex;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.common.utils.MathUtils;
import com.xiaoyi.manager.dao.IMonitorDao;
import com.xiaoyi.manager.service.IMonitorService;
@Service("MonitorService")
public class MonitorServiceImpl implements IMonitorService {
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
		long startTime = System.currentTimeMillis();
		//上周课时低于lessThan课时
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
		long endTime = System.currentTimeMillis();
		logger.info("数据处理时间"+""+(endTime-startTime));
		if(CollectionUtils.isNotEmpty(result)) {
			for (JSONObject teacher : result) {
				//转换教师等级
				Integer teachingLevel = teacher.getInteger("teachingLevel");
				if(null!=teachingLevel) {
					for(TeachingLevel level : TeachingLevel.values()) {
						if(teachingLevel==level.getValue()) {
							teacher.put("teachingLevelName", level.toString());
							break;
						}
					}
				}
				if(null != teacher.getBoolean("sex")) {
					Integer teacherSex = teacher.getBoolean("sex") ? 0 : 1;
					if(null!=teacherSex) {
						for(Sex sex : Sex.values()) {
							if(teacherSex==sex.getValue()) {
								teacher.put("sex", sex.toString());
								break;
							}
						}
					}
				}else {
					teacher.put("sex", "未知");
				}
				
			}
		}
		return result;
	}
	@Override
	public JSONObject getCustomFeedback(JSONObject reqData) {
		JSONObject result = new JSONObject();
		String probability = null;
		String feedback = null;
		String suggestion = null;
		//求整体满意度百分比
		try {
			List<JSONObject> evaluatioList = iMonitorDao.getEvaluatioList(reqData.getString("teachingId"));
			if(CollectionUtils.isNotEmpty(evaluatioList)) {
				Integer count = 0;
				for (JSONObject jsonObject : evaluatioList) {
					if(null != jsonObject) {
						if(jsonObject.getInteger("feedback") == 1) {
							count ++;
						}
					}
				}
				probability = MathUtils.percentage(count, evaluatioList.size());
			}
			//按照月份查询教师评价与建议
			JSONObject monthEvaluatio = iMonitorDao.getMonthEvaluatio(reqData);
			if(null != monthEvaluatio) {
				if(null != monthEvaluatio.getInteger("feedback")) {
					feedback = FeedBack.convert(monthEvaluatio.getInteger("feedback")).toString();
				}
				suggestion =  monthEvaluatio.getString("notes");
			}else {
				feedback = "满意";
			}
			if(StringUtils.isNotBlank(probability)) {
				result.put("satisfy", probability);
			}else {
				result.put("satisfy", "0%");
			}
			Date quertMonth = DateUtils.toYYYYMMDDDate(reqData.getString("queryMonth"));
			if(quertMonth.before(new Date()) ) {
				result.put("feedback", feedback);
				result.put("suggestion", suggestion);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
