package com.xiaoyi.common.exception;

public class CommonRunException extends RuntimeException {
	private static final long serialVersionUID = -8907204699933231194L;
	
	private int code = 0;
	
	public CommonRunException(int code) {
		super();
		this.code = code;
		// TODO Auto-generated constructor stub
	}

	public CommonRunException(int code, String message, Throwable cause) {
		super(message, cause);
		this.code = code;
		// TODO Auto-generated constructor stub
	}

	public CommonRunException(int code, String message) {
		super(message);
		this.code = code;
		// TODO Auto-generated constructor stub
	}

	public CommonRunException(int code, Throwable cause) {
		super(cause);
		this.code = code;
		// TODO Auto-generated constructor stub
	}
	
	public int getCode(){
		return code;
	}
}
