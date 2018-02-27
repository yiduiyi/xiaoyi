package com.xiaoyi.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaoyi.wechat.utils.AdvancedUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;
import com.xiaoyi.wechat.utils.WeixinOauth2Token;
 

@Controller
@RequestMapping("/interface")
public class WeichatAuthAction{
 
	private Logger log =Logger.getLogger(this.getClass().getName());
	@RequestMapping("/getAuth")
	public void getAuth(HttpServletRequest req,
			 HttpServletResponse res )  {
		 
		try {
			req.setCharacterEncoding("utf-8");
			req.setCharacterEncoding("utf-8");
		    String code = req.getParameter("code");
	        if (code!=null && !"authdeny".equals(code)){
	        	  WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID, WeiXinConfig.SECRET , code);
	              String openid = weixinOauth2Token.getOpenId();
	              req.getSession().setAttribute("openid", openid);
	              log.error("openid====>" + openid);
	              res.sendRedirect( req.getContextPath() + "/weichat/index.html");
	        } 
	      
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/getAuth2")
	public void getAuth2(HttpServletRequest req,
			 HttpServletResponse res )  {
		 
		try {
			req.setCharacterEncoding("utf-8");
			req.setCharacterEncoding("utf-8");
		    String code = req.getParameter("code");
	        if (code!=null && !"authdeny".equals(code)){
	        	  WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID, WeiXinConfig.SECRET , code);
	              String openid = weixinOauth2Token.getOpenId();
	              req.getSession().setAttribute("openid", openid);
	              log.error("openid====>" + openid);
	              res.sendRedirect( req.getContextPath() + "/weichat/index.html#/personCenter");
	        } 
	      
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
