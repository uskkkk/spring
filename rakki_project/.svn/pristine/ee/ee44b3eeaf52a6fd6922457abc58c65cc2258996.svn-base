package com.rakki.mapper;

import java.util.List;
import java.util.Map;

import com.rakki.domain.AuthVo;
import com.rakki.domain.MemberVo;

public interface MemberMapper {
	
	// 회원가입
	void insertMember(Map<String, Object> map);
	void insertAuth(Map<String, Object> map);
	
	
	MemberVo login(String id);
	
	void insertAuth(List<AuthVo> auths, String auth);
	
	// 정보수정
	void modify(MemberVo vo);
	
	// 회원 탈퇴
	void delete(String id); 
	
	// 회원 Auth 삭제
	void deleteAuth(String id);
}
