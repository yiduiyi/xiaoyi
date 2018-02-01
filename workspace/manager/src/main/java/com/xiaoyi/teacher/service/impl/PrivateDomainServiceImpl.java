package com.xiaoyi.teacher.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.teacher.service.IPrivateDomainService;

@Service("domainService")
public class PrivateDomainServiceImpl implements IPrivateDomainService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ITeacherDao teacherDao;
	
	@Override
	public Short getSignStatus(JSONObject params) throws Exception {
		// TODO Auto-generated method stub
		try {
			Teacher teacher = teacherDao.selectByPrimaryKey(params.getString("teacherId"));
			if(null!=teacher) {
				return teacher.getSigned();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return -1;
	}

	@Override
	public int setAgreement(JSONObject params)  throws Exception{
		try {
			Teacher teacher = new Teacher();
			teacher.setTeacherid(params.getString("teacherId"));
			teacher.setSigned((short)1);
			return teacherDao.updateByPrimaryKeySelective(teacher);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}



}
