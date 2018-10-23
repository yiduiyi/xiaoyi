package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeachingRelationship;

public interface ITeachingRelationshipDao {
    int deleteByPrimaryKey(String teachingId);

    int insert(TeachingRelationship record);

    int insertSelective(TeachingRelationship record);

    TeachingRelationship selectByPrimaryKey(String teachingId);

    int updateByPrimaryKeySelective(TeachingRelationship record);

    int updateByPrimaryKey(TeachingRelationship record);
    
    List<TeachingRelationship> selectByParams(JSONObject params); 
    
    List<JSONObject> selectTeachingRelationshipAndAccomplishRate(List<String> studentIds);
}