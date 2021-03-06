package com.xiaoyi.manager.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Consultant;

public interface IConsultantDao {
    int deleteByPrimaryKey(String consultantId);

    int insert(Consultant record);

    int insertSelective(Consultant record);

    Consultant selectByPrimaryKey(String consultantId);

    int updateByPrimaryKeySelective(Consultant record);

    int updateByPrimaryKey(Consultant record);
    
    List<Consultant> selectList();

	List<JSONObject> getConsultantList();
}