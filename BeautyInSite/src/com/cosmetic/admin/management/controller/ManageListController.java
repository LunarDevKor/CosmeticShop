package com.cosmetic.admin.management.controller;

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

import com.cosmetic.admin.management.service.IManagementService;
import com.cosmetic.admin.management.service.ManagementServiceImpl;

@WebServlet("/manageList.do")
public class ManageListController extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IManagementService service = ManagementServiceImpl.getInstance();
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = service.countList(); //전체 글갯수
				
		int perPage = 5;
				
		int perList = 10; 
			
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
	 	
		List<Map<String, Object>> list = service.manageList(countMap);
		
		req.setAttribute("list", list);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		
		System.out.println("list임니다"+ list);
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");

		   
		    for (Map<String, Object> map : list) {
		        
		        Timestamp ts = (Timestamp) map.get("REG_DATE");

		        // 문자열로 변환하고 다시 map에 넣어줍니다.
		        String formattedDate = sdf.format(ts);
		        map.put("REG_DATE", formattedDate);
		    }
		
		req.getRequestDispatcher("/admin/manage.jsp").forward(req, resp);
	}
	
}
