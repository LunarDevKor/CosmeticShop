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
import javax.servlet.http.HttpSession;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;

@WebServlet("/prodSearch.do")
public class ProdSearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IProdService prodService = ProdServiceImpl.getInstance();
		String search = req.getParameter("search");
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = prodService.countList(search); //전체 글갯수
		System.out.println("totalCount __+++++" + totalCount);
		int perPage = 5;
				
		int perList = 12; 
			
		int totalPage =(int)Math.ceil((double)totalCount / (double)perList);
		
		int start = (currentPage - 1) * perList + 1;
				
		int end = start + perList - 1;
		if (end > totalCount)
			end = totalCount; 
				
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		Map<String, Object> map = new HashMap();
		
		map.put("start", start);
		map.put("end", end);
	 	
		
		
		
		HttpSession session = req.getSession();
		AccountVO accVO = (AccountVO)session.getAttribute("LOGIN_USER");
		String sort = req.getParameter("sort");
		String sortOdr = req.getParameter("sortodr");
		
		System.out.println("sort값은 ? " + sort);
		System.out.println("sortodr값은 ? " + sortOdr);
		
        int grdNo = accVO.getGrdNo();
		
		System.out.println("search 처음" + search);
		
		
		map.put("search", search);
		map.put("grdNo", grdNo);
		if(sort != null && sortOdr != null) {
		    map.put("sort", sort);
		    map.put("sortodr", sortOdr);
		}
		List<Map<String, Object>> list = prodService.prodSearch(map);
		System.out.println("map 값에 들어오나 sort" + map);
		Object GRD_ACCR = null;
		if (!list.isEmpty()) {
		    Map<String, Object> firstItem = list.get(0);
		    if (firstItem.containsKey("GRD_ACCR")) {
		    	GRD_ACCR = firstItem.get("GRD_ACCR");
		    }
		}
		System.out.println("listdasdfasfd" + list);
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("GRD_ACCR", GRD_ACCR);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.getRequestDispatcher( "/shop/search.jsp").forward(req, resp);

//		resp.sendRedirect(req.getContextPath() + "/shop/search.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
	