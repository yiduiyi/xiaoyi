package com.xiaoyi.manager.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.domain.UserKey;
import com.xiaoyi.manager.service.ILoginService;

@Service("loginService")
public class LoginServiceImpl implements ILoginService {
	@Resource  
    private IUserDao userDao;  
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Transactional
	@Override
	public User userIdentify(User user) {
		try {
			//用户密码验证
			User loginUser = userDao.selectByPrimaryKey(user);
			String password = loginUser.getPassword();
			if(password!=null && password.equals(user.getPassword())){
				loginUser.setLoginstatus(true);
			}else{
				return null;
			}
			
			//更新用户登录状态
			userDao.updateByPrimaryKey(loginUser);
			
			//loginUser.setPassword(null);
			return loginUser;
		} catch (Exception e) {
			logger.info("内部错误！！");
			e.printStackTrace();
		}
		return null;
	}
	@Transactional
	@Override
	public int userLogout(User user) {
		try {
			int count = userDao.updateByPrimaryKeySelective(user);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}		
	}
	@Override
	public int changePassword(JSONObject reqParams) {
		UserKey key = new UserKey();
		key.setUserid(reqParams.getString("userId"));
		key.setUseraccountid(reqParams.getString("userId"));
		try {		
			logger.info("userId: "+ key.getUserid());
			User user = userDao.selectByPrimaryKey(key );
			if(null==user || user.getPassword()==null){
				return -1;
			}
			
			String newPassword = reqParams.getString("newPassword").trim();			
			String oriPassword = reqParams.getString("oriPassword").trim();
			if(null == oriPassword || oriPassword.equals(user.getPassword())){
				return -3;
			}
			
			try {
				User record = new User();
				record.setPassword(newPassword);
				record.setUserid(key.getUserid());
				record.setUseraccountid(key.getUserid());
				return userDao.updateByPrimaryKeySelective(record );
			} catch (Exception e) {
				logger.error("更新密码出错！");
				e.printStackTrace();
			}
		} catch (Exception e) {
			logger.error("查询用户信息失败！");
			e.printStackTrace();
			return -2;
		}
		return 0;
	}

}
