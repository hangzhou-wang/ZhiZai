package com.whz.jarvis.dao;

import com.whz.jarvis.model.JarvisUser;
import com.whz.jarvis.model.JarvisWords;
/**
 * 基本的Jarvis功能
 * @author Joe
 *
 * 2017年4月27日
 */
public interface JarvisDao {
	
	void insertJarvisWords(JarvisWords words);
	
	String getAnswer(String question);
	
	long checkQuestion(String question);
	
	void updateAnswer(JarvisWords words);

	JarvisUser getUserByName(String name);

	void insertJarvisUser(JarvisUser user);
}
