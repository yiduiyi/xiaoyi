package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
		return 0;
	}
	
	@Override
	public int sendNotEnoughLessonMsgToCustom() {
		try {
			//获取小于6个课时的家长
			List<JSONObject> shortageRecords ;
			try {
				shortageRecords = orderManagerDao.selectLessonShortageRecords();
				if(CollectionUtils.isEmpty(shortageRecords)){
					return 0;
				}			
			} catch (Exception e) {
				logger.info("查询少于6个课时记录失败！");
				e.printStackTrace();
				return 0;
			}
			/**
			 * {{first.DATA}}
				学生姓名：{{keyword1.DATA}}
				上课时间：{{keyword2.DATA}}
				消耗课时：{{keyword3.DATA}}
				剩余课时：{{keyword4.DATA}}
				{{remark.DATA}}
			 */
			//根据家长openId开始推送消息（确认老师提现）
			//消息推送给家长，进行确认
			final List<JSONObject> datas = new ArrayList<JSONObject>();
			for(JSONObject record : shortageRecords){
				JSONObject data = new JSONObject();
				JSONObject first = new JSONObject();
				first.put("value", "您好,您的课时已不足!");
				first.put("color", "#173177");
				data.put("first", first);
				
				JSONObject keyword1 = new JSONObject();
				keyword1.put("value", "您的课时已不足6个小时！");
				keyword1.put("color", "#173177");		
				data.put("keyword1", keyword1);
				
				JSONObject keyword2 = new JSONObject();
				keyword2.put("value",new Date());
				keyword2.put("color", "#173177");		
				data.put("keyword2", keyword2);
				
				JSONObject keywor3 = new JSONObject();
				keyword2.put("value",new Date());
				keyword2.put("color", "#173177");		
				data.put("keyword2", keyword2);
				
				JSONObject remark = new JSONObject();
				remark.put("value", "为了不影响教学进度,请您及时充值!");
				remark.put("color", "#FF4500");		
				data.put("remark", remark);				
					
				datas.add(data);
			}
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub					
					
				}
			}).start();
		} catch (Exception e) {
			logger.info("内部错误,提醒老师重置失败！");
			logger.error(e.getMessage());
			return -1;
		}
		return 0;
	}
	
	@Override
	public int sendSingleNotEnoughLessonMsg(String openId,JSONObject data) {
		// TODO Auto-generated method stub
		if(StringUtils.isNotEmpty(openId)){
			
			wechatService.sendTempletMsg(WeiXinConfig.LESSON_CONFIRM_MSG_TEMPLETE_ID, 
					WeiXinConfig.LEFFON_CONFIRM_REDIRECT_URL, 
					openId, 
					data);	
		}
		
		return 0;
	}

}
