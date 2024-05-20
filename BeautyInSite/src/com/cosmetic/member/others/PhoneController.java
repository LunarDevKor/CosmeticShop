package com.cosmetic.member.others;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.util.Const;
import com.vonage.client.VonageClient;
import com.vonage.client.sms.MessageStatus;
import com.vonage.client.sms.SmsSubmissionResponse;
import com.vonage.client.sms.messages.TextMessage;

@WebServlet("/sendSMS.do")
public class PhoneController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String recpPhoneNumber = "+82"+req.getParameter("phone");
		
		
		VonageClient client = VonageClient.builder().apiKey(Const.PHONE_API_KEY.getVal()).apiSecret(Const.PHONE_SECRET_KEY.getVal()).build();
		
		StringBuffer sb = new StringBuffer();
		int[] ranNum = new Random().ints(6,1,9).toArray();
		for(int i : ranNum)
			sb.append(i);
		
		TextMessage msg = new TextMessage(
				"Beauty In Site",
				recpPhoneNumber,
				sb.toString());
		
		SmsSubmissionResponse response = client.getSmsClient().submitMessage(msg);
		
		if(response.getMessages().get(0).getStatus() == MessageStatus.OK) {
			System.out.println("전송성공 !");
			resp.getWriter().write(sb.toString());
			
		} else {
			System.out.println("전송실패 >> " + response.getMessages().get(0).getErrorText());
			
			resp.getWriter().write(Const.FAILURE.getVal());;
		}
	}
}
