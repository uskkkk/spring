package com.rakki.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;


@Component("noop")
@Log4j
public class CustomNoOpEncoder implements PasswordEncoder{
	
	
	@Override
	public String encode(CharSequence arg0) {
		log.info(arg0);
		return arg0.toString();
	}

	@Override
	public boolean matches(CharSequence arg0, String arg1) {
		log.info("matches ::" + arg0 + "::" + arg1);
		return arg0.toString().equals(arg1);
	}

}
