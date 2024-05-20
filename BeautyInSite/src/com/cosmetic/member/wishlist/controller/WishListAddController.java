package com.cosmetic.member.wishlist.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.wishlist.service.IWishListService;
import com.cosmetic.member.wishlist.service.WishListServiceImpl;
import com.cosmetic.member.wishlist.vo.WishListVO;
import com.cosmetic.util.Const;

@WebServlet("/addWish.do")
public class WishListAddController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		int accNo = accVO.getAccNo();
		String prodNo = req.getParameter("prodNo");
		
		WishListVO wishVO = WishListVO.builder().accNo(accNo).prodNo(Long.parseLong(prodNo)).build();

		IWishListService wishService = WishListServiceImpl.getInstance();

		int cnt = wishService.isWishIn(wishVO);

		if (cnt == 0) {

			int result = wishService.addWishList(wishVO);

			if (result > 0) {
				resp.getWriter().write(Const.SUCCESS.getVal());
			}
			
		} else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
	}
}
