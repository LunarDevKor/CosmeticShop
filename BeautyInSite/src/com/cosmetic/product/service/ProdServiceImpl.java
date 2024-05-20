package com.cosmetic.product.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.dao.MyBatisDao;
import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.dao.IProdDao;
import com.cosmetic.product.dao.ProdDaoImpl;
import com.cosmetic.product.vo.ProdVO;

public class ProdServiceImpl extends MyBatisDao implements IProdService {

	private static IProdService instance = null;

	private ProdServiceImpl() {
	}

	public static IProdService getInstance() {
		if (instance == null)
			instance = new ProdServiceImpl();
		return instance;
	}

	IProdDao prodDao = ProdDaoImpl.getInstance();

//1. 상품 리스트 조회

	public List<Map<String, Object>> getAllProducts(Map<String, Object> countMap) {

		List<Map<String, Object>> prodList = null;

		try {
			prodList = prodDao.prodList(countMap);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodList;
	}
//2.상품 등록

	@Override
	public int addProd(ProdVO pv) {

		return prodDao.addProduct(pv);
	}

//상품수정
	@Override
	public int modifyProduct(ProdVO pv) {
		int cnt = prodDao.updateProduct(pv);
		return cnt;
	}

//상품가져오기
	@Override
	public ProdVO getProduct(String prodNo) {
		ProdVO pv = prodDao.getproduct(prodNo);
		return pv;
	}

//상품삭제
	public int removeProduct(ProdVO pv) {
		int cnt = prodDao.deleteProduct(pv);

		return cnt;
	}

	@Override
	public List<AtchFileDetailVO> displayFile() {
		List<AtchFileDetailVO> fileList = prodDao.fileselectAll();
		return fileList;
	}

	@Override
	public List<Map<String, Object>> prodSearch(Map<String, Object> map) {
		List<Map<String, Object>> ProdSearchlist = prodDao.prodSearch(map);
		return ProdSearchlist;
	}

	@Override
	public int countList(String search) {
		int countList = 0;
		countList = prodDao.countList(search);
		return countList;
	}

	@Override
	public List<Map<String, Object>> getBestProducts() {

		return prodDao.getBestProducts();
	}

	public List<Map<String, Object>> getNewProducts() {

		return prodDao.getNewProducts();
	}

	@Override
	public List<Map<String, Object>> cateList(Map<String, Object> map) {
		List<Map<String, Object>> list = prodDao.cateList(map);
		return list;
	}

	@Override
	public int cateCountList(Map<String, Object> map) {
		int cateCountList = 0;
		try {
			cateCountList = prodDao.cateCountList(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cateCountList;
	}

	@Override
	public List<ProdVO> getProdDetailByOrder(Map<String, Object> map) {
		return prodDao.getProdDetailByOrder(map);
	}

	
	
	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap) {

		List<Map<String, Object>> prodSearchList = prodDao.listSearch(searchMap);
		return prodSearchList;
	}

	@Override
	public List<Map<String, Object>> getNewProducts(long grdNo) {

		return prodDao.getNewProducts(grdNo);

	}

	@Override
	public List<Map<String, Object>> getBestProducts(long grdNo) {

		return prodDao.getBestProducts(grdNo);
	}

	//관리자 상품검색
	@Override
	public List<Map<String, Object>> prodAdminListSearch(Map<String, Object> searchMap) {
		List<Map<String, Object>> AdminProdSearchList = prodDao.AdminProdSearch(searchMap);
		return AdminProdSearchList;
	}

	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = prodDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}

	//관리자 검색상품 리스트 페이징
	@Override
	public int searchCountList(Map<String, Object> searchMap) {

		int searchCountList = 0;
		try {
			searchCountList = prodDao.searchCountList(searchMap);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return searchCountList;
	}

}
