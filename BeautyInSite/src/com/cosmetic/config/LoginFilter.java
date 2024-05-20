package com.cosmetic.config;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("*.do")
public class LoginFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		// 로그인 없이 허용 가능한 URL 목록(로그인한사람, 허용된 사람)
		List<String> okURlList = Arrays.asList(
				"/index.do",
				"/list.do",
				"/detail.do",
				"/register.do",
				"/login.do",
				"/naverLogin.do",
				"/service.do",
				"/kakaoLogin.do",
				"/idCheck.do",
				"/sendEmail.do",
				"/sendSMS.do",
				"/findCred.do",
				"/findId.do",
				"/admin/categoryMod.do"
				);
		

		String reqURI = req.getRequestURI();

		boolean isAllowed = okURlList.contains(reqURI.substring(req.getContextPath().length()));
		HttpSession session = req.getSession(false);
		
		if (isAllowed || (session != null && session.getAttribute("LOGIN_USER") != null)) {
			// 허용 가능한 URL이거나 로그인 한 사람이라면...
		
			chain.doFilter(req, resp);
			
		} else {
			
			Enumeration<String> paramNames = req.getParameterNames();

			StringBuffer sb = new StringBuffer();

			int cnt = 0;

			while (paramNames.hasMoreElements()) {

				String paramName = paramNames.nextElement();

				if (cnt == 0) {
					sb.append("?");
				} else {
					sb.append("&");
				}
				sb.append(paramName);
				sb.append("=");
				sb.append(req.getParameter(paramName));

				cnt++;
			}

			req.getSession().setAttribute("redirectURL", reqURI + sb.toString());

			resp.sendRedirect(req.getContextPath() + "/login.do");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
