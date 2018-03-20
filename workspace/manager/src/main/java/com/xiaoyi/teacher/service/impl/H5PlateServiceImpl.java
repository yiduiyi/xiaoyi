package com.xiaoyi.teacher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.xiaoyi.common.utils.XMLUtil;
import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.domain.UserKey;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ITH5PlateDao;
import com.xiaoyi.teacher.dao.ITeachingRecordDao;
import com.xiaoyi.teacher.domain.LessonTrade;
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
	
	@Autowired
	IWechatService wechatService;
	
	@Autowired
	ITeachingRecordService tRecordService;

	
	Logger logger = LoggerFactory.getLogger(this.getClass());

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
			} catch (Exception e) {
				logger.error("查询老师失败！【params】："+params.toString());
				e.printStackTrace();
				return -1;
			}
			
			//查询登录user表
			UserKey userKey = new UserKey();
			userKey.setUserid(teacher.getTelnumber());//初始化账号-手机号码			
			
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
					user.setUserid(teacher.getTelnumber());
					user.setUsername(teacher.getTelnumber());
					user.setPassword(telNum.substring(telNum.length()-6, telNum.length()));
				}
			}
			user.setOpenid((String)params.get("openId"));
			user.setNickname((String)params.get("nickname"));
			user.setHeadimgurl((String)params.get("headimgurl"));

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
	public int withdrawLessons(String lessonTradeId) throws Exception {
		// TODO Auto-generated method stub
		
		if(StringUtils.isNotEmpty(lessonTradeId)) {							
			//计算课时费-》转账-》更新老师提现状态
			try {
				logger.info("开始企业付款。。。");
				JSONObject resultString = wechatService.payToTeacher(lessonTradeId);
				if(null!=resultString) {
					Map<String,String> resultMap = XMLUtil.parseXml(resultString.getString("weixinPost"));
					
					if("SUCCESS".equalsIgnoreCase(resultMap.get("result_code")) 
							&& "SUCCESS".equalsIgnoreCase(resultMap.get("return_code"))){
						logger.info("付款成功！");
						//提现到账成功(更新提现到账状态)
						return tRecordService.updateLessonTrade(lessonTradeId
								, resultString.getInteger("updatedFromzenLessons"));																								
						
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("付款失败！");
				return -1;
			}			
		}
		
		return 0;
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
			List<LessonTrade> lessonTradeList = tRecordDao.selectLessonTradeByTeacherId(teacherId);
			
			if(CollectionUtils.isNotEmpty(lessonTradeList)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				for(LessonTrade lessonTrade : lessonTradeList) {				
					JSONObject record = new JSONObject();
					Date applyTime = lessonTrade.getApplytime();
					String time = sdf.format(applyTime);
					
					record.put("lessonTradeId", lessonTrade.getLessontradeid());
					record.put("year", time.substring(0, 4));
					record.put("month", time.substring(5,7));
					record.put("fee", lessonTrade.getActualPay());
					Byte status = lessonTrade.getStatus();
					if(null==status) {
						status = 1;
					}else {
						status = (byte) (status.intValue()==0?1:0);
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
}
