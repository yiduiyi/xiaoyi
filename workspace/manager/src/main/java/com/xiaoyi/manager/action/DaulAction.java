package com.xiaoyi.manager.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.XiaoeSDK;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.common.utils.ConstantUtil.VideoCourseType;
import com.xiaoyi.manager.service.IVideoCourseService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Controller
@RequestMapping("/daul")
public class DaulAction {
	@Resource
	private IVideoCourseService videoCourseService;
	
	@RequestMapping(value="/getDaulLessonList",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getDaulLessonList(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = videoCourseService.getDaulLessonList(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	@RequestMapping(value="/getDaulQueryParams",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getDaulQueryParams(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			JSONObject datas = new JSONObject();
			
			//学期
			JSONArray semasterList = new JSONArray();
			for(Semaster s : Semaster.values()){
				JSONObject semaster = new JSONObject();
				if(s.getValue()>2){
					continue;
				}
				
				semaster.put("semaster", s.getValue());
				semaster.put("semasterName", s.toString());
				
				semasterList.add(semaster);
			}
			datas.put("semasterList", semasterList);
			
			//年级
			JSONArray gradeList = new JSONArray();
			for(Grade g : Grade.values()){
				JSONObject grade = new JSONObject();
				if(g.getValue()<10){
					continue;
				}
				grade.put("gradeName", g.getFullGradeName());
				grade.put("gradeId", g.getValue());
				
				gradeList.add(grade);
			}
			datas.put("gradeList", gradeList);
			
			//双师视频课程类型
			JSONArray videoCourseTypeList = new JSONArray();
			for(VideoCourseType v : VideoCourseType.values()){
				JSONObject videoCourseType = new JSONObject();
				/*if(v.getValue()>10){
					continue;
				}*/
				
				videoCourseType.put("videoCourseType", v.getValue());
				videoCourseType.put("videoCourseTypeName", v.toString());
				
				videoCourseTypeList.add(videoCourseType);
			}
			datas.put("videoCourseTypeList", videoCourseTypeList);
			
			//科目
			JSONArray courseList = new JSONArray();
			for(Course c : Course.values()){
				JSONObject course = new JSONObject();
				course.put("courseId", c.getValue());
				course.put("courseName", c.toString());
				
				courseList.add(course);
			}
			datas.put("courseList", courseList);
			
			result.put("data", datas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	//
	@RequestMapping(value="/insertDaulLesson",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject insertDaulLesson(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(videoCourseService.insertDaulLesson(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	@RequestMapping(value="/updateDaulLesson",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateDaulLesson(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(videoCourseService.updateDaulLesson(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	/**
	 * 开通双师权限（衡阳版）
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/setDaulPrivilege",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject setDaulPrivilege(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		//需和前端沟通,将union_id参数回传
		String unionId = request.getParameter("unionId");
		System.out.println("unionId:"+unionId);
		
		try {
			videoCourseService.setDaulPrivilege(reqData);
			
			//查询是否存在
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	/**
	 * 获取已购买但未开通双师权限的课程（衡阳版）
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value="/getAvailableDaulCourses",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getAvailableDaulCourses(HttpServletRequest request,HttpServletResponse response,@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		//需和前端沟通,将union_id参数回传
		String unionId = request.getParameter("unionId");
		System.out.println("unionId:"+unionId);
		
		try {
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return result;
	}
	
	///
	private JSONObject setReturnMsg(JSONObject result, int code, String msg) {
		result.put("code", code);
		result.put("msg", msg);
		return result;
	}
}
