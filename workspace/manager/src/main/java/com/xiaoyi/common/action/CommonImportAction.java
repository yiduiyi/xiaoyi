package com.xiaoyi.common.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/common/import")
public class CommonImportAction {

	private static Logger logger = Logger.getLogger(CommonImportAction.class);
	
	@RequestMapping("importTeacher.do")
	public JSONObject importTeacher(@RequestParam MultipartFile uploadfile, 
            HttpServletRequest request, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		
		
		setReturnMsg(result, 0, "导入成功！");
		return result;
	}
	
	
	private File importExcel(@RequestParam MultipartFile uploadfile, 
	            HttpServletRequest request, HttpServletResponse response) {
	        String fileName = uploadfile.getOriginalFilename();
	        if (StringUtils.isEmpty(fileName)) {
	            System.out.println("未上传文件名为空");
	        }
	        String tempPath = request.getSession().getServletContext().getRealPath("/")
	                + "upload";
	        File dir = new File(tempPath);    
	        if (!tempPath.endsWith(File.separator)) {
	            tempPath = tempPath + File.separator;
	        }
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }
	        System.out.println(tempPath);
	        //制作路径
	        String newFile = tempPath + fileName;
	        File file = new File(newFile);        
	        try {
	            FileCopyUtils.copy(uploadfile.getBytes(), file);
	            //导入excel中的内容
	           // this.parseDataItem(newFile);
	            System.out.println("成功导入");
	            return file;
	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        } finally {
	            try {
	                FileUtils.forceDelete(file);
	            } catch (IOException e) {
	                e.printStackTrace();
	                return null;
	            }
	        }	        
	    }

	public final boolean parseDataItem(String file) {
		return false;
		// return ysdwAnimalService.importExcel(file);
	}

	private JSONObject setReturnMsg(JSONObject result, int code, String rtString) {
		result.put("code", code);
		result.put("msg", rtString);
		return result;
	}
}
