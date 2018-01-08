package com.xiaoyi.manager.dao;

import java.util.List;

import com.xiaoyi.manager.domain.Student;

public interface IStudentDao {
    int deleteByPrimaryKey(String memberid);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String memberid);
    //Student selectByName(String stuName);
    
    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    List<Student> selectByStuIds(List<String> stuIds);
}