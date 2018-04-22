package com.xiaoyi.common.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;


public interface ICommonImportService {
	 boolean importTeacherFromExcel(File importExcel);
}
