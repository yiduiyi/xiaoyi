import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.manager.service.IBillRecordRelationService;
import com.xiaoyi.manager.service.IBillService;
import com.xiaoyi.wechat.utils.UUIDUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@RunWith(JUnit4ClassRunner.class)     //琛ㄧず缁ф壙浜哠pringJUnit4ClassRunner绫�  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestBill {
	
	@Resource
	private IBillService billService;
	
	@Resource
	private IBillRecordRelationService billRecordRelationService;
	
	@Resource
	private IWechatService wechatService;
	
	@Test
	public void testInsert() {
		JSONObject reqData = new JSONObject();
		reqData.put("serialNumber", "B2");
		reqData.put("gradeId", 1);
		reqData.put("courseId", 2);
		reqData.put("consultantId", UUIDUtil.getUUIDPrimary());
		reqData.put("classTime", "暑假");
		reqData.put("classAddress", "梅溪湖");
		reqData.put("demand", "心思细腻，女生，高分");
		int i = billService.insertBill(reqData);
		System.out.println(i);
	}
	
	@Test
	public void testGetBillList() {
		JSONObject reqData = new JSONObject();
		List<JSONObject> data = billService.getBillList(reqData);
		for (JSONObject jsonObject : data) {
			System.out.println(jsonObject);
		}
	}
	
	@Test
	public void testUpdateBill() {
		JSONObject reqData = new JSONObject();
		reqData.put("billId", "545327b7-1bc4-4a69-bc1e-51c98ba1cd5c");
		reqData.put("serialNumber", "B3");
		reqData.put("gradeId", 6);
		reqData.put("courseId", 9);
		reqData.put("classTime", "暑假");
		reqData.put("classAddress", "岳麓山");
		reqData.put("demand", "心思细腻，女生，成绩好，乖巧。");
		int i = billService.updateBill(reqData);
		System.out.println(i);
	}
	
	@Test
	public void testSendBillToTeacher() {
		JSONObject reqData = new JSONObject();
		reqData.put("billId", "545327b7-1bc4-4a69-bc1e-51c98ba1cd5c");
		billService.sendBillToTeacher(reqData);
	}
	
	@Test
	public void testGetBillRecordList() {
		JSONObject reqData = new JSONObject();
		reqData.put("billId", "545327b7-1bc4-4a69-bc1e-51c98ba1cd5c");
		billRecordRelationService.getBillRecordList(reqData);
	}
	
	@Test
	public void testUpdateBillRecord() {
		JSONObject reqData = new JSONObject();
		reqData.put("billId", "545327b7-1bc4-4a69-bc1e-51c98ba1cd5c");
		reqData.put("billRecordId", "8123ff83-d7fb-4555-a083-239cb9fb32b2");
		reqData.put("status", 1);
		billService.updateBillRecord(reqData);
	}
	
	@Test
	public void testSend() {
		String templeteId = WeiXinConfig.CUSTOM_LESSON_SHORTAGE_REMAINDER_TEMPLETE_ID;
		String redirect_url = "www.baidu.com";
		String openId = "oknxW0ivmUJDGZHQXEleabGhydjc";
		List<String> values = new ArrayList<String>();
		values.add("这是测试");
		List<String> colors = new ArrayList<String>();
		colors.add("#137600");
		JSONObject extraParams =null;
		wechatService.sendTempletMsg2(templeteId, redirect_url, openId, values, colors, extraParams);
	}
	
	@Test
	public void testSendAllInTheSingleBillQuarzMsgToTeacher() {
		billService.sendAllInTheSingleBillQuarzMsgToTeacher();
	}
}
