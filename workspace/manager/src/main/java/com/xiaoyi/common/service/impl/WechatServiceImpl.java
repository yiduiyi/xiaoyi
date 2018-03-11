package com.xiaoyi.common.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xiaoyi.common.vo.TextMessage;
import com.xiaoyi.wechat.utils.WeiXinConfig;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.WechatMessageUtil;


@Service("wechatService")
public class WechatServiceImpl implements IWechatService {
    private static Logger logger = Logger.getLogger(WechatServiceImpl.class);

    public String processRequest(HttpServletRequest request) {
        Map<String, String> map = WechatMessageUtil.xmlToMap(request);
        logger.info(map);
        // 发送方帐号（一个OpenID）
        String fromUserName = map.get("FromUserName");
        // 开发者微信号
        String toUserName = map.get("ToUserName");
        // 消息类型
        String msgType = map.get("MsgType");
        // 默认回复一个"success"
        String responseMessage = "success";
        // 对消息进行处理
        if (WechatMessageUtil.MESSAGE_TEXT.equals(msgType)) {// 文本消息
            TextMessage textMessage = new TextMessage();
            textMessage.setMsgType(WechatMessageUtil.MESSAGE_TEXT);
            textMessage.setToUserName(fromUserName);
            textMessage.setFromUserName(toUserName);
            textMessage.setCreateTime(System.currentTimeMillis());
            textMessage.setContent("我已经受到你发来的消息了");
            responseMessage = WechatMessageUtil.textMessageToXml(textMessage);
        }
        logger.info(responseMessage);
        return responseMessage;

    }

	@Override
	public String sendTempletMsg(String templetId,String redirect_url,String openId,JSONObject reqDatas) {
		try{
			JSONObject params = new JSONObject();
			params.put("touser", openId);
			params.put("template_id", templetId);
			
			StringBuffer url = new StringBuffer();
			url.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=");
			url.append(WeiXinConfig.APPID);
			
			url.append("&redirect_uri=");
			url.append(redirect_url);
			
			url.append("&response_type=code&scope=snsapi_base&state=123#wechat_redirect");
			params.put("url", url.toString());
			
			params.put("data", reqDatas);
			
			
			String result = null;
			try{
				String rtString = HttpClient.httpGetRequest("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxd9579db73c42cf91&secret=2e50c7d680e6fc3efe5fc0cdf81568fd");
				JSONObject p = JSONObject.parseObject(rtString);
				String access_token = p.getString("access_token");
				result = HttpClient.httpPost("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+access_token, 
						params.toJSONString(),
						"application/json");
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}

}
