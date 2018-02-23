package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IPictureDao;
import com.xiaoyi.manager.dao.order.ITeachingDao;
import com.xiaoyi.manager.dao.teaching.ITeachingResourceDao;
import com.xiaoyi.manager.domain.Picture;
import com.xiaoyi.manager.domain.School;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.service.ITeachingResourceService;

@Service("teachingResourceService")
public class TeachingResourceServiceImpl implements ITeachingResourceService {
	@Resource
	ITeachingDao teachingDao;
	
	@Resource
	IPictureDao pictureDao;
	
	@Resource
	ITeachingResourceDao teachingResourceDao;
	
	@Transactional
	@Override
	public int addTeachingTeacher(List<JSONObject> datas) {
		//校验导入数据
		try {
			//去重
			List<Teacher> hasRecordedTeachers;
			List<String> telNums=null;
			
			List<School> hasRecordedSchool;
			List<String> schoolNames = null;
			try {
				telNums = new ArrayList<String>();
				schoolNames = new ArrayList<String>();
				
				for(JSONObject teacher : datas) {
					telNums.add(teacher.getString("telNumber"));
					schoolNames.add(teacher.getString("schoolName"));
				}
				hasRecordedTeachers = teachingResourceDao.selectTeachingResourceList(telNums);	
				hasRecordedSchool = teachingResourceDao.selectSchoolByNames(schoolNames);
			
				for(Teacher teacher : hasRecordedTeachers) {
					telNums.remove(teacher.getTelnumber());
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//学校Id-name map
			Map<String,String> schooIdNameMap = new HashMap<String,String>();
			for(School sch : hasRecordedSchool) {
				schooIdNameMap.put(sch.getSchoolname(), sch.getSchoolid());
			}
			List<School> newAddedSchool = new ArrayList<School>();
			
			//插入老师记录
			try {
				List<Teacher> newAddTeachers = new ArrayList<Teacher>();
				if(!CollectionUtils.isEmpty(datas)) {
					List<Picture> picList = new ArrayList<Picture>();
					for(JSONObject data : datas) {
						String telNum = data.getString("telNumber");
						if(!CollectionUtils.isEmpty(telNums)
								&& !telNums.contains(telNum)) {
							continue;
						}
						
						Teacher teacher = new Teacher();
						teacher.setEducation(data.getByte("education"));
						teacher.setGradeid(data.getString("gradeId"));
						teacher.setNotes(data.getString("notes"));
						teacher.setOpenId("");
						
						String picId = UUID.randomUUID().toString();
						teacher.setPicid(picId);
						teacher.setRegdate(new Date());
						
						String schoolId = null;
						if(schooIdNameMap.containsKey(data.getString("schoolName"))) {
							schoolId = schooIdNameMap.get(data.getString("schoolName"));
						}else {//新增学校
							schoolId = UUID.randomUUID().toString();
							School sch = new School();
							sch.setSchoolid(schoolId);
							sch.setSchoolname(data.getString("schoolName"));
							
							newAddedSchool.add(sch);
						}
						teacher.setSchoolid(schoolId);
						teacher.setSex(data.getBoolean("sex"));
						teacher.setSigned((short)0);
						teacher.setTeacherid(UUID.randomUUID().toString());
						teacher.setTeachername(data.getString("teacherName"));
						teacher.setTeachinglevel(data.getByte("teachingLevel"));
						teacher.setTelnumber(telNum);
						
						newAddTeachers.add(teacher);
					
						//老师头像地址
						Picture pic = new Picture();
						pic.setPicid(picId);
						pic.setPictype((byte)3);
						pic.setPicname(data.getString("teacherName")+telNum);
						pic.setPicurl(data.getString("imgUrl"));
						
						picList.add(null);
					}
					
					//新学校入库
					try {
						if(!CollectionUtils.isEmpty(newAddedSchool)) {
							teachingResourceDao.insertSchoolList(newAddedSchool);
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
					
					//老师入库
					try {
						if(!CollectionUtils.isEmpty(newAddTeachers)) {
							teachingResourceDao.insertTeachingResourceList(newAddTeachers);						
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				
					//头像入库
					try {
						if(!CollectionUtils.isEmpty(picList)) {
							teachingResourceDao.insertTeacherImages(picList);
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				}
			} catch (Exception e) {
				throw e;
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return 0;
	}
	
}
