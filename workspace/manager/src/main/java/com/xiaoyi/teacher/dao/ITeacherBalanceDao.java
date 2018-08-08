package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherBalance;

public interface ITeacherBalanceDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(TeacherBalance record);

    int insertSelective(TeacherBalance record);

    TeacherBalance selectByPrimaryKey(String teacherid);

    List<TeacherBalance> selectBatchByTeacherIds(List<String> teacherIdList);
    
    int updateAllAccountBalanceProfits(List<TeacherBalance> list);
    
    List<TeacherBalance> selectAllAccountBalance();
    
    int updateByPrimaryKeySelective(TeacherBalance record);

    int updateByPrimaryKey(TeacherBalance record);
    
    JSONObject selectTeacherBalanceByParams(JSONObject params);
}