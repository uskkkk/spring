package com.rakki.mapper;

import java.util.List;

import com.rakki.domain.Criteria;
import com.rakki.domain.GoodsVo;

public interface GoodsMapper {
	List<GoodsVo> getTradeList();
	List<GoodsVo> getListWithPaging(Criteria cri);
	int getTotalCount(Criteria cri);
}
