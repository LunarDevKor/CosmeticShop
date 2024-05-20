package com.cosmetic.member.account.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IOrderService;
import com.cosmetic.admin.service.OrderServiceImpl;
import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.wishlist.service.IWishListService;
import com.cosmetic.member.wishlist.service.WishListServiceImpl;

@WebServlet("/mypage.do")
public class MyPageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		IMemberService ms = MemberServiceImpl.getInstance();
		accVO = ms.memberLoginChk(accVO);
		
		req.getSession(false).setAttribute("LOGIN_USER", accVO);
		
		
		IOrderService orderService = OrderServiceImpl.getInstance();
		List<OrderVO> orderList = orderService.getMypageOrderHistory(accVO.getAccNo());
		
		IWishListService wishService = WishListServiceImpl.getInstance();
		List<Map<String,Object>> wishList = wishService.getWishListByRownum(accVO.getAccNo());
		
		for(int i = 0; i<wishList.size(); i++) {
			try {
				Clob clob = (Clob) wishList.get(i).get("PROD_IMG");
				Reader reader = clob.getCharacterStream();
				BufferedReader br = new BufferedReader(reader);
				String result = br.lines().collect(Collectors.joining());
				
				wishList.get(i).put("PROD_IMG", result);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		req.setAttribute("orderList", orderList);
		req.setAttribute("wishList", wishList);
		
		req.getRequestDispatcher("/main/account/mypage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
