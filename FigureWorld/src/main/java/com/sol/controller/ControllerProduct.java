package com.sol.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sol.model.ModelProduct;
import com.sol.service.IServiceProduct;

@Controller
public class ControllerProduct {

	private static final Logger logger = LoggerFactory.getLogger(ControllerProduct.class);

	@Autowired
	IServiceProduct svr;

	// 제품 리스트 페이지
	@RequestMapping(value = "/Figure_Product_list", method = RequestMethod.GET)
	public ModelAndView SelectProduct_list(String Product_Name) {
		
		ModelProduct product = new ModelProduct();
		product.setProduct_Group(Product_Name);
		product.setProduct_Name(Product_Name);
		List<ModelProduct> list = svr.ProductList(product);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/product/Figure_product_list");
		mav.addObject("list", list);

		return mav;
	}
	
	// 제품 상세 페이지
	@RequestMapping(value = "/Figure_Product_info", method = RequestMethod.GET)
	public ModelAndView Product_info(int Product_NM, HttpServletRequest httpServletRequest) {
		
		ModelProduct product = new ModelProduct();
		product.setProduct_NM(Product_NM);
		
		product = svr.SelectProduct(product); // 상세 정보
		List<ModelProduct> list = svr.RelevantProduct(product); // 관련 상품
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/product/Figure_product_info");
		mav.addObject("product", product);
		mav.addObject("list", list);

		return mav;
	}

}
