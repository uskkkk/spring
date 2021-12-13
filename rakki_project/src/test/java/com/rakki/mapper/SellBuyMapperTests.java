package com.rakki.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.BuyVo;
import com.rakki.domain.PriceListVo;
import com.rakki.domain.SellVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SellBuyMapperTests {

	@Autowired @Setter
	private SellBuyMapper mapper;
	
	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	//상품품목키, 사이즈별 구입 가격리스트 취득	
	@Test
	public void testGetBuyPriceList() {
		log.info(mapper.getBuyPriceList(361L));
	}
	
	//상품품목키, 사이즈별 판매 가격리스트 취득	
	@Test
	public void testSellBuyPriceList() {
		log.info(mapper.getSellPriceList(361L));
	}
	
	//판매 체크용 화면 정보취득	
	@Test
	public void testSellCheck() {
		log.info(mapper.getSellCheck(361L));
	}
	
	//판매 확인용 화면 정보취득	
	@Test
	public void testSellConfirm() {
		log.info(mapper.getSellConfirm(361L, "265"));
	}
	
	//판매입찰,즉시판매 등록용	
	@Test
	public void testInsertSellGoods() {
		SellVo sellvo = new SellVo();
		
		sellvo.setSeller_goods_no(8L);
		sellvo.setId("BABAMBA");
		sellvo.setProduct_no("361");
		sellvo.setSize_type("255");
		sellvo.setSell_price(39000L);
		sellvo.setSell_flg("1");
		sellvo.setGoods_stat("0");
		sellvo.setTradeNo(1L);
		
		mapper.insertSellGoods(sellvo);
	}
	
	//즉시판매 등록용	
	@Test
	public void testInsertSellTrade() {
		SellVo sellvo = new SellVo();
		sellvo.setTradeNo(100L);
		sellvo.setBuyer_goods_no(10L);
		sellvo.setSeller_goods_no(11L);
		sellvo.setProduct_no("361");
		
		mapper.insertSellTrade(sellvo);
	}
	
	
	//판매입찰용	
	@Test
	public void testInsertSellGoods_NullTradeNo() {
		SellVo sellvo = new SellVo();
		
		sellvo.setSeller_goods_no(7L);
		sellvo.setId("BABAMBA");
		sellvo.setProduct_no("361");
		sellvo.setSize_type("255");
		sellvo.setSell_price(39000L);
		sellvo.setSell_flg("1");
		sellvo.setGoods_stat("0");
		
		mapper.insertSellGoods_NullTradeNo(sellvo);
	}
	
	//구매자 상품등록번호 취득		
	@Test
	public void testGetBuyGoodsNo() {
		SellVo sellvo = new SellVo();
		
		sellvo.setProduct_no("361");
		sellvo.setSize_type("255");
		sellvo.setSell_price(39000L);
		log.info(mapper.getBuyGoodsNo(sellvo));
	}	
	
	//새 상품등록번호 취득	
	@Test
	public void testGetNewGoodsNo() {
		log.info(mapper.getNewGoodsNo());
	}	
	
//	//즉시판매시 구매자 상품정보 갱신
//	void updateBuyGoods(SellVo sell);
	@Test
	public void testUpdateBuyGoods() {
		SellVo sellvo = new SellVo();
		sellvo.setGoods_stat("1");
		sellvo.setTradeNo(5L);
		sellvo.setBuyer_goods_no(8L);
		mapper.updateBuyGoods(sellvo);
	}
	
//	//판매자 상품등록번호 취득
	@Test
	public void testGetSellerGoodsNo() {
		BuyVo buy = new BuyVo();
		buy.setProduct_no("361");
		buy.setSize_type("235");
		buy.setBuy_price(60000L);		
		log.info(mapper.getSellerGoodsNo(buy));
	}	
	

	//거래번호 취득
	@Test
	public void testGetNewTradeNo() {
		log.info(mapper.getNewTradeNo());
	}	
	
	//즉시구매 등록용 (거래정보)
	@Test
	public void testInsertBuyTrade() {
		BuyVo buy = new BuyVo();
		buy.setTradeNo(5L);
		buy.setBuyer_goods_no(101L);
		buy.setSeller_goods_no(102L);
		buy.setProduct_no("361");	
		mapper.insertBuyTrade(buy);
	}	
	
	//즉시구매 등록용 (상품정보)
	@Test
	public void testInsertBuyGoods() {
		BuyVo buy = new BuyVo();
		buy.setTradeNo(5L);
		buy.setBuyer_goods_no(101L);
		buy.setId("BABAMBA");
		buy.setSize_type("240");
		buy.setBuy_price(50000L);	
		buy.setProduct_no("361");	
		buy.setGoods_stat("1");
		mapper.insertBuyGoods(buy);
	}	
	
	//즉시구매시 판매자 상품정보 갱신
	@Test
	public void testUpdateSellGoods() {
		BuyVo buy = new BuyVo();
		buy.setTradeNo(5L);
		buy.setSeller_goods_no(102L);
		buy.setGoods_stat("1");
		mapper.updateSellGoods(buy);
	}
	
	//구매입찰용 등록용(상품정보)
	@Test
	public void InsertBuyGoods_NullTradeNo() {
		BuyVo buy = new BuyVo();
		buy.setBuyer_goods_no(103L);
		buy.setId("BABAMBA");
		buy.setProduct_no("361");	
		buy.setSize_type("245");
		buy.setBuy_price(55000L);	
		buy.setGoods_stat("0");
		mapper.insertBuyGoods_NullTradeNo(buy);
	}	

}
