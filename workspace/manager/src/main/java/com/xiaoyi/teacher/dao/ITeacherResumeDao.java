package com.xiaoyi.teacher.dao;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherResume;

public interface ITeacherResumeDao {
    int deleteByPrimaryKey(String teacherResumeId);

    int insert(TeacherResume record);

    int insertSelective(TeacherResume record);

    TeacherResume selectByPrimaryKey(String teacherResumeId);

    int updateByPrimaryKeySelective(TeacherResume record);

    int updateByPrimaryKeyWithBLOBs(TeacherResume record);

    int updateByPrimaryKey(TeacherResume record);
    
    JSONObject selectTeacherDefaultResult(@Param("teacherId")String teacherId);
}