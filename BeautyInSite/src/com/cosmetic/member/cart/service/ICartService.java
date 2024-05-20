package com.cosmetic.member.cart.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.cart.vo.CartVO;


public interface ICartService {

	

	int cartInsert(CartVO cv);

	List<CartVO> cartList(Map<String, Object> map);

	int cartDelete(String prodNo, String accNo);

	int cartUpdate(String cartNo, String cartQty);

	int isCartIn(CartVO cv);

	int cartClear(String accNo);

	int getCartCnt(int accNo);

	

	
	
	
}
