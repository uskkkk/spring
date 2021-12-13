package com.rakki.domain;
import java.util.Date;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data @Alias("notice")
public class NoticeVo {
	private Long nno;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
}