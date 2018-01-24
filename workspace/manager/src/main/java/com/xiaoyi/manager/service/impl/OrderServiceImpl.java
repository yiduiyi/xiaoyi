package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IOTRelationDao;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IOrdersDao;
import com.xiaoyi.manager.dao.ITeacherLesRelationDao;
import com.xiaoyi.manager.dao.order.IOrderManageDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.OrderTeachingRelation;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.TeacherLesRelationKey;
import com.xiaoyi.manager.service.ICommonService;
import com.xiaoyi.manager.service.IOrderService;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
	@Resource  
    private IOrdersDao orderDao;  
	
	@Resource
	private IOrderSumDao orderSumDao;
	
	@Resource
	private ICommonService commonService;
	
	@Resource
	private IOrderManageDao orderManageDao;

	@Resource
	private IOTRelationDao otRelationDao;
	
	@Resource
	private ITeacherLesRelationDao tlRelationDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 扣款成功后调用此接口
	 */
	@Transactional
	@Override
	public int addOrder(JSONObject params) throws Exception{
		// 预约默认不安排老师
		try {			
			//查询/生成家长ID、学生Id
			String parentId = null;
			String studentId = null;			
			
			//新增/获取家长-学生关系信息
			try {
				JSONObject relations = commonService.addOrGetPSR(params);
				if(null==relations){
					return -1;
				}
				
				ParentStuRelation relation = (ParentStuRelation) relations.get("relation");
				studentId = relation.getMemberid();
				parentId = relation.getParentid();
			} catch (Exception e) {
				logger.error("添加/获取家长-学生关系失败！");
				throw e;
			}
			
			//订单更新同步
			synchronized(this){
				//查询订单总表
				Integer lessonType = params.getInteger("lessonType");
				String orderSumId = null;
				OrderSum orderSum = null;
				try {
					OrderSumKey orderSumKey = new OrderSumKey();
					//只存年级和上门类型
					orderSumKey.setLessontype(lessonType/100);
					
					orderSumKey.setMemberid(studentId);
					orderSumKey.setParentid(parentId);
					
					orderSum = orderSumDao.selectByPrimaryKey(orderSumKey);
				} catch (Exception e) {
					logger.info("查询订单总表出错！");
					throw e;
				}
				
				//添加订单条目
				Short purchaseNum = params.getShort("purchaseNum");			
				Orders order = new Orders();				
				try {
					order.setOrderid(UUID.randomUUID().toString());
				
					order.setCreatetime(new Date());
					order.setLessontype(lessonType);
					order.setMemberid(studentId);
					order.setParentid(parentId);
					order.setPurchasenum(purchaseNum);				
					
					orderDao.insertSelective(order);
				} catch (Exception e) {
					logger.info("插入订单失败！");
					throw e;
				}
				
				//更新订单总表
				try {
					boolean isNewOrder = false;
					//第一次插入订单总表(取该家长-学生-课程类型一致的订单ID作为订单总表ID)
					if(null == orderSum){
						orderSum = new OrderSum();
						orderSumId = order.getOrderid();
						isNewOrder = true;
					}
					orderSum.setOrderid(orderSumId);
					orderSum.setMemberid(studentId);
					orderSum.setParentid(parentId);
					orderSum.setPurchasetime(new Date());
					orderSum.setLessontype(lessonType/100);
					orderSum.setLessonleftnum(isNewOrder?purchaseNum:(short)(orderSum.getLessonleftnum()+purchaseNum));
					orderSum.setTotallessonnum(isNewOrder?purchaseNum:(short)(orderSum.getTotallessonnum()+purchaseNum));
					
					if(isNewOrder){
						orderSumDao.insertSelective(orderSum);
					}else{
						orderSumDao.updateByPrimaryKeySelective(orderSum);
					}
				} catch (Exception e) {
					logger.error("插入/更新订单总表出错！");
					throw e;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		return 0;
	}

	@Transactional
	@Override
	public int updateOrder(JSONObject params) {
		try {
			String teachingIds = params.getString("teachingIds");
			OrderSum record = new OrderSum();
			record.setTeachingids(teachingIds);
			record.setOrderid(params.getString("orderId"));
			
			//更新订单的任教关系
			try {
				orderSumDao.updateByPrimaryKeySelective(record);				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//获取更新的订单
			try {
				record = orderSumDao.selectByPrimaryKey(record);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			
			
			//生成订单-任教关系
			if(null!=record && null!=teachingIds){
				List<String> teachingIdList = Arrays.asList(teachingIds.split(","));
				
				//查询任教关系Id-老师对应关系
				Map<String,TeacherLesRelationKey>ttMap = new HashMap<String,TeacherLesRelationKey>();
				try {
					List<TeacherLesRelationKey> tlRelations = tlRelationDao.selectTLRelationsById(teachingIdList);
					if(!CollectionUtils.isEmpty(tlRelations)){
						for(TeacherLesRelationKey tlRelation : tlRelations){
							ttMap.put(tlRelation.getTeachingid(), tlRelation);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//设置订单-任教关系
				List<OrderTeachingRelation> relations = new ArrayList<OrderTeachingRelation>();
				for(String teachingId : teachingIdList){
					OrderTeachingRelation relation = new OrderTeachingRelation();
					TeacherLesRelationKey relationKey = ttMap.get(teachingId);
					
					relation.setMemberId(record.getMemberid());
					relation.setOrderId(record.getOrderid());
					relation.setParentId(record.getParentid());
					relation.setTeachingId(teachingId);
					
					//补全老师Id及科目
					if(null!=relationKey){
						relation.setTeacherId(relationKey.getTeacherid());
						int type = Math.abs(record.getLessontype())/record.getLessontype();
						relation.setLessonType(relationKey.getLessontype()*type);
					}
					relations.add(relation);
				}
				
				//入库
				try {
					otRelationDao.deleteOTRelations(record.getOrderid());
					otRelationDao.insertOTRelations(relations);
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			}
			
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	@Override
	public List<JSONObject> getOrderList(JSONObject params) {
		List<JSONObject> result = null;
		try {
			try {
				result = orderManageDao.selectOrderList(params);				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//查询关联老师			
			if(!CollectionUtils.isEmpty(result)){
				List<String> tIds = new ArrayList<String>();
				
				for(JSONObject order : result){
					String teachingIds = order.getString("teachingIds");
					if(!StringUtils.isEmpty(teachingIds)){
						tIds.addAll(Arrays.asList(teachingIds.split(",")));
					}
				}
				
				//增加任教关系字段
				if(null!=tIds && tIds.size()>0){
					try {
						Map<String,JSONObject> teachingIdNameMap = new HashMap<String,JSONObject>();
						List<JSONObject> teachers = orderManageDao.selectTeachersByTeachingIds(tIds);
						for(JSONObject teacher : teachers){
							teachingIdNameMap.put(teacher.getString("teachingId"), teacher);
						}
						
						//匹配任教老师关系
						for(JSONObject order : result){
							String teachingIds = order.getString("teachingIds");
							if(!StringUtils.isEmpty(teachingIds)){
								List<String>curTeachingIds = Arrays.asList(teachingIds.split(","));
								//StringBuffer sb = new StringBuffer();
								JSONArray teacherMaps = new JSONArray();
								for(String curTeachingId : curTeachingIds){
									JSONObject curTeacher = teachingIdNameMap.get(curTeachingId);
									/*sb.append(curTeacher.getString("teacherName"));
									sb.append("(");
									sb.append(curTeacher.get("lessonType"));
									sb.append(")");
									sb.append(",");*/
									
									teacherMaps.add(curTeacher);
								}
								order.put("bindTeachers", teacherMaps/*sb.substring(0, sb.length()-1)*/);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				}
			}
			return result;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public List<JSONObject> queryTeachingList(JSONObject params) {
		try {
			return orderManageDao.selectTeachersByConditions(params);
		} catch (Exception e) {
			logger.info("查询教学任务（老师列表）出错！");
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<JSONObject> queryCourseList(JSONObject params) {
		try {
			return orderManageDao.selectCoursesByGradeId(params.getString("gradeId"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询年级下的课程名出错！");
		}
		return null;
	}

	@Override
	public int updateOrderSum(JSONObject params) {
		try {
			OrderSum record = new OrderSum();
			record.setOrderid(params.getString("orderId"));
			
			int type = params.getIntValue("operateType");
			int operateNum = params.getIntValue("operateNum");
			
			operateNum = (type==0)?-operateNum:operateNum;
			
			try {
				record = orderSumDao.selectByPrimaryKey(record);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			record.setTotallessonnum((short) (record.getTotallessonnum()+operateNum));
			record.setLessonleftnum((short)(record.getLessonleftnum()+operateNum));
			
			orderSumDao.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public List<JSONObject> queryMTeachings(JSONObject params) {
		try {
			return orderManageDao.selectMTeachingsByParams(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
}
