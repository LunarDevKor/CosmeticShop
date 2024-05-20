package com.cosmetic.admin.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.notice.vo.NoticeVO;

public interface INoticeDao {

	public int insertNotice(NoticeVO noticeVO);

	public NoticeVO noticeDetail(long noticeNo);
	
	public int updateNotice(NoticeVO noticeVO);

	public int deleteNotice(String noticeNo);

	public int countList() throws SQLException;

	public List<NoticeVO> noticeList(Map<String, Object> map)throws SQLException;

	public List<NoticeVO> searchNotice(NoticeVO noticeVOO);
}
