package com.xiaoyi.manager.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.manager.dao.lesson.ILessonManageDao;
import com.xiaoyi.manager.service.ILessonManageServer;

@Service("lessonManageService")
public class LessonManageServiceImpl implements ILessonManageServer{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ILessonManageDao lessonManageDao;
	
	@Override
	public List<JSONObject> getLessonTypeGroups() {
		try {
			return lessonManageDao.selectLessonTypeGroups();
		} catch (Exception e) {
			logger.error("查询课程包出错！");
			e.printStackTrace();
			return null;
		}	
	}

	@Override
	public int updateLessonType(JSONObject params) {
		String lessonId = params.getString("lessonId");
		Integer operateType = params.getInteger("operateType");
		try {
			if(StringUtils.isEmpty(lessonId) 
					|| (operateType!=null && operateType == 1)){
				lessonId = UUID.randomUUID().toString();
				params.put("lessonId", lessonId);
			}
			return lessonManageDao.updateLessonType(params);
		} catch (Exception e) {
			logger.error("更新/新增课程包出错！");
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<JSONObject> queryParentOrders() {
		List<JSONObject> oriDatas = null;
		List<JSONObject> result = new ArrayList<JSONObject>();
		
		try {
			//查询家长订单
			try {
				oriDatas = lessonManageDao.selectParentOrders();
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("查询家长订单失败！");
			}
			
			//组合数据
			if(CollectionUtils.isNotEmpty(oriDatas)){
				Map<Integer,JSONArray> teachingWayOrdersMap = new HashMap<Integer,JSONArray>();	//1：学生上门,-1：老师上门,2:一对二
				for(JSONObject oriData : oriDatas){
					Integer lessonType = oriData.getInteger("lessonType");
					if(null == lessonType){
						continue;
					}
					
					
					int teachingWay = 0;	//默认学生上门
					if(lessonType > 400){	//一对二
						teachingWay = 2;
					}else if(lessonType < 0){	//老师上门
						teachingWay = 1;
					}
					
					JSONArray orders = teachingWayOrdersMap.get(teachingWay);
					if(null==orders){
						orders = new JSONArray();
						teachingWayOrdersMap.put(teachingWay, orders);
					}
					
					//补全年级
					LessonType lt = LessonType.convert(2==teachingWay?lessonType-300:lessonType);
					String simpleLevelName = lt.getLevelName(true);
					if(null!=simpleLevelName){
						if(null!=lt.getGradeName(true)){
							oriData.put("gradeName", simpleLevelName + lt.getGradeName(true));
						}
						oriData.put("gradeId", lt.getGradeId());
					}
					orders.add(oriData);
				}
				
				//加入结果集
				for(Integer teachingWay : teachingWayOrdersMap.keySet()){
					JSONObject ordersGroup = new JSONObject();
					ordersGroup.put("teachingWay", teachingWay);
					ordersGroup.put("orders", teachingWayOrdersMap.get(teachingWay));
					result.add(ordersGroup);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("内部错误！");
		}
		return result;
	}

	@Override
	public int updateParentOrder(JSONObject params) {
		try {
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("更新家长订单出错！");
			return 0;
		}
	}
	

}
