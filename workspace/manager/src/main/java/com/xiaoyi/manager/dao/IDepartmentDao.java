package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Department;

public interface IDepartmentDao {
    int deleteByPrimaryKey(String departmentId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String departmentId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}