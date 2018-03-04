/*
Navicat MySQL Data Transfer

Source Server         : sq_xiaoyidb
Source Server Version : 50538
Source Host           : mysql.sql141.cdncenter.net:3306
Source Database       : sq_xiaoyidb

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-03-04 10:30:41
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
`accountId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`accountType`  tinyint(3) NULL DEFAULT NULL COMMENT '支付宝、微信等\r\n            暂定（支付宝：0，微信：1）' ,
`accountNumber`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  tinyint(2) NULL DEFAULT NULL COMMENT '0:正常，1：冻结' ,
`totalIncome`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`accountId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='账户表'

;

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
`classID`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gradeId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`schoolId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`className`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`classID`, `gradeId`, `schoolId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
`gradeId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`schoolId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gradeName`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`gradeId`, `schoolId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='年级表'

;

-- ----------------------------
-- Table structure for `lessontrade`
-- ----------------------------
DROP TABLE IF EXISTS `lessontrade`;
CREATE TABLE `lessontrade` (
`lessonTradeId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lessonType`  int(11) NULL DEFAULT NULL ,
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`notes`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  tinyint(2) NULL DEFAULT NULL COMMENT '-1：提现失败\r\n            1：已提交，待家长确认\r\n            2：提现成功\r\n            ' ,
`applyLessons`  float(6,0) NULL DEFAULT NULL ,
`feedback`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`applyTime`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`lessonTradeId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='课时管理（提现交易）表'

;

-- ----------------------------
-- Table structure for `lessontradesum`
-- ----------------------------
DROP TABLE IF EXISTS `lessontradesum`;
CREATE TABLE `lessontradesum` (
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`checkedLessonNum`  float(6,0) NULL DEFAULT NULL COMMENT '实际到帐课时，为老师提现实际到帐的课时和' ,
`withDrawLessonNum`  float(6,0) NULL DEFAULT NULL COMMENT '老师申请提现通过的所有课时和' ,
`frozenLessonNum`  float(6,0) NULL DEFAULT NULL COMMENT ' 冻结：指教员违约违规，需冻结老师课时费，老师不可提取冻结课时费。如教员又教初中又教高中，则优先冻结较高年级的课时，即冻结高中课时\r\n            实际到帐课时=申请提现通过课时 — 累计冻结课时' ,
`totalLessonNum`  float(6,0) NULL DEFAULT NULL COMMENT '历史所有课时数总和（评级标准之一）' ,
`totalIncome`  double NULL DEFAULT NULL ,
PRIMARY KEY (`teacherId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='教师累计提现表（每一次老师提现都更新此表）'

;

-- ----------------------------
-- Table structure for `lessontype`
-- ----------------------------
DROP TABLE IF EXISTS `lessontype`;
CREATE TABLE `lessontype` (
`lessonId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`lessonType`  int(11) NOT NULL COMMENT '正数-学生上门，负数-老师上门\r\n            1:小学(11-16分别表示 小学1-6年级)(111-119可扩展为语数外，政史地，物化生科目代码，即：小学x年级y科目)\r\n            2: 初中（21-23分表表示 初中1-3年级）\r\n            3:高中（31-33分表表示 高中1-3年级）\r\n            ' ,
`courseCnt`  smallint(6) NOT NULL DEFAULT 1 ,
`teachingWay`  tinyint(2) NOT NULL DEFAULT 0 COMMENT '0,学生上门，1：老师上门' ,
`gradeId`  smallint(6) NOT NULL ,
`lessonPrice`  float NULL DEFAULT NULL COMMENT '小学：1-6\r\n            初中：7-9\r\n            高中：10-12' ,
`lessonName`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命名规范（111：小学一年级语文、112：小学一年级数学...）' ,
`gradeName`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`needBook`  tinyint(1) NULL DEFAULT 1 COMMENT '0:不需要，1：需要（默认）' ,
`discountPrice`  float NULL DEFAULT NULL ,
`isholiday`  tinyint(2) NULL DEFAULT 0 ,
`singleCoursePrice`  float NULL DEFAULT NULL ,
PRIMARY KEY (`lessonType`, `courseCnt`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='课时类型'

;

-- ----------------------------
-- Table structure for `order_teaching_r`
-- ----------------------------
DROP TABLE IF EXISTS `order_teaching_r`;
CREATE TABLE `order_teaching_r` (
`teachingId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`orderId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取第一条订单ID' ,
`lessonType`  int(11) NULL DEFAULT NULL ,
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`teachingId`, `orderId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='绑定任课老师的时候添加记录'

;

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
`orderId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lessonType`  int(11) NOT NULL ,
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createTime`  datetime NULL DEFAULT NULL ,
`orderType`  smallint(6) NOT NULL ,
`purchaseNum`  smallint(6) NULL DEFAULT NULL ,
`hasBook`  tinyint(4) NULL DEFAULT NULL ,
`singleLessonPrice`  float NULL DEFAULT NULL ,
`totalLessonPrice`  float NULL DEFAULT NULL ,
`actualPay`  float NULL DEFAULT NULL ,
PRIMARY KEY (`orderId`, `lessonType`, `parentId`, `memberId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单管理'

;

-- ----------------------------
-- Table structure for `ordersum`
-- ----------------------------
DROP TABLE IF EXISTS `ordersum`;
CREATE TABLE `ordersum` (
`orderId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '取第一条订单ID' ,
`lessonType`  int(11) NOT NULL ,
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`purchaseTime`  datetime NOT NULL ,
`totalLessonNum`  smallint(6) NULL DEFAULT NULL ,
`lessonLeftNum`  smallint(6) NULL DEFAULT NULL ,
`teachingIds`  varchar(360) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`orderId`, `lessonType`, `parentId`, `memberId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='订单汇总'

;

-- ----------------------------
-- Table structure for `parent_stu_r`
-- ----------------------------
DROP TABLE IF EXISTS `parent_stu_r`;
CREATE TABLE `parent_stu_r` (
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`memberId`, `parentId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='家属-学生关系表'

;

-- ----------------------------
-- Table structure for `parents`
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents` (
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`parentName`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`telNum`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`weChatNum`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`openId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`parentId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='家长表'

;

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
`picId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`picUrl`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`picName`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`picType`  tinyint(2) NULL DEFAULT NULL COMMENT '0：banner图片\r\n            1：学员头像\r\n            2：家长头像\r\n            3：老师头像\r\n            ' ,
PRIMARY KEY (`picId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='图片信息表'

;

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
`scheduleId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`parentId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`lessonType`  int(11) NULL DEFAULT NULL COMMENT '1:小学(11-16分别表示 小学1-6年级)\r\n            2: 初中（21-23分表表示 初中1-3年级）\r\n            3:高中（31-33分表表示 高中1-3年级）\r\n            ' ,
`createTime`  datetime NULL DEFAULT NULL ,
`status`  tinyint(2) NULL DEFAULT 0 COMMENT '0：未处理\r\n            1：已指派老师' ,
`notes`  varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`scheduleId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='预约管理'

;

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
`schoolId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`schoolName`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`schoolAddress`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`termInfo`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`schoolId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='学校信息'

;

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
`memberId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`classID`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`gradeId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`schoolId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`picId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`isStarMember`  tinyint(1) NULL DEFAULT 0 COMMENT '0：不是\r\n            1：是' ,
`gentle`  tinyint(1) NULL DEFAULT NULL COMMENT '1：男\r\n            2：女' ,
`telNum`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`memberId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='学员信息表 - 对应原 starStudent表'

;

-- ----------------------------
-- Table structure for `suggestions`
-- ----------------------------
DROP TABLE IF EXISTS `suggestions`;
CREATE TABLE `suggestions` (
`lessonTradeId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当录入明星学员时，该字段填入明星学员memberId' ,
`situations`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以json字符串呈现，方便扩展（另存明星学员提分说明）' ,
`suggestions`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以json字符串呈现，方便扩展（另存明星学员感悟）' ,
PRIMARY KEY (`lessonTradeId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`teacherName`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`picId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`schoolId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`gradeId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sex`  tinyint(1) NULL DEFAULT NULL COMMENT '0: 男，1：女' ,
`education`  tinyint(2) NULL DEFAULT NULL COMMENT '1：中专\r\n            2：大专\r\n            3：本科\r\n            4：研究生\r\n            5：博士\r\n            6：其他' ,
`telNumber`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`teachingLevel`  tinyint(2) NULL DEFAULT NULL COMMENT '-1：黑名单\r\n            1:普通\r\n            2：金牌' ,
`regDate`  datetime NULL DEFAULT NULL ,
`notes`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`openId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`signed`  tinyint(1) NULL DEFAULT 0 COMMENT '0：未签约\r\n            1：已签约' ,
PRIMARY KEY (`teacherId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='教员表'

;

-- ----------------------------
-- Table structure for `teacher_les_r`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_les_r`;
CREATE TABLE `teacher_les_r` (
`teachingId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lessonType`  int(11) NOT NULL COMMENT '1:小学(11-16分别表示 小学1-6年级)(111-119可扩展为语数外，政史地，物化生科目代码，即：小学x年级y科目)\r\n            2: 初中（21-23分表表示 初中1-3年级）\r\n            3:高中（31-33分表表示 高中1-3年级）\r\n            ' ,
PRIMARY KEY (`teacherId`, `lessonType`, `teachingId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='任教关系表（老师-擅长科目）'

;

-- ----------------------------
-- Table structure for `teachingrecord`
-- ----------------------------
DROP TABLE IF EXISTS `teachingrecord`;
CREATE TABLE `teachingrecord` (
`recordId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`teachingId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`orderId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取第一条订单ID' ,
`teacherId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`startTime`  time NULL DEFAULT NULL ,
`endTime`  time NULL DEFAULT NULL ,
`teachingNum`  float(6,0) NULL DEFAULT NULL ,
`teachingDate`  date NULL DEFAULT NULL ,
PRIMARY KEY (`recordId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`userId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid' ,
`userName`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`userAccountId`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号，默认为手机号码' ,
`password`  varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码，默认为手机号码后六位' ,
`userType`  tinyint(2) NULL DEFAULT NULL COMMENT '0：管理员\r\n  1：学生\r\n   2：家长\r\n    3：老师\r\n   4：其他' ,
`userPrivilege`  tinyint(2) NULL DEFAULT NULL COMMENT '当用户类型为老师时，该字段标识老师签约状态（0：未签约，1：已签约）' ,
`loginStatus`  tinyint(1) NULL DEFAULT NULL COMMENT '0：未登录\r\n            1：已登录' ,
`openId`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`nickname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`headimgurl`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`userId`, `userAccountId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='User表--登录权限'

;


-- ----------------------------
-- Indexes structure for table `parents`
-- ----------------------------
CREATE UNIQUE INDEX `AK_unique_key2` ON `parents`(`telNum`) USING BTREE ;
CREATE UNIQUE INDEX `AK_unique_key1` ON `parents`(`openId`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table `student`
-- ----------------------------
CREATE UNIQUE INDEX `key_2` ON `student`(`telNum`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table `teacher`
-- ----------------------------
CREATE UNIQUE INDEX `key_2` ON `teacher`(`telNumber`) USING BTREE ;
