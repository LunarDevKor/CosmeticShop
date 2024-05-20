package com.cosmetic.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.OutProductVO;
import com.cosmetic.product.vo.ProdVO;
import com.cosmetic.util.MyBatisUtil;

public class OrderDaoImpl extends MyBatisDao implements IOrderDao {

	private static IOrderDao orderDao = null;

	public OrderDaoImpl() {
	};

	public static IOrderDao getInstance() {
		if (orderDao == null) {
			orderDao = new OrderDaoImpl();
		}
		return orderDao;
	}

	@Override
	public int orderUpdate(OrderVO ov) {

		SqlSession sqlSession = MyBatisUtil.getInstance();

		int cnt = 0;

		try {
			cnt = sqlSession.update("order.orderUpdate", ov);

			if (cnt > 0) {
				sqlSession.commit();
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public OrderVO compleList(OrderVO ov) {

		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		OrderVO orderVO = null;
		try {
			orderVO = sqlSession.selectOne("order.compleList", ov);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return orderVO;
	}

	@Override
	public int countList() throws SQLException {
		return selectOne("order.countList");
	}

	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> countMap) throws SQLException {
		return selectList("order.orderList", countMap);
	}

	@Override
	public int searchCountList(Map<String, Object> searchMap) throws SQLException {
		return selectOne("order.countList", searchMap);
	}

	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap) {

		SqlSession sql = MyBatisUtil.getInstance();
		List<Map<String, Object>> orderSerchList = null;
		try {
			orderSerchList = sql.selectList("order.listSearch", searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return orderSerchList;
	}

	@Override
	public List<OrderVO> releaseList() {
		SqlSession sql = MyBatisUtil.getInstance();
		List<OrderVO> list = null;

		int cnt = 0;
		try {
			list = sql.selectList("order.releaseList");
			for (OrderVO ov : list) {
				Map<String, Object> params = new HashMap<>();
				params.put("prodNo", ov.getProdNo());
				params.put("ordDateTime", ov.getOrdDate());
				params.put("quantity", ov.getQuantity());
				int count = sql.selectOne("order.countByProdNoAndOrdDateTimeAndQuantity", params);
				if (count == 0) {
					// 중복되지 않는 행만 삽입
					sql.insert("order.releaseInsert", ov);
					cnt++;
				}
			}
			if (cnt > 0) {
				sql.commit();
			}
		} catch (Exception e) {
			sql.rollback(); // 에러 발생 시 롤백
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return null;
	}

	@Override
	public OutProductVO releaseSearch(String search) {
		SqlSession sql = MyBatisUtil.getInstance();
		OutProductVO ov = null;

		try {
			ov = sql.selectOne("order.releaseSearch", search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return ov;
	}

	@Override
	public List<Map<String, Object>> releaseListAll(Map<String, Object> countMap) {
		SqlSession sql = MyBatisUtil.getInstance();
		List<Map<String, Object>> list = null;

		try {
			list = sql.selectList("order.releaseListAll", countMap);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return list;
	}

	@Override
	public int releaseCountList() throws SQLException {
		return selectOne("order.releaseCountList");
	}

	@Override
	public int insertOrder(Map<String, Object> paramMap) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.insert("order.insertOrder", paramMap);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertDetailOrder(ProdVO pv) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.insert("order.insertDetailOrder", pv);

			if (result > 0)
				sql.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<OrderVO> getMyHistory(int accNo) {

		List<OrderVO> orderList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			orderList = sql.selectList("order.getMyHistory", accNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return orderList;
	}

	@Override
	public List<OrderVO> getMypageOrderHistory(int accNo) {

		List<OrderVO> orderList = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			
			orderList = sql.selectList("getMypageOrderHistory", accNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return orderList;
	}

}
