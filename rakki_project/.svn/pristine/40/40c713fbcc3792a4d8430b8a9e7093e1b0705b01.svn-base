package com.rakki.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rakki.domain.Criteria;
import com.rakki.domain.GoodsVo;
import com.rakki.domain.ProductVo;
import com.rakki.mapper.GoodsMapper;
import com.rakki.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class GoodsServiceImpl implements GoodsService {

	GoodsMapper mapper;

	@Override
	public List<GoodsVo> getList() {
		return mapper.getTradeList();
	}

	@Override
	public List<GoodsVo> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
