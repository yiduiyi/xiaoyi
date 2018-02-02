package com.xiaoyi.teacher.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.domain.UserKey;
import com.xiaoyi.teacher.dao.ITH5PlateDao;
import com.xiaoyi.teacher.service.IH5PlateService;

@Service("h5PlateService")
public class H5PlateServiceImpl implements IH5PlateService {

	@Resource
	ITH5PlateDao teacherH5Dao;
	
	@Resource
	IUserDao userDao;
	
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
}
