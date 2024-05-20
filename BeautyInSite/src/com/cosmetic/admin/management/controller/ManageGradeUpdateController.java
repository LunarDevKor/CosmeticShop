package com.cosmetic.admin.management.controller;

import java.io.IOException;
import java.util.Arrays;

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
@WebServlet("/gradeUpdate.do")
public class ManageGradeUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
	    String[] grdNames = req.getParameterValues("grdName");
	    String[] grdNos = req.getParameterValues("grdNo");
	    String[] grdAccrs = req.getParameterValues("grdAccr");
	    String[] grdPrices = req.getParameterValues("grdPrice");

	    IManagementService service = ManagementServiceImpl.getInstance();

	    for (int i = 0; i < grdNames.length; i++) {
	        String grdName = grdNames[i];
	        String grdNo = grdNos[i];
	        String grdAccr = grdAccrs[i];
	        String grdPrice = grdPrices[i];

	        System.out.println("1123" + grdAccr);
	        System.out.println("grdName값 " + grdName);

	        GradeVO gdv = GradeVO.builder().
	            grdNo(Long.parseLong(grdNo)).
	            grdName(grdName).
	            grdAccr(Long.parseLong(grdAccr)).
	            grdPrice(Long.parseLong(grdPrice)).
	            build();

	        int cnt = service.gradeUpdate(gdv);
	        System.out.println("cnt값나오냐?" + cnt);
	    }

	    resp.sendRedirect("gradeList.do");
	}
}