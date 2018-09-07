package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.manager.dao.IAccountDao;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.dao.ITradeComplainsDao;
import com.xiaoyi.manager.dao.order.IOrderManageDao;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.domain.TradeComplains;
import com.xiaoyi.manager.service.IAccountService;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("accountService")
public class AccountServiceImpl implements IAccountService{
	@Resource  
    private IAccountDao accountDao;  
	
	@Resource
	private ITradeComplainsDao tradeCompainsDao;
	
	@Resource ITeacherDao teacherDao;
	
	@Autowired
	private IWechatService wechatService;
	
	@Autowired
	private IOrderManageDao orderManagerDao;
	
	ExecutorService executor = Executors.newFixedThreadPool(2);
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public AccountServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	@Transactional
	@Override
	public Account getAccountById(String accountId) {
		// TODO Auto-generated method stub
		return accountDao.selectByPrimaryKey(accountId);
	}

	/*
	 * 测试数据库事务
	 * (non-Javadoc)
	 * @see com.xiaoyi.manager.service.IAccountService#insertAccount(com.xiaoyi.manager.domain.Account)
	 */
	@Transactional
	@Override
	public int insertAccount(Account account) {
		// TODO Auto-generated method stub
		int items = 0;
		try {
			items = accountDao.insert(account);			
		} catch (Exception e) {
			logger.error("插入账户出错！");
			e.printStackTrace();
		}
		if(items<2){
			throw new RuntimeException();
		}
		
		return items;
	}
	@Override
	public List<JSONObject> getComplainList(JSONObject params) {		
		
		try {
			return tradeCompainsDao.selectAllByPrimaryKeys(params);			
		} catch (Exception e) {
			logger.info("查询投诉记录失败！");
			logger.error(e.getMessage());
			return null;
		}
				
	}
	
	@Override
	public int sendPurchaseLink(final JSONObject params) {
		String orderId = params.getString("orderIds");
		logger.info("orderId:"+orderId);
		if(StringUtils.isEmpty(orderId)){
			orderId = params.getString("orderId");
		}
		if(StringUtils.isEmpty(orderId)){
			return -2;
		}
		try {
			List<String> orderIdList = new ArrayList<String>();
			orderIdList.add(orderId);
			params.put("orderIdList", orderIdList);
			
			//理论上只有一条记录
			logger.info("查询欠费记录【params】"+params);
			List<JSONObject> shortageRecords = null;
			try {
				shortageRecords = orderManagerDao.selectLessonShortageRecords(params);
			} catch (Exception e) {
				logger.info("查询欠费记录失败！");
				e.printStackTrace();
				return -1;
			}
			if(CollectionUtils.isNotEmpty(shortageRecords)){
				for(JSONObject record : shortageRecords){
					String openId = record.getString("openId");
					if(StringUtils.isEmpty("openId")){
						continue;
					}
					JSONObject data = new JSONObject();
					JSONObject first = new JSONObject();
					first.put("value", "家长您好,您孩子的课时已欠费!");
					first.put("color", "#173177");
					data.put("first", first);
					
					JSONObject keyword1 = new JSONObject();
					keyword1.put("value", record.get("studentName"));
					keyword1.put("color", "#173177");		
					data.put("keyword1", keyword1);
					
					JSONObject keyword2 = new JSONObject();
					Integer lessonLeft = record.getInteger("lessonLeftNum");
					if(null!=lessonLeft && lessonLeft<0){
						keyword2.put("value", lessonLeft*-1 + "(课时数)");
						keyword2.put("color", "#173177");		
						data.put("keyword2", keyword2);
					}
					
					JSONObject remark = new JSONObject();
					remark.put("value", "请您补缴课时费, 谢谢!");
					remark.put("color", "#FF4500");		
					data.put("remark", remark);															
					
					logger.info("发送欠费模板消息...");
					logger.info("redirect url:"+WeiXinConfig.AUTH_AND_PAY_URL+"?orderId="+orderId);
					logger.info("openId"+openId);
					logger.info("data"+data);
					wechatService.sendTempletMsg(
							WeiXinConfig.CUSTOM_ARREARAGE_REMAINDER_TEMPLETE_ID, 
							WeiXinConfig.AUTH_AND_PAY_URL+"?orderId="+orderId, 
							openId, 
							data);	
				}
			}
			
		} catch (Exception e) {
			logger.info("发送补缴模板消息失败！");
			e.printStackTrace();
			return -1;
		}
		
		return 0;
	}
	
	@Override
	public int sendMsgsToSelectedCustom(Map<String,Object> params) {
		try {
			//获取小于6个课时的家长
			List<JSONObject> shortageRecords ;
			try {
				if(params == null){
					params = new HashMap<String,Object>();
				}
				String orderIds = String.valueOf(params.get("orderIds"));
				if(!StringUtils.isEmpty(orderIds)){
					List<String> orderIdList = Arrays.asList(orderIds.split(","));
					params.put("orderIdList", orderIdList);
				}
				
				shortageRecords = orderManagerDao.selectLessonShortageRecords(params);
				if(CollectionUtils.isEmpty(shortageRecords)){
					return 0;
				}			
			} catch (Exception e) {
				logger.info("查询少于6个课时记录失败！");
				e.printStackTrace();
				return -1;
			}
						
			return sendMultiNotEnoughLessonMsg(shortageRecords);
		} catch (Exception e) {
			logger.info("内部错误,提醒老师重置失败！");
			logger.error(e.getMessage());
			return -1;
		}
	}
	
	@Override
	public int sendNotEnoughLessonQuarzMsgToCustom() {
		
		return sendMsgsToSelectedCustom(new HashMap<String,Object>());	
	}
	
		
	private int sendMultiNotEnoughLessonMsg(List<JSONObject> shortageRecords) {
		// TODO Auto-generated method stub
		int sendMsgCount = 0;
		
		//组装发送数据
		try {
			final List<JSONObject> datas = new ArrayList<JSONObject>();
			try {				
				//根据家长openId开始推送消息（确认老师提现）
				//消息推送给家长，进行确认
				logger.info("开始组装发送数据...");
				for(JSONObject record : shortageRecords){
					JSONObject data = new JSONObject();
					JSONObject first = new JSONObject();
					first.put("value", "您好,您的孩子课时已不足!");
					first.put("color", "#173177");
					data.put("first", first);
					
					JSONObject keyword1 = new JSONObject();
					keyword1.put("value", record.get("studentName"));
					keyword1.put("color", "#173177");		
					data.put("keyword1", keyword1);
					
					JSONObject keyword2 = new JSONObject();
					keyword2.put("value", new Date()+"(截至时间)");
					keyword2.put("color", "#173177");		
					data.put("keyword2", keyword2);
					
					JSONObject keyword3 = new JSONObject();
					Integer totalLessonNum = record.getInteger("totalLessonNum");
					Integer leftLessonNum = record.getInteger("lessonLeftNum");
					if(null!=totalLessonNum && null!=leftLessonNum){
						keyword3.put("value",totalLessonNum-leftLessonNum);
						keyword3.put("color", "#173177");		
						data.put("keyword3", keyword3);					
					}
					
					JSONObject keyword4 = new JSONObject();
					keyword4.put("value",leftLessonNum);
					keyword4.put("color", "#173177");		
					data.put("keyword4", keyword4);
					
					JSONObject remark = new JSONObject();
					remark.put("value", "为了不影响教学进度,请您及时充值!");
					remark.put("color", "#FF4500");		
					data.put("remark", remark);				
						
					data.put("openId", record.get("openId"));
					datas.add(data);
				}
				logger.info("组装发送数据完成...");
			} catch (Exception e) {
				logger.info("拼装发送数据失败！");
				e.printStackTrace();
				return -1;
			}
			
			//正式发送模板消息
			logger.info("提交发送任务...");
			for(final JSONObject data : datas){
				final String openId = data.getString("openId");
				data.remove("openId");
				
				sendMsgCount ++;
				if(StringUtils.isNotEmpty(openId)){
					logger.info("当前提交任务【openId】："+openId);
					executor.submit(new Runnable() {
						
						@Override
						public void run() {
							// TODO Auto-generated method stub
							wechatService.sendTempletMsg(
									WeiXinConfig.CUSTOM_LESSON_SHORTAGE_REMAINDER_TEMPLETE_ID, 
									WeiXinConfig.AUTH_WITH_REDIRECT_URL, 
									openId, 
									data);							
						}
					});
				}
			}
		} catch (Exception e) {
			logger.info("发送模板消息失败！");
			e.printStackTrace();
			return -1;
		}
		
		return sendMsgCount;
	}

}
