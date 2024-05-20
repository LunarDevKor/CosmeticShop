package com.cosmetic.member.wishlist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.member.wishlist.vo.WishListVO;
import com.cosmetic.util.MyBatisUtil;

public class WishListDaoImpl implements IWishListDao {

	private static IWishListDao instance = null;

	private WishListDaoImpl() {
	}

	public static IWishListDao getInstance() {
		if (instance == null)
			instance = new WishListDaoImpl();
		return instance;
	}

	@Override
	public int addWishList(WishListVO wishVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.insert("wish.addWishList", wishVO);

			if (result > 0)
				sql.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getMyWishList(int accNo) {

		List<Map<String, Object>> wishList = null;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			wishList = sql.selectList("wish.getMyWishList", accNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return wishList;
	}

	@Override
	public int deleteWish(WishListVO wishVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.delete("deleteWish", wishVO);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int isWishIn(WishListVO wishVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			result = sql.selectOne("wish.isWishIn", wishVO);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Map<String, Object>> getWishListByRownum(int accNo) {

		List<Map<String, Object>> wishList = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			wishList = sql.selectList("getWishListByRownum", accNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return wishList;
	}

}
