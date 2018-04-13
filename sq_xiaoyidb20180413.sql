/*
Navicat MySQL Data Transfer

Source Server         : mysql.sql141.cdncenter.net_3306
Source Server Version : 50538
Source Host           : mysql.sql141.cdncenter.net:3306
Source Database       : sq_xiaoyidb

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-04-13 17:18:12
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
  `status` tinyint(2) DEFAULT NULL COMMENT '-1：提现失败\r\n 0：已提现 1：已提交，待家长确认   2：家长已确认，待管理员审核中,3: 调用微信支付失败（需管理员确认）！，4：被家长投诉 ',
  `applyLessons` float(6,2) DEFAULT NULL,
  `feedback` varchar(50) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `frozenLessons` float(6,2) DEFAULT '0.00' COMMENT '管理员冻结课时',
  `actualPay` float(6,2) DEFAULT '0.00',
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='课时管理（提现交易）表';

-- ----------------------------
-- Records of lessontrade
-- ----------------------------
INSERT INTO lessontrade VALUES ('164b3a53-487f-4d0b-8f55-e911ff2ebd7a', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '可以，不错！', '2', '0.50', '0', '2018-04-12 10:10:42', '0.00', '21.50');
INSERT INTO lessontrade VALUES ('2b6b4656-e866-4710-8be9-ba13049d572c', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', 'd1567855-910a-44b2-950a-58fd9b3338b7', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '拉架', '2', '1.00', '0', '2018-04-08 10:52:46', '0.00', '43.00');
INSERT INTO lessontrade VALUES ('797426a4-6322-4a8f-99f0-196d0d1f4421', '-111', 'ffb18612-b184-4291-b49f-5336cf8a913b', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '可以', '2', '5.00', '0', '2018-04-03 10:04:07', '0.00', '1.00');
INSERT INTO lessontrade VALUES ('e135d0f9-261c-4809-87cd-99449d06c51c', '-211', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '8c754fe0-ecca-4827-a94d-62c0400e5990', '', '0', '2.00', '1', '2018-04-08 18:30:25', '0.00', '110.00');
INSERT INTO lessontrade VALUES ('a7a611b6-feb8-400d-b013-48efab30d3d2', '-111', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '7f376be4-d891-48be-8529-9bc5b85185ca', '很差', '2', '2.00', '-1', '2018-04-08 18:49:16', '0.00', '80.00');
INSERT INTO lessontrade VALUES ('c66d5aec-5a9d-445c-893b-5deee871ce86', '-231', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '7f0861de-91ef-4f10-9a4e-f836998778db', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '', '0', '4.00', '1', '2018-04-08 18:49:52', '0.00', '220.00');
INSERT INTO lessontrade VALUES ('decde197-8876-43c1-b27b-4114ccb01330', '-211', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64', null, '1', '8.00', null, '2018-04-08 18:59:25', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('96417002-12ad-42dd-9bc3-2de1dd93c5f8', '-311', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '1', '6.00', null, '2018-04-08 19:07:31', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('9028c9ed-55f5-4f01-aab8-9925da5320bc', '-311', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '1', '6.00', null, '2018-04-08 19:32:31', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('cb738951-e544-4c54-bee9-903f17f835b0', '-211', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c', null, '1', '1.00', null, '2018-04-08 19:42:34', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('b7e77aad-fd87-434e-bab0-efb3fc9b56d1', '-231', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'acb5bc9f-534e-4661-b0b5-0054c5827683', null, '1', '4.00', null, '2018-04-08 19:43:27', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('e4207004-b076-4e52-9047-65fc0e553e1e', '-231', '853a2f31-f902-489c-8b7c-bea062277833', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f', null, '1', '6.00', null, '2018-04-08 20:27:38', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('4c939366-dde1-4363-91a7-21bc1501cf05', '-211', '853a2f31-f902-489c-8b7c-bea062277833', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984', '认真，负责的薛老师', '0', '4.00', '1', '2018-04-08 20:31:42', '0.00', '220.00');
INSERT INTO lessontrade VALUES ('5a404b4c-3c80-44c1-842b-9b4c75190d36', '-211', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', 'ccd49818-39cb-4ee1-b792-01688dfbef24', 'ada7441e-2a38-4c03-aee6-234be39aa128', '', '0', '6.00', '1', '2018-04-08 21:01:42', '0.00', '330.00');
INSERT INTO lessontrade VALUES ('9aa61240-bfad-4a42-b152-d54dce3c7a0c', '-211', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '', '0', '8.00', '1', '2018-04-08 21:13:08', '0.00', '440.00');
INSERT INTO lessontrade VALUES ('73e3003f-1f76-4713-913a-d99ae762f76e', '-211', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '', '0', '6.00', '1', '2018-04-08 21:49:59', '0.00', '330.00');
INSERT INTO lessontrade VALUES ('301f1e25-81ca-4c8f-ad57-420870770bf2', '-311', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '1', '3.00', null, '2018-04-08 22:32:00', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('59858dc7-b38b-4632-b307-810c7b021217', '-211', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984', '', '3', '8.00', '1', '2018-04-08 22:56:24', '0.00', '440.00');
INSERT INTO lessontrade VALUES ('15d44df5-4a02-43d1-8704-ccca3e2c6e94', '-211', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c', null, '1', '8.00', null, '2018-04-08 23:15:15', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('ea726a02-bf22-404d-b138-792bf6d7785a', '161', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '01bf9958-85e2-49e6-a36c-2840efd63af0', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '', '0', '1.00', '0', '2018-04-09 09:50:22', '0.00', '1.00');
INSERT INTO lessontrade VALUES ('ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b', '-211', '377be561-9aaf-43a2-8a0d-9b601021c0e0', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', '', '0', '7.00', '0', '2018-04-09 12:51:01', '0.00', '371.00');
INSERT INTO lessontrade VALUES ('25ff3289-06f3-4c30-93bb-d82595ad3332', '111', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '1c3e0941-112b-4664-9463-6865ec8c5912', '205ee471-0dcd-430e-a558-df805a87fb62', null, '1', '4.00', null, '2018-04-09 19:06:56', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('5e892622-ac6d-4231-9c39-dba28fbe9e81', '-311', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', 'a36d5226-313a-4af6-9a2c-21700f53bd90', null, '1', '8.00', null, '2018-04-09 19:37:34', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('4d6d538c-babc-4e26-896f-a5fe2d980679', '-231', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f', null, '1', '6.00', null, '2018-04-09 20:00:38', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('9d3733cc-1d83-4ec5-91df-3efae2a2112b', '-311', 'db66fd38-466a-4620-9890-6abb10a67a22', '329ec215-a3dc-427d-ac97-95f0cc0a2519', 'f7166d68-6dd7-4b05-b094-31a454c844b9', null, '1', '11.00', null, '2018-04-09 20:03:22', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '-111', 'ffb18612-b184-4291-b49f-5336cf8a913b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', null, '1', '1.50', null, '2018-04-10 23:21:11', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('8e121a0c-efc2-405e-bff2-36b91309a11c', '211', 'b21addc3-003c-42be-afaa-ab7064d6e144', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951', null, '1', '2.00', null, '2018-04-09 21:33:22', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('3b816221-7664-4d11-8c12-8ef512514749', '-231', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', 'ab5befbe-9b50-4c79-9496-0edd136839fc', null, '1', '3.00', null, '2018-04-09 21:36:11', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('c91a1407-50d8-46ff-b469-4e3bdb2585e6', '-311', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', 'daa3f486-e6ce-4b50-ad09-519dac09757e', '', '0', '10.00', '1', '2018-04-09 21:45:32', '0.00', '750.00');
INSERT INTO lessontrade VALUES ('604fe578-0c4f-459a-a5c6-44549a4f0d92', '-231', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', null, '1', '16.00', null, '2018-04-09 21:57:58', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('5375d8bc-7691-4e61-8f78-aabd772a38b0', '-311', '27b5a1a7-624f-40e1-9359-9196d0261133', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '71ca2567-8288-433a-98ed-bbf3c00b9659', null, '1', '2.00', null, '2018-04-09 22:06:33', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('e55873ed-aa42-4d03-94f9-fc0a1537c3ff', '-211', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64', '', '0', '2.00', '1', '2018-04-09 22:35:10', '0.00', '110.00');
INSERT INTO lessontrade VALUES ('fd3d86b2-959e-48ca-91a6-28e585bc2b17', '-211', '19115f9c-d7d6-4415-baab-27cb4973ce98', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', null, '1', '6.00', null, '2018-04-10 16:35:09', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('05fdafbf-8e31-44b4-9fc5-b8de289f8b46', '-211', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '7cd1b3ff-571d-430b-b77e-92d1712a8418', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '', '3', '4.00', '1', '2018-04-10 21:21:42', '0.00', '220.00');
INSERT INTO lessontrade VALUES ('b76c804a-d0f0-478d-87dd-27c4e2d831d3', '-231', '2317d1b6-f84d-4633-bc8c-97caaff69e16', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', null, '1', '2.00', null, '2018-04-10 21:59:41', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('776c734a-bce0-48d6-96e5-8184061971a0', '-311', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '87561e40-93ca-436f-90a8-eef75fe735b3', 'e8aedf60-f545-4165-8aac-be143e7394d8', '提前准备看下她的错题，看怎么针对解决 谢谢', '0', '2.00', '1', '2018-04-10 23:09:46', '0.00', '150.00');
INSERT INTO lessontrade VALUES ('fa4a9cad-7de1-49da-9fae-526fab064a66', '211', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951', null, '1', '2.00', null, '2018-04-11 00:02:09', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('b091936b-3866-4e98-8ac6-9d72df59a56f', '-211', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', null, '1', '8.00', null, '2018-04-11 13:29:51', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('de89ed26-b005-42e6-870a-e367aac4f28c', '-311', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '79c93b34-1803-4808-8053-447c66039516', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', null, '1', '4.00', null, '2018-04-11 20:32:27', '0.00', '0.00');
INSERT INTO lessontrade VALUES ('858ca17d-2205-4934-96df-f339b1826c95', '-211', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '', '0', '11.00', '1', '2018-04-11 21:54:26', '0.00', '605.00');

-- ----------------------------
-- Table structure for `lessontradesum`
-- ----------------------------
DROP TABLE IF EXISTS `lessontradesum`;
CREATE TABLE `lessontradesum` (
  `teacherId` varchar(36) NOT NULL,
  `checkedLessonNum` float(6,2) DEFAULT '0.00' COMMENT '实际到帐课时，为老师提现实际到帐的课时和',
  `withDrawLessonNum` float(6,2) DEFAULT '0.00' COMMENT '老师申请提现通过的所有课时和',
  `frozenLessonNum` float(6,2) DEFAULT '0.00' COMMENT ' 冻结：指教员违约违规，需冻结老师课时费，老师不可提取冻结课时费。如教员又教初中又教高中，则优先冻结较高年级的课时，即冻结高中课时\r\n            实际到帐课时=申请提现通过课时 — 累计冻结课时',
  `totalLessonNum` float(6,2) DEFAULT '0.00' COMMENT '历史所有课时数总和（评级标准之一）',
  `totalIncome` double DEFAULT '0',
  PRIMARY KEY (`teacherId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教师累计提现表（每一次老师提现都更新此表）';

-- ----------------------------
-- Records of lessontradesum
-- ----------------------------
INSERT INTO lessontradesum VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '6.50', '1.00', '0.00', '11.00', '1');
INSERT INTO lessontradesum VALUES ('776b3585-eb3d-4be2-85b0-6e833cf6a913', '2.00', '2.00', '0.00', '2.00', '110');
INSERT INTO lessontradesum VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '3.00', '1.00', '0.00', '7.00', '1');
INSERT INTO lessontradesum VALUES ('ebcea06f-b8ea-45f4-9c39-c843d648602c', '4.00', '4.00', '0.00', '4.00', '220');
INSERT INTO lessontradesum VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO lessontradesum VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '0.00', '0.00', '0.00', '6.00', '0');
INSERT INTO lessontradesum VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '0.00', '0.00', '0.00', '6.00', '0');
INSERT INTO lessontradesum VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '0.00', '0.00', '0.00', '1.00', '0');
INSERT INTO lessontradesum VALUES ('fa21938a-9d7f-442e-b9cb-37be8a2535c6', '0.00', '0.00', '0.00', '4.00', '0');
INSERT INTO lessontradesum VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '4.00', '4.00', '0.00', '10.00', '220');
INSERT INTO lessontradesum VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '6.00', '6.00', '0.00', '6.00', '330');
INSERT INTO lessontradesum VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '8.00', '8.00', '0.00', '8.00', '0');
INSERT INTO lessontradesum VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '6.00', '6.00', '0.00', '6.00', '330');
INSERT INTO lessontradesum VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '0.00', '0.00', '0.00', '3.00', '0');
INSERT INTO lessontradesum VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '12.00', '8.00', '0.00', '12.00', '440');
INSERT INTO lessontradesum VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO lessontradesum VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '7.00', '7.00', '0.00', '7.00', '371');
INSERT INTO lessontradesum VALUES ('a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO lessontradesum VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '0.00', '0.00', '0.00', '6.00', '0');
INSERT INTO lessontradesum VALUES ('db66fd38-466a-4620-9890-6abb10a67a22', '0.00', '0.00', '0.00', '11.00', '0');
INSERT INTO lessontradesum VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '0.00', '0.00', '0.00', '2.00', '0');
INSERT INTO lessontradesum VALUES ('2f6a5e5b-4e32-46d0-8942-5e730051b99a', '0.00', '0.00', '0.00', '3.00', '0');
INSERT INTO lessontradesum VALUES ('581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '10.00', '10.00', '0.00', '10.00', '750');
INSERT INTO lessontradesum VALUES ('c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '0.00', '0.00', '0.00', '16.00', '0');
INSERT INTO lessontradesum VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '0.00', '0.00', '0.00', '2.00', '0');
INSERT INTO lessontradesum VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '2.00', '2.00', '0.00', '2.00', '110');
INSERT INTO lessontradesum VALUES ('19115f9c-d7d6-4415-baab-27cb4973ce98', '0.00', '0.00', '0.00', '6.00', '0');
INSERT INTO lessontradesum VALUES ('2317d1b6-f84d-4633-bc8c-97caaff69e16', '0.00', '0.00', '0.00', '2.00', '0');
INSERT INTO lessontradesum VALUES ('c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '2.00', '2.00', '0.00', '2.00', '150');
INSERT INTO lessontradesum VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '0.00', '0.00', '0.00', '2.00', '0');
INSERT INTO lessontradesum VALUES ('3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO lessontradesum VALUES ('f3ab62e9-bffa-4ca7-950a-9758622de7fc', '0.00', '0.00', '0.00', '4.00', '0');
INSERT INTO lessontradesum VALUES ('d0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '11.00', '11.00', '0.00', '11.00', '605');

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
INSERT INTO lessontype VALUES ('sBYqpOKbAu8h2RB3CnWbBB4f5oBhaaiYDpg6', '161', '30', '0', '16', '0.01', '小六语文', '小六', '0', '0.01', '0', '60');
INSERT INTO lessontype VALUES ('dEClBONtEcLPPENUKHwMK4M4AtToAXFypAdO', '-161', '40', '1', '16', '3200', '小六语文', '小六', '0', '2560', '0', '65');
INSERT INTO lessontype VALUES ('1EiYyFHBsZzo64SzZbEvNzRy19q9PuP4vpMg', '161', '40', '0', '16', '2360', '小六语文', '小六', '0', '2360', '0', '60');
INSERT INTO lessontype VALUES ('T0Rtfb0riTSXDKSlrhrd7B6gaU6QbrkDSrsT', '-161', '60', '1', '16', '4800', '小六语文', '小六', '0', '3720', '0', '65');
INSERT INTO lessontype VALUES ('Ud4053RB0GLmkuAjGeDXOubzu3o7STwAbERS', '161', '60', '0', '16', '3420', '小六语文', '小六', '0', '3420', '0', '60');
INSERT INTO lessontype VALUES ('3GTU4HPeNeKXS8KDeBOUd9QxriiQok4p9cmG', '-161', '80', '1', '16', '6800', '小六语文', '小六', '0', '4800', '0', '65');
INSERT INTO lessontype VALUES ('2L03wGw6w6Eu2dKrSjiSk59TZfEkw5MGNgwL', '161', '80', '0', '16', '4400', '小六语文', '小六', '0', '4400', '0', '60');
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
INSERT INTO lessontype VALUES ('ZL9udOWcrfPHRP3uZkR1L9e41Gv3D273', '231', '20', '0', '12', '1600', null, '初三', '1', '1600', '0', null);

-- ----------------------------
-- Table structure for `lesson_trade_failed`
-- ----------------------------
DROP TABLE IF EXISTS `lesson_trade_failed`;
CREATE TABLE `lesson_trade_failed` (
  `lessonTradeId` varchar(36) NOT NULL DEFAULT '',
  `applyTime` datetime DEFAULT NULL,
  `teacherId` varchar(36) DEFAULT NULL,
  `memberId` varchar(255) DEFAULT NULL,
  `parentId` varchar(36) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '提现状态（0：已成功，1：重传失败）',
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson_trade_failed
-- ----------------------------

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
  `purchaseNum` float(6,2) DEFAULT NULL,
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
INSERT INTO orders VALUES ('fa92b9ba-f1be-4461-b261-2342b3025145', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-04 11:05:27', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('6f41c6e0-d3fe-4f61-be70-e1018c5d9259', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '7c1f175e-92ad-4a83-af61-faf4571dc87d', '2018-03-04 11:28:17', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('999f9085-f746-4f88-810b-bb266dc4cc3b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-03-04 11:31:29', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-03-04 11:32:37', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('26e412cf-a8e8-401c-88fa-fe37aa6bb208', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-03-04 11:38:10', '80.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('49bfe88a-3a6f-40cb-9957-46650620c7df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'cccbb380-7dd4-44b5-8e79-19f7b610d433', '2018-03-04 11:43:08', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('a809032f-f82c-4003-9e70-26b8e6368db1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-03-04 11:45:58', '60.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('90782b65-c2f9-40f1-93d1-8a539537af58', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '2018-03-04 11:49:14', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2018-03-04 11:50:03', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('4363acc2-dce1-41f5-a5d8-21a9c664ecd2', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '5c7f5e36-535f-48f8-8763-0f9b6318073e', '2018-03-04 11:50:57', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('8599b3df-ac74-4ce7-b46e-86101431294c', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-04 12:54:58', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('7a7787a7-3f32-42d0-99dc-673c319d7b9d', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:02:41', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('4970c4d5-bda0-4b46-860d-51c53fa529ad', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:27:46', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('978b7641-2ed5-4a61-8721-528b92cd425a', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:56:17', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('38a80f56-41dc-4bc4-bb3a-300d58253463', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 14:07:41', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('b3cc0620-7124-4402-86f6-81b1ec1fd677', '111', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '0f390070-d868-42d9-832e-8dd8cf229124', '2018-03-04 17:30:35', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('2c371767-c5c8-44bf-b09f-1a7b3cf0d137', '-111', 'a712fda3-c0c0-49aa-be5d-4e90401c368b', 'e78f0e67-17c9-462d-ae45-453daf6562d5', '2018-03-04 18:06:29', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('53183a7a-8547-4823-b908-656b9e818f84', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-03-04 19:16:58', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('fb6a55ea-55e1-45ae-81e7-2caafb99ff2c', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:18:39', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f8905a48-c226-4cc2-8710-e242dbe17563', '111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:19:20', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('127f313b-6c0f-4f6f-8909-8fede191732e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:17:19', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('c0293c4a-bf52-435c-b45f-8172c3ab747c', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:18:10', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('89338b09-7981-49bf-a597-d58e4c0b5245', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:25:05', '1.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('5c6eaa1c-6384-478e-8234-ddd3bfbce2fa', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:31:16', '10.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9af3ef1d-8ed4-4581-9177-5c333efb9446', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:32:07', '-1.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('7a5a04a9-6f4f-4615-a6f0-38571e2f19c6', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:33:18', '10.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('218099dd-bf4b-4834-bd01-386f8280d15d', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:33:26', '-3.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('531c4692-cab7-406c-82da-8564e7ae538a', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-08 21:26:57', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('5b5e53b7-324c-4678-bff1-19d128f6f355', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 21:28:12', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('aeceba8b-9d9b-4ca9-ba5a-c903931c584f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 21:29:27', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0da9053e-409a-43d8-94d9-989ce283a8f8', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 21:45:23', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('68e439e3-d949-4f45-9cfb-3a66bc4e9910', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:11:59', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('85be62cb-3676-41b1-92e5-b85e8b6bf1d1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:36:40', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('06409f59-f672-4d7e-8834-f3cef35cae1a', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:37:13', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('bb35d9db-a35b-4be6-a3e0-47d9d038627d', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 22:38:17', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('5dc10c94-4b1d-4b16-81f6-8f02e191879e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 22:46:42', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c5dd254c-b284-4196-9f16-43a17e8c763b', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-08 23:02:04', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('8fb5244d-6bba-4959-9760-e64f77fe8370', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-03-10 09:23:13', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('de6e0d63-fbe4-4866-a521-e38ad0be0ccd', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 21:36:11', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('87c5f6d6-959b-49af-a90a-b88d85a92d67', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-10 21:59:21', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fd573c19-ee59-4fb9-9fa9-f3b9c3fcf433', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 22:55:24', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9875ed65-6991-43c1-8191-511e30bb55df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 22:58:29', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('dfecbb82-2a0d-4cd0-aaab-c6f5f02c3ffe', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 23:15:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eebc4ed1-ff1e-4598-a9d8-9e993af68360', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-03-11 09:34:00', '60.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-03-11 11:31:36', '80.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-03-11 14:17:45', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('63de6f8f-666b-4127-bf5a-a76bec815c24', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-03-11 19:28:43', '40.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('3916fb92-890d-4634-a040-582cce5f6163', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-03-11 21:39:17', '15.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('3b3aed7a-88af-4738-95e9-e6884326dbfa', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-03-11 22:17:43', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('cb160364-745a-4e89-a782-30d0643e9f9f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-12 15:02:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('e3baa8e9-63c3-4805-aee1-605ca2ca3999', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-03-12 18:52:18', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('47131370-fc7d-4f30-8065-9d5bc8eb3c9e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 21:01:50', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0c4945d6-6144-4457-bea1-0b3f82074b37', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:06:11', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('59c449c7-5ef4-4e26-b148-7e8c6ee17650', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:17:11', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1900e321-c35e-41b6-b0e4-d07aa383b407', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:17:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('bb4c9aae-19d1-4e4c-9bb8-38da2e60ef87', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:43:45', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eaf217fc-6c7c-4f56-be12-2b9d370ea109', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-13 23:10:50', '1.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('44c9560c-76cd-4d41-a96b-654d39ac16fc', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 23:18:09', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1f8ce4c2-8af2-4e57-977c-3e275aef2880', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-13 23:34:40', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('877e1ad7-3b46-4490-8930-5306cdad94f5', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-03-14 17:42:42', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('319213ea-758b-42cb-a834-4a8e1997e16b', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-03-14 22:11:28', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f3ca36e3-15e5-4c56-8a8d-1067156a0da1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 11:09:22', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('6d5ea52f-af75-458f-a0b4-52958b7d5c2f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 11:22:54', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('8231551a-2d67-4d0c-bed6-99de9ccfac38', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 16:26:00', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('2adcf9f0-4777-4e56-a13d-e75a7046e866', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-15 22:29:14', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-03-16 18:46:41', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-03-17 21:44:25', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('960f9ff4-85ea-4e46-8821-8f6d4e9a996e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-18 20:01:17', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('914b764b-8771-40c7-b21e-05ce7d6bd1eb', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-18 20:09:31', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('73a3c5ee-9b27-4efa-93da-f7b339d584d6', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-03-19 11:06:39', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('f8dcbaac-c133-4a7b-a161-d896376e3fad', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 19:58:37', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('39546c1c-4510-4582-8ea2-1da68d151263', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 20:02:19', '2.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9897f53b-bbac-4fbf-b579-35bdedf27586', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:48:50', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('86d72767-5f2b-41ec-850a-1c3fea2419d9', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:54:40', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('d51a5072-542f-4151-9a59-99ac7ae2031c', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:59:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('306dde2d-c5d0-4b11-856b-0259943de776', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:59:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('bd1f0a78-390f-4f36-acbd-f0e0ec514c8b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:01:57', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('383ad241-c1ec-44ea-aedf-eeb84684fdf0', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:03:46', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('be3516e7-aee6-4335-b8bc-85b042ddde7e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:21:45', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eae9719f-49d5-46da-a1f8-3a28fb6af3be', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:32:38', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1b21b815-ae3f-459c-9676-5cc32b8876bc', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:39:53', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-03-21 08:59:15', '25.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('ed9b55d8-738b-43c6-87c0-2c6ea30ec737', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 11:38:38', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('50fcd63f-91c5-4371-b2e6-33e81832d35a', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 13:36:11', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('aa92c367-d393-4303-9edf-29e5c72ba000', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 15:28:47', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c6af12ed-ee54-4f92-9261-3dc190a2010a', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:08:19', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('dc58bc93-6daf-4b26-b7a1-c15e4953fac1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:14:18', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c65d08b5-0d5c-4bdc-9274-c3ec329272f0', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:30:24', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('87a767a8-22b6-48d9-a24a-cc6d52c975e9', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-03-21 21:07:56', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('9461f1df-fa79-4609-88fe-757fd0ccf99c', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-24 12:08:22', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('83bb28c1-8f21-483a-8348-07bf53f702ef', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-24 19:21:38', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('e37770db-2e80-422e-b4d3-e12cab81145a', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-03-25 19:19:32', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('878030f0-b55b-4abc-9af7-16947f353ac1', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-03-26 08:44:56', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-26 20:54:40', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('68390142-be76-4569-99ec-3f4f6e61c13c', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-27 19:38:58', '-6.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-03-28 15:00:47', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-28 15:11:07', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('c4188ec5-7552-4ccc-8a35-6287339f7566', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:40', '-4.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('0f619823-ebf2-4c14-9b1a-98f735ff6bf4', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:43', '-4.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('0f60105c-c778-4c87-9df5-51e3cb9947b2', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:47', '-4.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('1465161c-351c-4bb0-a185-598859e6bb26', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:54:13', '8.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fdf68851-7c47-437f-87b3-8091a639bb28', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-29 12:59:30', '-4.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('497f668a-5c7c-4cd9-b2e7-164a53b85d6a', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-29 13:11:18', '7.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('57690f2e-484f-466a-943d-6ae8b5eee0d7', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-03-29 14:26:48', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('8392f7d1-9b76-486d-a810-d7f651340a08', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-03-29 20:41:32', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('d5b3a276-c468-49fc-9a19-12deccd4f5bb', '-211', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '2018-03-29 22:50:20', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('eb4baf58-0f3e-4017-958c-a711c8f05ffb', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-30 17:50:45', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('9241dacb-e389-45fe-b432-21a34307b019', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-31 13:20:45', '-4.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('eec3166c-b969-4bba-982a-46fd8f62ef06', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 15:14:57', '20.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('deba3091-8e44-48e4-a71a-a158eb9c4be4', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:20:15', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('745fb255-d039-4c5d-b527-20c21ffdcf51', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:22:20', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0293feed-7c35-4d85-a016-8fdf60f17494', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:53:10', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('339d3239-3805-41a0-abc4-19a8480fcce8', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:57:58', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('11097d40-84d4-4744-bd48-b854fb291dd0', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 18:07:16', '-9.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-03-31 20:09:06', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('8591dca2-85c5-45f2-a103-f7b09ed8962f', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-03-31 22:49:31', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('0074262e-7492-4540-a61a-ca5b55a31e45', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 15:42:47', '80.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('be8e627d-a4c6-4e0c-a12c-11537519585b', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 16:06:44', '3.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('8da10dd1-1077-4bba-87df-ccd3289d4eae', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:41:09', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('404fa5e8-82ac-4751-890c-bfdb0b657744', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:41:32', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('f8358077-78e1-4f28-8134-83365338f0f8', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:42:08', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('288cace0-5bae-4c11-9167-c1646d1c4b64', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:53:45', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('68c3050c-5e2f-41c7-899e-3ebd109a4d52', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 16:54:14', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3999a748-51d9-45ee-a1ba-d30af836a0fb', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:57:20', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('a3b9d1fd-8726-4b75-80dc-259ca011d310', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 17:02:15', '5.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('af7e9f1e-1c86-4454-b9e8-a432e58f8fda', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:08:53', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('47e94225-3c7d-4423-9a1a-7ec49fc7325c', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:14:05', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('aed7c9a9-a46e-45ce-82f4-c8d701f10667', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:20:21', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('f319c5e0-8ce6-45d0-90d9-7ccf584e2034', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:34:20', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('a0c251ac-8221-43a3-8717-0d0cf0e9eb00', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 22:07:43', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('36ddf58e-bbb0-4bc7-b614-95593f5bd71f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 22:11:49', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('31c764a7-240c-4d72-8fff-46a3406d4bd3', '-231', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '2018-04-02 08:50:16', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-04-02 08:51:13', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('fe423223-0125-463e-a23e-c8759ca06222', '-231', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '2018-04-02 10:02:40', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('cec19c3d-e59f-48e9-8e55-6a06a88ae298', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-04-02 17:34:51', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('32284eac-f199-44cd-989b-20fa8c6363e5', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-04-02 18:59:31', '5.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('7805c2bf-ca22-4274-a772-dc1ac11e8847', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-04-02 18:59:37', '-5.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('d827f356-7b1b-4f9d-b99e-734e3ff1a3f3', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-02 21:37:17', '20.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('8104b7f0-b244-419c-9863-6fd617caf676', '-211', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', '2018-04-03 09:47:42', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('19ef0378-c057-4e32-8b45-d85f87107d32', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-03 10:02:24', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fca0c88c-636b-4f39-b740-9f071d380573', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-03 10:04:07', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9d49c468-6d21-41b5-8d45-7d7202929178', '-231', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f', 'fb276474-891d-4c41-b32b-96bcb5531675', '2018-04-03 14:13:05', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('8d72064c-8a95-4740-a1e1-058a9e956633', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '3d5fbd91-ce72-4426-a573-2ba496710a6b', '2018-04-03 18:48:38', '10.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('146b69d5-f005-4f92-8fda-5fa82df0c061', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-03 23:35:53', '-3.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('037c3673-3c3a-4b58-81dc-a6e90563b7cc', '-231', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '2018-04-04 18:43:39', '40.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('c21fa5ed-9088-44c5-a774-29575d51d250', '-331', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '2018-04-04 19:01:34', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('caf0c16c-3601-4919-96db-c0d55d1f1aca', '-231', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '2018-04-04 20:15:29', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '-231', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2018-04-05 10:29:02', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('2f15c6ad-10cd-4af9-a4ed-52f87b81b511', '311', 'e13cb91b-d429-4204-a185-48752af469f0', 'f6fe6270-ab84-42a2-a356-0cf1fc5d83de', '2018-04-05 16:55:44', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('3e16af28-6a16-4f15-b0de-319c337d816c', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-05 20:21:40', '60.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('de12126d-0e9f-476f-970c-6a8c5bb18669', '-231', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '2018-04-07 17:53:31', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('b2d86f6d-bc8a-4a5f-be03-26811a5291ab', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-04-08 10:52:46', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('ef476966-76a7-4901-b261-b0153a05c31a', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-04-08 18:30:25', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('9d1f085e-1242-428e-8eb3-7ae84e9d3844', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-08 18:49:16', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('586695ec-5b2b-4529-a942-87dfa11e80de', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-04-08 18:49:52', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('6206a78d-c1d7-46b8-b445-16dc8bb66602', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-04-08 18:59:25', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('5b281c5e-c0be-4b5e-a32f-c66bcab120d8', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-04-08 19:07:31', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3fe2f612-1511-4449-bc6f-9196629f7d40', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-04-08 19:32:31', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3235816b-d69a-4e6b-97cb-ed3144cee405', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-04-08 19:42:34', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('58882163-50bc-42c8-8f3f-fa76b77c023e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-04-08 19:43:28', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('91ce217a-0aea-4218-976e-81acc22b1fe2', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-04-08 20:27:38', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('5bf492c8-c8c3-407d-865c-7edef58d83ed', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-04-08 20:31:42', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('7b0e9088-b0c7-4e1c-a66f-e86010d1e7bc', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-04-08 21:01:42', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('720db5ed-b242-4b52-8779-8a88cff1c3aa', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-04-08 21:13:08', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('4cc15379-246e-4a95-a6fd-49f326d0de3d', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-04-08 21:50:00', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('430de96a-867d-40eb-9b3e-eaab89a6065c', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-04-08 22:32:00', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('dc18dee1-0277-4ae6-9c81-c4e245ff3976', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-04-08 22:56:24', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1998670d-75f3-40da-8d64-2e39a4103d5e', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-04-08 23:15:15', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('dc0157a4-c111-4179-a936-d085ad5e6c11', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-04-09 09:50:22', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('a7d9a12e-bac8-46bb-9202-221804b9c39d', '-231', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '2018-04-09 10:05:43', '20.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('5af23dd7-52fb-4564-a13f-b3dfbadbff83', '-231', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 11:37:46', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('38b2b7f7-1236-4e4c-b63a-4ccb8d422d1b', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-04-09 12:51:01', '-7.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('74fc8789-52b0-4cce-b2f4-96806dd4a9bd', '-311', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '2018-04-09 13:05:09', '35.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('7daa26c1-40cf-4f99-9c15-c9e9d3694d0f', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-04-09 19:06:56', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('925575cf-a63f-467c-9b57-1ec38179f7de', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 19:12:04', '15.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('68fd59e8-00ac-466a-b943-9d639df143e5', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 19:22:51', '-2.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('30708dee-9c3e-45c1-a769-85ef54258cc4', '-311', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '2018-04-09 19:37:34', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('0c34d38a-5001-448a-a586-64a17ba2f2f5', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-04-09 20:00:38', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('e62b9949-6f98-4482-bfa5-331f32ac0ddb', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 20:03:22', '-11.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('88ee2a06-b4e2-4880-9513-672587957a5e', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-09 20:07:18', '30.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('99986f28-93c9-4c7e-9026-6a78e729522c', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-09 20:20:41', '10.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('655bae5f-395f-4122-be6c-74bf25a10a5a', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '3d5fbd91-ce72-4426-a573-2ba496710a6b', '2018-04-09 20:21:54', '-10.00', '0', null, null, null, null, '0');
INSERT INTO orders VALUES ('f517f278-64fe-461c-9bc4-79048ff13db1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 21:04:55', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1a3e3cde-5d12-4d96-8b0e-e5fcbc4f2512', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 21:08:08', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('da40e383-5e28-4f11-8439-da7c93376fd1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 21:16:01', '-1.50', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('1b9ea11b-d622-4bc4-9465-6dd1d60452da', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-04-09 21:33:22', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('893ae647-c243-44d0-addb-9c9497720478', '-231', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2018-04-09 21:36:11', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('6f93a236-0591-468f-a225-1f37469877fa', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-04-09 21:45:32', '-10.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('ac7d48bf-fa49-477b-ac87-c6fca08f1ed9', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-04-09 21:57:58', '-16.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('15899168-e690-46f6-8845-39cc02a82b9d', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-04-09 22:06:33', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('3d748238-f5aa-4b27-928a-9b40a83f2659', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 22:15:30', '-1.50', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('fd5d30d9-3548-497e-9706-ef8ec0b15677', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-04-09 22:35:10', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('86cc94ef-b1c7-423a-8014-05dbc4183b9a', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-04-09 23:35:10', '32.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('f40b3c03-22b9-46bb-a2a7-bb12aadcab72', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-10 10:58:28', '2.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('d928e03c-1bcc-4d63-8534-c5f62e83bb06', '-231', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '2018-04-10 11:08:32', '1.00', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('43d523c6-9a7b-47b2-a61d-f6b537675070', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-10 16:35:09', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('eb579546-e561-41d6-8883-2ac4c992da09', '-211', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '2018-04-10 19:53:38', '39.00', '2', '0', null, null, null, '0');
INSERT INTO orders VALUES ('df984c47-7aff-4074-9d17-cdc152e3eb2b', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-04-10 21:21:42', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('48373e68-94f4-4319-89e7-2a355e9b05b8', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-04-10 21:59:41', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('6bc3bb40-d749-4e85-b5ed-1cefb63371c0', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-04-10 23:09:46', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('cc8a0091-772f-49d9-b7ef-e7ef7d507637', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-10 23:21:11', '-1.50', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('4d56d9d9-877c-436a-abcb-ebc514d84421', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-04-11 00:02:09', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('a0bea605-d53d-4997-ba6b-807ebece0cde', '-211', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '2018-04-11 13:29:51', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('7640fe8b-266c-409b-95b9-05c500f199ef', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 14:38:33', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('671aaf61-88cd-4331-aca6-e5b705f1cc37', '-231', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '2018-04-11 16:48:39', '30.00', '2', '1', null, null, null, '0');
INSERT INTO orders VALUES ('9092c586-4bda-4b20-b6ad-c1fdd2b50b77', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-04-11 20:32:27', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('93f166ab-0b1c-443a-89dc-a3e139ab924d', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 21:00:52', '-0.50', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('58681c41-e75d-48f0-bda8-1d60950c19dc', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 21:01:04', '-1.50', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('c1877e64-8d95-4ef0-90b8-07149eaf5df7', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 21:01:18', '0.50', '1', null, null, null, null, '0');
INSERT INTO orders VALUES ('81a31a3c-0e64-4d34-a527-ae4bdc1af4e2', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-11 21:54:26', '-11.00', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('e82f735a-29c6-48d0-838c-8d29fcb2fb31', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-12 10:10:42', '-0.50', '-1', null, null, null, null, '0');
INSERT INTO orders VALUES ('2c4cbcd0-d5b3-44be-a61d-765f3615f7fa', '-231', '18709a24-fda2-4522-aa3b-b29847cd9ca4', '1b201cf7-e147-4897-ac9d-71961be06c24', '2018-04-12 21:45:35', '30.00', '2', '0', null, null, null, '0');

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
  `totalLessonNum` float(6,2) DEFAULT NULL,
  `lessonLeftNum` float(6,2) DEFAULT NULL,
  `teachingIds` varchar(360) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`lessonType`,`parentId`,`memberId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单汇总';

-- ----------------------------
-- Records of ordersum
-- ----------------------------
INSERT INTO ordersum VALUES ('fa92b9ba-f1be-4461-b261-2342b3025145', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-04 11:05:27', '30.00', '19.50', '86aed366-b47d-4e95-a859-862b9bb358a5,cc70187f-a06f-469c-9401-7b7603ad7347,4d8192eb-b19b-4526-99b1-3604d27033be');
INSERT INTO ordersum VALUES ('6f41c6e0-d3fe-4f61-be70-e1018c5d9259', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '7c1f175e-92ad-4a83-af61-faf4571dc87d', '2018-03-04 11:28:17', '40.00', '40.00', null);
INSERT INTO ordersum VALUES ('999f9085-f746-4f88-810b-bb266dc4cc3b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-03-04 11:31:29', '30.00', '29.00', '0bdc7479-f122-4614-8a00-22f166abaa38,78b8f787-05df-4ad1-bdcb-466804c52dd4');
INSERT INTO ordersum VALUES ('b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-03-04 11:32:37', '40.00', '20.00', '37e49b33-f12a-4693-9e11-aed0bf39f981,3e9162a0-a70e-4bef-905a-a40c0ba0df2a');
INSERT INTO ordersum VALUES ('26e412cf-a8e8-401c-88fa-fe37aa6bb208', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-03-04 11:38:10', '80.00', '80.00', '260d90c3-929d-4407-ad6a-272afc660212');
INSERT INTO ordersum VALUES ('49bfe88a-3a6f-40cb-9957-46650620c7df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'cccbb380-7dd4-44b5-8e79-19f7b610d433', '2018-03-04 11:43:08', '40.00', '40.00', '3bf0d502-f4c7-4c3c-ad03-53284868dc0a');
INSERT INTO ordersum VALUES ('a809032f-f82c-4003-9e70-26b8e6368db1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-03-04 11:45:58', '60.00', '60.00', '14326653-ca8d-4e6a-8eb1-55174a504a0e');
INSERT INTO ordersum VALUES ('90782b65-c2f9-40f1-93d1-8a539537af58', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '2018-03-04 11:49:14', '40.00', '40.00', null);
INSERT INTO ordersum VALUES ('a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2018-03-04 11:50:03', '40.00', '40.00', '8fd5a867-cf4b-4163-889e-e0778641a4a5');
INSERT INTO ordersum VALUES ('4363acc2-dce1-41f5-a5d8-21a9c664ecd2', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '5c7f5e36-535f-48f8-8763-0f9b6318073e', '2018-03-04 11:50:57', '40.00', '40.00', 'e0b3d132-d720-4961-a8b2-c506466c87a6,1aa7085d-901c-42fd-9511-3711ed3dec72');
INSERT INTO ordersum VALUES ('8599b3df-ac74-4ce7-b46e-86101431294c', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-04 12:54:58', '1.00', '-2.00', 'f0b44033-0d96-469c-8df3-751ba320e716');
INSERT INTO ordersum VALUES ('7a7787a7-3f32-42d0-99dc-673c319d7b9d', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:56:17', '-1.00', '-1.00', null);
INSERT INTO ordersum VALUES ('4970c4d5-bda0-4b46-860d-51c53fa529ad', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 14:07:41', '2.00', '1.00', 'c37a2e10-70ac-4d73-b65e-1327d3c5628f');
INSERT INTO ordersum VALUES ('b3cc0620-7124-4402-86f6-81b1ec1fd677', '111', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '0f390070-d868-42d9-832e-8dd8cf229124', '2018-03-04 17:30:35', '1.00', '1.00', null);
INSERT INTO ordersum VALUES ('2c371767-c5c8-44bf-b09f-1a7b3cf0d137', '-111', 'a712fda3-c0c0-49aa-be5d-4e90401c368b', 'e78f0e67-17c9-462d-ae45-453daf6562d5', '2018-03-04 18:06:29', '1.00', '1.00', null);
INSERT INTO ordersum VALUES ('53183a7a-8547-4823-b908-656b9e818f84', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-02 21:37:17', '21.00', '19.00', 'a4dbc41f-3d29-4629-9d6d-1a3ff201eede,60f60bee-3cc0-45e5-ab06-1fdc359f744d');
INSERT INTO ordersum VALUES ('fb6a55ea-55e1-45ae-81e7-2caafb99ff2c', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:18:39', '2.00', '2.00', null);
INSERT INTO ordersum VALUES ('f8905a48-c226-4cc2-8710-e242dbe17563', '111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:19:20', '1.00', '1.00', null);
INSERT INTO ordersum VALUES ('127f313b-6c0f-4f6f-8909-8fede191732e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:25:05', '19.00', '-14.50', '2d72270f-f8fe-4a24-93b2-885e8f8f5463,dde3612a-990b-43e8-8ebb-02123e838cc1,6380cb70-c25e-4077-a2ff-b0f65449e08b,5643eb54-af69-48f5-8680-37c8a9076677');
INSERT INTO ordersum VALUES ('8fb5244d-6bba-4959-9760-e64f77fe8370', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-03-10 09:23:13', '30.00', '16.00', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2,9cad6167-8dda-4659-974b-1a7d60aba1f9,748ac459-aca8-4b9a-b792-e3aaf09a8e23');
INSERT INTO ordersum VALUES ('eebc4ed1-ff1e-4598-a9d8-9e993af68360', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-03-11 09:34:00', '60.00', '45.00', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7,425e3aab-b0d2-4521-b858-0a70509b5d9e,7017346c-ff3f-4f42-9a40-e92dc324ef19');
INSERT INTO ordersum VALUES ('f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-03-11 11:31:36', '80.00', '68.00', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494,39a82af9-6cdf-4b92-b0ad-2af75eb02564');
INSERT INTO ordersum VALUES ('e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-03-11 14:17:45', '30.00', '21.00', '88952680-bedf-47cc-86ed-8d61aa95abb7,03e04220-5ce6-40bf-8d47-c2a54a2d3816,10bb2db3-7317-4e80-81f5-8e8998fd3a01,8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2');
INSERT INTO ordersum VALUES ('63de6f8f-666b-4127-bf5a-a76bec815c24', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-03-11 19:28:43', '40.00', '28.00', '5a978ecd-96da-4eae-b3f5-8706fcb3792e,f926d599-de1a-4b81-8343-9833c57a0882,9b6d689e-8671-4ee0-81f1-6cc27981b9c6,4d309b83-f780-4e70-9aaa-399c086cff52');
INSERT INTO ordersum VALUES ('3916fb92-890d-4634-a040-582cce5f6163', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-03-11 21:39:17', '15.00', '9.00', '45d8c044-8858-41d5-a215-4444519387d5,c9c3c13c-d4ec-4389-a10a-4319c52e3d70,9ed37360-bf7f-4d5f-8a00-43c514053d52,98efdd46-b5b6-414c-9c31-56320515f91d');
INSERT INTO ordersum VALUES ('3b3aed7a-88af-4738-95e9-e6884326dbfa', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-03-11 22:17:43', '40.00', '38.00', '8ecacfdd-351a-4381-bf5c-29bf8a815a88');
INSERT INTO ordersum VALUES ('e3baa8e9-63c3-4805-aee1-605ca2ca3999', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-03-12 18:52:18', '30.00', '23.00', 'faf95a49-dc0b-49c4-a24e-be34c61e622f');
INSERT INTO ordersum VALUES ('877e1ad7-3b46-4490-8930-5306cdad94f5', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-03-14 17:42:42', '30.00', '30.00', 'b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02');
INSERT INTO ordersum VALUES ('319213ea-758b-42cb-a834-4a8e1997e16b', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-03-14 22:11:28', '30.00', '20.00', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73');
INSERT INTO ordersum VALUES ('3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-03-16 18:46:41', '30.00', '20.00', 'a93762e3-28ab-46b2-9793-8c73229268ca,6a2f9398-4577-4d5c-925c-b32352714ad2,3e74a8b4-7352-4fb3-94a9-48e03a354616,340e167e-e746-4d13-b45d-7370c640f2f8,cab9004e-3dbe-4777-8dbf-b39049fd8007');
INSERT INTO ordersum VALUES ('6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-03-17 21:44:25', '30.00', '14.00', '3b7435ef-5564-4501-8ed7-49ce14572ab0');
INSERT INTO ordersum VALUES ('73a3c5ee-9b27-4efa-93da-f7b339d584d6', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-03-19 11:06:39', '30.00', '26.00', '63aa4adc-bf6f-49c2-8164-f93bf08df35e');
INSERT INTO ordersum VALUES ('f8dcbaac-c133-4a7b-a161-d896376e3fad', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 19:58:37', '32.00', '32.00', '8426c300-a528-4318-8983-4fd19f3f0ff0');
INSERT INTO ordersum VALUES ('ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-03-21 08:59:15', '25.00', '25.00', 'd8284412-4b3d-413c-88f3-d5c913f5df4f');
INSERT INTO ordersum VALUES ('87a767a8-22b6-48d9-a24a-cc6d52c975e9', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-03-21 21:07:56', '30.00', '30.00', 'f849cbc7-5943-4710-b614-8f8cffd304e5');
INSERT INTO ordersum VALUES ('9461f1df-fa79-4609-88fe-757fd0ccf99c', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-24 12:08:22', '26.00', '26.00', '9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c');
INSERT INTO ordersum VALUES ('83bb28c1-8f21-483a-8348-07bf53f702ef', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-24 19:21:38', '47.00', '47.00', 'f6dc4acc-f4d7-4aaf-b134-d818877620c9');
INSERT INTO ordersum VALUES ('e37770db-2e80-422e-b4d3-e12cab81145a', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-03-25 19:19:32', '30.00', '26.00', 'e10d87f4-b1eb-4b93-b46c-153cd988a403,5a88004b-a6ed-4463-aa35-33f6befbff13');
INSERT INTO ordersum VALUES ('878030f0-b55b-4abc-9af7-16947f353ac1', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-03-26 08:44:56', '30.00', '30.00', '3f62df1a-7ce8-4d41-9476-aec52a3c267d');
INSERT INTO ordersum VALUES ('8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-26 20:54:40', '24.00', '20.00', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67');
INSERT INTO ordersum VALUES ('5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-03-28 15:00:47', '30.00', '28.00', 'f2eff1fa-55b8-4a6b-8d24-59773b22d648');
INSERT INTO ordersum VALUES ('9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-28 15:11:07', '26.00', '22.00', 'b18c2e01-544d-4e2b-bd41-3772c57c6976');
INSERT INTO ordersum VALUES ('57690f2e-484f-466a-943d-6ae8b5eee0d7', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-03-29 14:26:48', '30.00', '30.00', 'c6c96bcb-068b-4c03-af6b-9a855737bffd');
INSERT INTO ordersum VALUES ('8392f7d1-9b76-486d-a810-d7f651340a08', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-03-29 20:41:32', '30.00', '28.00', '4b99627f-fdf6-4325-a3d6-f5c83a421706');
INSERT INTO ordersum VALUES ('d5b3a276-c468-49fc-9a19-12deccd4f5bb', '-211', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '2018-03-29 22:50:20', '30.00', '30.00', '9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5,e64a4b66-c6d5-439d-b1ad-29929236a236,64e2a46a-6e1c-48ad-8cd7-4494f591972e,b6f587b6-5d6c-4f13-a17b-f91b3edf17bc');
INSERT INTO ordersum VALUES ('eb4baf58-0f3e-4017-958c-a711c8f05ffb', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-30 17:50:45', '26.00', '24.00', 'e3ff9924-100d-4a58-bbca-54d2fad68f69');
INSERT INTO ordersum VALUES ('eec3166c-b969-4bba-982a-46fd8f62ef06', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 15:14:57', '20.00', '7.00', 'a4272eba-cc9c-40da-9e9e-a7b9662a46f3,6b387dfd-a870-40ae-b589-98b940508344,19926eb3-dd5d-46e8-999c-1978dcfce375,14809588-e1a2-47ff-9828-6fe4c159dce5,27f55f4f-55dc-4d66-87ad-471ec7e794f3');
INSERT INTO ordersum VALUES ('f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-03-31 20:09:06', '30.00', '30.00', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4');
INSERT INTO ordersum VALUES ('8591dca2-85c5-45f2-a103-f7b09ed8962f', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-03-31 22:49:31', '30.00', '30.00', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105');
INSERT INTO ordersum VALUES ('0074262e-7492-4540-a61a-ca5b55a31e45', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 15:42:47', '88.00', '88.00', 'f558d3cb-3858-44de-aece-19b4ffc45396');
INSERT INTO ordersum VALUES ('31c764a7-240c-4d72-8fff-46a3406d4bd3', '-231', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '2018-04-02 08:50:16', '30.00', '30.00', '2e858069-8e55-45b6-9bdd-725eece0438b');
INSERT INTO ordersum VALUES ('7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-04-02 08:51:13', '30.00', '30.00', '562f12cf-b532-44b1-8d55-dd55e8211fed');
INSERT INTO ordersum VALUES ('fe423223-0125-463e-a23e-c8759ca06222', '-231', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '2018-04-02 10:02:40', '30.00', '30.00', 'dd7f3ed4-6b89-484f-af84-275df6c719a7');
INSERT INTO ordersum VALUES ('cec19c3d-e59f-48e9-8e55-6a06a88ae298', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-04-02 17:34:51', '30.00', '30.00', 'bbcd0381-1fe7-4c13-9eff-71fced57f12e');
INSERT INTO ordersum VALUES ('8104b7f0-b244-419c-9863-6fd617caf676', '-211', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', '2018-04-03 09:47:42', '30.00', '30.00', 'b56826ad-23bb-4162-8c5c-6cd7cf516889');
INSERT INTO ordersum VALUES ('9d49c468-6d21-41b5-8d45-7d7202929178', '-231', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f', 'fb276474-891d-4c41-b32b-96bcb5531675', '2018-04-03 14:13:05', '30.00', '30.00', '5bdd1587-c65e-4c95-84b0-1c83be168446');
INSERT INTO ordersum VALUES ('8d72064c-8a95-4740-a1e1-058a9e956633', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '3d5fbd91-ce72-4426-a573-2ba496710a6b', '2018-04-03 18:48:38', '0.00', '0.00', 'ef1bf0d3-9959-43f9-9b7f-18effbdc1a02');
INSERT INTO ordersum VALUES ('037c3673-3c3a-4b58-81dc-a6e90563b7cc', '-231', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '2018-04-04 18:43:39', '41.00', '41.00', 'acff1cb9-18a5-4963-976c-04dd78f1031b');
INSERT INTO ordersum VALUES ('c21fa5ed-9088-44c5-a774-29575d51d250', '-331', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '2018-04-04 19:01:34', '30.00', '30.00', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4');
INSERT INTO ordersum VALUES ('caf0c16c-3601-4919-96db-c0d55d1f1aca', '-231', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '2018-04-04 20:15:29', '30.00', '30.00', '5af60a58-368f-4d40-b522-49a685f977d8');
INSERT INTO ordersum VALUES ('3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '-231', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2018-04-05 10:29:02', '30.00', '27.00', 'b66a90f4-e5a6-4ba5-a64c-85221ae34828');
INSERT INTO ordersum VALUES ('2f15c6ad-10cd-4af9-a4ed-52f87b81b511', '311', 'e13cb91b-d429-4204-a185-48752af469f0', 'f6fe6270-ab84-42a2-a356-0cf1fc5d83de', '2018-04-05 16:55:44', '30.00', '30.00', null);
INSERT INTO ordersum VALUES ('3e16af28-6a16-4f15-b0de-319c337d816c', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-05 20:21:40', '62.00', '62.00', '8d5fa78f-c3fb-48e7-9441-046d55522dc7,a9be6da1-71d3-4437-b617-4ce283c0d587');
INSERT INTO ordersum VALUES ('de12126d-0e9f-476f-970c-6a8c5bb18669', '-231', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '2018-04-07 17:53:31', '30.00', '30.00', '72d7b5fe-d664-421d-9ac5-9e9f9bc6fe82,7c3cbd28-fcc4-4b56-bcf4-8cfca9d1bf01');
INSERT INTO ordersum VALUES ('a7d9a12e-bac8-46bb-9202-221804b9c39d', '-231', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '2018-04-09 10:05:43', '20.00', '20.00', 'a6ac0da9-14dc-48c1-91ef-fd00cf86eb04');
INSERT INTO ordersum VALUES ('5af23dd7-52fb-4564-a13f-b3dfbadbff83', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 11:37:46', '43.00', '32.00', '6c2a26f9-f464-42ff-a699-a227cc617da4,487bd9a3-57b1-4583-8802-f614c2ded24e');
INSERT INTO ordersum VALUES ('74fc8789-52b0-4cce-b2f4-96806dd4a9bd', '-311', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '2018-04-09 13:05:10', '35.00', '27.00', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f');
INSERT INTO ordersum VALUES ('88ee2a06-b4e2-4880-9513-672587957a5e', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-09 20:07:18', '40.00', '23.00', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3,fe4dc516-1b4b-42ad-ba51-5c79f200fa1e');
INSERT INTO ordersum VALUES ('eb579546-e561-41d6-8883-2ac4c992da09', '-211', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '2018-04-10 19:53:38', '39.00', '31.00', 'ded7ab44-98ea-4eff-b893-3ab04630129e');
INSERT INTO ordersum VALUES ('86cc94ef-b1c7-423a-8014-05dbc4183b9a', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-04-09 23:35:10', '32.00', '28.00', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55');
INSERT INTO ordersum VALUES ('7640fe8b-266c-409b-95b9-05c500f199ef', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 14:38:33', '28.50', '28.50', null);
INSERT INTO ordersum VALUES ('671aaf61-88cd-4331-aca6-e5b705f1cc37', '-231', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '2018-04-11 16:48:39', '30.00', '30.00', null);
INSERT INTO ordersum VALUES ('2c4cbcd0-d5b3-44be-a61d-765f3615f7fa', '-231', '18709a24-fda2-4522-aa3b-b29847cd9ca4', '1b201cf7-e147-4897-ac9d-71961be06c24', '2018-04-12 21:45:35', '30.00', '30.00', null);

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
INSERT INTO order_teaching_r VALUES ('dd7f3ed4-6b89-484f-af84-275df6c719a7', 'fe423223-0125-463e-a23e-c8759ca06222', '3', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '76a6c3d8-ef83-4fb7-bd5c-b27c47eccf02');
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
INSERT INTO order_teaching_r VALUES ('3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '2', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb');
INSERT INTO order_teaching_r VALUES ('562f12cf-b532-44b1-8d55-dd55e8211fed', '7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '1', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31');
INSERT INTO order_teaching_r VALUES ('4d8192eb-b19b-4526-99b1-3604d27033be', 'fa92b9ba-f1be-4461-b261-2342b3025145', '7', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO order_teaching_r VALUES ('b56826ad-23bb-4162-8c5c-6cd7cf516889', '8104b7f0-b244-419c-9863-6fd617caf676', '2', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', 'dc9620b4-021a-4809-a238-7f83c80b636b');
INSERT INTO order_teaching_r VALUES ('bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'cec19c3d-e59f-48e9-8e55-6a06a88ae298', '2', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af');
INSERT INTO order_teaching_r VALUES ('2e858069-8e55-45b6-9bdd-725eece0438b', '31c764a7-240c-4d72-8fff-46a3406d4bd3', '8', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '5f53edf6-079a-4874-8e86-4c48d14a268e');
INSERT INTO order_teaching_r VALUES ('5bdd1587-c65e-4c95-84b0-1c83be168446', '9d49c468-6d21-41b5-8d45-7d7202929178', '2', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f', 'fb276474-891d-4c41-b32b-96bcb5531675', 'a541a150-d670-4d4e-a6ce-f3ef1517a5dc');
INSERT INTO order_teaching_r VALUES ('e3ff9924-100d-4a58-bbca-54d2fad68f69', 'eb4baf58-0f3e-4017-958c-a711c8f05ffb', '2', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2317d1b6-f84d-4633-bc8c-97caaff69e16');
INSERT INTO order_teaching_r VALUES ('c6c96bcb-068b-4c03-af6b-9a855737bffd', '57690f2e-484f-466a-943d-6ae8b5eee0d7', '3', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '436e705c-33e3-4f57-ba31-6eadb0596ac4');
INSERT INTO order_teaching_r VALUES ('b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '2', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6');
INSERT INTO order_teaching_r VALUES ('3f62df1a-7ce8-4d41-9476-aec52a3c267d', '878030f0-b55b-4abc-9af7-16947f353ac1', '3', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d');
INSERT INTO order_teaching_r VALUES ('4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '3', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '776b3585-eb3d-4be2-85b0-6e833cf6a913');
INSERT INTO order_teaching_r VALUES ('63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', '3', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', 'ebcea06f-b8ea-45f4-9c39-c843d648602c');
INSERT INTO order_teaching_r VALUES ('1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '2', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57');
INSERT INTO order_teaching_r VALUES ('f2eff1fa-55b8-4a6b-8d24-59773b22d648', '5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '7', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7');
INSERT INTO order_teaching_r VALUES ('9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c', '9461f1df-fa79-4609-88fe-757fd0ccf99c', '1', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e');
INSERT INTO order_teaching_r VALUES ('d8284412-4b3d-413c-88f3-d5c913f5df4f', 'ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '3', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '44cd5d75-722e-4c03-ac2a-360e5447b97f');
INSERT INTO order_teaching_r VALUES ('b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '877e1ad7-3b46-4490-8930-5306cdad94f5', '2', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '6c7dae17-0dcb-4263-89b2-ae255883c682');
INSERT INTO order_teaching_r VALUES ('ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '2', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc');
INSERT INTO order_teaching_r VALUES ('5643eb54-af69-48f5-8680-37c8a9076677', '127f313b-6c0f-4f6f-8909-8fede191732e', '7', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3');
INSERT INTO order_teaching_r VALUES ('a6ac0da9-14dc-48c1-91ef-fd00cf86eb04', 'a7d9a12e-bac8-46bb-9202-221804b9c39d', '9', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31');
INSERT INTO order_teaching_r VALUES ('1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '2', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '19115f9c-d7d6-4415-baab-27cb4973ce98');
INSERT INTO order_teaching_r VALUES ('63f9806d-4e5b-450f-b71b-0401699695e4', '8599b3df-ac74-4ce7-b46e-86101431294c', '2', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda');
INSERT INTO order_teaching_r VALUES ('b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '3', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0');
INSERT INTO order_teaching_r VALUES ('37e49b33-f12a-4693-9e11-aed0bf39f981', 'b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '1', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO order_teaching_r VALUES ('3e9162a0-a70e-4bef-905a-a40c0ba0df2a', 'b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '2', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO order_teaching_r VALUES ('acff1cb9-18a5-4963-976c-04dd78f1031b', '037c3673-3c3a-4b58-81dc-a6e90563b7cc', '2', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e');
INSERT INTO order_teaching_r VALUES ('78b8f787-05df-4ad1-bdcb-466804c52dd4', '999f9085-f746-4f88-810b-bb266dc4cc3b', '1', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO order_teaching_r VALUES ('72d7b5fe-d664-421d-9ac5-9e9f9bc6fe82', 'de12126d-0e9f-476f-970c-6a8c5bb18669', '7', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '2c64d354-e9db-441d-8271-061d46813abb');
INSERT INTO order_teaching_r VALUES ('7c3cbd28-fcc4-4b56-bcf4-8cfca9d1bf01', 'de12126d-0e9f-476f-970c-6a8c5bb18669', '8', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', 'ac37a69a-8f81-4f35-950d-44586364969b');
INSERT INTO order_teaching_r VALUES ('b66a90f4-e5a6-4ba5-a64c-85221ae34828', '3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '7', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2f6a5e5b-4e32-46d0-8942-5e730051b99a');
INSERT INTO order_teaching_r VALUES ('8d5fa78f-c3fb-48e7-9441-046d55522dc7', '3e16af28-6a16-4f15-b0de-319c337d816c', '7', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '6620857b-7472-4960-a7f7-870244cad689');
INSERT INTO order_teaching_r VALUES ('a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '3', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '73818668-89b4-4f28-b928-6b454641aaae');
INSERT INTO order_teaching_r VALUES ('2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', '2', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735');
INSERT INTO order_teaching_r VALUES ('487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', '8', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', 'db66fd38-466a-4620-9890-6abb10a67a22');
INSERT INTO order_teaching_r VALUES ('e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', '3', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', 'b21addc3-003c-42be-afaa-ab7064d6e144');
INSERT INTO order_teaching_r VALUES ('5a88004b-a6ed-4463-aa35-33f6befbff13', 'e37770db-2e80-422e-b4d3-e12cab81145a', '2', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e');
INSERT INTO order_teaching_r VALUES ('2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '8', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '19115f9c-d7d6-4415-baab-27cb4973ce98');
INSERT INTO order_teaching_r VALUES ('fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', '9', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d');
INSERT INTO order_teaching_r VALUES ('92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '2', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '167b5e9e-8e57-4549-91cd-c10802eadaf8');
INSERT INTO order_teaching_r VALUES ('5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', '2', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8');
INSERT INTO order_teaching_r VALUES ('ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '2', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1');

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
INSERT INTO parents VALUES ('bc7d1338-1494-4ac7-8155-f8e6115c3e9f', '旷新娥', '18975815936', null, 'oVbXbw3Qx-7zYg1szCoiat5gcm9g');
INSERT INTO parents VALUES ('a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '杨伟豪', '18229975254', null, 'oVbXbwy5_2XuqlLWjgPzuA5t2v5c');
INSERT INTO parents VALUES ('2782f2e4-5682-40e7-8930-193b1b8de791', '文永利', '15874809469', null, 'oVbXbw8vn8AKu7H_CtsJoK6tDKxs');
INSERT INTO parents VALUES ('610d212d-af5a-4c70-8098-aaece4e298ca', '曹新义', '15013557393', null, 'oVbXbw0SCK5rVuGeLodPLUZP4OPU');
INSERT INTO parents VALUES ('d9df4a14-72bc-49ed-9f33-ed92dd7cf631', '王满英', '18773155319', null, 'oVbXbw8KR2R4003wQA3ajD8qhySw');
INSERT INTO parents VALUES ('ab5befbe-9b50-4c79-9496-0edd136839fc', '陈俊', '13787161678', null, 'oVbXbw6fe_Tpe9FiKbfK9wE6zyyE');
INSERT INTO parents VALUES ('e13cb91b-d429-4204-a185-48752af469f0', '刘亚兰', '13907480481', null, 'oVbXbw6u5yhOdQ5cOfUkha-CxNH0');
INSERT INTO parents VALUES ('a0c6a204-adff-4d42-9898-c81bfc8bc0ad', '李红霞', '15869961197', null, 'oVbXbw7rTM-humGwLVWfSnDPChyE');
INSERT INTO parents VALUES ('1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '蒋艳芳', '15074839508', null, 'oVbXbw-c49C4hFJjWIQveF-BCOhM');
INSERT INTO parents VALUES ('7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '蔡艳君', '15273906709', null, 'oVbXbw5-ZmaliUceqfwg5bEnWJDc');
INSERT INTO parents VALUES ('f7166d68-6dd7-4b05-b094-31a454c844b9', '张党秀', '15367316996', null, 'oVbXbwy88K-QqNxARIgJGAc2Dndk');
INSERT INTO parents VALUES ('a36d5226-313a-4af6-9a2c-21700f53bd90', '周洪', '13874982491', null, 'oVbXbw9JIay2DHOQwYzzG7PjAnrg');
INSERT INTO parents VALUES ('b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '徐新伟', '18975819567', null, 'oVbXbwwfR4JtBvpF5HAgNMdbAtyg');
INSERT INTO parents VALUES ('fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '柳成英', '13908472055', null, 'oVbXbw6iIsxcBL7WkRjdLICg1PaY');
INSERT INTO parents VALUES ('ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '张湘辉', '18684680358', null, 'oVbXbw09eN2oZFsqxDKDYadDSunI');
INSERT INTO parents VALUES ('f2bfda12-0dcc-4cd0-824d-b90283d35745', '游顺益', '13187001356', null, 'oVbXbwxjZUO4X6h1K3gipaI3SXBI');
INSERT INTO parents VALUES ('18709a24-fda2-4522-aa3b-b29847cd9ca4', '吴小妹', '13755191090', null, 'oVbXbw-loq0bJBhMmuvKuDwjcRCw');

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
INSERT INTO parent_stu_r VALUES ('05ec9947-b03e-4533-a5a6-8eaf19c03e62', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33');
INSERT INTO parent_stu_r VALUES ('0f390070-d868-42d9-832e-8dd8cf229124', 'd470160f-c9f7-45c2-8e97-66acf23c7b67');
INSERT INTO parent_stu_r VALUES ('1111111111111', 'aaaa');
INSERT INTO parent_stu_r VALUES ('174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984');
INSERT INTO parent_stu_r VALUES ('1b201cf7-e147-4897-ac9d-71961be06c24', '18709a24-fda2-4522-aa3b-b29847cd9ca4');
INSERT INTO parent_stu_r VALUES ('1c3e0941-112b-4664-9463-6865ec8c5912', '205ee471-0dcd-430e-a558-df805a87fb62');
INSERT INTO parent_stu_r VALUES ('206036fd-d511-4eb0-b8d3-60c59bc84d15', '01df4fe5-315c-4db2-ab49-c314c9f891d3');
INSERT INTO parent_stu_r VALUES ('20ca5d97-841f-4928-819c-173852f3d70d', 'c9faef4f-f860-433a-b183-e6e5263b335e');
INSERT INTO parent_stu_r VALUES ('22222222', 'bbbb');
INSERT INTO parent_stu_r VALUES ('223d8a75-6e4e-4ad6-a441-af98e0a2cfad', 'a36d5226-313a-4af6-9a2c-21700f53bd90');
INSERT INTO parent_stu_r VALUES ('279c6d0d-1a69-4155-927d-e50faf8787b6', '5138ed9b-82af-4252-9c10-0943693449ae');
INSERT INTO parent_stu_r VALUES ('2b1ec3b4-44b8-4be8-a009-24b7cb87717d', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885');
INSERT INTO parent_stu_r VALUES ('2f724a1e-3399-4652-89ed-cdf6af080c6f', '971e4640-7ca7-48cb-8a2e-f46c408d66a4');
INSERT INTO parent_stu_r VALUES ('3246e59a-15a3-47af-a685-50d8460c547e', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO parent_stu_r VALUES ('329ec215-a3dc-427d-ac97-95f0cc0a2519', 'f7166d68-6dd7-4b05-b094-31a454c844b9');
INSERT INTO parent_stu_r VALUES ('3387b77f-ba5c-4938-95aa-333390967bdb', 'db6d9354-2166-4cfa-abf1-233be87d7a23');
INSERT INTO parent_stu_r VALUES ('35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('397f9d9d-e20a-49b4-b199-669f60db95cf', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('3a894527-e23e-46b2-b6c5-f0ca8dfa2765', 'f2bfda12-0dcc-4cd0-824d-b90283d35745');
INSERT INTO parent_stu_r VALUES ('3d5fbd91-ce72-4426-a573-2ba496710a6b', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807');
INSERT INTO parent_stu_r VALUES ('3f0355d3-94e5-471f-a78f-b84736bb8afd', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f');
INSERT INTO parent_stu_r VALUES ('3f197c20-4852-4af1-a3fe-4a91cba046a0', '71ca2567-8288-433a-98ed-bbf3c00b9659');
INSERT INTO parent_stu_r VALUES ('410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951');
INSERT INTO parent_stu_r VALUES ('41af7d4e-fc40-4296-bdd4-8ab696fc9462', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO parent_stu_r VALUES ('428631d2-f204-4fa5-838a-4072fe589d70', '247214c8-e6ae-4a38-9a44-cbb005f953cd');
INSERT INTO parent_stu_r VALUES ('4426451c-de65-4564-8ddf-2bbee72841ae', '7f376be4-d891-48be-8529-9bc5b85185ca');
INSERT INTO parent_stu_r VALUES ('443742e9-e233-4044-a99d-bce47d1e8b13', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('48659507-3880-4c28-9788-55f1808ac1f2', '610d212d-af5a-4c70-8098-aaece4e298ca');
INSERT INTO parent_stu_r VALUES ('4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b');
INSERT INTO parent_stu_r VALUES ('4e708d29-d4b9-47d3-8fb9-1b98127896aa', 'ab5befbe-9b50-4c79-9496-0edd136839fc');
INSERT INTO parent_stu_r VALUES ('4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9');
INSERT INTO parent_stu_r VALUES ('58300141-5fec-4bc2-8820-fcc41947142d', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('591d3d72-c24e-4218-9b7e-9af08ce8e493', '8c754fe0-ecca-4827-a94d-62c0400e5990');
INSERT INTO parent_stu_r VALUES ('5c7608cd-b804-4f65-9959-a58b4421cb78', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO parent_stu_r VALUES ('5c7f5e36-535f-48f8-8763-0f9b6318073e', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('5cc50b32-8179-458f-9663-8704d9ebddff', '9b2daa11-9851-41f0-8365-dc3ce439c584');
INSERT INTO parent_stu_r VALUES ('5e923add-eaca-4bd3-acc2-27b1bb3c2240', 'e4220f11-1e90-45b1-985a-3317cef45f4a');
INSERT INTO parent_stu_r VALUES ('5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', 'b1475005-13a1-4485-b69d-babaaf35da66');
INSERT INTO parent_stu_r VALUES ('625a1ecf-6699-4ae6-ba41-fe47451a796b', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('64a9944a-3e14-4cc1-af56-3a74bab92a8b', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f');
INSERT INTO parent_stu_r VALUES ('6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO parent_stu_r VALUES ('6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144');
INSERT INTO parent_stu_r VALUES ('7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c');
INSERT INTO parent_stu_r VALUES ('773ea73a-5135-41f4-8000-55901b2015a2', '79e4bdc8-874d-4cb2-a907-58215f7af76e');
INSERT INTO parent_stu_r VALUES ('79c93b34-1803-4808-8053-447c66039516', '59a3027d-9bc9-4447-9b38-07b7b6769c0f');
INSERT INTO parent_stu_r VALUES ('7c1f175e-92ad-4a83-af61-faf4571dc87d', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('7cd1b3ff-571d-430b-b77e-92d1712a8418', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43');
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
INSERT INTO parent_stu_r VALUES ('ae977c03-3f44-49f5-9c7d-842e0d135899', '2782f2e4-5682-40e7-8930-193b1b8de791');
INSERT INTO parent_stu_r VALUES ('b0ed5520-5db1-4d33-ad3c-7f1f50fbe3d9', '9c61a3fb-7f97-40c1-a3d8-5f4e82a459cd');
INSERT INTO parent_stu_r VALUES ('b1823fff-7045-4d46-b604-dfbf931ebbf8', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('b2511e3f-2e8b-4d28-ad76-602587b0c99d', 'ad3ffcfd-2b45-4b4b-aee8-64e5c412eb9d');
INSERT INTO parent_stu_r VALUES ('b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', 'daa3f486-e6ce-4b50-ad09-519dac09757e');
INSERT INTO parent_stu_r VALUES ('b485cc15-b6e9-4153-90a8-7899d9d8d91d', '925a659e-1f94-4ae9-ab95-b4f6d9ad306d');
INSERT INTO parent_stu_r VALUES ('b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO parent_stu_r VALUES ('bbca876c-8f6f-4b8a-bcd0-c247ae937d18', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631');
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
INSERT INTO parent_stu_r VALUES ('e269d805-f0a4-46c5-b27a-66e9b58f673f', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad');
INSERT INTO parent_stu_r VALUES ('e41ed9a9-bd9b-4f3e-8468-efa07fd4c2e7', 'c1815cf2-85a3-4e93-9af3-868864b4d9b5');
INSERT INTO parent_stu_r VALUES ('e6058b90-7154-4677-8172-185b1e30f894', 'e46ae7bc-895e-4c52-ad67-b03f575b6227');
INSERT INTO parent_stu_r VALUES ('e78f0e67-17c9-462d-ae45-453daf6562d5', 'a712fda3-c0c0-49aa-be5d-4e90401c368b');
INSERT INTO parent_stu_r VALUES ('e816cc30-deb4-4c66-b310-92b91b4e7a5b', '90377ef4-f065-4fe0-9318-a093c74c800a');
INSERT INTO parent_stu_r VALUES ('e98c04c3-7e46-45c7-a835-708d35b343a8', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO parent_stu_r VALUES ('eda53a7c-3cf6-4b7e-a32d-845a622afe37', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9');
INSERT INTO parent_stu_r VALUES ('f6fe6270-ab84-42a2-a356-0cf1fc5d83de', 'e13cb91b-d429-4204-a185-48752af469f0');
INSERT INTO parent_stu_r VALUES ('f9174d35-bbc7-40aa-8003-fb77a08a6288', '8c3a338a-339b-4217-84ab-29ffdf1156cc');
INSERT INTO parent_stu_r VALUES ('fb276474-891d-4c41-b32b-96bcb5531675', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f');
INSERT INTO parent_stu_r VALUES ('fbbd1e55-2923-4010-9125-e4aeb425b229', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO parent_stu_r VALUES ('fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '57e0b0b8-98a2-44a2-b66f-b92af290e11c');
INSERT INTO parent_stu_r VALUES ('fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807');
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
INSERT INTO picture VALUES ('033df2d9-d160-45df-9020-2be7a32638ce', null, '向梦天156748563148', '3');
INSERT INTO picture VALUES ('0a4afa55-db09-4bd1-8c38-82d93edc6d70', null, '李莹庆15526459605', '3');
INSERT INTO picture VALUES ('b2e69f4a-bafa-4a08-b96c-a1706210804a', null, '侯晚晴15893095795', '3');
INSERT INTO picture VALUES ('258e2acf-80db-4642-ad89-0fcbd6b5731b', null, '张荣旺15574804640', '3');
INSERT INTO picture VALUES ('a2d1cd1d-8b94-455d-8f78-a00ec90cb007', null, '秦家琳18774063134', '3');
INSERT INTO picture VALUES ('8a0698be-fdc5-40da-86ae-61731251290b', null, '候晚晴15893095795', '3');
INSERT INTO picture VALUES ('06a6ab17-d1ea-4159-b897-aa5bf2135c2b', null, '丛颖18774879533', '3');
INSERT INTO picture VALUES ('96b37632-2ad5-4100-814c-23d4af389250', null, '李芳林13637472576', '3');
INSERT INTO picture VALUES ('9b563e14-07bc-4416-830b-319274e8d625', null, '高梦梦15274816683', '3');
INSERT INTO picture VALUES ('53e2656e-8d99-4626-81f7-cbdad18c7b93', null, '田江17375895823', '3');
INSERT INTO picture VALUES ('d1da9599-1adb-4075-98d9-297e4902338e', null, '廖成意18223562393', '3');
INSERT INTO picture VALUES ('ae035324-3e4d-46c4-bdb6-c445af54e5fe', null, '高鸶佳13142175883', '3');
INSERT INTO picture VALUES ('219524c2-8299-4a2c-8e28-6826f222c219', null, '王翼18329525584', '3');
INSERT INTO picture VALUES ('c9e06263-d7a6-4fde-9d60-50b4c66d3092', null, '皮文君18670367305', '3');
INSERT INTO picture VALUES ('6d608e41-1306-476e-9065-ba38563ca876', null, '李国伟15200833373', '3');
INSERT INTO picture VALUES ('6a17e374-b643-4a53-9981-12e58be2a5dc', null, '候昭慧17375150595', '3');
INSERT INTO picture VALUES ('6d072ef5-a207-40c9-a4dc-425e7dfc4bfb', null, '董梦季18890090950', '3');
INSERT INTO picture VALUES ('c336330e-5f6e-4816-b65b-9ae28027e76f', null, '覃居上18774861533', '3');
INSERT INTO picture VALUES ('9690b31a-b878-4d60-8bdf-2e9448e815db', null, '刘芳15084726641', '3');
INSERT INTO picture VALUES ('76a11d30-fa92-4921-8104-01c128b50ce6', null, '崔海骕1871139337', '3');
INSERT INTO picture VALUES ('d1c43397-001f-400b-ae73-00c6e27461b9', null, '胡英杰18932449267', '3');
INSERT INTO picture VALUES ('36b74fdc-62d5-4d20-b4c0-3acf7317c745', null, '谷孟阳13027424343', '3');
INSERT INTO picture VALUES ('7b0efa43-761c-486c-8285-e33fe6e7e92d', null, '文少芬18319368445', '3');
INSERT INTO picture VALUES ('c2732e4f-ff7c-4168-a706-467276cc46e4', null, '程新13278882857', '3');
INSERT INTO picture VALUES ('a3b322d6-90f5-4d27-8bb1-351944ce46a3', null, '王中钰13007438697', '3');
INSERT INTO picture VALUES ('025493f4-3031-4d26-a97a-94a1c003f450', null, '王永娟14747431827', '3');
INSERT INTO picture VALUES ('adc81b8e-602a-4642-aa05-6fd3dce8a200', null, '刘建军17830286663', '3');
INSERT INTO picture VALUES ('15af7999-b5fa-4f1e-8859-0409afdc4688', null, '廖森18273460875', '3');
INSERT INTO picture VALUES ('ea56eb2f-6608-4caa-bc5f-ed70101e17df', null, '李恩启15560279613', '3');
INSERT INTO picture VALUES ('42f7d036-eff6-4000-9f34-bea9f636a643', null, '智亚18774878930', '3');
INSERT INTO picture VALUES ('931bb143-622e-4344-8da2-5a560d236701', null, '汪永俊13516450815', '3');
INSERT INTO picture VALUES ('b0367f3d-cea9-4b29-99e8-9296f1f44bab', null, 'hexl18674819151', '3');
INSERT INTO picture VALUES ('73262cbb-7f0d-44c0-9487-2cc7fb6a5358', null, 'test_teacher115578901234', '3');
INSERT INTO picture VALUES ('0e829ea2-0647-464d-b6dc-c44efd5dc38f', null, 'hexl18674819151', '3');
INSERT INTO picture VALUES ('46ea94d9-9c5d-4f1a-8943-f9847ccf8ee0', null, 'hexl18674819151', '3');
INSERT INTO picture VALUES ('02e35c2c-123c-44cd-b1ff-c96091909454', null, 'test_teacher118322344421', '3');
INSERT INTO picture VALUES ('14656e76-09ad-4dde-82c2-78fcd9ac07e5', null, 'null18788935643', '3');
INSERT INTO picture VALUES ('e713f2c0-ff19-4263-b590-8e4dfde618c2', null, 'test_teacher118711009935', '3');
INSERT INTO picture VALUES ('585c7f7b-6b8e-4c97-bf29-78f421169d71', null, '胡明杰18670391790', '3');
INSERT INTO picture VALUES ('ebf4bed8-529d-4f43-b56c-0b211da1a51d', null, '周彦宏18006468086', '3');
INSERT INTO picture VALUES ('16685aa3-7589-40d2-ac2f-63e3c116e99c', null, '姚明18373177116', '3');
INSERT INTO picture VALUES ('80cc1fe4-6aa4-49fe-a71c-0842035e126e', null, '秦国民18174679426', '3');
INSERT INTO picture VALUES ('556a2aeb-8c1c-4291-9485-5ed043c866ef', null, '王文丽15874184386', '3');
INSERT INTO picture VALUES ('6e87011c-d6a7-4bf5-bc18-eb9356d320cd', null, '刘林13142172699', '3');
INSERT INTO picture VALUES ('7884cfad-89c5-41d3-89df-3b6095e7483a', null, '吴俊18774884031', '3');
INSERT INTO picture VALUES ('05bd85d1-9e6b-42dd-9889-2ec75721755c', null, '沈昊晟18670741028', '3');
INSERT INTO picture VALUES ('8ff783b7-5748-4bea-b81f-f1969240ac38', null, '孔垂越13278880276', '3');
INSERT INTO picture VALUES ('de657fcf-fa06-4bab-af63-8c09b03c833d', null, '秦星子18173676040', '3');
INSERT INTO picture VALUES ('2b51ede3-40c9-4560-8dbf-c9fde02aeac3', null, 'nullnull', '3');
INSERT INTO picture VALUES ('d64cd4ed-2132-42e2-a0c8-564d06762425', null, '金丹静17373139972', '3');
INSERT INTO picture VALUES ('2d29ce81-cca3-4c13-8bb4-b7ef76545a43', null, '刘择安13187042971', '3');
INSERT INTO picture VALUES ('58fd06a7-890c-4221-9689-ea14daa17bd0', null, '丘浏阳17375876324', '3');
INSERT INTO picture VALUES ('608bf3da-7dca-4cdd-a996-61b71178701c', null, '康芯萍13117412195', '3');
INSERT INTO picture VALUES ('5458cd11-e167-440e-9036-b07cefa39ff6', null, '贺亚灵18711176332', '3');

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
INSERT INTO schedule VALUES ('06b8279f-79da-4067-9e29-a61fc7e25a58', null, 'b485cc15-b6e9-4153-90a8-7899d9d8d91d', '925a659e-1f94-4ae9-ab95-b4f6d9ad306d', '-319', '2018-04-02 23:02:31', '1', '王老师跟进');
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
INSERT INTO school VALUES ('9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '湖南大学', null, null);
INSERT INTO school VALUES ('6a4997b2-5319-4119-841f-cbb40b93f40e', '好未来', null, null);
INSERT INTO school VALUES ('325c57cf-7bb8-4e2c-b773-57b175c84dbe', '323213', null, null);
INSERT INTO school VALUES ('7528be2b-55a2-4e56-b01e-d13fa6703f1f', '21321', null, null);
INSERT INTO school VALUES ('6ce1ecd6-f1dc-430f-9882-a923822ddaf3', null, null, null);
INSERT INTO school VALUES ('81e1a737-aaac-41cb-bc47-5f8ab611c940', '好未来', null, null);
INSERT INTO school VALUES ('6ebee2fe-d9ac-4c76-97ba-d6969b3dc5d7', '21321', null, null);
INSERT INTO school VALUES ('6d52123a-ce1f-497e-ae85-15a6e6436462', '111', null, null);
INSERT INTO school VALUES ('ebf25a54-909a-4c1d-b473-3263e5f43499', '中南大学', null, null);
INSERT INTO school VALUES ('00fdb3a1-5776-402b-9385-652d8172d516', null, null, null);

-- ----------------------------
-- Table structure for `send_tmp_msg_failed`
-- ----------------------------
DROP TABLE IF EXISTS `send_tmp_msg_failed`;
CREATE TABLE `send_tmp_msg_failed` (
  `lessonTradeId` varchar(36) NOT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `openId` varchar(36) DEFAULT NULL COMMENT '发送的家长微信OpenId',
  `msgId` varchar(36) DEFAULT NULL,
  `repeated_times` tinyint(2) DEFAULT NULL COMMENT '重复发送次数（五天后/失败五次后直接确认）',
  `status` tinyint(2) DEFAULT NULL COMMENT '发送状态（0：发送成功，1，发送失败）',
  `msg_content` varchar(1000) DEFAULT NULL COMMENT '消息内容（模板消息为json 字符串）',
  `templet_id` varchar(100) DEFAULT NULL COMMENT '模板消息Id',
  `target_url` varchar(500) DEFAULT NULL COMMENT '推送地址',
  PRIMARY KEY (`lessonTradeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send_tmp_msg_failed
-- ----------------------------
INSERT INTO send_tmp_msg_failed VALUES ('776c734a-bce0-48d6-96e5-8184061971a0', '2018-04-10 23:09:47', 'oVbXbw3uwQzorBlO540_fPwZ-EC4', '231202070542172160', '4', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=776c734a-bce0-48d6-96e5-8184061971a0&month=3&teachingId=f2eff1fa-55b8-4a6b-8d24-59773b22d648');
INSERT INTO send_tmp_msg_failed VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '2018-04-10 23:21:12', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '231213555569950720', '4', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=d668d2b7-1808-419d-868e-9a76e91ddb6b&month=3&teachingId=2d72270f-f8fe-4a24-93b2-885e8f8f5463');
INSERT INTO send_tmp_msg_failed VALUES ('fa4a9cad-7de1-49da-9fae-526fab064a66', '2018-04-11 00:02:11', 'oVbXbw4MjDaF8F44mcy_mMgWGT9E', '231254812019245056', '4', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=fa4a9cad-7de1-49da-9fae-526fab064a66&month=3&teachingId=5a88004b-a6ed-4463-aa35-33f6befbff13');
INSERT INTO send_tmp_msg_failed VALUES ('b091936b-3866-4e98-8ac6-9d72df59a56f', '2018-04-11 13:29:52', 'oVbXbw6iIsxcBL7WkRjdLICg1PaY', '232067852146966528', '3', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=b091936b-3866-4e98-8ac6-9d72df59a56f&month=3&teachingId=ded7ab44-98ea-4eff-b893-3ab04630129e');
INSERT INTO send_tmp_msg_failed VALUES ('de89ed26-b005-42e6-870a-e367aac4f28c', '2018-04-11 20:32:27', 'oVbXbw2CjACmpC3kNmUcepHU99jU', '232493237082914818', '3', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=de89ed26-b005-42e6-870a-e367aac4f28c&month=3&teachingId=ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67');
INSERT INTO send_tmp_msg_failed VALUES ('858ca17d-2205-4934-96df-f339b1826c95', '2018-04-11 21:54:27', 'oVbXbwy5_2XuqlLWjgPzuA5t2v5c', '232575776271122432', '3', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=858ca17d-2205-4934-96df-f339b1826c95&month=3&teachingId=fe4dc516-1b4b-42ad-ba51-5c79f200fa1e');
INSERT INTO send_tmp_msg_failed VALUES ('164b3a53-487f-4d0b-8f55-e911ff2ebd7a', '2018-04-12 10:10:43', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '233316921599344640', '1', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=164b3a53-487f-4d0b-8f55-e911ff2ebd7a&month=3&teachingId=4d8192eb-b19b-4526-99b1-3604d27033be');

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
INSERT INTO student VALUES ('fb276474-891d-4c41-b32b-96bcb5531675', '蔡林杉', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('3d5fbd91-ce72-4426-a573-2ba496710a6b', '杨润芳', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('ae977c03-3f44-49f5-9c7d-842e0d135899', '文莹', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('48659507-3880-4c28-9788-55f1808ac1f2', '曹敏敏', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '袁佩银', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('4e708d29-d4b9-47d3-8fb9-1b98127896aa', '陈欣', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('f6fe6270-ab84-42a2-a356-0cf1fc5d83de', '谭文理', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('e269d805-f0a4-46c5-b27a-66e9b58f673f', '朱李骏', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '陈子逸', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('3f0355d3-94e5-471f-a78f-b84736bb8afd', '张润阳', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('329ec215-a3dc-427d-ac97-95f0cc0a2519', '张珂', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '周晋程', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '杨伟豪', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('7cd1b3ff-571d-430b-b77e-92d1712a8418', '徐甜甜', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('05ec9947-b03e-4533-a5a6-8eaf19c03e62', '贺暄涵', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('64a9944a-3e14-4cc1-af56-3a74bab92a8b', '徐睿君', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '游晶芳', null, null, null, null, '0', null, null);
INSERT INTO student VALUES ('1b201cf7-e147-4897-ac9d-71961be06c24', '唐嘉萱', null, null, null, null, '0', null, null);

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
INSERT INTO suggestions VALUES ('2b6b4656-e866-4710-8be9-ba13049d572c', '[, wefa, , , , ]', '[, , , wef , , ]');
INSERT INTO suggestions VALUES ('e135d0f9-261c-4809-87cd-99449d06c51c', '[无, 优, 一般, 一般, 优, 良]', '[无, 继续保持，继续巩固基础, 建议超前学习，预习上课内容, 讲题时提到的知识点，讲完需要巩固, 无, 希望学生做题更加细心]');
INSERT INTO suggestions VALUES ('a7a611b6-feb8-400d-b013-48efab30d3d2', '[111111, 1111111111111111111, 111111111111111, 1111111111111, , 11111111111111]', '[1111111111111, , 11111111, 1111111111, 111111111111111, ]');
INSERT INTO suggestions VALUES ('c66d5aec-5a9d-445c-893b-5deee871ce86', '[保持专注，但思维不活跃, 较大幅度提升, 大大提高, 复习速度提高, 大大提高，能针对题型有方法, 稍稍提高]', '[边听边写边记，有疑问及时提出, 能迅速复习，讲究次数, 做题有疑问时做好记号，上课时提出, 就中考而言，复习速度还不够，需要更努力, 在自己做题时能融合老师教的方法并根据自己的情况有所改动, 丢掉慢条斯理，不容易确定的地方不要犹豫]');
INSERT INTO suggestions VALUES ('decde197-8876-43c1-b27b-4114ccb01330', '[专注度一直很不错的, 知识点会很容易忘记, 有些欠缺, 有时会复习, 学校老师教的技巧掌握的好不错, 速度和准确性波动较大]', '[继续保持, 还是要多看错题，多重复知识点，会有很大的帮助的, 超前学习，个人认为用处不大，还是要搞懂学过的知识, 可多督促孩子看看错题，在写完作业之后，花十几二十分钟时间来看看错题，哪怕不写，看一遍 加深印象, 可以对对学习某些特定题目的解题技巧，这样写题的速度和准确性就会大大提高, 还是要稳中求胜，容易粗心，简单的只是一不小心就会出错。看题的时候要慢慢看，不要串行，导致题目出错。]');
INSERT INTO suggestions VALUES ('96417002-12ad-42dd-9bc3-2de1dd93c5f8', '[可能是因为太累了，加上睡眠不足，专注力不是很好。, 对第一章内容掌握的不错，第二章较之以前也已经有了不小的进步。, 因讲述的是上学期内容，学生又在学习新知识，所以学生没有时间去预习和复习上学期内容, 因讲述的是上学期内容，学生又在学习新知识，所以学生没有时间去预习和复习上学期内容, 考试技巧掌握的不错。, 做题速度属于平均，不快不慢，准确率也还行。]', '[多多休息，按时睡觉，也可以多参加一些体育活动，劳逸结合。, 加强对第二章内容的复习巩固，对多种做题方法的运用。, 会在以后的课堂中穿插一些复习过的知识, 会在以后的课堂中穿插一些复习过的知识, 会在以后的习题中讲述考试技巧，在考试中如何更简单的拿到分数。, 在复习完相关知识点后，进行做题方法的总结，在保证准确率的前提下，有效的提升做题速度。]');
INSERT INTO suggestions VALUES ('9028c9ed-55f5-4f01-aab8-9925da5320bc', '[听课较专注，但不能认真对待辅导结束前的几分钟，比较急于下课。, 数学必修一二知识点已初步掌握，但不能灵活运用，欠缺习题训练。, 学生较缺乏超前学习意识，不能很好地做到主动预习。, 学生能够主动复习已讲过的知识点, 已掌握一些做题技巧，但不够灵活和全面。, 做题速度中等，准确率很高]', '[学生应注意午休，以防下午学习时困乏；要调整心态，积极面对学习；要珍惜整个辅导时间。老师会尽量将重要知识放在前段时间讲。, 建议学生有时间多做相关习题，不会的或者有疑惑的题目可以做标记积累下来，以便辅导时解决。老师会注意讲做题思路和方法，以引导学生学会知识点的运用。, 学生如果平时功课不多，可以主动提前预习。, 希望学生注意每单元后面的知识结构图，在复习时试着绘制知识结构图。, 老师会提前准备典型例题及对应的做题技巧；辅导过程中也会通过做题分析题目来教授做题技巧。, 学生做题速度不高是因为做题技巧及习惯不到位，建议学生做题时多动笔，试着展开方程或画出图像，当它们一目了然呈现出来的时候，可能就会有思路了。]');
INSERT INTO suggestions VALUES ('cb738951-e544-4c54-bee9-903f17f835b0', '[听课状态良好, 良好, , , 良好, 速度还算快，但是计算还需仔细]', '[, 上次课主要讲的是应用题，应用题的方法就是审题，第一次读题时把关键语句做记号并注意隐含条件，这样可以准确快速的列方程，最后就是要仔细计算了。, , , 建议计算时还是要更仔细，打草稿的时候把字写清楚可能会有帮助，更重要的是写题时的书写，最好能写工整清楚，给改卷老师留个好印象, ]');
INSERT INTO suggestions VALUES ('b7e77aad-fd87-434e-bab0-efb3fc9b56d1', '[上课一直非常认真努力，态度端正，但畏难情绪较为严重，遇到思维量或计算量较大的题就不敢下笔，大题拿到的分就少了。, 基础概念问题较为模糊，物理学习通过结合课本掌握知识点和考点，扫除了知识盲区。, , , 通过经典题型的练习（例如二次函数系数abc的不等关系等题型），学生已基本掌握了所教授的提醒。, 准确率有所提升，但运算速度较慢，耽搁了考试时间。]', '[通过基础题型的练习提升学生信心，帮助学生树立起难题多拿分的观念。同时希望家长能多鼓励孩子。, 多结合课本，不能仅凭刷题得到考点，这样的知识结构是零散的。, 小声很聪明，在老师的思路下能顺利完成题目，但还缺乏学科题感，不能很快找到题目的突破口。在之后的学习中要学会回头看题目，对于题目的提问方式和出题者的意图进行思考。, 保留好近期考试的测验试卷，以便于分析问题，查漏补缺，时常复习。, 继续保持，在作业、测验中运用，牢固记忆。, 有的题将步骤仔细写下来可以提升正确率，但简单的四则运算等应当多口算，每一步都写在草稿纸上很浪费时间。]');
INSERT INTO suggestions VALUES ('e4207004-b076-4e52-9047-65fc0e553e1e', '[上课很专注, 单词，固定搭配较为薄弱, 良好, 良好, 良好, 良好]', '[继续保持, 多背单词和词组, 保持, 复习上面继续加强, 有待提升, 有待提升]');
INSERT INTO suggestions VALUES ('4c939366-dde1-4363-91a7-21bc1501cf05', '[很认真, 单词，词组较为薄弱, 良好, 良好, 良好, 良好]', '[继续保持, 加大单词，词组记忆, 保持就行, 复习这一块要加强, 有待提高, 有待提高]');
INSERT INTO suggestions VALUES ('5a404b4c-3c80-44c1-842b-9b4c75190d36', '[上课不是很认真听讲、有时候粗心大意, 基本概念不扎实, 无, 一般, 一般, 较差]', '[注重平时良好习惯的养成、认真细心, 脚踏实地、打牢基础, 建议加强学习, 建议多花时间在老师布置的作业上, 建议加强应试技巧, 建议强化训练]');
INSERT INTO suggestions VALUES ('9aa61240-bfad-4a42-b152-d54dce3c7a0c', '[进步, 进步, 持平, 持平, 进步, 进步]', '[继续保持, 继续积累, 多加努力, 多加努力, 多多巩固, 多加练习]');
INSERT INTO suggestions VALUES ('73e3003f-1f76-4713-913a-d99ae762f76e', '[听课认真，参与积极, 基础掌握较好、思维灵活, 基本可以, 课后总结巩固严重欠缺, 做题方式不恰当、不仔细, 速度偏快、准确率低]', '[兴趣度高，希望保持, 知识掌握情况很好, 不太建议太过超前学习，做好课前预习即可, 课后务必及时总结复习所讲内容, 今后上课将着重培养其做题习惯, 做题不能只图快，而不认真思考]');
INSERT INTO suggestions VALUES ('301f1e25-81ca-4c8f-ad57-420870770bf2', '[有较大提高，但积极性不够, 更加全面，正逐步提高, 这点尚有不足，未有主动预习。但考虑到学生基础较差，目前学习任务重，可以理解。, 学生能自己做题对照答案, 由于基础较差，做题较少，技巧掌握不足, 目前由于基础较差，准确率较低]', '[正确认识辅导，由于必修一掌握不够，而目前学生学习任务较重，如果能抽出时间来看必修一最好，如果时间不够就应该将主要精力放在本学期的课程上面，切莫因小失大。必修一的内容在高三总复习时都会重新复习一遍，不要担心。所以应摆正态度，本学期的内容才是最重要的。, 坚持辅导，平时抽时间多看书，回到课本。掌握基本知识点。考试换汤不换药，只要能抓住基本知识，没有太大问题。, 多看课本，掌握基本知识点, 希望课后多做题，并能对照答案，又不懂的地方多向老师请教, 多做题，通过实战检验自己，达到基本掌握答题技巧的目的, 课后多复习，牢记知识点]');
INSERT INTO suggestions VALUES ('59858dc7-b38b-4632-b307-810c7b021217', '[比较专注，但有的时候不是很耐心, 大的知识点掌握的还不错，但有些小的知识点忘记了，或者记得不够清晰, 没有主动预习的习惯, 对于那些很早之前学习的知识点有遗忘的现象, 有些类型的简便计算没有掌握，但还是能够先易后难的, 速度不够快，小题的准确率还有待提高]', '[, 需要多练习那些容易忽略的知识点, 要养成提前预习的情况, 要尽可能的把之前遗忘的知识点记起来, 要学习简单方法，提高做题效率, 要加强小题的训练强度]');
INSERT INTO suggestions VALUES ('15d44df5-4a02-43d1-8704-ccca3e2c6e94', '[正奇同学上课表现一直都挺不错的。但是最近可能是身体不舒服，能感觉得到他很累，学习的效率就有所下降。让他弄的积累本也没积累，可能是作业多的原因吧，但是大家都在努力，我们如果和他们做相同的事，就很难拉开距离。, 优秀, 良好, 优秀, 优秀, 速度有些慢，准确率还有待提高。]', '[还是要积极主动点学习，做题速度加快些。觉得回家的他可能就放松了，对学习的效率也没那么在意。或许我们可以改个时间，换个地方补课，也许就换了个心情。而且晚上上课，能感觉得到他很疲惫。但还是要坚持练字和积累本，慢慢会有提升的。还有就是心理因素，不要总认为自己做不到，其实很多时候一努力就能做到的。, 继续保持, 要好好积累，然后总结。, 练字噢！, 保持保持, 限时训练，用规定时间的一部分强制自己加快速度。]');
INSERT INTO suggestions VALUES ('ea726a02-bf22-404d-b138-792bf6d7785a', '[好好学习, 好好学习, 好好学习, 好好学习, 好好学习, 好好学习]', '[天天向上, 天天向上, 天天向上, 天天向上, 天天向上, 天天向上]');
INSERT INTO suggestions VALUES ('ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b', '[听课较为认真，不过有时会有些许急躁。, 对于知识点掌握在辅导后会加深。, 会主动预习功课，认真在课本上做笔记。, 略微有些欠缺，往往会忘记以前学的知识点，但就其特殊情况，可以理解。, 对于书上以及练习册上的题目大部分能够靠自己解决。,  做题速度有所进步，但做题时略有粗心使得准确率不是很高。]', '[对于每个知识点都耐心、认真的给其讲解透彻。, 每节课先对其上课不懂得知识点进行疏导。, 继续照这样做即可。, 在讲课时尽量将以前的知识点串联在一起，使其达到掌握新知识点的同时复习巩固旧知识点。, 可以逐步提供高，慢慢开始做一些具有技巧性的题目。, 在做题时随时提醒学生认真仔细，做到每一步都踏踏实实，完完整整。]');
INSERT INTO suggestions VALUES ('25ff3289-06f3-4c30-93bb-d82595ad3332', '[, , , , , ]', '[, , , , , ]');
INSERT INTO suggestions VALUES ('5e892622-ac6d-4231-9c39-dba28fbe9e81', '[上学期在上课时经常会犯困，这学期状态好了很多。, 有进步, 没有主动预习的习惯, 没有主动复习的习惯, 能记住更多的常见必考题型, 准确率和速度都比较高]', '[希望可以培养更多的对数学的兴趣, 要及时复习, 希望养成预习的习惯, 要及时复习, 能够区分题目的小差别，不粗心, 希望可以做更多的题目来拓展自己的做题能力]');
INSERT INTO suggestions VALUES ('4d6d538c-babc-4e26-896f-a5fe2d980679', '[能迅速进入状态，题外话少了一点, 讲的基本公式，概念已经掌握，, 基本能够完成作业，超前学习暂时还没有, 这个有点欠缺, 做题缺乏耐心, 速度超快，准确率有点低]', '[最好在听课过程中做一些笔记, 多看书，, 目前来说高质量完成我布置的作业就可以, 每次讲完卷子，错题还是要整理, 先易后难，平心静气做题, 降低速度，认真读题]');
INSERT INTO suggestions VALUES ('9d3733cc-1d83-4ec5-91df-3efae2a2112b', '[优, 优, , 优, , 优]', '[目前来说孩子对于自己学习的积极性以及对于基础概念的理解不到位, 故而做题速度偏慢（容易模棱两可）, 但是做题准确率提高较快, 值得肯定, 接下来的任务在于纠正习惯以及加快做题速度，掌握做题技巧, ]');
INSERT INTO suggestions VALUES ('22882638-4b62-4a67-b8f5-958516571e99', '[, dfa, , , , ]', '[, , , weawew, , ]');
INSERT INTO suggestions VALUES ('05ae2e67-7c7f-4033-ab9d-587ea186572e', '[, , wefa, , , ]', '[, , , wefa, , ]');
INSERT INTO suggestions VALUES ('c214f073-7d76-4aa1-af37-296f52cf5a42', '[, , dfa, , , ]', '[, , , , awefw, ]');
INSERT INTO suggestions VALUES ('8e121a0c-efc2-405e-bff2-36b91309a11c', '[宜祯妹妹上课的时候比较认真，但还是有一点小小的走神。有时候会跟我岔开话题，聊一点她学习生活中的事情。, 知识掌握的不是太牢固，很多词汇只知其一，不知其二。不能熟练掌握词汇的正确使用。, 目前我们还没有开始预习，一直在复习, 我每周都会给妹妹进行大量的复习，希望能帮助她把基础打好。, 妹妹上次月考中，没有发挥的太好，我看了一下卷面，发现很多不该失的分失了。比如：你怎么了？翻译为 what\'s the matter? 但是她不小心落了个the,写成了 what\'s matter?, 根据妹妹的反馈，她说考试时间不够用。这说明她还要提高一下做题的速度。]', '[我觉得妹妹这样也很可爱，因为她愿意与我分享，我也很乐意和她分享一些自己在她这个年龄中的体会，然后作为一名过来人，给她提一点小小的建议。但是，这些都只能占用两到三分钟的时间，我不会让她耽搁学习的正事。提高妹妹的注意力，我觉得可以通过增添 课堂趣味性来体现，比如我们利用课本中的英语对话进行角色扮演，增添一些造句环节，使她的思维一直活跃等等。, 通过夯实基础，多多的带她认识课本中的词汇运用。一起解决练习中遇到的问题和困难。, 从下周开始，我会适当的帮她预习课本，使她在学子中先人一步，能够在学校里的课堂上减轻压力。, 继续坚持复习的节奏，学习就是应该温故而知新。, 帮助妹妹培养认真的习惯，细节决定成败。, 做题速度要从平常中训练出来，词汇掌握的多了，阅读量增多，做题速度也会跟上来。]');
INSERT INTO suggestions VALUES ('3b816221-7664-4d11-8c12-8ef512514749', '[比较好, 一般, 无, 一般, 较差, 太慢了]', '[多加沟通以及督促, 加强记忆, 预先布置任务，让他按时完成, 要求复习所讲题目，提问, 多讲解一些经典题目，逐步培养, 加强基础知识的记忆]');
INSERT INTO suggestions VALUES ('c91a1407-50d8-46ff-b469-4e3bdb2585e6', '[吴祺同学上课一直都表现非常好，学习很专注, 在基础知识上有所提高, 表现比较好，能够超额完成作业, 复习巩固方面有待提高，有时候讲过的知识点没有的很好的落实, 考试技巧方面有一定提高，做了5份高考题，对题目的难度也有了很好的把握, 在辅导过程中一次模拟测试成绩为91.5]', '[希望在听课的时候能够学会认真记笔记, 希望在继续扩大词汇量，加强落实, 希望继续保持学习劲头, 希望学生注意落实与整理, 希望对于基础题加强联系，争取做到每天都能完成一到基础题, 希望作文方面的字迹一定要工整]');
INSERT INTO suggestions VALUES ('604fe578-0c4f-459a-a5c6-44549a4f0d92', '[相比之前更加积极，更加专注，但仍需坚持, 鉴于之前基础非常薄弱，现在已经掌握了很多基础知识，对课本更加熟悉, 学生几乎不会预习将学知识，不够积极, 在提醒之下学生会稍微复习，但是花的时间还是很少, 学生已掌握初步解题技巧，有一定的思维, 放慢了做题速度，有了更多得到思考，准确率有了提升]', '[加强管理，让学生逐渐脱离手机, 循序渐进，需要帮学生牢牢地打好基础，灵活运用知识, 强调预习重要性，并在课后提醒学生主动预习, 需要共同监督，时刻提醒学生复习重要性，课前会抽查学生所学内容, 需要打牢基础，在此之上再灌输解题技巧，帮助学生学会系统地用方法解题, 首先要保证正确率，不强调速度，但是要仔细，确保拿到分数]');
INSERT INTO suggestions VALUES ('5375d8bc-7691-4e61-8f78-aabd772a38b0', '[较为认真, 掌握情况一般, 自己要学会总结书本知识, 平时多做基础题, 一般, 一般]', '[应该集中精力，把状态调好, 自己多练习, 可以适当完成老师布置的任务, 假期可以复习前面已经学过的知识, 考试中要总结做题的经验, 做题时要有详细的解题过程]');
INSERT INTO suggestions VALUES ('aeff2060-f179-40d3-ba5e-f858c1d8cc46', '[, , asdfa, , , ]', '[, , , , wefa, ]');
INSERT INTO suggestions VALUES ('e55873ed-aa42-4d03-94f9-fc0a1537c3ff', '[有一定进步, 尚需提高, 有一定进步, 尚需提高, 尚需提高, 尚需提高]', '[引导孩子在学习的时候能够放下手机，全身心投入进去---“学的用心，玩的开心”, 通过物理课本帮助孩子深化物理知识理解，构建一个更牢靠的知识网络, 每次授课前还要微信提醒孩子明天上课内容，提醒孩子稍微预习一下, 后期准备每次上课预留10分钟左右时间，教孩子总结归纳每次上课的主要内容, 对孩子每周错题坚持讲解，将课本知识与日常练习题联系起来, 帮助孩子克服“轻题”的习惯]');
INSERT INTO suggestions VALUES ('fd3d86b2-959e-48ca-91a6-28e585bc2b17', '[还是和上学期一样，后面快结束的时候好像没有那么专注, 只上了不到一个单元，学生可能课堂学习效率不是很高, 小豪好像没有这个习惯, 小豪好像大多时候都是被作业牵着走，我也不知道这是初中生的学习习惯还是他自己的。, 这个小豪好像还没有意识，可能是刚上初中，还不想我们这么老油条, 读题慢，而且粗心。经常出现我讲的时候说懂了，还嫌我啰嗦，但是做题的时候就不确定知识点]', '[休息好一点, 家长们可以引导一下学生在课堂上认真一点，这样知识吸收的好一点, 可以看看他喜不喜欢预习，不喜欢的话就算了，他作业也挺多的好像, 有时候我会安排一些课后题给他做，他好像没有那么多时间完成，不知道是不是学习压力也不轻, 前两次带着他做题，提点他几次，他也能知道。接下来我会多带他做题，然后告诉他更多的技巧, 这个只能慢慢来了。要先把知识点吃透。希望他多一点耐心，不要嫌我啰嗦。]');
INSERT INTO suggestions VALUES ('05fdafbf-8e31-44b4-9fc5-b8de289f8b46', '[比较专注，但是在最后的二十分钟内往往会不够专注, 一次函数这一块掌握的不是很好, 没有主动预习的习惯。, 复习的这一块做的不是很好，不少之前学过的知识点都忘记了。, 考试的时候没有做到先易后难，容易被难题卡住。, 速度不够快，准确率也不是很高，需要再接再厉。]', '[希望能打气十二分精神来专注的听讲。, 要加强一次函数，以及基本计算的练习。, 要学会主动的预习。, 要做到及时复习，即使是学过的知识点也不能忘记。, 我会多传授一些解题技巧，希望能做好试卷。, 多做题，加快速度，并且熟练掌握知识点。]');
INSERT INTO suggestions VALUES ('b76c804a-d0f0-478d-87dd-27c4e2d831d3', '[这点表现较好，听课很仔细, 对于数学方面基础较差，主要体现在二次函数方面和一些计算方面要注意的点，例如去括号，移位变正负，乘除换算方面都待加强。, 有待加强。, 由于基础较弱，所以以后锻炼加强这方面的能力。, 有待加强。, 准确率较低，需要注意运算中的一些细节。]', '[继续保持。, 能够跟着我的步伐走，按时完成老师布置的任务。, , , 卷面工整方面要改善。, 特别注意正负号和去括号。]');
INSERT INTO suggestions VALUES ('776c734a-bce0-48d6-96e5-8184061971a0', '[较认真, 一般, 一般, 较好, 较好, 一般]', '[听课时可以培养一下总结题型能力, 接触新知识做题时可以适当地把知识点往题目所求方向靠, 预习时掌握大概方向即可 重点放在课后巩固, 多做题 善于总结 可以有一个错题本, 主要熟悉知识点 多见题型, 这个一定要提高做题速度和读题准确度]');
INSERT INTO suggestions VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '[, , , kl, , ]', '[, , , , l;, ]');
INSERT INTO suggestions VALUES ('fa4a9cad-7de1-49da-9fae-526fab064a66', '[有进步，但仍需努力, 基本掌握，但遗忘快，要及时复习巩固, 无, 无, 基本掌握，讲解都懂，自主解题能力要继续锻炼, 中]', '[建议:保证休息，提高学习兴趣 \n规划:上课收手机，趣味讲解，亦师亦友，提高学生上课专注的, 建议:课后多复习，回顾讲过的题型的做题步骤，多看多用\n规划:课前带领学生复习，课后再次复习，利用课上时间多带学生复习巩固。不上课时间对学生多督促。重点传授做题方法，使学生成绩有可见提升, 建议:在学校跟上老师的节奏，辅导前学生基本掌握知识点, 规划:课上多巩固，课后多督促, 建议:上课认真听讲，方法会用，多用多练\n规划:讲解搭配学生自主做题思考，多培养学生自主做题能力, 建议:掌握方法，多用多练，提高准确率\n规划:带学生培养做题方法步骤意识，规范做题步骤。并培养日常进行反思总结的习惯，提高准确率]');
INSERT INTO suggestions VALUES ('b091936b-3866-4e98-8ac6-9d72df59a56f', '[学生本阶段的学习没有上阶段的积极性高，对学习方面也有些松懈，而且上厕所的时间也有点长。但听课时也有用心，只是坚持全神贯注地听课的持续时间太短，容易分心，需要加以引导把心思放到学习上来。, 这四次课分别教授的内容是:巩固分式的运算、因式分解；学习的新内容为四边形及平行四边形的证明、正比例函数和一次函数。学生基本掌握，但对知识点的熟练程度不够，需要学生课下自己多做题，加深理解。, 现阶段的学习为复习前面内容，扎实基础。, 学生有一定惰性，未能达到良好的巩固效果。, 学生接受新知识的能力不是很强，所以每个知识点都需要反复强调，考点需要做题时融会贯通。, 学生的做题速度慢，准确率不高，但题目做对时还是可以感受到学生的成就感。]', '[建议家长在上课时间段暂时保管学生手机，否则学生将以上厕所为由在卫生间玩手机，这将浪费大量时间，导致实际上课时间缩短，降低课堂效率，学生也无法集中精力上课。与此同时，我将降低采取鼓励学习方法，对学生的上课表现多一点肯定与表扬，树立学生的自信心，调动学生的积极性。同时也将严格要求学生，上课时间不能去卫生间，休息时间控制在十分钟以内。, 由于学生上学期的补课是从初一的内容开始补起，所以我未能把握好旧知识与新知识间的平衡点，导致学生的成绩未能提高，所以我现阶段的安排是在补习落下的学习内容的同时紧跟学校的知识点学习，争取学生能掌握周内学校学习的新知识。, 如果后期课堂效率高的话，会考虑超前学习，但本阶段只能先补习好初一的基础内容，尽力做到与学校学习同步。, 下阶段将布置周内作业，根据学生现有的辅导书和课堂所学内容，布置相关知识的题目。, 对于公式的背记和理解部分需要加强训练, 以后会将题目的难度等级提前预估，让学生先做较为简单的题目，增强学生的成就感，再慢慢加大题目难度。]');
INSERT INTO suggestions VALUES ('de89ed26-b005-42e6-870a-e367aac4f28c', '[, , , , , ]', '[, , 加强记忆单词语法知识, 做过的试题中涉及的知识点、单词短语, , 把握技巧，加快做题速度]');
INSERT INTO suggestions VALUES ('858ca17d-2205-4934-96df-f339b1826c95', '[对学生有所了解，有所改善, 有所进步, /, 表现还可以，课堂知识可以做到及时回顾, /, 有所进步，准确率提高明显]', '[进一步摸索出让学生专注的方法 共同学习, 多用时间认真背诵, /, 进一步努力, /, 多练习，减少非智力因素失分]');
INSERT INTO suggestions VALUES ('164b3a53-487f-4d0b-8f55-e911ff2ebd7a', '[, , sfa, , , ]', '[, , , weawe, , ]');

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
INSERT INTO teacher VALUES ('dc9620b4-021a-4809-a238-7f83c80b636b', '向梦天', '033df2d9-d160-45df-9020-2be7a32638ce', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '156748563148', '1', '2018-04-03 13:11:55', null, '', '0');
INSERT INTO teacher VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '高级老师', '6ea548c5-fc9c-4ccb-9c45-8c4899623819', '1389a575-e1a9-46ab-853d-c2df5adcad5f', '2018级', '1', '3', '18674123456', '2', '2018-02-25 15:55:10', '1111', 'oQHVE00HAWuiDqD8zQb1Zun4cfxo', '1');
INSERT INTO teacher VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '吴月颖', '21d5d442-8052-43c0-9e23-543018059625', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774839836', '1', '2018-04-02 13:02:23', null, '', '1');
INSERT INTO teacher VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '向嘉博', '4115f4bb-95d7-4d87-8e07-ac21a3277a03', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18397413862', '1', '2018-03-31 13:19:17', null, 'oQHVE06xfTlMkw8eWb1uVFxoe2eo', '1');
INSERT INTO teacher VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '谢新茹', '99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7', '7ecf30e2-849b-4e93-82ba-469a2be66d32', '2017级', '1', '3', '15981671529', null, '2018-03-31 13:15:57', null, 'oQHVE0ztpyGDacM17J9gUhsg902A', '1');
INSERT INTO teacher VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '冯龙兴', 'd775d3bc-f859-4ff9-bb92-e76669ac5c71', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', null, '4', '15367487002', '1', '2018-04-02 10:36:30', null, 'oQHVE06iSPv6n2q2XYaDSuGuqm8g', '1');
INSERT INTO teacher VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '崔向影', '456d056f-25ff-4c65-a77e-23a1a2084a52', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '1', '3', '15084762874', '1', '2018-04-02 13:03:21', null, 'oQHVE01BjMXXYEH839qxPpPWzrZE', '1');
INSERT INTO teacher VALUES ('b024e47e-4427-4fb2-95d6-3cf3b42aa135', '麻万明', '5c9eed81-ccfb-4a27-928d-52756f3362d8', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13657485997', '1', '2018-04-03 08:54:20', null, '', '0');
INSERT INTO teacher VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '陈皓', '9ee049ff-2e20-4655-9d2b-4cb7fe814566', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774975537', '1', '2018-04-02 13:09:37', null, 'oQHVE01yvJYAJ5TFf4Fnb5t60Geo', '1');
INSERT INTO teacher VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '徐慧颖', 'e23d7bca-6405-4c49-8b7f-14fe663ee4d4', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '15274810285', '1', '2018-04-02 13:10:28', null, '', '0');
INSERT INTO teacher VALUES ('41816287-35ca-4235-bc89-ba2a2cb4abe1', '程凡', 'efd06f65-eef6-410f-8f0c-36621ea31a86', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18154217405', '1', '2018-04-02 13:11:22', null, '', '0');
INSERT INTO teacher VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '朱晓龙', 'c1f40a57-7146-4a06-9e62-c50f6f75bfbf', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18273120371', '1', '2018-04-02 13:14:46', null, 'oQHVE0z70ZTYwxCF0aiMuj78Ygzo', '1');
INSERT INTO teacher VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '吴洋', '92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13278881603', '1', '2018-04-02 13:19:37', null, 'oQHVE06Ug-VWriy_SFgycIAut_Ls', '1');
INSERT INTO teacher VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '陈松', 'ca67e8ef-09d5-466b-a796-82622add5cac', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18373150752', '1', '2018-04-02 13:16:26', null, 'oQHVE01-IyhcNUk0j0IILikXF9n0', '1');
INSERT INTO teacher VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '夏欣研', 'e88ffb63-b250-44bc-9083-3324cba01eb0', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13545212652', '1', '2018-04-02 13:21:07', null, 'oQHVE075Ist7NrIynO0jPZthCHwg', '1');
INSERT INTO teacher VALUES ('cbe83e91-b829-4dd8-b852-e1937c450fe9', '齐宁', 'e05ca04a-ccca-4ee9-bb9a-383acab20a3c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '17375876043', '1', '2018-04-02 15:01:15', null, '', '1');
INSERT INTO teacher VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '姜波', 'bc9b247d-70e7-4bcd-b8be-aa4d3721984b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '15111016224', '1', '2018-04-02 15:01:54', null, 'oQHVE04YURQ-HcckCC9rhhW3Ctrg', '1');
INSERT INTO teacher VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '胡潇羽', '4e97532e-22ac-492b-a118-89a5c6b31c3c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13142008762', '1', '2018-04-02 15:03:02', null, 'oQHVE0xCd_ZrBK7hdt_qh00vfwD8', '1');
INSERT INTO teacher VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '吕向前', 'bc0be7a4-38e6-4366-a74e-903d322e4b0a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18569400050', '1', '2018-04-02 15:13:20', null, 'oQHVE02FYU1agk2nKZa_gRhfrl58', '1');
INSERT INTO teacher VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '张文慧', '15a7c808-098b-4e8d-9f19-1022b6d5b387', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '13635562695', '1', '2018-04-02 15:19:14', null, 'oQHVE05svxvYq0B41xk9QDCe-n-w', '1');
INSERT INTO teacher VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '左博聪', '4583b87a-1eb3-4cfb-9a47-f1af60d01467', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '15111095615', '1', '2018-04-02 15:43:26', null, 'oQHVE06FdnB1_VBLYhA7W7VORTZE', '1');
INSERT INTO teacher VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '邢凯迪', '1394814e-1348-4132-90cd-ac01732facd5', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18174451062', '1', '2018-04-02 15:46:53', null, '', '0');
INSERT INTO teacher VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '王宁', '1cc35afa-391b-49dc-a0bb-5f401eaf56f0', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2014级', '0', '3', '13667337306', '1', '2018-04-02 15:48:05', null, 'oQHVE0wakJf02f3mULTcytPVJqF4', '1');
INSERT INTO teacher VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '陈娴', '64a7f49d-15db-48dd-9e50-044c15314a33', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '17308416020', '1', '2018-04-02 15:50:37', null, 'oQHVE0xMB1ZvRHXPfWJCDxKyKkP0', '1');
INSERT INTO teacher VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '薛潇', '8d4c35e9-dcad-44ff-a297-c55789914717', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '4', '13909620950', '1', '2018-04-02 15:51:55', null, 'oQHVE0yIjju4ZGFWKRgHqQrqWk_E', '1');
INSERT INTO teacher VALUES ('ec0a82c0-6f1c-4561-b8bf-195cac02796b', '姜蕊', '6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18390987440', '1', '2018-04-02 15:56:34', null, '', '0');
INSERT INTO teacher VALUES ('e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '胡嘉欣', 'd6484e68-7a9a-4fca-812c-1bdb64a951e3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', null, '18272057850', '1', '2018-04-02 16:20:05', null, '', '0');
INSERT INTO teacher VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '李东刚', 'c6948d2a-e3d4-49ca-8adc-7e657268cb2e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18670308329', '1', '2018-04-02 16:28:48', null, 'oQHVE003YUsVEQ3ZpwLpEYI3VnYI', '1');
INSERT INTO teacher VALUES ('f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', 'ceshiliulaoshi', '961c91e1-0607-4dea-ba8d-c96a1cb18315', 'f3e0ee6c-7c5f-42ca-8060-f2b39dbf2361', '2016级', '0', null, '15587976896', null, '2018-04-02 22:26:35', null, '', '1');
INSERT INTO teacher VALUES ('bba97bb5-2d8c-4977-a009-bf59e82fb6af', '李莹庆', '0a4afa55-db09-4bd1-8c38-82d93edc6d70', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '15526459605', '1', '2018-04-03 13:16:42', null, 'oQHVE04raoFjtMPVA3h6Htz7_CPY', '1');
INSERT INTO teacher VALUES ('76a6c3d8-ef83-4fb7-bd5c-b27c47eccf02', '候晚晴', '8a0698be-fdc5-40da-86ae-61731251290b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '15893095795', '1', '2018-04-03 17:23:57', null, '', '0');
INSERT INTO teacher VALUES ('c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '张荣旺', '258e2acf-80db-4642-ad89-0fcbd6b5731b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '15574804640', '1', '2018-04-03 16:07:02', null, 'oQHVE02MP7TCMAEvhKe95COAZZHc', '1');
INSERT INTO teacher VALUES ('76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '秦家琳', 'a2d1cd1d-8b94-455d-8f78-a00ec90cb007', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774063134', '1', '2018-04-03 17:22:53', null, 'oQHVE0xkmL6bB9WV1y3uaZnJL_UE', '1');
INSERT INTO teacher VALUES ('5f53edf6-079a-4874-8e86-4c48d14a268e', '丛颖', '06a6ab17-d1ea-4159-b897-aa5bf2135c2b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', null, '3', '18774879533', '1', '2018-04-03 17:24:49', null, '', '0');
INSERT INTO teacher VALUES ('a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '李芳林', '96b37632-2ad5-4100-814c-23d4af389250', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13637472576', '1', '2018-04-03 17:25:54', null, '', '0');
INSERT INTO teacher VALUES ('2317d1b6-f84d-4633-bc8c-97caaff69e16', '高梦梦', '9b563e14-07bc-4416-830b-319274e8d625', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '15274816683', '1', '2018-04-03 17:27:58', null, 'oQHVE04is0pQL2FUiFVShfhvQ8Kk', '1');
INSERT INTO teacher VALUES ('436e705c-33e3-4f57-ba31-6eadb0596ac4', '田江', '53e2656e-8d99-4626-81f7-cbdad18c7b93', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '17375895823', '1', '2018-04-03 17:29:30', null, '', '0');
INSERT INTO teacher VALUES ('fa21938a-9d7f-442e-b9cb-37be8a2535c6', '廖成意', 'd1da9599-1adb-4075-98d9-297e4902338e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', null, '3', '18223562393', '1', '2018-04-03 17:30:23', null, 'oQHVE00-AmMcs0WzzENjr5bPOYFc', '1');
INSERT INTO teacher VALUES ('b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '高鸶佳', 'ae035324-3e4d-46c4-bdb6-c445af54e5fe', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13142175883', '1', '2018-04-03 17:31:37', null, 'oQHVE013DU_MBE9faBJPzLmV8f40', '1');
INSERT INTO teacher VALUES ('776b3585-eb3d-4be2-85b0-6e833cf6a913', '王翼', '219524c2-8299-4a2c-8e28-6826f222c219', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18329525584', '1', '2018-04-03 17:34:10', null, 'oQHVE02kDaU7MucAhueX258cmKa8', '1');
INSERT INTO teacher VALUES ('ebcea06f-b8ea-45f4-9c39-c843d648602c', '皮文君', 'c9e06263-d7a6-4fde-9d60-50b4c66d3092', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18670367305', '1', '2018-04-03 17:43:47', null, 'oQHVE05fxzDEFXvF7ZynRKSchpQA', '1');
INSERT INTO teacher VALUES ('01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '李国伟', '6d608e41-1306-476e-9065-ba38563ca876', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', null, '15200833373', '1', '2018-04-03 18:03:01', null, '', '0');
INSERT INTO teacher VALUES ('c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '候昭慧', '6a17e374-b643-4a53-9981-12e58be2a5dc', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '17375150595', '1', '2018-04-03 18:03:50', null, 'oQHVE06m8SUA7vxpVTT68Bw0CIRU', '1');
INSERT INTO teacher VALUES ('a2d7bf04-f9f6-4842-99d1-79f17dab142e', '董梦季', '6d072ef5-a207-40c9-a4dc-425e7dfc4bfb', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '18890090950', '1', '2018-04-03 18:27:52', null, '', '0');
INSERT INTO teacher VALUES ('44cd5d75-722e-4c03-ac2a-360e5447b97f', '覃居上', 'c336330e-5f6e-4816-b65b-9ae28027e76f', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774861533', '1', '2018-04-03 18:28:43', null, '', '0');
INSERT INTO teacher VALUES ('6c7dae17-0dcb-4263-89b2-ae255883c682', '刘芳', '9690b31a-b878-4d60-8bdf-2e9448e815db', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '1', '3', '15084726641', '1', '2018-04-03 19:02:58', null, '', '0');
INSERT INTO teacher VALUES ('f3ab62e9-bffa-4ca7-950a-9758622de7fc', '崔海骕', '76a11d30-fa92-4921-8104-01c128b50ce6', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18711139337', '1', '2018-04-03 19:05:06', null, 'oQHVE07-ZhI-kR-ndOKodygSf7Qw', '1');
INSERT INTO teacher VALUES ('104a8e84-b0a2-4e32-86d4-75d548c87804', '胡英杰', 'd1c43397-001f-400b-ae73-00c6e27461b9', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18932449267', '1', '2018-04-03 19:14:42', null, '', '0');
INSERT INTO teacher VALUES ('d0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '谷孟阳', '36b74fdc-62d5-4d20-b4c0-3acf7317c745', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13027424343', '1', '2018-04-03 19:18:01', null, 'oQHVE04la8ss0_eO_XHTLnW3foyY', '1');
INSERT INTO teacher VALUES ('19115f9c-d7d6-4415-baab-27cb4973ce98', '文少芬', '7b0efa43-761c-486c-8285-e33fe6e7e92d', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '18319368445', '1', '2018-04-03 19:20:13', null, 'oQHVE02AyTqCVp7pm3g8rAGU001c', '1');
INSERT INTO teacher VALUES ('cb25c238-8c4a-4fd3-8142-3e4c39fb0d42', '程新', 'c2732e4f-ff7c-4168-a706-467276cc46e4', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13278882857', null, '2018-04-03 21:07:24', null, '', '0');
INSERT INTO teacher VALUES ('add3d1b0-204f-4159-90de-e054b94a4b5f', '王中钰', 'a3b322d6-90f5-4d27-8bb1-351944ce46a3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13007438697', '1', '2018-04-03 21:26:56', null, '', '0');
INSERT INTO teacher VALUES ('8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '王永娟', '025493f4-3031-4d26-a97a-94a1c003f450', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2016级', '1', '3', '14747431827', '1', '2018-04-03 21:28:01', null, '', '0');
INSERT INTO teacher VALUES ('70003dbe-38d9-4337-aa5c-3e70efafb7fc', '刘建军', 'adc81b8e-602a-4642-aa05-6fd3dce8a200', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '17830286663', '1', '2018-04-03 21:30:48', null, '', '0');
INSERT INTO teacher VALUES ('4913983e-0ead-42d9-8461-e529dc31c684', '廖森', '15af7999-b5fa-4f1e-8859-0409afdc4688', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '5', '18273460875', '1', '2018-04-03 21:35:54', null, '', '0');
INSERT INTO teacher VALUES ('3f26b978-1499-4da6-bb18-42750bafc010', '李恩启', 'ea56eb2f-6608-4caa-bc5f-ed70101e17df', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '15560279613', null, '2018-04-03 21:39:14', '', '', '0');
INSERT INTO teacher VALUES ('51669f73-2654-42db-a7d3-8c51c430a564', '智亚', '42f7d036-eff6-4000-9f34-bea9f636a643', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774878930', '1', '2018-04-03 21:40:17', null, '', '0');
INSERT INTO teacher VALUES ('b13c5b94-b066-44af-b4c4-145c9d8612a0', '汪永俊', '931bb143-622e-4344-8da2-5a560d236701', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13516450815', '1', '2018-04-03 21:41:21', null, '', '0');
INSERT INTO teacher VALUES ('581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '胡明杰', '585c7f7b-6b8e-4c97-bf29-78f421169d71', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18670391790', '1', '2018-04-08 11:53:21', null, 'oQHVE0z4_jisbd0U4oaquaX9PHWw', '1');
INSERT INTO teacher VALUES ('11d525bf-153b-4d1d-9acc-3d06778177c4', 'test_teacher1', 'e713f2c0-ff19-4263-b590-8e4dfde618c2', '6a4997b2-5319-4119-841f-cbb40b93f40e', '2013级', '1', '3', '18711009965', '1', '2018-04-05 20:55:11', '232', '', '1');
INSERT INTO teacher VALUES ('27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', 'hexl2', '46ea94d9-9c5d-4f1a-8943-f9847ccf8ee0', '6d52123a-ce1f-497e-ae85-15a6e6436462', '2018级', '0', '3', '18674819151', '1', '2018-04-04 22:57:23', '4444', 'oQHVE0603rPaj7fFU8aum--eliMc', '1');
INSERT INTO teacher VALUES ('2c64d354-e9db-441d-8271-061d46813abb', '周彦宏', 'ebf4bed8-529d-4f43-b56c-0b211da1a51d', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18006468086', '1', '2018-04-08 19:30:48', null, 'oQHVE0_1ev9Fnu8WCLxN-AD4aKH4', '1');
INSERT INTO teacher VALUES ('a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '姚明', '16685aa3-7589-40d2-ac2f-63e3c116e99c', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2015级', '1', '3', '18373177116', '1', '2018-04-08 20:37:27', null, 'oQHVE090xsPfCCHEtgZuovs5KxeY', '1');
INSERT INTO teacher VALUES ('db66fd38-466a-4620-9890-6abb10a67a22', '秦国民', '80cc1fe4-6aa4-49fe-a71c-0842035e126e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18174679426', '1', '2018-04-08 20:38:06', null, 'oQHVE02nMmvMGlH3e5FmeVQojdH4', '1');
INSERT INTO teacher VALUES ('ac37a69a-8f81-4f35-950d-44586364969b', '王文丽', '556a2aeb-8c1c-4291-9485-5ed043c866ef', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2016级', '1', '3', '15874184386', '1', '2018-04-08 20:55:51', null, '', '0');
INSERT INTO teacher VALUES ('2f6a5e5b-4e32-46d0-8942-5e730051b99a', '刘林', '6e87011c-d6a7-4bf5-bc18-eb9356d320cd', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13142172699', '1', '2018-04-09 10:58:06', null, '', '1');
INSERT INTO teacher VALUES ('6620857b-7472-4960-a7f7-870244cad689', '吴俊', '7884cfad-89c5-41d3-89df-3b6095e7483a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774884031', '1', '2018-04-09 11:20:46', null, '', '0');
INSERT INTO teacher VALUES ('73818668-89b4-4f28-b928-6b454641aaae', '沈昊晟', '05bd85d1-9e6b-42dd-9889-2ec75721755c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18670741028', '1', '2018-04-09 11:21:19', null, '', '0');
INSERT INTO teacher VALUES ('38cf1718-94f3-4b1c-941d-16c27e5f8206', '孔垂越', '8ff783b7-5748-4bea-b81f-f1969240ac38', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2016级', '1', '3', '13278880276', '1', '2018-04-10 15:15:19', null, '', '0');
INSERT INTO teacher VALUES ('510ad3ee-86ab-44ff-a31e-f71ab7b2c27b', '秦星子', 'de657fcf-fa06-4bab-af63-8c09b03c833d', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18173676040', '1', '2018-04-10 15:34:31', null, '', '1');
INSERT INTO teacher VALUES ('570cf513-8e9a-4fc8-a8c9-b44ce5ed7198', '金丹静', 'd64cd4ed-2132-42e2-a0c8-564d06762425', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '17373139972', '1', '2018-04-10 15:37:33', null, '', '0');
INSERT INTO teacher VALUES ('3d7625b8-c5b8-49aa-8a38-4e8ba6753f50', '刘择安', '2d29ce81-cca3-4c13-8bb4-b7ef76545a43', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '13187042971', '1', '2018-04-10 15:38:28', null, '', '0');
INSERT INTO teacher VALUES ('878cf7d9-1888-40fc-871f-89f3687b34b8', '丘浏阳', '58fd06a7-890c-4221-9689-ea14daa17bd0', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '17375876324', '1', '2018-04-10 15:39:06', null, '', '0');
INSERT INTO teacher VALUES ('3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '康芯萍', '608bf3da-7dca-4cdd-a996-61b71178701c', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13117412195', '1', '2018-04-10 17:46:19', null, 'oQHVE0wsUmv-at-kljG1J8zYx5Co', '1');
INSERT INTO teacher VALUES ('a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '贺亚灵', '5458cd11-e167-440e-9036-b07cefa39ff6', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18711176332', null, '2018-04-10 18:32:08', null, '', '0');

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
INSERT INTO teacher_les_r VALUES ('1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '2');
INSERT INTO teacher_les_r VALUES ('f558d3cb-3858-44de-aece-19b4ffc45396', '16684d26-3d14-45ff-8c3f-112d739be006', '2');
INSERT INTO teacher_les_r VALUES ('39a82af9-6cdf-4b92-b0ad-2af75eb02564', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '2');
INSERT INTO teacher_les_r VALUES ('92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '2');
INSERT INTO teacher_les_r VALUES ('1338d07a-9243-4d1f-81d0-f7dbd35c30d4', '19115f9c-d7d6-4415-baab-27cb4973ce98', '2');
INSERT INTO teacher_les_r VALUES ('2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '19115f9c-d7d6-4415-baab-27cb4973ce98', '8');
INSERT INTO teacher_les_r VALUES ('e3ff9924-100d-4a58-bbca-54d2fad68f69', '2317d1b6-f84d-4633-bc8c-97caaff69e16', '2');
INSERT INTO teacher_les_r VALUES ('5a88004b-a6ed-4463-aa35-33f6befbff13', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '2');
INSERT INTO teacher_les_r VALUES ('5e9be195-5683-446e-a03f-7f45b50f5f2b', '24652540-af54-4120-abc8-79d166778f82', '1');
INSERT INTO teacher_les_r VALUES ('260d90c3-929d-4407-ad6a-272afc660212', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO teacher_les_r VALUES ('3bf0d502-f4c7-4c3c-ad03-53284868dc0a', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO teacher_les_r VALUES ('7f566938-d95e-4c4b-b536-4ec72287862a', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO teacher_les_r VALUES ('1f8743ea-6823-49db-bb78-30df932c44d0', '24652540-af54-4120-abc8-79d166778f82', '8');
INSERT INTO teacher_les_r VALUES ('a93762e3-28ab-46b2-9793-8c73229268ca', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '2');
INSERT INTO teacher_les_r VALUES ('5643eb54-af69-48f5-8680-37c8a9076677', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '7');
INSERT INTO teacher_les_r VALUES ('8ecacfdd-351a-4381-bf5c-29bf8a815a88', '27b5a1a7-624f-40e1-9359-9196d0261133', '7');
INSERT INTO teacher_les_r VALUES ('f371aeda-adc3-4cd6-9da2-aca6e5509aa7', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '7');
INSERT INTO teacher_les_r VALUES ('72d7b5fe-d664-421d-9ac5-9e9f9bc6fe82', '2c64d354-e9db-441d-8271-061d46813abb', '7');
INSERT INTO teacher_les_r VALUES ('8fd5a867-cf4b-4163-889e-e0778641a4a5', '2d3829b4-17b3-46af-bf50-cd0eba5430f8', '1');
INSERT INTO teacher_les_r VALUES ('a4272eba-cc9c-40da-9e9e-a7b9662a46f3', '2d3829b4-17b3-46af-bf50-cd0eba5430f8', '2');
INSERT INTO teacher_les_r VALUES ('b66a90f4-e5a6-4ba5-a64c-85221ae34828', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '7');
INSERT INTO teacher_les_r VALUES ('faf95a49-dc0b-49c4-a24e-be34c61e622f', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '2');
INSERT INTO teacher_les_r VALUES ('ded7ab44-98ea-4eff-b893-3ab04630129e', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '2');
INSERT INTO teacher_les_r VALUES ('8426c300-a528-4318-8983-4fd19f3f0ff0', '41816287-35ca-4235-bc89-ba2a2cb4abe1', '3');
INSERT INTO teacher_les_r VALUES ('c6c96bcb-068b-4c03-af6b-9a855737bffd', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '3');
INSERT INTO teacher_les_r VALUES ('d8284412-4b3d-413c-88f3-d5c913f5df4f', '44cd5d75-722e-4c03-ac2a-360e5447b97f', '3');
INSERT INTO teacher_les_r VALUES ('f849cbc7-5943-4710-b614-8f8cffd304e5', '537f3647-8444-4525-94c9-5af57c3f55e8', '3');
INSERT INTO teacher_les_r VALUES ('b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '3');
INSERT INTO teacher_les_r VALUES ('2e858069-8e55-45b6-9bdd-725eece0438b', '5f53edf6-079a-4874-8e86-4c48d14a268e', '8');
INSERT INTO teacher_les_r VALUES ('f6dc4acc-f4d7-4aaf-b134-d818877620c9', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '2');
INSERT INTO teacher_les_r VALUES ('60f60bee-3cc0-45e5-ab06-1fdc359f744d', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '7');
INSERT INTO teacher_les_r VALUES ('88952680-bedf-47cc-86ed-8d61aa95abb7', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '2');
INSERT INTO teacher_les_r VALUES ('8d5fa78f-c3fb-48e7-9441-046d55522dc7', '6620857b-7472-4960-a7f7-870244cad689', '7');
INSERT INTO teacher_les_r VALUES ('b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '6c7dae17-0dcb-4263-89b2-ae255883c682', '2');
INSERT INTO teacher_les_r VALUES ('a9be6da1-71d3-4437-b617-4ce283c0d587', '73818668-89b4-4f28-b928-6b454641aaae', '3');
INSERT INTO teacher_les_r VALUES ('dd7f3ed4-6b89-484f-af84-275df6c719a7', '76a6c3d8-ef83-4fb7-bd5c-b27c47eccf02', '3');
INSERT INTO teacher_les_r VALUES ('562f12cf-b532-44b1-8d55-dd55e8211fed', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '1');
INSERT INTO teacher_les_r VALUES ('a6ac0da9-14dc-48c1-91ef-fd00cf86eb04', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '9');
INSERT INTO teacher_les_r VALUES ('4b99627f-fdf6-4325-a3d6-f5c83a421706', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '3');
INSERT INTO teacher_les_r VALUES ('98efdd46-b5b6-414c-9c31-56320515f91d', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '2');
INSERT INTO teacher_les_r VALUES ('425e3aab-b0d2-4521-b858-0a70509b5d9e', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '2');
INSERT INTO teacher_les_r VALUES ('e64a4b66-c6d5-439d-b1ad-29929236a236', '8124288f-6f07-4cd0-a1ec-37a4e2171adb', '2');
INSERT INTO teacher_les_r VALUES ('046b4cdf-9682-4bfd-b1e5-660e1bdc3494', '853a2f31-f902-489c-8b7c-bea062277833', '3');
INSERT INTO teacher_les_r VALUES ('f926d599-de1a-4b81-8343-9833c57a0882', '853a2f31-f902-489c-8b7c-bea062277833', '3');
INSERT INTO teacher_les_r VALUES ('6a2f9398-4577-4d5c-925c-b32352714ad2', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '7');
INSERT INTO teacher_les_r VALUES ('acff1cb9-18a5-4963-976c-04dd78f1031b', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '2');
INSERT INTO teacher_les_r VALUES ('9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', '1');
INSERT INTO teacher_les_r VALUES ('5af60a58-368f-4d40-b522-49a685f977d8', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '2');
INSERT INTO teacher_les_r VALUES ('5bdd1587-c65e-4c95-84b0-1c83be168446', 'a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '2');
INSERT INTO teacher_les_r VALUES ('2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '2');
INSERT INTO teacher_les_r VALUES ('7c3cbd28-fcc4-4b56-bcf4-8cfca9d1bf01', 'ac37a69a-8f81-4f35-950d-44586364969b', '8');
INSERT INTO teacher_les_r VALUES ('37e49b33-f12a-4693-9e11-aed0bf39f981', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '1');
INSERT INTO teacher_les_r VALUES ('3e9162a0-a70e-4bef-905a-a40c0ba0df2a', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '2');
INSERT INTO teacher_les_r VALUES ('a4dbc41f-3d29-4629-9d6d-1a3ff201eede', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '2');
INSERT INTO teacher_les_r VALUES ('27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '3');
INSERT INTO teacher_les_r VALUES ('e0b3d132-d720-4961-a8b2-c506466c87a6', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '7');
INSERT INTO teacher_les_r VALUES ('64e2a46a-6e1c-48ad-8cd7-4494f591972e', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '7');
INSERT INTO teacher_les_r VALUES ('b6f587b6-5d6c-4f13-a17b-f91b3edf17bc', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '7');
INSERT INTO teacher_les_r VALUES ('e10d87f4-b1eb-4b93-b46c-153cd988a403', 'b21addc3-003c-42be-afaa-ab7064d6e144', '3');
INSERT INTO teacher_les_r VALUES ('3f62df1a-7ce8-4d41-9476-aec52a3c267d', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '3');
INSERT INTO teacher_les_r VALUES ('bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '2');
INSERT INTO teacher_les_r VALUES ('f2eff1fa-55b8-4a6b-8d24-59773b22d648', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '7');
INSERT INTO teacher_les_r VALUES ('3b7435ef-5564-4501-8ed7-49ce14572ab0', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '2');
INSERT INTO teacher_les_r VALUES ('6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '3');
INSERT INTO teacher_les_r VALUES ('9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5', 'cbe83e91-b829-4dd8-b852-e1937c450fe9', '8');
INSERT INTO teacher_les_r VALUES ('fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '9');
INSERT INTO teacher_les_r VALUES ('748ac459-aca8-4b9a-b792-e3aaf09a8e23', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '1');
INSERT INTO teacher_les_r VALUES ('487bd9a3-57b1-4583-8802-f614c2ded24e', 'db66fd38-466a-4620-9890-6abb10a67a22', '8');
INSERT INTO teacher_les_r VALUES ('b56826ad-23bb-4162-8c5c-6cd7cf516889', 'dc9620b4-021a-4809-a238-7f83c80b636b', '2');
INSERT INTO teacher_les_r VALUES ('8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '1');
INSERT INTO teacher_les_r VALUES ('7017346c-ff3f-4f42-9a40-e92dc324ef19', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '8');
INSERT INTO teacher_les_r VALUES ('9b6d689e-8671-4ee0-81f1-6cc27981b9c6', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '1');
INSERT INTO teacher_les_r VALUES ('63aa4adc-bf6f-49c2-8164-f93bf08df35e', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '3');
INSERT INTO teacher_les_r VALUES ('5a978ecd-96da-4eae-b3f5-8706fcb3792e', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b', '2');
INSERT INTO teacher_les_r VALUES ('4d309b83-f780-4e70-9aaa-399c086cff52', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '7');
INSERT INTO teacher_les_r VALUES ('ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '2');
INSERT INTO teacher_les_r VALUES ('5bf11ef7-d53e-47ff-a57e-e18aed22910f', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '1');
INSERT INTO teacher_les_r VALUES ('236bc37a-989e-4469-a29f-f8b476f64045', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '2');
INSERT INTO teacher_les_r VALUES ('af860c61-0ddc-42ff-af37-9e08cd039120', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '3');
INSERT INTO teacher_les_r VALUES ('c37a2e10-70ac-4d73-b65e-1327d3c5628f', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '3');
INSERT INTO teacher_les_r VALUES ('b18c2e01-544d-4e2b-bd41-3772c57c6976', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '2');
INSERT INTO teacher_les_r VALUES ('bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '2');
INSERT INTO teacher_les_r VALUES ('2d72270f-f8fe-4a24-93b2-885e8f8f5463', 'ffb18612-b184-4291-b49f-5336cf8a913b', '1');
INSERT INTO teacher_les_r VALUES ('78b8f787-05df-4ad1-bdcb-466804c52dd4', 'ffb18612-b184-4291-b49f-5336cf8a913b', '1');
INSERT INTO teacher_les_r VALUES ('dde3612a-990b-43e8-8ebb-02123e838cc1', 'ffb18612-b184-4291-b49f-5336cf8a913b', '2');
INSERT INTO teacher_les_r VALUES ('6380cb70-c25e-4077-a2ff-b0f65449e08b', 'ffb18612-b184-4291-b49f-5336cf8a913b', '3');
INSERT INTO teacher_les_r VALUES ('4d8192eb-b19b-4526-99b1-3604d27033be', 'ffb18612-b184-4291-b49f-5336cf8a913b', '7');
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
INSERT INTO teacher_pay_list VALUES ('161', '-1', '差', '1');
INSERT INTO teacher_pay_list VALUES ('161', '0', '一般', '1');
INSERT INTO teacher_pay_list VALUES ('161', '1', '满意', '1');
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
  `teachingNum` float(6,2) DEFAULT NULL,
  `teachingDate` date DEFAULT NULL,
  `lessonTradeId` varchar(36) DEFAULT NULL COMMENT '所属哪一个轮次的提现',
  PRIMARY KEY (`recordId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachingrecord
-- ----------------------------
INSERT INTO teachingrecord VALUES ('42e3caab-b0b5-4f0a-b1c4-acd413cefd24', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.50', '2018-03-01', 'aeff2060-f179-40d3-ba5e-f858c1d8cc46');
INSERT INTO teachingrecord VALUES ('4e7bdf87-868d-4476-a916-ab5ed81e228f', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-04-03', '0edef0da-d2b2-4041-8ae3-1551ffe4a0a0');
INSERT INTO teachingrecord VALUES ('aaff9048-b2e6-4f51-93b9-224698d8d22e', 'dc016cf8-e5ec-4661-8348-b3a59c4a235b', '4970c4d5-bda0-4b46-860d-51c53fa529ad', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-04-03', '797426a4-6322-4a8f-99f0-196d0d1f4421');
INSERT INTO teachingrecord VALUES ('bb6ad16b-1d81-4a15-a344-d79c3292a92d', '78b8f787-05df-4ad1-bdcb-466804c52dd4', '999f9085-f746-4f88-810b-bb266dc4cc3b', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-03-01', '2b6b4656-e866-4710-8be9-ba13049d572c');
INSERT INTO teachingrecord VALUES ('26287955-24bc-4655-af94-911a514f9a69', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-03-29', 'e135d0f9-261c-4809-87cd-99449d06c51c');
INSERT INTO teachingrecord VALUES ('227add73-2af5-489d-9deb-4c04ee0e435d', 'a4dbc41f-3d29-4629-9d6d-1a3ff201eede', '53183a7a-8547-4823-b908-656b9e818f84', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '2.00', '2018-03-01', 'a7a611b6-feb8-400d-b013-48efab30d3d2');
INSERT INTO teachingrecord VALUES ('fe6aa278-6171-4b61-9acd-1d94f7040586', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '09:00:00', '11:00:00', '2.00', '2018-03-24', 'c66d5aec-5a9d-445c-893b-5deee871ce86');
INSERT INTO teachingrecord VALUES ('1e4b2a6f-b905-47da-9ccd-56c4a1d63d65', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '09:00:00', '11:00:00', '2.00', '2018-03-31', 'c66d5aec-5a9d-445c-893b-5deee871ce86');
INSERT INTO teachingrecord VALUES ('dc11bd4c-efc2-4213-aa90-b8af78cbc0e2', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-10', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO teachingrecord VALUES ('9cb172dd-24cb-4573-a0ed-e07e75477b8d', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-17', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO teachingrecord VALUES ('be0e8f49-50bb-4e69-a300-7bce0feb0460', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-24', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO teachingrecord VALUES ('358abad8-7d2d-4ac6-9680-0f2ba921a828', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-31', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO teachingrecord VALUES ('9523cbde-e8f3-4161-b325-55162b86772f', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '14:00:00', '17:00:00', '3.00', '2018-03-11', '96417002-12ad-42dd-9bc3-2de1dd93c5f8');
INSERT INTO teachingrecord VALUES ('0b092975-d2ba-459e-8a3a-74f3087d3cab', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '09:00:00', '12:00:00', '3.00', '2018-03-25', '96417002-12ad-42dd-9bc3-2de1dd93c5f8');
INSERT INTO teachingrecord VALUES ('a685712c-1358-40bb-8c6f-fe2019593b47', '425e3aab-b0d2-4521-b858-0a70509b5d9e', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '08:10:00', '11:10:00', '3.00', '2018-03-11', '9028c9ed-55f5-4f01-aab8-9925da5320bc');
INSERT INTO teachingrecord VALUES ('7c824eca-2ec3-4dae-859d-e073f768c250', '425e3aab-b0d2-4521-b858-0a70509b5d9e', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '08:10:00', '11:10:00', '3.00', '2018-03-18', '9028c9ed-55f5-4f01-aab8-9925da5320bc');
INSERT INTO teachingrecord VALUES ('e2209f4e-d378-4a33-a5e5-ac7829270df7', '88952680-bedf-47cc-86ed-8d61aa95abb7', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '10:20:00', '11:50:00', '1.00', '2018-03-25', 'cb738951-e544-4c54-bee9-903f17f835b0');
INSERT INTO teachingrecord VALUES ('a19ecdb7-829c-4474-9a8b-772819b29091', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '19:30:00', '21:30:00', '4.00', '2018-03-01', 'b7e77aad-fd87-434e-bab0-efb3fc9b56d1');
INSERT INTO teachingrecord VALUES ('687f6e9e-aa7a-4908-a3d0-a7c4789efc56', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '09:00:00', '12:00:00', '3.00', '2018-03-18', 'e4207004-b076-4e52-9047-65fc0e553e1e');
INSERT INTO teachingrecord VALUES ('b9152cdc-95c2-4995-aa92-cb22200951c3', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '09:00:00', '12:00:00', '3.00', '2018-03-25', 'e4207004-b076-4e52-9047-65fc0e553e1e');
INSERT INTO teachingrecord VALUES ('78d69f5c-d03e-4706-93b6-74149353117b', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '15:40:00', '18:10:00', '2.00', '2018-03-18', '4c939366-dde1-4363-91a7-21bc1501cf05');
INSERT INTO teachingrecord VALUES ('d5d8da60-e836-4ca2-8d36-0fbdd1a736e8', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '15:40:00', '18:10:00', '2.00', '2018-03-25', '4c939366-dde1-4363-91a7-21bc1501cf05');
INSERT INTO teachingrecord VALUES ('2317ecec-0a73-4011-ab13-e4457d1c83a8', '98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '15:00:00', '17:30:00', '2.00', '2018-03-11', '5a404b4c-3c80-44c1-842b-9b4c75190d36');
INSERT INTO teachingrecord VALUES ('7ca9fefc-8d67-4019-b1ec-22b984f2dcbe', '98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '18:00:00', '20:30:00', '2.00', '2018-03-18', '5a404b4c-3c80-44c1-842b-9b4c75190d36');
INSERT INTO teachingrecord VALUES ('5ef12f9c-db5a-4099-a7dc-1cb2b6eb87cd', '98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '18:00:00', '20:30:00', '2.00', '2018-03-25', '5a404b4c-3c80-44c1-842b-9b4c75190d36');
INSERT INTO teachingrecord VALUES ('f22edb07-b8fd-4d3d-b5f1-01d3152d2462', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '14:00:00', '16:00:00', '2.00', '2018-03-11', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO teachingrecord VALUES ('6f51b6b8-e7e1-4a8c-b9c4-d96f537b67ad', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '14:00:00', '16:00:00', '2.00', '2018-03-18', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO teachingrecord VALUES ('6b730005-21b3-461d-8f17-a42fbeabe9da', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '13:30:00', '15:30:00', '2.00', '2018-03-24', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO teachingrecord VALUES ('ec8388f6-c798-46f3-b7c0-432515dc3824', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '15:00:00', '17:00:00', '2.00', '2018-03-31', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO teachingrecord VALUES ('8668e47b-bb7f-43f9-b123-90d0fbc3b2c9', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '16:30:00', '18:30:00', '2.00', '2018-03-10', '73e3003f-1f76-4713-913a-d99ae762f76e');
INSERT INTO teachingrecord VALUES ('4d032c18-b79a-4764-a27d-b0310e471575', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '15:30:00', '17:30:00', '2.00', '2018-03-17', '73e3003f-1f76-4713-913a-d99ae762f76e');
INSERT INTO teachingrecord VALUES ('f3544ba5-42a8-4bd6-aab0-aa16f30628da', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '15:30:00', '17:30:00', '2.00', '2018-03-25', '73e3003f-1f76-4713-913a-d99ae762f76e');
INSERT INTO teachingrecord VALUES ('03cda812-4e03-4a63-837a-135d31435330', '7017346c-ff3f-4f42-9a40-e92dc324ef19', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '14:00:00', '17:00:00', '3.00', '2018-03-18', '301f1e25-81ca-4c8f-ad57-420870770bf2');
INSERT INTO teachingrecord VALUES ('4915d905-0fe6-471c-86ba-2ff738da6c3c', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-03', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO teachingrecord VALUES ('ff8f724f-8043-4aab-9fe0-8362ac0b0f9f', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-11', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO teachingrecord VALUES ('42c40666-6f3b-4fd3-a6cf-335010769307', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-18', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO teachingrecord VALUES ('6e2362b0-2a6b-46fb-ac4c-64888fbd1281', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-25', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO teachingrecord VALUES ('49d816e0-5529-4944-ba13-40a454f78db4', '8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '19:00:00', '22:00:00', '3.00', '2018-03-13', '15d44df5-4a02-43d1-8704-ccca3e2c6e94');
INSERT INTO teachingrecord VALUES ('acf00e87-e7bb-43bc-b9fa-88d93f73324d', '8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '19:00:00', '21:00:00', '2.00', '2018-03-20', '15d44df5-4a02-43d1-8704-ccca3e2c6e94');
INSERT INTO teachingrecord VALUES ('cc6aa1b4-b58d-4663-974d-8254bc6bbb30', '8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '19:00:00', '22:00:00', '3.00', '2018-03-27', '15d44df5-4a02-43d1-8704-ccca3e2c6e94');
INSERT INTO teachingrecord VALUES ('951560f8-8b50-4ed4-b26b-2b7db2e1c0a2', '37e49b33-f12a-4693-9e11-aed0bf39f981', 'b0f6bbdc-3f81-41da-b769-66448f8ec5f6', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', 'ea726a02-bf22-404d-b138-792bf6d7785a');
INSERT INTO teachingrecord VALUES ('3a32fddf-58bd-4b4b-a976-ebba7f972757', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-13', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('08dc12a6-8c45-4678-bdad-ef4d2ae63fa1', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:00:00', '1.00', '2018-03-15', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('bb0071df-9b28-4a33-8f6a-49a1bc94db1f', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-16', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('4e37c2fe-3fcf-44c6-b8a4-9188206597b9', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-20', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('27c2feb1-2983-4af8-8803-3425392387c6', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:00:00', '1.00', '2018-03-22', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('2107d855-08c2-4db7-924b-b051dd7eb868', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-23', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('a841463f-657c-4b5b-9ad8-018397c808bc', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-30', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO teachingrecord VALUES ('0b334d5a-e890-49d9-8322-010c16da5bab', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO teachingrecord VALUES ('1612a1b3-f25d-45d8-a8f3-3e07e41ec0d0', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO teachingrecord VALUES ('2e6b5fc5-372f-46ed-9b50-553b3d2630d8', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO teachingrecord VALUES ('9eec1b0a-0c63-4e43-b033-ce9bb6104a5c', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO teachingrecord VALUES ('aa92eafb-83c2-4561-a5fa-242e8b83450c', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '16:01:00', '16:05:00', '2.00', '2018-03-10', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO teachingrecord VALUES ('17bf7c13-cbf6-49c8-98cd-0ac1e2a46b83', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '13:30:00', '15:30:00', '2.00', '2018-03-17', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO teachingrecord VALUES ('c4613b0a-a005-4b1a-a31b-fa141ce29038', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '14:00:00', '16:00:00', '2.00', '2018-03-24', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO teachingrecord VALUES ('7ae9032b-9637-4cc6-b6c8-e9ac6cc8d6ca', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '14:00:00', '16:00:00', '2.00', '2018-03-31', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO teachingrecord VALUES ('f29773bd-7f2e-44af-9000-5c06630d1920', '4d309b83-f780-4e70-9aaa-399c086cff52', '63de6f8f-666b-4127-bf5a-a76bec815c24', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '14:30:00', '17:30:00', '3.00', '2018-03-18', '4d6d538c-babc-4e26-896f-a5fe2d980679');
INSERT INTO teachingrecord VALUES ('31443862-44d3-4889-9197-c46640ce841e', '4d309b83-f780-4e70-9aaa-399c086cff52', '63de6f8f-666b-4127-bf5a-a76bec815c24', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '14:30:00', '17:30:00', '3.00', '2018-03-25', '4d6d538c-babc-4e26-896f-a5fe2d980679');
INSERT INTO teachingrecord VALUES ('452771f6-5910-4c24-98fc-b2b0d33dccc1', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '20:00:00', '22:30:00', '2.00', '2018-03-02', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO teachingrecord VALUES ('f18de599-d627-4927-8890-436a1abc16a9', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '18:30:00', '21:30:00', '3.00', '2018-03-16', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO teachingrecord VALUES ('bb7a1590-12c2-49f6-a946-e6afab392a76', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '3.00', '2018-03-17', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO teachingrecord VALUES ('a3ebc89e-4bee-4c0e-a553-ad9f365d5754', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '22:00:00', '23:00:00', '1.00', '2018-03-27', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO teachingrecord VALUES ('0cbf3d88-7c75-4d96-bcfc-ddb1cabac843', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '22:00:00', '23:00:00', '1.00', '2018-03-28', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO teachingrecord VALUES ('2af1909c-6587-43b4-83de-a379982f122c', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '22:00:00', '23:00:00', '1.00', '2018-03-29', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO teachingrecord VALUES ('4c98b9db-fdaa-4c00-ae88-81337879a1cb', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.50', '2018-03-01', '22882638-4b62-4a67-b8f5-958516571e99');
INSERT INTO teachingrecord VALUES ('18da1614-c0a9-49f3-9e17-be9f0d8f4d8e', 'e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', 'b21addc3-003c-42be-afaa-ab7064d6e144', '14:00:00', '16:05:00', '2.00', '2018-03-31', '8e121a0c-efc2-405e-bff2-36b91309a11c');
INSERT INTO teachingrecord VALUES ('ccf5fd12-fd99-47f7-9a82-85c9cc558bad', 'b66a90f4-e5a6-4ba5-a64c-85221ae34828', '3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '13:35:00', '17:00:00', '3.00', '2018-04-07', '3b816221-7664-4d11-8c12-8ef512514749');
INSERT INTO teachingrecord VALUES ('2551e168-00b0-423f-be2b-153a23dc4a50', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-10', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO teachingrecord VALUES ('8c5a54fc-d99e-4509-91b1-61409d9312b6', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '1.00', '2018-03-14', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO teachingrecord VALUES ('7f8aabe8-5421-49f3-b047-b6361fb83279', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-16', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO teachingrecord VALUES ('a33f5fb0-2866-4da9-886f-44ff4b3f95bc', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '1.00', '2018-03-21', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO teachingrecord VALUES ('5f348bf0-a4c4-43ae-a32d-7644b3efd4da', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-23', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO teachingrecord VALUES ('7ac803b9-081b-4c7e-a01c-c4579adbb43d', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-28', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO teachingrecord VALUES ('642c2913-acd9-45a4-ba6d-a453e15431d8', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '15:30:00', '18:30:00', '3.00', '2018-03-17', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO teachingrecord VALUES ('b7bed81e-4bc3-480e-a447-8b7e3113fdf2', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '14:00:00', '17:00:00', '3.00', '2018-03-18', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO teachingrecord VALUES ('931decd1-5515-40af-ad12-8cb865a09f29', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '13:00:00', '16:00:00', '3.00', '2018-03-19', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO teachingrecord VALUES ('e82ae59b-267b-4837-89cb-9d98a2d56552', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '08:30:00', '11:30:00', '3.00', '2018-03-22', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO teachingrecord VALUES ('24f6c54a-5950-4487-8aa0-8a54cb09b927', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '19:00:00', '21:00:00', '2.00', '2018-03-29', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO teachingrecord VALUES ('f4dd0200-1035-4fed-8566-50b8025a5ebd', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '14:00:00', '16:00:00', '2.00', '2018-03-30', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO teachingrecord VALUES ('5c78cf8f-b10e-4746-a0fd-05809f2d4e56', '8ecacfdd-351a-4381-bf5c-29bf8a815a88', '3b3aed7a-88af-4738-95e9-e6884326dbfa', '27b5a1a7-624f-40e1-9359-9196d0261133', '14:30:00', '16:30:00', '2.00', '2018-03-18', '5375d8bc-7691-4e61-8f78-aabd772a38b0');
INSERT INTO teachingrecord VALUES ('6c7bd1ff-dc37-4d67-8312-001be10a65d2', '6a2f9398-4577-4d5c-925c-b32352714ad2', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '14:00:00', '16:00:00', '2.00', '2018-03-31', 'e55873ed-aa42-4d03-94f9-fc0a1537c3ff');
INSERT INTO teachingrecord VALUES ('d7731307-6650-42ba-9f7e-a9314ef9440a', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '14:00:00', '16:00:00', '2.00', '2018-03-11', 'fd3d86b2-959e-48ca-91a6-28e585bc2b17');
INSERT INTO teachingrecord VALUES ('e86cde7f-830c-48c1-b355-d41bdfaff899', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '14:00:00', '16:00:00', '2.00', '2018-03-18', 'fd3d86b2-959e-48ca-91a6-28e585bc2b17');
INSERT INTO teachingrecord VALUES ('332f90b9-c677-4fbb-840c-f37cbbf8eab7', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '14:00:00', '16:00:00', '2.00', '2018-03-25', 'fd3d86b2-959e-48ca-91a6-28e585bc2b17');
INSERT INTO teachingrecord VALUES ('b51bf472-aa98-43d3-9a17-c3b637b7053e', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-04', '05fdafbf-8e31-44b4-9fc5-b8de289f8b46');
INSERT INTO teachingrecord VALUES ('3d23e26f-38f8-4092-ba4e-0423bcf75098', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-31', '05fdafbf-8e31-44b4-9fc5-b8de289f8b46');
INSERT INTO teachingrecord VALUES ('c818a3ce-2fbc-4202-8a3f-7976de066f3c', 'e3ff9924-100d-4a58-bbca-54d2fad68f69', 'eb4baf58-0f3e-4017-958c-a711c8f05ffb', '2317d1b6-f84d-4633-bc8c-97caaff69e16', null, null, '2.00', '2018-03-31', 'b76c804a-d0f0-478d-87dd-27c4e2d831d3');
INSERT INTO teachingrecord VALUES ('46337f76-50c3-4923-b21f-fa42c653ada7', 'f2eff1fa-55b8-4a6b-8d24-59773b22d648', '5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '19:00:00', '21:00:00', '2.00', '2018-03-29', '776c734a-bce0-48d6-96e5-8184061971a0');
INSERT INTO teachingrecord VALUES ('3093d494-7b25-44f0-913a-9e4c3eba4b9e', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.50', '2018-03-01', 'd668d2b7-1808-419d-868e-9a76e91ddb6b');
INSERT INTO teachingrecord VALUES ('2ef2c925-a0b0-4517-9315-26573aa8497d', '5a88004b-a6ed-4463-aa35-33f6befbff13', 'e37770db-2e80-422e-b4d3-e12cab81145a', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '17:20:00', '19:20:00', '2.00', '2018-03-31', 'fa4a9cad-7de1-49da-9fae-526fab064a66');
INSERT INTO teachingrecord VALUES ('0f87d7f9-9c38-45c7-b042-c38acaed2297', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-10', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO teachingrecord VALUES ('a0449c4d-a84a-4e84-8ac0-d90d35772f02', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-17', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO teachingrecord VALUES ('3beea64e-1b97-4d86-a87d-9e0de3682658', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-24', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO teachingrecord VALUES ('92613e8d-f715-4dbf-bd60-3234f4cece6e', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-31', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO teachingrecord VALUES ('6d60e164-9369-46e6-9048-0a232e11feb8', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '09:20:00', '11:20:00', '2.00', '2018-03-18', 'de89ed26-b005-42e6-870a-e367aac4f28c');
INSERT INTO teachingrecord VALUES ('a06d4777-80a5-4b3a-8129-9e2907961682', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '09:10:00', '11:10:00', '2.00', '2018-03-25', 'de89ed26-b005-42e6-870a-e367aac4f28c');
INSERT INTO teachingrecord VALUES ('d95f0f54-af12-435a-850f-3f852447628a', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '11:05:00', '17:05:00', '4.00', '2018-03-31', '858ca17d-2205-4934-96df-f339b1826c95');
INSERT INTO teachingrecord VALUES ('03573c7a-dbf9-4d48-b4aa-c8db4efba059', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '10:00:00', '13:00:00', '3.00', '2018-03-24', '858ca17d-2205-4934-96df-f339b1826c95');
INSERT INTO teachingrecord VALUES ('2c0a58b5-e08a-4120-93e4-37355921e177', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '13:05:00', '17:05:00', '4.00', '2018-03-17', '858ca17d-2205-4934-96df-f339b1826c95');
INSERT INTO teachingrecord VALUES ('8fae88e7-2466-4638-8bc1-a04ec430f6a7', '4d8192eb-b19b-4526-99b1-3604d27033be', 'fa92b9ba-f1be-4461-b261-2342b3025145', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '0.50', '2018-03-01', '164b3a53-487f-4d0b-8f55-e911ff2ebd7a');

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
INSERT INTO tradecomplains VALUES ('ae779e32-4ea9-43da-8ef7-9d05a2995bd8', '投诉抱怨！', '2018-03-31 03:21:41', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO tradecomplains VALUES ('0edef0da-d2b2-4041-8ae3-1551ffe4a0a0', '老师擅自提价', '2018-04-01 21:37:10', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO tradecomplains VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '老师不备课', '2018-04-11 00:55:24', 'ffb18612-b184-4291-b49f-5336cf8a913b');

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
  PRIMARY KEY (`userId`,`userAccountId`),
  UNIQUE KEY `key1` (`userName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='User表--登录权限';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('15576897865', '15576897865', '666teacher666', '897865', '3', '0', '0', '', '???', 'http://wx.qlogo.cn/mmopen/vi_32/zEzJYYyj4pmDOuBBmYU33kzQZglnIfFnvQ11FRd3CD5az3S2RYSJxuyX9ibvb3ILluH6n2SXOmojo2PxgD3QBrQ/132');
INSERT INTO user VALUES ('admin', 'yduiytech', 'admin', 'xiaoyi520', '0', '0', '1', null, 'admin', null);
INSERT INTO user VALUES ('4bf9257e-198a-4c9d-af02-74eb7a9fa4d3', '19356784567', '4bf9257e-198a-4c9d-af02-74eb7a9fa4d3', '784567', '3', '1', '0', '', '刘嬷嬷', 'a201a42f-c557-4803-9895-5b74068bbcab');
INSERT INTO user VALUES ('24652540-af54-4120-abc8-79d166778f82', '1557876535', '24652540-af54-4120-abc8-79d166778f82', '876535', '3', '1', '0', '', '测试老师2', '7e66a9ab-b9c3-4127-a11e-e3bbf02167d0');
INSERT INTO user VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '18674123456', 'ffb18612-b184-4291-b49f-5336cf8a913b', '123456', '3', '1', '1', 'oQHVE00HAWuiDqD8zQb1Zun4cfxo', '高级老师', '6ea548c5-fc9c-4ccb-9c45-8c4899623819');
INSERT INTO user VALUES ('63617903-e130-40ed-bb2f-b8ff2effb2fe', '15580830349', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '830349', '3', '1', '0', '', '刘国臣测试', '7439dd0a-65c3-4fea-9829-c09a91d433a3');
INSERT INTO user VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '18397413862', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '413862', '3', '1', '0', '', '向嘉博', 'c623daa1-3bdd-4740-a728-f3d43de47d0b');
INSERT INTO user VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '15981671529', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '671529', '3', '1', '1', 'oQHVE0ztpyGDacM17J9gUhsg902A', '谢新茹', '99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7');
INSERT INTO user VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '15367487002', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '487002', '3', '1', '0', '', '冯龙兴', 'd775d3bc-f859-4ff9-bb92-e76669ac5c71');
INSERT INTO user VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '18774839836', '16684d26-3d14-45ff-8c3f-112d739be006', '839836', '3', '1', '1', '', '吴月颖', '21d5d442-8052-43c0-9e23-543018059625');
INSERT INTO user VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '15084762874', 'b21addc3-003c-42be-afaa-ab7064d6e144', '762874', '3', '1', '1', 'oQHVE01BjMXXYEH839qxPpPWzrZE', '崔向影', '456d056f-25ff-4c65-a77e-23a1a2084a52');
INSERT INTO user VALUES ('8124288f-6f07-4cd0-a1ec-37a4e2171adb', '1365785997', '8124288f-6f07-4cd0-a1ec-37a4e2171adb', '785997', '3', '0', '0', '', '麻万明', '2432cad4-aff7-4382-a772-09662b7113b2');
INSERT INTO user VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '18774975537', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '975537', '3', '1', '1', 'oQHVE01yvJYAJ5TFf4Fnb5t60Geo', '陈皓', '9ee049ff-2e20-4655-9d2b-4cb7fe814566');
INSERT INTO user VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '15274810285', '537f3647-8444-4525-94c9-5af57c3f55e8', '810285', '3', '0', '0', '', '徐慧颖', 'e23d7bca-6405-4c49-8b7f-14fe663ee4d4');
INSERT INTO user VALUES ('41816287-35ca-4235-bc89-ba2a2cb4abe1', '18154217405', '41816287-35ca-4235-bc89-ba2a2cb4abe1', '217405', '3', '0', '1', '', '程凡', 'efd06f65-eef6-410f-8f0c-36621ea31a86');
INSERT INTO user VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '18273120371', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '120371', '3', '1', '1', 'oQHVE0z70ZTYwxCF0aiMuj78Ygzo', '朱晓龙', 'c1f40a57-7146-4a06-9e62-c50f6f75bfbf');
INSERT INTO user VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '18373150752', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '150752', '3', '1', '1', 'oQHVE01-IyhcNUk0j0IILikXF9n0', '陈松', 'ca67e8ef-09d5-466b-a796-82622add5cac');
INSERT INTO user VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '13278881603', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '881603', '3', '1', '1', 'oQHVE06Ug-VWriy_SFgycIAut_Ls', '吴洋', '92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f');
INSERT INTO user VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '13545212652', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '212652', '3', '1', '1', 'oQHVE075Ist7NrIynO0jPZthCHwg', '夏欣研', 'e88ffb63-b250-44bc-9083-3324cba01eb0');
INSERT INTO user VALUES ('cbe83e91-b829-4dd8-b852-e1937c450fe9', '17375876043', 'cbe83e91-b829-4dd8-b852-e1937c450fe9', '876043', '3', '1', '1', '', '齐宁', 'e05ca04a-ccca-4ee9-bb9a-383acab20a3c');
INSERT INTO user VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '15111016224', '27b5a1a7-624f-40e1-9359-9196d0261133', '016224', '3', '1', '1', 'oQHVE04YURQ-HcckCC9rhhW3Ctrg', '姜波', 'bc9b247d-70e7-4bcd-b8be-aa4d3721984b');
INSERT INTO user VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '13142008762', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '008762', '3', '1', '1', 'oQHVE0xCd_ZrBK7hdt_qh00vfwD8', '胡潇羽', '4e97532e-22ac-492b-a118-89a5c6b31c3c');
INSERT INTO user VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '18569400050', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '400050', '3', '1', '1', 'oQHVE02FYU1agk2nKZa_gRhfrl58', '吕向前', 'bc0be7a4-38e6-4366-a74e-903d322e4b0a');
INSERT INTO user VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '13635562695', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '562695', '3', '1', '0', 'oQHVE05svxvYq0B41xk9QDCe-n-w', '张文慧', '15a7c808-098b-4e8d-9f19-1022b6d5b387');
INSERT INTO user VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '15111095615', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '095615', '3', '1', '1', 'oQHVE06FdnB1_VBLYhA7W7VORTZE', '左博聪', '4583b87a-1eb3-4cfb-9a47-f1af60d01467');
INSERT INTO user VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '18174451062', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '451062', '3', '0', '0', '', '邢凯迪', '1394814e-1348-4132-90cd-ac01732facd5');
INSERT INTO user VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '13667337306', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '337306', '3', '1', '1', 'oQHVE0wakJf02f3mULTcytPVJqF4', '王宁', '1cc35afa-391b-49dc-a0bb-5f401eaf56f0');
INSERT INTO user VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '17308416020', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '416020', '3', '1', '1', '', '陈娴', '64a7f49d-15db-48dd-9e50-044c15314a33');
INSERT INTO user VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '13909620950', '853a2f31-f902-489c-8b7c-bea062277833', '620950', '3', '1', '0', 'oQHVE0yIjju4ZGFWKRgHqQrqWk_E', '薛潇', '8d4c35e9-dcad-44ff-a297-c55789914717');
INSERT INTO user VALUES ('ec0a82c0-6f1c-4561-b8bf-195cac02796b', '18390987440', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b', '987440', '3', '0', '1', '', '姜蕊', '6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a');
INSERT INTO user VALUES ('e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '18272057850', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '057850', '3', '0', '0', '', '胡嘉欣', 'd6484e68-7a9a-4fca-812c-1bdb64a951e3');
INSERT INTO user VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '18670308329', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '308329', '3', '1', '1', 'oQHVE003YUsVEQ3ZpwLpEYI3VnYI', '李东刚', 'fb43828f-b728-405c-9b0d-a71668e4b977');
INSERT INTO user VALUES ('f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', '15587976896', 'f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', '976896', '3', '0', '0', '', 'ceshiliulaoshi', '961c91e1-0607-4dea-ba8d-c96a1cb18315');
INSERT INTO user VALUES ('b024e47e-4427-4fb2-95d6-3cf3b42aa135', '13657485997', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '485997', '3', '0', '0', '', '麻万明', '5c9eed81-ccfb-4a27-928d-52756f3362d8');
INSERT INTO user VALUES ('dc9620b4-021a-4809-a238-7f83c80b636b', '156748563148', 'dc9620b4-021a-4809-a238-7f83c80b636b', '563148', '3', '0', '0', '', '向梦天', '033df2d9-d160-45df-9020-2be7a32638ce');
INSERT INTO user VALUES ('bba97bb5-2d8c-4977-a009-bf59e82fb6af', '15526459605', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '459605', '3', '1', '0', 'oQHVE04raoFjtMPVA3h6Htz7_CPY', '李莹庆', '0a4afa55-db09-4bd1-8c38-82d93edc6d70');
INSERT INTO user VALUES ('b1f1a4a6-c55a-4e64-a254-53a151b55ce5', '15893095795', 'b1f1a4a6-c55a-4e64-a254-53a151b55ce5', '095795', '3', '0', '0', '', '侯晚晴', 'b2e69f4a-bafa-4a08-b96c-a1706210804a');
INSERT INTO user VALUES ('c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '15574804640', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '804640', '3', '1', '1', 'oQHVE02MP7TCMAEvhKe95COAZZHc', '张荣旺', '258e2acf-80db-4642-ad89-0fcbd6b5731b');
INSERT INTO user VALUES ('76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '18774063134', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '063134', '3', '1', '1', 'oQHVE0xkmL6bB9WV1y3uaZnJL_UE', '秦家琳', 'a2d1cd1d-8b94-455d-8f78-a00ec90cb007');
INSERT INTO user VALUES ('5f53edf6-079a-4874-8e86-4c48d14a268e', '18774879533', '5f53edf6-079a-4874-8e86-4c48d14a268e', '879533', '3', '0', '0', '', '丛颖', '06a6ab17-d1ea-4159-b897-aa5bf2135c2b');
INSERT INTO user VALUES ('a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '13637472576', 'a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '472576', '3', '0', '0', '', '李芳林', '96b37632-2ad5-4100-814c-23d4af389250');
INSERT INTO user VALUES ('2317d1b6-f84d-4633-bc8c-97caaff69e16', '15274816683', '2317d1b6-f84d-4633-bc8c-97caaff69e16', '816683', '3', '1', '1', 'oQHVE04is0pQL2FUiFVShfhvQ8Kk', '高梦梦', '9b563e14-07bc-4416-830b-319274e8d625');
INSERT INTO user VALUES ('436e705c-33e3-4f57-ba31-6eadb0596ac4', '17375895823', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '895823', '3', '0', '0', '', '田江', '53e2656e-8d99-4626-81f7-cbdad18c7b93');
INSERT INTO user VALUES ('fa21938a-9d7f-442e-b9cb-37be8a2535c6', '18223562393', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '562393', '3', '1', '1', 'oQHVE00-AmMcs0WzzENjr5bPOYFc', '廖成意', 'd1da9599-1adb-4075-98d9-297e4902338e');
INSERT INTO user VALUES ('b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '13142175883', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '175883', '3', '1', '1', 'oQHVE013DU_MBE9faBJPzLmV8f40', '高鸶佳', 'ae035324-3e4d-46c4-bdb6-c445af54e5fe');
INSERT INTO user VALUES ('776b3585-eb3d-4be2-85b0-6e833cf6a913', '18329525584', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '525584', '3', '1', '1', 'oQHVE02kDaU7MucAhueX258cmKa8', '王翼', '219524c2-8299-4a2c-8e28-6826f222c219');
INSERT INTO user VALUES ('ebcea06f-b8ea-45f4-9c39-c843d648602c', '18670367305', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '367305', '3', '1', '1', 'oQHVE05fxzDEFXvF7ZynRKSchpQA', '皮文君', 'c9e06263-d7a6-4fde-9d60-50b4c66d3092');
INSERT INTO user VALUES ('01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '15200833373', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '833373', '3', '0', '0', '', '李国伟', '6d608e41-1306-476e-9065-ba38563ca876');
INSERT INTO user VALUES ('c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '17375150595', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '150595', '3', '1', '1', 'oQHVE06m8SUA7vxpVTT68Bw0CIRU', '候昭慧', '6a17e374-b643-4a53-9981-12e58be2a5dc');
INSERT INTO user VALUES ('a2d7bf04-f9f6-4842-99d1-79f17dab142e', '18890090950', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', '090950', '3', '0', '0', '', '董梦季', '6d072ef5-a207-40c9-a4dc-425e7dfc4bfb');
INSERT INTO user VALUES ('44cd5d75-722e-4c03-ac2a-360e5447b97f', '18774861533', '44cd5d75-722e-4c03-ac2a-360e5447b97f', '861533', '3', '0', '0', '', '覃居上', 'c336330e-5f6e-4816-b65b-9ae28027e76f');
INSERT INTO user VALUES ('6c7dae17-0dcb-4263-89b2-ae255883c682', '15084726641', '6c7dae17-0dcb-4263-89b2-ae255883c682', '726641', '3', '0', '0', '', '刘芳', '9690b31a-b878-4d60-8bdf-2e9448e815db');
INSERT INTO user VALUES ('f3ab62e9-bffa-4ca7-950a-9758622de7fc', '18711139337', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '139337', '3', '1', '1', 'oQHVE07-ZhI-kR-ndOKodygSf7Qw', '崔海骕', '76a11d30-fa92-4921-8104-01c128b50ce6');
INSERT INTO user VALUES ('104a8e84-b0a2-4e32-86d4-75d548c87804', '18932449267', '104a8e84-b0a2-4e32-86d4-75d548c87804', '449267', '3', '0', '0', '', '胡英杰', 'd1c43397-001f-400b-ae73-00c6e27461b9');
INSERT INTO user VALUES ('d0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '13027424343', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '424343', '3', '1', '1', 'oQHVE04la8ss0_eO_XHTLnW3foyY', '谷孟阳', '36b74fdc-62d5-4d20-b4c0-3acf7317c745');
INSERT INTO user VALUES ('19115f9c-d7d6-4415-baab-27cb4973ce98', '18319368445', '19115f9c-d7d6-4415-baab-27cb4973ce98', '368445', '3', '1', '1', 'oQHVE02AyTqCVp7pm3g8rAGU001c', '文少芬', '7b0efa43-761c-486c-8285-e33fe6e7e92d');
INSERT INTO user VALUES ('cb25c238-8c4a-4fd3-8142-3e4c39fb0d42', '13278882857', 'cb25c238-8c4a-4fd3-8142-3e4c39fb0d42', '882857', '3', '0', '0', '', '程新', 'c2732e4f-ff7c-4168-a706-467276cc46e4');
INSERT INTO user VALUES ('add3d1b0-204f-4159-90de-e054b94a4b5f', '13007438697', 'add3d1b0-204f-4159-90de-e054b94a4b5f', '438697', '3', '0', '0', '', '王中钰', 'a3b322d6-90f5-4d27-8bb1-351944ce46a3');
INSERT INTO user VALUES ('8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '14747431827', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '431827', '3', '0', '0', '', '王永娟', '025493f4-3031-4d26-a97a-94a1c003f450');
INSERT INTO user VALUES ('70003dbe-38d9-4337-aa5c-3e70efafb7fc', '17830286663', '70003dbe-38d9-4337-aa5c-3e70efafb7fc', '286663', '3', '0', '0', '', '刘建军', 'adc81b8e-602a-4642-aa05-6fd3dce8a200');
INSERT INTO user VALUES ('4913983e-0ead-42d9-8461-e529dc31c684', '18273460875', '4913983e-0ead-42d9-8461-e529dc31c684', '460875', '3', '0', '0', '', '廖森', '15af7999-b5fa-4f1e-8859-0409afdc4688');
INSERT INTO user VALUES ('3f26b978-1499-4da6-bb18-42750bafc010', '15560279613', '3f26b978-1499-4da6-bb18-42750bafc010', '279613', '3', '0', '0', '', '李恩启', 'ea56eb2f-6608-4caa-bc5f-ed70101e17df');
INSERT INTO user VALUES ('51669f73-2654-42db-a7d3-8c51c430a564', '18774878930', '51669f73-2654-42db-a7d3-8c51c430a564', '878930', '3', '0', '0', '', '智亚', '42f7d036-eff6-4000-9f34-bea9f636a643');
INSERT INTO user VALUES ('27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '13516450815', 'b13c5b94-b066-44af-b4c4-145c9d8612a0', '450815', '3', '0', '0', '', '汪永俊', '931bb143-622e-4344-8da2-5a560d236701');
INSERT INTO user VALUES ('fb15c154-134d-4a4b-a12c-c0d761765ef0', '18674819151', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '819151', '3', '1', '1', 'oQHVE0603rPaj7fFU8aum--eliMc', 'hexl2', 'b0367f3d-cea9-4b29-99e8-9296f1f44bab');
INSERT INTO user VALUES ('2c64d354-e9db-441d-8271-061d46813abb', '18006468086', '2c64d354-e9db-441d-8271-061d46813abb', '468086', '3', '1', '1', 'oQHVE0_1ev9Fnu8WCLxN-AD4aKH4', '周彦宏', 'ebf4bed8-529d-4f43-b56c-0b211da1a51d');
INSERT INTO user VALUES ('8a3e0641-de8f-4ec1-ab2d-a72d74e2d485', '18788935643', '8a3e0641-de8f-4ec1-ab2d-a72d74e2d485', '935643', '3', '0', '0', '', null, '14656e76-09ad-4dde-82c2-78fcd9ac07e5');
INSERT INTO user VALUES ('11d525bf-153b-4d1d-9acc-3d06778177c4', '18711009965', '11d525bf-153b-4d1d-9acc-3d06778177c4', '009965', '3', '0', '0', '', 'test_teacher1', 'e713f2c0-ff19-4263-b590-8e4dfde618c2');
INSERT INTO user VALUES ('581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '18670391790', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '391790', '3', '1', '1', 'oQHVE0z4_jisbd0U4oaquaX9PHWw', '胡明杰', '585c7f7b-6b8e-4c97-bf29-78f421169d71');
INSERT INTO user VALUES ('a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '18373177116', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '177116', '3', '1', '1', 'oQHVE090xsPfCCHEtgZuovs5KxeY', '姚明', '16685aa3-7589-40d2-ac2f-63e3c116e99c');
INSERT INTO user VALUES ('db66fd38-466a-4620-9890-6abb10a67a22', '18174679426', 'db66fd38-466a-4620-9890-6abb10a67a22', '679426', '3', '1', '1', 'oQHVE02nMmvMGlH3e5FmeVQojdH4', '秦国民', '80cc1fe4-6aa4-49fe-a71c-0842035e126e');
INSERT INTO user VALUES ('ac37a69a-8f81-4f35-950d-44586364969b', '15874184386', 'ac37a69a-8f81-4f35-950d-44586364969b', '184386', '3', '0', '0', '', '王文丽', '556a2aeb-8c1c-4291-9485-5ed043c866ef');
INSERT INTO user VALUES ('2f6a5e5b-4e32-46d0-8942-5e730051b99a', '13142172699', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '172699', '3', '1', '1', '', '刘林', '6e87011c-d6a7-4bf5-bc18-eb9356d320cd');
INSERT INTO user VALUES ('6620857b-7472-4960-a7f7-870244cad689', '18774884031', '6620857b-7472-4960-a7f7-870244cad689', '884031', '3', '0', '0', '', '吴俊', '7884cfad-89c5-41d3-89df-3b6095e7483a');
INSERT INTO user VALUES ('73818668-89b4-4f28-b928-6b454641aaae', '18670741028', '73818668-89b4-4f28-b928-6b454641aaae', '741028', '3', '0', '0', '', '沈昊晟', '05bd85d1-9e6b-42dd-9889-2ec75721755c');
INSERT INTO user VALUES ('38cf1718-94f3-4b1c-941d-16c27e5f8206', '13278880276', '38cf1718-94f3-4b1c-941d-16c27e5f8206', '880276', '3', '0', '0', '', '孔垂越', '8ff783b7-5748-4bea-b81f-f1969240ac38');
INSERT INTO user VALUES ('510ad3ee-86ab-44ff-a31e-f71ab7b2c27b', '18173676040', '510ad3ee-86ab-44ff-a31e-f71ab7b2c27b', '676040', '3', '1', '1', '', '秦星子', 'de657fcf-fa06-4bab-af63-8c09b03c833d');
INSERT INTO user VALUES ('570cf513-8e9a-4fc8-a8c9-b44ce5ed7198', '17373139972', '570cf513-8e9a-4fc8-a8c9-b44ce5ed7198', '139972', '3', '0', '0', '', '金丹静', 'd64cd4ed-2132-42e2-a0c8-564d06762425');
INSERT INTO user VALUES ('3d7625b8-c5b8-49aa-8a38-4e8ba6753f50', '13187042971', '3d7625b8-c5b8-49aa-8a38-4e8ba6753f50', '042971', '3', '0', '0', '', '刘择安', '2d29ce81-cca3-4c13-8bb4-b7ef76545a43');
INSERT INTO user VALUES ('878cf7d9-1888-40fc-871f-89f3687b34b8', '17375876324', '878cf7d9-1888-40fc-871f-89f3687b34b8', '876324', '3', '0', '0', '', '丘浏阳', '58fd06a7-890c-4221-9689-ea14daa17bd0');
INSERT INTO user VALUES ('3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '13117412195', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '412195', '3', '1', '1', 'oQHVE0wsUmv-at-kljG1J8zYx5Co', '康芯萍', '608bf3da-7dca-4cdd-a996-61b71178701c');
INSERT INTO user VALUES ('a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '18711176332', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '176332', '3', '0', '0', '', '贺亚灵', '5458cd11-e167-440e-9036-b07cefa39ff6');
