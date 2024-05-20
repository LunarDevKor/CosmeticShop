

package com.cosmetic.member.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.cart.service.CartServiceImpl;
import com.cosmetic.member.cart.service.ICartService;
import com.cosmetic.member.cart.vo.CartVO;

@WebServlet("/cartList.do")
public class CartListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		ICartService cartService = CartServiceImpl.getInstance();
		
		
		AccountVO accVO = (AccountVO) req.getSession().getAttribute("LOGIN_USER");
		Map<String,Object> map = new HashMap<String,Object>() {{
			put("accNo", accVO.getAccNo());
			put("grdNo", accVO.getGrdNo());
		}};
		 
		List<CartVO> list = cartService.cartList(map);
		
		req.setAttribute("list",list);
		
		req.getRequestDispatcher("/main/order/cart.jsp").forward(req, resp);
		
		
		
		
	}

}
