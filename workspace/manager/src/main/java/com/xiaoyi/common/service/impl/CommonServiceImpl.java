package com.xiaoyi.common.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.service.ICommonDataService;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
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
						if(lessonType.getTeachingWay()==3){
							lesson.put("daulCourseCount", lessonType.getDaulCourseCount());
						}
						
						sortlist.add(lesson);
					}
					
				}
				List<JSONObject>datas = new ArrayList<JSONObject>();							
				
				//排序
				//TreeSet<Integer> sortedKeys = new TreeSet<Integer>(gradeCoursesMap.keySet());			
				Integer[] sortedGrade = new Integer[]{33,32,31,23,22,21,11,16};
				for(Integer gradeId : sortedGrade) {
					if(!gradeCoursesMap.containsKey(gradeId)) {
						gradeId *=-1;
					}
					
					//排序
					JSONObject gradeLessonMap = gradeCoursesMap.get(gradeId);
					if(gradeLessonMap==null){
						continue;
					}
					List<JSONObject> sortList = (List<JSONObject>)gradeLessonMap.get("sortlist");
					if(sortList == null){
						continue;
					}
					Collections.sort(sortList, new Comparator<JSONObject>() {

						@Override
						public int compare(JSONObject arg0, JSONObject arg1) {
							// TODO Auto-generated method stub
							return arg1.getIntValue("courseCnt") - arg0.getIntValue("courseCnt");
						}
					});
					gradeLessonMap.put("sortlist", sortList);
					
					datas.add(gradeLessonMap);
				}
				
				return datas;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return null;
	}

	@Override
	public List<JSONObject> getDaulCoursePrice(Map<String, Object> params) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			params.put("teachingWay", "5");
			logger.info("params:"+params);
			List<LessonType>lessonTypeList = lessonTypeDao.selectByParams(params);
			Map<Integer,List<JSONObject>> levelCourseListMap = new HashMap<Integer, List<JSONObject>>();
			Map<Integer,String> gradeLevelIdNameMap = new HashMap<Integer, String>();
			if(!CollectionUtils.isEmpty(lessonTypeList)) {
				
				
				for(LessonType lt : lessonTypeList){
					JSONObject data = new JSONObject();
					
					//获取level名称
					int gradeLevel = -1;
					String gradeLevelName = "";
					for(Level level : Level.values()){
						if(level.getValue() == lt.getGradeid()/10){
							gradeLevel = level.getValue();
							gradeLevelName = level.toString();														
							gradeLevelIdNameMap.put(gradeLevel, gradeLevelName);
							
							//补充grade
							data.put("gradeId", lt.getGradeid());
							for(Grade g : Grade.values()){
								if(g.getValue() == lt.getGradeid()){
									data.put("gradeName", g.getFullGradeName());
									break;
								}
							}
							break;
						}
					}
					
					//补全 semaster
					data.put("semaster", lt.getSemaster());
					for(Semaster s : Semaster.values()){
						if(s.getValue() == lt.getSemaster()){
							data.put("semasterName", "同步" + s.toString() + "册");
							break;
						}
					}
					
					//补全课程价格体系
					data.put("videoCourseType", "1");	//同步课程
					data.put("lessonId", lt.getLessonId());
					data.put("lessonType", lt.getLessontype());
					data.put("price", lt.getLessonprice());
					data.put("courseCnt", lt.getDaulCourseCount());
					data.put("discountPrice", lt.getDiscountprice());
					
					//加入列表
					List<JSONObject> courseList = levelCourseListMap.get(gradeLevel);
					if(null == courseList){
						courseList = new ArrayList<JSONObject>();
						levelCourseListMap.put(gradeLevel, courseList);
					}					
					
					courseList.add(data);									
				}
			}
			
			//组装数据
			for(Integer level : levelCourseListMap.keySet()){
				JSONObject data = new JSONObject();
				data.put("gradeLevel", level);
				data.put("gradeLevelName", gradeLevelIdNameMap.get(level));
				
				//排序
				List<JSONObject> sortList = levelCourseListMap.get(level);
				Collections.sort(sortList, new Comparator<JSONObject>() {

					@Override
					public int compare(JSONObject arg0, JSONObject arg1) {
						// TODO Auto-generated method stub
						return arg1.getIntValue("courseCnt") - arg0.getIntValue("courseCnt");
					}
				});
				
				data.put("sortlist", sortList);
				
				datas.add(data);		
			}
			
		}catch (Exception e) {
			logger.error("获取双师同步视频课程失败！");
			throw new CommonRunException(-1, "获取双师同步视频课程失败！");
		}
		
		return datas;
	}


}
