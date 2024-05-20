package com.cosmetic.admin.management.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.BrandVO;
import com.cosmetic.admin.vo.GradeVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.vo.ProdVO;

public interface IManagementService {



	List<GradeVO> gradeList();

	int gradeUpdate(GradeVO gdv);

	List<Map<String, Object>> listSearch(Map<String, Object> map);

	int manageUpdate(AccountVO av);

	AccountVO manageDetail(String accNo);

	int countList();

	List<Map<String, Object>> manageList(Map<String, Object> countMap);

	int searchCountList(Map<String, Object> searchMap);

	List<BrandVO> brandList();

	List<ProdVO> brandDetailList(String brNo);

	List<BrandVO> brandSearchList(String search);

	int brandCount(String brNo);

	List<ProdVO> recommendList();



	



	

	
	
}
