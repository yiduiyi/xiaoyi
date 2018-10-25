package com.xiaoyi.manager.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaoyi.manager.service.IAccountManagerService;

@Controller
@RequestMapping("/accountManager")
public class AccountManagerAction {

	@Resource
	private IAccountManagerService accountManagerService;
}
