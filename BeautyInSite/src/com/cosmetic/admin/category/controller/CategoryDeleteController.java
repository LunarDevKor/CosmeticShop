package com.cosmetic.admin.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.category.service.CategoryServiceImpl;
import com.cosmetic.admin.category.service.ICategoryService;
import com.cosmetic.util.Const;

@WebServlet("/admin/categoryDelete.do")
public class CategoryDeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String commCode = req.getParameter("commCode");
		
		ICategoryService cateService = CategoryServiceImpl.getInstance();
		int result = 0;
		if(commCode != null) {
			result = cateService.categoryDelete(commCode);
		}
		
			resp.sendRedirect(req.getContextPath()+"/admin/category.do");
		
	}
}
