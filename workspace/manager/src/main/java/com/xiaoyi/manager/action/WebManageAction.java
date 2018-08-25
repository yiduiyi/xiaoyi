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

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.IWebManageService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 1.	网站管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/web")
public class WebManageAction {
	@Resource
	private IWebManageService webManageService;
	
	@RequestMapping(value="/getStarMembers",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getStarMembers(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> datas = webManageService.queryStarMembers();
			
			result.put("data", datas);
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/setStarMember",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject setStarMember(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			webManageService.addStarMember(reqData);
			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}


	@RequestMapping(value="/removeStarMember",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject removeStarMember(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			webManageService.deleteStarMember(reqData.getString("memberId"));
						
			rtCode = RtConstants.SUCCESS;			
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
