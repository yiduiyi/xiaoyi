package com.xiaoyi.common.service.impl;

import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xiaoyi.common.vo.TextMessage;
import com.xiaoyi.wechat.utils.WeiXinConfig;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.ClientCustomSSL;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.SignUtils;
import com.xiaoyi.common.utils.WXPayUtil;
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

	@Override
	public String payToTeacher() {
			
			//1.0 拼凑企业支付需要的参数
			String appid = WeiXinConfig.APPID;  //微信公众号的appid
			String mch_id = WeiXinConfig.mchId; //商户号
			String nonce_str = "ryoMIHOmJxkmsuJ3Di2S22SgqyMLw21x";//RandomStringGenerator.getRandomStringByLength(32); //生成随机数
			String partner_trade_no =  "tydlg2c8PICxOlrnEZCqIALfVGAKHFoj";//RandomStringGenerator.getRandomStringByLength(32); //生成商户订单号
			String openid = "oVbXbw_Fz5o2-VHc5eIW5WY1JG70"; // 支付给用户openid
			
			String check_name = "NO_CHECK"; //是否验证真实姓名呢
			String re_user_name = "小郑";   //收款用户姓名
			String amount = "100"; 				//企业付款金额，单位为分
			String desc = "测试开发";   //企业付款操作说明信息。必填。
			String spbill_create_ip = "192.168.1.3";		//
			
			//2.0 生成map集合
			SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>(); 
			packageParams.put("mch_appid", appid);         //微信公众号的appid
			packageParams.put("mchid", mch_id);       //商务号
			packageParams.put("nonce_str",nonce_str);  //随机生成后数字，保证安全性
			
			packageParams.put("partner_trade_no",partner_trade_no); //生成商户订单号
			packageParams.put("openid",openid);            // 支付给用户openid
			packageParams.put("check_name",check_name);    //是否验证真实姓名呢
			packageParams.put("re_user_name",re_user_name);//收款用户姓名
			packageParams.put("amount",amount);            //企业付款金额，单位为分
			packageParams.put("desc",desc);    			   //企业付款操作说明信息。必填。
			packageParams.put("spbill_create_ip",spbill_create_ip); //调用接口的机器Ip地址
			

			//3.0 生成自己的签名
			String sign  = SignUtils.creatSign("utf-8",packageParams);
			
			//4.0 封装退款对象
			packageParams.put("sign", sign);
			
			//5.0将当前的map结合转化成xml格式
			String reuqestXml = WXPayUtil.getRequestXml(packageParams);
			
			//6.0获取需要发送的url地址
			String wxUrl = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers"; //获取退款的api接口
			
			try {
				String weixinPost = ClientCustomSSL.doRefund(wxUrl, reuqestXml).toString();
				return weixinPost;
				//7.0 解析返回的xml数据
				//EnterpriceToCustomer refundResult = EnterpricePayXmlToBeanUtils.parseXmlToMapEnterpriceToCustomer(weixinPost);
				/*if("SUCCESS".equalsIgnoreCase(refundResult.getResult_code()) && "SUCCESS".equalsIgnoreCase(refundResult.getReturn_code())){
					//8表示退款成功
					//TODO 执行成功付款后的业务逻辑
					//return successPayMoneyByBankCard(submitMoney,cmms_amt,enterpriceToCustomerByCard,applyId,companyId);
				}else{
					//9 表示退款失败
					//TODO 调用service的方法 ，存储失败提现的记录咯
					//failToPayMoneyByBankCard(enterpriceToCustomerByCard,applyId);	
					
				}*/
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
		return null;
	}

}
