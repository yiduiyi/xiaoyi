package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
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
			throw new CommonRunException(-1, "查询老师-学生关系出错！");
		}
		
		
		//查询老师上周、这周、总上课课时数
		if(CollectionUtils.isNotEmpty(result)){
			List<String> teachingIdList = null;
			
			//有老师查询条件时，增加过滤条件
			if(StringUtils.isNotEmpty(reqData.getString("teacherName"))){
				teachingIdList = new ArrayList<String>();
				for(JSONObject singleResult : result){
					teachingIdList.add(singleResult.getString("teachingId"));
				}
			}
			
			try {
				List<JSONObject> weekTeachingNumMap = 
						iMonitorDao.selectTeacherWeekTeachingList(teachingIdList );
				
				if(CollectionUtils.isNotEmpty(weekTeachingNumMap)){
					//老师总共课时数、本周课时数、上周课时数映射表
					Map<String,Integer> teachingIdTotalTeachingNumMap = new HashMap<String,Integer>();
					Map<String,Integer> teachingIdLastWeekTeachingNumMap = new HashMap<String,Integer>();
					Map<String,Integer> teachingIdCurWeekTeachingNumMap = new HashMap<String,Integer>();
					
					for(JSONObject weekTeachingNum : weekTeachingNumMap){
						Integer weekFromNow = weekTeachingNum.getInteger("weekFromNow");
						Integer teachingNum = weekTeachingNum.getInteger("teachingNum");
						String teachingId = weekTeachingNum.getString("teachingId");
						
						if(teachingNum==null){
							continue;
						}
						
						//第一次
						Integer totalTeachingNum = teachingIdTotalTeachingNumMap.get(teachingId);
						if(null==totalTeachingNum){
							totalTeachingNum = 0;
						}
						totalTeachingNum += teachingNum;
						teachingIdTotalTeachingNumMap.put(teachingId, totalTeachingNum);
						
						if(null!=weekFromNow){
							switch(weekFromNow){
							case 0:	//本周
								teachingIdCurWeekTeachingNumMap.put(teachingId, teachingNum);
								break;
							case 1:	//上周
								teachingIdLastWeekTeachingNumMap.put(teachingId, teachingNum);
								break;
								default:
									break;
							}
						}						
					}
					
					//补充查询结果字段（周课时）
					Iterator<JSONObject>teacherIter = result.iterator();
					while(teacherIter.hasNext()){
						JSONObject singleResult = teacherIter.next();
						String teachingId = singleResult.getString("teachingId");
						Integer totalWeekNum = teachingIdTotalTeachingNumMap.get(teachingId);
						Integer lastWeekNum = teachingIdLastWeekTeachingNumMap.get(teachingId);
						Integer curWeekNum = teachingIdCurWeekTeachingNumMap.get(teachingId);
						
						singleResult.put("latestWeekTeachingNum", 
								(lastWeekNum==null)?0 : lastWeekNum);
						singleResult.put("currentWeekTeachingNum", (curWeekNum==null)?0:curWeekNum);
						singleResult.put("totalTeachingNum", (totalWeekNum==null)?0 : totalWeekNum);
					
						//去掉不全的数据
						if(StringUtils.isEmpty(singleResult.getString("teacherName")) 
								|| StringUtils.isEmpty(singleResult.getString("telNumber"))){
							teacherIter.remove();
						}
					}
					
				}				
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("查询老师周课时失败！");
				throw new CommonRunException(-1, "查询老师周课时失败！");
			}
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
							teacher.put("teachingLevel", level.toString());
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
