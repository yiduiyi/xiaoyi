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
import com.xiaoyi.manager.service.IAccountService;

@Controller
@RequestMapping("/supervise")
public class TeachingSuperviseAction {
	@Resource
	private IAccountService accountService;
	
	@RequestMapping(value="/sendPurchaseLink",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject sendPurchaseLink(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		String msg = "发送失败！";
		int code = -1;
		Integer type = reqData.getInteger("type");
		
		int sendCount = -1;
		switch (type) {
		case 1:	//一键催费
			sendCount = accountService.sendMsgsToSelectedCustom(reqData);
			break;
		case 2:	//发送补缴链接
			sendCount = accountService.sendPurchaseLink(reqData);
			break;
		}
		
		if(sendCount>=0){
			code = 0;
			msg = "发送成功！";
		}
		return setReturnMsg(result, code, msg);		
	}

	private JSONObject setReturnMsg(JSONObject result,int code, String msg){
		result.put("code", code);
		result.put("msg", msg);
		return result;
	}
}
