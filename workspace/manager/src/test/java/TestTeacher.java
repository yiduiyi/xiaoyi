import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.ITeachingResourceService;
import com.xiaoyi.teacher.service.IH5PlateService;

@RunWith(JUnit4ClassRunner.class)     //琛ㄧず缁ф壙浜哠pringJUnit4ClassRunner绫�  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestTeacher {

	@Resource
	private IH5PlateService h5PlateService;
	@Resource
	private ITeachingResourceService tResourceService;
	@Test
	public void testGetTeacherGootAt() {
		String openId = "oQHVE04sqMngRGJ9H5lKgGd8ARs4";
		JSONObject data =h5PlateService.getTeacherGootAt(openId);
		/*for (String jsonObject : data) {
			System.out.println(jsonObject);
		}*/
	}
	
	@Test
	public void testUpdateTeacherGootAt() {
		JSONObject reqData = new JSONObject();
		reqData.put("openId", "oQHVE04sqMngRGJ9H5lKgGd8ARs4");
		reqData.put("goodAt", "1,5,6,9");
		h5PlateService.updateTeacherGootAt(reqData);
	}
	
	@Test
	public void testInsertTeacherBillSet() {
		JSONObject reqData = new JSONObject();
		reqData.put("openId", "oQHVE04sqMngRGJ9H5lKgGd8ARs4");
		reqData.put("introduce", "成绩优异，身体健康，长期健身，精力旺盛。");
		reqData.put("remind", 1);
		h5PlateService.insertTeacherBillSet(reqData);
	}
	
	@Test
	public void testInsertBillRecord() {
		JSONObject reqData = new JSONObject();
		reqData.put("billId", "545327b7-1bc4-4a69-bc1e-51c98ba1cd5c");
		reqData.put("openId", "oQHVE04sqMngRGJ9H5lKgGd8ARs4");
		reqData.put("standbyTelNumber", "15200668248");
		h5PlateService.insertBillRecord(reqData);
	}
	
	@Test
	public void testGetSuitBillList() {
		JSONObject reqData = new JSONObject();
		reqData.put("openId", "oQHVE04sqMngRGJ9H5lKgGd8ARs4");
		h5PlateService.getSuitBillList(reqData);
	}
	
	@Test
	public void testgetAllBillList() {
		JSONObject reqData = new JSONObject();
		reqData.put("openId", "oQHVE00HAWuiDqD8zQb1Zun4cfxo");
		h5PlateService.getAllBillList(reqData);
	}
	
	@Test
	public void testGetMyBillRecord() {
		JSONObject reqData = new JSONObject();
		reqData.put("openId", "oQHVE04sqMngRGJ9H5lKgGd8ARs4");
		h5PlateService.getMyBillRecord(reqData);
	}
	
	@Test
	public void testGetAllSendBillList() {
		JSONObject reqData = new JSONObject();
		reqData.put("billId", "545327b7-1bc4-4a69-bc1e-51c98ba1cd5c");
		h5PlateService.getAllSendBillList(reqData);
	}
	
	@Test
	public void testGetMonthTeacherClassFeeRank() {
		List<JSONObject> jsonObjects = h5PlateService.getMonthTeacherClassFeeRank();
		for (JSONObject jsonObject : jsonObjects) {
			System.out.println(jsonObject.toJSONString());
		}
	}
	
	@Test
	public void testGetTeacherTreaty() {
		JSONObject reqData = new JSONObject();
		reqData.put("teacherId", "6a32d9eb-1e1a-4bef-9ae3-8ec32334f0a6");
		List<JSONObject> data = tResourceService.getTeacherTreaty(reqData);
		for (JSONObject jsonObject : data) {
			System.out.println(jsonObject);
		}
		
	}
}
