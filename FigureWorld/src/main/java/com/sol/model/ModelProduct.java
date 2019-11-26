package com.sol.model;

import java.util.Date;

public class ModelProduct {

	private Integer Product_NM   ;
	private String  Product_Group;
	private String  Product_Name ;
	private Integer Price 		 ;
	private String  Detail		 ;
	private Integer Stock		 ;
	private double  Product_Star ;
	private String  Title_Img	 ;
	private String  Info_Img	 ;
	private Date    Product_Date ;
	
	
	public ModelProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ModelProduct [Product_NM=" + Product_NM + ", Product_Group=" + Product_Group + ", Product_Name="
				+ Product_Name + ", Price=" + Price + ", Detail=" + Detail + ", Stock=" + Stock + ", Product_Star="
				+ Product_Star + ", Title_Img=" + Title_Img + ", Info_Img=" + Info_Img + ", Product_Date="
				+ Product_Date + "]";
	}

	public Integer getProduct_NM() {
		return Product_NM;
	}


	public void setProduct_NM(Integer product_NM) {
		Product_NM = product_NM;
	}


	public String getProduct_Group() {
		return Product_Group;
	}


	public void setProduct_Group(String product_Group) {
		Product_Group = product_Group;
	}


	public String getProduct_Name() {
		return Product_Name;
	}


	public void setProduct_Name(String product_Name) {
		Product_Name = product_Name;
	}


	public Integer getPrice() {
		return Price;
	}


	public void setPrice(Integer price) {
		Price = price;
	}


	public String getDetail() {
		return Detail;
	}


	public void setDetail(String detail) {
		Detail = detail;
	}


	public Integer getStock() {
		return Stock;
	}


	public void setStock(Integer stock) {
		Stock = stock;
	}

	public double getProduct_Star() {
		return Product_Star;
	}

	public void setProduct_Star(double product_Star) {
		Product_Star = product_Star;
	}

	public String getTitle_Img() {
		return Title_Img;
	}


	public void setTitle_Img(String title_Img) {
		Title_Img = title_Img;
	}


	public String getInfo_Img() {
		return Info_Img;
	}


	public void setInfo_Img(String info_Img) {
		Info_Img = info_Img;
	}


	public Date getProduct_Date() {
		return Product_Date;
	}


	public void setProduct_Date(Date product_Date) {
		Product_Date = product_Date;
	}
	
	
	
}
