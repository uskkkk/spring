package com.rakki.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rakki.domain.PaymentVo;
import com.rakki.mapper.PaymentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PaymentServiceImpl implements PaymentService {

	PaymentMapper mapper;


	@Override
	public List<PaymentVo> getList(int mno) {
		return mapper.getList(mno);
	}


	@Override
	public void add(PaymentVo pay) {
		mapper.insert(pay);
	}


	@Override
	public PaymentVo get(int payment_no) {
		return mapper.read(payment_no);
	}


	@Override
	public void remove(int payment_no) {
		mapper.delete(payment_no);		
	}


	@Override
	public void modify(PaymentVo pay) {
		mapper.update(pay);	
		
	}


}
