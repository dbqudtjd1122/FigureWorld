package com.sol.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.dao.IDaoProduct;
import com.sol.model.ModelProduct;

@Repository("serviceproduct")
public class ServiceProduct implements IServiceProduct {

	// SLF4J Logging
	private static Logger logger = LoggerFactory.getLogger(ServiceProduct.class);
	
	@Autowired
	IDaoProduct dao;

	@Override
	public List<ModelProduct> ProductList(ModelProduct product) {
		List<ModelProduct> result = new ArrayList<ModelProduct>();
		try {
			result = dao.ProductList(product);
		} catch (Exception e) {
			logger.error("ProductList" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public ModelProduct SelectProduct(ModelProduct product) {
		ModelProduct result = new ModelProduct();
		try {
			result = dao.SelectProduct(product);
		} catch (Exception e) {
			logger.error("SelectProduct" + e.getMessage());
			throw e;
		}
		return result;
	}

	@Override
	public List<ModelProduct> RelevantProduct(ModelProduct product) {
		List<ModelProduct> result = new ArrayList<ModelProduct>();
		try {
			result = dao.RelevantProduct(product);
		} catch (Exception e) {
			logger.error("RelevantProduct" + e.getMessage());
			throw e;
		}
		return result;
	}
	
}
