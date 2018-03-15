package com.xiaoyi.teacher.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.TeachingRecord;

public interface ITeachingRecordDao {
	//获取老师关联的订单
	List<JSONObject> selectRecordsByTid(String teacherId);
	
	//查询老师提现记录(显示用)
	List<JSONObject> selectLSRecordByParams(Map<String,Object> params);
	
	//查询老师提现记录（判断是否已存在提现记录用）
	/**
	 * SELECT * 
		FROM `lessontrade`
		WHERE teacherId=#{teacherId} AND parentId=#{parentId}
			AND memberId=#{memberId} AND lessonType=#{lessonType}
			AND DATE_FORMAT(applyTime,'%Y%m') = #{queryDate};
	 * @param tRecords
	 * @return
	 */
	List<LessonTrade> selectTeacherLessonTradeByParams(Map<String,Object> params);
	
	int insertTeachingRecords(List<TeachingRecord> tRecords);
	
	
	int deleteByPrimaryKey(String recordid);

    int insert(TeachingRecord record);

    int insertSelective(TeachingRecord record);

    TeachingRecord selectByPrimaryKey(String recordid);

    int updateByPrimaryKeySelective(TeachingRecord record);

    int updateByPrimaryKey(TeachingRecord record);
}
