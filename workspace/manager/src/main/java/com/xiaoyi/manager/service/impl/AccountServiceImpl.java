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
		try {
			//根据家长openId开始推送消息（确认老师提现）
			//消息推送给家长，进行确认
			final JSONObject data = new JSONObject();
			JSONObject first = new JSONObject();
			first.put("value", "家长您好：");
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
			params.put("data", data);
			
			JSONObject keyword3 = new JSONObject();
			keyword3.put("value", "请您及时充值！");
			keyword3.put("color", "#FF4500");		
			data.put("remark", keyword3);	
			
			Calendar cal = Calendar.getInstance();
			int month = cal.get(Calendar.MONTH);						
			
			/*StringBuffer extraParams= new StringBuffer();
			extraParams.append("?teachingId="); 
			extraParams.append(teachingId);
			
			extraParams.append("&month=");
			extraParams.append(month);
			logger.info("extraParams:"+extraParams.toString());*/
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					String openIds = params.getString("openIds");
					if(StringUtils.isNotEmpty(openIds)){
						List<String> openIdList = Arrays.asList(openIds.split(","));
						for(String openId : openIdList){
							wechatService.sendTempletMsg(WeiXinConfig.LESSON_CONFIRM_MSG_TEMPLETE_ID, 
									WeiXinConfig.LEFFON_CONFIRM_REDIRECT_URL/* + extraParams.toString()*/, 
									openId, 
									data);	
							try {
								Thread.sleep(5*1000);
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}
			}).start();
		} catch (Exception e) {
			logger.info("内部错误,提醒老师重置失败！");
			logger.error(e.getMessage());
			return -1;
		}
		return 0;
	}

}
