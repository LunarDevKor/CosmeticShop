package com.cosmetic.member.account.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;

@WebServlet("/naverLoginProcess.do")
public class LoginNaverProcess extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// NaverLoginController 에서 전송한 값들을 받아옴
		Map<String,String> profileMap = (Map<String,String>) req.getAttribute("naver");
		String id = profileMap.get("id");
		
		// 받아온 값들을 통해 데이터베이스 서칭
		IMemberService memService = MemberServiceImpl.getInstance();
		int result = memService.getNaverId(id);
		
		// 해당 데이터를 조회해 값이 있으면 로그인, 값이 없으면 회원가입 로직 실행
		String url = "/index.do";
		if(result > 0) {
			int memNo = result;
			AccountVO mv = memService.getMemberByNaverId(memNo);
			
			req.getSession().setAttribute("LOGIN_USER", mv);
			resp.sendRedirect(req.getContextPath()+url);
			
		}else { // 
			result = -1; // 네이버 로그인 URL 핸들링
			req.getSession().setAttribute("result", result);
			req.getSession().setAttribute("naverProfile", profileMap);
			url = "/login.do";
			resp.sendRedirect(req.getContextPath()+url);
		}
	}
}
