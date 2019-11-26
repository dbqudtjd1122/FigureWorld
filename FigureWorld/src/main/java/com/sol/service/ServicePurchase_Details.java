package com.sol.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sol.dao.IDaoPurchase_Details;

@Repository("servicepurchase_details")
public class ServicePurchase_Details implements IServicePurchase_Details {

	// SLF4J Logging
	private static Logger logger = LoggerFactory.getLogger(ServicePurchase_Details.class);
	
	@Autowired
	IDaoPurchase_Details dao;

}
