package com.xiaoyi.manager.action;

import java.util.Date;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.wechat.utils.UUIDUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;

import net.sf.json.xml.XMLSerializer;

/**
 * @author Administrator
 * @version 创建时间：2018年2月25日 上午10:09:52 客户支付给公司
 */

@Controller
@RequestMapping("/interface")
public class UserPayOutAction {

	private static final Logger logger = LoggerFactory.getLogger(UserPayOutAction.class);

	@RequestMapping("/payout")
	@ResponseBody
	public JSONObject payout(@RequestBody JSONObject request, HttpServletRequest req, HttpServletResponse res) throws Exception {

		JSONObject response = new JSONObject();
		String ip = WeiXinConfig.getIp(req);

		String openid = (String) req.getSession().getAttribute("openid");
		String uuid = request.getString("uuid");
		String telphone = request.getString("telphone") + "";
		String courseType = request.getString("courseType") + "";
		String payName = request.getString("payName") + "";
		JSONObject parm = new JSONObject();
		parm.put("uuid", uuid);
		//JSONObject object = baseinforService.selectCourse(parm);
		logger.error("ip ==" + ip);
		logger.error("openid ==" + openid);
		//Double amount = object.getDouble("discountPrice") * 100;
		//Integer amounts = amount.intValue();
		String nonceStr = RandomStringUtils.random(32, "5K8264ILTKCH16CQ2502SI8ZNMTM67VS");
		parm = new JSONObject();
		parm.put("name", "weixin");
/*		JSONObject orders = baseinforService.updateWeixinNextOrder(parm);
		String order = "00000000000000000000" + orders.getString("current");
		order = order.substring(order.length() - 20, order.length());

		parm.put("amount", object.getDouble("discountPrice"));
		parm.put("orderNum", order);
		parm.put("openId", openid);
		parm.put("status", 0);
		parm.put("courseType", courseType);
		parm.put("orderType", courseType);
		parm.put("cnt", object.getIntValue("courseCnt"));
		parm.put("payName", payName);
		parm.put("telphone", telphone);
		parm.put("transactionType", 1);
		parm.put("transDate", new Date());
		parm.put("uuid", UUIDUtil.getUUID());
		busiService.insertTransDetail(parm);

		JSONObject customer = baseinforService.selectCustomer(parm);
		if (customer == null) {
			JSONObject cusObj = new JSONObject();
			cusObj.put("uuid", UUIDUtil.getUUID());
			cusObj.put("openId", openid);
			cusObj.put("signDate", new Date());
			cusObj.put("telphone", telphone);
			cusObj.put("weixin", "");
			cusObj.put("isOrder", 1);
			cusObj.put("sumClass", object.getIntValue("courseCnt"));
			cusObj.put("sumAmount", object.getDouble("discountPrice"));

			baseinforService.insertCustomer(cusObj);
		}*/

		SortedMap<String, String> parameters = new TreeMap<String, String>();

		parameters.put("appid", WeiXinConfig.APPID);
		parameters.put("mch_id", WeiXinConfig.mchId);
		parameters.put("sign_type", WeiXinConfig.signType);
		parameters.put("nonce_str", nonceStr);
		parameters.put("body", "\u6613\u5bf9\u6613\u7f51\u7edc\u7f34\u8d39");// 易对易网络缴费
		//parameters.put("out_trade_no", order);// 订单号
		//parameters.put("total_fee", amounts + "");// 总金额单位为分
		parameters.put("spbill_create_ip", ip);
		
		//到账通知地址
		parameters.put("notify_url", "http://www.yduiy.com.cn/o2oApp/interface/notice.do");
		parameters.put("trade_type", WeiXinConfig.tradeType);
		parameters.put("openid", openid);
		String sign = WeiXinConfig.createSign("UTF-8", parameters);
		parameters.put("sign", sign);

		String requestXML = WeiXinConfig.getRequestXml(parameters);
		logger.error("requestXML ==" + requestXML);
		String returl = HttpClient.sendPost(requestXML);//postDataService.httpPost("https://api.mch.weixin.qq.com/pay/unifiedorder", requestXML,
				//"html/xml");
		logger.error("returl ==" + returl);
		XMLSerializer xmlSerializer = new XMLSerializer();
		net.sf.json.JSONObject jsonObject = (net.sf.json.JSONObject) xmlSerializer.read(returl);
		String prepay_id = jsonObject.getString("prepay_id");
		String timeStamp = System.currentTimeMillis() + "";
		nonceStr = RandomStringUtils.random(32, "5K8264ILTKCH16CQ2502SI8ZNMTM67VS"); // 8位随机数
		String packages = prepay_id;
		parameters = new TreeMap<String, String>();
		parameters.put("appId", WeiXinConfig.APPID);
		parameters.put("timeStamp", timeStamp);
		parameters.put("nonceStr", nonceStr);
		parameters.put("package", "prepay_id=" + packages);
		parameters.put("signType", WeiXinConfig.signType);
		sign = WeiXinConfig.createSign("UTF-8", parameters);

		response.put("appId", WeiXinConfig.APPID);
		response.put("timeStamp", timeStamp);
		response.put("nonceStr", nonceStr);
		response.put("packages", "prepay_id=" + packages);
		response.put("signType", "MD5");
		response.put("paySign", sign);
		setPromptMessage(response, "0", "查询成功");
/*		JSONObject realOrdr = busiService.selectRealOrder(parm);
		if (realOrdr == null) {
			parm = new JSONObject();
			parm.put("uuid", UUIDUtil.getUUID());
			parm.put("openId", openid);
			parm.put("orderDate", new Date());
			parm.put("orderType", "on");
			parm.put("grade", object.getString("grade"));
			parm.put("subject", "");
			parm.put("studentName", payName + "");
			parm.put("telphone", telphone + "");
			parm.put("weixin", "");
			parm.put("teachingTime", 0l);
			parm.put("usedTime", 0l);
			parm.put("balanceDate", new Date());
			parm.put("voided", 1l);
			parm.put("ip", ip);
			busiService.insertRealOrder(parm);

			parm = new JSONObject();
			parm.put("uuid", UUIDUtil.getUUID());
			parm.put("openId", openid);
			parm.put("orderDate", new Date());
			parm.put("orderType", "of");
			parm.put("grade", object.getString("grade"));
			parm.put("subject", "");
			parm.put("studentName", payName + "");
			parm.put("telphone", telphone + "");
			parm.put("weixin", "");
			parm.put("teachingTime", 0l);
			parm.put("usedTime", 0l);
			parm.put("balanceDate", new Date());
			parm.put("voided", 1l);
			parm.put("ip", ip);
			busiService.insertRealOrder(parm);

		}*/
		setPromptMessage(response, "1", "成功");
		return response;

	}

	protected void setPromptMessage(JSONObject object, String code, String message) {
		object.put("code", code);
		object.put("msg", message);
	}

}
