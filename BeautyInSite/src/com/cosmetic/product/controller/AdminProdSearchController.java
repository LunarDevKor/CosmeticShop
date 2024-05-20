package com.cosmetic.product.controller;

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
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;

@WebServlet("/prodSearchaAdmin.do")
public class AdminProdSearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession(false).removeAttribute("cate");
		req.getSession(false).removeAttribute("search");

		IProdService prodService = ProdServiceImpl.getInstance();
		String cate = req.getParameter("cate");
		String search = req.getParameter("search");

		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap.put("cate", cate);

		if (cate.equals("PROD_NAME")) {
			searchMap.put("PROD_NAME", search);
		} else if (cate.equals("BR_NO")) {
			searchMap.put("BR_NO", search);
		} else if (cate.equals("PROD_CATE_NO")) {
			searchMap.put("PROD_CATE_NO", search);
		} else {
			System.out.println("doesn't work.");
		}
		if (search != null && !search.equals("")) {
			searchMap.put("search", search);
		}

//		int currentPage = 1;
//		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
//		int totalCount = prodService.searchCountList(searchMap);
//
//		int perPage = 2;
//
//		int perList = 10;
//
//		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);
//
//		int start = (currentPage - 1) * perList + 1;
//
//		int end = start + perList - 1;
//		if (end > totalCount)
//			end = totalCount;
//
//		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
//
//		int endPage = startPage + perPage - 1;
//		if (endPage > totalPage)
//			endPage = totalPage;
//
//		searchMap.put("start", start);
//		searchMap.put("end", end);

		List<Map<String, Object>> prodSearchList = prodService.prodAdminListSearch(searchMap);

		System.out.println(searchMap);

		req.setAttribute("prodSearchList", prodSearchList);

		/* req.getRequestDispatcher("/admin/orderlist2.jsp").forward(req, resp); */
//		req.setAttribute("sPage", startPage);
//		req.setAttribute("ePage", endPage);
//		req.setAttribute("cPage", currentPage);
//		req.setAttribute("ttPage", totalPage);
//		req.setAttribute("totalCount", totalCount);
		req.getRequestDispatcher("/admin/goodsList.jsp").forward(req, resp);

	}
}
