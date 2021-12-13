package com.rakki.mapper;

import java.util.List;

import com.rakki.domain.PaymentVo;

public interface PaymentMapper {
	//결제정보리스트 취득
	List<PaymentVo> getList(int mno);

	//결제정보 추가
	void insert(PaymentVo pay);

	//결제정보 1건 읽기
	PaymentVo read(int payment_no);

	//결제정보 삭제
	void delete(int payment_no);

	//결제정보 수정
	void update(PaymentVo pay);

}
