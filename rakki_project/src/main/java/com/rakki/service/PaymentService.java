package com.rakki.service;

import java.util.List;

import com.rakki.domain.PaymentVo;

public interface PaymentService {
	//결제정보 리스트 취득
	List<PaymentVo> getList(int mno);

	//신규결제정부 추가
	void add(PaymentVo pay);

	//결제정보 취득
	PaymentVo get(int payment_no);
	
	//결제정보 삭제
	void remove(int payment_no);
	
	//결제정보 수정
	void modify(PaymentVo pay);

}
