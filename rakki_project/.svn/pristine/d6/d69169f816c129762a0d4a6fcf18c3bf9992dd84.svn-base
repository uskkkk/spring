package com.rakki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rakki.domain.Criteria;
import com.rakki.domain.PageDTO;
import com.rakki.domain.ProductVo;
import com.rakki.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("product/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;	
	
//	public static void main(String[] args) {
//		service.getList().forEach(System.out::println);
//	}
	
	@GetMapping("list")
	public void list(Model model,Criteria cri) {
		log.info("list page");
		model.addAttribute("list",productService.getList(cri));
		model.addAttribute("page",new PageDTO(productService.getTotal(cri), cri));
	}
	
	@GetMapping("register")
	public void register(){
		log.info("registerPage");
	}
	
	@PostMapping("register")
	public String register(ProductVo productVo, RedirectAttributes rttr) {
		log.info("POST register Page");
		
		log.info("register::" + productVo);
		productService.register(productVo);
		log.info("register::" + productVo);
		rttr.addFlashAttribute("result", productVo.getProduct_no());
		return "redirect:/product/list";
	}
	
	/*
	 * @김기락
	 * 211026 
	 * 디테일 페이지 연결 테스트 용 get매핑 추가
	 * @서정목
	 * 211030
	 * 디테일표시용 정보 취득후 result에 전달추가
	 */
	@GetMapping("detail")
	public void detail(Long product_no, Model model){
		ProductVo productVo = productService.getProductInfo(product_no);
		model.addAttribute("result",productVo);
		log.info("detail::" + productVo);
	}
	
	/*
	 * @김기락
	 * 211030
	 * shop 페이지 연결 테스트 
	 */
	@GetMapping("shop")
	public void shop(Model model,Criteria cri) {
		log.info("shop");
		cri.setAmount(12);
		model.addAttribute("list",productService.getList(cri));
		model.addAttribute("page",new PageDTO(productService.getTotal(cri), cri));	
		
	}
}
