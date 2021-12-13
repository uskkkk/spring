package com.rakki.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rakki.service.SalesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller @AllArgsConstructor @Log4j
public class SalesController {
	private SalesService salesService;
	
	@ResponseBody @GetMapping("salesM/{year}")
	public List<Map<String, Object>> getYearIncome(@PathVariable String year) {
		return salesService.monthIncome(year);
	}
	
	@ResponseBody @GetMapping("salesD/{month}")
	public List<Map<String, Object>> getDayIncome(@PathVariable String month) {
		return salesService.dayIncome(month);
	}
}
