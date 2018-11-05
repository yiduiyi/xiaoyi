package com.xiaoyi.teacher.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.IDaulTaskService;

@CrossOrigin
@Controller
@RequestMapping("/teacher/daul")
public class DualTaskAction {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	IDaulTaskService daulTaskService;
	
	/**
	 * 查询老师绑定的学生、科目（任教关系）及作业完成率
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/getBondingRelations",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getBondingRelations(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			String openId = (String) request.getSession().getAttribute("openid");
			logger.info("openId:" + openId);
			
			List<JSONObject> datas = daulTaskService.getPSTRelations(openId);
			if(null!=datas){
				result.put("data", datas);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			logger.error("获取老师签约状态失败！");
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
		
	/**
	 * 设定绑定学生的年级和科目
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/setBondGrade",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject setBondGrade(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		int code = 0;
		String msg = "设置任教关系成功！";
		String openId = (String) request.getSession().getAttribute("openid");
		reqData.put("openId", openId);
		
		try {
			daulTaskService.setBondGrade(reqData);			
		} catch (CommonRunException e) {			
			logger.error("设置任教关系失败！");
			code = e.getCode();
			msg = e.getMessage();
		}
		
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	/**
	 * 查询可布置的视频课程列表
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/getAvailableTasks",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getAvailableTasks(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		int code = 0;
		String msg = "获取可布置的视频课程列表成功！";
		
		try {
			List<JSONObject> datas = daulTaskService.getAvailableTasks(reqData);
			result.put("data", datas);
		} catch (CommonRunException e) {			
			logger.error("获取可布置的视频课程列表失败！");
			code = e.getCode();
			msg = e.getMessage();
		}
		
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	/**
	 * • 布置作业 
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/distributeTask",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject distributeTask(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		int code = 0;
		String msg = "布置的视频课程作业成功！";
		
		String openId = (String) request.getSession().getAttribute("openid");
		reqData.put("openId", openId);
		try {
			daulTaskService.distributeTask(reqData);			
		} catch (CommonRunException e) {			
			logger.error("布置的视频课程作业失败！");
			code = e.getCode();
			msg = e.getMessage();
		}
		
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	/**
	 * • 查询老师给当前学生布置的双师课程作业列表
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/getStuTaskList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getStuTaskList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		int code = 0;
		String msg = "获取视频课程作业成功！";
		
		try {
			List<JSONObject> datas = daulTaskService.getStuTaskList(reqData);
			result.put("data", datas);
		} catch (CommonRunException e) {			
			logger.error("获取视频课程作业失败！");
			code = e.getCode();
			msg = e.getMessage();
		}
		
		setReturnMsg(result, code, msg);		
		return result;
	}
	
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
