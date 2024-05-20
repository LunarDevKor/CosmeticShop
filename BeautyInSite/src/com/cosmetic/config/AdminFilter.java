package com.cosmetic.config;

import java.io.IOException;
import java.util.Enumeration;

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

import com.cosmetic.member.account.vo.AccountVO;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		String reqURI = req.getRequestURI();

		HttpSession session = req.getSession(false);

		AccountVO accVO = req.getSession().getAttribute("LOGIN_USER") == null ? new AccountVO()
				: (AccountVO) req.getSession().getAttribute("LOGIN_USER");
		
		boolean isAdmin = "1".equals(accVO.getAuth());

		if (isAdmin) {

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

			if ((session != null && session.getAttribute("LOGIN_USER") != null))
				resp.sendRedirect(req.getContextPath() + "/index.do");
			else
				resp.sendRedirect(req.getContextPath() + "/login.do");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
