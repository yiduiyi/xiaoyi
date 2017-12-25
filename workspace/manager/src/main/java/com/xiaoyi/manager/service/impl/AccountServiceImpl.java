package com.xiaoyi.manager.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiaoyi.manager.dao.IAccountDao;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.service.IAccountService;

@Service("accountService")
public class AccountServiceImpl implements IAccountService{
	@Resource  
    private IAccountDao accountDao;  
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public AccountServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Account getAccountById(String accountId) {
		// TODO Auto-generated method stub
		return accountDao.selectByPrimaryKey(accountId);
	}

	/*
	 * 测试数据库事务
	 * (non-Javadoc)
	 * @see com.xiaoyi.manager.service.IAccountService#insertAccount(com.xiaoyi.manager.domain.Account)
	 */
	@Transactional
	@Override
	public int insertAccount(Account account) {
		// TODO Auto-generated method stub
		int items = 0;
		try {
			items = accountDao.insert(account);			
		} catch (Exception e) {
			logger.error("插入账户出错！");
			e.printStackTrace();
		}
		if(items<2){
			throw new RuntimeException();
		}
		
		return items;
	}

}
