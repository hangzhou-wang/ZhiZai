package com.whz.jarvis.model;
/**
 * Jarvis应答
 * @author Joe
 *
 * 2017年4月27日
 */
public class JarvisWords {
	private Integer id;	//编号
	private String question;	//问题
	private String answer;	//回答

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public JarvisWords(String question, String answer) {
		super();
		this.question = question;
		this.answer = answer;
	}

	public JarvisWords() {
		super();
	}
	

}
