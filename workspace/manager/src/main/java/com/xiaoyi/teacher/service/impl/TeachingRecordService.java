package com.xiaoyi.teacher.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ILessonTradeSumDao;
import com.xiaoyi.teacher.dao.ISuggestionsDao;
import com.xiaoyi.teacher.dao.ITeachingRecordDao;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.LessonTradeSum;
import com.xiaoyi.teacher.domain.Suggestions;
import com.xiaoyi.teacher.domain.TeachingRecord;
import com.xiaoyi.teacher.service.ITeachingRecordService;

@Service("recordService")
public class TeachingRecordService implements ITeachingRecordService {

	@Resource
	ITeachingRecordDao teachingRecordDao;
	
	@Resource
	ILessonTradeDao lessonTradeDao;
	
	@Resource
	ILessonTradeSumDao tradeSumDao;
	
	@Resource
	ISuggestionsDao suggestionDao;
	
	@Resource
	IOrderSumDao orderSumDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<JSONObject> getRecordList(JSONObject params) throws Exception {
		try {
			return teachingRecordDao.selectRecordsByTid(params.getString("teacherId"));
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}
	
	@Transactional
	@Override
	public int insertTeachingRecords(JSONObject params) {
		try {
			String orderId  = params.getString("orderId");
			String teacherId = params.getString("teacherId");
			String teachingId = params.getString("teachingId");
			Integer lessontype = params.getInteger("lessonType");
			String parentId = params.getString("parentId");
			String memberId = params.getString("memberId");
			
			List<TeachingRecord> teachingRecords = new ArrayList<TeachingRecord>();
			JSONArray teachingDetails = params.getJSONArray("teachingDetails");
			
			//1.增加老师带课记录
			int totalLessons = 0;
			if(!CollectionUtils.isEmpty(teachingDetails)){
				for(Object obj : teachingDetails){
					JSONObject teachingDetail = (JSONObject)obj;
					TeachingRecord record = new TeachingRecord();
					record.setOrderid(orderId);
					record.setRecordid(UUID.randomUUID().toString());
					record.setTeacherid(teacherId);
					record.setTeachingid(teachingId);
					record.setStarttime(teachingDetail.getString("startTime"));
					record.setEndtime(teachingDetail.getString("endTime"));
					record.setTeachingdate(teachingDetail.getDate("teachingDate"));
					record.setTeachingnum(teachingDetail.getShort("checkNum"));
					
					teachingRecords.add(record);
					
					//提现课时数
					totalLessons+=teachingDetail.getInteger("checkNum");
				}
				try {
					teachingRecordDao.insertTeachingRecords(teachingRecords);				
				} catch (Exception e) {
					throw e;
				}
				
				//2、增加提现记录
				String lessonTradeId = UUID.randomUUID().toString();
				LessonTrade lessonTrade = new LessonTrade();
				lessonTrade.setLessontradeid(lessonTradeId);
				lessonTrade.setApplylessons((short)totalLessons);
				lessonTrade.setLessontype(lessontype);
				lessonTrade.setParentid(parentId);
				lessonTrade.setMemberid(memberId);
				lessonTrade.setTeacherid(teacherId);
				lessonTrade.setStatus((byte) 1);	//1: 已提交, 2：提现成功, -1：提现失败
				lessonTrade.setApplytime(new Date());
				
				try {
					lessonTradeDao.insertSelective(lessonTrade);
				} catch (Exception e) {
					logger.error("添加提现记录失败！");
					e.printStackTrace();
					throw e;
				}
				
				//3、更新建议表及提现汇总表
				try {
					//建议表
					Suggestions suggestion = new Suggestions();
					
					suggestion.setLessontradeid(lessonTradeId);
					suggestion.setSituations(params.getString("situations"));
					suggestion.setSuggestions(params.getString("suggestions"));
					try {
						suggestionDao.insertSelective(suggestion);						
					} catch (Exception e) {
						logger.error("插入建议表出错！");
						throw e;
					}
					
					//提现汇总表
					try {
						LessonTradeSum tradeSum = tradeSumDao.selectByPrimaryKey(teacherId);
						int totalSubLessons = totalLessons;
						if(null==tradeSum){
							tradeSum = new LessonTradeSum();
							tradeSum.setTeacherid(teacherId);
							tradeSum.setTotallessonnum((short) 0);
							
							tradeSumDao.insertSelective(tradeSum);
						}
						
						tradeSum.setTeacherid(teacherId);
						tradeSum.setTotallessonnum((short)(totalSubLessons+tradeSum.getTotallessonnum()));
						
						tradeSumDao.updateByPrimaryKeySelective(tradeSum);
					} catch (Exception e) {
						logger.error("插入汇总表出错！");
						throw e;
					}
					
					//更新用户订单课时数
					try {
						OrderSumKey key = new OrderSumKey();
						key.setOrderid(orderId);
						OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);											
						orderSum.setLessonleftnum((short)(orderSum.getLessonleftnum()-totalLessons));
						
						orderSumDao.updateByPrimaryKeySelective(orderSum);						
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return 0;
	}

	@Override
	public JSONObject getTRecordSum(JSONObject params) throws Exception {
		try {
			LessonTradeSum tradeSum = tradeSumDao.selectByPrimaryKey(params.getString("teacherId"));
			if(null!=tradeSum) {
				JSONObject tradeSumMap = new JSONObject();
				tradeSumMap.put("totalIncome", tradeSum.getTotalincome());
				tradeSumMap.put("withDrawLessonNum", tradeSum.getWithdrawlessonnum());
				tradeSumMap.put("checkedLessonNum", tradeSum.getCheckedlessonnum());
				tradeSumMap.put("frozenLessonNum", tradeSum.getFrozenlessonnum());
				
				return tradeSumMap;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
