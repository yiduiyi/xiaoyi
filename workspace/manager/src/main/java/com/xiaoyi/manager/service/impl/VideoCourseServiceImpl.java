package com.xiaoyi.manager.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.XiaoeSDK;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.common.utils.ConstantUtil.VideoCourseType;
import com.xiaoyi.custom.domain.DaulVideoOrder;
import com.xiaoyi.manager.dao.IVideoCourseDao;
import com.xiaoyi.manager.domain.VideoCourse;
import com.xiaoyi.manager.service.IVideoCourseService;
import com.xiaoyi.wechat.utils.UUIDUtil;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("videoCourseService")
public class VideoCourseServiceImpl implements IVideoCourseService {
	@Resource
	private IVideoCourseDao videoCourseDao;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<JSONObject> getDaulLessonList(JSONObject reqData) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			List<VideoCourse> list = videoCourseDao.selectVideoCourseListByConditions(reqData);// .getDaulLessonList(reqData);
			if (CollectionUtils.isNotEmpty(list)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd hh:mm:ss");
				for (VideoCourse videoCourse : list) {
					JSONObject data = new JSONObject();

					// 过滤专题
					if ("0".equals(videoCourse.getChapterId())) {
						continue;
					}

					data.put("h5VideoLink", videoCourse.getH5VideoLink());
					data.put("videoName", videoCourse.getVideoCourseName());
					data.put("uploadTime", sdf.format(videoCourse.getUploadTime()));

					// 年级
					Short gradeId = videoCourse.getGradeId();
					if (null != gradeId) {
						for (Grade grade : Grade.values()) {
							if (grade.getValue() == gradeId) {
								data.put("gradeId", gradeId);
								data.put("gradeName", grade.getFullGradeName());
								break;
							}
						}
					}

					// 科目
					Short courseId = videoCourse.getCourseId();// jsonObject.getInteger("courseId");
					if (null != courseId) {
						for (Course course : Course.values()) {
							if (course.getValue() == courseId) {
								data.put("courseId", courseId);
								data.put("courseName", course.toString());
								break;
							}
						}
					}

					// 学期
					Byte semasterId = videoCourse.getSemaster();// jsonObject.getInteger("semester");
					if (semasterId != null) {
						String semasterName = null;
						for (Semaster s : Semaster.values()) {
							if (s.getValue() == semasterId) {
								data.put("semester", semasterId);
								semasterName = s.toString();
								break;
							}
						}
						data.put("semasterName", semasterName);
					}

					// 同步课程视频类型
					Byte videoCourseType = videoCourse.getVideoCourseType();// jsonObject.getInteger("videoCourseType");
					if (videoCourseType != null) {
						for (VideoCourseType videoCourseTypeValue : VideoCourseType.values()) {
							if (videoCourseTypeValue.getValue() == videoCourseType) {
								data.put("videoCourseType", videoCourseType);
								data.put("videoCourseTypeName", videoCourseTypeValue.toString());
								break;
							}
						}
					}
					datas.add(data);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询双师课程列表失败！");
			throw new CommonRunException(-1, "查询双师课程列表失败！");
		}

		return datas;
	}

	@Override
	public int insertDaulLesson(JSONObject reqData) {
		VideoCourse videoCourse = new VideoCourse();
		videoCourse.setVideoCourseId(UUIDUtil.getUUIDPrimary());
		videoCourse.setVideoCourseName(reqData.getString("videoName"));
		videoCourse.setGradeId(reqData.getShort("gradeId"));
		videoCourse.setCourseId(reqData.getShort("courseId"));
		videoCourse.setSemaster(reqData.getByte("semaster"));
		videoCourse.setH5VideoLink(reqData.getString("h5VideoLink"));
		videoCourse.setVideoCourseType(reqData.getByte("videoCourseType"));
		return videoCourseDao.insertSelective(videoCourse);
	}

	@Override
	public int updateDaulLesson(JSONObject reqData) {
		String videoCourseId = reqData.getString("videoCourseId");
		if (StringUtils.isEmpty(videoCourseId)) {
			return -1;
		}

		VideoCourse videoCourse = new VideoCourse();/// videoCourseDao.selectByPrimaryKey(reqData.getString("videoCourseId"));
		videoCourse.setVideoCourseId(videoCourseId);
		videoCourse.setVideoCourseName(reqData.getString("videoName"));
		videoCourse.setGradeId(reqData.getShort("gradeId"));
		videoCourse.setCourseId(reqData.getShort("courseId"));
		videoCourse.setSemaster(reqData.getByte("semaster"));
		videoCourse.setH5VideoLink(reqData.getString("h5VideoLink"));
		videoCourse.setVideoCourseType(reqData.getByte("videoCourseType"));
		return videoCourseDao.updateByPrimaryKeySelective(videoCourse);
	}

	@Override
	public int setDaulPrivilege(JSONObject reqData) {
		// TODO Auto-generated method stub
		String unionId = reqData.getString("unionId");
		Integer gradeId = reqData.getInteger("gradeId");

		XiaoeSDK sdk = new XiaoeSDK(WeiXinConfig.XIAO_E_TONG_APPID, WeiXinConfig.XIAO_E_TONG_APPSECRET);

		String userId = null;
		// 判断是否已经存在改用户
		org.json.JSONObject userParams = new org.json.JSONObject();
		userParams.put("wx_union_id", unionId);
		logger.info("调用小鹅通SDK 获取用户user_id...");
		org.json.JSONObject getUserInfo = sdk.send("users.getinfo", userParams, 1, "1.0");
		logger.info("调用小鹅通SDK获取用户结果：" + getUserInfo);

		if (getUserInfo != null) {
			org.json.JSONArray userData = getUserInfo.getJSONArray("data");
			if (null != userData && userData.length() > 0) {
				userId = userData.getJSONObject(0).getString("user_id");
			} else { // 小鹅通未生成该用户（调用小鹅通SDK创建用户）
				org.json.JSONObject data = new org.json.JSONObject();

				data.put("wx_union_id", unionId);
				org.json.JSONObject regResult = sdk.send("users.register", data, 1, "1.0");
				if (null != regResult && regResult.getInt("code") == 0) {
					userId = regResult.getJSONObject("data").getString("user_id");
				}
			}

			// 开通视频权限
			if (null != userId) {
				// 获取当前月份 -》计算当前学期（3-9：下，9-3：上）
				Calendar cal = Calendar.getInstance();
				Integer month = cal.get(Calendar.MONTH) + 1;
				int semaster = (month + 3) % 12 >= 6 ? 2 : 1;

				// 查询同步 课堂信息
				JSONObject queryParams = new JSONObject();
				queryParams.put("gradeId", gradeId); // 年级
				queryParams.put("videoCourseType", "1"); // 同步课程
				queryParams.put("courseId", "0"); // 大专栏（学年学期）

				// 高中阶段购买不赠送延伸学期
				if (gradeId > 30 || semaster == 2) {
					queryParams.put("semaster", semaster); // 学期
				}

				List<VideoCourse> videoCourseList = null;
				try {
					videoCourseList = videoCourseDao.selectVideoCourseListByConditions(queryParams);
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("查询视频课程包列表出错！");
					return -1;
				}
				if (semaster == 2 && gradeId < 30) { // 初中阶段额外赠送延伸下班学期视频课程
					// 赠送下个年级的上半学期视频课程
					int stage = gradeId / 10; // 小初高
					int gradeLevel = gradeId % 10; // 1-6
					if (stage == 1) {
						if (gradeLevel == 6) {
							stage++;
						}
					} else if (gradeLevel == 3) {
						stage++;
					}
					if (stage != gradeId / 10) { // 已升级年级
						gradeLevel = 1;
					} else {
						gradeLevel++;
					}
					StringBuffer newGradeId = new StringBuffer();
					newGradeId.append(stage).append(gradeLevel);

					queryParams.put("gradeId", newGradeId.toString());
					queryParams.put("semaster", 1);

					List<VideoCourse> extraVideoCourseList = videoCourseDao
							.selectVideoCourseListByConditions(queryParams);
					if (!CollectionUtils.isEmpty(extraVideoCourseList) && videoCourseList != null) {
						videoCourseList.addAll(extraVideoCourseList);
					}
				}

				// 查询				
				for (VideoCourse videoCourse : videoCourseList) {
					String daulOrderId = UUID.randomUUID().toString();

					// 调用小鹅通SDK同步下单
					logger.info("generated userId: " + userId);
					if (!StringUtils.isEmpty(userId)) {
						// 生成订单
						logger.info("调用小鹅通SdK生成订单...");
						org.json.JSONObject data = new org.json.JSONObject();
						data.put("payment_type", 3); // 2-单笔（单个商品）、3-付费产品包（专栏会员等）,
						// data.put("resource_type", 3);
						// //单笔购买时为必要参数，资源类型：1-图文、2-音频、3-视频、4-直播
						// data.put("resource_id",
						// "p_5bb6e34718b2d_HlWYvm9z");//单笔购买时为必要参数，资源id
						data.put("product_id", videoCourse.getVideoCourseId()); // 购买产品包时为必要参数，产品包id
						data.put("user_id", userId);// 'user_id':'u_asdwjdnjkxkcasjb3847832478',
						data.put("out_order_id", daulOrderId);// 'out_order_id':'order_2017564065'
						org.json.JSONObject orderRs = sdk.send("orders.create", data, 1, "1.0");
						logger.info("返回结果：" + orderRs);

						org.json.JSONObject orderData = orderRs.getJSONObject("data");//
						String orderId = orderData.getString("order_id");

						// 确认订单（修改订单状态为已购买）
						logger.info("调用小鹅通SdK修改订单状态...");
						org.json.JSONObject comfirmOrder = new org.json.JSONObject();
						comfirmOrder.put("order_id", orderId);
						comfirmOrder.put("order_state", "1");
						org.json.JSONObject updateResult = sdk.send("orders.state.update", comfirmOrder, 1, "1.0");
						logger.info("修改结果：" + updateResult);
					}
				}
			}
		}

		return 0;
	}
}