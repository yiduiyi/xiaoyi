package com.xiaoyi.manager.service;

import com.alibaba.fastjson.JSONObject;

public interface ICommonService {
	
	/**
	 * 判断是否存在家长-学生关系记录，若不存在，则添加关系，并返回该关系
	 * Params：{
			openId: 预约微信号（家长）ID 
			telNum: 联系方式（家长）
			parentName: 家长姓名
			weChatNum: 微信号（家长）
			studentName: 学生姓名			
		}
	 * @param schedule
	 * @return parents,student,relation
	 */
	JSONObject addOrGetPSR(JSONObject schedule);
}
