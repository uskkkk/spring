package com.rakki.mapper;

import java.util.List;

import com.rakki.domain.CountListVo;
import com.rakki.domain.SellingListVo;

public interface SellingMapper {
	//전 구매내역 건수취득
	CountListVo getSellingCount(String id);

	// 구매내역리스트 취득
	List<SellingListVo> getSellingList(String id);
}
