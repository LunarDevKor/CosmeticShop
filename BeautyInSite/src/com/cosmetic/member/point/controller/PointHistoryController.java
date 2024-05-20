package com.cosmetic.member.point.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.point.service.IPointService;
import com.cosmetic.member.point.service.PointServiceImpl;
import com.cosmetic.member.point.vo.PointVO;

@WebServlet("/pointhistory.do")
public class PointHistoryController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IPointService ps = PointServiceImpl.getInstance();
		IMemberService ms = MemberServiceImpl.getInstance();
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		accVO = ms.memberLoginChk(accVO);
		
		req.getSession(false).setAttribute("LOGIN_USER", accVO);
		
		List<PointVO> pointList = ps.getPointHistory(accVO.getAccNo());
		
		req.setAttribute("pointList", pointList);
		
		req.getRequestDispatcher("/main/account/pointhistory.jsp").forward(req, resp);
	}
}
