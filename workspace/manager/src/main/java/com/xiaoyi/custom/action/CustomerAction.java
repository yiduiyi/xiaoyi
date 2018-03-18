package com.xiaoyi.custom.action;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.XMLUtil;
import com.xiaoyi.custom.service.ICustomService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.wechat.utils.AdvancedUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;
import com.xiaoyi.wechat.utils.WeixinOauth2Token;

@Controller
@RequestMapping("/custom")
public class CustomerAction {

	@Autowired
	ICustomService customService;
	
	private static Logger logger = Logger.getLogger(CustomerAction.class);
	
	@RequestMapping(value="/getTransactionCourses",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getUserInfo(HttpServletRequest request
			,HttpServletResponse response,@RequestBody JSONObject reqDate) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openid = (String) request.getSession().getAttribute("openid");
    	logger.info("获取课时交易记录-openId:"+openid);
		/*if(logger.isDebugEnabled()) {
			openid="oVbXbw_Fz5o2-VHc5eIW5WY1JG70";
		}*/
    	try {
    		result.put("data", customService.queryTransactionCourses(openid));
    		rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}

	@RequestMapping(value="/commitSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject commitSchedule(HttpServletRequest request
			,HttpServletResponse response,@RequestBody JSONObject reqData) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openid = (String) request.getSession().getAttribute("openid");
    	logger.info("提交预约-openId:"+openid);
		if(null==openid) {	//从其他界面直接跳转的
			logger.info("查询openId：");
			request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
		    String code = request.getParameter("code");
	        if (code!=null && !"authdeny".equals(code)){
	        	  WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID, WeiXinConfig.SECRET , code);
	              openid = weixinOauth2Token.getOpenId();
	              request.getSession().setAttribute("openid", openid);
	              logger.info("预约模块-查找 openid====>" + openid);	             
	        } 	      		
		}
    	/*if(logger.isDebugEnabled()) {
			openid="oVbXbw_Fz5o2-VHc5eIW5WY1JG70";
			reqData.put("openid",openid);
		}*/
    	try {
    		//result.put("data", customService.queryTransactionCourses(openid));
    		reqData.put("openId", openid);
    		customService.commitSchedule(reqData);
    		rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	@RequestMapping(value="/getMySchedules",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getMySchedules(HttpServletRequest request
			,HttpServletResponse response,@RequestBody JSONObject reqDate) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openid = (String) request.getSession().getAttribute("openid");
    	logger.info("预约模块-openId:"+openid);
		/*if(logger.isDebugEnabled()) {
			openid="oVbXbw_Fz5o2-VHc5eIW5WY1JG70";
		}*/
    	try {
    		result.put("data", customService.getMySchedules(openid));
    		
    		rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	@RequestMapping(value="/confirmTRecords",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject confirmTRecords(HttpServletRequest request
			,HttpServletResponse response,@RequestBody JSONObject reqDate) 
					throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String lessonTradeId = reqDate.getString("lessonTradeId");
		
		String openid = (String) request.getSession().getAttribute("openid");
    	logger.info("确认订单-openId:"+openid);
    	if(null==openid) {	//从其他界面直接跳转的
			logger.info("查询openId：");
			request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
		    String code = request.getParameter("code");
	        if (code!=null && !"authdeny".equals(code)){
	        	  WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID, WeiXinConfig.SECRET , code);
	              openid = weixinOauth2Token.getOpenId();
	              request.getSession().setAttribute("openid", openid);
	              logger.info("确认订单模块-查找 openid====>" + openid);	             
	        } 	      		
		}
    	try {
    		if(null!=lessonTradeId) {
    			JSONObject reqParams = new JSONObject();
    			reqParams.put("lessonTradeId", lessonTradeId);
    			reqParams.put("openId",openid);
    			LessonTrade lessonTrade = customService.confirmTRecords(reqParams); 
    			if(null != lessonTrade) {
    				rtCode = RtConstants.SUCCESS;
    				logger.info("家长确认成功！");
    			}
    		}    		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	//获取学情报告
	@RequestMapping(value="/getStuTeachingReport",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getStuTeachingReport(HttpServletRequest request
			,HttpServletResponse response,@RequestBody JSONObject reqData) 
					throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String teachingId = reqData.getString("teachingId");
		logger.info("teachingId:"+teachingId);
		
		//String openid = (String) request.getSession().getAttribute("openid");
    	//logger.info("获取学情报告-openId:"+openid);
    	
    	try {
    		if(null!=teachingId) {
    			JSONObject data = customService.queryStuTeachingReport(reqData);
    			if(null!=data){
    				result.put("data", data);
    				rtCode = RtConstants.SUCCESS;
    			}
    		}
    		//result.put("data", customService.getMySchedules(openid));    		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	//
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
