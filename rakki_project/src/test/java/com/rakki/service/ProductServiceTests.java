package com.rakki.service;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.Criteria;
import com.rakki.domain.ProductVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	@Setter @Autowired
	private ProductService service;
	
	@Test
	public void testExist(){
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testGetList() {
		service.getList().forEach(System.out::println);
	}
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria(1,10);
		service.getList(cri).forEach(log::info);
	}
	@Test
	public void testGetTotal() {
		Criteria cri = new Criteria(1,10);
		log.info(service.getTotal(cri));
	}
	
	@Test
	public void testGetProductInfo() {
		Long product_no = 320L;
		log.info(service.getProductInfo(product_no));
	}
	
	@Test
	public void testRegister() throws ParseException {
		ProductVo vo = new ProductVo();
		vo.setBrand("test");
		vo.setCategory("1");
		vo.setSerialNo("test123");
		vo.setImage("noImg");
		vo.setName_en("eng name");
		vo.setName_ko("한글이름");
		vo.setRelease(new SimpleDateFormat("yy-MM-dd").parse("21-10-11"));
		vo.setColor("White");
		vo.setPrice_rel("100,000원");
		log.info(vo);
		service.register(vo);
		Long product_no = vo.getProduct_no();
		log.info("등록후:" +service.getProductInfo(product_no));
		//테스트제품 삭제
		service.removeProduct(product_no);
		log.info("삭제후:" + service.getProductInfo(product_no));	
	}
	
//	@Test    //Product_no를 시퀀스에서 작성, 테스트데이터 삭제하지 못해 코드실행후 수동삭제.
//	public void testInsertProduct() throws ParseException {
//		ProductVo vo = new ProductVo();
//		vo.setBrand("test");
//		vo.setCategory("1");
//		vo.setSerialNo("test123");
//		vo.setImage("noImg");
//		vo.setName_en("eng name");
//		vo.setName_ko("한글이름");
//		vo.setRelease(new SimpleDateFormat("yy-MM-dd").parse("21-10-11"));
//		vo.setColor("White");
//		vo.setPrice_rel("100,000원");
//		log.info(vo);
//		service.insertProduct(vo);
//		
//	}
	
}
