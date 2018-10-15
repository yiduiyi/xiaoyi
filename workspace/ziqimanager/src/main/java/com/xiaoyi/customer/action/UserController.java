package com.xiaoyi.customer.action;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaoyi.customer.service.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Resource
	private IUserService userService;
}
