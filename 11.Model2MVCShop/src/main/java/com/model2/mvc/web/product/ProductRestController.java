package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductRestController() {				
		System.out.println(this.getClass()+"default Constructor");
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	//addProduct
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct( @RequestBody Product product, HttpSession session) throws Exception {
	
		System.out.println(":: /product/json/addProduct : POST");
		
		productService.addProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
	
	
	//getProduct
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println(":: /product/json/getProduct : GET");

		Product product = productService.getProduct(prodNo);

		return product;
	}
	
	
	
	//updateProduct : POST
	@RequestMapping(value="json/updateProduct/{prodNo}", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product,
								@PathVariable int prodNo) throws Exception {
		
		System.out.println(":: /product/json/updateProduct : POST");
		
		//productService.getProduct(prodNo);
		productService.updateProduct(product);
		
		return productService.getProduct(product.getProdNo());
	}
	
	
	//listProduct
	@RequestMapping(value="json/listProduct")
	public Map<String,Object> listProduct(@RequestBody Search search) throws Exception {
		
		System.out.println(":: /product/getProductList ::");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(-1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = productService.getProductList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),
					((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
				
		System.out.println("list :: " + map.get("list"));
		return map;
	}
	
	
	
}
