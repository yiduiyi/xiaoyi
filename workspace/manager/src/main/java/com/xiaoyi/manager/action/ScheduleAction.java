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
import com.xiaoyi.manager.service.IScheduleService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.LoginConstants;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 4.	预约管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleAction {
	
	@Resource
	private IScheduleService scheduleService;
	
	@RequestMapping(value="/addSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject addSchedule(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = scheduleService.addSchedule(reqData);
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/deleteSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject deleteSchedule(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = scheduleService.deleteSchedule(reqData.getString("scheduleId"));
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/updateSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject updateSchedule(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = scheduleService.updateSchedule(reqData);
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/getScheduleList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getScheduleList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> datas = scheduleService.getScheduleList(reqData);
			result.put("data", datas);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	//
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}
