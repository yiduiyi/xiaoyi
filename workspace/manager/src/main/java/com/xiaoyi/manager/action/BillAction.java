package com.xiaoyi.manager.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @author 颜振衡
 * @QQ 1376005213
 * @Date 2018年9月1日
 */
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.IBillRecordRelationService;
import com.xiaoyi.manager.service.IBillService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/bill")
public class BillAction {
	@Resource
	private IBillService billService;
	@Resource
	private IBillRecordRelationService billRecordRelationService;
	/**
	 * 添加订单信息
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/insertBill", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertBill(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(billService.insertBill(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 查询订单列表
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getBillList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getBillList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = billService.getBillList(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 修改订单信息
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/updateBill",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateBill(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(billService.updateBill(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 派单接口，根据传进来的属性字段修改订单属性
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/sendBillToTeacher" , method = RequestMethod.POST)
	@ResponseBody
	public JSONObject sendBillToTeacher(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(billService.sendBillToTeacher(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 获取教师投递记录
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getBillRecordList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getBillRecordList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = billRecordRelationService.getBillRecordList(reqData);
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 修改教师投递记录
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/updateBillRecord",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateBillRecord(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(billService.updateBillRecord(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 删除订单
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/deleteBill",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteBill(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(billService.deleteBill(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	/**
	 * 获取课程顾问列表
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getConsultantList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getConsultantList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			result.put("data", billService.getAllConsultants());
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	///
	private JSONObject setReturnMsg(JSONObject result, int code, String msg) {
		result.put("code", code);
		result.put("msg", msg);
		return result;
	}
}
