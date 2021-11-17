package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	//Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	// 와이어링은 각각 필수!
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	ModelAndView modelAndView;
	
	public PurchaseRestController() {
		System.out.println(this.getClass()+" default Constructor");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	//getPurchase
	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET )
	public Purchase getPurhcase(@PathVariable int tranNo) throws Exception {
		
		System.out.println("/purchase/json/getPurchase");

		return purchaseService.getPurchase(tranNo);
		
	}
	
	
	//getPurchase2
	@RequestMapping(value = "json/getPurchase2/{prodNo}", method=RequestMethod.GET )
	public Purchase getPurchase2(@PathVariable int prodNo) throws Exception{
		
		System.out.println("/purchase/json/getPurhcase2");
		
		return purchaseService.getPurchase2(prodNo);
		
	}
	
	

	@RequestMapping(value="json/listPurchase")
	public Map<String,Object> listPurchase(@RequestBody Search search) throws Exception{
		
		System.out.println("/json/purchase/listPurchase");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(-1);
		}
		
		search.setPageSize(pageSize);

		Map<String, Object> map = purchaseService.getPurchaseList(search, "user10");
		
		Page resultPage = new Page(search.getCurrentPage(), 
									((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(">>>"+map.get("list")+"<<<");
			
		return map;
	}

}
