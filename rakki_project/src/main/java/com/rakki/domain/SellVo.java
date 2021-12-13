package com.rakki.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data @Alias("sell")
public class SellVo {
	private Long tradeNo;
	private Long seller_goods_no;
	private Long buyer_goods_no;
	private String id;
	private String sell_flg;
	private Long   sell_price;
	private String product_no;
	private String size_type;
	private String goods_stat;
	

}
