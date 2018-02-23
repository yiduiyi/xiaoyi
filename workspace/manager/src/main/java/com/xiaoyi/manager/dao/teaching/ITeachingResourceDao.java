package com.xiaoyi.manager.dao.teaching;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Picture;
import com.xiaoyi.manager.domain.School;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.User;

public interface ITeachingResourceDao {
	List<Teacher> selectTeachingResourceList(List<String> telNums);
	
	int insertTeachingResourceList(List<Teacher> teacherList);
	
	int insertTeacherImages(List<Picture> pictures);
	
	List<School> selectSchoolByNames(List<String> schoolNames);
	
	int insertSchoolList(List<School> schList);
	
	int insertTUserList(List<User> userList);
	
	List<JSONObject> selectTeachingsByParams(Map<String,Object> params);
	
	List<JSONObject> selectTeachersByParams(Map<String,Object> params);
}
