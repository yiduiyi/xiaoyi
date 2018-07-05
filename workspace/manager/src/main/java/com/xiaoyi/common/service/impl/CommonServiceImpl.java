package com.xiaoyi.common.service.impl;

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
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.manager.dao.ILessonTypeDao;
import com.xiaoyi.manager.domain.LessonType;


@Service("commonDataService")
public class CommonServiceImpl implements ICommonDataService {
    private static Logger logger = Logger.getLogger(CommonServiceImpl.class);

    @Resource
    ILessonTypeDao lessonTypeDao;
    
	@Override
	public List<JSONObject> getCoursePrices(Map<String, Object> params) {
		try {
			logger.info("params:"+params);
			List<LessonType>lessonTypeList = lessonTypeDao.selectByParams(params);
			
			if(!CollectionUtils.isEmpty(lessonTypeList)) {
				//年级Id-name映射
				Map<Integer,String> gradeIdNameMap = new HashMap<Integer,String>();
				for(Grade grade : Grade.values()) {
					gradeIdNameMap.put(grade.getValue(), grade.toString());
				}
				
				//List<JSONObject> datas = null;
				Map<Integer,JSONObject> gradeCoursesMap = new HashMap<Integer,JSONObject>();
				for(LessonType lessonType : lessonTypeList) {
					if(null!=lessonType && lessonType.getLessontype()!=null) {
						//等级+年级
						Integer levelGrade = lessonType.getLessontype()/10;
						if(levelGrade>40){
							levelGrade -= 30;
						}
						JSONObject gradeLessonsMap = null;
						if(gradeCoursesMap.containsKey(levelGrade)) {
							gradeLessonsMap = gradeCoursesMap.get(levelGrade);
						}else {
							gradeLessonsMap = new JSONObject();
							gradeCoursesMap.put(levelGrade, gradeLessonsMap);
						}
						
						// new JSONObject();
						gradeLessonsMap.put("grade", levelGrade);
						gradeLessonsMap.put("gradeName", lessonType.getGradename()/*gradeIdNameMap.get(Math.abs(levelGrade%10))*/);
						JSONArray sortlist = gradeLessonsMap.getJSONArray("sortlist");
						if(null==sortlist) {
							sortlist = new JSONArray();
							gradeLessonsMap.put("sortlist", sortlist);
						}
						
						JSONObject lesson = new JSONObject();
						lesson.put("lessonType", lessonType.getLessontype());
						lesson.put("lessonId", lessonType.getLessonId());
						lesson.put("price", lessonType.getLessonprice());
						lesson.put("discountPrice", lessonType.getDiscountprice());
						lesson.put("courseCnt", lessonType.getCoursecnt());
						lesson.put("isholiday", lessonType.getIsholiday());
						lesson.put("hasBook", (lessonType.getNeedbook()==null || lessonType.getNeedbook())?1:0);
						
						sortlist.add(lesson);
					}
					
				}
				List<JSONObject>datas = new ArrayList<JSONObject>();							
				
				//排序
				//TreeSet<Integer> sortedKeys = new TreeSet<Integer>(gradeCoursesMap.keySet());			
				Integer[] sortedGrade = new Integer[]{33,31,23,21,11,16};
				for(Integer gradeId : sortedGrade) {
					if(!gradeCoursesMap.containsKey(gradeId)) {
						gradeId *=-1;
					}
					datas.add(gradeCoursesMap.get(gradeId));
				}
				
				return datas;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return null;
	}


}
