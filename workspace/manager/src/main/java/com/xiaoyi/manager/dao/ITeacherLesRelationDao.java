package com.xiaoyi.manager.dao;

import java.util.List;

import com.xiaoyi.manager.domain.TeacherLesRelationKey;

public interface ITeacherLesRelationDao {
	List<TeacherLesRelationKey> selectTLRelationsById(List<String> teachingIds);
	
    int deleteByPrimaryKey(TeacherLesRelationKey key);

    int insert(TeacherLesRelationKey record);

    int insertSelective(TeacherLesRelationKey record);
    
    int insertTLRelationList(List<TeacherLesRelationKey> records);
}