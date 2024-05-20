package com.cosmetic.member.account.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.util.Const;

@WebServlet("/leave.do")
public class AccountDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/main/account/leave.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accNo = req.getParameter("accNo");
		IMemberService ms = MemberServiceImpl.getInstance();
		int result = ms.deleteAccount(accNo);
		
		if(result > 0) {
			req.getSession().invalidate();
			
			resp.getWriter().write(Const.SUCCESS.getVal());
//			resp.sendRedirect(req.getContextPath()+"/index.do");
		}else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
	}
}
