package com.cosmetic.member.account.service;

import java.util.Map;

import com.cosmetic.member.account.dao.IMemberDao;
import com.cosmetic.member.account.dao.MemberDaoImpl;
import com.cosmetic.member.account.vo.AccountVO;

public class MemberServiceImpl implements IMemberService{
	
	private static IMemberService instance = null;
	
    private MemberServiceImpl(){}
    
    public static IMemberService getInstance() {
    	if(instance == null) instance = new MemberServiceImpl();
    	return instance;
    }
    
    IMemberDao memDao = MemberDaoImpl.getInstance();

	@Override
	public int getNaverId(String id) {
		return memDao.getNaverId(id);
	}
	@Override
	public int registerMember(AccountVO mv) {
		return memDao.registerMember(mv);
	}
	@Override
	public AccountVO memberLoginChk(AccountVO mv) {
		return memDao.memberLoginChk(mv);
	}

	@Override
	public int registerAuth(Map<String,Object> list) {
		return memDao.registerAuth(list);
	}

	@Override
	public int checkDupMemId(String id) {
		return memDao.checkDupMemId(id);
	}

	@Override
	public AccountVO getMemberByNaverId(int memNo) {
		return memDao.getMemberByNaverId(memNo);
	}

	@Override
	public int getKakaoId(long id) {
		return memDao.getKakaoId(id);
	}

	@Override
	public AccountVO getMemberByKakaoId(int memNo) {
		return memDao.getMemberByKakaoId(memNo);
	}

	@Override
	public int deleteAccount(String accNo) {
		int result = memDao.deleteAccount(accNo);
		if(result>0) memDao.deleteAuthToken(accNo);
		return result;
	}

	@Override
	public int getPassByidAndPhone(AccountVO accVO) {
		return memDao.getPassByidAndPhone(accVO);
	}

	@Override
	public int changePassword(AccountVO accVO) {
		return memDao.changePassword(accVO);
	}

	@Override
	public String findId(AccountVO accVO) {
		return memDao.findId(accVO);
	}

	@Override
	public int accountUpdate(AccountVO accVO) {
		return memDao.accountUpdate(accVO);
	}

	@Override
	public int passwordChk(AccountVO accVO) {
		return memDao.passwordChk(accVO);
	}

	@Override
	public int orderUsedPoint(String usePoint) {
		return memDao.orderUsedPoint(usePoint);
	}
}
