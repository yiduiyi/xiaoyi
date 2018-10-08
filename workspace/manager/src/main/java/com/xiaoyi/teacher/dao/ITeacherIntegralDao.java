package com.xiaoyi.teacher.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherIntegral;

public interface ITeacherIntegralDao {
    int deleteByPrimaryKey(String teacherIntegralId);

    int insert(TeacherIntegral record);

    int insertSelective(TeacherIntegral record);

    TeacherIntegral selectByPrimaryKey(String teacherIntegralId);

    int updateByPrimaryKeySelective(TeacherIntegral record);

    int updateByPrimaryKeyWithBLOBs(TeacherIntegral record);

    int updateByPrimaryKey(TeacherIntegral record);
    //查询教师违约记录
  	public List<JSONObject> getTeacherTreaty(@Param("teacherId")String teacherId);
  	//查询只能单次插入的积分行为当前次数
	public Integer getIntegralNumberByTeacherId(@Param("teacherId")String teacherId, @Param("integralConductName")String integralConductName);
}