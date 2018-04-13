package com.xiaoyi.teacher.action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.service.ITeachingRecordService;

@CrossOrigin
@Controller
@RequestMapping("/teacher/trade")
public class LessonTradeAction {
	@Resource
	private ITeachingRecordService recordService;
	
	
	@RequestMapping(value="/showTRecordsSum",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject showTRecordsSum(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
				
		try {
			result.put("data",  recordService.getTRecordSum(reqData));			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}
	
	@RequestMapping(value="/showTRecords",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject showTRecords(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
				
		try {
			List<JSONObject> data = recordService.getRecordList(reqData);
			if(null!=data) {
				SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd");
				for(JSONObject record : data) {
					Integer gradeId = record.getInteger("gradeId");
					record.put("purchaseTime", myFmt.format(record.get("purchaseTime")));
					
					for(Level level : Level.values()) {
						if(gradeId==level.getValue()) {
							record.put("gradeName", level.toString());
							break;
						}
					}
				}
			}
			
			result.put("data",  data);			
			rtCode = RtConstants.SUCCESS;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/submitTeaching",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject submitTeaching(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
			
		try {
			//result.put("data",  recordService.getRecordList(reqData));			
			switch(recordService.insertTeachingRecords(reqData)){
			case -3:
				result.put("msg", "查询数据库出错！");
				result.put("code", -1);
				return result;
			case -2:
				result.put("msg", "当月已提现,请勿重复提现！");
				result.put("code", -1);
				return result;				
			case -1:
				result.put("msg", "参数错误！");
				result.put("code", -1);
				break;
			case 0:
				default:
					rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		setReturnMsg(result, rtCode);		
		return result;
	}

	@RequestMapping(value="/showWithdrawRecords",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject showWithdrawRecords(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
				
		try {
			String queryYear = reqData.getString("year");
			String queryMon = reqData.getString("month");
			if(null!=queryYear && null!=queryMon){
				reqData.put("applyDate", queryYear+queryMon);
			}
			List<JSONObject> datas = recordService.queryWithdrawRecords(reqData);
			if(null!=datas){
				rtCode = RtConstants.SUCCESS;
				result.put("data", datas);
			}
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
