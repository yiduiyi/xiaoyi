import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.manager.service.IMonitorService;
import com.xiaoyi.manager.service.impl.OrderServiceImpl;

@RunWith(JUnit4ClassRunner.class)     //琛ㄧず缁ф壙浜哠pringJUnit4ClassRunner绫�  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMonitor {
	
	@Resource
	private IMonitorService monitorService;
	
	@Resource
	private IOrderService orderService;
	
	@Test
	public void testGetTeachingProcess() {
		JSONObject reqData = new JSONObject();
		reqData.put("lessThan", "2");
		List<JSONObject> data = monitorService.getTeachingProcess(reqData);
		/*if(CollectionUtils.isNotEmpty(data)) {
			for (JSONObject jsonObject : data) {
				System.out.println(jsonObject);
			}
		}*/
	}
	@Test
	public void testGetCustomFeedback() {
		JSONObject reqData = new JSONObject();
		reqData.put("teachingId", "c49a1c82-ab52-493f-a1d4-abd1780d9281");
		reqData.put("queryMonth", "2018-9-28");
		JSONObject data = monitorService.getCustomFeedback(reqData);
		System.out.println(data);
	}
	/*"2018-8-28"
	teachingId
	:
	"a9569bc1-152c-4499-809b-789ba9c383f7"*/

	
	@Test
	public void testGetOrderList() {
		JSONObject reqData = new JSONObject();
		List<JSONObject> data  = orderService.getOrderList(reqData);
	}
}
