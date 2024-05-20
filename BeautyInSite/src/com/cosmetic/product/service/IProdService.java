package com.cosmetic.product.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.vo.ProdVO;
import com.cosmetic.product.vo.ReviewVO;

public interface IProdService {

	// 상품 리스트
	List<Map<String, Object>> getAllProducts(Map<String, Object> countMap);

//	List<ProdVO> getSearchProd(String search);

	//	상품검색
	List<Map<String, Object>> listSearch(Map<String, Object> searchMap);

	// 상품추가
	public int addProd(ProdVO pv);

	// 상품정보를 수정하기 위한 메서드
	public int modifyProduct(ProdVO pv);

	// 상품정보를 가져오기 위한 메서드
	public ProdVO getProduct(String prodNo);

	// 상품정보를 삭제하기 위한 메서드
	public int removeProduct(ProdVO pv);

	//////////////////////////////////////////////
	
    public List<AtchFileDetailVO> displayFile();

	List<Map<String, Object>> prodSearch(Map<String, Object> map);

	int countList(String search);
	//베스트상품 리스트
	List<Map<String, Object>> getBestProducts();
	//신상품리스트
//	List<Map<String, Object>> getNewProducts();
	
	//주문 상품 상품 디테일
	List<ProdVO> getProdDetailByOrder(Map<String, Object> map);

	List<Map<String, Object>> cateList(Map<String, Object> map);

	int cateCountList(Map<String, Object> map);

	List<Map<String, Object>> getNewProducts(long grdNo);

	List<Map<String, Object>> getNewProducts();

	List<Map<String, Object>> getBestProducts(long grdNo);

	//관리자 상품 검색
	List<Map<String, Object>> prodAdminListSearch(Map<String, Object> searchMap);

	int countList();

	
	 //상품검색한 리스트 페이징 하기
	int searchCountList(Map<String, Object> searchMap);

	
	


	
	
	
}
