package com.sol.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sol.model.ModelShopping_Basket;

@Repository
public interface IDaoShopping {

	int InsertBasket(ModelShopping_Basket basket);
	
	List<Map<String, Object>> SelectBasket(Integer User_NM);
	
	int DeleteBasket(Integer Basket_NM);
	
	List<Map<String, Object>> SelectAllOrder(List<Integer> Checklist);
	
	int UpdateQuantity(ModelShopping_Basket basket);
	
	int InsertAllOrder(List<Integer> Basket_NM);
	
	int UpdateAllOrder(List<Integer> Basket_NM);
	
	int UpdateStock(List<Integer> Basket_NM);
}
