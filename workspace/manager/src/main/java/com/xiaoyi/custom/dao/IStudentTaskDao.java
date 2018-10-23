package com.xiaoyi.custom.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.custom.domain.StudentTask;
import com.xiaoyi.custom.domain.StudentTaskKey;


public interface IStudentTaskDao {

    int deleteByPrimaryKey(StudentTaskKey key);

    int insert(StudentTask record);

    int insertSelective(StudentTask record);

    StudentTask selectByPrimaryKey(StudentTaskKey key);

    int updateByPrimaryKeySelective(StudentTask record);

    int updateByPrimaryKey(StudentTask record);
    
    /**
     * 查询作业列表
     * @param params{teacherId, studentId}
     * @return
     */
    List<StudentTask> selectByParams(JSONObject params);
    
    /**
     * 查询作业列表2（带课程名）
     * @param params
     * @return
     */
    List<JSONObject> selectAllByParams(JSONObject params);
}