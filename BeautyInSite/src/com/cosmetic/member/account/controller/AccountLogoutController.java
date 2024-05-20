package com.cosmetic.member.account.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cosmetic.util.Const;

@WebServlet("/logout.do")
public class AccountLogoutController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String result = "?logout=";
		if(session != null) {
			session.invalidate();
			result += Const.SUCCESS.getVal();
//			http://cafe.naver.com?logout=SUCCESS
		}
		else
			result += Const.FAILURE.getVal();
//			http://cafe.naver.com?logout=FAILURE
		
		resp.sendRedirect(req.getContextPath()+"/index.do"+result);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
