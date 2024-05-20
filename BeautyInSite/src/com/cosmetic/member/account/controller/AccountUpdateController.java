package com.cosmetic.member.account.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.ISkinService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.service.SkinServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.account.vo.SkinVO;
import com.cosmetic.util.OthersUtil;

@MultipartConfig
@WebServlet("/edit.do")
public class AccountUpdateController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		ISkinService skService = SkinServiceImpl.getInstance();
		
		SkinVO skVO = skService.getSkinType(accVO.getAccNo());
		
		req.setAttribute("skVO", skVO);
		
		req.getRequestDispatcher("/main/account/edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountVO accVO = AccountVO.builder().build();
		
		try {
			BeanUtils.populate(accVO,req.getParameterMap());
			
		
			Part part = req.getPart("profileImg");
			String imgProfile = "";
			
			if(part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")) {
				imgProfile = OthersUtil.Base64Encode(part);
			}else {
				imgProfile = accVO.getImgProfile();
			}
			
			accVO.setImgProfile(imgProfile);
		
			
			String skinType = req.getParameter("skType");
			String[] troubles = req.getParameterValues("trouble");
			
			SkinVO skVO = SkinVO.builder().accNo(accVO.getAccNo()).skType(skinType).build();
			
			ISkinService skService = SkinServiceImpl.getInstance();
			int result = skService.updateSkinType(skVO, troubles);
			
			if(result > 0) {
				IMemberService ms = MemberServiceImpl.getInstance();
				int cnt = ms.accountUpdate(accVO);
				
				if(cnt > 0) {
					resp.sendRedirect(req.getContextPath()+"/mypage.do");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
