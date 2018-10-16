package com.xiaoyi.common.service.impl;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xiaoyi.common.service.ICommonImportService;


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
