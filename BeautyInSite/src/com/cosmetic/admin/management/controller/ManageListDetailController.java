package com.cosmetic.admin.management.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.cosmetic.admin.management.service.IManagementService;
import com.cosmetic.admin.management.service.ManagementServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.util.Const;

@WebServlet("/manageUpdate.do")
public class ManageListDetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accNo = req.getParameter("accNo");
		System.out.println("accno값은 ?"+ accNo);
		IManagementService service = ManagementServiceImpl.getInstance();
		
		AccountVO av = service.manageDetail(accNo);
		System.out.println("av값은 ?"+ av);
		req.setAttribute("av", av);
		
		req.getRequestDispatcher("/admin/manage_form.jsp").forward(req, resp);
	} 
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("POST 응답");

		String ssn = req.getParameter("ssn");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String point = req.getParameter("point");
		String accNo = req.getParameter("accNo");
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String auth = req.getParameter("auth");
		String pw = req.getParameter("pw");
		String zipCode = req.getParameter("zipCode");
		String imgProfile = req.getParameter("imgProfile");
		
		AccountVO accVO = AccountVO.builder().build();
		
		try {
			BeanUtils.populate(accVO, req.getParameterMap());
			
			System.out.println("avvvvvvV" +accVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	
		IManagementService service = ManagementServiceImpl.getInstance();
		
		
		
		AccountVO av = AccountVO.builder()
				.accNo(Integer.parseInt(accNo))
				.ssn(ssn)
				.auth(auth)
				.id(id)
				.pw(pw)
				.zipCode(zipCode)
				.imgProfile(imgProfile)
				.email(email)
				.tel(tel)
				.addr1(addr1)
				.addr2(addr2)
				.name(name)
				.point(Integer.parseInt(point))
				.build();
		
		int cnt = service.manageUpdate(av);
		
		req.setAttribute("av", av);
		
		if(cnt > 0) 
			resp.getWriter().write(Const.SUCCESS.getVal());
		else
			resp.getWriter().write(Const.FAILURE.getVal());
			
		
//		resp.sendRedirect(req.getContextPath() + "/manageList.do");
	}
}
