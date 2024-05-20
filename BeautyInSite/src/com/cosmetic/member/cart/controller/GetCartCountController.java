package com.cosmetic.member.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.cart.service.CartServiceImpl;
import com.cosmetic.member.cart.service.ICartService;
import com.cosmetic.util.Const;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/getCartCnt.do")
public class GetCartCountController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ICartService cartService = CartServiceImpl.getInstance();
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
	
		int count = cartService.getCartCnt(accVO.getAccNo());
		
		if(count < 0 ) {
			resp.getWriter().write(Const.FAILURE.getVal());
		}else {
			resp.getWriter().write(String.valueOf(count));
		}
	}
}
