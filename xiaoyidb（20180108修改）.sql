/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : xiaoyidb

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-08 21:04:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accountId` varchar(36) NOT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  `accountType` tinyint(3) DEFAULT NULL COMMENT '支付宝、微信等\r\n            暂定（支付宝：0，微信：1）',
  `accountNumber` varchar(36) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '0:正常，1：冻结',
  `totalIncome` int(11) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classID` varchar(36) NOT NULL,
  `gradeId` varchar(36) NOT NULL,
  `schoolId` varchar(36) NOT NULL,
  `className` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`classID`,`gradeId`,`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gradeId` varchar(36) NOT NULL,
  `schoolId` varchar(36) NOT NULL,
  `gradeName` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`gradeId`,`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级表';

-- ----------------------------
-- Records of grade
-- ----------------------------

-- ----------------------------
-- Table structure for lessontrade
-- ----------------------------
DROP TABLE IF EXISTS `lessontrade`;
CREATE TABLE `lessontrade` (
  `lessonTradeId` varchar(36) NOT NULL,
  `lessonType` int(11) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '-1：提现失败\r\n            1：已提交，待家长确认\r\n            2：提现成功\r\n            ',
  `applyLessons` smallint(6) DEFAULT NULL,
  `feedback` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课时管理（提现交易）表';

-- ----------------------------
-- Records of lessontrade
-- ----------------------------

-- ----------------------------
-- Table structure for lessontradesum
-- ----------------------------
DROP TABLE IF EXISTS `lessontradesum`;
CREATE TABLE `lessontradesum` (
  `teacherId` varchar(36) NOT NULL,
  `checkedLessonNum` smallint(6) DEFAULT NULL COMMENT '实际到帐课时，为老师提现实际到帐的课时和',
  `withDrawLessonNum` smallint(6) DEFAULT NULL COMMENT '老师申请提现通过的所有课时和',
  `frozenLessonNum` smallint(6) DEFAULT NULL COMMENT ' 冻结：指教员违约违规，需冻结老师课时费，老师不可提取冻结课时费。如教员又教初中又教高中，则优先冻结较高年级的课时，即冻结高中课时\r\n            实际到帐课时=申请提现通过课时 — 累计冻结课时',
  `totalLessonNum` smallint(6) DEFAULT NULL COMMENT '历史所有课时数总和（评级标准之一）',
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师累计提现表（每一次老师提现都更新此表）';

-- ----------------------------
-- Records of lessontradesum
-- ----------------------------

-- ----------------------------
-- Table structure for lessontype
-- ----------------------------
DROP TABLE IF EXISTS `lessontype`;
CREATE TABLE `lessontype` (
  `lessonType` int(11) NOT NULL COMMENT '1:小学\r\n            2: 初中\r\n            3:高中',
  `lessonPrice` float DEFAULT NULL COMMENT '小学：1-6\r\n            初中：7-9\r\n            高中：10-12',
  PRIMARY KEY (`lessonType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课时类型';

-- ----------------------------
-- Records of lessontype
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` varchar(36) NOT NULL,
  `teacherId` varchar(36) NOT NULL,
  `parentId` varchar(36) NOT NULL,
  `lessonType` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `purchaseNum` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`teacherId`,`parentId`,`lessonType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单管理';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for ordersum
-- ----------------------------
DROP TABLE IF EXISTS `ordersum`;
CREATE TABLE `ordersum` (
  `orderId` varchar(36) NOT NULL COMMENT '取第一条订单ID',
  `teacherId` varchar(36) NOT NULL,
  `parentId` varchar(36) NOT NULL,
  `lessonType` int(11) NOT NULL,
  `purchaseTime` datetime DEFAULT NULL,
  `totalLessonNum` smallint(6) DEFAULT NULL,
  `lessonLeftNum` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`teacherId`,`parentId`,`lessonType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单汇总';

-- ----------------------------
-- Records of ordersum
-- ----------------------------

-- ----------------------------
-- Table structure for parents
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents` (
  `parentId` varchar(36) NOT NULL,
  `parentName` varchar(36) DEFAULT NULL,
  `telNum` varchar(30) DEFAULT NULL,
  `weChatNum` varchar(36) DEFAULT NULL,
  `openId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`parentId`),
  UNIQUE KEY `AK_unique_key` (`openId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家长表';

-- ----------------------------
-- Records of parents
-- ----------------------------
INSERT INTO `parents` VALUES ('aaaa', 'aaaa', '18711019945', '15578901234', 'aaaaaaa');
INSERT INTO `parents` VALUES ('bbbb', 'bbbb', '18711019945', '15578901234', 'bbbbbbb');

-- ----------------------------
-- Table structure for parent_stu_r
-- ----------------------------
DROP TABLE IF EXISTS `parent_stu_r`;
CREATE TABLE `parent_stu_r` (
  `memberId` varchar(36) NOT NULL,
  `parentId` varchar(36) NOT NULL,
  PRIMARY KEY (`memberId`,`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家属-学生关系表';

-- ----------------------------
-- Records of parent_stu_r
-- ----------------------------
INSERT INTO `parent_stu_r` VALUES ('1111111111111', 'aaaa');
INSERT INTO `parent_stu_r` VALUES ('22222222', 'bbbb');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `picId` varchar(36) NOT NULL,
  `picUrl` varchar(500) DEFAULT NULL,
  `picName` varchar(200) DEFAULT NULL,
  `picType` tinyint(2) DEFAULT NULL COMMENT '0：banner图片\r\n            1：学员头像\r\n            2：家长头像\r\n            3：老师头像\r\n            ',
  PRIMARY KEY (`picId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片信息表';

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `scheduleId` varchar(36) NOT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  `memberId` varchar(36) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `lessonType` int(11) DEFAULT NULL COMMENT '1:小学(11-16分别表示 小学1-6年级)\r\n            2: 初中（21-23分表表示 初中1-3年级）\r\n            3:高中（31-33分表表示 高中1-3年级）\r\n            ',
  `createTime` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '0：未处理\r\n            1：已指派老师',
  `notes` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约管理';

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('63bf2cc4-32e4-480c-8a46-e9b7ff7eb4f0', null, null, 'aaaa', '1', '2018-01-08 20:59:48', '0', '未处理');
INSERT INTO `schedule` VALUES ('a3f38462-aa9f-43fc-8276-a0dc9bc6e42c', null, '1111111111111', 'aaaa', '1', '2018-01-08 21:03:21', '0', '未处理');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `schoolId` varchar(36) NOT NULL,
  `schoolName` varchar(100) DEFAULT NULL,
  `schoolAddress` varchar(500) DEFAULT NULL,
  `termInfo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校信息';

-- ----------------------------
-- Records of school
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `memberId` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `classID` varchar(36) DEFAULT NULL,
  `gradeId` varchar(36) DEFAULT NULL,
  `schoolId` varchar(36) DEFAULT NULL,
  `picId` varchar(36) DEFAULT NULL,
  `isStarMember` tinyint(1) DEFAULT NULL COMMENT '0：不是\r\n            1：是',
  `gentle` tinyint(1) DEFAULT NULL COMMENT '1：男\r\n            2：女',
  `telNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学员信息表 - 对应原 starStudent表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1111111111111', '111111', '1111', '4', '111', '111', null, '0', '18711019949');
INSERT INTO `student` VALUES ('22222222', '222', '222', '3', '222', '222', '1', '1', '18711234687');

-- ----------------------------
-- Table structure for suggestions
-- ----------------------------
DROP TABLE IF EXISTS `suggestions`;
CREATE TABLE `suggestions` (
  `lessonTradeId` varchar(36) NOT NULL,
  `situations` varchar(1000) DEFAULT NULL COMMENT '以json字符串呈现，方便扩展',
  `suggestions` varchar(1000) DEFAULT NULL COMMENT '以json字符串呈现，方便扩展',
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggestions
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` varchar(36) NOT NULL,
  `teacherName` varchar(36) DEFAULT NULL,
  `picId` varchar(36) DEFAULT NULL,
  `schoolId` varchar(36) DEFAULT NULL,
  `gradeId` varchar(36) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '1: 男，2：女',
  `education` tinyint(2) DEFAULT NULL COMMENT '1：中专\r\n            2：大专\r\n            3：本科\r\n            4：研究生\r\n            5：博士\r\n            6：其他',
  `telNumber` varchar(20) DEFAULT NULL,
  `teachingLevel` tinyint(2) DEFAULT NULL COMMENT '-1：黑名单\r\n            1:普通\r\n            2：金牌',
  `regDate` datetime DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教员表';

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(36) NOT NULL COMMENT 'uuid',
  `userName` varchar(36) DEFAULT NULL,
  `userAccountId` varchar(36) NOT NULL COMMENT '登录账号，默认为手机号码',
  `password` varchar(36) DEFAULT NULL COMMENT '登录密码，默认为手机号码后六位',
  `userType` tinyint(2) DEFAULT NULL COMMENT '0：管理员\r\n            1：学生\r\n            2：家长\r\n            3：老师\r\n            4：其他',
  `userPrivilege` tinyint(2) DEFAULT NULL COMMENT '当用户类型为老师时，该字段标识老师签约状态（0：未签约，1：已签约）',
  `loginStatus` tinyint(1) DEFAULT NULL COMMENT '0：未登录\r\n            1：已登录',
  PRIMARY KEY (`userId`,`userAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User表--登录权限';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('aeasdfaweawsefa', 'dengzhihua', '18711019949', '123456', '1', '0', '1');
