package com.xiaoyi.common.intercept;

import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xiaoyi.common.utils.RequestUtil;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.utils.constant.ResponseConstants.SessionConstants;


public class CommonInterceptor extends HandlerInterceptorAdapter{
    private final Logger log = LoggerFactory.getLogger(CommonInterceptor.class);
    /*
     * 利用正则映射到需要拦截的路径

    private String mappingURL;

    public void setMappingURL(String mappingURL) {
               this.mappingURL = mappingURL;
    }
  */
    /**
     * 在业务处理器处理请求之前被调用
     * 如果返回false
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     * 如果返回true
     *    执行下一个拦截器,直到所有的拦截器都执行完毕
     *    再执行被拦截的Controller
     *    然后进入拦截器链,
     *    从最后一个拦截器往回执行所有的postHandle()
     *    接着再从最后一个拦截器往回执行所有的afterCompletion()
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
    	/*HttpSession session = request.getSession();  
    	Object obj = session.getAttribute(SessionConstantsConstant.LOGIN_USER);  
    	    if (obj == null) {  
    	        PrintWriter out = response.getWriter();  
    	        out.println("<html>");      
    	        out.println("<script>");      
    	        out.println("window.open ('"+request.getContextPath()+"/index.html','_top')");      
    	        out.println("</script>");      
    	        out.println("</html>");    
    	        return false;  
    	    }  */
    	
    	
    	
    	if ("GET".equalsIgnoreCase(request.getMethod())) {
            RequestUtil.saveRequest();
        }
        log.info("==============执行顺序: 1、preHandle================");
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());

        log.info("requestUri:"+requestUri);
        log.info("contextPath:"+contextPath);
        log.info("url:"+url);

        HttpSession session = request.getSession();
        
        if(null!=session){
        	User user =  (User) session.getAttribute("userBean");
	        if(user == null){
	            response.setCharacterEncoding("UTF-8");
	            log.info("Interceptor：跳转到login页面！");
	            //toAlert(response,"用户登录session过期！！");
	            //response.sendRedirect("/xiaoyi");
	            //request.getd
	           // return true;
	            return true;
	        }else{
	            return true;
	        }
        }else{
        	toAlert(response,"获取session出错！");
        }
        return false;
    }

    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作
     * 可在modelAndView中加入数据，比如当前时间
     */
    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        log.info("==============执行顺序: 2、postHandle================");
        if(modelAndView != null){  //加入当前时间
            modelAndView.addObject("var", "测试postHandle");
        }
    }

    /**
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
     *
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
     */
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        log.info("==============执行顺序: 3、afterCompletion================");
    }

    
  //前台弹出alert框
    public void toAlert( HttpServletResponse response,String msg){
           
        try {
             response.setContentType("text/html;charset=UTF-8");
             response.setCharacterEncoding("UTF-8");
                
             OutputStreamWriter out=new OutputStreamWriter(response.getOutputStream());   
             
             //String msg="由于您长时间没有操作，session已过期，请重新登录！";
             msg=new String(msg.getBytes("UTF-8"));
             
             out.write("<meta http-equiv='Content-Type' content='text/html';charset='UTF-8'>");
             out.write("<script>");
             out.write("alert('"+msg+"');");
             out.write("top.location.href = '/index.html'; ");
             out.write("</script>");
             out.flush();
             out.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}