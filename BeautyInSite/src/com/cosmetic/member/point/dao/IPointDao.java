package com.cosmetic.member.point.dao;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.point.vo.PointVO;

public interface IPointDao {
	
	List<PointVO> getPointHistory(int accNo);

	List<AccountVO> pointManage();

	int updatePoint(Map<String, Object> map);

	int accruePoint(Map<String, Object> map);

}