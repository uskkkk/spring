package com.rakki.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rakki.domain.BuyVo;
import com.rakki.domain.PriceListVo;
import com.rakki.domain.SellVo;
import com.rakki.mapper.SellBuyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SellBuyServiceImpl implements SellBuyService  {

	SellBuyMapper mapper;
	
	//상품품목키, 사이즈별 구입 가격리스트 취득
	@Override
	public PriceListVo getBuyPriceList(Long product_no) {
		return mapper.getBuyPriceList(product_no);
	}

	//상품품목키, 사이즈별 판매 가격리스트 취득
	@Override
	public PriceListVo getSellPriceList(Long product_no) {
		return mapper.getSellPriceList(product_no);
	}

	//상품품목키, 판매 체크화면용 정보취득
	@Override
	public PriceListVo getSellCheck(Long product_no) {
		return mapper.getSellCheck(product_no);
	}

	//상품품목키, 판매 컨펌화면용 정보취득
	@Override
	public PriceListVo getSellConfirm(Long product_no, String sizeType) {
		return mapper.getSellConfirm(product_no, sizeType);
	}

	//판매입찰, 즉시판매등록
	@Override  @Transactional
	public String modify_sell(SellVo sell) {
		String msg = "";
		if (sell.getSell_flg().equals("2")){
			//즉시판매
			sell.setBuyer_goods_no(mapper.getBuyGoodsNo(sell));     // 구입자 상품등록번호 취득
			sell.setSeller_goods_no(mapper.getNewGoodsNo());        // 판매자 상품등록번호 취득
			sell.setTradeNo(mapper.getNewTradeNo());                // 거래정보번호 취득
			sell.setGoods_stat("1");                                // 거래상태:거래체결
			
			System.out.println("SellVo::"+sell);
			
			mapper.insertSellTrade(sell);                           // 거래체결 정보 등록
			mapper.insertSellGoods(sell);                           // 판매자 상품테이블 등록   //판매입찰,즉시판매
			mapper.updateBuyGoods(sell);                            // 구입자 상품테이블 거래상태정보 갱신 :  거래중 -> 거래체결
			msg = "즉시판매: 거래번호" + sell.getTradeNo() + "번 등록완료";
		} else {
			//거래중
			sell.setSeller_goods_no(mapper.getNewGoodsNo());        // 판매자 상품등록번호 취득
			sell.setGoods_stat("0");  
			mapper.insertSellGoods_NullTradeNo(sell);               // 판매자 상품테이블 등록   //판매입찰,즉시판매
			msg = "구매입찰: 상품번호" + sell.getSeller_goods_no() + "번 등록완료";
		}
		return msg;
	}

	//구매입찰, 즉시구매등록
	@Override  @Transactional
	public String modify_buy(BuyVo buy) {
		String msg = "";
		if (buy.getBuy_flg().equals("2")){
			//즉시구매
			buy.setBuyer_goods_no(mapper.getNewGoodsNo());         // 구입자 상품등록번호 취득
			buy.setSeller_goods_no(mapper.getSellerGoodsNo(buy));  // 판매자 상품등록번호 취득
			buy.setTradeNo(mapper.getNewTradeNo());                // 거래정보번호 취득
			buy.setGoods_stat("1");                                // 거래상태:거래체결
			
			System.out.println("BuyVo::"+buy);
			
			mapper.insertBuyTrade(buy);                           // 거래체결 정보 등록
			mapper.insertBuyGoods(buy);                           // 구입자 상품테이블 등록   //판매입찰,즉시판매
			mapper.updateSellGoods(buy);                          // 판매자상품테이블 거래상태정보 갱신 :  거래중 -> 거래체결
			msg = "즉시구매: 거래번호" + buy.getTradeNo() + "번 등록완료";
		} else {
			//거래중
			buy.setBuyer_goods_no(mapper.getNewGoodsNo());        // 구매자 상품등록번호 취득
			buy.setGoods_stat("0");  
			
			//System.out.println("BuyVo::"+buy);
			mapper.insertBuyGoods_NullTradeNo(buy);               // 구매자 상품테이블 등록   //판매입찰,즉시판매
			msg = "구매입찰: 상품번호" + buy.getBuyer_goods_no() + "번 등록완료";
		}
		return msg;
	}


}
