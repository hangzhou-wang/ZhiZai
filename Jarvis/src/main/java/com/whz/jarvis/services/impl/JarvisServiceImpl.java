package com.whz.jarvis.services.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whz.jarvis.dao.JarvisDao;
import com.whz.jarvis.model.JarvisWords;
import com.whz.jarvis.services.JarvisService;
@Service("jarvisService")
public class JarvisServiceImpl implements JarvisService {
	@Resource
	private JarvisDao jdao;
	
	@Override
	public int insertJarvisWords(JarvisWords words) throws Exception {
		int res=0;
		try {
			jdao.insertJarvisWords(words);
			res=1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return res;
	}

	@Override
	public String getAnswer(String question) {
		return jdao.getAnswer(question);
	}

	@Override
	public long checkQuestion(String question) {
		return jdao.checkQuestion(question);
	}

	@Override
	public int updateAnswer(JarvisWords words) throws Exception {
		int res=0;
		try {
			jdao.updateAnswer(words);
			res=1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return res;
	}

}
