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

@WebServlet("/idCheck.do")
public class ChkIdController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMemberService memService = MemberServiceImpl.getInstance();
		
		String id = req.getParameter("id");
		
		System.out.println(id);
		
		if(id != null && !id.equals("")) {
			int check = memService.checkDupMemId(id);
			if (check == 0) {
				resp.getWriter().write(Const.SUCCESS.getVal());
			} else {
				resp.getWriter().write(Const.FAILURE.getVal());
			}
		}
		
		
	}

}
