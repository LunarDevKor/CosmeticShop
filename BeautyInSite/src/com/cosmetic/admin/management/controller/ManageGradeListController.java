package com.cosmetic.admin.management.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.management.service.IManagementService;
import com.cosmetic.admin.management.service.ManagementServiceImpl;
import com.cosmetic.admin.vo.GradeVO;
@MultipartConfig
@WebServlet("/gradeList.do")
public class ManageGradeListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 IManagementService service = ManagementServiceImpl.getInstance();
	     
	     List<GradeVO> list = service.gradeList();
	     
	   
	     
	     req.setAttribute("list",list);
	     
	     req.getRequestDispatcher("/admin/grade.jsp").forward(req, resp);
	}
    
     
     
     
     
	

}
