package com.model2.mvc.service.product.test;


import java.util.List;
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
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class ProductServiceTest {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductServiceTest() {
	}

	//@Test
	public void testAddProduct() throws Exception {

		Product product = new Product();
		product.setProdName("testProdName");
		product.setProdDetail("testProdDetail");
		product.setManuDate("20202020");
		product.setPrice(1000);
		product.setFileName("testFileImage");

		productService.addProduct(product);

		// product = productService.getProduct(prodNo);

		// console 확인
		// System.out.println("testAddProduct"+product);

		// API 확인
		Assert.assertEquals("testProdName", product.getProdName());
		Assert.assertEquals("testProdDetail", product.getProdDetail());
		Assert.assertEquals("20202020", product.getManuDate());
		Assert.assertEquals(1000, product.getPrice());
		Assert.assertEquals("testFileImage", product.getFileName());

	}

	//@Test
	public void testGetProduct() throws Exception {

		Product product = new Product();

		product = productService.getProduct(10049);

		Assert.assertEquals(10049, product.getProdNo());
		Assert.assertEquals("testProdName", product.getProdName());
		Assert.assertEquals("testProdDetail", product.getProdDetail());
		Assert.assertEquals("20202020", product.getManuDate());
		Assert.assertEquals(1000, product.getPrice());
		Assert.assertEquals("testFileImage", product.getFileName());
		// product.getRegDate : 2012-10-08로 들어감..ㅜ
		// date type을 string으로 변환 -> product.getRegDate().toString()
		Assert.assertEquals("2021-10-08", product.getRegDate().toString());

		Assert.assertNotNull(productService.getProduct(10049));

	}

	//@Test
	public void testUpdateProduct() throws Exception {

		Product product = productService.getProduct(10049);
		Assert.assertNotNull(product);

		Assert.assertEquals("testProdName", product.getProdName());
		Assert.assertEquals("testProdDetail", product.getProdDetail());
		Assert.assertEquals("20202020", product.getManuDate());
		Assert.assertEquals(1000, product.getPrice());
		Assert.assertEquals("testFileImage", product.getFileName());

		product.setProdName("changeProdName");
		product.setProdDetail("changeProdDetail");
		product.setManuDate("21212121");
		product.setPrice(2000);
		product.setFileName("changeFileImage");

		productService.updateProduct(product);

		product = productService.getProduct(10049);
		Assert.assertNotNull(product);

		//System.out.println("product" + product);
		
		 
		 Assert.assertEquals("changeProdName", product.getProdName());
		 Assert.assertEquals("changeProdDetail", product.getProdDetail());
		 Assert.assertEquals("21212121", product.getManuDate());
		 Assert.assertEquals(2000, product.getPrice());
		 Assert.assertEquals("changeFileImage", product.getFileName());
		

	}

	//@Test
	public void testGetProductListAll() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = productService.getProductList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// console 확인
		// System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("===================================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		map = productService.getProductList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// console 확인
		// System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println("totalCount : "+totalCount);
	}

	//@Test
	public void testGetProductListByProdNo() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("10040");
		Map<String, Object> map = productService.getProductList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(1, list.size());

		// console 확인
		// System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("===================================================");

		search.setSearchCondition("0");
		search.setSearchKeyword("" + System.currentTimeMillis());
		map = productService.getProductList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(0, list.size());

		// console 확인
		// System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

	}
	
	
	//@Test
		public void testGetProductListByProdName() throws Exception {

			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(3);
			search.setSearchCondition("1");
			search.setSearchKeyword("안녕");
			Map<String, Object> map = productService.getProductList(search);

			List<Object> list = (List<Object>) map.get("list");
			Assert.assertEquals(2, list.size());

			// console 확인
			// System.out.println(list);

			Integer totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);

			System.out.println("===================================================");

			search.setSearchCondition("1");
			search.setSearchKeyword("" + System.currentTimeMillis());
			map = productService.getProductList(search);

			list = (List<Object>) map.get("list");
			Assert.assertEquals(0, list.size());

			// console 확인
			// System.out.println(list);

			totalCount = (Integer) map.get("totalCount");
			System.out.println(totalCount);

		}

	

	//@Test
	public void testGetProductListByPrice() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("2");
		search.setSearchKeyword("1000");
		Map<String, Object> map = productService.getProductList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		// console 확인
		// System.out.println(list);

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("===================================================");

		search.setSearchCondition("2");
		search.setSearchKeyword("" + System.currentTimeMillis());
		map = productService.getProductList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(0, list.size());

		// console 확인
		// System.out.println(list);

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

	}

}
