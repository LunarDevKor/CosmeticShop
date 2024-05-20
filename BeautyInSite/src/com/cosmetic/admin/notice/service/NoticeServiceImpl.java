package com.cosmetic.admin.notice.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.notice.dao.INoticeDao;
import com.cosmetic.admin.notice.dao.NoticeDaoImpl;
import com.cosmetic.admin.notice.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {
	private static INoticeService instance = null;
	INoticeDao noticeDao = NoticeDaoImpl.getInstance();
	
	
	private NoticeServiceImpl() {
	}

	public static INoticeService getInstance() {
		if (instance == null)
			instance = new NoticeServiceImpl();
		return instance;
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		return noticeDao.insertNotice(noticeVO);
	}

	@Override
	public NoticeVO noticeDetail(String noticeNo) {
		NoticeVO noticeVO = noticeDao.noticeDetail(Long.parseLong(noticeNo));
		return noticeVO;
	}
	
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		
		return noticeDao.updateNotice(noticeVO);
	}
	
	@Override
	public int deleteNotice(String noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}
	
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = noticeDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList ;
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		List<NoticeVO> list = new ArrayList<>();;
		try {
			list = noticeDao.noticeList(map);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<NoticeVO> searchNotice(NoticeVO noticeVOO) {
		List<NoticeVO> list = noticeDao.searchNotice(noticeVOO);
		return list;
	}

}
