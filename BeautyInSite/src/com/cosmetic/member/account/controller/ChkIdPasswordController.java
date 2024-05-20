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
import com.cosmetic.util.Const;

@WebServlet("/findCred.do")
public class ChkIdPasswordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/main/account/findCred.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String task = req.getParameter("action");
		IMemberService ms = MemberServiceImpl.getInstance();
		AccountVO accVO;
		
		int accNo = 0;
		
		if (task != null && task.equals("findPw")) {

			String id = req.getParameter("id");
			String phone = req.getParameter("phone");

			accVO = AccountVO.builder()
					.id(id)
					.tel(phone)
					.build();

			accNo = ms.getPassByidAndPhone(accVO);
			
			System.out.println(accNo);
			
			if(accNo > 0) {
				resp.getWriter().write(String.valueOf(accNo));
			}else {
				resp.getWriter().write(Const.FAILURE.getVal());
			}
			
			return;
		}
	}
}
