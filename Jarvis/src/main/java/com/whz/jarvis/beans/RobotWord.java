package com.whz.jarvis.beans;

/**
 * Jarvis
 * @author Joe
 *
 * 2017年4月26日
 */
public class RobotWord {
	private String code;	//编码
	private String word; //机器人的回话
	private String datetime;	//记录日期

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

}
