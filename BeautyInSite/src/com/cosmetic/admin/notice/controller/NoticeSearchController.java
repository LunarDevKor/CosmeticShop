package com.cosmetic.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.notice.service.INoticeService;
import com.cosmetic.admin.notice.service.NoticeServiceImpl;
import com.cosmetic.admin.notice.vo.NoticeVO;

@WebServlet("/noticeSearch.do")
public class NoticeSearchController extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String cate= req.getParameter("cate");
			String search = req.getParameter("search");
		    
			
		    INoticeService service = NoticeServiceImpl.getInstance();
		    NoticeVO noticeVO = NoticeVO.builder().build();
			
		    if(cate.equals("noticeTitle")) { 
		    	noticeVO.setNoticeTitle(search);
		    }else if(cate.equals("noticeContent")){
		        noticeVO.setNoticeContent(search);
		    }
		    
		    List<NoticeVO> list = service.searchNotice(noticeVO);
		    System.out.println("liqqqqq	qst23232" + list);
			
			req.setAttribute("list", list);
			req.getRequestDispatcher("/main/service/notice_list.jsp").forward(req, resp);
				
		}
	

}
