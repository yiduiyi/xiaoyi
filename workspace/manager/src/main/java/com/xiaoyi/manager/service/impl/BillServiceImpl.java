package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.manager.dao.IBillDao;
import com.xiaoyi.manager.domain.Bill;
import com.xiaoyi.manager.domain.BillRecordRelation;
import com.xiaoyi.manager.service.IBillRecordRelationService;
import com.xiaoyi.manager.service.IBillService;
import com.xiaoyi.teacher.service.ITeacherResumeRelationService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("billService")
public class BillServiceImpl implements IBillService {
	@Resource
	private IBillDao billDao;
	@Resource
	private IBillRecordRelationService billRecordRelationService;
	@Resource
	private ITeacherResumeRelationService teacherResumeRelationDao;
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
				jsonObject.put("billQuantityNum", billQuantityNumMap.get(jsonObject.getString("billId")));
				Integer gradeId = jsonObject.getIntValue("gradeId");
				if(null!=gradeId) {
					for(Grade grade : Grade.values()) {
						if(grade.getValue() == gradeId) {
							jsonObject.put("gradeName", grade.toString());
							break;
						}
					}
				}
				Integer courseId = jsonObject.getIntValue("courseId");
				if(null!=courseId) {
					for(Course course : Course.values()) {
						if(course.getValue() == courseId) {
							jsonObject.put("courseName", course.toString());
							break;
						}
					}
				}
			}
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
			updateBill.setStatus(ConstantUtil.BILL_STATUS_IS_SENT);
			resultType = billDao.updateByPrimaryKeySelective(updateBill);
		}
		return resultType;
	}
	@Override
	public int updateBillRecord(JSONObject reqData) {
		int resultType = 0;
		Integer status = reqData.getInteger("status");
		BillRecordRelation record = new BillRecordRelation();
		record.setBillRecordId(reqData.getString("billRecordId"));
		record.setStatus(status);
		//判断投递成功还是投递失败
		if(status == ConstantUtil.BILL_RECORD_STATUS_IS_OK) {
			resultType = billRecordRelationService.updateBillRecord(record);
			//同步修改订单状态
			if(resultType > 0) {
				Bill bill = new Bill();
				bill.setBillId(reqData.getString("billId"));
				bill.setStatus(ConstantUtil.BILL_STATUS_IS_SENT_OVER);
				resultType = billDao.updateByPrimaryKeySelective(bill);
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

}