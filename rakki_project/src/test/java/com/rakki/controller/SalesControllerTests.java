package com.rakki.controller;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
@WebAppConfiguration
public class SalesControllerTests {
	@Autowired @Setter
	private WebApplicationContext ctx;	
	
	private MockMvc mvc;
	
	@Before
	public void setup() {
		mvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testExists() {
		assertNotNull(ctx);
		assertNotNull(mvc);
		log.info(ctx);
		log.info(mvc);
	}
	
	// 월별 매출액 차트 Get / 성공
	@WithMockUser
	@Test
	public void testMonthIncomeChartGet() throws Exception{
		 mvc.perform(MockMvcRequestBuilders.get("/salesM/2021").param("year", "2021"))
				.andReturn()
				.getModelAndView();
	}
	
	// 일별 매출액 차트 Get / 성공
	@WithMockUser
	@Test
	public void testDayIncomeChartGet() throws Exception{
		 mvc.perform(MockMvcRequestBuilders.get("/salesD/11").param("month", "11"))
				.andReturn()
				.getModelAndView();
	}
}
