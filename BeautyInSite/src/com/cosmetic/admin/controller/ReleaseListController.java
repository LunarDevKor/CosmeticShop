//package com.cosmetic.admin.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.cosmetic.admin.service.IOrderService;
//import com.cosmetic.admin.service.OrderServiceImpl;
//import com.cosmetic.admin.vo.OutProductVO;
//
//@WebServlet("/admin/releaseList1.do")
//public class ReleaseListController extends HttpServlet{
//	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		IOrderService service = OrderServiceImpl.getInstance();
//		
//		List<OutProductVO> list = service.releaseListAll(); 
//		System.out.println("list 값은물" + list);
//		req.setAttribute("list", list);
//		req.getRequestDispatcher("/admin/release.jsp").forward(req, resp);
//	}
//
//}
