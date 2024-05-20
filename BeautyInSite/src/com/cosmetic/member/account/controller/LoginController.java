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
import com.cosmetic.util.OthersUtil;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/main/account/login.jsp";
//		String referer = req.getHeader("Referer");
//		req.getSession().setAttribute("referer", referer);

		req.getRequestDispatcher(url).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String url = "";
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		pw = OthersUtil.SHA256Encryption(pw);

		AccountVO accVO = AccountVO.builder()
				.id(id)
				.pw(pw)
				.build();
		IMemberService memService = MemberServiceImpl.getInstance();

		accVO = memService.memberLoginChk(accVO);

		if (accVO != null) {
			req.getSession().setAttribute("LOGIN_USER", accVO);
//			String referer = (String) req.getSession().getAttribute("referer");
//			req.getSession().removeAttribute("referer");
			
			url = "/index.do";
			resp.sendRedirect(req.getContextPath() + url);
		}else {
			url = "/login.do";
			req.getSession().setAttribute("loginFail", Const.FAILURE.getVal());
			resp.sendRedirect(req.getContextPath() + url);
		}
	}
}
