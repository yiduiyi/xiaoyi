package com.xiaoyi.manager.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.service.IAccountService;
import com.xiaoyi.manager.service.ILoginService;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.manager.service.IScheduleService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.LoginConstants;
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
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
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
		
		
		setReturnMsg(result, rtCode);		
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
			reqData.put("gradeId", reqData.getInteger("lessonType")/100);
			reqData.put("courseId", reqData.getInteger("lessonType")%10);
			List<JSONObject> data = orderService.queryTeachingList(reqData);
						
			if(null!=data){
				rtCode = RtConstants.SUCCESS;
				result.put("data", data);
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, rtCode);		
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
	
		setReturnMsg(result, rtCode);		
		return result;
	}
	@RequestMapping(value="/teaching/saveTeaching",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject saveTeaching(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			//List<JSONObject> data = orderService.queryCourseList(reqData);						
			if(-1!=orderService.updateOrder(reqData)){
				rtCode = RtConstants.SUCCESS;
			}
			//result.put("data", data);			
		} catch (Exception e) {			
			e.printStackTrace();
		}
	
		setReturnMsg(result, rtCode);		
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
	
		setReturnMsg(result, rtCode);		
		return result;
	}
	///
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}
