package com.cosmetic.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.ShipDetailVo;

public interface IShipDao {

	int orderInsert(ShipDetailVo sv);

	int countList() throws SQLException;

	List<Map<String, Object>> shipList(Map<String, Object> countMap) throws SQLException;

	List<Map<String, Object>> listSearch(Map<String, Object> searchMap);

	int searchCountList(Map<String, Object> searchMap) throws SQLException;;

}
