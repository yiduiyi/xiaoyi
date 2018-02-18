package com.xiaoyi.common.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/pay")
public class WechatPayAction {

	
	private static Logger logger = Logger.getLogger(WechatPayAction.class);
	
	@RequestMapping(value="/unifiedpay",method=RequestMethod.GET)
	@ResponseBody
	public  JSONObject getUserInfo(HttpServletRequest request
			,HttpServletResponse response) throws Exception{
		JSONObject result = new JSONObject();
		
    	String code = request.getParameter("code");
    	logger.info("code:"+request.getParameter("code"));
    	String UTF8 = "UTF-8";
        String reqBody = 
        		"<xml>"
        		+ "<body>测试商家-商品类目</body>"
        		+ "<trade_type>NATIVE</trade_type>"
        		+ "<mch_id>1493091612</mch_id>"
        		+ "<sign_type>HMAC-SHA256</sign_type>"
        		+ "<nonce_str>b1089cb0231011e7b7e1484520356fdc</nonce_str>"
        		+ "<detail />"
        		+ "<fee_type>CNY</fee_type>"
        		+ "<device_info>WEB</device_info>"
        		+ "<out_trade_no>20161909105959000000111108</out_trade_no>"
        		+ "<total_fee>1</total_fee>"
        		+ "<appid>wxd9579db73c42cf91</appid>"
        		+ "<notify_url>http://test.letiantian.com/wxpay/notify</notify_url>"
        		+ "<sign>78F24E555374B988277D18633BF2D4CA23A6EAF06FEE0CF1E50EA4EADEEC41A3</sign>"
        		+ "<spbill_create_ip>123.12.12.123</spbill_create_ip>"
        		+ "</xml>";
        URL httpUrl = new URL("https://14.215.140.116/pay/unifiedorder");
        HttpURLConnection httpURLConnection = (HttpURLConnection) httpUrl.openConnection();
        httpURLConnection.setRequestProperty("Host", "api.mch.weixin.qq.com");
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setConnectTimeout(10*1000);
        httpURLConnection.setReadTimeout(10*1000);
        httpURLConnection.connect();
        OutputStream outputStream = httpURLConnection.getOutputStream();
        outputStream.write(reqBody.getBytes(UTF8));

        //获取内容
        InputStream inputStream = httpURLConnection.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, UTF8));
        final StringBuffer stringBuffer = new StringBuffer();
        String line = null;
        while ((line = bufferedReader.readLine()) != null) {
            stringBuffer.append(line);
        }
        String resp = stringBuffer.toString();
        if (stringBuffer!=null) {
            try {
                bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (inputStream!=null) {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (outputStream!=null) {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        System.out.println(resp);
		return result;
    }
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
