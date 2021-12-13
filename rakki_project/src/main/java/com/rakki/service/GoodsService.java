package com.rakki.service;

import java.util.List;

import com.rakki.domain.Criteria;
import com.rakki.domain.GoodsVo;

public interface GoodsService {
	List<GoodsVo> getList();
	List<GoodsVo> getList(Criteria cri);
	int getTotal(Criteria cri);

}
