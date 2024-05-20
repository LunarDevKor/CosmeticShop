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

@WebServlet("/cateList.do")
public class ProdCateListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IProdService service = ProdServiceImpl.getInstance();
		Map<String, Object> map = new HashMap();
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
		String cate = req.getParameter("cate");
		String sort = req.getParameter("sort");
		String sortOdr = req.getParameter("sortOdr");
		
		HttpSession session = req.getSession();
		AccountVO accVO = (AccountVO)session.getAttribute("LOGIN_USER");
		 int grdNo = accVO.getGrdNo();
		map.put("cate" ,cate);
		map.put("grdNo", grdNo);
//		String[] arr = {"A01","A02","A03","A04","A05","A06","A07","A08"};
//		
//		for(String tmp : arr) {
//			if(tmp.contains(lCate)) {
//				break;
//			}
//		}
//		
		int totalCount =service.cateCountList(map); //전체 글갯수
		
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
		
		
		map.put("start", start);
		map.put("end", end);
		map.put("cate", cate);
		map.put("sort", sort);
		map.put("sortOdr", sortOdr);
		
		
		List<Map<String, Object>> list = service.cateList(map);
		Object GRD_ACCR = null;
		if (!list.isEmpty()) {
		    Map<String, Object> firstItem = list.get(0);
		    if (firstItem.containsKey("GRD_ACCR")) {
		    	GRD_ACCR = firstItem.get("GRD_ACCR");
		    }
		}
		req.setAttribute("GRD_ACCR", GRD_ACCR);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("cPage", currentPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("list", list);
		req.setAttribute("cate", cate );
		req.getRequestDispatcher("/shop/catelist.jsp").forward(req, resp);
		
	}

}
