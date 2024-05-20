package com.cosmetic.member.wishlist.service;

import java.util.List;
import java.util.Map;

import com.cosmetic.member.wishlist.dao.IWishListDao;
import com.cosmetic.member.wishlist.dao.WishListDaoImpl;
import com.cosmetic.member.wishlist.vo.WishListVO;

public class WishListServiceImpl implements IWishListService{
	
	private static IWishListService instance = null;
	
    private WishListServiceImpl(){}
    
    public static IWishListService getInstance() {
    	if(instance == null) instance = new WishListServiceImpl();
    	return instance;
    }
    
    IWishListDao wishDao = WishListDaoImpl.getInstance();

	@Override
	public int addWishList(WishListVO wishVO) {
		return wishDao.addWishList(wishVO);
	}

	@Override
	public List<Map<String, Object>> getMyWishList(int accNo) {
		return wishDao.getMyWishList(accNo);
	}

	@Override
	public int deleteWish(WishListVO wishVO) {
		return wishDao.deleteWish(wishVO);
	}

	@Override
	public int isWishIn(WishListVO wishVO) {
		return wishDao.isWishIn(wishVO);
	}

	@Override
	public List<Map<String, Object>> getWishListByRownum(int accNo) {
		return wishDao.getWishListByRownum(accNo);
	}

}
