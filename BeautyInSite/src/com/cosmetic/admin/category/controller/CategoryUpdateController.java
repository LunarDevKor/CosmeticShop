package com.cosmetic.admin.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.cosmetic.admin.category.service.CategoryServiceImpl;
import com.cosmetic.admin.category.service.ICategoryService;
import com.cosmetic.admin.category.vo.CategoryVO;
import com.cosmetic.util.Const;

@WebServlet("/admin/categoryMod.do")
public class CategoryUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getParameter("parentCode") != null && req.getParameter("codeName") != null) {
			req.setAttribute("parentCode", req.getParameter("parentCode"));
			req.setAttribute("codeName", req.getParameter("codeName"));
			if(req.getParameter("commCode") != null && req.getParameter("commCodeName") != null) {
				req.setAttribute("commCode", req.getParameter("commCode"));
				req.setAttribute("commCodeName", req.getParameter("commCodeName"));
			}
		}
		
		req.getRequestDispatcher("/admin/category_mod.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String parentCode = (String) req.getParameter("parentCode");
		String codeName = (String) req.getParameter("codeName");
		String commCode = "";
		String commCodeName = "";
		
		CategoryVO cateVO = null;
		
		cateVO = CategoryVO.builder()
				.parentCode(parentCode)
				.codeName(codeName)
				.build();
		
		if(req.getParameter("commCode") != null && !req.getParameter("commCode").equals("")) {
			commCode = req.getParameter("commCode");
			commCodeName = req.getParameter("commCodeName");
			
			cateVO = CategoryVO.builder()
					.parentCode(parentCode)
					.codeName(codeName)
					.commCode(Integer.parseInt(commCode))
					.commCodeName(commCodeName)
					.build();
		}

		
		ICategoryService cateService = CategoryServiceImpl.getInstance();
		int result = cateService.categoryUpdate(cateVO);
		
		if(result > 0) 
			resp.getWriter().write(Const.SUCCESS.getVal());
		else
			resp.getWriter().write(Const.FAILURE.getVal());
		
	}
}
