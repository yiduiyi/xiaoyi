package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.Suggestions;

public interface ISuggestionsDao {
    int deleteByPrimaryKey(String lessontradeid);

    int insert(Suggestions record);

    int insertSelective(Suggestions record);

    Suggestions selectByPrimaryKey(String lessontradeid);

    int updateByPrimaryKeySelective(Suggestions record);

    int updateByPrimaryKey(Suggestions record);
}