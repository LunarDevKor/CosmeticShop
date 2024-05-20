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

@WebServlet("/pwChk.do")
public class ChkPasswordController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String accNo = req.getParameter("accNo");
		String pw = OthersUtil.SHA256Encryption(req.getParameter("pw"));
		
		IMemberService ms = MemberServiceImpl.getInstance();
		AccountVO accVO = AccountVO.builder().accNo(Integer.parseInt(accNo)).pw(pw).build();
		int result = ms.passwordChk(accVO);
		
		if(result > 0) {
			
			resp.getWriter().write(Const.SUCCESS.getVal());
		}else {
			resp.getWriter().write(Const.FAILURE.getVal());
		}
	}
}
