package com.rakki.mapper;

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
public class NoticeMapperTests {
	@Setter @Autowired
	private NoticeMapper mapper;
	
	@Test
	public void testExists() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetList(){
		mapper.getList().forEach(log::info);
	}
	
	@Test
	public void testGetListWithPaging(){
		Criteria cri = new Criteria();
		cri.setType("C");
		cri.setKeyword("내용");
		
		mapper.getListWithPaging(cri).forEach(log::info);
	}
	
	@Test
	public void testInsert(){
		NoticeVo notice = new NoticeVo();
		notice.setTitle("테스트 제목");
		notice.setContent("테스트 내용");
		mapper.insert(notice);
	}
	
	@Test
	public void testInsertSelectKey(){
		NoticeVo notice = new NoticeVo();
		notice.setTitle("테스트 공지사항 제목");
		notice.setContent("테스트 공지사항 내용");
		log.info("befor :: " + notice);
		mapper.insertSelectKey(notice);
		log.info("after :: " + notice);
	}
	
	@Test
	public void testUpdate(){
		NoticeVo notice = new NoticeVo();
		notice.setTitle("수정된 공지사항 테스트 제목");
		notice.setContent("수정된 공지사항 테스트 내용");
		notice.setNno(7L);
		log.info(mapper.update(notice));
		log.info(mapper.read(7L));
	}
	
	@Test
	public void testDelete(){
		log.info(mapper.read(6L));
		log.info(mapper.delete(6L));
		log.info(mapper.read(6L));
	}
	
	@Test
	public void testRead(){
		log.info(mapper.read(21L));
	}
}
