import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.service.IAccountService;  

@RunWith(JUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestAccount {
	private static Logger logger = Logger.getLogger(TestAccount.class);  
	
	@Resource  
	private IAccountService accountService;  
	
	//@Test
	public void test() {
		 Account account = accountService.getAccountById("testtesttest"); 
		 logger.info("test logger");
	     logger.info(JSON.toJSONString(account));  
	}
	//@Test
	public void testTransation(){
		Account account = new Account();
		account.setAccountid("testaccount");
		account.setAccountnumber("15733932994");
		account.setAccounttype(0);
		account.setStatus(1);
		
		accountService.insertAccount(account);
	}
	
	@Test
	public void testWechatTemplateMessage(){
		JSONObject params = new JSONObject();
		params.put("touser", "oVbXbw_Fz5o2-VHc5eIW5WY1JG70");
		params.put("template_id", "j6cTEcD95kdxWhpA5Do1evgyk7gA23zTiG58GQABLCc");
		params.put("url", "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd9579db73c42cf91&redirect_uri=http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do&response_type=code&scope=snsapi_base&state=123#wechat_redirect");

		JSONObject data = new JSONObject();
		JSONObject first = new JSONObject();
		first.put("value", "家长您好,请确认课时！");
		first.put("color", "#173177");
		data.put("first", first);
		
		JSONObject keyword1 = new JSONObject();
		keyword1.put("value", "张三老师");
		keyword1.put("color", "#173177");		
		data.put("keyword1", keyword1);
		
		JSONObject keyword2 = new JSONObject();
		keyword2.put("value", "数学补习");
		keyword2.put("color", "#173177");		
		data.put("keyword2", keyword2);
		params.put("data", data);
		
		JSONObject keyword3 = new JSONObject();
		keyword3.put("value", "10 小时");
		keyword3.put("color", "#173177");		
		data.put("keyword3", keyword3);
		params.put("data", data);
		
		
		String result = null;
		try{
			String rtString = HttpClient.httpGetRequest("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxd9579db73c42cf91&secret=2e50c7d680e6fc3efe5fc0cdf81568fd");
			JSONObject p = JSONObject.parseObject(rtString);
			String access_token = p.getString("access_token");
			result = HttpClient.httpPost("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+access_token, 
					params.toJSONString(),
					"application/json");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		System.out.println(result);
	}
}
