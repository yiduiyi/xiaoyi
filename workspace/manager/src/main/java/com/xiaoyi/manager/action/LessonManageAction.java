package com.xiaoyi.manager.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.ILessonManageServer;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 6. 课时管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/lesson")
public class LessonManageAction {
	@Resource
	private ILessonManageServer lessonManageService;
	
	@RequestMapping(value="/getLessonPackages",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getStarMembers(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> datas = lessonManageService.getLessonTypeGroups();
			
			result.put("data", datas);
			if(!CollectionUtils.isEmpty(datas)){
				rtCode = RtConstants.SUCCESS;		
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/updateLessonPackage",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject updateLessonPackage(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = lessonManageService.updateLessonType(reqData);
						
			if(rt >= 0){
				rtCode = RtConstants.SUCCESS;		
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/deleteLessonPackage",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject deleteLessonPackage(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			String lessonId = reqData.getString("lessonId");
			int rt = lessonManageService.deleteLessonPackage(lessonId);
						
			if(rt >= 0){
				rtCode = RtConstants.SUCCESS;		
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	
	@RequestMapping(value="/getOrderList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getOrderList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> datas = lessonManageService.queryParentOrders();
			
			result.put("datas", datas);
			if(!CollectionUtils.isEmpty(datas)){
				rtCode = RtConstants.SUCCESS;		
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/updateParentOrder",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject updateParentOrder(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;


		try {			
			int rt = lessonManageService.updateParentOrder(reqData);
						
			if(rt >= 0){
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
