package com.xiaoyi.teacher.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.teacher.dao.ITeacherIntegralDao;
import com.xiaoyi.teacher.domain.IntegralConduct;
import com.xiaoyi.teacher.domain.TeacherIntegral;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;
import com.xiaoyi.teacher.service.IIntegralConductService;
import com.xiaoyi.teacher.service.ITeacherIntegralService;
import com.xiaoyi.teacher.service.ITeacherIntegralSumService;
import com.xiaoyi.teacher.vo.UpdateTeacherIntegralSumVo;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("teacherIntegralService")
public class TeacherIntegralServiceImpl implements ITeacherIntegralService {
	@Resource
	private ITeacherIntegralDao teacherIntegralDao;
	@Resource
	private ITeacherIntegralSumService teacherIntegralSumService;
	@Resource
	private IIntegralConductService integralConductService;
	@Override
	public List<JSONObject> getTeacherTreaty(String teacherId) {
		List<JSONObject> data = teacherIntegralDao.getTeacherTreaty(teacherId);
		if(CollectionUtils.isNotEmpty(data)) {
			for (JSONObject jsonObject : data) {
				jsonObject.put("treatyTime", DateUtils.toMMDDString(jsonObject.getDate("createTime")));
			}
		}
		return data;
	}
	@Override
	public int insertTeacherTreaty(JSONObject reqData) {
		int resultType = 0;
		//根据教师主键查询积分总表
		TeacherIntegralSum teacherIntegralSum = teacherIntegralSumService.getTeacherIntegralSum(reqData.getString("teacherId"));
		IntegralConduct integralConduct = integralConductService.getIntegralConductByIntegralConductId(reqData.getString("integralConductId"));
		if(null != teacherIntegralSum) {
			TeacherIntegral teacherIntegral = new TeacherIntegral();
			teacherIntegral.setTeacherIntegralId(UUIDUtil.getUUIDPrimary());
			teacherIntegral.setTeacherid(reqData.getString("teacherId"));
			teacherIntegral.setIntegralConductName(integralConduct.getIntegralConductName());
			teacherIntegral.setIntegralConductValue(integralConduct.getIntegralConductValue());
			teacherIntegral.setIntegralConductDesc(integralConduct.getIntegralConductDesc());
			teacherIntegral.setIntegralConductType(integralConduct.getIntegralConductType());
			teacherIntegral.setCreateTime(new Date());
			resultType = teacherIntegralDao.insert(teacherIntegral);
			if(resultType > 0) {
				UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo = new UpdateTeacherIntegralSumVo();
				updateTeacherIntegralSumVo.setTeacherid(teacherIntegralSum.getTeacherid());
				updateTeacherIntegralSumVo.setOldIntegralCount(teacherIntegralSum.getIntegralCount());
				if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_SUB) {
					updateTeacherIntegralSumVo.setUpdateIntegralValue(-integralConduct.getIntegralConductValue());
				}else if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_ADD || integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_REWARD) {
					updateTeacherIntegralSumVo.setUpdateIntegralValue(+integralConduct.getIntegralConductValue());
				}
				resultType = teacherIntegralSumService.updateTeacherIntegralSum(updateTeacherIntegralSumVo);
			}
		}else {
			//当积分总表没有该教师的数据时，添加一条数据
			TeacherIntegralSum newTeacherIntegralSum = new TeacherIntegralSum();
			newTeacherIntegralSum.setTeacherid(reqData.getString("teacherId"));
			newTeacherIntegralSum.setIntegralCount(0.0f);
			newTeacherIntegralSum.setStatus(ConstantUtil.TEACHER_INTEGRAL_STATUS_NORMAL);
			newTeacherIntegralSum.setCreateTime(new Date());
			resultType = teacherIntegralSumService.insert(newTeacherIntegralSum);
			if(resultType > 0) {
				teacherIntegralSum = teacherIntegralSumService.getTeacherIntegralSum(reqData.getString("teacherId"));
				TeacherIntegral teacherIntegral = new TeacherIntegral();
				teacherIntegral.setTeacherIntegralId(UUIDUtil.getUUIDPrimary());
				teacherIntegral.setTeacherid(reqData.getString("teacherId"));
				teacherIntegral.setIntegralConductName(integralConduct.getIntegralConductName());
				teacherIntegral.setIntegralConductValue(integralConduct.getIntegralConductValue());
				teacherIntegral.setIntegralConductDesc(integralConduct.getIntegralConductDesc());
				teacherIntegral.setIntegralConductType(integralConduct.getIntegralConductType());
				teacherIntegral.setCreateTime(new Date());
				resultType = teacherIntegralDao.insert(teacherIntegral);
				if(resultType > 0) {
					UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo = new UpdateTeacherIntegralSumVo();
					updateTeacherIntegralSumVo.setTeacherid(teacherIntegralSum.getTeacherid());
					updateTeacherIntegralSumVo.setOldIntegralCount(teacherIntegralSum.getIntegralCount());
					if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_SUB) {
						updateTeacherIntegralSumVo.setUpdateIntegralValue(-integralConduct.getIntegralConductValue());
					}else if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_ADD || integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_REWARD) {
						updateTeacherIntegralSumVo.setUpdateIntegralValue(+integralConduct.getIntegralConductValue());
					}
					resultType = teacherIntegralSumService.updateTeacherIntegralSum(updateTeacherIntegralSumVo);
				}
			}
		}
		return resultType;
	}	
	@Override
	public int updateTeacherIntegral(JSONObject jsonObject) {
		int resultType = 0;
		//根据教师主键查询积分总表
		TeacherIntegralSum teacherIntegralSum = teacherIntegralSumService.getTeacherIntegralSum(jsonObject.getString("teacherId"));
		IntegralConduct integralConduct = integralConductService.getIntegralConductByIntegralConductId(jsonObject.getString("integralConductId"));
		if(null != teacherIntegralSum) {
			TeacherIntegral teacherIntegral = new TeacherIntegral();
			teacherIntegral.setTeacherIntegralId(UUIDUtil.getUUIDPrimary());
			teacherIntegral.setTeacherid(jsonObject.getString("teacherId"));
			teacherIntegral.setIntegralConductName(integralConduct.getIntegralConductName());
			teacherIntegral.setIntegralConductValue(jsonObject.getFloat("integralConductId"));
			teacherIntegral.setIntegralConductDesc(integralConduct.getIntegralConductDesc());
			teacherIntegral.setIntegralConductType(integralConduct.getIntegralConductType());
			teacherIntegral.setCreateTime(new Date());
			resultType = teacherIntegralDao.insert(teacherIntegral);
			if(resultType > 0) {
				UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo = new UpdateTeacherIntegralSumVo();
				updateTeacherIntegralSumVo.setTeacherid(teacherIntegralSum.getTeacherid());
				updateTeacherIntegralSumVo.setOldIntegralCount(teacherIntegralSum.getIntegralCount());
				if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_SUB) {
					updateTeacherIntegralSumVo.setUpdateIntegralValue(-jsonObject.getFloat("integralConductId"));
				}else if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_ADD || integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_REWARD) {
					updateTeacherIntegralSumVo.setUpdateIntegralValue(+jsonObject.getFloat("integralConductId"));
				}
				resultType = teacherIntegralSumService.updateTeacherIntegralSum(updateTeacherIntegralSumVo);
			}
		}else {
			//当积分总表没有该教师的数据时，添加一条数据
			TeacherIntegralSum newTeacherIntegralSum = new TeacherIntegralSum();
			newTeacherIntegralSum.setTeacherid(jsonObject.getString("teacherId"));
			newTeacherIntegralSum.setIntegralCount(0.0f);
			newTeacherIntegralSum.setStatus(ConstantUtil.TEACHER_INTEGRAL_STATUS_NORMAL);
			newTeacherIntegralSum.setCreateTime(new Date());
			resultType = teacherIntegralSumService.insert(newTeacherIntegralSum);
			if(resultType > 0) {
				teacherIntegralSum = teacherIntegralSumService.getTeacherIntegralSum(jsonObject.getString("teacherId"));
				TeacherIntegral teacherIntegral = new TeacherIntegral();
				teacherIntegral.setTeacherIntegralId(UUIDUtil.getUUIDPrimary());
				teacherIntegral.setTeacherid(jsonObject.getString("teacherId"));
				teacherIntegral.setIntegralConductName(integralConduct.getIntegralConductName());
				teacherIntegral.setIntegralConductValue(jsonObject.getFloat("integralConductId"));
				teacherIntegral.setIntegralConductDesc(integralConduct.getIntegralConductDesc());
				teacherIntegral.setIntegralConductType(integralConduct.getIntegralConductType());
				teacherIntegral.setCreateTime(new Date());
				resultType = teacherIntegralDao.insert(teacherIntegral);
				if(resultType > 0) {
					UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo = new UpdateTeacherIntegralSumVo();
					updateTeacherIntegralSumVo.setTeacherid(teacherIntegralSum.getTeacherid());
					updateTeacherIntegralSumVo.setOldIntegralCount(teacherIntegralSum.getIntegralCount());
					if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_SUB) {
						updateTeacherIntegralSumVo.setUpdateIntegralValue(-jsonObject.getFloat("integralConductId"));
					}else if(integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_ADD || integralConduct.getIntegralConductType() == ConstantUtil.INTEGRAL_CONDUCT_TYPE_REWARD) {
						updateTeacherIntegralSumVo.setUpdateIntegralValue(+jsonObject.getFloat("integralConductId"));
					}
					resultType = teacherIntegralSumService.updateTeacherIntegralSum(updateTeacherIntegralSumVo);
				}
			}
		}
		return resultType;
	
	}

}
