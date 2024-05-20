package com.cosmetic.member.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;


@WebServlet("/orderCartSave.do")
public class OrderCartSaveController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  try {
	            // JSON 데이터를 읽어옴
	            BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()));
	            StringBuilder jsonStringBuilder = new StringBuilder();
	            String line;
	            while ((line = reader.readLine()) != null) {
	                jsonStringBuilder.append(line);
	            }

	            // JSON을 문자열로 변환
	            String jsonString = jsonStringBuilder.toString();

	            // JSON 문자열을 JsonObject로 파싱
	            Gson gson = new Gson();
	            JsonObject jsonObject = gson.fromJson(jsonString, JsonObject.class);

	            // "numList" 키에 해당하는 JsonArray를 가져옴
	            JsonArray numListArray = jsonObject.getAsJsonArray("numList");

	            // JsonArray를 List<Long>으로 변환
	            List<Long> numList = new ArrayList<>();
	            for (int i = 0; i < numListArray.size(); i++) {
	                numList.add(numListArray.get(i).getAsLong());
	            }
	            // 받아온 데이터를 세션에 저장
	            HttpSession session = req.getSession();
	            session.setAttribute("numList", numList);

	            resp.setStatus(HttpServletResponse.SC_OK);
	        } catch (Exception e) {
	            // 에러 핸들링
	            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            e.printStackTrace();
	        }
	}

}
