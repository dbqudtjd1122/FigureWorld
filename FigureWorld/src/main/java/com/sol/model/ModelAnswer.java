package com.sol.model;

import java.util.Date;

public class ModelAnswer {
	
	private Integer Manager_Answer_NM;
	private Integer Questions_NM 	 ;
	private Integer User_NM     	 ;
	private String  Answer_Content 	 ;
	private Date    Writing_Time	 ;
	
	
	public ModelAnswer(Integer manager_Answer_NM, Integer questions_NM, Integer user_NM, String answer_Content,
			Date writing_Time) {
		super();
		Manager_Answer_NM = manager_Answer_NM;
		Questions_NM = questions_NM;
		User_NM = user_NM;
		Answer_Content = answer_Content;
		Writing_Time = writing_Time;
	}
	public ModelAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ModelAnswer [Manager_Answer_NM=" + Manager_Answer_NM + ", Questions_NM=" + Questions_NM + ", User_NM="
				+ User_NM + ", Answer_Content=" + Answer_Content + ", Writing_Time=" + Writing_Time + "]";
	}
	public Integer getManager_Answer_NM() {
		return Manager_Answer_NM;
	}
	public void setManager_Answer_NM(Integer manager_Answer_NM) {
		Manager_Answer_NM = manager_Answer_NM;
	}
	public Integer getQuestions_NM() {
		return Questions_NM;
	}
	public void setQuestions_NM(Integer questions_NM) {
		Questions_NM = questions_NM;
	}
	public Integer getUser_NM() {
		return User_NM;
	}
	public void setUser_NM(Integer user_NM) {
		User_NM = user_NM;
	}
	public String getAnswer_Content() {
		return Answer_Content;
	}
	public void setAnswer_Content(String answer_Content) {
		Answer_Content = answer_Content;
	}
	public Date getWriting_Time() {
		return Writing_Time;
	}
	public void setWriting_Time(Date writing_Time) {
		Writing_Time = writing_Time;
	}
}
