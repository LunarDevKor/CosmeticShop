package com.cosmetic.product.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.common.dao.AtchFileDaoImpl;
import com.cosmetic.common.dao.IAtchFileDao;
import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.dao.IReviewDao;
import com.cosmetic.product.dao.ReviewDaoImpl;
import com.cosmetic.product.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	
	private static IReviewService ReviewService = null;
	
	public ReviewServiceImpl() {}
	
	public static IReviewService getInstance() {
		if (ReviewService == null) {
			ReviewService = new ReviewServiceImpl();
		}
		return ReviewService;
	}
	
	IReviewDao ReviewDao = ReviewDaoImpl.getInstance();
	
	IAtchFileDao FileDao = AtchFileDaoImpl.getInstance();

	
	@Override
	public int insertReview(ReviewVO rv) {
		
		int cnt = ReviewDao.insertReview(rv);
		
		return cnt;
	}


	@Override
	public List<AtchFileDetailVO> displayFile() {
		
		List<AtchFileDetailVO> fileList = ReviewDao.fileselectAll();
		
		return fileList;
	}

	@Override
	public int modifyReivew(ReviewVO rv) {
		
		int cnt = ReviewDao.updateReview(rv);
		
		return cnt;
	}

	@Override
	public ReviewVO getReview(String rvNo) {
		
		ReviewVO rv = ReviewDao.getReview(rvNo);
		
		return rv;
	}


	/*
	 * @Override public int removeReview(String rvNo, long accNo) 
	 * { int cnt =
	 * ReviewDao.deleteReview(rvNo,accNo);
	 * 
	 * return cnt; }
	 */

	@Override
	public List<ReviewVO> displayAllReview(String prodNo) {
		
		List<ReviewVO> reviewList = ReviewDao.selectAll(prodNo);
		
		return reviewList;
	}

	@Override
	public int removeReview(ReviewVO rv) {
		int cnt = ReviewDao.deleteReview(rv);
		return cnt;
	}

	@Override
	public ReviewVO getProdByReviewCount(String prodNo) {
		return ReviewDao.getProdByReviewCount(prodNo);
	}

	@Override
	public int isLikeItByUser(Map<String, Object> map) {
		return ReviewDao.isLikeItByUser(map);
	}

	@Override
	public int getLikeCnt(String prodNo) {
		return ReviewDao.getLikeCnt(prodNo);
	}

	@Override
	public int insertLikeIt(Map<String, Object> map) {
		return ReviewDao.insertLikeIt(map);
	}

	@Override
	public int deleteLikeIt(Map<String, Object> map) {
		return ReviewDao.deleteLikeIt(map);
	}

}
