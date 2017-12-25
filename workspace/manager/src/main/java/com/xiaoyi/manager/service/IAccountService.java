package com.xiaoyi.manager.service;

import com.xiaoyi.manager.domain.Account;

public interface IAccountService {
	Account getAccountById(String accountId);
	
	public int insertAccount(Account account);
}
