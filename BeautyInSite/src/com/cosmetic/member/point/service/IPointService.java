package com.cosmetic.member.point.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.point.vo.PointVO;

public interface IPointService {
	
	public List<PointVO> getPointHistory(int accNo);

	public List<AccountVO> pointManage();

	public int updatePoint(Map<String, Object> map);

	public int accruePoint(Map<String, Object> map);
	
}
