package com.cosmetic.admin.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.ShipDetailVo;
import com.cosmetic.util.MyBatisUtil;

public class ShipDaoImpl extends MyBatisDao implements IShipDao {

	private static IShipDao shipDao = null;

	public ShipDaoImpl() {
	}

	public static IShipDao getInstance() {
		if (shipDao == null) {
			shipDao = new ShipDaoImpl();
		}
		return shipDao;
	}

	@Override
	public int orderInsert(ShipDetailVo sv) {
		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;
		try {
			cnt = sqlSession.insert("ship.orderInsert", sv);

			if (cnt > 0)
				sqlSession.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("ship.countList");
	}

	@Override
	public List<Map<String, Object>> shipList(Map<String, Object> countMap) throws SQLException {
		return selectList("ship.shipList", countMap);
	}

	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap) {

		SqlSession sql = MyBatisUtil.getInstance();
		List<Map<String, Object>> shipSerchList = null;
		try {
			shipSerchList = sql.selectList("ship.listSearch", searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return shipSerchList;
	}

	@Override
	public int searchCountList(Map<String, Object> searchMap) {
		return selectOne("ship.searchCountList", searchMap);

	}
}
