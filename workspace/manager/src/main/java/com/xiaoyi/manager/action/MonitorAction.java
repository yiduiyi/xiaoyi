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
import com.xiaoyi.manager.service.MonitorService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 
 * @author 颜振衡
 * @QQ 1376005213
 * @Date 2018年8月22日
 */
@Controller
@RequestMapping("/monitor")
public class MonitorAction {
	@Resource
	private MonitorService monitorService;

	/**
	 * 教学监控列表查询
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getTeachingProcess", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getTeachingProcess(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = monitorService.getTeachingProcess(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/getCustomFeedback", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getCustomFeedback(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			JSONObject data = monitorService.getCustomFeedback(reqData);
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
