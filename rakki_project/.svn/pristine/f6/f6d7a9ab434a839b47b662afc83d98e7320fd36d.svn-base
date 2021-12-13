package com.rakki.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.rakki.domain.AuthVo;
import com.rakki.domain.MemberVo;
import com.rakki.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	MemberMapper memberMapper;
	
	
	/* 김우성
	 * 회원가입 메서드
	 * 2021-10-30
	 * */
	@Override
	public void insertMember(Map<String, Object> member) {
		memberMapper.insertMember(member);
	}
	
	
	// 로그인 기능
	@Override
	public MemberVo login(String id) throws Exception {
		return memberMapper.login(id);
	}
	
	/* 김우성
	 * 회원가입(권한) 메서드
	 * 2021-10-30
	 * */
	@Override
	public void insertAuth(Map<String, Object> auth) {
		memberMapper.insertAuth(auth);
	}

	/* 김우성
	 * 정보 수정 메서드
	 * 2021-11-03
	 * */
	@Override
	public void modify(MemberVo member) throws Exception {
		memberMapper.modify(member);
	}

	/* 김우성
	 * 회원 탈퇴 메서드
	 * 2021-11-03
	 * */
	@Override
	public void delete(String id) {
		memberMapper.delete(id);
	}

	/* 김우성
	 * 회원 Auth 삭제 메서드
	 * 2021-11-03
	 * */
	@Override
	public void deleteAuth(String id) {
		memberMapper.deleteAuth(id);
	}

	
	
}
