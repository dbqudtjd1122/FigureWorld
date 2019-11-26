package com.sol.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sol.model.ModelProduct;

@Repository
public interface IDaoProduct {

	List<ModelProduct> ProductList (ModelProduct product);
	
	ModelProduct SelectProduct (ModelProduct product);
	
	List<ModelProduct> RelevantProduct(ModelProduct product);
}
