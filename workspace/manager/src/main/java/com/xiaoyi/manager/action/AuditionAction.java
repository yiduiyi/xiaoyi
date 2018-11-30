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
import com.xiaoyi.manager.service.IAuditionService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/audition")
public class AuditionAction {

	@Resource
	private IAuditionService auditionService;
	
	@RequestMapping(value = "/getMyAuditionList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMyAuditionList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = auditionService.getAuditionList(reqData);
			result.put("data", data);
			rtCode =RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/setAuditionStatus",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject setAuditionStatus(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(auditionService.setAuditionStatus(reqData) > 0) {
				rtCode =RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/getAuditionList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAuditionList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = auditionService.getAuditionList(reqData);
			result.put("data", data);
			rtCode =RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/setAuditionConsultant",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject setAuditionConsultant(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(auditionService.setAuditionConsultant(reqData) > 0) {
				rtCode =RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/getAuditionConsultantGroupNum",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAuditionConsultantGroupNum(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = auditionService.getAuditionConsultantGroupNum(reqData);
			result.put("data", data);
			rtCode =RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/insertAudition",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertAudition(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(auditionService.insertAudition(reqData) > 0) {
				rtCode =RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/updateAudition",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateAudition(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(auditionService.updateAudition(reqData) > 0) {
				rtCode =RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	@RequestMapping(value = "/deleteAudition",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteAudition(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(auditionService.deleteAudition(reqData) > 0) {
				rtCode =RtConstants.SUCCESS;
			}
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
