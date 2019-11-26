package com.sol.model;


import java.util.Date;

public class ModelUser {

	private Integer User_NM;
	private String  NAME;
	private String  Rating;
	private String  ID;
	private String  PW;
	private String  PW_Check1;
	private String  PW_Check2;
	private String  Postal_code;
	private String  Old_addr;
	private String  New_addr;
	private String  Detail_addr;
	private String  Phone;
	private String  Email;
	private boolean Email_Check;
	private Date 	Birth;
	private String  POINT;
	private Date    SignUp_Date;
	
	public ModelUser(Integer user_NM, String nAME, String rating, String iD, String pW, String pW_Check1,
			String pW_Check2, String postal_code, String old_addr, String new_addr, String detail_addr, String phone,
			String email, boolean email_Check, Date birth, String pOINT, Date signUp_Date) {
		super();
		User_NM = user_NM;
		NAME = nAME;
		Rating = rating;
		ID = iD;
		PW = pW;
		PW_Check1 = pW_Check1;
		PW_Check2 = pW_Check2;
		Postal_code = postal_code;
		Old_addr = old_addr;
		New_addr = new_addr;
		Detail_addr = detail_addr;
		Phone = phone;
		Email = email;
		Email_Check = email_Check;
		Birth = birth;
		POINT = pOINT;
		SignUp_Date = signUp_Date;
	}

	public ModelUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "ModelUser [User_NM=" + User_NM + ", NAME=" + NAME + ", Rating=" + Rating + ", ID=" + ID + ", PW=" + PW
				+ ", PW_Check1=" + PW_Check1 + ", PW_Check2=" + PW_Check2 + ", Postal_code=" + Postal_code
				+ ", Old_addr=" + Old_addr + ", New_addr=" + New_addr + ", Detail_addr=" + Detail_addr + ", Phone="
				+ Phone + ", Email=" + Email + ", Email_Check=" + Email_Check + ", Birth=" + Birth + ", POINT=" + POINT
				+ ", SignUp_Date=" + SignUp_Date + "]";
	}

	public Integer getUser_NM() {
		return User_NM;
	}

	public void setUser_NM(Integer user_NM) {
		User_NM = user_NM;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getRating() {
		return Rating;
	}

	public void setRating(String rating) {
		Rating = rating;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String pW) {
		PW = pW;
	}

	public String getPW_Check1() {
		return PW_Check1;
	}

	public void setPW_Check1(String pW_Check1) {
		PW_Check1 = pW_Check1;
	}

	public String getPW_Check2() {
		return PW_Check2;
	}

	public void setPW_Check2(String pW_Check2) {
		PW_Check2 = pW_Check2;
	}

	public String getPostal_code() {
		return Postal_code;
	}

	public void setPostal_code(String postal_code) {
		Postal_code = postal_code;
	}

	public String getOld_addr() {
		return Old_addr;
	}

	public void setOld_addr(String old_addr) {
		Old_addr = old_addr;
	}

	public String getNew_addr() {
		return New_addr;
	}

	public void setNew_addr(String new_addr) {
		New_addr = new_addr;
	}

	public String getDetail_addr() {
		return Detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		Detail_addr = detail_addr;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public boolean isEmail_Check() {
		return Email_Check;
	}

	public void setEmail_Check(boolean email_Check) {
		Email_Check = email_Check;
	}

	public Date getBirth() {
		return Birth;
	}

	public void setBirth(Date birth) {
		Birth = birth;
	}

	public String getPOINT() {
		return POINT;
	}

	public void setPOINT(String pOINT) {
		POINT = pOINT;
	}

	public Date getSignUp_Date() {
		return SignUp_Date;
	}

	public void setSignUp_Date(Date signUp_Date) {
		SignUp_Date = signUp_Date;
	}
}
