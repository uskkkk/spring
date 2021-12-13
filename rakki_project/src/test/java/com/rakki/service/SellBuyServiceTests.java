package com.rakki.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.BuyVo;
import com.rakki.domain.SellVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SellBuyServiceTests {
	@Setter @Autowired
	private SellBuyService service;
	
	@Test
	public void testExist(){
		assertNotNull(service);
		log.info(service);
	}
	
	@Test  //getBuyPriceList
	public void testGetBuyPriceList() {
		log.info(service.getBuyPriceList(361L));
	}
	@Test
	public void testGetSellPriceList() {
		log.info(service.getSellPriceList(361L));
	}
	@Test
	public void testGetSellCheck() {
		log.info(service.getSellCheck(361L));
	}
	@Test
	public void testGetSellConfirm() {
		log.info(service.getSellConfirm(361L, "265"));
	}
	
	@Test
	public void testModify_sell() {
		SellVo sell = new SellVo();
		sell.setSell_flg("1");
		sell.setSeller_goods_no(104L);
		sell.setId("BABAMBA");
		sell.setProduct_no("361");
		sell.setSize_type("275");
		sell.setSell_price(39000L);
		sell.setGoods_stat("0");		
			
		log.info(service.modify_sell(sell));
	}
	
	@Test
	public void testModify_buy() {
		BuyVo buy = new BuyVo();
		buy.setBuy_flg("1");
		buy.setBuyer_goods_no(105L);
		buy.setId("BABAMBA");
		buy.setProduct_no("361");	
		buy.setSize_type("280");
		buy.setBuy_price(55000L);	
		buy.setGoods_stat("0");		
		log.info(service.modify_buy(buy));
	}
	
	
	
	
	
}
