package com.whz.jarvis.services;

import com.whz.jarvis.model.JarvisWords;

public interface JarvisService {
	int insertJarvisWords(JarvisWords words) throws Exception;

	String getAnswer(String question);

	long checkQuestion(String question);

	int updateAnswer(JarvisWords words) throws Exception;
}
