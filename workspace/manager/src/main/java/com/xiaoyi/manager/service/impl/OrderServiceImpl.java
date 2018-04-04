package com.xiaoyi.manager.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
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
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Level;
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
					orderSumKey.setLessontype(lessonType/*/100*/);
					
					orderSumKey.setMemberid(studentId);
					orderSumKey.setParentid(parentId);
					
					orderSum = orderSumDao.selectByPrimaryKey(orderSumKey);
				} catch (Exception e) {
					logger.info("查询订单总表出错！");
					throw e;
				}
				
				//添加订单条目
				Short purchaseNum = params.getShort("purchaseNum")==null?
						0:params.getShort("purchaseNum");	
				
				Orders order = new Orders();				
				try {
					order.setOrderid(UUID.randomUUID().toString());
				
					order.setCreatetime(new Date());
					order.setLessontype(lessonType);
					order.setMemberid(studentId);
					order.setParentid(parentId);
					order.setPurchasenum(purchaseNum);				
					order.setHasBook(params.getShort("hasBook"));
					order.setOrderType(params.getInteger("orderType"));
					
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
					orderSum.setLessontype(lessonType/*/100*/);
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
		int updatedColums = 0;
		try {
			String teacherIds = params.getString("teacherIds");
			String courseIds = params.getString("courseIds");
			String orderId = params.getString("orderId");
			
			logger.info("teacherIds"+teacherIds);
			logger.info("courseIds"+courseIds);
			logger.info("orderId"+orderId);
			List<String> courseList = null;
			List<String> teacherList = null;			
			
			//待匹配老师
			if(null==teacherIds) {
				teacherIds = "";
			}
			teacherList = Arrays.asList(teacherIds.split(","));
			
			//待匹配科目
			if(null==courseIds) {
				courseIds = "";
			}
			courseList = Arrays.asList(courseIds.split(","));			

			//获取原订单详情
			OrderSum oldOrderSum = null;
			try {
				OrderSumKey orderSumKey = new OrderSumKey();
				orderSumKey.setOrderid(orderId);
				oldOrderSum = orderSumDao.selectByPrimaryKey(orderSumKey);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("获取元订单详情失败！");
				throw e;
			}
			
			//
			if(null==oldOrderSum){
				return updatedColums;
			}
			logger.info("oldOrderSum lessonType:"+oldOrderSum.getLessontype());
			
			//查看是否存在重复录入情况（订单下存在相同的老师Id和科目Id）
			try {
				List<TeacherLesRelationKey> newTLRlations = new ArrayList<TeacherLesRelationKey>();
				List<OrderTeachingRelation> newOTRelations = new ArrayList<OrderTeachingRelation>();
				
				List<OrderTeachingRelation> otRelations = otRelationDao.selectOTRelationsByOrderId(orderId);
				if(teacherList.size()>0) {
					next:
					for(int i=0; i<teacherList.size(); i++) {
						int courseId = Integer.parseInt(courseList.get(i));
						String teacherId = teacherList.get(i);
						logger.info("to be inserted courseId:"+courseId);
						logger.info("to be inserted teacherId:"+teacherId);
						//logger.info("");
						
						//过滤重复教学任务
						if(otRelations!=null) {
							for(int j=0; j<otRelations.size(); j++) {
								OrderTeachingRelation otRelation = otRelations.get(j);
								
								logger.info("otr courseId:"+otRelation.getLessonType());
								logger.info("otr teacherId"+otRelation.getTeacherId());
								if(courseId==otRelation.getLessonType()
										&& teacherId.equals(otRelation.getTeacherId())) {
									continue next;
								}
							}
						}
						//新增教学任务
						String teachingId = UUID.randomUUID().toString();
						TeacherLesRelationKey tlRelation = new TeacherLesRelationKey();
						tlRelation.setLessontype(courseId);
						tlRelation.setTeacherid(teacherId);
						tlRelation.setTeachingid(teachingId);
						newTLRlations.add(tlRelation);
						
						OrderTeachingRelation otRelation = new OrderTeachingRelation();
						otRelation.setLessonType(courseId);
						otRelation.setTeacherId(teacherId);
						otRelation.setTeachingId(teachingId);
						otRelation.setMemberId(oldOrderSum.getMemberid());
						otRelation.setOrderId(orderId);
						otRelation.setParentId(oldOrderSum.getParentid());						
						newOTRelations.add(otRelation);
						
						//补充订单教学任务
						if(StringUtils.isEmpty(oldOrderSum.getTeachingids())) {
							oldOrderSum.setTeachingids(teachingId);
						}else {
							StringBuffer sb = new StringBuffer();
							sb.append(oldOrderSum.getTeachingids());
							sb.append(",");
							sb.append(teachingId);
							
							oldOrderSum.setTeachingids(sb.toString());
						}
					}
				}

				//订单-教学任务入库
				try {
					if(!CollectionUtils.isEmpty(newOTRelations)) {
						updatedColums = otRelationDao.insertOTRelations(newOTRelations);
					}else{
						return updatedColums;
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
				
				//增加老师任教关系
				try {
					if(!CollectionUtils.isEmpty(newTLRlations)) {
						tlRelationDao.insertTLRelationList(newTLRlations);
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e ;
			}
				
			//更新订单的任教关系
			try {
				//if()
				orderSumDao.updateByPrimaryKeySelective(oldOrderSum);				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			return updatedColums;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	@Transactional
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
			//查询是否有书
			Map<String,Short> orderHasBookMap = new HashMap<String,Short>();
			try {
				Map<String,Object> reqParams = new HashMap<String,Object>();
				reqParams.put("hasBook", "1");
				List<Orders> orderList = orderManageDao.selectIfHasBookByParams(reqParams);
				if(!CollectionUtils.isEmpty(orderList)) {
					for(Orders orders : orderList) {																		
						orderHasBookMap.put(orders.getOrderid(), orders.isHasBook());
					}
				}
				
			} catch (Exception e) {
				logger.info("查询订单是否购买书籍出错！");
				logger.error(e.getMessage());
			}
			//查询关联老师			
			if(!CollectionUtils.isEmpty(result)){
				List<String> tIds = new ArrayList<String>();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				for(JSONObject order : result){
					//加入是否购买课本
					if(null!=orderHasBookMap.get(order.getString("orderId"))) {
						order.put("hasBook", 1);
					}else {
						order.put("hasBook", 0);
					}
					String teachingIds = order.getString("teachingIds");
					if(!StringUtils.isEmpty(teachingIds)){
						tIds.addAll(Arrays.asList(teachingIds.split(",")));
					}
					
					//转换时间
					Object purchaseTime = order.get("purchaseTime");
					if(null != purchaseTime) {
						try {
							order.put("purchaseTime", dateFormat.format(purchaseTime));							
						} catch (Exception e) {
							logger.info("转换时间出错！");
							logger.info(e.getMessage());
						}
					}
					//转换年级代码->名称
					Integer grade = order.getIntValue("lessonType");
					if(grade.intValue()<0) {
						grade*=-1;
					}
					if(null!=grade) {
						for(Level curLevel : Level.values()) {
							if(curLevel.getValue() == grade/10) {
								order.put("gradeName", curLevel.toString());
								break;
							}
						}
						
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
									if(null==curTeacher) {
										continue;
									}
									if(null!=curTeacher 
											&& null!=curTeacher.getInteger("lessonType")) {
										Integer lessonType = curTeacher.getInteger("lessonType");
										for(Course curCourse : Course.values()) {
											if(lessonType%10 == curCourse.getValue()) {
												curTeacher.put("courseName", curCourse.toString());
											}
										}
										
									}
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
			//按照时间（最近）排序
			Collections.sort(result, new Comparator<JSONObject>() {

				@Override
				public int compare(JSONObject o1, JSONObject o2) {
					if(null!=o1 && null!=o2 
							&& o1.getString("purchaseTime")!=null
							&& o2.getString("purchaseTime")!=null){
						
						return o2.getString("purchaseTime").compareTo(o1.getString("purchaseTime"));
					}
					return 0;
				}
			});
			
			return result;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	@Transactional
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
	@Transactional
	@Override
	public int updateOrderSum(JSONObject params) {
		try {
			OrderSum record = new OrderSum();
			record.setOrderid(params.getString("orderId"));
			
			//0：结算、1：充值
			int type = params.getIntValue("operateType");
			int operateNum = params.getIntValue("operateNum");
			
			operateNum = (type==0)?-operateNum:operateNum;
			
			//更新订单总表
			try {
				record = orderSumDao.selectByPrimaryKey(record);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			record.setTotallessonnum((short) (record.getTotallessonnum()+operateNum));
			record.setLessonleftnum((short)(record.getLessonleftnum()+operateNum));
			
			try {
				orderSumDao.updateByPrimaryKeySelective(record);				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//插入结算、充值记录
			Orders order = new Orders();				
			try {
				order.setOrderid(UUID.randomUUID().toString());
			
				order.setCreatetime(new Date());
				order.setLessontype(record.getLessontype());
				order.setMemberid(record.getMemberid());
				order.setParentid(record.getParentid());
				order.setPurchasenum((short)operateNum);				
				
				order.setOrderType(/*++*/type);
				orderDao.insertSelective(order);
			}catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}
	
	@Transactional
	@Override
	public List<JSONObject> queryMTeachings(JSONObject params) {
		try {
			return orderManageDao.selectMTeachingsByParams(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<JSONObject> queryMOrders(JSONObject params) {
		try {
			try {
				OrderSumKey key = new OrderSumKey();
				key.setOrderid(params.getString("orderId"));
				OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
				
				if(null==orderSum 
						|| orderSum.getMemberid()==null
						|| orderSum.getParentid()==null) {
					return null;
				}
				
				params.put("memberId", orderSum.getMemberid());
				params.put("parentId", orderSum.getParentid());
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			
			//查询对应的充值、结算记录
			List<Orders>mOrders = orderManageDao.selectMOrdersByParams(params);
			
			List<JSONObject> data = new ArrayList<JSONObject>();
			if(!CollectionUtils.isEmpty(mOrders)) {
				SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for(Orders order : mOrders) {	
					JSONObject singleData = new JSONObject();
					singleData.put("operateType", order.getOrderType());
					singleData.put("operateNum", order.getPurchasenum());				
					singleData.put("date", myFmt.format(order.getCreatetime()));					
					
					data.add(singleData);
				}
			}
			return data;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	@Override
	public int deleteTeachingTeacher(JSONObject params) {
		try {
			Map<String,Object> reqParams = new HashMap<String,Object>();
			reqParams.put("orderId", params.get("orderId"));
			reqParams.put("courseId", params.get("courseId"));
			reqParams.put("teacherId", params.get("teacherId"));
			
			//查询任教Id
			String deleteTeachingId = null;
			try {
				OrderTeachingRelation otr = otRelationDao.selectOTRelationsByParams(reqParams);
				if(null==otr){
					//误删之后,清理教学任务对应的表数据 
					try {
						OrderSumKey key = new OrderSumKey();
						
						key.setOrderid(params.getString("orderId"));
						OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
						
						if(null==orderSum){
							logger.info("orderSum is null!");
							return 0;
						}
						
						String teachingIds = orderSum.getTeachingids();
						if(!StringUtils.isEmpty(teachingIds)){
							List<String> teachingIdList = Arrays.asList(teachingIds.split(","));
							
							//查找无效的教学任务
							logger.info("query tlRelations[params]:"+teachingIdList.toString());
							List<TeacherLesRelationKey> tlrs = tlRelationDao.selectTLRelationsById(teachingIdList);
							if(!CollectionUtils.isEmpty(teachingIdList) 
									&& !CollectionUtils.isEmpty(tlrs)){
								logger.info("query deprecated teachingId");
								for(TeacherLesRelationKey tlr : tlrs){
									if(teachingIdList.contains(tlr.getTeachingid())){
										deleteTeachingId = tlr.getTeachingid();
										break;
									}
								}
							}
						}
					} catch (Exception e) {
						logger.info("清理教学任务对应的表数据出错！");
						e.printStackTrace();
					}
					
				}else{
					deleteTeachingId = otr.getTeachingId();
				}
								
				logger.info("deleteTeachignId:"+deleteTeachingId);
				if(StringUtils.isEmpty(deleteTeachingId)){
					return 0;
				}
			} catch (Exception e) {
				logger.error("查询任教Id失败！");
				e.printStackTrace();
				return -1;
			}

			try {				
				otRelationDao.deleteOTRelations(reqParams);	
			} catch (Exception e) {
				logger.error("删除老师任教关系出错！");
				e.printStackTrace();
				throw e;
			}
			//otRelationDao.selectOTRelationsByOrderId(params.getString("orderId"));
			
			//删除教师教学任务
			try {
				TeacherLesRelationKey tlRelationKey = new TeacherLesRelationKey();
				tlRelationKey.setLessontype(params.getInteger("courseId"));
				tlRelationKey.setTeacherid(params.getString("teacherId"));
				tlRelationKey.setTeachingid(deleteTeachingId);
				
				//补充 teachingId				
				//tlRelationKey = tlRelationDao.selectTLRelationByParams(tlRelationKey);
				//deleteTeachingId = tlRelationKey.getTeachingid();
				
				tlRelationDao.deleteByPrimaryKey(tlRelationKey);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//删除订单总表中的教学任务
			try {
				OrderSumKey key = new OrderSumKey();
				
				key.setOrderid(params.getString("orderId"));
				OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
				if(null!=orderSum && !StringUtils.isEmpty(orderSum.getTeachingids())) {
					String teachingIds = orderSum.getTeachingids();
					logger.info("teachingIds:"+teachingIds);
					StringBuffer sb = new StringBuffer();
					List<String> teachingIdList = Arrays.asList(teachingIds.split(","));
					for(String teachingId : teachingIdList){
						if(!teachingId.equals(deleteTeachingId)){
							sb.append(teachingId);
							sb.append(",");
						}
					}
					if(sb.length()>1){
						orderSum.setTeachingids(sb.substring(0,sb.length()-1));					
						orderSumDao.updateByPrimaryKeySelective(orderSum);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	
}
