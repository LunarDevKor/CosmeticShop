package com.cosmetic.admin.management.controller;

import java.io.IOException;
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


@WebServlet("/listSearch.do")
public class ManageListSearchController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession(false).removeAttribute("cate");
		req.getSession(false).removeAttribute("search");
		req.getSession(false).removeAttribute("grdNo");
		
		IManagementService service = ManagementServiceImpl.getInstance();
		String cate = req.getParameter("cate");
		String search = req.getParameter("search");
		String grdNo = req.getParameter("grdNo");
		
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("cate", cate);
		searchMap.put("search", search);
		searchMap.put("grdNo", grdNo);
		
		req.getSession(false).setAttribute("cate", cate);
		req.getSession(false).setAttribute("search", search);
		req.getSession(false).setAttribute("grdNo", grdNo);
		
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		int totalCount = service.searchCountList(searchMap); 
		
				
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
		
		
//		AccountVO acVO = AccountVO.builder().build();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		if(cate.equals("id")) { 
			map.put("id", search);
		}else if(cate.equals("name")) {
			map.put("name", search);
		}else if(cate.equals("tel")) { 
			map.put("tel", search);
		}else if(cate.equals("tel")) { 
			map.put("tel", search);
		}else { 
			System.out.println("안됌;");
		}
		 if(grdNo != null && !grdNo.equals("0")) {
	            map.put("grdNo", grdNo);
	        }
		 
		List<Map<String, Object>> list = service.listSearch(map);
		
		req.setAttribute("list", list);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.getRequestDispatcher("/admin/manage2.jsp").forward(req, resp);
		
		
		
		}

}
