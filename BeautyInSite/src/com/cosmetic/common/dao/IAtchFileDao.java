package com.cosmetic.common.dao;

import java.util.List;

import com.cosmetic.common.vo.AtchFileDetailVO;

public interface IAtchFileDao {

	/**
	 * 첨부파일 기본정보 저장
	 * @param atchFileVO
	 * @return
	 */
	public int insertAtchFile(AtchFileDetailVO atchFileVO);

	/**
	 * 첨부파일  세부정보 저장
	 * @param atchFileVO
	 * @return
	 */
	public int insertFileDetail(AtchFileDetailVO atchfileVO);

	public AtchFileDetailVO getatchFileDetail(AtchFileDetailVO atchFileVO);

	public List<AtchFileDetailVO> getatchFileList(AtchFileDetailVO atchFileVO);


}
