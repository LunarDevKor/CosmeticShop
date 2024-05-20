package com.cosmetic.admin.service;

import java.util.List;

import com.cosmetic.admin.dao.ChartDao;
import com.cosmetic.admin.vo.ChartVO;

public class ChartService {
	private static ChartService instance;
	private ChartService() {}
	public static ChartService getInstance() {
		if(instance == null) instance = new ChartService();
				return instance;
	}
	
	ChartDao chartDao = ChartDao.getInstance();
	
	public List<ChartVO> getDailyCharts() {
		return chartDao.getDailyCharts();
	}
	
	public List<ChartVO> getMonthlyCharts() {
		return chartDao.getMonthlyCharts();
	}
	public List<ChartVO> getMonthlyBuyer() {
		return chartDao.getMonthlyBuyer();
	}
}
