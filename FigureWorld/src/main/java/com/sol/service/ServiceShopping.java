package com.sol.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.MultiKeyMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.dao.IDaoShopping;
import com.sol.model.ModelShopping_Basket;

@Repository("serviceshopping_basket")
public class ServiceShopping implements IServiceShopping {

	// SLF4J Logging
	private static Logger logger = LoggerFactory.getLogger(ServiceShopping.class);

	@Autowired
	IDaoShopping dao;

	@Override
	public int InsertBasket(ModelShopping_Basket basket) {
		int result = -1;
		try {
			result = dao.InsertBasket(basket);
		} catch (Exception e) {
			logger.error("SelectBasket" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> SelectBasket(Integer User_NM) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		try {
			result = dao.SelectBasket(User_NM);
		} catch (Exception e) {
			logger.error("SelectBasket" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int DeleteBasket(Integer Basket_NM) {
		int result = -1;
		try {
			result = dao.DeleteBasket(Basket_NM);
		} catch (Exception e) {
			logger.error("DeleteBasket" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> SelectAllOrder(List<Integer> Checklist) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		try {
			result = dao.SelectAllOrder(Checklist);
		} catch (Exception e) {
			logger.error("SelectAllOrder" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int InsertAllOrder(List<Integer> Basket_NM) {
		int result = -1;
		try {
			result = dao.InsertAllOrder(Basket_NM);
		} catch (Exception e) {
			logger.error("InsertAllOrder" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int UpdateAllOrder(List<Integer> Basket_NM) {
		int result = -1;
		try {
			result = dao.UpdateAllOrder(Basket_NM);
		} catch (Exception e) {
			logger.error("UpdateAllOrder" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int UpdateStock(List<Integer> Basket_NM) {
		int result = -1;
		try {
			result = dao.UpdateStock(Basket_NM);
		} catch (Exception e) {
			logger.error("UpdateStock" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public int UpdateQuantity(ModelShopping_Basket basket) {
		int result = -1;
		try {
			result = dao.UpdateQuantity(basket);
		} catch (Exception e) {
			logger.error("UpdateQuantity" + e.getMessage());
			throw e;
		}
		return result;
	}
}
