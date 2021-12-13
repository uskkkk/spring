package com.rakki.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rakki.domain.AddressVo;
import com.rakki.domain.Criteria;
import com.rakki.domain.MemberVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class AddressServiceTests {
	@Setter @Autowired
	private AddressService service;
	@Setter @Autowired
	private MemberService memberService;
	@Autowired(required=true) @Setter @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	
	@Test
	public void testExist(){
		assertNotNull(service);
		log.info(service);
	}
	@Test
	public void testInsertAddress() throws Exception {
		Map<String, Object> adr = new HashMap<>();
		AddressVo addressVo = new AddressVo();
		MemberVo vo = memberService.login("hr");
		log.info(vo.getMno());
		
		adr.put("id", vo.getId());
		adr.put("zip", "12345");
		adr.put("address1", "테스트지번");
		adr.put("address2", "테스트상세");
//		adr.put(", value)
		
		service.insertAddress(adr);
//		
		
	}
	
	@Test
	public void testGetAddress() {
		log.info(service.getAddress("JAVAMAN"));
	}
	
	@Test
	public void testUpdateAddress() throws Exception {
		Map<String, Object> adr = new HashMap<>();
		AddressVo addressVo = new AddressVo();
		MemberVo vo = memberService.login("hr");
		log.info(vo.getMno());
		
		adr.put("id", vo.getId());
		adr.put("zip", "10101");
		adr.put("address1", "업데이트지번");
		adr.put("address2", "업데이트상세");
		
		service.updateAddress(adr);
		
	}
	
	@Test
	public void testDeleteAddress() {
		List<AddressVo> list = new ArrayList<>();
		list = service.getAddress("hr");
		log.info(list);
		
		service.deleteAddress("hr");
		log.info(list);
		
	}
}
