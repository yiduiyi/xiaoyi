package com.xiaoyi.manager.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.manager.dao.ILessonTypeDao;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IOrdersDao;
import com.xiaoyi.manager.dao.lesson.ILessonManageDao;
import com.xiaoyi.manager.dao.order.IOrderManageDao;
import com.xiaoyi.manager.domain.LessonTypeKey;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.service.ILessonManageServer;

@Service("lessonManageService")
public class LessonManageServiceImpl implements ILessonManageServer{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ILessonManageDao lessonManageDao;
	
	@Autowired
	private ILessonTypeDao lessonTypeDao;
	
	@Autowired
	private IOrdersDao ordersDao;
	
	@Autowired
	private IOrderSumDao orderSumDao;
	
	@Autowired 
	private IOrderManageDao orderManageDao;
	
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
		Integer isholiday = params.getInteger("isholiday");
		if(null == isholiday){	//默认非假期
			params.put("isholiday", 0);
		}
		
		try {
			if(StringUtils.isEmpty(lessonId) 
					|| (operateType!=null && operateType == 1)){
				lessonId = UUID.randomUUID().toString();
				params.put("lessonId", lessonId);
			}else{
				LessonTypeKey key = new LessonTypeKey();
				key.setLessonId(lessonId);
				lessonTypeDao.deleteByPrimaryKey(key);
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
				Map<Integer,List<JSONObject>> teachingWayOrdersMap = new HashMap<Integer,List<JSONObject>>();	//1：学生上门,-1：老师上门,2:一对二
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
					
					List<JSONObject> orders = teachingWayOrdersMap.get(teachingWay);
					if(null==orders){
						orders = new ArrayList<JSONObject>();
						teachingWayOrdersMap.put(teachingWay, orders);
					}
					
					//补全年级
					LessonType lt = LessonType.convert(2==teachingWay?lessonType-300:lessonType);
					String simpleLevelName = lt.getLevelName(true);
					if(null!=simpleLevelName){
						if(null!=lt.getGradeName(true)){
							oriData.put("gradeName", simpleLevelName + lt.getGradeName(true));
						}
						oriData.put("gradeId", lt.getGradeId(false));
					}
					
					//转换时间
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date createTime = oriData.getDate("createTime");
					if(null!=createTime){
						oriData.put("purchaseDate", sdf.format(createTime));
					}
					
					orders.add(oriData);
				}
				
				//加入结果集
				for(Integer teachingWay : teachingWayOrdersMap.keySet()){
					JSONObject ordersGroup = new JSONObject();
					ordersGroup.put("teachingWay", teachingWay);
					
					List<JSONObject> orders = teachingWayOrdersMap.get(teachingWay);
					//按照时间（最近）排序
					Collections.sort(orders, new Comparator<JSONObject>() {

						@Override
						public int compare(JSONObject o1, JSONObject o2) {
							if(null!=o1 && null!=o2 
									&& o1.getString("purchaseDate")!=null
									&& o2.getString("purchaseDate")!=null){
								
								return o2.getString("purchaseDate").compareTo(o1.getString("purchaseDate"));
							}
							return 0;
						}
					});
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

	@Transactional
	@Override
	public int updateParentOrder(JSONObject params) {
		try {
			String orderId = params.getString("orderId");
			Integer oldLessonTypeId = params.getInteger("oldLessonTypeId");
			String parentId = params.getString("parentId");
			String studentId = params.getString("studentId");
			Integer updatedGradeId = params.getInteger("updatedGradeId");
			Float updatedPurchaseNum = params.getFloat("updatedPurchaseNum");
			//Float oldPurchaseNum = params.getFloat("oldPurchaseNum");
			Integer teachingWay = params.getInteger("teachingWay");
			
			//verirfy params
			if(null==orderId || oldLessonTypeId==null /*|| oldPurchaseNum == null*/
					|| parentId==null || studentId == null || teachingWay == null
					|| updatedGradeId == null || updatedPurchaseNum==null){	//为空参数
				logger.info("参数错误！");
				return -2;
			}
			if(teachingWay!=0 && teachingWay!=1){	//授课方式
				return -2;
			}
			
			//年级转换
			switch(updatedGradeId){
			case 11:case 12:case 13: case 14: case 15:
				updatedGradeId = 11;
				break;
			case 21:case 22:
				updatedGradeId=21;
				break;
			case 31:case 32:
				updatedGradeId=31;
				break;
			}			
			
			boolean gradeValide = false;
			for(Grade g : Grade.values()){	//年级设置
				if(g.getValue() == updatedGradeId){
					gradeValide = true;
					break;
				}
			}
			if(!gradeValide){
				return -2;
			}
			
			//计算课程包Id
			int newLessonType = updatedGradeId*10+1;
			newLessonType = (teachingWay==1)?-newLessonType:newLessonType;
			logger.info("newLessonType:"+newLessonType);
			
			try {
				//查询旧订单
				Map<String,Object> reqParams = new HashMap<String,Object>();
				reqParams.put("parentId", parentId);
				reqParams.put("memberId", studentId);
				reqParams.put("lessonType", oldLessonTypeId);
				reqParams.put("orderId", orderId);
				
				List<Orders> orderList = orderManageDao.selectIfHasBookByParams(reqParams);
				if(CollectionUtils.isEmpty(orderList) || orderList.size()>1){
					logger.info("逻辑错误, 数据不匹配！");
					return -3;
				}
				
				Orders oldOrder = orderList.get(0);
				if(oldOrder==null){
					logger.info("查询不到对应的原订单！");
					return -4;
				}
				
				//查询旧订单总表
				OrderSumKey key = new OrderSumKey();
				key.setLessontype(oldLessonTypeId);
				key.setMemberid(studentId);
				key.setParentid(parentId);
				
				OrderSum oldOrderSum ;
				try {
					oldOrderSum = orderSumDao.selectByPrimaryKey(key);
					
					if(null == oldOrderSum){	//有订单, 原则上必须有对应的订单总表
						logger.info("没有匹配到对应的订单总表！");
						return -5;
					}											
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("查询订单总表失败！");
					return -6;
				}
				
				//判断是否只是改变了订单课时数
				logger.info("oldLessonTypeId:"+oldLessonTypeId+",newLessonType:"+newLessonType);
				if(oldLessonTypeId == newLessonType){
					try {
						float lessonNumGap = updatedPurchaseNum - oldOrder.getPurchasenum();

						//修改旧订单
						oldOrder.setPurchasenum(updatedPurchaseNum);
						ordersDao.updateByPrimaryKey(oldOrder);
						
						//更新订单总表
						logger.info("lessonNumGap:"+lessonNumGap);
						oldOrderSum.setLessonleftnum(oldOrderSum.getLessonleftnum() + lessonNumGap);
						oldOrderSum.setTotallessonnum(oldOrderSum.getTotallessonnum() + lessonNumGap);
						orderSumDao.updateByPrimaryKey(oldOrderSum);
					} catch (Exception e) {
						logger.error("修改旧订单/更新订单总表出错！");
						throw e;
					}										
					
				}else {
					//删除旧订单，修改订单总表
					try {
						//删除旧订单
						ordersDao.deleteByPrimaryKey(oldOrder);
					
						//更新旧订单总表
						oldOrderSum.setLessonleftnum(oldOrderSum.getLessonleftnum() - oldOrder.getPurchasenum());
						orderSumDao.updateByPrimaryKey(oldOrderSum);
					} catch (Exception e) {
						logger.info("删除旧订单/修改订单总表失败！");
						throw e;
					}					
					
					//
					
					//新增修改订单
					Orders record = new Orders();
					try {
						record.setOrderid(UUID.randomUUID().toString());
						record.setParentid(parentId);
						record.setMemberid(studentId);
						record.setCreatetime(oldOrder.getCreatetime());
						record.setOrderType(2);
						record.setHasBook(oldOrder.getHasBook());
						record.setLessontype(newLessonType);
						record.setPurchasenum(updatedPurchaseNum);
						
						ordersDao.insert(record);					
					} catch (Exception e) {
						logger.error("插入订单失败！");
						throw e;
					}
					
					//新增/修改订单总表
					key.setLessontype(newLessonType);
					OrderSum newOrderSum = orderSumDao.selectByPrimaryKey(key);
					if(null==newOrderSum){
						newOrderSum = new OrderSum();
						newOrderSum.setLessonleftnum(updatedPurchaseNum);
						newOrderSum.setLessontype(newLessonType);
						newOrderSum.setMemberid(studentId);
						newOrderSum.setOrderid(UUID.randomUUID().toString());
						newOrderSum.setParentid(parentId);
						newOrderSum.setPurchasetime(new Date());
						newOrderSum.setTotallessonnum(updatedPurchaseNum);
					
						try {
							orderSumDao.insertSelective(newOrderSum);
						} catch (Exception e) {
							e.printStackTrace();
							logger.info("新增订单总表失败！");
							throw e;
						}
					}else{
						newOrderSum.setLessonleftnum(newOrderSum.getLessonleftnum() + updatedPurchaseNum);
						
						try {
							orderSumDao.updateByPrimaryKeySelective(newOrderSum);
						} catch (Exception e) {
							logger.error("修改家长对应的订单总表出错！");
							e.printStackTrace();
							throw e;
						}
					}				
				}	
			}catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("更新家长订单出错！");
			throw new RuntimeException();
		}
		
		return 0;
	}

	@Override
	public int deleteLessonPackage(String lessonId) {
		try {
			LessonTypeKey key = new LessonTypeKey();
			key.setLessonId(lessonId);
			logger.error("删除课时包【params】:"+key);
			return lessonTypeDao.deleteByPrimaryKey(key );
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除课时包失败!");
		}
		return 0;
	}
	

}
