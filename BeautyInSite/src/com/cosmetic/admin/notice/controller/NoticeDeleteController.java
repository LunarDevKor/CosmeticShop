package com.cosmetic.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.notice.service.INoticeService;
import com.cosmetic.admin.notice.service.NoticeServiceImpl;
import com.cosmetic.util.Const;

@WebServlet("/noticeDelete.do")
public class NoticeDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String noticeNo = req.getParameter("noticeNo");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int result = service.deleteNotice(noticeNo);
		
		if(result > 0)
			req.getSession(false).setAttribute("delete", Const.SUCCESS.getVal());
		else
			req.getSession(false).setAttribute("delete", Const.FAILURE.getVal());
		
		resp.sendRedirect(req.getContextPath() + "/notice.do");
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
