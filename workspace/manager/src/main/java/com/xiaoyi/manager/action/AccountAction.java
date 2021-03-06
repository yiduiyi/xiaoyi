package com.xiaoyi.manager.action;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.service.IAccountService;

@Controller
@RequestMapping("/order")
public class AccountAction {
	@Resource
	private IAccountService accountService;
	
	@RequestMapping(value="/sendPurchaseLink",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject sendPurchaseLink(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		String msg = "发送失败！";
		int code = -1;
		Integer type = reqData.getInteger("type");
		
		int sendCount = -1;
		switch (type) {
		case 1:	//一键催费
			sendCount = accountService.sendMsgsToSelectedCustom(reqData);
			break;
		case 2:	//发送补缴链接
			sendCount = accountService.sendPurchaseLink(reqData);
			break;
		}
		
		if(sendCount>=0){
			code = 0;
			msg = "发送成功！";
		}
		return setReturnMsg(result, code, msg);		
	}
	
	@RequestMapping(value="/getComplainList",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getComplainList(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		String msg = "获取投诉列表失败！";
		int code = -1;
		try {
			if(StringUtils.isEmpty(reqData.getString("teacherName"))){
				reqData.remove("teacherName");
			}
			List<JSONObject> datas = accountService.getComplainList(reqData);
			if(CollectionUtils.isNotEmpty(datas)){
				//if(datas.size()>0){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					for(JSONObject data : datas){
						data.put("complain_time", sdf.format(data.getString("complain_time")));
					}						
				} catch (Exception e) {
					e.printStackTrace();
				}
				//}
				
				result.put("data", datas);
				
				code = 0;
				msg = "获取投诉列表成功！";
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return setReturnMsg(result, code, msg);
	}
	
	
	@RequestMapping(value="/showAccountName",method=RequestMethod.POST)
	@ResponseBody
	public  JSONObject getAccountById(HttpServletRequest request
			,HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		Account account =
				accountService.getAccountById(reqData.getString("accountId"));
		result.put("account", account);
		
		return result;
	}
	
	@RequestMapping("/showUser")  
    public String toIndex(HttpServletRequest request,Model model){  
        String userId = request.getParameter("id");  
        Account account = this.accountService.getAccountById(userId);  
        model.addAttribute("user", account);  
        return "index";  
	}

	private JSONObject setReturnMsg(JSONObject result,int code, String msg){
		result.put("code", code);
		result.put("msg", msg);
		return result;
	}
}
