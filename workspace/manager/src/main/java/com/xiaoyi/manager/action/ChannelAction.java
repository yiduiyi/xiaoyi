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
import com.xiaoyi.manager.service.IChannelManagerGroupService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/channel")
public class ChannelAction {
	@Resource
	private IChannelManagerGroupService channelGroupService;

	@RequestMapping(value = "/insertChannelManagerGroup", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertChannelManagerGroup(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if (channelGroupService.insertChannelManagerGroup(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}

	@RequestMapping(value = "/deleteChannelManagerGroup", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteChannelManagerGroup(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if (channelGroupService.deleteChannelManagerGroup(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}

	@RequestMapping(value = "/getChannelManagerGroupList", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getChannelManagerGroupList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = channelGroupService.getChannelManagerGroupList(reqData);
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
