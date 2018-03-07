package com.wsz.utils;
/**
 * rsa加密
 * @author 王士忠
 * @date 2017年11月27日
 * */
public class GetRSA {  
 /**
  * @param publicKeyPKCS8  为pkcs8格式的公钥
  * */
   public static String getRSA(String str,String publicKeyPKCS8) throws Exception {  
       byte[] cipherData=RSAEncrypt.encrypt(RSAEncrypt.loadPublicKeyByStr(publicKeyPKCS8),str.getBytes());  
       String cipher=Base64.encode(cipherData);  
       return cipher;
         
   }  
}  