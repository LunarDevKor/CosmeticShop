package com.cosmetic.member.account.service;

import java.util.Map;

import com.cosmetic.member.account.vo.AccountVO;

public interface IMemberService {
	
	public int getNaverId(String id);

	public int registerMember(AccountVO mv);

	public AccountVO memberLoginChk(AccountVO mv);

	public int registerAuth(Map<String,Object> list);

	public int checkDupMemId(String id);
	
	public AccountVO getMemberByNaverId(int memNo);

	public int getKakaoId(long id);

	public AccountVO getMemberByKakaoId(int memNo);
	
	public int deleteAccount(String accNo);

	public int getPassByidAndPhone(AccountVO accVO);

	int changePassword(AccountVO accVO);

	public String findId(AccountVO accVO);

	public int accountUpdate(AccountVO accVO);

	public int passwordChk(AccountVO accVO);

	public int orderUsedPoint(String usePoint);
	
}
