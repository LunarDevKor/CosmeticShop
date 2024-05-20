package com.cosmetic.member.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;
import com.cosmetic.product.vo.ProdVO;

@WebServlet("/orderProd.do")
public class OrderProdController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		IProdService prodService = ProdServiceImpl.getInstance();
		
		AccountVO accVO = (AccountVO) session.getAttribute("LOGIN_USER");
		
		Map<String, Object> map = new HashMap<>();
		List<ProdVO> prodList = new ArrayList<>();
		
		map.put("grdNo", accVO.getGrdNo());
		map.put("accNo", accVO.getAccNo());
		
		List<Long> numList = (List<Long>)session.getAttribute("numList");
		
		if (numList == null || numList.isEmpty()) {
			
			String prodNo = req.getParameter("prodNo");
			String qty = req.getParameter("qty");

			map.put("prodNo", prodNo);

			prodList = prodService.getProdDetailByOrder(map);

			req.setAttribute("prodList", prodList);
			req.setAttribute("qty", qty);

		}else {
			
			map.put("numList", numList);
			req.getSession(false).removeAttribute("numList");
			
			prodList = prodService.getProdDetailByOrder(map);
			
//			System.out.println("PRODLIST >> " +prodList);
			req.setAttribute("prodList", prodList);
			
		}
		
		req.getRequestDispatcher("/main/order/orderform.jsp").forward(req, resp);
	}
}
