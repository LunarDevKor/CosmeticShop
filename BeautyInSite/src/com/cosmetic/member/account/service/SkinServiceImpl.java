package com.cosmetic.member.account.service;

import com.cosmetic.member.account.dao.ISkinDao;
import com.cosmetic.member.account.dao.SkinDaoImpl;
import com.cosmetic.member.account.vo.SkinVO;

public class SkinServiceImpl implements ISkinService {
	
	private static ISkinService instance;

	private SkinServiceImpl() {
	}

	public static ISkinService getInstance() {
		if (instance == null)
			instance = new SkinServiceImpl();
		return instance;
	}
	
	ISkinDao skDao = SkinDaoImpl.getInstance();

	@Override
	public int insertSkinType(SkinVO skVO, String[] troubles) {
		skVO = skinTypeSelect(skVO,troubles);
		return skDao.insertSkinType(skVO);
	}

	@Override
	public SkinVO getSkinType(int accNo) {
		return skDao.getSkinType(accNo);
	}
	
	@Override
	public int updateSkinType(SkinVO skVO, String[] troubles) {
		skVO = skinTypeSelect(skVO,troubles);
		return skDao.updateSkinType(skVO);
	}
	
	public SkinVO skinTypeSelect(SkinVO skVO, String[] troubles) {
		
		for(int i = 0; i<troubles.length; i++) {
			switch(troubles[i]) {
			case "ATOPI":
				skVO.setAtopi("Y");
				break;
			case "MINGAM" :
				skVO.setMingam("Y");
				break;
            case "SCNE" :
            	skVO.setScne("Y");
            	break;
			case "MIBAEG" :
				skVO.setMibaeg("Y");
				break;	
			case "PIGI" :
				skVO.setPigi("Y");
				break;
			case "DARK" :
				skVO.setDark("Y");
				break;
			case "DRY" :
				skVO.setDry("Y");
				break;
			case "JULEUM" :
				skVO.setJuleum("Y");
				break;	
			case "HONGJO" :
				skVO.setHongjo("Y");
				break;	
			case "GAGJIL" :
				skVO.setGagjil("Y");
				break;
			default :
				break;
			}
		}
		
		return skVO;
	}
}
