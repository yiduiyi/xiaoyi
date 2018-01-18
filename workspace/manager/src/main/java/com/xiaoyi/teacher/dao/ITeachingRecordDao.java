package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ITeachingRecordDao {
	List<JSONObject> selectRecordsByTid(String teacherId);
}
