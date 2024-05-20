package com.cosmetic.member.order.controller;

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

@WebServlet("/orderCoupon.do")
public class OrderCouponController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		ICouponService couponService = CouponServiceImpl.getInstance();
		List<CouponVO> couponList = couponService.getCouponList(accVO.getAccNo());
		
		req.setAttribute("couponList", couponList);
		req.setAttribute("accVO", accVO);
		
		req.getRequestDispatcher("/main/order/ordercoupon.jsp").forward(req, resp);;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
