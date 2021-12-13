package com.rakki.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.rakki.mapper.SalesMapper;

import lombok.AllArgsConstructor;

@Service @AllArgsConstructor
public class SalesServiceImpl implements SalesService{
	private SalesMapper salesMapper;

	@Override
	public Map<String, Object> yearIncome(String year) {
		return salesMapper.yearIncome(year);
	}

	@Override
	public List<Map<String, Object>> monthIncome(String year) {
		return salesMapper.monthIncome(year);
	}

	@Override
	public List<Map<String, Object>> dayIncome(String month) {
		return salesMapper.dayIncome(month);
	}
}
