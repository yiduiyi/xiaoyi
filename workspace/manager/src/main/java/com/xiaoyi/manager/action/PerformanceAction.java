package com.xiaoyi.manager.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.IPerformanceService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
/**
 * 业绩管理
 * @author 颜振衡
 * @QQ 1376005213
 * @Date 2018年11月7日
 */
@Controller
@RequestMapping("/performance")
public class PerformanceAction {
	@Resource
	private IPerformanceService performanceService;

	@RequestMapping(value = "/getOperationalData", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getOperationalData(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			JSONObject data = performanceService.getOperationalData(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}

	@RequestMapping(value = "/getConsultantGroupData", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getConsultantGroupData(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			JSONObject data = performanceService.getConsultantGroupData(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}

	@RequestMapping(value = "/getChannelGroupData", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getChannelGroupData(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			JSONObject data = performanceService.getChannelGroupData(reqData);
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
