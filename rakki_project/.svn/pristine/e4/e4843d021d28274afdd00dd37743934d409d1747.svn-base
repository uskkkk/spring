package com.rakki.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.rakki.domain.MemberVo;

import lombok.Getter;


@Getter
public class CustomUser extends User{
	private MemberVo member;

	public CustomUser(String id, String password, Collection<? extends GrantedAuthority> authorities) {
		   super(id, password, authorities);
		}
	
	public CustomUser(MemberVo vo) {
		super(vo.getId(),
				vo.getPassword(),
				vo.getAuths()
				.stream()
				.map(a-> new SimpleGrantedAuthority(a.getAuth())).collect(Collectors.toList()));
		this.member = vo;
	}
}
