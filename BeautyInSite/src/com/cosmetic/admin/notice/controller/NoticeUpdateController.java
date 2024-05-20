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
import com.cosmetic.util.Const;

@MultipartConfig
@WebServlet("/noticeUpdate.do")
public class NoticeUpdateController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String noticeNo = req.getParameter("noticeNo");
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVO = service.noticeDetail(noticeNo);

		req.setAttribute("noticeVO", noticeVO);

		req.getRequestDispatcher("/main/service/notice_update.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String noticeNo = req.getParameter("noticeNo");
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO noticeVO = NoticeVO.builder()
				.noticeNo(Long.parseLong(noticeNo))
				.noticeTitle(noticeTitle)
				.noticeContent(noticeContent)
				.build();
		
		int result = service.updateNotice(noticeVO);
		
		if(result > 0)
			req.getSession(false).setAttribute("update", Const.SUCCESS.getVal());
		else
			req.getSession(false).setAttribute("update", Const.FAILURE.getVal());
		 
		req.setAttribute("noticeVO", noticeVO);
		resp.sendRedirect(req.getContextPath() + "/notice.do");
	}

}
