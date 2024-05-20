package com.cosmetic.member.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IOrderService;
import com.cosmetic.admin.service.OrderServiceImpl;
import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.member.account.vo.AccountVO;

@WebServlet("/orderhistory.do")
public class OrderHistoryController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IOrderService orderService = OrderServiceImpl.getInstance();
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		List<OrderVO> orderList = orderService.getMyHistory(accVO.getAccNo());
		
		req.setAttribute("orderList", orderList);
		
		req.getRequestDispatcher("/main/order/orderhistory.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
