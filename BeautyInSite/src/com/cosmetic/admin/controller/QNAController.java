package com.cosmetic.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IQNAService;
import com.cosmetic.admin.service.QNAServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;

@WebServlet("/qnaList.do")
public class QNAController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		IQNAService service = QNAServiceImpl.getInstance();
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		List<Map<String,Object>> list = service.qnaList(accVO.getAccNo());
		
		req.setAttribute("qnalist", list);
		
		
		req.getRequestDispatcher("/main/service/qna_list.jsp").forward(req, resp);
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	}
	
	
}
