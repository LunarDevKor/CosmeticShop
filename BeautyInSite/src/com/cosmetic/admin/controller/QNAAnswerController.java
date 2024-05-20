package com.cosmetic.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IQNAService;
import com.cosmetic.admin.service.QNAServiceImpl;
import com.cosmetic.admin.vo.QNAVO;
import com.cosmetic.util.Const;

@MultipartConfig
@WebServlet("/qnaAnswer.do")
public class QNAAnswerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/main/service/qna_list.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String answerNo = req.getParameter("answerNo");
		String answerId = req.getParameter("answerId");
		String answerTitle = req.getParameter("answerTitle");
		String answerContent = req.getParameter("answerContent");
		String answerCate = req.getParameter("answerCate");

		System.out.println("answerNo >>" + answerNo);
		System.out.println("answerId >>" + answerId);
		System.out.println("answerTitle >>" + answerTitle);
		System.out.println("answerContent >>" + answerContent);
		System.out.println("answerCate >>" + answerCate);

		QNAVO qnaVO = QNAVO.builder().accNo(Long.parseLong(answerId)).sbTitle(answerTitle).sbContent(answerContent)
				.sbAnswer(Long.parseLong(answerNo)).sbCate(Long.parseLong(answerCate)).build();

		IQNAService service = QNAServiceImpl.getInstance();
		int result = service.qnaAnswer(qnaVO);
		
		if(result > 0) 
			req.getSession(false).setAttribute("answer", Const.SUCCESS.getVal());
		else
			req.getSession(false).setAttribute("answer", Const.FAILURE.getVal());

		resp.sendRedirect(req.getContextPath() + "/qnaList.do");
	}

}
