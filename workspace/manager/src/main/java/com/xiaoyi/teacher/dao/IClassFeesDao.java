package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.ClassFees;

public interface IClassFeesDao {
    int deleteByPrimaryKey(String classFeeId);

    int insert(ClassFees record);

    int insertSelective(ClassFees record);

    ClassFees selectByPrimaryKey(String classFeeId);

    int updateByPrimaryKeySelective(ClassFees record);

    int updateByPrimaryKey(ClassFees record);
    //根据年级主键查询该年级的课时费信息
	public List<JSONObject> getClassFeesList(String gradeId);
}