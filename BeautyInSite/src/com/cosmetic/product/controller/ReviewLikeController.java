package com.cosmetic.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.product.service.IReviewService;
import com.cosmetic.product.service.ReviewServiceImpl;
import com.cosmetic.util.Const;

@WebServlet("/likeIt.do")
public class ReviewLikeController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String rvNo = req.getParameter("rvNo");
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		Map<String, Object> map = new HashMap<>();
		map.put("rvNo", rvNo);
		map.put("accNo", accVO.getAccNo());
		
		IReviewService rs = ReviewServiceImpl.getInstance();
		int result = rs.isLikeItByUser(map);
		
		if(result <= 0) {
			rs.insertLikeIt(map);
			resp.getWriter().write(Const.SUCCESS.getVal());
		}else {
			rs.deleteLikeIt(map);
			resp.getWriter().write(Const.FAILURE.getVal());
		}
		
	}
}
