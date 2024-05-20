package com.cosmetic.member.coupon.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.coupon.dao.CouponDaoImpl;
import com.cosmetic.member.coupon.dao.ICouponDao;
import com.cosmetic.member.coupon.vo.CouponVO;

public class CouponServiceImpl implements ICouponService{
	private static ICouponService instance;
	private CouponServiceImpl() {}
	public static ICouponService getInstance() {
		if(instance == null) instance = new CouponServiceImpl();
				return instance;
	}
	
	ICouponDao couponDao = CouponDaoImpl.getInstance();
	
	@Override
	public List<CouponVO> getCouponList(int accNo) {
		return couponDao.getCouponList(accNo);
	}
	@Override
	public List<AccountVO> couponManage() {
		List<AccountVO> list = couponDao.couponManage();
		return list;
	}
	@Override
	public int couponInsert(Map<String, Object> map) {
		return couponDao.couponInsert(map);
	}
	@Override
	public int couponUse(Map<String, Object> map) {
		return couponDao.couponUse(map);
	}
	

}
