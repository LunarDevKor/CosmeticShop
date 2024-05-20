package com.cosmetic.common.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.util.MyBatisUtil;

public class AtchFileDaoImpl implements IAtchFileDao{
	
	private static IAtchFileDao fileDao;
	
	public AtchFileDaoImpl() {
		
	}
	
	public static IAtchFileDao getInstance() {
		if (fileDao == null) {
			fileDao = new AtchFileDaoImpl();
		}
		return fileDao;
	}

	@Override
	public int insertAtchFile(AtchFileDetailVO atchFileVO) {

		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		try {
			cnt = session.insert("atchFile.insertAtchFile",atchFileVO);
			
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertFileDetail(AtchFileDetailVO atchfileVO) {
		SqlSession session = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("atchFile.insertAtchFileDetail", atchfileVO);
			
			if (cnt > 0) {
				session.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}



	@Override
	public AtchFileDetailVO getatchFileDetail(AtchFileDetailVO atchFileVO) {
		
		AtchFileDetailVO atchFileDetail = null;
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			
			atchFileDetail = session.selectOne(
					"atchFile.getatchFileDetail", atchFileVO);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return atchFileDetail;
	}

	@Override
	public List<AtchFileDetailVO> getatchFileList(AtchFileDetailVO atchFileVO) {
		
		List<AtchFileDetailVO> atchFileList = new ArrayList<AtchFileDetailVO>();
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			atchFileList = session.selectList(
					"atchFile.getAtchFileList", atchFileVO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return atchFileList;
	}

}
