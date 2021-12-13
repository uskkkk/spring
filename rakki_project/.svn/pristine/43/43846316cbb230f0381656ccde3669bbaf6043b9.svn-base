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
public class SalesMappertests {

	@Autowired @Setter
	private SalesMapper mapper;
	
	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testYearIncome() {
		log.info(mapper.yearIncome("2021"));
	}
	
	@Test
	public void testMonthIncome() {
		mapper.monthIncome("2021").forEach(log::info);
	}
	
	@Test
	public void testDayIncome() {
		mapper.dayIncome("11").forEach(log::info);
	}
}
