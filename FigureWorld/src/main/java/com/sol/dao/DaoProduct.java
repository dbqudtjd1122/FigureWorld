package com.sol.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.model.ModelProduct;

@Repository("daoproduct")
public class DaoProduct implements IDaoProduct {

	@Autowired
	private SqlSession session;

	@Override
	public List<ModelProduct> ProductList(ModelProduct product) {
		return session.selectList("mapper.mysql.mapper.ProductList", product);
	}

	@Override
	public ModelProduct SelectProduct(ModelProduct product) {
		return session.selectOne("mapper.mysql.mapper.SelectProduct", product);
	}

	@Override
	public List<ModelProduct> RelevantProduct(ModelProduct product) {
		return session.selectList("mapper.mysql.mapper.RelevantProduct", product);
	}
	
	
}
