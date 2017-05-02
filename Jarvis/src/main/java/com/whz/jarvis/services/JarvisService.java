package com.whz.jarvis.services;

import com.whz.jarvis.model.JarvisUser;
import com.whz.jarvis.model.JarvisWords;
/**
 * JarvisService
 * @author Joe
 *
 * 2017年5月2日
 */
public interface JarvisService {
	/**
	 * 教Jarvis说话
	 * @param words 问题和回答
	 */
	int insertJarvisWords(JarvisWords words) throws Exception;
	/**
	 * 得到Jarvis的回答
	 * @param question 问题
	 * @return
	 */
	String getAnswer(String question);
	/**
	 * 添加问答的时候检查该问题是否已经存在
	 * @param question 问题
	 * @return
	 */
	long checkQuestion(String question);
	/**
	 * 如果已经存在该问题就更新回答
	 * @param words 
	 */
	int updateAnswer(JarvisWords words) throws Exception;
	/**
	 * 根据用户名得到用户信息
	 * @param name 登录名
	 * @return
	 */
	JarvisUser getUserByName(String name);
	/**
	 * 新用户注册
	 * @param user 用户对象
	 */
	int insertJarvisUser(JarvisUser user) throws Exception;
}
