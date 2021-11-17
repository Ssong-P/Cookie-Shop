package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	// ���� ������ ����
	private static final String FILE_SERVER_PATH = "C:\\Users\\songs\\git\\mini_PJT\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles\\";

	

	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {
		
		System.out.println(":: product/addProduct : GET");

		return "forward:/product/addProductView.jsp";
		
	}
	
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,
									@RequestParam("fileName1") MultipartFile file, 
									 Model model) throws Exception {
	
		System.out.println(":: /product/addProduct : POST");
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			model.addAttribute("msg", "File uploaded successfully.");
		}else {
			model.addAttribute("msgs", "Please select a valid mediaFile..");
		}
		
		product.setFileName(file.getOriginalFilename());
		
		productService.addProduct(product);
		
		model.addAttribute("product",product);
		
		return "forward:/product/addProduct.jsp";
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
			modelAndView.setViewName("forward:/product/updateProduct");
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
	
	
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo, 
									Model model) throws Exception {
						
		System.out.println(":: product/updateProduct : GET");
		
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product",product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, 
										@RequestParam("fileName1") MultipartFile file, 
										Model model, HttpSession session) throws Exception {
	
		System.out.println(":: product/updateProduct : POST");
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			model.addAttribute("msg", "File uploaded successfully.");
		}else {
			model.addAttribute("msgs", "Please select a valid mediaFile..");
		}
		
		product.setFileName(file.getOriginalFilename());
		productService.updateProduct(product);
		
		session.setAttribute("product", product);
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=search";
	}

}
