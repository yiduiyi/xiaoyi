package com.xiaoyi.customer.action;

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
import com.xiaoyi.common.utils.ResponseConstants.RtConstants;
import com.xiaoyi.manager.service.IBigColumnService;
import com.xiaoyi.manager.service.ICourseService;
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	@Resource
	private IBigColumnService bigColumnService;
	@Resource
	private ICourseService courseService;
	
	@RequestMapping(value = "/getBigColumnList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getBigColumnList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = bigColumnService.getBigColumnList(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/getMyCourseList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMyCourseList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = courseService.getCourseList(reqData);
			result.put("data", data);
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
