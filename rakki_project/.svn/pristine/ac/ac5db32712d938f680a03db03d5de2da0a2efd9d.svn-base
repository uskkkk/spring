package com.rakki.controller;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.rakki.domain.Criteria;
import com.rakki.domain.NoticeVo;
import com.rakki.domain.PageDTO;
import com.rakki.domain.ProductVo;
import com.rakki.domain.TradeVo;
import com.rakki.service.GoodsService;
import com.rakki.service.NoticeService;
import com.rakki.service.ProductService;
import com.rakki.service.SalesService;
import com.rakki.service.TradeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	private ProductService service;
	private GoodsService service1;
	private NoticeService service2;
	private TradeService service3;
	private SalesService service4;
	
	@GetMapping("mProductList")
	public void list(Model model,Criteria cri) {
		log.info("list page");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("page", new PageDTO(service.getTotal(cri), cri));
		model.addAttribute("total", service.getTotal(cri));
	}

	@GetMapping("mRegisterProduct")
	public void register(){
		log.info("registerPage");
	}

	@PostMapping("mRegisterProduct")
	public String register(ProductVo productVo, RedirectAttributes rttr) {
		log.info("POST register Page");
		log.info("register::" + productVo);
		service.register(productVo);
		log.info("register::" + productVo);
		rttr.addFlashAttribute("result", productVo.getProduct_no());
		return "redirect:/admin/mProductList";
	}

	@GetMapping("mNoticeRegister")
	public void noticeRegister(){
		log.info("noticeRegister");
	}

	@PostMapping("mNoticeRegister")
	public String noticeRegister(NoticeVo noticeVo, RedirectAttributes rttr) {
		log.info("POST register Page");
		log.info("register::" + noticeVo);
		service2.register(noticeVo);
		log.info("register::" + noticeVo);
		rttr.addFlashAttribute("result", noticeVo.getNno());
		return "redirect:/admin/mNoticeList1";
	}

	@GetMapping({"mNoticeList", "mNoticeList1"})
	public void noticelist(Model model, Criteria cri){
		log.info("notice.list");
		model.addAttribute("list", service2.getList(cri));
		model.addAttribute("total", service2.getTotal(cri));
		model.addAttribute("page", new PageDTO(service2.getTotal(cri), cri));
	}

	@GetMapping({"mNoticeDetail", "mNoticeModify", "mNoticeDetail1"})
	public void get(@RequestParam("nno") Long nno, Model model, @ModelAttribute("cri") Criteria cri){
		log.info("noticeDetail page");
		model.addAttribute("notice", service2.get(nno));
	}

	@PostMapping("mNoticeModify")
	public String modify(NoticeVo noticeVo, RedirectAttributes rttr, Criteria cri){
		log.info("modify :: " + noticeVo);
		if(service2.modify(noticeVo)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/mNoticeList1";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("nno") Long nno, RedirectAttributes rttr, Criteria cri, String writer){
		log.info("remove :: " + nno);
		if(service2.remove(nno)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/mNoticeList1";
	}

	@GetMapping("mTrade")
	public void checkTrade(Model model,Criteria cri){
		log.info("checkTrade");
		model.addAttribute("list", service1.getList(cri));
		model.addAttribute("page", new PageDTO(service1.getTotal(cri), cri));
		model.addAttribute("total", service1.getTotal(cri));
	}
	
	@GetMapping("mOnTrade")
	public void checkOnTrade(Model model,Criteria cri){
		log.info("checkTrade");
		model.addAttribute("list", service3.getList(cri));
		model.addAttribute("page", new PageDTO(service3.getTotal(cri), cri));
		model.addAttribute("total", service3.getTotal(cri));
	}
	
	@GetMapping("mSellStatCheck")
	public void sStat(@RequestParam("tradeNo") Long tradeNo, Model model, @ModelAttribute("cri") Criteria cri){
		model.addAttribute("trade", tradeNo);
	}
	
	@PostMapping("mSellStatCheck")
	public String sStatUpdate(@RequestParam("tradeNo") Long tradeNo, @RequestParam("sellStatus") String sellStatus, RedirectAttributes rttr, Criteria cri){
		TradeVo vo = new TradeVo();
		vo.setSell_stat(sellStatus);
		vo.setTradeNo(tradeNo);
		service3.sellStatUpdate(vo);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/mOnTrade";
	}
	
	@GetMapping("mBuyStatCheck")
	public void bStat(@RequestParam("tradeNo") Long tradeNo, Model model, @ModelAttribute("cri") Criteria cri){
		model.addAttribute("trade", tradeNo);
	}
	
	@PostMapping("mBuyStatCheck")
	public String bStatUpdate(@RequestParam("tradeNo") Long tradeNo, @RequestParam("buyStatus") String buyStatus, RedirectAttributes rttr, Criteria cri){
		TradeVo vo = new TradeVo();
		vo.setBuy_stat(buyStatus);
		vo.setTradeNo(tradeNo);
		service3.buyStatUpdate(vo);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/mOnTrade";
	}
	
	@GetMapping("year/{year}")
	public String yearIncome(@ModelAttribute @PathVariable String year, Model model) {
		log.info("year..." );
		model.addAttribute("year", service4.yearIncome(year));
		model.addAttribute("year1", year);
		return "admin/mYearIncome";
	}
	
	@PostMapping("year/{year}")
	public String yearIncome(@RequestParam("year") String year, RedirectAttributes rttr) {
		log.info("POST yearIncome Page");
		log.info("register::" + year);
		return "redirect:/admin/year/" + year;
	}
	
	@GetMapping("month/{year}")
	public String monthIncome(@ModelAttribute @PathVariable String year, Model model) {
		log.info("month..." + year);
		model.addAttribute("month", service4.monthIncome(year));
		return "admin/mMonthIncome";
	}
	
	@PostMapping("month/{year}")
	public String monthIncome(@RequestParam("year") String year, RedirectAttributes rttr) {
		log.info("POST yearIncome Page");
		log.info("register::" + year);
		return "redirect:/admin/month/" + year;
	}
	
	@GetMapping("day/{month}")
	public String dayIncome(@ModelAttribute @PathVariable String month, Model model) {
		log.info("month..." + month);
		model.addAttribute("day", service4.dayIncome(month));
		return "admin/mDayIncome";
	}
	
	@PostMapping("day/{month}")
	public String dayIncome(@RequestParam("month") String month, RedirectAttributes rttr) {
		log.info("POST yearIncome Page");
		log.info("register::" + month);
		return "redirect:/admin/day/" + month;
	}
}