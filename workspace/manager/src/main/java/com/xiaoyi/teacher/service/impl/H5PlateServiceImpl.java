package com.xiaoyi.teacher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.XMLUtil;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IOrdersDao;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.service.IAccountService;

import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ITH5PlateDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceDailyProfitsDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceFromDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceWithdrawDao;
import com.xiaoyi.teacher.dao.ITeachingRecordDao;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.TeacherBalance;
import com.xiaoyi.teacher.domain.TeacherBalanceDailyProfits;
import com.xiaoyi.teacher.domain.TeacherBalanceWithdraw;
import com.xiaoyi.teacher.domain.TeachingRecord;
import com.xiaoyi.teacher.service.IH5PlateService;
import com.xiaoyi.teacher.service.ITeachingRecordService;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("h5PlateService")
public class H5PlateServiceImpl implements IH5PlateService {

	@Resource
	ITH5PlateDao teacherH5Dao;
	
	@Resource
	IUserDao userDao;
	
	@Resource
	ITeachingRecordDao tRecordDao;
	
	@Resource
	IOrderSumDao orderSumDao;
	
	@Resource
	IOrdersDao ordersDao;
	
	@Resource
	ITeacherDao teacherDao;
	
	@Resource
	ITeacherBalanceDao balanceDao;
	
	@Resource
	private ITeacherBalanceFromDao balanceFromDao;
	
	@Resource
	ITeacherBalanceWithdrawDao balanceWithdrawDao;
	
	@Resource
	ITeacherBalanceDailyProfitsDao dailyProfitsDao;
	
	@Autowired
	IAccountService accountService;
	
	@Autowired
	IWechatService wechatService;
	
	@Autowired
	ITeachingRecordService tRecordService;

	@Autowired ILessonTradeDao lessonTradeDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final static float DAILY_PROFITS_RATE = 8.2f;
	
	@Override
	public int queryBindStatus(String openId) {
		try {
			Teacher teacher = teacherH5Dao.selectTeacherByOpenId(openId);
			if(null!=teacher) {
				return 1;
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Transactional
	@Override
	public int bindWechat(Map<String, Object> params) {
		try {	
			Teacher teacher;
			//查询账号是否已注册
			try {
				teacher = teacherH5Dao.selectTeacherByParams(params);
				
				//数据库没有匹配的用户（电话号码+用户名）
				if(null==teacher) {
					return 2;
				}					
				
				if(teacher.getSigned()==0){
					return 4;
				}
				
				if(StringUtils.isNotEmpty(teacher.getOpenId())){
					return 3;
				}
			} catch (Exception e) {
				logger.error("查询老师失败！【params】："+params.toString());
				e.printStackTrace();
				return -1;
			}
			
			//查询登录user表
			User userKey = new User();
			userKey.setUsername(teacher.getTelnumber());
			//userKey.setUserid(teacher.getTelnumber());//初始化账号-手机号码			
			
			User user = null;
			try {				
				user = userDao.selectByPrimaryKey(userKey);												
			} catch (Exception e) {
				logger.info("查询用户信息表出错！【params】："+userKey.toString());
				e.printStackTrace();
				return -1;
			}
					
			//绑定微信Id
			teacher.setOpenId((String)params.get("openId"));
			try {				
				teacherH5Dao.updateTeacherByOpenId(teacher);
			} catch (Exception e) {
				logger.error("关联老师微信号失败！【params】："+teacher.toString());
				e.printStackTrace();
				throw e;
			}
			
			
			//更新用户（老师）信息表
			boolean insert = false; //插入、更新标志
			if(null==user) {
				insert = true;
				user = new User();
				user.setUseraccountid(teacher.getTeacherid());
				user.setLoginstatus(false);
				user.setUserprivilege((byte)0);
				user.setUsertype((byte)3);
				
				String telNum = teacher.getTelnumber();
				if(null!=telNum) {
					user.setUserid(teacher.getTeacherid());
					user.setUsername(teacher.getTelnumber());
					user.setPassword(telNum.substring(telNum.length()-6, telNum.length()));
				}
			}
			user.setOpenid((String)params.get("openId"));
			user.setNickname((String)params.get("nickname"));
			user.setHeadimgurl((String)params.get("headimgurl"));

			Object password =params.get("password");
			if(null!=password && !password.equals("")
					&& !password.equals(user.getPassword())){
				logger.info("密码错误！");
				return 5;
			}
			
			try {
				if(insert) {
					userDao.insertSelective(user);
				}else {
					userDao.updateByPrimaryKeySelective(user);					
				}
			} catch (Exception e) {
				logger.error("插入/更新用户表出错！");
				e.printStackTrace();
				throw e;				
			}

		} catch (Exception e) {
			logger.info("内部错误！");
			e.printStackTrace();
			throw new RuntimeException();
		}
		return 0;
	}

	@Override
	public synchronized int withdrawLessons(JSONObject params) throws Exception {
		// TODO Auto-generated method stub
		if(null==params ){
			logger.info("参数错误！");
			return -1;
		}
		String lessonTradeId = params.getString("lessonTradeId");
		if(StringUtils.isNotEmpty(lessonTradeId)){
			logger.info("参数错误！");
			return -1;
		}
				
		//计算课时费-》转账-》更新老师提现状态
		try {
			logger.info("开始企业付款。。。");
			JSONObject resultString = wechatService.payToTeacher(params);
			if(null!=resultString) {
				//课时不足情况
				if(null!=resultString.getInteger("code") && -5==resultString.getIntValue("code")){
					return -5;
				}
				Map<String,String> resultMap = XMLUtil.parseXml(resultString.getString("weixinPost"));
				
				if("SUCCESS".equalsIgnoreCase(resultMap.get("result_code")) 
						&& "SUCCESS".equalsIgnoreCase(resultMap.get("return_code"))){
					logger.info("付款成功！");
					
					//提现到账成功(更新提现到账状态)
					return tRecordService.updateLessonTrade(lessonTradeId);																														
				} else{
					logger.info("提现失败, 商户号余额（可能）不足, 请稍后重试！");
					return -2;
				}
			} else{
				logger.info("系统内部错误, 请稍后重试！");
				return -3;
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("系统内部错误, 请稍后重试！");
			return -3;
		}			

		
	}

	@Override
	public List<JSONObject> getAvailableLessons(String openId) throws Exception {
		// TODO Auto-generated method stub
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			Teacher teacher = null;
			try {
				logger.info("根据openId查询老师【openId】："+openId);
				teacher = teacherH5Dao.selectTeacherByOpenId(openId);
			} catch (Exception e) {
				logger.error(e.getMessage());
				logger.info("根据openId查询老师失败！");
				return null;
			}
			String teacherId = teacher.getTeacherid();
			List<JSONObject> lessonTradeList = tRecordDao.selectLessonTradeByTeacherId(teacherId);
			
			if(CollectionUtils.isNotEmpty(lessonTradeList)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				for(JSONObject lessonTrade : lessonTradeList) {				
					JSONObject record = new JSONObject();
					Date applyTime = lessonTrade.getDate("applyTime");
					String time = sdf.format(applyTime);
					
					record.put("lessonTradeId", lessonTrade.get("lessonTradeId"));
					record.put("year", time.substring(0, 4));
					record.put("month", time.substring(5,7));
					
					//计算剩余可提现余额
					Float actualPay = lessonTrade.getFloat("actualPay");
					Float withdrawed = lessonTrade.getFloat("withdrawed");
					if(null==actualPay){
						actualPay = 0f;
					}
					if(null==withdrawed){
						withdrawed = 0f;
					}
					
					record.put("fee", actualPay - withdrawed/*lessonTrade.get("actualPay")*/);
					record.put("parentName", lessonTrade.get("parentName"));
					
					Byte status = lessonTrade.getByte("status");
					if(null==status) {
						status = 1;
					}else {
						status = (byte) (status.intValue()==0?0:1);
					}
					record.put("status", status);
					
					datas.add(record);
				}
			}
			return datas;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int send() {
		logger.info("进入定时任务。。。");
		return 0;
	}

	@Transactional
	@Override
	public int withdrawBalance(JSONObject params) throws Exception {
		//verify params
		String openId = params.getString("openId");
		Float withdrawing = params.getFloat("withdrawing");
		
		logger.info("params:"+params.toJSONString());
		if(null == openId || null == withdrawing){
			logger.info("参数错误！");
			throw new CommonRunException(-1, "前台传递参数错误！");
		}
		
		//扣除课时后剩余（用于计算课时提现金额及余额收益是否需要提现）
		float tobeWithdrawed = withdrawing;

		//查询可提现余额
		String teacherId = params.getString("teacherId");
		if(StringUtils.isEmpty(teacherId)){
			Teacher teacher = teacherH5Dao.selectTeacherByOpenId(openId);
			if(null==teacher){
				throw new CommonRunException(-1, "参数错误【teacherId为空】！");
			}
			teacherId = teacher.getTeacherid();
		}
		
		//判断余额是否大于提现余额
		TeacherBalance teacherBalance =	balanceDao.selectByPrimaryKey(teacherId);

		if(null==teacherBalance){
			logger.info("查询账户为空！");
			throw new CommonRunException(-2, "查询账户为空！");
		}else{
			logger.info("更新前课时来源："+teacherBalance.getBalanceFrom());
			 if(teacherBalance.getTotalBalanceProfit()==null){
				 teacherBalance.setTotalBalanceProfit(0f);
			 }
			 if(teacherBalance.getBalanceAccount()==null){
				 teacherBalance.setBalanceAccount(0f);
			 }
			 if(teacherBalance.getBalanceProfitLeft()==null){
				 teacherBalance.setBalanceProfitLeft(0f);
			 }
			 if((teacherBalance.getBalanceProfitLeft() + teacherBalance.getBalanceAccount())
					 < withdrawing){
				 logger.info("账户余额不足！");
				 throw new CommonRunException(-2, "账户余额不足！");
			 }
			 if(StringUtils.isEmpty(teacherBalance.getBalanceFrom())){
				 logger.info("没有匹配老师课时！");
				 throw new CommonRunException(-2, "没有匹配老师课时！");
			 }
		}
		
		//扣除课时所得
		try {
			String lessonTradeIds = teacherBalance.getBalanceFrom();
			logger.info("lessonTradeIds:"+lessonTradeIds);
			if(!StringUtils.isEmpty(lessonTradeIds)){
				
				String[] lessonTradeArray = lessonTradeIds.split(",");
				List<String> lessonTradeIdList = new ArrayList<String>();

				//避免unmodified map 错误！
				List<String>tempList = Arrays.asList(lessonTradeArray);				
				for(String lessonTradeId : tempList){
					lessonTradeIdList.add(lessonTradeId);
				}
				
				List<LessonTrade> lessonTradeList = lessonTradeDao.selectByLessonTradeIds(lessonTradeIdList);
				logger.info("根据lessonTradeids查询提现列表【size】："+lessonTradeList);
				
				
				if(tobeWithdrawed < 1.0f){	//微信支付必须大于等于1元
					throw new CommonRunException(-3, "提现金额必须大于1元！");
				}
				
				//判断提现金额是否满足条件（有些家长课时已经为负数，不允许提现）
				List<OrderSumKey> keys = new ArrayList<OrderSumKey>();
				for(LessonTrade record : lessonTradeList){
					OrderSumKey key = new OrderSumKey();
					key.setLessontype(record.getLessontype());
					key.setParentid(record.getParentid());
					key.setMemberid(record.getMemberid());
					
					keys.add(key);					
				}
				List<OrderSum> orderSumList;
				try {
					orderSumList = orderSumDao.selectOrderSumBatchByKey(keys);					
				} catch (Exception e) {
					logger.error("查询老师提现-家长订单列表出错！");
					throw new CommonRunException(-1, "查询老师提现-家长订单列表出错！");
				}
				if(null==orderSumList || orderSumList.size()!=lessonTradeList.size()){
					logger.info("提现列表与订单列表对应不上！");
					throw new CommonRunException(-1, "提现列表与订单列表对应不上！");
				}
				//判断是否存在家长课时为负的订单
				for(OrderSum orderSum : orderSumList){
					
					//家长课时为负时，不再允许老师提现
					Float lessonLeftNum = orderSum.getLessonleftnum();
					if(lessonLeftNum<0){
						throw new CommonRunException(-1, "提现失败！【原因：家长课时为负】");
					}					
				}				
				
				//更新课时交易记录状态
				//排序
				Collections.sort(lessonTradeList, new Comparator<LessonTrade>() {

					@Override
					public int compare(LessonTrade o1, LessonTrade o2) {
						
						if(o1.getWithdrawed()==null){
							o1.setWithdrawed(0f);
						}
						if(o2.getWithdrawed()==null){
							o2.setWithdrawed(0f);
						}
						
						return (int)((o1.getActualPay()-o1.getWithdrawed()) 
								- (o2.getActualPay()-o2.getWithdrawed()));
					}
				});
				for(LessonTrade record : lessonTradeList){
					if(record.getActualPay() == null){
						record.setActualPay(0f);
					}
					if(record.getWithdrawed()==null){
						record.setWithdrawed(0f);
					}
					//计算剩余
					float remain = record.getActualPay() - record.getWithdrawed();
					
					logger.info("lessonTradeId:"+record.getLessontradeid());
					logger.info("提现金额剩余："+remain);
					
					if(remain>/*withdrawing*/tobeWithdrawed){
						record.setWithdrawed(record.getWithdrawed() + withdrawing);		
						tobeWithdrawed = 0;
					}else{
						record.setStatus((byte)0);	//全部提现完毕
						record.setWithdrawed(record.getActualPay());
						tobeWithdrawed -= remain;	
						
						//更新课时余额来源
						lessonTradeIdList.remove(record.getLessontradeid());						
					}					
					
					//更新课时提现状态
					logger.info("更新课时提现金额及状态...");
					try {						
						lessonTradeDao.updateByPrimaryKeySelective(record);
					} catch (Exception e) {
						logger.error("更新课时提现金额及状态失败！");
						throw new CommonRunException(-1, "更新课时提现金额及状态失败！");
					}
					
					if(tobeWithdrawed <= 0){
						break;
					}
				}
				
				//更新课时余额来源
				StringBuffer sb = new StringBuffer();
				if(!CollectionUtils.isEmpty(lessonTradeIdList)){
					for(String lessonTradeId : lessonTradeIdList){
						sb.append(lessonTradeId);
						sb.append(",");
					}
				}
				if(sb.length()>0){
					teacherBalance.setBalanceFrom(sb.substring(0,sb.length()-1));					
				}else{
					teacherBalance.setBalanceFrom("");
				}
				logger.info("更新后课时来源："+teacherBalance.getBalanceFrom());
			}
		} catch (Exception e) {
			logger.error("内部错误！");
			e.printStackTrace();
			//回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			throw new CommonRunException(-4, "内部错误！");
		}
		
		//付款
		logger.info("开始付款...");
		logger.info("付款金额："+ withdrawing);
		Map<String,String> payResult = null;
		try {		
			payResult = wechatService.unifiedPay(openId, withdrawing);
			logger.info("payResult:"+payResult);
		} catch (Exception e) {
			logger.error("付款失败！");
			throw new CommonRunException(-4, "付款失败！");
		}
		if("SUCCESS".equalsIgnoreCase(payResult.get("result_code")) 
				&& "SUCCESS".equalsIgnoreCase(payResult.get("return_code"))){
			logger.info("付款成功！");
			try {
				//计算余额 & 收益余额
				float balanceAccount = teacherBalance.getBalanceAccount() - withdrawing;
				float leftProfit = teacherBalance.getBalanceProfitLeft();
				if(tobeWithdrawed>0){	//需要提现余额
					balanceAccount = 0;
					leftProfit -= tobeWithdrawed;
				}/*
				leftProfit = (balanceAccount)>=teacherBalance.getBalanceProfitLeft()?
						teacherBalance.getBalanceProfitLeft():(balanceAccount);*/
				teacherBalance.setBalanceAccount(balanceAccount);
				teacherBalance.setBalanceProfitLeft(leftProfit);
				
				balanceDao.updateByPrimaryKey(teacherBalance);				
			} catch (Exception e) {
				logger.error("更新老师课时余额失败【需要人工结算】！");
				throw new CommonRunException(-4, "更新老师课时余额失败【需要人工结算】！");
			}
			try {
				TeacherBalanceWithdraw balanceWithdraw = new TeacherBalanceWithdraw();
				balanceWithdraw.setApplyDate(new Date());
				balanceWithdraw.setBalanceLeft(teacherBalance.getBalanceAccount());
				balanceWithdraw.setTeacherid(teacherBalance.getTeacherid());
				balanceWithdraw.setWithdraw(withdrawing);
				balanceWithdraw.setWithdrawId(UUID.randomUUID().toString());
				
				balanceWithdrawDao.insertSelective(balanceWithdraw);
			} catch (Exception e) {
				logger.error("增加老师课时提现记录失败【需要人工结算】！");
				throw new CommonRunException(-4, "增加老师课时提现记录失败【需要人工结算】");
			}
			
		}else{
			logger.info("付款失败！");
			throw new CommonRunException(-5, "付款失败！");
		}
	
		return 0;
	}

	@Override
	public JSONObject queryTeacherBalanceing(JSONObject params) throws Exception {
			
		//验证参数
		SimpleDateFormat formate = new SimpleDateFormat("yyy-MM-dd");
		
		params.put("curDate", formate.format(new Date()));
		if(StringUtils.isEmpty(params.getString("openId"))){
			throw new CommonRunException(-1, "参数错误,【openId】为空！");
		}
		//根据openId查询老师teacherId
		logger.info("根据openId查询老师【openId】:"+params.get("openId"));
		Teacher teacher = teacherH5Dao.selectTeacherByOpenId(params.getString("openId"));
		if(null==teacher){
			throw new CommonRunException(-1, "参数错误【没有查到对应的老师】!");
		}
		
		//查询老师账户余额
		try {
			params.put("teacherId", teacher.getTeacherid());
			JSONObject teacherBalance =  balanceDao.selectTeacherBalanceByParams(params);
			if(teacherBalance==null || teacherBalance.size()==0){
				teacherBalance = new JSONObject();
				teacherBalance.put("teacherId", teacher.getTeacherid());				
			}
			if(null == teacherBalance.get("profitRate")){
				teacherBalance.put("profitRate", 8.2);
			}
			if(null == teacherBalance.get("balanceLeft")){
				teacherBalance.put("balanceLeft", 0);
			}
			if(null == teacherBalance.get("balanceProfit")){
				teacherBalance.put("balanceProfit", 0);
			}
			if(null == teacherBalance.get("totalBalanceProfit")){
				teacherBalance.put("totalBalanceProfit", 0);
			}
			if(null == teacherBalance.get("balanceProfitLeft")){
				teacherBalance.put("balanceProfitLeft", 0);
			}
			return teacherBalance;
		} catch (Exception e) {
			logger.error("查询老师账户余额出错！");
			throw new CommonRunException(-2, "查询老师账户余额出错！");
		}		
	}
	
	/**
	 * 计算余额收益
	 */
	@Transactional
	public void computeBalanceProfit(){
		logger.info("时间："+new Date());
		logger.info("开始计算收益...");
		//查询所有余额大于0的老师余额账户
		try {
			List<TeacherBalance> balanceList = null;
			try {
				logger.info("查询老师账户余额列表...");
				balanceList = balanceDao.selectAllAccountBalance();
				if(CollectionUtils.isEmpty(balanceList)){
					logger.info("查询老师账户余额列表为空！");
					return ;
				}
			} catch (Exception e) {
				logger.error("查询老师账户余额列表出错！");
				throw e;
			}
			
			logger.info("批量更新老师余额表【size】："+balanceList.size());
			List<TeacherBalanceDailyProfits> dailyProfitsList = 
					new ArrayList<TeacherBalanceDailyProfits>();
			//批量更新老师余额表
			for(TeacherBalance teacherBalance : balanceList){
				//计算老师日收益
				Float balanceAccount = teacherBalance.getBalanceAccount();
				if(null == balanceAccount || 0==balanceAccount){
					continue;
				}
				float dailyBalaceProfits = (DAILY_PROFITS_RATE * balanceAccount)/100;
				dailyBalaceProfits /= 365;
				//更新余额表
				float profitLeft = 0f,totalBalanceProfit = 0f;
				if(null!=teacherBalance.getBalanceProfitLeft()){
					profitLeft = teacherBalance.getBalanceProfitLeft();
				}
				if(null!=teacherBalance.getTotalBalanceProfit()){
					totalBalanceProfit = teacherBalance.getTotalBalanceProfit();
				}
				teacherBalance.setBalanceProfitLeft(profitLeft + dailyBalaceProfits);
				teacherBalance.setTotalBalanceProfit(totalBalanceProfit + dailyBalaceProfits);
				
				
				//初始化老师余额日收益列表
				TeacherBalanceDailyProfits dailyProfits = new TeacherBalanceDailyProfits();
				dailyProfits.setBalanceLeft(balanceAccount);
				dailyProfits.setBalanceProfit(dailyBalaceProfits);
				dailyProfits.setGenerateDate(new Date());
				dailyProfits.setProfitId(UUID.randomUUID().toString());
				dailyProfits.setProfitRate(DAILY_PROFITS_RATE);
				dailyProfits.setTeacherid(teacherBalance.getTeacherid());
				
				dailyProfitsList.add(dailyProfits);
			}
			
			try {
				logger.info("批量更新老师余额表【入库】");
				int updatedNum = balanceDao.updateAllAccountBalanceProfits(balanceList);				
				logger.info("更新入库记录数："+ updatedNum);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("更新账户余额表出错！");
				throw e;
			}
			
			//批量插入老师日收益表
			try {
				logger.info("批量插入老师日收益表...");
				int insertedNum = dailyProfitsDao.insertTeacherDailyFrofitBatch(dailyProfitsList);
				logger.info("批量插入老师日收益表数目：" + insertedNum);
			} catch (Exception e) {
				logger.error("批量插入老师日收益失败！");
				e.printStackTrace();
				throw e;				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("内部错误！");
			throw new RuntimeException();
		}
	}
	
	/**
	 * 提现课时费到余额
	 */
	@Transactional
	public void withdrawLessonIncomeToBalance(){
		//金融版version2.0（加入余额功能）
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("status", 2);
		//计算七点前的日期
		Calendar   cal   =   Calendar.getInstance();
        cal.add(Calendar.DATE,   -7);
        String yesterday = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
        System.out.println(yesterday);		
		params.put("queryDateFull", yesterday);
		
		List<LessonTrade> lessonTradeList = lessonTradeDao.selectByParams(params);
		
		List<TeacherBalance> withdrawBalanceList = new ArrayList<TeacherBalance>();
		//List<TeacherBalanceFromKey> balanceFromList = new ArrayList<TeacherBalanceFromKey>();
		
		
		List<String> teacherIdList = new ArrayList<String>();
		Map<String,TeacherBalance> teacherIdBalanceTotalMap = new HashMap<String,TeacherBalance>();
		for(LessonTrade record : lessonTradeList){
			//查询/增加老师对应的余额表		
			String teacherId = record.getTeacherid();
			//String lessonTradeId = record.getLessontradeid();
			
			if(!teacherIdList.contains(teacherId)){
				teacherIdList.add(teacherId);
			}	
	
		}
		
		List<TeacherBalance> teacherBalanceList = null;
		try {
			logger.info("根据老师Id查询老师余额列表...");
			teacherBalanceList = 
					balanceDao.selectBatchByTeacherIds(teacherIdList);
			
			//合并余额列表-》总余额账户
			for(TeacherBalance tb : teacherBalanceList){								
				teacherIdBalanceTotalMap.put(tb.getTeacherid(), tb);
			}
		} catch (Exception e) {
			logger.error("根据老师Id查询老师余额列表出错！");
			throw new CommonRunException(-1, "根据老师Id查询老师余额列表出错！");
		}
		
		//更新余额总表
		try {
			logger.info("计算余额总表...");
			for(LessonTrade record : lessonTradeList){
				String teacherId = record.getTeacherid();
				TeacherBalance tb = teacherIdBalanceTotalMap.get(teacherId);
				Float balanceAccount = 0f;
				StringBuffer balanceFrom = new StringBuffer();
				if(null == tb){
					tb = new TeacherBalance();
					tb.setTeacherid(teacherId);
					tb.setTotalBalanceProfit(balanceAccount);
					tb.setBalanceProfitLeft(balanceAccount);
					
					teacherIdBalanceTotalMap.put(teacherId, tb);
					tb.setBalanceFrom(record.getLessontradeid());				
				}else{
					balanceAccount = tb.getBalanceAccount();
					
					//余额来源（课时费）
					balanceFrom.append(tb.getBalanceFrom());
					balanceFrom.append(",");	
					if(!balanceFrom.toString().contains(record.getLessontradeid())){
						balanceFrom.append(record.getLessontradeid());
					}
					tb.setBalanceFrom(balanceFrom.toString());
				}
				
				balanceAccount += record.getActualPay();
				tb.setBalanceAccount(balanceAccount);
				
				if(!withdrawBalanceList.contains(tb)){
					/*TeacherBalance tbCopy = new TeacherBalance();
					tbCopy.setBalanceAccount(tb.getBalanceAccount());
					tbCopy.setBalanceFrom(tb.getBalanceFrom());
					tbCopy.setBalanceProfitLeft(tb.getBalanceProfitLeft());
					tbCopy.setTeacherid(teacherId);
					tbCopy.setTotalBalanceProfit(tb.getTotalBalanceProfit());*/
					withdrawBalanceList.add(tb);
				}
			}
		} catch (Exception e) {
			logger.error("内部错误[更新余额总表出错]！");
		}
		
		//账户余额入库
		try {
			logger.info("withdrawBalanceList[size]:"+withdrawBalanceList.size());
			balanceDao.updateAllAccountBalanceProfits(withdrawBalanceList);
		} catch (Exception e) {
			logger.error("增加/更新老师账户余额出错【入库错误】！");
			throw new CommonRunException(-7, "增加/更新老师账户余额出错【入库错误】！");
		}
		
	}

	@Override
	public List<JSONObject> getTeachingRelationships(String openId) {
		List<JSONObject> result = new ArrayList<JSONObject>();
		
		String teacherId = null;
		if(StringUtils.isEmpty(openId)){
			return result;
		}
		
		//根据openId查询老师
		Teacher teacher = null;
		try {
			teacher = teacherH5Dao.selectTeacherByOpenId(openId);
			if(null==teacher){
				throw new CommonRunException(-1, "参数错误【teacherId为空】！");
			}
			teacherId = teacher.getTeacherid();
		} catch (Exception e) {
			logger.error("根据openID查询老师失败！");
		}
		
		if(StringUtils.isEmpty(teacherId)){
			logger.info("老师Id为空！");
			return result;
		}
		//查询绑定教学订单（老师-家长-学生关系）
		try {		
			result = teacherH5Dao.selectTeachingRelationships(teacherId);
		} catch (Exception e) {
			logger.error("查询绑定教学订单（老师-家长-学生关系）失败！");
		}
		
		return result;
	}

	@Override
	public List<JSONObject> getHistoryTeachingRecords(JSONObject params) {
		List<JSONObject> result = new ArrayList<JSONObject>();
		try {
			result = teacherH5Dao.selectHistoryTeachingRecords(params);
		} catch (Exception e) {
			logger.error("查询历史课时提交记录失败！");
		}
		return result;
	}

	@Override
	public int submitTeachingRecord(JSONObject params) {
		// TODO Auto-generated method stub
		String orderId = params.getString("orderId");
		String teacherId = params.getString("teacherId");
		String teachingId = params.getString("teachingId");
		String openId = params.getString("openId");
		
		String teacherName = null;
		try {
			Teacher teacher = teacherDao.selectByPrimaryKey(teacherId);
			teacherName = teacher.getTeachername();
		} catch (Exception e) {
			logger.info("查询老师失败！");
			e.printStackTrace();
			return -1;
		}
		
		//新增微信端teachingRecord
		float totalLessons = 0f;
		try {
			List<TeachingRecord> teachingRecords = new ArrayList<TeachingRecord>();
			JSONArray teachingDetails = params.getJSONArray("teachingDetails");			
			
			for(Object obj : teachingDetails){
				JSONObject teachingDetail = (JSONObject)obj;
				TeachingRecord record = new TeachingRecord();
				
				record.setOrderid(orderId);
				record.setTeacherid(teacherId);
				record.setTeachingid(teachingId);
				record.setRecordid(UUID.randomUUID().toString());
				record.setEndtime(teachingDetail.getString("endTime"));
				record.setStarttime(teachingDetail.getString("startTime"));
				record.setTeachingdate(teachingDetail.getDate("teachingDate"));
				record.setTeachingnum(teachingDetail.getFloat("checkNum"));
				record.setFeedback(teachingDetail.getString("feedback"));
				//record.setLessonTradeId(lessonTradeId);  区别于pc端提现
				//此次提现课时数
				totalLessons += teachingDetail.getFloatValue("checkNum");
				
				teachingRecords.add(record);
			}
			
			tRecordDao.insertTeachingRecords(teachingRecords );
		} catch (Exception e) {
			throw new CommonRunException(-1, "插入微信提现记录失败！");
		}
		
		//更新家长订单
		Float leftLessonCount = 0f;
		int lessontype = 0;
		// 更新用户订单课时数（家长）
		try {
			OrderSumKey key = new OrderSumKey();
			key.setOrderid(orderId);
			OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
			leftLessonCount = orderSum.getLessonleftnum() - totalLessons;
			orderSum.setLessonleftnum(leftLessonCount);

			lessontype = orderSum.getLessontype();
			
			// 新增家长端老师提现记录
			Orders order = new Orders();
			order.setOrderid(UUID.randomUUID().toString());
			order.setCreatetime(new Date());
			order.setLessontype(lessontype);
			order.setMemberid(orderSum.getMemberid());
			order.setOrderType(-1);
			order.setParentid(orderSum.getParentid());
			order.setPurchasenum(-totalLessons);

			// 提现记录入库
			ordersDao.insert(order);

			// 更新用户总课时
			orderSumDao.updateByPrimaryKeySelective(orderSum);
			//leftLessonCount = orderSum.getLessonleftnum();
			
			//剩余课时小于6个小时,自动触发缴费提醒
			if(orderSum.getLessonleftnum()<=6){
				Map<String,Object> obj = new HashMap<String,Object>();
				obj.put("orderIds", orderId);
				accountService.sendMsgsToSelectedCustom(obj);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonRunException(-1, " 更新家长订单失败！");
		}

		
		//发送消息到家长微信端
		// 根据家长openId开始推送消息（确认老师提现）
		// 消息推送给家长，进行确认
		JSONObject data = new JSONObject();
		JSONObject first = new JSONObject();
		first.put("value", "家长您好：");
		first.put("color", "#173177");
		data.put("first", first);

		JSONObject keyword1 = new JSONObject();
		keyword1.put("value", teacherName);
		keyword1.put("color", "#173177");
		data.put("keyword1", keyword1);

		
		LessonType lt = LessonType.convert(lessontype);
		JSONObject keyword2 = new JSONObject();
		keyword2.put("value", lt.getGradeName(false));
		keyword2.put("color", "#173177");
		data.put("keyword2", keyword2);
		params.put("data", data);
		
		JSONObject keyword3 = new JSONObject();
		keyword3.put("value", totalLessons+"(剩余："+leftLessonCount+")");
		keyword3.put("color", "#173177");
		data.put("keyword3", keyword3);
		params.put("data", data);

		JSONObject keyword4 = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		keyword4.put("value", sdf.format(new Date()));
		keyword4.put("color", "#173177");
		data.put("keyword4", keyword4);
		params.put("data", data);

		//已捕获异常
		String result = wechatService.sendTempletMsg(WeiXinConfig.CUSTOM_LESSON_CONFIRM_MSG_TEMPLETE_ID/*LESSON_CONFIRM_MSG_TEMPLETE_ID*/,
				WeiXinConfig.LEFFON_CONFIRM_REDIRECT_URL/* + extraParams.toString()*/, openId,
				data);
		
		return 0;
	}
}
