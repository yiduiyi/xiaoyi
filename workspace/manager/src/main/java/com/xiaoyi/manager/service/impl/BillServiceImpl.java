package com.xiaoyi.manager.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.manager.dao.IBillDao;
import com.xiaoyi.manager.dao.IConsultantDao;
import com.xiaoyi.manager.domain.Bill;
import com.xiaoyi.manager.domain.BillRecordRelation;
import com.xiaoyi.manager.domain.Consultant;
import com.xiaoyi.manager.service.IBillRecordRelationService;
import com.xiaoyi.manager.service.IBillService;
import com.xiaoyi.teacher.service.IH5PlateService;
import com.xiaoyi.teacher.service.ITeacherResumeRelationService;
import com.xiaoyi.wechat.utils.UUIDUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;
@Service("billService")
public class BillServiceImpl implements IBillService {
	@Resource
	private IBillDao billDao;
	@Resource
	private IBillRecordRelationService billRecordRelationService;
	@Resource
	private ITeacherResumeRelationService teacherResumeRelationDao;
	@Resource
	private IH5PlateService h5PlateService;
	@Resource
	private IWechatService wechatService;
	
	@Resource 
	IConsultantDao consultantDao;
	
	ExecutorService executor = Executors.newFixedThreadPool(2);
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	public int insertBill(JSONObject reqData) {
		if(null == reqData) {
			return -1;
		}
		String billId = UUIDUtil.getUUIDPrimary();
		Bill bill = new Bill();
		bill.setBillId(billId);
		bill.setSerialNumber(reqData.getString("serialNumber"));
		bill.setGradeId(reqData.getString("gradeId"));
		bill.setCourseId(reqData.getString("courseId"));
		bill.setConsultantId(reqData.getString("consultantId"));
		bill.setClassTime(reqData.getString("classTime"));
		bill.setClassAddress(reqData.getString("classAddress"));
		bill.setDemand(reqData.getString("demand"));
		bill.setCreateTime(new Date());
		bill.setUpdateTime(new Date());
		bill.setStatus(ConstantUtil.BILL_STATUS_NORMAL);
		return billDao.insert(bill);
	}
	@Override
	public List<JSONObject> getBillList(JSONObject reqData) {
		List<JSONObject> result = null;
		try {
			result = billDao.getBillList(reqData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(CollectionUtils.isNotEmpty(result)) {
			Map<String, Object> billQuantityNumMap = new HashMap<String, Object>();
			List<JSONObject> billQuantityNums = billDao.getBillQuantityNums();
			if(CollectionUtils.isNotEmpty(billQuantityNums)) {
				for (JSONObject billQuantityNum : billQuantityNums) {
					billQuantityNumMap.put(billQuantityNum.getString("billId"), billQuantityNum.getString("billQuantityNum"));
				}
			}
			for (JSONObject jsonObject : result) {
				Object billQuantityNum = billQuantityNumMap.get(jsonObject.getString("billId"));
				if(null == billQuantityNum){
					jsonObject.put("billQuantityNum",0);
				}else{
					jsonObject.put("billQuantityNum", billQuantityNum);	
					
					/*if(jsonObject.getInteger("billQuantityNum")>= 5){	//设置派单已满状态
						jsonObject.put("status", "3");
					}*/
				}
				Integer gradeId = jsonObject.getInteger("gradeId");
				if(null!=gradeId) {
					for(Grade grade : Grade.values()) {
						if(grade.getValue() == gradeId) {
							jsonObject.put("gradeName", grade.getFullGradeName());
							break;
						}
					}
				}
				Integer courseId = jsonObject.getInteger("courseId");
				if(null!=courseId) {
					for(Course course : Course.values()) {
						if(course.getValue() == courseId) {
							jsonObject.put("courseName", course.toString());
							break;
						}
					}
				}
			}
			// 按照投递数排序
			Collections.sort(result, new Comparator<JSONObject>() {
				@Override
				public int compare(JSONObject o1, JSONObject o2) {
					if (null != o1 && null != o2 && o1.getDate("updateTime") != null
							&& o2.getDate("updateTime") != null) {

						return o2.getDate("updateTime").compareTo(o1.getDate("updateTime"));
					}
					return 0;
				}
			});
		}
		return result;
	}
	@Override
	public int updateBill(JSONObject reqData) {
		int resultType = 0;
		if(null == reqData) {
			return -1;
		}
		Bill bill = billDao.selectByPrimaryKey(reqData.getString("billId"));
		if(null != bill) {
			Bill updateBill = new Bill();
			updateBill.setBillId(reqData.getString("billId"));
			updateBill.setGradeId(reqData.getString("gradeId"));
			updateBill.setCourseId(reqData.getString("courseId"));
			updateBill.setConsultantId(reqData.getString("consultantId"));
			updateBill.setClassTime(reqData.getString("classTime"));
			updateBill.setClassAddress(reqData.getString("classAddress"));
			updateBill.setUpdateTime(new Date());
			updateBill.setDemand(reqData.getString("demand"));
			updateBill.setSerialNumber(reqData.getString("serialNumber"));
			
			resultType =  billDao.updateByPrimaryKeySelective(updateBill);
		}
		return resultType;
	}
	@Override
	public int sendBillToTeacher(JSONObject reqData) {
		int resultType = 0;
		Bill bill = billDao.selectByPrimaryKey(reqData.getString("billId"));
		if(null != bill) {
			Bill updateBill = new Bill();
			updateBill.setBillId(bill.getBillId());
			if(reqData.getString("operationType").equals("0")) {
				updateBill.setStatus(ConstantUtil.BILL_STATUS_NORMAL);
			}else if(reqData.getString("operationType").equals("1")) {
				updateBill.setStatus(ConstantUtil.BILL_STATUS_IS_SENT);
			}
			resultType = billDao.updateByPrimaryKeySelective(updateBill);
		}
		return resultType;
	}
	@Transactional
	@Override
	public int updateBillRecord(JSONObject reqData) {
		int resultType = 0;
		Integer status = reqData.getInteger("status");
		BillRecordRelation record = new BillRecordRelation();
		record.setBillRecordId(reqData.getString("billRecordId"));
		record.setStatus(status);
		record.setUpdateTime(new Date());
		//判断投递成功还是投递失败
		if(status == ConstantUtil.BILL_RECORD_STATUS_IS_OK) {
			resultType = billRecordRelationService.updateBillRecord(record);
			//同步修改订单状态
			if(resultType > 0) {
				Bill bill = new Bill();
				bill.setBillId(reqData.getString("billId"));
				bill.setStatus(ConstantUtil.BILL_STATUS_IS_SENT_OVER);
				bill.setUpdateTime(new Date());
				resultType = billDao.updateByPrimaryKeySelective(bill);
				//同步修改其他投递者的投递记录为接单失败
				if(resultType > 0) {
					billRecordRelationService.updateOtherBillRecord(reqData.getString("billId"),reqData.getString("billRecordId"));
				}
			}
		}else if(status == ConstantUtil.BILL_RECORD_STATUS_IS_PASS) {
			resultType = billRecordRelationService.updateBillRecord(record);
		}
		return resultType;
	}
	@Override
	public int deleteBill(JSONObject reqData) {
		Bill bill = new Bill();
		bill.setBillId(reqData.getString("billId"));
		bill.setStatus(ConstantUtil.BILL_STATUS_REMOVE);
		bill.setUpdateTime(new Date());
		return billDao.updateByPrimaryKeySelective(bill);
	}
	@Override
	public List<JSONObject> selectSuitBillListByConsultantId(String consultantId) {
		return billDao.selectSuitBillListByConsultantId(consultantId);
	}
	@Override
	public List<JSONObject> getBillSendNum() {
		return billDao.getBillSendNum();
	}
	@Override
	public List<JSONObject> getRecordStatus(String teacherid) {
		return billDao.getRecordStatus(teacherid);
	}
	@Override
	public List<JSONObject> getAllBillList() {
		return billDao.getAllBillList();
	}
	@Override
	public List<JSONObject> getMyBillRecord(String teacherid) {
		
		return billDao.getMyBillRecord(teacherid);
	}
	@Override
	public List<JSONObject> getAllSendBillList(List<String> billIdList) {
		return billDao.getAllSendBillList(billIdList);
	}
	@Override
	public void sendAllInTheSingleBillQuarzMsgToTeacher() {
		List<JSONObject> bills = billDao.getAllInTheSingleBill();
		final List<String> values = new ArrayList<String>();
		final List<String> colors = new ArrayList<String>();
		values.add("重要提醒 \n以下订单未派，想接的尽快哦\n");
		colors.add("#173177");
		if(CollectionUtils.isNotEmpty(bills)) {
			StringBuilder serialNumberS = new StringBuilder();
			for (JSONObject bill : bills) {
				serialNumberS.append(bill.getString("serialNumber")).append(", ");
			}
			values.add(serialNumberS.toString());
			colors.add("#173177");
			
			//发送时间
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			values.add(sdf.format(new Date()));
			colors.add("#173177");
		}
		values.add("点击查看详情");
		colors.add("#173177");
		//查询所有接收推送的教师openId
		List<JSONObject> teachers = h5PlateService.getAllRemindTeacherList();
		if (CollectionUtils.isNotEmpty(teachers)) {
			Iterator<JSONObject> iterator = teachers.iterator();
			while (iterator.hasNext()) {
				final JSONObject teacher = iterator.next();
				logger.info("推送的教师主键："+teacher.getString("openId")+"————推送的内容："+values.toString());
				executor.submit(new Runnable() {
					@Override
					public void run() {
						wechatService.sendTempletMsg2(WeiXinConfig.TEACHER_PLATE_APPID,
								WeiXinConfig.TEACHER_PLATE_SECRET_KEY,
								WeiXinConfig.TEACHER_TAKE_BILL_TEMPLETE_ID, WeiXinConfig.BILL_LIST_REDIRECT_URL, teacher.getString("openId"),
								values, colors, teacher);
					}
				});
			
			}
		}
	}
	@Override
	public List<JSONObject> getAllInTheSingleBill() {
		return billDao.getAllInTheSingleBill();
	}
	@Override
	public List<JSONObject> getAllConsultants() {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			List <Consultant> consultantList = consultantDao.selectList();
			
			if(CollectionUtils.isNotEmpty(consultantList)){
				for(Consultant c : consultantList){
					JSONObject data = new JSONObject();
					data.put("consultantId", c.getConsultantId());
					data.put("consultantName", c.getConsultantName());
					
					datas.add(data);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
				
		return datas;
	}
}
