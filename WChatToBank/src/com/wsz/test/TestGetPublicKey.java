package com.wsz.test;

import com.wsz.utils.GetPublicKey;
/**
 * 获取的公钥需要转化后才能使用
 * */
public class TestGetPublicKey {

	public static void main(String [] age) throws Exception{
		//这里的公钥是PKCS1的 java是没法直接使用的需要用openssl进行转化
		System.out.println(new GetPublicKey().getPublicKey());
	}
}
