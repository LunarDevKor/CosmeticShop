package com.cosmetic.member.wishlist.dao;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.wishlist.vo.WishListVO;

public interface IWishListDao {

	int addWishList(WishListVO wishVO);

	List<Map<String, Object>> getMyWishList(int accNo);

	int deleteWish(WishListVO wishVO);

	int isWishIn(WishListVO wishVO);

	List<Map<String, Object>> getWishListByRownum(int accNo);
	

}