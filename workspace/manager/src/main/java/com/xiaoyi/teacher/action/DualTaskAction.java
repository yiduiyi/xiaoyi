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
			result.put("data", datas);
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
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
