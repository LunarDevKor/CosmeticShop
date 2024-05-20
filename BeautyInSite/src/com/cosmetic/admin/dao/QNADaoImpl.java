package com.cosmetic.admin.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.vo.QNAVO;
import com.cosmetic.util.MyBatisUtil;

public class QNADaoImpl extends MyBatisDao implements IQNADao {

	private static IQNADao instance = null;

	private QNADaoImpl() {
	}

	public static IQNADao getInstance() {
		if (instance == null)
			instance = new QNADaoImpl();
		return instance;
	}

	@Override
	public int insertQna(QNAVO qnaVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.insert("qna.insertQna", qnaVO);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Map<String, Object>> qnaList(int accNo) {

		List<Map<String, Object>> list = new ArrayList<>();
		SqlSession sql = MyBatisUtil.getInstance(true);
		try {
			list = sql.selectList("qna.qnaList", accNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	@Override
	public Map<String, Object> qnaDetail(long sbNo) {

		Map<String, Object> map = null;
		SqlSession sql = MyBatisUtil.getInstance(true);
		try {
			map = sql.selectOne("qna.qnaDetail", sbNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return map;

	}

	@Override
	public int qnaAnswer(QNAVO qnaVO) {

		int res = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			res = sql.insert("qna.qnaAnswer", qnaVO);

			if (res > 0) {
				sql.commit();
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return res;

	}

	@Override
	public Map<String, Object> getAnswer(long sbNo) {

		Map<String, Object> answerMap = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			
			answerMap = sql.selectOne("getAnswer",sbNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return answerMap;
	}

}
