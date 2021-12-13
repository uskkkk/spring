package com.rakki.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GoodsMapperTests {

	@Autowired @Setter
	private GoodsMapper mapper;
	
	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetList() {
		mapper.getTradeList().forEach(System.out::println);
		
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
}
