package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
public class ProductController {

	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	ModelAndView modelAndView ;
	
	public ProductController() {				
		System.out.println(this.getClass()+"default Constructor");
		modelAndView = new ModelAndView();
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	
	@RequestMapping("/addProductView.do")
	public ModelAndView addProductView() throws Exception{
		
		System.out.println("/addProductView.do");

		modelAndView.setViewName("forward:/product/addProductView.jsp");
		
		return modelAndView;
		
	}
	
	
	@RequestMapping("/addProduct.do")
	public ModelAndView addProduct(@ModelAttribute("product") Product product, 
									HttpServletRequest request, HttpSession session) 
								throws Exception{
		
		System.out.println("/addProduct.do");
		
		product.setProTranCode("000");
		
		productService.addProduct(product);
		session.setAttribute("product", product);
		
		System.out.println(">>>>>>>>>>"+product.getProTranCode()+"<<<<<<<<<<<");
		
		modelAndView.setViewName("redirect:/product/addProduct.jsp");
		
		// 리턴값이 null이다~
		return modelAndView;
	}
	
	
	@RequestMapping("/getProduct.do")
	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo, 
								HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println(":: getProduct ::");
		
		Product product = productService.getProduct(prodNo);	
		modelAndView.addObject("product", product);
		
		String menu = request.getParameter("menu");
		if(menu.equals("manage")) {
			modelAndView.setViewName("forward:/updateProductView.do");
			return modelAndView;
		}
		
		modelAndView.setViewName("forward:/product/getProduct.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/listProduct.do")
	public ModelAndView listProduct( @ModelAttribute("search") Search search, HttpSession session) throws Exception{
		
		System.out.println("/listProduct.do");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("product :: " + search);
		
		Map<String, Object> map = productService.getProductList(search);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!"+map.get("list"));
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
	
		modelAndView.setViewName("forward:/product/listProduct.jsp");
		
		return modelAndView;
	}
	
	
	
	@RequestMapping("/updateProductView.do")
	public ModelAndView updateProductView( @RequestParam("prodNo") int prodNo
											, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("/updateProductView.do");
		
		Product product = productService.getProduct(prodNo);
		modelAndView.addObject("product", product);
		
		modelAndView.setViewName("forward:/product/updateProductView.jsp");
		
		return modelAndView;
	}
	
	
	
	@RequestMapping("/updateProduct.do")
	public ModelAndView updateProduct( @ModelAttribute("product") Product product, 
										HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/updateProduct.do");
		
		productService.updateProduct(product);
		session.setAttribute("product", product);
		
		modelAndView.addObject("product", product);
		modelAndView.setViewName("redirect:/getProduct.do?prodNo="+product.getProdNo()+"&menu=search");
		
		return modelAndView;
	}
	
	
	
	

}
