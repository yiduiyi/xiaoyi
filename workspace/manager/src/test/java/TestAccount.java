import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSON;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.service.IAccountService;  

@RunWith(JUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestAccount {
	private static Logger logger = Logger.getLogger(TestAccount.class);  
	
	@Resource  
	private IAccountService accountService;  
	
	@Test
	public void test() {
		 Account account = accountService.getAccountById("testtesttest"); 
		 logger.info("test logger");
	     logger.info(JSON.toJSONString(account));  
	}

}
