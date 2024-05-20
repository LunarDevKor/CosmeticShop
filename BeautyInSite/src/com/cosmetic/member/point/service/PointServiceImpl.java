package com.cosmetic.member.point.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.point.dao.IPointDao;
import com.cosmetic.member.point.dao.PointDaoImpl;
import com.cosmetic.member.point.vo.PointVO;

public class PointServiceImpl implements IPointService{
	
	private static IPointService instance = null;
	
    private PointServiceImpl(){}
    
    public static IPointService getInstance() {
    	if(instance == null) instance = new PointServiceImpl();
    	return instance;
    }
    
    IPointDao memDao = PointDaoImpl.getInstance();

	@Override
	public List<PointVO> getPointHistory(int accNo) {
		return memDao.getPointHistory(accNo);
	}

	@Override
	public List<AccountVO> pointManage() {
		List<AccountVO> list  = memDao.pointManage();
		return list;
	}

	@Override
	public int updatePoint(Map<String, Object> map) {
		return memDao.updatePoint(map);
	}

	@Override
	public int accruePoint(Map<String, Object> map) {
		return memDao.accruePoint(map);
	}


}
