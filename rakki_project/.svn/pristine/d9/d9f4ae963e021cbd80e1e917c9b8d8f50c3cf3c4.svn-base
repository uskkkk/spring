package com.rakki.service;

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
public class SalesServiceTests {
	@Setter @Autowired
	private SalesService service;
	
	@Test
	public void testExist(){
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testYearIncome() {
		log.info(service.yearIncome("2021"));
	}
	
	@Test
	public void testMonthIncome() {
		service.monthIncome("2021").forEach(log::info);
	}
	
	@Test
	public void testDayIncome() {
		service.dayIncome("15").forEach(log::info);
	}
}
