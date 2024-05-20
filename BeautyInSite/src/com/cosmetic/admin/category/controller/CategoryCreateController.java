package com.cosmetic.admin.category.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.category.service.CategoryServiceImpl;
import com.cosmetic.admin.category.service.ICategoryService;
import com.cosmetic.admin.category.vo.CategoryVO;
import com.cosmetic.util.Const;

@WebServlet("/admin/category.do")
public class CategoryCreateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ICategoryService cateService = CategoryServiceImpl.getInstance();
		List<CategoryVO> cateList = cateService.getCategoryCodeList();
		
		Set<String> parentCodes = new TreeSet<>();
		Map<String,Integer> cateSize = new TreeMap<String,Integer>();
		
		for(CategoryVO cate : cateList) {
			String parentCode = cate.getParentCode();
			parentCodes.add(parentCode);
			
			if(cateSize.containsKey(parentCode)) {
				int count = cateSize.get(parentCode);
				cateSize.put(parentCode, count + 1);
			}else {
				cateSize.put(parentCode, 1);
			}
		}
		
		Map<String,String> cateInfo = new TreeMap<String,String>();
		
		for (String parentCode : parentCodes) {
		    for (CategoryVO cate : cateList) {
		        if (parentCode.equals(cate.getParentCode())) {
		            cateInfo.put(parentCode, cate.getCodeName());
		        }
		    }
		}
		
		req.setAttribute("cateList", cateList);
		req.setAttribute("cateInfo", cateInfo);
		req.setAttribute("cateSize", cateSize);
		req.getRequestDispatcher("/admin/category.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String codeName = req.getParameter("codeName");
		String parentCode = req.getParameter("parent");
		
		CategoryVO cateVO = CategoryVO.builder().codeName(codeName).parentCode(parentCode).build();
		
		ICategoryService cateService = CategoryServiceImpl.getInstance();
		int result = cateService.categoryCreate(cateVO);
		
		if(result > 0) 
			req.getSession(false).setAttribute("insert", Const.SUCCESS.getVal());
		else
			req.getSession(false).setAttribute("insert", Const.FAILURE.getVal());
		
		resp.sendRedirect(req.getContextPath()+"/admin/category.do");
		
	}
}
