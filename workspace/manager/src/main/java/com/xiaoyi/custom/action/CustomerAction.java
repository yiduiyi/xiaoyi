package com.xiaoyi.custom.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
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

	@RequestMapping(value = "/getTransactionCourses", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getTransactionCourses(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqDate) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openid = (String) request.getSession().getAttribute("openid");
		logger.info("获取课时交易记录-openId:" + openid);
		/*
		 * if(logger.isDebugEnabled()) { openid="oVbXbw_Fz5o2-VHc5eIW5WY1JG70";
		 * }
		 */
		try {
			result.put("data", customService.queryTransactionCourses(openid));
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	@RequestMapping(value = "/commitSchedule", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject commitSchedule(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openid = (String) request.getSession().getAttribute("openid");
		logger.info("提交预约-openId:" + openid);
		if (null == openid) { // 从其他界面直接跳转的
			logger.info("查询openId：");
			request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String code = request.getParameter("code");
			if (code != null && !"authdeny".equals(code)) {
				WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID,
						WeiXinConfig.SECRET, code);
				openid = weixinOauth2Token.getOpenId();
				request.getSession().setAttribute("openid", openid);
				logger.info("预约模块-查找 openid====>" + openid);
			}
		}
		/*
		 * if(logger.isDebugEnabled()) { openid="oVbXbw_Fz5o2-VHc5eIW5WY1JG70";
		 * reqData.put("openid",openid); }
		 */
		try {
			// result.put("data",
			// customService.queryTransactionCourses(openid));
			reqData.put("openId", openid);
			customService.commitSchedule(reqData);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	@RequestMapping(value = "/getMySchedules", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMySchedules(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqDate) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openid = (String) request.getSession().getAttribute("openid");
		logger.info("预约模块-openId:" + openid);
		/*
		 * if(logger.isDebugEnabled()) { openid="oVbXbw_Fz5o2-VHc5eIW5WY1JG70";
		 * }
		 */
		try {
			result.put("data", customService.getMySchedules(openid));

			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	@RequestMapping(value = "/confirmTRecords", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject confirmTRecords(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqDate) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		//RtConstants rtCode = RtConstants.FAILED;
		int resultCode = -1;
		String msg = "确认失败！";
		String lessonTradeId = reqDate.getString("lessonTradeId");

		String openid = (String) request.getSession().getAttribute("openid");
		logger.info("确认订单-openId:" + openid);
		if (null == openid) { // 从其他界面直接跳转的
			logger.info("查询openId：");
			request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String code = request.getParameter("code");
			if (code != null && !"authdeny".equals(code)) {
				WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID,
						WeiXinConfig.SECRET, code);
				openid = weixinOauth2Token.getOpenId();
				request.getSession().setAttribute("openid", openid);
				logger.info("确认订单模块-查找 openid====>" + openid);
			}
		}
		try {
			if (null != lessonTradeId) {
				JSONObject reqParams = new JSONObject();
				reqParams.put("lessonTradeId", lessonTradeId);
				reqParams.put("openId", openid);
				reqParams.put("feedback", reqDate.get("feedback"));
				reqParams.put("notes", reqDate.get("notes"));
				logger.info(
						"in confirmTRecords:feedback=" + reqDate.get("feedback") + ",notes:" + reqDate.get("notes"));
				
				resultCode = customService.confirmTRecords(reqParams);
				if (0 == resultCode) {
					switch (resultCode) {
					case 0:
						msg="确认成功！";
						break;
					case -1:
						msg="确认失败,参数错误！";
						break;
					case -2:
						msg="确认失败,获取家长身份失败！";
						break;
					case -3:
						msg="确认失败,已确认过订单！";
						break;
					default:
						break;
					}					
					logger.info(msg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("内部错误,确认失败！");
		}

		setReturnMsg(result, resultCode, msg);
		return result;
	}

	// 获取学情报告
	@RequestMapping(value = "/getStuTeachingReport", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getStuTeachingReport(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String teachingId = reqData.getString("teachingId");
		logger.info("teachingId:" + teachingId);

		Integer queryMonth = reqData.getInteger("month");
		logger.info("queryMonth:" + queryMonth);
		
		logger.info("lessonTradeId:"+reqData.getString("lessonTradeId"));

		//获取openId
		String openid = (String) request.getSession().getAttribute("openid");
		logger.info("获取学情报告-openId:" + openid);
		if (null == openid && reqData.getString("lessonTradeId")==null) { // 从其他界面直接跳转的
			logger.info("查询openId：");
			request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String code = request.getParameter("code");
			if (code != null && !"authdeny".equals(code)) {
				WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID,
						WeiXinConfig.SECRET, code);
				openid = weixinOauth2Token.getOpenId();
				request.getSession().setAttribute("openid", openid);
				logger.info("确认订单模块-查找 openid====>" + openid);
							
				reqData.put("openId", openid);
			}
		}
		
		try {
			reqData.put("openId", "oVbXbw_Fz5o2-VHc5eIW5WY1JG70");
			List<JSONObject> data = customService.queryStuTeachingReport(reqData);
			if (null != data) {
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
			// result.put("data", customService.getMySchedules(openid));
		} catch (Exception e) {
			e.printStackTrace();
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	// 提交投诉
	@RequestMapping(value = "/submitComplaint", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject submitComplaint(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;

		try {
			int insertColumns = customService.insertComplains(reqData);
			if (insertColumns > 0) {
				rtCode = RtConstants.SUCCESS;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}

	// 查询家长欠费详单
	@RequestMapping(value = "/getArrearageDetail", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getArrearageDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		//RtConstants rtCode = RtConstants.FAILED;
		int code = -1;
		String msg = "查询家长欠费课时详情失败！";
		try {
			JSONObject data = customService.getDebt(reqData);
			if(null != data){
				code = 0;
				msg = "查询成功！";
			}
			result.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}

		setReturnMsg(result, code, msg);
		return result;
	}
	
	//
	private JSONObject setReturnMsg(JSONObject result, int code, String rtString) {
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
