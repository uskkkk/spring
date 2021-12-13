package com.rakki.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rakki.domain.CountListVo;
import com.rakki.domain.SellingListVo;
import com.rakki.mapper.SellingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SellingServiceImpl implements SellingService {
	
	SellingMapper mapper;
	
	@Override
	public CountListVo getSellingCount(String id) {
		return mapper.getSellingCount(id);
	}

	@Override
	public List<SellingListVo> getSellingList(String id) {
		return mapper.getSellingList(id);
	}

}
