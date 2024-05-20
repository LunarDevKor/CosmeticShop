package com.cosmetic.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;
import com.cosmetic.product.vo.ProdVO;

@MultipartConfig
@WebServlet("/AllProdList.do")
public class AllProdListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 정렬값을 넣어준 상품리스트가져오기
		IProdService ps = ProdServiceImpl.getInstance();

//		List<ProdVO> list = ps.getAllProducts();

		//
//		req.setAttribute("prodList", list);

		req.getRequestDispatcher("/shop/list.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
