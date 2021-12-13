package com.rakki.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.BuyingListVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BuyingMapperTests {
	@Autowired @Setter
	private BuyingMapper mapper;

	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetBuyingCount() {
		log.info(mapper.getBuyingCount("member7"));
	}
	@Test
	public void testGetBuyingList() {
		mapper.getBuyingList("member7").forEach(log::info);;
	}
	
	
}
