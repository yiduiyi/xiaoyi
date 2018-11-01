package com.xiaoyi.manager.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Auditions;

public interface IAuditionsDao {
    int deleteByPrimaryKey(String auditionId);

    int insert(Auditions record);

    int insertSelective(Auditions record);

    Auditions selectByPrimaryKey(String auditionId);

    int updateByPrimaryKeySelective(Auditions record);

    int updateByPrimaryKey(Auditions record);

	List<JSONObject> getAuditionList(Map<String, Object> map);
	//获取各课程顾问派单量
	List<JSONObject> getAuditionNumDataList();

	List<JSONObject> getAuditionConsultantGroupNum();

	List<JSONObject> getMonthAuditionList(@Param("startTime")Date startTime, @Param("endTime")Date endTime);
}