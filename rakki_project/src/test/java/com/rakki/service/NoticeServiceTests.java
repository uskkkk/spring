package com.rakki.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.Criteria;
import com.rakki.domain.NoticeVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {
	@Setter @Autowired
	private NoticeService service;
	
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
	public void testInsert(){
		NoticeVo notice = new NoticeVo();
		notice.setTitle("테스트2 제목");
		notice.setContent("테스트2 내용");
		service.register(notice);
	}
	@Test
	public void testUpdate(){
		NoticeVo notice = new NoticeVo();
		notice.setTitle("수정된 공지사항 테스트 제목");
		notice.setContent("수정된 공지사항 테스트 내용");
		notice.setNno(2L);
		log.info(service.modify(notice));
		log.info(service.get(2L));
	}
	@Test
	public void testDelete(){
		log.info(service.get(12L));
		log.info(service.remove(12L));
		log.info(service.get(12L));
	}
	
	@Test
	public void testRead(){
		log.info(service.get(4L));
	}
}
