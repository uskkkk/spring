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
public class AdminControllerTests {
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
	
	// 상품목록 Get / 성공 
	@WithMockUser
	@Test
	public void testmProductList() throws Exception {
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/admin/mProductList")
		.param("pageNum", "1")
		.param("amount", "10")
		)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list=(List<?>) map.get("list");
		list.forEach(log::info);
	}	
	
	// 상품 등록 Get / 성공
	@WithMockUser
	@Test
	public void testmRegisterProductGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/mRegisterProduct"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 상품 등록 Post / 성공
	@WithMockUser
	@Test
	public void testmRegisterProductPost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/mRegisterProduct")
				.param("category", "1")
				.param("brand", "나이키")
				.param("serialNo", "ssdi15")
				.param("image", "test")
				.param("release", "2021-11-09")
				.param("name_ko", "컨트롤러 테스트 상품명 한글")
				.param("name_en", "컨트롤러 테스트 상품명 영어")
				.param("color", "white")
				.param("price_rel", "120000"))
				.andReturn()
				.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	
	// 공지사항 등록 Get / 성공
	@WithMockUser
	@Test
	public void testmNoticeRegisterGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/mNoticeRegister"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 공지사항 등록 Post / 성공
	@WithMockUser
	@Test
	public void testmNoticeRegisterPost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/mNoticeRegister")
				.param("title", "컨트롤러 테스트 제목2")
				.param("content", "컨트롤러 테스트 내용2")
				.param("regDate", "2021-11-09"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 공지사항 목록 (회원) Get / 성공
	@WithMockUser
	@Test
	public void testmNoticeListGet() throws Exception{
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/admin/mNoticeList")
		.param("pageNum", "1")
		.param("amount", "10")
		)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list=(List<?>) map.get("list");
		list.forEach(log::info);
	}
	
	// 공지사항 목록 (관리자) Get / 성공
	@WithMockUser
	@Test
	public void testmNoticeList1Get() throws Exception{
		ModelMap map = mvc.perform(MockMvcRequestBuilders.get("/admin/mNoticeList1")
		.param("pageNum", "1")
		.param("amount", "10")
		)
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		List<?> list=(List<?>) map.get("list");
		list.forEach(log::info);
	}
	
	// 공지사항 상세 (회원) Get / 성공
	@WithMockUser
	@Test
	public void testmNoticeDetailGet() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/admin/mNoticeDetail")
		.param("nno", "22")
		)
		.andReturn()
		.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 공지사항 상세 (관리자) Get / 성공
	@WithMockUser
	@Test
	public void testmNoticeDetail1Get() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/admin/mNoticeDetail1")
		.param("nno", "23")
		)
		.andReturn()
		.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 공지사항 수정 Get / 성공
	@WithMockUser
	@Test
	public void testmNoticeModifyGet() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/admin/mNoticeDetail1")
		.param("nno", "23")
		)
		.andReturn()
		.getModelAndView();
				
		log.info(mav.getViewName());
	}
	
	// 공지사항 수정 Post / 성공
	@WithMockUser
	@Test
	public void testmNoticeModifyPost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/mNoticeModify")
				.param("nno", "101")
				.param("title", "수정된 컨트롤러 테스트 제목")
				.param("content", "수정된 컨트롤러 테스트 내용"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 공지사항 삭제 Post / 성공
	@WithMockUser
	@Test
	public void testRemovePost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/remove")
				.param("nno", "102"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 거래대기 상품목록 Get / 성공
	@WithMockUser
	@Test
	public void testmTradeGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/mTrade"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 거래체결 상품목록 Get / 성공
	@WithMockUser
	@Test
	public void testmOnTradeGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/mOnTrade"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 거래체결 상품(판매자) 상태체크 페이지 Get / 성공
	@WithMockUser
	@Test
	public void testmSellStatCheckGet() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/admin/mSellStatCheck")
		.param("tradeNo", "81")
		)
		.andReturn()
		.getModelAndView();
				
		log.info(mav.getViewName());
	}
	
	// 거래체결 상품(판매자) 상태체크 Post / 성공
	@WithMockUser
	@Test
	public void testmSellStatCheckPost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/mSellStatCheck")
				.param("tradeNo", "85")
				.param("sellStatus", "물품확인"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 거래체결 상품(구매자) 상태체크 페이지 Get / 성공
	@WithMockUser
	@Test
	public void testmBuyStatCheckGet() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.get("/admin/mBuyStatCheck")
		.param("tradeNo", "82")
		)
		.andReturn()
		.getModelAndView();
				
		log.info(mav.getViewName());
	}
	
	// 거래체결 상품(구매자) 상태체크 Post / 성공
	@WithMockUser
	@Test
	public void testmBuyStatCheckPost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/mBuyStatCheck")
				.param("tradeNo", "101")
				.param("buyStatus", "판매자배송"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	
	// 연도별 매출액 Get / 성공
	@WithMockUser
	@Test
	public void testmYearIncomeGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/year/2021"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 연도별 매출액 Post / 성공
	@WithMockUser
	@Test
	public void testYearIncomePost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/year/2021")
				.param("year", "2021"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 월별 매출액 Get / 성공
	@WithMockUser
	@Test
	public void testMonthIncomeGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/month/2021"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 월별 매출액 Post / 성공
	@WithMockUser
	@Test
	public void testMonthIncomePost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/month/2021")
				.param("year", "2021"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
	
	// 일별 매출액 Get / 성공
	@WithMockUser
	@Test
	public void testDayIncomeGet() throws Exception{
		mvc.perform(MockMvcRequestBuilders.get("/admin/day/11"))
		.andReturn()
		.getModelAndView()
		.getModelMap();
	}
	
	// 일별 매출액 Post / 성공
	@WithMockUser
	@Test
	public void testDayIncomePost() throws Exception{
		ModelAndView mav = mvc.perform(MockMvcRequestBuilders.post("/admin/day/11")
				.param("month", "11"))
			.andReturn()
			.getModelAndView();
		
		log.info(mav.getViewName());
	}
}
