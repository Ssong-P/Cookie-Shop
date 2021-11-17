package com.model2.mvc.service.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	
	//insert
	public void addPurchase(Purchase purchase) throws Exception;
	
	//select one : tranNo
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//select one : prodNo
	public Purchase getPurchase2(int prodNo) throws Exception;
	
	//select List
	public List<Purchase> getPurchaseList(Map<String, Object> map) throws Exception;
	
	//??
	public HashMap<String,Object> getSaleList(Search search) throws Exception;
	
	//update purchase
	public void updatePurchase(Purchase purchase) throws Exception;
	
	//update tranCode
	public void updateTranCode(Purchase purchase) throws Exception;
	
	//page Ã³¸®
	public int getTotalCount(Search search) throws Exception;
		
}
