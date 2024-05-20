package com.cosmetic.common.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 3, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/fileUpload2.do")
public class FileUploadController extends HttpServlet {

	// 디렉토리의 상대경로를 지정
	private static final String UPLOAD_DIR = "upload_beautyfile";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 웹애플리케이션 루트 디렉토리를 기준으로 업로드 경로 설정하기
		//String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR;
		String uploadPath = "G:\\.shortcut-targets-by-id\\1-7TFEAB7I5Op57v26vCMd1LbsYe9FesV\\upload_beautyfiles";
		File uploadDir = new File(uploadPath);

		// 파일을 업로드할 디렉토리가 존재하지 않으면 해당 디렉토리를 생성
		if (!uploadDir.exists()) {
			// 디렉토리를 생성하는 메서드
			uploadDir.mkdir();
		}

		try {

			String fileName = "";

			for (Part part : req.getParts()) {
				System.out.println(part.getHeader("content-disposition"));
				// name 속성명
				System.out.println("전송된 part 명 :" + part.getName());

				// 폼필드가 아니거나 파일이 비어있지 않은경우(첨부파일이 있는경우)
				if (fileName != null && !fileName.equals("")) {
					// 파일 저장
					part.write(uploadPath + File.separator + fileName);
					System.out.println(fileName + "업로드 됨");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
