package com.cosmetic.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.common.service.AtchFileServiceImpl;
import com.cosmetic.common.service.IAtachFileService;
import com.cosmetic.common.vo.AtchFileDetailVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IReviewService;
import com.cosmetic.product.service.ReviewServiceImpl;
import com.cosmetic.product.vo.ReviewVO;
@MultipartConfig
@WebServlet("/review/update.do")
public class ReivewUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String rvNo = req.getParameter("rvNo");
		
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		
		//rvNO를 param으로 보냄
		ReviewVO rv = reviewService.getReview(rvNo);
		
		req.setAttribute("rv", rv);
		
		/////////////////////////////////////////////////////////////////////
		
		if(rv.getFileNo() > 0) { // 첨부파일이 존재하는 경우
			
			IAtachFileService fileService = AtchFileServiceImpl.getInstance();
			
			AtchFileDetailVO atchFileVO = new AtchFileDetailVO();
			atchFileVO.setFileDetNo(rv.getFileNo());
			
			List<AtchFileDetailVO> atchFileList = fileService.getAtchFileList(atchFileVO);
			
			req.setAttribute("atchFileList", atchFileList);
			
		}
		req.getRequestDispatcher("/shop/detail.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String rvRating = req.getParameter("rvRating");
		String rvContent = req.getParameter("rvContent");
		/* String fileNo = req.getParameter("fileNo"); */
		String fileno = req.getParameter("fileNum"); 
		String rvNo = req.getParameter("rvNo");
		String prodNo =  req.getParameter("prodNo");
		
		IAtachFileService fileService = AtchFileServiceImpl.getInstance();
		AtchFileDetailVO atchFileVO = new AtchFileDetailVO();
		atchFileVO = fileService.saveAtchFileList(req.getParts());
		
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		
		// 로그인 한 계정정보
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
				
		long accNo = 0;
		if (accVO != null) {
			accNo = accVO.getAccNo();
		}
		
		ReviewVO rv = ReviewVO.builder().
				rvRating(Long.parseLong(rvRating)).
				rvContent(rvContent).
				rvNo(Long.parseLong(rvNo)).
				accNo(accNo).
				build();
		
		rv.setProdNo(Long.parseLong(prodNo));

		
		if (atchFileVO == null) { //신규첨부파일이 존재하지 않는 경우...
			rv.setFileNo(Long.parseLong(fileno));
			
		}else {//신규첨부파일이 존재하는 경우..
			rv.setFileNo(atchFileVO.getFileNo());
		}
		
		System.out.println("rv" + rv);
		
		//성공하면 1을 반환
		int cnt = reviewService.modifyReivew(rv);
		
		System.out.println(cnt);

		String msg = "";
		
		
		if (cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);

		resp.sendRedirect(req.getContextPath() + "/prodDetail.do?prodNo=" + prodNo);
	}
}
