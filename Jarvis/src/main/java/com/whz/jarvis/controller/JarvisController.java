package com.whz.jarvis.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whz.jarvis.beans.RobotWord;
import com.whz.jarvis.model.JarvisWords;
import com.whz.jarvis.services.JarvisService;
/**
 * Jarvis核心控制
 * @author Joe
 *
 * 2017年4月27日
 */
@Controller
public class JarvisController {
	@Resource
	private JarvisService jarvisService;
	private static final Logger log=Logger.getLogger(JarvisController.class);
	/**
	 * 教芝仔说话
	 * @param request
	 * @param words 问题和答案
	 * @return
	 */
	@RequestMapping("/jarvis/add")
	public @ResponseBody RobotWord learn(HttpServletRequest request,JarvisWords words){
		RobotWord word=new RobotWord();
		int addRes=0;
		try {
			int existQuestion=(int) jarvisService.checkQuestion(words.getQuestion());
			if (existQuestion>0) {
				addRes=jarvisService.updateAnswer(words);
			}else{
				addRes=jarvisService.insertJarvisWords(words);
			}
			if (addRes>0) {
				word.setCode("insertSuccess");
				word.setWord("好的，我已经学会了^_^");
				log.info(word);
			}else{
				word.setCode("insertError");
				word.setWord("出现错误");
				log.error(word);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
		return word;
	}

	/**
	 * Jarvis回答
	 * @param question
	 * @return
	 */
	@RequestMapping("/jarvis/answer")
	public @ResponseBody RobotWord getAnswer(String question){
		RobotWord word=new RobotWord();
		if (!question.equals("")||question.trim().length()!=0) {
			try {
				String jarvisAnswer=jarvisService.getAnswer(question);
				if (jarvisAnswer!=null) {
					word.setCode("answerSuccess");
					word.setWord(jarvisAnswer);
					log.info(word.getWord());
				}else{
					word.setCode("answerError");
					word.setWord("这个我不懂，你可以教我吗？点击左边的按钮教我说话");
					log.info(word.getWord());
				}
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e.getMessage());
			}
		}else{
			word.setCode("answerError");
			word.setWord("什么也不说是什么意思，我不懂，你可以教我吗？点击左边的按钮教我说话");
			log.info(word.getWord());
		}
		return word;
	}
}
