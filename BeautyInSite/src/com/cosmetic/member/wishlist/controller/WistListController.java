package com.cosmetic.member.wishlist.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.wishlist.service.IWishListService;
import com.cosmetic.member.wishlist.service.WishListServiceImpl;
import com.cosmetic.util.Const;

@WebServlet("/wishList.do")
public class WistListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IWishListService wishService = WishListServiceImpl.getInstance();
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		List<Map<String,Object>> wishList = wishService.getMyWishList(accVO.getAccNo());
		
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
		
		req.setAttribute("wishList", wishList);
		
		req.getRequestDispatcher("/main/order/wishlist.jsp").forward(req, resp);
	}
}
