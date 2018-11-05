package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.manager.dao.IChannelManagerDao;
import com.xiaoyi.manager.dao.IChannelManagerGroupDao;
import com.xiaoyi.manager.dao.IConsultantDao;
import com.xiaoyi.manager.dao.IConsultantGroupDao;
import com.xiaoyi.manager.dao.IUserDao;
import com.xiaoyi.manager.domain.ChannelManager;
import com.xiaoyi.manager.domain.ChannelManagerGroup;
import com.xiaoyi.manager.domain.Consultant;
import com.xiaoyi.manager.domain.ConsultantGroup;
import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.service.IAccountManagerService;
import com.xiaoyi.manager.service.IChannelManagerService;
import com.xiaoyi.manager.service.IConsultantService;
import com.xiaoyi.wechat.utils.UUIDUtil;

@Service("accountManagerService")
public class AccountManagerServiceImpl implements IAccountManagerService {
	@Resource
	private IConsultantService consultantService;
	@Resource
	private IConsultantDao consultantDao;
	@Resource
	private IConsultantGroupDao consultantGroupDao;
	@Resource
	private IChannelManagerService channelManagerService;
	@Resource
	private IChannelManagerDao channelManagerDao;
	@Resource
	private IChannelManagerGroupDao channelManagerGroupDao;
	@Resource
	private IUserDao userDao;

	@Override
	public int insertAccount(JSONObject reqData) {
		Integer resultType = 0;
		// 判断该账号是课程顾问账号还是渠道经理账号
		String primaryKey = UUIDUtil.getUUIDPrimary();
		String groupPrimaryKey = null;
		if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CONSULTANT)) {
			// 如果是新增的组长，就新添加组别
			if (reqData.getInteger("isLead").equals(ConstantUtil.IS_LEAD)) {
				groupPrimaryKey = UUIDUtil.getUUIDPrimary();
				ConsultantGroup consultantGroup = new ConsultantGroup();
				consultantGroup.setConsultantGroupId(groupPrimaryKey);
				consultantGroup.setConsultantGroupName(reqData.getString("userName") + "组");
				consultantGroup.setConsultantId(primaryKey);
				resultType = consultantGroupDao.insertSelective(consultantGroup);
			}
			Consultant consultant = new Consultant();
			consultant.setConsultantId(primaryKey);
			consultant.setConsultantGroupId(groupPrimaryKey);
			consultant.setConsultantName(reqData.getString("userName"));
			consultant.setTelnumber(reqData.getString("telePhone"));
			consultant.setCreateTime(new Date());
			consultant.setUpdateTime(new Date());
			consultant.setStatus(ConstantUtil.CONSULTANT_STATUS_NORMAL);
			resultType = consultantService.insertConsultant(consultant);
		} else if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CHANNEL)) {
			// 如果是新增的组长，就新添加组别
			if (reqData.getInteger("isLead").equals(ConstantUtil.IS_LEAD)) {
				groupPrimaryKey = UUIDUtil.getUUIDPrimary();
				ChannelManagerGroup channelManagerGroup = new ChannelManagerGroup();
				channelManagerGroup.setChannelManagerGroupId(groupPrimaryKey);
				channelManagerGroup.setChannelManagerGroupName(reqData.getString("userName") + "组");
				channelManagerGroup.setChannelManagerId(primaryKey);
				resultType = channelManagerGroupDao.insertSelective(channelManagerGroup);
			}
			ChannelManager channelManager = new ChannelManager();
			channelManager.setChannelManagerId(primaryKey);
			channelManager.setChannelManagerGroupId(groupPrimaryKey);
			channelManager.setChannelManagerName(reqData.getString("userName"));
			channelManager.setTelephone(reqData.getString("telePhone"));
			channelManager.setIntendedNumber(0);
			channelManager.setCreateTime(new Date());
			channelManager.setStatus(ConstantUtil.CHANNEL_STATUS_NORMAL);
			resultType = channelManagerService.insertChannelManager(channelManager);
		}
		// 同步至User表
		if (resultType > 0) {
			User user = new User();
			user.setUserid(primaryKey);
			user.setUseraccountid(primaryKey);
			user.setNickname(reqData.getString("userName"));
			user.setUsername(reqData.getString("telePhone"));
			user.setPassword(reqData.getString("telePhone").substring(reqData.getString("telePhone").length() - 6,
					reqData.getString("telePhone").length()));
			user.setUsertype((byte)4);
			resultType = userDao.insertSelective(user);
		}
		return resultType;
	}

	@Override
	public int setLead(JSONObject reqData) {
		Integer resultType = 0;
		if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CONSULTANT)) {
			// 更新课程顾问的分组编号
			Consultant consultant = consultantDao.selectByPrimaryKey(reqData.getString("userId"));
			if (null == consultant) {
				return -1;
			}
			ConsultantGroup consultantGroup = consultantGroupDao.selectByPrimaryKey(reqData.getString("groupId"));
			if(null == consultantGroup) {
				return -1;
			}
			consultant.setConsultantGroupId(reqData.getString("groupId"));
			resultType = consultantDao.updateByPrimaryKeySelective(consultant);
		} else if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CHANNEL)) {
			// 更新渠道经理的分组编号
			ChannelManager channelManager = channelManagerDao.selectByPrimaryKey(reqData.getString("userId"));
			if (null == channelManager) {
				return -1;
			}
			ChannelManagerGroup channelManagerGroup = channelManagerGroupDao.selectByPrimaryKey(reqData.getString("groupId"));
			if(null == channelManagerGroup) {
				return -1;
			}
			channelManager.setChannelManagerGroupId(reqData.getString("groupId"));
			resultType = channelManagerDao.updateByPrimaryKeySelective(channelManager);
		}
		return resultType;
	}

	@Override
	public int updateAccount(JSONObject reqData) {
		Integer resultType = 0;
		// 判断该账号是课程顾问账号还是渠道经理账号
		String primaryKey = reqData.getString("userId");
		String groupPrimaryKey = null;
		if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CONSULTANT)) {
			Consultant consultant = consultantDao.selectByPrimaryKey(reqData.getString("userId"));
			if (null == consultant) {
				return -1;
			}
			//设置为组长
			if (reqData.getInteger("isLead").equals(ConstantUtil.IS_LEAD)) {
				ConsultantGroup consultantGroup = consultantGroupDao.getConsultantByGroupConsultantId(primaryKey);
				//当为新增的组长时，添加新的组别
				if(null == consultantGroup) {
					groupPrimaryKey = UUIDUtil.getUUIDPrimary();
					consultantGroup = new ConsultantGroup();
					consultantGroup.setConsultantGroupId(groupPrimaryKey);
					consultantGroup.setConsultantGroupName(reqData.getString("userName") + "组");
					consultantGroup.setConsultantId(consultant.getConsultantId());
					resultType = consultantGroupDao.insertSelective(consultantGroup);
					consultant.setConsultantGroupId(groupPrimaryKey);
				}
			}
			consultant.setConsultantName(reqData.getString("userName"));
			consultant.setTelnumber(reqData.getString("telePhone"));
			consultant.setCreateTime(new Date());
			consultant.setUpdateTime(new Date());
			consultant.setStatus(ConstantUtil.CONSULTANT_STATUS_NORMAL);
			resultType = consultantDao.updateByPrimaryKeySelective(consultant);
		} else if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CHANNEL)) {
			ChannelManager channelManager = channelManagerDao.selectByPrimaryKey(reqData.getString("userId"));
			if (null == channelManager) {
				return -1;
			}
			// 如果是新增的组长，就新添加组别
			if (reqData.getInteger("isLead").equals(ConstantUtil.IS_LEAD)) {
				
				ChannelManagerGroup channelManagerGroup = channelManagerGroupDao.getChannelManagerGroupByGroupChannelManagerId(primaryKey);
				if(null == channelManagerGroup) {
					channelManagerGroup = new ChannelManagerGroup();
					groupPrimaryKey = UUIDUtil.getUUIDPrimary();
					channelManagerGroup.setChannelManagerGroupId(groupPrimaryKey);
					channelManagerGroup.setChannelManagerGroupName(reqData.getString("userName") + "组");
					channelManagerGroup.setChannelManagerId(channelManager.getChannelManagerId());
					resultType = channelManagerGroupDao.insertSelective(channelManagerGroup);
					channelManager.setChannelManagerGroupId(groupPrimaryKey);
				}
			}
			channelManager.setChannelManagerName(reqData.getString("userName"));
			channelManager.setTelephone(reqData.getString("telePhone"));
			channelManager.setIntendedNumber(0);
			channelManager.setCreateTime(new Date());
			channelManager.setStatus(ConstantUtil.CHANNEL_STATUS_NORMAL);
			resultType = channelManagerDao.updateByPrimaryKeySelective(channelManager);
		}
		// 同步至User表
		if (resultType > 0) {
			User user = new User();
			user.setUserid(primaryKey);
			user.setUseraccountid(primaryKey);
			user.setNickname(reqData.getString("userName"));
			user.setUsername(reqData.getString("telePhone"));
			user.setPassword(reqData.getString("telePhone").substring(reqData.getString("telePhone").length() - 6,
					reqData.getString("telePhone").length()));
			user.setUsertype((byte)4);
			resultType = userDao.updateByPrimaryKeySelective(user);
		}
		return resultType;
	}

	@Override
	public List<JSONObject> getAccountList(JSONObject reqData) {
		List<JSONObject> result = new ArrayList<JSONObject>();
		List<JSONObject> consultantList  = new ArrayList<>();
		List<JSONObject> channelList  = new ArrayList<>();
		Short departmentType = reqData.getShort("departmentType");
		if(null == departmentType) {
			consultantList = consultantService.getConsultantList();
			channelList = channelManagerService.getChannelManagerList();
		}
		if(null != departmentType) {
			if(departmentType.equals(ConstantUtil.DEPART_MENT_TYPE_CONSULTANT)) {
				consultantList = consultantService.getConsultantList();
			}else if(departmentType.equals(ConstantUtil.DEPART_MENT_TYPE_CHANNEL)) {
				channelList = channelManagerService.getChannelManagerList();
			}
		}
		if (CollectionUtils.isNotEmpty(consultantList)) {
			for (JSONObject jsonObject : consultantList) {
				result.add(jsonObject);
			}
		}
		if (CollectionUtils.isNotEmpty(channelList)) {
			for (JSONObject jsonObject : channelList) {
				result.add(jsonObject);
			}
		}
		return result;
	}

	@Override
	public int deleteAccount(JSONObject reqData) {
		Integer resultType = 0;
		// 判断该账号是课程顾问账号还是渠道经理账号
		String primaryKey = reqData.getString("userId");
		if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CONSULTANT)) {
			Consultant consultant = consultantDao.selectByPrimaryKey(reqData.getString("userId"));
			if (null == consultant) {
				return -1;
			}
			//删除组
			if (reqData.getInteger("isLead").equals(ConstantUtil.IS_LEAD)) {
				ConsultantGroup consultantGroup = consultantGroupDao.getConsultantByGroupConsultantId(primaryKey);
				//当删除身份为组长时，删除该组别
				if(null != consultantGroup) {
					consultantGroupDao.deleteByPrimaryKey(consultantGroup.getConsultantGroupId());
				}
			}
			resultType = consultantDao.deleteByPrimaryKey(consultant.getConsultantId());
		} else if (reqData.getShort("departmentType").equals(ConstantUtil.DEPART_MENT_TYPE_CHANNEL)) {
			ChannelManager channelManager = channelManagerDao.selectByPrimaryKey(reqData.getString("userId"));
			if (null == channelManager) {
				return -1;
			}
			// 如果是新增的组长，就新添加组别
			if (reqData.getInteger("isLead").equals(ConstantUtil.IS_LEAD)) {
				
				ChannelManagerGroup channelManagerGroup = channelManagerGroupDao.getChannelManagerGroupByGroupChannelManagerId(primaryKey);
				if(null != channelManagerGroup) {
					channelManagerGroupDao.deleteByPrimaryKey(channelManagerGroup.getChannelManagerGroupId());
				}
			}
			resultType = channelManagerDao.deleteByPrimaryKey(channelManager.getChannelManagerId());
		}
		// 同步删除User表
		if (resultType > 0) {
			User user = new User();
			user.setUserid(primaryKey);
			user.setUseraccountid(primaryKey);
			resultType = userDao.deleteByPrimaryKey(user);
		}
		return resultType;
	}
}
