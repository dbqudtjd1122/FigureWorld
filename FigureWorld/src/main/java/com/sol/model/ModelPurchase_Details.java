package com.sol.model;

import java.util.Date;

public class ModelPurchase_Details {

	private Integer Order_NM    	 ;
	private Integer User_NM 		 ;
	private Integer Product_NM   	 ;
	private Integer Payment_Amount 	 ;
	private Integer Purchase_Quantity;
	private Date 	Purchase_Date	 ;
	private Date 	Bereleased_Date	 ;
	private String 	Courier			 ;
	private String 	Invoice_Number   ;
		
	

	@Override
	public String toString() {
		return "ModelPurchase_Details [Order_NM=" + Order_NM + ", User_NM=" + User_NM + ", Product_NM=" + Product_NM
				+ ", Payment_Amount=" + Payment_Amount + ", Purchase_Quantity=" + Purchase_Quantity + ", Purchase_Date="
				+ Purchase_Date + ", Bereleased_Date=" + Bereleased_Date + ", Courier=" + Courier + ", Invoice_Number="
				+ Invoice_Number + "]";
	}

	public ModelPurchase_Details(Integer order_NM, Integer user_NM, Integer product_NM, Integer payment_Amount,
			Integer purchase_Quantity, Date purchase_Date, Date bereleased_Date, String courier,
			String invoice_Number) {
		super();
		Order_NM = order_NM;
		User_NM = user_NM;
		Product_NM = product_NM;
		Payment_Amount = payment_Amount;
		Purchase_Quantity = purchase_Quantity;
		Purchase_Date = purchase_Date;
		Bereleased_Date = bereleased_Date;
		Courier = courier;
		Invoice_Number = invoice_Number;
	}

	public ModelPurchase_Details() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Integer getPurchase_Quantity() {
		return Purchase_Quantity;
	}
	public void setPurchase_Quantity(Integer purchase_Quantity) {
		Purchase_Quantity = purchase_Quantity;
	}
	public Integer getOrder_NM() {
		return Order_NM;
	}
	public void setOrder_NM(Integer order_NM) {
		Order_NM = order_NM;
	}
	public Integer getUser_NM() {
		return User_NM;
	}
	public void setUser_NM(Integer user_NM) {
		User_NM = user_NM;
	}
	public Integer getProduct_NM() {
		return Product_NM;
	}
	public void setProduct_NM(Integer product_NM) {
		Product_NM = product_NM;
	}
	public Integer getPayment_Amount() {
		return Payment_Amount;
	}
	public void setPayment_Amount(Integer payment_Amount) {
		Payment_Amount = payment_Amount;
	}
	public Date getPurchase_Date() {
		return Purchase_Date;
	}
	public void setPurchase_Date(Date purchase_Date) {
		Purchase_Date = purchase_Date;
	}
	public Date getBereleased_Date() {
		return Bereleased_Date;
	}
	public void setBereleased_Date(Date bereleased_Date) {
		Bereleased_Date = bereleased_Date;
	}
	public String getCourier() {
		return Courier;
	}
	public void setCourier(String courier) {
		Courier = courier;
	}
	public String getInvoice_Number() {
		return Invoice_Number;
	}
	public void setInvoice_Number(String invoice_Number) {
		Invoice_Number = invoice_Number;
	}
	
	
	
}
