package com.cosmetic.admin.management.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.management.service.IManagementService;
import com.cosmetic.admin.management.service.ManagementServiceImpl;
import com.cosmetic.product.vo.ProdVO;


@WebServlet("/brandDetailList.do")
public class BrandDetailListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IManagementService service = ManagementServiceImpl.getInstance(); 
		String brNo = req.getParameter("brNo");
		String brImg= req.getParameter("brImg");
		String brName= req.getParameter("brName");
		int totalCount = service.brandCount(brNo);
		
		List<ProdVO> list = service.brandDetailList(brNo);
		
		req.setAttribute("brName", brName);
		req.setAttribute("brandList", list);
		req.setAttribute("brImg", brImg);
		req.setAttribute("totalCount", totalCount);
		req.getRequestDispatcher("/shop/brandlist.jsp").forward(req, resp);
	}

}
