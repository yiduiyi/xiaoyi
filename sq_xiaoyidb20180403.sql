/*
Navicat MySQL Data Transfer

Source Server         : mysql.sql141.cdncenter.net_3306
Source Server Version : 50538
Source Host           : mysql.sql141.cdncenter.net:3306
Source Database       : sq_xiaoyidb

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-04-03 10:14:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classID` varchar(36) NOT NULL,
  `gradeId` varchar(36) NOT NULL,
  `schoolId` varchar(36) NOT NULL,
  `className` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`classID`,`gradeId`,`schoolId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gradeId` varchar(36) NOT NULL,
  `schoolId` varchar(36) NOT NULL,
  `gradeName` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`gradeId`,`schoolId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='年级表';

-- ----------------------------
-- Records of grade
-- ----------------------------

-- ----------------------------
-- Table structure for `lessontrade`
-- ----------------------------
DROP TABLE IF EXISTS `lessontrade`;
CREATE TABLE `lessontrade` (
  `lessonTradeId` varchar(36) NOT NULL,
  `lessonType` int(11) DEFAULT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  `memberId` varchar(36) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '-1：提现失败\r\n 0：已提现 1：已提交，待家长确认   2：家长已确认，待管理员审核中 ',
  `applyLessons` float(6,0) DEFAULT NULL,
  `feedback` varchar(50) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `frozenLessons` float DEFAULT '0' COMMENT '管理员冻结课时',
  `actualPay` float DEFAULT '0',
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='课时管理（提现交易）表';

-- ----------------------------
-- Records of lessontrade
-- ----------------------------
INSERT INTO lessontrade VALUES ('ae779e32-4ea9-43da-8ef7-9d05a2995bd8', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '啦啦', '2', '1', '0', '2018-04-01 22:11:49', '0', '43');
INSERT INTO lessontrade VALUES ('0edef0da-d2b2-4041-8ae3-1551ffe4a0a0', '-111', 'ffb18612-b184-4291-b49f-5336cf8a913b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', null, '1', '1', null, '2018-04-03 10:02:24', '0', '0');
INSERT INTO lessontrade VALUES ('797426a4-6322-4a8f-99f0-196d0d1f4421', '-111', 'ffb18612-b184-4291-b49f-5336cf8a913b', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '可以', '2', '1', '0', '2018-04-03 10:04:07', '0', '43');

-- ----------------------------
-- Table structure for `lessontradesum`
-- ----------------------------
DROP TABLE IF EXISTS `lessontradesum`;
CREATE TABLE `lessontradesum` (
  `teacherId` varchar(36) NOT NULL,
  `checkedLessonNum` float(6,0) DEFAULT '0' COMMENT '实际到帐课时，为老师提现实际到帐的课时和',
  `withDrawLessonNum` float(6,0) DEFAULT '0' COMMENT '老师申请提现通过的所有课时和',
  `frozenLessonNum` float(6,0) DEFAULT '0' COMMENT ' 冻结：指教员违约违规，需冻结老师课时费，老师不可提取冻结课时费。如教员又教初中又教高中，则优先冻结较高年级的课时，即冻结高中课时\r\n            实际到帐课时=申请提现通过课时 — 累计冻结课时',
  `totalLessonNum` float(6,0) DEFAULT '0' COMMENT '历史所有课时数总和（评级标准之一）',
  `totalIncome` double DEFAULT '0',
  PRIMARY KEY (`teacherId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教师累计提现表（每一次老师提现都更新此表）';

-- ----------------------------
-- Records of lessontradesum
-- ----------------------------
INSERT INTO lessontradesum VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '2', '0', '0', '3', '0');

-- ----------------------------
-- Table structure for `lessontype`
-- ----------------------------
DROP TABLE IF EXISTS `lessontype`;
CREATE TABLE `lessontype` (
  `lessonId` varchar(36) DEFAULT NULL,
  `lessonType` int(11) NOT NULL COMMENT '正数-学生上门，负数-老师上门\r\n            1:小学(11-16分别表示 小学1-6年级)(111-119可扩展为语数外，政史地，物化生科目代码，即：小学x年级y科目)\r\n            2: 初中（21-23分表表示 初中1-3年级）\r\n            3:高中（31-33分表表示 高中1-3年级）\r\n            ',
  `courseCnt` smallint(6) NOT NULL DEFAULT '1',
  `teachingWay` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0,学生上门，1：老师上门',
  `gradeId` smallint(6) NOT NULL,
  `lessonPrice` float DEFAULT NULL COMMENT '小学：1-6\r\n            初中：7-9\r\n            高中：10-12',
  `lessonName` varchar(50) DEFAULT NULL COMMENT '命名规范（111：小学一年级语文、112：小学一年级数学...）',
  `gradeName` varchar(50) DEFAULT NULL,
  `needBook` tinyint(1) DEFAULT '1' COMMENT '0:不需要，1：需要（默认）',
  `discountPrice` float DEFAULT NULL,
  `isholiday` tinyint(2) DEFAULT '0',
  `singleCoursePrice` float DEFAULT NULL,
  PRIMARY KEY (`lessonType`,`courseCnt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='课时类型';

-- ----------------------------
-- Records of lessontype
-- ----------------------------
INSERT INTO lessontype VALUES ('6ZSU4vGx8zr8ve3fmYgKnG2AdljmSGIhjzcB', '-111', '30', '1', '11', '2400', '小一语文', '小一~小五', '0', '1800', '0', '60');
INSERT INTO lessontype VALUES ('fKNfCYY0CKZEUn5lxJQulu2x753QKIIYUWew', '111', '30', '0', '11', '2100', '小一语文', '小一~小五', '0', '1650', '0', '55');
INSERT INTO lessontype VALUES ('e4SLyinfhVHj2kX9iumkMNwrnBgTR5egiVRl', '-111', '40', '1', '11', '3200', '小一语文', '小一~小五', '0', '2360', '0', '60');
INSERT INTO lessontype VALUES ('e4SLyinfhVHj2kX9iumkMNwrnBgTR5egiVRl', '111', '40', '0', '11', '2800', '小一语文', '小一~小五', '0', '2160', '0', '55');
INSERT INTO lessontype VALUES ('grebHy0i9lXWJIQBKiZI0ix5Howj8NoaFWpB', '-111', '60', '1', '11', '4800', '小一语文', '小一~小五', '0', '3420', '0', '60');
INSERT INTO lessontype VALUES ('Z8AjJpWdv3sEBjMhFg3jL0usxUf8dCiJmOgl', '111', '60', '0', '11', '4200', '小一语文', '小一~小五', '0', '3120', '0', '55');
INSERT INTO lessontype VALUES ('tvre4SmomHgylTQwUrriiIO1Ajxdt8fNbdkt', '-111', '80', '1', '11', '6400', '小一语文', '小一~小五', '0', '4400', '0', '60');
INSERT INTO lessontype VALUES ('dLlEzMfBk63FlftsTmLvKZHFJczpLPU7NTGr', '111', '80', '0', '11', '5600', '小一语文', '小一~小五', '0', '4000', '0', '55');
INSERT INTO lessontype VALUES ('kwFOOVtgbTZ5FkyKtJmKHGpOs51ruDtiR14q', '-161', '30', '1', '16', '2400', '小六语文', '小六', '0', '1950', '0', '65');
INSERT INTO lessontype VALUES ('sBYqpOKbAu8h2RB3CnWbBB4f5oBhaaiYDpg6', '161', '30', '0', '16', '1800', '小六语文', '小六', '0', '1800', '0', '60');
INSERT INTO lessontype VALUES ('dEClBONtEcLPPENUKHwMK4M4AtToAXFypAdO', '-161', '40', '1', '16', '3200', '小六语文', '小六', '0', '2560', '0', '65');
INSERT INTO lessontype VALUES ('1EiYyFHBsZzo64SzZbEvNzRy19q9PuP4vpMg', '161', '40', '0', '16', '2360', '小六语文', '小六', '0', '2360', '0', '60');
INSERT INTO lessontype VALUES ('T0Rtfb0riTSXDKSlrhrd7B6gaU6QbrkDSrsT', '-161', '60', '1', '16', '4800', '小六语文', '小六', '0', '3720', '0', '65');
INSERT INTO lessontype VALUES ('Ud4053RB0GLmkuAjGeDXOubzu3o7STwAbERS', '161', '60', '0', '16', '3420', '小六语文', '小六', '0', '3420', '0', '60');
INSERT INTO lessontype VALUES ('3GTU4HPeNeKXS8KDeBOUd9QxriiQok4p9cmG', '-161', '80', '1', '16', '6800', '小六语文', '小六', '0', '4800', '0', '65');
INSERT INTO lessontype VALUES ('2L03wGw6w6Eu2dKrSjiSk59TZfEkw5MGNgwL', '161', '80', '0', '16', '4400', '小六语文', '小六', '0', '4400', '0', '60');
INSERT INTO lessontype VALUES ('dLlEzMfBk63FlftsTmLvKZHFJczpLPU7NTGr', '-111', '20', '1', '11', '0.01', '小一语文', '小一~小五', '1', '0.01', '0', '0.001');
INSERT INTO lessontype VALUES ('LX8ojxiFLt7WqLg4XLXnnhOUUQJCsuTG', '-211', '30', '1', '21', '2700', null, '初一、初二', '1', '2268', '0', null);
INSERT INTO lessontype VALUES ('onkfWubxFSXvxFXiJqugn7fkSAFhvjqr', '211', '30', '0', '21', '2700', null, '初一、初二', '1', '2100', '0', null);
INSERT INTO lessontype VALUES ('OBlITHGJ6U1jODLLfblGqWfdKYgYvcB4', '-211', '40', '1', '21', '3600', null, '初一、初二', '1', '2960', '0', null);
INSERT INTO lessontype VALUES ('QyreWpzChyhzlqmQm9VMjNIRCLoNxE1T', '211', '40', '0', '21', '3600', null, '初一、初二', '1', '2760', '0', null);
INSERT INTO lessontype VALUES ('g0ko65FJHsK0BOyLMWTCO9gmoYOWuJ8Q', '-211', '60', '1', '21', '5400', null, '初一、初二', '1', '4320', '0', null);
INSERT INTO lessontype VALUES ('lMk3hVFalE0SehyBDiix4rrHJ5JNcH9j', '211', '60', '0', '21', '5400', null, '初一、初二', '1', '4020', '0', null);
INSERT INTO lessontype VALUES ('26dUynrczY7MOWVaGwsABmuPrmL1QKNY', '-211', '80', '1', '21', '7200', null, '初一、初二', '1', '5600', '0', null);
INSERT INTO lessontype VALUES ('Z99vun9gprh6ENBUw0CIHkG6EUArMM85', '211', '80', '0', '21', '7200', null, '初一、初二', '1', '5200', '0', null);
INSERT INTO lessontype VALUES ('iuPxWpGiKd5OV2nLys4uO34813xGGxMe', '-231', '30', '1', '23', '3000', null, '初三', '1', '2568', '0', null);
INSERT INTO lessontype VALUES ('SaygAAH057sYjJK19JQY2Aw0o0xk2oou', '231', '30', '0', '23', '3000', null, '初三', '1', '2400', '0', null);
INSERT INTO lessontype VALUES ('RSSQKeOhTjAUFfdTOER7wIcFLHUQRJWd', '-231', '40', '1', '23', '4000', null, '初三', '1', '3360', '0', null);
INSERT INTO lessontype VALUES ('wBZQsRxkkSEAdyKYXEMH2859ToDR3tJw', '231', '40', '0', '23', '4000', null, '初三', '1', '3160', '0', null);
INSERT INTO lessontype VALUES ('t3kIECrml2YmrVEkiXQMONKXdjNB1ZDU', '-231', '60', '1', '23', '6000', null, '初三', '1', '4920', '0', null);
INSERT INTO lessontype VALUES ('6IhggfQBzjUfmHcH4Zs0F9foAPZtkayM', '231', '60', '0', '23', '6000', null, '初三', '1', '4620', '0', null);
INSERT INTO lessontype VALUES ('fBFN17FdowxpjxOcEXWNzWBTOoQuDVLm', '-231', '80', '1', '23', '8000', null, '初三', '1', '6400', '0', null);
INSERT INTO lessontype VALUES ('7Giqa6CML7ZqZCiD98UcBJLNFqtMec4m', '231', '80', '0', '23', '8000', null, '初三', '1', '6000', '0', null);
INSERT INTO lessontype VALUES ('wSwkP0hU3SPp2GG4fXxZRmIBNAX5CsMb', '-311', '30', '1', '31', '3300', null, '高一、高二', '1', '2700', '0', null);
INSERT INTO lessontype VALUES ('hDdiXd9ocCF38MBpmA1vcEsStQYz4Y8S', '311', '30', '0', '31', '3300', null, '高一、高二', '1', '2550', '0', null);
INSERT INTO lessontype VALUES ('F7zSMof2xrCWr36BuWkLYlPm6oZQ7VkE', '-311', '40', '1', '31', '4400', null, '高一、高二', '1', '3560', '0', null);
INSERT INTO lessontype VALUES ('EQivnUVHjIl1LjbN8SO2wYrMrd2Cf7cF', '311', '40', '0', '31', '4400', null, '高一、高二', '1', '3360', '0', null);
INSERT INTO lessontype VALUES ('9fBInyUaRjmZflAL7nPd6t19zeZfA3Mf', '-311', '60', '1', '31', '6600', null, '高一、高二', '1', '5220', '0', null);
INSERT INTO lessontype VALUES ('uIf1v2XWzaNE584oixhuAXNTfZNPQ53r', '311', '60', '0', '31', '6600', null, '高一、高二', '1', '4920', '0', null);
INSERT INTO lessontype VALUES ('T11VnTqQBrycECDTHdiLKhEeZ0yelhn3', '-311', '80', '1', '31', '8800', null, '高一、高二', '1', '6800', '0', null);
INSERT INTO lessontype VALUES ('mvwzDJLz1ATEyYoshcOReGlL4Whs2WHh', '311', '80', '0', '31', '8800', null, '高一、高二', '1', '6400', '0', null);
INSERT INTO lessontype VALUES ('zunBecixFYz354PudZDbtG6Wqp4pD5uC', '-331', '30', '1', '33', '3600', null, '高三', '0', '3000', '0', null);
INSERT INTO lessontype VALUES ('luPLt4oatAG9i9mhFK76LFRL22dF8C2I', '331', '30', '0', '33', '3600', null, '高三', '0', '2850', '0', null);
INSERT INTO lessontype VALUES ('xKPdekXVPI35g2MDfZ7hHPZSMKT3OZEy', '-331', '40', '1', '33', '4800', null, '高三', '0', '3960', '0', null);
INSERT INTO lessontype VALUES ('4elKb2dhsh84uRPWbVOBDh823rc5L8c7', '331', '40', '0', '33', '4800', null, '高三', '0', '3760', '0', null);
INSERT INTO lessontype VALUES ('rN4VVAmTwmabNlXlf6DLgLFQzwzlkbXG', '-331', '60', '1', '33', '7200', null, '高三', '0', '5820', '0', null);
INSERT INTO lessontype VALUES ('2ZE7KXbJ5i5spqyRCWL5plz19Y2TBSE5', '331', '60', '0', '33', '7200', null, '高三', '0', '5520', '0', null);
INSERT INTO lessontype VALUES ('ZT8CO2vsrvktUnRl8XZr8s6N1XUCXoGG', '-331', '80', '1', '33', '9600', null, '高三', '0', '7600', '0', null);
INSERT INTO lessontype VALUES ('ZL9udOWcrfPHRP3uZkR1L9e41Gv3Dy7r', '331', '80', '0', '33', '9600', null, '高三', '0', '7200', '0', null);

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` varchar(36) NOT NULL,
  `lessonType` int(11) NOT NULL,
  `parentId` varchar(36) NOT NULL,
  `memberId` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `purchaseNum` smallint(6) DEFAULT NULL,
  `orderType` smallint(6) DEFAULT NULL COMMENT '-1：老师提现，0：管理员结算，1：管理员充值，2：家长下订单',
  `hasBook` tinyint(4) DEFAULT NULL,
  `singleLessonPrice` float DEFAULT NULL,
  `totalLessonPrice` float DEFAULT NULL,
  `actualPay` float DEFAULT NULL,
  `orderStatus` smallint(2) DEFAULT '0' COMMENT '-1：出错，0：预付成功，1: 扣款成功',
  PRIMARY KEY (`orderId`,`lessonType`,`parentId`,`memberId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单管理';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO orders VALUES ('fa92b9ba-f1be-4461-b261-2342b3025145', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-04 11:05:27', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('6f41c6e0-d3fe-4f61-be70-e1018c5d9259', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '7c1f175e-92ad-4a83-af61-faf4571dc87d', '2018-03-04 11:28:17', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('999f9085-f746-4f88-810b-bb266dc4cc3b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-03-04 11:31:29', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-03-04 11:32:37', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('26e412cf-a8e8-401c-88fa-fe37aa6bb208', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-03-04 11:38:10', '80', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('49bfe88a-3a6f-40cb-9957-46650620c7df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'cccbb380-7dd4-44b5-8e79-19f7b610d433', '2018-03-04 11:43:08', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('a809032f-f82c-4003-9e70-26b8e6368db1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-03-04 11:45:58', '60', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('90782b65-c2f9-40f1-93d1-8a539537af58', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '2018-03-04 11:49:14', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2018-03-04 11:50:03', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('4363acc2-dce1-41f5-a5d8-21a9c664ecd2', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '5c7f5e36-535f-48f8-8763-0f9b6318073e', '2018-03-04 11:50:57', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('8599b3df-ac74-4ce7-b46e-86101431294c', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-04 12:54:58', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('7a7787a7-3f32-42d0-99dc-673c319d7b9d', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:02:41', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('4970c4d5-bda0-4b46-860d-51c53fa529ad', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:27:46', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('978b7641-2ed5-4a61-8721-528b92cd425a', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:56:17', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('38a80f56-41dc-4bc4-bb3a-300d58253463', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 14:07:41', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('b3cc0620-7124-4402-86f6-81b1ec1fd677', '111', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '0f390070-d868-42d9-832e-8dd8cf229124', '2018-03-04 17:30:35', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('2c371767-c5c8-44bf-b09f-1a7b3cf0d137', '-111', 'a712fda3-c0c0-49aa-be5d-4e90401c368b', 'e78f0e67-17c9-462d-ae45-453daf6562d5', '2018-03-04 18:06:29', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('53183a7a-8547-4823-b908-656b9e818f84', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-03-04 19:16:58', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('fb6a55ea-55e1-45ae-81e7-2caafb99ff2c', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:18:39', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f8905a48-c226-4cc2-8710-e242dbe17563', '111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:19:20', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('127f313b-6c0f-4f6f-8909-8fede191732e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:17:19', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('c0293c4a-bf52-435c-b45f-8172c3ab747c', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:18:10', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('89338b09-7981-49bf-a597-d58e4c0b5245', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:25:05', '1', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('5c6eaa1c-6384-478e-8234-ddd3bfbce2fa', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:31:16', '10', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9af3ef1d-8ed4-4581-9177-5c333efb9446', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:32:07', '-1', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('7a5a04a9-6f4f-4615-a6f0-38571e2f19c6', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:33:18', '10', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('218099dd-bf4b-4834-bd01-386f8280d15d', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:33:26', '-3', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('531c4692-cab7-406c-82da-8564e7ae538a', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-08 21:26:57', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('5b5e53b7-324c-4678-bff1-19d128f6f355', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 21:28:12', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('aeceba8b-9d9b-4ca9-ba5a-c903931c584f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 21:29:27', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0da9053e-409a-43d8-94d9-989ce283a8f8', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 21:45:23', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('68e439e3-d949-4f45-9cfb-3a66bc4e9910', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:11:59', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('85be62cb-3676-41b1-92e5-b85e8b6bf1d1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:36:40', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('06409f59-f672-4d7e-8834-f3cef35cae1a', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:37:13', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('bb35d9db-a35b-4be6-a3e0-47d9d038627d', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 22:38:17', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('5dc10c94-4b1d-4b16-81f6-8f02e191879e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 22:46:42', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c5dd254c-b284-4196-9f16-43a17e8c763b', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-08 23:02:04', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('8fb5244d-6bba-4959-9760-e64f77fe8370', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-03-10 09:23:13', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('de6e0d63-fbe4-4866-a521-e38ad0be0ccd', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 21:36:11', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('87c5f6d6-959b-49af-a90a-b88d85a92d67', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-10 21:59:21', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fd573c19-ee59-4fb9-9fa9-f3b9c3fcf433', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 22:55:24', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9875ed65-6991-43c1-8191-511e30bb55df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 22:58:29', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('dfecbb82-2a0d-4cd0-aaab-c6f5f02c3ffe', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 23:15:48', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eebc4ed1-ff1e-4598-a9d8-9e993af68360', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-03-11 09:34:00', '60', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-03-11 11:31:36', '80', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-03-11 14:17:45', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('63de6f8f-666b-4127-bf5a-a76bec815c24', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-03-11 19:28:43', '40', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('3916fb92-890d-4634-a040-582cce5f6163', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-03-11 21:39:17', '15', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('3b3aed7a-88af-4738-95e9-e6884326dbfa', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-03-11 22:17:43', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('cb160364-745a-4e89-a782-30d0643e9f9f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-12 15:02:48', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('e3baa8e9-63c3-4805-aee1-605ca2ca3999', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-03-12 18:52:18', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('47131370-fc7d-4f30-8065-9d5bc8eb3c9e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 21:01:50', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0c4945d6-6144-4457-bea1-0b3f82074b37', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:06:11', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('59c449c7-5ef4-4e26-b148-7e8c6ee17650', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:17:11', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1900e321-c35e-41b6-b0e4-d07aa383b407', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:17:48', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('bb4c9aae-19d1-4e4c-9bb8-38da2e60ef87', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:43:45', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eaf217fc-6c7c-4f56-be12-2b9d370ea109', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-13 23:10:50', '1', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('44c9560c-76cd-4d41-a96b-654d39ac16fc', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 23:18:09', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1f8ce4c2-8af2-4e57-977c-3e275aef2880', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-13 23:34:40', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('877e1ad7-3b46-4490-8930-5306cdad94f5', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-03-14 17:42:42', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('319213ea-758b-42cb-a834-4a8e1997e16b', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-03-14 22:11:28', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f3ca36e3-15e5-4c56-8a8d-1067156a0da1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 11:09:22', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('6d5ea52f-af75-458f-a0b4-52958b7d5c2f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 11:22:54', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('8231551a-2d67-4d0c-bed6-99de9ccfac38', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 16:26:00', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('2adcf9f0-4777-4e56-a13d-e75a7046e866', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-15 22:29:14', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-03-16 18:46:41', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-03-17 21:44:25', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('960f9ff4-85ea-4e46-8821-8f6d4e9a996e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-18 20:01:17', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('914b764b-8771-40c7-b21e-05ce7d6bd1eb', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-18 20:09:31', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('73a3c5ee-9b27-4efa-93da-f7b339d584d6', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-03-19 11:06:39', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('f8dcbaac-c133-4a7b-a161-d896376e3fad', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 19:58:37', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('39546c1c-4510-4582-8ea2-1da68d151263', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 20:02:19', '2', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9897f53b-bbac-4fbf-b579-35bdedf27586', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:48:50', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('86d72767-5f2b-41ec-850a-1c3fea2419d9', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:54:40', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('d51a5072-542f-4151-9a59-99ac7ae2031c', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:59:48', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('306dde2d-c5d0-4b11-856b-0259943de776', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:59:48', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('bd1f0a78-390f-4f36-acbd-f0e0ec514c8b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:01:57', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('383ad241-c1ec-44ea-aedf-eeb84684fdf0', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:03:46', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('be3516e7-aee6-4335-b8bc-85b042ddde7e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:21:45', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eae9719f-49d5-46da-a1f8-3a28fb6af3be', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:32:38', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1b21b815-ae3f-459c-9676-5cc32b8876bc', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:39:53', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-03-21 08:59:15', '25', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('ed9b55d8-738b-43c6-87c0-2c6ea30ec737', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 11:38:38', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('50fcd63f-91c5-4371-b2e6-33e81832d35a', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 13:36:11', '-3', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('aa92c367-d393-4303-9edf-29e5c72ba000', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 15:28:47', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c6af12ed-ee54-4f92-9261-3dc190a2010a', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:08:19', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('dc58bc93-6daf-4b26-b7a1-c15e4953fac1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:14:18', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c65d08b5-0d5c-4bdc-9274-c3ec329272f0', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:30:24', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('87a767a8-22b6-48d9-a24a-cc6d52c975e9', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-03-21 21:07:56', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('9461f1df-fa79-4609-88fe-757fd0ccf99c', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-24 12:08:22', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('83bb28c1-8f21-483a-8348-07bf53f702ef', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-24 19:21:38', '40', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('e37770db-2e80-422e-b4d3-e12cab81145a', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-03-25 19:19:32', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('878030f0-b55b-4abc-9af7-16947f353ac1', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-03-26 08:44:56', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-26 20:54:40', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('68390142-be76-4569-99ec-3f4f6e61c13c', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-27 19:38:58', '-6', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-03-28 15:00:47', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-28 15:11:07', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('c4188ec5-7552-4ccc-8a35-6287339f7566', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:40', '-4', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('0f619823-ebf2-4c14-9b1a-98f735ff6bf4', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:43', '-4', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('0f60105c-c778-4c87-9df5-51e3cb9947b2', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:47', '-4', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('1465161c-351c-4bb0-a185-598859e6bb26', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:54:13', '8', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fdf68851-7c47-437f-87b3-8091a639bb28', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-29 12:59:30', '-4', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('497f668a-5c7c-4cd9-b2e7-164a53b85d6a', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-29 13:11:18', '7', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('57690f2e-484f-466a-943d-6ae8b5eee0d7', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-03-29 14:26:48', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('8392f7d1-9b76-486d-a810-d7f651340a08', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-03-29 20:41:32', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('d5b3a276-c468-49fc-9a19-12deccd4f5bb', '-211', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '2018-03-29 22:50:20', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('eb4baf58-0f3e-4017-958c-a711c8f05ffb', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-30 17:50:45', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('9241dacb-e389-45fe-b432-21a34307b019', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-31 13:20:45', '-4', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('eec3166c-b969-4bba-982a-46fd8f62ef06', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 15:14:57', '20', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('deba3091-8e44-48e4-a71a-a158eb9c4be4', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:20:15', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('745fb255-d039-4c5d-b527-20c21ffdcf51', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:22:20', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0293feed-7c35-4d85-a016-8fdf60f17494', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:53:10', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('339d3239-3805-41a0-abc4-19a8480fcce8', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:57:58', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('11097d40-84d4-4744-bd48-b854fb291dd0', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 18:07:16', '-9', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-03-31 20:09:06', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('8591dca2-85c5-45f2-a103-f7b09ed8962f', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-03-31 22:49:31', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('0074262e-7492-4540-a61a-ca5b55a31e45', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 15:42:47', '80', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('be8e627d-a4c6-4e0c-a12c-11537519585b', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 16:06:44', '3', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('8da10dd1-1077-4bba-87df-ccd3289d4eae', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:41:09', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('404fa5e8-82ac-4751-890c-bfdb0b657744', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:41:32', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('f8358077-78e1-4f28-8134-83365338f0f8', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:42:08', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('288cace0-5bae-4c11-9167-c1646d1c4b64', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:53:45', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('68c3050c-5e2f-41c7-899e-3ebd109a4d52', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 16:54:14', '-2', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3999a748-51d9-45ee-a1ba-d30af836a0fb', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:57:20', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('a3b9d1fd-8726-4b75-80dc-259ca011d310', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 17:02:15', '5', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('af7e9f1e-1c86-4454-b9e8-a432e58f8fda', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:08:53', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('47e94225-3c7d-4423-9a1a-7ec49fc7325c', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:14:05', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('aed7c9a9-a46e-45ce-82f4-c8d701f10667', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:20:21', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('f319c5e0-8ce6-45d0-90d9-7ccf584e2034', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:34:20', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('a0c251ac-8221-43a3-8717-0d0cf0e9eb00', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 22:07:43', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('36ddf58e-bbb0-4bc7-b614-95593f5bd71f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 22:11:49', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('31c764a7-240c-4d72-8fff-46a3406d4bd3', '-231', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '2018-04-02 08:50:16', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-04-02 08:51:13', '30', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('fe423223-0125-463e-a23e-c8759ca06222', '-231', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '2018-04-02 10:02:40', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('cec19c3d-e59f-48e9-8e55-6a06a88ae298', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-04-02 17:34:51', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('32284eac-f199-44cd-989b-20fa8c6363e5', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-04-02 18:59:31', '5', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('7805c2bf-ca22-4274-a772-dc1ac11e8847', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-04-02 18:59:37', '-5', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('d827f356-7b1b-4f9d-b99e-734e3ff1a3f3', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-02 21:37:17', '20', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('8104b7f0-b244-419c-9863-6fd617caf676', '-211', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', '2018-04-03 09:47:42', '30', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('19ef0378-c057-4e32-8b45-d85f87107d32', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-03 10:02:24', '-1', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fca0c88c-636b-4f39-b740-9f071d380573', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-03 10:04:07', '-1', '-1', null, null, null, null, '0');

-- ----------------------------
-- Table structure for `ordersum`
-- ----------------------------
DROP TABLE IF EXISTS `ordersum`;
CREATE TABLE `ordersum` (
  `orderId` varchar(36) NOT NULL COMMENT '取第一条订单ID',
  `lessonType` int(11) NOT NULL,
  `parentId` varchar(36) NOT NULL,
  `memberId` varchar(36) NOT NULL,
  `purchaseTime` datetime NOT NULL,
  `totalLessonNum` smallint(6) DEFAULT NULL,
  `lessonLeftNum` smallint(6) DEFAULT NULL,
  `teachingIds` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`lessonType`,`parentId`,`memberId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单汇总';

-- ----------------------------
-- Records of ordersum
-- ----------------------------
INSERT INTO ordersum VALUES ('fa92b9ba-f1be-4461-b261-2342b3025145', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-04 11:05:27', '30', '20', 'a464769f-b7ab-46a8-9c90-c7c747a72a8f,86aed366-b47d-4e95-a859-862b9bb358a5,cc70187f-a06f-469c-9401-7b7603ad7347');
INSERT INTO ordersum VALUES ('6f41c6e0-d3fe-4f61-be70-e1018c5d9259', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '7c1f175e-92ad-4a83-af61-faf4571dc87d', '2018-03-04 11:28:17', '40', '40', null);
INSERT INTO ordersum VALUES ('999f9085-f746-4f88-810b-bb266dc4cc3b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-03-04 11:31:29', '30', '30', '0bdc7479-f122-4614-8a00-22f166abaa38');
INSERT INTO ordersum VALUES ('b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-03-04 11:32:37', '40', '40', null);
INSERT INTO ordersum VALUES ('26e412cf-a8e8-401c-88fa-fe37aa6bb208', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-03-04 11:38:10', '80', '80', '260d90c3-929d-4407-ad6a-272afc660212');
INSERT INTO ordersum VALUES ('49bfe88a-3a6f-40cb-9957-46650620c7df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'cccbb380-7dd4-44b5-8e79-19f7b610d433', '2018-03-04 11:43:08', '40', '40', '3bf0d502-f4c7-4c3c-ad03-53284868dc0a');
INSERT INTO ordersum VALUES ('a809032f-f82c-4003-9e70-26b8e6368db1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-03-04 11:45:58', '60', '60', '14326653-ca8d-4e6a-8eb1-55174a504a0e');
INSERT INTO ordersum VALUES ('90782b65-c2f9-40f1-93d1-8a539537af58', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '2018-03-04 11:49:14', '40', '40', null);
INSERT INTO ordersum VALUES ('a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2018-03-04 11:50:03', '40', '40', '8fd5a867-cf4b-4163-889e-e0778641a4a5');
INSERT INTO ordersum VALUES ('4363acc2-dce1-41f5-a5d8-21a9c664ecd2', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '5c7f5e36-535f-48f8-8763-0f9b6318073e', '2018-03-04 11:50:57', '40', '40', 'e0b3d132-d720-4961-a8b2-c506466c87a6,1aa7085d-901c-42fd-9511-3711ed3dec72');
INSERT INTO ordersum VALUES ('8599b3df-ac74-4ce7-b46e-86101431294c', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-04 12:54:58', '1', '-2', 'f0b44033-0d96-469c-8df3-751ba320e716');
INSERT INTO ordersum VALUES ('7a7787a7-3f32-42d0-99dc-673c319d7b9d', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:56:17', '2', '2', null);
INSERT INTO ordersum VALUES ('4970c4d5-bda0-4b46-860d-51c53fa529ad', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 14:07:41', '2', '1', 'c37a2e10-70ac-4d73-b65e-1327d3c5628f,dc016cf8-e5ec-4661-8348-b3a59c4a235b');
INSERT INTO ordersum VALUES ('b3cc0620-7124-4402-86f6-81b1ec1fd677', '111', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '0f390070-d868-42d9-832e-8dd8cf229124', '2018-03-04 17:30:35', '1', '1', null);
INSERT INTO ordersum VALUES ('2c371767-c5c8-44bf-b09f-1a7b3cf0d137', '-111', 'a712fda3-c0c0-49aa-be5d-4e90401c368b', 'e78f0e67-17c9-462d-ae45-453daf6562d5', '2018-03-04 18:06:29', '1', '1', null);
INSERT INTO ordersum VALUES ('53183a7a-8547-4823-b908-656b9e818f84', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-02 21:37:17', '21', '21', 'a4dbc41f-3d29-4629-9d6d-1a3ff201eede,60f60bee-3cc0-45e5-ab06-1fdc359f744d');
INSERT INTO ordersum VALUES ('fb6a55ea-55e1-45ae-81e7-2caafb99ff2c', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:18:39', '2', '2', null);
INSERT INTO ordersum VALUES ('f8905a48-c226-4cc2-8710-e242dbe17563', '111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:19:20', '1', '1', null);
INSERT INTO ordersum VALUES ('127f313b-6c0f-4f6f-8909-8fede191732e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:25:05', '19', '-8', '2d72270f-f8fe-4a24-93b2-885e8f8f5463,dde3612a-990b-43e8-8ebb-02123e838cc1,6380cb70-c25e-4077-a2ff-b0f65449e08b');
INSERT INTO ordersum VALUES ('8fb5244d-6bba-4959-9760-e64f77fe8370', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-03-10 09:23:13', '30', '30', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2,9cad6167-8dda-4659-974b-1a7d60aba1f9,748ac459-aca8-4b9a-b792-e3aaf09a8e23');
INSERT INTO ordersum VALUES ('eebc4ed1-ff1e-4598-a9d8-9e993af68360', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-03-11 09:34:00', '60', '60', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7,425e3aab-b0d2-4521-b858-0a70509b5d9e,7017346c-ff3f-4f42-9a40-e92dc324ef19');
INSERT INTO ordersum VALUES ('f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-03-11 11:31:36', '80', '80', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494,39a82af9-6cdf-4b92-b0ad-2af75eb02564');
INSERT INTO ordersum VALUES ('e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-03-11 14:17:45', '30', '30', '88952680-bedf-47cc-86ed-8d61aa95abb7,03e04220-5ce6-40bf-8d47-c2a54a2d3816,10bb2db3-7317-4e80-81f5-8e8998fd3a01,8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2');
INSERT INTO ordersum VALUES ('63de6f8f-666b-4127-bf5a-a76bec815c24', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-03-11 19:28:43', '40', '40', '5a978ecd-96da-4eae-b3f5-8706fcb3792e,f926d599-de1a-4b81-8343-9833c57a0882,9b6d689e-8671-4ee0-81f1-6cc27981b9c6,4d309b83-f780-4e70-9aaa-399c086cff52');
INSERT INTO ordersum VALUES ('3916fb92-890d-4634-a040-582cce5f6163', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-03-11 21:39:17', '15', '15', '45d8c044-8858-41d5-a215-4444519387d5,c9c3c13c-d4ec-4389-a10a-4319c52e3d70,9ed37360-bf7f-4d5f-8a00-43c514053d52,98efdd46-b5b6-414c-9c31-56320515f91d');
INSERT INTO ordersum VALUES ('3b3aed7a-88af-4738-95e9-e6884326dbfa', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-03-11 22:17:43', '40', '40', '8ecacfdd-351a-4381-bf5c-29bf8a815a88');
INSERT INTO ordersum VALUES ('e3baa8e9-63c3-4805-aee1-605ca2ca3999', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-03-12 18:52:18', '30', '30', 'faf95a49-dc0b-49c4-a24e-be34c61e622f');
INSERT INTO ordersum VALUES ('877e1ad7-3b46-4490-8930-5306cdad94f5', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-03-14 17:42:42', '30', '30', null);
INSERT INTO ordersum VALUES ('319213ea-758b-42cb-a834-4a8e1997e16b', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-03-14 22:11:28', '30', '30', null);
INSERT INTO ordersum VALUES ('3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-03-16 18:46:41', '30', '30', 'a93762e3-28ab-46b2-9793-8c73229268ca,6a2f9398-4577-4d5c-925c-b32352714ad2,3e74a8b4-7352-4fb3-94a9-48e03a354616,340e167e-e746-4d13-b45d-7370c640f2f8,cab9004e-3dbe-4777-8dbf-b39049fd8007');
INSERT INTO ordersum VALUES ('6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-03-17 21:44:25', '30', '30', null);
INSERT INTO ordersum VALUES ('73a3c5ee-9b27-4efa-93da-f7b339d584d6', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-03-19 11:06:39', '30', '30', null);
INSERT INTO ordersum VALUES ('f8dcbaac-c133-4a7b-a161-d896376e3fad', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 19:58:37', '32', '32', '8426c300-a528-4318-8983-4fd19f3f0ff0');
INSERT INTO ordersum VALUES ('ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-03-21 08:59:15', '25', '25', null);
INSERT INTO ordersum VALUES ('87a767a8-22b6-48d9-a24a-cc6d52c975e9', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-03-21 21:07:56', '30', '30', 'f849cbc7-5943-4710-b614-8f8cffd304e5');
INSERT INTO ordersum VALUES ('9461f1df-fa79-4609-88fe-757fd0ccf99c', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-24 12:08:22', '26', '26', null);
INSERT INTO ordersum VALUES ('83bb28c1-8f21-483a-8348-07bf53f702ef', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-24 19:21:38', '47', '47', 'f6dc4acc-f4d7-4aaf-b134-d818877620c9');
INSERT INTO ordersum VALUES ('e37770db-2e80-422e-b4d3-e12cab81145a', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-03-25 19:19:32', '30', '30', null);
INSERT INTO ordersum VALUES ('878030f0-b55b-4abc-9af7-16947f353ac1', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-03-26 08:44:56', '30', '30', null);
INSERT INTO ordersum VALUES ('8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-26 20:54:40', '24', '24', null);
INSERT INTO ordersum VALUES ('5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-03-28 15:00:47', '30', '30', null);
INSERT INTO ordersum VALUES ('9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-28 15:11:07', '26', '26', null);
INSERT INTO ordersum VALUES ('57690f2e-484f-466a-943d-6ae8b5eee0d7', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-03-29 14:26:48', '30', '30', null);
INSERT INTO ordersum VALUES ('8392f7d1-9b76-486d-a810-d7f651340a08', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-03-29 20:41:32', '30', '30', null);
INSERT INTO ordersum VALUES ('d5b3a276-c468-49fc-9a19-12deccd4f5bb', '-211', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '2018-03-29 22:50:20', '30', '30', '9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5,e64a4b66-c6d5-439d-b1ad-29929236a236,64e2a46a-6e1c-48ad-8cd7-4494f591972e,b6f587b6-5d6c-4f13-a17b-f91b3edf17bc');
INSERT INTO ordersum VALUES ('eb4baf58-0f3e-4017-958c-a711c8f05ffb', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-30 17:50:45', '26', '26', null);
INSERT INTO ordersum VALUES ('eec3166c-b969-4bba-982a-46fd8f62ef06', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 15:14:57', '20', '11', 'a4272eba-cc9c-40da-9e9e-a7b9662a46f3,6b387dfd-a870-40ae-b589-98b940508344,19926eb3-dd5d-46e8-999c-1978dcfce375,14809588-e1a2-47ff-9828-6fe4c159dce5,27f55f4f-55dc-4d66-87ad-471ec7e794f3');
INSERT INTO ordersum VALUES ('f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-03-31 20:09:06', '30', '30', null);
INSERT INTO ordersum VALUES ('8591dca2-85c5-45f2-a103-f7b09ed8962f', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-03-31 22:49:31', '30', '30', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105');
INSERT INTO ordersum VALUES ('0074262e-7492-4540-a61a-ca5b55a31e45', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 15:42:47', '88', '88', 'f558d3cb-3858-44de-aece-19b4ffc45396');
INSERT INTO ordersum VALUES ('31c764a7-240c-4d72-8fff-46a3406d4bd3', '-231', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '2018-04-02 08:50:16', '30', '30', null);
INSERT INTO ordersum VALUES ('7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-04-02 08:51:13', '30', '30', null);
INSERT INTO ordersum VALUES ('fe423223-0125-463e-a23e-c8759ca06222', '-231', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '2018-04-02 10:02:40', '30', '30', null);
INSERT INTO ordersum VALUES ('cec19c3d-e59f-48e9-8e55-6a06a88ae298', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-04-02 17:34:51', '30', '30', null);
INSERT INTO ordersum VALUES ('8104b7f0-b244-419c-9863-6fd617caf676', '-211', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', '2018-04-03 09:47:42', '30', '30', null);

-- ----------------------------
-- Table structure for `order_teaching_r`
-- ----------------------------
DROP TABLE IF EXISTS `order_teaching_r`;
CREATE TABLE `order_teaching_r` (
  `teachingId` varchar(36) NOT NULL,
  `orderId` varchar(36) NOT NULL COMMENT '取第一条订单ID',
  `lessonType` int(11) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `memberId` varchar(36) DEFAULT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`teachingId`,`orderId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='绑定任课老师的时候添加记录';

-- ----------------------------
-- Records of order_teaching_r
-- ----------------------------
INSERT INTO order_teaching_r VALUES ('7f566938-d95e-4c4b-b536-4ec72287862a', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '2', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', '24652540-af54-4120-abc8-79d166778f82');
INSERT INTO order_teaching_r VALUES ('236bc37a-989e-4469-a29f-f8b476f64045', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '2', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda');
INSERT INTO order_teaching_r VALUES ('5e9be195-5683-446e-a03f-7f45b50f5f2b', 'a4ed1185-d523-498e-b6b2-cc8df7aad5d2', '1', 'f78c8319-85b8-4397-87eb-8922b52bb7be', '979dddd5-b5a5-420c-afe8-0799a2f181c4', '24652540-af54-4120-abc8-79d166778f82');
INSERT INTO order_teaching_r VALUES ('1f8743ea-6823-49db-bb78-30df932c44d0', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '8', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', '24652540-af54-4120-abc8-79d166778f82');
INSERT INTO order_teaching_r VALUES ('ff6cf303-ec72-44ee-942f-9c45833f11e0', '3caf39e6-add0-44d8-807f-739f43b69023', '9', 'f39682f3-e4f2-4e4a-ab74-7558f08e4768', 'a23d7de7-60fb-4977-9071-09ad795141b5', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO order_teaching_r VALUES ('5bf11ef7-d53e-47ff-a57e-e18aed22910f', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '1', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda');
INSERT INTO order_teaching_r VALUES ('bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', '2', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'fdca369d-d683-4aaf-ac12-cc7b37805d28');
INSERT INTO order_teaching_r VALUES ('2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', '1', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO order_teaching_r VALUES ('dde3612a-990b-43e8-8ebb-02123e838cc1', '127f313b-6c0f-4f6f-8909-8fede191732e', '2', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO order_teaching_r VALUES ('6380cb70-c25e-4077-a2ff-b0f65449e08b', '127f313b-6c0f-4f6f-8909-8fede191732e', '3', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO order_teaching_r VALUES ('98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '2', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4');
INSERT INTO order_teaching_r VALUES ('a4272eba-cc9c-40da-9e9e-a7b9662a46f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', '2', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2d3829b4-17b3-46af-bf50-cd0eba5430f8');
INSERT INTO order_teaching_r VALUES ('8fd5a867-cf4b-4163-889e-e0778641a4a5', 'a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '1', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2d3829b4-17b3-46af-bf50-cd0eba5430f8');
INSERT INTO order_teaching_r VALUES ('9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5', 'd5b3a276-c468-49fc-9a19-12deccd4f5bb', '8', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', 'cbe83e91-b829-4dd8-b852-e1937c450fe9');
INSERT INTO order_teaching_r VALUES ('e64a4b66-c6d5-439d-b1ad-29929236a236', 'd5b3a276-c468-49fc-9a19-12deccd4f5bb', '2', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '8124288f-6f07-4cd0-a1ec-37a4e2171adb');
INSERT INTO order_teaching_r VALUES ('f849cbc7-5943-4710-b614-8f8cffd304e5', '87a767a8-22b6-48d9-a24a-cc6d52c975e9', '3', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '537f3647-8444-4525-94c9-5af57c3f55e8');
INSERT INTO order_teaching_r VALUES ('8426c300-a528-4318-8983-4fd19f3f0ff0', 'f8dcbaac-c133-4a7b-a161-d896376e3fad', '3', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '41816287-35ca-4235-bc89-ba2a2cb4abe1');
INSERT INTO order_teaching_r VALUES ('faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '2', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '377be561-9aaf-43a2-8a0d-9b601021c0e0');
INSERT INTO order_teaching_r VALUES ('88952680-bedf-47cc-86ed-8d61aa95abb7', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '2', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3');
INSERT INTO order_teaching_r VALUES ('8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '1', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336');
INSERT INTO order_teaching_r VALUES ('f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '7', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2bce5e19-c656-46ca-aa3b-5b5a0845c279');
INSERT INTO order_teaching_r VALUES ('425e3aab-b0d2-4521-b858-0a70509b5d9e', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '804e7d46-39ed-44e9-9ab4-cf06fac44d60');
INSERT INTO order_teaching_r VALUES ('7017346c-ff3f-4f42-9a40-e92dc324ef19', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '8', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de');
INSERT INTO order_teaching_r VALUES ('f558d3cb-3858-44de-aece-19b4ffc45396', '0074262e-7492-4540-a61a-ca5b55a31e45', '2', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '16684d26-3d14-45ff-8c3f-112d739be006');
INSERT INTO order_teaching_r VALUES ('748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', '1', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369');
INSERT INTO order_teaching_r VALUES ('8ecacfdd-351a-4381-bf5c-29bf8a815a88', '3b3aed7a-88af-4738-95e9-e6884326dbfa', '7', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '27b5a1a7-624f-40e1-9359-9196d0261133');
INSERT INTO order_teaching_r VALUES ('a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '2', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1');
INSERT INTO order_teaching_r VALUES ('6a2f9398-4577-4d5c-925c-b32352714ad2', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '7', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '8720b7bd-d7f8-4332-8254-1dee6e6ee071');
INSERT INTO order_teaching_r VALUES ('046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '3', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '853a2f31-f902-489c-8b7c-bea062277833');
INSERT INTO order_teaching_r VALUES ('39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '2', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '167b5e9e-8e57-4549-91cd-c10802eadaf8');
INSERT INTO order_teaching_r VALUES ('5a978ecd-96da-4eae-b3f5-8706fcb3792e', '63de6f8f-666b-4127-bf5a-a76bec815c24', '2', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b');
INSERT INTO order_teaching_r VALUES ('f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '3', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '853a2f31-f902-489c-8b7c-bea062277833');
INSERT INTO order_teaching_r VALUES ('6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', '8591dca2-85c5-45f2-a103-f7b09ed8962f', '3', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d');
INSERT INTO order_teaching_r VALUES ('9b6d689e-8671-4ee0-81f1-6cc27981b9c6', '63de6f8f-666b-4127-bf5a-a76bec815c24', '1', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513');
INSERT INTO order_teaching_r VALUES ('4d309b83-f780-4e70-9aaa-399c086cff52', '63de6f8f-666b-4127-bf5a-a76bec815c24', '7', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'edbfe293-e3a9-4062-8df4-318c836dd7e2');
INSERT INTO order_teaching_r VALUES ('f6dc4acc-f4d7-4aaf-b134-d818877620c9', '83bb28c1-8f21-483a-8348-07bf53f702ef', '2', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '63617903-e130-40ed-bb2f-b8ff2effb2fe');
INSERT INTO order_teaching_r VALUES ('a4dbc41f-3d29-4629-9d6d-1a3ff201eede', '53183a7a-8547-4823-b908-656b9e818f84', '2', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO order_teaching_r VALUES ('27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', '3', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO order_teaching_r VALUES ('60f60bee-3cc0-45e5-ab06-1fdc359f744d', '53183a7a-8547-4823-b908-656b9e818f84', '7', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '63617903-e130-40ed-bb2f-b8ff2effb2fe');
INSERT INTO order_teaching_r VALUES ('dc016cf8-e5ec-4661-8348-b3a59c4a235b', '4970c4d5-bda0-4b46-860d-51c53fa529ad', '9', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', 'ffb18612-b184-4291-b49f-5336cf8a913b');

-- ----------------------------
-- Table structure for `parents`
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents` (
  `parentId` varchar(36) NOT NULL,
  `parentName` varchar(36) DEFAULT NULL,
  `telNum` varchar(30) DEFAULT NULL,
  `weChatNum` varchar(36) DEFAULT NULL,
  `openId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`parentId`),
  UNIQUE KEY `AK_unique_key2` (`telNum`),
  UNIQUE KEY `AK_unique_key1` (`openId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='家长表';

-- ----------------------------
-- Records of parents
-- ----------------------------
INSERT INTO parents VALUES ('aaaa', 'aaaa', '18711019945', '15578901234', 'aaaaaaa');
INSERT INTO parents VALUES ('f39682f3-e4f2-4e4a-ab74-7558f08e4768', '王家长', '18711018800', '15578904433', 'aaaaabb');
INSERT INTO parents VALUES ('f78c8319-85b8-4397-87eb-8922b52bb7be', '李四家长', '15788213334', '', 'lisiparentsId');
INSERT INTO parents VALUES ('36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'Dengzhihua', '18711019949', '', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70');
INSERT INTO parents VALUES ('7f376be4-d891-48be-8529-9bc5b85185ca', '测试', '15580830465', null, 'oVbXbw4x8YNsY8M4mkHsprPUNLoo');
INSERT INTO parents VALUES ('00ccc852-42be-4e6d-98fe-df544f5d5984', '邓女士', '13875911271', null, 'oVbXbw8eO3oOM-uexSl8zfPRAIlM');
INSERT INTO parents VALUES ('4f64abe2-2e45-4b03-a4e6-4b1684255144', '夏玉荣', '18974611518', null, 'oVbXbw5QHZoq6ViOgx-E1AEBfXeA');
INSERT INTO parents VALUES ('a712fda3-c0c0-49aa-be5d-4e90401c368b', '何', '18702618899', null, 'oVbXbw9JLABqrfu3YB3AxpOsI56w');
INSERT INTO parents VALUES ('9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '测试', '1', null, 'oVbXbw1H5yK7VmcaQAsgBvxLXDwo');
INSERT INTO parents VALUES ('b69c3ccb-f365-4740-b659-ec0e2d13f13b', '555', '1234567', null, 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw');
INSERT INTO parents VALUES ('cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '王利红', '13617483661', null, 'oVbXbw2nFXVjiygGB4yWRWmJwZGA');
INSERT INTO parents VALUES ('e4220f11-1e90-45b1-985a-3317cef45f4a', '陶豆豆', '18670314266', '', 'oVbXbw-sg31MqzYypipxso5ik7Jw');
INSERT INTO parents VALUES ('f977c4bc-4de9-403e-b34d-730e03a0469c', '曹艳', '13808463279', null, 'oVbXbw-wH1caZFtcestY2i9QNrp8');
INSERT INTO parents VALUES ('acb53310-f57c-4494-bee1-01350617b37f', '袁改华', '18975898882', null, 'oVbXbw7822ek7xNh2gzfni4nX64g');
INSERT INTO parents VALUES ('ada7441e-2a38-4c03-aee6-234be39aa128', '夏艺菲', '13080525539', null, 'oVbXbw5HKJbeWT6WGh7zAhfLm_Ns');
INSERT INTO parents VALUES ('71ca2567-8288-433a-98ed-bbf3c00b9659', '尹满枚', '15367648823', null, 'oVbXbwyHsjmIuzwE-YA9X90QyBcM');
INSERT INTO parents VALUES ('18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', '白玉萍', '13707319633', null, 'oVbXbw2V47NX1QcBtqffbsNRtFLA');
INSERT INTO parents VALUES ('01df4fe5-315c-4db2-ab49-c314c9f891d3', '黄初民', '13874538730', null, 'oVbXbwzp8RGQYkYcjF_SsdF6EFHY');
INSERT INTO parents VALUES ('daa3f486-e6ce-4b50-ad09-519dac09757e', '路娜', '13787016094', null, 'oVbXbw2J9BYOnESANFLnTm2CLVAE');
INSERT INTO parents VALUES ('5c46e95c-67de-483d-963c-e62865b80f64', '付玉芳', '18670015918', null, 'oVbXbwx4K2ywmAOIJjI4JNFJoVn4');
INSERT INTO parents VALUES ('57e0b0b8-98a2-44a2-b66f-b92af290e11c', '张泓练', '13787075423', null, 'oVbXbwwpZ1vAiBDoTV6h5Y_mtNO4');
INSERT INTO parents VALUES ('bd2bfad2-d416-4939-81b0-bec28836261a', null, '18574392815', 'l1787180652', 'oVbXbw5s50vdkLFZWcs3iDU5tX3M');
INSERT INTO parents VALUES ('f62115b3-d4ae-49e7-97b0-57f35cd5f828', '匡先生', '17673134545', null, 'oVbXbw0e5GYmDckFplHH5OCH_X3c');
INSERT INTO parents VALUES ('ea35171a-848e-4d9c-8dc5-94e55607f68b', '侯国', '18670334562', null, 'oVbXbwybMON0X1gSBtS9ayikxPw4');
INSERT INTO parents VALUES ('59c108b6-64a5-44ed-b1c6-e05ff13a9254', '李艳红', '13107211065', null, 'oVbXbw5d3U3pgAADE2wjuj5cR8t4');
INSERT INTO parents VALUES ('ba55085d-b32b-46f0-950c-3f21029d77a8', null, '18574384061', '3361212227', 'oVbXbwwOE7yzHjGJp1Pd7Cw00tN8');
INSERT INTO parents VALUES ('e46ae7bc-895e-4c52-ad67-b03f575b6227', '汪嘉陵', '13517418068', null, 'oVbXbw4VvGPQs8BodXl5gJPqtL5M');
INSERT INTO parents VALUES ('90377ef4-f065-4fe0-9318-a093c74c800a', '陈正春', '15674869808', null, 'oVbXbwwn_1abXhL6bfOyYrqnXaIc');
INSERT INTO parents VALUES ('b1475005-13a1-4485-b69d-babaaf35da66', '廖辉', '18874165445', null, 'oVbXbwy6gqNxmwBxqdWx2RqPhEPU');
INSERT INTO parents VALUES ('08157e24-cdda-46d0-a4e1-56cc607c2951', '刘婧', '13974635575', null, 'oVbXbw4MjDaF8F44mcy_mMgWGT9E');
INSERT INTO parents VALUES ('5138ed9b-82af-4252-9c10-0943693449ae', '许斌海', '18973508826', null, 'oVbXbwyUuyPAmfFhzKvwEwWLUf1g');
INSERT INTO parents VALUES ('59a3027d-9bc9-4447-9b38-07b7b6769c0f', '张玲', '13667314903', null, 'oVbXbw2CjACmpC3kNmUcepHU99jU');
INSERT INTO parents VALUES ('e8aedf60-f545-4165-8aac-be143e7394d8', '罗志军', '15308422162', null, 'oVbXbw3uwQzorBlO540_fPwZ-EC4');
INSERT INTO parents VALUES ('acb5bc9f-534e-4661-b0b5-0054c5827683', '钟国茂', '13974868803', null, 'oVbXbw7-_vX70-1XKSFA9o_iXD9w');
INSERT INTO parents VALUES ('79e4bdc8-874d-4cb2-a907-58215f7af76e', '熊俊', '13017393568', null, 'oVbXbwzitXv1C-XmSZlJKH7_Gcz8');
INSERT INTO parents VALUES ('8c754fe0-ecca-4827-a94d-62c0400e5990', '陈女士', '15367955257', null, 'oVbXbwweYJ8mz_OBU0MZoFT2NOgQ');
INSERT INTO parents VALUES ('61a2d234-2403-434a-bb0b-be4dbc31bcc7', '周华', '13055172298', null, 'oVbXbw2thsVAEOx--IIxFfdT6Om4');
INSERT INTO parents VALUES ('34f84cec-a42c-4ab4-93b3-bc485bc4f52a', '杨翠', '15874819298', null, 'oVbXbw8XS94kDwI_9atTIKNhdxWA');
INSERT INTO parents VALUES ('205ee471-0dcd-430e-a558-df805a87fb62', '家', '18570355097', null, 'oVbXbw19AzNPPhQysJZsF6gs15jg');
INSERT INTO parents VALUES ('09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '陈岩平', '14726971008', null, 'oVbXbw9cwZ2v1li11293qbJOXbiI');
INSERT INTO parents VALUES ('9b2daa11-9851-41f0-8365-dc3ce439c584', '钟俊', '18874299916', '', 'oVbXbw4uMHHKRBgzN7ThvhwvaMCw');
INSERT INTO parents VALUES ('d9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '彭彩平', '18890369478', null, 'oVbXbw-gQ3GMcaGzbvh4TDvFmWHI');
INSERT INTO parents VALUES ('971e4640-7ca7-48cb-8a2e-f46c408d66a4', '刘建群', '17382176261', null, 'oVbXbwz-C87ZcV1XcxELTzsd4mvU');
INSERT INTO parents VALUES ('dbecd1c6-a69d-448d-ac31-325b8c1f9885', '罗召平', '18073184126', null, 'oVbXbwxAN7aPxzK-PuSTSqdhMWUQ');
INSERT INTO parents VALUES ('925a659e-1f94-4ae9-ab95-b4f6d9ad306d', null, '13278880991', 'liyunmei250', 'oVbXbw79KCaCH7_NidWft6_s-z7A');
INSERT INTO parents VALUES ('5c35d1d6-e854-4722-872d-da57ba2a6c91', '吴芳林', '13975118812', null, 'oVbXbwyd4sqljZY8FPTDcmlmRUzA');

-- ----------------------------
-- Table structure for `parent_stu_r`
-- ----------------------------
DROP TABLE IF EXISTS `parent_stu_r`;
CREATE TABLE `parent_stu_r` (
  `memberId` varchar(36) NOT NULL,
  `parentId` varchar(36) NOT NULL,
  PRIMARY KEY (`memberId`,`parentId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='家属-学生关系表';

-- ----------------------------
-- Records of parent_stu_r
-- ----------------------------
INSERT INTO parent_stu_r VALUES ('01bf9958-85e2-49e6-a36c-2840efd63af0', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('0f390070-d868-42d9-832e-8dd8cf229124', 'd470160f-c9f7-45c2-8e97-66acf23c7b67');
INSERT INTO parent_stu_r VALUES ('1111111111111', 'aaaa');
INSERT INTO parent_stu_r VALUES ('174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984');
INSERT INTO parent_stu_r VALUES ('1c3e0941-112b-4664-9463-6865ec8c5912', '205ee471-0dcd-430e-a558-df805a87fb62');
INSERT INTO parent_stu_r VALUES ('206036fd-d511-4eb0-b8d3-60c59bc84d15', '01df4fe5-315c-4db2-ab49-c314c9f891d3');
INSERT INTO parent_stu_r VALUES ('20ca5d97-841f-4928-819c-173852f3d70d', 'c9faef4f-f860-433a-b183-e6e5263b335e');
INSERT INTO parent_stu_r VALUES ('22222222', 'bbbb');
INSERT INTO parent_stu_r VALUES ('279c6d0d-1a69-4155-927d-e50faf8787b6', '5138ed9b-82af-4252-9c10-0943693449ae');
INSERT INTO parent_stu_r VALUES ('2b1ec3b4-44b8-4be8-a009-24b7cb87717d', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885');
INSERT INTO parent_stu_r VALUES ('2f724a1e-3399-4652-89ed-cdf6af080c6f', '971e4640-7ca7-48cb-8a2e-f46c408d66a4');
INSERT INTO parent_stu_r VALUES ('3246e59a-15a3-47af-a685-50d8460c547e', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO parent_stu_r VALUES ('3387b77f-ba5c-4938-95aa-333390967bdb', 'db6d9354-2166-4cfa-abf1-233be87d7a23');
INSERT INTO parent_stu_r VALUES ('35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('397f9d9d-e20a-49b4-b199-669f60db95cf', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('3f197c20-4852-4af1-a3fe-4a91cba046a0', '71ca2567-8288-433a-98ed-bbf3c00b9659');
INSERT INTO parent_stu_r VALUES ('410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951');
INSERT INTO parent_stu_r VALUES ('41af7d4e-fc40-4296-bdd4-8ab696fc9462', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO parent_stu_r VALUES ('428631d2-f204-4fa5-838a-4072fe589d70', '247214c8-e6ae-4a38-9a44-cbb005f953cd');
INSERT INTO parent_stu_r VALUES ('4426451c-de65-4564-8ddf-2bbee72841ae', '7f376be4-d891-48be-8529-9bc5b85185ca');
INSERT INTO parent_stu_r VALUES ('443742e9-e233-4044-a99d-bce47d1e8b13', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9');
INSERT INTO parent_stu_r VALUES ('58300141-5fec-4bc2-8820-fcc41947142d', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('591d3d72-c24e-4218-9b7e-9af08ce8e493', '8c754fe0-ecca-4827-a94d-62c0400e5990');
INSERT INTO parent_stu_r VALUES ('5c7608cd-b804-4f65-9959-a58b4421cb78', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO parent_stu_r VALUES ('5c7f5e36-535f-48f8-8763-0f9b6318073e', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('5cc50b32-8179-458f-9663-8704d9ebddff', '9b2daa11-9851-41f0-8365-dc3ce439c584');
INSERT INTO parent_stu_r VALUES ('5e923add-eaca-4bd3-acc2-27b1bb3c2240', 'e4220f11-1e90-45b1-985a-3317cef45f4a');
INSERT INTO parent_stu_r VALUES ('5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', 'b1475005-13a1-4485-b69d-babaaf35da66');
INSERT INTO parent_stu_r VALUES ('625a1ecf-6699-4ae6-ba41-fe47451a796b', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO parent_stu_r VALUES ('6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144');
INSERT INTO parent_stu_r VALUES ('7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c');
INSERT INTO parent_stu_r VALUES ('773ea73a-5135-41f4-8000-55901b2015a2', '79e4bdc8-874d-4cb2-a907-58215f7af76e');
INSERT INTO parent_stu_r VALUES ('79c93b34-1803-4808-8053-447c66039516', '59a3027d-9bc9-4447-9b38-07b7b6769c0f');
INSERT INTO parent_stu_r VALUES ('7c1f175e-92ad-4a83-af61-faf4571dc87d', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('7f0861de-91ef-4f10-9a4e-f836998778db', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828');
INSERT INTO parent_stu_r VALUES ('7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15');
INSERT INTO parent_stu_r VALUES ('8478bec7-44bc-4e19-b03e-445828affb23', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f');
INSERT INTO parent_stu_r VALUES ('8732f4d6-78c4-4bc3-92f1-a0d5d5ffe746', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO parent_stu_r VALUES ('87561e40-93ca-436f-90a8-eef75fe735b3', 'e8aedf60-f545-4165-8aac-be143e7394d8');
INSERT INTO parent_stu_r VALUES ('8e877e9f-2f15-4439-a66a-9ab9b5e0903c', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'acb5bc9f-534e-4661-b0b5-0054c5827683');
INSERT INTO parent_stu_r VALUES ('94dc98ce-b50f-4e97-9a00-17bcc16bcf1b', 'cf1022ff-3e32-4813-8231-300b6b24bfae');
INSERT INTO parent_stu_r VALUES ('976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64');
INSERT INTO parent_stu_r VALUES ('979dddd5-b5a5-420c-afe8-0799a2f181c4', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO parent_stu_r VALUES ('993d2b0b-eea2-4fb7-9c43-6ffe8db1f21a', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO parent_stu_r VALUES ('9d104509-38cf-4482-ba5c-31f3d444c4a3', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('9fff5f18-3b48-416f-a009-c0b27fdcc93b', 'b0da32eb-4487-4e46-b742-7cabb3c368db');
INSERT INTO parent_stu_r VALUES ('a23d7de7-60fb-4977-9071-09ad795141b5', 'f39682f3-e4f2-4e4a-ab74-7558f08e4768');
INSERT INTO parent_stu_r VALUES ('a323675b-0a7f-4879-ab9e-33c1520f711f', '5c35d1d6-e854-4722-872d-da57ba2a6c91');
INSERT INTO parent_stu_r VALUES ('a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149');
INSERT INTO parent_stu_r VALUES ('a7469233-0f1b-4399-b129-175f675263fa', 'ea35171a-848e-4d9c-8dc5-94e55607f68b');
INSERT INTO parent_stu_r VALUES ('a7e63cca-aeaa-4721-897c-3343c55c7a85', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO parent_stu_r VALUES ('aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f');
INSERT INTO parent_stu_r VALUES ('adc3ed56-0a9b-4891-b1fc-7177706d51e9', 'ba55085d-b32b-46f0-950c-3f21029d77a8');
INSERT INTO parent_stu_r VALUES ('ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a');
INSERT INTO parent_stu_r VALUES ('b0ed5520-5db1-4d33-ad3c-7f1f50fbe3d9', '9c61a3fb-7f97-40c1-a3d8-5f4e82a459cd');
INSERT INTO parent_stu_r VALUES ('b1823fff-7045-4d46-b604-dfbf931ebbf8', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('b2511e3f-2e8b-4d28-ad76-602587b0c99d', 'ad3ffcfd-2b45-4b4b-aee8-64e5c412eb9d');
INSERT INTO parent_stu_r VALUES ('b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', 'daa3f486-e6ce-4b50-ad09-519dac09757e');
INSERT INTO parent_stu_r VALUES ('b485cc15-b6e9-4153-90a8-7899d9d8d91d', '925a659e-1f94-4ae9-ab95-b4f6d9ad306d');
INSERT INTO parent_stu_r VALUES ('b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO parent_stu_r VALUES ('be438bc5-086b-4b5b-81a4-514538974df4', 'bd2bfad2-d416-4939-81b0-bec28836261a');
INSERT INTO parent_stu_r VALUES ('bfc281a0-b413-4512-a5df-a227f4e0d4b2', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42');
INSERT INTO parent_stu_r VALUES ('c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '7f376be4-d891-48be-8529-9bc5b85185ca');
INSERT INTO parent_stu_r VALUES ('c3aaf29b-1a17-43a5-9834-6d3a7bb0892c', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('cb59b673-ca98-44c8-9c11-edf767c19f5f', '59c108b6-64a5-44ed-b1c6-e05ff13a9254');
INSERT INTO parent_stu_r VALUES ('cbd33cfb-fa8b-448c-910b-49376984f911', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO parent_stu_r VALUES ('cccbb380-7dd4-44b5-8e79-19f7b610d433', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('ccd49818-39cb-4ee1-b792-01688dfbef24', 'ada7441e-2a38-4c03-aee6-234be39aa128');
INSERT INTO parent_stu_r VALUES ('d1567855-910a-44b2-950a-58fd9b3338b7', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('d15cad6d-218d-47aa-a5bd-513730c701c3', '61a2d234-2403-434a-bb0b-be4dbc31bcc7');
INSERT INTO parent_stu_r VALUES ('d4bb6b04-013a-48cf-9a1e-9a611309e597', '13477b94-ad83-4554-a68f-5d8d2235c14d');
INSERT INTO parent_stu_r VALUES ('de13ba03-5a2e-4e03-a135-4585cfbe5af8', '6a33932d-c4d5-48e9-9bb2-b5c8228cf210');
INSERT INTO parent_stu_r VALUES ('e11b2b2c-e1c9-4e2d-b525-ac74e1fa1874', '33a73459-0041-4a97-9b79-93b120f030ca');
INSERT INTO parent_stu_r VALUES ('e41ed9a9-bd9b-4f3e-8468-efa07fd4c2e7', 'c1815cf2-85a3-4e93-9af3-868864b4d9b5');
INSERT INTO parent_stu_r VALUES ('e6058b90-7154-4677-8172-185b1e30f894', 'e46ae7bc-895e-4c52-ad67-b03f575b6227');
INSERT INTO parent_stu_r VALUES ('e78f0e67-17c9-462d-ae45-453daf6562d5', 'a712fda3-c0c0-49aa-be5d-4e90401c368b');
INSERT INTO parent_stu_r VALUES ('e816cc30-deb4-4c66-b310-92b91b4e7a5b', '90377ef4-f065-4fe0-9318-a093c74c800a');
INSERT INTO parent_stu_r VALUES ('e98c04c3-7e46-45c7-a835-708d35b343a8', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO parent_stu_r VALUES ('eda53a7c-3cf6-4b7e-a32d-845a622afe37', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9');
INSERT INTO parent_stu_r VALUES ('f9174d35-bbc7-40aa-8003-fb77a08a6288', '8c3a338a-339b-4217-84ab-29ffdf1156cc');
INSERT INTO parent_stu_r VALUES ('fbbd1e55-2923-4010-9125-e4aeb425b229', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '57e0b0b8-98a2-44a2-b66f-b92af290e11c');
INSERT INTO parent_stu_r VALUES ('fe6d78ca-0290-47eb-894e-3b7be3d0044a', '69035d26-961f-46ca-a777-0199c784eeb4');

-- ----------------------------
-- Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `picId` varchar(36) NOT NULL,
  `picUrl` varchar(500) DEFAULT NULL,
  `picName` varchar(200) DEFAULT NULL,
  `picType` tinyint(2) DEFAULT NULL COMMENT '0：banner图片\r\n            1：学员头像\r\n            2：家长头像\r\n            3：老师头像\r\n            ',
  PRIMARY KEY (`picId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片信息表';

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO picture VALUES ('af478f7f-f9e2-4eab-a99e-bbb3c3abc79c', 'https://baike.baidu.com/pic/vsftpd/5254770/0/54fbb2fb43166d2273d5d3e34f2309f79052d223?fr=lemma&ct=single#aid=0&pic=54fbb2fb43166d2273d5d3e34f2309f79052d223', '测试老师11557876534', '3');
INSERT INTO picture VALUES ('7e66a9ab-b9c3-4127-a11e-e3bbf02167d0', 'https://baike.baidu.com/pic/vsftpd/5254770/0/54fbb2fb43166d2273d5d3e34f2309f79052d223?fr=lemma&ct=single#aid=0&pic=54fbb2fb43166d2273d5d3e34f2309f79052d223', '测试老师21557876535', '3');
INSERT INTO picture VALUES ('ef1f04d8-6380-4a82-ac24-579e090d0757', '[]', '黄黄11111', '3');
INSERT INTO picture VALUES ('78e4b2f0-c864-4a90-82f5-aac3466ec8cd', null, '嘿嘿嘿嘿嘿嘿嘿嘿', '3');
INSERT INTO picture VALUES ('3620eb6f-a068-43cd-bb7a-fdcdd2cab977', null, '大学生111', '3');
INSERT INTO picture VALUES ('c62ea788-8af1-4cc2-958b-7b086caf84d7', null, '中南大学1111', '3');
INSERT INTO picture VALUES ('97875bb1-0f8c-4a7a-bc76-969f238d1130', null, '中南大学中南大学', '3');
INSERT INTO picture VALUES ('04b8ce83-277b-48b5-98f6-d4a651cfee27', null, '研究男123', '3');
INSERT INTO picture VALUES ('b9f2e5ad-6daa-482a-9951-c52c17c8a0ff', null, '11111', '3');
INSERT INTO picture VALUES ('6ea548c5-fc9c-4ccb-9c45-8c4899623819', null, '高级老师18674123456', '3');
INSERT INTO picture VALUES ('a201a42f-c557-4803-9895-5b74068bbcab', null, '刘嬷嬷19356784567', '3');
INSERT INTO picture VALUES ('7439dd0a-65c3-4fea-9829-c09a91d433a3', null, '刘国臣测试15580830349', '3');
INSERT INTO picture VALUES ('c623daa1-3bdd-4740-a728-f3d43de47d0b', null, '向嘉博18397413862', '3');
INSERT INTO picture VALUES ('99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7', null, '谢新茹15981671529', '3');
INSERT INTO picture VALUES ('4115f4bb-95d7-4d87-8e07-ac21a3277a03', null, '向嘉博18397413862', '3');
INSERT INTO picture VALUES ('be9186cf-49b4-4cb0-a16a-48024dfc4461', null, 'nullnull', '3');
INSERT INTO picture VALUES ('d775d3bc-f859-4ff9-bb92-e76669ac5c71', null, '冯龙兴15367487002', '3');
INSERT INTO picture VALUES ('21d5d442-8052-43c0-9e23-543018059625', null, '吴月颖18774839836', '3');
INSERT INTO picture VALUES ('456d056f-25ff-4c65-a77e-23a1a2084a52', null, '崔向影15084762874', '3');
INSERT INTO picture VALUES ('2432cad4-aff7-4382-a772-09662b7113b2', null, '麻万明1365785997', '3');
INSERT INTO picture VALUES ('9ee049ff-2e20-4655-9d2b-4cb7fe814566', null, '陈皓18774975537', '3');
INSERT INTO picture VALUES ('e23d7bca-6405-4c49-8b7f-14fe663ee4d4', null, '徐慧颖15274810285', '3');
INSERT INTO picture VALUES ('efd06f65-eef6-410f-8f0c-36621ea31a86', null, '程凡18154217405', '3');
INSERT INTO picture VALUES ('c1f40a57-7146-4a06-9e62-c50f6f75bfbf', null, '朱晓龙18273120371', '3');
INSERT INTO picture VALUES ('48d4c1ec-c136-49ed-96fc-b4fbe9010dd0', null, '吴洋13278881603', '3');
INSERT INTO picture VALUES ('ca67e8ef-09d5-466b-a796-82622add5cac', null, '陈松18373150752', '3');
INSERT INTO picture VALUES ('92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f', null, '吴洋13278881603', '3');
INSERT INTO picture VALUES ('e88ffb63-b250-44bc-9083-3324cba01eb0', null, '夏欣研13545212652', '3');
INSERT INTO picture VALUES ('e05ca04a-ccca-4ee9-bb9a-383acab20a3c', null, '齐宁17375876043', '3');
INSERT INTO picture VALUES ('bc9b247d-70e7-4bcd-b8be-aa4d3721984b', null, '姜波15111016224', '3');
INSERT INTO picture VALUES ('4e97532e-22ac-492b-a118-89a5c6b31c3c', null, '胡潇羽13142008762', '3');
INSERT INTO picture VALUES ('bc0be7a4-38e6-4366-a74e-903d322e4b0a', null, '吕向前18569400050', '3');
INSERT INTO picture VALUES ('15a7c808-098b-4e8d-9f19-1022b6d5b387', null, '张文慧13635562695', '3');
INSERT INTO picture VALUES ('4583b87a-1eb3-4cfb-9a47-f1af60d01467', null, '左博聪15111095615', '3');
INSERT INTO picture VALUES ('1394814e-1348-4132-90cd-ac01732facd5', null, '邢凯迪18174451062', '3');
INSERT INTO picture VALUES ('1cc35afa-391b-49dc-a0bb-5f401eaf56f0', null, '王宁13667337306', '3');
INSERT INTO picture VALUES ('64a7f49d-15db-48dd-9e50-044c15314a33', null, '陈娴17308416020', '3');
INSERT INTO picture VALUES ('8d4c35e9-dcad-44ff-a297-c55789914717', null, '薛潇13909620950', '3');
INSERT INTO picture VALUES ('6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a', null, '姜蕊18390987440', '3');
INSERT INTO picture VALUES ('d6484e68-7a9a-4fca-812c-1bdb64a951e3', null, '胡嘉欣18272057850', '3');
INSERT INTO picture VALUES ('fb43828f-b728-405c-9b0d-a71668e4b977', null, '李东刚18670308329', '3');
INSERT INTO picture VALUES ('37d65abe-e61a-4874-a07b-02cd238c6dc7', null, '李东刚18670308329', '3');
INSERT INTO picture VALUES ('c6948d2a-e3d4-49ca-8adc-7e657268cb2e', null, '李东刚18670308329', '3');
INSERT INTO picture VALUES ('961c91e1-0607-4dea-ba8d-c96a1cb18315', null, 'ceshiliulaoshi15587976896', '3');
INSERT INTO picture VALUES ('5c9eed81-ccfb-4a27-928d-52756f3362d8', null, '麻万明13657485997', '3');

-- ----------------------------
-- Table structure for `schedule`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预约管理';

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO schedule VALUES ('0738d5ef-8a05-4a2c-98b1-7ae2b1a33720', null, '9fff5f18-3b48-416f-a009-c0b27fdcc93b', 'b0da32eb-4487-4e46-b742-7cabb3c368db', '111', '2018-01-09 23:29:37', '0', '未处理');
INSERT INTO schedule VALUES ('63bf2cc4-32e4-480c-8a46-e9b7ff7eb4f0', null, null, 'aaaa', '321', '2018-01-08 20:59:48', '0', '未处理');
INSERT INTO schedule VALUES ('27e3c4ba-9486-4d82-82ca-170a1cb2508a', null, 'e11b2b2c-e1c9-4e2d-b525-ac74e1fa1874', '33a73459-0041-4a97-9b79-93b120f030ca', '-111', '2018-03-04 15:46:06', '0', '未处理');
INSERT INTO schedule VALUES ('ade58d16-7cfb-42b7-92a4-4e4835b79e2d', null, 'd4bb6b04-013a-48cf-9a1e-9a611309e597', '13477b94-ad83-4554-a68f-5d8d2235c14d', '-122', '2018-03-04 15:47:03', '0', '未处理');
INSERT INTO schedule VALUES ('13e5cad4-c9b8-4058-8890-592e8c4f1e0d', null, 'fe6d78ca-0290-47eb-894e-3b7be3d0044a', '69035d26-961f-46ca-a777-0199c784eeb4', '-111', '2018-03-04 15:55:28', '0', '未处理');
INSERT INTO schedule VALUES ('82a48461-75a5-4735-a626-68bf4ab00065', null, 'e98c04c3-7e46-45c7-a835-708d35b343a8', '69035d26-961f-46ca-a777-0199c784eeb4', '-151', '2018-03-04 16:23:42', '0', '未处理');
INSERT INTO schedule VALUES ('c3b741b2-fb09-4815-8ba7-73fabe407b30', null, '3246e59a-15a3-47af-a685-50d8460c547e', '69035d26-961f-46ca-a777-0199c784eeb4', '-221', '2018-03-04 16:40:17', '0', '未处理');
INSERT INTO schedule VALUES ('e696fe5c-c03c-4fa3-91f4-23e07f76f396', null, 'be438bc5-086b-4b5b-81a4-514538974df4', 'bd2bfad2-d416-4939-81b0-bec28836261a', '-232', '2018-03-18 20:24:10', '0', '未处理');
INSERT INTO schedule VALUES ('fa96398e-df41-4ea9-9b84-53d74afb65ae', null, '0f390070-d868-42d9-832e-8dd8cf229124', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '-337', '2018-03-04 17:08:30', '0', '未处理');
INSERT INTO schedule VALUES ('79a0685d-12e4-49de-915a-c4dfa8841b46', null, 'adc3ed56-0a9b-4891-b1fc-7177706d51e9', 'ba55085d-b32b-46f0-950c-3f21029d77a8', '-232', '2018-03-21 18:51:00', '0', '未处理');
INSERT INTO schedule VALUES ('48f34b16-5b69-458a-b0ec-48cd56e50071', null, '993d2b0b-eea2-4fb7-9c43-6ffe8db1f21a', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '-111', '2018-04-02 22:43:45', '0', '未处理');
INSERT INTO schedule VALUES ('06b8279f-79da-4067-9e29-a61fc7e25a58', null, 'b485cc15-b6e9-4153-90a8-7899d9d8d91d', '925a659e-1f94-4ae9-ab95-b4f6d9ad306d', '-319', '2018-04-02 23:02:31', '0', '未处理');
INSERT INTO schedule VALUES ('d450b141-76dc-4e98-ba8c-d4b803a57ab1', null, '5cc50b32-8179-458f-9663-8704d9ebddff', '9b2daa11-9851-41f0-8365-dc3ce439c584', '-212', '2018-03-31 21:08:31', '0', '未处理');

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `schoolId` varchar(36) NOT NULL,
  `schoolName` varchar(100) DEFAULT NULL,
  `schoolAddress` varchar(500) DEFAULT NULL,
  `termInfo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`schoolId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学校信息';

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO school VALUES ('0df8c14e-2710-46db-86e0-b9cab53c995f', '测试学校', null, null);
INSERT INTO school VALUES ('e5d67246-97a1-4168-911c-e839fad40a0c', '黄黄黄黄黄黄', null, null);
INSERT INTO school VALUES ('1a2e9c4f-a042-44bd-9440-1fcdd323d5aa', '嘿嘿', null, null);
INSERT INTO school VALUES ('7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '中南大学', null, null);
INSERT INTO school VALUES ('93a83e90-cb0d-444c-9832-7d098d67b65f', '无名', null, null);
INSERT INTO school VALUES ('e0fe4196-01ed-47e5-a297-37c81239b264', '111', null, null);
INSERT INTO school VALUES ('1389a575-e1a9-46ab-853d-c2df5adcad5f', '牛B大学', null, null);
INSERT INTO school VALUES ('027ba369-4f51-4cd1-ada8-2607efa2fe50', '新疆石河子大学', null, null);
INSERT INTO school VALUES ('7ecf30e2-849b-4e93-82ba-469a2be66d32', '中南', null, null);
INSERT INTO school VALUES ('8646e245-5ff5-49ba-85ed-fcff3b391956', null, null, null);
INSERT INTO school VALUES ('59046373-c6d8-4ca4-b133-89416ead9a20', '1111', null, null);
INSERT INTO school VALUES ('f3e0ee6c-7c5f-42ca-8060-f2b39dbf2361', 'nihao', null, null);

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `memberId` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `classID` varchar(36) DEFAULT NULL,
  `gradeId` varchar(36) DEFAULT NULL,
  `schoolId` varchar(36) DEFAULT NULL,
  `picId` varchar(36) DEFAULT NULL,
  `isStarMember` tinyint(1) DEFAULT '0' COMMENT '0：不是\r\n            1：是',
  `gentle` tinyint(1) DEFAULT NULL COMMENT '1：男\r\n            2：女',
  `telNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  UNIQUE KEY `key_2` (`telNum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学员信息表 - 对应原 starStudent表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO student VALUES ('1111111111111', '111111', '1111', '4', '111', '111', null, '0', '18711019949');
INSERT INTO student VALUES ('22222222', '222', '222', '3', '0df8c14e-2710-46db-86e0-b9cab53c995f', '7e66a9ab-b9c3-4127-a11e-e3bbf02167d0', '1', '1', '18711234687');
INSERT INTO student VALUES ('9fff5f18-3b48-416f-a009-c0b27fdcc93b', '333333', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('a23d7de7-60fb-4977-9071-09ad795141b5', '333333', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('979dddd5-b5a5-420c-afe8-0799a2f181c4', '揉揉', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('b8e8b670-e258-41b7-b899-913dc1eeedaa', '导入', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('cbd33cfb-fa8b-448c-910b-49376984f911', '二哥', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('a7e63cca-aeaa-4721-897c-3343c55c7a85', '尔の', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('8732f4d6-78c4-4bc3-92f1-a0d5d5ffe746', '34', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('20ca5d97-841f-4928-819c-173852f3d70d', '机会', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('b2511e3f-2e8b-4d28-ad76-602587b0c99d', '是否', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('94dc98ce-b50f-4e97-9a00-17bcc16bcf1b', '321', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('b0ed5520-5db1-4d33-ad3c-7f1f50fbe3d9', '??', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('de13ba03-5a2e-4e03-a135-4585cfbe5af8', '??', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('428631d2-f204-4fa5-838a-4072fe589d70', '??', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e41ed9a9-bd9b-4f3e-8468-efa07fd4c2e7', 'xxx', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('f9174d35-bbc7-40aa-8003-fb77a08a6288', '??', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('3387b77f-ba5c-4938-95aa-333390967bdb', '', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('b1823fff-7045-4d46-b604-dfbf931ebbf8', '登登登', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('c3aaf29b-1a17-43a5-9834-6d3a7bb0892c', '达克赛德', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('8e877e9f-2f15-4439-a66a-9ab9b5e0903c', '测试测试2', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('35f12b3c-d029-459c-9b7c-619f3f44f2ef', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('7c1f175e-92ad-4a83-af61-faf4571dc87d', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('d1567855-910a-44b2-950a-58fd9b3338b7', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('01bf9958-85e2-49e6-a36c-2840efd63af0', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('4426451c-de65-4564-8ddf-2bbee72841ae', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('cccbb380-7dd4-44b5-8e79-19f7b610d433', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('fbbd1e55-2923-4010-9125-e4aeb425b229', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('397f9d9d-e20a-49b4-b199-669f60db95cf', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('5c7f5e36-535f-48f8-8763-0f9b6318073e', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('58300141-5fec-4bc2-8820-fcc41947142d', null, null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('625a1ecf-6699-4ae6-ba41-fe47451a796b', '邓志华', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e11b2b2c-e1c9-4e2d-b525-ac74e1fa1874', '11', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('d4bb6b04-013a-48cf-9a1e-9a611309e597', '长城', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('fe6d78ca-0290-47eb-894e-3b7be3d0044a', '等一会', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('5c7608cd-b804-4f65-9959-a58b4421cb78', '啊啊啊', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e98c04c3-7e46-45c7-a835-708d35b343a8', '哦尼酱', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('3246e59a-15a3-47af-a685-50d8460c547e', '做我的', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('9d104509-38cf-4482-ba5c-31f3d444c4a3', '重复厕所', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('0f390070-d868-42d9-832e-8dd8cf229124', '贺小龙', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('443742e9-e233-4044-a99d-bce47d1e8b13', 'Hhbn', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e78f0e67-17c9-462d-ae45-453daf6562d5', '何', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '测试lgc', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '测试', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('6c69c410-b8f4-4e73-bddc-e7ced436868d', '贺小龙', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('41af7d4e-fc40-4296-bdd4-8ab696fc9462', '贺小龙测试', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '吕天麟', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '李旭', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('174c0610-22d9-4e7f-a40d-5a0bb9d62373', '陈能之', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('5e923add-eaca-4bd3-acc2-27b1bb3c2240', '常莹莹', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '颜正奇', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '肖熠', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('ccd49818-39cb-4ee1-b792-01688dfbef24', '夏振兴', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('3f197c20-4852-4af1-a3fe-4a91cba046a0', '张桐玮', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('bfc281a0-b413-4512-a5df-a227f4e0d4b2', '贺煜', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('206036fd-d511-4eb0-b8d3-60c59bc84d15', '黄婧', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '吴祺', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('976c9d2a-c334-49bb-8cae-051af9eeae66', '付睿腾', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '王子阳', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('be438bc5-086b-4b5b-81a4-514538974df4', '李婉婷', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('7f0861de-91ef-4f10-9a4e-f836998778db', '匡欣翔', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('a7469233-0f1b-4399-b129-175f675263fa', '程佳骏', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('cb59b673-ca98-44c8-9c11-edf767c19f5f', '杨旭', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('adc3ed56-0a9b-4891-b1fc-7177706d51e9', '郑琪', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e6058b90-7154-4677-8172-185b1e30f894', '胡璟璇', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e816cc30-deb4-4c66-b310-92b91b4e7a5b', '陈宏胜', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '任思琦', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('410f3152-0fb1-40cd-b983-a0b4189d1a10', '李宜桢', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('279c6d0d-1a69-4155-927d-e50faf8787b6', '许高玮', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('79c93b34-1803-4808-8053-447c66039516', '邓皓', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('87561e40-93ca-436f-90a8-eef75fe735b3', '蒋宁佳', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('8fda3edb-129f-4822-a4e4-4de2b8e552ad', '钟声', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('773ea73a-5135-41f4-8000-55901b2015a2', '熊宇航', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('591d3d72-c24e-4218-9b7e-9af08ce8e493', '冯陈达宇', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('d15cad6d-218d-47aa-a5bd-513730c701c3', '石欣妍', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '黄俊哲', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('1c3e0941-112b-4664-9463-6865ec8c5912', '博', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('8478bec7-44bc-4e19-b03e-445828affb23', '陈高逸', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('5cc50b32-8179-458f-9663-8704d9ebddff', '杜嘉林', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('eda53a7c-3cf6-4b7e-a32d-845a622afe37', '张希翼', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '张希静', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('2f724a1e-3399-4652-89ed-cdf6af080c6f', '易智康', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '罗睿婕', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('993d2b0b-eea2-4fb7-9c43-6ffe8db1f21a', '测试贺小龙', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('b485cc15-b6e9-4153-90a8-7899d9d8d91d', '李云美', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('a323675b-0a7f-4879-ab9e-33c1520f711f', '周盟', null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for `suggestions`
-- ----------------------------
DROP TABLE IF EXISTS `suggestions`;
CREATE TABLE `suggestions` (
  `lessonTradeId` varchar(36) NOT NULL COMMENT '当录入明星学员时，该字段填入明星学员memberId',
  `situations` varchar(1000) DEFAULT NULL COMMENT '以json字符串呈现，方便扩展（另存明星学员提分说明）',
  `suggestions` varchar(1000) DEFAULT NULL COMMENT '以json字符串呈现，方便扩展（另存明星学员感悟）',
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggestions
-- ----------------------------
INSERT INTO suggestions VALUES ('4744218b-8c27-4140-af9c-1c6c212d113e', '[{attention=比较专注1}]', '[{skill=学习技巧1}]');
INSERT INTO suggestions VALUES ('ad6f18ce-3575-4954-b42a-71777e9b099f', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('22222222', '初三数学提分25分', '三个月里，老师耐心...');
INSERT INTO suggestions VALUES ('7b165343-f535-4440-9e0a-d0a739290e61', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('8e2002ec-e6c5-47e1-b648-19972086007d', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('083e4c44-ce4a-4559-9b19-17d71c5e9cf0', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('3bd9d081-9fcd-4baf-9ee9-ed8a4f44c4c7', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('6c331c97-4260-487c-887f-5bd0e370afdb', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('2983b44d-d847-47db-95ac-e873884f88d5', '[{}]', '[{}]');
INSERT INTO suggestions VALUES ('287b2c81-98d2-4bcc-944a-3ba65b6f0d3f', '[]', '[]');
INSERT INTO suggestions VALUES ('1e129363-5491-40e7-9048-b2246fcd6cf7', '[]', '[]');
INSERT INTO suggestions VALUES ('40990591-b391-4b83-9fae-f44d2265f307', '[]', '[]');
INSERT INTO suggestions VALUES ('6891e932-ed38-402f-b706-6a1ae007bb7f', '[]', '[]');
INSERT INTO suggestions VALUES ('94f21d93-a209-4995-9896-e552bc29c744', '[]', '[]');
INSERT INTO suggestions VALUES ('58b4e5a5-dccb-4ce6-8cc3-dbaa05977bf2', '[]', '[]');
INSERT INTO suggestions VALUES ('46c08768-4de1-45e8-821f-95eb9540af66', '[为]', '[问问]');
INSERT INTO suggestions VALUES ('9c3113c4-4749-4eb7-875e-f175ce4111fb', '[手动阀]', '[微服务]');
INSERT INTO suggestions VALUES ('ef9171f3-1e00-471f-9ae4-d378addbb0db', '[手动阀]', '[微服务]');
INSERT INTO suggestions VALUES ('0fcdbf13-c32b-4810-97f7-a1f975201eb7', '[负数]', '[负数]');
INSERT INTO suggestions VALUES ('d8dd73ca-2e3f-4811-8b1f-365f6b0da401', '[同意]', '[和解]');
INSERT INTO suggestions VALUES ('7ac51dca-8fd2-4355-9d62-ee781e64035a', '[是滴]', '[水电费]');
INSERT INTO suggestions VALUES ('f68871e2-d4c9-4c27-a9d9-c4203097680e', '[sfsd]', '[sfaw]');
INSERT INTO suggestions VALUES ('0af53cc4-0c50-4172-ae08-1b64345dd54f', '[dsfa]', '[wea]');
INSERT INTO suggestions VALUES ('17e48d7f-de6a-43c5-b850-71b409410f6b', '[是否]', '[非]');
INSERT INTO suggestions VALUES ('c4c6244d-215c-4a51-a597-29d5180aa53a', '[圣诞节, 快乐]', '[圣诞节, 快乐]');
INSERT INTO suggestions VALUES ('2270db7e-1742-466a-81ac-574779562911', '[]', '[]');
INSERT INTO suggestions VALUES ('a2b034ea-569e-4070-996b-6fcc5018dd2e', '[1, null, 15, null, 13]', '[null, 1, null, 15, null, 23]');
INSERT INTO suggestions VALUES ('a97d1fb2-9d08-4f22-97ad-dfe3bd2f394b', '[1, null, null, 1, 1, a]', '[a, 1, null, 1, null, as]');
INSERT INTO suggestions VALUES ('49b0a605-e371-4a89-ba30-2a94bb40e3bd', '[`23, null, null, null, 213]', '[null, null, 321, 321]');
INSERT INTO suggestions VALUES ('43ab705c-5497-4c77-a830-a3b52f6bb7b7', '[2, , , , , ]', '[, 2, , , , ]');
INSERT INTO suggestions VALUES ('5a76d262-3002-4e4e-9cc8-de4fe6aec149', '[12, , , 213, , sdfd]', '[, , 2, , 213, ]');
INSERT INTO suggestions VALUES ('832f044b-ab35-4f81-af92-e5c5af7e45b2', '[null]', '[nul]');
INSERT INTO suggestions VALUES ('8c29006b-ab3e-480f-ac23-e8731b7f37b3', '[测试, , , , , ]', '[测试2, , , , , ]');
INSERT INTO suggestions VALUES ('8297646a-64e4-4d0f-9de8-95c03de15b02', '[测试, , , , , ]', '[测试2, , , , , ]');
INSERT INTO suggestions VALUES ('d08e499f-fe61-46a6-ace1-a1ff243a821e', '[wan, , , , , ]', '[wan, , , , , ]');
INSERT INTO suggestions VALUES ('6a46aadd-3a3c-45c2-85c2-824f9a563e59', '[1, , , , 1, 1]', '[, , 1, , , 1]');
INSERT INTO suggestions VALUES ('4a6424f9-f0f8-471c-a042-71bf7dc34596', '[ceshi下, , , , , ]', '[测试下, , , , , ]');
INSERT INTO suggestions VALUES ('152b5887-3a00-4224-91f0-d4ca9439a71d', '[测试, , , , , ]', '[, 测试, , , , ]');
INSERT INTO suggestions VALUES ('e889730b-36d2-46ad-99a4-af3af2f34c34', '[测试, , , , , ]', '[测试, , , , , ]');
INSERT INTO suggestions VALUES ('dce5897b-93d8-4bf5-bf98-4a9e551e7d10', '[测试, , , , , ]', '[测试, , , , , ]');
INSERT INTO suggestions VALUES ('c88b5eb6-3f26-4d42-bf0d-024deb33b440', '[上课, , , , , ]', '[上课, , , , , ]');
INSERT INTO suggestions VALUES ('f3989608-ea0e-4308-8587-cf6d932ef93e', '[上课, , , , , ]', '[上课, , , , , ]');
INSERT INTO suggestions VALUES ('8d796273-3c22-497b-9d75-9561c5aafd8a', '[上课, , , , , ]', '[上课, , , , , ]');
INSERT INTO suggestions VALUES ('8ede2123-152f-45e0-a5e1-fd9fcb7cab3d', '[科目, , , , , ]', '[科目, , , , , ]');
INSERT INTO suggestions VALUES ('409362ee-8987-4016-b24a-73a191ea4d63', '[手动阀, , , , , ]', '[招待费, , , , , ]');
INSERT INTO suggestions VALUES ('b9a6809e-fdf6-4d10-9b96-8964e6b493f4', '[分工, , , , , ]', '[手动阀, , , , , ]');
INSERT INTO suggestions VALUES ('ac9b3943-237c-4427-b80d-df0433a55710', '[色发的, , , , , ]', '[手动阀, , , , , ]');
INSERT INTO suggestions VALUES ('79dda7d4-ce94-477d-bf5a-05a28f3e78fe', '[ceshi , , , , , ]', '[ceshi , , , , , ]');
INSERT INTO suggestions VALUES ('d9dfb07f-1e50-4e1c-9d33-612de43bf410', '[sja, , , , , ]', '[san, , , , , ]');
INSERT INTO suggestions VALUES ('82060bc4-b318-4cc5-a904-6c224b8757cd', '[sdassdas, , , , , ]', '[sdafdf, , , , , ]');
INSERT INTO suggestions VALUES ('dfa6408e-73eb-4dcd-8f63-70ca5fde19f6', '[未发完违反, , , , , ]', '[违反, , , , , ]');
INSERT INTO suggestions VALUES ('6b40c680-ef0f-47b8-a7e3-09d1d7d6c404', '[大师傅, , , , , ]', '[手动阀, , , , , ]');
INSERT INTO suggestions VALUES ('6a6cfbdf-c46d-4a93-bf80-0440945f9637', '[士大夫, , , , , ]', '[山东法尔, , , , , ]');
INSERT INTO suggestions VALUES ('74dfe65c-c233-479b-a548-3b41635ff80e', '[weaf, , , , , ]', '[wefa, , , , , ]');
INSERT INTO suggestions VALUES ('cda16d97-74f1-4741-baf7-aa5db7dd3cc0', '[sadf, , , , , ]', '[aef, , , , , ]');
INSERT INTO suggestions VALUES ('a3082791-9c20-4a01-98f9-f88f75a845e3', '[asdf, , , , , ]', '[waefw, , , , , ]');
INSERT INTO suggestions VALUES ('66751d98-ca85-4c52-8b7e-cf2ed6070c97', '[sfda, , , , , ]', '[, we, , , , ]');
INSERT INTO suggestions VALUES ('7e282377-a6a6-4b32-83dc-aa2ebdaefbfe', '[还不错, 还不错, 还不错, 还不错, 还不错, 还不错]', '[还不错, 还不错, 还不错, 还不错, 还不错, 还不错]');
INSERT INTO suggestions VALUES ('c3aaa013-07e2-4ca8-9ec6-102314286c66', '[112, , , , , ]', '[, , , , , 121]');
INSERT INTO suggestions VALUES ('b0f678b7-12d6-4bf9-8829-e28d748d4496', '[, , , , , ]', '[, , , , , ]');
INSERT INTO suggestions VALUES ('6576b7d3-f180-4723-bac8-dcb6e8633cc3', '[, , , , , ]', '[, , , , , ]');
INSERT INTO suggestions VALUES ('1025a3f6-8edf-4998-a76a-59685de58a12', '[, , , , , ]', '[, , , , , ]');
INSERT INTO suggestions VALUES ('e93fbe80-04a4-47ef-848b-ac2cccf22f96', '[, , , , , ]', '[, , , , , ]');
INSERT INTO suggestions VALUES ('936f09b3-3db4-4db4-98e3-40df34850d7a', '[的说法s, , , 试试, , ]', '[, , , , 染发膏, ]');
INSERT INTO suggestions VALUES ('403add12-0ad4-4422-89c6-ad3ed33552f5', '[, 手动阀, , , , ]', '[, , 手动阀, , , ]');
INSERT INTO suggestions VALUES ('edf1e26d-dcab-4cef-88a6-a05c29759429', '[算法, , , , , ]', '[, , 安慰法, , , ]');
INSERT INTO suggestions VALUES ('2c20aa19-bbf8-4ed2-b0fc-43110dc3b971', '[, waf, , , , ]', '[, , , wef , , ]');
INSERT INTO suggestions VALUES ('3e8fdbf8-e15d-49e1-b411-867c0b13d08c', '[, , , se, , ]', '[, , , we, , ]');
INSERT INTO suggestions VALUES ('16f537bb-2f6c-4ef7-8355-e061c86c7a25', '[, 收发文, , , , ]', '[, , 违法, , , ]');
INSERT INTO suggestions VALUES ('ae779e32-4ea9-43da-8ef7-9d05a2995bd8', '[, , , 违法, , ]', '[, wean, , , , ]');
INSERT INTO suggestions VALUES ('0edef0da-d2b2-4041-8ae3-1551ffe4a0a0', '[, wean, , , , ]', '[, , , , 微分法, ]');
INSERT INTO suggestions VALUES ('797426a4-6322-4a8f-99f0-196d0d1f4421', '[, , 大, , , ]', '[, , 为, , , ]');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` varchar(36) NOT NULL,
  `teacherName` varchar(36) DEFAULT NULL,
  `picId` varchar(36) DEFAULT NULL,
  `schoolId` varchar(36) DEFAULT NULL,
  `gradeId` varchar(36) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '0: 男，1：女',
  `education` tinyint(2) DEFAULT NULL COMMENT '1：中专\r\n            2：大专\r\n            3：本科\r\n            4：研究生\r\n            5：博士\r\n            6：其他',
  `telNumber` varchar(20) DEFAULT NULL,
  `teachingLevel` tinyint(2) DEFAULT NULL COMMENT '-1：黑名单\r\n            1:普通\r\n            2：金牌',
  `regDate` datetime DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `openId` varchar(36) DEFAULT NULL,
  `signed` tinyint(1) DEFAULT '0' COMMENT '0：未签约\r\n            1：已签约',
  PRIMARY KEY (`teacherId`),
  UNIQUE KEY `key_2` (`telNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教员表';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO teacher VALUES ('63617903-e130-40ed-bb2f-b8ff2effb2fe', '刘国臣测试', '7439dd0a-65c3-4fea-9829-c09a91d433a3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2012级', '0', '4', '15580830349', '1', '2018-03-26 10:33:25', null, '', '1');
INSERT INTO teacher VALUES ('f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '测试老师1', 'af478f7f-f9e2-4eab-a99e-bbb3c3abc79c', '0df8c14e-2710-46db-86e0-b9cab53c995f', '', '0', '3', '1557876534', '1', '2018-02-22 23:36:32', '擅长数学,物理', '', '0');
INSERT INTO teacher VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '高级老师', '6ea548c5-fc9c-4ccb-9c45-8c4899623819', '1389a575-e1a9-46ab-853d-c2df5adcad5f', '2018级', '1', '3', '18674123456', '2', '2018-02-25 15:55:10', '1111', 'oQHVE00HAWuiDqD8zQb1Zun4cfxo', '0');
INSERT INTO teacher VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '吴月颖', '21d5d442-8052-43c0-9e23-543018059625', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774839836', '1', '2018-04-02 13:02:23', null, '', '0');
INSERT INTO teacher VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '向嘉博', '4115f4bb-95d7-4d87-8e07-ac21a3277a03', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18397413862', '1', '2018-03-31 13:19:17', null, 'oQHVE06xfTlMkw8eWb1uVFxoe2eo', '0');
INSERT INTO teacher VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '谢新茹', '99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7', '7ecf30e2-849b-4e93-82ba-469a2be66d32', '2017级', '1', '3', '15981671529', null, '2018-03-31 13:15:57', null, '', '0');
INSERT INTO teacher VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '冯龙兴', 'd775d3bc-f859-4ff9-bb92-e76669ac5c71', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', null, '4', '15367487002', '1', '2018-04-02 10:36:30', null, '', '1');
INSERT INTO teacher VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '崔向影', '456d056f-25ff-4c65-a77e-23a1a2084a52', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '1', '3', '15084762874', '1', '2018-04-02 13:03:21', null, '', '0');
INSERT INTO teacher VALUES ('b024e47e-4427-4fb2-95d6-3cf3b42aa135', '麻万明', '5c9eed81-ccfb-4a27-928d-52756f3362d8', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13657485997', '1', '2018-04-03 08:54:20', null, '', '0');
INSERT INTO teacher VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '陈皓', '9ee049ff-2e20-4655-9d2b-4cb7fe814566', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774975537', '1', '2018-04-02 13:09:37', null, '', '0');
INSERT INTO teacher VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '徐慧颖', 'e23d7bca-6405-4c49-8b7f-14fe663ee4d4', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '15274810285', '1', '2018-04-02 13:10:28', null, '', '0');
INSERT INTO teacher VALUES ('41816287-35ca-4235-bc89-ba2a2cb4abe1', '程凡', 'efd06f65-eef6-410f-8f0c-36621ea31a86', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18154217405', '1', '2018-04-02 13:11:22', null, '', '0');
INSERT INTO teacher VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '朱晓龙', 'c1f40a57-7146-4a06-9e62-c50f6f75bfbf', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18273120371', '1', '2018-04-02 13:14:46', null, '', '0');
INSERT INTO teacher VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '吴洋', '92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13278881603', '1', '2018-04-02 13:19:37', null, '', '0');
INSERT INTO teacher VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '陈松', 'ca67e8ef-09d5-466b-a796-82622add5cac', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18373150752', '1', '2018-04-02 13:16:26', null, '', '0');
INSERT INTO teacher VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '夏欣研', 'e88ffb63-b250-44bc-9083-3324cba01eb0', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13545212652', '1', '2018-04-02 13:21:07', null, '', '0');
INSERT INTO teacher VALUES ('cbe83e91-b829-4dd8-b852-e1937c450fe9', '齐宁', 'e05ca04a-ccca-4ee9-bb9a-383acab20a3c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '17375876043', '1', '2018-04-02 15:01:15', null, '', '0');
INSERT INTO teacher VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '姜波', 'bc9b247d-70e7-4bcd-b8be-aa4d3721984b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '15111016224', '1', '2018-04-02 15:01:54', null, '', '0');
INSERT INTO teacher VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '胡潇羽', '4e97532e-22ac-492b-a118-89a5c6b31c3c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13142008762', '1', '2018-04-02 15:03:02', null, '', '0');
INSERT INTO teacher VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '吕向前', 'bc0be7a4-38e6-4366-a74e-903d322e4b0a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18569400050', '1', '2018-04-02 15:13:20', null, '', '0');
INSERT INTO teacher VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '张文慧', '15a7c808-098b-4e8d-9f19-1022b6d5b387', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '13635562695', '1', '2018-04-02 15:19:14', null, '', '0');
INSERT INTO teacher VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '左博聪', '4583b87a-1eb3-4cfb-9a47-f1af60d01467', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '15111095615', '1', '2018-04-02 15:43:26', null, '', '0');
INSERT INTO teacher VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '邢凯迪', '1394814e-1348-4132-90cd-ac01732facd5', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18174451062', '1', '2018-04-02 15:46:53', null, '', '0');
INSERT INTO teacher VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '王宁', '1cc35afa-391b-49dc-a0bb-5f401eaf56f0', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2014级', '0', '3', '13667337306', '1', '2018-04-02 15:48:05', null, '', '0');
INSERT INTO teacher VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '陈娴', '64a7f49d-15db-48dd-9e50-044c15314a33', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '17308416020', '1', '2018-04-02 15:50:37', null, '', '0');
INSERT INTO teacher VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '薛潇', '8d4c35e9-dcad-44ff-a297-c55789914717', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '4', '13909620950', '1', '2018-04-02 15:51:55', null, '', '1');
INSERT INTO teacher VALUES ('ec0a82c0-6f1c-4561-b8bf-195cac02796b', '姜蕊', '6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18390987440', '1', '2018-04-02 15:56:34', null, '', '0');
INSERT INTO teacher VALUES ('e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '胡嘉欣', 'd6484e68-7a9a-4fca-812c-1bdb64a951e3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', null, '18272057850', '1', '2018-04-02 16:20:05', null, '', '0');
INSERT INTO teacher VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '李东刚', 'c6948d2a-e3d4-49ca-8adc-7e657268cb2e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18670308329', '1', '2018-04-02 16:28:48', null, '', '0');
INSERT INTO teacher VALUES ('f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', 'ceshiliulaoshi', '961c91e1-0607-4dea-ba8d-c96a1cb18315', 'f3e0ee6c-7c5f-42ca-8060-f2b39dbf2361', '2016级', '0', null, '15587976896', null, '2018-04-02 22:26:35', null, '', '1');

-- ----------------------------
-- Table structure for `teacher_les_r`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_les_r`;
CREATE TABLE `teacher_les_r` (
  `teachingId` varchar(36) NOT NULL,
  `teacherId` varchar(36) NOT NULL,
  `lessonType` int(11) NOT NULL COMMENT '1:小学(11-16分别表示 小学1-6年级)(111-119可扩展为语数外，政史地，物化生科目代码，即：小学x年级y科目)\r\n            2: 初中（21-23分表表示 初中1-3年级）\r\n            3:高中（31-33分表表示 高中1-3年级）\r\n            ',
  PRIMARY KEY (`teacherId`,`lessonType`,`teachingId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任教关系表（老师-擅长科目）';

-- ----------------------------
-- Records of teacher_les_r
-- ----------------------------
INSERT INTO teacher_les_r VALUES ('f558d3cb-3858-44de-aece-19b4ffc45396', '16684d26-3d14-45ff-8c3f-112d739be006', '2');
INSERT INTO teacher_les_r VALUES ('39a82af9-6cdf-4b92-b0ad-2af75eb02564', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '2');
INSERT INTO teacher_les_r VALUES ('5e9be195-5683-446e-a03f-7f45b50f5f2b', '24652540-af54-4120-abc8-79d166778f82', '1');
INSERT INTO teacher_les_r VALUES ('260d90c3-929d-4407-ad6a-272afc660212', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO teacher_les_r VALUES ('3bf0d502-f4c7-4c3c-ad03-53284868dc0a', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO teacher_les_r VALUES ('7f566938-d95e-4c4b-b536-4ec72287862a', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO teacher_les_r VALUES ('1f8743ea-6823-49db-bb78-30df932c44d0', '24652540-af54-4120-abc8-79d166778f82', '8');
INSERT INTO teacher_les_r VALUES ('a93762e3-28ab-46b2-9793-8c73229268ca', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '2');
INSERT INTO teacher_les_r VALUES ('8ecacfdd-351a-4381-bf5c-29bf8a815a88', '27b5a1a7-624f-40e1-9359-9196d0261133', '7');
INSERT INTO teacher_les_r VALUES ('f371aeda-adc3-4cd6-9da2-aca6e5509aa7', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '7');
INSERT INTO teacher_les_r VALUES ('8fd5a867-cf4b-4163-889e-e0778641a4a5', '2d3829b4-17b3-46af-bf50-cd0eba5430f8', '1');
INSERT INTO teacher_les_r VALUES ('a4272eba-cc9c-40da-9e9e-a7b9662a46f3', '2d3829b4-17b3-46af-bf50-cd0eba5430f8', '2');
INSERT INTO teacher_les_r VALUES ('faf95a49-dc0b-49c4-a24e-be34c61e622f', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '2');
INSERT INTO teacher_les_r VALUES ('8426c300-a528-4318-8983-4fd19f3f0ff0', '41816287-35ca-4235-bc89-ba2a2cb4abe1', '3');
INSERT INTO teacher_les_r VALUES ('f849cbc7-5943-4710-b614-8f8cffd304e5', '537f3647-8444-4525-94c9-5af57c3f55e8', '3');
INSERT INTO teacher_les_r VALUES ('f6dc4acc-f4d7-4aaf-b134-d818877620c9', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '2');
INSERT INTO teacher_les_r VALUES ('60f60bee-3cc0-45e5-ab06-1fdc359f744d', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '7');
INSERT INTO teacher_les_r VALUES ('88952680-bedf-47cc-86ed-8d61aa95abb7', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '2');
INSERT INTO teacher_les_r VALUES ('98efdd46-b5b6-414c-9c31-56320515f91d', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '2');
INSERT INTO teacher_les_r VALUES ('425e3aab-b0d2-4521-b858-0a70509b5d9e', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '2');
INSERT INTO teacher_les_r VALUES ('e64a4b66-c6d5-439d-b1ad-29929236a236', '8124288f-6f07-4cd0-a1ec-37a4e2171adb', '2');
INSERT INTO teacher_les_r VALUES ('046b4cdf-9682-4bfd-b1e5-660e1bdc3494', '853a2f31-f902-489c-8b7c-bea062277833', '3');
INSERT INTO teacher_les_r VALUES ('f926d599-de1a-4b81-8343-9833c57a0882', '853a2f31-f902-489c-8b7c-bea062277833', '3');
INSERT INTO teacher_les_r VALUES ('6a2f9398-4577-4d5c-925c-b32352714ad2', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '7');
INSERT INTO teacher_les_r VALUES ('a4dbc41f-3d29-4629-9d6d-1a3ff201eede', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '2');
INSERT INTO teacher_les_r VALUES ('27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '3');
INSERT INTO teacher_les_r VALUES ('e0b3d132-d720-4961-a8b2-c506466c87a6', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '7');
INSERT INTO teacher_les_r VALUES ('64e2a46a-6e1c-48ad-8cd7-4494f591972e', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '7');
INSERT INTO teacher_les_r VALUES ('b6f587b6-5d6c-4f13-a17b-f91b3edf17bc', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '7');
INSERT INTO teacher_les_r VALUES ('6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '3');
INSERT INTO teacher_les_r VALUES ('9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5', 'cbe83e91-b829-4dd8-b852-e1937c450fe9', '8');
INSERT INTO teacher_les_r VALUES ('748ac459-aca8-4b9a-b792-e3aaf09a8e23', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '1');
INSERT INTO teacher_les_r VALUES ('8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '1');
INSERT INTO teacher_les_r VALUES ('7017346c-ff3f-4f42-9a40-e92dc324ef19', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '8');
INSERT INTO teacher_les_r VALUES ('9b6d689e-8671-4ee0-81f1-6cc27981b9c6', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '1');
INSERT INTO teacher_les_r VALUES ('5a978ecd-96da-4eae-b3f5-8706fcb3792e', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b', '2');
INSERT INTO teacher_les_r VALUES ('4d309b83-f780-4e70-9aaa-399c086cff52', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '7');
INSERT INTO teacher_les_r VALUES ('5bf11ef7-d53e-47ff-a57e-e18aed22910f', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '1');
INSERT INTO teacher_les_r VALUES ('236bc37a-989e-4469-a29f-f8b476f64045', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '2');
INSERT INTO teacher_les_r VALUES ('af860c61-0ddc-42ff-af37-9e08cd039120', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '3');
INSERT INTO teacher_les_r VALUES ('c37a2e10-70ac-4d73-b65e-1327d3c5628f', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '3');
INSERT INTO teacher_les_r VALUES ('bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '2');
INSERT INTO teacher_les_r VALUES ('2d72270f-f8fe-4a24-93b2-885e8f8f5463', 'ffb18612-b184-4291-b49f-5336cf8a913b', '1');
INSERT INTO teacher_les_r VALUES ('dde3612a-990b-43e8-8ebb-02123e838cc1', 'ffb18612-b184-4291-b49f-5336cf8a913b', '2');
INSERT INTO teacher_les_r VALUES ('6380cb70-c25e-4077-a2ff-b0f65449e08b', 'ffb18612-b184-4291-b49f-5336cf8a913b', '3');
INSERT INTO teacher_les_r VALUES ('f0b44033-0d96-469c-8df3-751ba320e716', 'ffb18612-b184-4291-b49f-5336cf8a913b', '3');
INSERT INTO teacher_les_r VALUES ('a464769f-b7ab-46a8-9c90-c7c747a72a8f', 'ffb18612-b184-4291-b49f-5336cf8a913b', '7');
INSERT INTO teacher_les_r VALUES ('dc016cf8-e5ec-4661-8348-b3a59c4a235b', 'ffb18612-b184-4291-b49f-5336cf8a913b', '9');
INSERT INTO teacher_les_r VALUES ('ff6cf303-ec72-44ee-942f-9c45833f11e0', 'ffb18612-b184-4291-b49f-5336cf8a913b', '9');

-- ----------------------------
-- Table structure for `teacher_pay_list`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_pay_list`;
CREATE TABLE `teacher_pay_list` (
  `lessonTypeId` int(11) NOT NULL DEFAULT '0',
  `feedbackId` smallint(6) NOT NULL DEFAULT '1',
  `feedback` varchar(50) DEFAULT NULL,
  `reward` float DEFAULT NULL,
  PRIMARY KEY (`lessonTypeId`,`feedbackId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_pay_list
-- ----------------------------
INSERT INTO teacher_pay_list VALUES ('-111', '-1', '差', '40');
INSERT INTO teacher_pay_list VALUES ('-111', '0', '一般', '43');
INSERT INTO teacher_pay_list VALUES ('-111', '1', '满意', '45');
INSERT INTO teacher_pay_list VALUES ('111', '-1', '差', '35');
INSERT INTO teacher_pay_list VALUES ('111', '0', '一般', '38');
INSERT INTO teacher_pay_list VALUES ('111', '1', '满意', '40');
INSERT INTO teacher_pay_list VALUES ('-161', '-1', '差', '40');
INSERT INTO teacher_pay_list VALUES ('-161', '0', '一般', '43');
INSERT INTO teacher_pay_list VALUES ('-161', '1', '满意', '45');
INSERT INTO teacher_pay_list VALUES ('161', '-1', '差', '35');
INSERT INTO teacher_pay_list VALUES ('161', '0', '一般', '38');
INSERT INTO teacher_pay_list VALUES ('161', '1', '满意', '40');
INSERT INTO teacher_pay_list VALUES ('-211', '-1', '差', '50');
INSERT INTO teacher_pay_list VALUES ('-211', '0', '一般', '53');
INSERT INTO teacher_pay_list VALUES ('-211', '1', '满意', '55');
INSERT INTO teacher_pay_list VALUES ('211', '-1', '差', '45');
INSERT INTO teacher_pay_list VALUES ('211', '0', '一般', '48');
INSERT INTO teacher_pay_list VALUES ('211', '1', '满意', '50');
INSERT INTO teacher_pay_list VALUES ('-231', '-1', '差', '50');
INSERT INTO teacher_pay_list VALUES ('-231', '0', '一般', '53');
INSERT INTO teacher_pay_list VALUES ('-231', '1', '满意', '55');
INSERT INTO teacher_pay_list VALUES ('231', '-1', '差', '45');
INSERT INTO teacher_pay_list VALUES ('231', '0', '一般', '48');
INSERT INTO teacher_pay_list VALUES ('231', '1', '满意', '50');
INSERT INTO teacher_pay_list VALUES ('-311', '-1', '差', '70');
INSERT INTO teacher_pay_list VALUES ('-311', '0', '一般', '73');
INSERT INTO teacher_pay_list VALUES ('-311', '1', '满意', '75');
INSERT INTO teacher_pay_list VALUES ('311', '-1', '差', '65');
INSERT INTO teacher_pay_list VALUES ('311', '0', '一般', '68');
INSERT INTO teacher_pay_list VALUES ('311', '1', '满意', '70');
INSERT INTO teacher_pay_list VALUES ('-331', '-1', '差', '70');
INSERT INTO teacher_pay_list VALUES ('-331', '0', '一般', '73');
INSERT INTO teacher_pay_list VALUES ('-331', '1', '满意', '75');
INSERT INTO teacher_pay_list VALUES ('331', '-1', '差', '65');
INSERT INTO teacher_pay_list VALUES ('331', '0', '一般', '68');
INSERT INTO teacher_pay_list VALUES ('331', '1', '满意', '70');

-- ----------------------------
-- Table structure for `teachingrecord`
-- ----------------------------
DROP TABLE IF EXISTS `teachingrecord`;
CREATE TABLE `teachingrecord` (
  `recordId` varchar(36) NOT NULL,
  `teachingId` varchar(36) DEFAULT NULL,
  `orderId` varchar(36) DEFAULT NULL COMMENT '取第一条订单ID',
  `teacherId` varchar(36) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `teachingNum` float(6,0) DEFAULT NULL,
  `teachingDate` date DEFAULT NULL,
  `lessonTradeId` varchar(36) DEFAULT NULL COMMENT '所属哪一个轮次的提现',
  PRIMARY KEY (`recordId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachingrecord
-- ----------------------------
INSERT INTO teachingrecord VALUES ('2c7b39b4-7f5a-4073-a7b2-caa091e6a1b5', 'de6fde18-2578-4625-bd2c-ce9704e03bec', 'fa92b9ba-f1be-4461-b261-2342b3025145', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1', '2018-03-01', 'ae779e32-4ea9-43da-8ef7-9d05a2995bd8');
INSERT INTO teachingrecord VALUES ('4e7bdf87-868d-4476-a916-ab5ed81e228f', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1', '2018-04-03', '0edef0da-d2b2-4041-8ae3-1551ffe4a0a0');
INSERT INTO teachingrecord VALUES ('aaff9048-b2e6-4f51-93b9-224698d8d22e', 'dc016cf8-e5ec-4661-8348-b3a59c4a235b', '4970c4d5-bda0-4b46-860d-51c53fa529ad', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1', '2018-04-03', '797426a4-6322-4a8f-99f0-196d0d1f4421');

-- ----------------------------
-- Table structure for `tradecomplains`
-- ----------------------------
DROP TABLE IF EXISTS `tradecomplains`;
CREATE TABLE `tradecomplains` (
  `lessonTradeId` varchar(36) NOT NULL DEFAULT '',
  `complain_content` varchar(500) DEFAULT NULL,
  `complain_time` datetime DEFAULT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tradecomplains
-- ----------------------------
INSERT INTO tradecomplains VALUES ('6a6cfbdf-c46d-4a93-bf80-0440945f9637', '投诉抱怨！', '2018-03-31 03:21:41', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO tradecomplains VALUES ('3e8fdbf8-e15d-49e1-b411-867c0b13d08c', '老师擅自提价', '2018-04-01 21:37:10', 'ffb18612-b184-4291-b49f-5336cf8a913b');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(36) NOT NULL COMMENT 'uuid',
  `userName` varchar(36) DEFAULT NULL,
  `userAccountId` varchar(36) NOT NULL COMMENT '登录账号，默认为手机号码',
  `password` varchar(36) DEFAULT NULL COMMENT '登录密码，默认为手机号码后六位',
  `userType` tinyint(2) DEFAULT NULL COMMENT '0：管理员\r\n  1：学生\r\n   2：家长\r\n    3：老师\r\n   4：其他',
  `userPrivilege` tinyint(2) DEFAULT NULL COMMENT '当用户类型为老师时，该字段标识老师签约状态（0：未签约，1：已签约）',
  `loginStatus` tinyint(1) DEFAULT NULL COMMENT '0：未登录\r\n            1：已登录',
  `openId` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `headimgurl` text,
  PRIMARY KEY (`userId`,`userAccountId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='User表--登录权限';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('15576897865', '15576897865', '666teacher666', '897865', '3', '0', '0', '', '???', 'http://wx.qlogo.cn/mmopen/vi_32/zEzJYYyj4pmDOuBBmYU33kzQZglnIfFnvQ11FRd3CD5az3S2RYSJxuyX9ibvb3ILluH6n2SXOmojo2PxgD3QBrQ/132');
INSERT INTO user VALUES ('admin', 'yduiytech', 'admin', 'xiaoyi520', '0', '0', '0', null, 'admin', null);
INSERT INTO user VALUES ('4bf9257e-198a-4c9d-af02-74eb7a9fa4d3', '19356784567', '4bf9257e-198a-4c9d-af02-74eb7a9fa4d3', '784567', '3', '0', '0', '', '刘嬷嬷', 'a201a42f-c557-4803-9895-5b74068bbcab');
INSERT INTO user VALUES ('24652540-af54-4120-abc8-79d166778f82', '1557876535', '24652540-af54-4120-abc8-79d166778f82', '876535', '3', '1', '0', '', '测试老师2', '7e66a9ab-b9c3-4127-a11e-e3bbf02167d0');
INSERT INTO user VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '18674123456', 'ffb18612-b184-4291-b49f-5336cf8a913b', '123456', '3', '1', '1', 'oQHVE00HAWuiDqD8zQb1Zun4cfxo', '高级老师', '6ea548c5-fc9c-4ccb-9c45-8c4899623819');
INSERT INTO user VALUES ('63617903-e130-40ed-bb2f-b8ff2effb2fe', '15580830349', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '830349', '3', '1', '1', '', '刘国臣测试', '7439dd0a-65c3-4fea-9829-c09a91d433a3');
INSERT INTO user VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '18397413862', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '413862', '3', '1', '0', '', '向嘉博', 'c623daa1-3bdd-4740-a728-f3d43de47d0b');
INSERT INTO user VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '15981671529', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '671529', '3', '0', '0', '', '谢新茹', '99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7');
INSERT INTO user VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '15367487002', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '487002', '3', '0', '0', '', '冯龙兴', 'd775d3bc-f859-4ff9-bb92-e76669ac5c71');
INSERT INTO user VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '18774839836', '16684d26-3d14-45ff-8c3f-112d739be006', '839836', '3', '0', '0', '', '吴月颖', '21d5d442-8052-43c0-9e23-543018059625');
INSERT INTO user VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '15084762874', 'b21addc3-003c-42be-afaa-ab7064d6e144', '762874', '3', '0', '0', '', '崔向影', '456d056f-25ff-4c65-a77e-23a1a2084a52');
INSERT INTO user VALUES ('8124288f-6f07-4cd0-a1ec-37a4e2171adb', '1365785997', '8124288f-6f07-4cd0-a1ec-37a4e2171adb', '785997', '3', '0', '0', '', '麻万明', '2432cad4-aff7-4382-a772-09662b7113b2');
INSERT INTO user VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '18774975537', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '975537', '3', '0', '0', '', '陈皓', '9ee049ff-2e20-4655-9d2b-4cb7fe814566');
INSERT INTO user VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '15274810285', '537f3647-8444-4525-94c9-5af57c3f55e8', '810285', '3', '0', '0', '', '徐慧颖', 'e23d7bca-6405-4c49-8b7f-14fe663ee4d4');
INSERT INTO user VALUES ('41816287-35ca-4235-bc89-ba2a2cb4abe1', '18154217405', '41816287-35ca-4235-bc89-ba2a2cb4abe1', '217405', '3', '0', '0', '', '程凡', 'efd06f65-eef6-410f-8f0c-36621ea31a86');
INSERT INTO user VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '18273120371', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '120371', '3', '0', '0', '', '朱晓龙', 'c1f40a57-7146-4a06-9e62-c50f6f75bfbf');
INSERT INTO user VALUES ('ece42a27-ddf1-4399-8788-d29d6af471b1', '13278881603', 'ece42a27-ddf1-4399-8788-d29d6af471b1', '881603', '3', '0', '0', '', '吴洋', '48d4c1ec-c136-49ed-96fc-b4fbe9010dd0');
INSERT INTO user VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '18373150752', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '150752', '3', '0', '0', '', '陈松', 'ca67e8ef-09d5-466b-a796-82622add5cac');
INSERT INTO user VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '13278881603', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '881603', '3', '0', '0', '', '吴洋', '92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f');
INSERT INTO user VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '13545212652', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '212652', '3', '0', '0', '', '夏欣研', 'e88ffb63-b250-44bc-9083-3324cba01eb0');
INSERT INTO user VALUES ('cbe83e91-b829-4dd8-b852-e1937c450fe9', '17375876043', 'cbe83e91-b829-4dd8-b852-e1937c450fe9', '876043', '3', '0', '0', '', '齐宁', 'e05ca04a-ccca-4ee9-bb9a-383acab20a3c');
INSERT INTO user VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '15111016224', '27b5a1a7-624f-40e1-9359-9196d0261133', '016224', '3', '0', '0', '', '姜波', 'bc9b247d-70e7-4bcd-b8be-aa4d3721984b');
INSERT INTO user VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '13142008762', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '008762', '3', '0', '0', '', '胡潇羽', '4e97532e-22ac-492b-a118-89a5c6b31c3c');
INSERT INTO user VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '18569400050', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '400050', '3', '0', '0', '', '吕向前', 'bc0be7a4-38e6-4366-a74e-903d322e4b0a');
INSERT INTO user VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '13635562695', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '562695', '3', '0', '0', '', '张文慧', '15a7c808-098b-4e8d-9f19-1022b6d5b387');
INSERT INTO user VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '15111095615', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '095615', '3', '0', '0', '', '左博聪', '4583b87a-1eb3-4cfb-9a47-f1af60d01467');
INSERT INTO user VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '18174451062', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '451062', '3', '0', '0', '', '邢凯迪', '1394814e-1348-4132-90cd-ac01732facd5');
INSERT INTO user VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '13667337306', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '337306', '3', '0', '0', '', '王宁', '1cc35afa-391b-49dc-a0bb-5f401eaf56f0');
INSERT INTO user VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '17308416020', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '416020', '3', '0', '0', '', '陈娴', '64a7f49d-15db-48dd-9e50-044c15314a33');
INSERT INTO user VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '13909620950', '853a2f31-f902-489c-8b7c-bea062277833', '620950', '3', '0', '0', '', '薛潇', '8d4c35e9-dcad-44ff-a297-c55789914717');
INSERT INTO user VALUES ('ec0a82c0-6f1c-4561-b8bf-195cac02796b', '18390987440', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b', '987440', '3', '0', '0', '', '姜蕊', '6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a');
INSERT INTO user VALUES ('e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '18272057850', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '057850', '3', '0', '0', '', '胡嘉欣', 'd6484e68-7a9a-4fca-812c-1bdb64a951e3');
INSERT INTO user VALUES ('b9c01f18-6688-463e-86be-658a37d78a6e', '18670308329', 'b9c01f18-6688-463e-86be-658a37d78a6e', '308329', '3', '0', '0', '', '李东刚', 'fb43828f-b728-405c-9b0d-a71668e4b977');
INSERT INTO user VALUES ('18190320-6241-4508-8735-d71ec3d85be3', '18670308329', '18190320-6241-4508-8735-d71ec3d85be3', '308329', '3', '0', '0', '', '李东刚', '37d65abe-e61a-4874-a07b-02cd238c6dc7');
INSERT INTO user VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '18670308329', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '308329', '3', '0', '0', '', '李东刚', 'c6948d2a-e3d4-49ca-8adc-7e657268cb2e');
INSERT INTO user VALUES ('f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', '15587976896', 'f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', '976896', '3', '0', '0', '', 'ceshiliulaoshi', '961c91e1-0607-4dea-ba8d-c96a1cb18315');
INSERT INTO user VALUES ('b024e47e-4427-4fb2-95d6-3cf3b42aa135', '13657485997', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '485997', '3', '0', '0', '', '麻万明', '5c9eed81-ccfb-4a27-928d-52756f3362d8');
