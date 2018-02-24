package com.xiaoyi.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IStudentDao;
import com.xiaoyi.manager.dao.web.IWebManageDao;
import com.xiaoyi.manager.domain.Student;
import com.xiaoyi.manager.service.IWebManageService;

@Service("webManageService")
public class WebManageServiceImpl implements IWebManageService {

	@Resource
	IWebManageDao webManageDao;
	
	@Resource
	IStudentDao studentDao;
	
	@Override
	public List<JSONObject> queryStarMembers() {
		try {
			return webManageDao.selectStarMembers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int addStarMember(JSONObject params) {
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public int deleteStarMember(String memberId) {
		try {
			Student student = new Student();
			student.setMemberid(memberId);
			student.setIsstarmember(false);
			
			return studentDao.updateByPrimaryKeySelective(student);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
