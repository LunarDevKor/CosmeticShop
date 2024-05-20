package com.cosmetic.admin.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IQNAService;
import com.cosmetic.admin.service.QNAServiceImpl;
import com.cosmetic.admin.vo.QNAVO;
@WebServlet("/qnaDetail.do")
public class QNADetailController extends HttpServlet{
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sbNo = req.getParameter("sbNo");
		
		IQNAService service = QNAServiceImpl.getInstance();
		
		Map<String,Object> detailMap = service.qnaDetail(sbNo);
		Map<String,Object> answerMap = service.getAnswer(sbNo);
		
		BufferedReader br;
		
		try {
			
			if(answerMap != null) {
				Clob answer =  (Clob) answerMap.get("SB_CONTENT");
				Reader reader = answer.getCharacterStream();
				br = new BufferedReader(reader);
				String tmp = br.lines().collect(Collectors.joining());
				
				answerMap.put("SB_CONTENT", tmp);
				
				req.setAttribute("answerMap", answerMap);
				
				System.out.println(answerMap);
			}
			
			Clob detail = (Clob) detailMap.get("SB_CONTENT");
			Reader reader = detail.getCharacterStream();
			br = new BufferedReader(reader);
			String content = br.lines().collect(Collectors.joining());
			
			detailMap.put("SB_CONTENT", content);
			
			System.out.println(detailMap);
			
			req.setAttribute("detailMap",detailMap);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/main/service/qna_detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	}
}
