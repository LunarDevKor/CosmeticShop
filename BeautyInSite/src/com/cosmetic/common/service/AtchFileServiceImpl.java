package com.cosmetic.common.service;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import com.cosmetic.common.dao.AtchFileDaoImpl;
import com.cosmetic.common.dao.IAtchFileDao;
import com.cosmetic.common.vo.AtchFileDetailVO;



public class AtchFileServiceImpl implements IAtachFileService {

	private static final String UPLOAD_DIR = "upload_beautyfiles";

	private IAtchFileDao fileDao;

	private static IAtachFileService fileService;

	public AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}

	public static IAtachFileService getInstance() {
		if (fileService == null) {
			fileService = new AtchFileServiceImpl();
		}
		return fileService;
	}

	@Override
	public AtchFileDetailVO saveAtchFileList(Collection<Part> parts) {

		String uploadPath = "G:\\.shortcut-targets-by-id\\1-7TFEAB7I5Op57v26vCMd1LbsYe9FesV\\upload_beautyfiles";
		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		boolean isFirstFile = true; // 첫번째 파일 여부
		AtchFileDetailVO atchfileVO = null;

		for (Part part : parts) {
			
			String fileName = part.getSubmittedFileName();
			System.out.println(fileName);

			if (fileName != null && !fileName.equals("")) {

				if (isFirstFile) {
					isFirstFile = false;

				// 파일 기본정보 저장
				atchfileVO = new AtchFileDetailVO();
				fileDao.insertAtchFile(atchfileVO);
				}
				
			//파일 세부정보 저장
			String originFilenm = fileName; //원본 파일명
			long fileSize = part.getSize(); //파일 사이즈
			String stFilenm = ""; //저장 파일명
			String filePath = ""; //저장파일 경로
			
			stFilenm = UUID.randomUUID().toString() + "_" + originFilenm;
			stFilenm = stFilenm.replace("-", "").substring(10);
			
			filePath = uploadPath + "/" + stFilenm;
			
			try {
				//업로드 파일 저장
				part.write(filePath);
			} catch (Exception e) {
				throw new RuntimeException("파일 저장중 예외발생", e);
			}
			
			//확장자명 추출
			String fileExt = originFilenm.lastIndexOf(".") < 0 ? "" :
				originFilenm.substring(originFilenm.lastIndexOf(".")+1);
			
			atchfileVO.setStFilenm(stFilenm); //저장파일명
			atchfileVO.setFileSize(fileSize); //파일 사이즈
			atchfileVO.setOriginFilenm(originFilenm); //원본파일명
			atchfileVO.setFilePath(filePath); //저장파일 경로
			atchfileVO.setFileExt(fileExt);//확장자명
			atchfileVO.setFileContents(""); //파일 내용
			
			//파일세부정보 저장
			fileDao.insertFileDetail(atchfileVO);
			}
		}
		return atchfileVO;
	}

	@Override
	public AtchFileDetailVO getAtchFileDetail(AtchFileDetailVO atchFileVO) {
		return fileDao.getatchFileDetail(atchFileVO);
	}

	@Override
	public List<AtchFileDetailVO> getAtchFileList(AtchFileDetailVO atchFileVO) {

		List<AtchFileDetailVO> atchfileList = fileDao.getatchFileList(atchFileVO);
		return atchfileList;
	}
}
