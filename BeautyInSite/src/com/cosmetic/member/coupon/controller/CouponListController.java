package com.cosmetic.member.coupon.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.coupon.service.CouponServiceImpl;
import com.cosmetic.member.coupon.service.ICouponService;
import com.cosmetic.member.coupon.vo.CouponVO;

@WebServlet("/mycoupon.do")
public class CouponListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AccountVO accVO = (AccountVO)req.getSession(false).getAttribute("LOGIN_USER");
		
		ICouponService ms = CouponServiceImpl.getInstance();
		List<CouponVO> couponList = ms.getCouponList(accVO.getAccNo());
		
		req.setAttribute("couponList", couponList);
		
		req.getRequestDispatcher("/main/account/coupon.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	

}
