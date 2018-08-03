package com.xiaoyi.manager.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 4.	预约管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/order")
public class OrderAction {
	
	@Resource
	private IOrderService orderService;
	
	@RequestMapping(value="/queryOrders",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject queryOrders(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> data = orderService.getOrderList(reqData);
			//int rt = orderService.addOrder(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.name());		
		return result;
	}
	//月订单
	@RequestMapping(value="/queryMOrders",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject queryMOrders(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		int code = 0;
		String msg = "返回成功！";
		
		try {			
			
			List<JSONObject> data = orderService.queryMOrders(reqData);
			//int rt = orderService.addOrder(reqData);
			result.put("data", data);						
		} catch (Exception e) {			
			CommonRunException exception = (CommonRunException)e;
			code = exception.getCode();
			msg = exception.getMessage();
			e.printStackTrace();
		}
		
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	/**
	 * 手动录入
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject addOrder(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = orderService.addOrder(reqData);
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		setReturnMsg(result, rtCode.getCode(), rtCode.name());		
		return result;
	}
	
	
	@RequestMapping(value="/teaching/getTeacher",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getTeacher(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {	
			Integer level = reqData.getInteger("level");
			Integer gradeId = reqData.getInteger("gradeId");
			Integer courseId = reqData.getInteger("courseId");
			if(null!=level) {
				reqData.put("level", level/*reqData.getInteger("lessonType ")/100*/);
			}
			if(null!=gradeId) {
				reqData.put("gradeId", gradeId);
			}
			if(null!=courseId) {
				reqData.put("courseId", courseId);
			}
			
			List<JSONObject> data = orderService.queryTeachingList(reqData);
						
			if(null!=data){								
				rtCode = RtConstants.SUCCESS;
				result.put("data", data);
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, rtCode.getCode(), rtCode.name());		
		return result;
	}
	
	
	@RequestMapping(value="/teaching/getCourses",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getCourses(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> data = orderService.queryCourseList(reqData);						
			
			rtCode = RtConstants.SUCCESS;
			result.put("data", data);			
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, rtCode.getCode(), rtCode.name());		
		return result;
	}
	@RequestMapping(value="/teaching/saveTeaching",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject saveTeaching(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		
		int code = 0;
		String msg = "操作成功！";
		
		try {			
			switch (orderService.updateOrder(reqData)) {
			case 0:
				code = -1;
				msg = "已存在该教学任务！";
				break;
			}
					
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	@RequestMapping(value="/updateOrder",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject updateOrder(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			//List<JSONObject> data = orderService.queryCourseList(reqData);						
			if(-1!=orderService.updateOrderSum(reqData)){
				rtCode = RtConstants.SUCCESS;
			}
			//result.put("data", data);			
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, rtCode.getCode(), rtCode.name());		
		return result;
	}
	
	@RequestMapping(value="/teaching/removeTeaching",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject removeTeaching(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			//List<JSONObject> data = orderService.queryCourseList(reqData);						
			if(-1!=orderService.deleteTeachingTeacher(reqData)){
				rtCode = RtConstants.SUCCESS;
			}
			//result.put("data", data);			
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, rtCode.getCode(), rtCode.name());		
		return result;
	}
	
	@RequestMapping(value="/getMTeaching",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getMTeaching(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		int code = -1;
		String msg = "获取失败！";
		
		try {			
			List<JSONObject> data = orderService.queryMTeachings(reqData);
			if(null!=data){
				
				
				result.put("data", data);
				
				code = 0;
				msg="获取月课时账单成功！";
			}
			
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	///
	private JSONObject setReturnMsg(JSONObject result,int code, String msg){
		result.put("code", code);
		result.put("msg", msg);
		return result;
	}
}
