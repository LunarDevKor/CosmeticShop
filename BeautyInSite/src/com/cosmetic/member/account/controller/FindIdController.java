package com.cosmetic.member.account.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;


@WebServlet("/findId.do")
public class FindIdController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		System.out.println(name);
		System.out.println(email);
		
		AccountVO accVO = AccountVO.builder()
				.name(name)
				.email(email)
				.build();
		
		IMemberService ms = MemberServiceImpl.getInstance();
		String id = ms.findId(accVO);
		
		resp.getWriter().write(id);
	}

}
