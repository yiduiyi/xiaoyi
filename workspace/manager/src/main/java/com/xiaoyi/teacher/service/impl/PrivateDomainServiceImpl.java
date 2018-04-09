package com.xiaoyi.teacher.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.teacher.dao.IPrivateDomainDao;
import com.xiaoyi.teacher.service.IPrivateDomainService;

@Service("domainService")
public class PrivateDomainServiceImpl implements IPrivateDomainService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ITeacherDao teacherDao;
	
	@Resource
	private IUserDao userDao;
	
	@Resource
	private IPrivateDomainDao domainDao;
	
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

	@Transactional
	@Override
	public int setAgreement(JSONObject params)  throws Exception{
		String teacherId = params.getString("teacherId");
		try {
			Teacher teacher = new Teacher();
			teacher.setTeacherid(teacherId);
			teacher.setSigned((short)1);
			
			User user = new User();
			user.setUseraccountid(teacherId);
			user.setUserid(teacherId);
			user.setUserprivilege((byte)1);
			userDao.updateByPrimaryKeySelective(user);
			
			return teacherDao.updateByPrimaryKeySelective(teacher);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public JSONObject queryPrivateMsg(JSONObject params) throws Exception {
		JSONObject result = new JSONObject();
		try {
			try {
				result = domainDao.selectDomainByTeacherId(params);			
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			if(null!=result){
				String schoolId = result.getString("schoolId");
				String gradeId = result.getString("gradeId");				
				
				//转换性别
				try {
					if(true == (boolean)(result.get("sex"))){
						result.put("sex", false);
					}else{
						result.put("sex", true);
					}
				} catch (Exception e) {
					e.printStackTrace();
					logger.info("转换性别出错！");
				}
				
				try {
					List<Map<String, Object>> schoolGradeList = domainDao.selectSchoolDetailById(params);
					
					if(!CollectionUtils.isEmpty(schoolGradeList)){
						for(Map<String,Object> schoolGrade : schoolGradeList){							
							result.put("schoolName", schoolGrade.get(schoolId));
							result.put("gradeName", "");
						}
					}
				} catch (Exception e) {
					logger.error("查询学校出错！");
				}
			}

			return result;
		} catch (Exception e) {
			logger.error("内部错误！");
		}
		return null;
	}



}
