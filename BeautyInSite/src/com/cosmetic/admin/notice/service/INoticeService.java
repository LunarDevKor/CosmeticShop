package com.cosmetic.admin.notice.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.admin.notice.vo.NoticeVO;
import com.cosmetic.admin.vo.QNAVO;

public interface INoticeService {

	// NOTICE

	int insertNotice(NoticeVO noticeVO);
	
	NoticeVO noticeDetail(String noticeNo);
	
	int updateNotice(NoticeVO noticeVO);

	int deleteNotice(String noticeNo);
	
	//전체 글 갯수 조회하기
	int countList();

	List<NoticeVO> noticeList(Map<String, Object> map);

	List<NoticeVO> searchNotice(NoticeVO noticeVOO);

}
