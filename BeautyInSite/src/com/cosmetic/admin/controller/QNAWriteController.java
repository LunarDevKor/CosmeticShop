package com.cosmetic.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IQNAService;
import com.cosmetic.admin.service.QNAServiceImpl;
import com.cosmetic.admin.vo.QNAVO;
import com.cosmetic.util.Const;

@WebServlet("/qnaWrite.do")
public class QNAWriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/main/service/qna_writer.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sbTitle = req.getParameter("sbTitle");
		String sbContent = req.getParameter("sbContent");
		String accNo = req.getParameter("accNo");
		
		String sbCate = req.getParameter("sbCate");
		
		
		QNAVO qnaVO =  QNAVO.builder()
				.sbTitle(sbTitle)
				.sbContent(sbContent)
				.accNo(Long.parseLong(accNo))
				.sbCate(Long.parseLong(sbCate))
				.build();
		
		IQNAService service = QNAServiceImpl.getInstance();
		int result = service.insertQna(qnaVO);
		
		if(result > 0) 
			req.getSession(false).setAttribute("insert", Const.SUCCESS.getVal());
		else
			req.getSession(false).setAttribute("insert", Const.FAILURE.getVal());
		
		resp.sendRedirect(req.getContextPath()+"/qnaList.do");
	}
	

	
	
}
