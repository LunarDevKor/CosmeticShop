package com.cosmetic.product.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.vo.ReviewVO;

/**
 * 상품리뷰 관련 서비스를 위한 인터페이스
 * @author PC-10
 *
 */
public interface IReviewService {

	/**
	 * 리뷰를 등록하기 위한 메서드
	 * @param rv 등록할 리뷰정보를 담은 VO객체
	 * @return 성공하면 1, 실패하면 0을 반환한다.
	 */
	public int insertReview(ReviewVO rv);

	/* public List<ReviewVO> displayAllReview(); */
	public List<ReviewVO> displayAllReview(String prodNo);
	
	
	public List<AtchFileDetailVO> displayFile();

	public int modifyReivew(ReviewVO rv);

	public ReviewVO getReview(String rvNo);

	public int removeReview(ReviewVO rv);

	public ReviewVO getProdByReviewCount(String prodNo);

	public int isLikeItByUser(Map<String, Object> map);

	public int getLikeCnt(String prodNo);

	public int insertLikeIt(Map<String, Object> map);

	public int deleteLikeIt(Map<String, Object> map);
	

	

	
}
