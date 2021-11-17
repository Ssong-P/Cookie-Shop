package com.model2.mvc.web.purchase;

import java.io.PushbackReader;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
public class PurchaseController {
	
	//Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
//	// 와이어링은 각각 , 한번 해주면 안해줘도 OK
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	ModelAndView modelAndView;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping("/addPurchaseView.do")
	public String addPurchaseView( @RequestParam("prodNo") int prodNo, Model model ) throws Exception {
		
		System.out.println("/addPurchaseView.do"+prodNo);

		Product product = productService.getProduct(prodNo);
		model.addAttribute("product",product);
		
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	
	@RequestMapping("/addPurchase.do")
	public String addPurchase( @ModelAttribute("purchase") Purchase purchase, Model model) throws Exception{
		
		System.out.println("/addPurchase.do");
		purchase.setTranCode("001");
		System.out.println(":: Controller ::"+purchase);
		purchaseService.addPurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
	
	@RequestMapping("/getPurchase.do")
	public String getPurhcase(@RequestParam("tranNo") int tranNo, Model model) throws Exception {
		
		System.out.println("/getPurhcase.do");
		Purchase purchase = purchaseService.getPurchase(tranNo);
		model.addAttribute("purchase", purchase);
		
		return "forward:purchase/getPurchase.jsp";
	}
	
	@RequestMapping("/getPurchase2.do")
	public String getPurchase2(@RequestParam("prodNo") int prodNo, int tranNo, Model model) throws Exception{
		
		System.out.println("/getPurhcase.do");
		Purchase purchase = purchaseService.getPurchase(prodNo);
		model.addAttribute("purchase", purchase);
		
		return "forward:purchase/getPurchase.jsp";
		
	}
	
	
	@RequestMapping("/updatePurchaseView.do")
	public String updatePurchaseView ( @RequestParam("tranNo") int tranNo, Model model ) throws Exception {
		
		System.out.println("/updatePurchaseView.do");
		Purchase purchase = purchaseService.getPurchase(tranNo);
		model.addAttribute("purchase",purchase);
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	@RequestMapping("/updatePurchase.do")
	public String updatePurchase(@ModelAttribute("purchase")Purchase purchase, Model model, HttpSession session) throws Exception{

		System.out.println("/updatePurchase.do");
		
		purchaseService.updatePurchase(purchase);

		int sessionNo=((Purchase)session.getAttribute("purchase")).getTranNo();
		if(sessionNo == purchase.getTranNo()) {
			session.setAttribute("purchase", purchase);
		}
		
		return "redirect:/getPurchase.do?tranNo="+purchase.getTranNo();
	}
	
	@RequestMapping("/listPurchase.do")
	public String listPurchase(@ModelAttribute("search")Search search, Model model,
			HttpSession session ,HttpServletRequest request) throws Exception{
		
		System.out.println("/listPurchase.do");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		Map<String, Object> map = purchaseService.getPurchaseList(search, ((User)session.getAttribute("user")).getUserId());
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(":: Controller ::"+resultPage);
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search",search);
		
		return "forward:/purchase/listPurchase.jsp";
		
	}
	
	@RequestMapping("/updateTranCodeByProd.do")
	public String UpdateTranCodeByProd( @RequestParam("prodNo") int prodNo, 
			@RequestParam("tranCode") int tranCode ,Model model) throws Exception{
		
		System.out.println("updateTranCodeProduct :: /listProduct.do");
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		
		if(purchase.getTranCode().equals("002")) { 
			purchase.setTranCode("003");
			purchaseService.updateTranCode(purchase);
			return "forward:/listPurchase.do";
		}
		
		
		purchase.setTranCode("002");

		purchaseService.updateTranCode(purchase);
		
		
		
		
		return "redirect:/listProduct.do?menu=manage";
	}
	

}
