package com.cosmetic.member.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.cart.service.CartServiceImpl;
import com.cosmetic.member.cart.service.ICartService;
import com.cosmetic.util.Const;

@WebServlet("/cartClear.do")
public class CartClearController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accNo = req.getParameter("accNo");
		
		ICartService cartService = CartServiceImpl.getInstance();
		int result = cartService.cartClear(accNo);
		
		if(result > 0) {
			resp.getWriter().write(Const.SUCCESS.getVal());
		}else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
	}
	
}
