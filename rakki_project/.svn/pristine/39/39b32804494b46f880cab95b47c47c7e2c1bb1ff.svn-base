package com.rakki.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.Criteria;
import com.rakki.domain.TradeVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TradeServiceTests {
	@Setter @Autowired
	private TradeService service;
	
	@Test
	public void testExist(){
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(System.out::println);
		
//		log.info(mapper.getTradeList());
	}
	
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria(1,10);
		service.getList(cri).forEach(log::info);
	}
	
	@Test 
	public void testGetTotalCount() {
		Criteria cri = new Criteria(1,10);
		log.info(service.getTotal(cri));	
	}
	
	@Test
	public void testSellStatUpdate() {
		TradeVo vo = new TradeVo();
		vo.setSell_stat("배송완료");
		vo.setTradeNo(63L);
		service.sellStatUpdate(vo);
	}
	
	@Test
	public void testBuyStatUpdate() {
		TradeVo vo = new TradeVo();
		vo.setBuy_stat("배송중");
		vo.setTradeNo(65L);
		service.buyStatUpdate(vo);
	}
}
