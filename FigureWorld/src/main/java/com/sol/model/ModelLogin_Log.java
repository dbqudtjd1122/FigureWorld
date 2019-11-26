package com.sol.model;

import java.util.Date;

public class ModelLogin_Log {

	private Integer User_NM   ;	
	private String 	IP 	   	  ;
	private Date 	InOut_Date; 
	private String 	Log_InOut ;

	
	public ModelLogin_Log() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ModelLogin_Log(Integer user_NM, String iP, Date inOut_Date, String log_InOut) {
		super();
		User_NM = user_NM;
		IP = iP;
		InOut_Date = inOut_Date;
		Log_InOut = log_InOut;
	}
	@Override
	public String toString() {
		return "ModelLogin_Log [User_NM=" + User_NM + ", IP=" + IP + ", InOut_Date=" + InOut_Date + ", Log_InOut="
				+ Log_InOut + "]";
	}
	public Integer getUser_NM() {
		return User_NM;
	}
	public void setUser_NM(Integer user_NM) {
		User_NM = user_NM;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public Date getInOut_Date() {
		return InOut_Date;
	}
	public void setInOut_Date(Date inOut_Date) {
		InOut_Date = inOut_Date;
	}
	public String getLog_InOut() {
		return Log_InOut;
	}
	public void setLog_InOut(String log_InOut) {
		Log_InOut = log_InOut;
	} 
}
