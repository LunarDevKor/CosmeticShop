package com.cosmetic.product.controller;

import java.io.IOException;

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
@WebServlet("/insert.do")
public class ReviewInsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/shop/detail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String prodno = req.getParameter("prodNo");
		String rvRating = req.getParameter("rvRating");
		String rvContent = req.getParameter("rvContent");

		//파일서비스 객체생성
		IAtachFileService atachFileService = AtchFileServiceImpl.getInstance();
		
		AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
		
		//첨부파일 목록저장하기
		atchFileDetailVO = atachFileService.saveAtchFileList(req.getParts());
				
		//회원정보 저장
		IReviewService reviewService = ReviewServiceImpl.getInstance();
				
		// 로그인 한 계정정보
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		long accNo = 0;
		if (accVO != null) {
			accNo = accVO.getAccNo();
		}
		
		ReviewVO rv = ReviewVO.builder().
				rvRating(Long.parseLong(rvRating)).
				rvContent(rvContent).accNo(accNo).build();
		
		rv.setProdNo(Long.parseLong(prodno));
		
		

		if (atchFileDetailVO != null) {
			rv.setFileNo(atchFileDetailVO.getFileNo());
		}
		
		System.err.println("rv값"+ rv);
		
		int cnt = reviewService.insertReview(rv);
		
		System.err.println("CNT >> " + cnt);
		
		String msg = "";
		
		if (cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);

		//목록화면으로 리 다이렉팅  처리
		resp.sendRedirect(req.getContextPath() + "/prodDetail.do?prodNo=" +prodno);

	}
}
