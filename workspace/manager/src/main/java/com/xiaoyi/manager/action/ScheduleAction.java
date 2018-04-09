package com.xiaoyi.manager.action;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.manager.service.IScheduleService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

/**
 * 4.	预约管理
 * @author dengzhihua
 *
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleAction {
	
	@Autowired
	private IScheduleService scheduleService;
	
	@RequestMapping(value="/addSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject addSchedule(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = scheduleService.addSchedule(reqData);
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/deleteSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject deleteSchedule(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = scheduleService.deleteSchedule(reqData.getString("scheduleId"));
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/updateSchedule",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject updateSchedule(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			int rt = scheduleService.updateSchedule(reqData);
			if(rt>=0){
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/getScheduleList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getScheduleList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		
		try {			
			List<JSONObject> datas = scheduleService.getScheduleList(reqData);
			Collections.sort(datas, new Comparator<JSONObject>() {

				@Override
				public int compare(JSONObject o1, JSONObject o2) {
					if(null!=o1 && null!=o2 
							&& o1.getString("createTime")!=null
							&& o2.getString("createTime")!=null){
						//return o1.getString("createTime")>o2.getString("createTime")?0:1;
						return o2.getString("createTime").compareTo(o1.getString("createTime"));
					}
					return 0;
				}
			});
			
			if(!CollectionUtils.isEmpty(datas)){
				for(JSONObject data : datas){
					//String dateTime = data.getString("createTime");					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");					
					data.put("createTime", sdf.format(data.get("createTime")));
					
					Integer lessonType = data.getInteger("lessonType");
					if(null!=lessonType){
						LessonType type = LessonType.convert(lessonType);
						if(null!=type){
							StringBuffer sb = new StringBuffer();
							sb.append(type.getLevelName(true))
								.append(type.getGradeName(true))
								.append(type.getCourseName(false));
							data.put("lessonName", sb.toString());					
						}
					}
				}
			}
			result.put("data", datas);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	//
	private JSONObject setReturnMsg(JSONObject result,RtConstants rtCode){
		result.put("code", rtCode.getCode());
		result.put("msg", rtCode.toString());
		return result;
	}
}