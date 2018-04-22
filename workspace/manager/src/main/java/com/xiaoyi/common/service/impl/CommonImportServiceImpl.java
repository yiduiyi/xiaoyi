package com.xiaoyi.common.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.ICommonDataService;
import com.xiaoyi.common.service.ICommonImportService;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.manager.dao.ILessonTypeDao;
import com.xiaoyi.manager.domain.LessonType;


@Service("commonImportService")
public class CommonImportServiceImpl implements ICommonImportService {
    private static Logger logger = Logger.getLogger(CommonImportServiceImpl.class);

	@Override
	public boolean importTeacherFromExcel(File importExcel) {
		// TODO Auto-generated method stub
		try {
			//List<Object> dataList = ReadExcleUtils.readExcel(file, new YsdwAnimalExcel(), rowStart, cellStrart);  
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return false;
	}

   
}
