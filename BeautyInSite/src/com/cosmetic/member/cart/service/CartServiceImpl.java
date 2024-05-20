package com.cosmetic.member.cart.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.cart.dao.CartDaoImpl;
import com.cosmetic.member.cart.dao.ICartDao;
import com.cosmetic.member.cart.vo.CartVO;

public class CartServiceImpl implements ICartService {
	private static ICartService instance = null;
	ICartDao cartDao = CartDaoImpl.getInstance();
	
	
	private CartServiceImpl() {
	}

	public static ICartService getInstance() {
		if (instance == null)
			instance = new CartServiceImpl();
		return instance;
	}

	@Override
	public int cartInsert(CartVO cv) {
		
		return cartDao.cartInsert(cv);
	}

	@Override
	public List<CartVO> cartList(Map<String, Object> map) {
		return cartDao.cartList(map);
	}

	@Override
	public int cartDelete(String prodNo, String accNo) {
		return cartDao.cartDelete(prodNo, accNo);
	}

	@Override
	public int cartUpdate(String cartNo, String cartQty) {
		return cartDao.cartUpdate(cartNo, cartQty);
	}

	@Override
	public int isCartIn(CartVO cv) {
		return cartDao.isCartIn(cv);
	}

	@Override
	public int cartClear(String accNo) {
		return cartDao.cartClear(accNo);
	}

	@Override
	public int getCartCnt(int accNo) {
		return cartDao.getCartCnt(accNo);
	}

	
	
	
	
}
