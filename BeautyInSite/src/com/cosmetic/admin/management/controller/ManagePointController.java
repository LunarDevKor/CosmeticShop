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

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.point.service.IPointService;
import com.cosmetic.member.point.service.PointServiceImpl;

@WebServlet("/pointManage.do")
public class ManagePointController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			IPointService service = PointServiceImpl.getInstance();
			
	     	List<AccountVO> list = service.pointManage();
	     	
	     	
	     	System.out.println("ponintlist" + list.size());
	     	
	     	req.setAttribute("list",list);
	     	
	     	req.getRequestDispatcher("/admin/point_grant.jsp").forward(req, resp);
	     	
		
	}
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     String grdNoEnd = req.getParameter("grdNoEnd");
	     String grdNoSt = req.getParameter("grdNoSt");
	     String pointCon = req.getParameter("pointCon");
	     String pointQty = req.getParameter("pointQty");
	     
	     IPointService service = PointServiceImpl.getInstance();
	     Map<String, Object> map = new HashMap();
	     map.put("grdNoEnd", grdNoEnd);
	     map.put("grdNoSt", grdNoSt);
	     map.put("pointCon", pointCon);
	     map.put("pointQty", pointQty);

	     
	     System.out.println("map값은" + map);
	     
	     int cnt = service.updatePoint(map);
	     System.out.println("다하고온 cnt값은 ? " + cnt);
	     
	     resp.sendRedirect("manageList.do");
	     
	
	}


}
