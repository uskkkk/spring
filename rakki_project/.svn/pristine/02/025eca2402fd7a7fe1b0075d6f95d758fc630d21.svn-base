package com.rakki.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.PaymentVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PaymentMapperTests {

	@Autowired @Setter
	private PaymentMapper mapper;
	
	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetList() {
		
		mapper.getList(89).forEach(System.out::println);
	}
	
	@Test
	public void testInsert() {
		
		PaymentVo vo = new PaymentVo();
		vo.setMno(89);
		vo.setBank("농협");
		vo.setAccount_num(123456);
		vo.setCredit_num(3456678);
		mapper.insert(vo);
		mapper.getList(89).forEach(System.out::println);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(29));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.read(29));
		mapper.delete(29);
		log.info(mapper.read(29));
	}
	
	@Test
	public void testUpdate() {
		
		PaymentVo vo = new PaymentVo();
		vo.setPayment_no(100);
		vo.setBank("농협");
		vo.setAccount_num(123456);
		vo.setCredit_num(3456678);
		mapper.update(vo);
		log.info(mapper.read(100));
	}
	
	
}
