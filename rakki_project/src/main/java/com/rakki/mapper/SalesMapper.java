package com.rakki.mapper;

import java.util.List;
import java.util.Map;

public interface SalesMapper {
	Map<String, Object> yearIncome(String year);
	List<Map<String, Object>> monthIncome(String year);
	List<Map<String, Object>> dayIncome(String month);
}
