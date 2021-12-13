package com.rakki.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SellingMapperTests {
	@Autowired @Setter
	private SellingMapper mapper;

	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetSellingCount() {
		log.info(mapper.getSellingCount("member7"));
	}
	@Test
	public void testGetSellingList() {
		mapper.getSellingList("member7").forEach(log::info);;
	}
	
	
}
