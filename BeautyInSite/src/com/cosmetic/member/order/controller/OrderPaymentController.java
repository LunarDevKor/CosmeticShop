package com.cosmetic.member.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderPayment.do")
public class OrderPaymentController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String totalPrice = req.getParameter("tot_price");
		String usePoint = req.getParameter("use_point");
		String payType = req.getParameter("paymethod");
		String ordRecpname = req.getParameter("b_name");
		String ordRecptel = req.getParameter("b_phone");
		String addr1 = req.getParameter("b_addr1");
		String addr2 = req.getParameter("b_addr2");
		String ordRecpaddr = addr1 + addr2;
		String ordShipnotice = req.getParameter("memo");
		
		System.out.println(totalPrice);
		System.out.println(usePoint);
		System.out.println(payType);
	}
}
