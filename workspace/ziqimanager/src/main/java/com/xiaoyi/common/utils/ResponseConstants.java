package com.xiaoyi.common.utils;
/**
 * 2017-12-21
 * @author dengzhihua
 *
 */
public class ResponseConstants {
	
	public enum LoginConstants{
		SUCCESS(0),	
		FAILED(-1),	
		INVALIDE_USERNAME(-2);
		
		private int rtCode;
		private LoginConstants(int code){
			this.rtCode = code;
		}
		
		public int getCode() {
			return rtCode;
		}
		
		@Override
		public String toString(){
			switch(rtCode){
			case 0:
				return "登录成功！";
			case -1:
				return "登录失败！";
			case -2:
				return "【用户名】参数不正确！";
			}
			return "";
		}
	}
	public enum LogOutConstants{
		SUCCESS(0),	
		FAILED(-1),	
		INVALIDE_USERNAME(-2),
		ALREADY_LOGOUT(-3);
		
		private int rtCode;
		private LogOutConstants(int code){
			this.rtCode = code;
		}
		
		public int getCode() {
			return rtCode;
		}
		
		@Override
		public String toString(){
			switch(rtCode){
			case 0:
				return "退出成功！";
			case -1:
				return "退出失败！";
			case -2:
				return "【用户名】参数不正确！";
			case -3:
				return "改用户已退出";
			}
			return "";
		}
	}
	
	public enum RtConstants{
		SUCCESS(0),			
		FAILED(1),
		ERROR(-1);			
		
		private int rtCode;
		private RtConstants(int code){
			this.rtCode = code;
		}
		
		public int getCode(){
			return rtCode;
		}
		@Override
		public String toString(){
			switch(rtCode){
			case 0:
				return "操作成功！";
			case 1:
				return "操作失败！";
			case -1:
				return "内部错误！";
			}
			return "";
		}
	}
	
	//session回话常量
	public enum SessionConstants {
		MAX_INTERACTIVE_INTERVAL (10*60);	
			
		private int status;	//0:正常已登录,-1:已登出
		
		private SessionConstants(int status) {
			this.status = status;
		}
		
		@Override
		public String toString(){
			
			return String.valueOf(status);			
		}
	}
	
	public enum HttpConstants{
		NETWORK_UNREACHABLE (503),
		SERVICE_NOT_FOUND(404);
		private int status;
		
		private HttpConstants(int status){
			this.status = status;
		}	
		
		@Override
		public String toString(){
			
			return String.valueOf(status);			
		}
	}
		
}
