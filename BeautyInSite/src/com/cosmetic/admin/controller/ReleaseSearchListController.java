package com.cosmetic.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.cosmetic.admin.service.IOrderService;
import com.cosmetic.admin.service.OrderServiceImpl;
import com.cosmetic.admin.vo.OutProductVO;


@WebServlet("/admin/releaseSerch.do")
public class ReleaseSearchListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		IOrderService service = OrderServiceImpl.getInstance();
		
		
		OutProductVO ov= service.releaseSearch(search);
		
		System.out.println("ov" + ov);
		
		req.setAttribute("ov", ov);
		req.getRequestDispatcher("/admin/releasesearch.jsp").forward(req, resp);
	}
}
