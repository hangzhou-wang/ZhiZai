package com.whz.jarvis.model;

import java.util.Date;

/**
 * 用户类
 * @author Joe
 *
 * 2017年4月27日
 */
public class JarvisUser {
	private Integer id;	//编号
	private String name;	//用户名
	private String password;	//密码
	private Date  registerDate;	 	//注册日期
	private String phone;	//电话
	private String address;  //地址
	private String hobbies;  //爱好

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public JarvisUser(String name, String password, String phone) {
		super();
		this.name = name;
		this.password = password;
		this.phone = phone;
	}

	public JarvisUser() {
		super();
	}
}
