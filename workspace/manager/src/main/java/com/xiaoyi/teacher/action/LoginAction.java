package com.xiaoyi.teacher.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.service.ILoginService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.LoginConstants;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/teacher/identity")
public class LoginAction {
	
	@Resource
	private ILoginService loginService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject showTRecords(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		User loginUser = new User();
		loginUser.setPassword(reqData.getString("password"));
		loginUser.setUsername(reqData.getString("userName"));
		
		try {			
			loginUser = loginService.userIdentify(loginUser);
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		//登录成功,添加user至session并设置session时间
		if(loginUser!=null){
			rtCode = RtConstants.SUCCESS;
			request.getSession().setAttribute("userBean", loginUser); 			
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject logout(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		String userName = reqData.getString("userName");
		
		HttpSession session = request.getSession();
		//设置session回话过期，更新用户登录状态
		if(null!=session){
			User user = (User) session.getAttribute("userBean");
			
			if(user.getUsername()==null 
					|| !user.getUsername().equals(userName)){
				LoginConstants loginStatus = LoginConstants.INVALIDE_USERNAME;
				setReturnMsg(result, loginStatus.getCode(), loginStatus.toString());
			}
			if(null!=user){
				user.setLoginstatus(false);
				if(0<=loginService.userLogout(user)){
					rtCode = RtConstants.SUCCESS;
				}
			}
			
			session.removeAttribute("userBean");
			session.invalidate();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
