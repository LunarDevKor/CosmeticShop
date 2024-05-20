package com.cosmetic.product.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.vo.ProdVO;

public interface IProdDao {

	// 상품 전체목록
	public List<ProdVO> getAllProducts();



	// 상품추가
	public int addProduct(ProdVO pv);

	// 상품 수정
	public int updateProduct(ProdVO pv);

	// 상세상품정보를 가져오기 위한 메서드
	public ProdVO getproduct(String prodNo);

	
	//상품삭제  성공1, 실패 0 반환s
	public int deleteProduct(ProdVO pv);

	///////////////////////////////////////////////////
	public List<AtchFileDetailVO> fileselectAll();
	
	public int getFileDetNo(long fileNo);

	

	public int countList(String search);
	
    //베스트상품 목록 
	public List<Map<String, Object>> getBestProducts();
	
	//신상품목록
	public List<Map<String, Object>> getNewProducts();

	public List<Map<String, Object>> cateList(Map<String, Object> map);

	public int cateCountList(Map<String, Object> map) throws SQLException;
	
	public List<ProdVO> getProdDetailByOrder(Map<String, Object> map);

	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap);
	
	public List<Map<String, Object>> getNewProducts(long grdNo);

	public List<Map<String, Object>> getBestProducts(long grdNo);
	
	public List<Map<String, Object>> AdminProdSearch(Map<String, Object> searchMap);

	public int countList() throws SQLException;

	//관리자 상품 리스트 출력 페이징과 함께  
	public List<Map<String, Object>> prodList(Map<String, Object> countMap)throws SQLException;

	//관리자 검색 상품 리스트 출력 (+페이징)
	public int searchCountList(Map<String, Object> searchMap) throws SQLException;;
	//관리자 검색 기능
	public List<Map<String, Object>> prodSearch(Map<String, Object> map);

}
