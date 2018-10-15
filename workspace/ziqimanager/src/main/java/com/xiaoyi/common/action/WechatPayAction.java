package com.xiaoyi.common.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyStore;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ResponseConstants.RtConstants;
import com.xiaoyi.common.utils.XMLUtil;
import com.xiaoyi.common.vo.Transfers;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Controller
@RequestMapping("/pay")
public class WechatPayAction {

	private XMLUtil xmlUtil;  
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
	

	@RequestMapping("/checkout")
	@ResponseBody
	public JSONObject payout(@RequestBody JSONObject request, HttpServletRequest req, 
			HttpServletResponse res) throws Exception {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.ERROR;
		String openId = (String)req.getSession().getAttribute("openid");
		/*if(logger.isDebugEnabled()) {
			openId = "";
		}*/
		try {			
			redPackets(null, openId);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			logger.info("Exception Info:"+e.getMessage());
			//logger.error(e.printStackTrace());
		}		
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());
		return result;
	}
	
	private void redPackets(Integer withdrawId, String openId) throws Exception {  
        int total=100;  
        int amount = (int) (total*100);  
          
        Transfers transfers=new Transfers();  
        String nonce = UUID.randomUUID().toString().substring(0, 30);  
          
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");  
        String time = df.format(new Date());  
        Random ne=new Random();  
        int guid=ne.nextInt(9999-1000+1)+1000;  
          
        transfers.setMch_appid(WeiXinConfig.APPID);// 自己的公众账号  
        transfers.setMchid(WeiXinConfig.mchId);//自己的 商户号  
        transfers.setNonce_str(nonce);// 随机字符串  
        transfers.setOpenid(openId);// 用户openId  
        transfers.setCheck_name("NO_CHECK");// 校验用户姓名选项  
        transfers.setAmount(amount);// 付款金额  
        transfers.setDesc("微信企业付款");// 企业付款描述信息  
        transfers.setSpbill_create_ip("120.236.82.202");// 调用接口的机器Ip地址  
        transfers.setPartner_trade_no(WeiXinConfig.mchId+time+guid);// 商户订单号  
        String sign = createSendRedPackOrderSign(transfers);  
        transfers.setSign(sign);// 签名  
          
        xmlUtil.xstream().alias("xml", transfers.getClass());  
        String xml = xmlUtil.xstream().toXML(transfers);  
          
        String sendEedPackUrl="https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";  
        String response = ssl(sendEedPackUrl,xml);  
        Map<String, String> responseMap = xmlUtil.parseXml(response);  
          
        String return_msg = responseMap.get("return_msg");  
        System.out.println(return_msg);  
    } 
	
	private String createSendRedPackOrderSign(Transfers transfers){  
        
        StringBuffer sign = new StringBuffer();  
        sign.append("mch_appid=").append(transfers.getMch_appid());  
        sign.append("&mchid=").append(transfers.getMchid());  
        sign.append("&nonce_str=").append(transfers.getNonce_str());  
        sign.append("&partner_trade_no=").append(transfers.getPartner_trade_no());  
        sign.append("&openid=").append(transfers.getOpenid());  
        sign.append("&check_name=").append(transfers.getCheck_name());  
        sign.append("&amount=").append(transfers.getAmount());  
        sign.append("&desc=").append(transfers.getDesc());  
        sign.append("&spbill_create_ip=").append(transfers.getSpbill_create_ip());  
        sign.append("&key=").append(WeiXinConfig.KEY);  
         
        return  DigestUtils.md5Hex(sign.toString()).toUpperCase();  
    }  
	
	private String ssl(String url,String data){
        StringBuffer message = new StringBuffer();
        try {
            KeyStore keyStore  = KeyStore.getInstance("PKCS12");
            FileInputStream instream = new FileInputStream(new File("D:/cert/apiclient_cert.p12"));
            keyStore.load(instream, WeiXinConfig.mchId.toCharArray());
            // Trust own CA and all self-signed certs
            SSLContext sslcontext = SSLContexts.custom()
                    .loadKeyMaterial(keyStore, WeiXinConfig.mchId.toCharArray())
                    .build();
            // Allow TLSv1 protocol only
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
                    sslcontext,
                    new String[] { "TLSv1" },
                    null,
                    SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
            CloseableHttpClient httpclient = HttpClients.custom()
                    .setSSLSocketFactory(sslsf)
                    .build();
            HttpPost httpost = new HttpPost(url);

            httpost.addHeader("Connection", "keep-alive");
            httpost.addHeader("Accept", "*/*");
            httpost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            httpost.addHeader("Host", "api.mch.weixin.qq.com");
            httpost.addHeader("X-Requested-With", "XMLHttpRequest");
            httpost.addHeader("Cache-Control", "max-age=0");
            httpost.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
            httpost.setEntity(new StringEntity(data, "UTF-8"));
            //System.out.println("executing request" + httpost.getRequestLine());

            CloseableHttpResponse response = httpclient.execute(httpost);
            try {
                HttpEntity entity = response.getEntity();

                //System.out.println("----------------------------------------");
                //System.out.println(response.getStatusLine());
                if (entity != null) {
                    //System.out.println("Response content length: " + entity.getContentLength());
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent(),"UTF-8"));
                    String text;
                    while ((text = bufferedReader.readLine()) != null) {
                        message.append(text);
                    }
                }
                EntityUtils.consume(entity);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                response.close();
            }
        } catch (Exception e1) {
            e1.printStackTrace();
        } 

        return message.toString();
    }
	
	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
