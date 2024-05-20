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

@WebServlet("/changePw.do")
public class UpdatePasswordController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String task = req.getParameter("action");
		String accNo = req.getParameter("accNo");
		IMemberService ms = MemberServiceImpl.getInstance();
		AccountVO accVO;

		int result = 0;

		if (task != null && task.equals("changePw")) {

			String pw = req.getParameter("pw");
			pw = OthersUtil.SHA256Encryption(pw);
			
			accVO = AccountVO.builder().pw(pw).accNo(Integer.parseInt(accNo)).build();

			result = ms.changePassword(accVO);
		}

		if (result > 0) {
			resp.getWriter().write(Const.SUCCESS.getVal());
		} else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
	}

}
