package com.xiaoyi.common.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.SHA1;
import com.xiaoyi.common.utils.WXConstants;


@SuppressWarnings("serial")
public class WechatCallbackApi extends HttpServlet {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 自定义 token
    private String TOKEN = "xiaoyiVerifyToken";
    
    public static String  GetTokenRequest = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APP_SECRET&code=CODE&grant_type=authorization_code";
    public static String  GetUserRequest = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
    
    public static String getTokenRequest(String code){
        String result = null;
        GetTokenRequest  = GetTokenRequest.replace("APPID", urlEnodeUTF8(WXConstants.APPID));
        GetTokenRequest  = GetTokenRequest.replace("APP_SECRET",urlEnodeUTF8(WXConstants.APP_SECRET));
        GetTokenRequest = GetTokenRequest.replace("CODE", urlEnodeUTF8(code));
        result = GetTokenRequest;
        return result;
    }
    public static String getUserRequest(String accessToken, String openId){
        String result = null;
        GetUserRequest  = GetUserRequest.replace("ACCESS_TOKEN", urlEnodeUTF8(accessToken));
        GetUserRequest = GetUserRequest.replace("OPENID", urlEnodeUTF8(openId));
        result = GetTokenRequest;
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
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String code = request.getParameter("code");
    	try {
    		logger.info("params:{code:"+code+"}");
			String accessToken = HttpClient.httpGetRequest(getTokenRequest(code));
			
			logger.info("result:"+accessToken);
			try {
				JSONObject userInfo = (JSONObject)JSONObject.parse(accessToken) ;
				
				String user = HttpClient.httpGetRequest(getUserRequest(userInfo.getString("access_token"), userInfo.getString("openid")));
				logger.info("userInfo:"+userInfo);				
				
				response.getWriter().print(user);
			} catch (Exception e) {
				logger.error("获取用户信息出错！");
				throw e;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	/* // 微信加密签名
        String signature = request.getParameter("signature");
        // 随机字符串
        String echostr = request.getParameter("echostr");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        logger.info("sort params:{signature:"+signature+"\nechostr:"+echostr+"\ntimestamp:"+timestamp+"}");
        logger.info("code:"+request.getParameter("code"));
        
        String[] str = { TOKEN, timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest =SHA1.encode(bigStr);//.getDigestOfString(bigStr.getBytes()).toLowerCase();

        // 确认请求来至微信
        if (digest.equals(signature)) {
            response.getWriter().print(echostr);
        }*/
    }
    
    
}