package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.manager.dao.IAccountDao;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.dao.ITradeComplainsDao;
import com.xiaoyi.manager.dao.order.IOrderManageDao;
import com.xiaoyi.manager.domain.Account;
import com.xiaoyi.manager.domain.TradeComplains;
import com.xiaoyi.manager.service.IAccountService;
import com.xiaoyi.manager.service.ITeachingSuperviseService;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("superviseService")
public class TeachingSuperviseServiceImpl implements ITeachingSuperviseService{
	

}
