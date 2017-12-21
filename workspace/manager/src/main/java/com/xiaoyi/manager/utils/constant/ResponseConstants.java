package com.xiaoyi.manager.utils.constant;
/**
 * 2017-12-21
 * @author dengzhihua
 *
 */
public class ResponseConstants {
	
	public enum RtConstants{
		SUCCESS(0),			
		ERROR(-1);			
		
		private int rtCode;
		private RtConstants(int code){
			this.rtCode = code;
		}
		
		@Override
		public String toString(){
			switch(rtCode){
			case 0:
				return "操作成功！";
			case -1:
				return "操作失败！";
			}
			return null;
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
