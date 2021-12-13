package com.rakki.service;

import java.util.List;
import java.util.Map;

public interface SalesService {
	Map<String, Object> yearIncome(String year);
	List<Map<String, Object>> monthIncome(String year);
	List<Map<String, Object>> dayIncome(String month);
}
