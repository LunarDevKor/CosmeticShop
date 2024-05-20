package com.cosmetic.member.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.coupon.vo.CouponVO;
import com.cosmetic.util.MyBatisUtil;

public class CouponDaoImpl implements ICouponDao {
	private static ICouponDao instance;

	private CouponDaoImpl() {
	}

	public static ICouponDao getInstance() {
		if (instance == null)
			instance = new CouponDaoImpl();
		return instance;
	}

	@Override
	public List<CouponVO> getCouponList(int accNo) {

		List<CouponVO> couponList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			couponList = sql.selectList("coupon.getCouponList", accNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return couponList;
	}

	@Override
	public List<AccountVO> couponManage() {
		SqlSession sql = MyBatisUtil.getInstance();
		List<AccountVO> list = null;
		try {
			list = sql.selectList("manage.couponManage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}
		return list;
	}

	@Override
	public int couponInsert(Map<String, Object> map) {

		SqlSession sql = MyBatisUtil.getInstance();
		int cnt = 0;
		try {
			cnt = sql.insert("manage.couponInsert", map);
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
	public int couponUse(Map<String, Object> map) {

		int result = 0;
		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			result = sql.delete("coupon.couponUse", map);
			
			if(result > 0) sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}
}
