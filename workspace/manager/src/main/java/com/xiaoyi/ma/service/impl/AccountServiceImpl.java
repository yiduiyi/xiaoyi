package com.xiaoyi.ma.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaoyi.ma.dao.IAccountDao;
import com.xiaoyi.ma.domain.Account;
import com.xiaoyi.ma.service.IAccountService;

@Service("accountService")
public class AccountServiceImpl implements IAccountService{
	@Resource  
    private IAccountDao accountDao;  
	
	public AccountServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Account getAccountById(String accountId) {
		// TODO Auto-generated method stub
		return accountDao.selectByPrimaryKey(accountId);
	}

}
