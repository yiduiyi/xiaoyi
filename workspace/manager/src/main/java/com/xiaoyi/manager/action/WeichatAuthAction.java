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
	
	//授权&重定向1（老师提现推送给家长确认）
	@RequestMapping("/authWithUrl")
	public void authWithUrl(HttpServletRequest req,
			 HttpServletResponse res )  {
		log.info("In authWithUrl");
		log.info("teachingId:"+req.getParameter("teachingId"));
		//log.info("query String:"+req.getQueryString());
		//log.info("others:"+req.getPathInfo()+"\n"+req.getParameterNames()+"\n"+req.getRequestURI()+"\n"+req.getMethod());
		try {
			req.setCharacterEncoding("utf-8");
			req.setCharacterEncoding("utf-8");
		    String code = req.getParameter("code");
		    log.info("code:"+code);
	        if (code!=null && !"authdeny".equals(code)){
	        	log.info("authing...");
	        	WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(WeiXinConfig.APPID, WeiXinConfig.SECRET , code);
	            String openid = weixinOauth2Token.getOpenId();
	            req.getSession().setAttribute("openid", openid);
	            log.error("openid====>" + openid);
	            
	            StringBuffer reqUrl = new StringBuffer();
	            reqUrl.append(req.getContextPath());
	            reqUrl.append("/#/studyreport");
	            if(null!=req.getParameter("teachingId")){
	            	reqUrl.append("?teachingId");
	            	reqUrl.append(req.getParameter("teachingId"));
	            }
	            
	            //定向到课时确认界面
	            res.sendRedirect(reqUrl.toString());
	        } else{
	        	log.info("redirect failed!");
	        }
	      
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
	              res.sendRedirect( req.getContextPath() + "/wechat/index.html");
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
	              res.sendRedirect( req.getContextPath() + "/wechat/index.html#/personCenter");
	        } 
	      
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}