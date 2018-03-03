package com.xiaoyi.custom.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.custom.dao.ICustomDao;
import com.xiaoyi.custom.service.ICustomService;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.ParentStuRelation;
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
						lessonSummary.put("orderType", "on");
					}
					detail.put("teachingTime", myFmt.format(order.getCreatetime()));

				}else {//老师上门
					details = lessonSummary2.getJSONArray("details");
					if(null==details) {
						details = new JSONArray();
						lessonSummary2.put("details", details);
						lessonSummary2.put("orderType", "of");
					}
					detail.put("usedTime", myFmt.format(order.getCreatetime()));
				}
				detail.put("transactionType", order.getOrderType());
				detail.put("cnt", order.getPurchasenum());
				detail.put("transDate", myFmt.format(order.getCreatetime()));
				
				details.add(detail);
			}
			
			if(CollectionUtils.isEmpty(lessonSummary)) {
				lessonSummary.put("orderType", "on");
				lessonSummary.put("details", new JSONArray());
			}
			if(CollectionUtils.isEmpty(lessonSummary2)) {
				lessonSummary2.put("orderType", "on");
				lessonSummary2.put("details", new JSONArray());
			}
			
			datas.add(lessonSummary);
			datas.add(lessonSummary2);
			
			return datas;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Transactional
	@Override
	public int commitSchedule(JSONObject params) {
		String scheduleType = params.getString("orderType");
		Integer gradeId = params.getInteger("gradeId");
		Integer subjectId = params.getInteger("subjectId");
		String studentName = params.getString("studentName");
		String telNum = params.getString("telphone");
		String weixin = params.getString("weixin");
		String openId = params.getString("openid");
		
		try {
			JSONObject reqParams = new JSONObject();
			reqParams.put("telNum", telNum);
			reqParams.put("openId", openId);
			//reqParams.put("parentName", null);
			reqParams.put("studentName", studentName);
			
			JSONObject relations = commonService.addOrGetPSR(reqParams);
			if(null==relations) {
				return -1;
			}
			
			//拼装lessonType
			StringBuffer sb = new StringBuffer();
			if("on".equals(scheduleType)) {
				sb.append("-");
			}
			if(null!=gradeId) {
				sb.append(gradeId);
			}
			if(null!=subjectId) {
				sb.append(subjectId);
			}
			int lessonType = Integer.parseInt(sb.toString());
			
			try {
				Parents parents = (Parents)relations.get("parents");
				ParentStuRelation relation = (ParentStuRelation)relations.get("relation");
				if(null==parents
						|| null==relation) {
					return -1;
				}
				
				Schedule schedule = new Schedule();
				schedule.setScheduleid(UUID.randomUUID().toString());
				schedule.setMemberid(relation.getMemberid());
				schedule.setParentid(relation.getParentid());
				schedule.setLessontype(lessonType);
				schedule.setNotes("未处理");
				schedule.setStatus((byte)0);
				//schedule.setTeacherid(null);				
				schedule.setCreatetime(new Date());
				
				scheduleDao.insertSelective(schedule);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return 0;
	}

	@Override
	public List<JSONObject> getMySchedules(String openId) {
		// TODO Auto-generated method stub
		return null;
	}

}
