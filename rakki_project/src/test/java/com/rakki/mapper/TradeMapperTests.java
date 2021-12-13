package com.rakki.mapper;

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
public class TradeMapperTests {

	@Autowired @Setter
	private TradeMapper mapper;
	
	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetList() {
		mapper.getOnTradeList().forEach(System.out::println);
		
//		log.info(mapper.getTradeList());
	}
	
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria(1,10);
		mapper.getListWithPaging(cri).forEach(log::info);
	}
	
	@Test 
	public void testGetTotalCount() {
		Criteria cri = new Criteria(1,10);
		log.info(mapper.getTotalCount(cri));	
	}
	
	@Test
	public void testSellStatUpdate() {
		TradeVo vo = new TradeVo();
		vo.setSell_stat("배송중");
		vo.setTradeNo(63L);
		mapper.sellStatUpdate(vo);
	}
	
	@Test
	public void testBuyStatUpdate() {
		TradeVo vo = new TradeVo();
		vo.setBuy_stat("검수중");
		vo.setTradeNo(65L);
		mapper.buyStatUpdate(vo);
	}
	
}
