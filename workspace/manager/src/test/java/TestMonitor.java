import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.MonitorService;

@RunWith(JUnit4ClassRunner.class)     //琛ㄧず缁ф壙浜哠pringJUnit4ClassRunner绫�  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMonitor {
	
	@Resource
	private MonitorService monitorService;
	
	@Test
	public void testGetTeachingProcess() {
		JSONObject reqData = new JSONObject();
		reqData.put("teacherName", "颜");
		List<JSONObject> data = monitorService.getTeachingProcess(reqData);
		if(CollectionUtils.isNotEmpty(data)) {
			for (JSONObject jsonObject : data) {
				System.out.println(jsonObject);
			}
		}
	}
	@Test
	public void testGetCustomFeedback() {
		JSONObject reqData = new JSONObject();
		reqData.put("teachingId", "5a657d14-c207-411d-8bdf-cf6cb8e0db70");
		reqData.put("queryMonth", "2018-07");
		JSONObject data = monitorService.getCustomFeedback(reqData);
		System.out.println(data);
	}
}
