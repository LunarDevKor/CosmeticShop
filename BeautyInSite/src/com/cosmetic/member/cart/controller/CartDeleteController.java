package com.cosmetic.member.cart.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.cart.service.CartServiceImpl;
import com.cosmetic.member.cart.service.ICartService;
import com.cosmetic.util.Const;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/cartDelete.do")
public class CartDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prodNo = req.getParameter("PROD_NO");
		String accNo= req.getParameter("ACC_NO");
		
		ICartService service = CartServiceImpl.getInstance();
		
		int cnt = service.cartDelete(prodNo,accNo);
		
		resp.sendRedirect("cartList.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ICartService service = CartServiceImpl.getInstance();
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER"); 
		
		BufferedReader input = new BufferedReader(new InputStreamReader(req.getInputStream()));
        StringBuilder builder = new StringBuilder();
        String buffer;
        while ((buffer = input.readLine()) != null) {
            if (builder.length() > 0) {
                builder.append("\n");
            }
            builder.append(buffer);
        }
        
        ObjectMapper objMapper = new ObjectMapper();
        JsonNode jsonNode = objMapper.readTree(builder.toString());
        
        JsonNode values = jsonNode.get("values");
        
        int result = 0;
        
        if(values.isArray()) {
        	for(JsonNode value : values) {
        		result = service.cartDelete(value.asText(), String.valueOf(accVO.getAccNo()));
        		if(result < 0) break;
        	}
        }
        
        if(result > 0) {
        	resp.getWriter().write(Const.SUCCESS.getVal());
        }else {
        	resp.getWriter().write(Const.FAILURE.getVal());
        }
        
	}
}
