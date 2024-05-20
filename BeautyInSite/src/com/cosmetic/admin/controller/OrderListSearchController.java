package com.cosmetic.admin.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import jakarta.mail.internet.ParseException;

@WebServlet("/orderSerch.do")
public class OrderListSearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession(false).removeAttribute("cate");
		req.getSession(false).removeAttribute("search");


		IOrderService orderService = OrderServiceImpl.getInstance();
		String cate = req.getParameter("cate");
		String search = req.getParameter("search");
		
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("cate", cate);
		
		req.getSession(false).setAttribute("cate", cate);
		req.getSession(false).setAttribute("search", search);
		
		if(cate.equals("od_id")) { //select가 주문번호인경우
			searchMap.put("od_id", search);
			
		}else if(cate.equals("mb_id")) {  //select가 회원아이디인경우
			searchMap.put("mb_id", search);
			
		}else if(cate.equals("name")) {  //select가 회원이름인경우
			searchMap.put("name", search);

		}else { 
			System.out.println("안됌;");
		}
		
		if (search != null && !search.equals("")) { //검색어가 null이 아닌경우
			searchMap.put("search", search);
		}
		
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = orderService.searchCountList(searchMap); 

		int perPage = 2;
		
		int perList = 10;
		
		int totalPage =(int)Math.ceil((double)totalCount / (double)perList);
		
		int start = (currentPage - 1) * perList + 1;
		
		int end = start + perList - 1;
		if (end > totalCount)
			end = totalCount; 
				
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		
		/* Map<String, Object> countMap = new HashMap<String, Object>(); */
		searchMap.put("start", start);
		searchMap.put("end", end);

		List<Map<String, Object>> orderSerchList = orderService.listSearch(searchMap); 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		
		for (Map<String, Object> map : orderSerchList) {
			
			Timestamp ts = (Timestamp)map.get("ORD_DATE");
			
			String formattedDate = sdf.format(ts);
			map.put("ORD_DATE", formattedDate);
		}
		
		req.setAttribute("orderSerchList", orderSerchList);
		 
		/* req.getRequestDispatcher("/admin/orderlist2.jsp").forward(req, resp); */
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.getRequestDispatcher("/admin/orderlist2.jsp").forward(req, resp);
		
		
		

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
