package com.xiaoyi.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.ICommonDataService;


@Service("commonDataService")
public class CommonServiceImpl implements ICommonDataService {

	@Override
	public List<JSONObject> getCoursePrices(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}
    /*private static Logger logger = Logger.getLogger(CommonServiceImpl.class);

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
						gradeLessonsMap.put("gradeName", lessonType.getGradename()gradeIdNameMap.get(Math.abs(levelGrade%10)));
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
					
					//排序
					JSONObject gradeLessonMap = gradeCoursesMap.get(gradeId);
					List<JSONObject> sortList = (List<JSONObject>)gradeLessonMap.get("sortlist");
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

*/
}
