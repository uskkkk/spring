package com.rakki.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("address")
public class AddressVo {
	private int ano; // 주소넘버
	
	private int mno; // 멤버 넘버
	
	private String zip; // 우편 번호
	
	private String address1; // 지번
	
	private String address2; // 상세
	
	private String id; // 멤버 id
	
	private String name; // 멤버 이름

	public void setId(String setId) {
		MemberVo vo = new MemberVo();
		vo.getId();
	}
	
}
