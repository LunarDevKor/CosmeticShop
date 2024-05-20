package com.cosmetic.common.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.common.service.AtchFileServiceImpl;
import com.cosmetic.common.service.IAtachFileService;
import com.cosmetic.common.vo.AtchFileDetailVO;

@WebServlet("/fileDownload.do")
public class FileDownloadController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long fileDetNo = req.getParameter("fileDetNo") == null ? 0  
				: Long.parseLong(req.getParameter("fileDetNo"));
		
		int fileNo = req.getParameter("fileNo") == null ? 0
			: Integer.parseInt(req.getParameter("fileNo"));
		
		IAtachFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileDetailVO atchFileVO = new AtchFileDetailVO();
		atchFileVO.setFileDetNo(fileDetNo);
		atchFileVO.setFileNo(fileNo);
		
		atchFileVO =  fileService.getAtchFileDetail(atchFileVO);
		
		
	/*
	 	Content-Disposition 헤더에 대하여...
	 	
	 	Response 헤더에서 사용되는 경우 ex) 파일 다운로드
	 	
	 	Content-Disposition: inline(default)
	 	Content-Disposition: attachment
	 	Content-Disposition: attachment; filename="filename.jpg" //주로 사용함
	 */
		
		resp.setContentType("application/octet-strem");
		
		//URL에는 공백문자를 포함할 수 없다. URLEncoding을 이용하여 인코딩 작업을 하면 공백은 
		//+로 표시되기 때문에 +문자를 공백문자인 %20으로 일괄적으로 바꿔준다.
		resp.setHeader("Content-Disposition", 
				"attachment; filename=\""
						+ URLEncoder.encode( atchFileVO.getOriginFilenm(), "UTF-8")
						.replaceAll("\\+","%20")+"\"");
		
		
		BufferedInputStream bis = 
				new BufferedInputStream(new FileInputStream(atchFileVO.getFilePath()));
		
		BufferedOutputStream bos = 
				new BufferedOutputStream(resp.getOutputStream());
		
		int data = 0;
		while((data = bis.read()) != -1) {
			bos.write(data);
		}
		bis.close();
		bos.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);	
	}
}
