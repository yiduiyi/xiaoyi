package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Grade;
import com.xiaoyi.manager.domain.GradeKey;

public interface IGradeDao {
    int deleteByPrimaryKey(GradeKey key);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(GradeKey key);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}