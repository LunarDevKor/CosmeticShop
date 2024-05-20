package com.cosmetic.admin.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IShipService;
import com.cosmetic.admin.service.ShipServiceImpl;



@WebServlet("/admin/shipdetail.do")
public class ShipListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IShipService shipService = ShipServiceImpl.getInstance();
		
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = shipService.countList(); //전체 글갯수
		
		int perPage = 5;
		
		int perList = 10; 
		
		int totalPage =(int)Math.ceil((double)totalCount / (double)perList);
		System.out.println(">>>" + totalPage);
		
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

		
		List<Map<String, Object>> shipList = shipService.displayAllShip(countMap);
		
		req.setAttribute("shipList", shipList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);

		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		
		for (Map<String, Object> map : shipList) {
			Timestamp ts = (Timestamp) map.get("SHIP_STDATE");
			Timestamp ts2 = (Timestamp) map.get("SHIP_CPDATE");
			
			String formattedDate = sdf.format(ts);
			String formattedDate2 = sdf.format(ts2);
			map.put("SHIP_STDATE", formattedDate);
			map.put("SHIP_CPDATE", formattedDate2);
			
		}
		
		
		 
		 req.getRequestDispatcher("/admin/shipdetail.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
