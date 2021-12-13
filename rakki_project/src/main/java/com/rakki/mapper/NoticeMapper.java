package com.rakki.mapper;
import java.util.List;

import com.rakki.domain.Criteria;
import com.rakki.domain.NoticeVo;

public interface NoticeMapper {
	List<NoticeVo> getList();
	List<NoticeVo> getListWithPaging(Criteria cri);
	void insert(NoticeVo notice);
	void insertSelectKey(NoticeVo notice);
	NoticeVo read(Long nno);
	boolean update(NoticeVo noticeVo);
	boolean delete(Long nno);
	int getTotalCount(Criteria cri);
}