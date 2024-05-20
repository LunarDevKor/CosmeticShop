package com.cosmetic.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cosmetic.product.dao.ProdDaoImpl;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;
import com.cosmetic.product.vo.ProdVO;

@WebServlet("/prodList.do")
@MultipartConfig
public class ProdListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IProdService ps = ProdServiceImpl.getInstance();

		int currentPage = 1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = ps.countList(); // 전체 글갯수

		int perPage = 5;

		int perList = 30;

		int totalPage = (int) Math.ceil((double) totalCount / (double) perList);
		System.out.println(">>>" + totalPage);

		int start = (currentPage - 1) * perList + 1;

		int end = start + perList - 1;
		if (end > totalCount)
			end = totalCount;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("start", start);
		countMap.put("end", end);

		List<Map<String, Object>> prodList = ps.getAllProducts(countMap);

		req.setAttribute("prodList", prodList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);

		req.setAttribute("totalCount", totalCount);

		System.out.println("prodList<<" + prodList);

		req.getRequestDispatcher("/admin/goodsList.jsp").forward(req, resp);

	}

	// 상품 전체 정보 데이터에서 얻어옴

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
