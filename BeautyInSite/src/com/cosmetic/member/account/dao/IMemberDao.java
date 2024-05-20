package com.cosmetic.member.account.dao;

import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;

public interface IMemberDao {
	int getNaverId(String id);

	int registerMember(AccountVO mv);

	AccountVO memberLoginChk(AccountVO mv);

	int registerAuth(Map<String,Object> list);

	int checkDupMemId(String id);

	AccountVO getMemberByNaverId(int memNo);

	int getKakaoId(long id);

	AccountVO getMemberByKakaoId(int memNo);
	
	int deleteAccount(String accNo);

	void deleteAuthToken(String accNo);

	int getPassByidAndPhone(AccountVO accVO);

	int changePassword(AccountVO accVO);

	String findId(AccountVO accVO);

	int accountUpdate(AccountVO accVO);

	int passwordChk(AccountVO accVO);

	int orderUsedPoint(String usePoint);

}