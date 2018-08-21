package com.xiaoyi.common.servlets;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.service.impl.WechatServiceImpl;
import com.xiaoyi.common.utils.SHA1;


@SuppressWarnings("serial")
public class WechatCallbackApi extends HttpServlet {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	IWechatService wechatService = new WechatServiceImpl();
	
	// 自定义 token
    private String TOKEN = "xiaoyiVerifyToken";
    /**
     * get: 授权认证
     * 注：每个用户授权登录的这个接口只能调用一次,所以授权之后必须存储该用户信息
     */
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
    	 // 微信加密签名
        String signature = request.getParameter("signature");
        // 随机字符串
        String echostr = request.getParameter("echostr");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        logger.info("sort params:{signature:"+signature+"\nechostr:"+echostr+"\ntimestamp:"+timestamp+"}");
        logger.info("code:"+request.getParameter("code"));
        
        String[] str = { TOKEN, timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest =SHA1.encode(bigStr);//.getDigestOfString(bigStr.getBytes()).toLowerCase();

        // 确认请求来至微信
        if (digest.equals(signature)) {
            response.getWriter().print(echostr);
        }
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		logger.info("使用post处理消息...");
		String rt = wechatService.processRequest(req);
		logger.info(rt);
		
		try {
			resp.getWriter().println(rt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//super.doPost(req, resp);
	}
    
}