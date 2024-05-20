package com.cosmetic.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IOrderService;
import com.cosmetic.admin.service.OrderServiceImpl;
import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.OutProductVO;

@WebServlet("/admin/releaseList.do")
public class ReleaseInsertController extends HttpServlet{
	
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 IOrderService service = OrderServiceImpl.getInstance();
		 
		 service.releaseList();
		 int currentPage =1;
			currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
			int totalCount = service.releaseCountList(); //전체 글갯수
					
			int perPage = 5;
					
			int perList = 2; 
				
			int totalPage =(int)Math.ceil((double)totalCount / (double)perList);
			
			int start = (currentPage - 1) * perList + 1;
					
			int end = start + perList - 1;
			if (end > totalCount)
				end = totalCount; 
					
			int startPage = ((currentPage - 1) / perPage * perPage) + 1;
			
			int endPage = startPage + perPage -1;
			if(endPage > totalPage) endPage = totalPage;
			Map<String, Object> countMap = new HashMap<String, Object>();
			countMap.put("start", start);
			countMap.put("end", end);
		 
		 
		 List<Map<String, Object>> list = service.releaseListAll(countMap); 
		 req.setAttribute("list", list);
		 req.setAttribute("totalCount", totalCount);
		 System.out.println("list 오모모모" + list);
		 req.setAttribute("sPage", startPage);
			req.setAttribute("ePage", endPage);
			req.setAttribute("cPage", currentPage);
			req.setAttribute("ttPage", totalPage);
		 req.getRequestDispatcher("/admin/release.jsp").forward(req, resp);
		 
		 
	}
	
}
