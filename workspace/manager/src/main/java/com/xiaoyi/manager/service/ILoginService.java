package com.xiaoyi.manager.service;

import com.xiaoyi.manager.domain.User;

public interface ILoginService {
	//用户验证（并加密密码）
	public User userIdentify(User user);			
}
