package com.cosmetic.member.account.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.member.account.vo.SkinVO;
import com.cosmetic.util.MyBatisUtil;

public class SkinDaoImpl implements ISkinDao {

	private static ISkinDao instance;

	private SkinDaoImpl() {
	}

	public static ISkinDao getInstance() {
		if (instance == null)
			instance = new SkinDaoImpl();
		return instance;
	}

	@Override
	public int insertSkinType(SkinVO skVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.insert("skin.insertSkinType", skVO);
			if (result > 0)
				sql.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public SkinVO getSkinType(int accNo) {

		SkinVO skVO = null;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			skVO = sql.selectOne("skin.getSkinType", accNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return skVO;
	}

	@Override
	public int updateSkinType(SkinVO skVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.update("skin.updateSkinType", skVO);
			
			if(result > 0) sql.commit();
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

}
