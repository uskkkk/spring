package com.rakki.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.rakki.domain.MemberVo;
import com.rakki.mapper.MemberMapper;
import com.rakki.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j @Component
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired @Setter
	private MemberMapper mapper;
	
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		log.info(arg0);
		MemberVo vo = mapper.login(arg0);
		log.info(vo);
		return vo == null ? null : new CustomUser(vo);
	}

	
}
