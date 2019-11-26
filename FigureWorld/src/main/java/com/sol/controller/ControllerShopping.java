package com.sol.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sol.model.ModelShopping_Basket;
import com.sol.service.IServiceShopping;

@Controller
public class ControllerShopping {

	private static final Logger logger = LoggerFactory.getLogger(ControllerShopping.class);

	@Autowired
	IServiceShopping svr;
	
	// 장바구니에 정보 넣기
	@RequestMapping(value = "/Figure_InsertBasket", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Figure_InsertBasket(ModelShopping_Basket basket) {
		
		int User_NM = basket.getUser_NM();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> list = svr.SelectBasket(User_NM);
		
		for(int i=0; i<list.size(); i++) {
			if((int) list.get(i).get("Product_NM") == basket.getProduct_NM()) { // 장바구니에 이미 담긴제품일 경우
				map.put("result", -1);
				return map;
			}
		}
		
		int result = svr.InsertBasket(basket);
		map.put("result", result);
		return map;
	}
	
	// 장바구니 페이지
	@RequestMapping(value = "/Figure_basket", method = RequestMethod.POST)
	public ModelAndView Figure_basket(ModelShopping_Basket basket) {
		
		int User_NM = basket.getUser_NM();
		
		List<Map<String, Object>> list = svr.SelectBasket(User_NM);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("figureworld/user/Figure_shopping_basket");
		mav.addObject("list", list);
		mav.addObject("list_size", list.size());

		return mav;
	}
	
	//  장바구니 목록 삭제
	@RequestMapping(value = "/Figure_DeleteBasket", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> DeleteBasket(ModelShopping_Basket basket){

		int result = svr.DeleteBasket(basket.getBasket_NM());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return map;
	}
	
	//  장바구니 수량 업데이트
	@RequestMapping(value = "/Figure_UpdateQuantity", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> UpdateQuantity(ModelShopping_Basket basket){

		int result = svr.UpdateQuantity(basket);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);

		return map;
	}
	
	
	//  장바구니 목록 주문
	@RequestMapping(value = "/Figure_AllOrder", method = {RequestMethod.POST})
	@ResponseBody 
	public Map<String, Object> All_Order(@RequestParam(value="Checklist[]") List<Integer> Checklist){
		
		int result = svr.InsertAllOrder(Checklist);
		if(result > 0) {
			result = svr.UpdateAllOrder(Checklist);
			result = svr.UpdateStock(Checklist);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map; 
	}

}
