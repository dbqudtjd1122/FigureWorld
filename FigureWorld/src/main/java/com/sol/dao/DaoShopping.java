package com.sol.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.model.ModelShopping_Basket;

@Repository("daoshopping_basket")
public class DaoShopping implements IDaoShopping {

	@Autowired
	private SqlSession session;

	@Override
	public int InsertBasket(ModelShopping_Basket basket) {
		return session.insert("mapper.mysql.mapper.InsertBasket", basket);
	}

	@Override
	public List<Map<String, Object>> SelectBasket(Integer User_NM) {
		return session.selectList("mapper.mysql.mapper.SelectBasket", User_NM);
	}

	@Override
	public int DeleteBasket(Integer Basket_NM) {
		return session.delete("mapper.mysql.mapper.DeleteBasket", Basket_NM);
	}

	@Override
	public List<Map<String, Object>> SelectAllOrder(List<Integer> Checklist) {
		return session.selectList("mapper.mysql.mapper.SelectAllOrder", Checklist);
	}

	@Override
	public int InsertAllOrder(List<Integer> Basket_NM) {
		return session.insert("mapper.mysql.mapper.InsertAllOrder", Basket_NM);
	}

	@Override
	public int UpdateAllOrder(List<Integer> Basket_NM) {
		return session.update("mapper.mysql.mapper.UpdateAllOrder", Basket_NM);
	}

	@Override
	public int UpdateStock(List<Integer> Basket_NM) {
		return session.update("mapper.mysql.mapper.UpdateStock", Basket_NM);
	}

	@Override
	public int UpdateQuantity(ModelShopping_Basket basket) {
		return session.update("mapper.mysql.mapper.UpdateQuantity", basket);
	}
	
	
}
