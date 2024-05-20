package com.cosmetic.member.account.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.util.Const;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/kakaoLogin.do")
public class LoginKakaoController extends HttpServlet {

	private static final String KAKAO_API_URL = "https://kapi.kakao.com/v2/user/me";
	private static final String REDIRECT_URI = "http://localhost:8888kakaoLogin.do";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		String accessToken = getAccessToken(code);
		Map<String,Object> userInfo = getUserInfo(accessToken);
		
		long id = userInfo.get("id") == null ? 0 : (long) userInfo.get("id");
		
		if(id != 0) {
			IMemberService memService = MemberServiceImpl.getInstance();
			int result = memService.getKakaoId(id);
			
			if(result > 0) {
				//있음
				int accNo = result;
				
				AccountVO accVO = memService.getMemberByKakaoId(accNo);
				
				req.getSession().setAttribute("LOGIN_USER", accVO);
				
				resp.sendRedirect(req.getContextPath()+"/index.do");
				
			}else {
				//없음
				result = -1; // 카카오 로그인 URL 핸들링
				req.getSession().setAttribute("result", result);
				req.getSession().setAttribute("kakaoProfile", userInfo);
				
				resp.sendRedirect(req.getContextPath()+"/login.do");
			}
		}
	}

	private Map<String, Object> getUserInfo(String accessToken) {
		
		Map<String,Object> kakaoUserInfo = null;
		
		try {
			URL url = new URL(KAKAO_API_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int respCode = conn.getResponseCode();
			System.out.println("RESPONSE CODE : " + respCode);

			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			StringBuilder result = new StringBuilder();
			while ((line = in.readLine()) != null) {
				result.append(line);
			}

			JsonElement el = new JsonParser().parse(result.toString());
			JsonObject account = el.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			/*
			  	id				Long			회원번호
				properties		JSON			사용자 프로퍼티(Property)
				kakao_account	KakaoAccount	카카오계정 정보
				
				JsonObject properties = el.getAsJsonObject().get("properties").getAsJsonObject();
			 */
			
			long id = el.getAsJsonObject().get("id").getAsLong();
			String name = account.get("name").getAsString();
			String email = account.get("email").getAsString();
			String birth = account.get("birthyear").getAsString().substring(2,4) + account.get("birthday").getAsString().replace("-", "");
			String gender = account.get("gender").getAsString();
			String phone = account.get("phone_number").getAsString().replace("+82", "0").replace("-", "").replaceAll("\\s+", "");
			
			kakaoUserInfo = new HashMap<>();
			kakaoUserInfo.put("id",id);
			kakaoUserInfo.put("name",name);
			kakaoUserInfo.put("email",email);
			kakaoUserInfo.put("birth",birth);
			kakaoUserInfo.put("gender",gender);
			kakaoUserInfo.put("phone",phone);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return kakaoUserInfo;
	}

	public static String getAccessToken(String code) throws IOException {
		String apiUrl = "https://kauth.kakao.com/oauth/token?" + "grant_type=authorization_code" + "&client_id="
				+ Const.KAKAO_CLIENT_ID.getVal() + "&redirect_uri=" + REDIRECT_URI + "&code=" + code;

		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);

		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

		writer.write(apiUrl);
		writer.flush();
	
		int responseCode = conn.getResponseCode();
		
		BufferedReader br = (responseCode == 200) ? 
				new BufferedReader(new InputStreamReader(conn.getInputStream())) :
				new BufferedReader(new InputStreamReader(conn.getErrorStream()));

		String line = "";
		StringBuilder result = new StringBuilder();
		while ((line = br.readLine()) != null) {
			result.append(line);
		}

		JsonElement el = new JsonParser().parse(result.toString());

		String accessToken = el.getAsJsonObject().get("access_token").getAsString();
//		String refreshToken = el.getAsJsonObject().get("refresh_token").getAsString();

		writer.close();
		br.close();

		return accessToken;
	}
	
	

}
