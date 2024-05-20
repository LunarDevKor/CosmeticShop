package com.cosmetic.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.dao.IShipDao;
import com.cosmetic.admin.dao.ShipDaoImpl;
import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.ShipDetailVo;

public class ShipServiceImpl implements IShipService{
	
	private static IShipService shipinsertService = null;
	
	

	public static IShipService getInstance() {
		if (shipinsertService == null) {
			shipinsertService = new ShipServiceImpl();
		}
		return shipinsertService;
	}

	IShipDao shipDao = ShipDaoImpl.getInstance();

	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = shipDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}

	@Override
	public List<Map<String, Object>> displayAllShip(Map<String, Object> countMap) {
		
		List<Map<String, Object>> shipList  = null;
		
		try {
			shipList = shipDao.shipList(countMap);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return shipList;
	}

	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap) {
		
		List<Map<String, Object>> OrderSearchlist = shipDao.listSearch(searchMap);
		
		return OrderSearchlist;
	}

	@Override
	public int searchCountList(Map<String, Object> searchMap) {
		int searchCountList = 0;
		try {
			searchCountList = shipDao.searchCountList(searchMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchCountList;
	}


}