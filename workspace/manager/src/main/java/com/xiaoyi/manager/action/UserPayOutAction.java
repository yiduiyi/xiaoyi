package com.xiaoyi.manager.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.manager.dao.ILessonTypeDao;
import com.xiaoyi.manager.domain.LessonType;
import com.xiaoyi.manager.domain.LessonTypeKey;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.wechat.utils.MD5Util;
import com.xiaoyi.wechat.utils.WeiXinConfig;

import net.sf.json.xml.XMLSerializer;

/**
 * @author Administrator
 * @version 创建时间：2018年2月25日 上午10:09:52 客户支付给公司
 */

@Controller
@RequestMapping("/interface")
public class UserPayOutAction {
	
	@Resource 
	ILessonTypeDao lessonTypeDao;
	
	@Resource
	private IOrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserPayOutAction.class);	
	
	@RequestMapping("/payout")
	@ResponseBody
	public JSONObject payout(@RequestBody JSONObject request, HttpServletRequest req, 
			HttpServletResponse res) throws Exception {
		
		JSONObject response = new JSONObject();
		String ip = WeiXinConfig.getIp(req);

		String openid = (String) req.getSession().getAttribute("openid");
		String uuid = request.getString("uuid");
		String telphone = request.getString("telphone");
		String courseType = request.getString("lessonType");
		String parentName = request.getString("parentName");
		String stuName = request.getString("studentName");
		//Integer purchaseNum = request.getInteger("purchaseNum");
		String lessonId = request.getString("lessonId");
		Integer hasBook = request.getInteger("hasBook");
		
		JSONObject attach = new JSONObject();
		JSONObject body = new JSONObject();
		if(StringUtils.isEmpty(stuName)) {
			attach.put("studentName", "未登记");
		}
		body.put("studentName", stuName);
		//attach.put("studentName", stuName);
		//attach.put("parentName", parentName);
		body.put("parentName", parentName);
		
		attach.put("lessonType", courseType);
		attach.put("hasBook", hasBook);
		attach.put("telNum", telphone);
		
		JSONObject parm = new JSONObject();
		parm.put("uuid", uuid);
		Float amount=null;
		try {
			//查询价格
			LessonTypeKey lessonTypeKey = new LessonTypeKey();
			//lessonTypeKey.setCoursecnt(request.getShort("courseCnt"));
			lessonTypeKey.setLessonId(lessonId);
			lessonTypeKey.setLessontype(request.getInteger("lessonType"));
			
			LessonType lessonType = lessonTypeDao.selectByPrimaryKey(lessonTypeKey);
			
			if(null!=lessonType) {
				attach.put("purchaseNum", lessonType.getCoursecnt());
				if(lessonType.getIsholiday()==0) {
					amount=lessonType.getDiscountprice()*100;
				}else {
					amount=lessonType.getLessonprice()*100;
				}
			}
			
			if(hasBook!=null && hasBook.intValue()==1) {
				amount += 50*100;
			}
		} catch (Exception e) {
			e.printStackTrace();
			setPromptMessage(response, "-1", "查询课程失败价格！");
			throw e;
		}
		//commonDataService.equals(obj)
		//JSONObject object = baseinforService.selectCourse(parm);
		logger.error("ip ==" + ip);
		logger.error("openid ==" + openid);
		//Double amount = object.getDouble("discountPrice") * 100;
		logger.info("付款数额："+amount.intValue());
		Integer amounts = amount.intValue();
		//amounts = amount.intValue();
		String nonceStr = RandomStringUtils.random(32, "5K8264ILTKCH16CQ2502SI8ZNMTM67VS");
		parm = new JSONObject();
		parm.put("name", "weixin");
		//JSONObject orders = baseinforService.updateWeixinNextOrder(parm);
		String order = UUID.randomUUID().toString().replace("-", "");//"00000000000000000000" + orders.getString("current");


		SortedMap<String, String> parameters = new TreeMap<String, String>();

		parameters.put("appid", WeiXinConfig.APPID);
		parameters.put("mch_id", WeiXinConfig.mchId);
		parameters.put("sign_type", WeiXinConfig.signType);
		parameters.put("nonce_str", nonceStr);
		//parameters.put("body", "\u6613\u5bf9\u6613\u7f51\u7edc\u7f34\u8d39");// 易对易网络缴费
		parameters.put("out_trade_no", order);// 订单号
		parameters.put("total_fee", amounts + "");// 总金额单位为分
		parameters.put("spbill_create_ip", ip);
		parameters.put("attach", attach.toJSONString());
		parameters.put("body", body.toJSONString());
		
		//到账通知地址
		parameters.put("notify_url", "http://test.yduiy.com.cn/xiaoyi/interface/notice.do");
		parameters.put("trade_type", WeiXinConfig.tradeType);
		parameters.put("openid", openid);
		String sign = WeiXinConfig.createSign("UTF-8", parameters);
		parameters.put("sign", sign);

		String requestXML = WeiXinConfig.getRequestXml(parameters);
		logger.error("requestXML ==" + requestXML);
		String returl = HttpClient.httpPost("https://api.mch.weixin.qq.com/pay/unifiedorder", requestXML,
			"html/xml");
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
		return response;
	}
	
	@RequestMapping("/notice")
	@ResponseBody
	public void notice(HttpServletRequest req,@RequestBody String returl,
			 HttpServletResponse res) {
		//JSONObject response = new JSONObject();
		 logger.error("returl==>" + returl);
		 XMLSerializer xmlSerializer=new XMLSerializer();
		 net.sf.json.JSONObject jsonObject =(net.sf.json.JSONObject) xmlSerializer.read(returl);
		 SortedMap<String, String> parameters = new TreeMap<String, String>();
		 Iterator<String> it = jsonObject.keys();
		 String key = null;
		  while(it.hasNext()){ 
			  key =   it.next();
			  if ("sign".equals(key)) {
				 continue;
			  }
			  parameters.put(key,  jsonObject.getString(key));
           }  
		 String sign = createSign(parameters);
		 if (sign.equals(jsonObject.getString("sign"))) {
			 logger.error("验证==>" + sign);
			 JSONObject parm = new JSONObject(); 
			 parm.put("openId", jsonObject.getString("openid"));
			 parm.put("orderNum", jsonObject.getString("out_trade_no"));
			 parm.put("status", 1l);
			 net.sf.json.JSONObject attach = jsonObject.getJSONObject("attach");
			 net.sf.json.JSONObject body = jsonObject.getJSONObject("body");
			 
			 parm.put("studentName", body.get("studentName"));
			 parm.put("parentName", body.get("parentName"));
			 parm.put("lessonType", attach.get("lessonType"));
			 parm.put("purchaseNum", attach.get("purchaseNum"));
			 parm.put("hasBook", attach.get("hasBook"));
			 parm.put("orderType", 2);	//家长支付
			 parm.put("telNum", attach.get("telNum"));
			 
			 try {
				orderService.addOrder(parm);
				parameters.put("return_code", "SUCCESS");
				parameters.put("return_msg", "OK");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				parameters.put("return_code", "FAILED");
				parameters.put("return_msg", "充值失败,请联系管理员！");

			}
  		     //busiService.updateNoticeArrival(parm); 
		 }
		
		 PrintWriter writer;
		try {
			writer = res.getWriter();
			 writer.write(getRequestXml(parameters));
			 writer.flush();
			 writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	 public static String getRequestXml(SortedMap<String, String> parameters) {
		   StringBuffer sb = new StringBuffer();
		   sb.append("<xml>");
		   Set es = parameters.entrySet();
		   Iterator it = es.iterator();
		   while (it.hasNext()) {
		   Map.Entry entry = (Map.Entry) it.next();
		   String k = (String) entry.getKey();
		   String v = (String) entry.getValue();
		      sb.append("<" + k + "><![CDATA[" + v + "]]></" + k + ">");
		   }
		   sb.append("</xml>");
		   return sb.toString();
	 }
	 
	 
	 public static String createSign(SortedMap<String, String> parameters) {
		 
		   StringBuffer sb = new StringBuffer();
		   Set es = parameters.entrySet();
		   Iterator it = es.iterator();
		   while (it.hasNext()) {
			   Map.Entry entry = (Map.Entry) it.next();
			   String k = (String) entry.getKey();
			   Object v = entry.getValue();
			   if (null != v && !"".equals(v) ) {
			      sb.append(k + "=" + v + "&");
			   }
		   }
		    sb.append("key=" + WeiXinConfig.KEY);
		    String sign = MD5Util.getMD5String(sb.toString()).toUpperCase();
	 
		   return sign;
	 }

	protected void setPromptMessage(JSONObject object, String code, String message) {
		object.put("code", code);
		object.put("msg", message);
	}

}
