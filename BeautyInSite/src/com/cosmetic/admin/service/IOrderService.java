package com.cosmetic.admin.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.OutProductVO;
import com.cosmetic.product.vo.ProdVO;

public interface IOrderService{

	/**
	 * 주문처리중 -> 주문처리 완료로 변경하기 위한 메서드
	 * @param ov
	 * @return
	 */
	int orderUpdate(OrderVO ov);

	/**
	 * 주문완료처리된 리스트를 불러우기 위한메서드
	 * @param ov
	 * @return
	 */
	OrderVO compleorderList(OrderVO ov);

	/**
	 * 갯수를 세기위한 메서드
	 * @return
	 */ 
	int countList();

	List<Map<String, Object>> displayAllOrder(Map<String, Object> countMap);

	/**
	 * 검색부분 페이징처리
	 * @param searchMap
	 * @return
	 */
	int searchCountList(Map<String, Object> searchMap);

	/**
	 * 검색적용한 리스트
	 * @param searchMap
	 * @return
	 */
	List<Map<String, Object>> listSearch(Map<String, Object> searchMap);

	List<OrderVO> releaseList();

	OutProductVO releaseSearch(String search);

	List<Map<String, Object>> releaseListAll(Map<String, Object> countMap);

	int releaseCountList();
	
	int insertOrder(Map<String, Object> paramMap);

	int insertDetailOrder(ProdVO pv);

	List<OrderVO> getMyHistory(int accNo);

	List<OrderVO> getMypageOrderHistory(int accNo);
	

	






}
