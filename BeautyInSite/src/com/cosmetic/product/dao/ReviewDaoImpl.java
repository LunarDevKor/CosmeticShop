package com.cosmetic.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.vo.ReviewVO;
import com.cosmetic.util.MyBatisUtil;

public class ReviewDaoImpl implements IReviewDao {

	private static IReviewDao ReviewDao = null;

	public ReviewDaoImpl() {
	}

	public static IReviewDao getInstance() {
		if (ReviewDao == null) {
			ReviewDao = new ReviewDaoImpl();
		}
		return ReviewDao;
	}

	@Override
	public int insertReview(ReviewVO rv) {
		SqlSession seqSession = MyBatisUtil.getInstance();

		int cnt = 0;
		try {
			cnt = seqSession.insert("review.insertReview", rv);
			if (cnt > 0)
				seqSession.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			seqSession.close();
		}

		System.out.println(cnt);
		return cnt;
	}

	/*
	 * @Override public List<ReviewVO> selectAll() {
	 * 
	 * List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
	 * 
	 * SqlSession sqlSession = MyBatisUtil.getInstance(true);
	 * 
	 * try { reviewList = sqlSession.selectList("review.selectAll");
	 * 
	 * } catch (PersistenceException e) { e.printStackTrace(); }finally {
	 * sqlSession.close(); }
	 * 
	 * return reviewList; }
	 */

	@Override
	public List<AtchFileDetailVO> fileselectAll() {

		List<AtchFileDetailVO> fileList = new ArrayList<AtchFileDetailVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {
			fileList = sqlSession.selectList("review.fileselectAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return fileList;
	}

	@Override
	public int getFileDetNo(long fileNo) {

		int fileDetNo = 0;

		SqlSession session = MyBatisUtil.getInstance();

		try {
			fileDetNo = session.selectOne("review.getFileDetNo", fileNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return fileDetNo;
	}

	@Override
	public int updateReview(ReviewVO rv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;

		try {

			cnt = sqlSession.update("review.updateReview", rv);

			if (cnt > 0) {
				sqlSession.commit();
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public ReviewVO getReview(String rvNo) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		ReviewVO rv = null;

		try {

			rv = sqlSession.selectOne("review.getReview", rvNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return rv;
	}

	/*
	 * @Override public int deleteReview(String rvNo, long accNo) { SqlSession
	 * sqlSession = MyBatisUtil.getInstance();
	 * 
	 * int cnt = 0;
	 * 
	 * Map<String, Object> param = new HashedMap(); param.put("rvNo", rvNo);
	 * param.put("accNo", accNo);
	 * 
	 * try { cnt = sqlSession.delete("review.deleteReview", param);
	 * 
	 * if (cnt > 0) { sqlSession.commit(); }
	 * 
	 * } catch (PersistenceException e) { e.printStackTrace(); } finally {
	 * sqlSession.close(); }
	 * 
	 * return cnt; }
	 */

	@Override
	public List<ReviewVO> selectAll(String prodNo) {

		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		try {
			reviewList = sqlSession.selectList("review.selectAll", prodNo);

		} catch (PersistenceException e) {
			e.printStackTrace();

		} finally {
			sqlSession.close();
		}

		return reviewList;
	}

	@Override
	public int deleteReview(ReviewVO rv) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;

		try {
			cnt = sqlSession.delete("review.deleteReview", rv);

			if (cnt > 0) {
				sqlSession.commit();
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public ReviewVO getProdByReviewCount(String prodNo) {

		ReviewVO reviewDetail = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			reviewDetail = sql.selectOne("review.getProdByReviewCount", prodNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return reviewDetail;
	}

	@Override
	public int isLikeItByUser(Map<String, Object> map) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			result = sql.selectOne("isLikeItByUser", map);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insertLikeIt(Map<String, Object> map) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.insert("insertLikeIt", map);

			if (result > 0) sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int deleteLikeIt(Map<String, Object> map) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.delete("deleteLikeIt", map);
			
			if(result > 0) sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int getLikeCnt(String prodNo) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			
			result = sql.selectOne("getLikeCnt", prodNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

}
