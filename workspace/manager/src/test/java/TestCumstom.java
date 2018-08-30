import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.custom.service.ICustomService;

@RunWith(JUnit4ClassRunner.class)     //琛ㄧず缁ф壙浜哠pringJUnit4ClassRunner绫�  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestCumstom {
	
	@Resource
	private ICustomService customService;
	
	@Test
	public void testGetPSRList() {
		String openid = "oknxW0ivmUJDGZHQXEleabGhydjc";
		List<JSONObject> jsonObjects = customService.getPSRList(openid);
		for (JSONObject jsonObject : jsonObjects) {
			System.out.println(jsonObject.toJSONString());
		}
	}
	
	@Test
	public void testGetStuTeachingDetailByMonth() {
		JSONObject reqData = new JSONObject();
		reqData.put("parentId", "36aecc30-94d8-40e6-b56d-a17f1d60a7b9");
		reqData.put("memberId", "35f12b3c-d029-459c-9b7c-619f3f44f2ef");
		reqData.put("queryMonth", "2018-06");
		List<JSONObject> list = customService.getStuTeachingDetailByMonth(reqData);
		for (JSONObject jsonObject : list) {
			System.out.println(jsonObject.toJSONString());
		}
	}
}
