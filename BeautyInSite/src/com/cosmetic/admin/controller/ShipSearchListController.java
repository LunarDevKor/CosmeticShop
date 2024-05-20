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

@WebServlet("/shipSearch.do")
public class ShipSearchListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession(false).removeAttribute("cate");
		req.getSession(false).removeAttribute("search");

		IShipService shipService = ShipServiceImpl.getInstance();
		String cate = req.getParameter("cate");
		String search = req.getParameter("search");

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("cate", cate);

		req.getSession(false).setAttribute("cate", cate);
		req.getSession(false).setAttribute("search", search);

		if (cate.equals("od_id")) { // select가 주문번호인경우
			searchMap.put("od_id", search);

		} else if (cate.equals("b_name")) { // select가 수령자
			searchMap.put("b_name", search);

		} else if (cate.equals("phone")) { // select가 전화번호
			searchMap.put("phone", search);

		} else if (cate.equals("delivery")) { // select가 송장번호
			searchMap.put("delivery", search);

		} else {
			System.out.println("안됌;");
		}

		if (search != null && !search.equals("")) { // 검색어가 null이 아닌경우
			searchMap.put("search", search);
		}

		int currentPage = 1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = shipService.searchCountList(searchMap);
		

		int perPage = 2;

		int perList = 10;

		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);

		int start = (currentPage - 1) * perList + 1;

		int end = start + perList - 1;
		if (end > totalCount)
			end = totalCount;

		int startPage = ((currentPage - 1) / perPage * perPage) + 1;

		int endPage = startPage + perPage - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		/* Map<String, Object> countMap = new HashMap<String, Object>(); */
		searchMap.put("start", start);
		searchMap.put("end", end);

		

		List<Map<String, Object>> shipSerchList = shipService.listSearch(searchMap);
		req.setAttribute("shipSerchList", shipSerchList);

		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
		
		for (Map<String, Object> map : shipSerchList) {
			Timestamp ts = (Timestamp) map.get("SHIP_STDATE");
			Timestamp ts2 = (Timestamp) map.get("SHIP_CPDATE");
			
			String formattedDate = sdf.format(ts);
			String formattedDate2 = sdf.format(ts2);
			map.put("SHIP_STDATE", formattedDate);
			map.put("SHIP_CPDATE", formattedDate2);
			
		}
		
		req.getRequestDispatcher("/admin/shipdetail2.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
