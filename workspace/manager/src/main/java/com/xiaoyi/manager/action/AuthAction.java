package com.xiaoyi.manager.action;

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
import com.xiaoyi.manager.utils.constant.ResponseConstants.LoginConstants;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 1.	鐢ㄦ埛鐧诲綍
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/identify")
public class AuthAction {
	
	@Resource
	private ILoginService loginService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject login(HttpServletRequest request
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
		
		//鐧诲綍鎴愬姛,娣诲姞user鑷硈ession骞惰缃畇ession鏃堕棿
		if(loginUser!=null){
			rtCode = RtConstants.SUCCESS;
			request.getSession().setAttribute("userBean", loginUser); 			
		
			JSONObject data = new JSONObject();			
			data.put("user", loginUser);
			
			result.put("data", data);
		}
			
		setReturnMsg(result, rtCode);		
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
		//璁剧疆session鍥炶瘽杩囨湡锛屾洿鏂扮敤鎴风櫥褰曠姸鎬�
		if(null!=session){
			User user = (User) session.getAttribute("userBean");
			
			if(user.getUsername()==null 
					|| !user.getUsername().equals(userName)){
				LoginConstants loginStatus = LoginConstants.INVALIDE_USERNAME;
				//setReturnMsg(result, LoginConstants)
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
		
		setReturnMsg(result, rtCode);
		return result;
	}
	
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}
