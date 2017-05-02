package com.whz.jarvis.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whz.jarvis.beans.RobotWord;
/**
 * 第一个版本的回答方式
 * @author Joe
 *没有牵扯到数据库，一问一答的方式
 * 2017年4月28日
 */
@Controller
public class IndexController {
	private static final Logger log = Logger.getLogger(IndexController.class);
	// 自定义回复的话
	private static final String[] SAY_HI = { "你好", "hi", "hello", "在吗", "嗯" };
	private static final String[] WORDS_WHO = { "你是谁", "你叫什么", "介绍一下自己", "你多大了" };
	private static final String[] DO_SOMETHING = { "唱歌", "跳舞", "乐器" };

	/**
	 * 响应前台对话
	 * @param yourWord 接收用户输入的问题
	 * @return 返回Jarvis的对话
	 */
	@RequestMapping("/robot/talk")
	public @ResponseBody RobotWord talk(String yourWord) {
		RobotWord word = new RobotWord();
		if (yourWord.length() == 0 || "".equals(yourWord) || yourWord == null) {
			word.setCode("noAnswer");
			word.setWord("什么也不说是什么意思，我不懂……");
			word.setDatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
			log.info("你说的话------>" + yourWord + ";Jarvis的回话------->" + word.getWord()+ ";时间------>"
					+ word.getDatetime());
		} else if (isNumeric(yourWord)) {	//判断用户输入是否为数字
			word.setCode("SeeNumber");
			int nextNum = Integer.parseInt(yourWord) + 1;
			word.setWord("数数吗？这个我会^_^,下一个是：" + nextNum + "  该你了！");
			word.setDatetime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
			log.info("你说的话------>" + yourWord + ";Jarvis的回话------->" + word.getWord() + ";时间------>"
					+ word.getDatetime());
		} else {
			for (String whoanI : WORDS_WHO) {
				if (yourWord.contains(whoanI)) {
					word.setCode("WHOAMI");
					word.setWord("哈哈^_^,你好！我叫Jarvis,中文名字叫芝仔。");
					word.setDatetime(
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
					log.info("你说的话------>" + yourWord + ";Jarvis的回话------->" + word.getWord() + ";时间------>"
							+ word.getDatetime());
				}
			}
			for (String dosomething : DO_SOMETHING) {
				if (yourWord.contains(dosomething)) {
					word.setCode("DOSOMETHING");
					word.setWord("额！这个……我还没有学会");
					word.setDatetime(
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
					log.info("你说的话------>" + yourWord + ";Jarvis的回话------->" + word.getWord() + word.getWord()
							+ ";时间------>" + word.getDatetime());
				}
			}
			for (String SYAHI : SAY_HI) {
				if (yourWord.contains(SYAHI)) {
					word.setCode("SAYHI");
					word.setWord("你好啊！我是芝仔");
					word.setDatetime(
							new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
					log.info("你说的话------>" + yourWord + ";Jarvis的回话------->" + word.getWord() + word.getWord()
							+ ";时间------>" + word.getDatetime());
				}
			}
		}
		return word;
	}

	/**
	 * 判断字符串是不是数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			System.out.println(str.charAt(i));
			if (!Character.isDigit(str.charAt(i))) {
				return false;
			}
		}
		return true;
	}
}
