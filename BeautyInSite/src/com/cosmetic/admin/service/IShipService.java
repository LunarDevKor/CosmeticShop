package com.cosmetic.admin.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.ShipDetailVo;

public interface IShipService {

	int countList();

	List<Map<String, Object>> displayAllShip(Map<String, Object> countMap);

	List<Map<String, Object>> listSearch(Map<String, Object> searchMap);

	int searchCountList(Map<String, Object> searchMap);
	

}
