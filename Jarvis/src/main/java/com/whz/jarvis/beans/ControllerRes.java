package com.whz.jarvis.beans;

/**
 * 用于Controller 返回JSON格式数据
 * 
 * @author Joe
 *
 *         2017年5月2日
 */
public class ControllerRes {
	private Integer code; //编码
	private String message; //消息

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
