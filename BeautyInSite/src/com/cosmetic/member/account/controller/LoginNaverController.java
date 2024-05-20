package com.cosmetic.member.account.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.util.Const;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/naverLogin.do")
public class LoginNaverController extends HttpServlet{
	
	private static final String REDIRECT_URI = "https://localhost:8888main.do";
    private static final String TOKEN_ENDPOINT = "https://nid.naver.com/oauth2.0/token";
    private static final String PROFILE_ENDPOINT = "https://openapi.naver.com/v1/nid/me";
    private static final boolean DEV_FLAG = true;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 상수를 정의해둔 Const Enum 클래스에서 값을 가져옴
            String clientId = Const.NAVER_CLIENT_ID.getVal();
            String clientSecret = Const.NAVER_CLIENT_SECRET.getVal();

            // 네이버 로그인 폼에서 로그인이 성공하면 상태값과 code를 가져옴
            String code = req.getParameter("code");
            String state = req.getParameter("state");
            
            // 얻어온 정보들을 통해 네이버 프로필값을 반환
            Map<String,Object> naverInfo = getNaverInfo(clientId, clientSecret, code, state);
            
            // 액세스 토큰값 확인 및 프로필 데이터를 JSON 데이터로 변환
            String accessToken = (String) naverInfo.get("accessToken");
            JsonObject profile = (JsonObject)  naverInfo.get("profile");
            
            if (accessToken != null && profile != null) {
            	
            	// JSON 데이터를 파싱하여 값을 JAVA 데이터 형식으로 변환 
            	String id = profile.get("id").getAsString();
            	String email = profile.get("email").getAsString();
            	String name = profile.get("name").getAsString();
            	String birth = profile.get("birthyear").getAsString() 
            			+ profile.get("birthday").getAsString()
            			.replace("-", "");
            	birth = birth.substring(2,birth.length());
            	String phone = profile.get("mobile").getAsString().replace("-", "");
            	String gender = profile.get("gender").getAsString();
            	
            	// 해당 데이터를 맵에 저장 후 포워딩을 통해 전송
            	Map<String,String> profileMap = new HashMap<>();
            	profileMap.put("id", id);
            	profileMap.put("email", email);
            	profileMap.put("name", name);
            	profileMap.put("birth", birth);
            	profileMap.put("phone", phone);
            	profileMap.put("gender", gender);
            	
            	req.setAttribute("naver", profileMap);
            	req.getRequestDispatcher("/naverLoginProcess.do").forward(req, resp);
            		
            }

        } catch (IOException e) {
            System.out.println("Error handling OAuth callback: " + e.getMessage());
        }
        
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	private Map<String,Object> getNaverInfo(String clientId, String clientSecret, String code, String state) throws IOException {
        String redirectURI = URLEncoder.encode(REDIRECT_URI, "UTF-8");
        String apiURL = TOKEN_ENDPOINT + "?grant_type=authorization_code" +
                "&client_id=" + clientId +
                "&client_secret=" + clientSecret +
                "&redirect_uri=" + redirectURI +
                "&code=" + code +
                "&state=" + state;

        String accessToken = "";
        String refreshToken = "";
        Map<String,Object> naverInfo = null;

        try {
            URL url = new URL(apiURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();
            BufferedReader br = (responseCode == 200) ?
                    new BufferedReader(new InputStreamReader(conn.getInputStream())) :
                    new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                    
            String inputLine;
            StringBuilder res = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();

            if (responseCode == 200) {
                JsonObject jsonObj = new JsonParser().parse(res.toString()).getAsJsonObject();
                accessToken = jsonObj.get("access_token").getAsString();
                refreshToken = jsonObj.get("refresh_token").getAsString();
                
                naverInfo = new HashMap<>();
                                
                JsonObject jObj = getAndHandleUserProfile(accessToken);
                naverInfo.put("accessToken", accessToken);
                naverInfo.put("refreshToken", refreshToken);
                naverInfo.put("profile", jObj);
            }

        } catch (Exception e) {
            System.out.println("Error getting access token: " + e.getMessage());
        }

        return naverInfo;
    }

    private BufferedReader getBufferedReader(HttpURLConnection con, int responseCode) throws IOException {
        return (responseCode == 200) ?
                new BufferedReader(new InputStreamReader(con.getInputStream())) :
                new BufferedReader(new InputStreamReader(con.getErrorStream()));
    }

    private JsonObject getAndHandleUserProfile(String accessToken) throws IOException {
        HttpURLConnection profileCon = (HttpURLConnection) new URL(PROFILE_ENDPOINT).openConnection();
        profileCon.setRequestProperty("Authorization", "Bearer " + accessToken);

        int profileResponseCode = profileCon.getResponseCode();
        BufferedReader profileBr = getBufferedReader(profileCon, profileResponseCode);

        String profileInputLine;
        StringBuffer profileRes = new StringBuffer();

        while ((profileInputLine = profileBr.readLine()) != null) {
            profileRes.append(profileInputLine);
        }
        profileBr.close();

        JsonObject jObj = null;
        if (profileResponseCode == 200) {
            jObj = new JsonParser()
            		.parse(profileRes.toString())
            		.getAsJsonObject()
            		.getAsJsonObject("response");
        }
        
        return jObj;
    }
}
