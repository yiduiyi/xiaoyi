package com.xiaoyi.manager.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.service.IAccountService;

@Controller
@RequestMapping("/account")
public class AccountAction {
	@Resource
	private IAccountService accountService;
	
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

    
}
