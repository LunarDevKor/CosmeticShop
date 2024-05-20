package com.cosmetic.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.notice.service.INoticeService;
import com.cosmetic.admin.notice.service.NoticeServiceImpl;
import com.cosmetic.admin.notice.vo.NoticeVO;

@WebServlet("/noticeDetail.do")
public class NoticeDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   String noticeNo = req.getParameter("noticeNo");
	  
	   INoticeService service = NoticeServiceImpl.getInstance();
	   
	   NoticeVO noticeVO = service.noticeDetail(noticeNo);
	   
	   req.setAttribute("noticeVO", noticeVO);
	   
	   req.getRequestDispatcher("/main/service/notice_detail.jsp").forward(req, resp);
	   
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
