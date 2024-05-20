package com.cosmetic.product.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.apache.tomcat.jni.File;

import com.cosmetic.common.service.AtchFileServiceImpl;
import com.cosmetic.common.service.IAtachFileService;
import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;
import com.cosmetic.product.vo.ProdVO;
import com.cosmetic.util.OthersUtil;

/**
 * Servlet implementation class ProdAddController
 */
@MultipartConfig // 잊지말기
@WebServlet("/prodWrite.do") // jsp파일 input tag action attribute
public class ProdWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdWriteController() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("admin/addProduct.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		long prodNo = Long.parseLong(req.getParameter("prodNo"));
		String prodName = req.getParameter("prodName");
		long prodPrice = Long.parseLong(req.getParameter("prodPrice"));
		long prodCateNo = Long.parseLong(req.getParameter("prodCateNo"));
		String prodContent = req.getParameter("prodContent");
		long brNo = Long.parseLong(req.getParameter("brNo"));

		///////////////////////////////////////////////////////
		// 파일서비스객체 생성
		IAtachFileService atchFileService = AtchFileServiceImpl.getInstance();
		AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
		// 첨부파일 목록 저장하기
//		atchFileDetailVO = atchFileService.saveAtchFileList(req.getParts());

		Collection<Part> parts = new ArrayList<Part>();
		String prodImg = "";
		for (Part part : req.getParts()) {
			
			String fileName = part.getSubmittedFileName();
			
			if(fileName != null && !fileName.equals("")) {
				
				if ("thumbFile".equals(part.getName())) {
					
					String mimeType = req.getServletContext().getMimeType(part.getSubmittedFileName());
					
					InputStream is = part.getInputStream();
					byte[] imageData = new byte[is.available()];
					is.read(imageData);
					is.close();

					prodImg  = Base64.getEncoder().encodeToString(imageData);
					prodImg = "data:" + mimeType + ";base64," + prodImg;
					
				}else {
					
					parts.add(part);
					
				}
			}
		}

		atchFileDetailVO = atchFileService.saveAtchFileList(parts);

		/////////////////////////////////////////////////////////////////////////////
		IProdService service = ProdServiceImpl.getInstance();

		ProdVO pv = new ProdVO();

		pv.setProdNo(prodNo);
		pv.setProdName(prodName);
		pv.setProdPrice(prodPrice);
		pv.setProdCateNo(prodCateNo);
		pv.setBrNo(brNo);
		pv.setProdContent(prodContent);
		pv.setProdImg(prodImg);

//////////////////setFileNo//////////////////////////////////////
		if (atchFileDetailVO != null) {
			pv.setFileNo(atchFileDetailVO.getFileNo());
		}
		int cnt = 0;

		cnt = service.addProd(pv);
		System.out.println("CNT>>" + cnt);

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		req.getSession().setAttribute("msg", msg);

		// 목록화면으로 리다이렉팅
		resp.sendRedirect(req.getContextPath() + "/prodList.do");

	}
}