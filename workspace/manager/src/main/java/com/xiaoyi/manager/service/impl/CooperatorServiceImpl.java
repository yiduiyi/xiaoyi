package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.ICooperatorDao;
import com.xiaoyi.manager.domain.Cooperator;
import com.xiaoyi.manager.service.ICooperatorService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("cooperatorService")
public class CooperatorServiceImpl implements ICooperatorService{
	@Resource
	private ICooperatorDao cooperatorDao;
	@Override
	public int insertCooperator(JSONObject reqData) {
		Cooperator cooperator = new Cooperator();
		cooperator.setCooperatorId(UUIDUtil.getUUIDPrimary());
		cooperator.setCooperatorName(reqData.getString("cooperatorName"));
		cooperator.setContanctor(reqData.getString("contanctor"));
		cooperator.setTelephone(reqData.getString("telePhone"));
		cooperator.setAddress(reqData.getString("address"));
		cooperator.setCreateTime(new Date());
		cooperator.setUpdateTime(new Date());
		cooperator.setChannelManagerId(reqData.getString("channelManagerId"));
		return cooperatorDao.insertSelective(cooperator);
	}
	@Override
	public int updateCooperator(JSONObject reqData) {
		Cooperator cooperator = cooperatorDao.selectByPrimaryKey(reqData.getString("cooperatorId"));
		if(null == cooperator) {
			return -1;
		}
		cooperator.setCooperatorName(reqData.getString("cooperatorName"));
		cooperator.setContanctor(reqData.getString("contanctor"));
		cooperator.setTelephone(reqData.getString("telePhone"));
		cooperator.setAddress(reqData.getString("address"));
		cooperator.setUpdateTime(new Date());
		cooperator.setChannelManagerId(reqData.getString("channelManagerId"));
		return cooperatorDao.updateByPrimaryKeySelective(cooperator);
	}
	@Override
	public int deleteCooperator(JSONObject reqData) {
		return cooperatorDao.deleteByPrimaryKey(reqData.getString("cooperatorId"));
	}
	@Override
	public List<JSONObject> getCooperatorList(JSONObject reqData) {
		List<JSONObject> result = cooperatorDao.getCooperatorList(reqData);
		return null;
	}

}
