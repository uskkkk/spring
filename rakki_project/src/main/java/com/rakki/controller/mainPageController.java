package com.rakki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rakki.domain.Criteria;
import com.rakki.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("rakki/*")
@AllArgsConstructor
public class mainPageController {
	private ProductService productService;	
	
	@GetMapping("main")
	public void main(Model model,Criteria cri){
		log.info("mainPage");
		cri.setAmount(10);
		cri.setType("C");
		cri.setKeyword("1");
		model.addAttribute("list",productService.getList(cri));
		cri.setAmount(10);
		cri.setType("C");
		cri.setKeyword("0");
		model.addAttribute("list2",productService.getList(cri));
	}
}
