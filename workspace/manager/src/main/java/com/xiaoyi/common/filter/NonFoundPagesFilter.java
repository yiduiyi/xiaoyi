package com.xiaoyi.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;


public class NonFoundPagesFilter implements Filter {
	/*@Resource
	ILoginService loginService;*/
    private static Logger logger = Logger.getLogger(NonFoundPagesFilter.class);

	public void destroy() {
        // TODO Auto-generated method stub
    }
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        
        // 登陆url
        String loginUrl = "http://test.yduiy.com.cn" + "/index.html";
        String url = httpRequest.getRequestURI();
        logger.info("url:"+url);
        logger.info("context path:"+httpRequest.getContextPath());
        if(!httpRequest.getContextPath().startsWith("/xiaoyi")){
        	httpResponse.sendRedirect(loginUrl);
        	return ;
        }
        
        chain.doFilter(request, response);
    }
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
    }
}