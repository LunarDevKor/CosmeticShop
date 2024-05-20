package com.cosmetic.admin.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.admin.dao.IQNADao;
import com.cosmetic.admin.dao.QNADaoImpl;
import com.cosmetic.admin.vo.QNAVO;

public class QNAServiceImpl implements IQNAService {
	private static IQNAService instance = null;
	IQNADao qnaDao = QNADaoImpl.getInstance();
	
	
	private QNAServiceImpl() {
	}

	public static IQNAService getInstance() {
		if (instance == null)
			instance = new QNAServiceImpl();
		return instance;
	}

	@Override
	public int insertQna(QNAVO qnaVO) {
		return qnaDao.insertQna(qnaVO);
	}
	
	@Override
	public List<Map<String, Object>> qnaList(int accNo) {
		return qnaDao.qnaList(accNo);
	}

	@Override
	public Map<String, Object> qnaDetail(String sbNo) {
		return qnaDao.qnaDetail(Long.parseLong(sbNo));
	}

	@Override
	public Map<String, Object> getAnswer(String sbNo) {
		return qnaDao.getAnswer(Long.parseLong(sbNo));
	}

	@Override
	public int qnaAnswer(QNAVO qnaVO) {
		return qnaDao.qnaAnswer(qnaVO);
	}
	
}
