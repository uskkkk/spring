package com.rakki.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rakki.domain.Criteria;
import com.rakki.domain.ProductVo;
import com.rakki.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductServiceImpl implements ProductService {

	ProductMapper mapper;

	@Override
	public List<ProductVo> getList() {
		return mapper.getList();
	}

	@Override
	public List<ProductVo> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public void register(ProductVo productVo) {
		mapper.insertSelectKey(productVo);
	}

	@Override
	public ProductVo getProductInfo(Long product_no) {
		// TODO Auto-generated method stub
		return mapper.getProductInfo(product_no);
	}

	@Override
	public void insertProduct(ProductVo productVo) {
		mapper.insertProduct(productVo);
	}

	@Override
	public void removeProduct(Long product_no) {
		mapper.deleteProduct(product_no);
		
	}

}
