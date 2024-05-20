package com.cosmetic.member.wishlist.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/deleteWish.do")
public class WishListDeleteController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = req.getReader();
		
		String line;
		
		while((line = reader.readLine()) != null) {
			builder.append(line);
		}
		
		String jsonData = builder.toString();
		
		System.out.println(jsonData);
		
		ObjectMapper objMapper = new ObjectMapper();
		Map<String, String> dataMap = objMapper.readValue(jsonData, new TypeReference<Map<String, String>>() {});
		
		String prodNo = dataMap.get("prodNo");
		String accNo = "";
		
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		if(accVO != null) {
			accNo = String.valueOf(accVO.getAccNo());
		}
		
		WishListVO wishVO = WishListVO.builder()
				.accNo(Long.parseLong(accNo))
				.prodNo(Long.parseLong(prodNo))
				.build();
		
		
		IWishListService wishService = WishListServiceImpl.getInstance();
		int result = wishService.deleteWish(wishVO);
		
		if(result > 0) {
			resp.getWriter().write(Const.SUCCESS.getVal());
		}else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
		
	}
}
