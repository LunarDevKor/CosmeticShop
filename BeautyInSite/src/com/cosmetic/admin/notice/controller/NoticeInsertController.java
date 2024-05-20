package com.cosmetic.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.notice.service.INoticeService;
import com.cosmetic.admin.notice.service.NoticeServiceImpl;
import com.cosmetic.admin.notice.vo.NoticeVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.util.Const;

@MultipartConfig
@WebServlet("/noticeWrite.do")
public class NoticeInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/main/service/notice_write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");
		
		AccountVO accVO =(AccountVO)req.getSession(false).getAttribute("LOGIN_USER");
		long accNo = 0;
		if ( accVO!= null) {
			accNo =accVO.getAccNo(); 
		}
		
		NoticeVO noticeVO = NoticeVO.builder().noticeTitle(noticeTitle).noticeContent(noticeContent).accNo(accNo).build();
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		
		int result = service.insertNotice(noticeVO);
		
		if(result > 0)
			req.getSession(false).setAttribute("insert", Const.SUCCESS.getVal());
		else
			req.getSession(false).setAttribute("insert", Const.FAILURE.getVal());
		
		req.setAttribute("noticeVO", noticeVO);
		resp.sendRedirect(req.getContextPath() + "/notice.do");
		
	}
}
