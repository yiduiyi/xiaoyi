package com.xiaoyi.common.action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.WXConstants;
import com.xiaoyi.common.utils.WechatMessageUtil;
import com.xiaoyi.common.utils.ConstantUtil.Education;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.common.utils.ConstantUtil.Sex;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/common")
public class ConstantCommonAction {
	
	@Resource
	private IWechatService wechatService;
	
	private static Logger logger = Logger.getLogger(WechatAction.class);
	
	@RequestMapping(value="/getConstantMap",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getLessonTypeMap(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		    	    	
    	try {
    		JSONObject data = new JSONObject();
    		switch(reqData.getString("key")) {
    		case "sex":
    			for(Sex sex : Sex.values()) {
    				data.put(sex.toString(),sex.getValue());
    			}  			
    			break;
    		case "education":
    			for(Education education : Education.values()) {
    				data.put(education.toString(),education.getValue());
    			}    			
    			break;
    		case "teachingLevel":
    			for(TeachingLevel teachingLevel : TeachingLevel.values()) {
    				data.put(teachingLevel.toString(), teachingLevel.getValue());
    			}
    			break;
    		case "lessonType":
    			for(LessonType lessonType : LessonType.values()) {
    				data.put(lessonType.toString(), lessonType.getValue());
    			}
    			break;
    		case "grade":
    			for(Grade grade : Grade.values()) {
    				result.put(grade.toString(), grade.getValue());
    			}
    			break;
    		}
    		if(!CollectionUtils.isEmpty(data)) {
    			rtCode = RtConstants.SUCCESS;
    		}
    		result.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}

	
	private JSONObject setReturnMsg(JSONObject result,int code,String rtString){
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
