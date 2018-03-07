package com.wsz.utils;

import java.io.IOException;
import java.io.StringReader;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.wsz.test.EnterpriceToCustomer;



public class EnterpricePayXmlToBeanUtils {
	/** 
	* 解析企业支付申请 
	* 解析的时候自动去掉CDMA 
	* @param xml 
	*/ 
	@SuppressWarnings("unchecked") 
	public static EnterpriceToCustomer parseXmlToMapEnterpriceToCustomer(String xml){ 
			EnterpriceToCustomer enterpriceToCustomer = new EnterpriceToCustomer(); 
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
						System.out.println("key是："+element.getName()+"，值是："+element.getText()); 
						if("return_code".equals(element.getName())){ 
								enterpriceToCustomer.setReturn_code(element.getText()); 
							} 
					
						if("return_msg".equals(element.getName())){ 
								enterpriceToCustomer.setReturn_msg(element.getText()); 
							} 
						
						if("mchid".equals(element.getName())){ 
							enterpriceToCustomer.setMchid(element.getText()); 
						}
						
						if("nonce_str".equals(element.getName())){ 
							enterpriceToCustomer.setNonce_str(element.getText()); 
						}
						if("result_code".equals(element.getName())){ 
							enterpriceToCustomer.setResult_code(element.getText()); 
						}
						if("partner_trade_no".equals(element.getName())){ 
							enterpriceToCustomer.setPartner_trade_no(element.getText()); 
						}
						if("payment_no".equals(element.getName())){ 
							enterpriceToCustomer.setPayment_no(element.getText()); 
						}
						if("payment_time".equals(element.getName())){ 
							enterpriceToCustomer.setPayment_time(element.getText()); 
						}	
						//错误的编码
						/*
						   private String err_code;
						   private String err_code_des;
						 * */
						if("err_code".equals(element.getName())){ 
							enterpriceToCustomer.setErr_code(element.getText()); 
						}
						if("err_code_des".equals(element.getName())){ 
							enterpriceToCustomer.setErr_code_des(element.getText()); 
						}	
						
					}
				}
			} catch (JDOMException e) { 
			e.printStackTrace(); 
			} catch (IOException e) { 
			e.printStackTrace(); 
			}catch (Exception e) { 
			e.printStackTrace(); 
			} 
				
			return enterpriceToCustomer; 
		} 
}
