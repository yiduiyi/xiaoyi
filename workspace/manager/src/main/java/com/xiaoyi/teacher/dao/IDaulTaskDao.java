package com.xiaoyi.teacher.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;

/**
 * 双师管理
 * @author dengzhihua
 *
 */
public interface IDaulTaskDao {
	/**
	 * 查找老师和家长,学生绑定关系
	 * @param teacherIdList
	 * @return
	 */
    List<JSONObject> selectPSTBondingRelations(@Param("teacherId") String teacherId);
    
    /**
     * 查询可布置的视频课程列表
     * @param params {teacherId,studentId,gradeId,courseId,semaster}
     * @return
     */
    List<JSONObject> selectAvailableTasks(JSONObject params);
    
}