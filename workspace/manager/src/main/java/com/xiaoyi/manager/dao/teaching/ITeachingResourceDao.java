package com.xiaoyi.manager.dao.teaching;

import java.util.List;

import com.xiaoyi.manager.domain.Picture;
import com.xiaoyi.manager.domain.School;
import com.xiaoyi.manager.domain.Teacher;

public interface ITeachingResourceDao {
	List<Teacher> selectTeachingResourceList(List<String> telNums);
	
	int insertTeachingResourceList(List<Teacher> teacherList);
	
	int insertTeacherImages(List<Picture> pictures);
	
	List<School> selectSchoolByNames(List<String> schoolNames);
	
	int insertSchoolList(List<School> schList);
}
