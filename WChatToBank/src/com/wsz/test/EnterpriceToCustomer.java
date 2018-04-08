package com.wsz.test;

import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.junit.Test;

//import com.fh.controller.app.nrb.bargain.wxconfig;
import com.wsz.config.WChatInfo;
import com.wsz.utils.ClientCustomSSL;
import com.wsz.utils.EnterpricePayXmlToBeanUtils;
import com.wsz.utils.SignUtils;

/**
 * 企业付款到用户的测试类
 * @author bobo
 *
 */
public class EnterpriceToCustomer {
	
	@Test
	public void OldBook(){
		//1.0 拼凑企业支付需要的参数
		String appid = WChatInfo.APPID2;  //微信公众号的appid
		String mch_id = WChatInfo.MCH_ID; //商户号
		String nonce_str = "ryoMIHOmJxkmsuJ3Di2S22SgqyMLw211";//RandomStringGenerator.getRandomStringByLength(32); //生成随机数
		String partner_trade_no =  "tydlg2c8PICxOlrnEZCqIALfVGAKHFo1";//RandomStringGenerator.getRandomStringByLength(32); //生成商户订单号
		String openid = "oQHVE00HAWuiDqD8zQb1Zun4cfxo"/*"oVbXbw_Fz5o2-VHc5eIW5WY1JG70"*/; // 支付给用户openid
		
		String check_name = "NO_CHECK"; //是否验证真实姓名呢
		String re_user_name = "小邓";   //收款用户姓名
		String amount = "100"; 				//企业付款金额，单位为分
		String desc = "测试开发【老师提现】";   //企业付款操作说明信息。必填。
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
		String reuqestXml = com.wsz.utils.WXPayUtil.getRequestXml(packageParams);
		
		//6.0获取需要发送的url地址
		String wxUrl = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers"; //获取退款的api接口
		
		try {
			String weixinPost = ClientCustomSSL.doRefund(wxUrl, reuqestXml).toString();
			//7.0 解析返回的xml数据
			EnterpriceToCustomer refundResult = EnterpricePayXmlToBeanUtils.parseXmlToMapEnterpriceToCustomer(weixinPost);
			if("SUCCESS".equalsIgnoreCase(refundResult.getResult_code()) && "SUCCESS".equalsIgnoreCase(refundResult.getReturn_code())){
				//8表示退款成功
				//TODO 执行成功付款后的业务逻辑
				//return successPayMoneyByBankCard(submitMoney,cmms_amt,enterpriceToCustomerByCard,applyId,companyId);
			}else{
				//9 表示退款失败
				//TODO 调用service的方法 ，存储失败提现的记录咯
				//failToPayMoneyByBankCard(enterpriceToCustomerByCard,applyId);	
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private String getReturn_code() {
		// TODO Auto-generated method stub
		return null;
	}

	private String getResult_code() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setReturn_msg(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setReturn_code(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setMchid(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setErr_code_des(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setErr_code(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setPayment_time(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setPayment_no(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setPartner_trade_no(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setResult_code(String text) {
		// TODO Auto-generated method stub
		
	}

	public void setNonce_str(String text) {
		// TODO Auto-generated method stub
		
	}
	

}




		