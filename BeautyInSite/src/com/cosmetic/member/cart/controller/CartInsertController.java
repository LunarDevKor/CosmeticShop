package com.cosmetic.member.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.cart.service.CartServiceImpl;
import com.cosmetic.member.cart.service.ICartService;
import com.cosmetic.member.cart.vo.CartVO;
import com.cosmetic.util.Const;

@WebServlet("/cartInsert.do")
public class CartInsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		String accNo = String.valueOf(accVO.getAccNo());
		String prodNo = req.getParameter("prodNo");
		String cartQty = req.getParameter("qty");
		
		System.out.println("수량 >>" + cartQty);
		ICartService service = CartServiceImpl.getInstance();

		CartVO cv = CartVO.builder()
				.accNo(Long.parseLong(accNo))
				.prodNo(Long.parseLong(prodNo))
				.cartQty(Long.parseLong(cartQty))
				.build();
		
		int result = service.isCartIn(cv);

		if (result == 0) {
			int cnt = service.cartInsert(cv);
			
			if (cnt > 0) {
				resp.getWriter().write(Const.SUCCESS.getVal());
			}
			
		} else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
		
	}
}
