package com.xiaoyi.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IBigColumnDao;
import com.xiaoyi.manager.service.IBigColumnService;
@Service("bigColumnService")
public class BigColumnServiceImpl implements IBigColumnService {
	@Resource
	private IBigColumnDao bigColumnDao;
	@Override
	public List<JSONObject> getBigColumnList(JSONObject reqData) {
		// TODO Auto-generated method stub
		return bigColumnDao.getBigColumnList();
	}

}
