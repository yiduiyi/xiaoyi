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
import com.xiaoyi.common.utils.ResponseConstants.RtConstants;
import com.xiaoyi.manager.service.IOrderLogService;

@Controller
@RequestMapping(value = "/orderlog")
public class OrderLogController {
	@Resource
	private IOrderLogService orderLogService;

	@RequestMapping(value = "/getOrderLogList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getOrderLogList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = orderLogService.getOrderLogList(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}

	@RequestMapping(value = "/exportOrderLogList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject exportOrderLogList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if (orderLogService.exportOrderLogList(reqData, response) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}

	@RequestMapping(value = "/getOrderLogByOpenId", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getOrderLogByOpenId(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			JSONObject data = orderLogService.getOrderLogByOpenId(reqData);
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
