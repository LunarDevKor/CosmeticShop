package com.cosmetic.member.account.dao;

import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.util.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao {

	SqlSession sql = null;

	private static IMemberDao instance = null;

	private MemberDaoImpl() {
	}

	public static IMemberDao getInstance() {
		if (instance == null)
			instance = new MemberDaoImpl();
		return instance;
	}

	@Override
	public int getNaverId(String id) {

		sql = MyBatisUtil.getInstance(true);
		int result = 0;

		try {

			result = (int) (sql.selectOne("member.getNaverId", id) == null ? 0
					: sql.selectOne("member.getNaverId", id));

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return result;
	}

	@Override
	public int registerMember(AccountVO mv) {

		sql = MyBatisUtil.getInstance();
		int result = 0;
		try {
			result = sql.insert("member.registerMemeber", mv);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return result;
	}

	@Override
	public AccountVO memberLoginChk(AccountVO mv) {

		sql = MyBatisUtil.getInstance(true);
		AccountVO result = AccountVO.builder().build();

		try {

			result = sql.selectOne("member.memberLoginChk", mv);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return result;
	}

	@Override
	public int registerAuth(Map<String, Object> map) {

		sql = MyBatisUtil.getInstance();
		int result = 0;

		try {
			System.out.println("(DAO)NAVER >> " + map.get("authNaverid"));
			System.out.println("(DAO)KAKAO >> " + map.get("authKakaoid"));

			result = sql.insert("member.registerAuth", map);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return result;
	}

	@Override
	public int checkDupMemId(String id) {

		sql = MyBatisUtil.getInstance(true);
		int result = 0;

		try {

			result = sql.selectOne("checkDupMemId", id);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return result;
	}

	@Override
	public AccountVO getMemberByNaverId(int memNo) {

		sql = MyBatisUtil.getInstance(true);
		AccountVO mv = AccountVO.builder().build();

		try {

			mv = sql.selectOne("member.getMemberByAccNo", memNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return mv;
	}

	@Override
	public int getKakaoId(long id) {

		sql = MyBatisUtil.getInstance(true);
		int result = 0;

		try {

			result = sql.selectOne("member.getKakaoId", id) == null ? 0 : sql.selectOne("member.getKakaoId", id);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return result;
	}

	@Override
	public AccountVO getMemberByKakaoId(int accNo) {

		AccountVO mv = AccountVO.builder().build();
		SqlSession sql = MyBatisUtil.getInstance(true);

		try {

			mv = sql.selectOne("member.getMemberByAccNo", accNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sql.close();
		}

		return mv;
	}

	@Override
	public int deleteAccount(String accNo) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.delete("member.deleteAccount", accNo);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteAuthToken(String accNo) {

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			int result = sql.delete("member.deleteAuthToken", accNo);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int getPassByidAndPhone(AccountVO accVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			result = sql.selectOne("member.getPassByidAndPhone", accVO);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int changePassword(AccountVO accVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.update("member.changePassword", accVO);

			if (result > 0)
				sql.commit();

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public String findId(AccountVO accVO) {

		String id = "";

		try (SqlSession sql = MyBatisUtil.getInstance(true)) {

			id = sql.selectOne("member.findId", accVO);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return id;
	}

	@Override
	public int accountUpdate(AccountVO accVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.update("member.accountUpdate", accVO);

			if (result > 0)
				sql.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int passwordChk(AccountVO accVO) {

		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {

			result = sql.selectOne("member.passwordChk", accVO);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int orderUsedPoint(String usePoint) {
		
		int result = 0;

		try (SqlSession sql = MyBatisUtil.getInstance()) {
			result = sql.update("member.usePoint", usePoint);
			
			if(result > 0) sql.commit();
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
