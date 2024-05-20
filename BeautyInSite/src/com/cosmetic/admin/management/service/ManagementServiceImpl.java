package com.cosmetic.admin.management.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.management.dao.IManagementDao;
import com.cosmetic.admin.management.dao.ManagementDaoImpl;
import com.cosmetic.admin.vo.BrandVO;
import com.cosmetic.admin.vo.GradeVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.vo.ProdVO;



public class ManagementServiceImpl implements IManagementService {
	private static IManagementService instance = null;
	IManagementDao mgDao = ManagementDaoImpl.getInstance();
	
	
	private ManagementServiceImpl() {
	}

	public static IManagementService getInstance() {
		if (instance == null)
			instance = new ManagementServiceImpl();
		return instance;
	}

	

	@Override
	public List<GradeVO> gradeList() {
		List<GradeVO> list = mgDao.gradeList();
		return list;
	}

	@Override
	public int gradeUpdate(GradeVO gdv) {
		
		return mgDao.gradeUpdate(gdv);
	}

	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> map) {
		List<Map<String, Object>> list = mgDao.listSearch(map);
		return list;
	}
	
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = mgDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}
	

	@Override
	public AccountVO manageDetail(String accNo) {
		AccountVO av = mgDao.manageDetail(accNo);
		return av;
	}

	@Override
	public int manageUpdate(AccountVO av) {
	
		return mgDao.manageUpdate(av);
	}

	@Override
	public List<Map<String, Object>> manageList(Map<String, Object> countMap) {
		
				List<Map<String, Object>> list = null;
				try {
					list = mgDao.boardList(countMap);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;
			}

	@Override
	public int searchCountList(Map<String, Object> searchMap) {
		int searchCountList = 0;
		try {
			searchCountList = mgDao.searchCountList(searchMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchCountList;
	}

	@Override
	public List<BrandVO> brandList() {
		List<BrandVO> list = mgDao.brandList();
		return list;
	}

	@Override
	public List<ProdVO> brandDetailList(String brNo) {
		List<ProdVO> list = mgDao.brandDetailList(brNo);
		return list;
	}

	@Override
	public List<BrandVO> brandSearchList(String search) {
		List<BrandVO> list =mgDao.brandsearchList(search);
		return list;
	}

	@Override
	public int brandCount(String brNo) {
		int brandCountList = 0;
		try {
			brandCountList = mgDao.brandCountList(brNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return brandCountList;
	}

	@Override
	public List<ProdVO> recommendList() {
		List<ProdVO> list = mgDao.recommendList();
		return list;
	}

}

	







