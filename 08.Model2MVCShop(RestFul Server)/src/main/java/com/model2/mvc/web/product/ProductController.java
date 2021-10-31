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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
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

	
	
	//@RequestMapping("/addProductView.do")
	//public ModelAndView addProductView() throws Exception{
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public ModelAndView addProduct() throws Exception {
		
		System.out.println(":: product/addProduct : GET");

		modelAndView.setViewName("forward:/product/addProductView.jsp");
		
		return modelAndView;
		
	}
	
	
	//@RequestMapping("/addProduct.do")
	//public ModelAndView addProduct(@ModelAttribute("product") Product product, 
	//							HttpServletRequest request, HttpSession session) throws Exception{
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product,
									 HttpServletRequest request, HttpSession session) throws Exception {
	
		System.out.println(":: /product/addProduct : POST");
		
		productService.addProduct(product);
		session.setAttribute("product", product);
		
		modelAndView.setViewName("redirect:/product/addProduct.jsp");
		
		// ���ϰ��� null�̴�~
		return modelAndView;
	}
	
	
	//@RequestMapping("/getProduct.do")
	//public ModelAndView getProduct( @RequestParam("prodNo") int prodNo, 
	//							HttpServletRequest request, HttpSession session) throws Exception {
		
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo, 
										HttpServletRequest request,HttpServletResponse response,
										HttpSession session) throws Exception {
	
		System.out.println(":: /product/getProduct : GET");
		
		
		Product product = productService.getProduct(prodNo);
		
		modelAndView.addObject("product", product);
		
		String menu = request.getParameter("menu");
		if(menu.equals("manage")) {
			modelAndView.setViewName("redirect:/product/updateProduct");
			return modelAndView;
		}
		
		// cookies �ʱ�ȭ
		System.out.println("1��");
		
				Cookie cookies = null;
				System.out.println("2��");
				
				// jsp ���� ����Ʈ : history��� ������ ��Ʈ�� history�� ����
				String history = (String)session.getAttribute("history");
				
				// ���ʴ� ������ null
				if(history == null){
					System.out.println("ù���� ��Ű");
					//���ǿ� no�־���
					session.setAttribute("history",Integer.toString(prodNo));
					Cookie cookie = new Cookie("history", Integer.toString(prodNo));
					cookie.setMaxAge(-1);
					response.addCookie(cookie);
					
					// 2��° ����
				}else{
					System.out.println("�ι�° ��Ű");
					// ��Ű ���� : ���� ��Ű + ���ο� ��Ű
					String cnHistory = history+","+request.getParameter("prodNo");
					System.out.println("cnHistory : " + cnHistory);
					
					// ����� ������ �ٽ� history�� �־���
					session.setAttribute("history", cnHistory);
					// ����� ������ �ִ� ��Ű ����!
					Cookie cookie = new Cookie("history",cnHistory);
					cookie.setPath("/");
					cookie.setMaxAge(-1);
					response.addCookie(cookie);
				}
				System.out.println("��");
		modelAndView.setViewName("forward:/product/getProduct.jsp");
				
		return modelAndView;
	}
	
	//@RequestMapping("/listProduct.do")
	//public ModelAndView listProduct( @ModelAttribute("search") Search search, HttpSession session) throws Exception{
	@RequestMapping(value="listProduct")
	public ModelAndView listProduct( @ModelAttribute("search") Search search, HttpSession session) throws Exception {
	
	
		System.out.println(":: /product/listProduct : GET / POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("product :: " + search);
		
		Map<String, Object> map = productService.getProductList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		modelAndView.setViewName("forward:/product/listProduct.jsp");
		
		return modelAndView;
	}
	
	
	
	//@RequestMapping("/updateProductView.do")
	//public ModelAndView updateProductView( @RequestParam("prodNo") int prodNo
	//										, HttpServletRequest request, HttpSession session) throws Exception {
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public ModelAndView updateProduct( @RequestParam("prodNo") int prodNo, 
										HttpServletRequest request, HttpSession session) throws Exception {
						
		System.out.println(":: product/updateProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		modelAndView.addObject("product", product);
		
		modelAndView.setViewName("forward:/product/updateProductView.jsp");
		
		return modelAndView;
	}
	
	
	
	//@RequestMapping("/updateProduct.do")
	//public ModelAndView updateProduct( @ModelAttribute("product") Product product, 
	//									HttpServletRequest request, HttpSession session) throws Exception{
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public ModelAndView updateProduct( @ModelAttribute("product") Product product, 
										HttpServletRequest request, HttpSession session) throws Exception {
	
		System.out.println(":: product/updateProduct : POST");
		
		productService.updateProduct(product);
		session.setAttribute("product", product);
		
		modelAndView.addObject("product", product);
		modelAndView.setViewName("redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=search");
		
		return modelAndView;
	}

}
