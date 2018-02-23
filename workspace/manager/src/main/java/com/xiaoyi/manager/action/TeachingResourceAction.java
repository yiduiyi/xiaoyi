package com.xiaoyi.manager.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.service.IAccountService;
import com.xiaoyi.manager.service.ILoginService;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.manager.service.IScheduleService;
import com.xiaoyi.manager.service.ITeachingResourceService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.LoginConstants;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 3.	师资管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/teaching")
public class TeachingResourceAction {
	@Resource
	ITeachingResourceService tResourceService;
	
	@RequestMapping(value="/addTeacher",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject addTeacher(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> teachers = new ArrayList<JSONObject>();
			teachers.add(reqData);
			
			tResourceService.addTeachingTeacher(teachers);
			
			rtCode = RtConstants.SUCCESS;
			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/getTeachingList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getTeachingList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> teachings = tResourceService.queryTeachingList(reqData);
			
			if(!CollectionUtils.isEmpty(teachings)) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.DD");
				for(JSONObject teaching : teachings) {
					Object regDate = teaching.get("regDate");
					if(null!=regDate) {
						teaching.put("regDate", format.format(regDate));
					}
				}
			}
			result.put("data", teachings);
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/getTeachingTeachers",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getTeachingTeachers(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> teachers = tResourceService.queryTeacherList(reqData);
			
			if(!CollectionUtils.isEmpty(teachers)) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.DD");
				for(JSONObject teaching : teachers) {
					Object regDate = teaching.get("regDate");
					if(null!=regDate) {
						teaching.put("regDate", format.format(regDate));
					}
				}
			}
			result.put("data", teachers);
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	///
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}
