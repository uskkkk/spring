package com.rakki.security;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;


@Log4j
@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth)
			throws IOException, ServletException {
		log.warn("login success");
		
		Set<String> roles = new HashSet<>();
	      
	    auth.getAuthorities().forEach(a -> roles.add(a.getAuthority()));
//		
//		String url = req.getParameter("url");
//		req.getHeader("");
		
//		
		resp.sendRedirect("/rakki/main");
	}

}
