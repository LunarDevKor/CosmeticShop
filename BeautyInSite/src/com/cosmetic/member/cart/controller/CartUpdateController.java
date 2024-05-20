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

@WebServlet("/cartUpdate.do")
public class CartUpdateController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String cartNo = req.getParameter("cartNo");
	String cartQty = req.getParameter("cartQty");
	
	ICartService service = CartServiceImpl.getInstance();
	
	int cnt  = service.cartUpdate(cartNo,cartQty);
	
	if(cnt > 0) 
		req.getSession().setAttribute("cartUpdateSuccess", Const.SUCCESS.getVal());
	else 
		req.getSession().setAttribute("cartUpdateFailure", Const.FAILURE.getVal());
	
	resp.sendRedirect("cartList.do");
	}

}
