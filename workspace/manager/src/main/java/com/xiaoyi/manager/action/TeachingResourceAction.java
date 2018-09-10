package com.xiaoyi.manager.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Education;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.manager.service.ITeachingResourceService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 3.	师资管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/teaching")
public class TeachingResourceAction {
	@Resource
	private ITeachingResourceService tResourceService;
	
	@RequestMapping(value="/addTeacher",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject addTeacher(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> teachers = new ArrayList<JSONObject>();
			teachers.add(reqData);
			
			int addedColums = tResourceService.addTeachingTeacher(teachers);
			switch(addedColums){
			case 0:
				result.put("code", -1);
				result.put("msg", "插入失败,号码已重复！");
				return result;			
			}
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/getTeachingList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getTeachingList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> teachings = tResourceService.queryTeachingList(reqData);
			
			if(!CollectionUtils.isEmpty(teachings)) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
				for(JSONObject teaching : teachings) {
					Object regDate = teaching.get("regDate");
					if(null!=regDate) {
						teaching.put("regDate", format.format(regDate));
					}
				}
			}
			result.put("data", teachings);
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/getTeachingTeachers",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getTeachingTeachers(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			reqData.put("gradeId", reqData.get("graduation"));
			List<JSONObject> teachers = tResourceService.queryTeacherList(reqData);
			
			if(!CollectionUtils.isEmpty(teachers)) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
				for(JSONObject teaching : teachers) {
					Object regDate = teaching.get("regDate");
					if(null!=regDate) {
						teaching.put("regDate", format.format(regDate));
					}
					teaching.put("graduation", teaching.get("gradeId"));
					
					//转换擅长科目名称Course.BIO.toString();
					String goodAt = teaching.getString("goodAt");
					if(!StringUtils.isEmpty(goodAt)){
						String[] subjectIds = goodAt.split(",");
						if(null!=subjectIds && subjectIds.length>0){
							StringBuffer goodAtName = new StringBuffer();
							next:
							for(String subjectId : subjectIds){
								for(Course c: Course.values()){
									try {
										if(c.getValue() == Integer.parseInt(subjectId)){
											goodAtName.append(c.toString()+",");																				
											continue next;
										}										
									} catch (Exception e) {	//前端传递的非数字
										goodAtName.append(subjectId + ",");																				
										continue next;
									}
								}
							}
							if(goodAtName.length()>0){
								teaching.put("goodAtName", goodAtName.subSequence(0, goodAtName.length()-1));
							}
						}
					}
					
					//转换学历 -> 名称
					Integer education = teaching.getInteger("education");
					if(null!=education) {
						for(Education value : Education.values()) {
							if(education==value.getValue()) {
								teaching.put("educationId", education);
								teaching.put("education", value.toString());
								break;
							}
						}
					}
					
					//转换老师等级 -> 名称
					Integer teachingLevel = teaching.getInteger("teachingLevel");
					if(null!=teachingLevel) {
						for(TeachingLevel level : TeachingLevel.values()) {
							if(teachingLevel==level.getValue()) {
								teaching.put("teachingLevel", level.toString());
								break;
							}
						}
					}
					
				}
			}
			result.put("data", teachers);
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/operateLessons",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject frozenLessons(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = tResourceService.operateTeacherLessons(reqData);
			if(rt==0) {
				result.put("code", 0);
				result.put("msg", "数字输入有误！");
				return result;
			}
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/deleteTeachingTeacher",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject deleteTeachingTeacher(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			tResourceService.deleteTeachingTeacher(reqData.getString("teacherId"));
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	
	@RequestMapping(value="/updateTeachingTeachers",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject updateTeachingTeachers(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			if(0<=tResourceService.updateTeachingTeacher(reqData)){				
				rtCode = RtConstants.SUCCESS;			
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	/**
	 * 查询教师简历
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getTeacherIntroduce",method =RequestMethod.POST)
	@ResponseBody
	public JSONObject getTeacherIntroduce(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {
			JSONObject data = tResourceService.getTeacherIntroduce(reqData);
			if(null != data){	
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;			
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	@RequestMapping(value = "/getTeacherTreaty" , method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getTeacherTreaty(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = tResourceService.getTeacherTreaty(reqData);
			if(null != data){	
				result.put("data", data);
				rtCode = RtConstants.SUCCESS;			
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	///
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}
