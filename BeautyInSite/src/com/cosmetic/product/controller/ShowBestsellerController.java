package com.cosmetic.product.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;

@MultipartConfig
@WebServlet("/bestList.do")
public class ShowBestsellerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IProdService ps = ProdServiceImpl.getInstance();
		List<Map<String, Object>> bestList = ps.getBestProducts();
		
		for (int i = 0; i < bestList.size(); i++) {

			if (bestList.get(i).get("PROD_IMG") != null) {

				try {
					Clob clob = (Clob) bestList.get(i).get("PROD_IMG");
					Reader reader;
					reader = clob.getCharacterStream();
					BufferedReader br = new BufferedReader(reader);
					String result = br.lines().collect(Collectors.joining());
					
					bestList.get(i).put("PROD_IMG", result);
				
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}

		if (bestList != null)

		{
			req.setAttribute("bestList", bestList);
			req.getRequestDispatcher("shop/bestlist.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
