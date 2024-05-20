package com.cosmetic.common.service;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import com.cosmetic.common.vo.AtchFileDetailVO;

public interface IAtachFileService {

	
	/**
	 * 첨부파일 목록을 저장하기 위한 메서드
	 * @param parts 파트정보를 담고 있는 컬렉션 객체
	 * @return 
	 */
	public AtchFileDetailVO saveAtchFileList(Collection<Part> parts);

	public AtchFileDetailVO getAtchFileDetail(AtchFileDetailVO atchFileVO);

	public List<AtchFileDetailVO> getAtchFileList(AtchFileDetailVO atchFileVO);

}
