package com.xiaoyi.common.action;

import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.WXConstants;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/wechat")
public class WechatIdentityAction {
	
	@Resource
	private IWechatService wechatService;
	
	private static Logger logger = Logger.getLogger(WechatIdentityAction.class);
	
	@RequestMapping(value="/getUserInfo",method=RequestMethod.GET)
	@ResponseBody
	public  JSONObject getUserInfo(HttpServletRequest request
			,HttpServletResponse response) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
    	String code = request.getParameter("code");
    	logger.info("code:"+request.getParameter("code"));
    	try {
    		logger.info("params:{code:"+code+"}");
			String accessToken = HttpClient.httpGetRequest(getTokenRequest(code));
			
			logger.info("result:"+accessToken);
			try {
				JSONObject userInfo = (JSONObject)JSONObject.parse(accessToken) ;
				logger.info("userInfo:"+userInfo);				
				
				String user = HttpClient.httpGetRequest(getUserRequest(userInfo.getString("access_token"), userInfo.getString("openid")));
				user = new String(user.getBytes("ISO-8859-1"),"UTF-8");
				logger.info("user:"+user);
				JSONObject userMap = (JSONObject)JSONObject.parse(user);
				
				//获取成功->保存入库
				if(userMap != null && !userMap.containsKey("errcode")){
					
				}
				return userMap;
			} catch (Exception e) {
				logger.error("获取用户信息出错！");
				throw e;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}

    public static String  GetTokenRequest = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APP_SECRET&code=CODE&grant_type=authorization_code";
    public static String  GetUserRequest = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
    
    public static String getTokenRequest(String code){
        String result = null;
        result  = GetTokenRequest.replace("APPID", urlEnodeUTF8(WXConstants.APPID));
        result  = result.replace("APP_SECRET",urlEnodeUTF8(WXConstants.APP_SECRET));
        result = result.replace("CODE", urlEnodeUTF8(code));
        return result;
    }
    public static String getUserRequest(String accessToken, String openId){
        String result = null;
        result  = GetUserRequest.replace("ACCESS_TOKEN", urlEnodeUTF8(accessToken));
        result = result.replace("OPENID", urlEnodeUTF8(openId));
        return result;
    }
    
    public static String urlEnodeUTF8(String str){
        String result = str;
        try {
            result = URLEncoder.encode(str,"UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
