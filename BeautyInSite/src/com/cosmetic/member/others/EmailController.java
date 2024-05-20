package com.cosmetic.member.others;

import java.io.IOException;
import java.util.Arrays;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.util.Const;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@WebServlet("/sendEmail.do")
public class EmailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		System.out.println(email);
		
		String sender = "imyeine.2s@gmail.com";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable", true);
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		
		
		 Session emailSession = Session.getInstance(prop, new Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(sender, Const.EMAIL_APP_PASS.getVal());
	            }
	     });
		 
		 try {
			Message msg = new MimeMessage(emailSession);
			msg.setFrom(new InternetAddress(sender));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			msg.setSubject("뷰티인사이트 이메일 인증번호 입니다");
			
			StringBuffer sb = new StringBuffer();
			int[] ranNum = new Random().ints(6,1,9).toArray();
			for(int i : ranNum)
				sb.append(i);
			
			String code = sb.toString();
			
			msg.setText("아름다움을 발견하는 곳 뷰티인사이트 입니다");
			msg.setText("이메일 인증번호 : " + code);
			
			Transport.send(msg);
			
			resp.getWriter().write(code);
			
		} catch (MessagingException e) {
			e.printStackTrace();
			resp.getWriter().write(Const.FAILURE.getVal());
		}
		 
		 
	}
}
