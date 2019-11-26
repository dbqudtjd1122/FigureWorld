package com.sol.model;

import java.util.Date;

public class ModelProduct_Review {
	private Integer ProductReview_NM;
	private Integer Product_NM;
	private Integer User_NM;
	private String Review_Content;
	private Float Review_Star;
	private Date ReviewWriting_Tim;

	public ModelProduct_Review() {
		// TODO Auto-generated constructor stub
	}

	public ModelProduct_Review(Integer productReview_NM, Integer product_NM, Integer user_NM, String review_Content,
			Float review_Star, Date reviewWriting_Tim) {
		super();
		ProductReview_NM = productReview_NM;
		Product_NM = product_NM;
		User_NM = user_NM;
		Review_Content = review_Content;
		Review_Star = review_Star;
		ReviewWriting_Tim = reviewWriting_Tim;
	}

	@Override
	public String toString() {
		return "ModelProduct_Review [ProductReview_NM=" + ProductReview_NM + ", Product_NM=" + Product_NM + ", User_NM="
				+ User_NM + ", Review_Content=" + Review_Content + ", Review_Star=" + Review_Star
				+ ", ReviewWriting_Tim=" + ReviewWriting_Tim + "]";
	}

	public Integer getProductReview_NM() {
		return ProductReview_NM;
	}

	public void setProductReview_NM(Integer productReview_NM) {
		ProductReview_NM = productReview_NM;
	}

	public Integer getProduct_NM() {
		return Product_NM;
	}

	public void setProduct_NM(Integer product_NM) {
		Product_NM = product_NM;
	}

	public Integer getUser_NM() {
		return User_NM;
	}

	public void setUser_NM(Integer user_NM) {
		User_NM = user_NM;
	}

	public String getReview_Content() {
		return Review_Content;
	}

	public void setReview_Content(String review_Content) {
		Review_Content = review_Content;
	}

	public Float getReview_Star() {
		return Review_Star;
	}

	public void setReview_Star(Float review_Star) {
		Review_Star = review_Star;
	}

	public Date getReviewWriting_Tim() {
		return ReviewWriting_Tim;
	}

	public void setReviewWriting_Tim(Date reviewWriting_Tim) {
		ReviewWriting_Tim = reviewWriting_Tim;
	}

}
