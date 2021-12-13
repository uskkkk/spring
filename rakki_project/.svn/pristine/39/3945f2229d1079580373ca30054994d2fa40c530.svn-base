package com.rakki.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.rakki.domain.MemberVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {
	@Autowired(required=true) @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	@Autowired @Setter
	private MemberMapper memberMapper;
	
	
	
	// 회원 불러오기
	@Test
	public void testLogin() {
		MemberVo vo = memberMapper.login("user1");
		log.info(vo);
		vo.getAuths().forEach(log::info);	
	}
	
	// 회원 정보수정
	@Test
	public void testModify() throws Exception {
		MemberVo vo = new MemberVo();
		vo = memberMapper.login("hr");
		log.info(vo);
		
		vo.setPassword(encoder.encode(vo.getPassword())+1);
		vo.setName("더미1");
		vo.setPhone("01010101232");
		
		memberMapper.modify(vo);
		log.info(vo);
//		
	}
	
	//회원 탈퇴
	@Test 
	public void testDelete() {
		memberMapper.delete("dummy");
		memberMapper.deleteAuth("dummy");
	}
	
}
