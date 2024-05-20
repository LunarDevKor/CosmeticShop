package com.cosmetic.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IReviewService;
import com.cosmetic.product.service.ReviewServiceImpl;
import com.cosmetic.product.vo.ReviewVO;

@WebServlet("/review/delete.do")
public class ReivewDeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String prodNo = req.getParameter("prodNo");
		String rvNo = req.getParameter("rvNo");
		
		System.out.println(rvNo);
		
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		
		// 로그인 한 계정정보
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");

		
		long accNo = 0;
		if (accVO != null) {
			accNo = accVO.getAccNo();
		}
		
		
		ReviewVO rv = ReviewVO.builder().
				rvNo(Long.parseLong(rvNo)).
				accNo(accNo).build();
		
		rv.setProdNo(Long.parseLong(prodNo));
		
		int cnt = reviewService.removeReview(rv);
		
		String msg = "";
		
		if (cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/prodDetail.do?prodNo=" +prodNo);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
