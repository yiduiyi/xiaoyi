package com.xiaoyi.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 验证用户登录权限
 * @author dengzhihua
 *
 */
public class UserIdentiftyFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}/*
	@Resource
	ILoginService loginService;
    private static Logger logger = Logger.getLogger(UserIdentiftyFilter.class);

	public void destroy() {
        // TODO Auto-generated method stub
    }
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        logger.info("verify user identity...");
        //获取用户登录状态
        User user = (User) session.getAttribute("userBean");
        
        // 登陆url
        String loginUrl = httpRequest.getContextPath() + "/index.jsp";
        String url = httpRequest.getRequestURI();
        String path = url.substring(url.lastIndexOf("/"));
        // 超时处理，ajax请求超时设置超时状态，页面请求超时则返回提示并重定向
        if (path.indexOf(".action") != -1
                && (null==user ||(user.getUsertype()==3 && user.getUserprivilege()!=1))) {
            // 判断是否为ajax请求
            if (httpRequest.getHeader("x-requested-with") != null
                    && httpRequest.getHeader("x-requested-with")
                            .equalsIgnoreCase("XMLHttpRequest")) {
                httpResponse.addHeader("sessionstatus", "timeOut");
                httpResponse.addHeader("loginPath", loginUrl);
                chain.doFilter(request, response);// 不可少，否则请求会出错
            } else {
                String str = "<script language='javascript'>alert('会话过期,请重新登录');"
                        + "window.top.location.href='"
                        + loginUrl
                        + "';</script>";
                response.setContentType("text/html;charset=UTF-8");// 解决中文乱码
                try {
                    PrintWriter writer = response.getWriter();
                    writer.write(str);
                    writer.flush();
                    writer.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            chain.doFilter(request, response);
        }
    }
    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
    }
*/}