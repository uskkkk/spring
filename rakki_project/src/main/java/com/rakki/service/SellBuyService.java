package com.rakki.service;

import com.rakki.domain.BuyVo;
import com.rakki.domain.PriceListVo;
import com.rakki.domain.SellVo;

public interface SellBuyService {
	PriceListVo getBuyPriceList(Long product_no);
	PriceListVo getSellPriceList(Long product_no);
	PriceListVo getSellCheck(Long product_no);
	PriceListVo getSellConfirm(Long product_no, String sizeType);
	String modify_sell(SellVo sell);
	String modify_buy(BuyVo buy);
}
