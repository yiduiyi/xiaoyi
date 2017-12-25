package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Student;

public interface IStudentDao {
    int deleteByPrimaryKey(String memberid);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String memberid);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}