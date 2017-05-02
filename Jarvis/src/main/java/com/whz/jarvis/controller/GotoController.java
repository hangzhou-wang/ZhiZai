package com.whz.jarvis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 配置跳转
 * @author Joe
 *
 * 2017年4月28日
 */
@Controller
public class GotoController {
	//跳转到Jarvis学说话页面
	@RequestMapping("/goto/toLearn")
	public String toLearn(){
		return "teach";
	}
	//跳转到聊天页面
	@RequestMapping("/goto/toTalk")
	public String toTalk(){
		return "talk";
	}
	//跳转到登录页面
	@RequestMapping("/goto/login")
	public String toLogin(){
		return "login";
	}
}
