/*
Navicat MySQL Data Transfer

Source Server         : xiaoyidb
Source Server Version : 50538
Source Host           : mysql.sql141.cdncenter.net:3306
Source Database       : sq_xiaoyidb

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-05-01 22:09:03
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账户表';

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='年级表';

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
INSERT INTO `lessontrade` VALUES ('964b3a53-487f-4d0b-8f55-e911ff2ebd7a', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '可以，不错！', '2', '0.50', '0', '2018-04-12 10:10:42', '0.00', '21.50');
INSERT INTO `lessontrade` VALUES ('2b6b4656-e866-4710-8be9-ba13049d572c', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', 'd1567855-910a-44b2-950a-58fd9b3338b7', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '拉架', '2', '1.00', '0', '2018-04-08 10:52:46', '0.00', '43.00');
INSERT INTO `lessontrade` VALUES ('797426a4-6322-4a8f-99f0-196d0d1f4421', '-111', 'ffb18612-b184-4291-b49f-5336cf8a913b', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '可以', '3', '5.00', '0', '2018-04-03 10:04:07', '0.00', '1.00');
INSERT INTO `lessontrade` VALUES ('e135d0f9-261c-4809-87cd-99449d06c51c', '-211', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '8c754fe0-ecca-4827-a94d-62c0400e5990', '', '0', '2.00', '1', '2018-04-08 18:30:25', '0.00', '110.00');
INSERT INTO `lessontrade` VALUES ('a7a611b6-feb8-400d-b013-48efab30d3d2', '-111', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '7f376be4-d891-48be-8529-9bc5b85185ca', '很差', '0', '2.00', '-1', '2018-04-08 18:49:16', '0.00', '80.00');
INSERT INTO `lessontrade` VALUES ('c66d5aec-5a9d-445c-893b-5deee871ce86', '-231', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '7f0861de-91ef-4f10-9a4e-f836998778db', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '', '0', '4.00', '1', '2018-04-08 18:49:52', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('decde197-8876-43c1-b27b-4114ccb01330', '-211', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64', null, '0', '8.00', null, '2018-04-08 18:59:25', '0.00', '440.00');
INSERT INTO `lessontrade` VALUES ('96417002-12ad-42dd-9bc3-2de1dd93c5f8', '-311', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '0', '6.00', null, '2018-04-08 19:07:31', '0.00', '450.00');
INSERT INTO `lessontrade` VALUES ('9028c9ed-55f5-4f01-aab8-9925da5320bc', '-311', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '0', '6.00', null, '2018-04-08 19:32:31', '0.00', '450.00');
INSERT INTO `lessontrade` VALUES ('cb738951-e544-4c54-bee9-903f17f835b0', '-211', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c', null, '0', '1.00', null, '2018-04-08 19:42:34', '0.00', '55.00');
INSERT INTO `lessontrade` VALUES ('b7e77aad-fd87-434e-bab0-efb3fc9b56d1', '-231', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'acb5bc9f-534e-4661-b0b5-0054c5827683', null, '0', '4.00', null, '2018-04-08 19:43:27', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('e4207004-b076-4e52-9047-65fc0e553e1e', '-231', '853a2f31-f902-489c-8b7c-bea062277833', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f', null, '0', '6.00', null, '2018-04-08 20:27:38', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('4c939366-dde1-4363-91a7-21bc1501cf05', '-211', '853a2f31-f902-489c-8b7c-bea062277833', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984', '认真，负责的薛老师', '0', '4.00', '1', '2018-04-08 20:31:42', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('5a404b4c-3c80-44c1-842b-9b4c75190d36', '-211', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', 'ccd49818-39cb-4ee1-b792-01688dfbef24', 'ada7441e-2a38-4c03-aee6-234be39aa128', '', '0', '6.00', '1', '2018-04-08 21:01:42', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('9aa61240-bfad-4a42-b152-d54dce3c7a0c', '-211', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '', '0', '8.00', '1', '2018-04-08 21:13:08', '0.00', '440.00');
INSERT INTO `lessontrade` VALUES ('73e3003f-1f76-4713-913a-d99ae762f76e', '-211', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '', '0', '6.00', '1', '2018-04-08 21:49:59', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('301f1e25-81ca-4c8f-ad57-420870770bf2', '-311', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '0', '3.00', null, '2018-04-08 22:32:00', '0.00', '225.00');
INSERT INTO `lessontrade` VALUES ('59858dc7-b38b-4632-b307-810c7b021217', '-211', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984', '', '0', '8.00', '1', '2018-04-08 22:56:24', '0.00', '440.00');
INSERT INTO `lessontrade` VALUES ('15d44df5-4a02-43d1-8704-ccca3e2c6e94', '-211', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c', null, '0', '8.00', null, '2018-04-08 23:15:15', '0.00', '440.00');
INSERT INTO `lessontrade` VALUES ('ea726a02-bf22-404d-b138-792bf6d7785a', '161', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '01bf9958-85e2-49e6-a36c-2840efd63af0', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '', '0', '1.00', '0', '2018-04-09 09:50:22', '0.00', '1.00');
INSERT INTO `lessontrade` VALUES ('ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b', '-211', '377be561-9aaf-43a2-8a0d-9b601021c0e0', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', '', '0', '7.00', '0', '2018-04-09 12:51:01', '0.00', '371.00');
INSERT INTO `lessontrade` VALUES ('25ff3289-06f3-4c30-93bb-d82595ad3332', '111', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '1c3e0941-112b-4664-9463-6865ec8c5912', '205ee471-0dcd-430e-a558-df805a87fb62', null, '0', '4.00', null, '2018-04-09 19:06:56', '0.00', '160.00');
INSERT INTO `lessontrade` VALUES ('5e892622-ac6d-4231-9c39-dba28fbe9e81', '-311', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', 'a36d5226-313a-4af6-9a2c-21700f53bd90', null, '0', '8.00', null, '2018-04-09 19:37:34', '0.00', '600.00');
INSERT INTO `lessontrade` VALUES ('4d6d538c-babc-4e26-896f-a5fe2d980679', '-231', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f', null, '0', '6.00', null, '2018-04-09 20:00:38', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('9d3733cc-1d83-4ec5-91df-3efae2a2112b', '-311', 'db66fd38-466a-4620-9890-6abb10a67a22', '329ec215-a3dc-427d-ac97-95f0cc0a2519', 'f7166d68-6dd7-4b05-b094-31a454c844b9', null, '0', '11.00', null, '2018-04-09 20:03:22', '0.00', '825.00');
INSERT INTO `lessontrade` VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '-111', 'ffb18612-b184-4291-b49f-5336cf8a913b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '', '2', '1.50', '1', '2018-04-10 23:21:11', '0.00', '67.50');
INSERT INTO `lessontrade` VALUES ('8e121a0c-efc2-405e-bff2-36b91309a11c', '211', 'b21addc3-003c-42be-afaa-ab7064d6e144', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951', null, '0', '2.00', null, '2018-04-09 21:33:22', '0.00', '100.00');
INSERT INTO `lessontrade` VALUES ('3b816221-7664-4d11-8c12-8ef512514749', '-231', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', 'ab5befbe-9b50-4c79-9496-0edd136839fc', null, '2', '3.00', null, '2018-04-09 21:36:11', '0.00', '165.00');
INSERT INTO `lessontrade` VALUES ('c91a1407-50d8-46ff-b469-4e3bdb2585e6', '-311', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', 'daa3f486-e6ce-4b50-ad09-519dac09757e', '', '0', '10.00', '1', '2018-04-09 21:45:32', '0.00', '750.00');
INSERT INTO `lessontrade` VALUES ('604fe578-0c4f-459a-a5c6-44549a4f0d92', '-231', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', null, '0', '16.00', null, '2018-04-09 21:57:58', '0.00', '880.00');
INSERT INTO `lessontrade` VALUES ('5375d8bc-7691-4e61-8f78-aabd772a38b0', '-311', '27b5a1a7-624f-40e1-9359-9196d0261133', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '71ca2567-8288-433a-98ed-bbf3c00b9659', null, '0', '2.00', null, '2018-04-09 22:06:33', '0.00', '150.00');
INSERT INTO `lessontrade` VALUES ('e55873ed-aa42-4d03-94f9-fc0a1537c3ff', '-211', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64', '', '0', '2.00', '1', '2018-04-09 22:35:10', '0.00', '110.00');
INSERT INTO `lessontrade` VALUES ('fd3d86b2-959e-48ca-91a6-28e585bc2b17', '-211', '19115f9c-d7d6-4415-baab-27cb4973ce98', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', null, '0', '6.00', null, '2018-04-10 16:35:09', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('05fdafbf-8e31-44b4-9fc5-b8de289f8b46', '-211', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '7cd1b3ff-571d-430b-b77e-92d1712a8418', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '', '0', '4.00', '1', '2018-04-10 21:21:42', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('b76c804a-d0f0-478d-87dd-27c4e2d831d3', '-231', '2317d1b6-f84d-4633-bc8c-97caaff69e16', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', null, '0', '2.00', null, '2018-04-10 21:59:41', '0.00', '110.00');
INSERT INTO `lessontrade` VALUES ('776c734a-bce0-48d6-96e5-8184061971a0', '-311', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '87561e40-93ca-436f-90a8-eef75fe735b3', 'e8aedf60-f545-4165-8aac-be143e7394d8', '提前准备看下她的错题，看怎么针对解决 谢谢', '0', '2.00', '1', '2018-04-10 23:09:46', '0.00', '150.00');
INSERT INTO `lessontrade` VALUES ('fa4a9cad-7de1-49da-9fae-526fab064a66', '211', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951', '5天后,系统默认好评！', '0', '2.00', '1', '2018-04-11 00:02:09', '0.00', '100.00');
INSERT INTO `lessontrade` VALUES ('b091936b-3866-4e98-8ac6-9d72df59a56f', '-211', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '5天后,系统默认好评！', '0', '8.00', '1', '2018-04-11 13:29:51', '0.00', '440.00');
INSERT INTO `lessontrade` VALUES ('de89ed26-b005-42e6-870a-e367aac4f28c', '-311', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '79c93b34-1803-4808-8053-447c66039516', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '5天后,系统默认好评！', '0', '4.00', '1', '2018-04-11 20:32:27', '0.00', '300.00');
INSERT INTO `lessontrade` VALUES ('858ca17d-2205-4934-96df-f339b1826c95', '-211', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '', '0', '11.00', '1', '2018-04-11 21:54:26', '0.00', '605.00');
INSERT INTO `lessontrade` VALUES ('b6834d89-855e-43b9-bebd-03f7ed7df8d1', '-311', '73818668-89b4-4f28-b928-6b454641aaae', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', '', '0', '3.00', '1', '2018-04-14 16:29:07', '0.00', '225.00');
INSERT INTO `lessontrade` VALUES ('6a9ce13b-43bc-4087-8559-17d2067c8377', '-311', '6620857b-7472-4960-a7f7-870244cad689', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', '', '0', '3.00', '1', '2018-04-14 21:23:37', '0.00', '225.00');
INSERT INTO `lessontrade` VALUES ('10f187d9-86bb-4b6b-bc41-0077feff67eb', '-231', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '90377ef4-f065-4fe0-9318-a093c74c800a', null, '0', '7.00', null, '2018-04-15 10:44:03', '0.00', '385.00');
INSERT INTO `lessontrade` VALUES ('499c228e-9f60-404f-b286-83fc47083580', '-211', '537f3647-8444-4525-94c9-5af57c3f55e8', 'e6058b90-7154-4677-8172-185b1e30f894', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', '', '0', '6.00', '1', '2018-04-16 10:30:56', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('131db198-5ee5-40d5-a003-b88e5751b0bb', '-211', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '8478bec7-44bc-4e19-b03e-445828affb23', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '', '0', '15.00', '1', '2018-05-01 08:09:03', '0.00', '825.00');
INSERT INTO `lessontrade` VALUES ('910b132c-352a-4000-b1b9-0e9fabbbb9ff', '-311', '44cd5d75-722e-4c03-ac2a-360e5447b97f', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', null, '1', '3.00', null, '2018-05-01 10:06:12', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('be7f016d-d506-4994-871c-693597d9142a', '-211', '138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '87713b29-371d-453c-a3a6-99a13d45ef0f', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '', '0', '4.00', '1', '2018-05-01 10:53:05', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('80e0f1b3-e20f-4619-b722-f5f3ee4d4706', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '可以脱', '2', '1.00', '1', '2018-05-01 11:35:42', '0.00', '45.00');
INSERT INTO `lessontrade` VALUES ('9a994df4-d392-4b3c-aea9-4388586fc6b5', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', '4426451c-de65-4564-8ddf-2bbee72841ae', '7f376be4-d891-48be-8529-9bc5b85185ca', null, '1', '2.00', null, '2018-05-01 11:38:16', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('a625ba8d-8aa2-49f0-9520-9d788bc0d653', '-161', 'ffb18612-b184-4291-b49f-5336cf8a913b', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', null, '1', '2.00', null, '2018-05-01 11:40:56', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('da13ac4e-c23b-4e89-8d15-c307f156b95f', '213', '16684d26-3d14-45ff-8c3f-112d739be006', '5cc50b32-8179-458f-9663-8704d9ebddff', '9b2daa11-9851-41f0-8365-dc3ce439c584', null, '1', '2.00', null, '2018-05-01 11:53:36', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('bed82131-ef62-4dd9-8d5a-6a94c7d07195', '-211', '853a2f31-f902-489c-8b7c-bea062277833', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984', '', '0', '7.00', '1', '2018-05-01 11:56:48', '0.00', '385.00');
INSERT INTO `lessontrade` VALUES ('6117d393-f201-49c3-994f-4793911ae223', '-211', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '', '0', '8.00', '1', '2018-05-01 11:58:50', '0.00', '440.00');
INSERT INTO `lessontrade` VALUES ('919103bd-1b71-49e9-9c8b-61172c85a958', '-231', '853a2f31-f902-489c-8b7c-bea062277833', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f', null, '1', '7.50', null, '2018-05-01 11:59:07', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('48b6f75f-c59a-41d2-94f6-4d5694362dca', '-231', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'acb5bc9f-534e-4661-b0b5-0054c5827683', null, '1', '24.00', null, '2018-05-01 12:03:09', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('31d8f749-9d61-4c46-b898-f39aaca8ce78', '-311', '73818668-89b4-4f28-b928-6b454641aaae', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', '', '0', '5.00', '1', '2018-05-01 12:03:29', '0.00', '375.00');
INSERT INTO `lessontrade` VALUES ('81965c44-34f3-4eb7-b86c-dc868de6019d', '-231', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', null, '1', '6.00', null, '2018-05-01 12:13:42', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('49d2f330-bc86-41e0-8c7d-300277fe4aaf', '-111', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', null, '1', '4.00', null, '2018-05-01 12:23:10', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('c14b02d3-65aa-4a96-8ba4-700a87a1892e', '311', 'b8ef7e22-3952-403d-af92-dfdcbe250073', '60c4cb47-c262-4337-8639-f4c38e525474', 'c69ae58f-dfc3-4278-bd90-dadabbd89860', null, '1', '2.00', null, '2018-05-01 12:37:10', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('e746feda-1f01-413a-949b-ad4cbcf930e2', '-211', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984', '', '0', '6.00', '1', '2018-05-01 12:44:35', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('be20e8d1-4717-4ff9-b339-776c28a60dbf', '-211', '771d1e22-ae10-46fc-92af-e7eb2df326b4', 'cd6dfb39-c2da-4fb3-a979-d63f4163da67', '20534a99-a8bf-4938-b70f-d50230796176', '老师非常敬业，孩子很喜欢', '0', '5.00', '1', '2018-05-01 12:48:41', '0.00', '275.00');
INSERT INTO `lessontrade` VALUES ('e1177e52-2982-4dd6-acc2-afab0912bc12', '-211', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '7cd1b3ff-571d-430b-b77e-92d1712a8418', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', null, '1', '7.00', null, '2018-05-01 12:55:51', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('d5aba5bf-dbee-4c44-bc19-856c8fb4a028', '-211', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', 'e4220f11-1e90-45b1-985a-3317cef45f4a', null, '1', '8.50', null, '2018-05-01 13:00:00', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('4d169003-0a87-4419-bf67-a9652d7a04cf', '211', 'b21addc3-003c-42be-afaa-ab7064d6e144', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951', null, '1', '6.00', null, '2018-05-01 13:01:46', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('c41a7d79-d132-4d12-94ab-766269c6ec88', '-231', '150ee67b-967a-42d4-9e35-1ca1288624ec', '85fab9b6-cf10-4c97-8a4a-09b7a279a976', 'f227e1c1-2002-456c-ac75-bb01e4a17290', '', '2', '4.00', '1', '2018-05-01 13:12:46', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('99df6085-6cb5-4fdf-8f7c-fd205009db2d', '-231', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '90377ef4-f065-4fe0-9318-a093c74c800a', '', '0', '3.00', '0', '2018-05-01 13:14:34', '0.00', '159.00');
INSERT INTO `lessontrade` VALUES ('e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6', '-231', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '279c6d0d-1a69-4155-927d-e50faf8787b6', '5138ed9b-82af-4252-9c10-0943693449ae', null, '1', '8.00', null, '2018-05-01 13:15:48', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('9119c7df-496f-452b-bdc2-81ebb14e0031', '-211', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '', '0', '6.00', '1', '2018-05-01 13:21:59', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('57f309f4-9ec1-4959-840b-6601ca4d9079', '-231', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', 'a59f7cd7-d935-4372-b153-4b8f5daabd03', '2f79708d-ad15-454f-8bc4-7e610c732d3f', '再接再厉，看期中考试', '0', '17.50', '1', '2018-05-01 13:36:22', '0.00', '962.50');
INSERT INTO `lessontrade` VALUES ('72f637f3-2368-4b98-a20b-a82fb2f63614', '-211', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '8c754fe0-ecca-4827-a94d-62c0400e5990', '', '0', '12.50', '1', '2018-05-01 13:37:27', '0.00', '687.50');
INSERT INTO `lessontrade` VALUES ('1445e16c-db2f-4659-a470-568e5eef6766', '-211', 'a295affa-be14-48e3-aece-dfad1ea22b6a', 'b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '3525470e-60fb-490c-9b85-7c7b10998328', '', '0', '5.00', '1', '2018-05-01 13:42:20', '0.00', '275.00');
INSERT INTO `lessontrade` VALUES ('06033fe7-73f0-4c7e-b653-2579c483033f', '-311', '481db1db-22aa-471a-b321-b69143da727f', '3a614d80-f7bb-46d4-89da-23080e97ea02', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', null, '1', '5.00', null, '2018-05-01 13:45:33', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('64c6f291-8c5d-419a-bc65-3e7f461483ff', '-211', '6c7dae17-0dcb-4263-89b2-ae255883c682', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '01df4fe5-315c-4db2-ab49-c314c9f891d3', null, '1', '8.00', null, '2018-05-01 13:46:44', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('afb119c7-ca8f-421a-82f9-a946635273f7', '-211', '58a28496-ac22-42cb-991e-899bc221076e', '352ae049-419b-4b88-9a30-dea9e528480e', '2da7bbcb-aeff-40d8-90ea-3eab9575f076', null, '1', '4.00', null, '2018-05-01 14:09:39', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('c26474c5-c5c5-42fa-a94a-88f318bfd288', '-211', '9321916c-1b48-4d88-84eb-1303b2efd648', '74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', 'e902e3a3-6c25-4063-b4cb-dea3ce2de31b', '', '2', '4.50', '1', '2018-05-01 14:36:31', '0.00', '247.50');
INSERT INTO `lessontrade` VALUES ('a7ba65db-23a0-4d41-84f1-a334525e4adb', '-311', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144', null, '1', '6.00', null, '2018-05-01 15:15:41', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('3b636c17-80b6-4948-b071-e723ca266185', '-231', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '', '2', '10.00', '1', '2018-05-01 15:26:56', '0.00', '550.00');
INSERT INTO `lessontrade` VALUES ('bf2ccb37-6fc7-44c3-bb14-f997624b41c1', '-211', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '705dc6e9-2639-4126-b0b1-1826d29eb1b9', 'ced058e2-c909-4579-9364-0dee8b1f8ef3', null, '1', '8.00', null, '2018-05-01 15:27:20', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('b9623f4f-e5ae-4f49-a531-59cc431c6574', '-211', '0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '9f20b54b-df98-4ce1-9997-8b51e6266f78', 'd1541f36-0bb8-41f1-9b3d-57ed642bb13c', '', '2', '0.00', '1', '2018-05-01 15:27:53', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('aca000ef-ec2d-4753-99c9-9195c41e182e', '-231', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '279c6d0d-1a69-4155-927d-e50faf8787b6', '5138ed9b-82af-4252-9c10-0943693449ae', null, '1', '6.00', null, '2018-05-01 15:39:30', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('afe806b3-6f98-4eec-9f1e-5f820a6ddfd3', '-231', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', null, '1', '26.00', null, '2018-05-01 17:54:30', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('23db0e70-81c2-45b1-b09e-15d4346f6265', '-311', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', 'daa3f486-e6ce-4b50-ad09-519dac09757e', null, '1', '6.00', null, '2018-05-01 18:26:43', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('2e767d76-bfd1-4b26-9eba-fd162d04bed4', '-231', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '7f0861de-91ef-4f10-9a4e-f836998778db', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', null, '1', '10.00', null, '2018-05-01 19:31:04', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('5fae87e3-9765-488b-b853-096fe8764be4', '-311', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '0cf74357-767e-4a3b-8202-943436f4995c', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '', '2', '2.00', '0', '2018-05-01 19:41:52', '0.00', '146.00');
INSERT INTO `lessontrade` VALUES ('4d6234b4-2f45-4eda-b5f4-8a49e8320e38', '-331', '19115f9c-d7d6-4415-baab-27cb4973ce98', '48659507-3880-4c28-9788-55f1808ac1f2', '610d212d-af5a-4c70-8098-aaece4e298ca', '', '0', '16.00', '1', '2018-05-01 19:47:57', '0.00', '1200.00');
INSERT INTO `lessontrade` VALUES ('04239796-feec-4efb-81c5-ee2cb08b49b9', '-311', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '79c93b34-1803-4808-8053-447c66039516', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', null, '1', '8.00', null, '2018-05-01 19:52:15', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('a30e5f3f-3cf5-4439-94ae-666ac78bc050', '-211', '19115f9c-d7d6-4415-baab-27cb4973ce98', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '', '0', '6.00', '0', '2018-05-01 20:00:27', '0.00', '318.00');
INSERT INTO `lessontrade` VALUES ('73dccda3-543b-4441-8bf0-e9628f179524', '-211', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64', '', '2', '4.00', '1', '2018-05-01 20:26:03', '0.00', '220.00');
INSERT INTO `lessontrade` VALUES ('2180bcc5-a7eb-4239-b8af-889d3e48cbe5', '-211', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '', '0', '6.00', '1', '2018-05-01 21:03:20', '0.00', '330.00');
INSERT INTO `lessontrade` VALUES ('35921486-52bc-4a00-8c36-5971ad136feb', '-311', 'db66fd38-466a-4620-9890-6abb10a67a22', '329ec215-a3dc-427d-ac97-95f0cc0a2519', 'f7166d68-6dd7-4b05-b094-31a454c844b9', null, '1', '21.50', null, '2018-05-01 21:24:00', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf', '-231', 'df1de484-42a5-4545-bb78-ecef591a7757', '5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '128ddbf4-08fa-4968-b807-4805003e6921', null, '1', '8.00', null, '2018-05-01 21:47:26', '0.00', '0.00');
INSERT INTO `lessontrade` VALUES ('7dffb4c4-d660-43a5-b2dd-992f114c4798', '-311', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '1886a744-3e9e-4bce-b586-ac1c0027dd70', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '', '0', '4.00', '1', '2018-05-01 21:47:36', '0.00', '300.00');
INSERT INTO `lessontrade` VALUES ('ac23f69e-1c3e-4d13-a916-d6eb051fee20', '-111', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '棒棒棒', '2', '1.00', '1', '2018-05-01 21:49:33', '0.00', '45.00');
INSERT INTO `lessontrade` VALUES ('d4b55546-74f3-4efe-9f5e-71b7c0e74b78', '-211', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '773ea73a-5135-41f4-8000-55901b2015a2', '79e4bdc8-874d-4cb2-a907-58215f7af76e', null, '1', '6.50', null, '2018-05-01 21:54:14', '0.00', '0.00');

-- ----------------------------
-- Table structure for lessontradesum
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
INSERT INTO `lessontradesum` VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '9.00', '1.00', '0.00', '16.00', '1');
INSERT INTO `lessontradesum` VALUES ('776b3585-eb3d-4be2-85b0-6e833cf6a913', '18.50', '18.50', '0.00', '18.50', '1097.5');
INSERT INTO `lessontradesum` VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '3.00', '7.00', '0.00', '7.00', '241');
INSERT INTO `lessontradesum` VALUES ('ebcea06f-b8ea-45f4-9c39-c843d648602c', '6.00', '4.00', '0.00', '16.00', '220');
INSERT INTO `lessontradesum` VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '4.00', '8.00', '0.00', '12.00', '440');
INSERT INTO `lessontradesum` VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '0.00', '6.00', '0.00', '12.00', '450');
INSERT INTO `lessontradesum` VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '0.00', '6.00', '0.00', '6.00', '450');
INSERT INTO `lessontradesum` VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '0.00', '1.00', '0.00', '1.00', '55');
INSERT INTO `lessontradesum` VALUES ('fa21938a-9d7f-442e-b9cb-37be8a2535c6', '0.00', '4.00', '0.00', '28.00', '220');
INSERT INTO `lessontradesum` VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '11.00', '17.00', '0.00', '24.50', '935');
INSERT INTO `lessontradesum` VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '6.00', '6.00', '0.00', '6.00', '330');
INSERT INTO `lessontradesum` VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '16.00', '16.00', '0.00', '16.00', '440');
INSERT INTO `lessontradesum` VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '12.00', '12.00', '0.00', '12.00', '660');
INSERT INTO `lessontradesum` VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '0.00', '3.00', '0.00', '3.00', '225');
INSERT INTO `lessontradesum` VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '18.00', '26.00', '0.00', '25.00', '1430');
INSERT INTO `lessontradesum` VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '0.00', '8.00', '0.00', '8.00', '440');
INSERT INTO `lessontradesum` VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '7.00', '7.00', '0.00', '7.00', '371');
INSERT INTO `lessontradesum` VALUES ('a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '0.00', '8.00', '0.00', '8.00', '600');
INSERT INTO `lessontradesum` VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '0.00', '6.00', '0.00', '6.00', '330');
INSERT INTO `lessontradesum` VALUES ('db66fd38-466a-4620-9890-6abb10a67a22', '0.00', '11.00', '0.00', '32.50', '825');
INSERT INTO `lessontradesum` VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '0.00', '2.00', '0.00', '8.00', '100');
INSERT INTO `lessontradesum` VALUES ('2f6a5e5b-4e32-46d0-8942-5e730051b99a', '0.00', '0.00', '0.00', '3.00', '0');
INSERT INTO `lessontradesum` VALUES ('581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '10.00', '10.00', '0.00', '16.00', '750');
INSERT INTO `lessontradesum` VALUES ('c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '0.00', '16.00', '0.00', '16.00', '880');
INSERT INTO `lessontradesum` VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '0.00', '2.00', '0.00', '2.00', '150');
INSERT INTO `lessontradesum` VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '2.00', '2.00', '0.00', '2.00', '110');
INSERT INTO `lessontradesum` VALUES ('19115f9c-d7d6-4415-baab-27cb4973ce98', '22.00', '28.00', '0.00', '28.00', '1848');
INSERT INTO `lessontradesum` VALUES ('2317d1b6-f84d-4633-bc8c-97caaff69e16', '0.00', '2.00', '0.00', '2.00', '110');
INSERT INTO `lessontradesum` VALUES ('c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '2.00', '2.00', '0.00', '2.00', '150');
INSERT INTO `lessontradesum` VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '2.00', '2.00', '0.00', '2.00', '100');
INSERT INTO `lessontradesum` VALUES ('3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '8.00', '8.00', '0.00', '8.00', '440');
INSERT INTO `lessontradesum` VALUES ('f3ab62e9-bffa-4ca7-950a-9758622de7fc', '4.00', '4.00', '0.00', '12.00', '300');
INSERT INTO `lessontradesum` VALUES ('d0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '34.50', '34.50', '0.00', '34.50', '1897.5');
INSERT INTO `lessontradesum` VALUES ('73818668-89b4-4f28-b928-6b454641aaae', '8.00', '8.00', '0.00', '8.00', '600');
INSERT INTO `lessontradesum` VALUES ('6620857b-7472-4960-a7f7-870244cad689', '3.00', '3.00', '0.00', '3.00', '225');
INSERT INTO `lessontradesum` VALUES ('a2d7bf04-f9f6-4842-99d1-79f17dab142e', '10.00', '10.00', '0.00', '10.00', '544');
INSERT INTO `lessontradesum` VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '6.00', '6.00', '0.00', '6.00', '330');
INSERT INTO `lessontradesum` VALUES ('01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '15.00', '15.00', '0.00', '15.00', '825');
INSERT INTO `lessontradesum` VALUES ('44cd5d75-722e-4c03-ac2a-360e5447b97f', '0.00', '0.00', '0.00', '3.00', '0');
INSERT INTO `lessontradesum` VALUES ('138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '4.00', '4.00', '0.00', '4.00', '220');
INSERT INTO `lessontradesum` VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '0.00', '0.00', '0.00', '2.00', '0');
INSERT INTO `lessontradesum` VALUES ('76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '0.00', '0.00', '0.00', '10.00', '0');
INSERT INTO `lessontradesum` VALUES ('b8ef7e22-3952-403d-af92-dfdcbe250073', '0.00', '0.00', '0.00', '2.00', '0');
INSERT INTO `lessontradesum` VALUES ('771d1e22-ae10-46fc-92af-e7eb2df326b4', '5.00', '5.00', '0.00', '5.00', '275');
INSERT INTO `lessontradesum` VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '0.00', '0.00', '0.00', '8.50', '0');
INSERT INTO `lessontradesum` VALUES ('150ee67b-967a-42d4-9e35-1ca1288624ec', '8.00', '4.00', '0.00', '4.00', '220');
INSERT INTO `lessontradesum` VALUES ('48931aa9-b9dc-47af-b19c-dc4af5632c90', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO `lessontradesum` VALUES ('a295affa-be14-48e3-aece-dfad1ea22b6a', '5.00', '5.00', '0.00', '5.00', '275');
INSERT INTO `lessontradesum` VALUES ('481db1db-22aa-471a-b321-b69143da727f', '0.00', '0.00', '0.00', '5.00', '0');
INSERT INTO `lessontradesum` VALUES ('6c7dae17-0dcb-4263-89b2-ae255883c682', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO `lessontradesum` VALUES ('58a28496-ac22-42cb-991e-899bc221076e', '0.00', '0.00', '0.00', '4.00', '0');
INSERT INTO `lessontradesum` VALUES ('9321916c-1b48-4d88-84eb-1303b2efd648', '4.50', '0.00', '0.00', '4.50', '0');
INSERT INTO `lessontradesum` VALUES ('bba97bb5-2d8c-4977-a009-bf59e82fb6af', '20.00', '10.00', '0.00', '10.00', '530');
INSERT INTO `lessontradesum` VALUES ('ebedc957-1970-4c7f-a114-aadf4d8dc953', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO `lessontradesum` VALUES ('0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '0.00', '0.00', '0.00', '0.00', '0');
INSERT INTO `lessontradesum` VALUES ('b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '0.00', '0.00', '0.00', '6.00', '0');
INSERT INTO `lessontradesum` VALUES ('a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '0.00', '0.00', '0.00', '26.00', '0');
INSERT INTO `lessontradesum` VALUES ('df1de484-42a5-4545-bb78-ecef591a7757', '0.00', '0.00', '0.00', '8.00', '0');
INSERT INTO `lessontradesum` VALUES ('27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '1.00', '0.00', '0.00', '1.00', '0');
INSERT INTO `lessontradesum` VALUES ('436e705c-33e3-4f57-ba31-6eadb0596ac4', '0.00', '0.00', '0.00', '6.50', '0');

-- ----------------------------
-- Table structure for lessontype
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
INSERT INTO `lessontype` VALUES ('6ZSU4vGx8zr8ve3fmYgKnG2AdljmSGIhjzcB', '-111', '30', '1', '11', '2400', '小一语文', '小一~小五', '0', '1800', '0', '60');
INSERT INTO `lessontype` VALUES ('fKNfCYY0CKZEUn5lxJQulu2x753QKIIYUWew', '111', '30', '0', '11', '2100', '小一语文', '小一~小五', '0', '1650', '0', '55');
INSERT INTO `lessontype` VALUES ('e4SLyinfhVHj2kX9iumkMNwrnBgTR5egiVRl', '-111', '40', '1', '11', '3200', '小一语文', '小一~小五', '0', '2360', '0', '60');
INSERT INTO `lessontype` VALUES ('e4SLyinfhVHj2kX9iumkMNwrnBgTR5egiVRl', '111', '40', '0', '11', '2800', '小一语文', '小一~小五', '0', '2160', '0', '55');
INSERT INTO `lessontype` VALUES ('grebHy0i9lXWJIQBKiZI0ix5Howj8NoaFWpB', '-111', '60', '1', '11', '4800', '小一语文', '小一~小五', '0', '3420', '0', '60');
INSERT INTO `lessontype` VALUES ('Z8AjJpWdv3sEBjMhFg3jL0usxUf8dCiJmOgl', '111', '60', '0', '11', '4200', '小一语文', '小一~小五', '0', '3120', '0', '55');
INSERT INTO `lessontype` VALUES ('tvre4SmomHgylTQwUrriiIO1Ajxdt8fNbdkt', '-111', '80', '1', '11', '6400', '小一语文', '小一~小五', '0', '4400', '0', '60');
INSERT INTO `lessontype` VALUES ('dLlEzMfBk63FlftsTmLvKZHFJczpLPU7NTGr', '111', '80', '0', '11', '5600', '小一语文', '小一~小五', '0', '4000', '0', '55');
INSERT INTO `lessontype` VALUES ('kwFOOVtgbTZ5FkyKtJmKHGpOs51ruDtiR14q', '-161', '30', '1', '16', '2400', '小六语文', '小六', '0', '1950', '0', '65');
INSERT INTO `lessontype` VALUES ('sBYqpOKbAu8h2RB3CnWbBB4f5oBhaaiYDpg6', '161', '30', '0', '16', '0.01', '小六语文', '小六', '0', '0.01', '0', '60');
INSERT INTO `lessontype` VALUES ('dEClBONtEcLPPENUKHwMK4M4AtToAXFypAdO', '-161', '40', '1', '16', '3200', '小六语文', '小六', '0', '2560', '0', '65');
INSERT INTO `lessontype` VALUES ('1EiYyFHBsZzo64SzZbEvNzRy19q9PuP4vpMg', '161', '40', '0', '16', '2360', '小六语文', '小六', '0', '2360', '0', '60');
INSERT INTO `lessontype` VALUES ('T0Rtfb0riTSXDKSlrhrd7B6gaU6QbrkDSrsT', '-161', '60', '1', '16', '4800', '小六语文', '小六', '0', '3720', '0', '65');
INSERT INTO `lessontype` VALUES ('Ud4053RB0GLmkuAjGeDXOubzu3o7STwAbERS', '161', '60', '0', '16', '3420', '小六语文', '小六', '0', '3420', '0', '60');
INSERT INTO `lessontype` VALUES ('3GTU4HPeNeKXS8KDeBOUd9QxriiQok4p9cmG', '-161', '80', '1', '16', '6800', '小六语文', '小六', '0', '4800', '0', '65');
INSERT INTO `lessontype` VALUES ('2L03wGw6w6Eu2dKrSjiSk59TZfEkw5MGNgwL', '161', '80', '0', '16', '4400', '小六语文', '小六', '0', '4400', '0', '60');
INSERT INTO `lessontype` VALUES ('7Giqa6CML7ZqZCiD98ecBeLeFqtMec4m', '-231', '21', '1', '23', '2100', null, '初三', '1', '1827', '0', null);
INSERT INTO `lessontype` VALUES ('LX8ojxiFLt7WqLg4XLXnnhOUUQJCsuTG', '-211', '30', '1', '21', '2700', null, '初一、初二', '1', '2268', '0', null);
INSERT INTO `lessontype` VALUES ('onkfWubxFSXvxFXiJqugn7fkSAFhvjqr', '211', '30', '0', '21', '2700', null, '初一、初二', '1', '2100', '0', null);
INSERT INTO `lessontype` VALUES ('OBlITHGJ6U1jODLLfblGqWfdKYgYvcB4', '-211', '40', '1', '21', '3600', null, '初一、初二', '1', '2960', '0', null);
INSERT INTO `lessontype` VALUES ('QyreWpzChyhzlqmQm9VMjNIRCLoNxE1T', '211', '40', '0', '21', '3600', null, '初一、初二', '1', '2760', '0', null);
INSERT INTO `lessontype` VALUES ('g0ko65FJHsK0BOyLMWTCO9gmoYOWuJ8Q', '-211', '60', '1', '21', '5400', null, '初一、初二', '1', '4320', '0', null);
INSERT INTO `lessontype` VALUES ('lMk3hVFalE0SehyBDiix4rrHJ5JNcH9j', '211', '60', '0', '21', '5400', null, '初一、初二', '1', '4020', '0', null);
INSERT INTO `lessontype` VALUES ('26dUynrczY7MOWVaGwsABmuPrmL1QKNY', '-211', '80', '1', '21', '7200', null, '初一、初二', '1', '5600', '0', null);
INSERT INTO `lessontype` VALUES ('Z99vun9gprh6ENBUw0CIHkG6EUArMM85', '211', '80', '0', '21', '7200', null, '初一、初二', '1', '5200', '0', null);
INSERT INTO `lessontype` VALUES ('iuPxWpGiKd5OV2nLys4uO34813xGGxMe', '-231', '30', '1', '23', '3000', null, '初三', '1', '2568', '0', null);
INSERT INTO `lessontype` VALUES ('SaygAAH057sYjJK19JQY2Aw0o0xk2oou', '231', '30', '0', '23', '3000', null, '初三', '1', '2400', '0', null);
INSERT INTO `lessontype` VALUES ('RSSQKeOhTjAUFfdTOER7wIcFLHUQRJWd', '-231', '40', '1', '23', '4000', null, '初三', '1', '3360', '0', null);
INSERT INTO `lessontype` VALUES ('wBZQsRxkkSEAdyKYXEMH2859ToDR3tJw', '231', '40', '0', '23', '4000', null, '初三', '1', '3160', '0', null);
INSERT INTO `lessontype` VALUES ('t3kIECrml2YmrVEkiXQMONKXdjNB1ZDU', '-231', '60', '1', '23', '6000', null, '初三', '1', '4920', '0', null);
INSERT INTO `lessontype` VALUES ('6IhggfQBzjUfmHcH4Zs0F9foAPZtkayM', '231', '60', '0', '23', '6000', null, '初三', '1', '4620', '0', null);
INSERT INTO `lessontype` VALUES ('fBFN17FdowxpjxOcEXWNzWBTOoQuDVLm', '-231', '80', '1', '23', '8000', null, '初三', '1', '6400', '0', null);
INSERT INTO `lessontype` VALUES ('7Giqa6CML7ZqZCiD98UcBJLNFqtMec4m', '231', '80', '0', '23', '8000', null, '初三', '1', '6000', '0', null);
INSERT INTO `lessontype` VALUES ('wSwkP0hU3SPp2GG4fXxZRmIBNAX5CsMb', '-311', '30', '1', '31', '3300', null, '高一、高二', '1', '2700', '0', null);
INSERT INTO `lessontype` VALUES ('hDdiXd9ocCF38MBpmA1vcEsStQYz4Y8S', '311', '30', '0', '31', '3300', null, '高一、高二', '1', '2550', '0', null);
INSERT INTO `lessontype` VALUES ('F7zSMof2xrCWr36BuWkLYlPm6oZQ7VkE', '-311', '40', '1', '31', '4400', null, '高一、高二', '1', '3560', '0', null);
INSERT INTO `lessontype` VALUES ('EQivnUVHjIl1LjbN8SO2wYrMrd2Cf7cF', '311', '40', '0', '31', '4400', null, '高一、高二', '1', '3360', '0', null);
INSERT INTO `lessontype` VALUES ('9fBInyUaRjmZflAL7nPd6t19zeZfA3Mf', '-311', '60', '1', '31', '6600', null, '高一、高二', '1', '5220', '0', null);
INSERT INTO `lessontype` VALUES ('uIf1v2XWzaNE584oixhuAXNTfZNPQ53r', '311', '60', '0', '31', '6600', null, '高一、高二', '1', '4920', '0', null);
INSERT INTO `lessontype` VALUES ('T11VnTqQBrycECDTHdiLKhEeZ0yelhn3', '-311', '80', '1', '31', '8800', null, '高一、高二', '1', '6800', '0', null);
INSERT INTO `lessontype` VALUES ('mvwzDJLz1ATEyYoshcOReGlL4Whs2WHh', '311', '80', '0', '31', '8800', null, '高一、高二', '1', '6400', '0', null);
INSERT INTO `lessontype` VALUES ('zunBecixFYz354PudZDbtG6Wqp4pD5uC', '-331', '30', '1', '33', '3600', null, '高三', '0', '3000', '0', null);
INSERT INTO `lessontype` VALUES ('luPLt4oatAG9i9mhFK76LFRL22dF8C2I', '331', '30', '0', '33', '3600', null, '高三', '0', '2850', '0', null);
INSERT INTO `lessontype` VALUES ('xKPdekXVPI35g2MDfZ7hHPZSMKT3OZEy', '-331', '40', '1', '33', '4800', null, '高三', '0', '3960', '0', null);
INSERT INTO `lessontype` VALUES ('4elKb2dhsh84uRPWbVOBDh823rc5L8c7', '331', '40', '0', '33', '4800', null, '高三', '0', '3760', '0', null);
INSERT INTO `lessontype` VALUES ('rN4VVAmTwmabNlXlf6DLgLFQzwzlkbXG', '-331', '60', '1', '33', '7200', null, '高三', '0', '5820', '0', null);
INSERT INTO `lessontype` VALUES ('2ZE7KXbJ5i5spqyRCWL5plz19Y2TBSE5', '331', '60', '0', '33', '7200', null, '高三', '0', '5520', '0', null);
INSERT INTO `lessontype` VALUES ('ZT8CO2vsrvktUnRl8XZr8s6N1XUCXoGG', '-331', '80', '1', '33', '9600', null, '高三', '0', '7600', '0', null);
INSERT INTO `lessontype` VALUES ('ZL9udOWcrfPHRP3uZkR1L9e41Gv3Dy7r', '331', '80', '0', '33', '9600', null, '高三', '0', '7200', '0', null);
INSERT INTO `lessontype` VALUES ('ZL9udOWcrfPHRP3uZkR1L9e41Gv3D273', '231', '20', '0', '12', '1600', null, '初三', '1', '1600', '0', null);

-- ----------------------------
-- Table structure for lesson_trade_failed
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
-- Table structure for orders
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
INSERT INTO `orders` VALUES ('fa92b9ba-f1be-4461-b261-2342b3025145', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-04 11:05:27', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('6f41c6e0-d3fe-4f61-be70-e1018c5d9259', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '7c1f175e-92ad-4a83-af61-faf4571dc87d', '2018-03-04 11:28:17', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('999f9085-f746-4f88-810b-bb266dc4cc3b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-03-04 11:31:29', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-03-04 11:32:37', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('26e412cf-a8e8-401c-88fa-fe37aa6bb208', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-03-04 11:38:10', '80.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('49bfe88a-3a6f-40cb-9957-46650620c7df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'cccbb380-7dd4-44b5-8e79-19f7b610d433', '2018-03-04 11:43:08', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('a809032f-f82c-4003-9e70-26b8e6368db1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-03-04 11:45:58', '60.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('90782b65-c2f9-40f1-93d1-8a539537af58', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '2018-03-04 11:49:14', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2018-03-04 11:50:03', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('4363acc2-dce1-41f5-a5d8-21a9c664ecd2', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '5c7f5e36-535f-48f8-8763-0f9b6318073e', '2018-03-04 11:50:57', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('8599b3df-ac74-4ce7-b46e-86101431294c', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-04 12:54:58', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('7a7787a7-3f32-42d0-99dc-673c319d7b9d', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:02:41', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('4970c4d5-bda0-4b46-860d-51c53fa529ad', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:27:46', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('978b7641-2ed5-4a61-8721-528b92cd425a', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 13:56:17', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('38a80f56-41dc-4bc4-bb3a-300d58253463', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 14:07:41', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('b3cc0620-7124-4402-86f6-81b1ec1fd677', '111', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '0f390070-d868-42d9-832e-8dd8cf229124', '2018-03-04 17:30:35', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('2c371767-c5c8-44bf-b09f-1a7b3cf0d137', '-111', 'a712fda3-c0c0-49aa-be5d-4e90401c368b', 'e78f0e67-17c9-462d-ae45-453daf6562d5', '2018-03-04 18:06:29', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('53183a7a-8547-4823-b908-656b9e818f84', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-03-04 19:16:58', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('fb6a55ea-55e1-45ae-81e7-2caafb99ff2c', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:18:39', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('f8905a48-c226-4cc2-8710-e242dbe17563', '111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:19:20', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('127f313b-6c0f-4f6f-8909-8fede191732e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:17:19', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('c0293c4a-bf52-435c-b45f-8172c3ab747c', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:18:10', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('89338b09-7981-49bf-a597-d58e4c0b5245', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:25:05', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('5c6eaa1c-6384-478e-8234-ddd3bfbce2fa', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:31:16', '10.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9af3ef1d-8ed4-4581-9177-5c333efb9446', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:32:07', '-1.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('7a5a04a9-6f4f-4615-a6f0-38571e2f19c6', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:33:18', '10.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('218099dd-bf4b-4834-bd01-386f8280d15d', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:33:26', '-3.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('531c4692-cab7-406c-82da-8564e7ae538a', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-08 21:26:57', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('5b5e53b7-324c-4678-bff1-19d128f6f355', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 21:28:12', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('aeceba8b-9d9b-4ca9-ba5a-c903931c584f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 21:29:27', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0da9053e-409a-43d8-94d9-989ce283a8f8', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 21:45:23', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('68e439e3-d949-4f45-9cfb-3a66bc4e9910', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:11:59', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('85be62cb-3676-41b1-92e5-b85e8b6bf1d1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:36:40', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('06409f59-f672-4d7e-8834-f3cef35cae1a', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-08 22:37:13', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('bb35d9db-a35b-4be6-a3e0-47d9d038627d', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 22:38:17', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('5dc10c94-4b1d-4b16-81f6-8f02e191879e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-08 22:46:42', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c5dd254c-b284-4196-9f16-43a17e8c763b', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-08 23:02:04', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('8fb5244d-6bba-4959-9760-e64f77fe8370', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-03-10 09:23:13', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('de6e0d63-fbe4-4866-a521-e38ad0be0ccd', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 21:36:11', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('87c5f6d6-959b-49af-a90a-b88d85a92d67', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-10 21:59:21', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('fd573c19-ee59-4fb9-9fa9-f3b9c3fcf433', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 22:55:24', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9875ed65-6991-43c1-8191-511e30bb55df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 22:58:29', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('dfecbb82-2a0d-4cd0-aaab-c6f5f02c3ffe', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-10 23:15:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('eebc4ed1-ff1e-4598-a9d8-9e993af68360', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-03-11 09:34:00', '60.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-03-11 11:31:36', '80.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-03-11 14:17:45', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('63de6f8f-666b-4127-bf5a-a76bec815c24', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-03-11 19:28:43', '40.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('3916fb92-890d-4634-a040-582cce5f6163', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-03-11 21:39:17', '15.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('3b3aed7a-88af-4738-95e9-e6884326dbfa', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-03-11 22:17:43', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('cb160364-745a-4e89-a782-30d0643e9f9f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-12 15:02:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e3baa8e9-63c3-4805-aee1-605ca2ca3999', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-03-12 18:52:18', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('47131370-fc7d-4f30-8065-9d5bc8eb3c9e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 21:01:50', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0c4945d6-6144-4457-bea1-0b3f82074b37', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:06:11', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('59c449c7-5ef4-4e26-b148-7e8c6ee17650', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:17:11', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1900e321-c35e-41b6-b0e4-d07aa383b407', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:17:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('bb4c9aae-19d1-4e4c-9bb8-38da2e60ef87', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 22:43:45', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('eaf217fc-6c7c-4f56-be12-2b9d370ea109', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-13 23:10:50', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('44c9560c-76cd-4d41-a96b-654d39ac16fc', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-13 23:18:09', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1f8ce4c2-8af2-4e57-977c-3e275aef2880', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-13 23:34:40', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('877e1ad7-3b46-4490-8930-5306cdad94f5', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-03-14 17:42:42', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('319213ea-758b-42cb-a834-4a8e1997e16b', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-03-14 22:11:28', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('f3ca36e3-15e5-4c56-8a8d-1067156a0da1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 11:09:22', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('6d5ea52f-af75-458f-a0b4-52958b7d5c2f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 11:22:54', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('8231551a-2d67-4d0c-bed6-99de9ccfac38', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-15 16:26:00', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('2adcf9f0-4777-4e56-a13d-e75a7046e866', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-15 22:29:14', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-03-16 18:46:41', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-03-17 21:44:25', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('960f9ff4-85ea-4e46-8821-8f6d4e9a996e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-18 20:01:17', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('914b764b-8771-40c7-b21e-05ce7d6bd1eb', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-18 20:09:31', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('73a3c5ee-9b27-4efa-93da-f7b339d584d6', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-03-19 11:06:39', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('f8dcbaac-c133-4a7b-a161-d896376e3fad', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 19:58:37', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('39546c1c-4510-4582-8ea2-1da68d151263', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 20:02:19', '2.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9897f53b-bbac-4fbf-b579-35bdedf27586', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:48:50', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('86d72767-5f2b-41ec-850a-1c3fea2419d9', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:54:40', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('d51a5072-542f-4151-9a59-99ac7ae2031c', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:59:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('306dde2d-c5d0-4b11-856b-0259943de776', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 22:59:48', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('bd1f0a78-390f-4f36-acbd-f0e0ec514c8b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:01:57', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('383ad241-c1ec-44ea-aedf-eeb84684fdf0', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:03:46', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('be3516e7-aee6-4335-b8bc-85b042ddde7e', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:21:45', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('eae9719f-49d5-46da-a1f8-3a28fb6af3be', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:32:38', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1b21b815-ae3f-459c-9676-5cc32b8876bc', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-20 23:39:53', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-03-21 08:59:15', '25.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('ed9b55d8-738b-43c6-87c0-2c6ea30ec737', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 11:38:38', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('50fcd63f-91c5-4371-b2e6-33e81832d35a', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 13:36:11', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('aa92c367-d393-4303-9edf-29e5c72ba000', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 15:28:47', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c6af12ed-ee54-4f92-9261-3dc190a2010a', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:08:19', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('dc58bc93-6daf-4b26-b7a1-c15e4953fac1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:14:18', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c65d08b5-0d5c-4bdc-9274-c3ec329272f0', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-21 17:30:24', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('87a767a8-22b6-48d9-a24a-cc6d52c975e9', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-03-21 21:07:56', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('9461f1df-fa79-4609-88fe-757fd0ccf99c', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-24 12:08:22', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('83bb28c1-8f21-483a-8348-07bf53f702ef', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-24 19:21:38', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('e37770db-2e80-422e-b4d3-e12cab81145a', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-03-25 19:19:32', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('878030f0-b55b-4abc-9af7-16947f353ac1', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-03-26 08:44:56', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-26 20:54:40', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('68390142-be76-4569-99ec-3f4f6e61c13c', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-27 19:38:58', '-6.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-03-28 15:00:47', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-28 15:11:07', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('c4188ec5-7552-4ccc-8a35-6287339f7566', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:40', '-4.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0f619823-ebf2-4c14-9b1a-98f735ff6bf4', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:43', '-4.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0f60105c-c778-4c87-9df5-51e3cb9947b2', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:53:47', '-4.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1465161c-351c-4bb0-a185-598859e6bb26', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-29 12:54:13', '8.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('fdf68851-7c47-437f-87b3-8091a639bb28', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-29 12:59:30', '-4.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('497f668a-5c7c-4cd9-b2e7-164a53b85d6a', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-29 13:11:18', '7.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('57690f2e-484f-466a-943d-6ae8b5eee0d7', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-03-29 14:26:48', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('8392f7d1-9b76-486d-a810-d7f651340a08', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-03-29 20:41:32', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('d5b3a276-c468-49fc-9a19-12deccd4f5bb', '-211', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '2018-03-29 22:50:20', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('eb4baf58-0f3e-4017-958c-a711c8f05ffb', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-30 17:50:45', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('9241dacb-e389-45fe-b432-21a34307b019', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-31 13:20:45', '-4.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('eec3166c-b969-4bba-982a-46fd8f62ef06', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 15:14:57', '20.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('deba3091-8e44-48e4-a71a-a158eb9c4be4', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:20:15', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('745fb255-d039-4c5d-b527-20c21ffdcf51', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:22:20', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0293feed-7c35-4d85-a016-8fdf60f17494', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:53:10', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('339d3239-3805-41a0-abc4-19a8480fcce8', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-31 16:57:58', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('11097d40-84d4-4744-bd48-b854fb291dd0', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 18:07:16', '-9.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-03-31 20:09:06', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('8591dca2-85c5-45f2-a103-f7b09ed8962f', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-03-31 22:49:31', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('0074262e-7492-4540-a61a-ca5b55a31e45', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 15:42:47', '80.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('be8e627d-a4c6-4e0c-a12c-11537519585b', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 16:06:44', '3.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('8da10dd1-1077-4bba-87df-ccd3289d4eae', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:41:09', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('404fa5e8-82ac-4751-890c-bfdb0b657744', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:41:32', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f8358077-78e1-4f28-8134-83365338f0f8', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:42:08', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('288cace0-5bae-4c11-9167-c1646d1c4b64', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:53:45', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('68c3050c-5e2f-41c7-899e-3ebd109a4d52', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 16:54:14', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3999a748-51d9-45ee-a1ba-d30af836a0fb', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 16:57:20', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a3b9d1fd-8726-4b75-80dc-259ca011d310', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 17:02:15', '5.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('af7e9f1e-1c86-4454-b9e8-a432e58f8fda', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:08:53', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('47e94225-3c7d-4423-9a1a-7ec49fc7325c', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:14:05', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('aed7c9a9-a46e-45ce-82f4-c8d701f10667', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:20:21', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f319c5e0-8ce6-45d0-90d9-7ccf584e2034', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-01 17:34:20', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a0c251ac-8221-43a3-8717-0d0cf0e9eb00', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 22:07:43', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('36ddf58e-bbb0-4bc7-b614-95593f5bd71f', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-01 22:11:49', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('31c764a7-240c-4d72-8fff-46a3406d4bd3', '-231', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '2018-04-02 08:50:16', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-04-02 08:51:13', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('fe423223-0125-463e-a23e-c8759ca06222', '-231', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '2018-04-02 10:02:40', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('cec19c3d-e59f-48e9-8e55-6a06a88ae298', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-04-02 17:34:51', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('32284eac-f199-44cd-989b-20fa8c6363e5', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-04-02 18:59:31', '5.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('7805c2bf-ca22-4274-a772-dc1ac11e8847', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-04-02 18:59:37', '-5.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('d827f356-7b1b-4f9d-b99e-734e3ff1a3f3', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-02 21:37:17', '20.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('8104b7f0-b244-419c-9863-6fd617caf676', '-211', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', '2018-04-03 09:47:42', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('19ef0378-c057-4e32-8b45-d85f87107d32', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-03 10:02:24', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('fca0c88c-636b-4f39-b740-9f071d380573', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-03 10:04:07', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9d49c468-6d21-41b5-8d45-7d7202929178', '-231', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f', 'fb276474-891d-4c41-b32b-96bcb5531675', '2018-04-03 14:13:05', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('8d72064c-8a95-4740-a1e1-058a9e956633', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '3d5fbd91-ce72-4426-a573-2ba496710a6b', '2018-04-03 18:48:38', '10.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('146b69d5-f005-4f92-8fda-5fa82df0c061', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-03 23:35:53', '-3.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('037c3673-3c3a-4b58-81dc-a6e90563b7cc', '-231', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '2018-04-04 18:43:39', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('c21fa5ed-9088-44c5-a774-29575d51d250', '-331', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '2018-04-04 19:01:34', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('caf0c16c-3601-4919-96db-c0d55d1f1aca', '-231', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '2018-04-04 20:15:29', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '-231', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2018-04-05 10:29:02', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('2f15c6ad-10cd-4af9-a4ed-52f87b81b511', '311', 'e13cb91b-d429-4204-a185-48752af469f0', 'f6fe6270-ab84-42a2-a356-0cf1fc5d83de', '2018-04-05 16:55:44', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('3e16af28-6a16-4f15-b0de-319c337d816c', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-05 20:21:40', '60.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('de12126d-0e9f-476f-970c-6a8c5bb18669', '-231', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '2018-04-07 17:53:31', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('b2d86f6d-bc8a-4a5f-be03-26811a5291ab', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-04-08 10:52:46', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ef476966-76a7-4901-b261-b0153a05c31a', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-04-08 18:30:25', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9d1f085e-1242-428e-8eb3-7ae84e9d3844', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-08 18:49:16', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('586695ec-5b2b-4529-a942-87dfa11e80de', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-04-08 18:49:52', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('6206a78d-c1d7-46b8-b445-16dc8bb66602', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-04-08 18:59:25', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('5b281c5e-c0be-4b5e-a32f-c66bcab120d8', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-04-08 19:07:31', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3fe2f612-1511-4449-bc6f-9196629f7d40', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-04-08 19:32:31', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3235816b-d69a-4e6b-97cb-ed3144cee405', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-04-08 19:42:34', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('58882163-50bc-42c8-8f3f-fa76b77c023e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-04-08 19:43:28', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('91ce217a-0aea-4218-976e-81acc22b1fe2', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-04-08 20:27:38', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('5bf492c8-c8c3-407d-865c-7edef58d83ed', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-04-08 20:31:42', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('7b0e9088-b0c7-4e1c-a66f-e86010d1e7bc', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-04-08 21:01:42', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('720db5ed-b242-4b52-8779-8a88cff1c3aa', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-04-08 21:13:08', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('4cc15379-246e-4a95-a6fd-49f326d0de3d', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-04-08 21:50:00', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('430de96a-867d-40eb-9b3e-eaab89a6065c', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-04-08 22:32:00', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('dc18dee1-0277-4ae6-9c81-c4e245ff3976', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-04-08 22:56:24', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1998670d-75f3-40da-8d64-2e39a4103d5e', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-04-08 23:15:15', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('dc0157a4-c111-4179-a936-d085ad5e6c11', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-04-09 09:50:22', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a7d9a12e-bac8-46bb-9202-221804b9c39d', '-231', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '2018-04-09 10:05:43', '20.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('5af23dd7-52fb-4564-a13f-b3dfbadbff83', '-231', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 11:37:46', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('38b2b7f7-1236-4e4c-b63a-4ccb8d422d1b', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-04-09 12:51:01', '-7.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('74fc8789-52b0-4cce-b2f4-96806dd4a9bd', '-311', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '2018-04-09 13:05:09', '35.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('7daa26c1-40cf-4f99-9c15-c9e9d3694d0f', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-04-09 19:06:56', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('925575cf-a63f-467c-9b57-1ec38179f7de', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 19:12:04', '15.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('68fd59e8-00ac-466a-b943-9d639df143e5', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 19:22:51', '-2.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('30708dee-9c3e-45c1-a769-85ef54258cc4', '-311', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '2018-04-09 19:37:34', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0c34d38a-5001-448a-a586-64a17ba2f2f5', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-04-09 20:00:38', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e62b9949-6f98-4482-bfa5-331f32ac0ddb', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 20:03:22', '-11.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('88ee2a06-b4e2-4880-9513-672587957a5e', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-09 20:07:18', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('99986f28-93c9-4c7e-9026-6a78e729522c', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-09 20:20:41', '10.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('655bae5f-395f-4122-be6c-74bf25a10a5a', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '3d5fbd91-ce72-4426-a573-2ba496710a6b', '2018-04-09 20:21:54', '-10.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f517f278-64fe-461c-9bc4-79048ff13db1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 21:04:55', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1a3e3cde-5d12-4d96-8b0e-e5fcbc4f2512', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 21:08:08', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('da40e383-5e28-4f11-8439-da7c93376fd1', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 21:16:01', '-1.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1b9ea11b-d622-4bc4-9465-6dd1d60452da', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-04-09 21:33:22', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('893ae647-c243-44d0-addb-9c9497720478', '-231', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2018-04-09 21:36:11', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('6f93a236-0591-468f-a225-1f37469877fa', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-04-09 21:45:32', '-10.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ac7d48bf-fa49-477b-ac87-c6fca08f1ed9', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-04-09 21:57:58', '-16.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('15899168-e690-46f6-8845-39cc02a82b9d', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-04-09 22:06:33', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3d748238-f5aa-4b27-928a-9b40a83f2659', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-09 22:15:30', '-1.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('fd5d30d9-3548-497e-9706-ef8ec0b15677', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-04-09 22:35:10', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('86cc94ef-b1c7-423a-8014-05dbc4183b9a', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-04-09 23:35:10', '32.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('f40b3c03-22b9-46bb-a2a7-bb12aadcab72', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-10 10:58:28', '2.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('d928e03c-1bcc-4d63-8534-c5f62e83bb06', '-231', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '2018-04-10 11:08:32', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('43d523c6-9a7b-47b2-a61d-f6b537675070', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-10 16:35:09', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('eb579546-e561-41d6-8883-2ac4c992da09', '-211', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '2018-04-10 19:53:38', '39.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('df984c47-7aff-4074-9d17-cdc152e3eb2b', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-04-10 21:21:42', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('48373e68-94f4-4319-89e7-2a355e9b05b8', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-04-10 21:59:41', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('6bc3bb40-d749-4e85-b5ed-1cefb63371c0', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-04-10 23:09:46', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('cc8a0091-772f-49d9-b7ef-e7ef7d507637', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-04-10 23:21:11', '-1.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('4d56d9d9-877c-436a-abcb-ebc514d84421', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-04-11 00:02:09', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a0bea605-d53d-4997-ba6b-807ebece0cde', '-211', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '2018-04-11 13:29:51', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('7640fe8b-266c-409b-95b9-05c500f199ef', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 14:38:33', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('671aaf61-88cd-4331-aca6-e5b705f1cc37', '-231', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '2018-04-11 16:48:39', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('9092c586-4bda-4b20-b6ad-c1fdd2b50b77', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-04-11 20:32:27', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('93f166ab-0b1c-443a-89dc-a3e139ab924d', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 21:00:52', '-0.50', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('58681c41-e75d-48f0-bda8-1d60950c19dc', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 21:01:04', '-1.50', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c1877e64-8d95-4ef0-90b8-07149eaf5df7', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 21:01:18', '0.50', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('81a31a3c-0e64-4d34-a527-ae4bdc1af4e2', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-11 21:54:26', '-11.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e82f735a-29c6-48d0-838c-8d29fcb2fb31', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-12 10:10:42', '-0.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('2c4cbcd0-d5b3-44be-a61d-765f3615f7fa', '-231', '18709a24-fda2-4522-aa3b-b29847cd9ca4', '1b201cf7-e147-4897-ac9d-71961be06c24', '2018-04-12 21:45:35', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('47086551-5bd8-4b40-bdb3-3a5bd2828195', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-04-13 23:25:13', '-2.50', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('59d277fd-99b1-43ff-9e22-bcfe3c4443bb', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-13 23:28:53', '-2.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('cd7c755f-9776-41f5-842e-ffa9c3667e39', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-04-13 23:29:12', '-2.50', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('758fa33a-0302-4b1a-9787-e1a03e972f48', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-04-13 23:37:19', '-1.50', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e665c36f-770c-4cc9-879e-cfa962f610b4', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-04-13 23:47:52', '-1.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c6f1133e-b164-48bf-9fae-a2cb3025ddee', '-331', '7f376be4-d891-48be-8529-9bc5b85185ca', '83802c3d-71c7-4ca1-9851-2975ee047139', '2018-04-14 09:25:21', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('955d6a87-6e80-4b6c-9e97-c30826b91bc8', '-231', 'ddbc6677-b375-4fe1-aede-968dc637e6c1', 'ac7ead61-9963-4e6b-a426-947a41a6712f', '2018-04-14 12:46:36', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('d5dbb5c3-a4dd-4a75-a5e4-9d362069ff6b', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-14 16:29:07', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e302209b-f377-4588-af2c-d41826e62a30', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-14 21:23:37', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9cc2e461-43a8-4d36-ab20-bad5b75f6c60', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-04-15 10:44:03', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3cf9c2b5-4119-4805-ae3c-8bb7b0d53a46', '311', 'c69ae58f-dfc3-4278-bd90-dadabbd89860', '60c4cb47-c262-4337-8639-f4c38e525474', '2018-04-15 10:57:08', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('40a8145f-1ed6-4329-907f-74480b7e27d6', '311', 'c69ae58f-dfc3-4278-bd90-dadabbd89860', '60c4cb47-c262-4337-8639-f4c38e525474', '2018-04-15 10:58:25', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('526c497e-7f5d-4ee8-809b-692c27d62a00', '-211', '20534a99-a8bf-4938-b70f-d50230796176', 'cd6dfb39-c2da-4fb3-a979-d63f4163da67', '2018-04-15 12:57:59', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('57f45aa6-4cdb-4e0a-891a-646b1f51308c', '-211', '20534a99-a8bf-4938-b70f-d50230796176', 'cd6dfb39-c2da-4fb3-a979-d63f4163da67', '2018-04-15 13:06:09', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('96a03d6a-1452-4c35-870f-479a373c6c5e', '-231', 'f227e1c1-2002-456c-ac75-bb01e4a17290', '85fab9b6-cf10-4c97-8a4a-09b7a279a976', '2018-04-15 21:01:58', '21.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('62197d2e-41ad-4087-9662-894824f7b7d1', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-04-16 10:30:56', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('56387025-5ace-4e50-bd1d-009dcce66ba0', '-231', '6ffa758e-b6c7-4d69-a7ed-28f9a5016eb7', '6ccefde6-6240-4ede-b185-bbd159285f1b', '2018-04-16 15:05:05', '21.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('5d4bff69-5146-45da-850a-da1af1b79e0f', '-211', '2da7bbcb-aeff-40d8-90ea-3eab9575f076', '352ae049-419b-4b88-9a30-dea9e528480e', '2018-04-16 19:29:13', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('5a0dee65-df67-40ab-8597-f8b038926785', '-231', 'd8fdc43e-4794-4534-835f-22ac73aff251', 'f2de054e-d89b-4b06-b82c-81c01ccf689b', '2018-04-17 06:45:39', '21.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('0627a0b0-990c-44e8-889a-997dc1c38873', '-211', '8abd5cd9-0089-4a9d-8d87-5859cd6c2566', '92f1e207-0d5f-4b6f-a8db-22a5eadafc29', '2018-04-17 14:34:53', '40.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('001505fe-0d9f-498e-a096-8146cd46ee2c', '-331', 'ad6b717b-0a88-404a-a17e-5701e87c457e', '52bf8ca5-29be-487e-8281-4ed3affe6df1', '2018-04-18 10:16:50', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('d0ca4e4a-fe9d-48f2-969d-2c9ebddefa17', '-231', '6ffa758e-b6c7-4d69-a7ed-28f9a5016eb7', '6ccefde6-6240-4ede-b185-bbd159285f1b', '2018-04-18 10:31:06', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('30884988-3ca6-4898-87b5-1fcbadfca60e', '-231', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '419f76c5-706e-4cb4-8419-b31addbc2f8b', '2018-04-18 14:58:16', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('aeaf557b-e1b9-4d0f-8350-aadacbcaa5b1', '-211', '7d99fda9-2175-43d2-8680-78f0113e4dc9', '070e1e49-4c78-4781-8695-177fdf8d099e', '2018-04-19 10:49:35', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('109e9f34-a6dd-47a4-ab46-fdb923e22234', '-211', 'ab52839e-f4b1-4db1-ac75-259c71b707cd', '4d5ae807-aad5-4b35-8f17-527cdfef6d40', '2018-04-19 20:30:34', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('3dd97ad6-8ea7-4176-8088-b7aaa66ce7fd', '-231', '6b528f9a-d2ca-401c-90b0-94a435569b9f', 'b0c16d71-c5e2-41b1-9940-9b6ff0212e21', '2018-04-20 10:43:00', '21.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('ecf2e2e9-d2e1-43bb-9215-2d79c2feeb68', '-211', '3525470e-60fb-490c-9b85-7c7b10998328', 'b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '2018-04-20 11:28:22', '40.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('a9003567-6833-4b1d-bc29-f026a60cf3f7', '-211', 'a87a2eb8-b4e2-4258-9c18-acc15b48d416', '5290567a-b37e-4374-a14c-e9aca1052cf7', '2018-04-20 12:38:05', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('bf532454-ef84-4c96-b9f0-db600e1dbe16', '-211', '3525470e-60fb-490c-9b85-7c7b10998328', 'b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '2018-04-20 14:44:13', '3.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('46c0460e-a1a1-49fc-b330-dd96bf71831d', '-211', 'ab52839e-f4b1-4db1-ac75-259c71b707cd', '4d5ae807-aad5-4b35-8f17-527cdfef6d40', '2018-04-20 14:46:26', '3.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('49ee2966-c7ea-4c49-8e4d-a1fef4f10d19', '-211', '7d99fda9-2175-43d2-8680-78f0113e4dc9', '070e1e49-4c78-4781-8695-177fdf8d099e', '2018-04-20 15:01:41', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9df65f10-6508-4210-84f7-490f1e98c357', '-211', '8abd5cd9-0089-4a9d-8d87-5859cd6c2566', '92f1e207-0d5f-4b6f-a8db-22a5eadafc29', '2018-04-20 15:02:01', '3.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e188c7b7-2612-4f16-b8dc-eb7989956155', '-231', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '2018-04-20 15:02:40', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('4683043f-3390-4dd6-98bc-bb193013447e', '-231', '2f79708d-ad15-454f-8bc4-7e610c732d3f', 'a59f7cd7-d935-4372-b153-4b8f5daabd03', '2018-04-20 20:57:13', '60.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('1cc6baf8-91f0-4bf5-a614-01994b931820', '-231', '2f79708d-ad15-454f-8bc4-7e610c732d3f', 'a59f7cd7-d935-4372-b153-4b8f5daabd03', '2018-04-20 20:59:15', '6.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f41e0c78-f08a-46bc-b450-9ca1a6b65fe3', '-211', 'be5a1a9c-2eeb-40da-b5a3-20f5859dec34', 'a31e28a3-b2cc-436c-b89d-fb6dbc5cd3f1', '2018-04-20 21:51:01', '80.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('aee6267f-51ce-4c01-b421-007ecb3f0655', '-211', 'be5a1a9c-2eeb-40da-b5a3-20f5859dec34', 'a31e28a3-b2cc-436c-b89d-fb6dbc5cd3f1', '2018-04-20 21:52:18', '10.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('133fe431-4f9c-4e1b-a578-f5b1ab4b8490', '-211', 'cc00c551-9d32-4d2c-a16b-d92dd6ae6921', '32e7fcb2-e00a-49bd-89b9-f0665f08350a', '2018-04-21 11:27:46', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('3ef1933b-eddc-496c-8be0-4caf0beb83fe', '-211', 'cc00c551-9d32-4d2c-a16b-d92dd6ae6921', '32e7fcb2-e00a-49bd-89b9-f0665f08350a', '2018-04-21 11:30:40', '3.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('06a0d7ed-f1b8-434d-b7f2-e97205db773a', '-231', '128ddbf4-08fa-4968-b807-4805003e6921', '5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '2018-04-21 15:45:44', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('7dd4f339-8723-4132-98da-a597a0bd8fcb', '-211', '3241d692-8ee2-46b2-bd15-d0c02f991a86', 'fe696785-d70c-46d6-b8df-e778d00462f4', '2018-04-21 16:59:47', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('7392c5fd-5861-4c97-8022-7908c654c227', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-04-21 17:35:50', '2.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ebdd1dfe-75d6-4770-823d-c3bde4086347', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-04-21 17:36:04', '0.50', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('952af6a2-72eb-4fb2-93a0-f04b0658441d', '-311', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '3a614d80-f7bb-46d4-89da-23080e97ea02', '2018-04-21 20:30:38', '40.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('8bc640d7-8e37-4768-8f16-64a8d8e6ae71', '-311', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '3a614d80-f7bb-46d4-89da-23080e97ea02', '2018-04-21 20:55:18', '3.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('62426f43-72a0-41c7-aea4-3bbedbddbca1', '-211', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '87713b29-371d-453c-a3a6-99a13d45ef0f', '2018-04-22 14:46:45', '80.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('66b93a71-d026-4b8c-9e44-e1c10b64f902', '-211', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '87713b29-371d-453c-a3a6-99a13d45ef0f', '2018-04-22 14:48:19', '17.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e860f44e-bb13-46da-974a-1318c409b0df', '-211', 'd1541f36-0bb8-41f1-9b3d-57ed642bb13c', '9f20b54b-df98-4ce1-9997-8b51e6266f78', '2018-04-22 23:00:09', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('6e196755-3df4-40ad-bd39-b07796bb4147', '-211', '2da7bbcb-aeff-40d8-90ea-3eab9575f076', '352ae049-419b-4b88-9a30-dea9e528480e', '2018-04-24 14:00:36', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('6f128ed3-9a59-4365-833d-8d85a0dca22e', '-211', '3241d692-8ee2-46b2-bd15-d0c02f991a86', 'fe696785-d70c-46d6-b8df-e778d00462f4', '2018-04-24 14:05:07', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('dc83e2a2-4750-4bc3-8e10-365bd11a4f99', '-231', '128ddbf4-08fa-4968-b807-4805003e6921', '5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '2018-04-24 14:05:15', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ee438a9d-080b-4bd4-bc40-e095f3d31b7a', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-24 21:19:37', '1.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('cac4f35f-5bbf-47fb-8143-0e47990c8465', '-311', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '0cf74357-767e-4a3b-8202-943436f4995c', '2018-04-24 21:20:32', '21.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('7c0ba952-e24a-46f7-9936-0f39123e7a3b', '-211', '4a0b359f-b7ba-45c5-b746-cffe7ceff5a8', '67181c1a-d2df-4460-8751-035d1a1d4efd', '2018-04-24 21:49:16', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('0e6abbf9-9a54-4e40-b582-72a9b8df29ab', '-231', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '0cf74357-767e-4a3b-8202-943436f4995c', '2018-04-24 21:56:12', '-1.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f4b3a0d4-89fe-471c-b74e-ce2d5875e10b', '-211', 'e902e3a3-6c25-4063-b4cb-dea3ce2de31b', '74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', '2018-04-24 22:13:50', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('1dfa98d6-7340-4fe2-831f-4659f43b5d58', '-211', '9722809f-a128-4505-8cd2-06a31c85e5c8', '61086778-f35a-4d8c-b1c0-434dc86fadeb', '2018-04-24 22:22:51', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('526b8502-a426-4b33-9c78-be1c4cce6d7a', '-331', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', '2018-04-24 23:06:56', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('2f244458-a170-4105-9a30-ef8003d748ab', '-231', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '2018-04-25 06:49:18', '60.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('bcb42915-eed1-4a8d-adcd-61f50805b256', '-231', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '2018-04-25 09:07:47', '16.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('116e7835-c328-4a17-846e-bbd15091962f', '-231', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '2018-04-25 09:08:56', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('9e759c34-3066-4341-9639-2f6d7cdc2c57', '-211', '418c8290-93b5-467f-9d8b-c68ccd7761a5', '2aaccef3-b986-4e63-988c-ad059935854d', '2018-04-25 10:00:16', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('d81ea62c-aa1d-4116-a011-f27635e0281c', '-211', '418c8290-93b5-467f-9d8b-c68ccd7761a5', '2aaccef3-b986-4e63-988c-ad059935854d', '2018-04-25 10:07:19', '11.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a62eb65d-f1b0-4ae6-a054-39b1e2b6d4c0', '-231', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '2018-04-25 10:29:31', '6.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c6460f0b-6535-40f7-aa01-936c9c942ef6', '-211', 'ced058e2-c909-4579-9364-0dee8b1f8ef3', '705dc6e9-2639-4126-b0b1-1826d29eb1b9', '2018-04-25 19:25:39', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('05203cf8-1642-42de-9c3c-d03384db9db1', '-231', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '2018-04-26 09:20:10', '-11.00', '0', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('66aa874a-01a1-43b4-86f2-78a598a8dd75', '-231', 'a4fd6fff-d63e-4184-be61-36f688db621a', '39bcba7c-99db-4d78-94ff-74c26585978c', '2018-04-26 09:59:11', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('a60904e7-96d5-4493-a711-ed991ffa5b2c', '-311', '89df5d5d-c518-49c4-a68a-8922bcf3f5c0', 'c252c682-0615-4343-a69a-f329c2d41ee2', '2018-04-27 11:11:09', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('f5a9cdbb-540a-494f-a326-1f4f89d624cc', '-331', '7f376be4-d891-48be-8529-9bc5b85185ca', '83802c3d-71c7-4ca1-9851-2975ee047139', '2018-04-27 11:42:26', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('e6ea1517-3926-42dc-841a-274ee5d8666d', '-231', 'a4fd6fff-d63e-4184-be61-36f688db621a', '39bcba7c-99db-4d78-94ff-74c26585978c', '2018-04-26 10:26:13', '10.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('8d523a59-3e9d-409b-9a53-bfe752f9983b', '-231', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '419f76c5-706e-4cb4-8419-b31addbc2f8b', '2018-04-26 11:05:38', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('f672df4d-8186-4f1f-8489-c598795fb255', '-211', '18174553-f629-48d7-83be-226feef83e4b', '0b54ce6d-bd5a-404d-9d14-caf89f84dd46', '2018-04-26 15:32:58', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('b690db34-c1fd-486b-8b27-75e2b9e91c1a', '-211', '2845241c-c49b-4f81-bc46-7dd7592c246a', '958e0b84-1956-4e2b-ac9b-9f9a6d0a9191', '2018-04-28 15:45:19', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('d9c3ec4b-da79-4955-81e3-9b94d04e400f', '-111', 'a74e1231-3e08-4db2-93f1-a79e8ff77251', 'bcf5c17a-4e4e-402c-b469-93b8d419678f', '2018-04-28 23:34:26', '30.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('98f75a62-a434-4f5d-87b1-77fab08d832b', '-311', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '1886a744-3e9e-4bce-b586-ac1c0027dd70', '2018-04-29 11:29:58', '30.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('84b7e745-03a6-4f9d-8720-c5466d287c39', '-211', '578b339d-e046-44a1-953b-4ab5cf8f9951', 'babdb37b-1824-4eab-93a9-ed0342e9eda8', '2018-04-30 13:34:46', '80.00', '2', '0', null, null, null, '0');
INSERT INTO `orders` VALUES ('3bb8a431-bb41-403c-a02f-c33ddc4ad2fc', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-05-01 08:09:04', '-15.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0850927c-ab3b-4fc7-95d6-f34e0c054529', '-231', '520edb90-d404-4d5a-aa3e-448c90052e52', 'f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '2018-05-01 09:51:34', '21.00', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('2d9e5dd6-b4af-4115-888b-4e132c406290', '-231', '520edb90-d404-4d5a-aa3e-448c90052e52', 'f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '2018-05-01 09:59:39', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('5a7f2ebe-2d75-4d4b-a592-a17f9a1c6a75', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-05-01 10:06:12', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('093abafa-6aa1-4679-b739-32b344bb368c', '-211', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '87713b29-371d-453c-a3a6-99a13d45ef0f', '2018-05-01 10:53:05', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('8e81589d-640e-4ec9-a2f8-d18020089dff', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-05-01 11:35:42', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('3db8f409-6e6e-44fb-a2a5-1db45b6baa79', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-05-01 11:38:16', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('7b2fb990-891f-4b0c-b35d-8a9dc030d668', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-05-01 11:40:56', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('34f008bc-4ae5-482c-b807-376b1362c147', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-05-01 11:53:36', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e8279040-de28-4dc7-975d-f39db957c7c0', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-05-01 11:56:48', '-7.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('80728144-5f4c-435f-a440-c96252278657', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-05-01 11:58:50', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c4ab73d3-fc96-4e90-8e57-a96fde2750dc', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-05-01 11:59:07', '-7.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('86410c2a-bd64-43e9-ad27-0142e2f5c81b', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-05-01 12:03:09', '-24.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('20f8651b-3c98-471d-b4c7-e8483a914779', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-05-01 12:03:29', '-5.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f12e9ee9-a8b1-4063-a152-773d3ed11f2b', '-231', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '2018-05-01 12:13:42', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('cc0c57ac-69b9-4d7a-a300-eeedf5563366', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-05-01 12:23:10', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a0200552-c995-4b6c-a8bc-2f713f9b5854', '311', 'c69ae58f-dfc3-4278-bd90-dadabbd89860', '60c4cb47-c262-4337-8639-f4c38e525474', '2018-05-01 12:37:10', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('4916d8f6-43f4-49b9-abaf-43d634b8c725', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-05-01 12:44:35', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ad0984fd-9015-4b06-af1c-7fe6653c0ca0', '-211', '20534a99-a8bf-4938-b70f-d50230796176', 'cd6dfb39-c2da-4fb3-a979-d63f4163da67', '2018-05-01 12:48:41', '-5.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f6154642-4f46-4c53-8e11-70d92f138bbe', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-05-01 12:55:51', '-7.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0b10c50c-f5e4-44c5-907a-07733fad230c', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-05-01 13:00:00', '-8.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('13de2ef3-303f-4f0b-85c7-f1926d9c9309', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-05-01 13:01:46', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0c6ad365-ad83-4390-b29f-f3da69e55939', '-231', 'f227e1c1-2002-456c-ac75-bb01e4a17290', '85fab9b6-cf10-4c97-8a4a-09b7a279a976', '2018-05-01 13:12:46', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('15b087b8-9a93-485b-9b59-157a02c77211', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-05-01 13:14:34', '-3.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a0cb0ece-db86-4084-a714-78ce47643163', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-05-01 13:15:48', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('e5a9e0cf-bb07-4c1e-be89-fbe75e47d7b8', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-05-01 13:21:59', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('084a9326-5bd4-40dc-9cf9-cd86e76ea60d', '-231', '2f79708d-ad15-454f-8bc4-7e610c732d3f', 'a59f7cd7-d935-4372-b153-4b8f5daabd03', '2018-05-01 13:36:22', '-17.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('d3cecb14-cffc-46f2-a484-7b3b54b320cd', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-05-01 13:37:27', '-12.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('87047213-0ffe-45a6-bfe2-4aaf099074ea', '-211', '3525470e-60fb-490c-9b85-7c7b10998328', 'b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '2018-05-01 13:42:20', '-5.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1f432499-75da-449d-b01a-461af5c7986f', '-311', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '3a614d80-f7bb-46d4-89da-23080e97ea02', '2018-05-01 13:45:33', '-5.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1ef3e659-9639-43b2-9db4-1fe3f6c56bd9', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-05-01 13:46:44', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('abcd5391-ced0-43b4-badf-9b51812b289b', '-211', '2da7bbcb-aeff-40d8-90ea-3eab9575f076', '352ae049-419b-4b88-9a30-dea9e528480e', '2018-05-01 14:09:39', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('2c3cb818-586f-4218-9722-f0dca3ddbb69', '-311', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '1886a744-3e9e-4bce-b586-ac1c0027dd70', '2018-05-01 14:33:39', '1.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('40101736-4886-4ca5-9eb0-d5476eda57ec', '-211', 'e902e3a3-6c25-4063-b4cb-dea3ce2de31b', '74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', '2018-05-01 14:36:31', '-4.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('1ca2bb0c-95b3-400d-b79e-5a478e617d0a', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-05-01 15:15:41', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('adc2c172-4e21-40b9-941f-e858c290abf1', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-05-01 15:26:56', '-10.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('ea34f641-1b13-4c80-94c2-bc2e0f66db12', '-211', 'ced058e2-c909-4579-9364-0dee8b1f8ef3', '705dc6e9-2639-4126-b0b1-1826d29eb1b9', '2018-05-01 15:27:20', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('770178e4-96e3-4172-9af2-a8796ad09ad3', '-211', 'd1541f36-0bb8-41f1-9b3d-57ed642bb13c', '9f20b54b-df98-4ce1-9997-8b51e6266f78', '2018-05-01 15:27:53', '0.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('154c7b28-0df5-445d-9910-fd14626d0744', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-05-01 15:39:30', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c1f18198-ef89-4198-a3fb-d7343700d5a4', '-231', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '2018-05-01 17:54:30', '-26.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('681d6106-4c5a-4f1e-b300-f20c674ebbeb', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-05-01 18:26:43', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('7ee16424-2afa-4ab7-a27a-88bc6dd64e82', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-05-01 19:31:04', '-10.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('0884ab34-ad0a-4193-b5d7-744fcc696dd2', '-311', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '0cf74357-767e-4a3b-8202-943436f4995c', '2018-05-01 19:41:52', '-2.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('145654e0-4060-41fc-9478-a84a81a292a2', '-331', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '2018-05-01 19:47:57', '-16.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('a8bf5e5d-fcd7-40cf-842e-4d7609ff8fa8', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-05-01 19:52:15', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('fa1a1f90-de7f-4a79-a046-e592e0b60310', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-05-01 20:00:27', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('65fd02a1-639e-4677-aade-71ffc7f387ef', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-05-01 20:26:03', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('07e548e4-f12d-41db-96fd-d026116f6812', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-05-01 21:03:20', '-6.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('25f611e3-dba5-442c-8220-361488eb46bc', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-05-01 21:24:00', '-21.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('b3d40c4d-9fcf-46b0-a709-772bdce6375e', '-231', '128ddbf4-08fa-4968-b807-4805003e6921', '5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '2018-05-01 21:47:26', '-8.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('c7f5b4cb-4493-4719-9118-bde3c17821a5', '-311', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '1886a744-3e9e-4bce-b586-ac1c0027dd70', '2018-05-01 21:47:36', '-4.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('f2f85012-aed4-4e45-b739-23d4dcd35360', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-05-01 21:49:33', '-1.00', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('6fabdee4-9d24-4c0e-bec1-7754581671ea', '-331', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', '2018-05-01 21:51:07', '100.00', '1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('32fb1d02-04c4-495a-9e23-1a883db4c444', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-05-01 21:54:14', '-6.50', '-1', null, null, null, null, '0');
INSERT INTO `orders` VALUES ('2776548b-4f23-4fd6-909a-cc4b0d21ce86', '-311', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '1886a744-3e9e-4bce-b586-ac1c0027dd70', '2018-05-01 22:05:36', '1.00', '1', null, null, null, null, '0');

-- ----------------------------
-- Table structure for ordersum
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
INSERT INTO `ordersum` VALUES ('fa92b9ba-f1be-4461-b261-2342b3025145', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', '2018-03-04 11:05:27', '25.50', '14.00', '86aed366-b47d-4e95-a859-862b9bb358a5,cc70187f-a06f-469c-9401-7b7603ad7347,5a657d14-c207-411d-8bdf-cf6cb8e0db70');
INSERT INTO `ordersum` VALUES ('6f41c6e0-d3fe-4f61-be70-e1018c5d9259', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '7c1f175e-92ad-4a83-af61-faf4571dc87d', '2018-03-04 11:28:17', '40.00', '40.00', null);
INSERT INTO `ordersum` VALUES ('999f9085-f746-4f88-810b-bb266dc4cc3b', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', '2018-03-04 11:31:29', '30.00', '29.00', '0bdc7479-f122-4614-8a00-22f166abaa38,78b8f787-05df-4ad1-bdcb-466804c52dd4,a7aeab52-e5fb-4a4a-8418-6f62e2fcb3d9');
INSERT INTO `ordersum` VALUES ('b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', '2018-03-04 11:32:37', '40.00', '20.00', '37e49b33-f12a-4693-9e11-aed0bf39f981,3e9162a0-a70e-4bef-905a-a40c0ba0df2a');
INSERT INTO `ordersum` VALUES ('26e412cf-a8e8-401c-88fa-fe37aa6bb208', '-161', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', '2018-03-04 11:38:10', '80.00', '80.00', '260d90c3-929d-4407-ad6a-272afc660212,322e7938-af42-48ec-9fb9-8bd4a66c316c');
INSERT INTO `ordersum` VALUES ('49bfe88a-3a6f-40cb-9957-46650620c7df', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'cccbb380-7dd4-44b5-8e79-19f7b610d433', '2018-03-04 11:43:08', '40.00', '40.00', '3bf0d502-f4c7-4c3c-ad03-53284868dc0a');
INSERT INTO `ordersum` VALUES ('a809032f-f82c-4003-9e70-26b8e6368db1', '-161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', '2018-03-04 11:45:58', '60.00', '58.00', '14326653-ca8d-4e6a-8eb1-55174a504a0e,ed49c2bd-76cd-4716-a692-ab32a84c7c56');
INSERT INTO `ordersum` VALUES ('90782b65-c2f9-40f1-93d1-8a539537af58', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '2018-03-04 11:49:14', '40.00', '40.00', null);
INSERT INTO `ordersum` VALUES ('a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '161', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2018-03-04 11:50:03', '40.00', '40.00', '8fd5a867-cf4b-4163-889e-e0778641a4a5');
INSERT INTO `ordersum` VALUES ('4363acc2-dce1-41f5-a5d8-21a9c664ecd2', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '5c7f5e36-535f-48f8-8763-0f9b6318073e', '2018-03-04 11:50:57', '40.00', '40.00', 'e0b3d132-d720-4961-a8b2-c506466c87a6,1aa7085d-901c-42fd-9511-3711ed3dec72');
INSERT INTO `ordersum` VALUES ('8599b3df-ac74-4ce7-b46e-86101431294c', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', '2018-03-04 12:54:58', '1.00', '-2.00', 'f0b44033-0d96-469c-8df3-751ba320e716');
INSERT INTO `ordersum` VALUES ('7a7787a7-3f32-42d0-99dc-673c319d7b9d', '111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-04-24 21:19:37', '0.00', '0.00', null);
INSERT INTO `ordersum` VALUES ('4970c4d5-bda0-4b46-860d-51c53fa529ad', '-111', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '625a1ecf-6699-4ae6-ba41-fe47451a796b', '2018-03-04 14:07:41', '2.00', '1.00', 'c37a2e10-70ac-4d73-b65e-1327d3c5628f');
INSERT INTO `ordersum` VALUES ('b3cc0620-7124-4402-86f6-81b1ec1fd677', '111', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '0f390070-d868-42d9-832e-8dd8cf229124', '2018-03-04 17:30:35', '1.00', '1.00', null);
INSERT INTO `ordersum` VALUES ('2c371767-c5c8-44bf-b09f-1a7b3cf0d137', '-111', 'a712fda3-c0c0-49aa-be5d-4e90401c368b', 'e78f0e67-17c9-462d-ae45-453daf6562d5', '2018-03-04 18:06:29', '1.00', '1.00', null);
INSERT INTO `ordersum` VALUES ('53183a7a-8547-4823-b908-656b9e818f84', '-111', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '2018-04-02 21:37:17', '21.00', '19.00', 'a4dbc41f-3d29-4629-9d6d-1a3ff201eede,60f60bee-3cc0-45e5-ab06-1fdc359f744d');
INSERT INTO `ordersum` VALUES ('fb6a55ea-55e1-45ae-81e7-2caafb99ff2c', '-111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:18:39', '2.00', '2.00', null);
INSERT INTO `ordersum` VALUES ('f8905a48-c226-4cc2-8710-e242dbe17563', '111', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '2018-03-04 19:19:20', '1.00', '1.00', null);
INSERT INTO `ordersum` VALUES ('127f313b-6c0f-4f6f-8909-8fede191732e', '-111', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '2018-03-04 20:25:05', '19.00', '-15.50', '2d72270f-f8fe-4a24-93b2-885e8f8f5463,dde3612a-990b-43e8-8ebb-02123e838cc1,6380cb70-c25e-4077-a2ff-b0f65449e08b,5643eb54-af69-48f5-8680-37c8a9076677');
INSERT INTO `ordersum` VALUES ('8fb5244d-6bba-4959-9760-e64f77fe8370', '-211', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '2018-03-10 09:23:13', '30.00', '2.00', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2,9cad6167-8dda-4659-974b-1a7d60aba1f9,748ac459-aca8-4b9a-b792-e3aaf09a8e23');
INSERT INTO `ordersum` VALUES ('eebc4ed1-ff1e-4598-a9d8-9e993af68360', '-311', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2018-03-11 09:34:00', '60.00', '39.00', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7,425e3aab-b0d2-4521-b858-0a70509b5d9e,7017346c-ff3f-4f42-9a40-e92dc324ef19');
INSERT INTO `ordersum` VALUES ('f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '-211', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '2018-03-11 11:31:36', '79.00', '54.00', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494,39a82af9-6cdf-4b92-b0ad-2af75eb02564');
INSERT INTO `ordersum` VALUES ('e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '-211', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '2018-03-11 14:17:45', '30.00', '21.00', '88952680-bedf-47cc-86ed-8d61aa95abb7,03e04220-5ce6-40bf-8d47-c2a54a2d3816,10bb2db3-7317-4e80-81f5-8e8998fd3a01,8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2');
INSERT INTO `ordersum` VALUES ('63de6f8f-666b-4127-bf5a-a76bec815c24', '-231', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '2018-03-11 19:28:43', '40.00', '20.50', '5a978ecd-96da-4eae-b3f5-8706fcb3792e,f926d599-de1a-4b81-8343-9833c57a0882,9b6d689e-8671-4ee0-81f1-6cc27981b9c6,4d309b83-f780-4e70-9aaa-399c086cff52');
INSERT INTO `ordersum` VALUES ('3916fb92-890d-4634-a040-582cce5f6163', '-211', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '2018-03-11 21:39:17', '13.50', '7.50', '45d8c044-8858-41d5-a215-4444519387d5,c9c3c13c-d4ec-4389-a10a-4319c52e3d70,9ed37360-bf7f-4d5f-8a00-43c514053d52,98efdd46-b5b6-414c-9c31-56320515f91d');
INSERT INTO `ordersum` VALUES ('3b3aed7a-88af-4738-95e9-e6884326dbfa', '-311', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '2018-03-11 22:17:43', '40.00', '38.00', '8ecacfdd-351a-4381-bf5c-29bf8a815a88');
INSERT INTO `ordersum` VALUES ('e3baa8e9-63c3-4805-aee1-605ca2ca3999', '-211', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '2018-03-12 18:52:18', '27.50', '20.50', 'faf95a49-dc0b-49c4-a24e-be34c61e622f');
INSERT INTO `ordersum` VALUES ('877e1ad7-3b46-4490-8930-5306cdad94f5', '-211', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '2018-03-14 17:42:42', '30.00', '22.00', 'b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02');
INSERT INTO `ordersum` VALUES ('319213ea-758b-42cb-a834-4a8e1997e16b', '-311', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '2018-03-14 22:11:28', '30.00', '14.00', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73');
INSERT INTO `ordersum` VALUES ('3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '-211', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '2018-03-16 18:46:41', '30.00', '16.00', 'a93762e3-28ab-46b2-9793-8c73229268ca,6a2f9398-4577-4d5c-925c-b32352714ad2,3e74a8b4-7352-4fb3-94a9-48e03a354616,340e167e-e746-4d13-b45d-7370c640f2f8,cab9004e-3dbe-4777-8dbf-b39049fd8007');
INSERT INTO `ordersum` VALUES ('6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '-231', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '2018-03-17 21:44:25', '30.00', '14.00', '3b7435ef-5564-4501-8ed7-49ce14572ab0');
INSERT INTO `ordersum` VALUES ('73a3c5ee-9b27-4efa-93da-f7b339d584d6', '-231', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', '2018-03-19 11:06:39', '30.00', '16.00', '63aa4adc-bf6f-49c2-8164-f93bf08df35e');
INSERT INTO `ordersum` VALUES ('f8dcbaac-c133-4a7b-a161-d896376e3fad', '-311', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '2018-03-19 19:58:37', '32.00', '32.00', '8426c300-a528-4318-8983-4fd19f3f0ff0');
INSERT INTO `ordersum` VALUES ('ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '-311', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '2018-03-21 08:59:15', '25.00', '22.00', 'd8284412-4b3d-413c-88f3-d5c913f5df4f');
INSERT INTO `ordersum` VALUES ('87a767a8-22b6-48d9-a24a-cc6d52c975e9', '-211', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '2018-03-21 21:07:56', '30.00', '24.00', 'f849cbc7-5943-4710-b614-8f8cffd304e5');
INSERT INTO `ordersum` VALUES ('9461f1df-fa79-4609-88fe-757fd0ccf99c', '-231', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', '2018-03-24 12:08:22', '28.50', '23.50', '9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c');
INSERT INTO `ordersum` VALUES ('83bb28c1-8f21-483a-8348-07bf53f702ef', '-161', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '2018-03-24 19:21:38', '47.00', '47.00', 'f6dc4acc-f4d7-4aaf-b134-d818877620c9');
INSERT INTO `ordersum` VALUES ('e37770db-2e80-422e-b4d3-e12cab81145a', '211', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '2018-03-25 19:19:32', '30.00', '20.00', 'e10d87f4-b1eb-4b93-b46c-153cd988a403,5a88004b-a6ed-4463-aa35-33f6befbff13');
INSERT INTO `ordersum` VALUES ('878030f0-b55b-4abc-9af7-16947f353ac1', '-231', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '2018-03-26 08:44:56', '30.00', '16.00', '3f62df1a-7ce8-4d41-9476-aec52a3c267d,c4687b90-59ee-490e-ad3c-19c1ac078a6d');
INSERT INTO `ordersum` VALUES ('8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '-311', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', '2018-03-26 20:54:40', '24.00', '12.00', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67');
INSERT INTO `ordersum` VALUES ('5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '-311', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', '2018-03-28 15:00:47', '30.00', '28.00', 'f2eff1fa-55b8-4a6b-8d24-59773b22d648');
INSERT INTO `ordersum` VALUES ('9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '-231', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', '2018-03-28 15:11:07', '26.00', '-2.00', 'b18c2e01-544d-4e2b-bd41-3772c57c6976');
INSERT INTO `ordersum` VALUES ('57690f2e-484f-466a-943d-6ae8b5eee0d7', '-211', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '2018-03-29 14:26:48', '30.00', '23.50', 'c6c96bcb-068b-4c03-af6b-9a855737bffd');
INSERT INTO `ordersum` VALUES ('8392f7d1-9b76-486d-a810-d7f651340a08', '-211', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '2018-03-29 20:41:32', '30.00', '15.50', '4b99627f-fdf6-4325-a3d6-f5c83a421706');
INSERT INTO `ordersum` VALUES ('d5b3a276-c468-49fc-9a19-12deccd4f5bb', '-211', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '2018-03-29 22:50:20', '30.00', '30.00', '9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5');
INSERT INTO `ordersum` VALUES ('cac4f35f-5bbf-47fb-8143-0e47990c8465', '-311', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '0cf74357-767e-4a3b-8202-943436f4995c', '2018-04-24 21:20:32', '20.00', '18.00', 'e497b4ec-2aea-4dde-8022-398563cace59');
INSERT INTO `ordersum` VALUES ('96a03d6a-1452-4c35-870f-479a373c6c5e', '-231', 'f227e1c1-2002-456c-ac75-bb01e4a17290', '85fab9b6-cf10-4c97-8a4a-09b7a279a976', '2018-04-15 21:01:58', '21.00', '17.00', '31464416-5264-4c76-b092-1f9fbd9492b6');
INSERT INTO `ordersum` VALUES ('eb4baf58-0f3e-4017-958c-a711c8f05ffb', '-231', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2018-03-30 17:50:45', '26.00', '24.00', 'e3ff9924-100d-4a58-bbca-54d2fad68f69');
INSERT INTO `ordersum` VALUES ('eec3166c-b969-4bba-982a-46fd8f62ef06', '111', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2018-03-31 15:14:57', '20.00', '7.00', 'a4272eba-cc9c-40da-9e9e-a7b9662a46f3,6b387dfd-a870-40ae-b589-98b940508344,19926eb3-dd5d-46e8-999c-1978dcfce375,14809588-e1a2-47ff-9828-6fe4c159dce5,27f55f4f-55dc-4d66-87ad-471ec7e794f3');
INSERT INTO `ordersum` VALUES ('f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '-211', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '2018-03-31 20:09:06', '30.00', '15.00', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4');
INSERT INTO `ordersum` VALUES ('8591dca2-85c5-45f2-a103-f7b09ed8962f', '-211', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', '2018-03-31 22:49:31', '30.00', '21.50', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105');
INSERT INTO `ordersum` VALUES ('0074262e-7492-4540-a61a-ca5b55a31e45', '213', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '2018-04-01 15:42:47', '88.00', '86.00', 'f558d3cb-3858-44de-aece-19b4ffc45396');
INSERT INTO `ordersum` VALUES ('31c764a7-240c-4d72-8fff-46a3406d4bd3', '-231', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '2018-04-02 08:50:16', '30.00', '30.00', '2e858069-8e55-45b6-9bdd-725eece0438b');
INSERT INTO `ordersum` VALUES ('7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '-111', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '2018-04-02 08:51:13', '30.00', '26.00', '562f12cf-b532-44b1-8d55-dd55e8211fed');
INSERT INTO `ordersum` VALUES ('fe423223-0125-463e-a23e-c8759ca06222', '-231', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '2018-04-02 10:02:40', '30.00', '30.00', 'dd7f3ed4-6b89-484f-af84-275df6c719a7');
INSERT INTO `ordersum` VALUES ('cec19c3d-e59f-48e9-8e55-6a06a88ae298', '-231', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '2018-04-02 17:34:51', '30.00', '20.00', 'bbcd0381-1fe7-4c13-9eff-71fced57f12e');
INSERT INTO `ordersum` VALUES ('8104b7f0-b244-419c-9863-6fd617caf676', '-211', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', '2018-04-03 09:47:42', '30.00', '30.00', 'b56826ad-23bb-4162-8c5c-6cd7cf516889');
INSERT INTO `ordersum` VALUES ('9d49c468-6d21-41b5-8d45-7d7202929178', '-231', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f', 'fb276474-891d-4c41-b32b-96bcb5531675', '2018-04-03 14:13:05', '30.00', '30.00', '5bdd1587-c65e-4c95-84b0-1c83be168446');
INSERT INTO `ordersum` VALUES ('8d72064c-8a95-4740-a1e1-058a9e956633', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '3d5fbd91-ce72-4426-a573-2ba496710a6b', '2018-04-03 18:48:38', '0.00', '0.00', 'ef1bf0d3-9959-43f9-9b7f-18effbdc1a02');
INSERT INTO `ordersum` VALUES ('037c3673-3c3a-4b58-81dc-a6e90563b7cc', '-231', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '2018-04-04 18:43:39', '41.00', '41.00', 'acff1cb9-18a5-4963-976c-04dd78f1031b');
INSERT INTO `ordersum` VALUES ('c21fa5ed-9088-44c5-a774-29575d51d250', '-331', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '2018-04-04 19:01:34', '30.00', '14.00', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4');
INSERT INTO `ordersum` VALUES ('caf0c16c-3601-4919-96db-c0d55d1f1aca', '-231', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '2018-04-04 20:15:29', '30.00', '4.00', '5af60a58-368f-4d40-b522-49a685f977d8');
INSERT INTO `ordersum` VALUES ('3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '-231', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2018-04-05 10:29:02', '30.00', '27.00', 'b66a90f4-e5a6-4ba5-a64c-85221ae34828');
INSERT INTO `ordersum` VALUES ('2f15c6ad-10cd-4af9-a4ed-52f87b81b511', '311', 'e13cb91b-d429-4204-a185-48752af469f0', 'f6fe6270-ab84-42a2-a356-0cf1fc5d83de', '2018-04-05 16:55:44', '30.00', '30.00', null);
INSERT INTO `ordersum` VALUES ('3e16af28-6a16-4f15-b0de-319c337d816c', '-311', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '2018-04-05 20:21:40', '62.00', '51.00', '8d5fa78f-c3fb-48e7-9441-046d55522dc7,a9be6da1-71d3-4437-b617-4ce283c0d587');
INSERT INTO `ordersum` VALUES ('de12126d-0e9f-476f-970c-6a8c5bb18669', '-231', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '2018-04-07 17:53:31', '30.00', '30.00', '72d7b5fe-d664-421d-9ac5-9e9f9bc6fe82,7c3cbd28-fcc4-4b56-bcf4-8cfca9d1bf01');
INSERT INTO `ordersum` VALUES ('a7d9a12e-bac8-46bb-9202-221804b9c39d', '-231', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '2018-04-09 10:05:43', '21.00', '21.00', 'a6ac0da9-14dc-48c1-91ef-fd00cf86eb04');
INSERT INTO `ordersum` VALUES ('5af23dd7-52fb-4564-a13f-b3dfbadbff83', '-311', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', '2018-04-09 11:37:46', '43.00', '10.50', '6c2a26f9-f464-42ff-a699-a227cc617da4,487bd9a3-57b1-4583-8802-f614c2ded24e');
INSERT INTO `ordersum` VALUES ('74fc8789-52b0-4cce-b2f4-96806dd4a9bd', '-311', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '2018-04-09 13:05:10', '35.00', '27.00', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f');
INSERT INTO `ordersum` VALUES ('88ee2a06-b4e2-4880-9513-672587957a5e', '-211', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '2018-04-09 20:07:18', '40.00', '11.00', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3,fe4dc516-1b4b-42ad-ba51-5c79f200fa1e');
INSERT INTO `ordersum` VALUES ('eb579546-e561-41d6-8883-2ac4c992da09', '-211', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '2018-04-10 19:53:38', '39.00', '31.00', 'ded7ab44-98ea-4eff-b893-3ab04630129e');
INSERT INTO `ordersum` VALUES ('86cc94ef-b1c7-423a-8014-05dbc4183b9a', '-211', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '2018-04-09 23:35:10', '32.00', '21.00', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55');
INSERT INTO `ordersum` VALUES ('7640fe8b-266c-409b-95b9-05c500f199ef', '-231', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', '2018-04-11 14:38:33', '28.50', '28.50', 'd5d6e446-a790-46b7-a32c-c66c23f3a675');
INSERT INTO `ordersum` VALUES ('671aaf61-88cd-4331-aca6-e5b705f1cc37', '-231', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '2018-04-11 16:48:39', '30.00', '24.00', 'f42c23d6-7845-4509-8fab-1fcaf335e47f,a646c89d-0442-4e25-9c45-5b9eff323b1d');
INSERT INTO `ordersum` VALUES ('2c4cbcd0-d5b3-44be-a61d-765f3615f7fa', '-231', '18709a24-fda2-4522-aa3b-b29847cd9ca4', '1b201cf7-e147-4897-ac9d-71961be06c24', '2018-04-12 21:45:35', '30.00', '30.00', 'eb2a92df-b5b0-4f0e-9f6c-e26c17015ce2');
INSERT INTO `ordersum` VALUES ('c6f1133e-b164-48bf-9fae-a2cb3025ddee', '-331', '7f376be4-d891-48be-8529-9bc5b85185ca', '83802c3d-71c7-4ca1-9851-2975ee047139', '2018-04-27 11:42:26', '60.00', '60.00', 'e0e6bef2-788d-46d2-a932-ca45c282295f,1fdaed91-897f-4310-9a25-8679e482e2b6');
INSERT INTO `ordersum` VALUES ('955d6a87-6e80-4b6c-9e97-c30826b91bc8', '-231', 'ddbc6677-b375-4fe1-aede-968dc637e6c1', 'ac7ead61-9963-4e6b-a426-947a41a6712f', '2018-04-14 12:46:36', '30.00', '30.00', 'fcccc383-5a44-4683-b62c-b448f5c379e8,461e6bdd-9a65-4fa5-bda8-6350684f77f4');
INSERT INTO `ordersum` VALUES ('3cf9c2b5-4119-4805-ae3c-8bb7b0d53a46', '311', 'c69ae58f-dfc3-4278-bd90-dadabbd89860', '60c4cb47-c262-4337-8639-f4c38e525474', '2018-04-15 10:57:08', '31.00', '29.00', '2005fb38-1aff-4750-860c-5ab7ec146159');
INSERT INTO `ordersum` VALUES ('526c497e-7f5d-4ee8-809b-692c27d62a00', '-211', '20534a99-a8bf-4938-b70f-d50230796176', 'cd6dfb39-c2da-4fb3-a979-d63f4163da67', '2018-04-15 12:57:59', '31.00', '26.00', '5814d9fa-49fb-44ab-9304-70245d4f6836');
INSERT INTO `ordersum` VALUES ('56387025-5ace-4e50-bd1d-009dcce66ba0', '-231', '6ffa758e-b6c7-4d69-a7ed-28f9a5016eb7', '6ccefde6-6240-4ede-b185-bbd159285f1b', '2018-04-16 15:05:05', '22.00', '22.00', 'ef0127fa-d324-40ca-864a-5e411dc6e292');
INSERT INTO `ordersum` VALUES ('5d4bff69-5146-45da-850a-da1af1b79e0f', '-211', '2da7bbcb-aeff-40d8-90ea-3eab9575f076', '352ae049-419b-4b88-9a30-dea9e528480e', '2018-04-16 19:29:13', '31.00', '27.00', 'eb16769b-010f-4f88-ae0b-4e0cb99086f0');
INSERT INTO `ordersum` VALUES ('5a0dee65-df67-40ab-8597-f8b038926785', '-231', 'd8fdc43e-4794-4534-835f-22ac73aff251', 'f2de054e-d89b-4b06-b82c-81c01ccf689b', '2018-04-17 06:45:39', '21.00', '21.00', '825e99fc-f124-44c9-8170-33615b919da1');
INSERT INTO `ordersum` VALUES ('0627a0b0-990c-44e8-889a-997dc1c38873', '-211', '8abd5cd9-0089-4a9d-8d87-5859cd6c2566', '92f1e207-0d5f-4b6f-a8db-22a5eadafc29', '2018-04-17 14:34:53', '43.00', '43.00', '70274abd-1daa-4340-bf40-a76546da5c18');
INSERT INTO `ordersum` VALUES ('001505fe-0d9f-498e-a096-8146cd46ee2c', '-331', 'ad6b717b-0a88-404a-a17e-5701e87c457e', '52bf8ca5-29be-487e-8281-4ed3affe6df1', '2018-04-18 10:16:51', '30.00', '30.00', '6885bf52-bf18-41a9-ace3-fd81bad807f2');
INSERT INTO `ordersum` VALUES ('30884988-3ca6-4898-87b5-1fcbadfca60e', '-231', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '419f76c5-706e-4cb4-8419-b31addbc2f8b', '2018-04-26 11:05:38', '60.00', '60.00', 'a9c85356-8a45-41e7-9cdd-ef4ab92cb3c9,cd187583-5d30-4727-b352-60e6e84c2036');
INSERT INTO `ordersum` VALUES ('aeaf557b-e1b9-4d0f-8350-aadacbcaa5b1', '-211', '7d99fda9-2175-43d2-8680-78f0113e4dc9', '070e1e49-4c78-4781-8695-177fdf8d099e', '2018-04-19 10:49:35', '31.00', '31.00', 'fcf44ea2-6752-4f6d-84bd-3eb8f3b4295a');
INSERT INTO `ordersum` VALUES ('109e9f34-a6dd-47a4-ab46-fdb923e22234', '-211', 'ab52839e-f4b1-4db1-ac75-259c71b707cd', '4d5ae807-aad5-4b35-8f17-527cdfef6d40', '2018-04-19 20:30:34', '43.00', '43.00', '9c7678dc-bcc0-4221-8cb9-47f9f9e92217');
INSERT INTO `ordersum` VALUES ('3dd97ad6-8ea7-4176-8088-b7aaa66ce7fd', '-231', '6b528f9a-d2ca-401c-90b0-94a435569b9f', 'b0c16d71-c5e2-41b1-9940-9b6ff0212e21', '2018-04-20 10:43:00', '21.00', '21.00', 'd2f559b6-6611-4296-b46c-465e2a7f018a');
INSERT INTO `ordersum` VALUES ('ecf2e2e9-d2e1-43bb-9215-2d79c2feeb68', '-211', '3525470e-60fb-490c-9b85-7c7b10998328', 'b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '2018-04-20 11:28:22', '43.00', '38.00', '4106e469-d4e3-4069-b8db-b4cd7b8879e4');
INSERT INTO `ordersum` VALUES ('a9003567-6833-4b1d-bc29-f026a60cf3f7', '-211', 'a87a2eb8-b4e2-4258-9c18-acc15b48d416', '5290567a-b37e-4374-a14c-e9aca1052cf7', '2018-04-20 12:38:05', '30.00', '30.00', 'ed167607-0082-48fa-bb0e-1ab0acdc60bd');
INSERT INTO `ordersum` VALUES ('4683043f-3390-4dd6-98bc-bb193013447e', '-231', '2f79708d-ad15-454f-8bc4-7e610c732d3f', 'a59f7cd7-d935-4372-b153-4b8f5daabd03', '2018-04-20 20:57:13', '66.00', '48.50', '7f1832d8-58ae-42fa-be61-eabead92fb65');
INSERT INTO `ordersum` VALUES ('f41e0c78-f08a-46bc-b450-9ca1a6b65fe3', '-211', 'be5a1a9c-2eeb-40da-b5a3-20f5859dec34', 'a31e28a3-b2cc-436c-b89d-fb6dbc5cd3f1', '2018-04-20 21:51:01', '90.00', '90.00', 'e458b0fb-7bde-4e3f-badd-d6e32f270bfd');
INSERT INTO `ordersum` VALUES ('133fe431-4f9c-4e1b-a578-f5b1ab4b8490', '-211', 'cc00c551-9d32-4d2c-a16b-d92dd6ae6921', '32e7fcb2-e00a-49bd-89b9-f0665f08350a', '2018-04-21 11:27:46', '43.00', '43.00', 'fc75dcbc-47fd-4658-938b-d6fbbc5ddf4f');
INSERT INTO `ordersum` VALUES ('06a0d7ed-f1b8-434d-b7f2-e97205db773a', '-231', '128ddbf4-08fa-4968-b807-4805003e6921', '5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '2018-04-21 15:45:44', '31.00', '23.00', '9a6f431b-e8b9-4491-b4e8-1ed309cd16be');
INSERT INTO `ordersum` VALUES ('7dd4f339-8723-4132-98da-a597a0bd8fcb', '-211', '3241d692-8ee2-46b2-bd15-d0c02f991a86', 'fe696785-d70c-46d6-b8df-e778d00462f4', '2018-04-21 16:59:47', '31.00', '31.00', '193b33c9-b67a-4369-83e2-e4c393c55a3e');
INSERT INTO `ordersum` VALUES ('952af6a2-72eb-4fb2-93a0-f04b0658441d', '-311', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '3a614d80-f7bb-46d4-89da-23080e97ea02', '2018-04-21 20:30:38', '43.00', '38.00', 'd1614c47-e200-4dcd-afc9-3b47b23fae37');
INSERT INTO `ordersum` VALUES ('62426f43-72a0-41c7-aea4-3bbedbddbca1', '-211', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '87713b29-371d-453c-a3a6-99a13d45ef0f', '2018-04-22 14:46:45', '97.00', '93.00', 'ca629310-5a4f-4fa9-bca2-d42c642935ce');
INSERT INTO `ordersum` VALUES ('e860f44e-bb13-46da-974a-1318c409b0df', '-211', 'd1541f36-0bb8-41f1-9b3d-57ed642bb13c', '9f20b54b-df98-4ce1-9997-8b51e6266f78', '2018-04-22 23:00:09', '30.00', '30.00', '2958a37f-63b0-43ae-a608-1dbc06565d7e');
INSERT INTO `ordersum` VALUES ('7c0ba952-e24a-46f7-9936-0f39123e7a3b', '-211', '4a0b359f-b7ba-45c5-b746-cffe7ceff5a8', '67181c1a-d2df-4460-8751-035d1a1d4efd', '2018-04-24 21:49:16', '30.00', '30.00', '61290e17-dae0-4829-8d7f-dd9592170429');
INSERT INTO `ordersum` VALUES ('f4b3a0d4-89fe-471c-b74e-ce2d5875e10b', '-211', 'e902e3a3-6c25-4063-b4cb-dea3ce2de31b', '74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', '2018-04-24 22:13:50', '30.00', '25.50', '4ba8c060-9f43-4d91-8c5f-bf1034009612');
INSERT INTO `ordersum` VALUES ('1dfa98d6-7340-4fe2-831f-4659f43b5d58', '-211', '9722809f-a128-4505-8cd2-06a31c85e5c8', '61086778-f35a-4d8c-b1c0-434dc86fadeb', '2018-04-24 22:22:51', '30.00', '30.00', 'f4ce4f4a-6a74-4d5a-a790-6e761cd74f4b');
INSERT INTO `ordersum` VALUES ('526b8502-a426-4b33-9c78-be1c4cce6d7a', '-331', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', '2018-04-24 23:06:56', '130.00', '130.00', '965f2dae-5f9c-44e4-b112-a2e95d145caa,8ba8231a-f97a-462a-9e66-2d51a60bdffd,b091fd8c-2d36-49fd-848b-d79e48051330,7d2fafdf-59a7-42e8-9b5f-ad6ecc77c635,a138d70f-1d1c-4125-8ced-6d439e62c9dd,5a422905-d4ca-437e-a760-f67a8d556e18');
INSERT INTO `ordersum` VALUES ('2f244458-a170-4105-9a30-ef8003d748ab', '-231', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '2018-04-25 06:49:18', '72.00', '66.00', '527d5d96-6323-4dc4-957d-961f99aa89a6,f30382e7-5793-41c0-a015-6d805cd5b600');
INSERT INTO `ordersum` VALUES ('9e759c34-3066-4341-9639-2f6d7cdc2c57', '-211', '418c8290-93b5-467f-9d8b-c68ccd7761a5', '2aaccef3-b986-4e63-988c-ad059935854d', '2018-04-25 10:00:16', '41.00', '41.00', '5ecb88ae-a8f4-4466-9d98-65cc7a0e1df3');
INSERT INTO `ordersum` VALUES ('c6460f0b-6535-40f7-aa01-936c9c942ef6', '-211', 'ced058e2-c909-4579-9364-0dee8b1f8ef3', '705dc6e9-2639-4126-b0b1-1826d29eb1b9', '2018-04-25 19:25:39', '30.00', '22.00', 'd7eb7185-cfa1-4e18-b0ee-400b78264e84');
INSERT INTO `ordersum` VALUES ('66aa874a-01a1-43b4-86f2-78a598a8dd75', '-231', 'a4fd6fff-d63e-4184-be61-36f688db621a', '39bcba7c-99db-4d78-94ff-74c26585978c', '2018-04-26 09:59:11', '40.00', '40.00', 'dda4ead0-a980-4949-831b-58ce3d85c11c');
INSERT INTO `ordersum` VALUES ('f672df4d-8186-4f1f-8489-c598795fb255', '-211', '18174553-f629-48d7-83be-226feef83e4b', '0b54ce6d-bd5a-404d-9d14-caf89f84dd46', '2018-04-26 15:32:58', '30.00', '30.00', 'b852d275-4b27-49b0-803b-9e473007aadc');
INSERT INTO `ordersum` VALUES ('a60904e7-96d5-4493-a711-ed991ffa5b2c', '-311', '89df5d5d-c518-49c4-a68a-8922bcf3f5c0', 'c252c682-0615-4343-a69a-f329c2d41ee2', '2018-04-27 11:11:09', '30.00', '30.00', '83f9a61a-20b5-4b22-a2ac-b173e5962951');
INSERT INTO `ordersum` VALUES ('b690db34-c1fd-486b-8b27-75e2b9e91c1a', '-211', '2845241c-c49b-4f81-bc46-7dd7592c246a', '958e0b84-1956-4e2b-ac9b-9f9a6d0a9191', '2018-04-28 15:45:19', '30.00', '30.00', 'f135f396-3b40-4a3c-82d7-6fec63a24220');
INSERT INTO `ordersum` VALUES ('d9c3ec4b-da79-4955-81e3-9b94d04e400f', '-111', 'a74e1231-3e08-4db2-93f1-a79e8ff77251', 'bcf5c17a-4e4e-402c-b469-93b8d419678f', '2018-04-28 23:34:26', '30.00', '30.00', '346bf9b1-3cc7-436c-a08a-e4afb2891f21');
INSERT INTO `ordersum` VALUES ('98f75a62-a434-4f5d-87b1-77fab08d832b', '-311', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '1886a744-3e9e-4bce-b586-ac1c0027dd70', '2018-04-29 11:29:58', '32.00', '28.00', 'b3406a31-d46f-490b-ae07-611568f28075');
INSERT INTO `ordersum` VALUES ('84b7e745-03a6-4f9d-8720-c5466d287c39', '-211', '578b339d-e046-44a1-953b-4ab5cf8f9951', 'babdb37b-1824-4eab-93a9-ed0342e9eda8', '2018-04-30 13:34:46', '80.00', '80.00', null);
INSERT INTO `ordersum` VALUES ('0850927c-ab3b-4fc7-95d6-f34e0c054529', '-231', '520edb90-d404-4d5a-aa3e-448c90052e52', 'f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '2018-05-01 09:51:34', '22.00', '22.00', '4b55391a-dfea-4eee-a7b8-c80b1a9efb7f');

-- ----------------------------
-- Table structure for order_teaching_r
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
INSERT INTO `order_teaching_r` VALUES ('7f566938-d95e-4c4b-b536-4ec72287862a', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '2', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', '24652540-af54-4120-abc8-79d166778f82');
INSERT INTO `order_teaching_r` VALUES ('236bc37a-989e-4469-a29f-f8b476f64045', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '2', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda');
INSERT INTO `order_teaching_r` VALUES ('5e9be195-5683-446e-a03f-7f45b50f5f2b', 'a4ed1185-d523-498e-b6b2-cc8df7aad5d2', '1', 'f78c8319-85b8-4397-87eb-8922b52bb7be', '979dddd5-b5a5-420c-afe8-0799a2f181c4', '24652540-af54-4120-abc8-79d166778f82');
INSERT INTO `order_teaching_r` VALUES ('1f8743ea-6823-49db-bb78-30df932c44d0', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '8', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', '24652540-af54-4120-abc8-79d166778f82');
INSERT INTO `order_teaching_r` VALUES ('ff6cf303-ec72-44ee-942f-9c45833f11e0', '3caf39e6-add0-44d8-807f-739f43b69023', '9', 'f39682f3-e4f2-4e4a-ab74-7558f08e4768', 'a23d7de7-60fb-4977-9071-09ad795141b5', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('5bf11ef7-d53e-47ff-a57e-e18aed22910f', 'b2011fcc-b1d3-4f26-b79a-f2a0688cf518', '1', 'f78c8319-85b8-4397-87eb-8922b52bb7be', 'b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda');
INSERT INTO `order_teaching_r` VALUES ('bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', '2', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'fdca369d-d683-4aaf-ac12-cc7b37805d28');
INSERT INTO `order_teaching_r` VALUES ('dd7f3ed4-6b89-484f-af84-275df6c719a7', 'fe423223-0125-463e-a23e-c8759ca06222', '3', '971e4640-7ca7-48cb-8a2e-f46c408d66a4', '2f724a1e-3399-4652-89ed-cdf6af080c6f', '76a6c3d8-ef83-4fb7-bd5c-b27c47eccf02');
INSERT INTO `order_teaching_r` VALUES ('2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', '1', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('dde3612a-990b-43e8-8ebb-02123e838cc1', '127f313b-6c0f-4f6f-8909-8fede191732e', '2', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('6380cb70-c25e-4077-a2ff-b0f65449e08b', '127f313b-6c0f-4f6f-8909-8fede191732e', '3', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '2', 'ada7441e-2a38-4c03-aee6-234be39aa128', 'ccd49818-39cb-4ee1-b792-01688dfbef24', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4');
INSERT INTO `order_teaching_r` VALUES ('a4272eba-cc9c-40da-9e9e-a7b9662a46f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', '2', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', '2d3829b4-17b3-46af-bf50-cd0eba5430f8');
INSERT INTO `order_teaching_r` VALUES ('8fd5a867-cf4b-4163-889e-e0778641a4a5', 'a5a18141-b5bb-44b1-9b9a-fec6b6f9ca40', '1', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '397f9d9d-e20a-49b4-b199-669f60db95cf', '2d3829b4-17b3-46af-bf50-cd0eba5430f8');
INSERT INTO `order_teaching_r` VALUES ('9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5', 'd5b3a276-c468-49fc-9a19-12deccd4f5bb', '8', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', 'cbe83e91-b829-4dd8-b852-e1937c450fe9');
INSERT INTO `order_teaching_r` VALUES ('e64a4b66-c6d5-439d-b1ad-29929236a236', 'd5b3a276-c468-49fc-9a19-12deccd4f5bb', '2', '61a2d234-2403-434a-bb0b-be4dbc31bcc7', 'd15cad6d-218d-47aa-a5bd-513730c701c3', '8124288f-6f07-4cd0-a1ec-37a4e2171adb');
INSERT INTO `order_teaching_r` VALUES ('f849cbc7-5943-4710-b614-8f8cffd304e5', '87a767a8-22b6-48d9-a24a-cc6d52c975e9', '3', 'e46ae7bc-895e-4c52-ad67-b03f575b6227', 'e6058b90-7154-4677-8172-185b1e30f894', '537f3647-8444-4525-94c9-5af57c3f55e8');
INSERT INTO `order_teaching_r` VALUES ('8426c300-a528-4318-8983-4fd19f3f0ff0', 'f8dcbaac-c133-4a7b-a161-d896376e3fad', '3', 'ea35171a-848e-4d9c-8dc5-94e55607f68b', 'a7469233-0f1b-4399-b129-175f675263fa', '41816287-35ca-4235-bc89-ba2a2cb4abe1');
INSERT INTO `order_teaching_r` VALUES ('faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '2', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', 'bfc281a0-b413-4512-a5df-a227f4e0d4b2', '377be561-9aaf-43a2-8a0d-9b601021c0e0');
INSERT INTO `order_teaching_r` VALUES ('88952680-bedf-47cc-86ed-8d61aa95abb7', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '2', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3');
INSERT INTO `order_teaching_r` VALUES ('8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '1', 'f977c4bc-4de9-403e-b34d-730e03a0469c', '7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336');
INSERT INTO `order_teaching_r` VALUES ('f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '7', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '2bce5e19-c656-46ca-aa3b-5b5a0845c279');
INSERT INTO `order_teaching_r` VALUES ('425e3aab-b0d2-4521-b858-0a70509b5d9e', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '804e7d46-39ed-44e9-9ab4-cf06fac44d60');
INSERT INTO `order_teaching_r` VALUES ('7017346c-ff3f-4f42-9a40-e92dc324ef19', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '8', '4f64abe2-2e45-4b03-a4e6-4b1684255144', '6cf37dff-d157-40e2-80fe-f0ccbb6e6124', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de');
INSERT INTO `order_teaching_r` VALUES ('f558d3cb-3858-44de-aece-19b4ffc45396', '0074262e-7492-4540-a61a-ca5b55a31e45', '2', '9b2daa11-9851-41f0-8365-dc3ce439c584', '5cc50b32-8179-458f-9663-8704d9ebddff', '16684d26-3d14-45ff-8c3f-112d739be006');
INSERT INTO `order_teaching_r` VALUES ('748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', '1', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', 'a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369');
INSERT INTO `order_teaching_r` VALUES ('8ecacfdd-351a-4381-bf5c-29bf8a815a88', '3b3aed7a-88af-4738-95e9-e6884326dbfa', '7', '71ca2567-8288-433a-98ed-bbf3c00b9659', '3f197c20-4852-4af1-a3fe-4a91cba046a0', '27b5a1a7-624f-40e1-9359-9196d0261133');
INSERT INTO `order_teaching_r` VALUES ('a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '2', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1');
INSERT INTO `order_teaching_r` VALUES ('6a2f9398-4577-4d5c-925c-b32352714ad2', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '7', '5c46e95c-67de-483d-963c-e62865b80f64', '976c9d2a-c334-49bb-8cae-051af9eeae66', '8720b7bd-d7f8-4332-8254-1dee6e6ee071');
INSERT INTO `order_teaching_r` VALUES ('046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '3', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '853a2f31-f902-489c-8b7c-bea062277833');
INSERT INTO `order_teaching_r` VALUES ('39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '2', '00ccc852-42be-4e6d-98fe-df544f5d5984', '174c0610-22d9-4e7f-a40d-5a0bb9d62373', '167b5e9e-8e57-4549-91cd-c10802eadaf8');
INSERT INTO `order_teaching_r` VALUES ('5a978ecd-96da-4eae-b3f5-8706fcb3792e', '63de6f8f-666b-4127-bf5a-a76bec815c24', '2', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b');
INSERT INTO `order_teaching_r` VALUES ('f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '3', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '853a2f31-f902-489c-8b7c-bea062277833');
INSERT INTO `order_teaching_r` VALUES ('6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', '8591dca2-85c5-45f2-a103-f7b09ed8962f', '3', 'e4220f11-1e90-45b1-985a-3317cef45f4a', '5e923add-eaca-4bd3-acc2-27b1bb3c2240', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d');
INSERT INTO `order_teaching_r` VALUES ('9b6d689e-8671-4ee0-81f1-6cc27981b9c6', '63de6f8f-666b-4127-bf5a-a76bec815c24', '1', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513');
INSERT INTO `order_teaching_r` VALUES ('4d309b83-f780-4e70-9aaa-399c086cff52', '63de6f8f-666b-4127-bf5a-a76bec815c24', '7', 'acb53310-f57c-4494-bee1-01350617b37f', 'aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'edbfe293-e3a9-4062-8df4-318c836dd7e2');
INSERT INTO `order_teaching_r` VALUES ('f6dc4acc-f4d7-4aaf-b134-d818877620c9', '83bb28c1-8f21-483a-8348-07bf53f702ef', '2', 'b1475005-13a1-4485-b69d-babaaf35da66', '5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '63617903-e130-40ed-bb2f-b8ff2effb2fe');
INSERT INTO `order_teaching_r` VALUES ('a4dbc41f-3d29-4629-9d6d-1a3ff201eede', '53183a7a-8547-4823-b908-656b9e818f84', '2', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO `order_teaching_r` VALUES ('27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', '3', '205ee471-0dcd-430e-a558-df805a87fb62', '1c3e0941-112b-4664-9463-6865ec8c5912', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO `order_teaching_r` VALUES ('60f60bee-3cc0-45e5-ab06-1fdc359f744d', '53183a7a-8547-4823-b908-656b9e818f84', '7', '7f376be4-d891-48be-8529-9bc5b85185ca', 'c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '63617903-e130-40ed-bb2f-b8ff2effb2fe');
INSERT INTO `order_teaching_r` VALUES ('3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', '2', '57e0b0b8-98a2-44a2-b66f-b92af290e11c', 'fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb');
INSERT INTO `order_teaching_r` VALUES ('562f12cf-b532-44b1-8d55-dd55e8211fed', '7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '1', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31');
INSERT INTO `order_teaching_r` VALUES ('61290e17-dae0-4829-8d7f-dd9592170429', '7c0ba952-e24a-46f7-9936-0f39123e7a3b', '7', '4a0b359f-b7ba-45c5-b746-cffe7ceff5a8', '67181c1a-d2df-4460-8751-035d1a1d4efd', 'd8e1ff3e-56b4-4e75-8c80-88128501f979');
INSERT INTO `order_teaching_r` VALUES ('b56826ad-23bb-4162-8c5c-6cd7cf516889', '8104b7f0-b244-419c-9863-6fd617caf676', '2', '5c35d1d6-e854-4722-872d-da57ba2a6c91', 'a323675b-0a7f-4879-ab9e-33c1520f711f', 'dc9620b4-021a-4809-a238-7f83c80b636b');
INSERT INTO `order_teaching_r` VALUES ('bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'cec19c3d-e59f-48e9-8e55-6a06a88ae298', '2', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885', '2b1ec3b4-44b8-4be8-a009-24b7cb87717d', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af');
INSERT INTO `order_teaching_r` VALUES ('2e858069-8e55-45b6-9bdd-725eece0438b', '31c764a7-240c-4d72-8fff-46a3406d4bd3', '8', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', 'eda53a7c-3cf6-4b7e-a32d-845a622afe37', '5f53edf6-079a-4874-8e86-4c48d14a268e');
INSERT INTO `order_teaching_r` VALUES ('5bdd1587-c65e-4c95-84b0-1c83be168446', '9d49c468-6d21-41b5-8d45-7d7202929178', '2', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f', 'fb276474-891d-4c41-b32b-96bcb5531675', 'a541a150-d670-4d4e-a6ce-f3ef1517a5dc');
INSERT INTO `order_teaching_r` VALUES ('e3ff9924-100d-4a58-bbca-54d2fad68f69', 'eb4baf58-0f3e-4017-958c-a711c8f05ffb', '2', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a', 'ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '2317d1b6-f84d-4633-bc8c-97caaff69e16');
INSERT INTO `order_teaching_r` VALUES ('c6c96bcb-068b-4c03-af6b-9a855737bffd', '57690f2e-484f-466a-943d-6ae8b5eee0d7', '3', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '773ea73a-5135-41f4-8000-55901b2015a2', '436e705c-33e3-4f57-ba31-6eadb0596ac4');
INSERT INTO `order_teaching_r` VALUES ('b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', '2', 'acb5bc9f-534e-4661-b0b5-0054c5827683', '8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6');
INSERT INTO `order_teaching_r` VALUES ('3f62df1a-7ce8-4d41-9476-aec52a3c267d', '878030f0-b55b-4abc-9af7-16947f353ac1', '3', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d');
INSERT INTO `order_teaching_r` VALUES ('4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '3', '8c754fe0-ecca-4827-a94d-62c0400e5990', '591d3d72-c24e-4218-9b7e-9af08ce8e493', '776b3585-eb3d-4be2-85b0-6e833cf6a913');
INSERT INTO `order_teaching_r` VALUES ('63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', '3', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828', '7f0861de-91ef-4f10-9a4e-f836998778db', 'ebcea06f-b8ea-45f4-9c39-c843d648602c');
INSERT INTO `order_teaching_r` VALUES ('1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '2', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '8478bec7-44bc-4e19-b03e-445828affb23', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57');
INSERT INTO `order_teaching_r` VALUES ('f2eff1fa-55b8-4a6b-8d24-59773b22d648', '5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', '7', 'e8aedf60-f545-4165-8aac-be143e7394d8', '87561e40-93ca-436f-90a8-eef75fe735b3', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7');
INSERT INTO `order_teaching_r` VALUES ('9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c', '9461f1df-fa79-4609-88fe-757fd0ccf99c', '1', '90377ef4-f065-4fe0-9318-a093c74c800a', 'e816cc30-deb4-4c66-b310-92b91b4e7a5b', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e');
INSERT INTO `order_teaching_r` VALUES ('d8284412-4b3d-413c-88f3-d5c913f5df4f', 'ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '3', '59c108b6-64a5-44ed-b1c6-e05ff13a9254', 'cb59b673-ca98-44c8-9c11-edf767c19f5f', '44cd5d75-722e-4c03-ac2a-360e5447b97f');
INSERT INTO `order_teaching_r` VALUES ('b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '877e1ad7-3b46-4490-8930-5306cdad94f5', '2', '01df4fe5-315c-4db2-ab49-c314c9f891d3', '206036fd-d511-4eb0-b8d3-60c59bc84d15', '6c7dae17-0dcb-4263-89b2-ae255883c682');
INSERT INTO `order_teaching_r` VALUES ('ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', '2', '59a3027d-9bc9-4447-9b38-07b7b6769c0f', '79c93b34-1803-4808-8053-447c66039516', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc');
INSERT INTO `order_teaching_r` VALUES ('5643eb54-af69-48f5-8680-37c8a9076677', '127f313b-6c0f-4f6f-8909-8fede191732e', '7', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '6c69c410-b8f4-4e73-bddc-e7ced436868d', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3');
INSERT INTO `order_teaching_r` VALUES ('a6ac0da9-14dc-48c1-91ef-fd00cf86eb04', 'a7d9a12e-bac8-46bb-9202-221804b9c39d', '9', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '3f0355d3-94e5-471f-a78f-b84736bb8afd', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31');
INSERT INTO `order_teaching_r` VALUES ('1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '2', '610d212d-af5a-4c70-8098-aaece4e298ca', '48659507-3880-4c28-9788-55f1808ac1f2', '19115f9c-d7d6-4415-baab-27cb4973ce98');
INSERT INTO `order_teaching_r` VALUES ('63f9806d-4e5b-450f-b71b-0401699695e4', '8599b3df-ac74-4ce7-b46e-86101431294c', '2', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '58300141-5fec-4bc2-8820-fcc41947142d', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda');
INSERT INTO `order_teaching_r` VALUES ('b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '3', 'daa3f486-e6ce-4b50-ad09-519dac09757e', 'b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0');
INSERT INTO `order_teaching_r` VALUES ('37e49b33-f12a-4693-9e11-aed0bf39f981', 'b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '1', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO `order_teaching_r` VALUES ('3e9162a0-a70e-4bef-905a-a40c0ba0df2a', 'b0f6bbdc-3f81-41da-b769-66448f8ec5f6', '2', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '01bf9958-85e2-49e6-a36c-2840efd63af0', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96');
INSERT INTO `order_teaching_r` VALUES ('acff1cb9-18a5-4963-976c-04dd78f1031b', '037c3673-3c3a-4b58-81dc-a6e90563b7cc', '2', '2782f2e4-5682-40e7-8930-193b1b8de791', 'ae977c03-3f44-49f5-9c7d-842e0d135899', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e');
INSERT INTO `order_teaching_r` VALUES ('78b8f787-05df-4ad1-bdcb-466804c52dd4', '999f9085-f746-4f88-810b-bb266dc4cc3b', '1', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('72d7b5fe-d664-421d-9ac5-9e9f9bc6fe82', 'de12126d-0e9f-476f-970c-6a8c5bb18669', '7', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '2c64d354-e9db-441d-8271-061d46813abb');
INSERT INTO `order_teaching_r` VALUES ('7c3cbd28-fcc4-4b56-bcf4-8cfca9d1bf01', 'de12126d-0e9f-476f-970c-6a8c5bb18669', '8', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', 'ac37a69a-8f81-4f35-950d-44586364969b');
INSERT INTO `order_teaching_r` VALUES ('b66a90f4-e5a6-4ba5-a64c-85221ae34828', '3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '7', 'ab5befbe-9b50-4c79-9496-0edd136839fc', '4e708d29-d4b9-47d3-8fb9-1b98127896aa', '2f6a5e5b-4e32-46d0-8942-5e730051b99a');
INSERT INTO `order_teaching_r` VALUES ('8d5fa78f-c3fb-48e7-9441-046d55522dc7', '3e16af28-6a16-4f15-b0de-319c337d816c', '7', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '6620857b-7472-4960-a7f7-870244cad689');
INSERT INTO `order_teaching_r` VALUES ('a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '3', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad', 'e269d805-f0a4-46c5-b27a-66e9b58f673f', '73818668-89b4-4f28-b928-6b454641aaae');
INSERT INTO `order_teaching_r` VALUES ('2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', '2', 'a36d5226-313a-4af6-9a2c-21700f53bd90', '223d8a75-6e4e-4ad6-a441-af98e0a2cfad', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735');
INSERT INTO `order_teaching_r` VALUES ('487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', '8', 'f7166d68-6dd7-4b05-b094-31a454c844b9', '329ec215-a3dc-427d-ac97-95f0cc0a2519', 'db66fd38-466a-4620-9890-6abb10a67a22');
INSERT INTO `order_teaching_r` VALUES ('e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', '3', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', 'b21addc3-003c-42be-afaa-ab7064d6e144');
INSERT INTO `order_teaching_r` VALUES ('5a88004b-a6ed-4463-aa35-33f6befbff13', 'e37770db-2e80-422e-b4d3-e12cab81145a', '2', '08157e24-cdda-46d0-a4e1-56cc607c2951', '410f3152-0fb1-40cd-b983-a0b4189d1a10', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e');
INSERT INTO `order_teaching_r` VALUES ('2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '8', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '19115f9c-d7d6-4415-baab-27cb4973ce98');
INSERT INTO `order_teaching_r` VALUES ('fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', '9', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807', 'fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d');
INSERT INTO `order_teaching_r` VALUES ('92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '2', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '7cd1b3ff-571d-430b-b77e-92d1712a8418', '167b5e9e-8e57-4549-91cd-c10802eadaf8');
INSERT INTO `order_teaching_r` VALUES ('5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', '2', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631', 'bbca876c-8f6f-4b8a-bcd0-c247ae937d18', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8');
INSERT INTO `order_teaching_r` VALUES ('ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '2', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '05ec9947-b03e-4533-a5a6-8eaf19c03e62', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1');
INSERT INTO `order_teaching_r` VALUES ('5814d9fa-49fb-44ab-9304-70245d4f6836', '526c497e-7f5d-4ee8-809b-692c27d62a00', '3', '20534a99-a8bf-4938-b70f-d50230796176', 'cd6dfb39-c2da-4fb3-a979-d63f4163da67', '771d1e22-ae10-46fc-92af-e7eb2df326b4');
INSERT INTO `order_teaching_r` VALUES ('2005fb38-1aff-4750-860c-5ab7ec146159', '3cf9c2b5-4119-4805-ae3c-8bb7b0d53a46', '2', 'c69ae58f-dfc3-4278-bd90-dadabbd89860', '60c4cb47-c262-4337-8639-f4c38e525474', 'b8ef7e22-3952-403d-af92-dfdcbe250073');
INSERT INTO `order_teaching_r` VALUES ('fcccc383-5a44-4683-b62c-b448f5c379e8', '955d6a87-6e80-4b6c-9e97-c30826b91bc8', '8', 'ddbc6677-b375-4fe1-aede-968dc637e6c1', 'ac7ead61-9963-4e6b-a426-947a41a6712f', '2133b201-f1d2-40ab-bdbe-7cfededeaa1d');
INSERT INTO `order_teaching_r` VALUES ('527d5d96-6323-4dc4-957d-961f99aa89a6', '2f244458-a170-4105-9a30-ef8003d748ab', '3', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', 'dbba29e9-60d9-49d1-8fb9-0b820a72d825');
INSERT INTO `order_teaching_r` VALUES ('fcf44ea2-6752-4f6d-84bd-3eb8f3b4295a', 'aeaf557b-e1b9-4d0f-8350-aadacbcaa5b1', '2', '7d99fda9-2175-43d2-8680-78f0113e4dc9', '070e1e49-4c78-4781-8695-177fdf8d099e', '06b3e395-0bde-43cc-b26e-68076de7dfc1');
INSERT INTO `order_teaching_r` VALUES ('d2f559b6-6611-4296-b46c-465e2a7f018a', '3dd97ad6-8ea7-4176-8088-b7aaa66ce7fd', '7', '6b528f9a-d2ca-401c-90b0-94a435569b9f', 'b0c16d71-c5e2-41b1-9940-9b6ff0212e21', '48f3736e-a5d3-436e-ad4e-200646f8a6b7');
INSERT INTO `order_teaching_r` VALUES ('ed167607-0082-48fa-bb0e-1ab0acdc60bd', 'a9003567-6833-4b1d-bc29-f026a60cf3f7', '7', 'a87a2eb8-b4e2-4258-9c18-acc15b48d416', '5290567a-b37e-4374-a14c-e9aca1052cf7', 'b13c5b94-b066-44af-b4c4-145c9d8612a0');
INSERT INTO `order_teaching_r` VALUES ('4106e469-d4e3-4069-b8db-b4cd7b8879e4', 'ecf2e2e9-d2e1-43bb-9215-2d79c2feeb68', '2', '3525470e-60fb-490c-9b85-7c7b10998328', 'b9376b07-9ec4-4f90-ae89-0e82c00f40d9', 'a295affa-be14-48e3-aece-dfad1ea22b6a');
INSERT INTO `order_teaching_r` VALUES ('a9c85356-8a45-41e7-9cdd-ef4ab92cb3c9', '30884988-3ca6-4898-87b5-1fcbadfca60e', '2', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '419f76c5-706e-4cb4-8419-b31addbc2f8b', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e');
INSERT INTO `order_teaching_r` VALUES ('6885bf52-bf18-41a9-ace3-fd81bad807f2', '001505fe-0d9f-498e-a096-8146cd46ee2c', '2', 'ad6b717b-0a88-404a-a17e-5701e87c457e', '52bf8ca5-29be-487e-8281-4ed3affe6df1', '994d9e91-ced6-4f21-a8ec-ceab54d904a8');
INSERT INTO `order_teaching_r` VALUES ('70274abd-1daa-4340-bf40-a76546da5c18', '0627a0b0-990c-44e8-889a-997dc1c38873', '2', '8abd5cd9-0089-4a9d-8d87-5859cd6c2566', '92f1e207-0d5f-4b6f-a8db-22a5eadafc29', '7ae86dca-93bd-4f69-b00a-66447de5ec35');
INSERT INTO `order_teaching_r` VALUES ('825e99fc-f124-44c9-8170-33615b919da1', '5a0dee65-df67-40ab-8597-f8b038926785', '2', 'd8fdc43e-4794-4534-835f-22ac73aff251', 'f2de054e-d89b-4b06-b82c-81c01ccf689b', '51669f73-2654-42db-a7d3-8c51c430a564');
INSERT INTO `order_teaching_r` VALUES ('eb16769b-010f-4f88-ae0b-4e0cb99086f0', '5d4bff69-5146-45da-850a-da1af1b79e0f', '2', '2da7bbcb-aeff-40d8-90ea-3eab9575f076', '352ae049-419b-4b88-9a30-dea9e528480e', '58a28496-ac22-42cb-991e-899bc221076e');
INSERT INTO `order_teaching_r` VALUES ('ef0127fa-d324-40ca-864a-5e411dc6e292', '56387025-5ace-4e50-bd1d-009dcce66ba0', '1', '6ffa758e-b6c7-4d69-a7ed-28f9a5016eb7', '6ccefde6-6240-4ede-b185-bbd159285f1b', 'd33b37fe-fbcf-461c-bf89-d4ae7b12cfbf');
INSERT INTO `order_teaching_r` VALUES ('461e6bdd-9a65-4fa5-bda8-6350684f77f4', '955d6a87-6e80-4b6c-9e97-c30826b91bc8', '7', 'ddbc6677-b375-4fe1-aede-968dc637e6c1', 'ac7ead61-9963-4e6b-a426-947a41a6712f', 'f56622b7-8284-4a17-9627-1f51bfd65992');
INSERT INTO `order_teaching_r` VALUES ('1fdaed91-897f-4310-9a25-8679e482e2b6', 'c6f1133e-b164-48bf-9fae-a2cb3025ddee', '1', '7f376be4-d891-48be-8529-9bc5b85185ca', '83802c3d-71c7-4ca1-9851-2975ee047139', '3f26b978-1499-4da6-bb18-42750bafc010');
INSERT INTO `order_teaching_r` VALUES ('e0e6bef2-788d-46d2-a932-ca45c282295f', 'c6f1133e-b164-48bf-9fae-a2cb3025ddee', '2', '7f376be4-d891-48be-8529-9bc5b85185ca', '83802c3d-71c7-4ca1-9851-2975ee047139', 'da2f806c-7f57-4318-894a-c10a217ff92c');
INSERT INTO `order_teaching_r` VALUES ('eb2a92df-b5b0-4f0e-9f6c-e26c17015ce2', '2c4cbcd0-d5b3-44be-a61d-765f3615f7fa', '2', '18709a24-fda2-4522-aa3b-b29847cd9ca4', '1b201cf7-e147-4897-ac9d-71961be06c24', '69c5fa24-b1c3-4553-a0a9-51fa6c819c61');
INSERT INTO `order_teaching_r` VALUES ('f42c23d6-7845-4509-8fab-1fcaf335e47f', '671aaf61-88cd-4331-aca6-e5b705f1cc37', '1', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31');
INSERT INTO `order_teaching_r` VALUES ('a646c89d-0442-4e25-9c45-5b9eff323b1d', '671aaf61-88cd-4331-aca6-e5b705f1cc37', '2', 'f2bfda12-0dcc-4cd0-824d-b90283d35745', '3a894527-e23e-46b2-b6c5-f0ca8dfa2765', 'b114c3e9-e426-47f2-9b7d-d2e40cde5135');
INSERT INTO `order_teaching_r` VALUES ('9c7678dc-bcc0-4221-8cb9-47f9f9e92217', '109e9f34-a6dd-47a4-ab46-fdb923e22234', '1', 'ab52839e-f4b1-4db1-ac75-259c71b707cd', '4d5ae807-aad5-4b35-8f17-527cdfef6d40', '9e761589-bc5c-4e31-beab-913b56a87302');
INSERT INTO `order_teaching_r` VALUES ('d5d6e446-a790-46b7-a32c-c66c23f3a675', '7640fe8b-266c-409b-95b9-05c500f199ef', '8', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '64a9944a-3e14-4cc1-af56-3a74bab92a8b', 'ee68eb0f-d789-4e2f-9196-d77e8d3694fa');
INSERT INTO `order_teaching_r` VALUES ('7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', '8', '2f79708d-ad15-454f-8bc4-7e610c732d3f', 'a59f7cd7-d935-4372-b153-4b8f5daabd03', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d');
INSERT INTO `order_teaching_r` VALUES ('ca629310-5a4f-4fa9-bca2-d42c642935ce', '62426f43-72a0-41c7-aea4-3bbedbddbca1', '3', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '87713b29-371d-453c-a3a6-99a13d45ef0f', '138f56d7-5fcf-43aa-b42b-1f81b7ba86d3');
INSERT INTO `order_teaching_r` VALUES ('e458b0fb-7bde-4e3f-badd-d6e32f270bfd', 'f41e0c78-f08a-46bc-b450-9ca1a6b65fe3', '2', 'be5a1a9c-2eeb-40da-b5a3-20f5859dec34', 'a31e28a3-b2cc-436c-b89d-fb6dbc5cd3f1', '6ee9e5c1-3cf8-46ce-b68f-d92fdb9138fe');
INSERT INTO `order_teaching_r` VALUES ('f30382e7-5793-41c0-a015-6d805cd5b600', '2f244458-a170-4105-9a30-ef8003d748ab', '2', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '79807fad-b099-460e-ada4-7e7831c3c85d', '901397e7-c308-4344-96be-d7cef586b9c8');
INSERT INTO `order_teaching_r` VALUES ('fc75dcbc-47fd-4658-938b-d6fbbc5ddf4f', '133fe431-4f9c-4e1b-a578-f5b1ab4b8490', '2', 'cc00c551-9d32-4d2c-a16b-d92dd6ae6921', '32e7fcb2-e00a-49bd-89b9-f0665f08350a', '878cf7d9-1888-40fc-871f-89f3687b34b8');
INSERT INTO `order_teaching_r` VALUES ('f4ce4f4a-6a74-4d5a-a790-6e761cd74f4b', '1dfa98d6-7340-4fe2-831f-4659f43b5d58', '9', '9722809f-a128-4505-8cd2-06a31c85e5c8', '61086778-f35a-4d8c-b1c0-434dc86fadeb', 'd63a2009-f036-4e70-a4f0-a56988aeb0d1');
INSERT INTO `order_teaching_r` VALUES ('d7eb7185-cfa1-4e18-b0ee-400b78264e84', 'c6460f0b-6535-40f7-aa01-936c9c942ef6', '9', 'ced058e2-c909-4579-9364-0dee8b1f8ef3', '705dc6e9-2639-4126-b0b1-1826d29eb1b9', 'ebedc957-1970-4c7f-a114-aadf4d8dc953');
INSERT INTO `order_teaching_r` VALUES ('193b33c9-b67a-4369-83e2-e4c393c55a3e', '7dd4f339-8723-4132-98da-a597a0bd8fcb', '2', '3241d692-8ee2-46b2-bd15-d0c02f991a86', 'fe696785-d70c-46d6-b8df-e778d00462f4', 'f1db1e06-92b4-4f94-902d-5503e6cb1a02');
INSERT INTO `order_teaching_r` VALUES ('dda4ead0-a980-4949-831b-58ce3d85c11c', '66aa874a-01a1-43b4-86f2-78a598a8dd75', '7', 'a4fd6fff-d63e-4184-be61-36f688db621a', '39bcba7c-99db-4d78-94ff-74c26585978c', '7ae86dca-93bd-4f69-b00a-66447de5ec35');
INSERT INTO `order_teaching_r` VALUES ('d1614c47-e200-4dcd-afc9-3b47b23fae37', '952af6a2-72eb-4fb2-93a0-f04b0658441d', '3', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '3a614d80-f7bb-46d4-89da-23080e97ea02', '481db1db-22aa-471a-b321-b69143da727f');
INSERT INTO `order_teaching_r` VALUES ('5a657d14-c207-411d-8bdf-cf6cb8e0db70', 'fa92b9ba-f1be-4461-b261-2342b3025145', '3', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', '35f12b3c-d029-459c-9b7c-619f3f44f2ef', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('cd187583-5d30-4727-b352-60e6e84c2036', '30884988-3ca6-4898-87b5-1fcbadfca60e', '7', '79e4bdc8-874d-4cb2-a907-58215f7af76e', '419f76c5-706e-4cb4-8419-b31addbc2f8b', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135');
INSERT INTO `order_teaching_r` VALUES ('b852d275-4b27-49b0-803b-9e473007aadc', 'f672df4d-8186-4f1f-8489-c598795fb255', '2', '18174553-f629-48d7-83be-226feef83e4b', '0b54ce6d-bd5a-404d-9d14-caf89f84dd46', '143a318e-56f1-4237-a47f-0c31c7853ce4');
INSERT INTO `order_teaching_r` VALUES ('a7aeab52-e5fb-4a4a-8418-6f62e2fcb3d9', '999f9085-f746-4f88-810b-bb266dc4cc3b', '5', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'd1567855-910a-44b2-950a-58fd9b3338b7', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('322e7938-af42-48ec-9fb9-8bd4a66c316c', '26e412cf-a8e8-401c-88fa-fe37aa6bb208', '5', '7f376be4-d891-48be-8529-9bc5b85185ca', '4426451c-de65-4564-8ddf-2bbee72841ae', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('ed49c2bd-76cd-4716-a692-ab32a84c7c56', 'a809032f-f82c-4003-9e70-26b8e6368db1', '6', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'fbbd1e55-2923-4010-9125-e4aeb425b229', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `order_teaching_r` VALUES ('83f9a61a-20b5-4b22-a2ac-b173e5962951', 'a60904e7-96d5-4493-a711-ed991ffa5b2c', '2', '89df5d5d-c518-49c4-a68a-8922bcf3f5c0', 'c252c682-0615-4343-a69a-f329c2d41ee2', '34ce2ee0-f9d9-407d-98b5-295574d8c9a3');
INSERT INTO `order_teaching_r` VALUES ('4b55391a-dfea-4eee-a7b8-c80b1a9efb7f', '0850927c-ab3b-4fc7-95d6-f34e0c054529', '7', '520edb90-d404-4d5a-aa3e-448c90052e52', 'f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '48f3736e-a5d3-436e-ad4e-200646f8a6b7');
INSERT INTO `order_teaching_r` VALUES ('4ba8c060-9f43-4d91-8c5f-bf1034009612', 'f4b3a0d4-89fe-471c-b74e-ce2d5875e10b', '2', 'e902e3a3-6c25-4063-b4cb-dea3ce2de31b', '74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', '9321916c-1b48-4d88-84eb-1303b2efd648');
INSERT INTO `order_teaching_r` VALUES ('346bf9b1-3cc7-436c-a08a-e4afb2891f21', 'd9c3ec4b-da79-4955-81e3-9b94d04e400f', '3', 'a74e1231-3e08-4db2-93f1-a79e8ff77251', 'bcf5c17a-4e4e-402c-b469-93b8d419678f', 'b7f5a0ba-8b98-4374-acc9-7cc68cccf32a');
INSERT INTO `order_teaching_r` VALUES ('f135f396-3b40-4a3c-82d7-6fec63a24220', 'b690db34-c1fd-486b-8b27-75e2b9e91c1a', '9', '2845241c-c49b-4f81-bc46-7dd7592c246a', '958e0b84-1956-4e2b-ac9b-9f9a6d0a9191', 'a5600e67-5b20-435d-ad17-43ad3a9c9b58');
INSERT INTO `order_teaching_r` VALUES ('5ecb88ae-a8f4-4466-9d98-65cc7a0e1df3', '9e759c34-3066-4341-9639-2f6d7cdc2c57', '1', '418c8290-93b5-467f-9d8b-c68ccd7761a5', '2aaccef3-b986-4e63-988c-ad059935854d', '1d3d3525-7dcd-4bf0-9b42-787fa94ec052');
INSERT INTO `order_teaching_r` VALUES ('e497b4ec-2aea-4dde-8022-398563cace59', 'cac4f35f-5bbf-47fb-8143-0e47990c8465', '3', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '0cf74357-767e-4a3b-8202-943436f4995c', 'ebcea06f-b8ea-45f4-9c39-c843d648602c');
INSERT INTO `order_teaching_r` VALUES ('2958a37f-63b0-43ae-a608-1dbc06565d7e', 'e860f44e-bb13-46da-974a-1318c409b0df', '2', 'd1541f36-0bb8-41f1-9b3d-57ed642bb13c', '9f20b54b-df98-4ce1-9997-8b51e6266f78', '0c3d5ce8-692f-4a71-a3e7-23d892be8a68');
INSERT INTO `order_teaching_r` VALUES ('31464416-5264-4c76-b092-1f9fbd9492b6', '96a03d6a-1452-4c35-870f-479a373c6c5e', '8', 'f227e1c1-2002-456c-ac75-bb01e4a17290', '85fab9b6-cf10-4c97-8a4a-09b7a279a976', '150ee67b-967a-42d4-9e35-1ca1288624ec');
INSERT INTO `order_teaching_r` VALUES ('c4687b90-59ee-490e-ad3c-19c1ac078a6d', '878030f0-b55b-4abc-9af7-16947f353ac1', '4', '5138ed9b-82af-4252-9c10-0943693449ae', '279c6d0d-1a69-4155-927d-e50faf8787b6', '48931aa9-b9dc-47af-b19c-dc4af5632c90');
INSERT INTO `order_teaching_r` VALUES ('9a6f431b-e8b9-4491-b4e8-1ed309cd16be', '06a0d7ed-f1b8-434d-b7f2-e97205db773a', '2', '128ddbf4-08fa-4968-b807-4805003e6921', '5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', 'df1de484-42a5-4545-bb78-ecef591a7757');
INSERT INTO `order_teaching_r` VALUES ('b3406a31-d46f-490b-ae07-611568f28075', '98f75a62-a434-4f5d-87b1-77fab08d832b', '3', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '1886a744-3e9e-4bce-b586-ac1c0027dd70', '776b3585-eb3d-4be2-85b0-6e833cf6a913');
INSERT INTO `order_teaching_r` VALUES ('965f2dae-5f9c-44e4-b112-a2e95d145caa', '526b8502-a426-4b33-9c78-be1c4cce6d7a', '2', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', 'd41c79a8-faee-4a45-a5f0-537b6174e202');
INSERT INTO `order_teaching_r` VALUES ('8ba8231a-f97a-462a-9e66-2d51a60bdffd', '526b8502-a426-4b33-9c78-be1c4cce6d7a', '1', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', 'dff9942a-9857-4949-bed4-84aab3ebd856');
INSERT INTO `order_teaching_r` VALUES ('b091fd8c-2d36-49fd-848b-d79e48051330', '526b8502-a426-4b33-9c78-be1c4cce6d7a', '3', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', '33b26c83-9f54-42f9-8fbd-f0d30e8ee845');
INSERT INTO `order_teaching_r` VALUES ('7d2fafdf-59a7-42e8-9b5f-ad6ecc77c635', '526b8502-a426-4b33-9c78-be1c4cce6d7a', '7', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', '1ff09d22-eb3e-4c29-be58-531e420fb440');
INSERT INTO `order_teaching_r` VALUES ('a138d70f-1d1c-4125-8ced-6d439e62c9dd', '526b8502-a426-4b33-9c78-be1c4cce6d7a', '8', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', 'db66fd38-466a-4620-9890-6abb10a67a22');
INSERT INTO `order_teaching_r` VALUES ('5a422905-d4ca-437e-a760-f67a8d556e18', '526b8502-a426-4b33-9c78-be1c4cce6d7a', '9', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '34edbf52-06cc-4eed-aef7-08b9311e6601', '749341e5-512b-49b0-8633-d3b35eb65c89');

-- ----------------------------
-- Table structure for parents
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents` (
  `parentId` varchar(36) NOT NULL,
  `parentName` varchar(36) DEFAULT NULL,
  `telNum` varchar(30) DEFAULT NULL,
  `weChatNum` varchar(36) DEFAULT NULL,
  `openId` varchar(36) DEFAULT NULL COMMENT '全表唯一(可用于定位单独的某一家长）',
  PRIMARY KEY (`parentId`),
  UNIQUE KEY `AK_unique_key2` (`telNum`),
  UNIQUE KEY `AK_unique_key` (`openId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='家长表';

-- ----------------------------
-- Records of parents
-- ----------------------------
INSERT INTO `parents` VALUES ('aaaa', 'aaaa', '18711019945', '15578901234', 'aaaaaaa');
INSERT INTO `parents` VALUES ('f39682f3-e4f2-4e4a-ab74-7558f08e4768', '王家长', '18711018800', '15578904433', 'aaaaabb');
INSERT INTO `parents` VALUES ('f78c8319-85b8-4397-87eb-8922b52bb7be', '李四家长', '15788213334', '', 'lisiparentsId');
INSERT INTO `parents` VALUES ('36aecc30-94d8-40e6-b56d-a17f1d60a7b9', 'Dengzhihua', '18711019949', '', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70');
INSERT INTO `parents` VALUES ('7f376be4-d891-48be-8529-9bc5b85185ca', '紫威爸爸', '15580830465', null, 'oVbXbw4x8YNsY8M4mkHsprPUNLoo');
INSERT INTO `parents` VALUES ('00ccc852-42be-4e6d-98fe-df544f5d5984', '邓女士', '13875911271', null, 'oVbXbw8eO3oOM-uexSl8zfPRAIlM');
INSERT INTO `parents` VALUES ('4f64abe2-2e45-4b03-a4e6-4b1684255144', '夏玉荣', '18974611518', null, 'oVbXbw5QHZoq6ViOgx-E1AEBfXeA');
INSERT INTO `parents` VALUES ('a712fda3-c0c0-49aa-be5d-4e90401c368b', '何', '18702618899', null, 'oVbXbw9JLABqrfu3YB3AxpOsI56w');
INSERT INTO `parents` VALUES ('9b3f02ae-a952-40ee-b3f1-3ec2f371fb15', '测试', '1', null, 'oVbXbw1H5yK7VmcaQAsgBvxLXDwo');
INSERT INTO `parents` VALUES ('b69c3ccb-f365-4740-b659-ec0e2d13f13b', '555', '1234567', null, 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw');
INSERT INTO `parents` VALUES ('cf7d84ad-4dcb-4d0e-8df1-0a9cce568149', '王利红', '13617483661', null, 'oVbXbw2nFXVjiygGB4yWRWmJwZGA');
INSERT INTO `parents` VALUES ('e4220f11-1e90-45b1-985a-3317cef45f4a', '陶豆豆', '18670314266', '', 'oVbXbw-sg31MqzYypipxso5ik7Jw');
INSERT INTO `parents` VALUES ('f977c4bc-4de9-403e-b34d-730e03a0469c', '曹艳', '13808463279', null, 'oVbXbw-wH1caZFtcestY2i9QNrp8');
INSERT INTO `parents` VALUES ('acb53310-f57c-4494-bee1-01350617b37f', '袁改华', '18975898882', null, 'oVbXbw7822ek7xNh2gzfni4nX64g');
INSERT INTO `parents` VALUES ('ada7441e-2a38-4c03-aee6-234be39aa128', '夏艺菲', '13080525539', null, 'oVbXbw5HKJbeWT6WGh7zAhfLm_Ns');
INSERT INTO `parents` VALUES ('71ca2567-8288-433a-98ed-bbf3c00b9659', '尹满枚', '15367648823', null, 'oVbXbwyHsjmIuzwE-YA9X90QyBcM');
INSERT INTO `parents` VALUES ('18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42', '白玉萍', '13707319633', null, 'oVbXbw2V47NX1QcBtqffbsNRtFLA');
INSERT INTO `parents` VALUES ('01df4fe5-315c-4db2-ab49-c314c9f891d3', '黄初民', '13874538730', null, 'oVbXbwzp8RGQYkYcjF_SsdF6EFHY');
INSERT INTO `parents` VALUES ('daa3f486-e6ce-4b50-ad09-519dac09757e', '路娜', '13787016094', null, 'oVbXbw2J9BYOnESANFLnTm2CLVAE');
INSERT INTO `parents` VALUES ('5c46e95c-67de-483d-963c-e62865b80f64', '付玉芳', '18670015918', null, 'oVbXbwx4K2ywmAOIJjI4JNFJoVn4');
INSERT INTO `parents` VALUES ('57e0b0b8-98a2-44a2-b66f-b92af290e11c', '张泓练', '13787075423', null, 'oVbXbwwpZ1vAiBDoTV6h5Y_mtNO4');
INSERT INTO `parents` VALUES ('bd2bfad2-d416-4939-81b0-bec28836261a', null, '18574392815', 'l1787180652', 'oVbXbw5s50vdkLFZWcs3iDU5tX3M');
INSERT INTO `parents` VALUES ('f62115b3-d4ae-49e7-97b0-57f35cd5f828', '匡先生', '17673134545', null, 'oVbXbw0e5GYmDckFplHH5OCH_X3c');
INSERT INTO `parents` VALUES ('ea35171a-848e-4d9c-8dc5-94e55607f68b', '侯国', '18670334562', null, 'oVbXbwybMON0X1gSBtS9ayikxPw4');
INSERT INTO `parents` VALUES ('59c108b6-64a5-44ed-b1c6-e05ff13a9254', '李艳红', '13107211065', null, 'oVbXbw5d3U3pgAADE2wjuj5cR8t4');
INSERT INTO `parents` VALUES ('ba55085d-b32b-46f0-950c-3f21029d77a8', null, '18574384061', '3361212227', 'oVbXbwwOE7yzHjGJp1Pd7Cw00tN8');
INSERT INTO `parents` VALUES ('e46ae7bc-895e-4c52-ad67-b03f575b6227', '汪嘉陵', '13517418068', null, 'oVbXbw4VvGPQs8BodXl5gJPqtL5M');
INSERT INTO `parents` VALUES ('90377ef4-f065-4fe0-9318-a093c74c800a', '陈正春', '15674869808', null, 'oVbXbwwn_1abXhL6bfOyYrqnXaIc');
INSERT INTO `parents` VALUES ('b1475005-13a1-4485-b69d-babaaf35da66', '廖辉', '18874165445', null, 'oVbXbwy6gqNxmwBxqdWx2RqPhEPU');
INSERT INTO `parents` VALUES ('08157e24-cdda-46d0-a4e1-56cc607c2951', '刘婧', '13974635575', null, 'oVbXbw4MjDaF8F44mcy_mMgWGT9E');
INSERT INTO `parents` VALUES ('5138ed9b-82af-4252-9c10-0943693449ae', '许斌海', '18973508826', null, 'oVbXbwyUuyPAmfFhzKvwEwWLUf1g');
INSERT INTO `parents` VALUES ('59a3027d-9bc9-4447-9b38-07b7b6769c0f', '张玲', '13667314903', null, 'oVbXbw2CjACmpC3kNmUcepHU99jU');
INSERT INTO `parents` VALUES ('e8aedf60-f545-4165-8aac-be143e7394d8', '罗志军', '15308422162', null, 'oVbXbw3uwQzorBlO540_fPwZ-EC4');
INSERT INTO `parents` VALUES ('acb5bc9f-534e-4661-b0b5-0054c5827683', '钟国茂', '13974868803', null, 'oVbXbw7-_vX70-1XKSFA9o_iXD9w');
INSERT INTO `parents` VALUES ('79e4bdc8-874d-4cb2-a907-58215f7af76e', '熊俊', '13017393568', null, 'oVbXbwzitXv1C-XmSZlJKH7_Gcz8');
INSERT INTO `parents` VALUES ('8c754fe0-ecca-4827-a94d-62c0400e5990', '陈女士', '15367955257', null, 'oVbXbwweYJ8mz_OBU0MZoFT2NOgQ');
INSERT INTO `parents` VALUES ('61a2d234-2403-434a-bb0b-be4dbc31bcc7', '周华', '13055172298', null, 'oVbXbw2thsVAEOx--IIxFfdT6Om4');
INSERT INTO `parents` VALUES ('34f84cec-a42c-4ab4-93b3-bc485bc4f52a', '杨翠', '15874819298', null, 'oVbXbw8XS94kDwI_9atTIKNhdxWA');
INSERT INTO `parents` VALUES ('205ee471-0dcd-430e-a558-df805a87fb62', '家', '18570355097', null, 'oVbXbw19AzNPPhQysJZsF6gs15jg');
INSERT INTO `parents` VALUES ('09d603f5-2d48-406d-b69f-cc0dfeb9d09f', '陈岩平', '14726971008', null, 'oVbXbw9cwZ2v1li11293qbJOXbiI');
INSERT INTO `parents` VALUES ('9b2daa11-9851-41f0-8365-dc3ce439c584', '钟俊', '18874299916', '', 'oVbXbw4uMHHKRBgzN7ThvhwvaMCw');
INSERT INTO `parents` VALUES ('d9a13ba6-2e40-4e56-bfd2-4d511f3d48e9', '彭彩平', '18890369478', null, 'oVbXbw-gQ3GMcaGzbvh4TDvFmWHI');
INSERT INTO `parents` VALUES ('971e4640-7ca7-48cb-8a2e-f46c408d66a4', '刘建群', '17382176261', null, 'oVbXbwz-C87ZcV1XcxELTzsd4mvU');
INSERT INTO `parents` VALUES ('dbecd1c6-a69d-448d-ac31-325b8c1f9885', '罗召平', '18073184126', null, 'oVbXbwxAN7aPxzK-PuSTSqdhMWUQ');
INSERT INTO `parents` VALUES ('925a659e-1f94-4ae9-ab95-b4f6d9ad306d', null, '13278880991', 'liyunmei250', 'oVbXbw79KCaCH7_NidWft6_s-z7A');
INSERT INTO `parents` VALUES ('5c35d1d6-e854-4722-872d-da57ba2a6c91', '吴芳林', '13975118812', null, 'oVbXbwyd4sqljZY8FPTDcmlmRUzA');
INSERT INTO `parents` VALUES ('bc7d1338-1494-4ac7-8155-f8e6115c3e9f', '旷新娥', '18975815936', null, 'oVbXbw3Qx-7zYg1szCoiat5gcm9g');
INSERT INTO `parents` VALUES ('a853d9bf-ab95-4c4c-b4db-c0ddd4282807', '杨伟豪', '18229975254', null, 'oVbXbwy5_2XuqlLWjgPzuA5t2v5c');
INSERT INTO `parents` VALUES ('2782f2e4-5682-40e7-8930-193b1b8de791', '文永利', '15874809469', null, 'oVbXbw8vn8AKu7H_CtsJoK6tDKxs');
INSERT INTO `parents` VALUES ('610d212d-af5a-4c70-8098-aaece4e298ca', '曹新义', '15013557393', null, 'oVbXbw0SCK5rVuGeLodPLUZP4OPU');
INSERT INTO `parents` VALUES ('d9df4a14-72bc-49ed-9f33-ed92dd7cf631', '王满英', '18773155319', null, 'oVbXbw8KR2R4003wQA3ajD8qhySw');
INSERT INTO `parents` VALUES ('ab5befbe-9b50-4c79-9496-0edd136839fc', '陈俊', '13787161678', null, 'oVbXbw6fe_Tpe9FiKbfK9wE6zyyE');
INSERT INTO `parents` VALUES ('e13cb91b-d429-4204-a185-48752af469f0', '刘亚兰', '13907480481', null, 'oVbXbw6u5yhOdQ5cOfUkha-CxNH0');
INSERT INTO `parents` VALUES ('a0c6a204-adff-4d42-9898-c81bfc8bc0ad', '李红霞', '15869961197', null, 'oVbXbw7rTM-humGwLVWfSnDPChyE');
INSERT INTO `parents` VALUES ('1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b', '蒋艳芳', '15074839508', null, 'oVbXbw-c49C4hFJjWIQveF-BCOhM');
INSERT INTO `parents` VALUES ('7077a1a5-9dcd-4b8d-b093-98bb9681b06f', '蔡艳君', '15273906709', null, 'oVbXbw5-ZmaliUceqfwg5bEnWJDc');
INSERT INTO `parents` VALUES ('f7166d68-6dd7-4b05-b094-31a454c844b9', '张党秀', '15367316996', null, 'oVbXbwy88K-QqNxARIgJGAc2Dndk');
INSERT INTO `parents` VALUES ('a36d5226-313a-4af6-9a2c-21700f53bd90', '周洪', '13874982491', null, 'oVbXbw9JIay2DHOQwYzzG7PjAnrg');
INSERT INTO `parents` VALUES ('b3a05de5-c19e-4e99-9f54-6dd00c9eba43', '徐新伟', '18975819567', null, 'oVbXbwwfR4JtBvpF5HAgNMdbAtyg');
INSERT INTO `parents` VALUES ('fa54c2b1-ae27-46a5-8ea7-ba54792b9c33', '柳成英', '13908472055', null, 'oVbXbw6iIsxcBL7WkRjdLICg1PaY');
INSERT INTO `parents` VALUES ('ef5fd0f1-b51c-4cee-ae82-caab80900a1f', '张湘辉', '18684680358', null, 'oVbXbw09eN2oZFsqxDKDYadDSunI');
INSERT INTO `parents` VALUES ('f2bfda12-0dcc-4cd0-824d-b90283d35745', '游顺益', '13187001356', null, 'oVbXbwxjZUO4X6h1K3gipaI3SXBI');
INSERT INTO `parents` VALUES ('18709a24-fda2-4522-aa3b-b29847cd9ca4', '吴小妹', '13755191090', null, 'oVbXbw-loq0bJBhMmuvKuDwjcRCw');
INSERT INTO `parents` VALUES ('8bdfa5b3-7e9d-49a4-b2c7-e87a107f821b', null, '17673047684', '17673047684', 'oVbXbw27snPBhxKH-k-k0fYmdGgs');
INSERT INTO `parents` VALUES ('ddbc6677-b375-4fe1-aede-968dc637e6c1', '李利', '15074920666', null, 'oVbXbw3qsewyjFCod0kbNKzJpCbU');
INSERT INTO `parents` VALUES ('c69ae58f-dfc3-4278-bd90-dadabbd89860', '徐海洋', '13017383328', null, 'oVbXbw9PpOyXYcP4rW8FUiPYUD-M');
INSERT INTO `parents` VALUES ('20534a99-a8bf-4938-b70f-d50230796176', '彭芳', '13787188870', null, 'oVbXbw97xD7OQZtahWFYPdwXQA2o');
INSERT INTO `parents` VALUES ('f227e1c1-2002-456c-ac75-bb01e4a17290', '陈林保', '17708431216', null, 'oVbXbw3WONkmhzqqn_bHdcSXgI_Y');
INSERT INTO `parents` VALUES ('6ffa758e-b6c7-4d69-a7ed-28f9a5016eb7', '彭艳', '13401065686', null, 'oVbXbw4vKJGnXl1xzIfgSt9aUy6g');
INSERT INTO `parents` VALUES ('2da7bbcb-aeff-40d8-90ea-3eab9575f076', '李辉', '13080518069', null, 'oVbXbw7Rzy3YUsvnp9YGxufzqeVI');
INSERT INTO `parents` VALUES ('d8fdc43e-4794-4534-835f-22ac73aff251', '罗雄', '15200893635', null, 'oVbXbw6Ca02BgnXql9l708AaV0K4');
INSERT INTO `parents` VALUES ('8abd5cd9-0089-4a9d-8d87-5859cd6c2566', '刘亦君', '18175189776', null, 'oVbXbw_uZC6NaguD9GGcSl6ECqpQ');
INSERT INTO `parents` VALUES ('ad6b717b-0a88-404a-a17e-5701e87c457e', '彭建辉', '18684958796', null, 'oVbXbw41ALBZwpQ0hrGadhgW6hMU');
INSERT INTO `parents` VALUES ('7d99fda9-2175-43d2-8680-78f0113e4dc9', '李灿霞', '18807401769', null, 'oVbXbw6pmu_PKStNa8thXpC47JWA');
INSERT INTO `parents` VALUES ('ab52839e-f4b1-4db1-ac75-259c71b707cd', '刘灿', '13308457078', null, 'oVbXbw3M6hui1SMnE4SB0sYKGXek');
INSERT INTO `parents` VALUES ('6b528f9a-d2ca-401c-90b0-94a435569b9f', '张利', '15974295408', null, 'oVbXbw1QEoWkVhqYFme0Y23UBI1M');
INSERT INTO `parents` VALUES ('3525470e-60fb-490c-9b85-7c7b10998328', '陈军', '13974980777', null, 'oVbXbwzVzcThkHR3qlZXjzQtcoDQ');
INSERT INTO `parents` VALUES ('a87a2eb8-b4e2-4258-9c18-acc15b48d416', '汤熔', '15874286711', null, 'oVbXbw_rLTykBUFWj2adyxLm-uIs');
INSERT INTO `parents` VALUES ('2f79708d-ad15-454f-8bc4-7e610c732d3f', '李冰', '13873929313', null, 'oVbXbw47yNvinrJsh_LCQk8GOKWs');
INSERT INTO `parents` VALUES ('be5a1a9c-2eeb-40da-b5a3-20f5859dec34', '肖惠玲', '13755163225', null, 'oVbXbwybmIamLSZ4Dxo1SBe9_ZUk');
INSERT INTO `parents` VALUES ('cc00c551-9d32-4d2c-a16b-d92dd6ae6921', '徐成武', '13170480888', null, 'oVbXbw_ve5by1s0muqDB2KLCqcG0');
INSERT INTO `parents` VALUES ('128ddbf4-08fa-4968-b807-4805003e6921', '易晓辉', '13808471043', null, 'oVbXbwzXeFs1Hf08_6t7OA9xk-MQ');
INSERT INTO `parents` VALUES ('3241d692-8ee2-46b2-bd15-d0c02f991a86', '周灿', '13908462066', null, 'oVbXbwzLE92QvisV6UOqFRoVDVkk');
INSERT INTO `parents` VALUES ('b83d9ea4-524d-4cf2-910c-4e546e098eff', '钟战春', '13807481941', '', 'oVbXbwzoRrWj3qNPcJJ9K-hCTc6s');
INSERT INTO `parents` VALUES ('6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14', '樊伟', '18673880006', null, 'oVbXbwz2Q2bylo14x3gi8qwDD4Ok');
INSERT INTO `parents` VALUES ('d1541f36-0bb8-41f1-9b3d-57ed642bb13c', '周胜兰', '13786330780', null, 'oVbXbw8pPonm7QN8YjNxlHQ6DVZU');
INSERT INTO `parents` VALUES ('1eb0e6f2-7f9b-4d23-accd-7cd358273abc', '朱平高', '13787020713', null, 'oVbXbw8ecX47khmSNio5yGBIVOE4');
INSERT INTO `parents` VALUES ('4a0b359f-b7ba-45c5-b746-cffe7ceff5a8', '李莎', '13874832321', null, 'oVbXbw-GSLtNBaoTDQuWPNtnfMao');
INSERT INTO `parents` VALUES ('e902e3a3-6c25-4063-b4cb-dea3ce2de31b', '孔瑞观', '15974266719', null, 'oVbXbwzUr6mxYDagTW3eIfcoXxcg');
INSERT INTO `parents` VALUES ('9722809f-a128-4505-8cd2-06a31c85e5c8', '熊丽', '13787145882', null, 'oVbXbw8UVqMsNroTES8e_uqsm8Ho');
INSERT INTO `parents` VALUES ('6d4e5bd5-1349-4186-9e27-0f2323a3dd2f', '叶牡丹', '18229702328', null, 'oVbXbw1Kv7DtJAvKGCPcu1aZf0Y8');
INSERT INTO `parents` VALUES ('418c8290-93b5-467f-9d8b-c68ccd7761a5', '杨景媛', '18569039825', null, 'oVbXbw72zJ0SADHVzxC1iKZcX2I0');
INSERT INTO `parents` VALUES ('ced058e2-c909-4579-9364-0dee8b1f8ef3', '王小红', '18569102425', null, 'oVbXbw3f4wLO1M7gsveeCQfE2Ln4');
INSERT INTO `parents` VALUES ('520edb90-d404-4d5a-aa3e-448c90052e52', '唐丽萍', '15211093179', '15211093179', 'oVbXbw-eL9faIol2M6k4ZDtF872M');
INSERT INTO `parents` VALUES ('ee853e30-c0d1-4362-82dc-619b912b0f17', '阳湘江', '15989551539', '15989551539', 'oVbXbwymlv-4O7hNsSfcBHkaK6KU');
INSERT INTO `parents` VALUES ('a4fd6fff-d63e-4184-be61-36f688db621a', '陈云', '18670018504', null, 'oVbXbwzKTSXwYGC1C1fuIhsgmDK8');
INSERT INTO `parents` VALUES ('8f0be3b7-ebbe-4eeb-b77f-5ab393624436', null, '13467542250', '', 'oVbXbw7XF50QvSJFSSUtumFgS_6E');
INSERT INTO `parents` VALUES ('18174553-f629-48d7-83be-226feef83e4b', '曾晓红', '18008422629', null, 'oVbXbwxp1S33PBwMm7cnWdFEEGcw');
INSERT INTO `parents` VALUES ('b2271803-6d85-4680-8e21-0a225c5b2cb3', null, '13874803312', '13874803312', 'oVbXbwwQ9Kf5atRdkD-QZGa_0PNc');
INSERT INTO `parents` VALUES ('36215688-a895-40a8-88d4-e9cdf3a623fa', null, '15211992871', '15211992871', 'oVbXbw87iNtZ42CF87_BZkMWN_-I');
INSERT INTO `parents` VALUES ('89df5d5d-c518-49c4-a68a-8922bcf3f5c0', '段娟娟', '13548940632', null, 'oVbXbwyajiN00Yuj-fboEWpLNZ_Y');
INSERT INTO `parents` VALUES ('2845241c-c49b-4f81-bc46-7dd7592c246a', '李喜英', '15802558138', null, 'oVbXbw7hBGy6C0py2TVgsLuPMSGw');
INSERT INTO `parents` VALUES ('a74e1231-3e08-4db2-93f1-a79e8ff77251', '韩玉', '15207491038', null, 'oVbXbw-U7qcWnDdMqZKFwwoA3R74');
INSERT INTO `parents` VALUES ('578b339d-e046-44a1-953b-4ab5cf8f9951', '邹小丽', '13574628299', null, 'oVbXbw6Ld6bIJHvUYiJKFIcUSgOQ');

-- ----------------------------
-- Table structure for parent_stu_r
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
INSERT INTO `parent_stu_r` VALUES ('01bf9958-85e2-49e6-a36c-2840efd63af0', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('05ec9947-b03e-4533-a5a6-8eaf19c03e62', 'fa54c2b1-ae27-46a5-8ea7-ba54792b9c33');
INSERT INTO `parent_stu_r` VALUES ('070e1e49-4c78-4781-8695-177fdf8d099e', '7d99fda9-2175-43d2-8680-78f0113e4dc9');
INSERT INTO `parent_stu_r` VALUES ('0b54ce6d-bd5a-404d-9d14-caf89f84dd46', '18174553-f629-48d7-83be-226feef83e4b');
INSERT INTO `parent_stu_r` VALUES ('0cf74357-767e-4a3b-8202-943436f4995c', '1eb0e6f2-7f9b-4d23-accd-7cd358273abc');
INSERT INTO `parent_stu_r` VALUES ('0f390070-d868-42d9-832e-8dd8cf229124', 'd470160f-c9f7-45c2-8e97-66acf23c7b67');
INSERT INTO `parent_stu_r` VALUES ('1111111111111', 'aaaa');
INSERT INTO `parent_stu_r` VALUES ('174c0610-22d9-4e7f-a40d-5a0bb9d62373', '00ccc852-42be-4e6d-98fe-df544f5d5984');
INSERT INTO `parent_stu_r` VALUES ('1886a744-3e9e-4bce-b586-ac1c0027dd70', 'ee853e30-c0d1-4362-82dc-619b912b0f17');
INSERT INTO `parent_stu_r` VALUES ('1b201cf7-e147-4897-ac9d-71961be06c24', '18709a24-fda2-4522-aa3b-b29847cd9ca4');
INSERT INTO `parent_stu_r` VALUES ('1c3e0941-112b-4664-9463-6865ec8c5912', '205ee471-0dcd-430e-a558-df805a87fb62');
INSERT INTO `parent_stu_r` VALUES ('206036fd-d511-4eb0-b8d3-60c59bc84d15', '01df4fe5-315c-4db2-ab49-c314c9f891d3');
INSERT INTO `parent_stu_r` VALUES ('20ca5d97-841f-4928-819c-173852f3d70d', 'c9faef4f-f860-433a-b183-e6e5263b335e');
INSERT INTO `parent_stu_r` VALUES ('22222222', 'bbbb');
INSERT INTO `parent_stu_r` VALUES ('223d8a75-6e4e-4ad6-a441-af98e0a2cfad', 'a36d5226-313a-4af6-9a2c-21700f53bd90');
INSERT INTO `parent_stu_r` VALUES ('279c6d0d-1a69-4155-927d-e50faf8787b6', '5138ed9b-82af-4252-9c10-0943693449ae');
INSERT INTO `parent_stu_r` VALUES ('2aaccef3-b986-4e63-988c-ad059935854d', '418c8290-93b5-467f-9d8b-c68ccd7761a5');
INSERT INTO `parent_stu_r` VALUES ('2b1ec3b4-44b8-4be8-a009-24b7cb87717d', 'dbecd1c6-a69d-448d-ac31-325b8c1f9885');
INSERT INTO `parent_stu_r` VALUES ('2ee34d03-500b-4030-9619-c7e11d099e90', '840d6b5d-7734-4105-a6a1-48879fd107c3');
INSERT INTO `parent_stu_r` VALUES ('2f724a1e-3399-4652-89ed-cdf6af080c6f', '971e4640-7ca7-48cb-8a2e-f46c408d66a4');
INSERT INTO `parent_stu_r` VALUES ('3246e59a-15a3-47af-a685-50d8460c547e', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO `parent_stu_r` VALUES ('329ec215-a3dc-427d-ac97-95f0cc0a2519', 'f7166d68-6dd7-4b05-b094-31a454c844b9');
INSERT INTO `parent_stu_r` VALUES ('32e7fcb2-e00a-49bd-89b9-f0665f08350a', 'cc00c551-9d32-4d2c-a16b-d92dd6ae6921');
INSERT INTO `parent_stu_r` VALUES ('3387b77f-ba5c-4938-95aa-333390967bdb', 'db6d9354-2166-4cfa-abf1-233be87d7a23');
INSERT INTO `parent_stu_r` VALUES ('34edbf52-06cc-4eed-aef7-08b9311e6601', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15');
INSERT INTO `parent_stu_r` VALUES ('352ae049-419b-4b88-9a30-dea9e528480e', '2da7bbcb-aeff-40d8-90ea-3eab9575f076');
INSERT INTO `parent_stu_r` VALUES ('35f12b3c-d029-459c-9b7c-619f3f44f2ef', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('397f9d9d-e20a-49b4-b199-669f60db95cf', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('39bcba7c-99db-4d78-94ff-74c26585978c', 'a4fd6fff-d63e-4184-be61-36f688db621a');
INSERT INTO `parent_stu_r` VALUES ('39e42887-ba2b-4149-b2d6-1f7c024f82b0', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('3a614d80-f7bb-46d4-89da-23080e97ea02', 'b83d9ea4-524d-4cf2-910c-4e546e098eff');
INSERT INTO `parent_stu_r` VALUES ('3a894527-e23e-46b2-b6c5-f0ca8dfa2765', 'f2bfda12-0dcc-4cd0-824d-b90283d35745');
INSERT INTO `parent_stu_r` VALUES ('3af1cfb3-a826-4aa2-b4a3-79b825762d37', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('3d5fbd91-ce72-4426-a573-2ba496710a6b', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807');
INSERT INTO `parent_stu_r` VALUES ('3f0355d3-94e5-471f-a78f-b84736bb8afd', '7077a1a5-9dcd-4b8d-b093-98bb9681b06f');
INSERT INTO `parent_stu_r` VALUES ('3f197c20-4852-4af1-a3fe-4a91cba046a0', '71ca2567-8288-433a-98ed-bbf3c00b9659');
INSERT INTO `parent_stu_r` VALUES ('410f3152-0fb1-40cd-b983-a0b4189d1a10', '08157e24-cdda-46d0-a4e1-56cc607c2951');
INSERT INTO `parent_stu_r` VALUES ('419f76c5-706e-4cb4-8419-b31addbc2f8b', '79e4bdc8-874d-4cb2-a907-58215f7af76e');
INSERT INTO `parent_stu_r` VALUES ('41af7d4e-fc40-4296-bdd4-8ab696fc9462', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO `parent_stu_r` VALUES ('428631d2-f204-4fa5-838a-4072fe589d70', '247214c8-e6ae-4a38-9a44-cbb005f953cd');
INSERT INTO `parent_stu_r` VALUES ('4426451c-de65-4564-8ddf-2bbee72841ae', '7f376be4-d891-48be-8529-9bc5b85185ca');
INSERT INTO `parent_stu_r` VALUES ('443742e9-e233-4044-a99d-bce47d1e8b13', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('48659507-3880-4c28-9788-55f1808ac1f2', '610d212d-af5a-4c70-8098-aaece4e298ca');
INSERT INTO `parent_stu_r` VALUES ('4af80a67-c242-4c95-b7d5-cf6fd2463dae', '8bdfa5b3-7e9d-49a4-b2c7-e87a107f821b');
INSERT INTO `parent_stu_r` VALUES ('4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '1dcec4ea-1c1d-4f71-a5ed-b0b2b149821b');
INSERT INTO `parent_stu_r` VALUES ('4d5ae807-aad5-4b35-8f17-527cdfef6d40', 'ab52839e-f4b1-4db1-ac75-259c71b707cd');
INSERT INTO `parent_stu_r` VALUES ('4e708d29-d4b9-47d3-8fb9-1b98127896aa', 'ab5befbe-9b50-4c79-9496-0edd136839fc');
INSERT INTO `parent_stu_r` VALUES ('4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9');
INSERT INTO `parent_stu_r` VALUES ('5290567a-b37e-4374-a14c-e9aca1052cf7', 'a87a2eb8-b4e2-4258-9c18-acc15b48d416');
INSERT INTO `parent_stu_r` VALUES ('52bf8ca5-29be-487e-8281-4ed3affe6df1', 'ad6b717b-0a88-404a-a17e-5701e87c457e');
INSERT INTO `parent_stu_r` VALUES ('58300141-5fec-4bc2-8820-fcc41947142d', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('591d3d72-c24e-4218-9b7e-9af08ce8e493', '8c754fe0-ecca-4827-a94d-62c0400e5990');
INSERT INTO `parent_stu_r` VALUES ('5c7608cd-b804-4f65-9959-a58b4421cb78', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO `parent_stu_r` VALUES ('5c7f5e36-535f-48f8-8763-0f9b6318073e', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('5cc50b32-8179-458f-9663-8704d9ebddff', '9b2daa11-9851-41f0-8365-dc3ce439c584');
INSERT INTO `parent_stu_r` VALUES ('5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '128ddbf4-08fa-4968-b807-4805003e6921');
INSERT INTO `parent_stu_r` VALUES ('5e923add-eaca-4bd3-acc2-27b1bb3c2240', 'e4220f11-1e90-45b1-985a-3317cef45f4a');
INSERT INTO `parent_stu_r` VALUES ('5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', 'b1475005-13a1-4485-b69d-babaaf35da66');
INSERT INTO `parent_stu_r` VALUES ('60c4cb47-c262-4337-8639-f4c38e525474', 'c69ae58f-dfc3-4278-bd90-dadabbd89860');
INSERT INTO `parent_stu_r` VALUES ('61086778-f35a-4d8c-b1c0-434dc86fadeb', '9722809f-a128-4505-8cd2-06a31c85e5c8');
INSERT INTO `parent_stu_r` VALUES ('625a1ecf-6699-4ae6-ba41-fe47451a796b', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('64a9944a-3e14-4cc1-af56-3a74bab92a8b', 'ef5fd0f1-b51c-4cee-ae82-caab80900a1f');
INSERT INTO `parent_stu_r` VALUES ('67181c1a-d2df-4460-8751-035d1a1d4efd', '4a0b359f-b7ba-45c5-b746-cffe7ceff5a8');
INSERT INTO `parent_stu_r` VALUES ('6a586044-60fb-4cc2-abc3-26204a937329', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('6c69c410-b8f4-4e73-bddc-e7ced436868d', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO `parent_stu_r` VALUES ('6ccefde6-6240-4ede-b185-bbd159285f1b', '6ffa758e-b6c7-4d69-a7ed-28f9a5016eb7');
INSERT INTO `parent_stu_r` VALUES ('6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '4f64abe2-2e45-4b03-a4e6-4b1684255144');
INSERT INTO `parent_stu_r` VALUES ('7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', 'f977c4bc-4de9-403e-b34d-730e03a0469c');
INSERT INTO `parent_stu_r` VALUES ('705dc6e9-2639-4126-b0b1-1826d29eb1b9', 'ced058e2-c909-4579-9364-0dee8b1f8ef3');
INSERT INTO `parent_stu_r` VALUES ('74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', 'e902e3a3-6c25-4063-b4cb-dea3ce2de31b');
INSERT INTO `parent_stu_r` VALUES ('773ea73a-5135-41f4-8000-55901b2015a2', '79e4bdc8-874d-4cb2-a907-58215f7af76e');
INSERT INTO `parent_stu_r` VALUES ('795e04b3-6af9-4e75-b9e9-0f1e2be57109', '8f0be3b7-ebbe-4eeb-b77f-5ab393624436');
INSERT INTO `parent_stu_r` VALUES ('79807fad-b099-460e-ada4-7e7831c3c85d', '6d4e5bd5-1349-4186-9e27-0f2323a3dd2f');
INSERT INTO `parent_stu_r` VALUES ('79c93b34-1803-4808-8053-447c66039516', '59a3027d-9bc9-4447-9b38-07b7b6769c0f');
INSERT INTO `parent_stu_r` VALUES ('7c1f175e-92ad-4a83-af61-faf4571dc87d', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('7cd1b3ff-571d-430b-b77e-92d1712a8418', 'b3a05de5-c19e-4e99-9f54-6dd00c9eba43');
INSERT INTO `parent_stu_r` VALUES ('7f0861de-91ef-4f10-9a4e-f836998778db', 'f62115b3-d4ae-49e7-97b0-57f35cd5f828');
INSERT INTO `parent_stu_r` VALUES ('7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '9b3f02ae-a952-40ee-b3f1-3ec2f371fb15');
INSERT INTO `parent_stu_r` VALUES ('83802c3d-71c7-4ca1-9851-2975ee047139', '7f376be4-d891-48be-8529-9bc5b85185ca');
INSERT INTO `parent_stu_r` VALUES ('8478bec7-44bc-4e19-b03e-445828affb23', '09d603f5-2d48-406d-b69f-cc0dfeb9d09f');
INSERT INTO `parent_stu_r` VALUES ('85fab9b6-cf10-4c97-8a4a-09b7a279a976', 'f227e1c1-2002-456c-ac75-bb01e4a17290');
INSERT INTO `parent_stu_r` VALUES ('8732f4d6-78c4-4bc3-92f1-a0d5d5ffe746', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO `parent_stu_r` VALUES ('87561e40-93ca-436f-90a8-eef75fe735b3', 'e8aedf60-f545-4165-8aac-be143e7394d8');
INSERT INTO `parent_stu_r` VALUES ('87713b29-371d-453c-a3a6-99a13d45ef0f', '6e0fe82a-ed5e-4d4f-9612-72c9d9cf4f14');
INSERT INTO `parent_stu_r` VALUES ('8e877e9f-2f15-4439-a66a-9ab9b5e0903c', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('8fda3edb-129f-4822-a4e4-4de2b8e552ad', 'acb5bc9f-534e-4661-b0b5-0054c5827683');
INSERT INTO `parent_stu_r` VALUES ('92f1e207-0d5f-4b6f-a8db-22a5eadafc29', '8abd5cd9-0089-4a9d-8d87-5859cd6c2566');
INSERT INTO `parent_stu_r` VALUES ('945ebac7-dab8-4c51-8dc3-6964ee5a686c', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('949f2f2c-9da1-4e08-adc8-f2acc9fccdda', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('94dc98ce-b50f-4e97-9a00-17bcc16bcf1b', 'cf1022ff-3e32-4813-8231-300b6b24bfae');
INSERT INTO `parent_stu_r` VALUES ('958e0b84-1956-4e2b-ac9b-9f9a6d0a9191', '2845241c-c49b-4f81-bc46-7dd7592c246a');
INSERT INTO `parent_stu_r` VALUES ('976c9d2a-c334-49bb-8cae-051af9eeae66', '5c46e95c-67de-483d-963c-e62865b80f64');
INSERT INTO `parent_stu_r` VALUES ('979dddd5-b5a5-420c-afe8-0799a2f181c4', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO `parent_stu_r` VALUES ('993d2b0b-eea2-4fb7-9c43-6ffe8db1f21a', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b');
INSERT INTO `parent_stu_r` VALUES ('9d104509-38cf-4482-ba5c-31f3d444c4a3', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('9f20b54b-df98-4ce1-9997-8b51e6266f78', 'd1541f36-0bb8-41f1-9b3d-57ed642bb13c');
INSERT INTO `parent_stu_r` VALUES ('9fff5f18-3b48-416f-a009-c0b27fdcc93b', 'b0da32eb-4487-4e46-b742-7cabb3c368db');
INSERT INTO `parent_stu_r` VALUES ('a23d7de7-60fb-4977-9071-09ad795141b5', 'f39682f3-e4f2-4e4a-ab74-7558f08e4768');
INSERT INTO `parent_stu_r` VALUES ('a31e28a3-b2cc-436c-b89d-fb6dbc5cd3f1', 'be5a1a9c-2eeb-40da-b5a3-20f5859dec34');
INSERT INTO `parent_stu_r` VALUES ('a323675b-0a7f-4879-ab9e-33c1520f711f', '5c35d1d6-e854-4722-872d-da57ba2a6c91');
INSERT INTO `parent_stu_r` VALUES ('a4f4b3ff-bcba-44fb-ba54-a1afff045d46', 'cf7d84ad-4dcb-4d0e-8df1-0a9cce568149');
INSERT INTO `parent_stu_r` VALUES ('a59f7cd7-d935-4372-b153-4b8f5daabd03', '2f79708d-ad15-454f-8bc4-7e610c732d3f');
INSERT INTO `parent_stu_r` VALUES ('a7469233-0f1b-4399-b129-175f675263fa', 'ea35171a-848e-4d9c-8dc5-94e55607f68b');
INSERT INTO `parent_stu_r` VALUES ('a7e63cca-aeaa-4721-897c-3343c55c7a85', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO `parent_stu_r` VALUES ('ac7ead61-9963-4e6b-a426-947a41a6712f', 'ddbc6677-b375-4fe1-aede-968dc637e6c1');
INSERT INTO `parent_stu_r` VALUES ('aceb13f9-2ce4-4cc7-bc02-89002a4423e0', 'acb53310-f57c-4494-bee1-01350617b37f');
INSERT INTO `parent_stu_r` VALUES ('adc3ed56-0a9b-4891-b1fc-7177706d51e9', 'ba55085d-b32b-46f0-950c-3f21029d77a8');
INSERT INTO `parent_stu_r` VALUES ('ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '34f84cec-a42c-4ab4-93b3-bc485bc4f52a');
INSERT INTO `parent_stu_r` VALUES ('ae977c03-3f44-49f5-9c7d-842e0d135899', '2782f2e4-5682-40e7-8930-193b1b8de791');
INSERT INTO `parent_stu_r` VALUES ('b0c16d71-c5e2-41b1-9940-9b6ff0212e21', '6b528f9a-d2ca-401c-90b0-94a435569b9f');
INSERT INTO `parent_stu_r` VALUES ('b0ed5520-5db1-4d33-ad3c-7f1f50fbe3d9', '9c61a3fb-7f97-40c1-a3d8-5f4e82a459cd');
INSERT INTO `parent_stu_r` VALUES ('b1823fff-7045-4d46-b604-dfbf931ebbf8', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('b2511e3f-2e8b-4d28-ad76-602587b0c99d', 'ad3ffcfd-2b45-4b4b-aee8-64e5c412eb9d');
INSERT INTO `parent_stu_r` VALUES ('b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', 'daa3f486-e6ce-4b50-ad09-519dac09757e');
INSERT INTO `parent_stu_r` VALUES ('b485cc15-b6e9-4153-90a8-7899d9d8d91d', '925a659e-1f94-4ae9-ab95-b4f6d9ad306d');
INSERT INTO `parent_stu_r` VALUES ('b8e8b670-e258-41b7-b899-913dc1eeedaa', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO `parent_stu_r` VALUES ('b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '3525470e-60fb-490c-9b85-7c7b10998328');
INSERT INTO `parent_stu_r` VALUES ('babdb37b-1824-4eab-93a9-ed0342e9eda8', '578b339d-e046-44a1-953b-4ab5cf8f9951');
INSERT INTO `parent_stu_r` VALUES ('bbca876c-8f6f-4b8a-bcd0-c247ae937d18', 'd9df4a14-72bc-49ed-9f33-ed92dd7cf631');
INSERT INTO `parent_stu_r` VALUES ('bcf5c17a-4e4e-402c-b469-93b8d419678f', 'a74e1231-3e08-4db2-93f1-a79e8ff77251');
INSERT INTO `parent_stu_r` VALUES ('be438bc5-086b-4b5b-81a4-514538974df4', 'bd2bfad2-d416-4939-81b0-bec28836261a');
INSERT INTO `parent_stu_r` VALUES ('bfc281a0-b413-4512-a5df-a227f4e0d4b2', '18a2d7ce-b3c7-45ad-b3ce-7b4225c2dd42');
INSERT INTO `parent_stu_r` VALUES ('c252c682-0615-4343-a69a-f329c2d41ee2', '89df5d5d-c518-49c4-a68a-8922bcf3f5c0');
INSERT INTO `parent_stu_r` VALUES ('c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '7f376be4-d891-48be-8529-9bc5b85185ca');
INSERT INTO `parent_stu_r` VALUES ('c3aaf29b-1a17-43a5-9834-6d3a7bb0892c', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('cb59b673-ca98-44c8-9c11-edf767c19f5f', '59c108b6-64a5-44ed-b1c6-e05ff13a9254');
INSERT INTO `parent_stu_r` VALUES ('cbd33cfb-fa8b-448c-910b-49376984f911', 'f78c8319-85b8-4397-87eb-8922b52bb7be');
INSERT INTO `parent_stu_r` VALUES ('cccbb380-7dd4-44b5-8e79-19f7b610d433', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('ccd49818-39cb-4ee1-b792-01688dfbef24', 'ada7441e-2a38-4c03-aee6-234be39aa128');
INSERT INTO `parent_stu_r` VALUES ('cd6dfb39-c2da-4fb3-a979-d63f4163da67', '20534a99-a8bf-4938-b70f-d50230796176');
INSERT INTO `parent_stu_r` VALUES ('d1567855-910a-44b2-950a-58fd9b3338b7', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('d15cad6d-218d-47aa-a5bd-513730c701c3', '61a2d234-2403-434a-bb0b-be4dbc31bcc7');
INSERT INTO `parent_stu_r` VALUES ('d4bb6b04-013a-48cf-9a1e-9a611309e597', '13477b94-ad83-4554-a68f-5d8d2235c14d');
INSERT INTO `parent_stu_r` VALUES ('ddf9dc97-7ee9-4e33-a85c-d401cb01b210', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('de13ba03-5a2e-4e03-a135-4585cfbe5af8', '6a33932d-c4d5-48e9-9bb2-b5c8228cf210');
INSERT INTO `parent_stu_r` VALUES ('e11b2b2c-e1c9-4e2d-b525-ac74e1fa1874', '33a73459-0041-4a97-9b79-93b120f030ca');
INSERT INTO `parent_stu_r` VALUES ('e269d805-f0a4-46c5-b27a-66e9b58f673f', 'a0c6a204-adff-4d42-9898-c81bfc8bc0ad');
INSERT INTO `parent_stu_r` VALUES ('e2e19fd3-41b1-47b5-b87e-041e01afc926', '36215688-a895-40a8-88d4-e9cdf3a623fa');
INSERT INTO `parent_stu_r` VALUES ('e41ed9a9-bd9b-4f3e-8468-efa07fd4c2e7', 'c1815cf2-85a3-4e93-9af3-868864b4d9b5');
INSERT INTO `parent_stu_r` VALUES ('e6058b90-7154-4677-8172-185b1e30f894', 'e46ae7bc-895e-4c52-ad67-b03f575b6227');
INSERT INTO `parent_stu_r` VALUES ('e78f0e67-17c9-462d-ae45-453daf6562d5', 'a712fda3-c0c0-49aa-be5d-4e90401c368b');
INSERT INTO `parent_stu_r` VALUES ('e816cc30-deb4-4c66-b310-92b91b4e7a5b', '90377ef4-f065-4fe0-9318-a093c74c800a');
INSERT INTO `parent_stu_r` VALUES ('e98c04c3-7e46-45c7-a835-708d35b343a8', '69035d26-961f-46ca-a777-0199c784eeb4');
INSERT INTO `parent_stu_r` VALUES ('eda53a7c-3cf6-4b7e-a32d-845a622afe37', 'd9a13ba6-2e40-4e56-bfd2-4d511f3d48e9');
INSERT INTO `parent_stu_r` VALUES ('f0ae0032-edfc-4c81-8174-8381a3633050', 'b2271803-6d85-4680-8e21-0a225c5b2cb3');
INSERT INTO `parent_stu_r` VALUES ('f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '520edb90-d404-4d5a-aa3e-448c90052e52');
INSERT INTO `parent_stu_r` VALUES ('f2de054e-d89b-4b06-b82c-81c01ccf689b', 'd8fdc43e-4794-4534-835f-22ac73aff251');
INSERT INTO `parent_stu_r` VALUES ('f6fe6270-ab84-42a2-a356-0cf1fc5d83de', 'e13cb91b-d429-4204-a185-48752af469f0');
INSERT INTO `parent_stu_r` VALUES ('f9174d35-bbc7-40aa-8003-fb77a08a6288', '8c3a338a-339b-4217-84ab-29ffdf1156cc');
INSERT INTO `parent_stu_r` VALUES ('fb276474-891d-4c41-b32b-96bcb5531675', 'bc7d1338-1494-4ac7-8155-f8e6115c3e9f');
INSERT INTO `parent_stu_r` VALUES ('fbbd1e55-2923-4010-9125-e4aeb425b229', '36aecc30-94d8-40e6-b56d-a17f1d60a7b9');
INSERT INTO `parent_stu_r` VALUES ('fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '57e0b0b8-98a2-44a2-b66f-b92af290e11c');
INSERT INTO `parent_stu_r` VALUES ('fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', 'a853d9bf-ab95-4c4c-b4db-c0ddd4282807');
INSERT INTO `parent_stu_r` VALUES ('fe696785-d70c-46d6-b8df-e778d00462f4', '3241d692-8ee2-46b2-bd15-d0c02f991a86');
INSERT INTO `parent_stu_r` VALUES ('fe6d78ca-0290-47eb-894e-3b7be3d0044a', '69035d26-961f-46ca-a777-0199c784eeb4');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片信息表';

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('af478f7f-f9e2-4eab-a99e-bbb3c3abc79c', 'https://baike.baidu.com/pic/vsftpd/5254770/0/54fbb2fb43166d2273d5d3e34f2309f79052d223?fr=lemma&ct=single#aid=0&pic=54fbb2fb43166d2273d5d3e34f2309f79052d223', '测试老师11557876534', '3');
INSERT INTO `picture` VALUES ('7e66a9ab-b9c3-4127-a11e-e3bbf02167d0', 'https://baike.baidu.com/pic/vsftpd/5254770/0/54fbb2fb43166d2273d5d3e34f2309f79052d223?fr=lemma&ct=single#aid=0&pic=54fbb2fb43166d2273d5d3e34f2309f79052d223', '测试老师21557876535', '3');
INSERT INTO `picture` VALUES ('ef1f04d8-6380-4a82-ac24-579e090d0757', '[]', '黄黄11111', '3');
INSERT INTO `picture` VALUES ('78e4b2f0-c864-4a90-82f5-aac3466ec8cd', null, '嘿嘿嘿嘿嘿嘿嘿嘿', '3');
INSERT INTO `picture` VALUES ('3620eb6f-a068-43cd-bb7a-fdcdd2cab977', null, '大学生111', '3');
INSERT INTO `picture` VALUES ('c62ea788-8af1-4cc2-958b-7b086caf84d7', null, '中南大学1111', '3');
INSERT INTO `picture` VALUES ('97875bb1-0f8c-4a7a-bc76-969f238d1130', null, '中南大学中南大学', '3');
INSERT INTO `picture` VALUES ('04b8ce83-277b-48b5-98f6-d4a651cfee27', null, '研究男123', '3');
INSERT INTO `picture` VALUES ('b9f2e5ad-6daa-482a-9951-c52c17c8a0ff', null, '11111', '3');
INSERT INTO `picture` VALUES ('6ea548c5-fc9c-4ccb-9c45-8c4899623819', null, '高级老师18674123456', '3');
INSERT INTO `picture` VALUES ('a201a42f-c557-4803-9895-5b74068bbcab', null, '刘嬷嬷19356784567', '3');
INSERT INTO `picture` VALUES ('7439dd0a-65c3-4fea-9829-c09a91d433a3', null, '刘国臣测试15580830349', '3');
INSERT INTO `picture` VALUES ('c623daa1-3bdd-4740-a728-f3d43de47d0b', null, '向嘉博18397413862', '3');
INSERT INTO `picture` VALUES ('99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7', null, '谢新茹15981671529', '3');
INSERT INTO `picture` VALUES ('4115f4bb-95d7-4d87-8e07-ac21a3277a03', null, '向嘉博18397413862', '3');
INSERT INTO `picture` VALUES ('be9186cf-49b4-4cb0-a16a-48024dfc4461', null, 'nullnull', '3');
INSERT INTO `picture` VALUES ('d775d3bc-f859-4ff9-bb92-e76669ac5c71', null, '冯龙兴15367487002', '3');
INSERT INTO `picture` VALUES ('21d5d442-8052-43c0-9e23-543018059625', null, '吴月颖18774839836', '3');
INSERT INTO `picture` VALUES ('456d056f-25ff-4c65-a77e-23a1a2084a52', null, '崔向影15084762874', '3');
INSERT INTO `picture` VALUES ('2432cad4-aff7-4382-a772-09662b7113b2', null, '麻万明1365785997', '3');
INSERT INTO `picture` VALUES ('9ee049ff-2e20-4655-9d2b-4cb7fe814566', null, '陈皓18774975537', '3');
INSERT INTO `picture` VALUES ('e23d7bca-6405-4c49-8b7f-14fe663ee4d4', null, '徐慧颖15274810285', '3');
INSERT INTO `picture` VALUES ('efd06f65-eef6-410f-8f0c-36621ea31a86', null, '程凡18154217405', '3');
INSERT INTO `picture` VALUES ('c1f40a57-7146-4a06-9e62-c50f6f75bfbf', null, '朱晓龙18273120371', '3');
INSERT INTO `picture` VALUES ('48d4c1ec-c136-49ed-96fc-b4fbe9010dd0', null, '吴洋13278881603', '3');
INSERT INTO `picture` VALUES ('ca67e8ef-09d5-466b-a796-82622add5cac', null, '陈松18373150752', '3');
INSERT INTO `picture` VALUES ('92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f', null, '吴洋13278881603', '3');
INSERT INTO `picture` VALUES ('e88ffb63-b250-44bc-9083-3324cba01eb0', null, '夏欣研13545212652', '3');
INSERT INTO `picture` VALUES ('e05ca04a-ccca-4ee9-bb9a-383acab20a3c', null, '齐宁17375876043', '3');
INSERT INTO `picture` VALUES ('bc9b247d-70e7-4bcd-b8be-aa4d3721984b', null, '姜波15111016224', '3');
INSERT INTO `picture` VALUES ('4e97532e-22ac-492b-a118-89a5c6b31c3c', null, '胡潇羽13142008762', '3');
INSERT INTO `picture` VALUES ('bc0be7a4-38e6-4366-a74e-903d322e4b0a', null, '吕向前18569400050', '3');
INSERT INTO `picture` VALUES ('15a7c808-098b-4e8d-9f19-1022b6d5b387', null, '张文慧13635562695', '3');
INSERT INTO `picture` VALUES ('4583b87a-1eb3-4cfb-9a47-f1af60d01467', null, '左博聪15111095615', '3');
INSERT INTO `picture` VALUES ('1394814e-1348-4132-90cd-ac01732facd5', null, '邢凯迪18174451062', '3');
INSERT INTO `picture` VALUES ('1cc35afa-391b-49dc-a0bb-5f401eaf56f0', null, '王宁13667337306', '3');
INSERT INTO `picture` VALUES ('64a7f49d-15db-48dd-9e50-044c15314a33', null, '陈娴17308416020', '3');
INSERT INTO `picture` VALUES ('8d4c35e9-dcad-44ff-a297-c55789914717', null, '薛潇13909620950', '3');
INSERT INTO `picture` VALUES ('6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a', null, '姜蕊18390987440', '3');
INSERT INTO `picture` VALUES ('d6484e68-7a9a-4fca-812c-1bdb64a951e3', null, '胡嘉欣18272057850', '3');
INSERT INTO `picture` VALUES ('fb43828f-b728-405c-9b0d-a71668e4b977', null, '李东刚18670308329', '3');
INSERT INTO `picture` VALUES ('37d65abe-e61a-4874-a07b-02cd238c6dc7', null, '李东刚18670308329', '3');
INSERT INTO `picture` VALUES ('c6948d2a-e3d4-49ca-8adc-7e657268cb2e', null, '李东刚18670308329', '3');
INSERT INTO `picture` VALUES ('961c91e1-0607-4dea-ba8d-c96a1cb18315', null, 'ceshiliulaoshi15587976896', '3');
INSERT INTO `picture` VALUES ('5c9eed81-ccfb-4a27-928d-52756f3362d8', null, '麻万明13657485997', '3');
INSERT INTO `picture` VALUES ('033df2d9-d160-45df-9020-2be7a32638ce', null, '向梦天156748563148', '3');
INSERT INTO `picture` VALUES ('0a4afa55-db09-4bd1-8c38-82d93edc6d70', null, '李莹庆15526459605', '3');
INSERT INTO `picture` VALUES ('b2e69f4a-bafa-4a08-b96c-a1706210804a', null, '侯晚晴15893095795', '3');
INSERT INTO `picture` VALUES ('258e2acf-80db-4642-ad89-0fcbd6b5731b', null, '张荣旺15574804640', '3');
INSERT INTO `picture` VALUES ('a2d1cd1d-8b94-455d-8f78-a00ec90cb007', null, '秦家琳18774063134', '3');
INSERT INTO `picture` VALUES ('8a0698be-fdc5-40da-86ae-61731251290b', null, '候晚晴15893095795', '3');
INSERT INTO `picture` VALUES ('06a6ab17-d1ea-4159-b897-aa5bf2135c2b', null, '丛颖18774879533', '3');
INSERT INTO `picture` VALUES ('96b37632-2ad5-4100-814c-23d4af389250', null, '李芳林13637472576', '3');
INSERT INTO `picture` VALUES ('9b563e14-07bc-4416-830b-319274e8d625', null, '高梦梦15274816683', '3');
INSERT INTO `picture` VALUES ('53e2656e-8d99-4626-81f7-cbdad18c7b93', null, '田江17375895823', '3');
INSERT INTO `picture` VALUES ('d1da9599-1adb-4075-98d9-297e4902338e', null, '廖成意18223562393', '3');
INSERT INTO `picture` VALUES ('ae035324-3e4d-46c4-bdb6-c445af54e5fe', null, '高鸶佳13142175883', '3');
INSERT INTO `picture` VALUES ('219524c2-8299-4a2c-8e28-6826f222c219', null, '王翼18329525584', '3');
INSERT INTO `picture` VALUES ('c9e06263-d7a6-4fde-9d60-50b4c66d3092', null, '皮文君18670367305', '3');
INSERT INTO `picture` VALUES ('6d608e41-1306-476e-9065-ba38563ca876', null, '李国伟15200833373', '3');
INSERT INTO `picture` VALUES ('6a17e374-b643-4a53-9981-12e58be2a5dc', null, '候昭慧17375150595', '3');
INSERT INTO `picture` VALUES ('6d072ef5-a207-40c9-a4dc-425e7dfc4bfb', null, '董梦季18890090950', '3');
INSERT INTO `picture` VALUES ('c336330e-5f6e-4816-b65b-9ae28027e76f', null, '覃居上18774861533', '3');
INSERT INTO `picture` VALUES ('9690b31a-b878-4d60-8bdf-2e9448e815db', null, '刘芳15084726641', '3');
INSERT INTO `picture` VALUES ('76a11d30-fa92-4921-8104-01c128b50ce6', null, '崔海骕1871139337', '3');
INSERT INTO `picture` VALUES ('d1c43397-001f-400b-ae73-00c6e27461b9', null, '胡英杰18932449267', '3');
INSERT INTO `picture` VALUES ('36b74fdc-62d5-4d20-b4c0-3acf7317c745', null, '谷孟阳13027424343', '3');
INSERT INTO `picture` VALUES ('7b0efa43-761c-486c-8285-e33fe6e7e92d', null, '文少芬18319368445', '3');
INSERT INTO `picture` VALUES ('c2732e4f-ff7c-4168-a706-467276cc46e4', null, '程新13278882857', '3');
INSERT INTO `picture` VALUES ('a3b322d6-90f5-4d27-8bb1-351944ce46a3', null, '王中钰13007438697', '3');
INSERT INTO `picture` VALUES ('025493f4-3031-4d26-a97a-94a1c003f450', null, '王永娟14747431827', '3');
INSERT INTO `picture` VALUES ('adc81b8e-602a-4642-aa05-6fd3dce8a200', null, '刘建军17830286663', '3');
INSERT INTO `picture` VALUES ('15af7999-b5fa-4f1e-8859-0409afdc4688', null, '廖森18273460875', '3');
INSERT INTO `picture` VALUES ('ea56eb2f-6608-4caa-bc5f-ed70101e17df', null, '李恩启15560279613', '3');
INSERT INTO `picture` VALUES ('42f7d036-eff6-4000-9f34-bea9f636a643', null, '智亚18774878930', '3');
INSERT INTO `picture` VALUES ('931bb143-622e-4344-8da2-5a560d236701', null, '汪永俊13516450815', '3');
INSERT INTO `picture` VALUES ('b0367f3d-cea9-4b29-99e8-9296f1f44bab', null, 'hexl18674819151', '3');
INSERT INTO `picture` VALUES ('73262cbb-7f0d-44c0-9487-2cc7fb6a5358', null, 'test_teacher115578901234', '3');
INSERT INTO `picture` VALUES ('0e829ea2-0647-464d-b6dc-c44efd5dc38f', null, 'hexl18674819151', '3');
INSERT INTO `picture` VALUES ('46ea94d9-9c5d-4f1a-8943-f9847ccf8ee0', null, 'hexl18674819151', '3');
INSERT INTO `picture` VALUES ('02e35c2c-123c-44cd-b1ff-c96091909454', null, 'test_teacher118322344421', '3');
INSERT INTO `picture` VALUES ('14656e76-09ad-4dde-82c2-78fcd9ac07e5', null, 'null18788935643', '3');
INSERT INTO `picture` VALUES ('e713f2c0-ff19-4263-b590-8e4dfde618c2', null, 'test_teacher118711009935', '3');
INSERT INTO `picture` VALUES ('585c7f7b-6b8e-4c97-bf29-78f421169d71', null, '胡明杰18670391790', '3');
INSERT INTO `picture` VALUES ('ebf4bed8-529d-4f43-b56c-0b211da1a51d', null, '周彦宏18006468086', '3');
INSERT INTO `picture` VALUES ('16685aa3-7589-40d2-ac2f-63e3c116e99c', null, '姚明18373177116', '3');
INSERT INTO `picture` VALUES ('80cc1fe4-6aa4-49fe-a71c-0842035e126e', null, '秦国民18174679426', '3');
INSERT INTO `picture` VALUES ('556a2aeb-8c1c-4291-9485-5ed043c866ef', null, '王文丽15874184386', '3');
INSERT INTO `picture` VALUES ('6e87011c-d6a7-4bf5-bc18-eb9356d320cd', null, '刘林13142172699', '3');
INSERT INTO `picture` VALUES ('7884cfad-89c5-41d3-89df-3b6095e7483a', null, '吴俊18774884031', '3');
INSERT INTO `picture` VALUES ('05bd85d1-9e6b-42dd-9889-2ec75721755c', null, '沈昊晟18670741028', '3');
INSERT INTO `picture` VALUES ('8ff783b7-5748-4bea-b81f-f1969240ac38', null, '孔垂越13278880276', '3');
INSERT INTO `picture` VALUES ('de657fcf-fa06-4bab-af63-8c09b03c833d', null, '秦星子18173676040', '3');
INSERT INTO `picture` VALUES ('2b51ede3-40c9-4560-8dbf-c9fde02aeac3', null, 'nullnull', '3');
INSERT INTO `picture` VALUES ('d64cd4ed-2132-42e2-a0c8-564d06762425', null, '金丹静17373139972', '3');
INSERT INTO `picture` VALUES ('2d29ce81-cca3-4c13-8bb4-b7ef76545a43', null, '刘择安13187042971', '3');
INSERT INTO `picture` VALUES ('58fd06a7-890c-4221-9689-ea14daa17bd0', null, '丘浏阳17375876324', '3');
INSERT INTO `picture` VALUES ('608bf3da-7dca-4cdd-a996-61b71178701c', null, '康芯萍13117412195', '3');
INSERT INTO `picture` VALUES ('5458cd11-e167-440e-9036-b07cefa39ff6', null, '贺亚灵18711176332', '3');
INSERT INTO `picture` VALUES ('692819c6-46c6-4992-9be3-54f26b54e897', null, 'xxl12345123456', '3');
INSERT INTO `picture` VALUES ('848e0558-5049-4fc3-88f9-90f6a9f0a7a3', null, 'xxl2null', '3');
INSERT INTO `picture` VALUES ('efd88563-2874-4ff7-80e2-e3b41831682c', null, 'xxl39876123456', '3');
INSERT INTO `picture` VALUES ('79bd28ac-9922-4722-b363-4fcdea1a6cac', null, '王瑜瑜13007437650', '3');
INSERT INTO `picture` VALUES ('4fac4a60-4f46-472c-b3ee-7f8e6b797b85', null, '赵珍莲18711010732', '3');
INSERT INTO `picture` VALUES ('093a18af-ec77-4855-ae66-16016f2235ff', null, '测试null', '3');
INSERT INTO `picture` VALUES ('ca049937-a7bf-4695-bfb5-4792b53d49fb', null, '陈文强17375876486', '3');
INSERT INTO `picture` VALUES ('670f6213-8727-4111-8bc1-c165ad7836ff', null, '唐正梁15200813882', '3');
INSERT INTO `picture` VALUES ('e1d8defc-6cd6-4b53-a1ff-d937eed83da9', null, '石春飞15274937824', '3');
INSERT INTO `picture` VALUES ('1921fe20-1f07-4184-8c71-e575b1de3c0c', null, '王紫薇17375876315', '3');
INSERT INTO `picture` VALUES ('3fa5c97d-fec8-4277-9128-e461df084e48', null, '凌昂阳17352825989', '3');
INSERT INTO `picture` VALUES ('9b0ab351-663f-4de1-8ec2-d084cf5efc2f', null, '张阅兵18807427884', '3');
INSERT INTO `picture` VALUES ('6f94eeae-7a68-4fa4-b6a6-23c53014d041', null, '马千千17338358006', '3');
INSERT INTO `picture` VALUES ('46ab8319-cbc1-435a-9b9f-5abc88313d1a', null, '余思慧18774879232', '3');
INSERT INTO `picture` VALUES ('d6a2bc48-3a8a-497f-8aff-632a193b2294', null, '李朦13278882045', '3');
INSERT INTO `picture` VALUES ('afe462cf-fc14-48ca-b5a8-b8b5cfa03704', null, '胡校林15802545405', '3');
INSERT INTO `picture` VALUES ('eed088a0-cdb6-4030-ab1c-e00d01656581', null, '蔡道俊18570021537', '3');
INSERT INTO `picture` VALUES ('c156aabe-74da-4980-976e-36da67179fb0', null, '陈艳丽18273148176', '3');
INSERT INTO `picture` VALUES ('ede732d7-be7e-4a2c-9f87-a47703eafd65', null, '吴颢钰15116121182', '3');
INSERT INTO `picture` VALUES ('75063416-b6a9-4636-b31c-0ae9e3247fd0', null, '林楸艳15260616082', '3');
INSERT INTO `picture` VALUES ('bcc50e8d-481d-4b7f-8676-a04ca9eda9d1', null, '王景宇13117419963', '3');
INSERT INTO `picture` VALUES ('a490348f-bb67-45f3-a8cc-3e18331def48', null, '王可心15364071892', '3');
INSERT INTO `picture` VALUES ('07e32f7a-48e5-439b-bf2a-5b80984cb99b', null, '杨雪18273181833', '3');
INSERT INTO `picture` VALUES ('5b6cb792-5173-4c4f-9bfb-750b0a7b02b4', null, '雷博翔15675606224', '3');
INSERT INTO `picture` VALUES ('405d6195-383b-42a9-b986-3bb8ccf32247', null, '张艺华18734755680', '3');
INSERT INTO `picture` VALUES ('7345f725-a780-4a28-b6e6-4a17bc1782ed', null, '浦恩泽13278885826', '3');
INSERT INTO `picture` VALUES ('116b3817-983a-439c-bf0b-30cae596d8fc', null, '林双18773353701', '3');
INSERT INTO `picture` VALUES ('6addb316-6176-4de1-8a9c-92eff29c0bb7', null, '刘鑫胜13342581397', '3');
INSERT INTO `picture` VALUES ('50010dc8-67ac-4f7b-a0dc-0fbd80d53b19', null, '刘阳15211152073', '3');
INSERT INTO `picture` VALUES ('7edd2934-7c99-41a5-a708-22485a98cca4', null, '熊楠15243672695', '3');
INSERT INTO `picture` VALUES ('c8be266e-45b8-41f4-8872-7d4d793e7f8a', null, '王子宜18874495063', '3');
INSERT INTO `picture` VALUES ('c827654f-7258-4a21-8518-bed15909c4ab', null, '肖美红15973476383', '3');
INSERT INTO `picture` VALUES ('3f4de0c5-c25b-4a51-bbf3-2c64714039c4', null, '王彤17375896604', '3');
INSERT INTO `picture` VALUES ('12676ac9-5ff2-456d-af31-c65ca28c6c87', null, '陆艺方15580089571', '3');
INSERT INTO `picture` VALUES ('3822e69a-3bf4-4eba-a006-6732b0e3b831', null, '王赛馗15273163117', '3');
INSERT INTO `picture` VALUES ('0ad9f0a7-4aca-4e6c-9403-68b717265cc9', null, '冯俊杰15573131193', '3');
INSERT INTO `picture` VALUES ('ad00c944-c780-48be-be26-a8be486da05f', null, '张玮18174388897', '3');
INSERT INTO `picture` VALUES ('7dc05a26-5080-48bb-9f90-6b05f9218d1a', null, '李叶凡13278887098', '3');
INSERT INTO `picture` VALUES ('80f70d1f-9ea6-40ed-9429-4993604bd0da', null, '罗佩玲15367492896', '3');
INSERT INTO `picture` VALUES ('ac62a6e8-f028-4643-ac06-d6a14dea32b8', null, '梁浩然18890090729', '3');
INSERT INTO `picture` VALUES ('0a2688eb-ec7b-4e69-93f1-4f854f12a9e1', null, '周文婷13627327978', '3');
INSERT INTO `picture` VALUES ('2cef9e4f-1fb5-47a0-a6e8-83cb352a4bf6', null, '万婧怡15211176285', '3');
INSERT INTO `picture` VALUES ('96f2568a-52ef-4f1a-85ee-09e8f3f81f21', null, '朱远航18773222375', '3');
INSERT INTO `picture` VALUES ('24f08eb0-c233-439a-99ca-97db3c3dec4e', null, '张可心15904338936', '3');
INSERT INTO `picture` VALUES ('8e023fff-c954-4e6f-92ad-fba71fdc6140', null, '蔡源培15211147118', '3');
INSERT INTO `picture` VALUES ('34bb9e59-9d42-44a9-a3c7-e8623af0d0cb', null, '王若男15200845080', '3');
INSERT INTO `picture` VALUES ('56b7c3a8-8a6b-42ae-af53-0511d52f6b37', null, '邓俊杰18773124835', '3');
INSERT INTO `picture` VALUES ('2a423069-361c-43a2-8558-cf46b0b22736', null, '曾磊15274986484', '3');
INSERT INTO `picture` VALUES ('bcd98eab-22d6-4be5-8cc3-0662176e222f', null, '刘振辉15073227427', '3');
INSERT INTO `picture` VALUES ('a3ccb7d0-a97e-44bd-ad69-16d17bb0ad9c', null, '毕又凤18890091625', '3');
INSERT INTO `picture` VALUES ('f2d76a94-09f8-4c90-bd80-72e23edb06ba', null, '吕光如18707488530', '3');
INSERT INTO `picture` VALUES ('253075ab-a95e-4167-b492-094f17b73687', null, '宋佳13278889011', '3');
INSERT INTO `picture` VALUES ('ce3219d3-74da-4997-95c5-75e39592b31a', null, '陈鹏13973161442', '3');
INSERT INTO `picture` VALUES ('1f4768e7-45e9-4144-94f3-2cd304d39b7e', null, '张辉煌18273133031', '3');
INSERT INTO `picture` VALUES ('95316cf1-e189-4521-a843-9d58623e0d6b', null, '田江17375895823', '3');
INSERT INTO `picture` VALUES ('94032723-607f-4c68-a817-a80baa755ec2', null, '李平平13971213994', '3');
INSERT INTO `picture` VALUES ('fb9dabf8-ad69-4c38-9d3f-6db353a09f3a', null, '刘洋18890099615', '3');
INSERT INTO `picture` VALUES ('3e50b694-7ca0-45e2-bf90-940d5c27223d', null, '张顺18271800890', '3');
INSERT INTO `picture` VALUES ('98073e96-394f-4baa-aa00-f6ffb3642dfe', null, '魏星18890029746', '3');
INSERT INTO `picture` VALUES ('272731a6-40d3-4571-a3e4-36e62375f4d2', null, '孔市委15729291937', '3');
INSERT INTO `picture` VALUES ('5f589043-2b87-4e2e-a06d-1603dd7fadd5', null, '郑景宇18670056223', '3');
INSERT INTO `picture` VALUES ('f0effef8-2f95-4050-bae6-e44590336a9b', null, '张庆鹏17633732864', '3');
INSERT INTO `picture` VALUES ('e27ff6f7-488d-4d06-9fbd-cf0e732b9e2c', null, '闫龙辉13781584007', '3');
INSERT INTO `picture` VALUES ('1b0f4687-1970-4c7f-a1cd-f48c5a390514', null, '孙丽慧15207483180', '3');
INSERT INTO `picture` VALUES ('c41bee26-541d-44b2-bda0-50fbf46025d2', null, '郎振坡18890090157', '3');
INSERT INTO `picture` VALUES ('cde2d730-c400-4c05-a2f7-0641ce77a95c', null, '王建18570745467', '3');
INSERT INTO `picture` VALUES ('026496e2-2bd6-4f1a-bdf4-8894eef3487e', null, '郑焕然13278884626', '3');
INSERT INTO `picture` VALUES ('b610c9d3-403d-454e-9152-bba79dfbbf15', null, '陈嘉炜18890055753', '3');
INSERT INTO `picture` VALUES ('1a61b435-f823-4fb6-974c-32fc58781fc3', null, '周洋13574013693', '3');
INSERT INTO `picture` VALUES ('66611e56-7e1d-4324-8541-471424034d80', null, '吴昊挚18907430023', '3');
INSERT INTO `picture` VALUES ('1a704e52-f3be-4485-89ef-ef91f819bced', null, '李正斌18773142136', '3');
INSERT INTO `picture` VALUES ('59d45d4d-2e37-47ab-bf58-a85b68c6caca', null, '琳礼先15364071939', '3');
INSERT INTO `picture` VALUES ('1c2b84ae-a233-461b-8dd1-e7884e4c519a', null, '李海慧13278883523', '3');
INSERT INTO `picture` VALUES ('30742675-7ccd-4897-b596-688f56106164', null, '孙佳伟13278881871', '3');
INSERT INTO `picture` VALUES ('e36060f6-8df1-4a53-b739-6d5566bb79cd', null, '刘创13142006921', '3');
INSERT INTO `picture` VALUES ('15faf8e0-7ebe-4bfe-8f60-fc22a4326172', null, '戴雯15367491170', '3');
INSERT INTO `picture` VALUES ('caf07e4d-8b2f-4978-820e-feb8881ddd57', null, '卢俊杭18670352870', '3');
INSERT INTO `picture` VALUES ('4d8d8b2b-6b06-452e-aa1f-43154ec73d1f', null, '谢茜静18890091078', '3');
INSERT INTO `picture` VALUES ('db5e1a32-432b-4343-9b32-308d870a25c8', null, '李文峤18890091135', '3');
INSERT INTO `picture` VALUES ('79207f08-d14d-468c-ad31-5ea2421c26cb', null, '郭胥璟17307485480', '3');
INSERT INTO `picture` VALUES ('3a080e51-7065-4ca2-870a-97034153f613', null, '潘耀坤15364071370', '3');
INSERT INTO `picture` VALUES ('fc0f036c-1813-4e3f-a7ca-0edade2d11de', null, '熊文逸15274954381', '3');
INSERT INTO `picture` VALUES ('9bd2bbcc-ac56-4d20-833b-a6a3a542175f', null, '陈幸18225224792', '3');
INSERT INTO `picture` VALUES ('898c13b4-2185-46d5-ad91-027fc5a833c6', null, '单隽媛13278883307', '3');
INSERT INTO `picture` VALUES ('c85f32f3-a02e-4071-9cd2-ef30808d1c41', null, '陈昆鑫15243611181', '3');
INSERT INTO `picture` VALUES ('1b1e34e2-aef6-46fa-9b61-76d643c23796', null, '罗朝贵18670098595', '3');
INSERT INTO `picture` VALUES ('527909ad-226d-43dd-934a-a08724bc18df', null, '景钰皓17773116402', '3');
INSERT INTO `picture` VALUES ('90375487-d720-4291-b291-1f0013946362', null, '罗淑15207495087', '3');
INSERT INTO `picture` VALUES ('9927eefa-ecc4-478a-84a7-a73a1cfbc299', null, '赵仁熙17375899436', '3');
INSERT INTO `picture` VALUES ('09f65704-ae10-4420-b11c-f65ddf30e609', null, '蔡杨军15243667610', '3');
INSERT INTO `picture` VALUES ('6724dd92-0a2d-4315-84c9-37d3eef15f7c', null, '李秀萍18890090201', '3');
INSERT INTO `picture` VALUES ('2b74ba7a-0be6-437b-8ef0-266e4a153010', null, '杨江波null', '3');
INSERT INTO `picture` VALUES ('1c1b58ce-9608-42b8-9d65-12494574f260', null, '魏萍null', '3');
INSERT INTO `picture` VALUES ('360f307f-cef9-4281-8d0e-22ed2d2c91d3', null, '宋锐涛18273133531', '3');
INSERT INTO `picture` VALUES ('00eaff58-1485-4366-a450-bd77ef8750ba', null, '陈燕坤15974205140', '3');
INSERT INTO `picture` VALUES ('7ab4d30f-b915-4ce0-b33b-bd44b399ce9b', null, '周咏琪18890091206', '3');
INSERT INTO `picture` VALUES ('e1c4d604-ea45-41cd-abe8-88fd4848d8d0', null, '郑乐天18231222718', '3');
INSERT INTO `picture` VALUES ('1ce6311e-8913-4477-9c9c-3372d68c8797', null, '万正15173146900', '3');
INSERT INTO `picture` VALUES ('6b9c307e-80a2-49dc-bc9b-6e2819f07325', null, '樊诗颖13278883347', '3');
INSERT INTO `picture` VALUES ('fff5277f-3635-4532-a03d-bf9a3b40edc2', null, '程烽18872235163', '3');
INSERT INTO `picture` VALUES ('5675bc8d-c09f-4b9c-8857-792fda464b06', null, '李思源18569479523', '3');
INSERT INTO `picture` VALUES ('7b039c76-7b06-470a-a973-27926b6350ca', null, '黄佳诚18890092175', '3');
INSERT INTO `picture` VALUES ('d6034346-b290-4cdd-a1d3-017997aa127d', null, '简兴光18286010673', '3');
INSERT INTO `picture` VALUES ('38aa010d-b0df-4281-90e3-d1e05f32b5a4', null, '张思敏133316144178', '3');
INSERT INTO `picture` VALUES ('590561c8-ec90-4561-b595-e992788600f2', null, '姚金甫18919974601', '3');
INSERT INTO `picture` VALUES ('5248456e-db61-456f-a09d-675d66557713', null, '陈俊骐13278880740', '3');
INSERT INTO `picture` VALUES ('8000daab-4b9e-415f-b896-51db7b8bb4f1', null, '卿旭东13364095520', '3');
INSERT INTO `picture` VALUES ('6fc1ccd0-9f5a-492b-944b-c42b79295b9a', null, '岳弘17343620482', '3');
INSERT INTO `picture` VALUES ('3aa3f56c-46f1-4157-a12f-7232062cf5c1', null, '左灿灿15274928081', '3');
INSERT INTO `picture` VALUES ('4fd514df-ce99-4f4a-8be6-8b72ebb98ccd', null, '马豪杰15938552770', '3');
INSERT INTO `picture` VALUES ('e061ffab-bc87-46f2-a708-3e1f08371959', null, '戴凌雪15200866485', '3');
INSERT INTO `picture` VALUES ('beb4cac0-41de-4a5b-b92e-06b505f6258e', null, '程泽宇13278882796', '3');
INSERT INTO `picture` VALUES ('b0809c6d-25e6-472a-b07a-112c0c84aeb7', null, '向诗淯18890099818', '3');
INSERT INTO `picture` VALUES ('825265cd-942d-44ac-8c69-f981b67b4d9b', null, '张望临15029716957', '3');
INSERT INTO `picture` VALUES ('eec86e90-e870-4ce8-a9d7-4c4a64a0fbc0', null, '任波15309635998', '3');
INSERT INTO `picture` VALUES ('ba73f2b8-0634-41db-95b1-f4f0a7ae361e', null, '夏余宏烨18711000934', '3');
INSERT INTO `picture` VALUES ('4a560d16-88ca-42d3-8ff9-9731f340a3b2', null, '常铭杰18293225005', '3');
INSERT INTO `picture` VALUES ('e4d5f5be-e490-45c7-ad0e-00cd8b02c7fa', null, '黄雅丽17307410494', '3');
INSERT INTO `picture` VALUES ('bc7a3bcf-6e4c-4fbf-bc4e-193892059fe4', null, '李杰18182120921', '3');
INSERT INTO `picture` VALUES ('da13fcaf-358d-47c6-afa7-16ae02fbf335', null, '莫文涛13278883791', '3');
INSERT INTO `picture` VALUES ('4053f29a-515f-4690-b172-9bc336524779', null, '高天宇13853155413', '3');
INSERT INTO `picture` VALUES ('8015927c-42fb-432d-9d0c-3fd213ea4098', null, '杜家鑫15200943859', '3');
INSERT INTO `picture` VALUES ('e472448f-658f-44c1-8006-b44ef078d5c7', null, '佘俊霖17307409636', '3');
INSERT INTO `picture` VALUES ('1958010b-4330-4d62-b05b-264a56da66fb', null, '杨乔洪15211042028', '3');
INSERT INTO `picture` VALUES ('b091ae82-867c-4a00-8b56-b81f94391ccc', null, '叶超宏15878011639', '3');
INSERT INTO `picture` VALUES ('c14ed53d-baed-42c4-9c5a-a953f3e4d531', null, '许嘉伦15084804664', '3');
INSERT INTO `picture` VALUES ('2ddd325e-cbe0-4e65-bf01-c1caf2c3f1c1', null, '钟心怡18774843731', '3');
INSERT INTO `picture` VALUES ('46100742-108f-4f78-b188-60bf165f935e', null, '孙娜15200904780', '3');
INSERT INTO `picture` VALUES ('2bc885f9-a807-4e05-8cfb-1186369c1b5b', null, 'nullnull', '3');
INSERT INTO `picture` VALUES ('dc703361-57a4-461c-a2b7-66517c16fd41', null, '冯书颖18774930131', '3');
INSERT INTO `picture` VALUES ('9be1f647-8816-42da-9f3d-1eef6692384e', null, '肖灿13548505609', '3');
INSERT INTO `picture` VALUES ('13f5beb5-7a1e-4cad-b0ec-2e71b98efef8', null, '苏栋18773194631', '3');
INSERT INTO `picture` VALUES ('cfcc229f-f6ba-43f8-864e-eac7c2a476cb', null, '刘家乐15274902186', '3');
INSERT INTO `picture` VALUES ('09ca2ee4-a760-411f-b7ef-78c5a71dc53b', null, '龙涛13278884104', '3');
INSERT INTO `picture` VALUES ('7b505448-719f-4b2e-985c-0cf7a7b23404', null, '龙宇涵15211007497', '3');
INSERT INTO `picture` VALUES ('edc99019-9731-4870-8477-f9424bdaa673', null, '王琪琪15200867381', '3');
INSERT INTO `picture` VALUES ('8f257b3d-81b0-4613-a0a5-05f72c3e36f6', null, '杨鑫15927580249', '3');
INSERT INTO `picture` VALUES ('65b012cd-1e4f-48fd-b48a-8f0d89ba7c6e', null, '邸卓瑞18035059033', '3');
INSERT INTO `picture` VALUES ('3081a2e3-948c-4755-a3ea-6ec1bd6202c4', null, '蒋笑冰15274858182', '3');
INSERT INTO `picture` VALUES ('b727d029-ef4a-4e75-abf6-764012a8ba92', null, '张佳琪13278886863', '3');
INSERT INTO `picture` VALUES ('6faadb06-4301-4166-8e9c-74d07c23339f', null, '方圆17388904974', '3');
INSERT INTO `picture` VALUES ('9c6b3c34-10a0-45de-9720-68ea46b6133f', null, 'nullnull', '3');
INSERT INTO `picture` VALUES ('6a49a4b4-671c-4d67-aa58-970fa19d4a9d', null, '韩志林15997035742', '3');
INSERT INTO `picture` VALUES ('40e4c065-27df-47fb-9bf4-96ed1305de4f', null, '谭兵13325698690', '3');
INSERT INTO `picture` VALUES ('68fa02ce-0349-4c5d-8290-cc6485bf269e', null, '王帅康13278883092', '3');
INSERT INTO `picture` VALUES ('0b4f086f-d4f4-4baa-8cba-35e41b2c54ec', null, '高帅15211060083', '3');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预约管理';

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('0738d5ef-8a05-4a2c-98b1-7ae2b1a33720', null, '9fff5f18-3b48-416f-a009-c0b27fdcc93b', 'b0da32eb-4487-4e46-b742-7cabb3c368db', '111', '2018-01-09 23:29:37', '0', '未处理');
INSERT INTO `schedule` VALUES ('63bf2cc4-32e4-480c-8a46-e9b7ff7eb4f0', null, null, 'aaaa', '321', '2018-01-08 20:59:48', '0', '未处理');
INSERT INTO `schedule` VALUES ('27e3c4ba-9486-4d82-82ca-170a1cb2508a', null, 'e11b2b2c-e1c9-4e2d-b525-ac74e1fa1874', '33a73459-0041-4a97-9b79-93b120f030ca', '-111', '2018-03-04 15:46:06', '0', '未处理');
INSERT INTO `schedule` VALUES ('ade58d16-7cfb-42b7-92a4-4e4835b79e2d', null, 'd4bb6b04-013a-48cf-9a1e-9a611309e597', '13477b94-ad83-4554-a68f-5d8d2235c14d', '-122', '2018-03-04 15:47:03', '0', '未处理');
INSERT INTO `schedule` VALUES ('13e5cad4-c9b8-4058-8890-592e8c4f1e0d', null, 'fe6d78ca-0290-47eb-894e-3b7be3d0044a', '69035d26-961f-46ca-a777-0199c784eeb4', '-111', '2018-03-04 15:55:28', '0', '未处理');
INSERT INTO `schedule` VALUES ('82a48461-75a5-4735-a626-68bf4ab00065', null, 'e98c04c3-7e46-45c7-a835-708d35b343a8', '69035d26-961f-46ca-a777-0199c784eeb4', '-151', '2018-03-04 16:23:42', '0', '未处理');
INSERT INTO `schedule` VALUES ('c3b741b2-fb09-4815-8ba7-73fabe407b30', null, '3246e59a-15a3-47af-a685-50d8460c547e', '69035d26-961f-46ca-a777-0199c784eeb4', '-221', '2018-03-04 16:40:17', '0', '未处理');
INSERT INTO `schedule` VALUES ('e696fe5c-c03c-4fa3-91f4-23e07f76f396', null, 'be438bc5-086b-4b5b-81a4-514538974df4', 'bd2bfad2-d416-4939-81b0-bec28836261a', '-232', '2018-03-18 20:24:10', '0', '未处理');
INSERT INTO `schedule` VALUES ('fa96398e-df41-4ea9-9b84-53d74afb65ae', null, '0f390070-d868-42d9-832e-8dd8cf229124', 'd470160f-c9f7-45c2-8e97-66acf23c7b67', '-337', '2018-03-04 17:08:30', '0', '未处理');
INSERT INTO `schedule` VALUES ('79a0685d-12e4-49de-915a-c4dfa8841b46', null, 'adc3ed56-0a9b-4891-b1fc-7177706d51e9', 'ba55085d-b32b-46f0-950c-3f21029d77a8', '-232', '2018-03-21 18:51:00', '0', '未处理');
INSERT INTO `schedule` VALUES ('8a0b6903-0514-40b4-af9f-3aed07e46d75', null, '3a614d80-f7bb-46d4-89da-23080e97ea02', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '-318', '2018-04-21 20:26:54', '1', '已处理');
INSERT INTO `schedule` VALUES ('48f34b16-5b69-458a-b0ec-48cd56e50071', null, '993d2b0b-eea2-4fb7-9c43-6ffe8db1f21a', 'b69c3ccb-f365-4740-b659-ec0e2d13f13b', '-111', '2018-04-02 22:43:45', '0', '未处理');
INSERT INTO `schedule` VALUES ('06b8279f-79da-4067-9e29-a61fc7e25a58', null, 'b485cc15-b6e9-4153-90a8-7899d9d8d91d', '925a659e-1f94-4ae9-ab95-b4f6d9ad306d', '-319', '2018-04-02 23:02:31', '1', '王老师跟进');
INSERT INTO `schedule` VALUES ('a20b137f-50db-4302-b50d-9a55259c7433', null, '4af80a67-c242-4c95-b7d5-cf6fd2463dae', '8bdfa5b3-7e9d-49a4-b2c7-e87a107f821b', '-152', '2018-04-13 20:54:38', '1', '王老师跟进');
INSERT INTO `schedule` VALUES ('fabd9353-29c9-4ce0-be7e-c586f04ef04e', null, '1886a744-3e9e-4bce-b586-ac1c0027dd70', 'ee853e30-c0d1-4362-82dc-619b912b0f17', '-313', '2018-04-25 19:52:44', '1', '杨老师');
INSERT INTO `schedule` VALUES ('d450b141-76dc-4e98-ba8c-d4b803a57ab1', null, '5cc50b32-8179-458f-9663-8704d9ebddff', '9b2daa11-9851-41f0-8365-dc3ce439c584', '-212', '2018-03-31 21:08:31', '0', '未处理');
INSERT INTO `schedule` VALUES ('5db29680-4ac3-4fa1-b310-02a4b74424a1', null, '3a614d80-f7bb-46d4-89da-23080e97ea02', 'b83d9ea4-524d-4cf2-910c-4e546e098eff', '-318', '2018-04-21 20:27:08', '1', '未处理');
INSERT INTO `schedule` VALUES ('3ff41619-6155-40b3-bced-383b84526776', null, 'f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '520edb90-d404-4d5a-aa3e-448c90052e52', '-111', '2018-04-25 19:45:32', '0', '王老师');
INSERT INTO `schedule` VALUES ('b4c1f4ba-e905-49d0-a641-dc2a87ae694a', null, 'e2e19fd3-41b1-47b5-b87e-041e01afc926', '36215688-a895-40a8-88d4-e9cdf3a623fa', '-226', '2018-04-26 22:39:52', '0', '董老师');
INSERT INTO `schedule` VALUES ('e9ef693a-4934-4eaa-843d-18ca311956c1', null, '795e04b3-6af9-4e75-b9e9-0f1e2be57109', '8f0be3b7-ebbe-4eeb-b77f-5ab393624436', '-222', '2018-04-26 15:02:50', '0', '刘老师');
INSERT INTO `schedule` VALUES ('2bc1b43b-b53a-4efb-b11d-6c3a1e844ada', null, 'f0ae0032-edfc-4c81-8174-8381a3633050', 'b2271803-6d85-4680-8e21-0a225c5b2cb3', '-222', '2018-04-26 16:20:21', '0', '李老师');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学校信息';

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('0df8c14e-2710-46db-86e0-b9cab53c995f', '测试学校', null, null);
INSERT INTO `school` VALUES ('e5d67246-97a1-4168-911c-e839fad40a0c', '黄黄黄黄黄黄', null, null);
INSERT INTO `school` VALUES ('1a2e9c4f-a042-44bd-9440-1fcdd323d5aa', '嘿嘿', null, null);
INSERT INTO `school` VALUES ('7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '中南大学', null, null);
INSERT INTO `school` VALUES ('93a83e90-cb0d-444c-9832-7d098d67b65f', '无名', null, null);
INSERT INTO `school` VALUES ('e0fe4196-01ed-47e5-a297-37c81239b264', '111', null, null);
INSERT INTO `school` VALUES ('1389a575-e1a9-46ab-853d-c2df5adcad5f', '牛B大学', null, null);
INSERT INTO `school` VALUES ('027ba369-4f51-4cd1-ada8-2607efa2fe50', '新疆石河子大学', null, null);
INSERT INTO `school` VALUES ('7ecf30e2-849b-4e93-82ba-469a2be66d32', '中南', null, null);
INSERT INTO `school` VALUES ('8646e245-5ff5-49ba-85ed-fcff3b391956', null, null, null);
INSERT INTO `school` VALUES ('59046373-c6d8-4ca4-b133-89416ead9a20', '1111', null, null);
INSERT INTO `school` VALUES ('f3e0ee6c-7c5f-42ca-8060-f2b39dbf2361', 'nihao', null, null);
INSERT INTO `school` VALUES ('9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '湖南大学', null, null);
INSERT INTO `school` VALUES ('6a4997b2-5319-4119-841f-cbb40b93f40e', '好未来', null, null);
INSERT INTO `school` VALUES ('325c57cf-7bb8-4e2c-b773-57b175c84dbe', '323213', null, null);
INSERT INTO `school` VALUES ('7528be2b-55a2-4e56-b01e-d13fa6703f1f', '21321', null, null);
INSERT INTO `school` VALUES ('6ce1ecd6-f1dc-430f-9882-a923822ddaf3', null, null, null);
INSERT INTO `school` VALUES ('81e1a737-aaac-41cb-bc47-5f8ab611c940', '好未来', null, null);
INSERT INTO `school` VALUES ('6ebee2fe-d9ac-4c76-97ba-d6969b3dc5d7', '21321', null, null);
INSERT INTO `school` VALUES ('6d52123a-ce1f-497e-ae85-15a6e6436462', '111', null, null);
INSERT INTO `school` VALUES ('ebf25a54-909a-4c1d-b473-3263e5f43499', '中南大学', null, null);
INSERT INTO `school` VALUES ('00fdb3a1-5776-402b-9385-652d8172d516', null, null, null);
INSERT INTO `school` VALUES ('b0c6b8bf-a238-44d7-a826-e00cf840a4e0', '邵阳学院', null, null);
INSERT INTO `school` VALUES ('96a1b01d-7c17-4fcd-ba0b-12a6c1e64592', '测', null, null);
INSERT INTO `school` VALUES ('9d4e5e92-31fd-4055-a90d-41cae7215ddf', '放豆腐', null, null);
INSERT INTO `school` VALUES ('b5bdffd6-131d-411d-a8dd-7e0bbecdfcaa', null, null, null);
INSERT INTO `school` VALUES ('ac10c396-6558-4405-ba13-f2c198c50e47', '牛B大学', null, null);
INSERT INTO `school` VALUES ('63c27cd7-e7c7-4c6f-9365-f14eed2aae73', '湖南师范大学', null, null);
INSERT INTO `school` VALUES ('cefade04-5a72-4b8d-83d1-6c912cebe56e', '湖南大学', null, null);
INSERT INTO `school` VALUES ('daf91ec1-833a-466d-aebb-2f5e97f2134f', '中南大徐', null, null);
INSERT INTO `school` VALUES ('d15a006b-1db7-484e-b9b6-626859a75e61', null, null, null);
INSERT INTO `school` VALUES ('edd22124-49da-485d-af5d-9d195034a54c', '武汉理工大学', null, null);
INSERT INTO `school` VALUES ('294479b3-7143-436b-8927-1670e38cc7cf', null, null, null);

-- ----------------------------
-- Table structure for send_tmp_msg_failed
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
INSERT INTO `send_tmp_msg_failed` VALUES ('776c734a-bce0-48d6-96e5-8184061971a0', '2018-04-10 23:09:47', 'oVbXbw3uwQzorBlO540_fPwZ-EC4', '231202070542172160', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=776c734a-bce0-48d6-96e5-8184061971a0&month=3&teachingId=f2eff1fa-55b8-4a6b-8d24-59773b22d648');
INSERT INTO `send_tmp_msg_failed` VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '2018-04-10 23:21:12', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '231213555569950720', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=d668d2b7-1808-419d-868e-9a76e91ddb6b&month=3&teachingId=2d72270f-f8fe-4a24-93b2-885e8f8f5463');
INSERT INTO `send_tmp_msg_failed` VALUES ('fa4a9cad-7de1-49da-9fae-526fab064a66', '2018-04-11 00:02:11', 'oVbXbw4MjDaF8F44mcy_mMgWGT9E', '231254812019245056', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=fa4a9cad-7de1-49da-9fae-526fab064a66&month=3&teachingId=5a88004b-a6ed-4463-aa35-33f6befbff13');
INSERT INTO `send_tmp_msg_failed` VALUES ('b091936b-3866-4e98-8ac6-9d72df59a56f', '2018-04-11 13:29:52', 'oVbXbw6iIsxcBL7WkRjdLICg1PaY', '232067852146966528', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=b091936b-3866-4e98-8ac6-9d72df59a56f&month=3&teachingId=ded7ab44-98ea-4eff-b893-3ab04630129e');
INSERT INTO `send_tmp_msg_failed` VALUES ('de89ed26-b005-42e6-870a-e367aac4f28c', '2018-04-11 20:32:27', 'oVbXbw2CjACmpC3kNmUcepHU99jU', '232493237082914818', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=de89ed26-b005-42e6-870a-e367aac4f28c&month=3&teachingId=ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67');
INSERT INTO `send_tmp_msg_failed` VALUES ('858ca17d-2205-4934-96df-f339b1826c95', '2018-04-11 21:54:27', 'oVbXbwy5_2XuqlLWjgPzuA5t2v5c', '232575776271122432', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=858ca17d-2205-4934-96df-f339b1826c95&month=3&teachingId=fe4dc516-1b4b-42ad-ba51-5c79f200fa1e');
INSERT INTO `send_tmp_msg_failed` VALUES ('164b3a53-487f-4d0b-8f55-e911ff2ebd7a', '2018-04-12 10:10:43', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '233316921599344640', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=164b3a53-487f-4d0b-8f55-e911ff2ebd7a&month=3&teachingId=4d8192eb-b19b-4526-99b1-3604d27033be');
INSERT INTO `send_tmp_msg_failed` VALUES ('b6834d89-855e-43b9-bebd-03f7ed7df8d1', '2018-04-14 16:29:08', 'oVbXbw7rTM-humGwLVWfSnDPChyE', '236596956900753408', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=b6834d89-855e-43b9-bebd-03f7ed7df8d1&month=3&teachingId=a9be6da1-71d3-4437-b617-4ce283c0d587');
INSERT INTO `send_tmp_msg_failed` VALUES ('6a9ce13b-43bc-4087-8559-17d2067c8377', '2018-04-14 21:23:38', 'oVbXbw7rTM-humGwLVWfSnDPChyE', '236893406213832704', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=6a9ce13b-43bc-4087-8559-17d2067c8377&month=3&teachingId=8d5fa78f-c3fb-48e7-9441-046d55522dc7');
INSERT INTO `send_tmp_msg_failed` VALUES ('10f187d9-86bb-4b6b-bc41-0077feff67eb', '2018-04-15 10:44:04', 'oVbXbwwn_1abXhL6bfOyYrqnXaIc', '237699164593471488', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=10f187d9-86bb-4b6b-bc41-0077feff67eb&month=3&teachingId=9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c');
INSERT INTO `send_tmp_msg_failed` VALUES ('499c228e-9f60-404f-b286-83fc47083580', '2018-04-16 10:30:58', 'oVbXbw4VvGPQs8BodXl5gJPqtL5M', '239135521648017410', '5', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201804\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=499c228e-9f60-404f-b286-83fc47083580&month=3&teachingId=f849cbc7-5943-4710-b614-8f8cffd304e5');
INSERT INTO `send_tmp_msg_failed` VALUES ('131db198-5ee5-40d5-a003-b88e5751b0bb', '2018-05-01 08:09:05', 'oVbXbw9cwZ2v1li11293qbJOXbiI', '260735975318159360', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=131db198-5ee5-40d5-a003-b88e5751b0bb&month=4&teachingId=1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4');
INSERT INTO `send_tmp_msg_failed` VALUES ('910b132c-352a-4000-b1b9-0e9fabbbb9ff', '2018-05-01 10:06:12', 'oVbXbw5d3U3pgAADE2wjuj5cR8t4', '260853869452574721', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=910b132c-352a-4000-b1b9-0e9fabbbb9ff&month=4&teachingId=d8284412-4b3d-413c-88f3-d5c913f5df4f');
INSERT INTO `send_tmp_msg_failed` VALUES ('be7f016d-d506-4994-871c-693597d9142a', '2018-05-01 10:53:06', 'oVbXbwz2Q2bylo14x3gi8qwDD4Ok', '260901066831593472', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=be7f016d-d506-4994-871c-693597d9142a&month=4&teachingId=ca629310-5a4f-4fa9-bca2-d42c642935ce');
INSERT INTO `send_tmp_msg_failed` VALUES ('80e0f1b3-e20f-4619-b722-f5f3ee4d4706', '2018-05-01 11:35:43', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '260943987177963520', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=80e0f1b3-e20f-4619-b722-f5f3ee4d4706&month=4&teachingId=5a657d14-c207-411d-8bdf-cf6cb8e0db70');
INSERT INTO `send_tmp_msg_failed` VALUES ('9a994df4-d392-4b3c-aea9-4388586fc6b5', '2018-05-01 11:38:16', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '260946546307383299', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=9a994df4-d392-4b3c-aea9-4388586fc6b5&month=4&teachingId=322e7938-af42-48ec-9fb9-8bd4a66c316c');
INSERT INTO `send_tmp_msg_failed` VALUES ('a625ba8d-8aa2-49f0-9520-9d788bc0d653', '2018-05-01 11:40:57', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '260949238027141121', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=a625ba8d-8aa2-49f0-9520-9d788bc0d653&month=4&teachingId=ed49c2bd-76cd-4716-a692-ab32a84c7c56');
INSERT INTO `send_tmp_msg_failed` VALUES ('da13ac4e-c23b-4e89-8d15-c307f156b95f', '2018-05-01 11:53:36', 'oVbXbw4uMHHKRBgzN7ThvhwvaMCw', '260961985657700353', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=da13ac4e-c23b-4e89-8d15-c307f156b95f&month=4&teachingId=f558d3cb-3858-44de-aece-19b4ffc45396');
INSERT INTO `send_tmp_msg_failed` VALUES ('bed82131-ef62-4dd9-8d5a-6a94c7d07195', '2018-05-01 11:56:49', 'oVbXbw8eO3oOM-uexSl8zfPRAIlM', '260965211798781953', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=bed82131-ef62-4dd9-8d5a-6a94c7d07195&month=4&teachingId=046b4cdf-9682-4bfd-b1e5-660e1bdc3494');
INSERT INTO `send_tmp_msg_failed` VALUES ('6117d393-f201-49c3-994f-4793911ae223', '2018-05-01 11:58:51', 'oVbXbw2nFXVjiygGB4yWRWmJwZGA', '260967259105673219', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=6117d393-f201-49c3-994f-4793911ae223&month=4&teachingId=748ac459-aca8-4b9a-b792-e3aaf09a8e23');
INSERT INTO `send_tmp_msg_failed` VALUES ('919103bd-1b71-49e9-9c8b-61172c85a958', '2018-05-01 11:59:08', 'oVbXbw7822ek7xNh2gzfni4nX64g', '260967542724640768', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=919103bd-1b71-49e9-9c8b-61172c85a958&month=4&teachingId=f926d599-de1a-4b81-8343-9833c57a0882');
INSERT INTO `send_tmp_msg_failed` VALUES ('48b6f75f-c59a-41d2-94f6-4d5694362dca', '2018-05-01 12:03:09', 'oVbXbw7-_vX70-1XKSFA9o_iXD9w', '260971594422173696', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=48b6f75f-c59a-41d2-94f6-4d5694362dca&month=4&teachingId=b18c2e01-544d-4e2b-bd41-3772c57c6976');
INSERT INTO `send_tmp_msg_failed` VALUES ('31d8f749-9d61-4c46-b898-f39aaca8ce78', '2018-05-01 12:03:29', 'oVbXbw7rTM-humGwLVWfSnDPChyE', '260971932902621188', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=31d8f749-9d61-4c46-b898-f39aaca8ce78&month=4&teachingId=a9be6da1-71d3-4437-b617-4ce283c0d587');
INSERT INTO `send_tmp_msg_failed` VALUES ('81965c44-34f3-4eb7-b86c-dc868de6019d', '2018-05-01 12:13:43', 'oVbXbwxjZUO4X6h1K3gipaI3SXBI', '260982228509655040', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=81965c44-34f3-4eb7-b86c-dc868de6019d&month=4&teachingId=f42c23d6-7845-4509-8fab-1fcaf335e47f');
INSERT INTO `send_tmp_msg_failed` VALUES ('49d2f330-bc86-41e0-8c7d-300277fe4aaf', '2018-05-01 12:23:10', 'oVbXbw-gQ3GMcaGzbvh4TDvFmWHI', '260991745720958977', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=49d2f330-bc86-41e0-8c7d-300277fe4aaf&month=4&teachingId=562f12cf-b532-44b1-8d55-dd55e8211fed');
INSERT INTO `send_tmp_msg_failed` VALUES ('c14b02d3-65aa-4a96-8ba4-700a87a1892e', '2018-05-01 12:37:11', 'oVbXbw9PpOyXYcP4rW8FUiPYUD-M', '261005847507861505', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=c14b02d3-65aa-4a96-8ba4-700a87a1892e&month=4&teachingId=2005fb38-1aff-4750-860c-5ab7ec146159');
INSERT INTO `send_tmp_msg_failed` VALUES ('e746feda-1f01-413a-949b-ad4cbcf930e2', '2018-05-01 12:44:35', 'oVbXbw8eO3oOM-uexSl8zfPRAIlM', '261013301540962304', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=e746feda-1f01-413a-949b-ad4cbcf930e2&month=4&teachingId=39a82af9-6cdf-4b92-b0ad-2af75eb02564');
INSERT INTO `send_tmp_msg_failed` VALUES ('be20e8d1-4717-4ff9-b339-776c28a60dbf', '2018-05-01 12:48:42', 'oVbXbw97xD7OQZtahWFYPdwXQA2o', '261017434910113793', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=be20e8d1-4717-4ff9-b339-776c28a60dbf&month=4&teachingId=5814d9fa-49fb-44ab-9304-70245d4f6836');
INSERT INTO `send_tmp_msg_failed` VALUES ('e1177e52-2982-4dd6-acc2-afab0912bc12', '2018-05-01 12:55:52', 'oVbXbwwfR4JtBvpF5HAgNMdbAtyg', '261024648257404928', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=e1177e52-2982-4dd6-acc2-afab0912bc12&month=4&teachingId=92eb657d-e40f-40c5-b61e-a2bf5cabdc55');
INSERT INTO `send_tmp_msg_failed` VALUES ('d5aba5bf-dbee-4c44-bc19-856c8fb4a028', '2018-05-01 13:00:01', 'oVbXbw-sg31MqzYypipxso5ik7Jw', '261028835212951552', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=d5aba5bf-dbee-4c44-bc19-856c8fb4a028&month=4&teachingId=6e70e2ed-d5f7-4903-bfa3-6c8e6c520105');
INSERT INTO `send_tmp_msg_failed` VALUES ('4d169003-0a87-4419-bf67-a9652d7a04cf', '2018-05-01 13:01:47', 'oVbXbw4MjDaF8F44mcy_mMgWGT9E', '261030605846855682', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=4d169003-0a87-4419-bf67-a9652d7a04cf&month=4&teachingId=e10d87f4-b1eb-4b93-b46c-153cd988a403');
INSERT INTO `send_tmp_msg_failed` VALUES ('c41a7d79-d132-4d12-94ab-766269c6ec88', '2018-05-01 13:12:46', 'oVbXbw3WONkmhzqqn_bHdcSXgI_Y', '261041666109243392', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=c41a7d79-d132-4d12-94ab-766269c6ec88&month=4&teachingId=31464416-5264-4c76-b092-1f9fbd9492b6');
INSERT INTO `send_tmp_msg_failed` VALUES ('99df6085-6cb5-4fdf-8f7c-fd205009db2d', '2018-05-01 13:14:35', 'oVbXbwwn_1abXhL6bfOyYrqnXaIc', '261043488047513600', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=99df6085-6cb5-4fdf-8f7c-fd205009db2d&month=4&teachingId=9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c');
INSERT INTO `send_tmp_msg_failed` VALUES ('e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6', '2018-05-01 13:15:48', 'oVbXbwyUuyPAmfFhzKvwEwWLUf1g', '261044714428547072', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6&month=4&teachingId=c4687b90-59ee-490e-ad3c-19c1ac078a6d');
INSERT INTO `send_tmp_msg_failed` VALUES ('9119c7df-496f-452b-bdc2-81ebb14e0031', '2018-05-01 13:21:59', 'oVbXbwy5_2XuqlLWjgPzuA5t2v5c', '261050940654632961', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=9119c7df-496f-452b-bdc2-81ebb14e0031&month=4&teachingId=fe4dc516-1b4b-42ad-ba51-5c79f200fa1e');
INSERT INTO `send_tmp_msg_failed` VALUES ('57f309f4-9ec1-4959-840b-6601ca4d9079', '2018-05-01 13:36:22', 'oVbXbw47yNvinrJsh_LCQk8GOKWs', '261065426287493120', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=57f309f4-9ec1-4959-840b-6601ca4d9079&month=4&teachingId=7f1832d8-58ae-42fa-be61-eabead92fb65');
INSERT INTO `send_tmp_msg_failed` VALUES ('72f637f3-2368-4b98-a20b-a82fb2f63614', '2018-05-01 13:37:27', 'oVbXbwweYJ8mz_OBU0MZoFT2NOgQ', '261066517477883904', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=72f637f3-2368-4b98-a20b-a82fb2f63614&month=4&teachingId=4b99627f-fdf6-4325-a3d6-f5c83a421706');
INSERT INTO `send_tmp_msg_failed` VALUES ('1445e16c-db2f-4659-a470-568e5eef6766', '2018-05-01 13:42:20', 'oVbXbwzVzcThkHR3qlZXjzQtcoDQ', '261071427111780352', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=1445e16c-db2f-4659-a470-568e5eef6766&month=4&teachingId=4106e469-d4e3-4069-b8db-b4cd7b8879e4');
INSERT INTO `send_tmp_msg_failed` VALUES ('06033fe7-73f0-4c7e-b653-2579c483033f', '2018-05-01 13:45:33', 'oVbXbwzoRrWj3qNPcJJ9K-hCTc6s', '261074661239046144', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=06033fe7-73f0-4c7e-b653-2579c483033f&month=4&teachingId=d1614c47-e200-4dcd-afc9-3b47b23fae37');
INSERT INTO `send_tmp_msg_failed` VALUES ('64c6f291-8c5d-419a-bc65-3e7f461483ff', '2018-05-01 13:46:45', 'oVbXbwzp8RGQYkYcjF_SsdF6EFHY', '261075864970887169', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=64c6f291-8c5d-419a-bc65-3e7f461483ff&month=4&teachingId=b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02');
INSERT INTO `send_tmp_msg_failed` VALUES ('afb119c7-ca8f-421a-82f9-a946635273f7', '2018-05-01 14:09:39', 'oVbXbw7Rzy3YUsvnp9YGxufzqeVI', '261098929196646401', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=afb119c7-ca8f-421a-82f9-a946635273f7&month=4&teachingId=eb16769b-010f-4f88-ae0b-4e0cb99086f0');
INSERT INTO `send_tmp_msg_failed` VALUES ('c26474c5-c5c5-42fa-a94a-88f318bfd288', '2018-05-01 14:36:31', 'oVbXbwzUr6mxYDagTW3eIfcoXxcg', '261125975612473344', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=c26474c5-c5c5-42fa-a94a-88f318bfd288&month=4&teachingId=4ba8c060-9f43-4d91-8c5f-bf1034009612');
INSERT INTO `send_tmp_msg_failed` VALUES ('a7ba65db-23a0-4d41-84f1-a334525e4adb', '2018-05-01 15:15:42', 'oVbXbw5QHZoq6ViOgx-E1AEBfXeA', '261165419350736897', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=a7ba65db-23a0-4d41-84f1-a334525e4adb&month=4&teachingId=f371aeda-adc3-4cd6-9da2-aca6e5509aa7');
INSERT INTO `send_tmp_msg_failed` VALUES ('3b636c17-80b6-4948-b071-e723ca266185', '2018-05-01 15:26:56', 'oVbXbwxAN7aPxzK-PuSTSqdhMWUQ', '261176730079838208', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=3b636c17-80b6-4948-b071-e723ca266185&month=4&teachingId=bbcd0381-1fe7-4c13-9eff-71fced57f12e');
INSERT INTO `send_tmp_msg_failed` VALUES ('bf2ccb37-6fc7-44c3-bb14-f997624b41c1', '2018-05-01 15:27:20', 'oVbXbw3f4wLO1M7gsveeCQfE2Ln4', '261177131290181633', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=bf2ccb37-6fc7-44c3-bb14-f997624b41c1&month=4&teachingId=d7eb7185-cfa1-4e18-b0ee-400b78264e84');
INSERT INTO `send_tmp_msg_failed` VALUES ('b9623f4f-e5ae-4f49-a531-59cc431c6574', '2018-05-01 15:27:53', 'oVbXbw8pPonm7QN8YjNxlHQ6DVZU', '261177683931693056', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=b9623f4f-e5ae-4f49-a531-59cc431c6574&month=4&teachingId=2958a37f-63b0-43ae-a608-1dbc06565d7e');
INSERT INTO `send_tmp_msg_failed` VALUES ('aca000ef-ec2d-4753-99c9-9195c41e182e', '2018-05-01 15:39:31', 'oVbXbwyUuyPAmfFhzKvwEwWLUf1g', '261189397179908096', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=aca000ef-ec2d-4753-99c9-9195c41e182e&month=4&teachingId=3f62df1a-7ce8-4d41-9476-aec52a3c267d');
INSERT INTO `send_tmp_msg_failed` VALUES ('afe806b3-6f98-4eec-9f1e-5f820a6ddfd3', '2018-05-01 17:54:30', 'oVbXbw8KR2R4003wQA3ajD8qhySw', '261325269762113536', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=afe806b3-6f98-4eec-9f1e-5f820a6ddfd3&month=4&teachingId=5af60a58-368f-4d40-b522-49a685f977d8');
INSERT INTO `send_tmp_msg_failed` VALUES ('23db0e70-81c2-45b1-b09e-15d4346f6265', '2018-05-01 18:26:44', 'oVbXbw2J9BYOnESANFLnTm2CLVAE', '261357714247122944', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=23db0e70-81c2-45b1-b09e-15d4346f6265&month=4&teachingId=b2ef7eeb-9a4f-4566-9486-2e47f8e38e73');
INSERT INTO `send_tmp_msg_failed` VALUES ('2e767d76-bfd1-4b26-9eba-fd162d04bed4', '2018-05-01 19:31:05', 'oVbXbw0e5GYmDckFplHH5OCH_X3c', '261422485709406208', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=2e767d76-bfd1-4b26-9eba-fd162d04bed4&month=4&teachingId=63aa4adc-bf6f-49c2-8164-f93bf08df35e');
INSERT INTO `send_tmp_msg_failed` VALUES ('5fae87e3-9765-488b-b853-096fe8764be4', '2018-05-01 19:41:53', 'oVbXbw8ecX47khmSNio5yGBIVOE4', '261433358871969792', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=5fae87e3-9765-488b-b853-096fe8764be4&month=4&teachingId=e497b4ec-2aea-4dde-8022-398563cace59');
INSERT INTO `send_tmp_msg_failed` VALUES ('4d6234b4-2f45-4eda-b5f4-8a49e8320e38', '2018-05-01 19:47:57', 'oVbXbw0SCK5rVuGeLodPLUZP4OPU', '261439473294802944', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=4d6234b4-2f45-4eda-b5f4-8a49e8320e38&month=4&teachingId=1338d07a-9243-4d1f-81d0-f7dbd35c30d4');
INSERT INTO `send_tmp_msg_failed` VALUES ('04239796-feec-4efb-81c5-ee2cb08b49b9', '2018-05-01 19:52:15', 'oVbXbw2CjACmpC3kNmUcepHU99jU', '261443799014834176', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=04239796-feec-4efb-81c5-ee2cb08b49b9&month=4&teachingId=ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67');
INSERT INTO `send_tmp_msg_failed` VALUES ('a30e5f3f-3cf5-4439-94ae-666ac78bc050', '2018-05-01 20:00:28', 'oVbXbwy5_2XuqlLWjgPzuA5t2v5c', '261452060736634880', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=a30e5f3f-3cf5-4439-94ae-666ac78bc050&month=4&teachingId=2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3');
INSERT INTO `send_tmp_msg_failed` VALUES ('73dccda3-543b-4441-8bf0-e9628f179524', '2018-05-01 20:26:04', 'oVbXbwx4K2ywmAOIJjI4JNFJoVn4', '261477827839557632', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=73dccda3-543b-4441-8bf0-e9628f179524&month=4&teachingId=a93762e3-28ab-46b2-9793-8c73229268ca');
INSERT INTO `send_tmp_msg_failed` VALUES ('2180bcc5-a7eb-4239-b8af-889d3e48cbe5', '2018-05-01 21:03:21', 'oVbXbw2nFXVjiygGB4yWRWmJwZGA', '261515371306041345', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=2180bcc5-a7eb-4239-b8af-889d3e48cbe5&month=4&teachingId=bcaa2ecb-16b5-40b9-9bea-b00557d92ed2');
INSERT INTO `send_tmp_msg_failed` VALUES ('35921486-52bc-4a00-8c36-5971ad136feb', '2018-05-01 21:24:00', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '261536157337403392', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=35921486-52bc-4a00-8c36-5971ad136feb&month=4&teachingId=487bd9a3-57b1-4583-8802-f614c2ded24e');
INSERT INTO `send_tmp_msg_failed` VALUES ('7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf', '2018-05-01 21:47:26', 'oVbXbwzXeFs1Hf08_6t7OA9xk-MQ', '261559749173149696', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf&month=4&teachingId=9a6f431b-e8b9-4491-b4e8-1ed309cd16be');
INSERT INTO `send_tmp_msg_failed` VALUES ('7dffb4c4-d660-43a5-b2dd-992f114c4798', '2018-05-01 21:47:37', 'oVbXbwymlv-4O7hNsSfcBHkaK6KU', '261559926541811712', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=7dffb4c4-d660-43a5-b2dd-992f114c4798&month=4&teachingId=b3406a31-d46f-490b-ae07-611568f28075');
INSERT INTO `send_tmp_msg_failed` VALUES ('ac23f69e-1c3e-4d13-a916-d6eb051fee20', '2018-05-01 21:49:34', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '261561884275146753', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=ac23f69e-1c3e-4d13-a916-d6eb051fee20&month=4&teachingId=5643eb54-af69-48f5-8680-37c8a9076677');
INSERT INTO `send_tmp_msg_failed` VALUES ('d4b55546-74f3-4efe-9f5e-71b7c0e74b78', '2018-05-01 21:54:14', 'oVbXbwzitXv1C-XmSZlJKH7_Gcz8', '261566594327658496', '0', '0', '{\"first\":{\"color\":\"#173177\",\"value\":\"家长您好：\"},\"keyword1\":{\"color\":\"#173177\",\"value\":\"您有新的课时需要确认！\"},\"keyword2\":{\"color\":\"#173177\",\"value\":\"201805\"},\"remark\":{\"color\":\"#FF4500\",\"value\":\"点击查看授课详情...\"}}', 'kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM', 'http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do?lessonTradeId=d4b55546-74f3-4efe-9f5e-71b7c0e74b78&month=4&teachingId=c6c96bcb-068b-4c03-af6b-9a855737bffd');

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
  `isStarMember` tinyint(1) DEFAULT '0' COMMENT '0：不是\r\n            1：是',
  `gentle` tinyint(1) DEFAULT NULL COMMENT '1：男\r\n            2：女',
  `telNum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  UNIQUE KEY `key_2` (`telNum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学员信息表 - 对应原 starStudent表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1111111111111', '111111', '1111', '4', '111', '111', null, '0', '18711019949');
INSERT INTO `student` VALUES ('22222222', '222', '222', '3', '0df8c14e-2710-46db-86e0-b9cab53c995f', '7e66a9ab-b9c3-4127-a11e-e3bbf02167d0', '1', '1', '18711234687');
INSERT INTO `student` VALUES ('9fff5f18-3b48-416f-a009-c0b27fdcc93b', '333333', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a23d7de7-60fb-4977-9071-09ad795141b5', '333333', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('979dddd5-b5a5-420c-afe8-0799a2f181c4', '揉揉', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b8e8b670-e258-41b7-b899-913dc1eeedaa', '导入', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('cbd33cfb-fa8b-448c-910b-49376984f911', '二哥', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a7e63cca-aeaa-4721-897c-3343c55c7a85', '尔の', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('8732f4d6-78c4-4bc3-92f1-a0d5d5ffe746', '34', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('20ca5d97-841f-4928-819c-173852f3d70d', '机会', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b2511e3f-2e8b-4d28-ad76-602587b0c99d', '是否', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('94dc98ce-b50f-4e97-9a00-17bcc16bcf1b', '321', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b0ed5520-5db1-4d33-ad3c-7f1f50fbe3d9', '??', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('de13ba03-5a2e-4e03-a135-4585cfbe5af8', '??', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('428631d2-f204-4fa5-838a-4072fe589d70', '??', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e41ed9a9-bd9b-4f3e-8468-efa07fd4c2e7', 'xxx', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('f9174d35-bbc7-40aa-8003-fb77a08a6288', '??', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3387b77f-ba5c-4938-95aa-333390967bdb', '', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b1823fff-7045-4d46-b604-dfbf931ebbf8', '登登登', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('c3aaf29b-1a17-43a5-9834-6d3a7bb0892c', '达克赛德', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('8e877e9f-2f15-4439-a66a-9ab9b5e0903c', '测试测试2', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('35f12b3c-d029-459c-9b7c-619f3f44f2ef', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('7c1f175e-92ad-4a83-af61-faf4571dc87d', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('d1567855-910a-44b2-950a-58fd9b3338b7', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('01bf9958-85e2-49e6-a36c-2840efd63af0', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('4426451c-de65-4564-8ddf-2bbee72841ae', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('cccbb380-7dd4-44b5-8e79-19f7b610d433', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('fbbd1e55-2923-4010-9125-e4aeb425b229', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('c9e6796e-33cb-4de8-a0ee-444f32c4c3ca', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('397f9d9d-e20a-49b4-b199-669f60db95cf', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5c7f5e36-535f-48f8-8763-0f9b6318073e', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('58300141-5fec-4bc2-8820-fcc41947142d', null, null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('625a1ecf-6699-4ae6-ba41-fe47451a796b', '邓志华', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e11b2b2c-e1c9-4e2d-b525-ac74e1fa1874', '11', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('d4bb6b04-013a-48cf-9a1e-9a611309e597', '长城', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('fe6d78ca-0290-47eb-894e-3b7be3d0044a', '等一会', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5c7608cd-b804-4f65-9959-a58b4421cb78', '啊啊啊', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e98c04c3-7e46-45c7-a835-708d35b343a8', '哦尼酱', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3246e59a-15a3-47af-a685-50d8460c547e', '做我的', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('9d104509-38cf-4482-ba5c-31f3d444c4a3', '重复厕所', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('0f390070-d868-42d9-832e-8dd8cf229124', '贺小龙', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('443742e9-e233-4044-a99d-bce47d1e8b13', 'Hhbn', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e78f0e67-17c9-462d-ae45-453daf6562d5', '何', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('c286b2bb-b6bf-4f36-8c44-0cc9c3edf5ee', '测试lgc', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('7f275b6f-2f7c-40d1-9b17-fda0f33b7d68', '测试', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('6c69c410-b8f4-4e73-bddc-e7ced436868d', '贺小龙', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('41af7d4e-fc40-4296-bdd4-8ab696fc9462', '贺小龙测试', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a4f4b3ff-bcba-44fb-ba54-a1afff045d46', '吕天麟', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('6cf37dff-d157-40e2-80fe-f0ccbb6e6124', '李旭', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('174c0610-22d9-4e7f-a40d-5a0bb9d62373', '陈能之', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5e923add-eaca-4bd3-acc2-27b1bb3c2240', '常莹莹', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('7013bf18-a528-4f9b-9e8c-fd6d0294a5aa', '颜正奇', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('aceb13f9-2ce4-4cc7-bc02-89002a4423e0', '肖熠', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('ccd49818-39cb-4ee1-b792-01688dfbef24', '夏振兴', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3f197c20-4852-4af1-a3fe-4a91cba046a0', '张桐玮', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('bfc281a0-b413-4512-a5df-a227f4e0d4b2', '贺煜', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('206036fd-d511-4eb0-b8d3-60c59bc84d15', '黄婧', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b3642b1f-4a0b-4bba-9f01-43cd3a171b7f', '吴祺', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('976c9d2a-c334-49bb-8cae-051af9eeae66', '付睿腾', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('fbe6de38-d5fe-4c08-8ac8-8f52969be9bd', '王子阳', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('be438bc5-086b-4b5b-81a4-514538974df4', '李婉婷', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('7f0861de-91ef-4f10-9a4e-f836998778db', '匡欣翔', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a7469233-0f1b-4399-b129-175f675263fa', '程佳骏', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('cb59b673-ca98-44c8-9c11-edf767c19f5f', '杨旭', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('adc3ed56-0a9b-4891-b1fc-7177706d51e9', '郑琪', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e6058b90-7154-4677-8172-185b1e30f894', '胡璟璇', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e816cc30-deb4-4c66-b310-92b91b4e7a5b', '陈宏胜', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5ef51ec4-3a84-4ea8-a92c-acf0d628f43c', '任思琦', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('410f3152-0fb1-40cd-b983-a0b4189d1a10', '李宜桢', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('279c6d0d-1a69-4155-927d-e50faf8787b6', '许高玮', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('79c93b34-1803-4808-8053-447c66039516', '邓皓', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('87561e40-93ca-436f-90a8-eef75fe735b3', '蒋宁佳', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('8fda3edb-129f-4822-a4e4-4de2b8e552ad', '钟声', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('773ea73a-5135-41f4-8000-55901b2015a2', '熊宇航', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('591d3d72-c24e-4218-9b7e-9af08ce8e493', '冯陈达宇', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('d15cad6d-218d-47aa-a5bd-513730c701c3', '石欣妍', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('ade7f1cc-18d9-4edd-891f-9c9a9275cfb6', '黄俊哲', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('1c3e0941-112b-4664-9463-6865ec8c5912', '博', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('8478bec7-44bc-4e19-b03e-445828affb23', '陈高逸', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5cc50b32-8179-458f-9663-8704d9ebddff', '杜嘉林', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('eda53a7c-3cf6-4b7e-a32d-845a622afe37', '张希翼', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('4ef1b629-8ae5-4a7b-a4b2-a841c7a6445f', '张希静', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('2f724a1e-3399-4652-89ed-cdf6af080c6f', '易智康', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('2b1ec3b4-44b8-4be8-a009-24b7cb87717d', '罗睿婕', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('993d2b0b-eea2-4fb7-9c43-6ffe8db1f21a', '测试贺小龙', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b485cc15-b6e9-4153-90a8-7899d9d8d91d', '李云美', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a323675b-0a7f-4879-ab9e-33c1520f711f', '周盟', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('fb276474-891d-4c41-b32b-96bcb5531675', '蔡林杉', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3d5fbd91-ce72-4426-a573-2ba496710a6b', '杨润芳', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('ae977c03-3f44-49f5-9c7d-842e0d135899', '文莹', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('48659507-3880-4c28-9788-55f1808ac1f2', '曹敏敏', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('bbca876c-8f6f-4b8a-bcd0-c247ae937d18', '袁佩银', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('4e708d29-d4b9-47d3-8fb9-1b98127896aa', '陈欣', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('f6fe6270-ab84-42a2-a356-0cf1fc5d83de', '谭文理', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e269d805-f0a4-46c5-b27a-66e9b58f673f', '朱李骏', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('4bafb0b0-368b-404d-9e5e-71d6fa95e2b9', '陈子逸', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3f0355d3-94e5-471f-a78f-b84736bb8afd', '张润阳', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('329ec215-a3dc-427d-ac97-95f0cc0a2519', '张珂', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('223d8a75-6e4e-4ad6-a441-af98e0a2cfad', '周晋程', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('fc2c1ff7-bdff-4c6d-bd5b-c1da7747002f', '杨伟豪', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('7cd1b3ff-571d-430b-b77e-92d1712a8418', '徐甜甜', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('05ec9947-b03e-4533-a5a6-8eaf19c03e62', '贺暄涵', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('64a9944a-3e14-4cc1-af56-3a74bab92a8b', '徐睿君', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3a894527-e23e-46b2-b6c5-f0ca8dfa2765', '游晶芳', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('1b201cf7-e147-4897-ac9d-71961be06c24', '唐嘉萱', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('4af80a67-c242-4c95-b7d5-cf6fd2463dae', '张庆', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('83802c3d-71c7-4ca1-9851-2975ee047139', '龚紫威', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('ac7ead61-9963-4e6b-a426-947a41a6712f', '晏天乐', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('60c4cb47-c262-4337-8639-f4c38e525474', '徐铭晗', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('cd6dfb39-c2da-4fb3-a979-d63f4163da67', '汤嘉仪', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('85fab9b6-cf10-4c97-8a4a-09b7a279a976', '陈曦', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('6ccefde6-6240-4ede-b185-bbd159285f1b', '王丽祺', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('352ae049-419b-4b88-9a30-dea9e528480e', '张钿林', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('f2de054e-d89b-4b06-b82c-81c01ccf689b', '罗浩源', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('92f1e207-0d5f-4b6f-a8db-22a5eadafc29', '刘京榜', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('52bf8ca5-29be-487e-8281-4ed3affe6df1', '彭媛', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('419f76c5-706e-4cb4-8419-b31addbc2f8b', '左绅艺', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('070e1e49-4c78-4781-8695-177fdf8d099e', '雷汶韬', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('4d5ae807-aad5-4b35-8f17-527cdfef6d40', '彭天佑', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b0c16d71-c5e2-41b1-9940-9b6ff0212e21', '蔡灵', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('b9376b07-9ec4-4f90-ae89-0e82c00f40d9', '陈成', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5290567a-b37e-4374-a14c-e9aca1052cf7', '李梦琦', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a59f7cd7-d935-4372-b153-4b8f5daabd03', '孙东民', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('a31e28a3-b2cc-436c-b89d-fb6dbc5cd3f1', '杨肖宇', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('32e7fcb2-e00a-49bd-89b9-f0665f08350a', '王大为', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('5e7cfa77-db7a-42a4-9c99-01d8a6d4ae8a', '肖易', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('fe696785-d70c-46d6-b8df-e778d00462f4', '朱鎔杰', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3a614d80-f7bb-46d4-89da-23080e97ea02', '钟灏喆', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('87713b29-371d-453c-a3a6-99a13d45ef0f', '朱妍茜', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('9f20b54b-df98-4ce1-9997-8b51e6266f78', '曾贶怡', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('0cf74357-767e-4a3b-8202-943436f4995c', '朱浩杰', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('67181c1a-d2df-4460-8751-035d1a1d4efd', '周祉睦', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('74dc1b1d-f2d5-48c0-a980-c6ca14a9119b', '孔令褀', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('61086778-f35a-4d8c-b1c0-434dc86fadeb', '王鑫', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('34edbf52-06cc-4eed-aef7-08b9311e6601', '李子玉', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('79807fad-b099-460e-ada4-7e7831c3c85d', '杨颖', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('2aaccef3-b986-4e63-988c-ad059935854d', '任俊豪', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('705dc6e9-2639-4126-b0b1-1826d29eb1b9', '王艺', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('f1ceae5a-ed4e-46f9-9a36-43ae7d45af3a', '刘锦佳', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('1886a744-3e9e-4bce-b586-ac1c0027dd70', '龚震', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('6a586044-60fb-4cc2-abc3-26204a937329', '等一会', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('39e42887-ba2b-4149-b2d6-1f7c024f82b0', 'bdb', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('945ebac7-dab8-4c51-8dc3-6964ee5a686c', 'hbdb', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('3af1cfb3-a826-4aa2-b4a3-79b825762d37', 'jdjd', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('949f2f2c-9da1-4e08-adc8-f2acc9fccdda', 'hbb', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('ddf9dc97-7ee9-4e33-a85c-d401cb01b210', 'hhggvivo', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('2ee34d03-500b-4030-9619-c7e11d099e90', 'hbb', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('39bcba7c-99db-4d78-94ff-74c26585978c', '陈丹', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('795e04b3-6af9-4e75-b9e9-0f1e2be57109', '彭秋雨', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('0b54ce6d-bd5a-404d-9d14-caf89f84dd46', '邹佳仪', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('f0ae0032-edfc-4c81-8174-8381a3633050', '刘靖怡', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('e2e19fd3-41b1-47b5-b87e-041e01afc926', '王慕一', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('c252c682-0615-4343-a69a-f329c2d41ee2', '蔡经安', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('958e0b84-1956-4e2b-ac9b-9f9a6d0a9191', '陈志昊', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('bcf5c17a-4e4e-402c-b469-93b8d419678f', '邹涵', null, null, null, null, '0', null, null);
INSERT INTO `student` VALUES ('babdb37b-1824-4eab-93a9-ed0342e9eda8', '陈彦铭', null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for suggestions
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
INSERT INTO `suggestions` VALUES ('4744218b-8c27-4140-af9c-1c6c212d113e', '[{attention=比较专注1}]', '[{skill=学习技巧1}]');
INSERT INTO `suggestions` VALUES ('ad6f18ce-3575-4954-b42a-71777e9b099f', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('22222222', '初三数学提分25分', '三个月里，老师耐心...');
INSERT INTO `suggestions` VALUES ('7b165343-f535-4440-9e0a-d0a739290e61', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('8e2002ec-e6c5-47e1-b648-19972086007d', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('083e4c44-ce4a-4559-9b19-17d71c5e9cf0', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('3bd9d081-9fcd-4baf-9ee9-ed8a4f44c4c7', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('6c331c97-4260-487c-887f-5bd0e370afdb', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('2983b44d-d847-47db-95ac-e873884f88d5', '[{}]', '[{}]');
INSERT INTO `suggestions` VALUES ('287b2c81-98d2-4bcc-944a-3ba65b6f0d3f', '[]', '[]');
INSERT INTO `suggestions` VALUES ('1e129363-5491-40e7-9048-b2246fcd6cf7', '[]', '[]');
INSERT INTO `suggestions` VALUES ('40990591-b391-4b83-9fae-f44d2265f307', '[]', '[]');
INSERT INTO `suggestions` VALUES ('6891e932-ed38-402f-b706-6a1ae007bb7f', '[]', '[]');
INSERT INTO `suggestions` VALUES ('94f21d93-a209-4995-9896-e552bc29c744', '[]', '[]');
INSERT INTO `suggestions` VALUES ('58b4e5a5-dccb-4ce6-8cc3-dbaa05977bf2', '[]', '[]');
INSERT INTO `suggestions` VALUES ('46c08768-4de1-45e8-821f-95eb9540af66', '[为]', '[问问]');
INSERT INTO `suggestions` VALUES ('9c3113c4-4749-4eb7-875e-f175ce4111fb', '[手动阀]', '[微服务]');
INSERT INTO `suggestions` VALUES ('ef9171f3-1e00-471f-9ae4-d378addbb0db', '[手动阀]', '[微服务]');
INSERT INTO `suggestions` VALUES ('0fcdbf13-c32b-4810-97f7-a1f975201eb7', '[负数]', '[负数]');
INSERT INTO `suggestions` VALUES ('d8dd73ca-2e3f-4811-8b1f-365f6b0da401', '[同意]', '[和解]');
INSERT INTO `suggestions` VALUES ('7ac51dca-8fd2-4355-9d62-ee781e64035a', '[是滴]', '[水电费]');
INSERT INTO `suggestions` VALUES ('f68871e2-d4c9-4c27-a9d9-c4203097680e', '[sfsd]', '[sfaw]');
INSERT INTO `suggestions` VALUES ('0af53cc4-0c50-4172-ae08-1b64345dd54f', '[dsfa]', '[wea]');
INSERT INTO `suggestions` VALUES ('17e48d7f-de6a-43c5-b850-71b409410f6b', '[是否]', '[非]');
INSERT INTO `suggestions` VALUES ('c4c6244d-215c-4a51-a597-29d5180aa53a', '[圣诞节, 快乐]', '[圣诞节, 快乐]');
INSERT INTO `suggestions` VALUES ('2270db7e-1742-466a-81ac-574779562911', '[]', '[]');
INSERT INTO `suggestions` VALUES ('a2b034ea-569e-4070-996b-6fcc5018dd2e', '[1, null, 15, null, 13]', '[null, 1, null, 15, null, 23]');
INSERT INTO `suggestions` VALUES ('a97d1fb2-9d08-4f22-97ad-dfe3bd2f394b', '[1, null, null, 1, 1, a]', '[a, 1, null, 1, null, as]');
INSERT INTO `suggestions` VALUES ('49b0a605-e371-4a89-ba30-2a94bb40e3bd', '[`23, null, null, null, 213]', '[null, null, 321, 321]');
INSERT INTO `suggestions` VALUES ('43ab705c-5497-4c77-a830-a3b52f6bb7b7', '[2, , , , , ]', '[, 2, , , , ]');
INSERT INTO `suggestions` VALUES ('5a76d262-3002-4e4e-9cc8-de4fe6aec149', '[12, , , 213, , sdfd]', '[, , 2, , 213, ]');
INSERT INTO `suggestions` VALUES ('832f044b-ab35-4f81-af92-e5c5af7e45b2', '[null]', '[nul]');
INSERT INTO `suggestions` VALUES ('8c29006b-ab3e-480f-ac23-e8731b7f37b3', '[测试, , , , , ]', '[测试2, , , , , ]');
INSERT INTO `suggestions` VALUES ('8297646a-64e4-4d0f-9de8-95c03de15b02', '[测试, , , , , ]', '[测试2, , , , , ]');
INSERT INTO `suggestions` VALUES ('d08e499f-fe61-46a6-ace1-a1ff243a821e', '[wan, , , , , ]', '[wan, , , , , ]');
INSERT INTO `suggestions` VALUES ('6a46aadd-3a3c-45c2-85c2-824f9a563e59', '[1, , , , 1, 1]', '[, , 1, , , 1]');
INSERT INTO `suggestions` VALUES ('4a6424f9-f0f8-471c-a042-71bf7dc34596', '[ceshi下, , , , , ]', '[测试下, , , , , ]');
INSERT INTO `suggestions` VALUES ('152b5887-3a00-4224-91f0-d4ca9439a71d', '[测试, , , , , ]', '[, 测试, , , , ]');
INSERT INTO `suggestions` VALUES ('e889730b-36d2-46ad-99a4-af3af2f34c34', '[测试, , , , , ]', '[测试, , , , , ]');
INSERT INTO `suggestions` VALUES ('dce5897b-93d8-4bf5-bf98-4a9e551e7d10', '[测试, , , , , ]', '[测试, , , , , ]');
INSERT INTO `suggestions` VALUES ('c88b5eb6-3f26-4d42-bf0d-024deb33b440', '[上课, , , , , ]', '[上课, , , , , ]');
INSERT INTO `suggestions` VALUES ('f3989608-ea0e-4308-8587-cf6d932ef93e', '[上课, , , , , ]', '[上课, , , , , ]');
INSERT INTO `suggestions` VALUES ('8d796273-3c22-497b-9d75-9561c5aafd8a', '[上课, , , , , ]', '[上课, , , , , ]');
INSERT INTO `suggestions` VALUES ('8ede2123-152f-45e0-a5e1-fd9fcb7cab3d', '[科目, , , , , ]', '[科目, , , , , ]');
INSERT INTO `suggestions` VALUES ('409362ee-8987-4016-b24a-73a191ea4d63', '[手动阀, , , , , ]', '[招待费, , , , , ]');
INSERT INTO `suggestions` VALUES ('b9a6809e-fdf6-4d10-9b96-8964e6b493f4', '[分工, , , , , ]', '[手动阀, , , , , ]');
INSERT INTO `suggestions` VALUES ('ac9b3943-237c-4427-b80d-df0433a55710', '[色发的, , , , , ]', '[手动阀, , , , , ]');
INSERT INTO `suggestions` VALUES ('79dda7d4-ce94-477d-bf5a-05a28f3e78fe', '[ceshi , , , , , ]', '[ceshi , , , , , ]');
INSERT INTO `suggestions` VALUES ('d9dfb07f-1e50-4e1c-9d33-612de43bf410', '[sja, , , , , ]', '[san, , , , , ]');
INSERT INTO `suggestions` VALUES ('82060bc4-b318-4cc5-a904-6c224b8757cd', '[sdassdas, , , , , ]', '[sdafdf, , , , , ]');
INSERT INTO `suggestions` VALUES ('dfa6408e-73eb-4dcd-8f63-70ca5fde19f6', '[未发完违反, , , , , ]', '[违反, , , , , ]');
INSERT INTO `suggestions` VALUES ('6b40c680-ef0f-47b8-a7e3-09d1d7d6c404', '[大师傅, , , , , ]', '[手动阀, , , , , ]');
INSERT INTO `suggestions` VALUES ('6a6cfbdf-c46d-4a93-bf80-0440945f9637', '[士大夫, , , , , ]', '[山东法尔, , , , , ]');
INSERT INTO `suggestions` VALUES ('74dfe65c-c233-479b-a548-3b41635ff80e', '[weaf, , , , , ]', '[wefa, , , , , ]');
INSERT INTO `suggestions` VALUES ('cda16d97-74f1-4741-baf7-aa5db7dd3cc0', '[sadf, , , , , ]', '[aef, , , , , ]');
INSERT INTO `suggestions` VALUES ('a3082791-9c20-4a01-98f9-f88f75a845e3', '[asdf, , , , , ]', '[waefw, , , , , ]');
INSERT INTO `suggestions` VALUES ('66751d98-ca85-4c52-8b7e-cf2ed6070c97', '[sfda, , , , , ]', '[, we, , , , ]');
INSERT INTO `suggestions` VALUES ('7e282377-a6a6-4b32-83dc-aa2ebdaefbfe', '[还不错, 还不错, 还不错, 还不错, 还不错, 还不错]', '[还不错, 还不错, 还不错, 还不错, 还不错, 还不错]');
INSERT INTO `suggestions` VALUES ('c3aaa013-07e2-4ca8-9ec6-102314286c66', '[112, , , , , ]', '[, , , , , 121]');
INSERT INTO `suggestions` VALUES ('b0f678b7-12d6-4bf9-8829-e28d748d4496', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('6576b7d3-f180-4723-bac8-dcb6e8633cc3', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('1025a3f6-8edf-4998-a76a-59685de58a12', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('e93fbe80-04a4-47ef-848b-ac2cccf22f96', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('936f09b3-3db4-4db4-98e3-40df34850d7a', '[的说法s, , , 试试, , ]', '[, , , , 染发膏, ]');
INSERT INTO `suggestions` VALUES ('403add12-0ad4-4422-89c6-ad3ed33552f5', '[, 手动阀, , , , ]', '[, , 手动阀, , , ]');
INSERT INTO `suggestions` VALUES ('edf1e26d-dcab-4cef-88a6-a05c29759429', '[算法, , , , , ]', '[, , 安慰法, , , ]');
INSERT INTO `suggestions` VALUES ('2c20aa19-bbf8-4ed2-b0fc-43110dc3b971', '[, waf, , , , ]', '[, , , wef , , ]');
INSERT INTO `suggestions` VALUES ('3e8fdbf8-e15d-49e1-b411-867c0b13d08c', '[, , , se, , ]', '[, , , we, , ]');
INSERT INTO `suggestions` VALUES ('16f537bb-2f6c-4ef7-8355-e061c86c7a25', '[, 收发文, , , , ]', '[, , 违法, , , ]');
INSERT INTO `suggestions` VALUES ('ae779e32-4ea9-43da-8ef7-9d05a2995bd8', '[, , , 违法, , ]', '[, wean, , , , ]');
INSERT INTO `suggestions` VALUES ('0edef0da-d2b2-4041-8ae3-1551ffe4a0a0', '[, wean, , , , ]', '[, , , , 微分法, ]');
INSERT INTO `suggestions` VALUES ('797426a4-6322-4a8f-99f0-196d0d1f4421', '[, , 大, , , ]', '[, , 为, , , ]');
INSERT INTO `suggestions` VALUES ('2b6b4656-e866-4710-8be9-ba13049d572c', '[, wefa, , , , ]', '[, , , wef , , ]');
INSERT INTO `suggestions` VALUES ('e135d0f9-261c-4809-87cd-99449d06c51c', '[无, 优, 一般, 一般, 优, 良]', '[无, 继续保持，继续巩固基础, 建议超前学习，预习上课内容, 讲题时提到的知识点，讲完需要巩固, 无, 希望学生做题更加细心]');
INSERT INTO `suggestions` VALUES ('a7a611b6-feb8-400d-b013-48efab30d3d2', '[111111, 1111111111111111111, 111111111111111, 1111111111111, , 11111111111111]', '[1111111111111, , 11111111, 1111111111, 111111111111111, ]');
INSERT INTO `suggestions` VALUES ('c66d5aec-5a9d-445c-893b-5deee871ce86', '[保持专注，但思维不活跃, 较大幅度提升, 大大提高, 复习速度提高, 大大提高，能针对题型有方法, 稍稍提高]', '[边听边写边记，有疑问及时提出, 能迅速复习，讲究次数, 做题有疑问时做好记号，上课时提出, 就中考而言，复习速度还不够，需要更努力, 在自己做题时能融合老师教的方法并根据自己的情况有所改动, 丢掉慢条斯理，不容易确定的地方不要犹豫]');
INSERT INTO `suggestions` VALUES ('decde197-8876-43c1-b27b-4114ccb01330', '[专注度一直很不错的, 知识点会很容易忘记, 有些欠缺, 有时会复习, 学校老师教的技巧掌握的好不错, 速度和准确性波动较大]', '[继续保持, 还是要多看错题，多重复知识点，会有很大的帮助的, 超前学习，个人认为用处不大，还是要搞懂学过的知识, 可多督促孩子看看错题，在写完作业之后，花十几二十分钟时间来看看错题，哪怕不写，看一遍 加深印象, 可以对对学习某些特定题目的解题技巧，这样写题的速度和准确性就会大大提高, 还是要稳中求胜，容易粗心，简单的只是一不小心就会出错。看题的时候要慢慢看，不要串行，导致题目出错。]');
INSERT INTO `suggestions` VALUES ('96417002-12ad-42dd-9bc3-2de1dd93c5f8', '[可能是因为太累了，加上睡眠不足，专注力不是很好。, 对第一章内容掌握的不错，第二章较之以前也已经有了不小的进步。, 因讲述的是上学期内容，学生又在学习新知识，所以学生没有时间去预习和复习上学期内容, 因讲述的是上学期内容，学生又在学习新知识，所以学生没有时间去预习和复习上学期内容, 考试技巧掌握的不错。, 做题速度属于平均，不快不慢，准确率也还行。]', '[多多休息，按时睡觉，也可以多参加一些体育活动，劳逸结合。, 加强对第二章内容的复习巩固，对多种做题方法的运用。, 会在以后的课堂中穿插一些复习过的知识, 会在以后的课堂中穿插一些复习过的知识, 会在以后的习题中讲述考试技巧，在考试中如何更简单的拿到分数。, 在复习完相关知识点后，进行做题方法的总结，在保证准确率的前提下，有效的提升做题速度。]');
INSERT INTO `suggestions` VALUES ('9028c9ed-55f5-4f01-aab8-9925da5320bc', '[听课较专注，但不能认真对待辅导结束前的几分钟，比较急于下课。, 数学必修一二知识点已初步掌握，但不能灵活运用，欠缺习题训练。, 学生较缺乏超前学习意识，不能很好地做到主动预习。, 学生能够主动复习已讲过的知识点, 已掌握一些做题技巧，但不够灵活和全面。, 做题速度中等，准确率很高]', '[学生应注意午休，以防下午学习时困乏；要调整心态，积极面对学习；要珍惜整个辅导时间。老师会尽量将重要知识放在前段时间讲。, 建议学生有时间多做相关习题，不会的或者有疑惑的题目可以做标记积累下来，以便辅导时解决。老师会注意讲做题思路和方法，以引导学生学会知识点的运用。, 学生如果平时功课不多，可以主动提前预习。, 希望学生注意每单元后面的知识结构图，在复习时试着绘制知识结构图。, 老师会提前准备典型例题及对应的做题技巧；辅导过程中也会通过做题分析题目来教授做题技巧。, 学生做题速度不高是因为做题技巧及习惯不到位，建议学生做题时多动笔，试着展开方程或画出图像，当它们一目了然呈现出来的时候，可能就会有思路了。]');
INSERT INTO `suggestions` VALUES ('cb738951-e544-4c54-bee9-903f17f835b0', '[听课状态良好, 良好, , , 良好, 速度还算快，但是计算还需仔细]', '[, 上次课主要讲的是应用题，应用题的方法就是审题，第一次读题时把关键语句做记号并注意隐含条件，这样可以准确快速的列方程，最后就是要仔细计算了。, , , 建议计算时还是要更仔细，打草稿的时候把字写清楚可能会有帮助，更重要的是写题时的书写，最好能写工整清楚，给改卷老师留个好印象, ]');
INSERT INTO `suggestions` VALUES ('b7e77aad-fd87-434e-bab0-efb3fc9b56d1', '[上课一直非常认真努力，态度端正，但畏难情绪较为严重，遇到思维量或计算量较大的题就不敢下笔，大题拿到的分就少了。, 基础概念问题较为模糊，物理学习通过结合课本掌握知识点和考点，扫除了知识盲区。, , , 通过经典题型的练习（例如二次函数系数abc的不等关系等题型），学生已基本掌握了所教授的提醒。, 准确率有所提升，但运算速度较慢，耽搁了考试时间。]', '[通过基础题型的练习提升学生信心，帮助学生树立起难题多拿分的观念。同时希望家长能多鼓励孩子。, 多结合课本，不能仅凭刷题得到考点，这样的知识结构是零散的。, 小声很聪明，在老师的思路下能顺利完成题目，但还缺乏学科题感，不能很快找到题目的突破口。在之后的学习中要学会回头看题目，对于题目的提问方式和出题者的意图进行思考。, 保留好近期考试的测验试卷，以便于分析问题，查漏补缺，时常复习。, 继续保持，在作业、测验中运用，牢固记忆。, 有的题将步骤仔细写下来可以提升正确率，但简单的四则运算等应当多口算，每一步都写在草稿纸上很浪费时间。]');
INSERT INTO `suggestions` VALUES ('e4207004-b076-4e52-9047-65fc0e553e1e', '[上课很专注, 单词，固定搭配较为薄弱, 良好, 良好, 良好, 良好]', '[继续保持, 多背单词和词组, 保持, 复习上面继续加强, 有待提升, 有待提升]');
INSERT INTO `suggestions` VALUES ('4c939366-dde1-4363-91a7-21bc1501cf05', '[很认真, 单词，词组较为薄弱, 良好, 良好, 良好, 良好]', '[继续保持, 加大单词，词组记忆, 保持就行, 复习这一块要加强, 有待提高, 有待提高]');
INSERT INTO `suggestions` VALUES ('5a404b4c-3c80-44c1-842b-9b4c75190d36', '[上课不是很认真听讲、有时候粗心大意, 基本概念不扎实, 无, 一般, 一般, 较差]', '[注重平时良好习惯的养成、认真细心, 脚踏实地、打牢基础, 建议加强学习, 建议多花时间在老师布置的作业上, 建议加强应试技巧, 建议强化训练]');
INSERT INTO `suggestions` VALUES ('9aa61240-bfad-4a42-b152-d54dce3c7a0c', '[进步, 进步, 持平, 持平, 进步, 进步]', '[继续保持, 继续积累, 多加努力, 多加努力, 多多巩固, 多加练习]');
INSERT INTO `suggestions` VALUES ('73e3003f-1f76-4713-913a-d99ae762f76e', '[听课认真，参与积极, 基础掌握较好、思维灵活, 基本可以, 课后总结巩固严重欠缺, 做题方式不恰当、不仔细, 速度偏快、准确率低]', '[兴趣度高，希望保持, 知识掌握情况很好, 不太建议太过超前学习，做好课前预习即可, 课后务必及时总结复习所讲内容, 今后上课将着重培养其做题习惯, 做题不能只图快，而不认真思考]');
INSERT INTO `suggestions` VALUES ('301f1e25-81ca-4c8f-ad57-420870770bf2', '[有较大提高，但积极性不够, 更加全面，正逐步提高, 这点尚有不足，未有主动预习。但考虑到学生基础较差，目前学习任务重，可以理解。, 学生能自己做题对照答案, 由于基础较差，做题较少，技巧掌握不足, 目前由于基础较差，准确率较低]', '[正确认识辅导，由于必修一掌握不够，而目前学生学习任务较重，如果能抽出时间来看必修一最好，如果时间不够就应该将主要精力放在本学期的课程上面，切莫因小失大。必修一的内容在高三总复习时都会重新复习一遍，不要担心。所以应摆正态度，本学期的内容才是最重要的。, 坚持辅导，平时抽时间多看书，回到课本。掌握基本知识点。考试换汤不换药，只要能抓住基本知识，没有太大问题。, 多看课本，掌握基本知识点, 希望课后多做题，并能对照答案，又不懂的地方多向老师请教, 多做题，通过实战检验自己，达到基本掌握答题技巧的目的, 课后多复习，牢记知识点]');
INSERT INTO `suggestions` VALUES ('59858dc7-b38b-4632-b307-810c7b021217', '[比较专注，但有的时候不是很耐心, 大的知识点掌握的还不错，但有些小的知识点忘记了，或者记得不够清晰, 没有主动预习的习惯, 对于那些很早之前学习的知识点有遗忘的现象, 有些类型的简便计算没有掌握，但还是能够先易后难的, 速度不够快，小题的准确率还有待提高]', '[, 需要多练习那些容易忽略的知识点, 要养成提前预习的情况, 要尽可能的把之前遗忘的知识点记起来, 要学习简单方法，提高做题效率, 要加强小题的训练强度]');
INSERT INTO `suggestions` VALUES ('15d44df5-4a02-43d1-8704-ccca3e2c6e94', '[正奇同学上课表现一直都挺不错的。但是最近可能是身体不舒服，能感觉得到他很累，学习的效率就有所下降。让他弄的积累本也没积累，可能是作业多的原因吧，但是大家都在努力，我们如果和他们做相同的事，就很难拉开距离。, 优秀, 良好, 优秀, 优秀, 速度有些慢，准确率还有待提高。]', '[还是要积极主动点学习，做题速度加快些。觉得回家的他可能就放松了，对学习的效率也没那么在意。或许我们可以改个时间，换个地方补课，也许就换了个心情。而且晚上上课，能感觉得到他很疲惫。但还是要坚持练字和积累本，慢慢会有提升的。还有就是心理因素，不要总认为自己做不到，其实很多时候一努力就能做到的。, 继续保持, 要好好积累，然后总结。, 练字噢！, 保持保持, 限时训练，用规定时间的一部分强制自己加快速度。]');
INSERT INTO `suggestions` VALUES ('ea726a02-bf22-404d-b138-792bf6d7785a', '[好好学习, 好好学习, 好好学习, 好好学习, 好好学习, 好好学习]', '[天天向上, 天天向上, 天天向上, 天天向上, 天天向上, 天天向上]');
INSERT INTO `suggestions` VALUES ('ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b', '[听课较为认真，不过有时会有些许急躁。, 对于知识点掌握在辅导后会加深。, 会主动预习功课，认真在课本上做笔记。, 略微有些欠缺，往往会忘记以前学的知识点，但就其特殊情况，可以理解。, 对于书上以及练习册上的题目大部分能够靠自己解决。,  做题速度有所进步，但做题时略有粗心使得准确率不是很高。]', '[对于每个知识点都耐心、认真的给其讲解透彻。, 每节课先对其上课不懂得知识点进行疏导。, 继续照这样做即可。, 在讲课时尽量将以前的知识点串联在一起，使其达到掌握新知识点的同时复习巩固旧知识点。, 可以逐步提供高，慢慢开始做一些具有技巧性的题目。, 在做题时随时提醒学生认真仔细，做到每一步都踏踏实实，完完整整。]');
INSERT INTO `suggestions` VALUES ('25ff3289-06f3-4c30-93bb-d82595ad3332', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('5e892622-ac6d-4231-9c39-dba28fbe9e81', '[上学期在上课时经常会犯困，这学期状态好了很多。, 有进步, 没有主动预习的习惯, 没有主动复习的习惯, 能记住更多的常见必考题型, 准确率和速度都比较高]', '[希望可以培养更多的对数学的兴趣, 要及时复习, 希望养成预习的习惯, 要及时复习, 能够区分题目的小差别，不粗心, 希望可以做更多的题目来拓展自己的做题能力]');
INSERT INTO `suggestions` VALUES ('4d6d538c-babc-4e26-896f-a5fe2d980679', '[能迅速进入状态，题外话少了一点, 讲的基本公式，概念已经掌握，, 基本能够完成作业，超前学习暂时还没有, 这个有点欠缺, 做题缺乏耐心, 速度超快，准确率有点低]', '[最好在听课过程中做一些笔记, 多看书，, 目前来说高质量完成我布置的作业就可以, 每次讲完卷子，错题还是要整理, 先易后难，平心静气做题, 降低速度，认真读题]');
INSERT INTO `suggestions` VALUES ('9d3733cc-1d83-4ec5-91df-3efae2a2112b', '[优, 优, , 优, , 优]', '[目前来说孩子对于自己学习的积极性以及对于基础概念的理解不到位, 故而做题速度偏慢（容易模棱两可）, 但是做题准确率提高较快, 值得肯定, 接下来的任务在于纠正习惯以及加快做题速度，掌握做题技巧, ]');
INSERT INTO `suggestions` VALUES ('22882638-4b62-4a67-b8f5-958516571e99', '[, dfa, , , , ]', '[, , , weawew, , ]');
INSERT INTO `suggestions` VALUES ('05ae2e67-7c7f-4033-ab9d-587ea186572e', '[, , wefa, , , ]', '[, , , wefa, , ]');
INSERT INTO `suggestions` VALUES ('c214f073-7d76-4aa1-af37-296f52cf5a42', '[, , dfa, , , ]', '[, , , , awefw, ]');
INSERT INTO `suggestions` VALUES ('8e121a0c-efc2-405e-bff2-36b91309a11c', '[宜祯妹妹上课的时候比较认真，但还是有一点小小的走神。有时候会跟我岔开话题，聊一点她学习生活中的事情。, 知识掌握的不是太牢固，很多词汇只知其一，不知其二。不能熟练掌握词汇的正确使用。, 目前我们还没有开始预习，一直在复习, 我每周都会给妹妹进行大量的复习，希望能帮助她把基础打好。, 妹妹上次月考中，没有发挥的太好，我看了一下卷面，发现很多不该失的分失了。比如：你怎么了？翻译为 what\'s the matter? 但是她不小心落了个the,写成了 what\'s matter?, 根据妹妹的反馈，她说考试时间不够用。这说明她还要提高一下做题的速度。]', '[我觉得妹妹这样也很可爱，因为她愿意与我分享，我也很乐意和她分享一些自己在她这个年龄中的体会，然后作为一名过来人，给她提一点小小的建议。但是，这些都只能占用两到三分钟的时间，我不会让她耽搁学习的正事。提高妹妹的注意力，我觉得可以通过增添 课堂趣味性来体现，比如我们利用课本中的英语对话进行角色扮演，增添一些造句环节，使她的思维一直活跃等等。, 通过夯实基础，多多的带她认识课本中的词汇运用。一起解决练习中遇到的问题和困难。, 从下周开始，我会适当的帮她预习课本，使她在学子中先人一步，能够在学校里的课堂上减轻压力。, 继续坚持复习的节奏，学习就是应该温故而知新。, 帮助妹妹培养认真的习惯，细节决定成败。, 做题速度要从平常中训练出来，词汇掌握的多了，阅读量增多，做题速度也会跟上来。]');
INSERT INTO `suggestions` VALUES ('3b816221-7664-4d11-8c12-8ef512514749', '[比较好, 一般, 无, 一般, 较差, 太慢了]', '[多加沟通以及督促, 加强记忆, 预先布置任务，让他按时完成, 要求复习所讲题目，提问, 多讲解一些经典题目，逐步培养, 加强基础知识的记忆]');
INSERT INTO `suggestions` VALUES ('c91a1407-50d8-46ff-b469-4e3bdb2585e6', '[吴祺同学上课一直都表现非常好，学习很专注, 在基础知识上有所提高, 表现比较好，能够超额完成作业, 复习巩固方面有待提高，有时候讲过的知识点没有的很好的落实, 考试技巧方面有一定提高，做了5份高考题，对题目的难度也有了很好的把握, 在辅导过程中一次模拟测试成绩为91.5]', '[希望在听课的时候能够学会认真记笔记, 希望在继续扩大词汇量，加强落实, 希望继续保持学习劲头, 希望学生注意落实与整理, 希望对于基础题加强联系，争取做到每天都能完成一到基础题, 希望作文方面的字迹一定要工整]');
INSERT INTO `suggestions` VALUES ('604fe578-0c4f-459a-a5c6-44549a4f0d92', '[相比之前更加积极，更加专注，但仍需坚持, 鉴于之前基础非常薄弱，现在已经掌握了很多基础知识，对课本更加熟悉, 学生几乎不会预习将学知识，不够积极, 在提醒之下学生会稍微复习，但是花的时间还是很少, 学生已掌握初步解题技巧，有一定的思维, 放慢了做题速度，有了更多得到思考，准确率有了提升]', '[加强管理，让学生逐渐脱离手机, 循序渐进，需要帮学生牢牢地打好基础，灵活运用知识, 强调预习重要性，并在课后提醒学生主动预习, 需要共同监督，时刻提醒学生复习重要性，课前会抽查学生所学内容, 需要打牢基础，在此之上再灌输解题技巧，帮助学生学会系统地用方法解题, 首先要保证正确率，不强调速度，但是要仔细，确保拿到分数]');
INSERT INTO `suggestions` VALUES ('5375d8bc-7691-4e61-8f78-aabd772a38b0', '[较为认真, 掌握情况一般, 自己要学会总结书本知识, 平时多做基础题, 一般, 一般]', '[应该集中精力，把状态调好, 自己多练习, 可以适当完成老师布置的任务, 假期可以复习前面已经学过的知识, 考试中要总结做题的经验, 做题时要有详细的解题过程]');
INSERT INTO `suggestions` VALUES ('aeff2060-f179-40d3-ba5e-f858c1d8cc46', '[, , asdfa, , , ]', '[, , , , wefa, ]');
INSERT INTO `suggestions` VALUES ('e55873ed-aa42-4d03-94f9-fc0a1537c3ff', '[有一定进步, 尚需提高, 有一定进步, 尚需提高, 尚需提高, 尚需提高]', '[引导孩子在学习的时候能够放下手机，全身心投入进去---“学的用心，玩的开心”, 通过物理课本帮助孩子深化物理知识理解，构建一个更牢靠的知识网络, 每次授课前还要微信提醒孩子明天上课内容，提醒孩子稍微预习一下, 后期准备每次上课预留10分钟左右时间，教孩子总结归纳每次上课的主要内容, 对孩子每周错题坚持讲解，将课本知识与日常练习题联系起来, 帮助孩子克服“轻题”的习惯]');
INSERT INTO `suggestions` VALUES ('fd3d86b2-959e-48ca-91a6-28e585bc2b17', '[还是和上学期一样，后面快结束的时候好像没有那么专注, 只上了不到一个单元，学生可能课堂学习效率不是很高, 小豪好像没有这个习惯, 小豪好像大多时候都是被作业牵着走，我也不知道这是初中生的学习习惯还是他自己的。, 这个小豪好像还没有意识，可能是刚上初中，还不想我们这么老油条, 读题慢，而且粗心。经常出现我讲的时候说懂了，还嫌我啰嗦，但是做题的时候就不确定知识点]', '[休息好一点, 家长们可以引导一下学生在课堂上认真一点，这样知识吸收的好一点, 可以看看他喜不喜欢预习，不喜欢的话就算了，他作业也挺多的好像, 有时候我会安排一些课后题给他做，他好像没有那么多时间完成，不知道是不是学习压力也不轻, 前两次带着他做题，提点他几次，他也能知道。接下来我会多带他做题，然后告诉他更多的技巧, 这个只能慢慢来了。要先把知识点吃透。希望他多一点耐心，不要嫌我啰嗦。]');
INSERT INTO `suggestions` VALUES ('05fdafbf-8e31-44b4-9fc5-b8de289f8b46', '[比较专注，但是在最后的二十分钟内往往会不够专注, 一次函数这一块掌握的不是很好, 没有主动预习的习惯。, 复习的这一块做的不是很好，不少之前学过的知识点都忘记了。, 考试的时候没有做到先易后难，容易被难题卡住。, 速度不够快，准确率也不是很高，需要再接再厉。]', '[希望能打气十二分精神来专注的听讲。, 要加强一次函数，以及基本计算的练习。, 要学会主动的预习。, 要做到及时复习，即使是学过的知识点也不能忘记。, 我会多传授一些解题技巧，希望能做好试卷。, 多做题，加快速度，并且熟练掌握知识点。]');
INSERT INTO `suggestions` VALUES ('b76c804a-d0f0-478d-87dd-27c4e2d831d3', '[这点表现较好，听课很仔细, 对于数学方面基础较差，主要体现在二次函数方面和一些计算方面要注意的点，例如去括号，移位变正负，乘除换算方面都待加强。, 有待加强。, 由于基础较弱，所以以后锻炼加强这方面的能力。, 有待加强。, 准确率较低，需要注意运算中的一些细节。]', '[继续保持。, 能够跟着我的步伐走，按时完成老师布置的任务。, , , 卷面工整方面要改善。, 特别注意正负号和去括号。]');
INSERT INTO `suggestions` VALUES ('776c734a-bce0-48d6-96e5-8184061971a0', '[较认真, 一般, 一般, 较好, 较好, 一般]', '[听课时可以培养一下总结题型能力, 接触新知识做题时可以适当地把知识点往题目所求方向靠, 预习时掌握大概方向即可 重点放在课后巩固, 多做题 善于总结 可以有一个错题本, 主要熟悉知识点 多见题型, 这个一定要提高做题速度和读题准确度]');
INSERT INTO `suggestions` VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '[, , , kl, , ]', '[, , , , l;, ]');
INSERT INTO `suggestions` VALUES ('fa4a9cad-7de1-49da-9fae-526fab064a66', '[有进步，但仍需努力, 基本掌握，但遗忘快，要及时复习巩固, 无, 无, 基本掌握，讲解都懂，自主解题能力要继续锻炼, 中]', '[建议:保证休息，提高学习兴趣 \n规划:上课收手机，趣味讲解，亦师亦友，提高学生上课专注的, 建议:课后多复习，回顾讲过的题型的做题步骤，多看多用\n规划:课前带领学生复习，课后再次复习，利用课上时间多带学生复习巩固。不上课时间对学生多督促。重点传授做题方法，使学生成绩有可见提升, 建议:在学校跟上老师的节奏，辅导前学生基本掌握知识点, 规划:课上多巩固，课后多督促, 建议:上课认真听讲，方法会用，多用多练\n规划:讲解搭配学生自主做题思考，多培养学生自主做题能力, 建议:掌握方法，多用多练，提高准确率\n规划:带学生培养做题方法步骤意识，规范做题步骤。并培养日常进行反思总结的习惯，提高准确率]');
INSERT INTO `suggestions` VALUES ('b091936b-3866-4e98-8ac6-9d72df59a56f', '[学生本阶段的学习没有上阶段的积极性高，对学习方面也有些松懈，而且上厕所的时间也有点长。但听课时也有用心，只是坚持全神贯注地听课的持续时间太短，容易分心，需要加以引导把心思放到学习上来。, 这四次课分别教授的内容是:巩固分式的运算、因式分解；学习的新内容为四边形及平行四边形的证明、正比例函数和一次函数。学生基本掌握，但对知识点的熟练程度不够，需要学生课下自己多做题，加深理解。, 现阶段的学习为复习前面内容，扎实基础。, 学生有一定惰性，未能达到良好的巩固效果。, 学生接受新知识的能力不是很强，所以每个知识点都需要反复强调，考点需要做题时融会贯通。, 学生的做题速度慢，准确率不高，但题目做对时还是可以感受到学生的成就感。]', '[建议家长在上课时间段暂时保管学生手机，否则学生将以上厕所为由在卫生间玩手机，这将浪费大量时间，导致实际上课时间缩短，降低课堂效率，学生也无法集中精力上课。与此同时，我将降低采取鼓励学习方法，对学生的上课表现多一点肯定与表扬，树立学生的自信心，调动学生的积极性。同时也将严格要求学生，上课时间不能去卫生间，休息时间控制在十分钟以内。, 由于学生上学期的补课是从初一的内容开始补起，所以我未能把握好旧知识与新知识间的平衡点，导致学生的成绩未能提高，所以我现阶段的安排是在补习落下的学习内容的同时紧跟学校的知识点学习，争取学生能掌握周内学校学习的新知识。, 如果后期课堂效率高的话，会考虑超前学习，但本阶段只能先补习好初一的基础内容，尽力做到与学校学习同步。, 下阶段将布置周内作业，根据学生现有的辅导书和课堂所学内容，布置相关知识的题目。, 对于公式的背记和理解部分需要加强训练, 以后会将题目的难度等级提前预估，让学生先做较为简单的题目，增强学生的成就感，再慢慢加大题目难度。]');
INSERT INTO `suggestions` VALUES ('de89ed26-b005-42e6-870a-e367aac4f28c', '[, , , , , ]', '[, , 加强记忆单词语法知识, 做过的试题中涉及的知识点、单词短语, , 把握技巧，加快做题速度]');
INSERT INTO `suggestions` VALUES ('858ca17d-2205-4934-96df-f339b1826c95', '[对学生有所了解，有所改善, 有所进步, /, 表现还可以，课堂知识可以做到及时回顾, /, 有所进步，准确率提高明显]', '[进一步摸索出让学生专注的方法 共同学习, 多用时间认真背诵, /, 进一步努力, /, 多练习，减少非智力因素失分]');
INSERT INTO `suggestions` VALUES ('164b3a53-487f-4d0b-8f55-e911ff2ebd7a', '[, , sfa, , , ]', '[, , , weawe, , ]');
INSERT INTO `suggestions` VALUES ('b6834d89-855e-43b9-bebd-03f7ed7df8d1', '[专注度整体可以，不过偶尔会开小差, 以前学的单词遗忘较多，语法一知半解, 无, 尚未了解, 尚未了解, 准确率不够高]', '[专心上课，该休息就好好休息, 重点讲解语法知识点, 学有余力再进行预习, 回顾之前学过的书本, 指导学生掌握适合自己的方法技巧, 多练习]');
INSERT INTO `suggestions` VALUES ('6a9ce13b-43bc-4087-8559-17d2067c8377', '[较为认真，专注, 对万有引力知识点掌握有一定加强，能量守恒知识点理解有待加强提升, 现在在提前接触一些综合性题目，在其中一边讲解为学习的知识, 有注重复习、练习讲解的知识点重点难点, 对万有引力题目做题方法有一定改善, 速度加快了一些，正确率还能再提高一些]', '[希望保持学习热情, 建议对基础知识加强理解, 多做些综合性大题，课前进行预习, 知识讲解后注意及时做题, 对做题方法进行总结，做一个错题集，考前及时看一看, 写题目时细心，注意陷阱]');
INSERT INTO `suggestions` VALUES ('10f187d9-86bb-4b6b-bc41-0077feff67eb', '[有提高，不过还有很大提升空间, 有认真记笔记, 主动性还有欠缺, 主动性还有欠缺, 有提高, 有提高]', '[注重基础知识, 准备专门的笔记本, 留课后作业, 和家长配合监督孩子学习, 真题模拟, 真题模拟]');
INSERT INTO `suggestions` VALUES ('499c228e-9f60-404f-b286-83fc47083580', '[此为第一阶段, 此为第一阶段, 此为第一阶段, 此为第一阶段, 此为第一阶段, 此为第一阶段]', '[学习态度较好，能自觉学习, 主科知识掌握较好，副科知识点有欠缺, 有预习, 复习巩固不到位, 考试容易犯迷糊，看错题, 速度较快，但易粗心出现计算错误]');
INSERT INTO `suggestions` VALUES ('131db198-5ee5-40d5-a003-b88e5751b0bb', '[能跟着我的讲课思路，专注度显著提高, 方法基本完全掌握，运算是软肋, 紧跟进度，预习较好, 作业能较好的完成, 应试技巧在平时讲题都有渗透，学生有良好的进步, 速度有待进一步提高]', '[平时少看电视，在做题的时候专心致志，不去想其他的事, 把书本上的基础知识掌握的前提下能做一些课外的题强化练习一下, 课前一定要预习，找出自己不懂的地方，方便正式上课的时候有针对性, 课后一定要复习，把当天所讲的知识最好都看一遍，把那些关键题目要自己动手，自己亲自算一遍，切忌眼高手低, 考试不只局限于课本，平时练习的时候要多想，思维灵活一些, 首先一定要保证准确率，之后追求速度]');
INSERT INTO `suggestions` VALUES ('910b132c-352a-4000-b1b9-0e9fabbbb9ff', '[, 基础不好, 一点就会, 词汇不够, , ]', '[, 需要多多努力, , 需要加强背单词, , ]');
INSERT INTO `suggestions` VALUES ('be7f016d-d506-4994-871c-693597d9142a', '[一般，易走神, 良好, 有时未按时完成, 一般, 一般, 较慢，不太用心]', '[努力用心, 学会积累, 每天花一定的时间背单词, 每天课后花一定时间巩固, 期中考试后看成绩制定, 期中考试后看成绩制定]');
INSERT INTO `suggestions` VALUES ('80e0f1b3-e20f-4619-b722-f5f3ee4d4706', '[, , bucuo, , , ]', '[, , bucuo, ji, , ]');
INSERT INTO `suggestions` VALUES ('9a994df4-d392-4b3c-aea9-4388586fc6b5', '[, , , , , ]', '[, , kadnfdalk, , , ]');
INSERT INTO `suggestions` VALUES ('a625ba8d-8aa2-49f0-9520-9d788bc0d653', '[, , asd, , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('da13ac4e-c23b-4e89-8d15-c307f156b95f', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('bed82131-ef62-4dd9-8d5a-6a94c7d07195', '[有进步, 有进步, 暂未布置预习, 有待提高, 有待提高, 有待提高]', '[继续保持, 继续复习, 暂无, 多复习，要下功夫, 多训练，认真, 有待提高]');
INSERT INTO `suggestions` VALUES ('6117d393-f201-49c3-994f-4793911ae223', '[持平, 进步, 持平, 进步, 进步, 持平]', '[提升课堂专注度, 继续保持, 养成预习习惯, 坚持课后复习, 多多巩固知识点, 坚持做题]');
INSERT INTO `suggestions` VALUES ('919103bd-1b71-49e9-9c8b-61172c85a958', '[继续保持, 有待提高, 暂无, 继续保持, 有待提高, 有待提高]', '[继续保持, 有待提高, 暂无, 有待提高, 有待提高, 有待提高]');
INSERT INTO `suggestions` VALUES ('48b6f75f-c59a-41d2-94f6-4d5694362dca', '[听讲非常专心, 大部分讲过的题型能记住，但有的细小知识点仍然很迷糊, , , 较难题型还搞不清考点, 速度有待提升]', '[保证睡眠时间，上课时不要犯困, 为了备考，每节课都会听写知识点，好好准备, , , 练习真题，提升题感, 方程式、公式等有待进一步提升]');
INSERT INTO `suggestions` VALUES ('31d8f749-9d61-4c46-b898-f39aaca8ce78', '[专注度基本不变，偶尔会出现开小差，不过整体还是可以学到知识点, 语法逐渐巩固，由于勤于背诵词汇量稳固提升, 比较少主动预习, 会主动复习学过的知识, , 七选五相对准确率较低]', '[, 单词要做到日复一日的坚持, , 再接再厉, , 各类题目在日常学习都要涉及，加强薄弱项练习]');
INSERT INTO `suggestions` VALUES ('81965c44-34f3-4eb7-b86c-dc868de6019d', '[上课专注度比刚开始上课时进步很大。, 基础知识掌握有进步，对知识点把握也更准确了。, 主动预习意识还是有一些欠缺。, 基本能做到主动认真复习。, 考试技巧仍需加强。, 做题速度很好，准确率不是很稳定。]', '[自己主动学习，找到不会的知识点并在上课时提出来进行加强。, 最后冲刺阶段应该回归基础，保证状态。, 上课前一定要先找好自己觉得有问题的知识点，以便于上课时及时补充。, 上课后应主动复习和巩固。, 会在后续课程中逐步进行考试技巧的加强。, 做题速度继续保持，但应该稳定准确率。]');
INSERT INTO `suggestions` VALUES ('49d2f330-bc86-41e0-8c7d-300277fe4aaf', '[较上一阶段有所进步。, 基础知识比如基本字词等掌握还有些欠缺。, , , , ]', '[应通过加强学习兴趣提高专注度。, 平时注意积累，扩展知识面。, , , , ]');
INSERT INTO `suggestions` VALUES ('c14b02d3-65aa-4a96-8ba4-700a87a1892e', '[良好, 良好, 良好, 良好, 良好, 良好]', '[晚上早点睡，第二天上课精神才会好, , 在学校上课后要认真听课, 在学习需要多做题，整理笔记, , ]');
INSERT INTO `suggestions` VALUES ('e746feda-1f01-413a-949b-ad4cbcf930e2', '[一般前半段听课会较后半段专注，有的时候会比较不耐烦，但总的来说还是可以的。, 八年级下册数据统计这一块掌握的不是很好，平均数、中位数这些基本概念混淆，另外，配方法解方程的步骤还不是很清晰。, 在我看来，超前学习这一块做的不是特别好，但是偶尔会超前完成部分没有学过的知识的作业。, 不太喜欢复习，以至于有些小学就学过的知识点都忘记了。, 没有什么技巧而言，觉得能够做出来就行了，不是很在乎是否花费了很长的时间。, 速度在可以接受的范围内，但是准确率还有待提高。]', '[希望能够尽量集中精力来听讲，少讲一些无关的话题。, 最主要是要把概念记清楚，所以我希望他能多练习，加深印象。, 不需要太超前多少，但上课前可以稍微提前预习一下，这样有助于理解新知识。, 真的要多去巩固复习，不能因为学过了就算了，还是要时常翻一翻自己做过的习题。, 要有一个虚心学习的态度，不能只追求做出来就行了，要用最短的时间做出来才达到目的了。, 要细心，要有耐心，要看完题目再开始答题。]');
INSERT INTO `suggestions` VALUES ('be20e8d1-4717-4ff9-b339-776c28a60dbf', '[很认真, 基础较好，缺乏不同知识点的联系运用, 目前不做要求, 希望可以注重一下, 一般, 速度较慢，有待提高]', '[继续保持, 多见一见不同类型的题, 下一次会把题目提前给你, 不会的题可以发给我, 学会取巧, 更熟悉知识点，学会分析题目]');
INSERT INTO `suggestions` VALUES ('e1177e52-2982-4dd6-acc2-afab0912bc12', '[由于她自身的课程也比较重，所以上课的时候会有些疲惫，上课的专注度会有所下降。, 解方程基本的知识都知道，但是很重要的一个问题就是，很容易忘记了，或者混淆了那些公式。, 没有超前学习的习惯。, 主动复习的能力有所欠缺，往往是别人强制要求才会求复习。, 没有掌握什么应试的技巧，被难题卡住了就会显得很慌乱。, 速度还有待提升，准确度也不够高，主要这个计算有很大的问题。]', '[我会尽量讲的有意思也些，也希望她能分配好自己的精力，留一些到晚上。, 多做练习，然后每天都能抽一点时间练习不熟练的地方，并且，公式要花时间来背诵。, 尽量在上课前稍微预习一下，便于理解。, 多看看以往做过的题目，多去复习。, 多积累一些简便方法，要学会先易后难。, 要细心，并且多计算提高计算能力。]');
INSERT INTO `suggestions` VALUES ('d5aba5bf-dbee-4c44-bc19-856c8fb4a028', '[进步，上课状态一直很不错, 进步, 进步, 进步, 进步, 持中]', '[, 多背诵单词；知记搭配的词组；注意比较记忆发音相似、拼写相似的单词，不要混淆。, , 希望课后作业能更加认真对待, 这方面在4月的辅导中没有系统的讲授，但已经规范了做题格式，相信会有提升, 单就我布置的作业来看，准确率不高，做题速度不错；就月考成绩来看，准确率应该是不差的。还是希望孩子能认真对待书面作业和听写，每天抽出10~20分钟背单词。]');
INSERT INTO `suggestions` VALUES ('4d169003-0a87-4419-bf67-a9652d7a04cf', '[较上一阶段有明显进步, 知识结构不太扎实，但能在课堂上配合教学, 该生还是不太喜欢预习，认为这是课堂上的任务, 学习不太主动，但兴趣有明显的提升, , ]', '[上课时不再使用手机, 进一步打基础, 打破观念让她认识到预习的好处, 继续活泼课堂，给予一定的夸奖，刺激学习的积极性, , ]');
INSERT INTO `suggestions` VALUES ('c41a7d79-d132-4d12-94ab-766269c6ec88', '[老师教的都记住了, 对知识点关于物质那块掌握不够全面, 已处于复习阶段, 初三冲刺阶段仍在复习, 考试技巧掌握不足, 做题速度中上但准确率有待加强]', '[要对老师教的懂的灵活运用, 要多做有关的题，尤其是物质间的转换关系, , 要多练习学过的化学方程式，争取看到物质就回忆起它的有关化学方程式, 要记得一些固定的答案，看见相似的要反应过来，以及某些万能的回答方式, 读题一定要细致，懂得筛选有用的内容，学员不应该擅自给题目增加条件]');
INSERT INTO `suggestions` VALUES ('99df6085-6cb5-4fdf-8f7c-fd205009db2d', '[, , , , , ]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6', '[听课认真, 对于书本的该有的熟悉程度不够, 完成作业挺好, 有复习整理, 考试技巧也有所进步，但也有需补充的题型, 有所提高]', '[继续保持, 多熟悉下知识的框架, 按学习进程，保持状态，加油, 按学习进程，继续保持，学会有所侧重，学会合理安排各科的复习重点，加油, 会整理训练相应的题型, 对审题的能力要加强]');
INSERT INTO `suggestions` VALUES ('9119c7df-496f-452b-bdc2-81ebb14e0031', '[进步, 较好, /, 相比于上一段 课后复习有所退步, 良好, 进步]', '[课后积极复习, /, /, 认真完成上课时留的任务, 更加认真 仔细检查, 有很大提高]');
INSERT INTO `suggestions` VALUES ('57f309f4-9ec1-4959-840b-6601ca4d9079', '[进步, 进步很快, /, 完成较好, /, 有所进步]', '[更认真积极, 多加复习，为中考做好准备, /, 继续复习提问中不会的部分, /, 速度需要再提高]');
INSERT INTO `suggestions` VALUES ('72f637f3-2368-4b98-a20b-a82fb2f63614', '[优，有进步, 优, 良, 一般, 优, 速度过快，导致准确率不是特别高]', '[, , , 准备错题本，将错题记录下来巩固, 做题需要细心，仔细，多检查, 放慢做题速度，多思考，多检查]');
INSERT INTO `suggestions` VALUES ('1445e16c-db2f-4659-a470-568e5eef6766', '[认真积极思考, 较好, 复习为主，暂未预习, 复习巩固表现很好, 较为了解答题方法, 较为快速，正确率也不低]', '[进一步引导学生学习, 准备一些较高难度的题来给学生, 适当增加预习内容, 兼顾前期内容, 培养独立思维能力, 继续提升做题速度]');
INSERT INTO `suggestions` VALUES ('06033fe7-73f0-4c7e-b653-2579c483033f', '[上课注意力集中，效率较高, 英语基础词汇量较少, 很少主动预习, 能够及时复习且完成布置得作业, 优, 做题较慢，缺少自信]', '[下课可以更加主动的复习, 平时抽出更多时间记忆单词词组及其用法, 在老师教学之前把要学习的词汇通读一遍, , , 知识点记忆要准确，尽量填补知识漏洞]');
INSERT INTO `suggestions` VALUES ('64c6f291-8c5d-419a-bc65-3e7f461483ff', '[听课注意力较为集中，第二节课会一点犯困, 一次函数的基础知识掌握的比较牢固，但是综合性的应用还不是很熟练，在做题过程中对于一些创新题会感到无从下手，计算能力还有待提高，容易马虎出错。, 较好, 较好, 一般, 中等难度及以下的题目做题速度比较快，准确率不稳定。]', '[课前注意适当休息, 学会总结相同类型的题型，进行整理归纳。建议每天练习一道计算题，提高计算能力。, 有时间可以适当预习, 重点巩固函数性质及图像, 多练习多总结, 多练习一次函数的图像结合应用的习题。]');
INSERT INTO `suggestions` VALUES ('afb119c7-ca8f-421a-82f9-a946635273f7', '[较刚开始听课专注程度有进步, 能把握到知识点, 有预习基础知识, 课下做题, 能看得出考点, 有一点提升]', '[做题时要更专心投入一点，不要受外界干扰, 以后要更高效一点, 预习知识点的基础知识, 课下多做题, 多总结做题技巧, 细心仔细]');
INSERT INTO `suggestions` VALUES ('c26474c5-c5c5-42fa-a94a-88f318bfd288', '[听课比较认真，每次上课检查上节课讲的内容时能答出来大部分 ，比没讲课之前多掌握了不少内容。但是每堂课的最后一段时间就会表现有点不耐烦，不想学习。我会尽力改善这一状况。, 能记住大部分我讲的内容，但是有些内容还是没有掌握好，会在后期的课上经常强调，巩固。, 不怎么预习，当然我在提前告知他上课内容方面也要更完善, 总体还行，但是好像只是课堂上记住了，下课的复习做的不够好, , ]', '[将课堂内容再增加，同时培养他对学习的兴趣。, 接下来可能会留一些课外作业，让学生巩固所学内容，也是检测的手段, 在得知下节课上课内容后，要积极去准备，预习, 学生要主动复习，回顾上节课内容，完成相应作业, , 考试要检查，粗心不可有，态度要端正]');
INSERT INTO `suggestions` VALUES ('a7ba65db-23a0-4d41-84f1-a334525e4adb', '[较之三月份有一些进步, 知识掌握情况还算不错, 无, 正在复习第一学期的内容, 能够初步的使用一些简单的技巧 去巧解选择题, 做题速度挺快，正确率有待提高]', '[合理的安排好自己的休息时间，在上课的时候保持专注度。, 做题目的时候可以思考一下考察了哪些知识点，查漏补缺, 讲课之前可以看看第一学期课本的相关内容, 讲课之前可以复习考察一下上一节课的知识点和难点, 在平常的习题中巧解和完全解都可以多练, 做题速度可以保持住，但是要保证正确率，必要时可以牺牲一些做题速度，去保持正确率。]');
INSERT INTO `suggestions` VALUES ('3b636c17-80b6-4948-b071-e723ca266185', '[进步，上课非常认真, 已经能自己总结一些做题的小技巧，知识点更明确了, 很不错，每次上课前都会主动询问下一次上课的内容, 每次的课后作业都会认真做，并在私下里联系我询问, 考试技巧掌握的不是太好，我认为她在此有很大的提升空间，在教了她一些技巧了之后，还是很有帮助, 做题准确率有待提高，但整体还是有进步]', '[学习态度很不错，继续保持, 加油，要更努力在地从做题当中寻找不会的知识点，我们必须要及时发现与解决, 把不会的题尽量找出来分析，记住此时首要任务是攻克不会的类型，而不是重复, 继续保持，相信努力总会有回报的, 后面我会给你弄考试技巧的培训，“会考试”是成功的一半，所以相信自己，你差的只是正确的考试技巧与心态的调整, 要更加细心与认真，不要死搬知识点，要灵活机动]');
INSERT INTO `suggestions` VALUES ('bf2ccb37-6fc7-44c3-bb14-f997624b41c1', '[, , , 学生时间排得太满，复习较少, , ]', '[, 学生对一些知识缺少深入了解，这方面可以多加留意, , 希望学生合理安排补课，让生活更丰富自然, , ]');
INSERT INTO `suggestions` VALUES ('b9623f4f-e5ae-4f49-a531-59cc431c6574', '[上课认真，态度端正, 知识掌握得快，但容易犯错, 主动学习自己的短处, 主动巩固自己的错题, 考试技巧有待观察, 做题速度还行，准确率有待练习]', '[, , , , , ]');
INSERT INTO `suggestions` VALUES ('aca000ef-ec2d-4753-99c9-9195c41e182e', '[上课专注力一直较好, 加深了对老师讲解的语法重点的理解, 无明显变化, 保持较好, 有提升, 准确率有提升]', '[希望平时一直保持这种状态, 继续巩固基础知识，不断加深印象, 希望上课之前提前了解知识点，并换成学生讲解的方式，希望通过这种方式提高效率, 希望对已讲知识点自己再三理解记忆，争取会的知识不记错不模糊, 希望每次考试前把技巧总结一遍，并运用到考试中, 希望降低一些速度，提高准确率]');
INSERT INTO `suggestions` VALUES ('afe806b3-6f98-4eec-9f1e-5f820a6ddfd3', '[听课比较认真，现在可以在讲题的过程中说出自己的想法, 函数基本知识掌握, 无, 意识较弱, 有进步, 准确率提高，做题速度提高不是很明显]', '[在遇到问题时要有解约问题的意识，在讲解过程中，引导学生自己思考, 其他版块掌握较弱，接下来回串讲一下, 无, 由于学生作业比较多，在督促学生进行复习的同时，每次上课时都会串讲一下以前讲的知识, 在后面的综合习题讲解中给学生归纳考试技巧, 一直的训练学生做题时的态度，要让学生意识到做题是一种解决问题的状态，做题是要有一定的紧张感，才可以保证精力集中。]');
INSERT INTO `suggestions` VALUES ('23db0e70-81c2-45b1-b09e-15d4346f6265', '[学生听课非常认真，相对于刚开始，学会了做笔记, 相比于刚开始，一些基本的知识能够记住了。落实情况也比较好。, 布置的作业能够主动完成。且能够做到主动学习，超前学习。, 最近每节课上课前都会听写一部分讲过的知识，发现还是有一些讲过的东西落实不到位。, 考试技巧方面有待加强, 准确率相对之前有明显的提升，由其表现在改错和语法填空两个部分。]', '[希望学生能学会自己整理知识，归纳知识点。, 希望能继续保持，加强落实。接下来一段时间我会就讲过的知识进行复习。, 希望继续保持学习的积极性, 希望接下来的时间加强输入。大量记忆词汇，短语，同时在习题的训练当中得到提升。, 希望加强做题速度和准确率。作文方面积累一些固定的句式。, 还是要加强训练，培养语感。]');
INSERT INTO `suggestions` VALUES ('2e767d76-bfd1-4b26-9eba-fd162d04bed4', '[保持良好, 有所提高，但一些基础单词还是有所欠缺, 保持良好, 保持良好, 技巧成熟但缺乏耐心, 稍稍提高]', '[无, 巩固基础, 无, 无, 希望做题时能仔细看题, 把握做题时间，看清题再下笔]');
INSERT INTO `suggestions` VALUES ('5fae87e3-9765-488b-b853-096fe8764be4', '[保持良好, 稍有提高, 暂未接触, 暂未接触, 暂未接触, 暂未接触]', '[无, 先掌握方法和基础, 无, 记忆需要重复, 基于基础, 无]');
INSERT INTO `suggestions` VALUES ('4d6234b4-2f45-4eda-b5f4-8a49e8320e38', '[大部分时间都很专注，只有一天她说昨晚没休息好, 很多解题方法都没有掌握，解题方法单一，经常转牛角尖, 高三都在复习，这个不存在, 这个做的不太好，我每次讲完生物都叫她做易错题整理，她每次满口答应，但是一直没有付诸行动。因为她的生物选择题总是错两个，这样就扣了12分，对分数影响很大。, 我感觉她压根不用技巧。。。, 速度还算可以，准确度的话，看情况。如果她思路正确又没有漏了关键点的话，就可以。但事实上，她经常漏了某个知识点，但是她在那里死扣题目，有时候方法是错的也要一路走到黑。有时候因为没认真看题目导致没法继续也不知道回去看看题目。]', '[--, 我把很多方法讲给她听，连原理都讲到了。她说懂了，但是家长说学生比较执着于自己的想法，我不知道她会不会运用我讲的方法, , 我也不知道怎么说服她, 我教了很多技巧的。。。, 希望家长能多提醒她。我一直跟她讲，我不知道她听进去没有。开始我以为她接收的很好的，后来我发现他可能只是应付我。。。]');
INSERT INTO `suggestions` VALUES ('04239796-feec-4efb-81c5-ee2cb08b49b9', '[, , , , , ]', '[, 加强短语的记忆，诚在坚持，贵在坚持！, , , , ]');
INSERT INTO `suggestions` VALUES ('a30e5f3f-3cf5-4439-94ae-666ac78bc050', '[这个可能就是阻止他走上巅峰的原因, 只能打7分，掌握的不牢固，上课效率可能不太好，可能是他每天都要早起的缘故。, 没有这个习惯。, 没有，小豪总是被作业牵着走，很少掌握到主动性, 不太行，可能是我把他跟高中泡了几年的老油条比所以显得他有点小羔羊吧。, 慢，低。有些题乱答一通]', '[可能随着年龄的增长会改善吧, 我尽量把课本的知识都会跟他重新讲一次。, 我也不勉强，但是希望他把复习做到位, 希望他尽快进阶到可以自己掌握学习计划的级别吧, 能教的技巧我都教！, 建议学生多去研究答案，认真对习题答案。]');
INSERT INTO `suggestions` VALUES ('73dccda3-543b-4441-8bf0-e9628f179524', '[十分, 生病休息中，相对来说知识掌握情况还不错, 有待提高, 有待提高, 强调的基本掌握了, 还是做题速度有待提高，要细心]', '[, 还是要多多重复, , 多看错题，多温习, , 看题不仔细，重要的条件容易漏，有待提高]');
INSERT INTO `suggestions` VALUES ('2180bcc5-a7eb-4239-b8af-889d3e48cbe5', '[听课认真、很投入, 知识点掌握较好, 不建议超前学习, 欠缺, 做题习惯较差, 速度快、准确率低]', '[, , , 应在课后对所讲知识加强复习, 今后将着重训练做题方式, 一定要细心]');
INSERT INTO `suggestions` VALUES ('35921486-52bc-4a00-8c36-5971ad136feb', '[在学校听课有较大问题，基本概念没有概念, 未掌握的知识经过讲解都能较好掌握，进步很快, 自己课下愿意主动做题，点赞, 优, 月考进步较大，值得鼓励！, 较之前已有较大进步]', '[在学校上课认真听讲做笔记, , , , 进步再大一点，物理从前一百往前50努力, ]');
INSERT INTO `suggestions` VALUES ('7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf', '[听课比较认真，有时候会犯困, 基础知识掌握不够牢。, 主动预习能力还需加强, 也还需加强, 技巧用的不够灵活, 速度的话，还不错，就是准确度还需提高]', '[听课时要打起精神，之前要睡个午觉，不然容易犯困。, 需要多记基础公式，把基础的知识点弄懂。, 上课前，希望能看看课本。, 希望能够把不懂得知识真正弄懂，不要积累太多。, 要善于总结出自己的考试及做题技巧, 做题要有自己的思路，形成自己的做题网络体系]');
INSERT INTO `suggestions` VALUES ('7dffb4c4-d660-43a5-b2dd-992f114c4798', '[优, 优, 一般, 良, 良, 良]', '[, , , 课后多加强复习老师上课讲过的内容, , ]');
INSERT INTO `suggestions` VALUES ('ac23f69e-1c3e-4d13-a916-d6eb051fee20', '[122, 323213213232132, , 3213, 3123, ]', '[, , 213321, , 3213, 213]');
INSERT INTO `suggestions` VALUES ('d4b55546-74f3-4efe-9f5e-71b7c0e74b78', '[总体比较认真，做题也比较积极，有时候比较懒散。, 对于我强调的考试的一些考点，还有一些小词的区别和用法，宇航能够记住并在做题中体现。也提升了宇航做题的兴趣。, 可能因为学习任务比较中的原因，宇航很少或者说几乎不太会预习，但他喜欢做题，会提前把我给的资料上的题型做一下，这还是令我很感到欣慰的。, 每次上课，我都会带着他去复习一下上节课讲过的语法，单词。宇航对于提问也积极回答，但总感觉掌握不足。, 做题技巧什么的在根据个人学习经历，等的讲解，还有我掌握的，以及机构所提供的资料。发现他答题技巧方面有很多掌握比较不错，也学会了应用。, 做题方面，宇航本身就很喜欢做题，尤其是刚学到的知识的马上应用他很感兴趣，做题速度及准确提高了不少，他学会抓关键词了。]', '[叔叔阿姨，通过将近一个月的与宇航的接触，我感觉宇航是一个很听话，也很爱问问题的孩子，他其实真的很好学，我给他讲做题技巧，什么是重点，怎么抓关键词等他掌握的很不错，我也看出来他也很想学好英语。他做题的速度与正确率也提高了不少。, 但是，光有技巧是不行的，基础要扎实才行。经过我一个月的讲授我发现，我上节课给宇航讲过的语法，还有单词等，很多他都不记得了。除此之外，我发现，很多本来是他们课堂上老师讲过的语法，单词，短语。他都不记得了。你们也都知道，学英语最重要的就是要有语法和单词的积累，如果不知道，那肯定是学不好的。, 如果语法和单词掌握不够，那做题比如阅读是很吃亏的。而宇航又恰恰是一个很好学的人，他每次都会主动问我一些关于中考，英语以及大学的使，我也能够深切的体会到他确实也很想学好。, 但是因为他们早读什么的不背单词，让他周末自己背可能效果也不好，而且我们上课我也感觉到时间太短了，我有很多内容讲不完也不能带着他讲很多的单词语法，而且讲的时间很短他可能也记不住。, 所以接下来我又这样的建议，希望阿姨你能延长我上课的时间，我建议是三个小时。因为我考虑到这个学期最多还有七八个星期。内容还有很多内容。但我主要是考虑到用开头半个小时和最后半个小时背单词，记语法。因为这一块内容真的很重要。, 我也考虑到我每次去在路上就花了一个半小时，但回来只要二十分钟。这个时间段浪费的时间真的太多了。如果可以，我希望时间改成上午或下午。但如果不方便的话，晚上六点半到九点半我觉得也合适。最后，我个人讲课可能少了一些严肃，我会从下次起积极改正，也希望阿姨你们同我一起好好监督宇航学习。]');

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
  `sex` tinyint(1) DEFAULT NULL COMMENT '0: 男，1：女',
  `education` tinyint(2) DEFAULT NULL COMMENT '1：中专\r\n            2：大专\r\n            3：本科\r\n            4：研究生\r\n            5：博士\r\n            6：其他',
  `telNumber` varchar(20) DEFAULT NULL,
  `teachingLevel` tinyint(2) DEFAULT NULL COMMENT '-1：黑名单\r\n            1:普通\r\n            2：金牌',
  `regDate` datetime DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `openId` varchar(36) DEFAULT NULL,
  `signed` tinyint(1) DEFAULT '0' COMMENT '0：未签约\r\n            1：已签约',
  `good_at` varchar(255) DEFAULT NULL COMMENT '擅长科目Id（多个科目Id以逗号分隔）',
  PRIMARY KEY (`teacherId`),
  UNIQUE KEY `key_2` (`telNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教员表';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('63617903-e130-40ed-bb2f-b8ff2effb2fe', '刘国臣测试', '7439dd0a-65c3-4fea-9829-c09a91d433a3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2012级', '0', '4', '15580830349', '1', '2018-03-26 10:33:25', null, '', '1', null);
INSERT INTO `teacher` VALUES ('f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '测试老师1', 'af478f7f-f9e2-4eab-a99e-bbb3c3abc79c', '0df8c14e-2710-46db-86e0-b9cab53c995f', '', '0', '3', '1557876534', '1', '2018-02-22 23:36:32', '擅长数学,物理', '', '0', null);
INSERT INTO `teacher` VALUES ('dc9620b4-021a-4809-a238-7f83c80b636b', '向梦天', '033df2d9-d160-45df-9020-2be7a32638ce', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '156748563148', '1', '2018-04-03 13:11:55', null, '', '0', null);
INSERT INTO `teacher` VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '高级老师', '6ea548c5-fc9c-4ccb-9c45-8c4899623819', '1389a575-e1a9-46ab-853d-c2df5adcad5f', '2018级', '1', '3', '18675123456', '1', '2018-02-25 15:55:10', '1111', 'oQHVE00HAWuiDqD8zQb1Zun4cfxo', '1', '2,7');
INSERT INTO `teacher` VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '吴月颖', '21d5d442-8052-43c0-9e23-543018059625', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774839836', '1', '2018-04-02 13:02:23', null, 'oQHVE0wbkoCTLUB84WY10dk8TPf8', '1', null);
INSERT INTO `teacher` VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '向嘉博', '4115f4bb-95d7-4d87-8e07-ac21a3277a03', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18397413862', '1', '2018-03-31 13:19:17', null, 'oQHVE06xfTlMkw8eWb1uVFxoe2eo', '1', null);
INSERT INTO `teacher` VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '谢新茹', '99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7', '7ecf30e2-849b-4e93-82ba-469a2be66d32', '2017级', '1', '3', '15981671529', null, '2018-03-31 13:15:57', null, 'oQHVE0ztpyGDacM17J9gUhsg902A', '1', null);
INSERT INTO `teacher` VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '冯龙兴', 'd775d3bc-f859-4ff9-bb92-e76669ac5c71', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', null, '4', '15367487002', '1', '2018-04-02 10:36:30', null, 'oQHVE06iSPv6n2q2XYaDSuGuqm8g', '1', null);
INSERT INTO `teacher` VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '崔向影', '456d056f-25ff-4c65-a77e-23a1a2084a52', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '1', '3', '15084762874', '1', '2018-04-02 13:03:21', null, 'oQHVE01BjMXXYEH839qxPpPWzrZE', '1', null);
INSERT INTO `teacher` VALUES ('b024e47e-4427-4fb2-95d6-3cf3b42aa135', '麻万明', '5c9eed81-ccfb-4a27-928d-52756f3362d8', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13657485997', '1', '2018-04-03 08:54:20', null, '', '0', null);
INSERT INTO `teacher` VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '陈皓', '9ee049ff-2e20-4655-9d2b-4cb7fe814566', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774975537', '1', '2018-04-02 13:09:37', '全国数学竞赛二等奖，英语省级一等奖', 'oQHVE01yvJYAJ5TFf4Fnb5t60Geo', '1', null);
INSERT INTO `teacher` VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '徐慧颖', 'e23d7bca-6405-4c49-8b7f-14fe663ee4d4', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '15274810285', '1', '2018-04-02 13:10:28', null, 'oQHVE0__OBirzA0WnguedUOqpEJ4', '1', null);
INSERT INTO `teacher` VALUES ('41816287-35ca-4235-bc89-ba2a2cb4abe1', '程凡', 'efd06f65-eef6-410f-8f0c-36621ea31a86', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18154217405', '1', '2018-04-02 13:11:22', null, '', '0', null);
INSERT INTO `teacher` VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '朱晓龙', 'c1f40a57-7146-4a06-9e62-c50f6f75bfbf', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18273120371', '1', '2018-04-02 13:14:46', null, 'oQHVE0z70ZTYwxCF0aiMuj78Ygzo', '1', null);
INSERT INTO `teacher` VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '吴洋', '92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13278881603', '1', '2018-04-02 13:19:37', null, 'oQHVE06Ug-VWriy_SFgycIAut_Ls', '1', null);
INSERT INTO `teacher` VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '陈松', 'ca67e8ef-09d5-466b-a796-82622add5cac', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18373150752', '1', '2018-04-02 13:16:26', null, 'oQHVE01-IyhcNUk0j0IILikXF9n0', '1', null);
INSERT INTO `teacher` VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '夏欣研', 'e88ffb63-b250-44bc-9083-3324cba01eb0', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13545212652', '1', '2018-04-02 13:21:07', null, 'oQHVE075Ist7NrIynO0jPZthCHwg', '1', null);
INSERT INTO `teacher` VALUES ('cbe83e91-b829-4dd8-b852-e1937c450fe9', '齐宁', 'e05ca04a-ccca-4ee9-bb9a-383acab20a3c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '17375876043', '1', '2018-04-02 15:01:15', null, '', '1', null);
INSERT INTO `teacher` VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '姜波', 'bc9b247d-70e7-4bcd-b8be-aa4d3721984b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '15111016224', '1', '2018-04-02 15:01:54', null, 'oQHVE04YURQ-HcckCC9rhhW3Ctrg', '1', null);
INSERT INTO `teacher` VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '胡潇羽', '4e97532e-22ac-492b-a118-89a5c6b31c3c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13142008762', '1', '2018-04-02 15:03:02', null, 'oQHVE0xCd_ZrBK7hdt_qh00vfwD8', '1', null);
INSERT INTO `teacher` VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '吕向前', 'bc0be7a4-38e6-4366-a74e-903d322e4b0a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18569400050', '1', '2018-04-02 15:13:20', null, 'oQHVE02FYU1agk2nKZa_gRhfrl58', '1', null);
INSERT INTO `teacher` VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '张文慧', '15a7c808-098b-4e8d-9f19-1022b6d5b387', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '13635562695', '1', '2018-04-02 15:19:14', null, 'oQHVE05svxvYq0B41xk9QDCe-n-w', '1', null);
INSERT INTO `teacher` VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '左博聪', '4583b87a-1eb3-4cfb-9a47-f1af60d01467', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '15111095615', '1', '2018-04-02 15:43:26', null, 'oQHVE06FdnB1_VBLYhA7W7VORTZE', '1', null);
INSERT INTO `teacher` VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '邢凯迪', '1394814e-1348-4132-90cd-ac01732facd5', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18174451062', '1', '2018-04-02 15:46:53', null, 'oQHVE06iHuZqDvqrsRr-a2vkWqDk', '1', null);
INSERT INTO `teacher` VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '王宁', '1cc35afa-391b-49dc-a0bb-5f401eaf56f0', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2014级', '0', '3', '13667337306', '1', '2018-04-02 15:48:05', null, 'oQHVE0wakJf02f3mULTcytPVJqF4', '1', null);
INSERT INTO `teacher` VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '陈娴', '64a7f49d-15db-48dd-9e50-044c15314a33', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '17308416020', '1', '2018-04-02 15:50:37', null, 'oQHVE0xMB1ZvRHXPfWJCDxKyKkP0', '1', null);
INSERT INTO `teacher` VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '薛潇', '8d4c35e9-dcad-44ff-a297-c55789914717', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '4', '13909620950', '2', '2018-04-02 15:51:55', '活泼，幽默，有耐心，有自己的的教学方法，认真严谨，可以和学生十分愉快的相处', 'oQHVE0yIjju4ZGFWKRgHqQrqWk_E', '1', null);
INSERT INTO `teacher` VALUES ('ec0a82c0-6f1c-4561-b8bf-195cac02796b', '姜蕊', '6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18390987440', '1', '2018-04-02 15:56:34', null, '', '0', null);
INSERT INTO `teacher` VALUES ('e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '胡嘉欣', 'd6484e68-7a9a-4fca-812c-1bdb64a951e3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', null, '18272057850', '1', '2018-04-02 16:20:05', null, '', '0', null);
INSERT INTO `teacher` VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '李东刚', 'c6948d2a-e3d4-49ca-8adc-7e657268cb2e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18670308329', '1', '2018-04-02 16:28:48', null, 'oQHVE003YUsVEQ3ZpwLpEYI3VnYI', '1', null);
INSERT INTO `teacher` VALUES ('f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', 'ceshiliulaoshi', '961c91e1-0607-4dea-ba8d-c96a1cb18315', 'f3e0ee6c-7c5f-42ca-8060-f2b39dbf2361', '2016级', '0', null, '15587976896', null, '2018-04-02 22:26:35', null, '', '1', null);
INSERT INTO `teacher` VALUES ('bba97bb5-2d8c-4977-a009-bf59e82fb6af', '李莹庆', '0a4afa55-db09-4bd1-8c38-82d93edc6d70', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '15526459605', '1', '2018-04-03 13:16:42', null, 'oQHVE04raoFjtMPVA3h6Htz7_CPY', '1', null);
INSERT INTO `teacher` VALUES ('76a6c3d8-ef83-4fb7-bd5c-b27c47eccf02', '候晚晴', '8a0698be-fdc5-40da-86ae-61731251290b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '15893095795', '1', '2018-04-03 17:23:57', '全国英语竞赛省级一等奖，全国物理竞赛省级二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '张荣旺', '258e2acf-80db-4642-ad89-0fcbd6b5731b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '15574804640', '1', '2018-04-03 16:07:02', null, 'oQHVE02MP7TCMAEvhKe95COAZZHc', '1', null);
INSERT INTO `teacher` VALUES ('76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '秦家琳', 'a2d1cd1d-8b94-455d-8f78-a00ec90cb007', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774063134', '1', '2018-04-03 17:22:53', null, 'oQHVE0xkmL6bB9WV1y3uaZnJL_UE', '1', null);
INSERT INTO `teacher` VALUES ('5f53edf6-079a-4874-8e86-4c48d14a268e', '丛颖', '06a6ab17-d1ea-4159-b897-aa5bf2135c2b', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', null, '3', '18774879533', '1', '2018-04-03 17:24:49', null, '', '0', null);
INSERT INTO `teacher` VALUES ('a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '李芳林', '96b37632-2ad5-4100-814c-23d4af389250', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '13637472576', '1', '2018-04-03 17:25:54', null, '', '0', null);
INSERT INTO `teacher` VALUES ('2317d1b6-f84d-4633-bc8c-97caaff69e16', '高梦梦', '9b563e14-07bc-4416-830b-319274e8d625', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '15274816683', '1', '2018-04-03 17:27:58', null, 'oQHVE04is0pQL2FUiFVShfhvQ8Kk', '1', null);
INSERT INTO `teacher` VALUES ('436e705c-33e3-4f57-ba31-6eadb0596ac4', '田江', '53e2656e-8d99-4626-81f7-cbdad18c7b93', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '15287415316', '1', '2018-04-03 17:29:30', null, '', '1', null);
INSERT INTO `teacher` VALUES ('fa21938a-9d7f-442e-b9cb-37be8a2535c6', '廖成意', 'd1da9599-1adb-4075-98d9-297e4902338e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', null, '3', '18223562393', '1', '2018-04-03 17:30:23', null, 'oQHVE00-AmMcs0WzzENjr5bPOYFc', '1', null);
INSERT INTO `teacher` VALUES ('b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '高鸶佳', 'ae035324-3e4d-46c4-bdb6-c445af54e5fe', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13142175883', '1', '2018-04-03 17:31:37', null, 'oQHVE013DU_MBE9faBJPzLmV8f40', '1', null);
INSERT INTO `teacher` VALUES ('776b3585-eb3d-4be2-85b0-6e833cf6a913', '王翼', '219524c2-8299-4a2c-8e28-6826f222c219', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18329525584', '1', '2018-04-03 17:34:10', null, 'oQHVE02kDaU7MucAhueX258cmKa8', '1', null);
INSERT INTO `teacher` VALUES ('ebcea06f-b8ea-45f4-9c39-c843d648602c', '皮文君', 'c9e06263-d7a6-4fde-9d60-50b4c66d3092', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18670367305', '1', '2018-04-03 17:43:47', null, 'oQHVE05fxzDEFXvF7ZynRKSchpQA', '1', null);
INSERT INTO `teacher` VALUES ('01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '李国伟', '6d608e41-1306-476e-9065-ba38563ca876', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', null, '15200833373', '1', '2018-04-03 18:03:01', null, 'oQHVE0wpUMFHvzWN5U1t2-tFDTT8', '1', null);
INSERT INTO `teacher` VALUES ('c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '候昭慧', '6a17e374-b643-4a53-9981-12e58be2a5dc', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '17375150595', '1', '2018-04-03 18:03:50', null, 'oQHVE06m8SUA7vxpVTT68Bw0CIRU', '1', null);
INSERT INTO `teacher` VALUES ('a2d7bf04-f9f6-4842-99d1-79f17dab142e', '董梦季', '6d072ef5-a207-40c9-a4dc-425e7dfc4bfb', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '18890090950', '1', '2018-04-03 18:27:52', null, 'oQHVE0wtp5V2Lt5GYRIXiruA0Vqc', '1', null);
INSERT INTO `teacher` VALUES ('44cd5d75-722e-4c03-ac2a-360e5447b97f', '覃居上', 'c336330e-5f6e-4816-b65b-9ae28027e76f', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '1', '3', '18774861533', '1', '2018-04-03 18:28:43', null, 'oQHVE077aDc0uePbyn7KNC9V7h9g', '1', null);
INSERT INTO `teacher` VALUES ('6c7dae17-0dcb-4263-89b2-ae255883c682', '刘芳', '9690b31a-b878-4d60-8bdf-2e9448e815db', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '1', '3', '15084726641', '1', '2018-04-03 19:02:58', null, 'oQHVE03vR7PMKlKXatw8GQyUpobc', '1', null);
INSERT INTO `teacher` VALUES ('f3ab62e9-bffa-4ca7-950a-9758622de7fc', '崔海骕', '76a11d30-fa92-4921-8104-01c128b50ce6', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18711139337', '1', '2018-04-03 19:05:06', null, 'oQHVE07-ZhI-kR-ndOKodygSf7Qw', '1', null);
INSERT INTO `teacher` VALUES ('104a8e84-b0a2-4e32-86d4-75d548c87804', '胡英杰', 'd1c43397-001f-400b-ae73-00c6e27461b9', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18932449267', '1', '2018-04-03 19:14:42', null, '', '0', null);
INSERT INTO `teacher` VALUES ('d0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '谷孟阳', '36b74fdc-62d5-4d20-b4c0-3acf7317c745', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13027424343', '1', '2018-04-03 19:18:01', null, 'oQHVE04la8ss0_eO_XHTLnW3foyY', '1', null);
INSERT INTO `teacher` VALUES ('19115f9c-d7d6-4415-baab-27cb4973ce98', '文少芬', '7b0efa43-761c-486c-8285-e33fe6e7e92d', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '1', '3', '18319368445', '1', '2018-04-03 19:20:13', null, 'oQHVE02AyTqCVp7pm3g8rAGU001c', '1', null);
INSERT INTO `teacher` VALUES ('cb25c238-8c4a-4fd3-8142-3e4c39fb0d42', '程新', 'c2732e4f-ff7c-4168-a706-467276cc46e4', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13278882857', null, '2018-04-03 21:07:24', null, '', '0', null);
INSERT INTO `teacher` VALUES ('add3d1b0-204f-4159-90de-e054b94a4b5f', '王中钰', 'a3b322d6-90f5-4d27-8bb1-351944ce46a3', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13007438697', '1', '2018-04-03 21:26:56', null, '', '0', null);
INSERT INTO `teacher` VALUES ('8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '王永娟', '025493f4-3031-4d26-a97a-94a1c003f450', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2016级', '1', '3', '14747431827', '1', '2018-04-03 21:28:01', null, '', '1', null);
INSERT INTO `teacher` VALUES ('70003dbe-38d9-4337-aa5c-3e70efafb7fc', '刘建军', 'adc81b8e-602a-4642-aa05-6fd3dce8a200', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '17830286663', '1', '2018-04-03 21:30:48', null, '', '0', null);
INSERT INTO `teacher` VALUES ('4913983e-0ead-42d9-8461-e529dc31c684', '廖森', '15af7999-b5fa-4f1e-8859-0409afdc4688', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '5', '18273460875', '1', '2018-04-03 21:35:54', null, '', '0', null);
INSERT INTO `teacher` VALUES ('3f26b978-1499-4da6-bb18-42750bafc010', '李恩启', 'ea56eb2f-6608-4caa-bc5f-ed70101e17df', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '15560279613', null, '2018-04-03 21:39:14', '', '', '1', null);
INSERT INTO `teacher` VALUES ('51669f73-2654-42db-a7d3-8c51c430a564', '智亚', '42f7d036-eff6-4000-9f34-bea9f636a643', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774878930', '1', '2018-04-03 21:40:17', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b13c5b94-b066-44af-b4c4-145c9d8612a0', '汪永俊', '931bb143-622e-4344-8da2-5a560d236701', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13516450815', '1', '2018-04-03 21:41:21', null, 'oQHVE0wBs1QZykLZlG4i7IhwPDRU', '1', null);
INSERT INTO `teacher` VALUES ('581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '胡明杰', '585c7f7b-6b8e-4c97-bf29-78f421169d71', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18670391790', '1', '2018-04-08 11:53:21', '四级589', 'oQHVE0z4_jisbd0U4oaquaX9PHWw', '1', null);
INSERT INTO `teacher` VALUES ('11d525bf-153b-4d1d-9acc-3d06778177c4', 'test_teacher1', 'e713f2c0-ff19-4263-b590-8e4dfde618c2', '6a4997b2-5319-4119-841f-cbb40b93f40e', '2013级', '1', '3', '18711009965', '1', '2018-04-05 20:55:11', '232', '', '1', null);
INSERT INTO `teacher` VALUES ('27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', 'hexl2', '46ea94d9-9c5d-4f1a-8943-f9847ccf8ee0', '6d52123a-ce1f-497e-ae85-15a6e6436462', '2018级', '0', '3', '18674819151', '1', '2018-04-04 22:57:23', '4444', 'oQHVE0603rPaj7fFU8aum--eliMc', '1', null);
INSERT INTO `teacher` VALUES ('2c64d354-e9db-441d-8271-061d46813abb', '周彦宏', 'ebf4bed8-529d-4f43-b56c-0b211da1a51d', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18006468086', '1', '2018-04-08 19:30:48', null, 'oQHVE0_1ev9Fnu8WCLxN-AD4aKH4', '1', null);
INSERT INTO `teacher` VALUES ('a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '姚明', '16685aa3-7589-40d2-ac2f-63e3c116e99c', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2015级', '1', '3', '18373177116', '1', '2018-04-08 20:37:27', null, 'oQHVE090xsPfCCHEtgZuovs5KxeY', '1', null);
INSERT INTO `teacher` VALUES ('db66fd38-466a-4620-9890-6abb10a67a22', '秦国民', '80cc1fe4-6aa4-49fe-a71c-0842035e126e', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2015级', '0', '3', '18174679426', '1', '2018-04-08 20:38:06', null, 'oQHVE02nMmvMGlH3e5FmeVQojdH4', '1', null);
INSERT INTO `teacher` VALUES ('ac37a69a-8f81-4f35-950d-44586364969b', '王文丽', '556a2aeb-8c1c-4291-9485-5ed043c866ef', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2016级', '1', '4', '15874184386', '1', '2018-04-08 20:55:51', '大学化学竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('2f6a5e5b-4e32-46d0-8942-5e730051b99a', '刘林', '6e87011c-d6a7-4bf5-bc18-eb9356d320cd', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '13142172699', '1', '2018-04-09 10:58:06', null, '', '1', null);
INSERT INTO `teacher` VALUES ('6620857b-7472-4960-a7f7-870244cad689', '吴俊', '7884cfad-89c5-41d3-89df-3b6095e7483a', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2016级', '0', '3', '18774884031', '1', '2018-04-09 11:20:46', null, 'oQHVE0-vyFp36qNqHmozRBJ6CzKU', '1', null);
INSERT INTO `teacher` VALUES ('73818668-89b4-4f28-b928-6b454641aaae', '沈昊晟', '05bd85d1-9e6b-42dd-9889-2ec75721755c', '7eaaa2f4-e9fe-4fe7-a67a-56254f8afb7c', '2017级', '0', '3', '18670741028', '1', '2018-04-09 11:21:19', null, 'oQHVE0xzy5fs5fi0Gy5igseJqKOs', '1', null);
INSERT INTO `teacher` VALUES ('38cf1718-94f3-4b1c-941d-16c27e5f8206', '孔垂越', '8ff783b7-5748-4bea-b81f-f1969240ac38', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2017级', '1', '3', '13278880276', '1', '2018-04-10 15:15:19', null, '', '0', null);
INSERT INTO `teacher` VALUES ('510ad3ee-86ab-44ff-a31e-f71ab7b2c27b', '秦星子', 'de657fcf-fa06-4bab-af63-8c09b03c833d', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18173676040', '1', '2018-04-10 15:34:31', null, '', '1', null);
INSERT INTO `teacher` VALUES ('570cf513-8e9a-4fc8-a8c9-b44ce5ed7198', '金丹静', 'd64cd4ed-2132-42e2-a0c8-564d06762425', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '17373139972', '1', '2018-04-10 15:37:33', '全国数学、物理、化学竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('3d7625b8-c5b8-49aa-8a38-4e8ba6753f50', '刘择安', '2d29ce81-cca3-4c13-8bb4-b7ef76545a43', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '13187042971', '1', '2018-04-10 15:38:28', null, '', '0', null);
INSERT INTO `teacher` VALUES ('878cf7d9-1888-40fc-871f-89f3687b34b8', '丘浏阳', '58fd06a7-890c-4221-9689-ea14daa17bd0', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '17375876324', '1', '2018-04-10 15:39:06', null, '', '1', null);
INSERT INTO `teacher` VALUES ('3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '康芯萍', '608bf3da-7dca-4cdd-a996-61b71178701c', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13117412195', '1', '2018-04-10 17:46:19', null, 'oQHVE0wsUmv-at-kljG1J8zYx5Co', '1', null);
INSERT INTO `teacher` VALUES ('a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '贺亚灵', '5458cd11-e167-440e-9036-b07cefa39ff6', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18711176332', null, '2018-04-10 18:32:08', null, 'oQHVE04dd58mlpDG2zGaA6vF6aoU', '1', null);
INSERT INTO `teacher` VALUES ('ebedc957-1970-4c7f-a114-aadf4d8dc953', '石春飞', 'e1d8defc-6cd6-4b53-a1ff-d937eed83da9', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2015级', '0', '3', '15274937824', '1', '2018-04-19 20:45:02', '数学，生物，地理，化学；“语文报”杯省一等奖，数学联赛省一等奖', 'oQHVE05nV7XHB-hImO0vNxGcHISQ', '1', null);
INSERT INTO `teacher` VALUES ('31db8174-6c57-4823-b00b-1383591a377b', '王紫薇', '1921fe20-1f07-4184-8c71-e575b1de3c0c', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '17375876315', '1', '2018-04-19 20:49:50', '英语，数学；专业排名靠前，国家励志奖学金，校级奖学金，有经验', '', '0', null);
INSERT INTO `teacher` VALUES ('771d1e22-ae10-46fc-92af-e7eb2df326b4', '王瑜瑜', '79bd28ac-9922-4722-b363-4fcdea1a6cac', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13007437650', '1', '2018-04-15 13:37:00', null, 'oQHVE0zwzshs4Yk0I10EPfzAPzD0', '1', null);
INSERT INTO `teacher` VALUES ('b8ef7e22-3952-403d-af92-dfdcbe250073', '赵珍莲', '4fac4a60-4f46-472c-b3ee-7f8e6b797b85', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18711010732', '1', '2018-04-15 13:45:20', null, 'oQHVE02au-TXyjg3tLXn5YLJJ7Uk', '1', null);
INSERT INTO `teacher` VALUES ('06b3e395-0bde-43cc-b26e-68076de7dfc1', '陈文强', 'ca049937-a7bf-4695-bfb5-4792b53d49fb', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '17375876486', '1', '2018-04-17 23:16:55', null, 'oQHVE0_BQYs1zUHTL0lYm1OI6Kbc', '1', null);
INSERT INTO `teacher` VALUES ('994d9e91-ced6-4f21-a8ec-ceab54d904a8', '唐正梁', '670f6213-8727-4111-8bc1-c165ad7836ff', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '15200813882', '1', '2018-04-18 22:15:19', null, '', '1', null);
INSERT INTO `teacher` VALUES ('870e0be3-19b0-4a60-86aa-7572e8b78115', '凌昂阳', '3fa5c97d-fec8-4277-9128-e461df084e48', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '17352825989', '1', '2018-04-19 20:51:47', '数学，理综；有经验', '', '0', null);
INSERT INTO `teacher` VALUES ('6ee9e5c1-3cf8-46ce-b68f-d92fdb9138fe', '张阅兵', '9b0ab351-663f-4de1-8ec2-d084cf5efc2f', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '18807427884', '1', '2018-04-19 20:53:23', '数学，化学，物理；高中奥林匹克化学竞赛省二等奖，高中生化学竞赛省一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('545c2216-e26a-492b-a0a4-b596e0b4959a', '马千千', '6f94eeae-7a68-4fa4-b6a6-23c53014d041', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '1', '3', '17338358006', '1', '2018-04-19 20:54:41', '语文诗词，文言文，作文全国竞赛获奖，英语水平较好，中考物理满分', '', '0', null);
INSERT INTO `teacher` VALUES ('08bbcfcd-a8f0-4b8d-ae43-8d06c9cee679', '余思慧', '46ab8319-cbc1-435a-9b9f-5abc88313d1a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18774879232', null, '2018-04-19 20:55:53', '生物，化学，化学竞赛省三等奖，物理，数学', '', '0', null);
INSERT INTO `teacher` VALUES ('a0053e6f-4ed4-4991-b927-27f234479a88', '李朦', 'd6a2bc48-3a8a-497f-8aff-632a193b2294', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13278882045', null, '2018-04-19 20:58:39', '理科，语文，英语，英语四级优秀，化学', '', '0', null);
INSERT INTO `teacher` VALUES ('3dab8246-9357-4e79-8849-38739e78749f', '胡校林', 'afe462cf-fc14-48ca-b5a8-b8b5cfa03704', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2014级', '0', '3', '15802545405', '1', '2018-04-19 21:00:47', '数学，物理，化学', '', '0', null);
INSERT INTO `teacher` VALUES ('48f3736e-a5d3-436e-ad4e-200646f8a6b7', '蔡道俊', 'eed088a0-cdb6-4030-ab1c-e00d01656581', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '4', '18570021537', '1', '2018-04-20 11:29:15', null, '', '0', null);
INSERT INTO `teacher` VALUES ('a295affa-be14-48e3-aece-dfad1ea22b6a', '陈艳丽', 'c156aabe-74da-4980-976e-36da67179fb0', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18273148176', null, '2018-04-20 14:40:06', null, 'oQHVE0zz1lzNp0AnerZy2XYfhvcI', '1', null);
INSERT INTO `teacher` VALUES ('143a318e-56f1-4237-a47f-0c31c7853ce4', '吴颢钰', 'ede732d7-be7e-4a2c-9f87-a47703eafd65', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2014级', null, '3', '15116121182', '1', '2018-04-20 14:45:35', null, '', '0', null);
INSERT INTO `teacher` VALUES ('7ae86dca-93bd-4f69-b00a-66447de5ec35', '林楸艳', '75063416-b6a9-4636-b31c-0ae9e3247fd0', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '15260616082', '1', '2018-04-20 16:53:00', null, '', '0', null);
INSERT INTO `teacher` VALUES ('58a28496-ac22-42cb-991e-899bc221076e', '王景宇', 'bcc50e8d-481d-4b7f-8676-a04ca9eda9d1', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13117419963', '1', '2018-04-20 17:01:31', null, 'oQHVE050MhJTkw9XRUJRwQGG3BJ4', '1', null);
INSERT INTO `teacher` VALUES ('d33b37fe-fbcf-461c-bf89-d4ae7b12cfbf', '王可心', 'a490348f-bb67-45f3-a8cc-3e18331def48', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '15364071892', '1', '2018-04-20 17:02:52', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b6c342f3-50e2-453c-8930-ac2dc20a1a7d', '杨雪', '07e32f7a-48e5-439b-bf2a-5b80984cb99b', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18273181833', '1', '2018-04-20 17:07:54', null, '', '0', null);
INSERT INTO `teacher` VALUES ('da2f806c-7f57-4318-894a-c10a217ff92c', '雷博翔', '5b6cb792-5173-4c4f-9bfb-750b0a7b02b4', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '15675606224', '1', '2018-04-20 17:09:17', null, '', '1', null);
INSERT INTO `teacher` VALUES ('69c5fa24-b1c3-4553-a0a9-51fa6c819c61', '张艺华', '405d6195-383b-42a9-b986-3bb8ccf32247', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18734755680', '1', '2018-04-20 17:10:27', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b114c3e9-e426-47f2-9b7d-d2e40cde5135', '浦恩泽', '7345f725-a780-4a28-b6e6-4a17bc1782ed', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '13278885826', '1', '2018-04-20 17:22:22', '物理奥林匹克省三等奖；全国高中生化学竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('9e761589-bc5c-4e31-beab-913b56a87302', '林双', '116b3817-983a-439c-bf0b-30cae596d8fc', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18773353701', '1', '2018-04-20 17:24:08', null, '', '1', null);
INSERT INTO `teacher` VALUES ('ee68eb0f-d789-4e2f-9196-d77e8d3694fa', '刘鑫胜', '6addb316-6176-4de1-8a9c-92eff29c0bb7', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13342581397', '1', '2018-04-20 17:27:14', null, '', '1', null);
INSERT INTO `teacher` VALUES ('d0a35524-a0b4-4be7-84a0-0b43babb9b8a', '刘阳', '50010dc8-67ac-4f7b-a0dc-0fbd80d53b19', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2014级', '0', '3', '15211152073', '1', '2018-04-20 17:50:39', null, '', '0', null);
INSERT INTO `teacher` VALUES ('a5600e67-5b20-435d-ad17-43ad3a9c9b58', '熊楠', '7edd2934-7c99-41a5-a708-22485a98cca4', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15243672695', '1', '2018-04-20 17:51:20', null, '', '0', null);
INSERT INTO `teacher` VALUES ('a2198d46-5d41-4575-9cd8-4588b2da4737', '王子宜', 'c8be266e-45b8-41f4-8872-7d4d793e7f8a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18874495063', '1', '2018-04-20 17:52:03', null, '', '0', null);
INSERT INTO `teacher` VALUES ('d63a2009-f036-4e70-a4f0-a56988aeb0d1', '肖美红', 'c827654f-7258-4a21-8518-bed15909c4ab', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15973476383', '1', '2018-04-20 17:52:50', null, '', '0', null);
INSERT INTO `teacher` VALUES ('771ab6cd-8d8a-4a91-9134-108be9c61687', '王彤', '3f4de0c5-c25b-4a51-bbf3-2c64714039c4', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '17375896604', '1', '2018-04-20 17:53:55', null, '', '0', null);
INSERT INTO `teacher` VALUES ('2714f56a-cbbd-4e92-8b57-fa00174c787b', '陆艺方', '12676ac9-5ff2-456d-af31-c65ca28c6c87', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '15580089571', '1', '2018-04-20 17:54:37', null, '', '0', null);
INSERT INTO `teacher` VALUES ('c06050df-8ce0-4520-b868-4aa6b893b8ee', '王赛馗', '3822e69a-3bf4-4eba-a006-6732b0e3b831', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2014级', '0', '3', '15273163117', '1', '2018-04-20 17:56:32', null, '', '0', null);
INSERT INTO `teacher` VALUES ('150ee67b-967a-42d4-9e35-1ca1288624ec', '冯俊杰', '0ad9f0a7-4aca-4e6c-9403-68b717265cc9', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15573131193', '1', '2018-04-20 18:02:21', null, 'oQHVE06mwfyLuXzaTFgkPH34DMQo', '1', null);
INSERT INTO `teacher` VALUES ('f345dbcc-1740-431f-bd8b-5ecaa225dc8d', '张玮', 'ad00c944-c780-48be-be26-a8be486da05f', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '18174388897', '1', '2018-04-20 21:02:19', '中国梦作文竞赛一等奖；小背篓作文三等奖；英语单词竞赛二等奖；校作文竞赛一等奖。', '', '0', null);
INSERT INTO `teacher` VALUES ('4048eabc-6a12-445e-b7d1-3d62d6d92726', '李叶凡', '7dc05a26-5080-48bb-9f90-6b05f9218d1a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13278887098', '1', '2018-04-20 21:03:39', '省生物竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('dff9942a-9857-4949-bed4-84aab3ebd856', '罗佩玲', '80f70d1f-9ea6-40ed-9429-4993604bd0da', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15367492896', '1', '2018-04-20 21:03:57', '语文报杯全国三等奖，省级一等奖，创新作文全国二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('37f60a12-a5b5-42b6-8817-50b3561a5aa8', '梁浩然', 'ac62a6e8-f028-4643-ac06-d6a14dea32b8', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18890090729', '1', '2018-04-20 21:04:50', null, '', '0', null);
INSERT INTO `teacher` VALUES ('8e1fdfc7-d635-40a1-89ba-9552d65bccb1', '周文婷', '0a2688eb-ec7b-4e69-93f1-4f854f12a9e1', '63c27cd7-e7c7-4c6f-9365-f14eed2aae73', '2017级', '1', '3', '13627327978', '1', '2018-04-20 21:06:13', '数学竞赛三等奖；物理竞赛二等奖。', '', '0', null);
INSERT INTO `teacher` VALUES ('98ac0ab0-d335-47ba-9a0c-de4bfab4535b', '万婧怡', '2cef9e4f-1fb5-47a0-a6e8-83cb352a4bf6', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15211176285', '1', '2018-04-20 21:06:59', '全国中学生英语竞赛高中组三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('cd911707-1e22-4d4d-864d-a82295ebbb86', '朱远航', '96f2568a-52ef-4f1a-85ee-09e8f3f81f21', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '18773222375', '1', '2018-04-20 21:07:44', '校数学竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('29c59c01-1270-405c-b128-051a150b899b', '张可心', '24f08eb0-c233-439a-99ca-97db3c3dec4e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15904338936', '1', '2018-04-20 21:07:54', null, '', '0', null);
INSERT INTO `teacher` VALUES ('406f83a3-ab62-40c3-af73-82393e0e06d6', '蔡源培', '8e023fff-c954-4e6f-92ad-fba71fdc6140', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', null, '3', '15211147118', '1', '2018-04-20 21:09:37', '高中市数学竞赛一等奖；省化学竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('b0b408b3-3bae-48ca-9009-e57db0ee8b58', '王若男', '34bb9e59-9d42-44a9-a3c7-e8623af0d0cb', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15200845080', null, '2018-04-20 21:12:26', null, '', '0', null);
INSERT INTO `teacher` VALUES ('3714c7ab-ff6a-40a7-887b-499e5091ddab', '邓俊杰', '56b7c3a8-8a6b-42ae-af53-0511d52f6b37', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18773124835', '1', '2018-04-20 21:17:02', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b31b0b32-79bd-4637-9da2-62774b4c4fc4', '曾磊', '2a423069-361c-43a2-8558-cf46b0b22736', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15274986484', '1', '2018-04-20 21:18:40', '省数学竞赛一等奖；国家级数学竞赛三等奖；省物理竞赛一等奖等', '', '0', null);
INSERT INTO `teacher` VALUES ('608ae929-8180-4215-9f04-d6bca3c95284', '刘振辉', 'bcd98eab-22d6-4be5-8cc3-0662176e222f', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '15073227427', '1', '2018-04-20 21:20:54', '省数学竞赛三等奖；市生物竞赛一等奖；市物理竞赛二等奖；市化学竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('41af9f18-6c63-40b9-bd50-3ecf6205bb9f', '毕又凤', 'a3ccb7d0-a97e-44bd-ad69-16d17bb0ad9c', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '18890091625', '1', '2018-04-20 21:22:04', null, '', '0', null);
INSERT INTO `teacher` VALUES ('43e8ae62-169d-40a3-a271-21802f69bb05', '吕光如', 'f2d76a94-09f8-4c90-bd80-72e23edb06ba', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18707488530', '1', '2018-04-20 21:22:11', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b8bf4edc-d505-49ce-b64d-e15e0f377205', '宋佳', '253075ab-a95e-4167-b492-094f17b73687', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13278889011', '1', '2018-04-20 21:22:53', null, '', '0', null);
INSERT INTO `teacher` VALUES ('d41c79a8-faee-4a45-a5f0-537b6174e202', '陈鹏', 'ce3219d3-74da-4997-95c5-75e39592b31a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2014级', '0', '3', '13973161442', '1', '2018-04-20 21:23:10', '', '', '0', null);
INSERT INTO `teacher` VALUES ('7dce6aa9-0ac0-4728-8513-56683b6f63f8', '张辉煌', '1f4768e7-45e9-4144-94f3-2cd304d39b7e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18273133031', '1', '2018-04-20 21:23:45', null, '', '0', null);
INSERT INTO `teacher` VALUES ('ce83970a-14a3-41ed-a91d-5d74306e91f4', '田江', '95316cf1-e189-4521-a843-9d58623e0d6b', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '17375895823', null, '2018-04-20 21:24:00', null, '', '0', null);
INSERT INTO `teacher` VALUES ('7b197095-f4f6-4e14-b63e-3d77e5c4df2b', '李平平', '94032723-607f-4c68-a817-a80baa755ec2', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '4', '13971213994', null, '2018-04-20 21:24:28', null, '', '0', null);
INSERT INTO `teacher` VALUES ('e3ce89da-0b58-4a4c-8622-181c18f10b50', '刘洋', 'fb9dabf8-ad69-4c38-9d3f-6db353a09f3a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18890099615', '1', '2018-04-20 21:25:16', '四川省作文征集大赛二等奖；省化学竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('cf8277e7-9a24-4a95-8305-63d2cc03cf5c', '张顺', '3e50b694-7ca0-45e2-bf90-940d5c27223d', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '4', '18271800890', '1', '2018-04-20 21:25:25', null, '', '0', null);
INSERT INTO `teacher` VALUES ('12da1e1b-5aa3-4852-a932-3a24b47398ea', '魏星', '98073e96-394f-4baa-aa00-f6ffb3642dfe', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '18890029746', '1', '2018-04-20 21:26:08', null, '', '0', null);
INSERT INTO `teacher` VALUES ('00cb03fd-a82c-401c-afb5-4769c48784c9', '孔市委', '272731a6-40d3-4571-a3e4-36e62375f4d2', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '15729291937', '1', '2018-04-20 21:26:26', null, '', '0', null);
INSERT INTO `teacher` VALUES ('6f1df767-7009-42a1-b85b-29f09a4d94f8', '郑景宇', '5f589043-2b87-4e2e-a06d-1603dd7fadd5', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '18670056223', '1', '2018-04-20 21:27:19', null, '', '0', null);
INSERT INTO `teacher` VALUES ('6466918f-3d53-4fa4-8ba7-0ce15cf6ae13', '张庆鹏', 'f0effef8-2f95-4050-bae6-e44590336a9b', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '17633732864', '1', '2018-04-20 21:27:29', null, '', '0', null);
INSERT INTO `teacher` VALUES ('9b86bbed-a1b2-42c1-914a-680ce33ad0bb', '闫龙辉', 'e27ff6f7-488d-4d06-9fbd-cf0e732b9e2c', '9c96afa2-5b0d-41bd-b88c-e7ef31a5d9bf', '2017级', '0', '3', '13781584007', '1', '2018-04-20 21:31:25', '校数理化竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('d51ad50b-2a9c-4af1-96d1-b46a9034e281', '孙丽慧', '1b0f4687-1970-4c7f-a1cd-f48c5a390514', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15207483180', '1', '2018-04-20 21:32:36', null, '', '0', null);
INSERT INTO `teacher` VALUES ('2133b201-f1d2-40ab-bdbe-7cfededeaa1d', '郎振坡', 'c41bee26-541d-44b2-bda0-50fbf46025d2', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18890090157', '1', '2018-04-20 21:32:57', '孔子杯二等奖，北大手拉手二等奖，全国化学竞赛二等奖，山东省数学竞赛一等奖，全国中学生英语竞赛二等奖，山东省生物竞赛三等奖，山东省物理竞赛三等奖。', '', '0', null);
INSERT INTO `teacher` VALUES ('749341e5-512b-49b0-8633-d3b35eb65c89', '王建', 'cde2d730-c400-4c05-a2f7-0641ce77a95c', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18570745467', '1', '2018-04-20 21:33:23', null, '', '0', null);
INSERT INTO `teacher` VALUES ('901397e7-c308-4344-96be-d7cef586b9c8', '郑焕然', '026496e2-2bd6-4f1a-bdf4-8894eef3487e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13278884626', '1', '2018-04-20 21:34:42', null, '', '0', null);
INSERT INTO `teacher` VALUES ('6670cbc0-c607-4d9c-ac27-71786998bd3e', '陈嘉炜', 'b610c9d3-403d-454e-9152-bba79dfbbf15', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2017级', '1', '3', '18890055753', '1', '2018-04-20 21:36:34', null, '', '0', null);
INSERT INTO `teacher` VALUES ('e464488b-f1de-4956-870a-dd94cb2994bf', '周洋', '1a61b435-f823-4fb6-974c-32fc58781fc3', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13574013693', '1', '2018-04-20 21:37:31', '市物理竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('d8f65aa6-5c6c-4d81-88b5-e52d295be54f', '吴昊挚', '66611e56-7e1d-4324-8541-471424034d80', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18907430023', '1', '2018-04-20 21:38:27', null, '', '0', null);
INSERT INTO `teacher` VALUES ('0b97264a-0693-4697-8149-77854d426700', '李正斌', '1a704e52-f3be-4485-89ef-ef91f819bced', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18773142136', '1', '2018-04-20 21:39:30', null, '', '0', null);
INSERT INTO `teacher` VALUES ('f56622b7-8284-4a17-9627-1f51bfd65992', '琳礼先', '59d45d4d-2e37-47ab-bf58-a85b68c6caca', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15364071939', '1', '2018-04-20 21:40:27', null, '', '0', null);
INSERT INTO `teacher` VALUES ('1df42cc0-1592-438e-826e-d28abd78d919', '李海慧', '1c2b84ae-a233-461b-8dd1-e7884e4c519a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '13278883523', '1', '2018-04-20 21:41:25', null, '', '0', null);
INSERT INTO `teacher` VALUES ('536b9a2d-3639-47db-b0db-30647c797296', '孙佳伟', '30742675-7ccd-4897-b596-688f56106164', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '13278881871', '1', '2018-04-20 21:55:25', null, '', '0', null);
INSERT INTO `teacher` VALUES ('ea7ff5fe-549d-4859-be9a-c11fdc44b082', '刘创', 'e36060f6-8df1-4a53-b739-6d5566bb79cd', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '13142006921', '1', '2018-04-20 21:56:27', null, '', '0', null);
INSERT INTO `teacher` VALUES ('005243df-2d73-47ba-894d-94a9b7d21b69', '戴雯', '15faf8e0-7ebe-4bfe-8f60-fc22a4326172', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15367491170', '1', '2018-04-20 21:57:28', '省英语竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('6e5a1335-c7a6-4991-b0d2-63008cafdb81', '卢俊杭', 'caf07e4d-8b2f-4978-820e-feb8881ddd57', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18670352870', '1', '2018-04-20 21:58:57', '全国数序竞赛银奖', '', '0', null);
INSERT INTO `teacher` VALUES ('77b399ae-6fdf-46f6-89c2-f30044806c96', '谢茜静', '4d8d8b2b-6b06-452e-aa1f-43154ec73d1f', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '18890091078', '1', '2018-04-20 22:00:32', '全国高中生英语竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('33b26c83-9f54-42f9-8fbd-f0d30e8ee845', '李文峤', 'db5e1a32-432b-4343-9b32-308d870a25c8', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18890091135', '1', '2018-04-20 22:01:47', null, 'oQHVE08pI1ul4oWqA3fyJzT-zjCQ', '1', null);
INSERT INTO `teacher` VALUES ('f56cb17d-fa9f-4542-a343-a6581efe123a', '郭胥璟', '79207f08-d14d-468c-ad31-5ea2421c26cb', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '17307485480', '1', '2018-04-20 22:13:44', '化学竞赛省级二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('9884a4ef-bfcd-4d4b-86b0-c42bec91e4ce', '潘耀坤', '3a080e51-7065-4ca2-870a-97034153f613', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15364071370', '1', '2018-04-20 22:14:54', '省英语竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('ae5f9bea-1939-46a2-b69a-faa761bc46cc', '熊文逸', 'fc0f036c-1813-4e3f-a7ca-0edade2d11de', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15274954381', '1', '2018-04-20 22:15:56', '全能知识竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('dbba29e9-60d9-49d1-8fb9-0b820a72d825', '陈幸', '9bd2bbcc-ac56-4d20-833b-a6a3a542175f', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18225224792', '1', '2018-04-20 22:17:01', null, '', '0', null);
INSERT INTO `teacher` VALUES ('166493a0-31a0-49e5-9374-1f80b4ebd870', '单隽媛', '898c13b4-2185-46d5-ad91-027fc5a833c6', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '13278883307', '1', '2018-04-20 22:18:04', null, '', '0', null);
INSERT INTO `teacher` VALUES ('18ea5e8c-07e9-4f47-9b26-015283909697', '陈昆鑫', 'c85f32f3-a02e-4071-9cd2-ef30808d1c41', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15243611181', '1', '2018-04-20 22:20:00', '省化学竞赛二等奖，市数学竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('df1de484-42a5-4545-bb78-ecef591a7757', '罗朝贵', '1b1e34e2-aef6-46fa-9b61-76d643c23796', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18670098595', '1', '2018-04-20 22:21:24', '初中市数学竞赛一等奖，高中区数学竞赛一等奖', 'oQHVE03oDH5NJySynOfQx6qpVJwQ', '1', null);
INSERT INTO `teacher` VALUES ('3c0a0f0c-1d55-4a07-b1bb-6f800f1a188e', '景钰皓', '527909ad-226d-43dd-934a-a08724bc18df', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '17773116402', '1', '2018-04-20 22:22:53', '高考数学148，物理、化学省竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('14fdce6c-ac93-4beb-b2e6-64a94265774b', '罗淑', '90375487-d720-4291-b291-1f0013946362', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15207495087', '1', '2018-04-20 22:23:36', null, '', '0', null);
INSERT INTO `teacher` VALUES ('14d7f954-79e6-454c-8716-491ce1c09cf7', '赵仁熙', '9927eefa-ecc4-478a-84a7-a73a1cfbc299', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2015级', '0', '3', '17375899436', '1', '2018-04-20 22:25:54', '全国高中数学联赛三等奖，中南大学数学竞赛一等奖，全国中学生物理竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('1ff09d22-eb3e-4c29-be58-531e420fb440', '蔡杨军', '09f65704-ae10-4420-b11c-f65ddf30e609', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2013级', '0', '4', '15243667610', '1', '2018-04-21 14:12:17', null, '', '0', null);
INSERT INTO `teacher` VALUES ('8d3288d3-2d12-4a30-9f1d-6d9ab1db7cc6', '李秀萍', '6724dd92-0a2d-4315-84c9-37d3eef15f7c', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '18890090201', '1', '2018-04-21 14:14:41', '湖北省数学、生物初赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('6d3a1135-9645-4bd3-8e70-a0a66254010c', '杨江波', '2b74ba7a-0be6-437b-8ef0-266e4a153010', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2015级', '0', '3', '18373152462', '1', '2018-04-21 14:17:51', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b351bd20-6eb0-428e-872b-51c9342def5c', '魏萍', '1c1b58ce-9608-42b8-9d65-12494574f260', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18890091373', '1', '2018-04-21 14:19:23', '高考英语138', '', '0', null);
INSERT INTO `teacher` VALUES ('6e8e9f14-6c78-49d9-9e2e-61f876989aad', '宋锐涛', '360f307f-cef9-4281-8d0e-22ed2d2c91d3', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18273133531', '1', '2018-04-21 14:24:06', null, '', '0', null);
INSERT INTO `teacher` VALUES ('5f53ed16-02b4-464c-8c49-43472b02ef95', '陈燕坤', '00eaff58-1485-4366-a450-bd77ef8750ba', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15974205140', '1', '2018-04-21 14:27:38', null, '', '0', null);
INSERT INTO `teacher` VALUES ('9321916c-1b48-4d88-84eb-1303b2efd648', '周咏琪', '7ab4d30f-b915-4ce0-b33b-bd44b399ce9b', 'daf91ec1-833a-466d-aebb-2f5e97f2134f', '2017级', '1', '3', '18890091206', '1', '2018-04-21 14:39:32', null, 'oQHVE07TlM35Hm1HhO9obm1EWqP4', '1', null);
INSERT INTO `teacher` VALUES ('56e1b294-41f5-4d67-b2b6-f1e108aac9e1', '郑乐天', 'e1c4d604-ea45-41cd-abe8-88fd4848d8d0', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18231222718', '1', '2018-04-21 14:41:11', null, '', '0', null);
INSERT INTO `teacher` VALUES ('bb27db25-b6b6-4de7-9545-94b26f4b5f77', '万正', '1ce6311e-8913-4477-9c9c-3372d68c8797', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2014级', '0', '3', '15173146900', '1', '2018-04-21 14:43:16', '多次获得校级、国家级奖学金，中部六省结构力学竞赛优胜奖', '', '0', null);
INSERT INTO `teacher` VALUES ('ee598657-685d-4ecd-8b1a-65ac8ceacfa9', '樊诗颖', '6b9c307e-80a2-49dc-bc9b-6e2819f07325', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '13278883347', '1', '2018-04-21 14:46:51', '全国数学竞赛二等奖，全国物理竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('4f9f68b2-1650-453d-b03f-4c0ce9943a1f', '程烽', 'fff5277f-3635-4532-a03d-bf9a3b40edc2', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '4', '18872235163', '1', '2018-04-21 14:49:36', '大学生高等数学竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('2457abef-cacb-4ae8-bbf6-fe09dadfadbc', '李思源', '5675bc8d-c09f-4b9c-8857-792fda464b06', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '4', '18569479523', '1', '2018-04-21 14:51:11', null, '', '0', null);
INSERT INTO `teacher` VALUES ('0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '黄佳诚', '7b039c76-7b06-470a-a973-27926b6350ca', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18890092175', '1', '2018-04-21 14:52:54', '全国数学、物理、化学竞赛二等奖', '', '1', null);
INSERT INTO `teacher` VALUES ('a94f769c-6f53-41ac-9347-d3dc3ba3d133', '简兴光', 'd6034346-b290-4cdd-a1d3-017997aa127d', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '18286010673', '1', '2018-04-21 14:54:16', null, '', '0', null);
INSERT INTO `teacher` VALUES ('258bebfc-d51d-43e7-adc8-168f9893a148', '张思敏', '38aa010d-b0df-4281-90e3-d1e05f32b5a4', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '133316144178', '1', '2018-04-21 14:59:09', '全国英语竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('ef999b86-7bd1-4a7b-ace4-67bcb1743116', '姚金甫', '590561c8-ec90-4561-b595-e992788600f2', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18919974601', '1', '2018-04-21 15:04:09', null, '', '0', null);
INSERT INTO `teacher` VALUES ('597bb907-35d2-499a-847e-634c245617d4', '陈俊骐', '5248456e-db61-456f-a09d-675d66557713', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2017级', '0', '3', '13278880740', '1', '2018-04-21 15:05:25', null, '', '0', null);
INSERT INTO `teacher` VALUES ('dfeb9a99-cfca-4c3d-8164-d744ca740dad', '卿旭东', '8000daab-4b9e-415f-b896-51db7b8bb4f1', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13364095520', '1', '2018-04-21 15:06:49', null, '', '0', null);
INSERT INTO `teacher` VALUES ('3bf3f815-9fbe-4796-9e8a-0d8e344f1e0a', '岳弘', '6fc1ccd0-9f5a-492b-944b-c42b79295b9a', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '17343620482', '1', '2018-04-21 15:07:58', '高考数学147', '', '0', null);
INSERT INTO `teacher` VALUES ('ec43a3c7-455e-421d-8be1-4417109c9f81', '左灿灿', '3aa3f56c-46f1-4157-a12f-7232062cf5c1', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15274928081', '1', '2018-04-21 15:09:59', '全国英语竞赛一等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('6857d413-bcb8-4fa9-8db0-f3c289b9f814', '马豪杰', '4fd514df-ce99-4f4a-8be6-8b72ebb98ccd', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2015级', '0', '3', '15938552770', '1', '2018-04-21 15:10:50', null, '', '0', null);
INSERT INTO `teacher` VALUES ('a7325109-9f8e-4add-a5d2-eb9aba26455e', '戴凌雪', 'e061ffab-bc87-46f2-a708-3e1f08371959', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '15200866485', '1', '2018-04-21 15:12:02', null, '', '0', null);
INSERT INTO `teacher` VALUES ('b2522619-2cac-4cb1-bf9f-590620f3b292', '程泽宇', 'beb4cac0-41de-4a5b-b92e-06b505f6258e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13278882796', '1', '2018-04-21 15:14:00', '全国化学竞赛一等奖，全国生物竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('c003c309-717b-4f67-9bbd-06b1621cfe04', '向诗淯', 'b0809c6d-25e6-472a-b07a-112c0c84aeb7', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '4', '18890099818', '1', '2018-04-21 15:15:52', '大学生全国英语竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('0d6da146-0efb-4c41-9d55-537e03354512', '张望临', '825265cd-942d-44ac-8c69-f981b67b4d9b', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15029716957', '1', '2018-04-21 15:17:10', null, '', '0', null);
INSERT INTO `teacher` VALUES ('138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '任波', 'eec86e90-e870-4ce8-a9d7-4c4a64a0fbc0', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '4', '15309635998', '1', '2018-04-21 15:48:12', null, 'oQHVE09AdXSUu--sVPZjmf5CBHk0', '1', null);
INSERT INTO `teacher` VALUES ('49764f88-ea5d-4ac9-8e83-93b1a4bec592', '夏余宏烨', 'ba73f2b8-0634-41db-95b1-f4f0a7ae361e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18711000934', '1', '2018-04-21 15:50:53', null, '', '0', null);
INSERT INTO `teacher` VALUES ('2675dfb2-4d24-4be6-bb78-b699c6d966bd', '常铭杰', '4a560d16-88ca-42d3-8ff9-9731f340a3b2', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2017级', '0', '3', '18293225005', '1', '2018-04-21 15:52:25', null, '', '0', null);
INSERT INTO `teacher` VALUES ('e50c4e7d-0528-440b-81d8-4bdc3087d6c9', '黄雅丽', 'e4d5f5be-e490-45c7-ad0e-00cd8b02c7fa', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '17307410494', '1', '2018-04-21 15:53:52', '省化学竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('d017153c-b40c-4324-9430-23f023c90878', '李杰', 'bc7a3bcf-6e4c-4fbf-bc4e-193892059fe4', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '4', '18182120921', '1', '2018-04-21 15:54:45', null, '', '1', null);
INSERT INTO `teacher` VALUES ('f1db1e06-92b4-4f94-902d-5503e6cb1a02', '莫文涛', 'da13fcaf-358d-47c6-afa7-16ae02fbf335', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13278883791', '1', '2018-04-21 17:18:28', null, '', '1', null);
INSERT INTO `teacher` VALUES ('481db1db-22aa-471a-b321-b69143da727f', '高天宇', '4053f29a-515f-4690-b172-9bc336524779', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '13853155413', '1', '2018-04-21 21:02:20', null, 'oQHVE06C4GtainlytUNZ8nWRdzQ0', '1', null);
INSERT INTO `teacher` VALUES ('f1abcf69-52aa-4494-9558-ed744736cad5', '杜家鑫', '8015927c-42fb-432d-9d0c-3fd213ea4098', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '15200943859', '1', '2018-04-24 18:08:01', null, '', '1', null);
INSERT INTO `teacher` VALUES ('4431c60d-42e9-4d62-80c8-0347bec378c2', '佘俊霖', 'e472448f-658f-44c1-8006-b44ef078d5c7', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '17307409636', '1', '2018-04-24 21:35:56', '初中英语竞赛二等奖、高中化学竞赛三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('d8e1ff3e-56b4-4e75-8c80-88128501f979', '杨乔洪', '1958010b-4330-4d62-b05b-264a56da66fb', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '15211042028', '1', '2018-04-26 10:34:14', null, '', '0', null);
INSERT INTO `teacher` VALUES ('26a14c77-fa20-4e16-b357-104db8706dae', '叶超宏', 'b091ae82-867c-4a00-8b56-b81f94391ccc', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2016级', '0', '3', '15878011639', '1', '2018-04-26 15:34:09', null, '', '0', null);
INSERT INTO `teacher` VALUES ('3695ca9f-0e7d-44f7-8734-7febfd8cdcca', '许嘉伦', 'c14ed53d-baed-42c4-9c5a-a953f3e4d531', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '15084804664', '1', '2018-04-26 17:04:20', '', '', '0', null);
INSERT INTO `teacher` VALUES ('cb21b2fb-71eb-445f-9b5a-03b97ac7395d', '钟心怡', '2ddd325e-cbe0-4e65-bf01-c1caf2c3f1c1', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18774843731', '1', '2018-04-26 17:05:22', '英语，数学，高中物理二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('b7f5a0ba-8b98-4374-acc9-7cc68cccf32a', '孙娜', '46100742-108f-4f78-b188-60bf165f935e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '15200904780', '1', '2018-04-26 17:08:59', '擅长数学英语理综', '', '0', null);
INSERT INTO `teacher` VALUES ('aca97cbf-f62b-40f1-91a3-00593b0bb256', '冯书颖', 'dc703361-57a4-461c-a2b7-66517c16fd41', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18774930131', '1', '2018-04-26 19:50:13', '擅长数学 物理', '', '0', null);
INSERT INTO `teacher` VALUES ('34ce2ee0-f9d9-407d-98b5-295574d8c9a3', '肖灿', '9be1f647-8816-42da-9f3d-1eef6692384e', 'cefade04-5a72-4b8d-83d1-6c912cebe56e', '2016级', '0', '3', '13548505609', '1', '2018-04-27 11:29:28', '省化学竞赛二等奖', 'oQHVE0zq47_dKjv8eMjS8bO2bcoY', '1', null);
INSERT INTO `teacher` VALUES ('ff034821-65ee-4c46-8699-66214b1bb7af', '苏栋', '13f5beb5-7a1e-4cad-b0ec-2e71b98efef8', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '0', '3', '18773194631', '1', '2018-04-28 12:35:22', '擅长数学', 'oQHVE0yNiHXzioG1rbMSIsxxULA0', '1', null);
INSERT INTO `teacher` VALUES ('7050eeca-8ba4-49dd-8183-fdd6772c8af2', '刘家乐', 'cfcc229f-f6ba-43f8-864e-eac7c2a476cb', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', null, '3', '15274902186', '1', '2018-04-28 14:04:35', '擅长数学，物理，化学', '', '0', null);
INSERT INTO `teacher` VALUES ('e950d516-2043-480c-9866-95d2006bca96', '龙涛', '09ca2ee4-a760-411f-b7ef-78c5a71dc53b', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13278884104', '1', '2018-04-28 18:21:32', '生物竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('d106cf52-23ea-4d13-a25f-06e0bdc4081a', '龙宇涵', '7b505448-719f-4b2e-985c-0cf7a7b23404', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15211007497', '1', '2018-04-28 18:23:24', '中考数学满分', '', '0', null);
INSERT INTO `teacher` VALUES ('bca914c3-3bb1-46b4-9656-25b21011e4d6', '王琪琪', 'edc99019-9731-4870-8477-f9424bdaa673', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15200867381', '1', '2018-04-28 18:25:48', '中考全区第二名，全国青少年信息省三等奖，全国中学生英语竞赛省三等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('e1dcfb4b-514b-4821-8784-9320a4d8e8cf', '杨鑫', '8f257b3d-81b0-4613-a0a5-05f72c3e36f6', 'edd22124-49da-485d-af5d-9d195034a54c', '2014级', '0', '3', '15927580249', '1', '2018-04-28 18:26:40', null, '', '0', null);
INSERT INTO `teacher` VALUES ('1d3d3525-7dcd-4bf0-9b42-787fa94ec052', '邸卓瑞', '65b012cd-1e4f-48fd-b48a-8f0d89ba7c6e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '18035059033', '1', '2018-04-29 12:30:53', null, '', '0', null);
INSERT INTO `teacher` VALUES ('48931aa9-b9dc-47af-b19c-dc4af5632c90', '蒋笑冰', '3081a2e3-948c-4755-a3ea-6ec1bd6202c4', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '1', '3', '15274858182', '1', '2018-05-01 12:55:23', null, 'oQHVE01KiHrOOamnXGxy4iw_Lxxc', '1', null);
INSERT INTO `teacher` VALUES ('e28feeb4-ef72-4a4e-aadb-58c087a6f4f4', '张佳琪', 'b727d029-ef4a-4e75-abf6-764012a8ba92', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '13278886863', '1', '2018-05-01 14:51:01', null, '', '1', null);
INSERT INTO `teacher` VALUES ('d22d378c-aaf4-41e6-a170-dbfc23fcc303', '方圆', '6faadb06-4301-4166-8e9c-74d07c23339f', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2016级', '1', '3', '17388904974', '1', '2018-05-01 15:15:24', '征文比赛二等奖，英语演讲比赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('3705618e-f34e-4fda-b201-829fd404adc6', null, '9c6b3c34-10a0-45de-9720-68ea46b6133f', '294479b3-7143-436b-8927-1670e38cc7cf', null, null, null, null, null, '2018-05-01 15:15:25', null, '', '0', null);
INSERT INTO `teacher` VALUES ('f0a4d005-f4b5-405c-9233-60319935d16c', '韩志林', '6a49a4b4-671c-4d67-aa58-970fa19d4a9d', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15997035742', '1', '2018-05-01 15:18:47', '全国数学竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('df981b96-0216-49be-837f-7b72fadfacb0', '谭兵', '40e4c065-27df-47fb-9bf4-96ed1305de4f', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13325698690', '1', '2018-05-01 15:23:47', null, '', '0', null);
INSERT INTO `teacher` VALUES ('4cfd7102-5623-4021-b929-a684ce057800', '王帅康', '68fa02ce-0349-4c5d-8290-cc6485bf269e', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '13278883092', '1', '2018-05-01 15:24:44', '物理竞赛二等奖', '', '0', null);
INSERT INTO `teacher` VALUES ('8ecacf96-2374-4a45-ade6-2b2e9850cab5', '高帅', '0b4f086f-d4f4-4baa-8cba-35e41b2c54ec', 'ebf25a54-909a-4c1d-b473-3263e5f43499', '2017级', '0', '3', '15211060083', '1', '2018-05-01 15:26:15', null, '', '0', null);

-- ----------------------------
-- Table structure for teacher_les_r
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
INSERT INTO `teacher_les_r` VALUES ('1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '2');
INSERT INTO `teacher_les_r` VALUES ('fcf44ea2-6752-4f6d-84bd-3eb8f3b4295a', '06b3e395-0bde-43cc-b26e-68076de7dfc1', '2');
INSERT INTO `teacher_les_r` VALUES ('2958a37f-63b0-43ae-a608-1dbc06565d7e', '0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '2');
INSERT INTO `teacher_les_r` VALUES ('ca629310-5a4f-4fa9-bca2-d42c642935ce', '138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '3');
INSERT INTO `teacher_les_r` VALUES ('b852d275-4b27-49b0-803b-9e473007aadc', '143a318e-56f1-4237-a47f-0c31c7853ce4', '2');
INSERT INTO `teacher_les_r` VALUES ('31464416-5264-4c76-b092-1f9fbd9492b6', '150ee67b-967a-42d4-9e35-1ca1288624ec', '8');
INSERT INTO `teacher_les_r` VALUES ('f558d3cb-3858-44de-aece-19b4ffc45396', '16684d26-3d14-45ff-8c3f-112d739be006', '2');
INSERT INTO `teacher_les_r` VALUES ('39a82af9-6cdf-4b92-b0ad-2af75eb02564', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '2');
INSERT INTO `teacher_les_r` VALUES ('92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '2');
INSERT INTO `teacher_les_r` VALUES ('1338d07a-9243-4d1f-81d0-f7dbd35c30d4', '19115f9c-d7d6-4415-baab-27cb4973ce98', '2');
INSERT INTO `teacher_les_r` VALUES ('2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '19115f9c-d7d6-4415-baab-27cb4973ce98', '8');
INSERT INTO `teacher_les_r` VALUES ('5ecb88ae-a8f4-4466-9d98-65cc7a0e1df3', '1d3d3525-7dcd-4bf0-9b42-787fa94ec052', '1');
INSERT INTO `teacher_les_r` VALUES ('7d2fafdf-59a7-42e8-9b5f-ad6ecc77c635', '1ff09d22-eb3e-4c29-be58-531e420fb440', '7');
INSERT INTO `teacher_les_r` VALUES ('fcccc383-5a44-4683-b62c-b448f5c379e8', '2133b201-f1d2-40ab-bdbe-7cfededeaa1d', '8');
INSERT INTO `teacher_les_r` VALUES ('e3ff9924-100d-4a58-bbca-54d2fad68f69', '2317d1b6-f84d-4633-bc8c-97caaff69e16', '2');
INSERT INTO `teacher_les_r` VALUES ('5a88004b-a6ed-4463-aa35-33f6befbff13', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '2');
INSERT INTO `teacher_les_r` VALUES ('5e9be195-5683-446e-a03f-7f45b50f5f2b', '24652540-af54-4120-abc8-79d166778f82', '1');
INSERT INTO `teacher_les_r` VALUES ('260d90c3-929d-4407-ad6a-272afc660212', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO `teacher_les_r` VALUES ('3bf0d502-f4c7-4c3c-ad03-53284868dc0a', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO `teacher_les_r` VALUES ('7f566938-d95e-4c4b-b536-4ec72287862a', '24652540-af54-4120-abc8-79d166778f82', '2');
INSERT INTO `teacher_les_r` VALUES ('1f8743ea-6823-49db-bb78-30df932c44d0', '24652540-af54-4120-abc8-79d166778f82', '8');
INSERT INTO `teacher_les_r` VALUES ('a93762e3-28ab-46b2-9793-8c73229268ca', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '2');
INSERT INTO `teacher_les_r` VALUES ('5643eb54-af69-48f5-8680-37c8a9076677', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '7');
INSERT INTO `teacher_les_r` VALUES ('8ecacfdd-351a-4381-bf5c-29bf8a815a88', '27b5a1a7-624f-40e1-9359-9196d0261133', '7');
INSERT INTO `teacher_les_r` VALUES ('f371aeda-adc3-4cd6-9da2-aca6e5509aa7', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '7');
INSERT INTO `teacher_les_r` VALUES ('72d7b5fe-d664-421d-9ac5-9e9f9bc6fe82', '2c64d354-e9db-441d-8271-061d46813abb', '7');
INSERT INTO `teacher_les_r` VALUES ('8fd5a867-cf4b-4163-889e-e0778641a4a5', '2d3829b4-17b3-46af-bf50-cd0eba5430f8', '1');
INSERT INTO `teacher_les_r` VALUES ('a4272eba-cc9c-40da-9e9e-a7b9662a46f3', '2d3829b4-17b3-46af-bf50-cd0eba5430f8', '2');
INSERT INTO `teacher_les_r` VALUES ('b66a90f4-e5a6-4ba5-a64c-85221ae34828', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '7');
INSERT INTO `teacher_les_r` VALUES ('b091fd8c-2d36-49fd-848b-d79e48051330', '33b26c83-9f54-42f9-8fbd-f0d30e8ee845', '3');
INSERT INTO `teacher_les_r` VALUES ('83f9a61a-20b5-4b22-a2ac-b173e5962951', '34ce2ee0-f9d9-407d-98b5-295574d8c9a3', '2');
INSERT INTO `teacher_les_r` VALUES ('faf95a49-dc0b-49c4-a24e-be34c61e622f', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '2');
INSERT INTO `teacher_les_r` VALUES ('ded7ab44-98ea-4eff-b893-3ab04630129e', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '2');
INSERT INTO `teacher_les_r` VALUES ('1fdaed91-897f-4310-9a25-8679e482e2b6', '3f26b978-1499-4da6-bb18-42750bafc010', '1');
INSERT INTO `teacher_les_r` VALUES ('8426c300-a528-4318-8983-4fd19f3f0ff0', '41816287-35ca-4235-bc89-ba2a2cb4abe1', '3');
INSERT INTO `teacher_les_r` VALUES ('c6c96bcb-068b-4c03-af6b-9a855737bffd', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '3');
INSERT INTO `teacher_les_r` VALUES ('d8284412-4b3d-413c-88f3-d5c913f5df4f', '44cd5d75-722e-4c03-ac2a-360e5447b97f', '3');
INSERT INTO `teacher_les_r` VALUES ('d1614c47-e200-4dcd-afc9-3b47b23fae37', '481db1db-22aa-471a-b321-b69143da727f', '3');
INSERT INTO `teacher_les_r` VALUES ('c4687b90-59ee-490e-ad3c-19c1ac078a6d', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '4');
INSERT INTO `teacher_les_r` VALUES ('4b55391a-dfea-4eee-a7b8-c80b1a9efb7f', '48f3736e-a5d3-436e-ad4e-200646f8a6b7', '7');
INSERT INTO `teacher_les_r` VALUES ('d2f559b6-6611-4296-b46c-465e2a7f018a', '48f3736e-a5d3-436e-ad4e-200646f8a6b7', '7');
INSERT INTO `teacher_les_r` VALUES ('825e99fc-f124-44c9-8170-33615b919da1', '51669f73-2654-42db-a7d3-8c51c430a564', '2');
INSERT INTO `teacher_les_r` VALUES ('f849cbc7-5943-4710-b614-8f8cffd304e5', '537f3647-8444-4525-94c9-5af57c3f55e8', '3');
INSERT INTO `teacher_les_r` VALUES ('b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '3');
INSERT INTO `teacher_les_r` VALUES ('eb16769b-010f-4f88-ae0b-4e0cb99086f0', '58a28496-ac22-42cb-991e-899bc221076e', '2');
INSERT INTO `teacher_les_r` VALUES ('2e858069-8e55-45b6-9bdd-725eece0438b', '5f53edf6-079a-4874-8e86-4c48d14a268e', '8');
INSERT INTO `teacher_les_r` VALUES ('f6dc4acc-f4d7-4aaf-b134-d818877620c9', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '2');
INSERT INTO `teacher_les_r` VALUES ('60f60bee-3cc0-45e5-ab06-1fdc359f744d', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '7');
INSERT INTO `teacher_les_r` VALUES ('88952680-bedf-47cc-86ed-8d61aa95abb7', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '2');
INSERT INTO `teacher_les_r` VALUES ('8d5fa78f-c3fb-48e7-9441-046d55522dc7', '6620857b-7472-4960-a7f7-870244cad689', '7');
INSERT INTO `teacher_les_r` VALUES ('eb2a92df-b5b0-4f0e-9f6c-e26c17015ce2', '69c5fa24-b1c3-4553-a0a9-51fa6c819c61', '2');
INSERT INTO `teacher_les_r` VALUES ('b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '6c7dae17-0dcb-4263-89b2-ae255883c682', '2');
INSERT INTO `teacher_les_r` VALUES ('e458b0fb-7bde-4e3f-badd-d6e32f270bfd', '6ee9e5c1-3cf8-46ce-b68f-d92fdb9138fe', '2');
INSERT INTO `teacher_les_r` VALUES ('a9be6da1-71d3-4437-b617-4ce283c0d587', '73818668-89b4-4f28-b928-6b454641aaae', '3');
INSERT INTO `teacher_les_r` VALUES ('5a422905-d4ca-437e-a760-f67a8d556e18', '749341e5-512b-49b0-8633-d3b35eb65c89', '9');
INSERT INTO `teacher_les_r` VALUES ('dd7f3ed4-6b89-484f-af84-275df6c719a7', '76a6c3d8-ef83-4fb7-bd5c-b27c47eccf02', '3');
INSERT INTO `teacher_les_r` VALUES ('562f12cf-b532-44b1-8d55-dd55e8211fed', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '1');
INSERT INTO `teacher_les_r` VALUES ('f42c23d6-7845-4509-8fab-1fcaf335e47f', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '1');
INSERT INTO `teacher_les_r` VALUES ('a6ac0da9-14dc-48c1-91ef-fd00cf86eb04', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '9');
INSERT INTO `teacher_les_r` VALUES ('5814d9fa-49fb-44ab-9304-70245d4f6836', '771d1e22-ae10-46fc-92af-e7eb2df326b4', '3');
INSERT INTO `teacher_les_r` VALUES ('4b99627f-fdf6-4325-a3d6-f5c83a421706', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '3');
INSERT INTO `teacher_les_r` VALUES ('b3406a31-d46f-490b-ae07-611568f28075', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '3');
INSERT INTO `teacher_les_r` VALUES ('70274abd-1daa-4340-bf40-a76546da5c18', '7ae86dca-93bd-4f69-b00a-66447de5ec35', '2');
INSERT INTO `teacher_les_r` VALUES ('dda4ead0-a980-4949-831b-58ce3d85c11c', '7ae86dca-93bd-4f69-b00a-66447de5ec35', '7');
INSERT INTO `teacher_les_r` VALUES ('98efdd46-b5b6-414c-9c31-56320515f91d', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '2');
INSERT INTO `teacher_les_r` VALUES ('425e3aab-b0d2-4521-b858-0a70509b5d9e', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '2');
INSERT INTO `teacher_les_r` VALUES ('046b4cdf-9682-4bfd-b1e5-660e1bdc3494', '853a2f31-f902-489c-8b7c-bea062277833', '3');
INSERT INTO `teacher_les_r` VALUES ('f926d599-de1a-4b81-8343-9833c57a0882', '853a2f31-f902-489c-8b7c-bea062277833', '3');
INSERT INTO `teacher_les_r` VALUES ('6a2f9398-4577-4d5c-925c-b32352714ad2', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '7');
INSERT INTO `teacher_les_r` VALUES ('fc75dcbc-47fd-4658-938b-d6fbbc5ddf4f', '878cf7d9-1888-40fc-871f-89f3687b34b8', '2');
INSERT INTO `teacher_les_r` VALUES ('a9c85356-8a45-41e7-9cdd-ef4ab92cb3c9', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '2');
INSERT INTO `teacher_les_r` VALUES ('acff1cb9-18a5-4963-976c-04dd78f1031b', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '2');
INSERT INTO `teacher_les_r` VALUES ('f30382e7-5793-41c0-a015-6d805cd5b600', '901397e7-c308-4344-96be-d7cef586b9c8', '2');
INSERT INTO `teacher_les_r` VALUES ('4ba8c060-9f43-4d91-8c5f-bf1034009612', '9321916c-1b48-4d88-84eb-1303b2efd648', '2');
INSERT INTO `teacher_les_r` VALUES ('6885bf52-bf18-41a9-ace3-fd81bad807f2', '994d9e91-ced6-4f21-a8ec-ceab54d904a8', '2');
INSERT INTO `teacher_les_r` VALUES ('9c7678dc-bcc0-4221-8cb9-47f9f9e92217', '9e761589-bc5c-4e31-beab-913b56a87302', '1');
INSERT INTO `teacher_les_r` VALUES ('4106e469-d4e3-4069-b8db-b4cd7b8879e4', 'a295affa-be14-48e3-aece-dfad1ea22b6a', '2');
INSERT INTO `teacher_les_r` VALUES ('9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', '1');
INSERT INTO `teacher_les_r` VALUES ('5af60a58-368f-4d40-b522-49a685f977d8', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '2');
INSERT INTO `teacher_les_r` VALUES ('5bdd1587-c65e-4c95-84b0-1c83be168446', 'a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '2');
INSERT INTO `teacher_les_r` VALUES ('f135f396-3b40-4a3c-82d7-6fec63a24220', 'a5600e67-5b20-435d-ad17-43ad3a9c9b58', '9');
INSERT INTO `teacher_les_r` VALUES ('2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '2');
INSERT INTO `teacher_les_r` VALUES ('7c3cbd28-fcc4-4b56-bcf4-8cfca9d1bf01', 'ac37a69a-8f81-4f35-950d-44586364969b', '8');
INSERT INTO `teacher_les_r` VALUES ('37e49b33-f12a-4693-9e11-aed0bf39f981', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '1');
INSERT INTO `teacher_les_r` VALUES ('3e9162a0-a70e-4bef-905a-a40c0ba0df2a', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '2');
INSERT INTO `teacher_les_r` VALUES ('a4dbc41f-3d29-4629-9d6d-1a3ff201eede', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '2');
INSERT INTO `teacher_les_r` VALUES ('27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '3');
INSERT INTO `teacher_les_r` VALUES ('e0b3d132-d720-4961-a8b2-c506466c87a6', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '7');
INSERT INTO `teacher_les_r` VALUES ('cd187583-5d30-4727-b352-60e6e84c2036', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '7');
INSERT INTO `teacher_les_r` VALUES ('a646c89d-0442-4e25-9c45-5b9eff323b1d', 'b114c3e9-e426-47f2-9b7d-d2e40cde5135', '2');
INSERT INTO `teacher_les_r` VALUES ('ed167607-0082-48fa-bb0e-1ab0acdc60bd', 'b13c5b94-b066-44af-b4c4-145c9d8612a0', '7');
INSERT INTO `teacher_les_r` VALUES ('e10d87f4-b1eb-4b93-b46c-153cd988a403', 'b21addc3-003c-42be-afaa-ab7064d6e144', '3');
INSERT INTO `teacher_les_r` VALUES ('3f62df1a-7ce8-4d41-9476-aec52a3c267d', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '3');
INSERT INTO `teacher_les_r` VALUES ('346bf9b1-3cc7-436c-a08a-e4afb2891f21', 'b7f5a0ba-8b98-4374-acc9-7cc68cccf32a', '3');
INSERT INTO `teacher_les_r` VALUES ('2005fb38-1aff-4750-860c-5ab7ec146159', 'b8ef7e22-3952-403d-af92-dfdcbe250073', '2');
INSERT INTO `teacher_les_r` VALUES ('bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '2');
INSERT INTO `teacher_les_r` VALUES ('f2eff1fa-55b8-4a6b-8d24-59773b22d648', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '7');
INSERT INTO `teacher_les_r` VALUES ('3b7435ef-5564-4501-8ed7-49ce14572ab0', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '2');
INSERT INTO `teacher_les_r` VALUES ('6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '3');
INSERT INTO `teacher_les_r` VALUES ('9853b5e5-8c2a-415f-9ff6-3ee60ed31ba5', 'cbe83e91-b829-4dd8-b852-e1937c450fe9', '8');
INSERT INTO `teacher_les_r` VALUES ('7f1832d8-58ae-42fa-be61-eabead92fb65', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '8');
INSERT INTO `teacher_les_r` VALUES ('fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '9');
INSERT INTO `teacher_les_r` VALUES ('748ac459-aca8-4b9a-b792-e3aaf09a8e23', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '1');
INSERT INTO `teacher_les_r` VALUES ('ef0127fa-d324-40ca-864a-5e411dc6e292', 'd33b37fe-fbcf-461c-bf89-d4ae7b12cfbf', '1');
INSERT INTO `teacher_les_r` VALUES ('965f2dae-5f9c-44e4-b112-a2e95d145caa', 'd41c79a8-faee-4a45-a5f0-537b6174e202', '2');
INSERT INTO `teacher_les_r` VALUES ('f4ce4f4a-6a74-4d5a-a790-6e761cd74f4b', 'd63a2009-f036-4e70-a4f0-a56988aeb0d1', '9');
INSERT INTO `teacher_les_r` VALUES ('61290e17-dae0-4829-8d7f-dd9592170429', 'd8e1ff3e-56b4-4e75-8c80-88128501f979', '7');
INSERT INTO `teacher_les_r` VALUES ('e0e6bef2-788d-46d2-a932-ca45c282295f', 'da2f806c-7f57-4318-894a-c10a217ff92c', '2');
INSERT INTO `teacher_les_r` VALUES ('487bd9a3-57b1-4583-8802-f614c2ded24e', 'db66fd38-466a-4620-9890-6abb10a67a22', '8');
INSERT INTO `teacher_les_r` VALUES ('a138d70f-1d1c-4125-8ced-6d439e62c9dd', 'db66fd38-466a-4620-9890-6abb10a67a22', '8');
INSERT INTO `teacher_les_r` VALUES ('527d5d96-6323-4dc4-957d-961f99aa89a6', 'dbba29e9-60d9-49d1-8fb9-0b820a72d825', '3');
INSERT INTO `teacher_les_r` VALUES ('b56826ad-23bb-4162-8c5c-6cd7cf516889', 'dc9620b4-021a-4809-a238-7f83c80b636b', '2');
INSERT INTO `teacher_les_r` VALUES ('8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '1');
INSERT INTO `teacher_les_r` VALUES ('9a6f431b-e8b9-4491-b4e8-1ed309cd16be', 'df1de484-42a5-4545-bb78-ecef591a7757', '2');
INSERT INTO `teacher_les_r` VALUES ('8ba8231a-f97a-462a-9e66-2d51a60bdffd', 'dff9942a-9857-4949-bed4-84aab3ebd856', '1');
INSERT INTO `teacher_les_r` VALUES ('7017346c-ff3f-4f42-9a40-e92dc324ef19', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '8');
INSERT INTO `teacher_les_r` VALUES ('9b6d689e-8671-4ee0-81f1-6cc27981b9c6', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '1');
INSERT INTO `teacher_les_r` VALUES ('63aa4adc-bf6f-49c2-8164-f93bf08df35e', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '3');
INSERT INTO `teacher_les_r` VALUES ('e497b4ec-2aea-4dde-8022-398563cace59', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '3');
INSERT INTO `teacher_les_r` VALUES ('d7eb7185-cfa1-4e18-b0ee-400b78264e84', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '9');
INSERT INTO `teacher_les_r` VALUES ('5a978ecd-96da-4eae-b3f5-8706fcb3792e', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b', '2');
INSERT INTO `teacher_les_r` VALUES ('4d309b83-f780-4e70-9aaa-399c086cff52', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '7');
INSERT INTO `teacher_les_r` VALUES ('d5d6e446-a790-46b7-a32c-c66c23f3a675', 'ee68eb0f-d789-4e2f-9196-d77e8d3694fa', '8');
INSERT INTO `teacher_les_r` VALUES ('193b33c9-b67a-4369-83e2-e4c393c55a3e', 'f1db1e06-92b4-4f94-902d-5503e6cb1a02', '2');
INSERT INTO `teacher_les_r` VALUES ('ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '2');
INSERT INTO `teacher_les_r` VALUES ('5bf11ef7-d53e-47ff-a57e-e18aed22910f', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '1');
INSERT INTO `teacher_les_r` VALUES ('236bc37a-989e-4469-a29f-f8b476f64045', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '2');
INSERT INTO `teacher_les_r` VALUES ('af860c61-0ddc-42ff-af37-9e08cd039120', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '3');
INSERT INTO `teacher_les_r` VALUES ('c37a2e10-70ac-4d73-b65e-1327d3c5628f', 'f5603b6f-5ba8-435e-b4b5-3b9dc580dfda', '3');
INSERT INTO `teacher_les_r` VALUES ('461e6bdd-9a65-4fa5-bda8-6350684f77f4', 'f56622b7-8284-4a17-9627-1f51bfd65992', '7');
INSERT INTO `teacher_les_r` VALUES ('b18c2e01-544d-4e2b-bd41-3772c57c6976', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '2');
INSERT INTO `teacher_les_r` VALUES ('bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '2');
INSERT INTO `teacher_les_r` VALUES ('2d72270f-f8fe-4a24-93b2-885e8f8f5463', 'ffb18612-b184-4291-b49f-5336cf8a913b', '1');
INSERT INTO `teacher_les_r` VALUES ('78b8f787-05df-4ad1-bdcb-466804c52dd4', 'ffb18612-b184-4291-b49f-5336cf8a913b', '1');
INSERT INTO `teacher_les_r` VALUES ('dde3612a-990b-43e8-8ebb-02123e838cc1', 'ffb18612-b184-4291-b49f-5336cf8a913b', '2');
INSERT INTO `teacher_les_r` VALUES ('5a657d14-c207-411d-8bdf-cf6cb8e0db70', 'ffb18612-b184-4291-b49f-5336cf8a913b', '3');
INSERT INTO `teacher_les_r` VALUES ('6380cb70-c25e-4077-a2ff-b0f65449e08b', 'ffb18612-b184-4291-b49f-5336cf8a913b', '3');
INSERT INTO `teacher_les_r` VALUES ('322e7938-af42-48ec-9fb9-8bd4a66c316c', 'ffb18612-b184-4291-b49f-5336cf8a913b', '5');
INSERT INTO `teacher_les_r` VALUES ('a7aeab52-e5fb-4a4a-8418-6f62e2fcb3d9', 'ffb18612-b184-4291-b49f-5336cf8a913b', '5');
INSERT INTO `teacher_les_r` VALUES ('ed49c2bd-76cd-4716-a692-ab32a84c7c56', 'ffb18612-b184-4291-b49f-5336cf8a913b', '6');
INSERT INTO `teacher_les_r` VALUES ('ff6cf303-ec72-44ee-942f-9c45833f11e0', 'ffb18612-b184-4291-b49f-5336cf8a913b', '9');

-- ----------------------------
-- Table structure for teacher_pay_list
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
INSERT INTO `teacher_pay_list` VALUES ('-111', '-1', '差', '40');
INSERT INTO `teacher_pay_list` VALUES ('-111', '0', '一般', '43');
INSERT INTO `teacher_pay_list` VALUES ('-111', '1', '满意', '45');
INSERT INTO `teacher_pay_list` VALUES ('111', '-1', '差', '35');
INSERT INTO `teacher_pay_list` VALUES ('111', '0', '一般', '38');
INSERT INTO `teacher_pay_list` VALUES ('111', '1', '满意', '40');
INSERT INTO `teacher_pay_list` VALUES ('-161', '-1', '差', '40');
INSERT INTO `teacher_pay_list` VALUES ('-161', '0', '一般', '43');
INSERT INTO `teacher_pay_list` VALUES ('-161', '1', '满意', '45');
INSERT INTO `teacher_pay_list` VALUES ('161', '-1', '差', '1');
INSERT INTO `teacher_pay_list` VALUES ('161', '0', '一般', '1');
INSERT INTO `teacher_pay_list` VALUES ('161', '1', '满意', '1');
INSERT INTO `teacher_pay_list` VALUES ('-211', '-1', '差', '50');
INSERT INTO `teacher_pay_list` VALUES ('-211', '0', '一般', '53');
INSERT INTO `teacher_pay_list` VALUES ('-211', '1', '满意', '55');
INSERT INTO `teacher_pay_list` VALUES ('211', '-1', '差', '45');
INSERT INTO `teacher_pay_list` VALUES ('211', '0', '一般', '48');
INSERT INTO `teacher_pay_list` VALUES ('211', '1', '满意', '50');
INSERT INTO `teacher_pay_list` VALUES ('-231', '-1', '差', '50');
INSERT INTO `teacher_pay_list` VALUES ('-231', '0', '一般', '53');
INSERT INTO `teacher_pay_list` VALUES ('-231', '1', '满意', '55');
INSERT INTO `teacher_pay_list` VALUES ('231', '-1', '差', '45');
INSERT INTO `teacher_pay_list` VALUES ('231', '0', '一般', '48');
INSERT INTO `teacher_pay_list` VALUES ('231', '1', '满意', '50');
INSERT INTO `teacher_pay_list` VALUES ('-311', '-1', '差', '70');
INSERT INTO `teacher_pay_list` VALUES ('-311', '0', '一般', '73');
INSERT INTO `teacher_pay_list` VALUES ('-311', '1', '满意', '75');
INSERT INTO `teacher_pay_list` VALUES ('311', '-1', '差', '65');
INSERT INTO `teacher_pay_list` VALUES ('311', '0', '一般', '68');
INSERT INTO `teacher_pay_list` VALUES ('311', '1', '满意', '70');
INSERT INTO `teacher_pay_list` VALUES ('-331', '-1', '差', '70');
INSERT INTO `teacher_pay_list` VALUES ('-331', '0', '一般', '73');
INSERT INTO `teacher_pay_list` VALUES ('-331', '1', '满意', '75');
INSERT INTO `teacher_pay_list` VALUES ('331', '-1', '差', '65');
INSERT INTO `teacher_pay_list` VALUES ('331', '0', '一般', '68');
INSERT INTO `teacher_pay_list` VALUES ('331', '1', '满意', '70');

-- ----------------------------
-- Table structure for teachingrecord
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
INSERT INTO `teachingrecord` VALUES ('42e3caab-b0b5-4f0a-b1c4-acd413cefd24', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.50', '2018-03-01', 'aeff2060-f179-40d3-ba5e-f858c1d8cc46');
INSERT INTO `teachingrecord` VALUES ('4e7bdf87-868d-4476-a916-ab5ed81e228f', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-04-03', '0edef0da-d2b2-4041-8ae3-1551ffe4a0a0');
INSERT INTO `teachingrecord` VALUES ('aaff9048-b2e6-4f51-93b9-224698d8d22e', 'dc016cf8-e5ec-4661-8348-b3a59c4a235b', '4970c4d5-bda0-4b46-860d-51c53fa529ad', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-04-03', '797426a4-6322-4a8f-99f0-196d0d1f4421');
INSERT INTO `teachingrecord` VALUES ('bb6ad16b-1d81-4a15-a344-d79c3292a92d', '78b8f787-05df-4ad1-bdcb-466804c52dd4', '999f9085-f746-4f88-810b-bb266dc4cc3b', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-03-01', '2b6b4656-e866-4710-8be9-ba13049d572c');
INSERT INTO `teachingrecord` VALUES ('26287955-24bc-4655-af94-911a514f9a69', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-03-29', 'e135d0f9-261c-4809-87cd-99449d06c51c');
INSERT INTO `teachingrecord` VALUES ('227add73-2af5-489d-9deb-4c04ee0e435d', 'a4dbc41f-3d29-4629-9d6d-1a3ff201eede', '53183a7a-8547-4823-b908-656b9e818f84', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '2.00', '2018-03-01', 'a7a611b6-feb8-400d-b013-48efab30d3d2');
INSERT INTO `teachingrecord` VALUES ('fe6aa278-6171-4b61-9acd-1d94f7040586', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '09:00:00', '11:00:00', '2.00', '2018-03-24', 'c66d5aec-5a9d-445c-893b-5deee871ce86');
INSERT INTO `teachingrecord` VALUES ('1e4b2a6f-b905-47da-9ccd-56c4a1d63d65', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '09:00:00', '11:00:00', '2.00', '2018-03-31', 'c66d5aec-5a9d-445c-893b-5deee871ce86');
INSERT INTO `teachingrecord` VALUES ('dc11bd4c-efc2-4213-aa90-b8af78cbc0e2', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-10', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO `teachingrecord` VALUES ('9cb172dd-24cb-4573-a0ed-e07e75477b8d', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-17', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO `teachingrecord` VALUES ('be0e8f49-50bb-4e69-a300-7bce0feb0460', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-24', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO `teachingrecord` VALUES ('358abad8-7d2d-4ac6-9680-0f2ba921a828', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-03-31', 'decde197-8876-43c1-b27b-4114ccb01330');
INSERT INTO `teachingrecord` VALUES ('9523cbde-e8f3-4161-b325-55162b86772f', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '14:00:00', '17:00:00', '3.00', '2018-03-11', '96417002-12ad-42dd-9bc3-2de1dd93c5f8');
INSERT INTO `teachingrecord` VALUES ('0b092975-d2ba-459e-8a3a-74f3087d3cab', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '09:00:00', '12:00:00', '3.00', '2018-03-25', '96417002-12ad-42dd-9bc3-2de1dd93c5f8');
INSERT INTO `teachingrecord` VALUES ('a685712c-1358-40bb-8c6f-fe2019593b47', '425e3aab-b0d2-4521-b858-0a70509b5d9e', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '08:10:00', '11:10:00', '3.00', '2018-03-11', '9028c9ed-55f5-4f01-aab8-9925da5320bc');
INSERT INTO `teachingrecord` VALUES ('7c824eca-2ec3-4dae-859d-e073f768c250', '425e3aab-b0d2-4521-b858-0a70509b5d9e', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '08:10:00', '11:10:00', '3.00', '2018-03-18', '9028c9ed-55f5-4f01-aab8-9925da5320bc');
INSERT INTO `teachingrecord` VALUES ('e2209f4e-d378-4a33-a5e5-ac7829270df7', '88952680-bedf-47cc-86ed-8d61aa95abb7', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '10:20:00', '11:50:00', '1.00', '2018-03-25', 'cb738951-e544-4c54-bee9-903f17f835b0');
INSERT INTO `teachingrecord` VALUES ('a19ecdb7-829c-4474-9a8b-772819b29091', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '19:30:00', '21:30:00', '4.00', '2018-03-01', 'b7e77aad-fd87-434e-bab0-efb3fc9b56d1');
INSERT INTO `teachingrecord` VALUES ('687f6e9e-aa7a-4908-a3d0-a7c4789efc56', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '09:00:00', '12:00:00', '3.00', '2018-03-18', 'e4207004-b076-4e52-9047-65fc0e553e1e');
INSERT INTO `teachingrecord` VALUES ('b9152cdc-95c2-4995-aa92-cb22200951c3', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '09:00:00', '12:00:00', '3.00', '2018-03-25', 'e4207004-b076-4e52-9047-65fc0e553e1e');
INSERT INTO `teachingrecord` VALUES ('78d69f5c-d03e-4706-93b6-74149353117b', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '15:40:00', '18:10:00', '2.00', '2018-03-18', '4c939366-dde1-4363-91a7-21bc1501cf05');
INSERT INTO `teachingrecord` VALUES ('d5d8da60-e836-4ca2-8d36-0fbdd1a736e8', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '15:40:00', '18:10:00', '2.00', '2018-03-25', '4c939366-dde1-4363-91a7-21bc1501cf05');
INSERT INTO `teachingrecord` VALUES ('2317ecec-0a73-4011-ab13-e4457d1c83a8', '98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '15:00:00', '17:30:00', '2.00', '2018-03-11', '5a404b4c-3c80-44c1-842b-9b4c75190d36');
INSERT INTO `teachingrecord` VALUES ('7ca9fefc-8d67-4019-b1ec-22b984f2dcbe', '98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '18:00:00', '20:30:00', '2.00', '2018-03-18', '5a404b4c-3c80-44c1-842b-9b4c75190d36');
INSERT INTO `teachingrecord` VALUES ('5ef12f9c-db5a-4099-a7dc-1cb2b6eb87cd', '98efdd46-b5b6-414c-9c31-56320515f91d', '3916fb92-890d-4634-a040-582cce5f6163', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '18:00:00', '20:30:00', '2.00', '2018-03-25', '5a404b4c-3c80-44c1-842b-9b4c75190d36');
INSERT INTO `teachingrecord` VALUES ('f22edb07-b8fd-4d3d-b5f1-01d3152d2462', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '14:00:00', '16:00:00', '2.00', '2018-03-11', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO `teachingrecord` VALUES ('6f51b6b8-e7e1-4a8c-b9c4-d96f537b67ad', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '14:00:00', '16:00:00', '2.00', '2018-03-18', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO `teachingrecord` VALUES ('6b730005-21b3-461d-8f17-a42fbeabe9da', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '13:30:00', '15:30:00', '2.00', '2018-03-24', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO `teachingrecord` VALUES ('ec8388f6-c798-46f3-b7c0-432515dc3824', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '15:00:00', '17:00:00', '2.00', '2018-03-31', '9aa61240-bfad-4a42-b152-d54dce3c7a0c');
INSERT INTO `teachingrecord` VALUES ('8668e47b-bb7f-43f9-b123-90d0fbc3b2c9', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '16:30:00', '18:30:00', '2.00', '2018-03-10', '73e3003f-1f76-4713-913a-d99ae762f76e');
INSERT INTO `teachingrecord` VALUES ('4d032c18-b79a-4764-a27d-b0310e471575', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '15:30:00', '17:30:00', '2.00', '2018-03-17', '73e3003f-1f76-4713-913a-d99ae762f76e');
INSERT INTO `teachingrecord` VALUES ('f3544ba5-42a8-4bd6-aab0-aa16f30628da', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '15:30:00', '17:30:00', '2.00', '2018-03-25', '73e3003f-1f76-4713-913a-d99ae762f76e');
INSERT INTO `teachingrecord` VALUES ('03cda812-4e03-4a63-837a-135d31435330', '7017346c-ff3f-4f42-9a40-e92dc324ef19', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '14:00:00', '17:00:00', '3.00', '2018-03-18', '301f1e25-81ca-4c8f-ad57-420870770bf2');
INSERT INTO `teachingrecord` VALUES ('4915d905-0fe6-471c-86ba-2ff738da6c3c', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-03', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO `teachingrecord` VALUES ('ff8f724f-8043-4aab-9fe0-8362ac0b0f9f', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-11', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO `teachingrecord` VALUES ('42c40666-6f3b-4fd3-a6cf-335010769307', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-18', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO `teachingrecord` VALUES ('6e2362b0-2a6b-46fb-ac4c-64888fbd1281', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-25', '59858dc7-b38b-4632-b307-810c7b021217');
INSERT INTO `teachingrecord` VALUES ('49d816e0-5529-4944-ba13-40a454f78db4', '8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '19:00:00', '22:00:00', '3.00', '2018-03-13', '15d44df5-4a02-43d1-8704-ccca3e2c6e94');
INSERT INTO `teachingrecord` VALUES ('acf00e87-e7bb-43bc-b9fa-88d93f73324d', '8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '19:00:00', '21:00:00', '2.00', '2018-03-20', '15d44df5-4a02-43d1-8704-ccca3e2c6e94');
INSERT INTO `teachingrecord` VALUES ('cc6aa1b4-b58d-4663-974d-8254bc6bbb30', '8477e9b7-7e9f-40bf-9d39-99c3c2d5c7c2', 'e5b04cd5-143d-4a6e-bd19-2acf148c6da9', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '19:00:00', '22:00:00', '3.00', '2018-03-27', '15d44df5-4a02-43d1-8704-ccca3e2c6e94');
INSERT INTO `teachingrecord` VALUES ('951560f8-8b50-4ed4-b26b-2b7db2e1c0a2', '37e49b33-f12a-4693-9e11-aed0bf39f981', 'b0f6bbdc-3f81-41da-b769-66448f8ec5f6', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', 'ea726a02-bf22-404d-b138-792bf6d7785a');
INSERT INTO `teachingrecord` VALUES ('3a32fddf-58bd-4b4b-a976-ebba7f972757', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-13', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('08dc12a6-8c45-4678-bdad-ef4d2ae63fa1', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:00:00', '1.00', '2018-03-15', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('bb0071df-9b28-4a33-8f6a-49a1bc94db1f', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-16', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('4e37c2fe-3fcf-44c6-b8a4-9188206597b9', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-20', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('27c2feb1-2983-4af8-8803-3425392387c6', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:00:00', '1.00', '2018-03-22', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('2107d855-08c2-4db7-924b-b051dd7eb868', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-23', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('a841463f-657c-4b5b-9ad8-018397c808bc', 'faf95a49-dc0b-49c4-a24e-be34c61e622f', 'e3baa8e9-63c3-4805-aee1-605ca2ca3999', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '19:00:00', '20:30:00', '1.00', '2018-03-30', 'ffacc8f6-405d-43d6-8751-a9d6ae5bfb2b');
INSERT INTO `teachingrecord` VALUES ('0b334d5a-e890-49d9-8322-010c16da5bab', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO `teachingrecord` VALUES ('1612a1b3-f25d-45d8-a8f3-3e07e41ec0d0', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO `teachingrecord` VALUES ('2e6b5fc5-372f-46ed-9b50-553b3d2630d8', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO `teachingrecord` VALUES ('9eec1b0a-0c63-4e43-b033-ce9bb6104a5c', '27f55f4f-55dc-4d66-87ad-471ec7e794f3', 'eec3166c-b969-4bba-982a-46fd8f62ef06', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '16:01:00', '17:01:00', '1.00', '2018-03-01', '25ff3289-06f3-4c30-93bb-d82595ad3332');
INSERT INTO `teachingrecord` VALUES ('aa92eafb-83c2-4561-a5fa-242e8b83450c', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '16:01:00', '16:05:00', '2.00', '2018-03-10', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO `teachingrecord` VALUES ('17bf7c13-cbf6-49c8-98cd-0ac1e2a46b83', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '13:30:00', '15:30:00', '2.00', '2018-03-17', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO `teachingrecord` VALUES ('c4613b0a-a005-4b1a-a31b-fa141ce29038', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '14:00:00', '16:00:00', '2.00', '2018-03-24', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO `teachingrecord` VALUES ('7ae9032b-9637-4cc6-b6c8-e9ac6cc8d6ca', '2bb8ad87-1a0c-4add-a4fd-b86d5a7bc76f', '74fc8789-52b0-4cce-b2f4-96806dd4a9bd', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '14:00:00', '16:00:00', '2.00', '2018-03-31', '5e892622-ac6d-4231-9c39-dba28fbe9e81');
INSERT INTO `teachingrecord` VALUES ('f29773bd-7f2e-44af-9000-5c06630d1920', '4d309b83-f780-4e70-9aaa-399c086cff52', '63de6f8f-666b-4127-bf5a-a76bec815c24', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '14:30:00', '17:30:00', '3.00', '2018-03-18', '4d6d538c-babc-4e26-896f-a5fe2d980679');
INSERT INTO `teachingrecord` VALUES ('31443862-44d3-4889-9197-c46640ce841e', '4d309b83-f780-4e70-9aaa-399c086cff52', '63de6f8f-666b-4127-bf5a-a76bec815c24', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '14:30:00', '17:30:00', '3.00', '2018-03-25', '4d6d538c-babc-4e26-896f-a5fe2d980679');
INSERT INTO `teachingrecord` VALUES ('452771f6-5910-4c24-98fc-b2b0d33dccc1', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '20:00:00', '22:30:00', '2.00', '2018-03-02', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO `teachingrecord` VALUES ('f18de599-d627-4927-8890-436a1abc16a9', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '18:30:00', '21:30:00', '3.00', '2018-03-16', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO `teachingrecord` VALUES ('bb7a1590-12c2-49f6-a946-e6afab392a76', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '3.00', '2018-03-17', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO `teachingrecord` VALUES ('a3ebc89e-4bee-4c0e-a553-ad9f365d5754', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '22:00:00', '23:00:00', '1.00', '2018-03-27', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO `teachingrecord` VALUES ('0cbf3d88-7c75-4d96-bcfc-ddb1cabac843', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '22:00:00', '23:00:00', '1.00', '2018-03-28', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO `teachingrecord` VALUES ('2af1909c-6587-43b4-83de-a379982f122c', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '22:00:00', '23:00:00', '1.00', '2018-03-29', '9d3733cc-1d83-4ec5-91df-3efae2a2112b');
INSERT INTO `teachingrecord` VALUES ('4c98b9db-fdaa-4c00-ae88-81337879a1cb', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.50', '2018-03-01', '22882638-4b62-4a67-b8f5-958516571e99');
INSERT INTO `teachingrecord` VALUES ('18da1614-c0a9-49f3-9e17-be9f0d8f4d8e', 'e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', 'b21addc3-003c-42be-afaa-ab7064d6e144', '14:00:00', '16:05:00', '2.00', '2018-03-31', '8e121a0c-efc2-405e-bff2-36b91309a11c');
INSERT INTO `teachingrecord` VALUES ('ccf5fd12-fd99-47f7-9a82-85c9cc558bad', 'b66a90f4-e5a6-4ba5-a64c-85221ae34828', '3fafd6cb-8d3f-4f26-af05-5bac5ed700e7', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '13:35:00', '17:00:00', '3.00', '2018-04-07', '3b816221-7664-4d11-8c12-8ef512514749');
INSERT INTO `teachingrecord` VALUES ('2551e168-00b0-423f-be2b-153a23dc4a50', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-10', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO `teachingrecord` VALUES ('8c5a54fc-d99e-4509-91b1-61409d9312b6', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '1.00', '2018-03-14', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO `teachingrecord` VALUES ('7f8aabe8-5421-49f3-b047-b6361fb83279', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-16', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO `teachingrecord` VALUES ('a33f5fb0-2866-4da9-886f-44ff4b3f95bc', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '1.00', '2018-03-21', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO `teachingrecord` VALUES ('5f348bf0-a4c4-43ae-a32d-7644b3efd4da', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-23', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO `teachingrecord` VALUES ('7ac803b9-081b-4c7e-a01c-c4579adbb43d', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '07:00:00', '17:01:00', '2.00', '2018-03-28', 'c91a1407-50d8-46ff-b469-4e3bdb2585e6');
INSERT INTO `teachingrecord` VALUES ('642c2913-acd9-45a4-ba6d-a453e15431d8', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '15:30:00', '18:30:00', '3.00', '2018-03-17', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO `teachingrecord` VALUES ('b7bed81e-4bc3-480e-a447-8b7e3113fdf2', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '14:00:00', '17:00:00', '3.00', '2018-03-18', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO `teachingrecord` VALUES ('931decd1-5515-40af-ad12-8cb865a09f29', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '13:00:00', '16:00:00', '3.00', '2018-03-19', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO `teachingrecord` VALUES ('e82ae59b-267b-4837-89cb-9d98a2d56552', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '08:30:00', '11:30:00', '3.00', '2018-03-22', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO `teachingrecord` VALUES ('24f6c54a-5950-4487-8aa0-8a54cb09b927', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '19:00:00', '21:00:00', '2.00', '2018-03-29', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO `teachingrecord` VALUES ('f4dd0200-1035-4fed-8566-50b8025a5ebd', '3b7435ef-5564-4501-8ed7-49ce14572ab0', '6dc17a9c-806c-4cab-8e1e-fbc6eedb5b6c', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '14:00:00', '16:00:00', '2.00', '2018-03-30', '604fe578-0c4f-459a-a5c6-44549a4f0d92');
INSERT INTO `teachingrecord` VALUES ('5c78cf8f-b10e-4746-a0fd-05809f2d4e56', '8ecacfdd-351a-4381-bf5c-29bf8a815a88', '3b3aed7a-88af-4738-95e9-e6884326dbfa', '27b5a1a7-624f-40e1-9359-9196d0261133', '14:30:00', '16:30:00', '2.00', '2018-03-18', '5375d8bc-7691-4e61-8f78-aabd772a38b0');
INSERT INTO `teachingrecord` VALUES ('6c7bd1ff-dc37-4d67-8312-001be10a65d2', '6a2f9398-4577-4d5c-925c-b32352714ad2', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '14:00:00', '16:00:00', '2.00', '2018-03-31', 'e55873ed-aa42-4d03-94f9-fc0a1537c3ff');
INSERT INTO `teachingrecord` VALUES ('d7731307-6650-42ba-9f7e-a9314ef9440a', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '14:00:00', '16:00:00', '2.00', '2018-03-11', 'fd3d86b2-959e-48ca-91a6-28e585bc2b17');
INSERT INTO `teachingrecord` VALUES ('e86cde7f-830c-48c1-b355-d41bdfaff899', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '14:00:00', '16:00:00', '2.00', '2018-03-18', 'fd3d86b2-959e-48ca-91a6-28e585bc2b17');
INSERT INTO `teachingrecord` VALUES ('332f90b9-c677-4fbb-840c-f37cbbf8eab7', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '14:00:00', '16:00:00', '2.00', '2018-03-25', 'fd3d86b2-959e-48ca-91a6-28e585bc2b17');
INSERT INTO `teachingrecord` VALUES ('b51bf472-aa98-43d3-9a17-c3b637b7053e', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-04', '05fdafbf-8e31-44b4-9fc5-b8de289f8b46');
INSERT INTO `teachingrecord` VALUES ('3d23e26f-38f8-4092-ba4e-0423bcf75098', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-03-31', '05fdafbf-8e31-44b4-9fc5-b8de289f8b46');
INSERT INTO `teachingrecord` VALUES ('c818a3ce-2fbc-4202-8a3f-7976de066f3c', 'e3ff9924-100d-4a58-bbca-54d2fad68f69', 'eb4baf58-0f3e-4017-958c-a711c8f05ffb', '2317d1b6-f84d-4633-bc8c-97caaff69e16', null, null, '2.00', '2018-03-31', 'b76c804a-d0f0-478d-87dd-27c4e2d831d3');
INSERT INTO `teachingrecord` VALUES ('46337f76-50c3-4923-b21f-fa42c653ada7', 'f2eff1fa-55b8-4a6b-8d24-59773b22d648', '5ac551c9-0b19-4f82-a4f8-eec8a20bee0a', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '19:00:00', '21:00:00', '2.00', '2018-03-29', '776c734a-bce0-48d6-96e5-8184061971a0');
INSERT INTO `teachingrecord` VALUES ('3093d494-7b25-44f0-913a-9e4c3eba4b9e', '2d72270f-f8fe-4a24-93b2-885e8f8f5463', '127f313b-6c0f-4f6f-8909-8fede191732e', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.50', '2018-03-01', 'd668d2b7-1808-419d-868e-9a76e91ddb6b');
INSERT INTO `teachingrecord` VALUES ('2ef2c925-a0b0-4517-9315-26573aa8497d', '5a88004b-a6ed-4463-aa35-33f6befbff13', 'e37770db-2e80-422e-b4d3-e12cab81145a', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '17:20:00', '19:20:00', '2.00', '2018-03-31', 'fa4a9cad-7de1-49da-9fae-526fab064a66');
INSERT INTO `teachingrecord` VALUES ('0f87d7f9-9c38-45c7-b042-c38acaed2297', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-10', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO `teachingrecord` VALUES ('a0449c4d-a84a-4e84-8ac0-d90d35772f02', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-17', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO `teachingrecord` VALUES ('3beea64e-1b97-4d86-a87d-9e0de3682658', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-24', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO `teachingrecord` VALUES ('92613e8d-f715-4dbf-bd60-3234f4cece6e', 'ded7ab44-98ea-4eff-b893-3ab04630129e', 'eb579546-e561-41d6-8883-2ac4c992da09', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '16:01:00', '17:01:00', '2.00', '2018-03-31', 'b091936b-3866-4e98-8ac6-9d72df59a56f');
INSERT INTO `teachingrecord` VALUES ('6d60e164-9369-46e6-9048-0a232e11feb8', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '09:20:00', '11:20:00', '2.00', '2018-03-18', 'de89ed26-b005-42e6-870a-e367aac4f28c');
INSERT INTO `teachingrecord` VALUES ('a06d4777-80a5-4b3a-8129-9e2907961682', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '09:10:00', '11:10:00', '2.00', '2018-03-25', 'de89ed26-b005-42e6-870a-e367aac4f28c');
INSERT INTO `teachingrecord` VALUES ('d95f0f54-af12-435a-850f-3f852447628a', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '11:05:00', '17:05:00', '4.00', '2018-03-31', '858ca17d-2205-4934-96df-f339b1826c95');
INSERT INTO `teachingrecord` VALUES ('03573c7a-dbf9-4d48-b4aa-c8db4efba059', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '10:00:00', '13:00:00', '3.00', '2018-03-24', '858ca17d-2205-4934-96df-f339b1826c95');
INSERT INTO `teachingrecord` VALUES ('2c0a58b5-e08a-4120-93e4-37355921e177', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '13:05:00', '17:05:00', '4.00', '2018-03-17', '858ca17d-2205-4934-96df-f339b1826c95');
INSERT INTO `teachingrecord` VALUES ('8fae88e7-2466-4638-8bc1-a04ec430f6a7', '4d8192eb-b19b-4526-99b1-3604d27033be', 'fa92b9ba-f1be-4461-b261-2342b3025145', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '0.50', '2018-03-01', '164b3a53-487f-4d0b-8f55-e911ff2ebd7a');
INSERT INTO `teachingrecord` VALUES ('286d304a-8d4e-46dc-87fe-ad3b9c2615e6', 'a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '73818668-89b4-4f28-b928-6b454641aaae', '09:30:00', '11:00:00', '1.50', '2018-04-06', 'b6834d89-855e-43b9-bebd-03f7ed7df8d1');
INSERT INTO `teachingrecord` VALUES ('64d77a32-8bf2-4bdc-bbe1-54ccc8d1dc56', 'a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '73818668-89b4-4f28-b928-6b454641aaae', '13:30:00', '15:00:00', '1.50', '2018-04-14', 'b6834d89-855e-43b9-bebd-03f7ed7df8d1');
INSERT INTO `teachingrecord` VALUES ('3911c161-94f7-4c9f-b4a5-f5be44a56695', '8d5fa78f-c3fb-48e7-9441-046d55522dc7', '3e16af28-6a16-4f15-b0de-319c337d816c', '6620857b-7472-4960-a7f7-870244cad689', '09:30:00', '11:00:00', '1.50', '2018-04-07', '6a9ce13b-43bc-4087-8559-17d2067c8377');
INSERT INTO `teachingrecord` VALUES ('b5ac5bd0-c728-4100-ab07-43f2ee60cc69', '8d5fa78f-c3fb-48e7-9441-046d55522dc7', '3e16af28-6a16-4f15-b0de-319c337d816c', '6620857b-7472-4960-a7f7-870244cad689', '09:30:00', '11:00:00', '1.50', '2018-04-14', '6a9ce13b-43bc-4087-8559-17d2067c8377');
INSERT INTO `teachingrecord` VALUES ('3b74090f-5bb2-4ba3-9dad-6adce1ba1e40', '9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c', '9461f1df-fa79-4609-88fe-757fd0ccf99c', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', '09:00:00', '11:00:00', '2.00', '2018-03-24', '10f187d9-86bb-4b6b-bc41-0077feff67eb');
INSERT INTO `teachingrecord` VALUES ('f4267777-a267-459c-a444-4b55357fb54d', 'f849cbc7-5943-4710-b614-8f8cffd304e5', '87a767a8-22b6-48d9-a24a-cc6d52c975e9', '537f3647-8444-4525-94c9-5af57c3f55e8', '10:00:00', '12:00:00', '2.00', '2018-04-03', '499c228e-9f60-404f-b286-83fc47083580');
INSERT INTO `teachingrecord` VALUES ('f1f933f5-e333-4aae-affa-1d3a95be5b5a', 'f849cbc7-5943-4710-b614-8f8cffd304e5', '87a767a8-22b6-48d9-a24a-cc6d52c975e9', '537f3647-8444-4525-94c9-5af57c3f55e8', '10:00:00', '12:00:00', '2.00', '2018-04-08', '499c228e-9f60-404f-b286-83fc47083580');
INSERT INTO `teachingrecord` VALUES ('370bf526-0b64-40f9-abae-b3ddae28b64f', 'f849cbc7-5943-4710-b614-8f8cffd304e5', '87a767a8-22b6-48d9-a24a-cc6d52c975e9', '537f3647-8444-4525-94c9-5af57c3f55e8', '10:00:00', '12:00:00', '2.00', '2018-04-15', '499c228e-9f60-404f-b286-83fc47083580');
INSERT INTO `teachingrecord` VALUES ('6939918c-d41b-4995-b1e7-2e27c2785f34', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '08:30:00', '11:00:00', '2.00', '2018-04-07', '131db198-5ee5-40d5-a003-b88e5751b0bb');
INSERT INTO `teachingrecord` VALUES ('833c2b72-603f-4689-a6e4-6a8a73ac2466', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '08:35:00', '10:10:00', '3.00', '2018-04-14', '131db198-5ee5-40d5-a003-b88e5751b0bb');
INSERT INTO `teachingrecord` VALUES ('6e7f791b-7f59-4e9f-ae38-aa58ca1f5499', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '08:30:00', '11:00:00', '2.00', '2018-04-21', '131db198-5ee5-40d5-a003-b88e5751b0bb');
INSERT INTO `teachingrecord` VALUES ('836c122e-cbbd-4587-941b-132e3627e161', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '08:30:00', '11:10:00', '3.00', '2018-04-29', '131db198-5ee5-40d5-a003-b88e5751b0bb');
INSERT INTO `teachingrecord` VALUES ('c65d585a-2646-4f10-a1ff-3839c55bdd8f', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '13:50:00', '16:20:00', '3.00', '2018-04-30', '131db198-5ee5-40d5-a003-b88e5751b0bb');
INSERT INTO `teachingrecord` VALUES ('3034ce01-9c6a-4782-8314-002b24985095', '1ab1e5c0-fc16-4241-b1ae-0bdcbc716dd4', 'f8bce37c-bb5c-40ad-b256-d4f9f2c13d61', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '09:00:00', '11:30:00', '2.00', '2018-04-01', '131db198-5ee5-40d5-a003-b88e5751b0bb');
INSERT INTO `teachingrecord` VALUES ('eb4cc3be-513e-402d-80cf-3ed8177afcf7', 'd8284412-4b3d-413c-88f3-d5c913f5df4f', 'ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '44cd5d75-722e-4c03-ac2a-360e5447b97f', '15:00:00', '16:00:00', '1.00', '2018-03-18', '910b132c-352a-4000-b1b9-0e9fabbbb9ff');
INSERT INTO `teachingrecord` VALUES ('67d0fa30-db42-4776-b030-90d8ad29a0bf', 'd8284412-4b3d-413c-88f3-d5c913f5df4f', 'ce0fb9c0-e933-4abc-9d37-3dad57acb4c2', '44cd5d75-722e-4c03-ac2a-360e5447b97f', '14:00:00', '16:00:00', '2.00', '2018-03-25', '910b132c-352a-4000-b1b9-0e9fabbbb9ff');
INSERT INTO `teachingrecord` VALUES ('3e24d379-483b-4082-905c-d47b1c9cd632', 'ca629310-5a4f-4fa9-bca2-d42c642935ce', '62426f43-72a0-41c7-aea4-3bbedbddbca1', '138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '19:00:00', '21:00:00', '2.00', '2018-04-26', 'be7f016d-d506-4994-871c-693597d9142a');
INSERT INTO `teachingrecord` VALUES ('5a6890a6-87dd-426e-9da5-d16a1178942e', 'ca629310-5a4f-4fa9-bca2-d42c642935ce', '62426f43-72a0-41c7-aea4-3bbedbddbca1', '138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '10:00:00', '12:00:00', '2.00', '2018-04-29', 'be7f016d-d506-4994-871c-693597d9142a');
INSERT INTO `teachingrecord` VALUES ('f14afef8-5478-4b7f-95fa-76777b0346a6', '5a657d14-c207-411d-8bdf-cf6cb8e0db70', 'fa92b9ba-f1be-4461-b261-2342b3025145', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '1.00', '2018-04-01', '80e0f1b3-e20f-4619-b722-f5f3ee4d4706');
INSERT INTO `teachingrecord` VALUES ('73f4cda5-1f48-4631-b222-3f13406b14da', '322e7938-af42-48ec-9fb9-8bd4a66c316c', '26e412cf-a8e8-401c-88fa-fe37aa6bb208', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '2.00', '2018-04-01', '9a994df4-d392-4b3c-aea9-4388586fc6b5');
INSERT INTO `teachingrecord` VALUES ('6c0a603b-58f8-45be-9b7f-d47640474bac', 'ed49c2bd-76cd-4716-a692-ab32a84c7c56', 'a809032f-f82c-4003-9e70-26b8e6368db1', 'ffb18612-b184-4291-b49f-5336cf8a913b', '16:01:00', '17:01:00', '2.00', '2018-04-01', 'a625ba8d-8aa2-49f0-9520-9d788bc0d653');
INSERT INTO `teachingrecord` VALUES ('715c1418-9079-4a0f-83a2-64152e2889d8', 'f558d3cb-3858-44de-aece-19b4ffc45396', '0074262e-7492-4540-a61a-ca5b55a31e45', '16684d26-3d14-45ff-8c3f-112d739be006', '10:00:00', '12:00:00', '2.00', '2018-04-22', 'da13ac4e-c23b-4e89-8d15-c307f156b95f');
INSERT INTO `teachingrecord` VALUES ('2d7d542b-4720-442e-91c7-f6b14012354e', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '15:40:00', '18:10:00', '2.50', '2018-04-07', 'bed82131-ef62-4dd9-8d5a-6a94c7d07195');
INSERT INTO `teachingrecord` VALUES ('56d9dca8-46cf-40ef-9a98-8a98956e4a9f', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '16:00:00', '18:00:00', '2.00', '2018-04-15', 'bed82131-ef62-4dd9-8d5a-6a94c7d07195');
INSERT INTO `teachingrecord` VALUES ('253dbee2-ae5c-4096-b119-02860c2a029e', '046b4cdf-9682-4bfd-b1e5-660e1bdc3494', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '853a2f31-f902-489c-8b7c-bea062277833', '15:30:00', '18:00:00', '2.50', '2018-04-22', 'bed82131-ef62-4dd9-8d5a-6a94c7d07195');
INSERT INTO `teachingrecord` VALUES ('76ca9bad-fc52-4919-9d9d-bb73616746e8', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '15:00:00', '17:01:00', '2.00', '2018-04-07', '6117d393-f201-49c3-994f-4793911ae223');
INSERT INTO `teachingrecord` VALUES ('3d024fbe-7ac7-46ce-8ad2-0dd6eae7a452', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '14:00:00', '16:00:00', '2.00', '2018-04-14', '6117d393-f201-49c3-994f-4793911ae223');
INSERT INTO `teachingrecord` VALUES ('9e7ed2f9-0f10-46b0-a422-9f0f4800c081', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '09:00:00', '11:00:00', '2.00', '2018-04-21', '6117d393-f201-49c3-994f-4793911ae223');
INSERT INTO `teachingrecord` VALUES ('00d5cf2b-fe99-4a06-bfbe-4d0001060dcf', '748ac459-aca8-4b9a-b792-e3aaf09a8e23', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '09:00:00', '11:00:00', '2.00', '2018-04-29', '6117d393-f201-49c3-994f-4793911ae223');
INSERT INTO `teachingrecord` VALUES ('33d43563-fe59-49d7-b9f8-11a62b261cde', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '10:00:00', '12:30:00', '2.50', '2018-04-01', '919103bd-1b71-49e9-9c8b-61172c85a958');
INSERT INTO `teachingrecord` VALUES ('130e6a76-25e0-4d16-bb89-c0e04ecd39b4', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '09:30:00', '12:00:00', '2.50', '2018-04-15', '919103bd-1b71-49e9-9c8b-61172c85a958');
INSERT INTO `teachingrecord` VALUES ('f52000f6-5577-46da-8ffb-0f31e94f3b1c', 'f926d599-de1a-4b81-8343-9833c57a0882', '63de6f8f-666b-4127-bf5a-a76bec815c24', '853a2f31-f902-489c-8b7c-bea062277833', '20:00:00', '22:30:00', '2.50', '2018-04-29', '919103bd-1b71-49e9-9c8b-61172c85a958');
INSERT INTO `teachingrecord` VALUES ('bf4794f0-7610-4d35-a7ca-1d021bd740c9', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '19:30:00', '21:30:00', '2.00', '2018-04-01', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('c6820bea-024e-4284-9cda-a9ea9cb94c86', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-03', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('cfe84498-df17-4bb9-ada0-d517b7a7d75b', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-11', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('f8f03e29-fdf9-4184-af47-6223a9c74c06', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-13', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('0967e893-2b5d-4295-912b-e85baa27e32f', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-15', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('15152313-d08f-43be-988a-a2cbf7725861', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-17', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('fb489e55-539d-483b-8813-99a86b0b4843', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-18', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('a89b87ac-ffb2-4bcf-abdf-3564ec5c8764', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-20', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('0b6bb43e-3f31-4a07-a5ef-e913d6d7e388', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-23', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('ad52b73d-0027-490b-b6bc-1b669c094cae', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-27', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('b337ea55-27d2-42f4-b03c-68d2b3de305c', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-28', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('d60dc1ed-a539-4e6d-bc1f-04a0cd450636', 'b18c2e01-544d-4e2b-bd41-3772c57c6976', '9b86b0dc-b971-4797-9f65-3f2b17fcca8e', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '16:01:00', '17:01:00', '2.00', '2018-04-29', '48b6f75f-c59a-41d2-94f6-4d5694362dca');
INSERT INTO `teachingrecord` VALUES ('e63bfe3c-aa32-47f4-b043-b0bdcef05c9f', 'a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '73818668-89b4-4f28-b928-6b454641aaae', '09:30:00', '11:00:00', '1.50', '2018-04-15', '31d8f749-9d61-4c46-b898-f39aaca8ce78');
INSERT INTO `teachingrecord` VALUES ('b551e828-3aee-4179-9646-23117f0cdc5a', 'a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '73818668-89b4-4f28-b928-6b454641aaae', '15:00:00', '17:00:00', '2.00', '2018-04-29', '31d8f749-9d61-4c46-b898-f39aaca8ce78');
INSERT INTO `teachingrecord` VALUES ('f60ea57c-aa2a-46bf-b8c8-f5020e8955bf', 'a9be6da1-71d3-4437-b617-4ce283c0d587', '3e16af28-6a16-4f15-b0de-319c337d816c', '73818668-89b4-4f28-b928-6b454641aaae', '13:00:00', '14:30:00', '1.50', '2018-04-30', '31d8f749-9d61-4c46-b898-f39aaca8ce78');
INSERT INTO `teachingrecord` VALUES ('b9d2fc4e-05aa-40d8-9cf8-5c98add71fb3', 'f42c23d6-7845-4509-8fab-1fcaf335e47f', '671aaf61-88cd-4331-aca6-e5b705f1cc37', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '16:01:00', '17:01:00', '2.00', '2018-04-13', '81965c44-34f3-4eb7-b86c-dc868de6019d');
INSERT INTO `teachingrecord` VALUES ('73eb1f70-2bd3-4c02-956c-0ab974bbe1d9', 'f42c23d6-7845-4509-8fab-1fcaf335e47f', '671aaf61-88cd-4331-aca6-e5b705f1cc37', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '16:01:00', '17:01:00', '2.00', '2018-04-20', '81965c44-34f3-4eb7-b86c-dc868de6019d');
INSERT INTO `teachingrecord` VALUES ('1a6c134b-0731-4408-8af9-5de061c4d803', 'f42c23d6-7845-4509-8fab-1fcaf335e47f', '671aaf61-88cd-4331-aca6-e5b705f1cc37', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '16:01:00', '17:01:00', '2.00', '2018-04-01', '81965c44-34f3-4eb7-b86c-dc868de6019d');
INSERT INTO `teachingrecord` VALUES ('97faeb0f-1270-4055-8936-8fb23074d996', '562f12cf-b532-44b1-8d55-dd55e8211fed', '7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '16:01:00', '17:01:00', '2.00', '2018-04-14', '49d2f330-bc86-41e0-8c7d-300277fe4aaf');
INSERT INTO `teachingrecord` VALUES ('d9be2314-68b2-4648-92da-9b49af2d4b9b', '562f12cf-b532-44b1-8d55-dd55e8211fed', '7f6d2aad-8b3a-4319-9e6a-6b9a094090c4', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '16:01:00', '17:01:00', '2.00', '2018-04-01', '49d2f330-bc86-41e0-8c7d-300277fe4aaf');
INSERT INTO `teachingrecord` VALUES ('4f0947cb-59e2-4308-a674-c75245ac2b36', '2005fb38-1aff-4750-860c-5ab7ec146159', '3cf9c2b5-4119-4805-ae3c-8bb7b0d53a46', 'b8ef7e22-3952-403d-af92-dfdcbe250073', '14:30:00', '16:30:00', '2.00', '2018-04-14', 'c14b02d3-65aa-4a96-8ba4-700a87a1892e');
INSERT INTO `teachingrecord` VALUES ('12d784aa-9762-4432-87de-df1d20c456f3', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-04-01', 'e746feda-1f01-413a-949b-ad4cbcf930e2');
INSERT INTO `teachingrecord` VALUES ('d2e45907-4ae1-44e3-802e-cbee99ad6f51', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-04-08', 'e746feda-1f01-413a-949b-ad4cbcf930e2');
INSERT INTO `teachingrecord` VALUES ('f383fd90-d4a9-48d4-b63c-99a5ab9c2e72', '39a82af9-6cdf-4b92-b0ad-2af75eb02564', 'f53b5fd9-ce43-4d14-bfd6-03d629d4d818', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-04-15', 'e746feda-1f01-413a-949b-ad4cbcf930e2');
INSERT INTO `teachingrecord` VALUES ('36198481-1449-4a21-a6aa-34ce76a7d833', '5814d9fa-49fb-44ab-9304-70245d4f6836', '526c497e-7f5d-4ee8-809b-692c27d62a00', '771d1e22-ae10-46fc-92af-e7eb2df326b4', '10:00:00', '12:00:00', '2.00', '2018-04-22', 'be20e8d1-4717-4ff9-b339-776c28a60dbf');
INSERT INTO `teachingrecord` VALUES ('8a147d4e-ba84-4daa-94ff-8311adac5815', '5814d9fa-49fb-44ab-9304-70245d4f6836', '526c497e-7f5d-4ee8-809b-692c27d62a00', '771d1e22-ae10-46fc-92af-e7eb2df326b4', '09:00:00', '12:15:00', '3.00', '2018-04-01', 'be20e8d1-4717-4ff9-b339-776c28a60dbf');
INSERT INTO `teachingrecord` VALUES ('0e0283ee-21be-42c8-b3ea-ce230f0f185e', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.00', '2018-04-01', 'e1177e52-2982-4dd6-acc2-afab0912bc12');
INSERT INTO `teachingrecord` VALUES ('19eee183-6f26-42bb-9d4e-6a2de1ddb1f6', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.50', '2018-04-15', 'e1177e52-2982-4dd6-acc2-afab0912bc12');
INSERT INTO `teachingrecord` VALUES ('22a5daa7-614a-4e05-89dc-0ba96c299a9e', '92eb657d-e40f-40c5-b61e-a2bf5cabdc55', '86cc94ef-b1c7-423a-8014-05dbc4183b9a', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '16:01:00', '17:01:00', '2.50', '2018-04-29', 'e1177e52-2982-4dd6-acc2-afab0912bc12');
INSERT INTO `teachingrecord` VALUES ('babafd0c-aa12-4e93-868c-7b4274268a2a', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', '8591dca2-85c5-45f2-a103-f7b09ed8962f', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '09:30:00', '12:30:00', '2.50', '2018-04-07', 'd5aba5bf-dbee-4c44-bc19-856c8fb4a028');
INSERT INTO `teachingrecord` VALUES ('b26512b2-dbc5-4e2f-affe-c72fc4b90df6', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', '8591dca2-85c5-45f2-a103-f7b09ed8962f', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '15:00:00', '17:00:00', '2.00', '2018-04-14', 'd5aba5bf-dbee-4c44-bc19-856c8fb4a028');
INSERT INTO `teachingrecord` VALUES ('36e75d03-8d54-4e37-871a-21187dc5bd3b', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', '8591dca2-85c5-45f2-a103-f7b09ed8962f', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '15:00:00', '17:00:00', '2.00', '2018-04-21', 'd5aba5bf-dbee-4c44-bc19-856c8fb4a028');
INSERT INTO `teachingrecord` VALUES ('ac232ce9-e099-4555-b8d5-d9029e32285e', '6e70e2ed-d5f7-4903-bfa3-6c8e6c520105', '8591dca2-85c5-45f2-a103-f7b09ed8962f', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '17:00:00', '19:00:00', '2.00', '2018-04-30', 'd5aba5bf-dbee-4c44-bc19-856c8fb4a028');
INSERT INTO `teachingrecord` VALUES ('e37b7160-8a68-49fb-8241-ee9016e97776', 'e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', 'b21addc3-003c-42be-afaa-ab7064d6e144', '16:01:00', '17:01:00', '2.00', '2018-04-07', '4d169003-0a87-4419-bf67-a9652d7a04cf');
INSERT INTO `teachingrecord` VALUES ('d77dd039-3344-4518-8ac5-117225c35015', 'e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', 'b21addc3-003c-42be-afaa-ab7064d6e144', '16:01:00', '17:01:00', '2.00', '2018-04-14', '4d169003-0a87-4419-bf67-a9652d7a04cf');
INSERT INTO `teachingrecord` VALUES ('11de7870-addc-4ac6-926d-a7883e4249da', 'e10d87f4-b1eb-4b93-b46c-153cd988a403', 'e37770db-2e80-422e-b4d3-e12cab81145a', 'b21addc3-003c-42be-afaa-ab7064d6e144', '16:01:00', '17:01:00', '2.00', '2018-04-21', '4d169003-0a87-4419-bf67-a9652d7a04cf');
INSERT INTO `teachingrecord` VALUES ('49c52237-0036-4c8e-835a-2180dfc384d7', '31464416-5264-4c76-b092-1f9fbd9492b6', '96a03d6a-1452-4c35-870f-479a373c6c5e', '150ee67b-967a-42d4-9e35-1ca1288624ec', '08:40:00', '10:40:00', '2.00', '2018-04-22', 'c41a7d79-d132-4d12-94ab-766269c6ec88');
INSERT INTO `teachingrecord` VALUES ('9dfe49ca-b46a-49bc-abdf-5379cb37dc4e', '31464416-5264-4c76-b092-1f9fbd9492b6', '96a03d6a-1452-4c35-870f-479a373c6c5e', '150ee67b-967a-42d4-9e35-1ca1288624ec', '09:40:00', '11:40:00', '2.00', '2018-04-30', 'c41a7d79-d132-4d12-94ab-766269c6ec88');
INSERT INTO `teachingrecord` VALUES ('0b5043c8-df12-437b-84a0-6f2ba2450377', '9c1f1cf6-2a52-492a-8b44-bfaf50d1d49c', '9461f1df-fa79-4609-88fe-757fd0ccf99c', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', '08:30:00', '11:30:00', '3.00', '2018-04-21', '99df6085-6cb5-4fdf-8f7c-fd205009db2d');
INSERT INTO `teachingrecord` VALUES ('bc0c39f8-25d5-45ad-b040-2c25f2d0ed6c', 'c4687b90-59ee-490e-ad3c-19c1ac078a6d', '878030f0-b55b-4abc-9af7-16947f353ac1', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '15:00:00', '17:00:00', '2.00', '2018-04-05', 'e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6');
INSERT INTO `teachingrecord` VALUES ('ffb9eaad-34de-4427-8e5b-7ba4c5d9a7e8', 'c4687b90-59ee-490e-ad3c-19c1ac078a6d', '878030f0-b55b-4abc-9af7-16947f353ac1', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '15:00:00', '17:00:00', '2.00', '2018-04-15', 'e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6');
INSERT INTO `teachingrecord` VALUES ('ee78c894-2f43-4311-af8a-8bd9e3d7fe3c', 'c4687b90-59ee-490e-ad3c-19c1ac078a6d', '878030f0-b55b-4abc-9af7-16947f353ac1', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '15:00:00', '17:00:00', '2.00', '2018-04-22', 'e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6');
INSERT INTO `teachingrecord` VALUES ('f0b00d92-15d4-4eaa-bfa4-1e0da8afe64d', 'c4687b90-59ee-490e-ad3c-19c1ac078a6d', '878030f0-b55b-4abc-9af7-16947f353ac1', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '15:00:00', '17:00:00', '2.00', '2018-04-30', 'e3c6e7bf-eb4d-46fa-94bf-7b42a59cfef6');
INSERT INTO `teachingrecord` VALUES ('d8013054-5da8-4b4b-ae21-0dc751707f03', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '13:00:00', '16:00:00', '3.00', '2018-04-22', '9119c7df-496f-452b-bdc2-81ebb14e0031');
INSERT INTO `teachingrecord` VALUES ('15ffdec3-f48b-47c2-b047-68c57326ea6d', 'fe4dc516-1b4b-42ad-ba51-5c79f200fa1e', '88ee2a06-b4e2-4880-9513-672587957a5e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '10:00:00', '13:00:00', '3.00', '2018-04-30', '9119c7df-496f-452b-bdc2-81ebb14e0031');
INSERT INTO `teachingrecord` VALUES ('02d836dd-5713-4170-add8-558e85e25eef', '7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '08:00:00', '10:30:00', '2.50', '2018-04-21', '57f309f4-9ec1-4959-840b-6601ca4d9079');
INSERT INTO `teachingrecord` VALUES ('bedf4830-dbd4-4671-8a25-e56338f95714', '7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '19:00:00', '22:00:00', '3.00', '2018-04-24', '57f309f4-9ec1-4959-840b-6601ca4d9079');
INSERT INTO `teachingrecord` VALUES ('25d02131-e89e-46b5-8a91-26e96f6517fc', '7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '19:00:00', '22:00:00', '3.00', '2018-04-27', '57f309f4-9ec1-4959-840b-6601ca4d9079');
INSERT INTO `teachingrecord` VALUES ('695aeb80-cb29-434d-b982-3237bce90f52', '7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '19:00:00', '22:00:00', '3.00', '2018-04-28', '57f309f4-9ec1-4959-840b-6601ca4d9079');
INSERT INTO `teachingrecord` VALUES ('3d6cf2ce-7f09-4dad-9830-f2037583b8fc', '7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '18:40:00', '22:05:00', '3.00', '2018-04-29', '57f309f4-9ec1-4959-840b-6601ca4d9079');
INSERT INTO `teachingrecord` VALUES ('bc40d945-94b7-41b5-8129-4c2b20093a8d', '7f1832d8-58ae-42fa-be61-eabead92fb65', '4683043f-3390-4dd6-98bc-bb193013447e', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '19:00:00', '22:00:00', '3.00', '2018-04-30', '57f309f4-9ec1-4959-840b-6601ca4d9079');
INSERT INTO `teachingrecord` VALUES ('3bd15d17-1490-479b-8cca-736af3cd5395', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-04-03', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('f88e65ec-834c-4632-a8f9-462456e4e21d', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:00:00', '1.50', '2018-04-07', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('2be5e0bc-3a69-494a-bd84-22683d550891', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-04-10', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('3b1b857a-895e-422f-b631-f05a217753f3', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-04-12', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('f71be136-049e-4ee7-bffb-a81fcc0293f8', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-04-19', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('bc647ff9-7cc2-42f3-bc3b-fa5f9c84f20f', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '19:30:00', '20:30:00', '1.00', '2018-04-23', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('fc456d58-e3f6-4fdf-911b-79414c2168d4', '4b99627f-fdf6-4325-a3d6-f5c83a421706', '8392f7d1-9b76-486d-a810-d7f651340a08', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '18:30:00', '20:30:00', '2.00', '2018-04-30', '72f637f3-2368-4b98-a20b-a82fb2f63614');
INSERT INTO `teachingrecord` VALUES ('ad922fc9-bbd6-458a-b14c-c96ebca0e769', '4106e469-d4e3-4069-b8db-b4cd7b8879e4', 'ecf2e2e9-d2e1-43bb-9215-2d79c2feeb68', 'a295affa-be14-48e3-aece-dfad1ea22b6a', '09:30:00', '10:30:00', '1.00', '2018-04-15', '1445e16c-db2f-4659-a470-568e5eef6766');
INSERT INTO `teachingrecord` VALUES ('a28491aa-a936-4032-a727-3b885ca10970', '4106e469-d4e3-4069-b8db-b4cd7b8879e4', 'ecf2e2e9-d2e1-43bb-9215-2d79c2feeb68', 'a295affa-be14-48e3-aece-dfad1ea22b6a', '08:40:00', '10:55:00', '2.00', '2018-04-22', '1445e16c-db2f-4659-a470-568e5eef6766');
INSERT INTO `teachingrecord` VALUES ('b45bc411-af84-411d-b23d-bd55962fdb2e', '4106e469-d4e3-4069-b8db-b4cd7b8879e4', 'ecf2e2e9-d2e1-43bb-9215-2d79c2feeb68', 'a295affa-be14-48e3-aece-dfad1ea22b6a', '08:40:00', '10:50:00', '2.00', '2018-04-29', '1445e16c-db2f-4659-a470-568e5eef6766');
INSERT INTO `teachingrecord` VALUES ('4b3b6e65-fcd9-4bc1-9fdf-d7475f52b8ce', 'd1614c47-e200-4dcd-afc9-3b47b23fae37', '952af6a2-72eb-4fb2-93a0-f04b0658441d', '481db1db-22aa-471a-b321-b69143da727f', '20:00:00', '21:00:00', '1.00', '2018-04-21', '06033fe7-73f0-4c7e-b653-2579c483033f');
INSERT INTO `teachingrecord` VALUES ('f6baa80b-da74-450a-8e89-a4cc305ac308', 'd1614c47-e200-4dcd-afc9-3b47b23fae37', '952af6a2-72eb-4fb2-93a0-f04b0658441d', '481db1db-22aa-471a-b321-b69143da727f', '18:30:00', '20:30:00', '2.00', '2018-04-29', '06033fe7-73f0-4c7e-b653-2579c483033f');
INSERT INTO `teachingrecord` VALUES ('623ca81e-deef-48dd-9e72-d0a289df6860', 'd1614c47-e200-4dcd-afc9-3b47b23fae37', '952af6a2-72eb-4fb2-93a0-f04b0658441d', '481db1db-22aa-471a-b321-b69143da727f', '19:30:00', '21:30:00', '2.00', '2018-04-30', '06033fe7-73f0-4c7e-b653-2579c483033f');
INSERT INTO `teachingrecord` VALUES ('d2885b25-7383-4e85-a5d2-13c89ff66702', 'b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '877e1ad7-3b46-4490-8930-5306cdad94f5', '6c7dae17-0dcb-4263-89b2-ae255883c682', '15:30:00', '17:30:00', '2.00', '2018-03-09', '64c6f291-8c5d-419a-bc65-3e7f461483ff');
INSERT INTO `teachingrecord` VALUES ('782be9cf-f0d1-4602-831f-0790e2962f2a', 'b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '877e1ad7-3b46-4490-8930-5306cdad94f5', '6c7dae17-0dcb-4263-89b2-ae255883c682', '15:30:00', '17:30:00', '2.00', '2018-03-17', '64c6f291-8c5d-419a-bc65-3e7f461483ff');
INSERT INTO `teachingrecord` VALUES ('b9ba232a-5792-44aa-9acf-5e9228fecdfa', 'b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '877e1ad7-3b46-4490-8930-5306cdad94f5', '6c7dae17-0dcb-4263-89b2-ae255883c682', '15:30:00', '17:30:00', '2.00', '2018-03-24', '64c6f291-8c5d-419a-bc65-3e7f461483ff');
INSERT INTO `teachingrecord` VALUES ('5fc68747-763d-458f-8edd-f4d2d0253e0b', 'b7ce6b1d-e5d1-496b-86c4-483d0a5c6d02', '877e1ad7-3b46-4490-8930-5306cdad94f5', '6c7dae17-0dcb-4263-89b2-ae255883c682', '15:30:00', '17:30:00', '2.00', '2018-03-27', '64c6f291-8c5d-419a-bc65-3e7f461483ff');
INSERT INTO `teachingrecord` VALUES ('23ca0e33-d0d9-4284-850a-504fb5832826', 'eb16769b-010f-4f88-ae0b-4e0cb99086f0', '5d4bff69-5146-45da-850a-da1af1b79e0f', '58a28496-ac22-42cb-991e-899bc221076e', '20:00:00', '22:00:00', '1.00', '2018-04-17', 'afb119c7-ca8f-421a-82f9-a946635273f7');
INSERT INTO `teachingrecord` VALUES ('7f55133a-67b6-4cf0-a9ea-23bad28c6f3a', 'eb16769b-010f-4f88-ae0b-4e0cb99086f0', '5d4bff69-5146-45da-850a-da1af1b79e0f', '58a28496-ac22-42cb-991e-899bc221076e', '14:00:00', '16:00:00', '1.00', '2018-04-22', 'afb119c7-ca8f-421a-82f9-a946635273f7');
INSERT INTO `teachingrecord` VALUES ('93032a21-3aad-4a46-8ce8-c47d81200ae8', 'eb16769b-010f-4f88-ae0b-4e0cb99086f0', '5d4bff69-5146-45da-850a-da1af1b79e0f', '58a28496-ac22-42cb-991e-899bc221076e', '20:00:00', '22:00:00', '1.00', '2018-04-24', 'afb119c7-ca8f-421a-82f9-a946635273f7');
INSERT INTO `teachingrecord` VALUES ('f860307a-3923-45c0-9fbb-d7d185a64fe9', 'eb16769b-010f-4f88-ae0b-4e0cb99086f0', '5d4bff69-5146-45da-850a-da1af1b79e0f', '58a28496-ac22-42cb-991e-899bc221076e', '19:30:00', '21:30:00', '1.00', '2018-04-30', 'afb119c7-ca8f-421a-82f9-a946635273f7');
INSERT INTO `teachingrecord` VALUES ('20b9ebd2-4793-4f27-b489-39a96e2ddb0d', '4ba8c060-9f43-4d91-8c5f-bf1034009612', 'f4b3a0d4-89fe-471c-b74e-ce2d5875e10b', '9321916c-1b48-4d88-84eb-1303b2efd648', '08:00:00', '11:00:00', '2.00', '2018-04-29', 'c26474c5-c5c5-42fa-a94a-88f318bfd288');
INSERT INTO `teachingrecord` VALUES ('b27be88c-1423-43c1-9584-26b8deab608d', '4ba8c060-9f43-4d91-8c5f-bf1034009612', 'f4b3a0d4-89fe-471c-b74e-ce2d5875e10b', '9321916c-1b48-4d88-84eb-1303b2efd648', '08:00:00', '11:30:00', '2.50', '2018-04-30', 'c26474c5-c5c5-42fa-a94a-88f318bfd288');
INSERT INTO `teachingrecord` VALUES ('33c51dc6-f405-46c3-95db-9aef0e2228af', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '09:00:00', '11:00:00', '2.00', '2018-04-01', 'a7ba65db-23a0-4d41-84f1-a334525e4adb');
INSERT INTO `teachingrecord` VALUES ('4247e632-13fe-4e98-8b73-24abbbb32618', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '09:00:00', '11:00:00', '2.00', '2018-04-15', 'a7ba65db-23a0-4d41-84f1-a334525e4adb');
INSERT INTO `teachingrecord` VALUES ('320216a9-db4a-4a01-9868-9dcfb235491d', 'f371aeda-adc3-4cd6-9da2-aca6e5509aa7', 'eebc4ed1-ff1e-4598-a9d8-9e993af68360', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '14:00:00', '16:00:00', '2.00', '2018-04-22', 'a7ba65db-23a0-4d41-84f1-a334525e4adb');
INSERT INTO `teachingrecord` VALUES ('f6754279-92a3-4a9b-b5c1-b20c452e3e2b', 'bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'cec19c3d-e59f-48e9-8e55-6a06a88ae298', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '11:00:00', '12:00:00', '1.00', '2018-04-01', '3b636c17-80b6-4948-b071-e723ca266185');
INSERT INTO `teachingrecord` VALUES ('8cf18c92-9830-4ed4-a7b3-c5921f976939', 'bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'cec19c3d-e59f-48e9-8e55-6a06a88ae298', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '09:00:00', '12:00:00', '3.00', '2018-04-06', '3b636c17-80b6-4948-b071-e723ca266185');
INSERT INTO `teachingrecord` VALUES ('b817bfcc-82b9-4783-ba08-ff74ea1b1ce9', 'bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'cec19c3d-e59f-48e9-8e55-6a06a88ae298', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '09:00:00', '12:00:00', '3.00', '2018-04-15', '3b636c17-80b6-4948-b071-e723ca266185');
INSERT INTO `teachingrecord` VALUES ('32899e3a-e95b-443b-b5fa-c3fa04b2e019', 'bbcd0381-1fe7-4c13-9eff-71fced57f12e', 'cec19c3d-e59f-48e9-8e55-6a06a88ae298', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '09:00:00', '12:00:00', '3.00', '2018-04-22', '3b636c17-80b6-4948-b071-e723ca266185');
INSERT INTO `teachingrecord` VALUES ('43842d50-960a-4745-b54d-d9be11dca38c', 'd7eb7185-cfa1-4e18-b0ee-400b78264e84', 'c6460f0b-6535-40f7-aa01-936c9c942ef6', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '19:00:00', '21:00:00', '2.00', '2018-04-24', 'bf2ccb37-6fc7-44c3-bb14-f997624b41c1');
INSERT INTO `teachingrecord` VALUES ('a43c2e87-5a3b-402f-96fc-33d5bbe0ca20', 'd7eb7185-cfa1-4e18-b0ee-400b78264e84', 'c6460f0b-6535-40f7-aa01-936c9c942ef6', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '19:00:00', '21:15:00', '2.00', '2018-04-25', 'bf2ccb37-6fc7-44c3-bb14-f997624b41c1');
INSERT INTO `teachingrecord` VALUES ('2aa9e8ee-5c0f-49b6-8719-a30da347abfd', 'd7eb7185-cfa1-4e18-b0ee-400b78264e84', 'c6460f0b-6535-40f7-aa01-936c9c942ef6', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '08:00:00', '10:00:00', '2.00', '2018-04-29', 'bf2ccb37-6fc7-44c3-bb14-f997624b41c1');
INSERT INTO `teachingrecord` VALUES ('08f96563-62de-407f-9a67-be4e5783ac80', 'd7eb7185-cfa1-4e18-b0ee-400b78264e84', 'c6460f0b-6535-40f7-aa01-936c9c942ef6', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '08:00:00', '10:00:00', '2.00', '2018-04-30', 'bf2ccb37-6fc7-44c3-bb14-f997624b41c1');
INSERT INTO `teachingrecord` VALUES ('d87caab7-bba6-43eb-bb26-e994daaa28f7', '2958a37f-63b0-43ae-a608-1dbc06565d7e', 'e860f44e-bb13-46da-974a-1318c409b0df', '0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '09:00:00', '11:30:00', '0.00', '2018-04-30', 'b9623f4f-e5ae-4f49-a531-59cc431c6574');
INSERT INTO `teachingrecord` VALUES ('dee1a756-7d4a-441d-aa54-8461ce11ed9b', '3f62df1a-7ce8-4d41-9476-aec52a3c267d', '878030f0-b55b-4abc-9af7-16947f353ac1', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '09:30:00', '11:30:00', '2.00', '2018-04-01', 'aca000ef-ec2d-4753-99c9-9195c41e182e');
INSERT INTO `teachingrecord` VALUES ('62dad08e-26c8-4ed9-b5c6-1ce7bd8bc614', '3f62df1a-7ce8-4d41-9476-aec52a3c267d', '878030f0-b55b-4abc-9af7-16947f353ac1', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '09:30:00', '11:30:00', '2.00', '2018-04-15', 'aca000ef-ec2d-4753-99c9-9195c41e182e');
INSERT INTO `teachingrecord` VALUES ('74e9dfd6-f926-40c9-a9bb-14a7f677acce', '3f62df1a-7ce8-4d41-9476-aec52a3c267d', '878030f0-b55b-4abc-9af7-16947f353ac1', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '09:30:00', '11:30:00', '2.00', '2018-04-30', 'aca000ef-ec2d-4753-99c9-9195c41e182e');
INSERT INTO `teachingrecord` VALUES ('cd3844e1-b0c8-45a1-afe8-2194a45d7017', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-04', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('4f254945-1fd9-4bb2-8a1c-1f7a4e09931a', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '09:00:00', '12:00:00', '3.00', '2018-04-07', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('6214eb56-90eb-427d-984a-b23386332354', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-11', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('cb49c5e8-664c-4daf-9c92-98bd71e7d97f', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '09:00:00', '12:00:00', '3.00', '2018-04-14', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('6bb876dc-dffc-4831-b7e8-13118fd7c112', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-15', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('755ce25c-4a34-4850-9277-c58fb54159c2', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-17', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('a9326aec-6981-4b80-86ce-2b48a14cad74', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-18', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('3d7dd51f-a469-4071-b648-0a9060ae9370', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '13:00:00', '15:00:00', '2.00', '2018-04-20', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('ad3ea41e-4d02-4c63-aca3-a8c9af2eb100', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-25', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('4d5a2ede-2c53-45eb-bed4-deea7d17946b', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '19:20:00', '21:20:00', '2.00', '2018-04-27', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('d1213ea9-3048-41e8-a6c3-d8d188305b2f', '5af60a58-368f-4d40-b522-49a685f977d8', 'caf0c16c-3601-4919-96db-c0d55d1f1aca', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '09:00:00', '13:00:00', '4.00', '2018-04-30', 'afe806b3-6f98-4eec-9f1e-5f820a6ddfd3');
INSERT INTO `teachingrecord` VALUES ('120da7de-b30a-4c47-a90f-98a01e87e611', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '19:00:00', '20:00:00', '1.00', '2018-04-13', '23db0e70-81c2-45b1-b09e-15d4346f6265');
INSERT INTO `teachingrecord` VALUES ('7d3b1426-35a7-4696-aa20-ad0be23ac430', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '19:00:00', '20:00:00', '1.00', '2018-04-15', '23db0e70-81c2-45b1-b09e-15d4346f6265');
INSERT INTO `teachingrecord` VALUES ('3bfa69d6-e3c3-49fe-9e7c-ae7295fdcb18', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', null, null, '1.00', '2018-04-18', '23db0e70-81c2-45b1-b09e-15d4346f6265');
INSERT INTO `teachingrecord` VALUES ('9a738f8f-7d23-4502-9d95-0b7894ecbe4d', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', null, '17:01:00', '1.00', '2018-04-20', '23db0e70-81c2-45b1-b09e-15d4346f6265');
INSERT INTO `teachingrecord` VALUES ('924b59d5-d7e4-47e8-927a-14d7705636ab', 'b2ef7eeb-9a4f-4566-9486-2e47f8e38e73', '319213ea-758b-42cb-a834-4a8e1997e16b', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '16:01:00', null, '2.00', '2018-04-27', '23db0e70-81c2-45b1-b09e-15d4346f6265');
INSERT INTO `teachingrecord` VALUES ('cc21a43b-aba2-4782-af7b-01caf07c3d95', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '16:01:00', '17:01:00', '2.30', '2018-04-05', '2e767d76-bfd1-4b26-9eba-fd162d04bed4');
INSERT INTO `teachingrecord` VALUES ('f02c0456-44a0-41d4-8562-df49ec256bec', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '13:00:00', '15:05:00', '2.10', '2018-04-05', '2e767d76-bfd1-4b26-9eba-fd162d04bed4');
INSERT INTO `teachingrecord` VALUES ('fc7a300c-2c87-4014-be41-def04fd3c89a', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '16:01:00', '17:01:00', '2.40', '2018-04-06', '2e767d76-bfd1-4b26-9eba-fd162d04bed4');
INSERT INTO `teachingrecord` VALUES ('7a1bc1d0-4245-4baa-b00f-949d71ea75f8', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '16:01:00', '17:01:00', '2.20', '2018-04-13', '2e767d76-bfd1-4b26-9eba-fd162d04bed4');
INSERT INTO `teachingrecord` VALUES ('b3b7d711-cde0-453e-8252-caa32af9a219', '63aa4adc-bf6f-49c2-8164-f93bf08df35e', '73a3c5ee-9b27-4efa-93da-f7b339d584d6', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '19:40:00', '20:40:00', '1.00', '2018-04-19', '2e767d76-bfd1-4b26-9eba-fd162d04bed4');
INSERT INTO `teachingrecord` VALUES ('05a0fe74-e87b-4986-ba5a-66f4e85f27e3', 'e497b4ec-2aea-4dde-8022-398563cace59', 'cac4f35f-5bbf-47fb-8143-0e47990c8465', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '15:00:00', '17:00:00', '2.00', '2018-04-30', '5fae87e3-9765-488b-b853-096fe8764be4');
INSERT INTO `teachingrecord` VALUES ('4a5a865c-45d7-4be8-89f9-bef27fbdc49a', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '2.00', '2018-04-05', '4d6234b4-2f45-4eda-b5f4-8a49e8320e38');
INSERT INTO `teachingrecord` VALUES ('24723bb9-9036-4a6f-8b73-14061d5a4fce', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '3.00', '2018-04-05', '4d6234b4-2f45-4eda-b5f4-8a49e8320e38');
INSERT INTO `teachingrecord` VALUES ('5a504b0a-8cd6-41a5-968e-2f2320c21b4a', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '2.00', '2018-04-14', '4d6234b4-2f45-4eda-b5f4-8a49e8320e38');
INSERT INTO `teachingrecord` VALUES ('4139adb4-e739-458e-aa5a-4d483e0ab66f', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '3.00', '2018-04-15', '4d6234b4-2f45-4eda-b5f4-8a49e8320e38');
INSERT INTO `teachingrecord` VALUES ('0fd9703f-a6a1-4a42-924e-16d6c396e63a', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '3.00', '2018-04-22', '4d6234b4-2f45-4eda-b5f4-8a49e8320e38');
INSERT INTO `teachingrecord` VALUES ('d8489468-40a7-45a3-ac64-2517ce2442ef', '1338d07a-9243-4d1f-81d0-f7dbd35c30d4', 'c21fa5ed-9088-44c5-a774-29575d51d250', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '3.00', '2018-04-22', '4d6234b4-2f45-4eda-b5f4-8a49e8320e38');
INSERT INTO `teachingrecord` VALUES ('ab48743e-7708-4c5c-9983-d4060928b2c1', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '14:10:00', '16:10:00', '2.00', '2018-04-01', '04239796-feec-4efb-81c5-ee2cb08b49b9');
INSERT INTO `teachingrecord` VALUES ('fd611941-54c5-4a5c-9c49-f80dea46e2ac', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '09:00:00', '11:00:00', '2.00', '2018-04-08', '04239796-feec-4efb-81c5-ee2cb08b49b9');
INSERT INTO `teachingrecord` VALUES ('c126ba87-4345-48ce-9ff5-8235427d9de6', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '14:25:00', '16:25:00', '2.00', '2018-04-15', '04239796-feec-4efb-81c5-ee2cb08b49b9');
INSERT INTO `teachingrecord` VALUES ('661d4aad-7098-49a3-b275-cab0f1f6532a', 'ebc09d4b-50c3-4b6c-abf4-a9afe3f8fe67', '8c8f8c94-e11d-482f-851d-b6bf8b95b7ef', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '09:00:00', '11:00:00', '2.00', '2018-04-30', '04239796-feec-4efb-81c5-ee2cb08b49b9');
INSERT INTO `teachingrecord` VALUES ('3b1ccb44-a504-4a3f-95b7-9afd63a9eef1', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '2.00', '2018-04-14', 'a30e5f3f-3cf5-4439-94ae-666ac78bc050');
INSERT INTO `teachingrecord` VALUES ('1aeae758-1986-4a02-b581-dad71a27ba53', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '2.00', '2018-04-29', 'a30e5f3f-3cf5-4439-94ae-666ac78bc050');
INSERT INTO `teachingrecord` VALUES ('2d60ad8e-f140-4fc8-8e34-09b1fa017da2', '2a7464f7-5ed9-4d65-98d4-82ba3f3e76c3', '88ee2a06-b4e2-4880-9513-672587957a5e', '19115f9c-d7d6-4415-baab-27cb4973ce98', '16:01:00', '17:01:00', '2.00', '2018-04-29', 'a30e5f3f-3cf5-4439-94ae-666ac78bc050');
INSERT INTO `teachingrecord` VALUES ('f16083f7-3e93-4ff2-9d0a-d6a7d6a26a35', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '09:30:00', '11:30:00', '2.00', '2018-04-14', '73dccda3-543b-4441-8bf0-e9628f179524');
INSERT INTO `teachingrecord` VALUES ('ee7bfe0e-b11f-4835-83cc-914ca1a6c52e', 'a93762e3-28ab-46b2-9793-8c73229268ca', '3e3e12a1-6d28-4f52-a133-ad3ce6eaf239', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '10:00:00', '12:00:00', '2.00', '2018-04-29', '73dccda3-543b-4441-8bf0-e9628f179524');
INSERT INTO `teachingrecord` VALUES ('fd80c9e0-7d0f-48a6-8015-c620a5c1ab64', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '15:00:00', '17:00:00', '2.00', '2018-04-01', '2180bcc5-a7eb-4239-b8af-889d3e48cbe5');
INSERT INTO `teachingrecord` VALUES ('391f2d83-03f0-46ab-9518-293a64c7535a', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '15:00:00', '17:00:00', '2.00', '2018-04-15', '2180bcc5-a7eb-4239-b8af-889d3e48cbe5');
INSERT INTO `teachingrecord` VALUES ('e5ecf926-bd2c-465f-ba24-1b873ccab286', 'bcaa2ecb-16b5-40b9-9bea-b00557d92ed2', '8fb5244d-6bba-4959-9760-e64f77fe8370', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '13:00:00', '15:00:00', '2.00', '2018-04-29', '2180bcc5-a7eb-4239-b8af-889d3e48cbe5');
INSERT INTO `teachingrecord` VALUES ('42bd5dc4-5ab9-4bd4-af2c-c25044089bc4', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '1.00', '2018-04-03', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('e70cb9e7-5aed-4cc3-8838-521bf3788d24', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '3.00', '2018-04-04', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('28287c3d-db16-4f42-979a-250eea42a522', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '22:30:00', '2.00', '2018-04-04', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('261a894a-5a3f-4749-943b-704550f63190', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '3.00', '2018-04-05', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('90a002b6-1828-4778-b2b2-ba7407b5595f', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '2.00', '2018-04-05', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('1460b60f-7a5b-43dd-8b68-3834b704054d', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '1.50', '2018-04-15', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('7fbe4c4a-f334-4f07-a1d6-caf1a1ce9ef6', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '1.00', '2018-04-16', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('eb703b88-0480-4b7d-a062-095079c34354', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '1.00', '2018-04-18', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('8504f776-45a3-4522-9101-bb130a582f53', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '3.00', '2018-04-21', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('60fbe768-5c96-48f4-b478-bd47cfe0b1ee', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '2.00', '2018-04-22', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('1ed8e31f-4ea6-4a86-841c-87c00477fd3d', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '1.00', '2018-04-28', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('bda84f73-04a6-4525-851c-4632a7c8d9e0', '487bd9a3-57b1-4583-8802-f614c2ded24e', '5af23dd7-52fb-4564-a13f-b3dfbadbff83', 'db66fd38-466a-4620-9890-6abb10a67a22', '16:01:00', '17:01:00', '1.00', '2018-04-29', '35921486-52bc-4a00-8c36-5971ad136feb');
INSERT INTO `teachingrecord` VALUES ('4df86dd2-c8df-4c00-bfae-46eec33ce86d', '9a6f431b-e8b9-4491-b4e8-1ed309cd16be', '06a0d7ed-f1b8-434d-b7f2-e97205db773a', 'df1de484-42a5-4545-bb78-ecef591a7757', '19:00:00', '21:15:00', '2.00', '2018-04-06', '7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf');
INSERT INTO `teachingrecord` VALUES ('0f74bd38-4c9c-48db-8777-76c8a5a6383b', '9a6f431b-e8b9-4491-b4e8-1ed309cd16be', '06a0d7ed-f1b8-434d-b7f2-e97205db773a', 'df1de484-42a5-4545-bb78-ecef591a7757', '19:00:00', '21:15:00', '2.00', '2018-04-14', '7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf');
INSERT INTO `teachingrecord` VALUES ('04931f9a-3d79-4ce5-9446-3d8a0e0fc377', '9a6f431b-e8b9-4491-b4e8-1ed309cd16be', '06a0d7ed-f1b8-434d-b7f2-e97205db773a', 'df1de484-42a5-4545-bb78-ecef591a7757', '15:30:00', '18:00:00', '2.00', '2018-04-21', '7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf');
INSERT INTO `teachingrecord` VALUES ('cc0e6fa6-f828-4804-9719-f77900010e7f', '9a6f431b-e8b9-4491-b4e8-1ed309cd16be', '06a0d7ed-f1b8-434d-b7f2-e97205db773a', 'df1de484-42a5-4545-bb78-ecef591a7757', '14:00:00', '16:20:00', '2.00', '2018-04-29', '7bdcd928-07bb-4bd6-bfca-6a95b8f0c0cf');
INSERT INTO `teachingrecord` VALUES ('8c076c58-c326-4167-b7b9-4ffc982d5f90', 'b3406a31-d46f-490b-ae07-611568f28075', '98f75a62-a434-4f5d-87b1-77fab08d832b', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '09:30:00', '11:30:00', '2.00', '2018-04-29', '7dffb4c4-d660-43a5-b2dd-992f114c4798');
INSERT INTO `teachingrecord` VALUES ('28312e39-ffe3-4eea-98c6-86544b712bb4', 'b3406a31-d46f-490b-ae07-611568f28075', '98f75a62-a434-4f5d-87b1-77fab08d832b', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '09:30:00', '11:30:00', '2.00', '2018-04-30', '7dffb4c4-d660-43a5-b2dd-992f114c4798');
INSERT INTO `teachingrecord` VALUES ('61b1779b-321c-42af-8cc8-d0a14923f6ea', '5643eb54-af69-48f5-8680-37c8a9076677', '127f313b-6c0f-4f6f-8909-8fede191732e', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '16:01:00', '17:01:00', '1.00', '2018-04-01', 'ac23f69e-1c3e-4d13-a916-d6eb051fee20');
INSERT INTO `teachingrecord` VALUES ('08bf219c-7fec-4099-9243-3395d18ffe37', 'c6c96bcb-068b-4c03-af6b-9a855737bffd', '57690f2e-484f-466a-943d-6ae8b5eee0d7', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '19:00:00', '21:00:00', '2.00', '2018-04-15', 'd4b55546-74f3-4efe-9f5e-71b7c0e74b78');
INSERT INTO `teachingrecord` VALUES ('bf159596-ccb7-450e-b9ad-7e39f4c86a8d', 'c6c96bcb-068b-4c03-af6b-9a855737bffd', '57690f2e-484f-466a-943d-6ae8b5eee0d7', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '19:00:00', '21:00:00', '2.50', '2018-04-22', 'd4b55546-74f3-4efe-9f5e-71b7c0e74b78');
INSERT INTO `teachingrecord` VALUES ('a190341e-36aa-4f24-a216-8cb81949b0e4', 'c6c96bcb-068b-4c03-af6b-9a855737bffd', '57690f2e-484f-466a-943d-6ae8b5eee0d7', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '09:30:00', '11:30:00', '2.00', '2018-04-29', 'd4b55546-74f3-4efe-9f5e-71b7c0e74b78');

-- ----------------------------
-- Table structure for tradecomplains
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
INSERT INTO `tradecomplains` VALUES ('ae779e32-4ea9-43da-8ef7-9d05a2995bd8', '投诉抱怨！', '2018-03-31 03:21:41', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `tradecomplains` VALUES ('0edef0da-d2b2-4041-8ae3-1551ffe4a0a0', '老师擅自提价', '2018-04-01 21:37:10', 'ffb18612-b184-4291-b49f-5336cf8a913b');
INSERT INTO `tradecomplains` VALUES ('d668d2b7-1808-419d-868e-9a76e91ddb6b', '老师不备课', '2018-04-11 00:55:24', 'ffb18612-b184-4291-b49f-5336cf8a913b');

-- ----------------------------
-- Table structure for user
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
INSERT INTO `user` VALUES ('15576897865', '15576897865', '666teacher666', '897865', '3', '0', '0', '', '???', 'http://wx.qlogo.cn/mmopen/vi_32/zEzJYYyj4pmDOuBBmYU33kzQZglnIfFnvQ11FRd3CD5az3S2RYSJxuyX9ibvb3ILluH6n2SXOmojo2PxgD3QBrQ/132');
INSERT INTO `user` VALUES ('admin', 'yduiytech', 'admin', 'xiaoyi520', '0', '0', '0', null, 'admin', null);
INSERT INTO `user` VALUES ('4bf9257e-198a-4c9d-af02-74eb7a9fa4d3', '19356784567', '4bf9257e-198a-4c9d-af02-74eb7a9fa4d3', '784567', '3', '1', '0', '', '刘嬷嬷', 'a201a42f-c557-4803-9895-5b74068bbcab');
INSERT INTO `user` VALUES ('24652540-af54-4120-abc8-79d166778f82', '1557876535', '24652540-af54-4120-abc8-79d166778f82', '876535', '3', '1', '0', '', '测试老师2', '7e66a9ab-b9c3-4127-a11e-e3bbf02167d0');
INSERT INTO `user` VALUES ('ffb18612-b184-4291-b49f-5336cf8a913b', '18675123456', 'ffb18612-b184-4291-b49f-5336cf8a913b', '123456', '3', '1', '0', 'oQHVE00HAWuiDqD8zQb1Zun4cfxo', '高级老师', '6ea548c5-fc9c-4ccb-9c45-8c4899623819');
INSERT INTO `user` VALUES ('63617903-e130-40ed-bb2f-b8ff2effb2fe', '15580830349', '63617903-e130-40ed-bb2f-b8ff2effb2fe', '830349', '3', '1', '0', '', '刘国臣测试', '7439dd0a-65c3-4fea-9829-c09a91d433a3');
INSERT INTO `user` VALUES ('aea4c9de-9d1a-4992-aaf4-f492b4657e96', '18397413862', 'aea4c9de-9d1a-4992-aaf4-f492b4657e96', '413862', '3', '1', '1', '', '向嘉博', 'c623daa1-3bdd-4740-a728-f3d43de47d0b');
INSERT INTO `user` VALUES ('dd467ff5-3e89-47b3-b8e3-4b49781ad336', '15981671529', 'dd467ff5-3e89-47b3-b8e3-4b49781ad336', '671529', '3', '1', '1', 'oQHVE0ztpyGDacM17J9gUhsg902A', '谢新茹', '99af6fd4-c1f5-4a58-bf1f-dd981d0a10e7');
INSERT INTO `user` VALUES ('7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '15367487002', '7ff80d0e-b854-4c4b-9d52-84fddf06aba4', '487002', '3', '1', '0', '', '冯龙兴', 'd775d3bc-f859-4ff9-bb92-e76669ac5c71');
INSERT INTO `user` VALUES ('16684d26-3d14-45ff-8c3f-112d739be006', '18774839836', '16684d26-3d14-45ff-8c3f-112d739be006', '839836', '3', '1', '1', 'oQHVE0wbkoCTLUB84WY10dk8TPf8', '吴月颖', '21d5d442-8052-43c0-9e23-543018059625');
INSERT INTO `user` VALUES ('b21addc3-003c-42be-afaa-ab7064d6e144', '15084762874', 'b21addc3-003c-42be-afaa-ab7064d6e144', '762874', '3', '1', '0', 'oQHVE01BjMXXYEH839qxPpPWzrZE', '崔向影', '456d056f-25ff-4c65-a77e-23a1a2084a52');
INSERT INTO `user` VALUES ('8124288f-6f07-4cd0-a1ec-37a4e2171adb', '1365785997', '8124288f-6f07-4cd0-a1ec-37a4e2171adb', '785997', '3', '0', '0', '', '麻万明', '2432cad4-aff7-4382-a772-09662b7113b2');
INSERT INTO `user` VALUES ('377be561-9aaf-43a2-8a0d-9b601021c0e0', '18774975537', '377be561-9aaf-43a2-8a0d-9b601021c0e0', '975537', '3', '1', '1', 'oQHVE01yvJYAJ5TFf4Fnb5t60Geo', '陈皓', '9ee049ff-2e20-4655-9d2b-4cb7fe814566');
INSERT INTO `user` VALUES ('537f3647-8444-4525-94c9-5af57c3f55e8', '15274810285', '537f3647-8444-4525-94c9-5af57c3f55e8', '810285', '3', '1', '0', 'oQHVE0__OBirzA0WnguedUOqpEJ4', '徐慧颖', 'e23d7bca-6405-4c49-8b7f-14fe663ee4d4');
INSERT INTO `user` VALUES ('41816287-35ca-4235-bc89-ba2a2cb4abe1', '18154217405', '41816287-35ca-4235-bc89-ba2a2cb4abe1', '217405', '3', '0', '1', '', '程凡', 'efd06f65-eef6-410f-8f0c-36621ea31a86');
INSERT INTO `user` VALUES ('804e7d46-39ed-44e9-9ab4-cf06fac44d60', '18273120371', '804e7d46-39ed-44e9-9ab4-cf06fac44d60', '120371', '3', '1', '1', 'oQHVE0z70ZTYwxCF0aiMuj78Ygzo', '朱晓龙', 'c1f40a57-7146-4a06-9e62-c50f6f75bfbf');
INSERT INTO `user` VALUES ('e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '18373150752', 'e0c19e80-9df2-415e-b2a3-09d9aa37e5de', '150752', '3', '1', '0', 'oQHVE01-IyhcNUk0j0IILikXF9n0', '陈松', 'ca67e8ef-09d5-466b-a796-82622add5cac');
INSERT INTO `user` VALUES ('2bce5e19-c656-46ca-aa3b-5b5a0845c279', '13278881603', '2bce5e19-c656-46ca-aa3b-5b5a0845c279', '881603', '3', '1', '1', 'oQHVE06Ug-VWriy_SFgycIAut_Ls', '吴洋', '92c4b1f0-1f6e-4fa4-8bab-f3f28a31895f');
INSERT INTO `user` VALUES ('643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '13545212652', '643e1ad0-ecd9-449c-8f42-9f8277ea77d3', '212652', '3', '1', '0', 'oQHVE075Ist7NrIynO0jPZthCHwg', '夏欣研', 'e88ffb63-b250-44bc-9083-3324cba01eb0');
INSERT INTO `user` VALUES ('cbe83e91-b829-4dd8-b852-e1937c450fe9', '17375876043', 'cbe83e91-b829-4dd8-b852-e1937c450fe9', '876043', '3', '1', '1', '', '齐宁', 'e05ca04a-ccca-4ee9-bb9a-383acab20a3c');
INSERT INTO `user` VALUES ('27b5a1a7-624f-40e1-9359-9196d0261133', '15111016224', '27b5a1a7-624f-40e1-9359-9196d0261133', '016224', '3', '1', '1', 'oQHVE04YURQ-HcckCC9rhhW3Ctrg', '姜波', 'bc9b247d-70e7-4bcd-b8be-aa4d3721984b');
INSERT INTO `user` VALUES ('23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '13142008762', '23d7a685-8a7a-4751-8e4a-2c125d6b4d0e', '008762', '3', '1', '0', 'oQHVE0xCd_ZrBK7hdt_qh00vfwD8', '胡潇羽', '4e97532e-22ac-492b-a118-89a5c6b31c3c');
INSERT INTO `user` VALUES ('fdca369d-d683-4aaf-ac12-cc7b37805d28', '18569400050', 'fdca369d-d683-4aaf-ac12-cc7b37805d28', '400050', '3', '1', '1', 'oQHVE02FYU1agk2nKZa_gRhfrl58', '吕向前', 'bc0be7a4-38e6-4366-a74e-903d322e4b0a');
INSERT INTO `user` VALUES ('d2db87ee-8e5c-42e9-aff0-487b0cdf5369', '13635562695', 'd2db87ee-8e5c-42e9-aff0-487b0cdf5369', '562695', '3', '1', '1', 'oQHVE05svxvYq0B41xk9QDCe-n-w', '张文慧', '15a7c808-098b-4e8d-9f19-1022b6d5b387');
INSERT INTO `user` VALUES ('26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '15111095615', '26a2ce0d-0e73-4c28-bea6-dfd0df0515d1', '095615', '3', '1', '1', 'oQHVE06FdnB1_VBLYhA7W7VORTZE', '左博聪', '4583b87a-1eb3-4cfb-9a47-f1af60d01467');
INSERT INTO `user` VALUES ('cb02a37b-79d1-42fe-97e3-d1f9381e502d', '18174451062', 'cb02a37b-79d1-42fe-97e3-d1f9381e502d', '451062', '3', '1', '1', 'oQHVE06iHuZqDvqrsRr-a2vkWqDk', '邢凯迪', '1394814e-1348-4132-90cd-ac01732facd5');
INSERT INTO `user` VALUES ('8720b7bd-d7f8-4332-8254-1dee6e6ee071', '13667337306', '8720b7bd-d7f8-4332-8254-1dee6e6ee071', '337306', '3', '1', '1', 'oQHVE0wakJf02f3mULTcytPVJqF4', '王宁', '1cc35afa-391b-49dc-a0bb-5f401eaf56f0');
INSERT INTO `user` VALUES ('167b5e9e-8e57-4549-91cd-c10802eadaf8', '17308416020', '167b5e9e-8e57-4549-91cd-c10802eadaf8', '416020', '3', '1', '1', '', '陈娴', '64a7f49d-15db-48dd-9e50-044c15314a33');
INSERT INTO `user` VALUES ('853a2f31-f902-489c-8b7c-bea062277833', '13909620950', '853a2f31-f902-489c-8b7c-bea062277833', '620950', '3', '1', '0', 'oQHVE0yIjju4ZGFWKRgHqQrqWk_E', '薛潇', '8d4c35e9-dcad-44ff-a297-c55789914717');
INSERT INTO `user` VALUES ('ec0a82c0-6f1c-4561-b8bf-195cac02796b', '18390987440', 'ec0a82c0-6f1c-4561-b8bf-195cac02796b', '987440', '3', '0', '1', '', '姜蕊', '6d766a4c-edcf-4ec4-97d1-f8eef55f3d7a');
INSERT INTO `user` VALUES ('e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '18272057850', 'e9c0b09a-2b6c-4b1e-a0a5-be82b1181513', '057850', '3', '0', '0', '', '胡嘉欣', 'd6484e68-7a9a-4fca-812c-1bdb64a951e3');
INSERT INTO `user` VALUES ('edbfe293-e3a9-4062-8df4-318c836dd7e2', '18670308329', 'edbfe293-e3a9-4062-8df4-318c836dd7e2', '308329', '3', '1', '1', 'oQHVE003YUsVEQ3ZpwLpEYI3VnYI', '李东刚', 'fb43828f-b728-405c-9b0d-a71668e4b977');
INSERT INTO `user` VALUES ('f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', '15587976896', 'f34625c2-4155-4508-a0e1-b7cd9d8dfbfb', '976896', '3', '0', '0', '', 'ceshiliulaoshi', '961c91e1-0607-4dea-ba8d-c96a1cb18315');
INSERT INTO `user` VALUES ('b024e47e-4427-4fb2-95d6-3cf3b42aa135', '13657485997', 'b024e47e-4427-4fb2-95d6-3cf3b42aa135', '485997', '3', '0', '0', '', '麻万明', '5c9eed81-ccfb-4a27-928d-52756f3362d8');
INSERT INTO `user` VALUES ('dc9620b4-021a-4809-a238-7f83c80b636b', '156748563148', 'dc9620b4-021a-4809-a238-7f83c80b636b', '563148', '3', '0', '0', '', '向梦天', '033df2d9-d160-45df-9020-2be7a32638ce');
INSERT INTO `user` VALUES ('bba97bb5-2d8c-4977-a009-bf59e82fb6af', '15526459605', 'bba97bb5-2d8c-4977-a009-bf59e82fb6af', '459605', '3', '1', '1', 'oQHVE04raoFjtMPVA3h6Htz7_CPY', '李莹庆', '0a4afa55-db09-4bd1-8c38-82d93edc6d70');
INSERT INTO `user` VALUES ('b1f1a4a6-c55a-4e64-a254-53a151b55ce5', '15893095795', 'b1f1a4a6-c55a-4e64-a254-53a151b55ce5', '095795', '3', '1', '1', '', '侯晚晴', 'b2e69f4a-bafa-4a08-b96c-a1706210804a');
INSERT INTO `user` VALUES ('c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '15574804640', 'c6cd1748-4b50-4c1f-a2b6-564397ebccdb', '804640', '3', '1', '1', 'oQHVE02MP7TCMAEvhKe95COAZZHc', '张荣旺', '258e2acf-80db-4642-ad89-0fcbd6b5731b');
INSERT INTO `user` VALUES ('76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '18774063134', '76ac3e21-bcfb-4ea6-ae51-6bce01ab1f31', '063134', '3', '1', '1', 'oQHVE0xkmL6bB9WV1y3uaZnJL_UE', '秦家琳', 'a2d1cd1d-8b94-455d-8f78-a00ec90cb007');
INSERT INTO `user` VALUES ('5f53edf6-079a-4874-8e86-4c48d14a268e', '18774879533', '5f53edf6-079a-4874-8e86-4c48d14a268e', '879533', '3', '0', '0', '', '丛颖', '06a6ab17-d1ea-4159-b897-aa5bf2135c2b');
INSERT INTO `user` VALUES ('a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '13637472576', 'a541a150-d670-4d4e-a6ce-f3ef1517a5dc', '472576', '3', '0', '0', '', '李芳林', '96b37632-2ad5-4100-814c-23d4af389250');
INSERT INTO `user` VALUES ('2317d1b6-f84d-4633-bc8c-97caaff69e16', '15274816683', '2317d1b6-f84d-4633-bc8c-97caaff69e16', '816683', '3', '1', '1', 'oQHVE04is0pQL2FUiFVShfhvQ8Kk', '高梦梦', '9b563e14-07bc-4416-830b-319274e8d625');
INSERT INTO `user` VALUES ('436e705c-33e3-4f57-ba31-6eadb0596ac4', '15287415316', '436e705c-33e3-4f57-ba31-6eadb0596ac4', '415316', '3', '1', '1', '', '田江', '53e2656e-8d99-4626-81f7-cbdad18c7b93');
INSERT INTO `user` VALUES ('fa21938a-9d7f-442e-b9cb-37be8a2535c6', '18223562393', 'fa21938a-9d7f-442e-b9cb-37be8a2535c6', '562393', '3', '1', '1', 'oQHVE00-AmMcs0WzzENjr5bPOYFc', '廖成意', 'd1da9599-1adb-4075-98d9-297e4902338e');
INSERT INTO `user` VALUES ('b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '13142175883', 'b3f8a18b-c265-4df3-948e-6ea0e4e0416d', '175883', '3', '1', '1', 'oQHVE013DU_MBE9faBJPzLmV8f40', '高鸶佳', 'ae035324-3e4d-46c4-bdb6-c445af54e5fe');
INSERT INTO `user` VALUES ('776b3585-eb3d-4be2-85b0-6e833cf6a913', '18329525584', '776b3585-eb3d-4be2-85b0-6e833cf6a913', '525584', '3', '1', '1', 'oQHVE02kDaU7MucAhueX258cmKa8', '王翼', '219524c2-8299-4a2c-8e28-6826f222c219');
INSERT INTO `user` VALUES ('ebcea06f-b8ea-45f4-9c39-c843d648602c', '18670367305', 'ebcea06f-b8ea-45f4-9c39-c843d648602c', '367305', '3', '1', '1', 'oQHVE05fxzDEFXvF7ZynRKSchpQA', '皮文君', 'c9e06263-d7a6-4fde-9d60-50b4c66d3092');
INSERT INTO `user` VALUES ('01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '15200833373', '01d03e3e-39bd-4dc3-9331-ec76bc8d2b57', '833373', '3', '1', '1', 'oQHVE0wpUMFHvzWN5U1t2-tFDTT8', '李国伟', '6d608e41-1306-476e-9065-ba38563ca876');
INSERT INTO `user` VALUES ('c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '17375150595', 'c5410f5e-d7ab-44bf-b06c-3d69d77ec4e7', '150595', '3', '1', '1', 'oQHVE06m8SUA7vxpVTT68Bw0CIRU', '候昭慧', '6a17e374-b643-4a53-9981-12e58be2a5dc');
INSERT INTO `user` VALUES ('a2d7bf04-f9f6-4842-99d1-79f17dab142e', '18890090950', 'a2d7bf04-f9f6-4842-99d1-79f17dab142e', '090950', '3', '1', '1', 'oQHVE0wtp5V2Lt5GYRIXiruA0Vqc', '董梦季', '6d072ef5-a207-40c9-a4dc-425e7dfc4bfb');
INSERT INTO `user` VALUES ('44cd5d75-722e-4c03-ac2a-360e5447b97f', '18774861533', '44cd5d75-722e-4c03-ac2a-360e5447b97f', '861533', '3', '1', '1', 'oQHVE077aDc0uePbyn7KNC9V7h9g', '覃居上', 'c336330e-5f6e-4816-b65b-9ae28027e76f');
INSERT INTO `user` VALUES ('6c7dae17-0dcb-4263-89b2-ae255883c682', '15084726641', '6c7dae17-0dcb-4263-89b2-ae255883c682', '726641', '3', '1', '1', 'oQHVE03vR7PMKlKXatw8GQyUpobc', '刘芳', '9690b31a-b878-4d60-8bdf-2e9448e815db');
INSERT INTO `user` VALUES ('f3ab62e9-bffa-4ca7-950a-9758622de7fc', '18711139337', 'f3ab62e9-bffa-4ca7-950a-9758622de7fc', '139337', '3', '1', '1', 'oQHVE07-ZhI-kR-ndOKodygSf7Qw', '崔海骕', '76a11d30-fa92-4921-8104-01c128b50ce6');
INSERT INTO `user` VALUES ('104a8e84-b0a2-4e32-86d4-75d548c87804', '18932449267', '104a8e84-b0a2-4e32-86d4-75d548c87804', '449267', '3', '0', '0', '', '胡英杰', 'd1c43397-001f-400b-ae73-00c6e27461b9');
INSERT INTO `user` VALUES ('d0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '13027424343', 'd0d0ea2d-6a8f-4f4c-9a31-7df85d222e6d', '424343', '3', '1', '1', 'oQHVE04la8ss0_eO_XHTLnW3foyY', '谷孟阳', '36b74fdc-62d5-4d20-b4c0-3acf7317c745');
INSERT INTO `user` VALUES ('19115f9c-d7d6-4415-baab-27cb4973ce98', '18319368445', '19115f9c-d7d6-4415-baab-27cb4973ce98', '368445', '3', '1', '1', 'oQHVE02AyTqCVp7pm3g8rAGU001c', '文少芬', '7b0efa43-761c-486c-8285-e33fe6e7e92d');
INSERT INTO `user` VALUES ('cb25c238-8c4a-4fd3-8142-3e4c39fb0d42', '13278882857', 'cb25c238-8c4a-4fd3-8142-3e4c39fb0d42', '882857', '3', '0', '0', '', '程新', 'c2732e4f-ff7c-4168-a706-467276cc46e4');
INSERT INTO `user` VALUES ('add3d1b0-204f-4159-90de-e054b94a4b5f', '13007438697', 'add3d1b0-204f-4159-90de-e054b94a4b5f', '438697', '3', '0', '0', '', '王中钰', 'a3b322d6-90f5-4d27-8bb1-351944ce46a3');
INSERT INTO `user` VALUES ('8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '14747431827', '8fb392e3-7e9a-43b1-80b3-aa9ba3ebe44e', '431827', '3', '1', '0', '', '王永娟', '025493f4-3031-4d26-a97a-94a1c003f450');
INSERT INTO `user` VALUES ('70003dbe-38d9-4337-aa5c-3e70efafb7fc', '17830286663', '70003dbe-38d9-4337-aa5c-3e70efafb7fc', '286663', '3', '0', '0', '', '刘建军', 'adc81b8e-602a-4642-aa05-6fd3dce8a200');
INSERT INTO `user` VALUES ('4913983e-0ead-42d9-8461-e529dc31c684', '18273460875', '4913983e-0ead-42d9-8461-e529dc31c684', '460875', '3', '0', '0', '', '廖森', '15af7999-b5fa-4f1e-8859-0409afdc4688');
INSERT INTO `user` VALUES ('3f26b978-1499-4da6-bb18-42750bafc010', '15560279613', '3f26b978-1499-4da6-bb18-42750bafc010', '279613', '3', '1', '1', '', '李恩启', 'ea56eb2f-6608-4caa-bc5f-ed70101e17df');
INSERT INTO `user` VALUES ('51669f73-2654-42db-a7d3-8c51c430a564', '18774878930', '51669f73-2654-42db-a7d3-8c51c430a564', '878930', '3', '0', '0', '', '智亚', '42f7d036-eff6-4000-9f34-bea9f636a643');
INSERT INTO `user` VALUES ('27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '13516450815', 'b13c5b94-b066-44af-b4c4-145c9d8612a0', '450815', '3', '0', '1', 'oQHVE0wBs1QZykLZlG4i7IhwPDRU', '汪永俊', '931bb143-622e-4344-8da2-5a560d236701');
INSERT INTO `user` VALUES ('fb15c154-134d-4a4b-a12c-c0d761765ef0', '18674819151', '27b12ebd-7caf-4b25-bd9c-cb44d0e2e6f3', '819151', '3', '1', '1', 'oQHVE0603rPaj7fFU8aum--eliMc', 'hexl2', 'b0367f3d-cea9-4b29-99e8-9296f1f44bab');
INSERT INTO `user` VALUES ('2c64d354-e9db-441d-8271-061d46813abb', '18006468086', '2c64d354-e9db-441d-8271-061d46813abb', '468086', '3', '1', '1', 'oQHVE0_1ev9Fnu8WCLxN-AD4aKH4', '周彦宏', 'ebf4bed8-529d-4f43-b56c-0b211da1a51d');
INSERT INTO `user` VALUES ('8a3e0641-de8f-4ec1-ab2d-a72d74e2d485', '18788935643', '8a3e0641-de8f-4ec1-ab2d-a72d74e2d485', '935643', '3', '0', '0', '', null, '14656e76-09ad-4dde-82c2-78fcd9ac07e5');
INSERT INTO `user` VALUES ('11d525bf-153b-4d1d-9acc-3d06778177c4', '18711009965', '11d525bf-153b-4d1d-9acc-3d06778177c4', '009965', '3', '0', '0', '', 'test_teacher1', 'e713f2c0-ff19-4263-b590-8e4dfde618c2');
INSERT INTO `user` VALUES ('581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '18670391790', '581f09c5-bb9d-45e1-9a73-13e20c8a5cf0', '391790', '3', '1', '0', 'oQHVE0z4_jisbd0U4oaquaX9PHWw', '胡明杰', '585c7f7b-6b8e-4c97-bf29-78f421169d71');
INSERT INTO `user` VALUES ('a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '18373177116', 'a9eccdc1-59dc-4837-a37f-ce8ea02ff735', '177116', '3', '1', '0', 'oQHVE090xsPfCCHEtgZuovs5KxeY', '姚明', '16685aa3-7589-40d2-ac2f-63e3c116e99c');
INSERT INTO `user` VALUES ('db66fd38-466a-4620-9890-6abb10a67a22', '18174679426', 'db66fd38-466a-4620-9890-6abb10a67a22', '679426', '3', '1', '1', 'oQHVE02nMmvMGlH3e5FmeVQojdH4', '秦国民', '80cc1fe4-6aa4-49fe-a71c-0842035e126e');
INSERT INTO `user` VALUES ('ac37a69a-8f81-4f35-950d-44586364969b', '15874184386', 'ac37a69a-8f81-4f35-950d-44586364969b', '184386', '3', '0', '0', '', '王文丽', '556a2aeb-8c1c-4291-9485-5ed043c866ef');
INSERT INTO `user` VALUES ('2f6a5e5b-4e32-46d0-8942-5e730051b99a', '13142172699', '2f6a5e5b-4e32-46d0-8942-5e730051b99a', '172699', '3', '1', '1', '', '刘林', '6e87011c-d6a7-4bf5-bc18-eb9356d320cd');
INSERT INTO `user` VALUES ('6620857b-7472-4960-a7f7-870244cad689', '18774884031', '6620857b-7472-4960-a7f7-870244cad689', '884031', '3', '1', '0', 'oQHVE0-vyFp36qNqHmozRBJ6CzKU', '吴俊', '7884cfad-89c5-41d3-89df-3b6095e7483a');
INSERT INTO `user` VALUES ('73818668-89b4-4f28-b928-6b454641aaae', '18670741028', '73818668-89b4-4f28-b928-6b454641aaae', '741028', '3', '1', '1', 'oQHVE0xzy5fs5fi0Gy5igseJqKOs', '沈昊晟', '05bd85d1-9e6b-42dd-9889-2ec75721755c');
INSERT INTO `user` VALUES ('38cf1718-94f3-4b1c-941d-16c27e5f8206', '13278880276', '38cf1718-94f3-4b1c-941d-16c27e5f8206', '880276', '3', '0', '0', '', '孔垂越', '8ff783b7-5748-4bea-b81f-f1969240ac38');
INSERT INTO `user` VALUES ('510ad3ee-86ab-44ff-a31e-f71ab7b2c27b', '18173676040', '510ad3ee-86ab-44ff-a31e-f71ab7b2c27b', '676040', '3', '1', '1', '', '秦星子', 'de657fcf-fa06-4bab-af63-8c09b03c833d');
INSERT INTO `user` VALUES ('570cf513-8e9a-4fc8-a8c9-b44ce5ed7198', '17373139972', '570cf513-8e9a-4fc8-a8c9-b44ce5ed7198', '139972', '3', '0', '0', '', '金丹静', 'd64cd4ed-2132-42e2-a0c8-564d06762425');
INSERT INTO `user` VALUES ('3d7625b8-c5b8-49aa-8a38-4e8ba6753f50', '13187042971', '3d7625b8-c5b8-49aa-8a38-4e8ba6753f50', '042971', '3', '0', '0', '', '刘择安', '2d29ce81-cca3-4c13-8bb4-b7ef76545a43');
INSERT INTO `user` VALUES ('878cf7d9-1888-40fc-871f-89f3687b34b8', '17375876324', '878cf7d9-1888-40fc-871f-89f3687b34b8', '876324', '3', '1', '1', '', '丘浏阳', '58fd06a7-890c-4221-9689-ea14daa17bd0');
INSERT INTO `user` VALUES ('3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '13117412195', '3cf193be-3d8f-4acd-80c9-96a9afcb09d1', '412195', '3', '1', '1', 'oQHVE0wsUmv-at-kljG1J8zYx5Co', '康芯萍', '608bf3da-7dca-4cdd-a996-61b71178701c');
INSERT INTO `user` VALUES ('a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '18711176332', 'a4c90903-dc7e-4d32-a0e5-32d472a5dee8', '176332', '3', '1', '1', 'oQHVE04dd58mlpDG2zGaA6vF6aoU', '贺亚灵', '5458cd11-e167-440e-9036-b07cefa39ff6');
INSERT INTO `user` VALUES ('5b0c219a-a3d6-4ac3-ac9c-665134e7d2b0', '12345123456', '5b0c219a-a3d6-4ac3-ac9c-665134e7d2b0', '123456', '3', '1', '0', '', 'xxl', '692819c6-46c6-4992-9be3-54f26b54e897');
INSERT INTO `user` VALUES ('a59a9683-d5b0-4234-9dac-ae2ee2cee5af', '9876123456', 'a59a9683-d5b0-4234-9dac-ae2ee2cee5af', '123456', '3', '1', '0', '', 'xxl3', 'efd88563-2874-4ff7-80e2-e3b41831682c');
INSERT INTO `user` VALUES ('771d1e22-ae10-46fc-92af-e7eb2df326b4', '13007437650', '771d1e22-ae10-46fc-92af-e7eb2df326b4', '437650', '3', '1', '0', '', '王瑜瑜', '79bd28ac-9922-4722-b363-4fcdea1a6cac');
INSERT INTO `user` VALUES ('b8ef7e22-3952-403d-af92-dfdcbe250073', '18711010732', 'b8ef7e22-3952-403d-af92-dfdcbe250073', '010732', '3', '1', '1', 'oQHVE02au-TXyjg3tLXn5YLJJ7Uk', '赵珍莲', '4fac4a60-4f46-472c-b3ee-7f8e6b797b85');
INSERT INTO `user` VALUES ('06b3e395-0bde-43cc-b26e-68076de7dfc1', '17375876486', '06b3e395-0bde-43cc-b26e-68076de7dfc1', '876486', '3', '1', '0', 'oQHVE0_BQYs1zUHTL0lYm1OI6Kbc', '陈文强', 'ca049937-a7bf-4695-bfb5-4792b53d49fb');
INSERT INTO `user` VALUES ('994d9e91-ced6-4f21-a8ec-ceab54d904a8', '15200813882', '994d9e91-ced6-4f21-a8ec-ceab54d904a8', '813882', '3', '1', '1', '', '唐正梁', '670f6213-8727-4111-8bc1-c165ad7836ff');
INSERT INTO `user` VALUES ('ebedc957-1970-4c7f-a114-aadf4d8dc953', '15274937824', 'ebedc957-1970-4c7f-a114-aadf4d8dc953', '937824', '3', '1', '1', 'oQHVE05nV7XHB-hImO0vNxGcHISQ', '石春飞', 'e1d8defc-6cd6-4b53-a1ff-d937eed83da9');
INSERT INTO `user` VALUES ('31db8174-6c57-4823-b00b-1383591a377b', '17375876315', '31db8174-6c57-4823-b00b-1383591a377b', '876315', '3', '0', '0', '', '王紫薇', '1921fe20-1f07-4184-8c71-e575b1de3c0c');
INSERT INTO `user` VALUES ('870e0be3-19b0-4a60-86aa-7572e8b78115', '17352825989', '870e0be3-19b0-4a60-86aa-7572e8b78115', '825989', '3', '0', '0', '', '凌昂阳', '3fa5c97d-fec8-4277-9128-e461df084e48');
INSERT INTO `user` VALUES ('6ee9e5c1-3cf8-46ce-b68f-d92fdb9138fe', '18807427884', '6ee9e5c1-3cf8-46ce-b68f-d92fdb9138fe', '427884', '3', '0', '0', '', '张阅兵', '9b0ab351-663f-4de1-8ec2-d084cf5efc2f');
INSERT INTO `user` VALUES ('545c2216-e26a-492b-a0a4-b596e0b4959a', '17338358006', '545c2216-e26a-492b-a0a4-b596e0b4959a', '358006', '3', '0', '0', '', '马千千', '6f94eeae-7a68-4fa4-b6a6-23c53014d041');
INSERT INTO `user` VALUES ('08bbcfcd-a8f0-4b8d-ae43-8d06c9cee679', '18774879232', '08bbcfcd-a8f0-4b8d-ae43-8d06c9cee679', '879232', '3', '0', '0', '', '余思慧', '46ab8319-cbc1-435a-9b9f-5abc88313d1a');
INSERT INTO `user` VALUES ('a0053e6f-4ed4-4991-b927-27f234479a88', '13278882045', 'a0053e6f-4ed4-4991-b927-27f234479a88', '882045', '3', '0', '0', '', '李朦', 'd6a2bc48-3a8a-497f-8aff-632a193b2294');
INSERT INTO `user` VALUES ('3dab8246-9357-4e79-8849-38739e78749f', '15802545405', '3dab8246-9357-4e79-8849-38739e78749f', '545405', '3', '0', '0', '', '胡校林', 'afe462cf-fc14-48ca-b5a8-b8b5cfa03704');
INSERT INTO `user` VALUES ('48f3736e-a5d3-436e-ad4e-200646f8a6b7', '18570021537', '48f3736e-a5d3-436e-ad4e-200646f8a6b7', '021537', '3', '0', '0', '', '蔡道俊', 'eed088a0-cdb6-4030-ab1c-e00d01656581');
INSERT INTO `user` VALUES ('a295affa-be14-48e3-aece-dfad1ea22b6a', '18273148176', 'a295affa-be14-48e3-aece-dfad1ea22b6a', '148176', '3', '1', '1', 'oQHVE0zz1lzNp0AnerZy2XYfhvcI', '陈艳丽', 'c156aabe-74da-4980-976e-36da67179fb0');
INSERT INTO `user` VALUES ('143a318e-56f1-4237-a47f-0c31c7853ce4', '15116121182', '143a318e-56f1-4237-a47f-0c31c7853ce4', '121182', '3', '0', '0', '', '吴颢钰', 'ede732d7-be7e-4a2c-9f87-a47703eafd65');
INSERT INTO `user` VALUES ('7ae86dca-93bd-4f69-b00a-66447de5ec35', '15260616082', '7ae86dca-93bd-4f69-b00a-66447de5ec35', '616082', '3', '0', '0', '', '林楸艳', '75063416-b6a9-4636-b31c-0ae9e3247fd0');
INSERT INTO `user` VALUES ('58a28496-ac22-42cb-991e-899bc221076e', '13117419963', '58a28496-ac22-42cb-991e-899bc221076e', '419963', '3', '1', '1', 'oQHVE050MhJTkw9XRUJRwQGG3BJ4', '王景宇', 'bcc50e8d-481d-4b7f-8676-a04ca9eda9d1');
INSERT INTO `user` VALUES ('d33b37fe-fbcf-461c-bf89-d4ae7b12cfbf', '15364071892', 'd33b37fe-fbcf-461c-bf89-d4ae7b12cfbf', '071892', '3', '0', '0', '', '王可心', 'a490348f-bb67-45f3-a8cc-3e18331def48');
INSERT INTO `user` VALUES ('b6c342f3-50e2-453c-8930-ac2dc20a1a7d', '18273181833', 'b6c342f3-50e2-453c-8930-ac2dc20a1a7d', '181833', '3', '0', '0', '', '杨雪', '07e32f7a-48e5-439b-bf2a-5b80984cb99b');
INSERT INTO `user` VALUES ('da2f806c-7f57-4318-894a-c10a217ff92c', '15675606224', 'da2f806c-7f57-4318-894a-c10a217ff92c', '606224', '3', '1', '1', '', '雷博翔', '5b6cb792-5173-4c4f-9bfb-750b0a7b02b4');
INSERT INTO `user` VALUES ('69c5fa24-b1c3-4553-a0a9-51fa6c819c61', '18734755680', '69c5fa24-b1c3-4553-a0a9-51fa6c819c61', '755680', '3', '0', '0', '', '张艺华', '405d6195-383b-42a9-b986-3bb8ccf32247');
INSERT INTO `user` VALUES ('b114c3e9-e426-47f2-9b7d-d2e40cde5135', '13278885826', 'b114c3e9-e426-47f2-9b7d-d2e40cde5135', '885826', '3', '0', '0', '', '浦恩泽', '7345f725-a780-4a28-b6e6-4a17bc1782ed');
INSERT INTO `user` VALUES ('9e761589-bc5c-4e31-beab-913b56a87302', '18773353701', '9e761589-bc5c-4e31-beab-913b56a87302', '353701', '3', '1', '1', '', '林双', '116b3817-983a-439c-bf0b-30cae596d8fc');
INSERT INTO `user` VALUES ('ee68eb0f-d789-4e2f-9196-d77e8d3694fa', '13342581397', 'ee68eb0f-d789-4e2f-9196-d77e8d3694fa', '581397', '3', '1', '0', '', '刘鑫胜', '6addb316-6176-4de1-8a9c-92eff29c0bb7');
INSERT INTO `user` VALUES ('d0a35524-a0b4-4be7-84a0-0b43babb9b8a', '15211152073', 'd0a35524-a0b4-4be7-84a0-0b43babb9b8a', '152073', '3', '0', '0', '', '刘阳', '50010dc8-67ac-4f7b-a0dc-0fbd80d53b19');
INSERT INTO `user` VALUES ('a5600e67-5b20-435d-ad17-43ad3a9c9b58', '15243672695', 'a5600e67-5b20-435d-ad17-43ad3a9c9b58', '672695', '3', '0', '0', '', '熊楠', '7edd2934-7c99-41a5-a708-22485a98cca4');
INSERT INTO `user` VALUES ('a2198d46-5d41-4575-9cd8-4588b2da4737', '18874495063', 'a2198d46-5d41-4575-9cd8-4588b2da4737', '495063', '3', '0', '0', '', '王子宜', 'c8be266e-45b8-41f4-8872-7d4d793e7f8a');
INSERT INTO `user` VALUES ('d63a2009-f036-4e70-a4f0-a56988aeb0d1', '15973476383', 'd63a2009-f036-4e70-a4f0-a56988aeb0d1', '476383', '3', '0', '0', '', '肖美红', 'c827654f-7258-4a21-8518-bed15909c4ab');
INSERT INTO `user` VALUES ('771ab6cd-8d8a-4a91-9134-108be9c61687', '17375896604', '771ab6cd-8d8a-4a91-9134-108be9c61687', '896604', '3', '0', '0', '', '王彤', '3f4de0c5-c25b-4a51-bbf3-2c64714039c4');
INSERT INTO `user` VALUES ('2714f56a-cbbd-4e92-8b57-fa00174c787b', '15580089571', '2714f56a-cbbd-4e92-8b57-fa00174c787b', '089571', '3', '0', '0', '', '陆艺方', '12676ac9-5ff2-456d-af31-c65ca28c6c87');
INSERT INTO `user` VALUES ('c06050df-8ce0-4520-b868-4aa6b893b8ee', '15273163117', 'c06050df-8ce0-4520-b868-4aa6b893b8ee', '163117', '3', '0', '0', '', '王赛馗', '3822e69a-3bf4-4eba-a006-6732b0e3b831');
INSERT INTO `user` VALUES ('150ee67b-967a-42d4-9e35-1ca1288624ec', '15573131193', '150ee67b-967a-42d4-9e35-1ca1288624ec', '131193', '3', '1', '1', 'oQHVE06mwfyLuXzaTFgkPH34DMQo', '冯俊杰', '0ad9f0a7-4aca-4e6c-9403-68b717265cc9');
INSERT INTO `user` VALUES ('f345dbcc-1740-431f-bd8b-5ecaa225dc8d', '18174388897', 'f345dbcc-1740-431f-bd8b-5ecaa225dc8d', '388897', '3', '0', '0', '', '张玮', 'ad00c944-c780-48be-be26-a8be486da05f');
INSERT INTO `user` VALUES ('4048eabc-6a12-445e-b7d1-3d62d6d92726', '13278887098', '4048eabc-6a12-445e-b7d1-3d62d6d92726', '887098', '3', '0', '0', '', '李叶凡', '7dc05a26-5080-48bb-9f90-6b05f9218d1a');
INSERT INTO `user` VALUES ('dff9942a-9857-4949-bed4-84aab3ebd856', '15367492896', 'dff9942a-9857-4949-bed4-84aab3ebd856', '492896', '3', '0', '0', '', '罗佩玲', '80f70d1f-9ea6-40ed-9429-4993604bd0da');
INSERT INTO `user` VALUES ('37f60a12-a5b5-42b6-8817-50b3561a5aa8', '18890090729', '37f60a12-a5b5-42b6-8817-50b3561a5aa8', '090729', '3', '0', '0', '', '梁浩然', 'ac62a6e8-f028-4643-ac06-d6a14dea32b8');
INSERT INTO `user` VALUES ('8e1fdfc7-d635-40a1-89ba-9552d65bccb1', '13627327978', '8e1fdfc7-d635-40a1-89ba-9552d65bccb1', '327978', '3', '0', '0', '', '周文婷', '0a2688eb-ec7b-4e69-93f1-4f854f12a9e1');
INSERT INTO `user` VALUES ('98ac0ab0-d335-47ba-9a0c-de4bfab4535b', '15211176285', '98ac0ab0-d335-47ba-9a0c-de4bfab4535b', '176285', '3', '0', '0', '', '万婧怡', '2cef9e4f-1fb5-47a0-a6e8-83cb352a4bf6');
INSERT INTO `user` VALUES ('cd911707-1e22-4d4d-864d-a82295ebbb86', '18773222375', 'cd911707-1e22-4d4d-864d-a82295ebbb86', '222375', '3', '0', '0', '', '朱远航', '96f2568a-52ef-4f1a-85ee-09e8f3f81f21');
INSERT INTO `user` VALUES ('29c59c01-1270-405c-b128-051a150b899b', '15904338936', '29c59c01-1270-405c-b128-051a150b899b', '338936', '3', '0', '0', '', '张可心', '24f08eb0-c233-439a-99ca-97db3c3dec4e');
INSERT INTO `user` VALUES ('406f83a3-ab62-40c3-af73-82393e0e06d6', '15211147118', '406f83a3-ab62-40c3-af73-82393e0e06d6', '147118', '3', '0', '0', '', '蔡源培', '8e023fff-c954-4e6f-92ad-fba71fdc6140');
INSERT INTO `user` VALUES ('b0b408b3-3bae-48ca-9009-e57db0ee8b58', '15200845080', 'b0b408b3-3bae-48ca-9009-e57db0ee8b58', '845080', '3', '0', '0', '', '王若男', '34bb9e59-9d42-44a9-a3c7-e8623af0d0cb');
INSERT INTO `user` VALUES ('3714c7ab-ff6a-40a7-887b-499e5091ddab', '18773124835', '3714c7ab-ff6a-40a7-887b-499e5091ddab', '124835', '3', '0', '0', '', '邓俊杰', '56b7c3a8-8a6b-42ae-af53-0511d52f6b37');
INSERT INTO `user` VALUES ('b31b0b32-79bd-4637-9da2-62774b4c4fc4', '15274986484', 'b31b0b32-79bd-4637-9da2-62774b4c4fc4', '986484', '3', '0', '0', '', '曾磊', '2a423069-361c-43a2-8558-cf46b0b22736');
INSERT INTO `user` VALUES ('608ae929-8180-4215-9f04-d6bca3c95284', '15073227427', '608ae929-8180-4215-9f04-d6bca3c95284', '227427', '3', '0', '0', '', '刘振辉', 'bcd98eab-22d6-4be5-8cc3-0662176e222f');
INSERT INTO `user` VALUES ('41af9f18-6c63-40b9-bd50-3ecf6205bb9f', '18890091625', '41af9f18-6c63-40b9-bd50-3ecf6205bb9f', '091625', '3', '0', '0', '', '毕又凤', 'a3ccb7d0-a97e-44bd-ad69-16d17bb0ad9c');
INSERT INTO `user` VALUES ('43e8ae62-169d-40a3-a271-21802f69bb05', '18707488530', '43e8ae62-169d-40a3-a271-21802f69bb05', '488530', '3', '0', '0', '', '吕光如', 'f2d76a94-09f8-4c90-bd80-72e23edb06ba');
INSERT INTO `user` VALUES ('b8bf4edc-d505-49ce-b64d-e15e0f377205', '13278889011', 'b8bf4edc-d505-49ce-b64d-e15e0f377205', '889011', '3', '0', '0', '', '宋佳', '253075ab-a95e-4167-b492-094f17b73687');
INSERT INTO `user` VALUES ('d41c79a8-faee-4a45-a5f0-537b6174e202', '13973161442', 'd41c79a8-faee-4a45-a5f0-537b6174e202', '161442', '3', '0', '0', '', '陈鹏', 'ce3219d3-74da-4997-95c5-75e39592b31a');
INSERT INTO `user` VALUES ('7dce6aa9-0ac0-4728-8513-56683b6f63f8', '18273133031', '7dce6aa9-0ac0-4728-8513-56683b6f63f8', '133031', '3', '0', '0', '', '张辉煌', '1f4768e7-45e9-4144-94f3-2cd304d39b7e');
INSERT INTO `user` VALUES ('ce83970a-14a3-41ed-a91d-5d74306e91f4', '17375895823', 'ce83970a-14a3-41ed-a91d-5d74306e91f4', '895823', '3', '0', '0', '', '田江', '95316cf1-e189-4521-a843-9d58623e0d6b');
INSERT INTO `user` VALUES ('7b197095-f4f6-4e14-b63e-3d77e5c4df2b', '13971213994', '7b197095-f4f6-4e14-b63e-3d77e5c4df2b', '213994', '3', '0', '0', '', '李平平', '94032723-607f-4c68-a817-a80baa755ec2');
INSERT INTO `user` VALUES ('e3ce89da-0b58-4a4c-8622-181c18f10b50', '18890099615', 'e3ce89da-0b58-4a4c-8622-181c18f10b50', '099615', '3', '0', '0', '', '刘洋', 'fb9dabf8-ad69-4c38-9d3f-6db353a09f3a');
INSERT INTO `user` VALUES ('cf8277e7-9a24-4a95-8305-63d2cc03cf5c', '18271800890', 'cf8277e7-9a24-4a95-8305-63d2cc03cf5c', '800890', '3', '0', '0', '', '张顺', '3e50b694-7ca0-45e2-bf90-940d5c27223d');
INSERT INTO `user` VALUES ('12da1e1b-5aa3-4852-a932-3a24b47398ea', '18890029746', '12da1e1b-5aa3-4852-a932-3a24b47398ea', '029746', '3', '0', '0', '', '魏星', '98073e96-394f-4baa-aa00-f6ffb3642dfe');
INSERT INTO `user` VALUES ('00cb03fd-a82c-401c-afb5-4769c48784c9', '15729291937', '00cb03fd-a82c-401c-afb5-4769c48784c9', '291937', '3', '0', '0', '', '孔市委', '272731a6-40d3-4571-a3e4-36e62375f4d2');
INSERT INTO `user` VALUES ('6f1df767-7009-42a1-b85b-29f09a4d94f8', '18670056223', '6f1df767-7009-42a1-b85b-29f09a4d94f8', '056223', '3', '0', '0', '', '郑景宇', '5f589043-2b87-4e2e-a06d-1603dd7fadd5');
INSERT INTO `user` VALUES ('6466918f-3d53-4fa4-8ba7-0ce15cf6ae13', '17633732864', '6466918f-3d53-4fa4-8ba7-0ce15cf6ae13', '732864', '3', '0', '0', '', '张庆鹏', 'f0effef8-2f95-4050-bae6-e44590336a9b');
INSERT INTO `user` VALUES ('9b86bbed-a1b2-42c1-914a-680ce33ad0bb', '13781584007', '9b86bbed-a1b2-42c1-914a-680ce33ad0bb', '584007', '3', '0', '0', '', '闫龙辉', 'e27ff6f7-488d-4d06-9fbd-cf0e732b9e2c');
INSERT INTO `user` VALUES ('d51ad50b-2a9c-4af1-96d1-b46a9034e281', '15207483180', 'd51ad50b-2a9c-4af1-96d1-b46a9034e281', '483180', '3', '0', '0', '', '孙丽慧', '1b0f4687-1970-4c7f-a1cd-f48c5a390514');
INSERT INTO `user` VALUES ('2133b201-f1d2-40ab-bdbe-7cfededeaa1d', '18890090157', '2133b201-f1d2-40ab-bdbe-7cfededeaa1d', '090157', '3', '0', '0', '', '郎振坡', 'c41bee26-541d-44b2-bda0-50fbf46025d2');
INSERT INTO `user` VALUES ('749341e5-512b-49b0-8633-d3b35eb65c89', '18570745467', '749341e5-512b-49b0-8633-d3b35eb65c89', '745467', '3', '0', '0', '', '王建', 'cde2d730-c400-4c05-a2f7-0641ce77a95c');
INSERT INTO `user` VALUES ('901397e7-c308-4344-96be-d7cef586b9c8', '13278884626', '901397e7-c308-4344-96be-d7cef586b9c8', '884626', '3', '0', '0', '', '郑焕然', '026496e2-2bd6-4f1a-bdf4-8894eef3487e');
INSERT INTO `user` VALUES ('6670cbc0-c607-4d9c-ac27-71786998bd3e', '18890055753', '6670cbc0-c607-4d9c-ac27-71786998bd3e', '055753', '3', '0', '0', '', '陈嘉炜', 'b610c9d3-403d-454e-9152-bba79dfbbf15');
INSERT INTO `user` VALUES ('e464488b-f1de-4956-870a-dd94cb2994bf', '13574013693', 'e464488b-f1de-4956-870a-dd94cb2994bf', '013693', '3', '0', '0', '', '周洋', '1a61b435-f823-4fb6-974c-32fc58781fc3');
INSERT INTO `user` VALUES ('d8f65aa6-5c6c-4d81-88b5-e52d295be54f', '18907430023', 'd8f65aa6-5c6c-4d81-88b5-e52d295be54f', '430023', '3', '0', '0', '', '吴昊挚', '66611e56-7e1d-4324-8541-471424034d80');
INSERT INTO `user` VALUES ('0b97264a-0693-4697-8149-77854d426700', '18773142136', '0b97264a-0693-4697-8149-77854d426700', '142136', '3', '0', '0', '', '李正斌', '1a704e52-f3be-4485-89ef-ef91f819bced');
INSERT INTO `user` VALUES ('f56622b7-8284-4a17-9627-1f51bfd65992', '15364071939', 'f56622b7-8284-4a17-9627-1f51bfd65992', '071939', '3', '0', '0', '', '琳礼先', '59d45d4d-2e37-47ab-bf58-a85b68c6caca');
INSERT INTO `user` VALUES ('1df42cc0-1592-438e-826e-d28abd78d919', '13278883523', '1df42cc0-1592-438e-826e-d28abd78d919', '883523', '3', '0', '0', '', '李海慧', '1c2b84ae-a233-461b-8dd1-e7884e4c519a');
INSERT INTO `user` VALUES ('536b9a2d-3639-47db-b0db-30647c797296', '13278881871', '536b9a2d-3639-47db-b0db-30647c797296', '881871', '3', '0', '0', '', '孙佳伟', '30742675-7ccd-4897-b596-688f56106164');
INSERT INTO `user` VALUES ('ea7ff5fe-549d-4859-be9a-c11fdc44b082', '13142006921', 'ea7ff5fe-549d-4859-be9a-c11fdc44b082', '006921', '3', '0', '0', '', '刘创', 'e36060f6-8df1-4a53-b739-6d5566bb79cd');
INSERT INTO `user` VALUES ('005243df-2d73-47ba-894d-94a9b7d21b69', '15367491170', '005243df-2d73-47ba-894d-94a9b7d21b69', '491170', '3', '0', '0', '', '戴雯', '15faf8e0-7ebe-4bfe-8f60-fc22a4326172');
INSERT INTO `user` VALUES ('6e5a1335-c7a6-4991-b0d2-63008cafdb81', '18670352870', '6e5a1335-c7a6-4991-b0d2-63008cafdb81', '352870', '3', '0', '0', '', '卢俊杭', 'caf07e4d-8b2f-4978-820e-feb8881ddd57');
INSERT INTO `user` VALUES ('77b399ae-6fdf-46f6-89c2-f30044806c96', '18890091078', '77b399ae-6fdf-46f6-89c2-f30044806c96', '091078', '3', '0', '0', '', '谢茜静', '4d8d8b2b-6b06-452e-aa1f-43154ec73d1f');
INSERT INTO `user` VALUES ('33b26c83-9f54-42f9-8fbd-f0d30e8ee845', '18890091135', '33b26c83-9f54-42f9-8fbd-f0d30e8ee845', '091135', '3', '1', '1', 'oQHVE08pI1ul4oWqA3fyJzT-zjCQ', '李文峤', 'db5e1a32-432b-4343-9b32-308d870a25c8');
INSERT INTO `user` VALUES ('f56cb17d-fa9f-4542-a343-a6581efe123a', '17307485480', 'f56cb17d-fa9f-4542-a343-a6581efe123a', '485480', '3', '0', '0', '', '郭胥璟', '79207f08-d14d-468c-ad31-5ea2421c26cb');
INSERT INTO `user` VALUES ('9884a4ef-bfcd-4d4b-86b0-c42bec91e4ce', '15364071370', '9884a4ef-bfcd-4d4b-86b0-c42bec91e4ce', '071370', '3', '0', '0', '', '潘耀坤', '3a080e51-7065-4ca2-870a-97034153f613');
INSERT INTO `user` VALUES ('ae5f9bea-1939-46a2-b69a-faa761bc46cc', '15274954381', 'ae5f9bea-1939-46a2-b69a-faa761bc46cc', '954381', '3', '0', '0', '', '熊文逸', 'fc0f036c-1813-4e3f-a7ca-0edade2d11de');
INSERT INTO `user` VALUES ('dbba29e9-60d9-49d1-8fb9-0b820a72d825', '18225224792', 'dbba29e9-60d9-49d1-8fb9-0b820a72d825', '224792', '3', '0', '0', '', '陈幸', '9bd2bbcc-ac56-4d20-833b-a6a3a542175f');
INSERT INTO `user` VALUES ('166493a0-31a0-49e5-9374-1f80b4ebd870', '13278883307', '166493a0-31a0-49e5-9374-1f80b4ebd870', '883307', '3', '0', '0', '', '单隽媛', '898c13b4-2185-46d5-ad91-027fc5a833c6');
INSERT INTO `user` VALUES ('18ea5e8c-07e9-4f47-9b26-015283909697', '15243611181', '18ea5e8c-07e9-4f47-9b26-015283909697', '611181', '3', '0', '0', '', '陈昆鑫', 'c85f32f3-a02e-4071-9cd2-ef30808d1c41');
INSERT INTO `user` VALUES ('df1de484-42a5-4545-bb78-ecef591a7757', '18670098595', 'df1de484-42a5-4545-bb78-ecef591a7757', '098595', '3', '1', '1', 'oQHVE03oDH5NJySynOfQx6qpVJwQ', '罗朝贵', '1b1e34e2-aef6-46fa-9b61-76d643c23796');
INSERT INTO `user` VALUES ('3c0a0f0c-1d55-4a07-b1bb-6f800f1a188e', '17773116402', '3c0a0f0c-1d55-4a07-b1bb-6f800f1a188e', '116402', '3', '0', '0', '', '景钰皓', '527909ad-226d-43dd-934a-a08724bc18df');
INSERT INTO `user` VALUES ('14fdce6c-ac93-4beb-b2e6-64a94265774b', '15207495087', '14fdce6c-ac93-4beb-b2e6-64a94265774b', '495087', '3', '0', '0', '', '罗淑', '90375487-d720-4291-b291-1f0013946362');
INSERT INTO `user` VALUES ('14d7f954-79e6-454c-8716-491ce1c09cf7', '17375899436', '14d7f954-79e6-454c-8716-491ce1c09cf7', '899436', '3', '0', '0', '', '赵仁熙', '9927eefa-ecc4-478a-84a7-a73a1cfbc299');
INSERT INTO `user` VALUES ('1ff09d22-eb3e-4c29-be58-531e420fb440', '15243667610', '1ff09d22-eb3e-4c29-be58-531e420fb440', '667610', '3', '0', '0', '', '蔡杨军', '09f65704-ae10-4420-b11c-f65ddf30e609');
INSERT INTO `user` VALUES ('8d3288d3-2d12-4a30-9f1d-6d9ab1db7cc6', '18890090201', '8d3288d3-2d12-4a30-9f1d-6d9ab1db7cc6', '090201', '3', '0', '0', '', '李秀萍', '6724dd92-0a2d-4315-84c9-37d3eef15f7c');
INSERT INTO `user` VALUES ('6e8e9f14-6c78-49d9-9e2e-61f876989aad', '18273133531', '6e8e9f14-6c78-49d9-9e2e-61f876989aad', '133531', '3', '0', '0', '', '宋锐涛', '360f307f-cef9-4281-8d0e-22ed2d2c91d3');
INSERT INTO `user` VALUES ('5f53ed16-02b4-464c-8c49-43472b02ef95', '15974205140', '5f53ed16-02b4-464c-8c49-43472b02ef95', '205140', '3', '0', '0', '', '陈燕坤', '00eaff58-1485-4366-a450-bd77ef8750ba');
INSERT INTO `user` VALUES ('9321916c-1b48-4d88-84eb-1303b2efd648', '18890091206', '9321916c-1b48-4d88-84eb-1303b2efd648', '091206', '3', '1', '1', 'oQHVE07TlM35Hm1HhO9obm1EWqP4', '周咏琪', '7ab4d30f-b915-4ce0-b33b-bd44b399ce9b');
INSERT INTO `user` VALUES ('56e1b294-41f5-4d67-b2b6-f1e108aac9e1', '18231222718', '56e1b294-41f5-4d67-b2b6-f1e108aac9e1', '222718', '3', '0', '0', '', '郑乐天', 'e1c4d604-ea45-41cd-abe8-88fd4848d8d0');
INSERT INTO `user` VALUES ('bb27db25-b6b6-4de7-9545-94b26f4b5f77', '15173146900', 'bb27db25-b6b6-4de7-9545-94b26f4b5f77', '146900', '3', '0', '0', '', '万正', '1ce6311e-8913-4477-9c9c-3372d68c8797');
INSERT INTO `user` VALUES ('ee598657-685d-4ecd-8b1a-65ac8ceacfa9', '13278883347', 'ee598657-685d-4ecd-8b1a-65ac8ceacfa9', '883347', '3', '0', '0', '', '樊诗颖', '6b9c307e-80a2-49dc-bc9b-6e2819f07325');
INSERT INTO `user` VALUES ('4f9f68b2-1650-453d-b03f-4c0ce9943a1f', '18872235163', '4f9f68b2-1650-453d-b03f-4c0ce9943a1f', '235163', '3', '0', '0', '', '程烽', 'fff5277f-3635-4532-a03d-bf9a3b40edc2');
INSERT INTO `user` VALUES ('2457abef-cacb-4ae8-bbf6-fe09dadfadbc', '18569479523', '2457abef-cacb-4ae8-bbf6-fe09dadfadbc', '479523', '3', '0', '0', '', '李思源', '5675bc8d-c09f-4b9c-8857-792fda464b06');
INSERT INTO `user` VALUES ('0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '18890092175', '0c3d5ce8-692f-4a71-a3e7-23d892be8a68', '092175', '3', '1', '1', '', '黄佳诚', '7b039c76-7b06-470a-a973-27926b6350ca');
INSERT INTO `user` VALUES ('a94f769c-6f53-41ac-9347-d3dc3ba3d133', '18286010673', 'a94f769c-6f53-41ac-9347-d3dc3ba3d133', '010673', '3', '0', '0', '', '简兴光', 'd6034346-b290-4cdd-a1d3-017997aa127d');
INSERT INTO `user` VALUES ('258bebfc-d51d-43e7-adc8-168f9893a148', '133316144178', '258bebfc-d51d-43e7-adc8-168f9893a148', '144178', '3', '0', '0', '', '张思敏', '38aa010d-b0df-4281-90e3-d1e05f32b5a4');
INSERT INTO `user` VALUES ('ef999b86-7bd1-4a7b-ace4-67bcb1743116', '18919974601', 'ef999b86-7bd1-4a7b-ace4-67bcb1743116', '974601', '3', '0', '0', '', '姚金甫', '590561c8-ec90-4561-b595-e992788600f2');
INSERT INTO `user` VALUES ('597bb907-35d2-499a-847e-634c245617d4', '13278880740', '597bb907-35d2-499a-847e-634c245617d4', '880740', '3', '0', '0', '', '陈俊骐', '5248456e-db61-456f-a09d-675d66557713');
INSERT INTO `user` VALUES ('dfeb9a99-cfca-4c3d-8164-d744ca740dad', '13364095520', 'dfeb9a99-cfca-4c3d-8164-d744ca740dad', '095520', '3', '0', '0', '', '卿旭东', '8000daab-4b9e-415f-b896-51db7b8bb4f1');
INSERT INTO `user` VALUES ('3bf3f815-9fbe-4796-9e8a-0d8e344f1e0a', '17343620482', '3bf3f815-9fbe-4796-9e8a-0d8e344f1e0a', '620482', '3', '0', '0', '', '岳弘', '6fc1ccd0-9f5a-492b-944b-c42b79295b9a');
INSERT INTO `user` VALUES ('ec43a3c7-455e-421d-8be1-4417109c9f81', '15274928081', 'ec43a3c7-455e-421d-8be1-4417109c9f81', '928081', '3', '0', '0', '', '左灿灿', '3aa3f56c-46f1-4157-a12f-7232062cf5c1');
INSERT INTO `user` VALUES ('6857d413-bcb8-4fa9-8db0-f3c289b9f814', '15938552770', '6857d413-bcb8-4fa9-8db0-f3c289b9f814', '552770', '3', '0', '0', '', '马豪杰', '4fd514df-ce99-4f4a-8be6-8b72ebb98ccd');
INSERT INTO `user` VALUES ('a7325109-9f8e-4add-a5d2-eb9aba26455e', '15200866485', 'a7325109-9f8e-4add-a5d2-eb9aba26455e', '866485', '3', '0', '0', '', '戴凌雪', 'e061ffab-bc87-46f2-a708-3e1f08371959');
INSERT INTO `user` VALUES ('b2522619-2cac-4cb1-bf9f-590620f3b292', '13278882796', 'b2522619-2cac-4cb1-bf9f-590620f3b292', '882796', '3', '0', '0', '', '程泽宇', 'beb4cac0-41de-4a5b-b92e-06b505f6258e');
INSERT INTO `user` VALUES ('c003c309-717b-4f67-9bbd-06b1621cfe04', '18890099818', 'c003c309-717b-4f67-9bbd-06b1621cfe04', '099818', '3', '0', '0', '', '向诗淯', 'b0809c6d-25e6-472a-b07a-112c0c84aeb7');
INSERT INTO `user` VALUES ('0d6da146-0efb-4c41-9d55-537e03354512', '15029716957', '0d6da146-0efb-4c41-9d55-537e03354512', '716957', '3', '0', '0', '', '张望临', '825265cd-942d-44ac-8c69-f981b67b4d9b');
INSERT INTO `user` VALUES ('138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '15309635998', '138f56d7-5fcf-43aa-b42b-1f81b7ba86d3', '635998', '3', '1', '1', 'oQHVE09AdXSUu--sVPZjmf5CBHk0', '任波', 'eec86e90-e870-4ce8-a9d7-4c4a64a0fbc0');
INSERT INTO `user` VALUES ('49764f88-ea5d-4ac9-8e83-93b1a4bec592', '18711000934', '49764f88-ea5d-4ac9-8e83-93b1a4bec592', '000934', '3', '0', '0', '', '夏余宏烨', 'ba73f2b8-0634-41db-95b1-f4f0a7ae361e');
INSERT INTO `user` VALUES ('2675dfb2-4d24-4be6-bb78-b699c6d966bd', '18293225005', '2675dfb2-4d24-4be6-bb78-b699c6d966bd', '225005', '3', '0', '0', '', '常铭杰', '4a560d16-88ca-42d3-8ff9-9731f340a3b2');
INSERT INTO `user` VALUES ('e50c4e7d-0528-440b-81d8-4bdc3087d6c9', '17307410494', 'e50c4e7d-0528-440b-81d8-4bdc3087d6c9', '410494', '3', '0', '0', '', '黄雅丽', 'e4d5f5be-e490-45c7-ad0e-00cd8b02c7fa');
INSERT INTO `user` VALUES ('d017153c-b40c-4324-9430-23f023c90878', '18182120921', 'd017153c-b40c-4324-9430-23f023c90878', '120921', '3', '1', '0', '', '李杰', 'bc7a3bcf-6e4c-4fbf-bc4e-193892059fe4');
INSERT INTO `user` VALUES ('f1db1e06-92b4-4f94-902d-5503e6cb1a02', '13278883791', 'f1db1e06-92b4-4f94-902d-5503e6cb1a02', '883791', '3', '1', '1', '', '莫文涛', 'da13fcaf-358d-47c6-afa7-16ae02fbf335');
INSERT INTO `user` VALUES ('b7f5a0ba-8b98-4374-acc9-7cc68cccf32a', '15200904780', 'b7f5a0ba-8b98-4374-acc9-7cc68cccf32a', '904780', '3', '0', '0', '', '孙娜', '46100742-108f-4f78-b188-60bf165f935e');
INSERT INTO `user` VALUES ('481db1db-22aa-471a-b321-b69143da727f', '13853155413', '481db1db-22aa-471a-b321-b69143da727f', '155413', '3', '1', '1', '', '高天宇', '4053f29a-515f-4690-b172-9bc336524779');
INSERT INTO `user` VALUES ('f1abcf69-52aa-4494-9558-ed744736cad5', '15200943859', 'f1abcf69-52aa-4494-9558-ed744736cad5', '943859', '3', '1', '1', '', '杜家鑫', '8015927c-42fb-432d-9d0c-3fd213ea4098');
INSERT INTO `user` VALUES ('4431c60d-42e9-4d62-80c8-0347bec378c2', '17307409636', '4431c60d-42e9-4d62-80c8-0347bec378c2', '409636', '3', '0', '0', '', '佘俊霖', 'e472448f-658f-44c1-8006-b44ef078d5c7');
INSERT INTO `user` VALUES ('d8e1ff3e-56b4-4e75-8c80-88128501f979', '15211042028', 'd8e1ff3e-56b4-4e75-8c80-88128501f979', '042028', '3', '0', '0', '', '杨乔洪', '1958010b-4330-4d62-b05b-264a56da66fb');
INSERT INTO `user` VALUES ('26a14c77-fa20-4e16-b357-104db8706dae', '15878011639', '26a14c77-fa20-4e16-b357-104db8706dae', '011639', '3', '0', '0', '', '叶超宏', 'b091ae82-867c-4a00-8b56-b81f94391ccc');
INSERT INTO `user` VALUES ('3695ca9f-0e7d-44f7-8734-7febfd8cdcca', '15084804664', '3695ca9f-0e7d-44f7-8734-7febfd8cdcca', '804664', '3', '0', '0', '', '许嘉伦', 'c14ed53d-baed-42c4-9c5a-a953f3e4d531');
INSERT INTO `user` VALUES ('cb21b2fb-71eb-445f-9b5a-03b97ac7395d', '18774843731', 'cb21b2fb-71eb-445f-9b5a-03b97ac7395d', '843731', '3', '0', '0', '', '钟心怡', '2ddd325e-cbe0-4e65-bf01-c1caf2c3f1c1');
INSERT INTO `user` VALUES ('aca97cbf-f62b-40f1-91a3-00593b0bb256', '18774930131', 'aca97cbf-f62b-40f1-91a3-00593b0bb256', '930131', '3', '0', '0', '', '冯书颖', 'dc703361-57a4-461c-a2b7-66517c16fd41');
INSERT INTO `user` VALUES ('34ce2ee0-f9d9-407d-98b5-295574d8c9a3', '13548505609', '34ce2ee0-f9d9-407d-98b5-295574d8c9a3', '505609', '3', '1', '1', 'oQHVE0zq47_dKjv8eMjS8bO2bcoY', '肖灿', '9be1f647-8816-42da-9f3d-1eef6692384e');
INSERT INTO `user` VALUES ('ff034821-65ee-4c46-8699-66214b1bb7af', '18773194631', 'ff034821-65ee-4c46-8699-66214b1bb7af', '194631', '3', '1', '1', 'oQHVE0yNiHXzioG1rbMSIsxxULA0', '苏栋', '13f5beb5-7a1e-4cad-b0ec-2e71b98efef8');
INSERT INTO `user` VALUES ('7050eeca-8ba4-49dd-8183-fdd6772c8af2', '15274902186', '7050eeca-8ba4-49dd-8183-fdd6772c8af2', '902186', '3', '0', '0', '', '刘家乐', 'cfcc229f-f6ba-43f8-864e-eac7c2a476cb');
INSERT INTO `user` VALUES ('e950d516-2043-480c-9866-95d2006bca96', '13278884104', 'e950d516-2043-480c-9866-95d2006bca96', '884104', '3', '0', '0', '', '龙涛', '09ca2ee4-a760-411f-b7ef-78c5a71dc53b');
INSERT INTO `user` VALUES ('d106cf52-23ea-4d13-a25f-06e0bdc4081a', '15211007497', 'd106cf52-23ea-4d13-a25f-06e0bdc4081a', '007497', '3', '0', '0', '', '龙宇涵', '7b505448-719f-4b2e-985c-0cf7a7b23404');
INSERT INTO `user` VALUES ('bca914c3-3bb1-46b4-9656-25b21011e4d6', '15200867381', 'bca914c3-3bb1-46b4-9656-25b21011e4d6', '867381', '3', '0', '0', '', '王琪琪', 'edc99019-9731-4870-8477-f9424bdaa673');
INSERT INTO `user` VALUES ('e1dcfb4b-514b-4821-8784-9320a4d8e8cf', '15927580249', 'e1dcfb4b-514b-4821-8784-9320a4d8e8cf', '580249', '3', '0', '0', '', '杨鑫', '8f257b3d-81b0-4613-a0a5-05f72c3e36f6');
INSERT INTO `user` VALUES ('1d3d3525-7dcd-4bf0-9b42-787fa94ec052', '18035059033', '1d3d3525-7dcd-4bf0-9b42-787fa94ec052', '059033', '3', '0', '0', '', '邸卓瑞', '65b012cd-1e4f-48fd-b48a-8f0d89ba7c6e');
INSERT INTO `user` VALUES ('48931aa9-b9dc-47af-b19c-dc4af5632c90', '15274858182', '48931aa9-b9dc-47af-b19c-dc4af5632c90', '858182', '3', '1', '1', 'oQHVE01KiHrOOamnXGxy4iw_Lxxc', '蒋笑冰', '3081a2e3-948c-4755-a3ea-6ec1bd6202c4');
INSERT INTO `user` VALUES ('e28feeb4-ef72-4a4e-aadb-58c087a6f4f4', '13278886863', 'e28feeb4-ef72-4a4e-aadb-58c087a6f4f4', '886863', '3', '1', '1', '', '张佳琪', 'b727d029-ef4a-4e75-abf6-764012a8ba92');
INSERT INTO `user` VALUES ('d22d378c-aaf4-41e6-a170-dbfc23fcc303', '17388904974', 'd22d378c-aaf4-41e6-a170-dbfc23fcc303', '904974', '3', '0', '0', '', '方圆', '6faadb06-4301-4166-8e9c-74d07c23339f');
INSERT INTO `user` VALUES ('f0a4d005-f4b5-405c-9233-60319935d16c', '15997035742', 'f0a4d005-f4b5-405c-9233-60319935d16c', '035742', '3', '0', '0', '', '韩志林', '6a49a4b4-671c-4d67-aa58-970fa19d4a9d');
INSERT INTO `user` VALUES ('df981b96-0216-49be-837f-7b72fadfacb0', '13325698690', 'df981b96-0216-49be-837f-7b72fadfacb0', '698690', '3', '0', '0', '', '谭兵', '40e4c065-27df-47fb-9bf4-96ed1305de4f');
INSERT INTO `user` VALUES ('4cfd7102-5623-4021-b929-a684ce057800', '13278883092', '4cfd7102-5623-4021-b929-a684ce057800', '883092', '3', '0', '0', '', '王帅康', '68fa02ce-0349-4c5d-8290-cc6485bf269e');
INSERT INTO `user` VALUES ('8ecacf96-2374-4a45-ade6-2b2e9850cab5', '15211060083', '8ecacf96-2374-4a45-ade6-2b2e9850cab5', '060083', '3', '0', '0', '', '高帅', '0b4f086f-d4f4-4baa-8cba-35e41b2c54ec');
