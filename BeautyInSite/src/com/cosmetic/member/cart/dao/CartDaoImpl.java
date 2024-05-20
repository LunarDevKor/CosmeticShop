package com.cosmetic.member.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.member.cart.vo.CartVO;
import com.cosmetic.util.MyBatisUtil;

public class CartDaoImpl implements ICartDao {

	private static ICartDao instance = null;

	private CartDaoImpl() {
	}

	public static ICartDao getInstance() {
		if (instance == null)
			instance = new CartDaoImpl();
		return instance;
	}

	@Override
	public int cartInsert(CartVO cv) {
		SqlSession sql = MyBatisUtil.getInstance();
		int cnt = 0;

		try {
			cnt = sql.insert("cart.cartInsert", cv);
			if (cnt > 0)
				sql.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return cnt;
	}

	@Override
	public List<CartVO> cartList(Map<String, Object> map) {
		SqlSession sql = MyBatisUtil.getInstance(true);
		List<CartVO> cartList = null;

		try {
			cartList = sql.selectList("cart.cartList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return cartList;
	}

	@Override
	public int cartDelete(String prodNo, String accNo) {
		SqlSession sql = MyBatisUtil.getInstance();
		int cnt = 0;
		Map<String, String> params = new HashMap<>();
		params.put("prodNo", prodNo);
		params.put("accNo", accNo);
		try {
			cnt = sql.delete("cart.cartDelete", params);
			if (cnt > 0) {
				sql.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return cnt;
	}

	@Override
	public int cartUpdate(String cartNo, String cartQty) {

		SqlSession sql = MyBatisUtil.getInstance();
		int cnt = 0;
		Map<String, String> param = new HashMap<>();
		param.put("cartNo", cartNo);
		param.put("cartQTY", cartQty);
		System.out.println("param --->>>" + param);
		try {
			cnt = sql.update("cart.cartUpdate", param);
			if (cnt > 0) {
				sql.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			sql.close();
		}
		return cnt;
	}

	@Override
	public int isCartIn(CartVO cv) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			result = sql.selectOne("cart.isCartIn", cv);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int cartClear(String accNo) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.delete("cart.cartClear", accNo);
			
			if(result > 0) sql.commit();
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getCartCnt(int accNo) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {
			result = sql.selectOne("cart.getCartCnt", accNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

}
