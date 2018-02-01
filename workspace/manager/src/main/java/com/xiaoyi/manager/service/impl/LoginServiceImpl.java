package com.xiaoyi.manager.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.User;
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
			int count = userDao.updateByPrimaryKey(user);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}		
	}

}
