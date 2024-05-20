package com.cosmetic.admin.management.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.management.service.IManagementService;
import com.cosmetic.admin.management.service.ManagementServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.coupon.service.CouponServiceImpl;
import com.cosmetic.member.coupon.service.ICouponService;
import com.cosmetic.member.point.service.IPointService;
import com.cosmetic.member.point.service.PointServiceImpl;
import com.cosmetic.util.Const;

@WebServlet("/couponManage.do")
public class ManageCouponController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ICouponService service = CouponServiceImpl.getInstance();
		
     	List<AccountVO> list = service.couponManage();
     	
     	req.setAttribute("list",list);
     	
     	System.out.println(list);
     	
     	req.getRequestDispatcher("/admin/coupon_grant.jsp").forward(req, resp);
}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		 String grdNoEnd = req.getParameter("grdNoEnd");
	     String grdNoSt = req.getParameter("grdNoSt");
	     String couponCon = req.getParameter("couponCon");
	     String couponDis = req.getParameter("couponDis");
	     String couponPeriod = req.getParameter("couponPeriod");
	     
	     ICouponService service = CouponServiceImpl.getInstance();
	     
	     Map<String, Object> map = new HashMap<>();
	     
	     map.put("grdNoEnd", grdNoEnd);
	     map.put("grdNoSt", grdNoSt);
	     map.put("couponCon", couponCon);
	     map.put("couponDis", couponDis);
	     map.put("couponPeriod", couponPeriod);
	     
	     int cnt = service.couponInsert(map);
	     
	     if(cnt > 0) {
	    	 req.getSession(false).setAttribute("msg",Const.SUCCESS.getVal());
	     }else {
	    	 req.getSession(false).setAttribute("msg",Const.FAILURE.getVal());
	     }
	     
	     resp.sendRedirect(req.getContextPath()+"/couponManage.do");
	}
}
