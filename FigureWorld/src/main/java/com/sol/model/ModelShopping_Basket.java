package com.sol.model;

public class ModelShopping_Basket {
	
	private Integer Basket_NM   ;
	private Integer User_NM 	;
	private Integer Product_NM  ;
	private Integer Quantity 	;
	private String  Purchase	;
	
	
	@Override
	public String toString() {
		return "ModelShopping_Basket [Basket_NM=" + Basket_NM + ", User_NM=" + User_NM + ", Product_NM=" + Product_NM
				+ ", Quantity=" + Quantity + ", Purchase=" + Purchase + "]";
	}

	public ModelShopping_Basket(Integer basket_NM, Integer user_NM, Integer product_NM, Integer quantity,
			String purchase) {
		super();
		Basket_NM = basket_NM;
		User_NM = user_NM;
		Product_NM = product_NM;
		Quantity = quantity;
		Purchase = purchase;
	}

	public ModelShopping_Basket() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Integer getBasket_NM() {
		return Basket_NM;
	}
	public void setBasket_NM(Integer basket_NM) {
		Basket_NM = basket_NM;
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
	public Integer getQuantity() {
		return Quantity;
	}
	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}
	public String getPurchase() {
		return Purchase;
	}
	public void setPurchase(String purchase) {
		Purchase = purchase;
	}	
}
