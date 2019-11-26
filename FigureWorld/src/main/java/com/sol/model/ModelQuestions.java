package com.sol.model;

import java.util.Date;

public class ModelQuestions {
	
	private Integer Questions_NM     ;
	private Integer User_NM          ;
	private String 	Title            ;
	private String 	Questions_Content;
	private boolean Secret           ;
	private Date 	BoadrWriting_Time;
	private Date 	BoadrUpdate_Time ;
	private Integer Inquiry_Index    ;
		
	
	public ModelQuestions(Integer questions_NM, Integer user_NM, String title, String questions_Content, boolean secret,
			Date boadrWriting_Time, Date boadrUpdate_Time, Integer inquiry_Index) {
		super();
		Questions_NM = questions_NM;
		User_NM = user_NM;
		Title = title;
		Questions_Content = questions_Content;
		Secret = secret;
		BoadrWriting_Time = boadrWriting_Time;
		BoadrUpdate_Time = boadrUpdate_Time;
		Inquiry_Index = inquiry_Index;
	}

	@Override
	public String toString() {
		return "ModelQuestions [Questions_NM=" + Questions_NM + ", User_NM=" + User_NM + ", Title=" + Title
				+ ", Questions_Content=" + Questions_Content + ", Secret=" + Secret + ", BoadrWriting_Time="
				+ BoadrWriting_Time + ", BoadrUpdate_Time=" + BoadrUpdate_Time + ", Inquiry_Index=" + Inquiry_Index
				+ "]";
	}

	public ModelQuestions() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getQuestions_Content() {
		return Questions_Content;
	}

	public void setQuestions_Content(String questions_Content) {
		Questions_Content = questions_Content;
	}
	
	public boolean getSecret() {
		return Secret;
	}

	public void setSecret(boolean secret) {
		Secret = secret;
	}

	public Date getBoadrWriting_Time() {
		return BoadrWriting_Time;
	}

	public void setBoadrWriting_Time(Date boadrWriting_Time) {
		BoadrWriting_Time = boadrWriting_Time;
	}
	
	public Date getBoadrUpdate_Time() {
		return BoadrUpdate_Time;
	}

	public void setBoadrUpdate_Time(Date boadrUpdate_Time) {
		BoadrUpdate_Time = boadrUpdate_Time;
	}

	public Integer getInquiry_Index() {
		return Inquiry_Index;
	}

	public void setInquiry_Index(Integer inquiry_Index) {
		Inquiry_Index = inquiry_Index;
	}
}
