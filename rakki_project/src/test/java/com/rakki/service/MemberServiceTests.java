package com.rakki.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.Criteria;
import com.rakki.domain.MemberVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberServiceTests {
	@Setter @Autowired
	private MemberService service;
	@Autowired(required=true) @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	
	@Test
	public void testExist(){
		assertNotNull(service);
		log.info(service);
	}
	// 회원 불러오기
		@Test
		public void testLogin() throws Exception {
			MemberVo vo = service.login("user1");
			log.info(vo);
			vo.getAuths().forEach(log::info);	
		}
		
		// 회원 정보수정
		@Test
		public void testModify() throws Exception {
			MemberVo vo = new MemberVo();
			vo = service.login("hr");
			log.info(vo);
			
			vo.setPassword(encoder.encode(vo.getPassword())+1);
			vo.setName("더미1");
			vo.setPhone("01010101232");
			
			service.modify(vo);
			log.info(vo);
//			
		}
		
		//회원 탈퇴
		@Test 
		public void testDelete() {
			service.delete("dummy");
			service.deleteAuth("dummy");
		}
}
