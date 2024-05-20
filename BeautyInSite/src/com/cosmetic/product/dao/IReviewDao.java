package com.cosmetic.product.dao;

import java.util.List;
import java.util.Map;

import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.vo.ReviewVO;

import oracle.net.aso.p;

public interface IReviewDao {

	/**
	 * 리뷰를 등록하기 위한 메서드
	 * @param rv 등록할 리뷰정보를 담은 VO객체
	 * @return DB작업이 성공하면 1, 실패하면 0을 반환한다.
	 */
	public int insertReview(ReviewVO rv);

	/* public List<ReviewVO> selectAll(); */
	public List<ReviewVO> selectAll(String prodNo);

	public List<AtchFileDetailVO> fileselectAll();
	
	public int getFileDetNo(long fileNo);

	public int updateReview(ReviewVO rv);

	public ReviewVO getReview(String rvNo);

	/* public int deleteReview(String rvNo, long accNo); */

	public int deleteReview(ReviewVO rv);

	public ReviewVO getProdByReviewCount(String prodNo);

	public int isLikeItByUser(Map<String, Object> map);

	public int insertLikeIt(Map<String, Object> map);

	public int deleteLikeIt(Map<String, Object> map);

	public int getLikeCnt(String prodNo);

	

}
