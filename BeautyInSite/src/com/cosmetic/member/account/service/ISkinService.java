package com.cosmetic.member.account.service;

import com.cosmetic.member.account.vo.SkinVO;

public interface ISkinService {
	int insertSkinType(SkinVO skVO, String[] troubles);

	SkinVO getSkinType(int accNo);

	int updateSkinType(SkinVO skVO, String[] troubles);
}
