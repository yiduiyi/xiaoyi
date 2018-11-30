package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.ConsultantGroup;

public interface IConsultantGroupDao {
    int deleteByPrimaryKey(String consultantGroupId);

    int insert(ConsultantGroup record);

    int insertSelective(ConsultantGroup record);

    ConsultantGroup selectByPrimaryKey(String consultantGroupId);

    int updateByPrimaryKeySelective(ConsultantGroup record);

    int updateByPrimaryKey(ConsultantGroup record);

	List<JSONObject> getAllConsultantGroupList();

	ConsultantGroup getConsultantByGroupConsultantId(@Param("groupConsultantId")String groupConsultantId);
}