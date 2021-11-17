package com.model2.mvc.service.purchase.test;

import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class PurchaseServiceTest {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	public PurchaseServiceTest() {
	}
	
	//@Test
	public void testAddPurchase() throws Exception{
		
		Purchase purchase = new Purchase();
		User user = new User();
		Product product = new Product();
		user.setUserId("user10");
		product.setProdNo(10087);
		
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("dino");
		purchase.setReceiverPhone("010-1234-5678");
		purchase.setDlvyAddr("서울");
		purchase.setDlvyRequest("빨리빨리");
		purchase.setDlvyDate("20210202");
		
		purchaseService.addPurchase(purchase);
		
		Assert.assertEquals("user10", purchase.getBuyer().getUserId());
		Assert.assertEquals(10087,purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("1",purchase.getPaymentOption());
		Assert.assertEquals("dino",purchase.getReceiverName());
		Assert.assertEquals("010-1234-5678",purchase.getReceiverPhone());
		Assert.assertEquals("서울",purchase.getDlvyAddr());
		Assert.assertEquals("빨리빨리",purchase.getDlvyRequest());
		Assert.assertEquals("20210202",purchase.getDlvyDate());
		
	}
	
	
	//getPurchase : tranNo
	//@Test
	public void testGetPurhcase() throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(10024);
		
		Assert.assertEquals(10024, purchase.getTranNo());
		Assert.assertEquals(10060, purchase.getPurchaseProd().getProdNo());
		Assert.assertEquals("user10", purchase.getBuyer().getUserId());
		Assert.assertEquals("2  ", purchase.getPaymentOption());
		Assert.assertEquals("로떼", purchase.getReceiverName());
		Assert.assertEquals("87654", purchase.getReceiverPhone());
		Assert.assertEquals("서울", purchase.getDlvyAddr());
		Assert.assertEquals("맛있게", purchase.getDlvyRequest());
		Assert.assertEquals("002", purchase.getTranCode());
		Assert.assertEquals("2021-10-18", purchase.getOrderDate().toString());
//		Assert.assertEquals("2021-10-12", purchase.getDlvyDate());
		
		Assert.assertNotNull(purchaseService.getPurchase(10024));
		
	}
	
	
	//getPurchase : prodNo
	//@Test
	public void testGetPurhcase2() throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(10060);

	}
	
	
	//updatePurchase :: tranCode
	//@Test
	public void testUpdatePurchase() throws Exception {
		
		Purchase purchase = purchaseService.getPurchase(10001);
		purchase.setPaymentOption("2");
		purchase.setReceiverName("둘리");
		purchase.setReceiverPhone("010-8888-8888");
		purchase.setDlvyAddr("고길동");
		purchase.setDlvyRequest("새벽배송");
		purchase.setDlvyDate("20210202");
		
		purchaseService.updatePurchase(purchase);
		
		purchase = purchaseService.getPurchase(10001);		
		
	}
	
	
	//updateTranCode :: prodNo
	//@Test
	public void testUpdateTranCode() throws Exception {
		
		Purchase purchase = purchaseService.getPurchase2(10047);
		purchase.setPaymentOption("2");
		purchase.setReceiverName("미키마우스");
		purchase.setReceiverPhone("010-4567-7654");
		purchase.setDlvyAddr("월트디즈니");
		purchase.setDlvyRequest("미니마우스에게");
		purchase.setDlvyDate("20210202");
		
		purchaseService.updateTranCode(purchase);
		
		purchase = purchaseService.getPurchase2(10047);


	}
	
	
	//getPurchaseList
	@Test
	public void getPurchaseListAll() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("10060");

		User user = new User();
		Purchase purchase = new Purchase();
		user.setUserId("user10");
		purchase.setBuyer(user);
		System.out.println();
		Map map = purchaseService.getPurchaseList(search, purchase.getBuyer().getUserId());
		//Map<String, Object> map = purchaseService.getPurchaseList( search, user.getUserId() );
		System.out.println(map);
		
		
		

	}
	}
	
	
	

