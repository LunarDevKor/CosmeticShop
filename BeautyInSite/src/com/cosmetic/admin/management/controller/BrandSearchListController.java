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
import com.cosmetic.admin.vo.BrandVO;

@WebServlet("/brandSearchList.do")
public class BrandSearchListController extends  HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		
		IManagementService service = ManagementServiceImpl.getInstance();
		
		List<BrandVO> list = service.brandSearchList(search);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/shop/brandsearch.jsp").forward(req, resp);
	}

}
