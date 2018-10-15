package com.xiaoyi.manager.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.common.utils.ExcelUtils;
import com.xiaoyi.common.xiaoe.XiaoeSDK;
import com.xiaoyi.manager.dao.IOrderLogDao;
import com.xiaoyi.manager.domain.OrderLog;
import com.xiaoyi.manager.service.IOrderLogService;
import com.xiaoyi.wechat.utils.UUIDUtil;

@Service("orderLogService")
public class OrderLogServiceImpl implements IOrderLogService {
	@Resource
	private IOrderLogDao orderLogDao;

	XiaoeSDK sdk = new XiaoeSDK(ConstantUtil.XIAOE_APPID, ConstantUtil.XIAOE_APPSECRET);

	@Override
	public List<JSONObject> getOrderLogList(JSONObject reqData) {
		List<JSONObject> result = new ArrayList<JSONObject>();
		try {
			if (!StringUtils.isEmpty(reqData.getString("startTime"))) {
				reqData.put("startTime",
						DateUtils.getDayMin(DateUtils.toYYYYMMDDHHMMSSDate(reqData.getString("startTime"))));
			}
			if (!StringUtils.isEmpty(reqData.getString("endTime"))) {
				reqData.put("endTime",
						DateUtils.getDayMax(DateUtils.toYYYYMMDDHHMMSSDate(reqData.getString("startTime"))));
			}
			result = orderLogDao.getOrderLogList(reqData);
			if (CollectionUtils.isNotEmpty(result)) {
				for (JSONObject jsonObject : result) {
					if (!StringUtils.isEmpty(jsonObject.getString("createAt"))) {
						jsonObject.put("createAt", DateUtils.toYYYYMMDDString(jsonObject.getDate("createAt")));
					}
					if (jsonObject.getInteger("price") > 0) {
						Float price = (float) (jsonObject.getInteger("price") / 10);
						jsonObject.put("price", price);
					}
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int exportOrderLogList(JSONObject reqData, HttpServletResponse response) {
		Integer resultType = 0;
		List<JSONObject> result = new ArrayList<JSONObject>();
		try {
			if (!StringUtils.isEmpty(reqData.getString("startTime"))) {
				reqData.put("startTime",
						DateUtils.getDayMin(DateUtils.toYYYYMMDDHHMMSSDate(reqData.getString("startTime"))));
			}
			if (!StringUtils.isEmpty(reqData.getString("endTime"))) {
				reqData.put("endTime",
						DateUtils.getDayMax(DateUtils.toYYYYMMDDHHMMSSDate(reqData.getString("startTime"))));
			}
			result = orderLogDao.getOrderLogList(reqData);
			if (CollectionUtils.isNotEmpty(result)) {
				for (JSONObject jsonObject : result) {
					if (!StringUtils.isEmpty(jsonObject.getString("createAt"))) {
						jsonObject.put("createAt", DateUtils.toYYYYMMDDString(jsonObject.getDate("createAt")));
					}
					if (jsonObject.getInteger("price") > 0) {
						Float price = (float) (jsonObject.getInteger("price") / 10);
						jsonObject.put("price", price);
					}
				}

				// 创建HSSFWorkbook
				// excel标题
				String[] title = { "微信openId", "下单日期", "头像", "昵称", "付费金额" };

				// excel文件名
				String fileName = "订单记录表" + System.currentTimeMillis() + ".xls";

				// sheet名
				String sheetName = "订单记录表";
				/* String [][] content = null; */
				String content[][] = new String[title.length][];
				for (int i = 0; i < result.size(); i++) {
					JSONObject jsonObject = result.get(i);
					content[i][0] = jsonObject.getString("wxOpenId");
					content[i][1] = jsonObject.getString("createAt");
					content[i][2] = jsonObject.getString("headIamge");
					content[i][3] = jsonObject.getString("wxNickName");
					content[i][4] = jsonObject.getString("price");
				}
				HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(sheetName, title, content, null);
				try {
					this.setResponseHeader(response, fileName);
					OutputStream os = response.getOutputStream();
					wb.write(os);
					os.flush();
					os.close();
					resultType = 1;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return resultType;
	}

	@Override
	public JSONObject getOrderLogByOpenId(JSONObject reqData) {
		JSONObject result = new JSONObject();
		List<String> bigColumnOrderList = new ArrayList<String>();
		List<String> courseOrderList = new ArrayList<String>();
		List<JSONObject> data = orderLogDao.getOrderLogByOpenId(reqData.getString("wxOpenId"));
		if (CollectionUtils.isNotEmpty(data)) {
			for (JSONObject jsonObject : data) {
				if (jsonObject.getString("paymentType").equals(ConstantUtil.SINGLE_PAYMENT)) {
					courseOrderList.add(jsonObject.getString("title"));
				} else if (jsonObject.getString("paymentType").equals(ConstantUtil.SUBSCRIBE_PAYMENT)) {
					bigColumnOrderList.add(jsonObject.getString("title"));
				}
			}
			result.put("bigColumnOrderList", bigColumnOrderList);
			result.put("courseOrderList", courseOrderList);
		}
		return result;
	}

	// 发送响应流方法
	public void setResponseHeader(HttpServletResponse response, String fileName) {
		try {
			try {
				fileName = new String(fileName.getBytes(), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			response.setContentType("application/octet-stream;charset=ISO8859-1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.addHeader("Pargam", "no-cache");
			response.addHeader("Cache-Control", "no-cache");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void getXiaoETongOrderLog() {
		List<OrderLog> orderLogs = new ArrayList<OrderLog>();
		org.json.JSONObject xiaoEResult = new org.json.JSONObject();
		JSONObject data = new JSONObject();
		String orderBy = "created_at:desc";
		Integer pageIndex = 0;
		Integer pageSize = 50;
		String beginTime = DateUtils.getUnixTimestamp(DateUtils.getDayMin(DateUtils.getLastDay()));
		String endTime = DateUtils.getUnixTimestamp(DateUtils.getDayMax(DateUtils.getLastDay()));
		String orderState = "1";
		Boolean flag = true;
		while (flag) {
			data.put("order_by", orderBy);
			data.put("page_index", pageIndex.toString());
			data.put("page_size", pageSize.toString());
			data.put("begin_time", beginTime);
			data.put("end_time", endTime);
			data.put("order_state", orderState);
			//查询小鹅通订单记录
			xiaoEResult = sdk.send(ConstantUtil.XIAOE_ORDER_LIST_GET_CMD, data, 3, "1.0");
			if (xiaoEResult.getString("code").equals("0")) {
				String datas = xiaoEResult.getString("data");
				if (StringUtils.isEmpty(datas)) {
					JSONArray orderLogData = JSONArray.parseArray(datas);
					if(CollectionUtils.isNotEmpty(orderLogData)) {
						for (int i = 0; i < orderLogData.size(); i++) {
							JSONObject userData = new JSONObject();
							OrderLog orderLog = new OrderLog();
							JSONObject orderLogJson = orderLogData.getJSONObject(i);
							String userId = orderLogJson.getString("user_id");
							userData.put("user_id", userId);
							//获取该条订单用户记录
							org.json.JSONObject xiaoEUserResult = sdk.send(ConstantUtil.XIAOE_ORDER_USERS_GETINFO, userData, 3, "1.0");
							JSONObject usersData = JSONObject.parseObject(xiaoEUserResult.getString("data"));
							//构建orderLog记录
							orderLog.setOrderLogId(UUIDUtil.getUUIDPrimary());
							if(null != usersData) {
								orderLog.setWxOpenid(usersData.getString("wx_open_id"));
							}
							orderLog.setXiaoeResourceId(orderLogJson.getString("id"));
							orderLog.setXiaoeOrderId(orderLogJson.getString("order_id"));
							orderLog.setXiaoeUserId(userId);
							orderLog.setPrice(orderLogJson.getFloat("price"));
							orderLog.setTitle(orderLogJson.getString("title"));
							orderLog.setOrderState(orderLogJson.getInteger("order_state"));
							orderLog.setPaymentType(orderLogJson.getInteger("payment_type"));
							orderLog.setResourceType(orderLogJson.getInteger("resource_type"));
							orderLog.setCreatedAt(orderLogJson.getString("created_at"));
							orderLogs.add(orderLog);
						}
					}
				} else {
					flag = false;
				}
			}
			//分页查询小鹅通订单记录，每次50条
			pageIndex += pageSize;
		}
		if(CollectionUtils.isNotEmpty(orderLogs)) {
			orderLogDao.batchInsertOrderLog(orderLogs);
		}
	}

}
