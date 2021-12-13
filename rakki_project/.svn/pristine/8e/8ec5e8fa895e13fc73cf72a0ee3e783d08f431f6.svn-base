package com.rakki.domain;


import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data @Alias("goods")
public class GoodsVo {
	private Long goods_no;
	private String id;
	private String product_no;
	private String size;
	private Long price;
	private String status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	private String name;
}




