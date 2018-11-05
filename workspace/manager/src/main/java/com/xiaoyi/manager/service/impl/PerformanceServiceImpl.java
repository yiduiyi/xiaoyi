package com.xiaoyi.manager.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.manager.dao.IChannelManagerGroupDao;
import com.xiaoyi.manager.dao.IConsultantGroupDao;
import com.xiaoyi.manager.service.IAuditionService;
import com.xiaoyi.manager.service.IBillRecordRelationService;
import com.xiaoyi.manager.service.IChannelManagerService;
import com.xiaoyi.manager.service.IConsultantOrderRelationService;
import com.xiaoyi.manager.service.ICooperatorService;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.manager.service.IPerformanceService;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceDao;

@Service("performanceService")
public class PerformanceServiceImpl implements IPerformanceService {
	@Resource
	private IOrderService orderService;
	@Resource
	private ITeacherBalanceDao teacherBalanceDao;
	@Resource
	private ILessonTradeDao lessonTradeDao;
	@Resource
	private IConsultantGroupDao consultantGroupDao;
	@Resource
	private IBillRecordRelationService billRecordRelationService;
	@Resource
	private IConsultantOrderRelationService consultantOrderRelationService;
	@Resource
	private IChannelManagerGroupDao channelManagerGroupDao;
	@Resource
	private IChannelManagerService channelManagerService;
	@Resource
	private ICooperatorService cooperatorService;
	@Resource
	private IAuditionService auditionService;
	@Override
	public JSONObject getOperationalData(JSONObject reqData) throws ParseException {
		JSONObject result = new JSONObject();

		Float totalTurnover = orderService.getTotalTurnoverData(null, null);
		JSONObject data = teacherBalanceDao.selectTotalTeacherBalanceData();
		result.put("totalTurnover", totalTurnover);
		if (null != data) {
			result.put("totalTeacherRetainedEarnings", data.getString("totalTeacherRetainedEarnings"));
			result.put("totalTeacherCurrentEarnings", data.getString("totalTeacherCurrentEarnings"));
		}
		if (null != reqData.getString("queryMonth")) {
			Date queryTime = DateUtils.toYYYYMMDate(reqData.getString("queryMonth"));
			Date startTime = DateUtils.getMonthMin(queryTime);
			Date endTime = DateUtils.getMonthMax(queryTime);
			Float monthTurnover = orderService.getTotalTurnoverData(startTime, endTime);
			Float monthLessonNum = lessonTradeDao.getMonthLessonNumData(startTime, endTime);
			Integer renewalNum = orderService.getRenewalNum(startTime, endTime);
			result.put("monthTurnover", monthTurnover);
			result.put("monthLessonNum", monthLessonNum);
			result.put("renewalNum", renewalNum);
			List<JSONObject> channelData = orderService.getChannelData(startTime, endTime);
			result.put("channelData", channelData);
		}
		return result;
	}

	@Override
	public JSONObject getConsultantGroupData(JSONObject reqData) {
		JSONObject result = new JSONObject();
		Integer totalBillNum = 0;
		Integer noClaimBillNum = 0;
		Integer noMateBillNum = 0;
		Integer mateBillNum = 0;
		String consultantGroupId = reqData.getString("consultantGroupId");
		List<String> consultantIdList = new ArrayList<String>();
		Date startTime = null;
		Date endTime = null;
		if (reqData.getString("queryType").equals("0")) {
			startTime = DateUtils.getDayMin(new Date());
			endTime = DateUtils.getDayMax(new Date());
		} else if (reqData.getString("queryType").equals("1")) {
			startTime = DateUtils.getWeekMin(reqData.getDate("queryTime"));
			endTime = DateUtils.getWeekMax(reqData.getDate("queryTime"));
		} else if (reqData.getString("queryType").equals("2")) {
			startTime = DateUtils.getMonthMin(reqData.getDate("queryTime"));
			endTime = DateUtils.getMonthMax(reqData.getDate("queryTime"));
		}
		List<JSONObject> consultantGroup = consultantGroupDao.getAllConsultantGroupList();
		List<JSONObject> billList = billRecordRelationService.getBillRecordDataByTime(startTime, endTime);
		if (CollectionUtils.isNotEmpty(consultantGroup)) {
			if (null != reqData.getString("consultantGroupId")) {
				for (JSONObject jsonObject : consultantGroup) {
					if (reqData.getString("consultantGroupId").equals(jsonObject.getString("consultantGroupId"))) {
						consultantIdList.add(jsonObject.getString("consultantId"));
					}
				}
			}
		}
		if (CollectionUtils.isNotEmpty(billList)) {
			// 当查询单个课程顾问组统计的时候
			if (null != reqData.getString("consultantGroupId")) {
				for (JSONObject jsonObject : billList) {
					// 判断该课程顾问组总发布订单量
					if (consultantIdList.contains(jsonObject.getString("consultantId"))) {
						totalBillNum++;
						if (jsonObject.getInteger("claimNum") > 0) {
							if (jsonObject.getInteger("billStatus") == 1) {
								noMateBillNum++;
							} else if (jsonObject.getInteger("billStatus") == 2) {
								mateBillNum++;
							}
						} else {
							noClaimBillNum++;
						}
					}
				}
			} else {
				// 查询所有课程顾问组信息
				for (JSONObject jsonObject : billList) {
					totalBillNum++;
					if (jsonObject.getInteger("claimNum") > 0) {
						if (jsonObject.getInteger("billStatus") == 1) {
							noMateBillNum++;
						} else if (jsonObject.getInteger("billStatus") == 2) {
							mateBillNum++;
						}
					} else {
						noClaimBillNum++;
					}
				}
			}
			result.put("totalBillNum", totalBillNum);
			result.put("noClaimBillNum", noClaimBillNum);
			result.put("noMateBillNum", noMateBillNum);
			result.put("mateBillNum", mateBillNum);
		}
		//获取成单排行榜
		List<JSONObject> consultantOrderRankingList = consultantOrderRelationService.getConsultantOrderRankingList(consultantGroupId,startTime,endTime);
		//List<JSONObject> consultantOrderRankingList = consultantOrderRelationService.getConsultantOrderRankingList(consultantGroupId,startTime,endTime);
		result.put("consultantOrderRankingList", consultantOrderRankingList);
		return result;
	}

	@Override
	public JSONObject getChannelGroupData(JSONObject reqData) {
		JSONObject result = new JSONObject();
		Integer totalIntendedNumber = 0;
		Integer totalCooperatorNum = 0;
		Integer totalAuditionNum = 0;
		Integer totalCompleteNum = 0;
		String channelManagerGroupId = reqData.getString("channelGroupId");
		
		Date startTime = null;
		Date endTime = null;
		if (reqData.getString("queryType").equals("0")) {
			startTime = DateUtils.getDayMin(new Date());
			endTime = DateUtils.getDayMax(new Date());
		} else if (reqData.getString("queryType").equals("1")) {
			startTime = DateUtils.getWeekMin(reqData.getDate("queryTime"));
			endTime = DateUtils.getWeekMax(reqData.getDate("queryTime"));
		} else if (reqData.getString("queryType").equals("2")) {
			startTime = DateUtils.getMonthMin(reqData.getDate("queryTime"));
			endTime = DateUtils.getMonthMax(reqData.getDate("queryTime"));
		}
		totalIntendedNumber = channelManagerService.getTotalIntendedNumber(channelManagerGroupId);
		totalCooperatorNum = cooperatorService.getTotalCooperatorNum(channelManagerGroupId,startTime,endTime);
		//TODO暂未完成
		JSONObject jsonObject = auditionService.getchannelManagerAuditionData(channelManagerGroupId,startTime,endTime);
		List<JSONObject> cooperatorRankList = cooperatorService.getCooperatorRankList(channelManagerGroupId,startTime,endTime);
		result.put("totalIntendedNumber", totalIntendedNumber);
		result.put("totalCooperatorNum", totalCooperatorNum);
		result.put("cooperatorRankList", cooperatorRankList);
		return result;
	}

}
