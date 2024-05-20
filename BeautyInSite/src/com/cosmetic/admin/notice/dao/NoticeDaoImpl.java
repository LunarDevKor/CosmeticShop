package com.cosmetic.admin.notice.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.dao.MyBatisDao;
import com.cosmetic.admin.notice.vo.NoticeVO;
import com.cosmetic.admin.vo.QNAVO;
import com.cosmetic.util.MyBatisUtil;

public class NoticeDaoImpl extends MyBatisDao implements INoticeDao {

	private static INoticeDao instance = null;

	private NoticeDaoImpl() {
	}

	public static INoticeDao getInstance() {
		if (instance == null)
			instance = new NoticeDaoImpl();
		return instance;
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		SqlSession sql = MyBatisUtil.getInstance();

		int cnt = 0;
		System.out.println(noticeVO);
		try {
			cnt = sql.insert("notice.insertNotice", noticeVO);

			if (cnt > 0)
				sql.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return cnt;
	}

	@Override
	public NoticeVO noticeDetail(long noticeNo) {
		SqlSession sql = MyBatisUtil.getInstance();

		NoticeVO noticeVO = null;

		try {
			noticeVO = sql.selectOne("notice.noticeDetail", noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return noticeVO;
	}
	
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		int cnt = 0 ;
		SqlSession sql = MyBatisUtil.getInstance();
		try {
			cnt = sql.update("notice.updateNotice", noticeVO);
			if(cnt>0) sql.commit();
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally { 
			sql.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteNotice(String noticeNo) {
		SqlSession sql = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
		cnt = sql.delete("notice.deleteNotice", noticeNo);
			if(cnt>0) {
			sql.commit();
			}
		}catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally { 
			sql.close();
		}
		return cnt;
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("notice.countList");
		
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		
		return selectList("notice.noticeList", map);
	}

	@Override
	public List<NoticeVO> searchNotice(NoticeVO noticeVO) {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		SqlSession sql = MyBatisUtil.getInstance();
		 
		 try {
			list = sql.selectList("notice.searchNotice", noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.close();
		}
		 
		return list;
	}
}
