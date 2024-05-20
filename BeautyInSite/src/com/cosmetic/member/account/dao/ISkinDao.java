package com.cosmetic.member.account.dao;

import com.cosmetic.member.account.vo.SkinVO;

public interface ISkinDao {
	int insertSkinType(SkinVO skVO);

	SkinVO getSkinType(int accNo);

	int updateSkinType(SkinVO skVO);
}
