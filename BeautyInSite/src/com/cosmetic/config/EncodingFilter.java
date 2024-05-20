package com.cosmetic.config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("*.do")
public class EncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        req.setCharacterEncoding("UTF-8");

        String uri = req.getRequestURI();

        if(uri.contains(".css")){
            resp.setContentType("text/css; charset=UTF-8");
        }else if(uri.contains(".js")) {
            resp.setContentType("text/js; charset=UTF-8");
        }else if(uri.contains(".png")){
            resp.setContentType("image/png");
        }else if (uri.contains(".jpg")) {
            resp.setContentType("image/jpeg");
        } else {
            resp.setContentType("text/html; charset=utf-8");
        }

        chain.doFilter(req,resp);
    }

    @Override
    public void destroy() {}
}
