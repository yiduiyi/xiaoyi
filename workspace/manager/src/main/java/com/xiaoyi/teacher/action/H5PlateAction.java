package com.xiaoyi.teacher.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.IH5PlateService;
import com.xiaoyi.teacher.service.IPrivateDomainService;

@Controller
@RequestMapping("/teacher/h5")
public class H5PlateAction {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private IH5PlateService h5PlateService;
	
	@RequestMapping(value="/getBindStatus",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getBindStatus(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			int status = h5PlateService.queryBindStatus(reqData.getString("openId"));
			JSONObject data = new JSONObject();
			data.put("status", status);
			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {
			logger.error("获取老师账号绑定状态失败！");
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	@RequestMapping(value="/bindWechat",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject bindWechat(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			int code = h5PlateService.bindWechat(reqData);
			if(code==0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			logger.error("绑定老师账号失败！");
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
