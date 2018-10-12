package com.xiaoyi.custom.dao;

import com.xiaoyi.custom.domain.StudentTask;
import com.xiaoyi.custom.domain.StudentTaskKey;


public interface IStudentTaskDao {

    int deleteByPrimaryKey(StudentTaskKey key);

    int insert(StudentTask record);

    int insertSelective(StudentTask record);

    StudentTask selectByPrimaryKey(StudentTaskKey key);

    int updateByPrimaryKeySelective(StudentTask record);

    int updateByPrimaryKey(StudentTask record);
}