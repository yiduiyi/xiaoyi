package com.xiaoyi.teacher.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
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
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.IH5PlateService;
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
			if(code==5){
				code = 4;
				msg = "密码错误！";
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
	
	/**
	 * @deprecated version1.0 (老提现接口)
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
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
			switch(rtCode){
			case -5:
				code = -1;
				msg = "家长课时不足！";
				break;
			case -3:
				msg = "系统内部错误, 请联系课程助理！";
				break;
			case -2:
				msg = "提现失败！需系统审核，请稍后重试！";
				break;
			case -1:
				msg = "请求参数错误！";
				break;
			case 0:
				default:
					msg = "提现成功！";
			}			
		} catch (Exception e) {
			code = -1;
			msg = "系统内部错误, 请联系课程助理！！";
			logger.error(msg);
		}

		setReturnMsg(result, code, msg);
		return result;
	}

	/**
	 * 金融版提现接口（version 2.0）
	 */
	@RequestMapping(value = "/withdrawBalance", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject withdrawBalance(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		//RtConstants rtCode = RtConstants.FAILED;
		int code = 1;
		String msg="提交成功,等待入账...";
		
		try {
			JSONObject reqParams = new JSONObject();			
			reqParams.put("openId", request.getSession().getAttribute("openid"));			
			reqParams.put("withdrawing", reqData.get("withdrawing"));
			
			int rtCode = h5PlateService.withdrawBalance(reqParams);		
			if(rtCode == -4){
				//说明钱已经提取，但没有更新数据库
				
			}
		} catch (Exception e) {
			CommonRunException commException = (CommonRunException)e;
			code = commException.getCode();
			msg = commException.getMessage();
			logger.error(msg);
		}

		setReturnMsg(result, code, msg);
		return result;
	}
	
	@RequestMapping(value = "/getBalancingAccount", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getBalancingAccount(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		//RtConstants rtCode = RtConstants.FAILED;
		int code = 1;
		String msg="获取账户余额失败！";
		
		try {
			JSONObject reqParams = new JSONObject();			
			reqParams.put("openId", request.getSession().getAttribute("openid"));			
			JSONObject data = h5PlateService.queryTeacherBalanceing(reqParams);
			//JSONObject data = h5PlateService.queryTeacherBalanceing(reqParams);
			
			result.put("data", data);
			code = 0;
			msg = "获取账户余额成功！";
		} catch (Exception e) {
			CommonRunException commException = (CommonRunException)e;
			code = commException.getCode();
			msg = commException.getMessage();
			logger.error(msg);
		}

		setReturnMsg(result, code, msg);
		return result;
	}
	
	/**
	 * ii.	查询老师绑定的家长-学生（未实现）
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getTeachingRelationships", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getTeachingRelationships(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();		
		int code = 1;
		String msg="获取任教关系失败！";
		
		try {
			JSONObject reqParams = new JSONObject();			
			reqParams.put("openId", request.getSession().getAttribute("openid"));			
			List<JSONObject> data = 
					h5PlateService.getTeachingRelationships(reqParams.getString("openId"));
			
			result.put("data", data);
			code = 0;
			msg = "获取账户余额成功！";
		} catch (Exception e) {
			CommonRunException commException = (CommonRunException)e;
			code = commException.getCode();
			msg = commException.getMessage();
			logger.error(msg);
		}

		setReturnMsg(result, code, msg);
		return result;
	}
	
	/**
	 * iii.	获取历史课时提交记录（未实现）
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getHistoryTeachingRecords", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getHistoryTeachingRecords(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();		
		int code = 1;
		String msg="获取任教关系失败！";
		
		try {			
			//verify parmaments
			logger.info("params:" + reqData.toJSONString());
			if(StringUtils.isEmpty(reqData.getString("queryMonth"))
					||StringUtils.isEmpty(reqData.getString("teachingId"))){
				msg = "参数错误！";
				code = -1;
				setReturnMsg(result, code, msg);
				return result;
			}
			List<JSONObject> data = h5PlateService.getHistoryTeachingRecords(reqData);
			//JSONObject data = h5PlateService.queryTeacherBalanceing(reqParams);
			
			result.put("data", data);
			code = 0;
			msg = "获取账户余额成功！";
		} catch (Exception e) {
			CommonRunException commException = (CommonRunException)e;
			code = commException.getCode();
			msg = commException.getMessage();
			logger.error(msg);
		}

		setReturnMsg(result, code, msg);
		return result;
	}
	
	/**
	 * iv.	提交课时记录（未实现）
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/submitTeachingRecord", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject submitTeachingRecord(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();		
		int code = 1;
		String msg="微信端提交课时记录失败！";
		
		try {
			JSONObject reqParams = new JSONObject();			
			reqParams.put("openId", request.getSession().getAttribute("openid"));			
			reqData.put("openId", reqParams.get("openId"));	//用于发送微信消息
			/*if(StringUtils.isEmpty(reqData.getString("openId"))){
				reqData.put("openId", "oknxW0lyknEETUK7k4qfC8BGvVA4");
			}*/
			h5PlateService.submitTeachingRecord(reqData);
			
			code = 0;
			msg = "微信端提交课时记录成功！";
		} catch (Exception e) {
			CommonRunException commException = (CommonRunException)e;
			code = commException.getCode();
			msg = commException.getMessage();
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
		    	WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.TEACHER_PLATE_APPID, WeiXinConfig.TEACHER_PLATE_SECRET_KEY , code);
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
	/**
	 * 获取教师可任教科目
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getTeacherGootAt",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getTeacherGootAt(HttpServletRequest request,HttpServletResponse response) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			List<JSONObject> data = h5PlateService.getTeacherGootAt(openId);
			if(CollectionUtils.isNotEmpty(data)) {
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 修改教师可任教项目
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/updateTeacherGootAt",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateTeacherGootAt(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			reqData.put("openId", openId);
			if(h5PlateService.updateTeacherGootAt(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 添加教师接单设置
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/insertTeacherBillSet",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertTeacherBillSet(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			reqData.put("openId", openId);
			if(h5PlateService.insertTeacherBillSet(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 添加投递记录
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/insertBillRecord", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertBillRecord(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			reqData.put("openId", openId);
			if(h5PlateService.insertBillRecord(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 查询适合我的订单接口
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getSuitBillLis" , method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getSuitBillList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			reqData.put("openId", openId);
			List<JSONObject> data = h5PlateService.getSuitBillList(reqData);
			if(CollectionUtils.isNotEmpty(data)) {
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 查询所有订单接口
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getAllBillList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAllBillList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			reqData.put("openId", openId);
			List<JSONObject> data = h5PlateService.getAllBillList(reqData);
			if(CollectionUtils.isNotEmpty(data)) {
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	/**
	 * 查询所有投递的订单面试状态
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getMyBillRecord",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMyBillRecord(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String openId = (String) request.getSession().getAttribute("openid");
		logger.info("openId:" + openId);
		
		if (null == openId) {
			openId = setSessionOpenId(request);
		}
		try {
			reqData.put("openId", openId);
			List<JSONObject> data = h5PlateService.getMyBillRecord(reqData);
			if(CollectionUtils.isNotEmpty(data)) {
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	@RequestMapping(value = "/getAllSendBillList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAllSendBillList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = h5PlateService.getAllSendBillList(reqData);
			if(CollectionUtils.isNotEmpty(data)) {
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	//
	
	private JSONObject setReturnMsg(JSONObject result, int code, String rtString) {
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
