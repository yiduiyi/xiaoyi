package com.xiaoyi.customer.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.customer.dao.IUserDao;
import com.xiaoyi.customer.domain.User;
import com.xiaoyi.customer.service.IUserService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;

	@Override
	public void insertUser(JSONObject userMap) {
		User user = userDao.getUserByOpenId(userMap.getString("openid"));
		if(null == user) {
			user = new User();
			user.setUserId(UUIDUtil.getUUIDPrimary());
			user.setWxOpenid(userMap.getString("openid"));
			user.setWxNickname(userMap.getString("nickname"));
			user.setWxHeadImage(userMap.getString("headimgurl"));
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			user.setStatus(ConstantUtil.USER_STATUS_NORMAL);
			userDao.insertSelective(user);
		}
	}
	
}
