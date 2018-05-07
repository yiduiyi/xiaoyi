package com.xiaoyi.common.service.impl;

import java.io.IOException;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.stereotype.Service;
import org.xml.sax.InputSource;

import com.xiaoyi.common.vo.TextMessage;
import com.xiaoyi.custom.service.ICustomService;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.ISendTmpMsgFailedDao;
import com.xiaoyi.manager.dao.ITeacherPayListDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.SendTmpMsgFailed;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ILessonTradeSumDao;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.wechat.utils.UUIDUtil;
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
  
    @Resource
    ITeacherPayListDao payListDao;
    
    @Resource
    ILessonTradeSumDao tradeSumDao;
    
    @Resource IOrderSumDao orderSumDao;
    
    @Resource
    ISendTmpMsgFailedDao msgFailedDao;
    
    @Resource
    ILessonTradeDao lessonTradeDao;
    
    @Resource
    ICustomService customService;
    
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
			if(null!=reqDatas && reqDatas.size()>0){
				params.put("data", reqDatas);
			}
			
			
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
	public JSONObject payToTeacher(JSONObject params) {
			String lessonTradeId = params.getString("lessonTradeId");
			JSONObject result = new JSONObject();
			//1.0 拼凑企业支付需要的参数
			String appid = WeiXinConfig.APPID2;  //微信公众号的appid
			String mch_id = WeiXinConfig.mchId; //商户号
			String nonce_str = UUIDUtil.getUUID().substring(0, 32);/*"ryoMIHOmJxkmsuJ3Di2S22SgqyMLw21x";*///RandomStringGenerator.getRandomStringByLength(32); //生成随机数
			String partner_trade_no = UUIDUtil.getUUID().substring(0,32); /*"tydlg2c8PICxOlrnEZCqIALfVGAKHFoj";//RandomStringGenerator.getRandomStringByLength(32); //生成商户订单号
*/			String openid = params.getString("openId");/*"oVbXbw_Fz5o2-VHc5eIW5WY1JG70"; */// 支付给用户openid
			
			String check_name = "NO_CHECK"; //是否验证真实姓名呢
			String re_user_name = "老师";   //收款用户姓名
			float amount = 0f; 				//企业付款金额，单位为分
			String desc = "小易网络科技-老师课时费";   //企业付款操作说明信息。必填。
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
			//packageParams.put("amount",amount);            //企业付款金额，单位为分
			packageParams.put("desc",desc);    			   //企业付款操作说明信息。必填。
			packageParams.put("spbill_create_ip",spbill_create_ip); //调用接口的机器Ip地址
			
			//计算老师提现课时（价格）
			try {
				if(null!=lessonTradeId) {
					LessonTrade lessonTrade = null;
						synchronized(this){
						try {
							logger.info("查询课时交易【params】："+lessonTradeId);
							lessonTrade = lessonTradeDao.selectByPrimaryKey(lessonTradeId);
						
							logger.info("查询家长订单...");
							try {
								OrderSumKey key = new OrderSumKey();
								key.setMemberid(lessonTrade.getMemberid());
								key.setParentid(lessonTrade.getParentid());
								key.setLessontype(lessonTrade.getLessontype());
								
								OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
								if(null==orderSum){
									logger.info("没有找到对应的家长订单！");
									return null;
								}
								//判断家长课时是否满足提现课时
								logger.info("家长剩余课时："+orderSum.getLessonleftnum());
								logger.info("老师预提现课时："+lessonTrade.getApplylessons());
								if(orderSum.getLessonleftnum()<0){
									logger.info("家长课时不足！");
									result.put("code", -5);
									return result;
								}
							} catch (Exception e) {
								e.printStackTrace();
								logger.info("查询家长订单失败！");
								return null;
							}
						} catch (Exception e) {
							logger.info("查询可是交易出错！");
						}
						//家长确认成功 or 之前提现失败课时才能提现
						if(null==lessonTrade || 
								(lessonTrade.getStatus()!=2 && lessonTrade.getStatus()!=3)) {
							logger.info("不满足提现要求！");
							return null;
						}
						
						//提前设置提现失败
						try {
							logger.info("设置哨兵...");
							if(lessonTrade.getStatus()!=3){
								lessonTrade.setStatus((byte)3);
								lessonTradeDao.updateByPrimaryKeySelective(lessonTrade);
							}
						} catch (Exception e) {
							logger.info("哨兵设置失败！");
							e.printStackTrace();
							return null; 
						}
					}
					//设置提现金额
					logger.info("actual pay: "+lessonTrade.getActualPay());
					if(null==lessonTrade.getActualPay()){
						//amount = 0;
						return null;
					}
					amount = lessonTrade.getActualPay() * 100;//checkLessons*priceList.getReward();
					logger.info("final amount:"+(int)amount);
					packageParams.put("amount",String.valueOf((int)amount));						

				}else{
					return null;
				}
			} catch (Exception e) {
				logger.info("计算老师提现课时价格失败！");
				e.printStackTrace();
				logger.error(e.getMessage());
				
				return null;
			}
			
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
				result.put("weixinPost", weixinPost);
				parseXmlToMapEnterpriceToCustomer(weixinPost);
				return result;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
		return null;
	}

	/**
	 * 显示支付返回结果
	 * @param xml
	 */
	private void parseXmlToMapEnterpriceToCustomer(String xml){ 
		
		try { 
				StringReader read = new StringReader(xml); 
				// 创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入 
				InputSource source = new InputSource(read); 
				// 创建一个新的SAXBuilder 
				SAXBuilder sb = new SAXBuilder(); 
				// 通过输入源构造一个Document 
				Document doc; 
				doc = (Document) sb.build(source); 
			
				Element root = doc.getRootElement();// 指向根节点 
				List<Element> list = root.getChildren(); 
			
				if(list!=null&&list.size()>0){ 
				for (Element element : list) { 
					String text = "key是："+element.getName()+"，值是："+element.getText();
					logger.info(text);
					//System.out.println(text); 							
				}
			}
		} catch (JDOMException e) { 
		e.printStackTrace(); 
		} catch (IOException e) { 
		e.printStackTrace(); 
		}catch (Exception e) { 
		e.printStackTrace(); 
		} 
	} 
	
	
	private String jobDateStr = "";
	@Override
	public int sendQuarzMsg() {
		// TODO Auto-generated method stub
		logger.info("in quarz job...");
		
		synchronized (this) {
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
			if(jobDateStr.equals(sdf.format(d))){
				return 0;
			}
			jobDateStr = sdf.format(d);
			logger.info("current time:"+d);
		}
		
		int updatedColumns = 0;
		try {
			//更新最近5天消息的重复更新次数
			try {
				msgFailedDao.updateRepeatTimes();
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("更新提现repeatedTime失败！");
			}
			
			//查找repeatTimes大于等于5的记录
			List<SendTmpMsgFailed> msgFailedList = null;
			try {
				msgFailedList = msgFailedDao.selectByRepeatTimes();
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("查找大于5天的记录失败！");
			}
			
			//更新提现大于5天的lessonTrade提现记录状态
			if(CollectionUtils.isNotEmpty(msgFailedList)){
				final List<String> lessonTradeIds = new ArrayList<String>();
				final List<SendTmpMsgFailed> sendFailedMsgs = new ArrayList<SendTmpMsgFailed>();
				for(SendTmpMsgFailed msg : msgFailedList){
					if(5<=msg.getRepeatedTimes()){
						//后期需要优化（不能循环操作数据库）
						//五天后自动确认
						try {
							JSONObject reqParams =new JSONObject();
							reqParams.put("lessonTradeId", msg.getLessontradeid());
							reqParams.put("openId", msg.getOpenid());
							reqParams.put("feedback", "1");
							reqParams.put("notes", "5天后,系统默认好评！");
							
							customService.confirmTRecords(reqParams);
						} catch (Exception e) {
							logger.info("5天后自动确认订单失败！【lessonTradeId】:"+msg.getLessontradeid());
							e.printStackTrace();
						}					
					}else if(msg.getStatus()!=0) {
						sendFailedMsgs.add(msg);
					}
				}

				//重发失败记录
				if(CollectionUtils.isNotEmpty(sendFailedMsgs)){
					new Thread(new Runnable() {
						public void run() {
							//统计重发成功的消息（lessonTradeId）
							List<String> successMsgs = new ArrayList<String>();
							for(SendTmpMsgFailed msg : sendFailedMsgs){								
								try {								
									String result = sendTempletMsg(msg.getTempletId(), msg.getTargetUrl(), 
											msg.getOpenid(), JSONObject.parseObject(msg.getMsgContent()));
									if(StringUtils.isNotEmpty(result)){
										JSONObject jsonRS = JSONObject.parseObject(result);
										if(jsonRS.getInteger("errcode")!=null && 0==jsonRS.getInteger("errcode")){
											successMsgs.add(msg.getLessontradeid());
										}
									}								
								} catch (Exception e) {
									logger.info("转换json string 失败！");
									e.printStackTrace();
								}
								
								//5s 一条
								try {
									Thread.sleep(5000);
								} catch (InterruptedException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}
							
							//更改重传成功的消息发送状态
							if(CollectionUtils.isNotEmpty(sendFailedMsgs)){
								try {
									msgFailedDao.updateRepeatTimesByIds(lessonTradeIds);									
								} catch (Exception e) {
									logger.info("设置重传成功的消息状态失败！");
									e.printStackTrace();
								}
							}
						}						
					});
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("内部错误！");
		}

		return updatedColumns;
	}

	public int send(){
		return 0;
	}
}
