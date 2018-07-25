package com.xiaoyi.common.action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

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
import com.xiaoyi.common.service.ICommonDataService;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.WXConstants;
import com.xiaoyi.common.utils.WechatMessageUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Education;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.common.utils.ConstantUtil.Sex;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping("/common")
public class ConstantCommonAction {
	
	@Resource
	private IWechatService wechatService;
	
	@Resource
	private ICommonDataService commonDataService;
	
	private static Logger logger = Logger.getLogger(WechatIdentityAction.class);
	
	@RequestMapping(value="/getConstantMap",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getLessonTypeMap(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		    	    	
    	try {
    		List<JSONObject> datas = new ArrayList<JSONObject>();
    		switch(reqData.getString("key")) {
    		case "sex":
    			for(Sex sex : Sex.values()) {
    				JSONObject data = new JSONObject();
    				data.put(sex.toString(),sex.getValue());
    				datas.add(data);
    			}  			
    			break;
    		case "education":
    			for(Education education : Education.values()) {
    				JSONObject data = new JSONObject();
    				data.put(education.toString(),education.getValue());
    				datas.add(data);
    			}    			
    			break;
    		case "teachingLevel":
    			for(TeachingLevel teachingLevel : TeachingLevel.values()) {
    				JSONObject data = new JSONObject();
    				data.put(teachingLevel.toString(), teachingLevel.getValue());
    				datas.add(data);
    			}
    			break;
    		case "lessonType":
    			for(LessonType lessonType : LessonType.values()) {
    				JSONObject data = new JSONObject();
    				data.put(lessonType.toString(), lessonType.getValue());
    				datas.add(data);
    			}
    			break;
    		case "grade":
    			for(Grade grade : Grade.values()) {
    				JSONObject data = new JSONObject();
    				if(null!=grade.toString()){
    					data.put(grade.toString(), grade.getValue());
    					datas.add(data);
    				}
    			}
    			break;
    		case "course":
    			for(Course course : Course.values()) {
    				JSONObject data = new JSONObject();
    				data.put(course.toString(), course.getValue());
    				datas.add(data);
    			}
    			break;
    		case "level":
    			for(Level level: Level.values()) {
    				JSONObject data = new JSONObject();
    				data.put(level.toString(), level.getValue());
    				datas.add(data);
    			}
    			break;
    		case "full_grade":
    			for(Grade grade : Grade.values()) {
    				JSONObject data = new JSONObject();
    				if(grade.getFullGradeName()!=null){
    					data.put(grade.getFullGradeName(), grade.getValue());
    					datas.add(data);
    				}
    			}
    		}
    		
    		if(!CollectionUtils.isEmpty(datas)) {
    			rtCode = RtConstants.SUCCESS;
    		}
    		result.put("data", datas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode.getCode(), rtCode.toString());		
		return result;
	}

	@RequestMapping(value="/getCoursePrice",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getCoursePrice(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		    	    	
    	try {
    		List<JSONObject> datas = commonDataService.getCoursePrices(reqData);
    		

					// TODO Auto-generated method stub
				}
			});
    		if(null!=datas) {
    			rtCode = RtConstants.SUCCESS;
    		}
    		result.put("data", datas);
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
