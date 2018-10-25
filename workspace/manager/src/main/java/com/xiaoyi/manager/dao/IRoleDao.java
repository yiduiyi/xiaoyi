package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Role;

public interface IRoleDao {
    int insert(Role record);

    int insertSelective(Role record);

	Role selectByPrimaryKey(String roleId);
}