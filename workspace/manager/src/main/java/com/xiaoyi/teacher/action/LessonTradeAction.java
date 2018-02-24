package com.xiaoyi.teacher.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.ITeachingRecordService;

@Controller
@RequestMapping("/teacher/trade")
public class LessonTradeAction {
	@Resource
	private ITeachingRecordService recordService;

	@RequestMapping(value="/showTRecordsSum",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject showTRecordsSum(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
				
		try {
			result.put("data",  recordService.getTRecordSum(reqData));			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/showTRecords",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject showTRecords(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
				
		try {
			result.put("data",  recordService.getRecordList(reqData));			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/submitTeaching",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject submitTeaching(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
				
		try {
			//result.put("data",  recordService.getRecordList(reqData));			
			recordService.insertTeachingRecords(reqData);
			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}
