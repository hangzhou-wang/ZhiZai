package com.whz.jarvis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GotoController {
	@RequestMapping("/goto/toLearn")
	public String toLearn(){
		return "teach";
	}
	@RequestMapping("/goto/toTalk")
	public String toTalk(){
		return "talk";
	}
}
