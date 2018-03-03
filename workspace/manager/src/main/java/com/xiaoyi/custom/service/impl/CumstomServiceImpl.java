package com.xiaoyi.custom.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.custom.dao.ICustomDao;
import com.xiaoyi.custom.service.ICustomService;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.manager.service.ICommonService;

@Service("customService")
public class CumstomServiceImpl implements ICustomService{
	
	@Resource  
    private IParentsDao parentDao;  
	
	@Resource 
	private ICustomDao customDao;
	
	@Resource
	IScheduleDao scheduleDao;
	
	@Resource
	private ICommonService commonService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<JSONObject> queryTransactionCourses(String openId) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			//查询家长微信号对应的parentId
			Parents parents = null;
			try {
				parents = parentDao.selectByOpenId(openId);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			String parentId = null;
			if(null!=parents) {
				parentId = parents.getParentid();								
			}
			
/*			//查询家长对应的订单总表
			List<OrderSum>orderSumList = null;
			if(parentId!=null) {
				try {					
					orderSumList = customDao.selectOrderSumsByParentId(parentId);
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			}
			if(CollectionUtils.isEmpty(orderSumList)) {
				return datas;
			}*/
			

			
			//查询家长对应的课时购买与消费情况
			List<Orders> orderList = null;
			try {
				orderList = customDao.selectTransactionOrders(parentId);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//必须是非空集合
			if(CollectionUtils.isEmpty(orderList)) {
				return datas;
			}
			
			
			SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			JSONObject lessonSummary = new JSONObject();	//学生生门			
			JSONObject lessonSummary2 = new JSONObject();	//老师上门
			for(Orders order : orderList) {
				JSONArray details = null;
				
				//学生上门				
				JSONObject detail = new JSONObject();
				if(order.getLessontype()>0) {
					details = lessonSummary.getJSONArray("details");
					if(null==details) {
						details = new JSONArray();
						lessonSummary.put("details", details);
					}
					lessonSummary.put("orderType", "on");
					detail.put("teachingTime", myFmt.format(order.getCreatetime()));					
				}else {//老师上门
					details = lessonSummary2.getJSONArray("details");
					if(null==details) {
						details = new JSONArray();
						lessonSummary2.put("details", details);
					}
					lessonSummary2.put("orderType", "of");
					detail.put("usedTime", myFmt.format(order.getCreatetime()));
				}
				detail.put("transactionType", order.getOrderType());
				detail.put("cnt", order.getPurchasenum());
				detail.put("transDate", myFmt.format(order.getCreatetime()));
				
				details.add(detail);
			}
			datas.add(lessonSummary);
			datas.add(lessonSummary2);
			
			return datas;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Override
	public int commitSchedule(JSONObject params) {
		String scheduleType = params.getString("orderType");
		Integer grade = params.getInteger("grade");
		Integer subject = params.getInteger("subject");
		String studentName = params.getString("studentName");
		String telNum = params.getString("telphone");
		String weixin = params.getString("weixin");
		
		try {
			JSONObject reqParams = new JSONObject();
			JSONObject relations = commonService.addOrGetPSR(reqParams);
			if(null==relations) {
				return -1;
			}
			
			try {
				Parents parents = (Parents)relations.get("parents");
				
				if(null==parents) {
					return -1;
				}
				
				Schedule schedule = new Schedule();
				scheduleDao.insertSelective(schedule);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		return 0;
	}

	@Override
	public List<JSONObject> getMySchedules(String openId) {
		// TODO Auto-generated method stub
		return null;
	}

}
