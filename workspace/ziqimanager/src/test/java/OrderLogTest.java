import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.xiaoyi.manager.service.IOrderLogService;

@RunWith(JUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class OrderLogTest {
	@Resource
	private IOrderLogService orderLogService;
	
	@Test
	public void testGetXiaoETongOrderLog() {
		orderLogService.getXiaoETongOrderLog();
	}
}
