package com.xiaoyi.manager.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.service.IMenuService;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;

@Controller
@RequestMapping(value = "/menu")
public class MenuAction {
	@Resource
	private IMenuService menuService;
	/**
	 * 新增菜单
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/insertMenu", method = RequestMethod.POST)
	public JSONObject insertMenu(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(menuService.insertMenu(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return reqData;
	}
	/**
	 * 更新菜单
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
	public JSONObject updateMenu(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(menuService.updateMenu(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return reqData;
	}
	/**
	 * 删除菜单
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.POST)
	public JSONObject deleteMenu(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			if(menuService.deleteMenu(reqData) > 0) {
				rtCode = RtConstants.SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return reqData;
	}
	/**
	 * 获取菜单列表
	 * @param request
	 * @param response
	 * @param reqData
	 * @return
	 */
	@RequestMapping(value = "/getMenuList", method = RequestMethod.POST)
	public JSONObject getMenuList(HttpServletRequest request, HttpServletResponse response,
			@RequestBody JSONObject reqData) {
		JSONObject result = new JSONObject();
		RtConstants rtCode = RtConstants.FAILED;
		try {
			List<JSONObject> data = menuService.getMenuList(reqData);
			result.put("data", data);
			rtCode = RtConstants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		setReturnMsg(result, rtCode.getCode(), rtCode.name());
		return reqData;
	}
	///
	private JSONObject setReturnMsg(JSONObject result, int code, String msg) {
		result.put("code", code);
		result.put("msg", msg);
		return result;
	}
}
