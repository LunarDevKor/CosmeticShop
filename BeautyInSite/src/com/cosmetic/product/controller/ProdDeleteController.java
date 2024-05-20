package com.cosmetic.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.cosmetic.product.dao.IProdDao;
import com.cosmetic.product.dao.ProdDaoImpl;
import com.cosmetic.product.service.IProdService;
import com.cosmetic.product.service.ProdServiceImpl;
import com.cosmetic.product.vo.ProdVO;

/**
 * Servlet implementation class ProdDeleteController
 */
@MultipartConfig
@WebServlet("/prodDelete.do")
public class ProdDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdDeleteController() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] delchk = req.getParameterValues("delchk");
		// String prodNo = req.getParameter("prodNo");
		IProdService prodService = ProdServiceImpl.getInstance();

		ProdVO pv = null;
		int cnt = 0;

		if (delchk != null && delchk.length > 0) {
			for (String prodNo : delchk) {
				// 각 체크박스값에 대한 처리
				pv = ProdVO.builder().prodNo(Long.parseLong(prodNo)).build();
				System.out.println(pv);
				cnt = prodService.removeProduct(pv);
			}
		}

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		// req.getParameterValues("key")
		// String[1,2,3]
		// 컨트롤러 & 마이바티스 for문

		// sql(delete prod_no = ex(1))
		// sql(delete prod_no = ex(2))
		// sql(delete prod_no = ex(3))

		req.getSession().setAttribute(msg, msg);
		// 목록화면으로 리다이렉트 처리
		resp.sendRedirect(req.getContextPath() + "/prodList.do");

	}

}
