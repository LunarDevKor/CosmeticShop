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

import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;

@MultipartConfig
@WebServlet("/newList.do")
public class ShowNewProdController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IProdService ps = ProdServiceImpl.getInstance();
		List<Map<String, Object>> newList = ps.getNewProducts();

		for (int i = 0; i < newList.size(); i++) {

			if (newList.get(i).get("PROD_IMG") != null) {

				try {
					Clob clob = (Clob) newList.get(i).get("PROD_IMG");
					Reader reader;
					reader = clob.getCharacterStream();
					BufferedReader br = new BufferedReader(reader);
					String result = br.lines().collect(Collectors.joining());
					
					newList.get(i).put("PROD_IMG", result);
				
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}

		if (newList != null)

		{
			req.setAttribute("newList", newList);
			req.getRequestDispatcher("shop/newlist.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
