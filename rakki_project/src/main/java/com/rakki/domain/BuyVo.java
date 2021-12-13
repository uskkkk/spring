package com.rakki.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("buy")
public class BuyVo {
	private Long tradeNo;
	private Long seller_goods_no;
	private Long buyer_goods_no;
	private String id;
	private String buy_flg;
	private Long   buy_price;
	private String product_no;
	private String size_type;
	private String goods_stat;
	

}
