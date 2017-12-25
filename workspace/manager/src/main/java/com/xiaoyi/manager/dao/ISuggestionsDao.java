package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Suggestions;

public interface ISuggestionsDao {
    int deleteByPrimaryKey(String lessontradeid);

    int insert(Suggestions record);

    int insertSelective(Suggestions record);

    Suggestions selectByPrimaryKey(String lessontradeid);

    int updateByPrimaryKeySelective(Suggestions record);

    int updateByPrimaryKey(Suggestions record);
}