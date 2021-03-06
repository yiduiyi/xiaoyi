package com.xiaoyi.teacher.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.IPrivateDomainService;

@CrossOrigin
@Controller
@RequestMapping("/teacher/domain")
public class PrivateDomainAction {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private IPrivateDomainService domainService;
	
	@RequestMapping(value="/getSignStatus",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getSignStatus(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			Short signStatus = domainService.getSignStatus(reqData);
			
			if(-1!=signStatus) {
				JSONObject data = new JSONObject();
				data.put("signed", signStatus);
				result.put("data",data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			logger.error("获取老师签约状态失败！");
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	
	@RequestMapping(value="/agree",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject agree(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			domainService.setAgreement(reqData);
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("userBean");
			if(null!=user){
				user.setUserprivilege((byte)1);
			}
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {			
			logger.error("获取老师签约状态失败！");
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	
	@RequestMapping(value="/getPrivateMsg",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getPrivateMsg(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			result.put("data", domainService.queryPrivateMsg(reqData));
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {			
			logger.error("获取老师信息失败！");
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
