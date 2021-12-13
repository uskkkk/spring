package com.rakki.service;

import java.util.List;

import com.rakki.domain.CountListVo;
import com.rakki.domain.SellingListVo;

public interface SellingService {
	CountListVo getSellingCount(String id);
	List<SellingListVo> getSellingList(String id);

}
