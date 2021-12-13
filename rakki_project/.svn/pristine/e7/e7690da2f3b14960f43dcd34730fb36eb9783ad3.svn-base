package com.rakki.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rakki.domain.BuyingListVo;
import com.rakki.domain.CountListVo;
import com.rakki.mapper.BuyingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BuyingServiceImpl implements BuyingService {

	BuyingMapper mapper;

	@Override
	public CountListVo getBuyingCount(String id) {
		// TODO Auto-generated method stub
		return mapper.getBuyingCount(id);
	}

	@Override
	public List<BuyingListVo> getBuyingList(String id) {
		// TODO Auto-generated method stub
		return mapper.getBuyingList(id);
	}



}
