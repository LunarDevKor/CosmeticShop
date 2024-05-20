package com.cosmetic.admin.management.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.BrandVO;
import com.cosmetic.admin.vo.GradeVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.vo.ProdVO;

public interface IManagementDao {



	List<GradeVO> gradeList();

	int gradeUpdate(GradeVO gdv);

	List<Map<String, Object>> listSearch(Map<String, Object> map);

	int manageUpdate(AccountVO av);

	AccountVO manageDetail(String accNo);

	int countList() throws SQLException;

	List<Map<String, Object>> boardList(Map<String, Object> countMap) throws SQLException;

	int searchCountList(Map<String, Object> searchMap) throws SQLException;

	List<BrandVO> brandList();

	List<ProdVO> brandDetailList(String brNo);

	List<BrandVO> brandsearchList(String search);

	int brandCountList(String brNo) throws SQLException;

	List<ProdVO> recommendList();


	


	



}
