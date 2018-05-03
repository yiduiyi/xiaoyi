package com.xiaoyi.teacher.action;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.XMLUtil;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.IH5PlateService;
import com.xiaoyi.teacher.service.IPrivateDomainService;
import com.xiaoyi.teacher.service.ITeachingRecordService;
import com.xiaoyi.wechat.utils.AdvancedUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;
import com.xiaoyi.wechat.utils.WeixinOauth2Token;

@CrossOrigin
@Controller
@RequestMapping("/teacher/h5")
public class H5PlateAction {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private IH5PlateService h5PlateService;

	@Autowired
	ITeachingRecordService tRecordService;

	@RequestMapping(value = "/getBindStatus", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getBindStatus(HttpServletRequest request,
			HttpServletResponse response/*
										 * ,
										 * 
										 * @RequestBody JSONObject reqData
										 */) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}

		try {
			if (StringUtils.isNotEmpty(openId)) {
				int status = h5PlateService.queryBindStatus(openId);
				JSONObject data = new JSONObject();
				data.put("status", status);
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			logger.error("获取老师账号绑定状态失败！");
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	@RequestMapping(value = "/bindWechat", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject bindWechat(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		//RtConstants rtCode = RtConstants.FAILED;
		int code =0;
		String msg = "";
		
		try {
			String openId = (String) request.getSession().getAttribute("openid");
			logger.info("openId:" + openId);
			
			if (null == openId) {
				openId = setSessionOpenId(request);
			}
			reqData.put("openId", openId);
			
			code = h5PlateService.bindWechat(reqData);
			if(code==2){
				code =1;
				msg = "教师信息未录入,请联系课程顾问!";
				logger.error("数据库没有匹配的用户");
			}
			if(code==3){
				code =2;
				msg = "账号已被绑定,请联系课程顾问!";
				logger.error("当前老师已绑定！");
			}
			if(code==4){
				code =3;
				msg = "请先前往讲师PC端登录签约!";
				logger.error("该老师未签约！");
			}
			
			if (code == 0) {
				msg = RtConstants.SUCCESS.toString();
			}
		} catch (Exception e) {
			logger.error("绑定老师账号失败！");
		}

		setReturnMsg(result, code, msg);
		return result;
	}

	@RequestMapping(value = "/getAvailableLessons", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAvailableLessons(HttpServletRequest request,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;

		String openId = (String) request.getSession().getAttribute("openid");
		try {
			//String teacherId = request.getParameter("teacherId");// reqData.getString("teacherId");
			logger.info("query openId：" + openId);
			if (StringUtils.isNotEmpty(openId)) {
				result.put("data", h5PlateService.getAvailableLessons(openId));
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			logger.error("查询可用提现课时失败！");
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	@RequestMapping(value = "/withdrawLessons", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject withdrawLessons(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		//RtConstants rtCode = RtConstants.FAILED;
		int code = 1;
		String msg="提交成功,等待入账...";
		
		String lessonTradeId = reqData.getString("lessonTradeId");
		try {
			JSONObject reqParams = new JSONObject();
			reqParams.put("lessonTradeId", lessonTradeId);
			reqParams.put("openId", request.getSession().getAttribute("openid"));
			
			logger.info("in withdraw lessons action...");
			logger.info("lessonTradeId:"+lessonTradeId);

			int rtCode = h5PlateService.withdrawLessons(reqParams);
			if (0 < rtCode) {
				code = 0;
			}
			if(rtCode==0){
				code = -1;
				msg = "不满足提现条件！";
			}
			if(-5==rtCode){
				code = -1;
				msg = "家长课时不足！";
			}
		} catch (Exception e) {
			code = -1;
			msg = "老师提现失败！";
			logger.error(msg);
		}

		setReturnMsg(result, code, msg);
		return result;
	}

	/**
	 * 获取用户openId
	 * @param req
	 */
	private String setSessionOpenId(HttpServletRequest req){
		logger.info("In common get openId method...");
		try {
			req.setCharacterEncoding("utf-8");
			req.setCharacterEncoding("utf-8");
		    String code = req.getParameter("code");
		    logger.info("code[in common]:"+code);
		    if (code!=null && !"authdeny".equals(code)){
	        	logger.info("authing..."); 
		    	WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID2, WeiXinConfig.SECRET_KEY2 , code);
	            String openid = weixinOauth2Token.getOpenId();
	            req.getSession().setAttribute("openid", openid);
	            logger.error("openid====>" + openid);
	              //res.sendRedirect( req.getContextPath() + "/wechat/index.html#/drawings");
	            return openid;
		    } 	      
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private JSONObject setReturnMsg(JSONObject result, int code, String rtString) {
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
