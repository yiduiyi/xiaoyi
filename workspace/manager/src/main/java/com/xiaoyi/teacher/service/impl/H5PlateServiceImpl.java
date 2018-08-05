package com.xiaoyi.teacher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.XMLUtil;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.domain.UserKey;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
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
import com.xiaoyi.teacher.domain.TeacherBalanceFromKey;
import com.xiaoyi.teacher.domain.TeacherBalanceWithdraw;
import com.xiaoyi.teacher.service.IH5PlateService;
import com.xiaoyi.teacher.service.ITeachingRecordService;

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
	ITeacherBalanceDao balanceDao;
	
	@Resource
	private ITeacherBalanceFromDao balanceFromDao;
	
	@Resource
	ITeacherBalanceWithdrawDao balanceWithdrawDao;
	
	@Resource
	ITeacherBalanceDailyProfitsDao dailyProfitsDao;
	
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
				
				float tobeWithdrawed = withdrawing;
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
					
					if(remain>withdrawing){
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
				teacherBalance.setBalanceFrom(sb.substring(0,sb.length()-1));
				logger.info("更新后课时来源："+teacherBalance.getBalanceFrom());
			}
		} catch (Exception e) {
			logger.error("内部错误！");
			throw new CommonRunException(-4, e.getMessage());
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
				float leftProfit = (balanceAccount)>=teacherBalance.getBalanceProfitLeft()?
						teacherBalance.getBalanceProfitLeft():(balanceAccount);
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
		params.put("queryDate", yesterday);
		
		List<LessonTrade> lessonTradeList = lessonTradeDao.selectByParams(params);
		
		List<TeacherBalance> withdrawBalanceList = new ArrayList<TeacherBalance>();
		List<TeacherBalanceFromKey> balanceFromList = new ArrayList<TeacherBalanceFromKey>();
		
		for(LessonTrade record : lessonTradeList){
			//查询/增加老师对应的余额表		
			String teacherId = record.getTeacherid();
			String lessonTradeId = record.getLessontradeid();
			
			try {
				TeacherBalance teacherBalance = balanceDao.selectByPrimaryKey(teacherId);
				float balanceAccount =0;
				StringBuffer balanceFrom = new StringBuffer();
				if(null==teacherBalance || teacherBalance.getTeacherid()==null){
					teacherBalance = new TeacherBalance();
					teacherBalance.setTeacherid(teacherId);
					teacherBalance.setTotalBalanceProfit(0f);
					teacherBalance.setBalanceProfitLeft(0f);
					balanceAccount = 0;
				}else{
					balanceAccount += teacherBalance.getBalanceAccount();
				}
				
				if(!StringUtils.isEmpty(teacherBalance.getBalanceFrom())){
					balanceFrom.append(",");
				}
				balanceFrom.append(record.getLessontradeid());
				teacherBalance.setBalanceFrom(balanceFrom.toString());
				balanceAccount += record.getActualPay();
				teacherBalance.setBalanceAccount(balanceAccount);
				
				//balanceDao.u
				//balanceDao.insertSelective(teacherBalance);
				withdrawBalanceList.add(teacherBalance);
			} catch (Exception e) {
				logger.error("增加/更新老师账户余额出错【内部错误】！");
				throw new CommonRunException(-5, "增加/更新老师账户余额出错【内部错误】！");
			}
			
			//更新老师提现记录与老师Id关系表
			TeacherBalanceFromKey balanceFrom = new TeacherBalanceFromKey();
			balanceFrom.setTeacherid(teacherId);
			balanceFrom.setLessontradeid(lessonTradeId);
			
			balanceFromList.add(balanceFrom);				
		}
		
		//账户余额入库
		try {
			balanceDao.updateAllAccountBalanceProfits(withdrawBalanceList);
		} catch (Exception e) {
			logger.error("增加/更新老师账户余额出错【入库错误】！");
			throw new CommonRunException(-7, "增加/更新老师账户余额出错【入库错误】！");
		}
		
		//关系入库
		try {
			balanceFromDao.insertBatch(balanceFromList);
		} catch (Exception e) {
			logger.error("更新老师提现记录与老师Id关系表【入库错误】！");
			throw new CommonRunException(-6, "更新老师提现记录与老师Id关系表【入库错误】！");
		}
	}
}
