package com.cosmetic.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.ChartService;
import com.cosmetic.admin.vo.ChartVO;

@WebServlet("/admin/index.do")
public class AdminMainController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ChartService cs = ChartService.getInstance();

		List<ChartVO> chartList = null;
		List<ChartVO> buyerList = null;

		String code = req.getParameter("code");
		
		System.out.println("CODE >> " + code);

		if (code != null && !code.equals("")) {

			switch (code) {
			case "daily":
				chartList = cs.getDailyCharts();
				break;
			case "month":
				chartList = cs.getMonthlyCharts();
				break;
			case "cate":
//				chartList = cs.monthSales();
				break;
			case "prod":
				break;
			case "buy":
				buyerList = cs.getMonthlyBuyer();
				break;
			}

		} else {
			chartList = cs.getDailyCharts();
		}
		
		if(chartList != null) {
			req.setAttribute("chartList", chartList);
			System.out.println(chartList);
		}
		else if(buyerList != null) {
			req.setAttribute("buyerList", buyerList);
			System.out.println("BUYER LIST >> " + buyerList);
		}
		
		req.setAttribute("code", code);

		req.getRequestDispatcher("/admin/chart.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
