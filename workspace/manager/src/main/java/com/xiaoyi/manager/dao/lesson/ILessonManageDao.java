package com.xiaoyi.manager.dao.lesson;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ILessonManageDao {
    List<JSONObject> selectLessonTypeGroups();
    
    int updateLessonType(JSONObject params);
    
    //查询家长订单课时
    List<JSONObject> selectParentOrders();
}