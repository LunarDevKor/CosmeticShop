package com.cosmetic.main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.vo.GradeVO;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;

@WebServlet("/index.do")
public class MainController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "/main/index.jsp";

		if (req.getParameter("logout") != null)
			req.setAttribute("logout", req.getParameter("logout"));

		////////////////////////////////////////////////////////////////
		
		IProdService ps = ProdServiceImpl.getInstance();
		
		AccountVO accVO = (AccountVO) req.getSession().getAttribute("LOGIN_USER");
		GradeVO gradeVO = (GradeVO)req.getSession().getAttribute("GRADE_NO");
		
		long grdNo = 1;
		if(accVO !=null) {
			grdNo = accVO.getGrdNo();
		}

		
		List<Map<String, Object>> newList = ps.getNewProducts(grdNo);
		
		

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
		}

		///////////////////////////////////////////////////////////
		
		List<Map<String, Object>> bestList = ps.getBestProducts(grdNo);
		
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
		if (bestList != null){
			req.setAttribute("bestList", bestList);
		}

		req.getRequestDispatcher(url).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
