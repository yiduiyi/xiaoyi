package com.wsz.test;

import java.util.SortedMap;
import java.util.TreeMap;

import com.wsz.config.WChatInfo;
import com.wsz.utils.GetPublicKey;
import com.wsz.utils.GetRSA;
import com.wsz.utils.HttpClientCustomSSL;
import com.wsz.utils.SignUtils;
import com.wsz.utils.StringUtils;
import com.wsz.utils.XMLUtils;

public class TestWChatToBank {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String source ="邓志华";
		String pank = "6217003810011541821";
		//注意 这里的  publicKeyPKCS8  是上一步获取微信支付公钥后经openssl 转化成PKCS8格式的公钥
		String publicKeyPKCS8 = new GetPublicKey().getPublicKey();
		String enc_true_name =GetRSA.getRSA(source,publicKeyPKCS8);
		String enc_bank_no = GetRSA.getRSA(pank,publicKeyPKCS8);
	    String bank_code = "1003";
	    String amount = "100";
	    String desc ="测试";
	    String partner_trade_no = "20171124331gang2333311";
	  
	    String nonce_str1 =  StringUtils.getStrRandom(28);
	    
	    //获取签名
	    SortedMap<Object,Object> parameters1 = new TreeMap<Object,Object>();
		parameters1.put("mch_id", WChatInfo.MCH_ID);
		parameters1.put("partner_trade_no", partner_trade_no);
		parameters1.put("nonce_str", nonce_str1);
		parameters1.put("enc_bank_no", enc_bank_no);
		parameters1.put("enc_true_name", enc_true_name);
		parameters1.put("bank_code", bank_code);
		parameters1.put("amount", amount);
		parameters1.put("desc", desc);
		String sign1 = SignUtils.creatSign(WChatInfo.CHARSET, parameters1);
		//请求企业付款
		 TreeMap<String, String> tmap1 = new TreeMap<String, String>();
		 tmap1.put("mch_id", WChatInfo.MCH_ID);
		 tmap1.put("partner_trade_no", partner_trade_no);
		 tmap1.put("nonce_str", nonce_str1);
		 tmap1.put("enc_bank_no", enc_bank_no);
		 tmap1.put("enc_true_name", enc_true_name);
		 tmap1.put("bank_code", bank_code);
		 tmap1.put("amount", amount);
		 tmap1.put("desc", desc);
		 tmap1.put("sign", sign1);
		String xml2 = XMLUtils.getRequestXml(tmap1);
	
				String  xml3= HttpClientCustomSSL.httpClientResultPANK(xml2);
				System.out.println(xml3);
			
		
	}

}
