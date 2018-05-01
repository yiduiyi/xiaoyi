/*
Navicat MySQL Data Transfer

Source Server         : yduiy
Source Server Version : 50538
Source Host           : 114.80.153.76:3306
Source Database       : sq_mxyiduiyi

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-04-27 22:54:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `uuid` varchar(36) NOT NULL,
  `picName` varchar(200) DEFAULT NULL,
  `picUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('a7f56fd6-41f2-40c3-a4a8-a3593bc668ee', '微信图片_20171008005526.png', '\\upload\\2018111668159c9b7be4903a488c761d310f276.png');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `uuid` varchar(36) NOT NULL,
  `grade` varchar(36) DEFAULT NULL,
  `isholiday` int(11) DEFAULT NULL,
  `courseCnt` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discountPrice` double DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '02', '0', '15', '1200', '1055', '1', '1');
INSERT INTO `course` VALUES ('10', '04', '0', '30', '2400', '2068', '1', '2');
INSERT INTO `course` VALUES ('11', '04', '0', '60', '4800', '3998', '1', '3');
INSERT INTO `course` VALUES ('12', '04', '0', '80', '6400', '5398', '1', '4');
INSERT INTO `course` VALUES ('13', '20', '0', '15', '1500', '1314', '1', '1');
INSERT INTO `course` VALUES ('14', '20', '0', '30', '3000', '2600', '1', '2');
INSERT INTO `course` VALUES ('15', '20', '0', '60', '6000', '4980', '1', '3');
INSERT INTO `course` VALUES ('16', '20', '0', '80', '8000', '6735', '1', '4');
INSERT INTO `course` VALUES ('2', '02', '0', '30', '2400', '2068', '1', '2');
INSERT INTO `course` VALUES ('3', '02', '0', '60', '4800', '3998', '1', '3');
INSERT INTO `course` VALUES ('4', '02', '0', '80', '6400', '5398', '1', '4');
INSERT INTO `course` VALUES ('5', '03', '0', '15', '1200', '1055', '1', '1');
INSERT INTO `course` VALUES ('6', '03', '0', '30', '2400', '2068', '1', '2');
INSERT INTO `course` VALUES ('7', '03', '0', '60', '4800', '3998', '1', '3');
INSERT INTO `course` VALUES ('8', '03', '0', '80', '6400', '5398', '1', '4');
INSERT INTO `course` VALUES ('9', '04', '0', '15', '1200', '1055', '1', '1');
INSERT INTO `course` VALUES ('30', '01', '0', '15', '1000', '908', '1', '1');
INSERT INTO `course` VALUES ('31', '01', '0', '30', '2000', '1760', '1', '2');
INSERT INTO `course` VALUES ('32', '01', '0', '60', '3980', '3390', '1', '3');
INSERT INTO `course` VALUES ('33', '01', '0', '80', '5000', '4380', '1', '4');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `uuid` varchar(36) NOT NULL,
  `openId` varchar(100) DEFAULT NULL,
  `signDate` datetime DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `isOrder` int(11) DEFAULT NULL,
  `sumClass` int(11) DEFAULT NULL,
  `sumAmount` double DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('2bccd0d5-923f-44a1-94e6-7c12f2923ecf', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '2017-08-10 16:40:02', '15200531631', 'joey', '1', '0', '0');
INSERT INTO `customer` VALUES ('aa5dd66d-87c6-4d67-ac42-bd4fabbf825d', null, '2017-08-10 16:54:54', '12', '121', '1', '0', '0');
INSERT INTO `customer` VALUES ('a1cfb3fe-d5a5-458a-ba6a-140e669379c4', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-08-15 00:36:52', '15580800869', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('95a689ab-5f31-4273-ba93-e73d4d6ad6fe', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-08-15 05:18:23', '145855', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('2149e6f4-b655-4267-8a2a-b789f7ad99a2', null, '2017-08-28 23:50:29', '12345678', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('4d9d81d7-8a07-4c0a-8d90-c0ed6ee9fb2f', null, '2017-08-29 00:08:17', '18613371053', '45390604', '1', '0', '0');
INSERT INTO `customer` VALUES ('e8058869-ee49-44c3-9000-c282cc6f2d82', null, '2017-08-29 00:09:04', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('b5c66849-6773-4cbb-9653-bb68bf761971', null, '2017-08-29 00:09:06', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('f7bad3a5-8b17-4e24-9dd5-c463cd4dbd63', null, '2017-08-29 00:09:07', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('3c5636e5-81d1-42f8-818b-8ad98fc2b206', null, '2017-08-29 00:09:07', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('d6e52c84-c938-4dce-a008-aa8a89492f8b', null, '2017-08-29 00:09:08', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('fa90599e-483f-41ca-8178-42a0ca9954d3', null, '2017-08-29 00:09:08', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('9c9f3438-24b6-4803-a03d-643c4356413c', null, '2017-08-29 00:09:08', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('c01bdabf-f854-4456-93ae-682c94116431', null, '2017-08-29 00:09:09', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('084da344-5792-45eb-b2cc-eeba38982764', null, '2017-08-29 00:09:09', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('38968451-d591-44ac-aa45-d26668bb9b44', null, '2017-08-29 00:09:09', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('f4be94e5-fffd-4892-8b4e-edd64c3ce5d3', null, '2017-08-29 00:09:10', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('1b103d3f-fdb0-4410-8e8d-495d31f11a50', null, '2017-08-29 00:09:10', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('fd76e75f-7ba6-42a9-b46a-e8eb4044d540', null, '2017-08-29 00:09:11', '18613371053', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('cf44143f-4ec3-4004-a982-1d35c1b3af32', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '2017-09-01 11:47:55', '13319519996', '13319519996', '1', '0', '0');
INSERT INTO `customer` VALUES ('7a4ac36d-bbc7-4f1e-9353-2a037ffcd55e', 'oiDYQ0-jAjByT-kfZlUGisxZEk7k', '2017-09-02 13:53:12', '18607358121', '花开成海', '1', '0', '0');
INSERT INTO `customer` VALUES ('c062f9cf-b96e-45fe-8908-0968e43b8edf', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '2017-09-06 20:42:28', '13707498722', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('87240753-4778-4dad-8f60-fa000b3b3992', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '2017-09-08 21:09:33', '13875843603', '', '1', '30', '1760');
INSERT INTO `customer` VALUES ('f3ccb0de-95fa-4475-93c0-0df0b0918d6a', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2017-09-08 21:42:32', '18473459303', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('ab6e64d6-b699-49ac-9f8f-1b62b9a9a159', 'oiDYQ05ZWxaAmgQ_YdeiS2yQUFPM', '2017-09-09 16:29:08', '15073066998', '15073066998', '1', '0', '0');
INSERT INTO `customer` VALUES ('08d21bd3-4203-49b2-9805-2bb34c0072ab', 'oiDYQ0yph1h6TdTRge6aK5wvd1XE', '2017-09-10 12:39:29', '18684839966', '18684839966', '1', '0', '0');
INSERT INTO `customer` VALUES ('976c511d-524a-4642-a8ac-521a4f43596e', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '2017-09-10 12:57:12', '15084785602', '15084785602', '1', '0', '0');
INSERT INTO `customer` VALUES ('24a5df8e-76b2-43d7-8f06-fa9bb1b7f8ed', 'oiDYQ01QAJGEUehmMvVcmG95GNQQ', '2017-09-10 17:07:29', '15874027658', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('0c68421a-b6e0-41ce-a1d5-f7bbf9f01087', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '2017-09-10 18:29:19', '13808422910', '13808422910', '1', '0', '0');
INSERT INTO `customer` VALUES ('c42851c3-3115-4c3c-b938-5c7e8931b2a0', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '2017-09-11 23:33:39', '15874030708', '', '1', '60', '3998');
INSERT INTO `customer` VALUES ('1855c18a-9a1c-4d30-946d-a256d70288e1', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '2017-09-12 11:15:05', '18975819567', '', '1', '60', '3998');
INSERT INTO `customer` VALUES ('4f4fa36b-7a05-40c7-82d7-c3d9ff2bc7a6', 'oiDYQ0283GKTWTKPu0R4xjs3U10w', '2017-09-13 01:31:43', '13946220601', '12356', '1', '0', '0');
INSERT INTO `customer` VALUES ('74499a47-252d-4fb0-b07c-2e28fc577ad4', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '2017-09-13 08:49:18', '13027415020', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('49307a1f-f59d-4b4b-a453-ab0a01d0eb60', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '2017-09-13 13:22:17', '15974291689', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('c41b57e0-57a1-426c-a217-829e6df4a258', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '2017-09-14 18:58:54', '13975883828', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('21fc4f1b-a14f-4b53-84e7-41ca8eb94019', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '2017-09-14 20:08:28', '18673880006', 'FW13807381968', '1', '0', '0');
INSERT INTO `customer` VALUES ('841a3982-1a3a-4ef2-abe6-b428785af4a1', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '2017-09-15 20:24:22', '15084916264', '', '1', '80', '5398');
INSERT INTO `customer` VALUES ('ba94669a-eb8e-462d-a540-eb44a9359781', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '2017-09-16 16:49:30', '15367873825', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('5c00a662-1b61-4182-a870-4e9584c7804c', 'oiDYQ03AsJAPKjDppaV_BdK-y94k', '2017-09-16 21:03:32', '13787797566', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('e9d57145-8bf5-403e-9d90-9af93bc19ea2', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '2017-09-17 10:01:12', '15974295408', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('87b3cddf-7f5a-4943-b38d-a0edd875483a', 'oiDYQ04Teivn5JCR2pqmOFOcz03s', '2017-09-17 11:03:31', '13517481209', '13517481209', '1', '0', '0');
INSERT INTO `customer` VALUES ('f2283e8e-ff68-4081-a589-17988f970529', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '2017-09-17 13:30:52', '18627317428', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('1a748013-6bd5-4df2-8980-a704538882a8', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '2017-09-17 21:03:36', '18674807076', '', '1', '13', '780');
INSERT INTO `customer` VALUES ('6c88c169-0c14-457a-b7c7-989ed4d2b016', null, '2017-09-17 21:04:24', '5388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('8610e949-ee98-48bc-aefa-238481253f3a', null, '2017-09-17 21:04:28', '5388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('7e9b242c-b579-45c9-88de-1a0f2d76028f', null, '2017-09-17 21:04:29', '5388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('c01d0278-ae43-498b-b873-a48fbb76c71e', null, '2017-09-17 21:04:30', '5388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('19b434e5-3296-45f6-b38d-8885a948ac88', null, '2017-09-17 21:04:31', '5388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('736fab3e-74f3-4660-9a90-8badde944a48', null, '2017-09-17 21:04:32', '5388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('d2dc3f50-c4bb-4bbe-8b6a-af7651a35c60', null, '2017-09-17 21:04:47', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('d1f45a20-1194-43d2-b7b4-d060f08de047', null, '2017-09-17 21:04:50', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('2f752da5-b69a-447b-92f6-6166b7227c1d', null, '2017-09-17 21:04:51', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('b43c62a8-0776-4fd6-9774-d1b08b81b238', null, '2017-09-17 21:04:51', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('16b99e90-876a-4ca0-a0fe-7091663f5f02', null, '2017-09-17 21:04:51', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('6965752c-a77e-437e-97c8-93a2ee94bc14', null, '2017-09-17 21:04:52', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('ffe69d6e-07e1-46cf-a9c4-a2359d213a1a', null, '2017-09-17 21:04:53', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('a2d63169-df71-4103-af65-9ab8f65bafeb', null, '2017-09-17 21:04:54', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('5f6ae821-6087-42bf-b4da-faf7af121227', null, '2017-09-17 21:04:55', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('1bcdb8fd-d321-4a29-b5d0-8acd80971a85', null, '2017-09-17 21:04:56', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('43636872-765e-484d-8221-bc567bb5c1c5', null, '2017-09-17 21:05:52', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('2a1ae80d-7bcb-4ec8-b410-7d4c2111344d', null, '2017-09-17 21:05:55', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('c298607b-c5e4-4fc0-82d5-665055230ffc', null, '2017-09-17 21:05:55', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('ff8d908e-d619-4abb-9ca7-dfbef2aac797', null, '2017-09-17 21:05:56', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('67981e92-d266-4c6c-bfc5-cff487b2a4c9', null, '2017-09-17 21:05:57', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('1a512db4-b742-4dec-8cda-e0dc2f75d0ac', null, '2017-09-17 21:05:57', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('f4b35104-f102-464a-baf7-1685d663becd', null, '2017-09-17 21:05:58', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('d3205c0f-9424-481f-be7a-a1026f7240b8', null, '2017-09-17 21:05:59', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('ca84c97a-bd89-4570-9aea-63022e255ba3', null, '2017-09-17 21:05:59', '15388981830', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('c50cbd8f-ff4b-472f-92f3-4477e8651537', null, '2017-09-17 21:42:16', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('5b90a392-3a89-4975-9eeb-8c5a01c3f471', null, '2017-09-17 21:42:20', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('cb14a799-6413-4a61-a8c5-bf97c9211c2c', null, '2017-09-17 21:42:21', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('18a09142-db55-4dc0-acc9-17901a40e0f6', null, '2017-09-17 21:42:22', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('c469dd2b-7d27-47fa-8f8b-3d2b6660dd0a', null, '2017-09-17 21:42:23', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('b13242df-f957-4a5d-839f-c2453d5d78af', null, '2017-09-17 21:42:31', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('c2d1884e-c4a0-4d7b-a907-ec32961245ba', null, '2017-09-18 07:57:02', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('36546056-7c26-4eab-8249-a7544d0d0570', null, '2017-09-18 07:57:06', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('89717ba5-adec-4f32-b57d-4c226780cec7', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '2017-09-18 09:36:56', '13908468618', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('348a1d20-616d-4d80-9c13-7c025cf8f526', null, '2017-09-18 16:36:20', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('920901ae-3621-40ec-9989-7fb1fc17ee5d', null, '2017-09-18 16:36:25', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('b0139a07-4351-4ae1-9e1c-ab66eea010e4', null, '2017-09-18 16:36:26', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('f4f8967a-dd12-4544-83a7-129edebd723c', null, '2017-09-18 16:36:26', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('2c2e2964-aa14-4ad5-95e4-17742fce5d8e', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '2017-09-19 14:19:16', '15211093179', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('3dc9bda9-8be9-4684-83e6-dfd1671203c9', 'oiDYQ03QfjQO6JYSPjKxtt6ikuLM', '2017-09-19 15:00:26', '15533', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('412bcdcd-e2ee-411c-876d-53e4ccf8d576', 'oiDYQ02e_v6EI1M2Lqdnaej0TZPo', '2017-09-19 18:59:09', '13682271926', '13682271926', '1', '0', '0');
INSERT INTO `customer` VALUES ('08bd496a-54b9-4aa8-9c9d-235ed125f5fe', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '2017-09-19 19:01:54', '18807421661', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('a4ba469a-2398-40cf-8492-1c22d0ef0153', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '2017-09-21 12:02:34', '18573117977', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('38ee8666-25bf-4e3c-bdfa-8ee393cd5969', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '2017-09-21 17:34:49', '13507439066', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('d839f2bb-63a5-4733-a78a-679d6f84fead', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '2017-09-22 08:50:00', '13017383328', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('d4ae05f4-9eff-4745-8f80-ea886fb6d887', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '2017-09-22 15:20:27', '15873191766', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('a23e7842-bd77-4864-8995-89571c181098', 'oiDYQ00vSW-oAkSSxkRC4uwZ9xMc', '2017-09-22 21:20:36', '13974844276', '13974844276', '1', '0', '0');
INSERT INTO `customer` VALUES ('ec9c3720-d490-4db3-9f78-b513661be876', null, '2017-09-23 15:22:07', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('28a0062e-0bab-4aaf-bd45-a362ea243cae', null, '2017-09-23 15:22:08', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('9e246251-8e07-4c45-92d6-ac7ee684551a', null, '2017-09-23 15:22:08', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('0d97ab3c-158d-4e9c-ae76-4fd029b316a3', null, '2017-09-23 15:22:10', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('301f222f-f505-4705-9807-1b0776651c77', null, '2017-09-23 15:22:11', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('b5d3818e-1e5c-43a1-9080-a47efb57ac28', null, '2017-09-23 15:22:12', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('ee8997bb-e924-4a8f-9c54-de6f6b727661', null, '2017-09-23 15:22:13', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('1ba48850-0418-4833-89af-43ce306195c5', null, '2017-09-23 15:22:14', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('ef047ff7-6adc-4e2a-84a4-2fd78fd72ace', null, '2017-09-23 15:22:15', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('d7aee350-090c-4e05-ae83-8a54f7559931', null, '2017-09-23 15:22:16', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('d6eb31ec-1c53-4a60-9fe8-8e37fff8955f', null, '2017-09-23 15:22:17', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('619484fa-ef0f-40e3-afe5-7c60de30a2e8', null, '2017-09-23 15:22:18', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('9360bd7f-92ed-458a-89b8-2f9bea793db6', null, '2017-09-23 15:22:18', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('fde9cdad-d6a7-4965-9879-e03cf009284c', null, '2017-09-23 15:22:19', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('69165073-1f4c-4612-8f54-a39a89cb29f8', null, '2017-09-23 15:22:20', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('8e19e8a4-8118-4869-9f12-c743f6c0503b', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '2017-09-24 10:47:12', '18670015918', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('479cde9f-b11c-4487-8fe3-deec309b6d78', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '2017-09-24 12:19:18', '18073193881', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('188277a2-ab4b-49d2-89d4-b4d7e2e4d8e9', 'oiDYQ017uj72LXQrGABRBHI3z85k', '2017-09-24 12:22:24', '13667314903', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('33090c25-c16d-4d71-bc5d-08feddb5c8a3', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '2017-09-24 13:58:57', '13755017223', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('d71d94fd-319f-434f-816a-6e2260506bca', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '2017-09-24 15:03:23', '18607358121', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('ae48814a-77cd-49bc-b7cd-9ca2b8ea7720', 'oiDYQ0yZ3EFSxqSIU3CXVO89D2HI', '2017-09-24 17:34:40', '18670739350', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('8d0ad38d-da12-40c7-b9d9-3a2a1fb51eed', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '2017-09-25 10:20:12', '13875911271', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('7f9842b4-d912-40ba-b6fd-537be95c8a38', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '2017-09-25 15:24:04', '15388981830', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('c0bb0eea-96e5-48fb-905b-6d7968b220dc', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2017-09-25 19:15:19', '18229975254', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('d2c9e77b-8592-4653-8fd9-efec1d720f8a', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '2017-09-25 21:20:48', '13487387999', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('d0347525-a6f9-49f7-8a0d-20225a4ae7b6', 'oiDYQ09C5QoVN8ajKMzBk7tqLnVE', '2017-09-26 09:04:01', '15367491161', '13569806345', '1', '0', '0');
INSERT INTO `customer` VALUES ('68b632b9-5ddb-44e6-8397-8e342bd3a769', 'oiDYQ0yj49UFCc4AZBjJnUN768-c', '2017-09-26 23:26:29', '13507468063', '13507468063', '1', '0', '0');
INSERT INTO `customer` VALUES ('3f300649-48c7-49f0-a771-f1d2f28a9e3f', 'oiDYQ0xrHBjcgA1QpsuHHznQYH3w', '2017-10-01 09:45:18', '13397311892', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('57e8fdda-2299-47dd-a488-56a12481d068', 'oiDYQ0-n4bTgNDZ3vgY6hEcgABp0', '2017-10-01 17:02:35', '13808430160', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('8d7e1488-ff16-49ea-8a43-d0244d57f79a', 'oiDYQ089uySfDdCBS-FeI6qODeEo', '2017-10-01 21:54:21', '18670718258', '18670718258', '1', '0', '0');
INSERT INTO `customer` VALUES ('4fcf9a24-cde2-4050-a748-1321c7fcf27d', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '2017-10-02 09:36:37', '13874982491', '', '1', '60', '4980');
INSERT INTO `customer` VALUES ('0a937493-044f-42d1-afe7-968b3dfa417f', 'oiDYQ03gwIddQ8T0h6hveJTAcyK4', '2017-10-02 22:26:19', '13875851168', '13875851168', '1', '0', '0');
INSERT INTO `customer` VALUES ('b819fcab-7111-43c7-8a58-f4bed73ba171', 'oiDYQ0yj8ixe3j5Lrjbj3ByoAiug', '2017-10-05 13:04:58', '13332510256', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('a97bdb86-73d7-4a53-8cfb-33a9562e94ec', 'oiDYQ0yAK2S2n6BioMSxCiNnva2c', '2017-10-07 00:13:05', '13627419667', 'zjf568795271', '1', '0', '0');
INSERT INTO `customer` VALUES ('f8808d55-8b8e-40f1-9525-afa628707540', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '2017-10-07 11:03:57', '18273151646', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('7854be0a-6627-4e56-b2af-18f08dcb46bf', 'oiDYQ06PFj9zfn33DjRojhewj6wg', '2017-10-07 22:50:39', '15973119680', '15973119680', '1', '0', '0');
INSERT INTO `customer` VALUES ('3da8fc5f-3399-4031-9fcf-ca73c970b944', 'oiDYQ01sZh0q9uPd4T1Orbq4jinw', '2017-10-08 23:19:52', '13786177533', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('b4a89a56-5b3d-4f07-92db-f557d4d990d8', 'oiDYQ0zUqcawmPfZ_DbQxkQ_6eYM', '2017-10-10 09:15:39', '13295812562', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('4dc1ec66-520a-413b-8a05-3f5391159394', 'oiDYQ06n2C3l10LsT8G76AesNM4M', '2017-10-10 12:05:26', '18974931217', 'sun2005218', '1', '0', '0');
INSERT INTO `customer` VALUES ('44ebfcdc-9426-4093-959f-a3c168d8cde5', 'oiDYQ03_piIAs2BqvLlZhD-psXb4', '2017-10-10 13:57:07', '15807096895', '15807096895', '1', '0', '0');
INSERT INTO `customer` VALUES ('d7419023-b703-4590-9b62-be99b039b4ee', 'oiDYQ07wQRLsjqnKNTZPBCr8h69A', '2017-10-10 18:15:47', '15874871104', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('c8d646ae-07dc-4b28-ab69-a6794cfea888', 'oiDYQ075SzOw5N4mDFVMaCcWTf9g', '2017-10-11 20:07:13', '13520522587', '13520522587', '1', '0', '0');
INSERT INTO `customer` VALUES ('cb948f2f-2819-408d-baa9-6dddc837ef3a', 'oiDYQ0yppLCzEdOBPuNw__xwx_Lo', '2017-10-11 22:46:24', '13879835010', '594965022', '1', '0', '0');
INSERT INTO `customer` VALUES ('677c75aa-4c35-4d71-9ee3-610e3a8837ba', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '2017-10-12 16:46:24', '13874538730', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('02e11907-be25-4393-841f-610aabbdedcd', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '2017-10-12 19:45:22', '13574851122', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('7d5a43a8-a92e-4e6c-8fbc-950d89b7b42e', 'oiDYQ0_YHnsL0mDHOA5AdPM3_gXo', '2017-10-13 18:26:16', '15111130939', 'yqhnnx', '1', '0', '0');
INSERT INTO `customer` VALUES ('aa258a16-a111-4e17-8ce9-46fa0285a826', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '2017-10-13 21:41:21', '18974192898', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('165f68f7-7c71-4958-8823-3cee54fda4ab', 'oiDYQ09UC8xTa0Dou-MYUhXrwSxY', '2017-10-14 17:16:00', '18774912606', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('b2fe48cb-cef7-4ab1-9ac4-37397a0f09f1', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '2017-10-15 15:18:25', '15907387929', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('ee80ad6b-9a34-45f6-9a3e-99ade8667589', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '2017-10-15 20:33:02', '18975148025', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('339894aa-f5cc-455a-bbad-89a5007a5f8a', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '2017-10-15 21:03:13', '13975200436', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('59eee04a-8a3b-4e0d-85cb-d4892ac31692', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '2017-10-15 22:01:34', '15116357407', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('5f21d598-0e43-4e8c-957c-e52b15f51b00', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '2017-10-16 12:51:12', '13974849906', '', '1', '80', '5398');
INSERT INTO `customer` VALUES ('db6849c7-087a-486c-b504-ffef48c755a6', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '2017-10-19 09:08:03', '13467645536', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('d7161129-5b4c-404e-a669-2c00aa246f8b', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '2017-10-20 13:17:56', '17608437860', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('7135d68d-bd89-48d6-aa6a-1f08a83bd971', null, '2017-10-20 16:45:57', '13307413004', '1781982042', '1', '0', '0');
INSERT INTO `customer` VALUES ('dd00b514-0bb2-4d8d-9bc1-ef3878a43235', 'oiDYQ07XllCEYTf4pWOKsEd1mORY', '2017-10-20 22:33:48', '18229775088', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('3ebdc992-4317-4165-ac54-6a4bfb2530c7', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '2017-10-21 16:14:56', '15074847431', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('9c100b1a-a368-4903-ad7c-13fec6e0df74', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '2017-10-21 22:32:04', '13907467987', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('7df38fed-0eaa-49a2-a068-2c062f40bc4f', 'oiDYQ05H8TFu_gxrr2mibWDe3r3Q', '2017-10-23 06:57:17', '18670334562', 'qq18670334562', '1', '0', '0');
INSERT INTO `customer` VALUES ('1771fb82-0a09-4fb3-aefc-2a895700ab40', 'oiDYQ07Wh30z1_wUBUuVQGzGdgNE', '2017-10-24 12:40:48', '15802554252', '15802554252', '1', '0', '0');
INSERT INTO `customer` VALUES ('87d72e79-5f86-4e35-9303-d0c2c7770ebd', 'oiDYQ00FV81m8YEJsoL3FXPm6A24', '2017-10-24 14:18:21', '13874803312', '13874803312', '1', '0', '0');
INSERT INTO `customer` VALUES ('17a9eea8-b2e5-4672-b151-09772a5d5cb4', 'oiDYQ07g8DFcg_gMn1sLG4aU9sV8', '2017-10-25 20:27:15', '13787090353', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('51d03326-6b0d-4920-86cc-c2a0bfad5fb5', 'oiDYQ07MSdojJeifDrBeddlagQIE', '2017-10-25 23:43:08', '13100257679', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('a1eb05b4-e51d-447d-8967-3838fa17e69f', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '2017-10-26 20:55:41', '13278898952', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('4d804c6e-6b1d-43f6-9ee0-caf9d1601cf6', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '2017-10-28 19:54:01', '13975895787', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('881e387e-d674-4136-90d7-e5ce6dd35799', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '2017-10-29 15:26:40', '18874299916', '', '1', '80', '5398');
INSERT INTO `customer` VALUES ('0ca474ae-666f-48a2-8e6c-6329e3cbe0a0', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '2017-10-29 22:50:48', '18670029595', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('8bee2996-ba30-4426-a3bb-47552efdbe04', 'oiDYQ07Jn3_glS3LBerFcurtrvCc', '2017-10-30 11:30:03', '13517477896', '', '1', '13', '780');
INSERT INTO `customer` VALUES ('fa3f0662-6aaf-4083-a4c8-b33b10c6c495', 'oiDYQ0ykEDo9PSoFIoESP3ym9EsY', '2017-11-01 12:32:56', '18774009768', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('9585150a-c860-4706-aa50-3aac9c126a94', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '2017-11-01 18:19:29', '18573179633', '18573179633', '1', '0', '0');
INSERT INTO `customer` VALUES ('1bbbe7bf-c32d-481b-9a0c-98fe0976ff42', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '2017-11-02 00:56:36', '13378012713', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('0f2913cc-7a85-4d97-bf84-7ad0169a36fc', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '2017-11-02 22:18:10', '15874212817', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('70c0234d-b6af-4e15-bb0b-9199450ec16e', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '2017-11-03 17:28:00', '13908472055', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('f59fa0fe-6066-4607-8796-d36d8d0b103d', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '2017-11-04 11:43:21', '13973716008', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('84ef70a9-775c-44f2-9173-5a6946ba0f3c', 'oiDYQ0-QDBqy_nPtX-Hjp8OCesy8', '2017-11-04 12:14:23', '13296329632', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('c9da44f3-f20c-4a17-9176-ec4c6cd2c7e7', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '2017-11-05 08:19:07', '18975898882', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('9d6727f0-336a-45a7-bf9b-1a07457ff353', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '2017-11-06 14:11:35', '13974635575', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('b3e585cf-94a0-4361-9af8-cf7ecc7d1ef3', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '2017-11-07 11:12:33', '18075503366', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('368d4856-62e4-4cf7-b307-43408474ca80', null, '2017-11-07 22:15:17', '18874284178', 'ⅹ18874284178', '1', '0', '0');
INSERT INTO `customer` VALUES ('eecc8b94-5bdc-4174-83a7-53dcda25847f', 'oiDYQ09XjS_vn4-Daf5Td8iUTKIs', '2017-11-08 14:30:27', '18908478835', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('d7a1caf1-a5dd-42c8-bcde-0b0fc2d0fef7', 'oiDYQ0-vlOikutIv3r5oJhRuENjU', '2017-11-08 18:53:47', '15111322847', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('bcabbe21-025b-4b6f-b0a3-1849920913ec', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '2017-11-11 17:55:51', '13574800962', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('fd614ae0-fef0-4f4f-8d2e-060919e11370', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '2017-11-12 15:56:02', '17788965126', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('75a59b59-9d9d-4d41-9275-93fc40c56ddc', 'oiDYQ08Wi0DkUKDEhN87BqrtPOn8', '2017-11-12 22:13:54', '123', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('a3dc5528-a4ac-4d7d-80bd-f6b85ee32167', 'oiDYQ02cEGTPChJbTc-WfhCwl0Mc', '2017-11-14 20:25:12', '13786134428', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('c473cb27-be78-44cc-8bec-abd437aa7205', 'oiDYQ01tuCsCDUbWfES1KVuA5wm0', '2017-11-17 14:30:29', '13974804269', '13974804269', '1', '0', '0');
INSERT INTO `customer` VALUES ('380de6c5-666a-4298-aa4d-785ee38a0c1c', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '2017-11-21 21:32:25', '13975850655', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('b6225f9a-a518-4564-bf80-20c353cd4c23', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '2017-11-23 08:50:51', '15274478333', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('a467d06e-39aa-493d-aad9-59eb210ee3a4', 'oiDYQ07mde2bu0S5sVhntd52n7ns', '2017-11-23 21:24:24', '15084828211', '15084828211', '1', '0', '0');
INSERT INTO `customer` VALUES ('85da3569-80c2-4ac6-acf8-49798d6cbec6', null, '2017-11-25 15:40:33', '13319531879', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('227be69f-da54-4173-bda0-cd79feb7e405', null, '2017-11-25 15:41:56', '13319531879', '13319531879', '1', '0', '0');
INSERT INTO `customer` VALUES ('03a9f92c-853d-47cb-a67b-605ec17f89bc', 'oiDYQ02zjXBzLIX_H7zW_fc3rLa8', '2017-11-25 20:22:03', '13874205409', '13874205409', '1', '0', '0');
INSERT INTO `customer` VALUES ('e080e56f-e81b-4f1e-9847-8d59116545fb', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '2017-11-26 20:20:12', '18711182911', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('4a7468d3-6dec-4952-90e9-0e76bdc1cbdc', 'oiDYQ06TokCN9evn9dHIxbnJXVUQ', '2017-11-30 04:27:17', '18229879623', '18229879623', '1', '0', '0');
INSERT INTO `customer` VALUES ('4ba5a55f-41f5-40e1-b407-a8b7f395a9af', 'oiDYQ0zkqngg-JBUwqW2RnRitiN8', '2017-12-01 17:10:32', '15873132531', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('3c08fba7-edef-44d6-a787-45a535fbda65', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '2017-12-03 13:11:44', '15989551539', '', '1', '13', '1138');
INSERT INTO `customer` VALUES ('133d465c-db4a-40d0-94c1-df98dc624f4a', 'oiDYQ0-d_42Lm88Og8_F8fzK2p6s', '2017-12-04 12:01:37', '13875848088', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('6b6e447e-8009-4e1a-80ff-efb515e4fe88', 'oiDYQ09NGSocE14k1kc_9SRpLzfA', '2017-12-04 20:29:04', '18774915780', 'hrb18774915780', '1', '0', '0');
INSERT INTO `customer` VALUES ('7d6b90b6-9c8f-4cf1-bc7a-af48f640e938', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '2017-12-17 22:20:05', '15388981830', '', '1', '30', '2600');
INSERT INTO `customer` VALUES ('b1373425-0108-478c-87d1-c888a467ca86', null, '2017-12-18 20:13:28', '13080525539', '13080525539', '1', '0', '0');
INSERT INTO `customer` VALUES ('5e47d823-e5e7-4a04-b420-62b90704cd07', null, '2017-12-19 20:42:40', '13549510015', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('f44fac3c-1018-4807-a499-4c1b3c987f00', null, '2017-12-20 19:16:55', '15080887588', 'wf13387436918', '1', '0', '0');
INSERT INTO `customer` VALUES ('9d3726da-3ca1-4c8a-968d-afb19aae4777', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2017-12-20 19:58:06', '13874996056', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('112d61bb-4817-4198-815c-c3b4f2e37958', 'oiDYQ07iBsfT3WJ8yX4qQEajMyaM', '2017-12-21 11:20:49', '15211205523', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('2bd8abfd-1758-4ede-b72c-6a1e8581d3da', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '2017-12-27 23:55:45', '13875989929', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('130c00ea-a575-452b-b148-ba4062a6df25', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '2017-12-28 18:27:10', '18975891038', '', '1', '13', '908');
INSERT INTO `customer` VALUES ('440d9237-fdc5-4333-94cc-a52f3e1ef201', null, '2017-12-29 10:33:07', '13574100727', '13574100727', '1', '0', '0');
INSERT INTO `customer` VALUES ('9981b885-ded1-429a-8bed-70b4077e8fb0', null, '2017-12-30 19:54:59', '13974876604', '13974876604', '1', '0', '0');
INSERT INTO `customer` VALUES ('f80e7264-6a0f-4913-b0ca-5bdc5456473e', null, '2018-01-07 14:51:01', '18711019949', '18711019949', '1', '0', '0');
INSERT INTO `customer` VALUES ('667e113a-f9cb-48d0-8f60-e20b32a6dd1f', 'oiDYQ0zQBHpb7usOmVdVs9Fo6CHQ', '2018-01-13 13:00:28', '13017180222', '13017180222', '1', '0', '0');
INSERT INTO `customer` VALUES ('3828800d-fbf6-4313-8409-1560696680b4', 'oiDYQ09bQiuiMWekt3Ral2J-3cq4', '2018-01-14 06:43:12', '15656608888', '', '1', '80', '6735');
INSERT INTO `customer` VALUES ('5b80dac1-9c09-4505-9286-85f9598b7ab6', 'oiDYQ09f3umVMPE7giAWka1GOdWc', '2018-01-27 00:01:27', '13244556666', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('dd0412d7-5c35-4697-8b50-714dccbf4712', 'oiDYQ0w3NiBPbiBOdUItt3GQnq_A', '2018-01-28 15:59:35', '13762376997', '13762376997', '1', '0', '0');
INSERT INTO `customer` VALUES ('64fa629d-5cff-4ab8-bd79-d65cf9cb2f2d', 'oiDYQ0_odGkWOCdIFCpTfUW6ybqo', '2018-02-04 22:46:28', '18974611518', 'XYR18974611518', '1', '0', '0');
INSERT INTO `customer` VALUES ('69f6e885-3bf0-435f-9e10-192029d452fe', null, '2018-02-08 11:22:37', '101001879', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('a384fdd0-300f-4101-a96c-a7f2ada93189', null, '2018-02-08 11:22:44', '101001879', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('570c5890-7c5e-451b-b5e2-023fb33d83b2', null, '2018-02-08 11:23:05', '100000', '448', '1', '0', '0');
INSERT INTO `customer` VALUES ('1b2c61ad-5790-4628-a3ac-56972f7484e4', null, '2018-02-08 11:49:57', '123444', '', '1', '0', '0');
INSERT INTO `customer` VALUES ('f53b24e1-3607-40f3-bca8-c7838b19da81', null, '2018-02-12 14:53:56', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('d2e0d945-18a7-4c75-8430-42b1e177056a', null, '2018-02-12 14:53:59', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e481485f-c326-4b85-be0f-68aa7125b984', null, '2018-02-12 14:54:01', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('8b906f0c-1ff3-4702-bf2c-c992cdab5939', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f47243b6-85d5-4bf1-80bd-4f034c8e10c6', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f60a7bb1-6da4-46a6-97e0-46164d157979', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('bacf1756-2420-4550-8222-effce1f5aa89', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('d9b00ca7-fe74-40fa-b303-f52fd8aa4d9a', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('243ef5dc-5802-4ac6-86f8-d35013c520c7', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('a0110c54-5609-4910-ae7a-bafa708bb388', null, '2018-02-12 14:54:03', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f69ee0b6-d62b-4e32-8fb7-281e6eceb59f', null, '2018-02-12 14:54:04', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('95215e2c-d352-4853-b944-3986fe1f0e14', null, '2018-02-12 14:54:05', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('3fb7aab3-a27f-4a73-abd2-b575c768ee23', null, '2018-02-12 14:54:05', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('b2cb8227-7b52-4f08-b499-29373501a5dc', null, '2018-02-12 14:54:05', '15580063649', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('af16dbfc-f3d4-4d82-bbde-496b26a5e4f2', null, '2018-02-12 14:54:14', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('97a274af-4f18-45be-95bc-8cbff68c1895', null, '2018-02-12 14:54:15', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('7a4c615d-0475-4109-b20d-bbdb7d7c3fb4', null, '2018-02-12 14:54:16', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('69b85743-5a85-4d8d-add6-9fa74d60d0ea', null, '2018-02-12 14:54:16', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('2fdc288b-3cca-4560-8091-5b5b323cf048', null, '2018-02-12 14:54:16', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('927fb970-9783-4990-8fbe-52b602b19bfe', null, '2018-02-12 14:54:16', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('4a547c92-a277-459a-b7e5-ea24f015fd21', null, '2018-02-12 14:54:16', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e787cb96-c85e-419d-8ddb-d6159f7d2d68', null, '2018-02-12 14:54:17', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('87ac91e8-004a-4f34-8b49-9b252b513aa0', null, '2018-02-12 14:54:17', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('d04a4571-4c6d-40d5-8eaa-e38e52ef5827', null, '2018-02-12 14:54:17', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('6b6b4e18-4419-4ff9-9710-15678467b94f', null, '2018-02-12 14:54:18', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('3270622a-262b-4fe0-8198-a9aee54cbed7', null, '2018-02-12 14:54:18', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('454cb138-c31c-4075-bcf9-7f04bab79486', null, '2018-02-12 14:54:18', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('b16c506b-5984-4c7d-a8cb-3cda0cefb684', null, '2018-02-12 14:54:19', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('9afb8a19-57d0-41fc-884f-61f3369992dd', null, '2018-02-12 14:54:19', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('db110ca8-1c7b-4a37-b135-73b52ed6f448', null, '2018-02-12 14:54:19', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('2245a19e-8fff-4ca9-a272-1aabe0f78fa5', null, '2018-02-12 14:54:19', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('ba4dedf9-a3b3-4c2b-ab46-a9e530fa9c45', null, '2018-02-12 14:54:20', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('9f0cff44-d6c7-4300-b080-2f42ae7be90a', null, '2018-02-12 14:54:20', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('18cff5f1-18cf-4380-a85c-b6e8e6794ea8', null, '2018-02-12 14:54:20', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f7486189-f15a-4015-9d9f-eafc822e2ccf', null, '2018-02-12 14:54:20', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('2008e9d3-67c1-4beb-a2b0-c18ec2e2617c', null, '2018-02-12 14:54:21', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('200de86b-1e3f-48cc-8f4e-b6e014ea79eb', null, '2018-02-12 14:54:21', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('7a424047-974f-4bed-a6a3-26852029e848', null, '2018-02-12 14:54:21', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('7f92d733-48fd-4afb-a506-bd188c585092', null, '2018-02-12 14:54:21', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('2cec87cb-ad2a-4655-86d1-ca90ddea59c6', null, '2018-02-12 14:54:21', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('710af5f0-6356-420d-be1b-0aaf711955d7', null, '2018-02-12 14:54:21', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('1cd59f79-a55a-4cef-94ef-472b1095c7e0', null, '2018-02-12 14:54:22', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('37abde85-8236-4be0-9ed6-56b5afe303b9', null, '2018-02-12 14:54:22', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('eba05f9b-1e77-486a-b561-9a336046b06c', null, '2018-02-12 14:54:22', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('d1141eca-430f-49ac-8a68-d8ce5aeb2930', null, '2018-02-12 14:54:23', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('5fb3211c-1777-4035-9094-dcd961c94128', null, '2018-02-12 14:54:23', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('46f2246c-29aa-4106-9bb4-bea57eb9b921', null, '2018-02-12 14:54:23', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e087ac66-198c-4b20-8a91-3732c6c10460', null, '2018-02-12 14:54:24', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e5f69247-0792-450a-a9e0-68a60c3e41ea', null, '2018-02-12 14:54:24', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('b93bca2b-3292-4ed3-86d7-d2f807b45010', null, '2018-02-12 14:54:24', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('6c0d08cb-08ba-47f7-bf78-d9d3b3b79ab4', null, '2018-02-12 14:54:24', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f151c71a-8795-440a-9a16-6d95ee32b670', null, '2018-02-12 14:54:24', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('a70f1132-6416-47c8-b3da-12e1e90ae7bb', null, '2018-02-12 14:54:24', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f39f9308-4d11-4287-9a3f-93e9963b7a3a', null, '2018-02-12 14:54:25', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('1b883e21-81b9-404b-bcbb-894f6a1890fc', null, '2018-02-12 14:54:25', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e7f74aa1-59f1-4f2f-8534-907ff564cc44', null, '2018-02-12 14:54:25', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('326fa0c8-07a1-482d-88fb-13615fd07d90', null, '2018-02-12 14:54:25', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('5009dab6-b901-402a-b3f4-4b9fca207364', null, '2018-02-12 14:54:25', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('9200d17f-df77-4176-a69d-d79095c85ee0', null, '2018-02-12 14:54:25', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('94524d74-12d5-46c7-9bec-090bf9fb718c', null, '2018-02-12 14:54:26', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('d815b84d-511f-41af-8d55-1db975505aaf', null, '2018-02-12 14:54:26', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('ac0686ca-731b-47ac-89f9-3c5a908e7a49', null, '2018-02-12 14:54:27', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('7625368e-079b-4371-a3dc-ccb004bfc9d6', null, '2018-02-12 14:54:27', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('7060cd1a-f8cb-4a8e-8493-508676101e9a', null, '2018-02-12 14:54:27', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('98af06f0-ca2b-42d4-8e6b-6f44a139a0d2', null, '2018-02-12 14:54:42', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('7b9b5df8-c410-4e1c-8ef7-c789d4c78e47', null, '2018-02-12 14:54:43', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('ac4221e8-a087-4f21-a809-2c2a95216a98', null, '2018-02-12 14:54:43', '15580830349', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('62dec1f5-2811-41f4-ac39-7c78f9b2a9df', null, '2018-02-12 14:55:08', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('1734d312-a6b9-419d-904c-42e4aca66dad', null, '2018-02-12 14:55:08', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('246af8f7-a827-4b13-92bc-6c7e7c4851ae', null, '2018-02-12 14:55:09', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('630eadb8-29bc-4943-9587-2a3a8be775bb', null, '2018-02-12 14:55:09', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('72adf5f2-1c6a-495f-873f-d5e0a6fcd183', null, '2018-02-12 14:55:10', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('0bdbe70a-1201-4c36-8154-670820b0a137', null, '2018-02-12 14:55:10', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('16ce6e5b-30c0-4877-8172-6310571c0e03', null, '2018-02-12 14:55:10', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('b551e1b4-cc0c-4bce-83d9-4437d7afcb30', null, '2018-02-12 14:55:10', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('8e2a1a6c-12be-40c9-9929-a461c35726d6', null, '2018-02-12 14:55:10', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('d78ae081-142e-4b07-b4b8-cabdabce2dc3', null, '2018-02-12 14:55:10', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('b8980218-9e82-4ffc-aa08-979bf7ddafa3', null, '2018-02-12 14:55:11', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('55f36125-8369-4297-977a-509295a9fea4', null, '2018-02-12 14:55:11', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('304b8b68-64aa-4131-bce6-1f1e47e01adc', null, '2018-02-12 14:55:11', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('b7f75d3d-1285-4ef7-a471-fc7113de0206', null, '2018-02-12 14:55:11', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('cec37c57-5420-4ede-b9ff-6eb4aebfa899', null, '2018-02-12 14:55:11', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e913f268-860e-4ba3-a51c-6bcbda81ac71', null, '2018-02-12 14:55:12', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('2d65be10-f733-412f-98b9-aff5528dd436', null, '2018-02-12 14:55:12', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('c1623cb3-0cd1-4f2c-8877-2666ead7381c', null, '2018-02-12 14:55:12', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('9dcd8b29-87da-41f2-a230-06857c234531', null, '2018-02-12 14:55:13', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('6e74c014-be96-4646-9e3b-a661917f679b', null, '2018-02-12 14:55:13', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('15c8469a-2935-40ca-8df6-b95e205d8f57', null, '2018-02-12 14:55:13', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('669e16a2-79a1-4504-8f3e-6fe3fd8ba713', null, '2018-02-12 14:55:14', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('cd745a27-3177-44f1-a8f4-cbda8ebb6cdc', null, '2018-02-12 16:26:00', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('cc4f7e02-b785-43e2-86e3-b39a010df6eb', null, '2018-02-12 16:26:01', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('3826dec8-2908-438a-b7fa-fb2f8baa23da', null, '2018-02-12 16:26:01', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('55df48ef-1ee8-40a9-9e99-88fbe998f939', null, '2018-02-12 16:26:01', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('4b88aecd-3d8c-4f64-9a5c-99b0984d7d96', null, '2018-02-12 16:26:01', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('fae01b2e-1e20-4198-994d-973df7d48680', null, '2018-02-12 16:26:01', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('966aeb03-0847-42e0-ac41-0e2617db0188', null, '2018-02-12 16:26:02', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('8576f533-469c-4bfb-a342-35fa0044015c', null, '2018-02-12 16:26:02', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f7a8a3d2-8b50-4283-a1be-acfe6b5c8678', null, '2018-02-12 16:26:02', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('6ee347c7-97b6-48d8-a85f-a714afde3eaf', null, '2018-02-12 16:26:03', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('eaedbe98-dae3-433d-825a-5d19c2a94e69', null, '2018-02-12 16:26:03', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('43abd7b4-9f16-4322-8cca-854f95557619', null, '2018-02-12 16:26:03', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('e7808c49-9bce-44bd-9627-af6745c146f2', null, '2018-02-12 16:26:03', '15580830348', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('31c15174-f2cd-411e-8fda-88c728bc03ef', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '2018-02-13 15:16:26', '15200531631', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('2fa68585-edda-4085-a4d1-8e77ed06a25c', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '2018-02-13 22:21:10', '15200864750', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('23323177-bec9-4273-8f26-ea6158e0c733', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '2018-02-17 09:32:06', '146684', '付快上课', '1', '0', '0');
INSERT INTO `customer` VALUES ('217a5e68-43c0-49ac-b57b-dae1487f4b67', 'oVbXbw4VvGPQs8BodXl5gJPqtL5M', '2018-02-22 00:43:56', '13517418068', '一笑倾人城', '1', '0', '0');
INSERT INTO `customer` VALUES ('1968d443-800a-483c-8f32-25b8f1e3d4fe', 'oVbXbw7MaOziw-8cwjHeYR6WKavw', '2018-02-23 22:40:03', '1686', '', '1', '30', '2068');
INSERT INTO `customer` VALUES ('73c19979-7267-4b7a-9d0a-8fe1c7a16378', null, '2018-02-27 15:43:05', '13517418068', '一笑倾人城', '1', '0', '0');
INSERT INTO `customer` VALUES ('c2258893-bc61-44f5-a9f7-28185c929d32', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '2018-02-28 13:22:08', '15367316996', '', '1', '15', '1055');
INSERT INTO `customer` VALUES ('f68d0743-d29e-47ef-982d-369c892f486e', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '2018-03-03 13:57:29', '18711101928', '', '1', '0', '0');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `uuid` varchar(36) NOT NULL,
  `gradeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('02', '初一');
INSERT INTO `grade` VALUES ('03', '初二');
INSERT INTO `grade` VALUES ('04', '初三');
INSERT INTO `grade` VALUES ('01', '小学');
INSERT INTO `grade` VALUES ('20', '高中');

-- ----------------------------
-- Table structure for openidteacher
-- ----------------------------
DROP TABLE IF EXISTS `openidteacher`;
CREATE TABLE `openidteacher` (
  `openId` varchar(80) NOT NULL,
  `orderType` varchar(10) NOT NULL,
  `teacherId` varchar(36) NOT NULL,
  PRIMARY KEY (`openId`,`orderType`,`teacherId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of openidteacher
-- ----------------------------
INSERT INTO `openidteacher` VALUES ('oiDYQ037tVxiPlWtbKbGmDG11ULM', 'on', '98db0907-d027-4027-81ba-8b344fe4ffca');
INSERT INTO `openidteacher` VALUES ('oiDYQ04a13xCEApFE3Dv0fut7e7w', 'on', '98db0907-d027-4027-81ba-8b344fe4ffca');
INSERT INTO `openidteacher` VALUES ('oiDYQ04RQy_OB10iMv3pA7M106qE', 'on', '86b64be7-1b09-422a-9f9a-7bb9751daf8f');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `name` varchar(50) DEFAULT NULL,
  `current` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('weixin', '617');

-- ----------------------------
-- Table structure for preordermanager
-- ----------------------------
DROP TABLE IF EXISTS `preordermanager`;
CREATE TABLE `preordermanager` (
  `uuid` varchar(36) NOT NULL,
  `openId` varchar(60) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderType` varchar(36) DEFAULT NULL,
  `grade` varchar(36) DEFAULT NULL,
  `subject` varchar(36) DEFAULT NULL,
  `studentName` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preordermanager
-- ----------------------------
INSERT INTO `preordermanager` VALUES ('914a11a2-d294-4f52-86c0-514a73630035', 'oiDYQ04a13xCEApFE3Dv0fut7e7w', '2017-07-14', 'on', '02', '04', '刘大臣', '18570601737', '', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('f976cb78-ea20-4251-ab0f-6d3e24bc7329', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-14', 'on', '02', '04', '测试', '15580830347', '', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('2218ff6b-6308-4a75-9245-b464cd1d25ef', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-15', 'on', '02', '04', '1', '1', '1', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('ec91e561-1de2-4204-b0a5-3a316597fef6', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-15', 'on', '04', '14', '2', '2', '2', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('dc85315d-b816-45e0-a882-1691a72eec7a', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-15', 'on', '02', '04', '2', '3', '4', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('c69b81f8-6d03-49c1-9f10-5b718008303e', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-15', 'on', '03', '09', '22', '22', '22', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('27ddb9b8-5437-48d9-a934-64775a13746f', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-15', 'on', '02', '04', '5342', '4234', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('f1bea513-94b2-45f3-9128-163a88a2f3c6', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-15', 'on', '02', '04', '测试', '15580830928', '', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('b6a4982b-61ae-4481-b021-594cf2c555a5', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-15', 'on', '02', '02', '(⊙o⊙)…', '111', '111', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('8e581810-72bd-402d-a57b-389eeae6975c', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-15', 'on', '10', '20', '测试', '165580865', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('40fa971b-f47f-4b44-968a-365653baae6b', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '2017-07-15', 'on', '20', '31', '11', '11', '11', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('b59f3c53-fd22-48bd-a6cc-a824980d956b', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-15', 'on', '10', '20', '测试', '15580838650', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('16215ad1-3c0b-4e68-9f82-c4650f883957', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-15', 'on', '20', '31', '测试', '15580975570', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('203ef612-328d-45d3-bc24-aeea3285ef2b', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-16', 'on', '02', '04', '测试lgc', '15580840349', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('bd5d3485-4659-4130-9abd-3eed18151502', 'oiDYQ0_r0nEljim7YrQVazOd_DE4', '2017-07-20', 'on', '02', '02', '胡易', '13907494526', 'yanpingcm', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('307c61c4-e696-487f-a058-a5952bd9cfb0', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-21', 'on', '03', '03', '测试', '123', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('6f1af17c-3518-4252-9d9b-5efb677ad403', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-21', 'on', '02', '04', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('20b71132-f312-4329-b569-d7dcf1b250cc', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-21', 'on', '02', '04', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('b8457eab-6417-4c84-9e8e-5ad7573458c9', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-21', 'on', '20', '20', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('223a57ec-48ed-43be-9946-165377556cbd', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '2017-07-21', 'on', '03', '03', '测试', '1', '1', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('af56e228-5dc0-4d96-b9a8-9db321093d63', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '2017-07-21', 'on', '02', '04', '测试', '1', '1', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('d1e002b9-019e-44cc-8a52-57ee341be857', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '2017-07-21', 'on', '03', '03', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('cf525661-a870-4aec-91db-e5e550a619f9', null, '2017-07-21', 'on', '10', '20', '测试', '111', '1', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('23f67f95-5632-4132-9d3e-b36dc3010d85', null, '2017-07-21', 'on', '04', '12', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('d56e4f8d-bfbb-4a83-9d84-fb882b4fae38', null, '2017-07-21', 'on', '02', '04', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('5339a478-bac8-4702-9fdd-79c2b680d1bf', null, '2017-07-21', 'on', '10', '20', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('c08304d8-37b2-42e4-a955-e9a793593344', null, '2017-07-21', 'on', '20', '32', '测试', '111', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('8c21be27-c004-4b90-b7d7-94b1f3df3eec', null, '2017-07-21', 'on', '20', '30', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('9a3c88c7-42ba-4706-9ec7-5d8f44879381', null, '2017-07-21', 'on', '20', '32', '测', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('3bc588b4-f615-44c4-ad58-7fcaa12f30eb', null, '2017-07-21', 'on', '04', '12', '测', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('ca1fb69b-8d36-4312-af24-90ddbcf33ab8', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-21', 'on', '20', '32', '测试', '1', '1', '0', '刘国臣', '-1');
INSERT INTO `preordermanager` VALUES ('0e8b6139-ec76-47e5-9840-c98c2c261735', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-21', 'on', '10', '20', '测试', '1', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('1e9a6450-6a5e-41a9-87e2-0ebeb98bd039', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-22', 'on', '02', '04', 'lgc', '11', '1', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('4db4d0e5-2908-4e3b-8066-df50579b1dc3', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-22', 'on', '04', '12', 'lgc', '2', '2', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('29efae1d-853d-4a46-805c-127043a5c569', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-22', 'on', '20', '30', 'lgc', '3', '3', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('b533ed8a-f2ad-4c38-be61-5c989dd3d695', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-24', 'on', '04', '13', 'lgc', '3', '3', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('29968ce2-f290-4a9b-8b71-4baa09d3c554', null, '2017-08-08', 'on', '02', '04', 'lgc测试', '15580830387', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('8ad9ef32-33cd-49bc-8b67-0f0c6ce35dc1', 'oiDYQ00-fyRniJe64qhA7IERSgzs', '2017-08-08', 'on', '02', '04', 'lgc', '5335', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('7ed53cc3-fc8c-44bd-bab4-cd5f05335612', 'oiDYQ048e11yXBdUTj_PLVOnaDlY', '2017-08-08', 'on', '04', '14', '高超', '18711157163', '18711157163', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('1593b15f-ad0c-441a-91dc-c967aeda22e9', 'oiDYQ048e11yXBdUTj_PLVOnaDlY', '2017-08-08', 'on', '04', '14', '高超', '18711157163', '18711157163', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('a276ea94-4044-49eb-90b7-82994f13f3f5', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '2017-08-10', 'on', '02', '04', '陈明', '15200531631', 'joey', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('f8ae98ad-fce1-4497-b57b-8063cb2c11ee', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '2017-08-10', 'on', '02', '04', '小明', '15200531631', 'joe', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('2be22432-6e21-44e1-b590-42b29ed6a3bf', null, '2017-08-10', 'on', '02', '04', '呃呃', '12', '121', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('e1b29f08-b5a3-4ba8-b90f-2ee0337b717a', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-08-15', 'on', '02', '05', 'lgc', '15580800869', '', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('9ce7c86e-7c52-466a-9d0c-ff5bcfdedec3', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-08-15', 'on', '02', '04', '测试', '145855', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('f1bd473a-cda3-4222-981d-ab7cff2d2394', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-08-15', 'on', '02', '04', '测试', '111', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('197e9679-0dd7-47ec-8a40-90ed6cfd43b8', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-08-15', 'on', '02', '04', '测111', '212', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('ce0fd0cb-1474-45e9-b20f-0ee39fdd632d', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-08-15', 'on', '04', '14', '1232测试111', '123', '', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('27a063f9-bf5d-4509-9d86-6e2ef2c8bd57', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-08-21', 'on', '03', '08', '刘国臣', '123', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('f9cffd07-2918-45ec-90c7-8d623c105055', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-08-23', 'on', '02', '04', '刘国臣', '1345', '', '0', '刘国臣', '-1');
INSERT INTO `preordermanager` VALUES ('1355dc04-2ac2-4532-8f05-bf78395dc8d3', null, '2017-08-28', 'on', '02', '04', '刘国臣', '12345678', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('a3c6169d-dc1b-4ce7-b31e-1c75c0149723', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-08-28', 'on', '02', '04', '刘国臣', '15580830349', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('204cfb09-b951-4eab-9176-d3ac8c5564ef', null, '2017-08-29', 'on', '02', '04', '向嘉博', '18613371053', '45390604', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('6d3266eb-98d5-40cd-85ab-3957f51541c4', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '2017-09-01', 'on', '20', '30', '刘舒玄', '13319519996', '13319519996', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('5ce599b1-cb9b-4ab0-bb2b-ef612bcd2c4f', 'oiDYQ0-jAjByT-kfZlUGisxZEk7k', '2017-09-02', 'on', '20', '30', '周圣沅', '18607358121', '花开成海', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('649d69b7-514b-44a3-819c-720817935efc', 'oiDYQ0-jAjByT-kfZlUGisxZEk7k', '2017-09-02', 'on', '20', '30', '周圣沅', '18607358121', '花开成海', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('111d219e-2e25-4a41-b746-446820e3fd01', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '2017-09-06', 'on', '03', '08', '曾兰淇', '13707498722', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('729d4855-0285-4aa6-88c1-188c045274ff', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '2017-09-06', 'on', '03', '09', '曾兰淇', '13707498722', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('ec42369e-8d3a-456e-8130-743acc844599', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2017-09-08', 'on', '02', '04', '向嘉博', '18613371053', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('8a8c1313-6a4d-4101-96b1-183325ab6a08', 'oiDYQ05ZWxaAmgQ_YdeiS2yQUFPM', '2017-09-09', 'on', '20', '04', '任佩妮', '15073066998', '15073066998', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('e3c3d67c-3dc5-4fd8-a0af-c5bdc77ecc68', 'oiDYQ0yph1h6TdTRge6aK5wvd1XE', '2017-09-10', 'on', '20', '32', '刘亚芳', '18684839966', '18684839966', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('329cb7b7-c13f-4a47-9b6a-6a4b12782200', 'oiDYQ0yph1h6TdTRge6aK5wvd1XE', '2017-09-10', 'on', '20', '30', '刘亚芳', '18684839966', '18684839966', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('f5c5019b-4e9c-4f74-9c75-de23e181ae73', 'oiDYQ0yph1h6TdTRge6aK5wvd1XE', '2017-09-10', 'on', '20', '32', '刘亚芳', '18684839966', '18684839966', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('eefc8a46-83d6-493a-999d-8b1e29e96def', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '2017-09-10', 'on', '20', '30', '陈湛', '15084785602', '15084785602', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('0ada818a-9711-48ff-aa56-9fa4c550a6aa', 'oiDYQ01QAJGEUehmMvVcmG95GNQQ', '2017-09-10', 'on', '20', '31', '胡妍', '15874027658', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('9d01296b-048c-4982-a6a0-cc863f8ab052', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '2017-09-10', 'on', '04', '42', '曹哲铭', '13808422910', '13808422910', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('434adb22-e340-4a66-9ed4-d67df78f5701', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-09-11', 'on', '02', '04', '测试hexl', '111111', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('b0aaec9a-7fce-423e-acfb-6b745f19d7d8', 'oiDYQ0283GKTWTKPu0R4xjs3U10w', '2017-09-13', 'on', '02', '04', '广告费', '13946220601', '12356', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('4e9d839a-540d-45c2-9b3c-b926e71f7923', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '2017-09-14', 'on', '02', '04', '朱妍茜', '18673880006', 'FW13807381968', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('d89de5b0-598b-40e5-9c70-c1e0766d3c52', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '2017-09-14', 'on', '02', '40', '朱妍茜', '18673880006', 'FW13807381968', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('bf1833aa-48ce-4ac9-8dcb-5cc6c37cc517', 'oiDYQ03AsJAPKjDppaV_BdK-y94k', '2017-09-16', 'on', '20', '04', '邹书涵', '13787797566', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('c26d492c-a9f5-402c-b426-7d24cca48d2d', 'oiDYQ03AsJAPKjDppaV_BdK-y94k', '2017-09-16', 'on', '20', '31', '邹书涵', '13787797566', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('833cb86d-cf5d-48e9-9e5d-a8c142a3a6f3', 'oiDYQ04Teivn5JCR2pqmOFOcz03s', '2017-09-17', 'on', '01', '52', '肖凯文', '13517481209', '13517481209', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('083b7ddc-ff8d-4ad6-b562-966274bcc255', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '2017-09-17', 'on', '02', '04', '刘俊杰', '18627317428', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('6e7ffbda-f066-4b10-bd7b-6388d7e6ee71', 'oiDYQ02e_v6EI1M2Lqdnaej0TZPo', '2017-09-19', 'on', '20', '30', '杨亚颖', '13682271926', '13682271926', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('26c7853f-9add-4a7d-8811-2fc7d697772c', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '2017-09-21', 'on', '01', '52', 'abby', '18573117977', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('effa6533-fcba-434e-ba13-8f820f5b5ce4', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-09-21', 'on', '02', '04', '测试', '13455509', '', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('dda11a68-cb73-4264-a854-4e6971411392', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-09-22', 'on', '02', '04', '测试007', '1234567', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('fa3029ca-38eb-4f48-9380-8ba752894aff', 'oiDYQ00vSW-oAkSSxkRC4uwZ9xMc', '2017-09-22', 'on', '01', '51', '蒋宇桐', '13974844276', '13974844276', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('ba8ee3c2-e7f4-4dbd-aad5-df4f9e8c52a4', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-09-22', 'on', '02', '04', '测试', '13467', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('9e8b9b6a-beca-43cf-a877-80f49e0321c5', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '2017-09-24', 'on', '20', '43', '周圣沅家长', '18607358121', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('d880e49f-4f26-4bf0-9c9e-29c93b595978', 'oiDYQ0yZ3EFSxqSIU3CXVO89D2HI', '2017-09-24', 'on', '02', '04', '18670739350', '18670739350', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('82478285-fbd6-4e59-991c-b270130073e9', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '2017-09-25', 'on', '02', '04', '李政', '15388981830', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('b654d305-8671-447d-9a0a-a933c5937383', 'oiDYQ09C5QoVN8ajKMzBk7tqLnVE', '2017-09-26', 'on', '04', '12', '畅阁', '15367491161', '13569806345', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('3b0894c6-66b6-44cf-8fc4-847a005f459c', 'oiDYQ0yj49UFCc4AZBjJnUN768-c', '2017-09-26', 'on', '04', '12', '范崇良', '13507468063', '13507468063', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('1788260b-0208-4055-99ce-eed194fd852c', 'oiDYQ0-n4bTgNDZ3vgY6hEcgABp0', '2017-10-01', 'on', '02', '04', '李若水', '13808430160', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('df6c65aa-ba20-4568-9bab-2c220aced723', 'oiDYQ0-n4bTgNDZ3vgY6hEcgABp0', '2017-10-01', 'on', '02', '04', '李若水', '13808430160', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('8736b482-77a5-4a33-ba45-3b056db4b8d2', 'oiDYQ089uySfDdCBS-FeI6qODeEo', '2017-10-01', 'on', '03', '08', '刘小曼', '18670718258', '18670718258', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('437744b5-0d9c-41dc-b6b0-c2922efa8447', 'oiDYQ03gwIddQ8T0h6hveJTAcyK4', '2017-10-02', 'on', '20', '30', '占思垚', '13875851168', '13875851168', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('86667f63-3242-441f-a6be-bbe313631309', 'oiDYQ0yj8ixe3j5Lrjbj3ByoAiug', '2017-10-05', 'on', '03', '08', '垚垚', '13332510256', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('0cab003d-8c0c-4c01-938e-da8b11821dcf', 'oiDYQ0yAK2S2n6BioMSxCiNnva2c', '2017-10-07', 'on', '20', '30', '曾杰蕃', '13627419667', 'zjf568795271', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('e7c9914a-addf-457c-917a-c45a4a419c10', 'oiDYQ06PFj9zfn33DjRojhewj6wg', '2017-10-07', 'on', '20', '30', '李瑜', '15973119680', '15973119680', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('124cc0f3-293a-4b21-80b1-93843c276e3a', 'oiDYQ01sZh0q9uPd4T1Orbq4jinw', '2017-10-08', 'on', '20', '31', '易同学', '13786177533', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('727f08dc-9506-45ad-b179-cec87b9d45df', 'oiDYQ0zUqcawmPfZ_DbQxkQ_6eYM', '2017-10-10', 'on', '20', '30', '白莲', '13295812562', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('b78fbbb6-cca8-4b15-a620-6d6e946d0391', 'oiDYQ06n2C3l10LsT8G76AesNM4M', '2017-10-10', 'on', '02', '04', '郭旭致', '18974931217', 'sun2005218', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('b971494e-b46a-4312-816c-a3ad7dbb6b74', 'oiDYQ03_piIAs2BqvLlZhD-psXb4', '2017-10-10', 'on', '03', '41', '李斯玮', '15807096895', '15807096895', '0', '11中旬有空', '1');
INSERT INTO `preordermanager` VALUES ('212a4a92-276a-4359-a24a-ee2d37acd0fd', 'oiDYQ07wQRLsjqnKNTZPBCr8h69A', '2017-10-10', 'on', '20', '30', '宋子谕', '15874871104', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('2ae1e433-50fa-46d7-818e-58de4d7739cc', 'oiDYQ075SzOw5N4mDFVMaCcWTf9g', '2017-10-11', 'on', '02', '40', '卢松松', '13520522587', '13520522587', '1', '', '-1');
INSERT INTO `preordermanager` VALUES ('a193b5e2-0d00-4c7d-87b7-2e5ca385e840', 'oiDYQ0yppLCzEdOBPuNw__xwx_Lo', '2017-10-11', 'on', '20', '30', '占思垚', '13879835010', '594965022', '0', '不接电话', '1');
INSERT INTO `preordermanager` VALUES ('5896d655-bec5-4642-8d41-3f0384cca8bd', 'oiDYQ0_YHnsL0mDHOA5AdPM3_gXo', '2017-10-13', 'on', '02', '04', '尹庆恒', '15111130939', 'yqhnnx', '1', '师大捣乱的', '1');
INSERT INTO `preordermanager` VALUES ('418d4449-d21c-4f60-949e-12ffa56843cf', null, '2017-10-20', 'on', '20', '30', '龙彦贝', '13307413004', '1781982042', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('84fb2b49-9a8a-46a5-86bb-11df7c0f6583', 'oiDYQ07XllCEYTf4pWOKsEd1mORY', '2017-10-20', 'on', '20', '30', '秦阙', '18229775088', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('6e96f495-1900-47d6-8743-78f2e92d8325', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '2017-10-24', 'on', '01', '51', '文齐睿', '15873191766', '15873191766', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('2319eab4-5fcd-43bb-a146-a4bdd1ea3934', 'oiDYQ05H8TFu_gxrr2mibWDe3r3Q', '2017-10-23', 'on', '20', '30', '程佳骏', '18670334562', 'qq18670334562', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('75b22011-677d-447e-810f-fb19df82734a', 'oiDYQ07Wh30z1_wUBUuVQGzGdgNE', '2017-10-24', 'on', '20', '31', '杨嘉雯', '15802554252', '15802554252', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('e9966a76-4caf-432a-af2f-2b8b8345b3d0', 'oiDYQ00FV81m8YEJsoL3FXPm6A24', '2017-10-24', 'on', '03', '09', '刘靖怡', '13874803312', '13874803312', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('a2cc6372-6e5e-45a5-83aa-9c27192a20aa', 'oiDYQ00FV81m8YEJsoL3FXPm6A24', '2017-10-24', 'on', '03', '08', '刘靖怡', '13874803312', '13874803312', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('63913963-8b1c-425d-ad3d-3f5ee93d8036', 'oiDYQ00FV81m8YEJsoL3FXPm6A24', '2017-10-24', 'on', '03', '41', '刘靖怡', '13874803312', '13874803312', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('4c2f9d20-1c01-4645-a079-0de0aee41566', 'oiDYQ07g8DFcg_gMn1sLG4aU9sV8', '2017-10-25', 'on', '03', '09', '王宸颖', '13787090353', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('3cf03fe4-2fb2-4fc6-9de9-f5c353c5e928', 'oiDYQ07g8DFcg_gMn1sLG4aU9sV8', '2017-10-25', 'on', '03', '08', '王宸颖', '13787090353', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('045f332d-734e-4bca-9b3b-e03a6a0dfea7', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '2017-11-01', 'on', '03', '08', '贺煜', '18573179633', '18573179633', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('e46e0b8a-e36d-4bc1-a28d-be2e64125258', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '2017-11-01', 'on', '03', '08', '贺煜', '13707319633', '13707319633', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('3410d231-529e-4883-83c8-b8fada69ae55', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '2017-11-03', 'on', '02', '04', '贺暄涵', '13908472055', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('525235b8-8ea8-4616-8717-1394b00fd6de', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '2017-11-03', 'on', '02', '04', '贺暄涵', '13908472055', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('0aa682ce-854d-41e5-87f0-d65465506aed', null, '2017-11-07', 'on', '04', '42', '谢珑', '18874284178', 'ⅹ18874284178', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('d7e5cf9a-ffc1-4045-92c3-b6f38886a394', 'oiDYQ09XjS_vn4-Daf5Td8iUTKIs', '2017-11-08', 'on', '04', '12', '黎嘉钰', '18908478835', '', '1', '暑假补', '1');
INSERT INTO `preordermanager` VALUES ('e0390416-fb5f-4eb2-8c9b-e147451903c4', 'oiDYQ09XjS_vn4-Daf5Td8iUTKIs', '2017-11-11', 'on', '04', '42', '黎嘉钰', '18908478835', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('519c05f1-37fc-42ff-b47b-298c542b5f51', 'oiDYQ02cEGTPChJbTc-WfhCwl0Mc', '2017-11-14', 'on', '03', '09', '唐晗旸', '13786134428', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('4d66c2cf-726a-4443-b947-8b0e850be717', 'oiDYQ01tuCsCDUbWfES1KVuA5wm0', '2017-11-17', 'on', '20', '04', '王唯玮', '13974804269', '13974804269', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('0b31736b-35b2-417d-9a1b-3701ffed6946', 'oiDYQ01tuCsCDUbWfES1KVuA5wm0', '2017-11-17', 'on', '02', '40', '王唯玮', '13974804269', '13974804269', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('756006cd-e563-47d3-91eb-fbc5bd51bdfa', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2017-11-20', 'on', '02', '04', '向嘉博', '18613371053', '', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('5d987403-f158-4df0-82b4-c864eb03e495', 'oiDYQ07mde2bu0S5sVhntd52n7ns', '2017-11-23', 'on', '04', '12', '黄婧瑶', '15084828211', '15084828211', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('0f6a32d6-ba9d-46af-b083-01debbf8a8da', null, '2017-11-25', 'on', '03', '08', '蒋湘湘', '13319531879', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('a6c4fcd7-43b5-457c-b46a-17fa41540004', null, '2017-11-25', 'on', '02', '04', '蒋湘湘', '13319531879', '13319531879', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('4a69f186-75fd-4c30-acd3-9a7f2d1318f0', 'oiDYQ02zjXBzLIX_H7zW_fc3rLa8', '2017-11-25', 'on', '02', '40', '彭泽宝', '13874205409', '13874205409', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('ab8ea094-d72b-41ee-9109-26cb2a73e140', 'oiDYQ06TokCN9evn9dHIxbnJXVUQ', '2017-11-30', 'on', '02', '40', '肖尚锋', '18229879623', '18229879623', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('78833b99-63c1-4903-862e-60c46ebc278c', 'oiDYQ0zkqngg-JBUwqW2RnRitiN8', '2017-12-01', 'on', '04', '13', '曾柳', '15873132531', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('27d52c27-7155-4216-a5b6-09b755e79091', 'oiDYQ09NGSocE14k1kc_9SRpLzfA', '2017-12-04', 'on', '04', '13', '黄美珍', '18774915780', 'hrb18774915780', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('b80acdf0-6bb3-424a-a620-0850d74dd6b6', null, '2017-12-18', 'on', '02', '04', '夏振宇', '13080525539', '13080525539', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('ffc72e3d-ff74-487f-b5e4-6cf253e67cf3', null, '2017-12-19', 'on', '02', '04', '黄译萱', '13549510015', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('450b27ba-b56d-4039-b4a9-5773e4efbc83', null, '2017-12-20', 'on', '20', '30', '石镛', '15080887588', 'wf13387436918', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('0a3160d1-78d8-4b4e-9e37-9e10aa297390', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2017-12-20', 'on', '20', '30', '张宇琦', '13874996056', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('81a22541-2dfd-48be-a7c5-c74d96d3d983', 'oiDYQ07iBsfT3WJ8yX4qQEajMyaM', '2017-12-21', 'on', '04', '42', '连曦', '15211205523', '', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('23bc5647-5758-4f2c-a075-a70fa07e6643', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2017-12-21', 'on', '20', '30', '张宇琦', '13874996056', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('493f92e7-9392-42b3-8de9-4decdfd9407d', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2017-12-21', 'on', '20', '30', '张宇琦', '13874996056', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('92384bf5-4356-4d4b-9884-39859fc99599', null, '2017-12-29', 'on', '03', '08', '王呈', '13574100727', '13574100727', '1', '', '1');
INSERT INTO `preordermanager` VALUES ('1f39700f-362e-4780-804b-0d650e6efe70', null, '2017-12-30', 'on', '', '', '喻辰曦', '13974876604', '13974876604', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('59230527-9e4c-4b1c-8cc7-8ecbc4daf47b', null, '2018-01-07', 'on', '20', '43', '门口了', '18711019949', '18711019949', '0', '', '-1');
INSERT INTO `preordermanager` VALUES ('341338b0-78a0-4a23-96ea-439e17b88857', 'oiDYQ0zQBHpb7usOmVdVs9Fo6CHQ', '2018-01-13', 'on', '04', '13', '欧阳斌', '13017180222', '13017180222', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('6eb0ef6a-bfee-4fad-b944-44b5d8e1d17b', 'oiDYQ0w3NiBPbiBOdUItt3GQnq_A', '2018-01-28', 'on', '03', '08', '姜秦', '13762376997', '13762376997', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('bab469fa-fb25-4f00-a135-e0345404734b', 'oiDYQ0_odGkWOCdIFCpTfUW6ybqo', '2018-02-04', 'on', '20', '43', '李旭', '18974611518', 'XYR18974611518', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('f732608f-27ab-4de4-93e5-4fafd12f8fb6', null, '2018-02-08', 'on', '02', '04', '测试', '100000', '448', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('a67c2cd4-2da2-462f-befe-88984af9a1e7', null, '2018-02-08', 'on', '02', '04', '测试', '123444', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('8fde9661-5e79-4305-a6ff-4f4d38c2e5fd', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '2018-02-17', 'on', '02', '04', '测试', '146684', '付快上课', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('f2533d53-76bb-4ee2-8cb0-d78b74d7c905', 'oVbXbw4VvGPQs8BodXl5gJPqtL5M', '2018-02-22', 'on', '02', '04', '胡璟璇', '13517418068', '一笑倾人城', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('d8ea1f44-c290-488d-b26c-4f23314ea676', 'oVbXbw4VvGPQs8BodXl5gJPqtL5M', '2018-02-24', 'on', '02', '04', '胡璟璇', '1351718068', '一笑倾人城', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('31b48764-bbef-42e0-8623-33a737026f0b', null, '2018-02-27', 'on', '02', '04', '胡璟璇', '13517418068', '一笑倾人城', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('09f90ab0-de13-4d8a-8dd0-9ed9b1728b9c', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '2018-03-03', 'on', '02', '04', '测试测试', '18711101928', '', '0', '', '1');
INSERT INTO `preordermanager` VALUES ('a1c18921-b506-45b9-a3f1-cb341d56c69e', 'oVbXbw_Fz5o2-VHc5eIW5WY1JG70', '2018-03-03', 'on', '02', '04', '测试测试2', '12312312312', '', '0', '', '1');

-- ----------------------------
-- Table structure for realordermanager
-- ----------------------------
DROP TABLE IF EXISTS `realordermanager`;
CREATE TABLE `realordermanager` (
  `uuid` varchar(36) NOT NULL,
  `openId` varchar(60) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderType` varchar(30) DEFAULT NULL,
  `grade` varchar(36) DEFAULT NULL,
  `subject` varchar(36) DEFAULT NULL,
  `studentName` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `weixin` varchar(50) DEFAULT NULL,
  `teachingTime` double DEFAULT NULL,
  `usedTime` double DEFAULT NULL,
  `balanceDate` date DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of realordermanager
-- ----------------------------
INSERT INTO `realordermanager` VALUES ('d9cb18cc-b76d-4514-a56f-4fd945ec5e6b', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-13', 'on', '02', '', 'wee', '111', '', '3', '3', '2017-09-25', '1', '222.247.54.20');
INSERT INTO `realordermanager` VALUES ('65633bfc-c2b3-4177-87e0-d37edc6683bf', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '2017-07-13', 'of', '02', '', 'wee', '111', '', '0', '0', '2017-07-13', '1', '222.247.54.20');
INSERT INTO `realordermanager` VALUES ('b7818cf2-fac7-41f7-b0a4-c100c0644059', 'oiDYQ04a13xCEApFE3Dv0fut7e7w', '2017-07-14', 'on', '02', '', '小志哥', '18570601737', '', '1', '1', '2017-07-18', '1', '113.240.250.185');
INSERT INTO `realordermanager` VALUES ('71d44935-e381-4af1-8957-6767c371c1cd', 'oiDYQ04a13xCEApFE3Dv0fut7e7w', '2017-07-14', 'of', '02', '', '小志哥', '18570601737', '', '0', '0', '2017-07-14', '1', '113.240.250.185');
INSERT INTO `realordermanager` VALUES ('3ba4f428-1dc2-416e-a2f4-77a3ea2115a5', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '2017-07-15', 'on', '02', '', '张杰', '15200531631', '', '1', '1', '2017-09-24', '1', '113.240.250.186');
INSERT INTO `realordermanager` VALUES ('31f45dc5-2f05-4937-b0de-bba9c98093f4', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '2017-07-15', 'of', '02', '', '张杰', '15200531631', '', '0', '0', '2017-07-15', '1', '113.240.250.186');
INSERT INTO `realordermanager` VALUES ('c36a8228-78df-4c2d-93c0-c29f4e0e099d', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '2017-07-15', 'on', '02', '', '1', '1', '', '0', '0', '2017-07-15', '1', '110.53.253.211');
INSERT INTO `realordermanager` VALUES ('141eaaea-fd19-443d-a46e-7878ee73748d', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '2017-07-15', 'of', '02', '', '1', '1', '', '0', '0', '2017-07-15', '1', '110.53.253.211');
INSERT INTO `realordermanager` VALUES ('8c1e4bff-dd03-4fca-b03e-8f4f99ece783', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-15', 'on', '02', '', '测试', '25580830389', '', '28', '28', '2017-11-13', '1', '222.247.54.20');
INSERT INTO `realordermanager` VALUES ('4a3ecc54-e75b-4b31-96ac-7375bd61174d', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2017-07-15', 'of', '02', '', '测试', '25580830389', '', '0', '0', '2017-07-15', '1', '222.247.54.20');
INSERT INTO `realordermanager` VALUES ('b2ffcd58-d725-403f-9523-499b89209202', 'oiDYQ0zpwMxn8Fhn3sJcYT7ZmkAI', '2017-07-15', 'on', '02', '', '张三', '1563738312', '', '1', '1', '2017-09-11', '1', '222.247.54.20');
INSERT INTO `realordermanager` VALUES ('d9f4d78b-b2f3-4bf0-9643-fa57adecec99', 'oiDYQ0zpwMxn8Fhn3sJcYT7ZmkAI', '2017-07-15', 'of', '02', '', '张三', '1563738312', '', '0', '0', '2017-07-15', '1', '222.247.54.20');
INSERT INTO `realordermanager` VALUES ('95090076-26f6-48c0-88e1-366b44c1bf5f', 'oiDYQ00-fyRniJe64qhA7IERSgzs', '2017-08-08', 'on', '02', '', '穿多大', '1255', '', '1', '1', '2017-09-24', '1', '220.202.152.85');
INSERT INTO `realordermanager` VALUES ('8b6cc31e-3872-4f55-9048-d29327b56992', 'oiDYQ00-fyRniJe64qhA7IERSgzs', '2017-08-08', 'of', '02', '', '穿多大', '1255', '', '0', '0', '2017-08-08', '1', '220.202.152.85');
INSERT INTO `realordermanager` VALUES ('8d8a91e0-09b0-43c4-afd3-df4c344ef573', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '2017-09-08', 'on', '01', '', '唐敏', '13875843603', '', '30', '30', '2018-01-28', '1', '113.247.20.121');
INSERT INTO `realordermanager` VALUES ('c469ff97-3283-4927-8c89-adcd346cfde8', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '2017-09-08', 'of', '01', '', '唐敏', '13875843603', '', '0', '0', '2017-09-08', '1', '113.247.20.121');
INSERT INTO `realordermanager` VALUES ('3f685d53-d7f3-4d6b-ad51-97738c0ae879', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2017-09-08', 'on', '02', '', '向嘉博', '18473459303', '', '30', '30', '2017-09-25', '1', '106.17.29.17');
INSERT INTO `realordermanager` VALUES ('0ea99551-f606-45d3-9c00-ac927c52b0ea', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2017-09-08', 'of', '02', '', '向嘉博', '18473459303', '', '0', '0', '2017-09-08', '1', '106.17.29.17');
INSERT INTO `realordermanager` VALUES ('6813fde2-1cb2-464b-aa86-cb971d25036b', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '2017-09-09', 'on', '03', '', '喻宏波', '13707498722', '', '43', '43', '2018-04-09', '1', '223.104.131.213');
INSERT INTO `realordermanager` VALUES ('aea4b474-b5ba-4810-8317-f6589f3e20d3', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '2017-09-09', 'of', '03', '', '喻宏波', '13707498722', '', '0', '0', '2017-09-09', '1', '223.104.131.213');
INSERT INTO `realordermanager` VALUES ('cd212968-81e6-4a8c-bf9f-fbc7bd572df9', 'oiDYQ01QAJGEUehmMvVcmG95GNQQ', '2017-09-10', 'on', '02', '', '彭艳', '15874027658', '', '0', '0', '2017-09-10', '1', '42.48.76.78');
INSERT INTO `realordermanager` VALUES ('1ed39d28-57b6-4ef1-81fe-73f7df536a5d', 'oiDYQ01QAJGEUehmMvVcmG95GNQQ', '2017-09-10', 'of', '02', '', '彭艳', '15874027658', '', '0', '0', '2017-09-10', '1', '42.48.76.78');
INSERT INTO `realordermanager` VALUES ('e1760304-46f9-4678-992f-fdb3b8e22560', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '2017-09-10', 'on', '02', '', '曹建伟', '13808422910', '', '46', '46', '2018-01-03', '1', '175.13.252.40');
INSERT INTO `realordermanager` VALUES ('daaa9111-f6c9-4d0c-bccd-da5584514240', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '2017-09-10', 'of', '02', '', '曹建伟', '13808422910', '', '0', '0', '2017-09-10', '1', '175.13.252.40');
INSERT INTO `realordermanager` VALUES ('94c8e976-eaeb-41da-b5d3-2141122cee9e', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '2017-09-11', 'on', '02', '', '赵宗荡', '15874030708', '', '60', '60', '2018-04-09', '1', '175.8.107.189');
INSERT INTO `realordermanager` VALUES ('190c3dcb-3e6b-4288-9e15-895055739bda', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '2017-09-11', 'of', '02', '', '赵宗荡', '15874030708', '', '0', '0', '2017-09-11', '1', '175.8.107.189');
INSERT INTO `realordermanager` VALUES ('bd231e3b-e1c8-49dc-a10b-a0bb238fdeb5', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '2017-09-12', 'on', '03', '', '徐新伟', '18975819567', '', '60', '60', '2018-04-10', '1', '118.249.56.1');
INSERT INTO `realordermanager` VALUES ('2595c583-a32f-41f6-85bf-99e0e9ebd5e5', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '2017-09-12', 'of', '03', '', '徐新伟', '18975819567', '', '0', '0', '2017-09-12', '1', '118.249.56.1');
INSERT INTO `realordermanager` VALUES ('dfa19932-bcd7-4bec-8b37-a4e6e638d9c6', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '2017-09-13', 'on', '02', '', '陈少敏', '13027415020', '', '43', '43', '2018-01-28', '1', '119.39.248.60');
INSERT INTO `realordermanager` VALUES ('a2d94c35-4784-456c-b41c-de9eeff7cfff', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '2017-09-13', 'of', '02', '', '陈少敏', '13027415020', '', '0', '0', '2017-09-13', '1', '119.39.248.60');
INSERT INTO `realordermanager` VALUES ('50054f2e-820a-4d38-8df6-34bcd62ef906', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '2017-09-13', 'on', '03', '', '周建', '15974291689', '', '16', '16', '2017-12-13', '1', '222.247.203.91');
INSERT INTO `realordermanager` VALUES ('7abff833-54ac-4496-9eee-9fca01968c21', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '2017-09-13', 'of', '03', '', '周建', '15974291689', '', '0', '0', '2017-09-13', '1', '222.247.203.91');
INSERT INTO `realordermanager` VALUES ('407edad8-b5fa-48ae-b893-d87ead2ff988', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '2017-09-13', 'on', '20', '', '朱艳萍', '13319519996', '', '14', '16', '2018-04-09', '1', '106.17.41.147');
INSERT INTO `realordermanager` VALUES ('ac8fc027-5ee4-4842-b71f-0afe0fea8b89', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '2017-09-13', 'of', '20', '', '朱艳萍', '13319519996', '', '0', '0', '2017-09-13', '1', '106.17.41.147');
INSERT INTO `realordermanager` VALUES ('aa8e147d-ddc6-4ed8-a508-e245a2091952', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '2017-09-14', 'on', '20', '', '宋靓', '13975883828', '', '26', '26', '2018-01-14', '1', '113.246.155.88');
INSERT INTO `realordermanager` VALUES ('f1d56e57-d29f-4ed5-8a25-42bb39c1c3b6', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '2017-09-14', 'of', '20', '', '宋靓', '13975883828', '', '0', '0', '2017-09-14', '1', '113.246.155.88');
INSERT INTO `realordermanager` VALUES ('238c9476-5e7f-42fd-a27b-4814c5dbb5eb', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '2017-09-15', 'on', '02', '', '李颖', '15084916264', '', '80', '80', '2018-04-09', '1', '59.39.66.226');
INSERT INTO `realordermanager` VALUES ('f4c707cc-8fe6-47a8-aaa0-1b076bd44c1d', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '2017-09-15', 'of', '02', '', '李颖', '15084916264', '', '0', '0', '2017-09-15', '1', '59.39.66.226');
INSERT INTO `realordermanager` VALUES ('8d786543-3594-4514-ae57-9a9467c28109', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '2017-09-16', 'on', '20', '', '许二愚', '15367873825', '', '41', '41', '2018-04-09', '1', '222.240.94.184');
INSERT INTO `realordermanager` VALUES ('c4df4c91-aa3c-4ed0-81bb-ccdbbb52c326', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '2017-09-16', 'of', '20', '', '许二愚', '15367873825', '', '0', '0', '2017-09-16', '1', '222.240.94.184');
INSERT INTO `realordermanager` VALUES ('76ffb038-5e48-436a-accc-5ee7967f872d', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '2017-09-17', 'on', '02', '', '张利', '15974295408', '', '48.5', '48.5', '2018-01-28', '1', '110.52.211.147');
INSERT INTO `realordermanager` VALUES ('0583c5b9-9128-4c80-b19a-ccaf81b30917', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '2017-09-17', 'of', '02', '', '张利', '15974295408', '', '0', '0', '2017-09-17', '1', '110.52.211.147');
INSERT INTO `realordermanager` VALUES ('11bdc990-e02b-4f12-8ab9-2f7a0d021f6d', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '2017-09-17', 'on', '02', '', '樊伟', '18673880006', '', '31', '31', '2017-12-08', '1', '42.48.76.124');
INSERT INTO `realordermanager` VALUES ('72bf923d-5ce8-4607-a26d-7f495f531df5', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '2017-09-17', 'of', '02', '', '樊伟', '18673880006', '', '0', '0', '2017-09-17', '1', '42.48.76.124');
INSERT INTO `realordermanager` VALUES ('5d49710c-f6c3-409c-b411-efb42bc2014c', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '2017-09-17', 'on', '01', '', '言美莲', '18674807076', '', '13', '13', '2018-04-09', '1', '115.152.250.74');
INSERT INTO `realordermanager` VALUES ('265beffa-3948-40db-8d96-330dce6984a8', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '2017-09-17', 'of', '01', '', '言美莲', '18674807076', '', '0', '0', '2017-09-17', '1', '115.152.250.74');
INSERT INTO `realordermanager` VALUES ('ad83f9fa-c754-4483-b58a-fce9642623a6', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '2017-09-18', 'on', '02', '', '李雄', '13908468618', '', '75', '75', '2018-04-09', '1', '118.250.114.249');
INSERT INTO `realordermanager` VALUES ('6b2d04a7-ca60-4e7f-a269-4d4758c4974c', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '2017-09-18', 'of', '02', '', '李雄', '13908468618', '', '0', '0', '2017-09-18', '1', '118.250.114.249');
INSERT INTO `realordermanager` VALUES ('dd2df8e4-0793-4486-b82d-ee9fef71d8d2', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '2017-09-19', 'on', '02', '', '盛丽', '18627317428', '', '13', '13', '2017-12-10', '1', '115.152.250.76');
INSERT INTO `realordermanager` VALUES ('7bff11e8-230e-4474-9a88-fe5fc611aadc', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '2017-09-19', 'of', '02', '', '盛丽', '18627317428', '', '0', '0', '2017-09-19', '1', '115.152.250.76');
INSERT INTO `realordermanager` VALUES ('b5d1a22b-1655-4f94-a9e8-8d307fffcf6d', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '2017-09-19', 'on', '02', '', '唐丽萍', '15211093179', '', '19', '19', '2018-04-09', '1', '42.48.77.193');
INSERT INTO `realordermanager` VALUES ('75f668d2-6676-45d5-8930-525cd7361c50', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '2017-09-19', 'of', '02', '', '唐丽萍', '15211093179', '', '0', '0', '2017-09-19', '1', '42.48.77.193');
INSERT INTO `realordermanager` VALUES ('f0186693-290b-4fb7-a01f-8cfa47330a6b', 'oiDYQ03QfjQO6JYSPjKxtt6ikuLM', '2017-09-19', 'on', '20', '', '交流了', '15533', '', '0', '0', '2017-09-19', '1', '117.136.24.51');
INSERT INTO `realordermanager` VALUES ('e3eea919-c03c-42a2-95f6-0f591e769e15', 'oiDYQ03QfjQO6JYSPjKxtt6ikuLM', '2017-09-19', 'of', '20', '', '交流了', '15533', '', '0', '0', '2017-09-19', '1', '117.136.24.51');
INSERT INTO `realordermanager` VALUES ('1989347c-360e-4687-95d7-eeb10cc3fcf8', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '2017-09-19', 'on', '02', '', '缪珊平', '18807421661', '', '55.5', '55.5', '2018-02-04', '1', '59.39.66.227');
INSERT INTO `realordermanager` VALUES ('5edf45db-e7bd-4d9c-ba15-c62862666752', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '2017-09-19', 'of', '02', '', '缪珊平', '18807421661', '', '0', '0', '2017-09-19', '1', '59.39.66.227');
INSERT INTO `realordermanager` VALUES ('440ab06e-f13a-4bef-9d0c-ece1127f368a', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '2017-09-21', 'on', '20', '', '黄文云', '13507439066', '', '13', '13', '2017-12-08', '1', '175.0.50.127');
INSERT INTO `realordermanager` VALUES ('3aed39b1-5993-42b5-84b2-ceedbd1ec6b4', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '2017-09-21', 'of', '20', '', '黄文云', '13507439066', '', '0', '0', '2017-09-21', '1', '175.0.50.127');
INSERT INTO `realordermanager` VALUES ('76ab4f40-a688-4386-ad4b-e1f8754ced2b', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '2017-09-22', 'on', '20', '', '杨友良', '15084785602', '', '30', '30', '2018-04-09', '1', '175.9.75.245');
INSERT INTO `realordermanager` VALUES ('e60fee8f-72e0-4206-98e1-a8aa7ab82c53', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '2017-09-22', 'of', '20', '', '杨友良', '15084785602', '', '0', '0', '2017-09-22', '1', '175.9.75.245');
INSERT INTO `realordermanager` VALUES ('e4fde03f-6f73-4e4f-9077-459eda02f538', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '2017-09-22', 'on', '20', '', '徐海洋', '13017383328', '', '13', '13', '2018-04-09', '1', '175.9.137.34');
INSERT INTO `realordermanager` VALUES ('1d1561a9-b85a-4277-8b0c-8c162bb4f91e', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '2017-09-22', 'of', '20', '', '徐海洋', '13017383328', '', '0', '0', '2017-09-22', '1', '175.9.137.34');
INSERT INTO `realordermanager` VALUES ('fd5a45bc-3369-456f-8ac6-3bf6498ac767', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '2017-09-22', 'on', '02', '', '江丽霞', '15873191766', '', '73', '73', '2018-02-04', '1', '175.10.138.176');
INSERT INTO `realordermanager` VALUES ('c7bd043a-a972-4b92-9bc1-0bff3fbcee84', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '2017-09-22', 'of', '02', '', '江丽霞', '15873191766', '', '0', '0', '2017-09-22', '1', '175.10.138.176');
INSERT INTO `realordermanager` VALUES ('f2ee12f4-56b3-433f-93e6-b3a954704d44', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '2017-09-24', 'on', '02', '', '付玉芳', '18670015918', '', '45', '45', '2018-02-04', '1', '183.214.201.99');
INSERT INTO `realordermanager` VALUES ('f0892bd4-99fa-441b-9af1-3e02da0509b0', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '2017-09-24', 'of', '02', '', '付玉芳', '18670015918', '', '0', '0', '2017-09-24', '1', '183.214.201.99');
INSERT INTO `realordermanager` VALUES ('935b4663-2d19-489c-8c00-07432d217519', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '2017-09-24', 'on', '02', '', '刘方', '18073193881', '', '13', '13', '2017-12-10', '1', '59.39.66.226');
INSERT INTO `realordermanager` VALUES ('401eb767-a9fe-4be4-bdf7-fa1293014286', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '2017-09-24', 'of', '02', '', '刘方', '18073193881', '', '0', '0', '2017-09-24', '1', '59.39.66.226');
INSERT INTO `realordermanager` VALUES ('06d0a77f-77b2-462c-8316-6dc251ab085f', 'oiDYQ017uj72LXQrGABRBHI3z85k', '2017-09-24', 'on', '20', '', '张玲', '13667314903', '', '51', '57', '2018-01-28', '1', '59.63.28.111');
INSERT INTO `realordermanager` VALUES ('85df8bae-333a-4b99-afa9-9bbac0ecb9a9', 'oiDYQ017uj72LXQrGABRBHI3z85k', '2017-09-24', 'of', '20', '', '张玲', '13667314903', '', '0', '0', '2017-09-24', '1', '59.63.28.111');
INSERT INTO `realordermanager` VALUES ('b2a3f710-1d06-4958-87da-c9d8ac085cf1', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '2017-09-24', 'on', '20', '', '邹一', '13755017223', '', '30', '16.5', '2017-12-10', '1', '113.246.196.98');
INSERT INTO `realordermanager` VALUES ('ecfe50a0-e50e-4af2-9e7e-d1f14ba9d724', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '2017-09-24', 'of', '20', '', '邹一', '13755017223', '', '0', '0', '2017-09-24', '1', '113.246.196.98');
INSERT INTO `realordermanager` VALUES ('f7ffd562-ae78-4ecc-af97-21fffd5d7049', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '2017-09-24', 'on', '20', '', '周圣沅家长', '18607358121', '', '39', '44', '2018-01-14', '1', '106.18.232.191');
INSERT INTO `realordermanager` VALUES ('702348d4-702e-4180-8611-ef197ec4452b', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '2017-09-24', 'of', '20', '', '周圣沅家长', '18607358121', '', '0', '0', '2017-09-24', '1', '106.18.232.191');
INSERT INTO `realordermanager` VALUES ('26ffe868-0f48-4e18-b883-672db79848e7', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '2017-09-25', 'on', '03', '', '邓敏', '13875911271', '', '36', '36', '2018-01-14', '1', '106.17.188.148');
INSERT INTO `realordermanager` VALUES ('3a98f766-84f7-47b9-a3c7-6bbf099fe7fb', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '2017-09-25', 'of', '03', '', '邓敏', '13875911271', '', '0', '0', '2017-09-25', '1', '106.17.188.148');
INSERT INTO `realordermanager` VALUES ('c6e9d56f-3f99-456e-b8e9-97340a342e0d', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '2017-09-25', 'on', '20', '', '李政', '15388981830', '', '33', '33', '2018-02-04', '1', '106.17.1.20');
INSERT INTO `realordermanager` VALUES ('a5daeb57-4988-4854-85e9-269cf63b66b4', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '2017-09-25', 'of', '20', '', '李政', '15388981830', '', '0', '0', '2017-09-25', '1', '106.17.1.20');
INSERT INTO `realordermanager` VALUES ('1a8ee176-948c-4ee8-afaa-cc148cbc4303', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2017-09-25', 'on', '02', '', '杨润芳', '18229975254', '', '90', '90', '2018-04-09', '1', '223.104.21.6');
INSERT INTO `realordermanager` VALUES ('59648cd8-9431-496a-af08-8fa4a7493a47', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2017-09-25', 'of', '02', '', '杨润芳', '18229975254', '', '0', '0', '2017-09-25', '1', '223.104.21.6');
INSERT INTO `realordermanager` VALUES ('06cee901-6a39-40e8-9820-8877c540d420', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '2017-09-25', 'on', '20', '', '万嘉诚妈妈', '13487387999', '', '13', '14', '2017-12-10', '1', '117.136.24.191');
INSERT INTO `realordermanager` VALUES ('ac426fd2-875d-4c6a-b46f-a47af74e5d41', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '2017-09-25', 'of', '20', '', '万嘉诚妈妈', '13487387999', '', '0', '0', '2017-09-25', '1', '117.136.24.191');
INSERT INTO `realordermanager` VALUES ('4d7c6241-a888-4b78-a41c-4222b5dc544f', 'oiDYQ0xrHBjcgA1QpsuHHznQYH3w', '2017-10-01', 'on', '04', '', '赵娴', '13397311892', '', '13', '13', '2017-12-10', '1', '113.246.184.64');
INSERT INTO `realordermanager` VALUES ('0027306a-f85f-4fd6-a35a-922b2675d6d4', 'oiDYQ0xrHBjcgA1QpsuHHznQYH3w', '2017-10-01', 'of', '04', '', '赵娴', '13397311892', '', '0', '0', '2017-10-01', '1', '113.246.184.64');
INSERT INTO `realordermanager` VALUES ('1faa8d38-d534-4e26-8e56-c994b1178b09', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '2017-10-02', 'on', '20', '', '周洪', '13874982491', '', '60', '60', '2018-04-09', '1', '175.13.254.208');
INSERT INTO `realordermanager` VALUES ('507f3839-11b9-4e52-9cc8-d800ab71b1bb', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '2017-10-02', 'of', '20', '', '周洪', '13874982491', '', '0', '0', '2017-10-02', '1', '175.13.254.208');
INSERT INTO `realordermanager` VALUES ('e2d0972d-c4b8-42c8-a702-5c6b337bbadf', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '2017-10-07', 'on', '20', '', '谭永林', '18273151646', '', '26', '29', '2018-02-28', '1', '111.22.2.19');
INSERT INTO `realordermanager` VALUES ('2b364035-deab-4151-abd1-c393291bb9ef', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '2017-10-07', 'of', '20', '', '谭永林', '18273151646', '', '0', '0', '2017-10-07', '1', '111.22.2.19');
INSERT INTO `realordermanager` VALUES ('21623814-27d4-4797-a4e1-b6a0b2cffabe', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '2017-10-12', 'on', '02', '', '章烨', '18573117977', '', '24', '24', '2018-03-05', '1', '220.202.152.82');
INSERT INTO `realordermanager` VALUES ('155275ea-a8a7-4c14-9961-1ebcafd772f1', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '2017-10-12', 'of', '02', '', '章烨', '18573117977', '', '0', '0', '2017-10-12', '1', '220.202.152.82');
INSERT INTO `realordermanager` VALUES ('f8108e91-e165-4799-9f6c-cc4a4d10c240', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '2017-10-12', 'on', '02', '', '黄初民', '13874538730', '', '26', '26', '2018-01-28', '1', '223.104.130.79');
INSERT INTO `realordermanager` VALUES ('7294fac1-0b03-4514-994e-f34720f6de52', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '2017-10-12', 'of', '02', '', '黄初民', '13874538730', '', '0', '0', '2017-10-12', '1', '223.104.130.79');
INSERT INTO `realordermanager` VALUES ('d56a3bcf-0247-4829-8bb2-bd126f297552', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '2017-10-12', 'on', '02', '', '邹建斌', '13574851122', '', '13', '13', '2018-04-09', '1', '175.8.67.239');
INSERT INTO `realordermanager` VALUES ('071645fa-4876-424b-97e1-8fb9de8b29b2', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '2017-10-12', 'of', '02', '', '邹建斌', '13574851122', '', '0', '0', '2017-10-12', '1', '175.8.67.239');
INSERT INTO `realordermanager` VALUES ('312984ab-3054-4143-94d3-61a11902d9f0', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '2017-10-13', 'on', '20', '', '文喜玲', '18974192898', '', '36', '36', '2018-01-14', '1', '175.10.210.202');
INSERT INTO `realordermanager` VALUES ('66fb30aa-281f-411e-ad0d-b583eea73ba1', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '2017-10-13', 'of', '20', '', '文喜玲', '18974192898', '', '0', '0', '2017-10-13', '1', '175.10.210.202');
INSERT INTO `realordermanager` VALUES ('b3f8d9cc-0374-45b9-bab8-11b6ce7e0534', 'oiDYQ09UC8xTa0Dou-MYUhXrwSxY', '2017-10-14', 'on', '03', '', '金玉元', '18774912606', '', '0', '0', '2017-10-14', '1', '115.152.250.76');
INSERT INTO `realordermanager` VALUES ('9c72f792-028f-4f3b-8bf9-e9922dc1fa7e', 'oiDYQ09UC8xTa0Dou-MYUhXrwSxY', '2017-10-14', 'of', '03', '', '金玉元', '18774912606', '', '0', '0', '2017-10-14', '1', '115.152.250.76');
INSERT INTO `realordermanager` VALUES ('145ab624-b86f-43b7-996a-9be9baf2bd7d', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '2017-10-15', 'on', '03', '', '胡志兰', '15907387929', '', '26', '26', '2018-01-28', '1', '183.214.194.35');
INSERT INTO `realordermanager` VALUES ('4b90e421-ef86-466c-8e3b-e849338b86bd', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '2017-10-15', 'of', '03', '', '胡志兰', '15907387929', '', '0', '0', '2017-10-15', '1', '183.214.194.35');
INSERT INTO `realordermanager` VALUES ('0731e9f1-0875-4291-9e39-b691015265fb', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '2017-10-15', 'on', '02', '', '彭玲玲', '18975148025', '', '15', '15', '2018-01-14', '1', '175.8.217.163');
INSERT INTO `realordermanager` VALUES ('225e2a84-bed6-40ce-aadd-722563b15976', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '2017-10-15', 'of', '02', '', '彭玲玲', '18975148025', '', '0', '0', '2017-10-15', '1', '175.8.217.163');
INSERT INTO `realordermanager` VALUES ('412d6c25-fa30-418e-bb27-54e312bc8f94', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '2017-10-15', 'on', '02', '', '梁静华', '13975200436', '', '41', '41', '2018-04-09', '1', '110.53.253.4');
INSERT INTO `realordermanager` VALUES ('f20a73d2-ef12-4892-a37b-bf7d0daec395', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '2017-10-15', 'of', '02', '', '梁静华', '13975200436', '', '0', '0', '2017-10-15', '1', '110.53.253.4');
INSERT INTO `realordermanager` VALUES ('4971cb4e-b036-4354-8d45-24dd51b94d05', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '2017-10-15', 'on', '20', '', '彭娟', '15116357407', '', '13', '13', '2018-04-09', '1', '183.214.193.152');
INSERT INTO `realordermanager` VALUES ('d42ed156-cf22-42b7-8b86-247a98f19b63', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '2017-10-15', 'of', '20', '', '彭娟', '15116357407', '', '0', '0', '2017-10-15', '1', '183.214.193.152');
INSERT INTO `realordermanager` VALUES ('77737026-3263-4b01-9fe6-551cef365f0b', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '2017-10-16', 'on', '04', '', '吴丽华', '13974849906', '', '80', '80', '2018-01-28', '1', '183.214.190.26');
INSERT INTO `realordermanager` VALUES ('e87da064-c3a0-41a3-b2f4-772c10e0775d', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '2017-10-16', 'of', '04', '', '吴丽华', '13974849906', '', '0', '0', '2017-10-16', '1', '183.214.190.26');
INSERT INTO `realordermanager` VALUES ('084d2d84-1199-490c-8a75-d2fedc73d4d2', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '2017-10-19', 'on', '02', '', '侯英', '13467645536', '', '15', '15', '2018-04-09', '1', '218.76.54.187');
INSERT INTO `realordermanager` VALUES ('8a8aba19-fdd5-484e-96b0-32f47a648bfa', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '2017-10-19', 'of', '02', '', '侯英', '13467645536', '', '0', '0', '2017-10-19', '1', '218.76.54.187');
INSERT INTO `realordermanager` VALUES ('76b3029d-56db-4998-80a3-fddf43edfe3e', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '2017-10-20', 'on', '02', '', '罗登', '17608437860', '', '30', '30', '2018-01-28', '1', '43.250.200.24');
INSERT INTO `realordermanager` VALUES ('d1bc660a-db2c-44c9-8ed8-cb3d8d7d38cf', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '2017-10-20', 'of', '02', '', '罗登', '17608437860', '', '0', '0', '2017-10-20', '1', '43.250.200.24');
INSERT INTO `realordermanager` VALUES ('e9f95846-233e-4929-b3cd-ce213477bb93', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '2017-10-21', 'on', '03', '', '刘晓荷', '15074847431', '', '14', '14', '2018-02-04', '1', '218.76.28.104');
INSERT INTO `realordermanager` VALUES ('d985cadb-f515-49aa-b457-bee213d7ad60', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '2017-10-21', 'of', '03', '', '刘晓荷', '15074847431', '', '0', '0', '2017-10-21', '1', '218.76.28.104');
INSERT INTO `realordermanager` VALUES ('802f6d42-dbe3-4d60-a498-d4b0fea3b20d', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '2017-10-21', 'on', '20', '', '安青', '13907467987', '', '13', '13', '2018-04-09', '1', '220.168.104.134');
INSERT INTO `realordermanager` VALUES ('45fc6007-0d93-486b-9e49-cd64e06d179e', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '2017-10-21', 'of', '20', '', '安青', '13907467987', '', '0', '0', '2017-10-21', '1', '220.168.104.134');
INSERT INTO `realordermanager` VALUES ('ee230309-cf49-4e54-b32b-f1f44de1b8f7', 'oiDYQ07MSdojJeifDrBeddlagQIE', '2017-10-25', 'on', '20', '', '任姐', '13100257679', '', '13', '13', '2018-04-09', '1', '175.10.130.84');
INSERT INTO `realordermanager` VALUES ('a9eae7a0-0163-46e2-b0e3-a1909edbbea7', 'oiDYQ07MSdojJeifDrBeddlagQIE', '2017-10-25', 'of', '20', '', '任姐', '13100257679', '', '0', '0', '2017-10-25', '1', '175.10.130.84');
INSERT INTO `realordermanager` VALUES ('51cc3480-816e-43f7-bcf7-f2ff8ea9d0bb', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '2017-10-26', 'on', '03', '', '彭卿钰妈妈', '13278898952', '', '58', '58', '2018-04-09', '1', '113.246.111.110');
INSERT INTO `realordermanager` VALUES ('202f94ba-621a-42e6-b907-c9456bcf78f6', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '2017-10-26', 'of', '03', '', '彭卿钰妈妈', '13278898952', '', '0', '0', '2017-10-26', '1', '113.246.111.110');
INSERT INTO `realordermanager` VALUES ('62f5211c-5abb-44d6-88f6-6532da84f9a8', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '2017-10-28', 'on', '03', '', '李珂', '13975895787', '', '13', '13', '2018-01-14', '1', '59.63.28.56');
INSERT INTO `realordermanager` VALUES ('05e4a119-46d9-4d1b-9cdc-d9f010cf9d50', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '2017-10-28', 'of', '03', '', '李珂', '13975895787', '', '0', '0', '2017-10-28', '1', '59.63.28.56');
INSERT INTO `realordermanager` VALUES ('57f7bd5c-fba8-407c-a84b-82c7f6b87dfa', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '2017-10-29', 'on', '02', '', '钟俊', '18874299916', '', '80', '80', '2018-04-09', '1', '117.136.89.80');
INSERT INTO `realordermanager` VALUES ('c257d383-aa6f-4943-aaa5-a70a5e084fd5', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '2017-10-29', 'of', '02', '', '钟俊', '18874299916', '', '0', '0', '2017-10-29', '1', '117.136.89.80');
INSERT INTO `realordermanager` VALUES ('872a6f96-dbe0-4c81-9eee-ce677aebc81d', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '2017-10-29', 'on', '20', '', '刘利香', '18670029595', '', '65', '65', '2018-02-04', '1', '119.39.248.75');
INSERT INTO `realordermanager` VALUES ('f2eb2a54-5662-4f82-92e7-99352eb34700', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '2017-10-29', 'of', '20', '', '刘利香', '18670029595', '', '0', '0', '2017-10-29', '1', '119.39.248.75');
INSERT INTO `realordermanager` VALUES ('08f98961-6712-4f44-8329-5dcef40641da', 'oiDYQ07Jn3_glS3LBerFcurtrvCc', '2017-10-30', 'on', '01', '', '胡女士', '13517477896', '', '13', '13', '2017-11-13', '1', '175.13.246.181');
INSERT INTO `realordermanager` VALUES ('754e8316-0e39-4f8f-a59d-15fdaa790749', 'oiDYQ07Jn3_glS3LBerFcurtrvCc', '2017-10-30', 'of', '01', '', '胡女士', '13517477896', '', '0', '0', '2017-10-30', '1', '175.13.246.181');
INSERT INTO `realordermanager` VALUES ('a0af03ca-d7eb-4733-b81d-85ed61f8814f', 'oiDYQ0ykEDo9PSoFIoESP3ym9EsY', '2017-11-01', 'on', '04', '', '宁用逵', '18774009768', '', '13', '2', '2017-11-07', '1', '112.17.235.227');
INSERT INTO `realordermanager` VALUES ('93ae5f73-bf8d-45b5-996e-36049beeb977', 'oiDYQ0ykEDo9PSoFIoESP3ym9EsY', '2017-11-01', 'of', '04', '', '宁用逵', '18774009768', '', '0', '0', '2017-11-01', '1', '112.17.235.227');
INSERT INTO `realordermanager` VALUES ('d072383e-b68c-46a0-80ff-cf36a5083103', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '2017-11-01', 'on', '02', '', '贺煜', '13707319633', '', '13', '13', '2017-12-10', '1', '175.10.5.186');
INSERT INTO `realordermanager` VALUES ('d0c6d107-1d40-4f8a-8dd2-b4c61187dd33', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '2017-11-01', 'of', '02', '', '贺煜', '13707319633', '', '0', '0', '2017-11-01', '1', '175.10.5.186');
INSERT INTO `realordermanager` VALUES ('8c22d719-dcda-406f-b267-647217400284', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '2017-11-02', 'on', '03', '', '梁洪俊', '13378012713', '', '26', '26', '2018-04-09', '1', '106.19.50.29');
INSERT INTO `realordermanager` VALUES ('d2b9d1a2-5fcc-4bfc-b7f5-b4e5e728e749', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '2017-11-02', 'of', '03', '', '梁洪俊', '13378012713', '', '0', '0', '2017-11-02', '1', '106.19.50.29');
INSERT INTO `realordermanager` VALUES ('4017f830-387e-4294-b406-bb20a21230f9', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '2017-11-02', 'on', '02', '', '张波', '15874212817', '', '67', '70.5', '2018-01-28', '1', '111.23.150.27');
INSERT INTO `realordermanager` VALUES ('a47f63f3-d95a-4170-9f3e-64646c0a4574', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '2017-11-02', 'of', '02', '', '张波', '15874212817', '', '0', '0', '2017-11-02', '1', '111.23.150.27');
INSERT INTO `realordermanager` VALUES ('3bbeff8a-476e-470c-99a3-f7e75ce26501', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '2017-11-04', 'on', '03', '', '吕艺军', '13973716008', '', '13.5', '13.5', '2018-03-05', '1', '117.136.24.191');
INSERT INTO `realordermanager` VALUES ('fd1c42d5-d6a0-4afc-b169-8440042a4997', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '2017-11-04', 'of', '03', '', '吕艺军', '13973716008', '', '0', '0', '2017-11-04', '1', '117.136.24.191');
INSERT INTO `realordermanager` VALUES ('fee40805-e18a-42df-b778-310baa4dc442', 'oiDYQ0-QDBqy_nPtX-Hjp8OCesy8', '2017-11-04', 'on', '02', '', '1', '13296329632', '', '0', '0', '2017-11-04', '1', '111.8.66.200');
INSERT INTO `realordermanager` VALUES ('4f821a64-f55b-4443-97d5-dbc9560b4025', 'oiDYQ0-QDBqy_nPtX-Hjp8OCesy8', '2017-11-04', 'of', '02', '', '1', '13296329632', '', '0', '0', '2017-11-04', '1', '111.8.66.200');
INSERT INTO `realordermanager` VALUES ('68edb2bc-cdf1-4621-9482-c94efe9e3815', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '2017-11-04', 'on', '02', '', '柳成英', '13908472055', '', '60', '21', '2018-01-28', '1', '175.0.101.103');
INSERT INTO `realordermanager` VALUES ('ae7ff47e-b8ee-4d79-891e-bfa9c9c474fa', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '2017-11-04', 'of', '02', '', '柳成英', '13908472055', '', '0', '0', '2017-11-04', '1', '175.0.101.103');
INSERT INTO `realordermanager` VALUES ('ca6fe3b2-0d31-41cc-8039-f7e45d3fbfb4', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '2017-11-05', 'on', '04', '', '袁改华', '18975898882', '', '82.5', '82.5', '2018-02-04', '1', '36.33.5.104');
INSERT INTO `realordermanager` VALUES ('51100c35-f4f1-4764-ba78-70bbd1e267c2', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '2017-11-05', 'of', '04', '', '袁改华', '18975898882', '', '0', '0', '2017-11-05', '1', '36.33.5.104');
INSERT INTO `realordermanager` VALUES ('b3721fcc-7dc9-4b28-a4ee-89b861d6b413', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '2017-11-06', 'on', '03', '', '刘婧', '13974635575', '', '15', '15', '2018-02-04', '1', '117.136.89.200');
INSERT INTO `realordermanager` VALUES ('cd51a959-458c-43c1-904f-80eaa7faff93', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '2017-11-06', 'of', '03', '', '刘婧', '13974635575', '', '0', '0', '2017-11-06', '1', '117.136.89.200');
INSERT INTO `realordermanager` VALUES ('c21538a1-e3b8-4023-baf1-f79084cbd813', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '2017-11-07', 'on', '02', '', '程涛', '18075503366', '', '13', '13', '2018-04-09', '1', '106.16.83.36');
INSERT INTO `realordermanager` VALUES ('72a7c398-ef4d-49d1-82b8-e60584c2e026', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '2017-11-07', 'of', '02', '', '程涛', '18075503366', '', '0', '0', '2017-11-07', '1', '106.16.83.36');
INSERT INTO `realordermanager` VALUES ('a790fad9-f84b-4da2-9bb7-f8f45ac93b22', 'oiDYQ0-vlOikutIv3r5oJhRuENjU', '2017-11-08', 'on', '02', '', '邓桂兰', '15111322847', '', '13', '13', '2018-01-14', '1', '175.13.249.38');
INSERT INTO `realordermanager` VALUES ('505a43cf-f5d9-4ff7-8002-106101df93e9', 'oiDYQ0-vlOikutIv3r5oJhRuENjU', '2017-11-08', 'of', '02', '', '邓桂兰', '15111322847', '', '0', '0', '2017-11-08', '1', '175.13.249.38');
INSERT INTO `realordermanager` VALUES ('c02ff56a-18c5-40dd-ab60-731c60bd040d', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '2017-11-11', 'on', '04', '', '刘华', '13574800962', '', '13', '13', '2018-04-09', '1', '113.246.85.98');
INSERT INTO `realordermanager` VALUES ('7533229b-4761-4d07-aca3-386c689b39d4', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '2017-11-11', 'of', '04', '', '刘华', '13574800962', '', '0', '0', '2017-11-11', '1', '113.246.85.98');
INSERT INTO `realordermanager` VALUES ('335c7d8b-47e9-441b-a5f0-4efc40785155', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '2017-11-12', 'on', '20', '', '陈建民', '17788965126', '', '26', '25', '2018-01-14', '1', '222.244.94.247');
INSERT INTO `realordermanager` VALUES ('b8516f27-7264-49f6-851a-ddf1e585aee5', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '2017-11-12', 'of', '20', '', '陈建民', '17788965126', '', '0', '0', '2017-11-12', '1', '222.244.94.247');
INSERT INTO `realordermanager` VALUES ('2df19a78-ec86-427b-9e0c-06a4f095404d', 'oiDYQ08Wi0DkUKDEhN87BqrtPOn8', '2017-11-12', 'on', '20', '', '看看', '123', '', '0', '0', '2017-11-12', '1', '58.20.75.24');
INSERT INTO `realordermanager` VALUES ('0b1e2d8e-533f-43d7-b009-ea34f2ba0c16', 'oiDYQ08Wi0DkUKDEhN87BqrtPOn8', '2017-11-12', 'of', '20', '', '看看', '123', '', '0', '0', '2017-11-12', '1', '58.20.75.24');
INSERT INTO `realordermanager` VALUES ('8a3e9971-8c8a-40e0-a545-e94f1116813e', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '2017-11-21', 'on', '03', '', '莫蓉莹', '13975850655', '', '18', '18', '2018-02-04', '1', '117.136.24.187');
INSERT INTO `realordermanager` VALUES ('09b264c0-f657-45b9-9cef-7818ef289c71', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '2017-11-21', 'of', '03', '', '莫蓉莹', '13975850655', '', '0', '0', '2017-11-21', '1', '117.136.24.187');
INSERT INTO `realordermanager` VALUES ('70c25c61-311c-43bf-9a1e-e3ebc4e70802', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '2017-11-23', 'on', '02', '', '张景岚妈妈', '15274478333', '', '13', '13', '2018-04-09', '1', '183.215.48.13');
INSERT INTO `realordermanager` VALUES ('ef60707a-7841-43e0-b9e5-6c318a28c29a', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '2017-11-23', 'of', '02', '', '张景岚妈妈', '15274478333', '', '0', '0', '2017-11-23', '1', '183.215.48.13');
INSERT INTO `realordermanager` VALUES ('225bd073-6698-437a-ac4f-21a2922d086a', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '2017-11-26', 'on', '20', '', '欧阳少云', '18711182911', '', '13', '8', '2018-04-09', '1', '222.244.182.42');
INSERT INTO `realordermanager` VALUES ('d6fd8153-1141-41d1-9f07-fe717d2925b8', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '2017-11-26', 'of', '20', '', '欧阳少云', '18711182911', '', '0', '0', '2017-11-26', '1', '222.244.182.42');
INSERT INTO `realordermanager` VALUES ('b0809e18-9ab0-4f8a-995d-97396cbd2bfb', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '2017-12-03', 'on', '20', '', '龚震', '15989551539', '', '14', '14', '2018-04-09', '1', '27.38.53.156');
INSERT INTO `realordermanager` VALUES ('9f3ad885-5881-47b1-b610-e7fb95c6e7e9', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '2017-12-03', 'of', '20', '', '龚震', '15989551539', '', '0', '0', '2017-12-03', '1', '27.38.53.156');
INSERT INTO `realordermanager` VALUES ('798e0118-a3d0-4b31-aac4-6476fb73681c', 'oiDYQ0-d_42Lm88Og8_F8fzK2p6s', '2017-12-04', 'on', '02', '', '骆真', '13875848088', '', '13', '13', '2018-01-30', '1', '117.136.24.174');
INSERT INTO `realordermanager` VALUES ('03d3415f-8320-4ba7-a504-4589bab305c1', 'oiDYQ0-d_42Lm88Og8_F8fzK2p6s', '2017-12-04', 'of', '02', '', '骆真', '13875848088', '', '0', '0', '2017-12-04', '1', '117.136.24.174');
INSERT INTO `realordermanager` VALUES ('d12ecf32-a79d-4a27-aee9-68511e1bdcee', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '2017-12-17', 'on', '20', '', '李钰婷', '15388981830', '', '30', '20', '2018-02-14', '1', '222.240.101.253');
INSERT INTO `realordermanager` VALUES ('9e687e8c-9147-4d82-81ff-4b3a815a3b71', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '2017-12-17', 'of', '20', '', '李钰婷', '15388981830', '', '0', '0', '2017-12-17', '1', '222.240.101.253');
INSERT INTO `realordermanager` VALUES ('00da1daa-5d0e-41fa-9159-c3aada53449d', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2017-12-26', 'on', '20', '', '李娜', '13874996056', '', '30', '6', '2018-01-28', '1', '111.74.215.115');
INSERT INTO `realordermanager` VALUES ('9487338a-d405-40ed-b5fb-d4b5d8a8d57a', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2017-12-26', 'of', '20', '', '李娜', '13874996056', '', '0', '0', '2017-12-26', '1', '111.74.215.115');
INSERT INTO `realordermanager` VALUES ('31e559d8-a492-4ab5-aea8-6f8dd509b0a2', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '2017-12-27', 'on', '02', '', '段智慧', '13875989929', '', '30', '15', '2018-03-08', '1', '183.214.197.67');
INSERT INTO `realordermanager` VALUES ('3ba3a0ab-5a6b-4a41-bfe9-796565e3ef53', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '2017-12-27', 'of', '02', '', '段智慧', '13875989929', '', '0', '0', '2017-12-27', '1', '183.214.197.67');
INSERT INTO `realordermanager` VALUES ('4226824b-8be6-4099-a64c-a1385d33c394', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '2017-12-28', 'on', '03', '', '刘红云', '18975891038', '', '43', '43', '2018-03-19', '1', '175.9.232.107');
INSERT INTO `realordermanager` VALUES ('e5d76651-ec8c-47c7-bfc7-e0394d9950c2', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '2017-12-28', 'of', '03', '', '刘红云', '18975891038', '', '0', '0', '2017-12-28', '1', '175.9.232.107');
INSERT INTO `realordermanager` VALUES ('2ba81785-2c78-4b4f-bfe5-81213e38ca80', 'oiDYQ09bQiuiMWekt3Ral2J-3cq4', '2018-01-14', 'on', '20', '', '真实性', '15656608888', '', '0', '0', '2018-01-14', '1', '58.243.254.186');
INSERT INTO `realordermanager` VALUES ('6ab054f7-788a-4c0c-888e-9948f18ab66b', 'oiDYQ09bQiuiMWekt3Ral2J-3cq4', '2018-01-14', 'of', '20', '', '真实性', '15656608888', '', '0', '0', '2018-01-14', '1', '58.243.254.186');
INSERT INTO `realordermanager` VALUES ('253a87d7-a390-4d0c-a42e-74b5f688453b', 'oiDYQ09f3umVMPE7giAWka1GOdWc', '2018-01-27', 'on', '02', '', '15', '13244556666', '', '0', '0', '2018-01-27', '1', '110.53.205.102');
INSERT INTO `realordermanager` VALUES ('21489ecf-d11b-4025-9113-af1366f1206f', 'oiDYQ09f3umVMPE7giAWka1GOdWc', '2018-01-27', 'of', '02', '', '15', '13244556666', '', '0', '0', '2018-01-27', '1', '110.53.205.102');
INSERT INTO `realordermanager` VALUES ('6badcc35-6198-4bc4-bf9e-48152c6ad9e9', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '2018-02-23', 'on', '02', '', '2', '2', '', '0', '0', '2018-02-23', '1', '113.240.250.185');
INSERT INTO `realordermanager` VALUES ('df53374b-433f-49b7-b00e-13457765b147', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '2018-02-23', 'of', '02', '', '2', '2', '', '0', '0', '2018-02-23', '1', '113.240.250.185');
INSERT INTO `realordermanager` VALUES ('7109fcc5-cb4f-460a-8575-071e38ca1efb', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '2018-02-23', 'on', '02', '', '测试', '1234324', '', '0', '0', '2018-02-23', '1', '110.53.205.131');
INSERT INTO `realordermanager` VALUES ('0c456138-9fe8-4c0e-9837-2e588cf186f6', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '2018-02-23', 'of', '02', '', '测试', '1234324', '', '0', '0', '2018-02-23', '1', '110.53.205.131');
INSERT INTO `realordermanager` VALUES ('1324e9d8-4451-49da-84e3-c14bd78a2834', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '2018-02-23', 'on', '02', '', '测试', '15580036947', '', '0', '0', '2018-02-23', '1', '106.19.3.98');
INSERT INTO `realordermanager` VALUES ('adcc0bcc-ee4a-4885-a546-36d27f18bed5', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '2018-02-23', 'of', '02', '', '测试', '15580036947', '', '0', '0', '2018-02-23', '1', '106.19.3.98');
INSERT INTO `realordermanager` VALUES ('3dc44d08-362f-4d98-a634-244659294d5f', 'oVbXbw7MaOziw-8cwjHeYR6WKavw', '2018-02-23', 'on', '02', '', '。。', '1686', '', '0', '0', '2018-02-23', '1', '223.104.130.83');
INSERT INTO `realordermanager` VALUES ('419fdd71-65c6-4dfc-9dc5-b9fea87ce825', 'oVbXbw7MaOziw-8cwjHeYR6WKavw', '2018-02-23', 'of', '02', '', '。。', '1686', '', '0', '0', '2018-02-23', '1', '223.104.130.83');
INSERT INTO `realordermanager` VALUES ('ab870f3b-cdcc-4983-b845-0886d0ae480c', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '2018-02-28', 'on', '02', '', '张党秀', '15367316996', '', '15', '15', '2018-04-09', '1', '113.246.209.43');
INSERT INTO `realordermanager` VALUES ('52d5b25a-df71-4cdf-b6fc-0bd80d775893', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '2018-02-28', 'of', '02', '', '张党秀', '15367316996', '', '0', '0', '2018-02-28', '1', '113.246.209.43');

-- ----------------------------
-- Table structure for starstudent
-- ----------------------------
DROP TABLE IF EXISTS `starstudent`;
CREATE TABLE `starstudent` (
  `uuid` varchar(36) NOT NULL,
  `head` varchar(300) DEFAULT NULL,
  `studentName` varchar(50) DEFAULT NULL,
  `school` varchar(200) DEFAULT NULL,
  `improve` varchar(800) DEFAULT NULL,
  `thanks` varchar(2000) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of starstudent
-- ----------------------------
INSERT INTO `starstudent` VALUES ('936f1412-8f96-4db8-984b-f8ac2da51137', '\\upload\\20177159cd64b00ee354f6d81f92f6114e06f0a.jpg', '张*浩', '师大附中梅溪湖中学', '初二数学', '老师耐心给我分析失误，告诉我独特的解题技巧。这次期末考试，按照老师的方法，竟然进不了10名！真是太感谢老师了！', '1');
INSERT INTO `starstudent` VALUES ('f465a4ab-ad5f-4f67-8b3f-22ec1afae00f', '\\upload\\20177154789d9c6ea154baaba46d458b459dc61.jpg', '李*怡', '市一中岳麓中学', '初三数学', '这种授课方式挺有意思的，特别是我们初三，时间又紧张，中考前，多亏了老师每天耐心的辅导，今年中考成绩拿到了A～好开心', '1');
INSERT INTO `starstudent` VALUES ('1d2f7157-8251-4ed1-8156-7dc925a0aa1f', '\\upload\\20177158ef720c18330439191d7b4b6e0c7b2fe.jpg', '*栋', '麓山国际实验学校', '初一数学', '也是同学推荐说这里是中南的老师一对一辅导，抱着尝试的心态，一下子就喜欢上这里，期末考试数学考了年级第二名，哈哈，感谢易对易！', '1');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `uuid` varchar(36) NOT NULL,
  `gradeId` varchar(36) DEFAULT NULL,
  `subjectName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('04', '02', '数学');
INSERT INTO `subject` VALUES ('43', '20', '英语');
INSERT INTO `subject` VALUES ('42', '04', '英语');
INSERT INTO `subject` VALUES ('08', '03', '数学');
INSERT INTO `subject` VALUES ('09', '03', '物理');
INSERT INTO `subject` VALUES ('41', '03', '英语');
INSERT INTO `subject` VALUES ('12', '04', '数学');
INSERT INTO `subject` VALUES ('13', '04', '物理');
INSERT INTO `subject` VALUES ('14', '04', '化学');
INSERT INTO `subject` VALUES ('40', '02', '英语');
INSERT INTO `subject` VALUES ('30', '20', '数学');
INSERT INTO `subject` VALUES ('31', '20', '物理');
INSERT INTO `subject` VALUES ('32', '20', '化学');
INSERT INTO `subject` VALUES ('50', '01', '数学');
INSERT INTO `subject` VALUES ('51', '01', '英语');
INSERT INTO `subject` VALUES ('52', '01', '全科');

-- ----------------------------
-- Table structure for sysparamter
-- ----------------------------
DROP TABLE IF EXISTS `sysparamter`;
CREATE TABLE `sysparamter` (
  `uuid` varchar(36) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `va` varchar(80) DEFAULT NULL,
  `vb` varchar(80) DEFAULT NULL,
  `vc` varchar(80) DEFAULT NULL,
  `vd` varchar(80) DEFAULT NULL,
  `ve` varchar(80) DEFAULT NULL,
  `vf` varchar(150) DEFAULT NULL,
  `vg` varchar(150) DEFAULT NULL,
  `vh` varchar(5) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysparamter
-- ----------------------------
INSERT INTO `sysparamter` VALUES ('0000', 'teacherstatus', '0', '可预约', null, null, null, null, null, 'CN', '1');
INSERT INTO `sysparamter` VALUES ('00000', 'orderType', 'of', '线下面授', null, null, null, null, null, 'CN', '1');
INSERT INTO `sysparamter` VALUES ('00001', 'orderType', 'on', '在线辅导', null, null, null, null, null, 'CN', '2');
INSERT INTO `sysparamter` VALUES ('00003', 'orderStatus', '0', '未处理', null, null, null, null, null, 'CN', '1');
INSERT INTO `sysparamter` VALUES ('00004', 'orderStatus', '1', '已指派老师', null, null, null, null, null, 'CN', '2');
INSERT INTO `sysparamter` VALUES ('0001', 'teacherstatus', '1', '已预约', null, null, null, null, null, 'CN', '2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `uuid` varchar(36) NOT NULL,
  `head` varchar(300) DEFAULT NULL,
  `teacherName` varchar(50) DEFAULT NULL,
  `school` varchar(200) DEFAULT NULL,
  `telphone` varchar(100) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `grade` varchar(36) DEFAULT NULL,
  `subject` varchar(36) DEFAULT NULL,
  `scope` varchar(800) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `teachType` varchar(2) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('91eec851-e406-44d6-bf79-f92647396376', '\\upload\\201771595f144dc6c14454eb21e9a40e24f1752.jpg', '向嘉博', '湖南大学', '15200531631', '110', '02', '04', '芙蓉区', '学历认证 + 3年家辅经验', '0', 'of', '1');
INSERT INTO `teacher` VALUES ('6c77b872-5a36-4b26-bc77-5c89ec07b3aa', '\\upload\\2017715315135030f964528bf32fba062a04c10.jpg', '张力宏', '中南大学', '15200531631', '110', '02', '05', '天心区', '学历认证 + 2年家辅经验', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('98db0907-d027-4027-81ba-8b344fe4ffca', '\\upload\\201771501f6c495e9c64ecd9e773de9f4489eea.jpg', '刘国臣', '中南大学', '15580830349', '100', '02', '06', '岳麓区', '学历认证 + 2年家辅经验', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('307c5921-8916-4026-b139-f21a6530a6a3', '\\upload\\2017715298b29198d424a4fbf946ffc02a8069a.jpg', '刘国臣', '中南大学', '15580830349', '80', '02', '04', '岳麓区', '学历认证 + 3年家辅经验', '0', 'of', '1');
INSERT INTO `teacher` VALUES ('4cf474fd-2db1-4aaf-94b9-2bcbeb2cc2be', null, '李四', '湖南大学', '15200', '0', '02', '04', '岳麓', '', '0', 'on', '-1');
INSERT INTO `teacher` VALUES ('86b64be7-1b09-422a-9f9a-7bb9751daf8f', '\\upload\\person.png', '测试', '中南大学', '15580839876', null, '', '', '', '', '0', 'on', '-1');
INSERT INTO `teacher` VALUES ('d5bed571-f62b-4590-aa0a-4a9e2d0a982f', '\\upload\\person.png', '鲍永胜', '中南大学', '15111013927', null, '', '', '', '', '0', 'on', '-1');
INSERT INTO `teacher` VALUES ('08b12356-59c0-46a2-8148-f4ca47632662', '\\upload\\person.png', '曾玉雯', '中南大学', '18274880097', null, '', '', '', '', '0', 'on', '-1');
INSERT INTO `teacher` VALUES ('5ac061f8-cb60-4978-86ea-b3cb80f52c47', '\\upload\\person.png', '曾志刚', '中南大学', '13874846375', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('194fb809-dc5d-40f0-82ba-6c85bdbff51c', '\\upload\\person.png', '陈娴', '中南大学', '17308416020', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('1a29e05b-8763-4a80-a2ba-ebddc5fdcf57', '\\upload\\person.png', '崔晨晓', '中南大学', '18273140090', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('40e01532-1f68-44c9-8aa7-fd2e2fb5a1d9', '\\upload\\person.png', '董学莲', '中南大学', '1501160215', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('de006b54-3bd1-4eb0-85bb-62d62611365c', '\\upload\\person.png', '段利珍', '中南大学', '15111346324', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('b8b4f6a1-6fb5-4289-bafd-6c6ea6b51d00', '\\upload\\person.png', '段欣然', '中南大学', '18123018619', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('7607a580-c106-458d-9d5d-e9de188aec31', '\\upload\\person.png', '范雪枫', '中南大学', '18807427071', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('c5b76ff0-cee9-47d0-b3ab-bf1a4f5ece68', '\\upload\\person.png', '冯振炜', '湖南大学', '15616466769', null, '', '', '', '', '0', 'on', '-1');
INSERT INTO `teacher` VALUES ('7317f1bb-0047-4713-9fea-fe4bfe4a0265', '\\upload\\person.png', '高天宇', '中南大学', '13853155413', null, '', '', '', '', '0', 'on', '-1');
INSERT INTO `teacher` VALUES ('273f4a0c-6270-4fc5-8db8-0eddf8eddf2f', '\\upload\\person.png', '韩泰坤', '中南大学', '18273180693', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('2adb78fb-ffb4-45e5-8005-d3aad197eddd', '\\upload\\person.png', '何其亮', '中南大学', '17388905467', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('abb5a8e9-7503-40a7-a4dc-28ea4a23639b', '\\upload\\person.png', '何蕊', '中南大学', '18774052239', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('73b23cde-154d-4e46-82b3-6bcdab06d22b', '\\upload\\person.png', '洪欣悦', '中南大学', '15858365880', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('7dcfccc2-fd5e-4193-84d1-d5530ca8f4cc', '\\upload\\person.png', '黄绍琪', '中南大学', '13047210927', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('05718594-7a2c-4f62-967f-525f5ecb128d', '\\upload\\person.png', '蒋志杰', '中南大学', '15673122565', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('b1f719aa-6736-4fb2-89da-d4bf0f3290fb', '\\upload\\person.png', '焦霞', '中南大学', '18774058197', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('1837ba76-2bc1-4080-8dd7-1f7133d117cc', '\\upload\\person.png', '柯于瑾', '中南大学', '18270927491', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('66f63110-46fc-4c5f-a73f-0aa864a8848c', '\\upload\\person.png', '李慧真', '中南大学', '18774902530', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('ddc77eb0-7d80-454f-ba20-b612e0b2a571', '\\upload\\person.png', '李家耀', '中南大学', '18670308875', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('4e298030-a3a4-4bbf-a4f6-d32d2b5cd9bc', '\\upload\\person.png', '李琪', '中南大学', '15200866964', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('cfacf9f4-7260-471d-9c4e-ab0a78e150c0', '\\upload\\person.png', '梁翠容', '中南大学', '15211056466', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('4376e946-6146-475d-a111-7fb610fa81e0', '\\upload\\person.png', '刘慧淳', '中南大学', '15574998778', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('750a1463-1945-46a4-b731-dc2b32e149e6', '\\upload\\person.png', '刘依婷', '中南大学', '18880402088', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('2a08e921-04ec-4068-9323-8021793259cc', '\\upload\\person.png', '刘钰才', '中南大学', '18373155883', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('55eef91b-5f80-4358-a49e-9f2dc7d0f3dd', '\\upload\\person.png', '吕思雨', '中南大学', '15111273744', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('60c03c18-a5e5-4396-9372-923c1ef6163c', '\\upload\\person.png', '彭菲', '中南大学', '15111048199', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('531504ad-bb42-418e-8ce3-40b846fe16dd', '\\upload\\person.png', '齐宁', '中南大学', '17375876043', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('62cc03a7-8b32-4a24-a45b-20dc6d86fc38', '\\upload\\person.png', '冉玉婷', '中南大学', '18273166313', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('127d0ff4-9c46-4611-8476-7eb97b3fa7a9', '\\upload\\person.png', '阮旭生', '中南大学', '15200879550', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('3a4d8b82-d855-49b0-8a2a-41098c5b0595', '\\upload\\person.png', '沈凤', '中南大学', '15105908701', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('01a3ea24-024e-444d-9851-35c0cef1c735', '\\upload\\person.png', '史思嘉', '中南大学', '17308416482', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('3a4a2292-8362-4bf6-abff-79d4390ac84f', '\\upload\\person.png', '宋佳', '中南大学', '13278889011', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('91e577b4-d11e-4d76-a952-bd81c3d0f4be', '\\upload\\person.png', '宋艳梅', '中南大学', '17375876212', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('ffc672b9-8780-4b38-9057-9a5f035f943b', '\\upload\\person.png', '陀秒芳', '中南大学', '18711190734', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('f92a4659-d601-40ff-9a42-b388efc2b329', '\\upload\\person.png', '王琛越', '中南大学', '15111105286', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('a7bdcb21-26ad-425f-b434-94a126a74632', '\\upload\\person.png', '王飞飞', '中南大学', '18711195232', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('b2113842-0a24-4753-8b35-be95df2edbbb', '\\upload\\person.png', '王凯', '中南大学', '15207491184', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('d021b533-5465-417b-a677-1502f928ea97', '\\upload\\person.png', '王瑜瑜', '中南大学', '13007437650', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('d800da65-1088-4199-82bf-229d478917c4', '\\upload\\person.png', '韦京金', '中南大学', '18173160728', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('9a1bbe4e-95d0-43aa-b4c9-79fada96f8cd', '\\upload\\person.png', '吴金涛', '中南大学', '18774870235', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('5b9e1715-b00d-4126-a605-dc9bc80b0aaa', '\\upload\\person.png', '吴俊', '中南大学', '18774884031', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('0e32be44-b82f-41df-a5a0-8b624674f3f6', '\\upload\\person.png', '谢海斌', '中南大学', '18273180301', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('17474274-c081-48ba-b1f8-432ed665c9ee', '\\upload\\person.png', '邢凯迪', '中南大学', '17799598885', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('f568eb35-f258-46c8-b94a-8b0e0eac441b', '\\upload\\person.png', '徐雪', '中南大学', '17307409871', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('b3982aff-5f26-464a-b615-3dadd1ea778a', '\\upload\\person.png', '杨斯', '中南大学', '15200814522', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('9e20d6dc-89f0-44d2-bbb2-239d31f201d5', '\\upload\\person.png', '英慧琴', '中南大学', '15211036347', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('8326c90b-f586-43be-b1e4-a75f8d62f461', '\\upload\\person.png', '余秋宜', '中南大学', '17308416646', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('ffbc8169-4cdf-49ad-b198-9b94c75b0f10', '\\upload\\person.png', '余欣瑶', '中南大学', '15273813130', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('6c647a7b-a7db-4bd8-b7ea-143f87a0f200', '\\upload\\person.png', '袁源', '中南大学', '17308415998', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('52880c27-bf55-4518-98ba-fe422ee6a0e0', '\\upload\\person.png', '张春雨', '中南大学', '17375876152', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('048ddff9-4196-4ca5-9bdf-bc75ce7e6278', '\\upload\\person.png', '张方旭', '中南大学', '15616110952', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('ca5cdc32-c067-4664-be28-46fa62bb0507', '\\upload\\person.png', '张慧', '中南大学', '18774924720', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('eafbb238-6c6f-473a-b314-48d6ef264434', '\\upload\\person.png', '张漫娅', '中南大学', '15574118353', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('ad565174-c1fe-454c-96f3-7e0bbbdc99a1', '\\upload\\person.png', '张雪菲', '中南大学', '18273171987', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('cae240c0-95aa-4abe-8bd1-c3ab97a71692', '\\upload\\person.png', '赵珍莲', '中南大学', '18711010732', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('ecaf48a2-2d20-4ef9-b1b6-d2822183f950', '\\upload\\person.png', '郑学梅', '中南大学', '15273186380', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('d711a5a2-efa3-4f3d-b422-e4b490925916', '\\upload\\person.png', '周毅欣', '中南大学', '18867361800', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('578b599d-28cb-4d68-9b37-f6724bf36462', '\\upload\\person.png', '左焦杰', '中南大学', '13278881672', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('6bfc3946-6e3d-4f03-854b-ed24ca79753a', '\\upload\\person.png', '章家欢', '中南大学', '17352825981', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('f128b178-f86c-4a73-ba43-3785312726b9', '\\upload\\person.png', '葛洪民', '中南大学', '18774887332', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('44793357-3c23-412e-ad82-5ecabf48edf7', '\\upload\\person.png', '刘瑾', '中南大学', '13698789918', null, '', '', '', '', null, 'on', '1');
INSERT INTO `teacher` VALUES ('e4c48323-d71f-42dd-bfc1-87ade711142f', '\\upload\\person.png', '杨羚', '中南大学', '18373152611', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('a2133ce8-89a6-4477-8cdc-119e362e6289', '\\upload\\person.png', '刘胡威', '中南大学', '13986306078', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('8aceebc0-7b57-4fb3-ab69-59039cd0a3b1', '\\upload\\person.png', '管理超然', '中南大学', '13397500886', null, '', '', '', '', '0', 'on', '1');
INSERT INTO `teacher` VALUES ('42279314-40a3-4ba3-9780-fb2705142bb0', '\\upload\\person.png', '李荣华', '中南大学', '18270882178', null, '', '', '', '', '0', 'on', '1');

-- ----------------------------
-- Table structure for transdetail
-- ----------------------------
DROP TABLE IF EXISTS `transdetail`;
CREATE TABLE `transdetail` (
  `uuid` varchar(36) NOT NULL,
  `orderNum` varchar(36) DEFAULT NULL,
  `openId` varchar(60) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `courseType` varchar(36) DEFAULT NULL,
  `cnt` double(11,1) DEFAULT NULL,
  `payName` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `transactionType` int(11) DEFAULT NULL,
  `transDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transdetail
-- ----------------------------
INSERT INTO `transdetail` VALUES ('bec6f42b-71ce-4445-bfc4-907ce70bd4b7', '00000000000000000083', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '0.01', '1', 'on', '1.0', 'wee', '111', '1', '2017-07-13 17:07:08');
INSERT INTO `transdetail` VALUES ('00d69f3c-0528-46e2-a66d-0f65a8a9d4d6', '', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-07-13 18:05:23');
INSERT INTO `transdetail` VALUES ('9c9b8a8b-ea98-4fa7-86d8-385e04af369e', '00000000000000000084', 'oiDYQ04a13xCEApFE3Dv0fut7e7w', '0.01', '1', 'on', '1.0', '小志哥', '18570601737', '1', '2017-07-14 16:33:47');
INSERT INTO `transdetail` VALUES ('2b587eae-3b3c-4b0a-ae39-986dcb272930', '00000000000000000085', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '0.01', '1', 'on', '1.0', '微微', '11', '1', '2017-07-15 11:32:58');
INSERT INTO `transdetail` VALUES ('4ddc8c52-17a9-416b-abab-180ac2e26b3d', '00000000000000000086', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '0.01', '1', 'on', '1.0', '张杰', '15200531631', '1', '2017-07-15 11:33:09');
INSERT INTO `transdetail` VALUES ('32112738-b442-4952-a7b4-a94371714043', '00000000000000000087', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '1280', '0', 'on', '16.0', '1', '1', '1', '2017-07-15 11:35:51');
INSERT INTO `transdetail` VALUES ('43b36fe8-c06d-472d-bb1f-2f193e816153', '00000000000000000088', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '0.01', '0', 'on', '1.0', '1', '1', '1', '2017-07-15 11:43:34');
INSERT INTO `transdetail` VALUES ('23a4f777-d3f7-48c3-97c9-a20d38c0c654', '00000000000000000089', 'oiDYQ02OP5-Takrf6MMhBy4G7zTc', '5900', '0', 'on', '60.0', '1', '1', '1', '2017-07-15 11:44:32');
INSERT INTO `transdetail` VALUES ('a6b2f616-34d6-4d27-8eaa-68ace9af66e7', '00000000000000000090', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '0.01', '1', 'on', '1.0', '测试', '25580830389', '1', '2017-07-15 11:48:13');
INSERT INTO `transdetail` VALUES ('faca5991-bf7d-487d-b86f-d2ade2cc38e3', '00000000000000000091', 'oiDYQ0zpwMxn8Fhn3sJcYT7ZmkAI', '0.01', '1', 'on', '1.0', '张三', '1563738312', '1', '2017-07-15 11:58:44');
INSERT INTO `transdetail` VALUES ('27e4120d-8c22-49f3-863b-51a8929890fb', '00000000000000000092', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '0.01', '1', 'on', '1.0', '测试', '15589063278', '1', '2017-07-15 14:20:50');
INSERT INTO `transdetail` VALUES ('952c30d2-996f-4418-aa38-4f7605f650ff', '', 'oiDYQ04a13xCEApFE3Dv0fut7e7w', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-07-18 00:13:18');
INSERT INTO `transdetail` VALUES ('b92e25dd-2af2-4163-81dc-450fc4456830', '00000000000000000093', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1280', '0', 'on', '16.0', '测试', '15580830498', '1', '2017-07-21 12:38:14');
INSERT INTO `transdetail` VALUES ('bacd5a38-6df0-49b9-92f3-8e410176e8aa', '00000000000000000094', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1280', '0', 'on', '16.0', '1', '1', '1', '2017-07-22 11:47:27');
INSERT INTO `transdetail` VALUES ('bd873d22-b948-472f-84e3-c98ab80a3db9', '00000000000000000095', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:29');
INSERT INTO `transdetail` VALUES ('e1cdb175-3c18-40a9-acd4-a557295f6a78', '00000000000000000096', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:33');
INSERT INTO `transdetail` VALUES ('cf36db9e-7fce-416d-85ee-4c6abec5008d', '00000000000000000097', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:35');
INSERT INTO `transdetail` VALUES ('0e66f58e-5414-4fec-9737-0885955ac518', '00000000000000000098', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:36');
INSERT INTO `transdetail` VALUES ('76437daf-22ab-480a-8b3a-ba403b230f94', '00000000000000000099', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:36');
INSERT INTO `transdetail` VALUES ('d268b681-eb57-4bbe-81a2-a1cc3cc5466a', '00000000000000000100', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:36');
INSERT INTO `transdetail` VALUES ('0a54e069-28a5-4e39-a31c-189395bc81df', '00000000000000000101', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:36');
INSERT INTO `transdetail` VALUES ('ae20afe1-2e78-4d5e-ae5c-d7209d88a612', '00000000000000000102', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:36');
INSERT INTO `transdetail` VALUES ('edab96f7-7443-4b4c-9b78-494c84c60450', '00000000000000000103', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:37');
INSERT INTO `transdetail` VALUES ('7f22cedb-69e5-4f79-9125-2bbb98e8072f', '00000000000000000104', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:38');
INSERT INTO `transdetail` VALUES ('28209532-ce68-4f66-8b3d-1e87a7455660', '00000000000000000105', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:38');
INSERT INTO `transdetail` VALUES ('587b8303-4ed7-4972-bd8e-d292761e4f9a', '00000000000000000106', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:39');
INSERT INTO `transdetail` VALUES ('96cf021d-f40a-496b-b0e8-37a014434b83', '00000000000000000107', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:39');
INSERT INTO `transdetail` VALUES ('6e1c1994-aff0-46e9-ab26-7b6be35efa10', '00000000000000000108', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:39');
INSERT INTO `transdetail` VALUES ('af80a551-1526-485d-8609-6acd9285ab62', '00000000000000000109', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:39');
INSERT INTO `transdetail` VALUES ('1665d487-5cec-4aa3-b4bc-22d87a07055b', '00000000000000000110', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:39');
INSERT INTO `transdetail` VALUES ('af6d5e28-7e9c-4871-b6d8-8d890eb58f37', '00000000000000000111', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:39');
INSERT INTO `transdetail` VALUES ('52918a25-f459-4851-910b-39dfbda8d472', '00000000000000000112', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:40');
INSERT INTO `transdetail` VALUES ('b5434df7-72fd-4c00-8cc1-2c5b383a20b8', '00000000000000000113', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:42');
INSERT INTO `transdetail` VALUES ('9a39968b-ef48-4b9a-8d8d-bfae6799baf0', '00000000000000000114', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:43');
INSERT INTO `transdetail` VALUES ('cdb40bcd-7457-4f3b-b1a7-3e72605f31c1', '00000000000000000115', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:43');
INSERT INTO `transdetail` VALUES ('992d964c-4c49-4042-9701-954f8b9dc555', '00000000000000000116', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:44');
INSERT INTO `transdetail` VALUES ('96a2590b-1cdc-4aad-8495-9f96ce4e9881', '00000000000000000117', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:44');
INSERT INTO `transdetail` VALUES ('d18dde2d-8175-4fc2-ba25-4eb2481769da', '00000000000000000118', null, '1280', '0', 'on', '16.0', '测试', '1558093029', '1', '2017-08-08 11:24:44');
INSERT INTO `transdetail` VALUES ('e64fe781-470c-449d-a672-808f559feca8', '00000000000000000119', 'oiDYQ00-fyRniJe64qhA7IERSgzs', '1280', '0', 'on', '16.0', '穿多大', '1255', '1', '2017-08-08 11:27:21');
INSERT INTO `transdetail` VALUES ('7178ee71-a387-4f67-8658-ab6d6b5603d3', '00000000000000000120', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1280', '0', 'on', '16.0', '家长', '112225', '1', '2017-08-23 17:40:02');
INSERT INTO `transdetail` VALUES ('b5eb4fe9-3d4c-43eb-86d9-a754732e8de3', '00000000000000000121', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1280', '0', 'on', '16.0', '刘国臣', '1233', '1', '2017-08-24 11:36:45');
INSERT INTO `transdetail` VALUES ('23e00c85-e47d-4274-a2d1-a9ca559c859a', '00000000000000000122', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:04');
INSERT INTO `transdetail` VALUES ('6ac45f5b-c62f-491b-a5e0-076b255e2531', '00000000000000000123', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:06');
INSERT INTO `transdetail` VALUES ('0228e2fa-ec27-4ee1-b84b-27c474e23264', '00000000000000000124', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:07');
INSERT INTO `transdetail` VALUES ('92286701-81f4-45e3-946e-4b0c30429d68', '00000000000000000125', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:07');
INSERT INTO `transdetail` VALUES ('e5514594-67ea-4017-86b7-d71ff034d1f9', '00000000000000000126', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:08');
INSERT INTO `transdetail` VALUES ('7763b41a-9319-4df2-a1f0-3099c5162ed6', '00000000000000000127', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:08');
INSERT INTO `transdetail` VALUES ('7ef0ba23-1150-4a27-946a-75b8688fe60c', '00000000000000000128', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:08');
INSERT INTO `transdetail` VALUES ('658aff75-0d3d-43db-b318-b1d218b33171', '00000000000000000129', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:09');
INSERT INTO `transdetail` VALUES ('58284545-8e75-4340-a9b5-bee1d4842543', '00000000000000000130', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:09');
INSERT INTO `transdetail` VALUES ('99fa1d87-271d-4ddb-ba64-bd260353f6a1', '00000000000000000131', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:09');
INSERT INTO `transdetail` VALUES ('24d21696-e6bd-4ba6-8cc8-f992be0770fc', '00000000000000000132', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:10');
INSERT INTO `transdetail` VALUES ('6c735b71-402d-437a-8f9d-a76d6a69df45', '00000000000000000133', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:10');
INSERT INTO `transdetail` VALUES ('ab2ff6e6-879e-4fcf-8723-0184cdcc58fc', '00000000000000000134', null, '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-08-29 00:09:11');
INSERT INTO `transdetail` VALUES ('f4156de3-253f-4e9d-aaf5-c39f34aa1e3d', '', 'oiDYQ00-fyRniJe64qhA7IERSgzs', '0', '1', 'on', '1.0', '人工充值', '', '1', '2017-08-29 22:37:48');
INSERT INTO `transdetail` VALUES ('47194986-2eb9-4af2-8cc7-06e6c5a4363d', '00000000000000000135', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '1760', '0', 'on', '30.0', '唐敏', '13875843603', '1', '2017-09-08 21:09:33');
INSERT INTO `transdetail` VALUES ('8168b11e-299f-417b-907b-2e7c507207c1', '00000000000000000136', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '908', '0', 'on', '13.0', '向嘉博', '18473459303', '1', '2017-09-08 21:42:32');
INSERT INTO `transdetail` VALUES ('dc750891-c1b5-4937-813d-045b466d44a3', '00000000000000000137', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '780', '0', 'on', '13.0', '向嘉博', '18473459303', '1', '2017-09-08 21:43:11');
INSERT INTO `transdetail` VALUES ('352c1dca-0eed-4631-9810-a258e552061d', '00000000000000000138', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '2068', '1', 'on', '30.0', '喻宏波', '13707498722', '1', '2017-09-09 14:50:36');
INSERT INTO `transdetail` VALUES ('0671e087-fd0c-40d1-811d-3e8d7c51bad7', '00000000000000000139', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '1760', '1', 'on', '30.0', '唐敏', '13875843603', '1', '2017-09-09 18:59:35');
INSERT INTO `transdetail` VALUES ('4073cbcd-0d47-4fa5-b917-e6e84d8ef8a4', '00000000000000000140', 'oiDYQ01QAJGEUehmMvVcmG95GNQQ', '908', '0', 'on', '13.0', '彭艳', '15874027658', '1', '2017-09-10 17:21:53');
INSERT INTO `transdetail` VALUES ('0f3cac01-5daf-4e19-be07-c0885d282682', '00000000000000000141', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '2068', '0', 'on', '30.0', '测试', '134', '1', '2017-09-10 17:21:59');
INSERT INTO `transdetail` VALUES ('cdbd6fad-cf50-4b49-9b9f-2fd920b76b40', '00000000000000000142', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '908', '1', 'on', '13.0', '曹建伟', '13808422910', '1', '2017-09-10 21:30:43');
INSERT INTO `transdetail` VALUES ('4b5a9cf6-a9de-4e45-a256-f096cd8fed35', '', 'oiDYQ0zpwMxn8Fhn3sJcYT7ZmkAI', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-09-11 08:43:23');
INSERT INTO `transdetail` VALUES ('1d94e389-7e05-4089-a9e2-33a5e922d9b6', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-09-11 11:32:18');
INSERT INTO `transdetail` VALUES ('089fd165-7798-426e-9d93-3ceb0e04c531', '00000000000000000143', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '3998', '0', 'on', '60.0', '赵宗荡', '15874030708', '1', '2017-09-11 23:33:39');
INSERT INTO `transdetail` VALUES ('dffae3f7-c4a4-413a-9e6c-51f568b2df48', '00000000000000000144', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '3998', '1', 'on', '60.0', '徐新伟', '18975819567', '1', '2017-09-12 11:15:05');
INSERT INTO `transdetail` VALUES ('4ba32ed1-5983-43ad-b698-3e61082a41fe', '00000000000000000145', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '908', '0', 'on', '13.0', '赵宗荡', '15874030708', '1', '2017-09-12 11:49:13');
INSERT INTO `transdetail` VALUES ('3350ce65-92d4-431a-8c04-6e465ece49d3', '00000000000000000146', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '908', '1', 'on', '13.0', '陈少敏', '13027415020', '1', '2017-09-13 08:49:18');
INSERT INTO `transdetail` VALUES ('88a8f09b-d570-402b-ac58-c55d8c9ac094', '00000000000000000147', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '908', '1', 'on', '13.0', '周建', '15974291689', '1', '2017-09-13 13:22:17');
INSERT INTO `transdetail` VALUES ('c1de6c2f-ec17-472b-8992-9e550b90ab51', '00000000000000000148', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '1138', '1', 'on', '13.0', '朱艳萍', '13319519996', '1', '2017-09-13 17:30:15');
INSERT INTO `transdetail` VALUES ('92cb6470-3247-4b7c-bf90-1e9d046f73a9', '', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '0', '1', 'on', '1.0', '人工充值', '', '1', '2017-09-14 10:58:03');
INSERT INTO `transdetail` VALUES ('6f3c00b5-8a29-4fc7-8c2e-563c4baa9028', '00000000000000000149', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '1138', '1', 'on', '13.0', '宋靓', '13975883828', '1', '2017-09-14 18:58:54');
INSERT INTO `transdetail` VALUES ('67a9fcb0-122e-4367-8657-9a9b87f90124', '00000000000000000150', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '5398', '0', 'on', '80.0', '李颖', '15084916264', '1', '2017-09-15 20:24:22');
INSERT INTO `transdetail` VALUES ('168bcd1a-bede-4725-81ad-1f064e13a9e4', '00000000000000000151', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '1138', '1', 'on', '13.0', '许二愚', '15367873825', '1', '2017-09-16 16:49:30');
INSERT INTO `transdetail` VALUES ('d252931e-311d-46ae-b551-5074fe3e804c', '00000000000000000152', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '5398', '1', 'on', '80.0', '李颖', '15084916264', '1', '2017-09-16 17:06:33');
INSERT INTO `transdetail` VALUES ('a5f7e29c-f475-4816-b5ff-7321e53519dc', '00000000000000000153', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '908', '0', 'on', '13.0', '张利', '15974295408', '1', '2017-09-17 10:01:12');
INSERT INTO `transdetail` VALUES ('5df7b25d-dc14-4797-97a8-5941c1eb7229', '00000000000000000154', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '2068', '1', 'on', '30.0', '樊伟', '18673880006', '1', '2017-09-17 17:37:24');
INSERT INTO `transdetail` VALUES ('81e163c5-3426-45d7-a503-5ddaa46d1364', '00000000000000000155', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '780', '0', 'on', '13.0', '言美莲', '18674807076', '1', '2017-09-17 21:03:36');
INSERT INTO `transdetail` VALUES ('f6a081a3-fc8a-42bf-a83b-a07c85ff0a2d', '00000000000000000156', null, '2600', '0', 'on', '30.0', '李政', '5388981830', '1', '2017-09-17 21:04:24');
INSERT INTO `transdetail` VALUES ('cfd5edee-444e-467c-893e-58ae27451bb2', '00000000000000000157', null, '2600', '0', 'on', '30.0', '李政', '5388981830', '1', '2017-09-17 21:04:28');
INSERT INTO `transdetail` VALUES ('5a06be3e-70c4-4c9e-b894-cef3aefca623', '00000000000000000158', null, '2600', '0', 'on', '30.0', '李政', '5388981830', '1', '2017-09-17 21:04:29');
INSERT INTO `transdetail` VALUES ('1e19c3d0-ae85-4251-b4ab-b7736e5bd565', '00000000000000000159', null, '2600', '0', 'on', '30.0', '李政', '5388981830', '1', '2017-09-17 21:04:30');
INSERT INTO `transdetail` VALUES ('35fce638-8205-4d9a-9669-ec1a222a15ac', '00000000000000000160', null, '2600', '0', 'on', '30.0', '李政', '5388981830', '1', '2017-09-17 21:04:31');
INSERT INTO `transdetail` VALUES ('62838ae9-b66d-4834-b5c6-0306f6422e37', '00000000000000000161', null, '2600', '0', 'on', '30.0', '李政', '5388981830', '1', '2017-09-17 21:04:32');
INSERT INTO `transdetail` VALUES ('f3f38acc-af49-463c-babb-493a0c203281', '00000000000000000162', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:47');
INSERT INTO `transdetail` VALUES ('31db4be7-a595-469d-803d-c54f849c8fb7', '00000000000000000163', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:49');
INSERT INTO `transdetail` VALUES ('d6fa6b9f-77f5-49e5-96a4-94f398b26bd1', '00000000000000000164', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:51');
INSERT INTO `transdetail` VALUES ('b367329b-410c-4186-bdcb-a4f3f4d79868', '00000000000000000165', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:51');
INSERT INTO `transdetail` VALUES ('0791b2a5-3a6e-4fdc-84d6-2872cb19894b', '00000000000000000166', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:51');
INSERT INTO `transdetail` VALUES ('db7e3a3a-e10d-441d-92c6-1ba8f3d79c07', '00000000000000000167', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:52');
INSERT INTO `transdetail` VALUES ('d4a6561a-20d6-4995-997b-03479ec0bf1d', '00000000000000000168', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:53');
INSERT INTO `transdetail` VALUES ('bdb19ad8-5454-46d1-8223-633d4e280a70', '00000000000000000169', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:54');
INSERT INTO `transdetail` VALUES ('4fe0e3fa-3318-4cc3-9ffe-ce7334be6c33', '00000000000000000170', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:55');
INSERT INTO `transdetail` VALUES ('88921470-1a82-4c3a-91ee-4e034b8c3a3c', '00000000000000000171', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:04:56');
INSERT INTO `transdetail` VALUES ('df7648bc-9209-447e-8c7c-dd754c222ad6', '00000000000000000172', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:52');
INSERT INTO `transdetail` VALUES ('6f42c27d-8774-479c-8286-2158afdb8c76', '00000000000000000173', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:55');
INSERT INTO `transdetail` VALUES ('bf752dab-e089-4fbf-b6b1-d2f3c3c21e4c', '00000000000000000174', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:55');
INSERT INTO `transdetail` VALUES ('8190ae90-0213-4716-9163-d5478ff940af', '00000000000000000175', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:56');
INSERT INTO `transdetail` VALUES ('61f30383-f155-4c7f-a2c4-e63215a6e716', '00000000000000000176', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:57');
INSERT INTO `transdetail` VALUES ('55528ad5-b3e4-4808-89ea-6f8a6026e582', '00000000000000000177', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:57');
INSERT INTO `transdetail` VALUES ('b1ada7a7-07a2-4790-aa61-ba616e044116', '00000000000000000178', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:58');
INSERT INTO `transdetail` VALUES ('4809a69b-a1c9-4828-aa21-d674a53afd60', '00000000000000000179', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:59');
INSERT INTO `transdetail` VALUES ('e0ebc42f-5c1d-415f-8a2a-0b01729e49d3', '00000000000000000180', null, '2068', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:05:59');
INSERT INTO `transdetail` VALUES ('06344fea-72a4-4a78-996a-4fe0188ba530', '00000000000000000181', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '4980', '0', 'on', '60.0', '向嘉博', '18613371053', '1', '2017-09-17 21:37:34');
INSERT INTO `transdetail` VALUES ('9727e922-8c28-4e80-b5ce-8110ec113dc6', '00000000000000000182', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '4980', '0', 'on', '60.0', '向嘉博', '18613371053', '1', '2017-09-17 21:37:45');
INSERT INTO `transdetail` VALUES ('050a7799-aa60-4c2d-9d56-d90c7a442c0e', '00000000000000000183', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:42:16');
INSERT INTO `transdetail` VALUES ('0be83aa4-8614-47c8-ae1f-d3a36663ca03', '00000000000000000184', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:42:20');
INSERT INTO `transdetail` VALUES ('c19a93a3-b95a-4d0a-8a39-031cb0917a13', '00000000000000000185', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:42:21');
INSERT INTO `transdetail` VALUES ('1d48afda-0796-4b9b-ad57-570929acdbc2', '00000000000000000186', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:42:22');
INSERT INTO `transdetail` VALUES ('325f12c2-f826-4602-827a-0d21ce3e12d5', '00000000000000000187', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:42:23');
INSERT INTO `transdetail` VALUES ('cbb7cc0e-24a6-4def-a329-70d55ed81ec9', '00000000000000000188', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-17 21:42:31');
INSERT INTO `transdetail` VALUES ('4e9916ea-915a-469e-9dfd-3651207803c2', '00000000000000000189', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-18 07:57:02');
INSERT INTO `transdetail` VALUES ('278436b6-f0c0-415a-bfb6-d9f655c3c7b1', '00000000000000000190', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-18 07:57:06');
INSERT INTO `transdetail` VALUES ('69611fed-43c3-47b1-8bb8-34760747b151', '00000000000000000191', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '2068', '1', 'on', '30.0', '李雄', '13908468618', '1', '2017-09-18 09:36:56');
INSERT INTO `transdetail` VALUES ('3ecafcee-09c3-4227-a78b-227b9142fbcc', '00000000000000000192', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '908', '1', 'on', '13.0', '张利', '15974295408', '1', '2017-09-18 10:28:42');
INSERT INTO `transdetail` VALUES ('eed1ded5-ffe2-4ee6-aaaa-3af2e8e35cbe', '00000000000000000193', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-18 16:36:20');
INSERT INTO `transdetail` VALUES ('329c9626-32c6-4271-8ffd-1791566539ed', '00000000000000000194', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-18 16:36:24');
INSERT INTO `transdetail` VALUES ('5ec56e06-cb0f-45a0-93bc-3fb410e26521', '00000000000000000195', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-18 16:36:26');
INSERT INTO `transdetail` VALUES ('84a628ba-eadc-4bb4-b0fa-67dc957afcd3', '00000000000000000196', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-18 16:36:26');
INSERT INTO `transdetail` VALUES ('7824476b-46c8-484c-9d01-0c0c5b7f975d', '00000000000000000197', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '908', '1', 'on', '13.0', '盛丽', '18627317428', '1', '2017-09-19 09:57:58');
INSERT INTO `transdetail` VALUES ('aefbf296-e8c2-4f59-b59b-7c1b98db47bd', '00000000000000000198', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '908', '1', 'on', '13.0', '唐丽萍', '15211093179', '1', '2017-09-19 14:19:16');
INSERT INTO `transdetail` VALUES ('2b70ce49-b0d4-489d-832a-326cfd59ce86', '00000000000000000199', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '908', '1', 'on', '13.0', '曹哲铭', '13808422910', '1', '2017-09-19 14:39:39');
INSERT INTO `transdetail` VALUES ('73af3a61-5380-46cc-9606-bd86748df45c', '00000000000000000200', 'oiDYQ03QfjQO6JYSPjKxtt6ikuLM', '1138', '0', 'on', '13.0', '交流了', '15533', '1', '2017-09-19 15:00:26');
INSERT INTO `transdetail` VALUES ('2b99abe3-aca4-44af-bb72-d9660244d326', '00000000000000000201', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '0', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-09-19 19:01:54');
INSERT INTO `transdetail` VALUES ('fc2e6bb0-d849-4e2e-907c-39170ca298d4', '00000000000000000202', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '780', '1', 'on', '13.0', '符睿妈妈', '18674807076', '1', '2017-09-20 11:38:43');
INSERT INTO `transdetail` VALUES ('465e1228-e399-41e7-b56c-e14dca126c84', '00000000000000000203', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '1', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-09-20 20:32:13');
INSERT INTO `transdetail` VALUES ('aa679639-2832-4649-9ff1-93d597e19551', '00000000000000000204', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '3998', '1', 'on', '60.0', '赵宗荡', '15874030708', '1', '2017-09-20 21:31:42');
INSERT INTO `transdetail` VALUES ('15e31e53-10a0-404c-aa62-282726b303f6', '', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '0', '1', 'on', '1.0', '人工充值', '', '1', '2017-09-21 16:09:19');
INSERT INTO `transdetail` VALUES ('99618a9f-b775-4df5-8b2f-ebf2f15532e2', '00000000000000000205', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '1138', '1', 'on', '13.0', '黄文云', '13507439066', '1', '2017-09-21 17:34:49');
INSERT INTO `transdetail` VALUES ('af0530a0-5c11-418f-97a8-59fc9729b16c', '00000000000000000206', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '2600', '0', 'on', '30.0', '杨友良', '15084785602', '1', '2017-09-22 08:17:39');
INSERT INTO `transdetail` VALUES ('5789a291-7046-4641-892e-dd9b09f73c50', '00000000000000000207', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '2600', '1', 'on', '30.0', '杨友良', '15084785602', '1', '2017-09-22 08:21:16');
INSERT INTO `transdetail` VALUES ('44aa7ac1-8a66-4b01-b7e8-1ef3e10fcd8b', '00000000000000000208', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '1138', '0', 'on', '13.0', '徐海洋', '13017383328', '1', '2017-09-22 08:50:00');
INSERT INTO `transdetail` VALUES ('9040aff0-7eb5-490b-ab1b-bb7a78365ebe', '00000000000000000209', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '2068', '1', 'on', '30.0', '江丽霞', '15873191766', '1', '2017-09-22 15:20:26');
INSERT INTO `transdetail` VALUES ('cd8d470c-b1f9-47c5-b41b-20eef8f0c2b8', '00000000000000000210', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '1138', '1', 'on', '13.0', '徐海洋', '13017383328', '1', '2017-09-23 09:29:49');
INSERT INTO `transdetail` VALUES ('01590ddc-524b-45fd-ae92-8dbb8283c8ef', '00000000000000000211', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:06');
INSERT INTO `transdetail` VALUES ('1a7e867b-b0ca-4215-a5ec-aab2666fa0ff', '00000000000000000212', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:08');
INSERT INTO `transdetail` VALUES ('9fa18863-3078-45e0-83fe-3d463787f87d', '00000000000000000213', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:08');
INSERT INTO `transdetail` VALUES ('9820a2fc-9a50-4b8a-badb-b9f9c9a41b92', '00000000000000000214', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:10');
INSERT INTO `transdetail` VALUES ('874638e6-66a2-4c82-9d78-a1cbdf6732fe', '00000000000000000215', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:11');
INSERT INTO `transdetail` VALUES ('e4dd8d15-d9c1-4580-81aa-9ca661ea72c4', '00000000000000000216', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:12');
INSERT INTO `transdetail` VALUES ('cd7fee8f-4c0b-4783-baf1-c1bd6f6cd5c6', '00000000000000000217', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:13');
INSERT INTO `transdetail` VALUES ('a2a0c16b-52e0-43b8-bd81-c17187d8f891', '00000000000000000218', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:14');
INSERT INTO `transdetail` VALUES ('3e07558c-3036-4122-822f-821fa0eddd81', '00000000000000000219', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:15');
INSERT INTO `transdetail` VALUES ('f9986dbf-f248-43b5-8001-40b91cce8fa1', '00000000000000000220', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:16');
INSERT INTO `transdetail` VALUES ('9070d636-c5e0-4b28-947c-e9db3f236848', '00000000000000000221', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:17');
INSERT INTO `transdetail` VALUES ('f019accb-925f-483d-9884-ae3e5577c91f', '00000000000000000222', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:18');
INSERT INTO `transdetail` VALUES ('6f75bc70-1b63-4ddf-85ba-13f0f3b81faa', '00000000000000000223', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:18');
INSERT INTO `transdetail` VALUES ('d314d08e-56fc-4c35-a714-9e58980f0026', '00000000000000000224', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:19');
INSERT INTO `transdetail` VALUES ('863cecb9-67b7-4885-8640-bf58e28b5dc1', '00000000000000000225', null, '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:22:20');
INSERT INTO `transdetail` VALUES ('5d1af6da-5046-4e60-97ac-d262e585226d', '00000000000000000226', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:31:45');
INSERT INTO `transdetail` VALUES ('40733e0d-6f10-4f78-9997-e6a3ee5fca0b', '00000000000000000227', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '2600', '1', 'on', '30.0', '李政', '15388981830', '1', '2017-09-23 15:32:40');
INSERT INTO `transdetail` VALUES ('8f4614c2-fdef-40eb-bc67-23d50ac6237d', '00000000000000000228', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '908', '1', 'on', '13.0', '付玉芳', '18670015918', '1', '2017-09-24 10:47:12');
INSERT INTO `transdetail` VALUES ('0928a8cf-5a44-4b15-b512-e17dea6d1019', '00000000000000000229', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '908', '1', 'on', '13.0', '刘方', '18073193881', '1', '2017-09-24 12:19:18');
INSERT INTO `transdetail` VALUES ('d8556a99-8977-4cf7-9a09-3043e9275aef', '00000000000000000230', 'oiDYQ017uj72LXQrGABRBHI3z85k', '2600', '0', 'on', '30.0', '张玲', '13667314903', '1', '2017-09-24 12:22:24');
INSERT INTO `transdetail` VALUES ('7b0735f0-abbf-4bb1-8e8f-e1fceb39deb1', '00000000000000000231', 'oiDYQ017uj72LXQrGABRBHI3z85k', '908', '0', 'on', '13.0', '张玲', '13667314903', '1', '2017-09-24 12:28:12');
INSERT INTO `transdetail` VALUES ('563d629e-0e61-4ccd-89d8-47daec1a349f', '00000000000000000232', 'oiDYQ017uj72LXQrGABRBHI3z85k', '2068', '0', 'on', '30.0', '张玲', '13667314903', '1', '2017-09-24 12:28:55');
INSERT INTO `transdetail` VALUES ('a5d23537-d026-4884-b5b2-4d1be0d907ef', '00000000000000000233', 'oiDYQ017uj72LXQrGABRBHI3z85k', '908', '0', 'on', '13.0', '张玲', '13667314903', '1', '2017-09-24 12:29:29');
INSERT INTO `transdetail` VALUES ('6f53cc2d-a432-44a0-98fe-a66c95bd7281', '00000000000000000234', 'oiDYQ017uj72LXQrGABRBHI3z85k', '2600', '1', 'on', '30.0', '张玲', '13667314903', '1', '2017-09-24 12:32:00');
INSERT INTO `transdetail` VALUES ('d99893bc-c75c-4bbb-8f07-d5401024d0d9', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '1.0', '人工充值', '', '1', '2017-09-24 12:40:12');
INSERT INTO `transdetail` VALUES ('a95439b1-fe71-4030-8dd1-b6e4b4d31815', '00000000000000000235', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '2600', '0', 'on', '30.0', '邹一', '13755017223', '1', '2017-09-24 13:58:57');
INSERT INTO `transdetail` VALUES ('6978a0cc-ff1c-4067-9d72-30d72faf1aa1', '00000000000000000236', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1138', '0', 'on', '13.0', '周圣沅家长', '18607358121', '1', '2017-09-24 14:51:50');
INSERT INTO `transdetail` VALUES ('00f98824-2f13-45c0-9031-c1da5278b839', '00000000000000000237', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1138', '1', 'on', '13.0', '周圣沅家长', '18607358121', '1', '2017-09-24 14:54:23');
INSERT INTO `transdetail` VALUES ('52163b51-18e9-4a0d-9cdb-e89522202274', '', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-09-24 14:58:22');
INSERT INTO `transdetail` VALUES ('d6f030a8-ca58-4d9e-81cd-d582da7d6f41', '', 'oiDYQ00-fyRniJe64qhA7IERSgzs', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-09-24 15:00:35');
INSERT INTO `transdetail` VALUES ('ded307c5-1814-4bef-9a02-85d5b20901d6', '', 'oiDYQ0wscf2hyr0fPoDkLMoOhIjA', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-09-24 15:00:54');
INSERT INTO `transdetail` VALUES ('9ab91a62-c6a3-4687-9619-04c5acdf6388', '00000000000000000238', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '1138', '0', 'on', '13.0', '周圣沅家长', '18607358121', '1', '2017-09-24 15:03:23');
INSERT INTO `transdetail` VALUES ('be430cd4-299d-4502-bf76-13cc114bb500', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-09-24 15:06:01');
INSERT INTO `transdetail` VALUES ('c9b1db91-d510-4dbc-8655-20695ffe3693', '00000000000000000239', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '2600', '1', 'on', '30.0', '邹一', '13755017223', '1', '2017-09-24 16:34:34');
INSERT INTO `transdetail` VALUES ('560cc69f-8364-4379-a2f7-990a39fd35f6', '00000000000000000240', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '908', '1', 'on', '13.0', '邓敏', '13875911271', '1', '2017-09-25 10:20:12');
INSERT INTO `transdetail` VALUES ('50bb841e-7ae7-4374-a0fc-5c578b2d38c6', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '26.0', '人工充值', '', '1', '2017-09-25 15:18:46');
INSERT INTO `transdetail` VALUES ('4694a1d4-009a-412b-baee-6246aa769b36', '', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-09-25 15:19:25');
INSERT INTO `transdetail` VALUES ('0a0e780d-3c9e-4c12-a142-8a7430d03f4a', '', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '0', '1', 'on', '1.0', '人工充值', '', '1', '2017-09-25 15:19:41');
INSERT INTO `transdetail` VALUES ('5392f1bf-1cf3-4ba4-896b-2fc601834837', '', 'oiDYQ037tVxiPlWtbKbGmDG11ULM', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-09-25 15:19:52');
INSERT INTO `transdetail` VALUES ('6ad6a64d-3eff-4b7a-a8de-d9e055d16719', '', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-09-25 15:21:48');
INSERT INTO `transdetail` VALUES ('6bb3c8d9-e98e-4875-98bf-48a4e3de0a69', '00000000000000000241', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '2600', '0', 'on', '30.0', '李政', '15388981830', '1', '2017-09-25 15:31:06');
INSERT INTO `transdetail` VALUES ('87e1557c-8783-45bf-a058-240a4bea988b', '', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '0', '1', 'on', '30.0', '人工充值', '', '1', '2017-09-25 15:31:33');
INSERT INTO `transdetail` VALUES ('fb4ec570-1e35-413f-8535-e8680e2de352', '', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '0', '1', 'on', '30.0', '人工扣费', '', '-1', '2017-09-25 15:33:16');
INSERT INTO `transdetail` VALUES ('d0f359bb-ce79-4970-976a-b9e8350fefad', '00000000000000000242', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2068', '0', 'on', '30.0', '杨润芳', '18229975254', '1', '2017-09-25 19:15:19');
INSERT INTO `transdetail` VALUES ('ae314a35-0adb-4bb3-bb49-9c22d362ff6c', '00000000000000000243', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2068', '1', 'on', '30.0', '杨润芳', '18229975254', '1', '2017-09-25 19:18:22');
INSERT INTO `transdetail` VALUES ('07bc44fe-8587-46ba-9e52-59598aadbd91', '00000000000000000244', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '1138', '1', 'on', '13.0', '万嘉诚妈妈', '13487387999', '1', '2017-09-25 21:20:48');
INSERT INTO `transdetail` VALUES ('5b89b694-283c-49be-b2b4-1177d60403e1', '00000000000000000245', 'oiDYQ0xrHBjcgA1QpsuHHznQYH3w', '908', '1', 'on', '13.0', '赵娴', '13397311892', '1', '2017-10-01 09:45:18');
INSERT INTO `transdetail` VALUES ('b103c139-873f-4558-8c73-2245913037e2', '00000000000000000246', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '4980', '1', 'on', '60.0', '周洪', '13874982491', '1', '2017-10-02 09:36:37');
INSERT INTO `transdetail` VALUES ('b780671e-05fd-48c4-808a-8560d75630a5', '00000000000000000247', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '1', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-10-02 11:03:49');
INSERT INTO `transdetail` VALUES ('f37b22ca-c25e-46c1-be68-19cd9863d1cf', '00000000000000000248', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '1138', '0', 'on', '13.0', '谭永林', '18273151646', '1', '2017-10-07 11:03:57');
INSERT INTO `transdetail` VALUES ('6c3961b2-a997-40ff-ab3e-2643226ce8c3', '00000000000000000249', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '1138', '1', 'on', '13.0', '谭永林', '18273151646', '1', '2017-10-07 11:11:04');
INSERT INTO `transdetail` VALUES ('a2363202-9e13-4da8-8b68-fb440521e771', '00000000000000000250', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '908', '1', 'on', '13.0', '章烨', '18573117977', '1', '2017-10-12 15:08:06');
INSERT INTO `transdetail` VALUES ('001731a0-c4de-4852-9490-6f10b3961cb3', '00000000000000000251', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '908', '1', 'on', '13.0', '黄初民', '13874538730', '1', '2017-10-12 16:46:24');
INSERT INTO `transdetail` VALUES ('ec722b46-9f16-40c4-afde-6ca3bd0b17ac', '00000000000000000252', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '908', '1', 'on', '13.0', '邹建斌', '13574851122', '1', '2017-10-12 19:45:22');
INSERT INTO `transdetail` VALUES ('93d75bd3-439a-4993-983a-dc5e7fbf577d', '', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '0', '1', 'on', '2.0', '人工充值', '', '1', '2017-10-13 15:21:10');
INSERT INTO `transdetail` VALUES ('f2811d89-1173-4a07-a17b-8d3062e04a13', '00000000000000000253', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '1138', '1', 'on', '13.0', '文喜玲', '18974192898', '1', '2017-10-13 21:41:21');
INSERT INTO `transdetail` VALUES ('35d845d8-0f48-49cb-9438-935327349a03', '00000000000000000254', 'oiDYQ09UC8xTa0Dou-MYUhXrwSxY', '2068', '0', 'on', '30.0', '金玉元', '18774912606', '1', '2017-10-14 17:16:00');
INSERT INTO `transdetail` VALUES ('7cc9dd46-9605-4c32-a42d-3cb1ea6f8985', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-14 23:16:16');
INSERT INTO `transdetail` VALUES ('3e38ea35-e1ed-4952-9d9f-cf0d87a74dff', '', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-14 23:18:24');
INSERT INTO `transdetail` VALUES ('eed11b5a-24af-461b-8da1-ad5fc93599a1', '', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-14 23:22:17');
INSERT INTO `transdetail` VALUES ('93079f64-e4a4-4882-9934-060ca0cb5f08', '', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '0', '1', 'on', '7.5', '人工扣费', '', '-1', '2017-10-14 23:23:51');
INSERT INTO `transdetail` VALUES ('bf5e47c9-86cd-4a6c-bbdd-d6100f03afcb', '', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-14 23:24:12');
INSERT INTO `transdetail` VALUES ('3e97bfc8-2fbc-40c8-ad52-977333492d83', '', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-10-14 23:24:34');
INSERT INTO `transdetail` VALUES ('2f0f4fad-b29d-409a-8675-082b102b8e6b', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-10-14 23:25:26');
INSERT INTO `transdetail` VALUES ('f36c2858-f1f7-4fe0-bcee-c0d05c1dc69c', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '7.5', '人工扣费', '', '-1', '2017-10-14 23:26:34');
INSERT INTO `transdetail` VALUES ('c00285f4-fbf1-454b-b8ba-fa9fdfcd0581', '', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2017-10-14 23:43:10');
INSERT INTO `transdetail` VALUES ('0aac1a69-11b0-4aa6-9b36-8569c85bfb53', '', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '0', '1', 'on', '10.5', '人工扣费', '', '-1', '2017-10-14 23:44:02');
INSERT INTO `transdetail` VALUES ('807e8d6f-f54a-4cde-9a1d-dfcd982f3da3', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2017-10-14 23:44:39');
INSERT INTO `transdetail` VALUES ('6a3ba363-b1f7-49ea-a8c2-8914aac2e394', '', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-10-14 23:45:04');
INSERT INTO `transdetail` VALUES ('b27af5d3-fa9c-4dd4-a020-114395f6010c', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-10-14 23:48:53');
INSERT INTO `transdetail` VALUES ('236416e2-d622-42ad-a323-64b689970445', '', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-10-14 23:49:49');
INSERT INTO `transdetail` VALUES ('ed2632e8-b7a2-42cb-b6a5-e86c82adccdf', '', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-10-14 23:50:15');
INSERT INTO `transdetail` VALUES ('e40badc9-7723-4f3c-9c0e-1681dbb79d7a', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-10-14 23:51:03');
INSERT INTO `transdetail` VALUES ('3dde8b1c-5761-47e3-a823-cf031afd6199', '', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-14 23:51:32');
INSERT INTO `transdetail` VALUES ('80b839b3-c661-415b-a151-a47d556e6475', '', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-14 23:52:16');
INSERT INTO `transdetail` VALUES ('9306a182-404a-42b5-8797-66660c9d88f7', '', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-10-14 23:52:45');
INSERT INTO `transdetail` VALUES ('17d0dac9-2cc9-431d-ad97-cb8d602e6af4', '', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-10-14 23:55:31');
INSERT INTO `transdetail` VALUES ('b8aaa4cb-8494-40f0-8f89-15ff42c7e706', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-14 23:56:06');
INSERT INTO `transdetail` VALUES ('2f70c2e6-b0c2-49fd-9b43-7acb7067d963', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-14 23:56:40');
INSERT INTO `transdetail` VALUES ('21411fe1-7196-4103-b3dc-58c37ad8a50f', '', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-14 23:57:32');
INSERT INTO `transdetail` VALUES ('dbe7d7cf-92ce-463f-932e-c0419a753e17', '', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-14 23:57:54');
INSERT INTO `transdetail` VALUES ('0f1a7db1-5863-4f8a-b8d2-d61eb7f4860f', '', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-10-14 23:58:59');
INSERT INTO `transdetail` VALUES ('8341bcbb-239d-4797-a0ff-0367bb93f9ce', '', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-14 23:59:37');
INSERT INTO `transdetail` VALUES ('aded7eb7-1217-4a42-af03-fcc868eea466', '', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-15 00:00:12');
INSERT INTO `transdetail` VALUES ('f0d83e5a-63d7-4938-a800-51775f90c97f', '', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-10-15 00:01:40');
INSERT INTO `transdetail` VALUES ('4d8315b5-0937-45ba-ab02-dd804d972eed', '', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-15 00:02:13');
INSERT INTO `transdetail` VALUES ('c9f65bfe-82ec-4599-a8da-d1eef2ee7a62', '', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-15 09:53:37');
INSERT INTO `transdetail` VALUES ('5687faae-d5c9-494d-b0e5-291c31eecdb3', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-15 09:55:19');
INSERT INTO `transdetail` VALUES ('c18eda15-e32e-44b6-b29a-a111172bf7e0', '00000000000000000255', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '2068', '1', 'on', '30.0', '陈少敏', '13027415020', '1', '2017-10-15 10:45:33');
INSERT INTO `transdetail` VALUES ('9a3546de-d893-49e9-89c2-99ff40c557ab', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-10-15 10:50:31');
INSERT INTO `transdetail` VALUES ('de381cf1-9f3c-463b-b42f-0fd26907d3b9', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '2.0', '人工充值', '', '1', '2017-10-15 10:55:52');
INSERT INTO `transdetail` VALUES ('5b98dd64-b247-4d25-ae46-535dcb11a184', '00000000000000000256', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '908', '1', 'on', '13.0', '胡志兰', '15907387929', '1', '2017-10-15 15:18:25');
INSERT INTO `transdetail` VALUES ('f0a566ba-cb27-46ae-aed7-a99ebd4eb235', '00000000000000000257', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '908', '1', 'on', '13.0', '彭玲玲', '18975148025', '1', '2017-10-15 20:33:02');
INSERT INTO `transdetail` VALUES ('18b39a3d-a987-4565-b501-731ee2d2b003', '00000000000000000258', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '908', '0', 'on', '13.0', '梁静华', '13975200436', '1', '2017-10-15 21:03:13');
INSERT INTO `transdetail` VALUES ('e2a284e2-d7df-4ed2-ad46-a697a0b0d43f', '00000000000000000259', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '908', '1', 'on', '13.0', '梁静华', '13975200436', '1', '2017-10-15 21:03:21');
INSERT INTO `transdetail` VALUES ('c48b3285-0729-4286-85ce-83c86e0e5442', '00000000000000000260', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '908', '0', 'on', '13.0', '彭娟', '15116357407', '1', '2017-10-15 22:01:34');
INSERT INTO `transdetail` VALUES ('9872d2f1-4fce-426d-99dd-861685b8de30', '00000000000000000261', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '5398', '0', 'on', '80.0', '吴丽华', '13974849906', '1', '2017-10-16 12:51:12');
INSERT INTO `transdetail` VALUES ('e188d458-2f7f-49aa-b685-a88fa12fa85c', '00000000000000000262', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '5398', '1', 'on', '80.0', '吴丽华', '13974849906', '1', '2017-10-16 12:54:33');
INSERT INTO `transdetail` VALUES ('6b30a78f-0d56-4b95-a2b9-a17545fb5220', '00000000000000000263', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '1138', '1', 'on', '13.0', '彭娟', '15116357407', '1', '2017-10-18 08:26:50');
INSERT INTO `transdetail` VALUES ('bec68734-20ee-466f-9cf8-07cd134d5574', '00000000000000000264', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '908', '1', 'on', '13.0', '侯英', '13467645536', '1', '2017-10-19 09:08:03');
INSERT INTO `transdetail` VALUES ('f8423b98-7b61-41b9-a963-fa8f7ed9e0ca', '00000000000000000265', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '2068', '1', 'on', '30.0', '罗登', '17608437860', '1', '2017-10-20 13:17:56');
INSERT INTO `transdetail` VALUES ('d920e236-1316-4bfd-9c10-fabeb434cae9', '00000000000000000266', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '908', '1', 'on', '13.0', '张利', '15974295408', '1', '2017-10-21 12:25:39');
INSERT INTO `transdetail` VALUES ('499e9e0a-2b46-4b5b-a2e0-a9de8685f4a0', '00000000000000000267', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '908', '0', 'on', '13.0', '刘晓荷', '15074847431', '1', '2017-10-21 16:14:56');
INSERT INTO `transdetail` VALUES ('9b52b797-c2f0-4c3e-8e4e-79c0198cd4fb', '00000000000000000268', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '908', '1', 'on', '13.0', '刘晓荷', '15074847431', '1', '2017-10-21 16:16:08');
INSERT INTO `transdetail` VALUES ('0d2af21c-8732-4563-85a1-de4b0b407878', '00000000000000000269', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '1138', '1', 'on', '13.0', '安青', '13907467987', '1', '2017-10-21 22:32:04');
INSERT INTO `transdetail` VALUES ('b20bf415-a6bc-4846-8475-9322e2f47dc2', '00000000000000000270', 'oiDYQ07MSdojJeifDrBeddlagQIE', '1138', '1', 'on', '13.0', '任姐', '13100257679', '1', '2017-10-25 23:43:08');
INSERT INTO `transdetail` VALUES ('e1aa89c7-e007-4619-af06-74af00fb3d9b', '00000000000000000271', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '908', '1', 'on', '13.0', '彭卿钰妈妈', '13278898952', '1', '2017-10-26 20:55:41');
INSERT INTO `transdetail` VALUES ('adf2ea46-7e85-4616-9bf5-16426ffa399e', '00000000000000000272', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '908', '1', 'on', '13.0', '李珂', '13975895787', '1', '2017-10-28 19:54:01');
INSERT INTO `transdetail` VALUES ('01e69811-09ba-444c-a7f3-d10724da0e38', '00000000000000000273', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '5398', '0', 'on', '80.0', '钟俊', '18874299916', '1', '2017-10-29 15:26:40');
INSERT INTO `transdetail` VALUES ('2333c651-7afd-489b-8989-834f60bfa856', '00000000000000000274', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '5398', '1', 'on', '80.0', '钟俊', '15802516888', '1', '2017-10-29 15:39:29');
INSERT INTO `transdetail` VALUES ('84233642-d9be-4f4c-9f14-166a77dcdfd0', '00000000000000000275', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '1', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-10-29 15:39:53');
INSERT INTO `transdetail` VALUES ('0fe5f6c1-1d8f-4fb5-a016-f747ddb59d96', '00000000000000000276', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '2600', '1', 'on', '30.0', '刘利香', '18670029595', '1', '2017-10-29 22:50:48');
INSERT INTO `transdetail` VALUES ('f291149a-27c4-483c-8040-b72bc7d80bbc', '00000000000000000277', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '908', '1', 'on', '13.0', '付玉芳', '18670015918', '1', '2017-10-30 10:49:53');
INSERT INTO `transdetail` VALUES ('299cb660-b3d4-4bae-8b9f-48517269241f', '00000000000000000278', 'oiDYQ07Jn3_glS3LBerFcurtrvCc', '780', '1', 'on', '13.0', '胡女士', '13517477896', '1', '2017-10-30 11:30:03');
INSERT INTO `transdetail` VALUES ('ada653cb-78e0-4566-a708-e52d2710bb8a', '00000000000000000279', 'oiDYQ0ykEDo9PSoFIoESP3ym9EsY', '908', '1', 'on', '13.0', '宁用逵', '18774009768', '1', '2017-11-01 12:32:56');
INSERT INTO `transdetail` VALUES ('fe08a7e6-b194-4e18-8440-095dea33fa63', '00000000000000000280', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '908', '0', 'on', '13.0', '贺煜', '13707319633', '1', '2017-11-01 18:19:55');
INSERT INTO `transdetail` VALUES ('2c978f4f-3cc4-4e13-b23c-1cf479501646', '00000000000000000281', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '1760', '0', 'on', '30.0', '江丽霞', '15873191766', '1', '2017-11-01 18:34:03');
INSERT INTO `transdetail` VALUES ('3df74fb6-07f1-4988-b09b-aa08373ae1f8', '00000000000000000282', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '1760', '0', 'on', '30.0', '江丽霞', '15873191766', '1', '2017-11-01 18:34:39');
INSERT INTO `transdetail` VALUES ('29dff33a-a06d-4857-878b-8507724a93a3', '00000000000000000283', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '1760', '1', 'on', '30.0', '江丽霞', '15873191766', '1', '2017-11-01 18:35:08');
INSERT INTO `transdetail` VALUES ('3e1e0d47-573a-4f8e-9f5f-f6ba28d5c44c', '00000000000000000284', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '908', '1', 'on', '13.0', '白玉萍', '13707319633', '1', '2017-11-01 18:44:24');
INSERT INTO `transdetail` VALUES ('60ec9cf5-1769-4f19-8581-4544047f5ae2', '00000000000000000285', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '908', '1', 'on', '13.0', '梁洪俊', '13378012713', '1', '2017-11-02 00:56:36');
INSERT INTO `transdetail` VALUES ('17918385-ca1e-4ba0-93ed-d3afa5d2d066', '00000000000000000286', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '908', '1', 'on', '13.0', '张波', '15874212817', '1', '2017-11-02 22:18:10');
INSERT INTO `transdetail` VALUES ('9b3dd968-961d-4ffc-aed0-c0cbc41a8f60', '00000000000000000287', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '908', '0', 'on', '13.0', '吕艺军', '13973716008', '1', '2017-11-04 11:43:21');
INSERT INTO `transdetail` VALUES ('22ed4692-66a8-446e-a636-1d3c9c0d7511', '00000000000000000288', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '908', '1', 'on', '13.0', '吕艺军', '13973716008', '1', '2017-11-04 11:43:39');
INSERT INTO `transdetail` VALUES ('77e33e8c-4f09-496b-a815-ed98a1469748', '00000000000000000289', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '908', '0', 'on', '13.0', '吕艺军', '13973716008', '1', '2017-11-04 11:44:17');
INSERT INTO `transdetail` VALUES ('27eb0b2d-1063-474d-93cf-4c348901058d', '00000000000000000290', 'oiDYQ0-QDBqy_nPtX-Hjp8OCesy8', '908', '0', 'on', '13.0', '1', '13296329632', '1', '2017-11-04 12:14:23');
INSERT INTO `transdetail` VALUES ('44c939f5-943d-4931-bbfa-435b6230abd8', '00000000000000000291', 'oiDYQ0-QDBqy_nPtX-Hjp8OCesy8', '908', '0', 'on', '13.0', '1', '13296329632', '1', '2017-11-04 12:14:33');
INSERT INTO `transdetail` VALUES ('1ec1bfca-f686-4681-a227-928d828dd2ac', '00000000000000000292', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '2068', '0', 'on', '30.0', '柳成英', '13908472055', '1', '2017-11-04 15:30:14');
INSERT INTO `transdetail` VALUES ('71a23e0b-a26a-4a01-b910-f6d1f7409a4c', '00000000000000000293', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '3998', '0', 'on', '60.0', '柳成英', '13908472055', '1', '2017-11-04 16:44:09');
INSERT INTO `transdetail` VALUES ('1c33fa11-72f9-4943-9c74-e4c022079467', '00000000000000000294', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '3998', '0', 'on', '60.0', '柳成英', '13908472055', '1', '2017-11-04 16:46:18');
INSERT INTO `transdetail` VALUES ('75ed4442-874b-4b2d-807d-a821c08090a1', '00000000000000000295', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '3998', '1', 'on', '60.0', '柳成英', '13908472055', '1', '2017-11-04 16:46:32');
INSERT INTO `transdetail` VALUES ('bb3ac221-0fdf-49c0-b407-c23fe01d877d', '00000000000000000296', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '2068', '1', 'on', '30.0', '袁改华', '18975898882', '1', '2017-11-05 08:19:07');
INSERT INTO `transdetail` VALUES ('fde68207-d382-48ed-a79c-ffa0332fb53c', '00000000000000000297', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2068', '1', 'on', '30.0', '杨润芳', '18229975254', '1', '2017-11-05 12:59:43');
INSERT INTO `transdetail` VALUES ('cc2d089b-610a-4df0-b1f7-09e3a8f5ccef', '', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-05 16:45:04');
INSERT INTO `transdetail` VALUES ('d5c6ccb4-f10c-45de-b106-68e23272f226', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-05 17:03:33');
INSERT INTO `transdetail` VALUES ('c572b6f0-15b7-4f70-b947-a0dacf401ece', '00000000000000000298', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '908', '1', 'on', '13.0', '刘婧', '13974635575', '1', '2017-11-06 14:11:35');
INSERT INTO `transdetail` VALUES ('1c92758f-61fa-4634-af7b-722cf94faa11', '00000000000000000299', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '908', '1', 'on', '13.0', '程涛', '18075503366', '1', '2017-11-07 11:12:33');
INSERT INTO `transdetail` VALUES ('c60faaca-b612-4289-94f2-e5c5a41ee0ee', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 17:01:54');
INSERT INTO `transdetail` VALUES ('233f66da-9728-4c53-aeda-aca91949349a', '', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-07 17:07:06');
INSERT INTO `transdetail` VALUES ('384f1521-a813-4ccf-ab58-5fd1fe923f23', '', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-07 17:08:17');
INSERT INTO `transdetail` VALUES ('f9635cc6-4a2e-46ce-bf21-aaaafd639ed4', '', 'oiDYQ07MSdojJeifDrBeddlagQIE', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-07 17:09:59');
INSERT INTO `transdetail` VALUES ('4b2f81a4-4d07-403f-abcc-29dc67367b35', '', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2017-11-07 17:14:30');
INSERT INTO `transdetail` VALUES ('4ad39af0-153e-4f01-968e-42701f3ddb74', '', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 17:15:10');
INSERT INTO `transdetail` VALUES ('6ec672d4-c056-46e9-a1c0-2360dafb836d', '', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 17:15:55');
INSERT INTO `transdetail` VALUES ('51130ec4-0ad6-4628-8a66-22225cdeb064', '', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '0', '1', 'on', '20.0', '人工扣费', '', '-1', '2017-11-07 17:18:06');
INSERT INTO `transdetail` VALUES ('c625ae50-e6dc-40d6-8a94-24f00a361dc1', '', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '0', '1', 'on', '12.5', '人工扣费', '', '-1', '2017-11-07 17:20:11');
INSERT INTO `transdetail` VALUES ('03b07ea0-a99e-46c0-9284-b2bc2fc7d628', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2017-11-07 17:21:56');
INSERT INTO `transdetail` VALUES ('d4c45ce6-99cc-4c68-8f38-052d4f8bad10', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2017-11-07 17:22:00');
INSERT INTO `transdetail` VALUES ('70e37643-0a50-4120-ae7d-d8350d5a49f7', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '14.0', '人工充值', '', '1', '2017-11-07 17:23:02');
INSERT INTO `transdetail` VALUES ('6b7cc71b-4598-4212-a282-e64e362d4d71', '', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 17:24:18');
INSERT INTO `transdetail` VALUES ('63bced75-4700-4e6d-b5fd-2b5ed14ce75b', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '18.0', '人工扣费', '', '-1', '2017-11-07 17:26:23');
INSERT INTO `transdetail` VALUES ('411c2b7c-eff3-4958-9701-7e3158aafb2a', '', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '0', '1', 'on', '5.5', '人工扣费', '', '-1', '2017-11-07 17:28:21');
INSERT INTO `transdetail` VALUES ('a7d9ac51-ae1d-4f4c-b77e-15ce213be306', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 17:29:21');
INSERT INTO `transdetail` VALUES ('c38c8e34-fb7b-4c90-bc87-1173c791a49b', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2017-11-07 17:29:59');
INSERT INTO `transdetail` VALUES ('29bd331b-eac3-4737-899e-41c1a3ee7a1e', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '18.0', '人工充值', '', '1', '2017-11-07 17:31:48');
INSERT INTO `transdetail` VALUES ('a885a1a6-946a-494c-b25c-5ac6e58ef773', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 17:31:57');
INSERT INTO `transdetail` VALUES ('8c4ce4e6-12b7-48e2-988b-680ec3a2ec42', '', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '0', '1', 'on', '18.0', '人工扣费', '', '-1', '2017-11-07 17:38:12');
INSERT INTO `transdetail` VALUES ('88a99be8-cb8e-4f73-b4e7-8194f6fdbbd8', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 17:39:40');
INSERT INTO `transdetail` VALUES ('53403bfe-2fde-44b2-8329-20da7b7ba5f5', '', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 17:40:20');
INSERT INTO `transdetail` VALUES ('82d05e35-0f70-44cd-94b0-873fa33f7a66', '', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '0', '1', 'on', '14.5', '人工扣费', '', '-1', '2017-11-07 17:40:57');
INSERT INTO `transdetail` VALUES ('191b3873-e3a3-4da5-beca-1ef89c27018c', '', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '0', '1', 'on', '11.0', '人工扣费', '', '-1', '2017-11-07 17:44:20');
INSERT INTO `transdetail` VALUES ('00e4c1ab-2315-4d70-b37e-1fc10f767b9c', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '23.5', '人工扣费', '', '-1', '2017-11-07 17:45:49');
INSERT INTO `transdetail` VALUES ('ba685f59-8f73-4310-8c86-c9d35985a822', '', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '0', '1', 'on', '22.0', '人工扣费', '', '-1', '2017-11-07 17:48:49');
INSERT INTO `transdetail` VALUES ('dc7b1c67-e9dd-49b2-92b5-63508ba59008', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2017-11-07 17:49:29');
INSERT INTO `transdetail` VALUES ('edc768c2-65da-4824-a9cb-4b84201d2b04', '', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '0', '1', 'on', '11.0', '人工扣费', '', '-1', '2017-11-07 17:49:56');
INSERT INTO `transdetail` VALUES ('4279fec0-1842-48c6-89db-92d14041513d', '', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 17:50:34');
INSERT INTO `transdetail` VALUES ('d2bb5ab7-2129-43a2-a746-c0762795e915', '', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 17:51:07');
INSERT INTO `transdetail` VALUES ('86249ed6-b4c4-4857-9c4e-be7c7d304792', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 17:52:01');
INSERT INTO `transdetail` VALUES ('8f783068-e0aa-4aa1-9d28-151cf28c5678', '', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 17:53:28');
INSERT INTO `transdetail` VALUES ('bcbb63d3-ed92-4bbc-9469-411f056e3399', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2017-11-07 17:54:14');
INSERT INTO `transdetail` VALUES ('ea02db48-456f-425a-9e2f-9b2757be9114', '', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 17:54:43');
INSERT INTO `transdetail` VALUES ('e3a231c8-4e77-461d-bb14-01a5fd0b971d', '', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 17:55:06');
INSERT INTO `transdetail` VALUES ('a95459d8-3951-488c-af94-c2113b1d645c', '', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 17:55:36');
INSERT INTO `transdetail` VALUES ('c0ab1b16-327a-4d68-bcbf-3490553e06b7', '', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 17:57:06');
INSERT INTO `transdetail` VALUES ('9e3a9a6a-b869-48c3-a221-a3413afd7cb8', '', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '0', '1', 'on', '23.0', '人工扣费', '', '-1', '2017-11-07 17:57:53');
INSERT INTO `transdetail` VALUES ('7c5b5745-c3b4-4622-88b5-4870dff96965', '', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 17:58:44');
INSERT INTO `transdetail` VALUES ('a7f52489-9550-41f7-a0ea-c2fadc5f117d', '', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '0', '1', 'on', '19.0', '人工扣费', '', '-1', '2017-11-07 17:59:11');
INSERT INTO `transdetail` VALUES ('4468825f-6b47-46ce-982a-38eb07ed029d', '', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 17:59:46');
INSERT INTO `transdetail` VALUES ('e265da92-af87-4984-b151-7e4d01af2442', '', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '0', '1', 'on', '12.5', '人工扣费', '', '-1', '2017-11-07 18:00:14');
INSERT INTO `transdetail` VALUES ('7b344a7b-10c9-4006-9738-ae22e8aee42e', '', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '0', '1', 'on', '11.0', '人工扣费', '', '-1', '2017-11-07 18:02:34');
INSERT INTO `transdetail` VALUES ('744692d7-9e7b-4600-95d3-4e6269086f9f', '', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 18:03:33');
INSERT INTO `transdetail` VALUES ('53696457-68b2-4069-8b84-39e5c9392954', '', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-07 18:04:03');
INSERT INTO `transdetail` VALUES ('b29f7c19-36b0-4ae1-9fb3-ccf401643406', '', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-11-07 18:04:46');
INSERT INTO `transdetail` VALUES ('5678f1bd-394a-465b-b30c-ce9f332676a2', '', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-07 21:22:43');
INSERT INTO `transdetail` VALUES ('3be5bc14-4526-4943-87e6-a86db9b7166e', '', 'oiDYQ0xrHBjcgA1QpsuHHznQYH3w', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2017-11-07 21:24:26');
INSERT INTO `transdetail` VALUES ('82c575d8-a741-4e5d-8568-2b24669594ce', '', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '0', '1', 'on', '12.0', '人工扣费', '', '-1', '2017-11-07 21:26:31');
INSERT INTO `transdetail` VALUES ('0215500c-6753-438b-88d3-fb2a32481da2', '', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 21:27:09');
INSERT INTO `transdetail` VALUES ('3f36c2ee-e41b-45da-853a-0c50074b961b', '', 'oiDYQ0ykEDo9PSoFIoESP3ym9EsY', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-07 21:27:35');
INSERT INTO `transdetail` VALUES ('e447e711-ee9f-4073-9cec-1a46d60e936d', '', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-11-07 21:28:13');
INSERT INTO `transdetail` VALUES ('95eb6b6b-6000-4ed0-9868-b0c38b950297', '', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-07 21:30:15');
INSERT INTO `transdetail` VALUES ('eb474e2f-fc89-4710-a2cc-312b6f6f5dd9', '', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-11-07 21:30:57');
INSERT INTO `transdetail` VALUES ('d9bf3f60-bb9a-49d3-8716-307c8997b9fa', '', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-07 22:04:13');
INSERT INTO `transdetail` VALUES ('90f98e97-b937-4f82-8f31-1fb5953d781f', '', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-08 12:49:16');
INSERT INTO `transdetail` VALUES ('e148e2c1-27b5-44e1-bf68-ade481b8734f', '', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '0', '1', 'on', '28.0', '人工扣费', '', '-1', '2017-11-08 12:50:59');
INSERT INTO `transdetail` VALUES ('9979aa34-2dcb-4c98-acfc-68eb95665ddd', '00000000000000000300', 'oiDYQ0-vlOikutIv3r5oJhRuENjU', '908', '1', 'on', '13.0', '邓桂兰', '15111322847', '1', '2017-11-08 18:53:47');
INSERT INTO `transdetail` VALUES ('0d7a0cb5-92c5-4b5d-969d-ad3cd9d5c4ac', '00000000000000000301', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '2068', '1', 'on', '30.0', '李雄', '13908468618', '1', '2017-11-08 20:45:35');
INSERT INTO `transdetail` VALUES ('639c1678-e4ac-4b96-976e-7d2a522f5d52', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '2.0', '人工充值', '', '1', '2017-11-08 21:45:29');
INSERT INTO `transdetail` VALUES ('32fda251-8831-4f4c-937d-565791939949', '00000000000000000302', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '908', '1', 'on', '13.0', '梁静华', '13975200436', '1', '2017-11-08 22:22:33');
INSERT INTO `transdetail` VALUES ('243b66f3-93bc-4284-8f65-5f2053dd925d', '', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-11-09 21:41:38');
INSERT INTO `transdetail` VALUES ('1db4494b-c058-4ae3-90e7-66e7840bfe83', '00000000000000000303', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '1138', '1', 'on', '13.0', '宋靓', '13975883828', '1', '2017-11-10 11:50:32');
INSERT INTO `transdetail` VALUES ('c12f4201-7c49-41bd-92ba-3559519067df', '', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '0', '1', 'on', '2.0', '人工充值', '', '1', '2017-11-10 19:47:54');
INSERT INTO `transdetail` VALUES ('7889b903-ea82-4dc6-861d-54d4360de8fb', '', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '0', '1', 'on', '6.0', '人工充值', '', '1', '2017-11-10 19:48:55');
INSERT INTO `transdetail` VALUES ('c539c82f-c5a4-4862-af93-d7df19ab950c', '00000000000000000304', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '908', '1', 'on', '13.0', '张利', '15974295408', '1', '2017-11-11 13:34:47');
INSERT INTO `transdetail` VALUES ('0200d3c0-c9ce-4efc-8868-e230a83279fb', '00000000000000000305', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '908', '1', 'on', '13.0', '刘华', '13574800962', '1', '2017-11-11 17:55:51');
INSERT INTO `transdetail` VALUES ('c2ea0e73-f6cb-49f7-8347-90a503b5a880', '00000000000000000306', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '908', '1', 'on', '13.0', '张波', '15874212817', '1', '2017-11-11 19:05:07');
INSERT INTO `transdetail` VALUES ('a8d61933-e950-4e97-a891-5b9cd32501ea', '00000000000000000307', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '1138', '1', 'on', '13.0', '陈建民', '17788965126', '1', '2017-11-12 15:56:02');
INSERT INTO `transdetail` VALUES ('8f59ef69-0850-42f3-be1b-a09be4f8a0e3', '00000000000000000308', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '1138', '1', 'on', '13.0', '陈建民', '17788965126', '1', '2017-11-12 15:59:49');
INSERT INTO `transdetail` VALUES ('c1b6b3c8-6fa7-4ccd-8638-7b8325a03c7b', '', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-11-12 20:33:58');
INSERT INTO `transdetail` VALUES ('ccd60014-c864-480d-b94e-43fa0fb4260b', '00000000000000000309', 'oiDYQ08Wi0DkUKDEhN87BqrtPOn8', '1138', '0', 'on', '13.0', '看看', '123', '1', '2017-11-12 22:13:54');
INSERT INTO `transdetail` VALUES ('6bd7e05b-b1f5-45a4-9748-ce3c45e92ded', '00000000000000000310', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1138', '1', 'on', '13.0', '周圣沅家长', '18607358121', '1', '2017-11-13 18:31:15');
INSERT INTO `transdetail` VALUES ('5de70b3d-dabb-4ba4-8bb3-bc63bd5e30da', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '13.0', '人工充值', '', '1', '2017-11-13 18:32:34');
INSERT INTO `transdetail` VALUES ('41663004-d397-44d4-8833-f73721c8debc', '', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-11-13 18:33:46');
INSERT INTO `transdetail` VALUES ('7a7ba7aa-4e42-48dc-af0f-a7dd761433c2', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '5.5', '人工扣费', '', '-1', '2017-11-13 18:36:38');
INSERT INTO `transdetail` VALUES ('54a6daec-2e0d-4db4-a709-4bb49a7799ed', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-11-13 18:42:51');
INSERT INTO `transdetail` VALUES ('bec2197b-842c-422e-b356-bdd720cd68b5', '', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-11-13 19:06:39');
INSERT INTO `transdetail` VALUES ('bae9b4e7-d07e-49a3-ac90-aed151ca3ee1', '', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '0', '1', 'on', '2.0', '人工充值', '', '1', '2017-11-13 19:07:33');
INSERT INTO `transdetail` VALUES ('af0a09b7-4ec1-448e-9bfa-8c977cf1ef9d', '', 'oiDYQ07Jn3_glS3LBerFcurtrvCc', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-11-13 19:14:30');
INSERT INTO `transdetail` VALUES ('d8463542-35d1-44d1-8d30-9abf5158d21a', '00000000000000000311', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '1138', '1', 'on', '13.0', '许二愚', '15367873825', '1', '2017-11-16 20:09:21');
INSERT INTO `transdetail` VALUES ('77f8129f-ad5b-49da-aa86-183d3f49ae4f', '00000000000000000312', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '908', '1', 'on', '13.0', '邓敏', '13875911271', '1', '2017-11-18 09:32:51');
INSERT INTO `transdetail` VALUES ('3da4deb8-b8a3-4ea3-bb41-117fc0ac216a', '', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '0', '1', 'on', '3.0', '人工充值', '', '1', '2017-11-18 16:28:30');
INSERT INTO `transdetail` VALUES ('2502994d-e5c0-4f22-a56c-9e03b48784ae', '00000000000000000313', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '908', '0', 'on', '13.0', '向', '18613371053', '1', '2017-11-20 15:50:11');
INSERT INTO `transdetail` VALUES ('d870b7ca-ea06-4679-b794-76cd43ff8720', '00000000000000000314', 'oiDYQ0wX6BsZfLw5FS8FenLgEIqQ', '908', '0', 'on', '13.0', '向嘉博', '18613371053', '1', '2017-11-20 15:54:23');
INSERT INTO `transdetail` VALUES ('e5373688-c0de-4417-a133-36ae639255e1', '00000000000000000315', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '908', '1', 'on', '13.0', '莫蓉莹', '13975850655', '1', '2017-11-21 21:32:25');
INSERT INTO `transdetail` VALUES ('d27a68b1-59fb-4fcc-b714-4a0295a9f8fb', '00000000000000000316', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '908', '1', 'on', '13.0', '张波', '15874212817', '1', '2017-11-22 12:21:37');
INSERT INTO `transdetail` VALUES ('7d712e17-2ec2-461c-aefa-2c622920146a', '00000000000000000317', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '1138', '1', 'on', '13.0', '文喜玲', '18974192898', '1', '2017-11-22 21:23:24');
INSERT INTO `transdetail` VALUES ('ff3c8fbb-ae2c-4adb-bc7c-305ce49569fd', '00000000000000000318', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '908', '1', 'on', '13.0', '张景岚妈妈', '15274478333', '1', '2017-11-23 08:50:51');
INSERT INTO `transdetail` VALUES ('e32a3168-a408-48f8-8d0f-f8ea5f30d566', '00000000000000000319', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '1138', '1', 'on', '13.0', '谭永林', '18273151646', '1', '2017-11-25 18:00:53');
INSERT INTO `transdetail` VALUES ('70863c4e-ca9f-48f9-b1df-9712004e555c', '00000000000000000320', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '1138', '0', 'on', '13.0', '欧阳少云', '18711182911', '1', '2017-11-26 20:20:12');
INSERT INTO `transdetail` VALUES ('c3dcec2a-f1c9-44bd-8e27-591e2e3a949a', '00000000000000000321', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '1138', '1', 'on', '13.0', '欧阳少云', '18711182911', '1', '2017-11-26 20:21:51');
INSERT INTO `transdetail` VALUES ('0f441766-f824-4eb4-80c3-8aac4b243025', '00000000000000000322', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '0', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-11-30 22:28:39');
INSERT INTO `transdetail` VALUES ('61862ac9-d9bd-47bd-9fe3-0a34b1987e4b', '00000000000000000323', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '0', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-11-30 22:37:52');
INSERT INTO `transdetail` VALUES ('073d6ddd-7c4c-4966-b61d-0b7105b1093c', '00000000000000000324', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '908', '1', 'on', '13.0', '缪珊平', '18807421661', '1', '2017-11-30 22:38:16');
INSERT INTO `transdetail` VALUES ('979d6b37-ddaa-47ab-b8b4-ae35e6d3ec26', '00000000000000000325', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '1138', '1', 'on', '13.0', '龚震', '15989551539', '1', '2017-12-03 13:11:44');
INSERT INTO `transdetail` VALUES ('fe54f94a-c1cb-41ba-94a5-ec7793fb1754', '', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '0', '1', 'on', '1.0', '人工充值', '', '1', '2017-12-03 13:12:49');
INSERT INTO `transdetail` VALUES ('a7a4bf1e-05b1-4b5b-9641-e49a009e501d', '00000000000000000326', 'oiDYQ0-d_42Lm88Og8_F8fzK2p6s', '908', '1', 'on', '13.0', '骆真', '13875848088', '1', '2017-12-04 12:01:37');
INSERT INTO `transdetail` VALUES ('97f94cd0-fb83-44b0-a138-5d0b75fab53e', '00000000000000000327', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '908', '0', 'on', '13.0', '测试', '1558990077', '1', '2017-12-04 13:16:59');
INSERT INTO `transdetail` VALUES ('1db05714-b444-41dd-9d27-3a0e5527d800', '', 'oiDYQ0zPpFk54JVuNdZlfsciQVwk', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-12-08 15:43:18');
INSERT INTO `transdetail` VALUES ('b7faec73-d62a-4fc9-89f5-04e5cbdd83ed', '', 'oiDYQ00uofDI01RQ-AXMBQyPe3dQ', '0', '1', 'on', '22.0', '人工扣费', '', '-1', '2017-12-08 15:48:40');
INSERT INTO `transdetail` VALUES ('679647f1-394b-4502-a0c4-d26db74f8f5c', '', 'oiDYQ0_sYv0kSRtMMN-ZzKW-rRho', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:15:48');
INSERT INTO `transdetail` VALUES ('d338b8be-4d84-4284-b586-a86d4fc9bacf', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:23:01');
INSERT INTO `transdetail` VALUES ('6c2aae69-eadf-4a0c-b301-89b9ddd7b03b', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:23:04');
INSERT INTO `transdetail` VALUES ('9be939a6-9232-4a18-8b56-e7afb9aae7ab', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '6.0', '人工充值', '', '1', '2017-12-10 19:24:39');
INSERT INTO `transdetail` VALUES ('977eb588-e35b-4e36-b3bc-e59a15e3878f', '', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '0', '1', 'on', '25.5', '人工扣费', '', '-1', '2017-12-10 19:28:10');
INSERT INTO `transdetail` VALUES ('03bfbcf4-e16a-481d-a54b-00b640a140c2', '', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '0', '1', 'on', '20.0', '人工扣费', '', '-1', '2017-12-10 19:30:49');
INSERT INTO `transdetail` VALUES ('c6363d6f-aff8-4271-beca-123dccc1c950', '', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '0', '1', 'on', '17.0', '人工扣费', '', '-1', '2017-12-10 19:42:41');
INSERT INTO `transdetail` VALUES ('c0a2dfae-7728-4893-b93c-a6325d9c3bb6', '', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:44:59');
INSERT INTO `transdetail` VALUES ('b2b82bb0-4f1f-44aa-9c65-8a4e37ac57a0', '', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-12-10 19:46:04');
INSERT INTO `transdetail` VALUES ('0121d7df-aa2d-4384-a5f2-cfd565e580fd', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2017-12-10 19:48:12');
INSERT INTO `transdetail` VALUES ('cc30b59f-6004-412b-9277-55e3b27b5c5d', '', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '0', '1', 'on', '9.0', '人工扣费', '', '-1', '2017-12-10 19:48:58');
INSERT INTO `transdetail` VALUES ('fb485751-399c-4fb3-b5bc-4896c2c7c075', '', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2017-12-10 19:49:26');
INSERT INTO `transdetail` VALUES ('f3381a6a-4da2-46dd-ab2f-f8d2588fc7ef', '', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '0', '1', 'on', '38.5', '人工扣费', '', '-1', '2017-12-10 19:50:39');
INSERT INTO `transdetail` VALUES ('0971b096-37e2-48d0-8346-333ae175204c', '', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2017-12-10 19:51:53');
INSERT INTO `transdetail` VALUES ('253dc20a-946b-4c2e-92a6-80f31093d63b', '', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-12-10 19:52:42');
INSERT INTO `transdetail` VALUES ('42de889a-a204-4385-8864-3fc96d18f854', '', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-12-10 19:53:23');
INSERT INTO `transdetail` VALUES ('4fb322d2-ff81-4cc9-91f6-f6805ac7118b', '', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:54:05');
INSERT INTO `transdetail` VALUES ('38acdad2-3295-42a4-8071-962364994a99', '', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:55:46');
INSERT INTO `transdetail` VALUES ('0a3634dd-73ef-4cf2-b596-cbe5570f3e6f', '', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 19:56:12');
INSERT INTO `transdetail` VALUES ('d8a4775b-c1a2-4818-9c13-02b839da1a31', '', 'oiDYQ05HQlqyzMlHGca9TmU7uUZE', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-10 19:59:21');
INSERT INTO `transdetail` VALUES ('cb2a188f-183c-4bda-b0ff-340f87b609f0', '', 'oiDYQ0xrHBjcgA1QpsuHHznQYH3w', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:00:13');
INSERT INTO `transdetail` VALUES ('2b5cc161-4107-45c7-8205-03798dc4330e', '', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '0', '1', 'on', '9.0', '人工扣费', '', '-1', '2017-12-10 20:03:43');
INSERT INTO `transdetail` VALUES ('23e01b8e-b05b-4d18-8ce8-1d741d98b22c', '', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:06:13');
INSERT INTO `transdetail` VALUES ('b5dce316-1540-4652-9529-f7400b977637', '', 'oiDYQ0-vlOikutIv3r5oJhRuENjU', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-10 20:06:33');
INSERT INTO `transdetail` VALUES ('c2bcaa06-9e9b-4f80-8063-62c7ad47d92f', '', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-12-10 20:06:52');
INSERT INTO `transdetail` VALUES ('02435d40-56c8-4cd1-a91f-f6347361a591', '', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '0', '1', 'on', '18.0', '人工扣费', '', '-1', '2017-12-10 20:07:42');
INSERT INTO `transdetail` VALUES ('5ed5851d-c970-4e99-bbf9-133a73cb6581', '', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-12-10 20:08:09');
INSERT INTO `transdetail` VALUES ('8f9607bc-7676-4560-a8db-3942c0414031', '', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-12-10 20:08:33');
INSERT INTO `transdetail` VALUES ('62fedc58-e6a5-40c2-940e-fc0c2e75099b', '', 'oiDYQ0wQtMs5C1W_UVnRXOCLS93g', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-12-10 20:09:13');
INSERT INTO `transdetail` VALUES ('ceddb7aa-cc09-4c27-9112-3ba5ad6f833c', '', 'oiDYQ01Uve31RV607dx4o_t4DqOo', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-12-10 20:09:39');
INSERT INTO `transdetail` VALUES ('dd7ce6d9-a5c4-49b0-a0ff-71d9034bdae4', '', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '0', '1', 'on', '12.0', '人工扣费', '', '-1', '2017-12-10 20:10:05');
INSERT INTO `transdetail` VALUES ('a6ccd069-cc85-41ee-a8f4-3c07dc6ec153', '', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:10:27');
INSERT INTO `transdetail` VALUES ('4825895f-7508-4fe2-9a20-f393a12a43db', '', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-12-10 20:10:44');
INSERT INTO `transdetail` VALUES ('bb8625ff-bd3a-4c2d-a267-d2e1728d5073', '', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '0', '1', 'on', '7.5', '人工扣费', '', '-1', '2017-12-10 20:11:40');
INSERT INTO `transdetail` VALUES ('d468327c-1150-40c3-89a9-ca931100b222', '', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-10 20:12:25');
INSERT INTO `transdetail` VALUES ('03d3977d-f8c6-4930-a7c6-75dfa1f327d6', '', 'oiDYQ07MSdojJeifDrBeddlagQIE', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-12-10 20:14:27');
INSERT INTO `transdetail` VALUES ('8cb74018-dc19-4d82-a3f1-d23a9ce973b6', '', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '0', '1', 'on', '21.0', '人工扣费', '', '-1', '2017-12-10 20:14:59');
INSERT INTO `transdetail` VALUES ('a6d0161f-a5e7-461a-b58c-80bd6d8baac4', '', 'oiDYQ07W9YXcFhYPuN1ykQhN3X8M', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-12-10 20:16:19');
INSERT INTO `transdetail` VALUES ('53775111-1267-4511-b12f-a9fc3bcdd41e', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:16:43');
INSERT INTO `transdetail` VALUES ('f18bbe7c-fba6-49d8-96f0-0367387b1ccf', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2017-12-10 20:17:38');
INSERT INTO `transdetail` VALUES ('7a4877da-d393-419f-9d4c-35abf488a8d1', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '12.0', '人工扣费', '', '-1', '2017-12-10 20:18:01');
INSERT INTO `transdetail` VALUES ('2c978829-8033-458c-857c-c963ad456c7f', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-12-10 20:18:45');
INSERT INTO `transdetail` VALUES ('c816fafd-4d22-4b44-90d3-257698d01608', '', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '0', '1', 'on', '10.5', '人工扣费', '', '-1', '2017-12-10 20:19:05');
INSERT INTO `transdetail` VALUES ('b7b5bd58-c813-4e92-a18a-1ed62171d683', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '23.5', '人工扣费', '', '-1', '2017-12-10 20:19:53');
INSERT INTO `transdetail` VALUES ('74c1789c-a407-463b-bebf-715905b7a903', '', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '0', '1', 'on', '9.0', '人工扣费', '', '-1', '2017-12-10 20:20:32');
INSERT INTO `transdetail` VALUES ('e46f8bc0-b213-41e5-8d24-230fd77f3658', '', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2017-12-10 20:21:51');
INSERT INTO `transdetail` VALUES ('0ec400f0-b973-4110-ad39-03cf96db83fd', '', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-10 20:25:36');
INSERT INTO `transdetail` VALUES ('f639c238-6e0d-4ae0-b8b0-3dcce269e82e', '', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:30:33');
INSERT INTO `transdetail` VALUES ('02405a36-d97c-44f3-9451-2c917bd2b3b0', '', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-10 20:31:05');
INSERT INTO `transdetail` VALUES ('b7e3e253-3e11-442f-b542-123b8034d940', '', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:31:28');
INSERT INTO `transdetail` VALUES ('6c22bf06-4551-43e8-8822-74fe746e056b', '', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2017-12-10 20:31:52');
INSERT INTO `transdetail` VALUES ('5785ebf9-6182-452f-b750-756b543ba6f4', '', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 20:32:20');
INSERT INTO `transdetail` VALUES ('8aedcdc1-ccbb-4477-9a3f-648ff6c9ed04', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '18.0', '人工扣费', '', '-1', '2017-12-10 20:32:44');
INSERT INTO `transdetail` VALUES ('048e65f8-fca1-4811-aa50-a11a3c1225db', '', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2017-12-10 20:34:04');
INSERT INTO `transdetail` VALUES ('c4fe0e6f-736d-4c9f-af12-0631c46a38c1', '', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2017-12-10 20:34:50');
INSERT INTO `transdetail` VALUES ('053c69d3-32c2-4259-8ed8-f15754bd5c02', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2017-12-10 20:36:22');
INSERT INTO `transdetail` VALUES ('cf8d6464-585c-487c-b0d0-9b19057c5788', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2017-12-10 20:39:09');
INSERT INTO `transdetail` VALUES ('22d46924-31ee-406f-ac01-ee67d645bfe3', '', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '0', '1', 'on', '14.5', '人工扣费', '', '-1', '2017-12-10 20:44:27');
INSERT INTO `transdetail` VALUES ('bad6474a-cca4-4820-bffe-d135cad51a97', '', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2017-12-10 21:06:25');
INSERT INTO `transdetail` VALUES ('f31828e3-a329-4ad2-84a6-d9cec615fbd6', '00000000000000000328', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '908', '1', 'on', '13.0', '张波', '15874212817', '1', '2017-12-11 10:03:32');
INSERT INTO `transdetail` VALUES ('a0fab2b8-c40f-4db9-98f2-f269cca00f5a', '00000000000000000329', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '908', '1', 'on', '13.0', '黄初民', '13874538730', '1', '2017-12-12 22:58:45');
INSERT INTO `transdetail` VALUES ('86700bda-e0cc-47c3-a746-b38a305d0e39', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2017-12-13 12:19:41');
INSERT INTO `transdetail` VALUES ('f661a420-92f8-4b0d-a79d-64a908ffdc52', '', 'oiDYQ06UtKdN5pqxXjhkbvH6qe5g', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-13 13:47:45');
INSERT INTO `transdetail` VALUES ('3bd06d38-1e7d-4644-b18e-97eff05ab081', '', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2017-12-13 21:28:21');
INSERT INTO `transdetail` VALUES ('25308301-3b9c-4efb-85b1-13a789c64edc', '00000000000000000330', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '2068', '0', 'on', '30.0', '袁改华', '18975898882', '1', '2017-12-14 17:07:59');
INSERT INTO `transdetail` VALUES ('9e1de751-82ae-40d5-8c62-5e56eb32eda3', '00000000000000000331', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '2068', '1', 'on', '30.0', '袁改华', '18975898882', '1', '2017-12-14 17:08:25');
INSERT INTO `transdetail` VALUES ('afe77272-fc8e-448a-9814-9ebaf3e9de20', '00000000000000000332', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '908', '1', 'on', '13.0', '凌力涵', '15907387929', '1', '2017-12-16 06:00:25');
INSERT INTO `transdetail` VALUES ('8072146d-dd3c-4b3c-9abb-6930f2d2623f', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2017-12-16 15:49:17');
INSERT INTO `transdetail` VALUES ('b0335e9e-eebc-486a-ade2-9a95609b9b32', '00000000000000000333', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '2600', '1', 'on', '30.0', '李钰婷', '15388981830', '1', '2017-12-17 22:20:05');
INSERT INTO `transdetail` VALUES ('63ca877c-1c9c-418b-a500-0a087f1ad28a', '00000000000000000334', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '908', '1', 'on', '13.0', '彭卿钰j', '13278898952', '1', '2017-12-19 16:58:26');
INSERT INTO `transdetail` VALUES ('97b94b03-3d6e-4bda-bcb6-a4c89c965402', '00000000000000000335', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '908', '1', 'on', '13.0', '梁洪俊', '13378012713', '1', '2017-12-22 06:11:55');
INSERT INTO `transdetail` VALUES ('dd061924-c997-452a-9491-f7e7c5b7511c', '00000000000000000336', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2600', '0', 'on', '30.0', '李娜', '13874996056', '1', '2017-12-26 19:54:39');
INSERT INTO `transdetail` VALUES ('07e14c54-388d-45a0-ac4f-f46d8a914253', '00000000000000000337', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '2600', '1', 'on', '30.0', '李娜', '13874996056', '1', '2017-12-26 19:54:47');
INSERT INTO `transdetail` VALUES ('cece42d1-bc3e-4ffb-8091-0bc20920cc75', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '2.0', '人工充值', '', '1', '2017-12-27 21:55:26');
INSERT INTO `transdetail` VALUES ('c2c31c6c-b42f-47a5-ab23-ad474e6edbeb', '00000000000000000338', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '2068', '0', 'on', '30.0', '段智慧', '13875989929', '1', '2017-12-27 23:55:45');
INSERT INTO `transdetail` VALUES ('5f6c96dd-d0fd-485a-afb9-91a52775105e', '00000000000000000339', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '2068', '0', 'on', '30.0', '段智慧', '13875989929', '1', '2017-12-27 23:56:16');
INSERT INTO `transdetail` VALUES ('3df7667c-632d-4dc7-ae7f-c73afa5b4190', '00000000000000000340', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '2600', '1', 'on', '30.0', '段智慧', '13875989929', '1', '2017-12-28 08:37:27');
INSERT INTO `transdetail` VALUES ('47c562de-bdad-4642-8742-9a932b426f0a', '00000000000000000341', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '908', '1', 'on', '13.0', '刘红云', '18975891038', '1', '2017-12-28 18:27:10');
INSERT INTO `transdetail` VALUES ('822b8285-58ee-4959-92e6-747d05a86d9d', '00000000000000000342', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '908', '1', 'on', '13.0', '喻宏波', '13707498722', '1', '2017-12-30 15:53:47');
INSERT INTO `transdetail` VALUES ('9abf493d-a3b0-4a14-8a21-c4709b1098eb', '00000000000000000343', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1055', '0', 'on', '15.0', '你和', '15580830349', '1', '2017-12-31 11:23:09');
INSERT INTO `transdetail` VALUES ('949a9d7d-51e2-4198-a68f-bec0e6c3be18', '', 'oiDYQ0yR4AQypO1c84JksPXmwJ8I', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2018-01-03 10:18:06');
INSERT INTO `transdetail` VALUES ('602a0a76-3ecc-46a0-b71c-43e3301fef80', '00000000000000000344', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1055', '0', 'on', '15.0', '大的', '1246', '1', '2018-01-09 12:33:26');
INSERT INTO `transdetail` VALUES ('950355ce-c9f0-4fa1-b447-89c1a12850fc', '00000000000000000345', 'oiDYQ04RQy_OB10iMv3pA7M106qE', '1055', '0', 'on', '15.0', '大的', '1246', '1', '2018-01-09 12:33:44');
INSERT INTO `transdetail` VALUES ('650ba51a-b271-4019-8d26-a43b948de7d4', '00000000000000000346', 'oiDYQ09bQiuiMWekt3Ral2J-3cq4', '6735', '0', 'on', '80.0', '真实性', '15656608888', '1', '2018-01-14 06:43:12');
INSERT INTO `transdetail` VALUES ('2552af34-c53f-4105-a22c-a7cb010c36e7', '00000000000000000347', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '1055', '1', 'on', '15.0', '刘红云', '18975891038', '1', '2018-01-14 12:16:00');
INSERT INTO `transdetail` VALUES ('d561603f-f854-422e-bc45-b98fa5703740', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:30:26');
INSERT INTO `transdetail` VALUES ('3cef0bb3-7ce8-4631-8b4a-985d992e21b0', '', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '0', '1', 'on', '16.0', '人工扣费', '', '-1', '2018-01-14 14:31:33');
INSERT INTO `transdetail` VALUES ('fe27ae3d-513f-43aa-b22e-02597d6b48a5', '', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-01-14 14:32:09');
INSERT INTO `transdetail` VALUES ('73d85929-4bc3-4900-936f-778f4ec75d42', '', 'oiDYQ0xi4Xabj6q9t6I5SnZnmb10', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-01-14 14:32:59');
INSERT INTO `transdetail` VALUES ('a1b50368-4aeb-4920-b4ca-351800b0b4ef', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-14 14:33:55');
INSERT INTO `transdetail` VALUES ('51850bd0-529e-4b5d-95b2-bdbb7b5628e7', '', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:34:14');
INSERT INTO `transdetail` VALUES ('6e922328-1ee2-4321-b5b8-8a893161080d', '', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '0', '1', 'on', '16.0', '人工扣费', '', '-1', '2018-01-14 14:35:24');
INSERT INTO `transdetail` VALUES ('1fe60745-528d-4410-9e0d-b8b85109c016', '', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '0', '1', 'on', '10.0', '人工充值', '', '1', '2018-01-14 14:36:20');
INSERT INTO `transdetail` VALUES ('44bf1a02-452e-4755-892b-69b7697896f1', '', 'oiDYQ0__Zd7YkHhcxN3mRyvmje1M', '0', '1', 'on', '20.0', '人工扣费', '', '-1', '2018-01-14 14:36:39');
INSERT INTO `transdetail` VALUES ('88a1ca64-2c9a-4655-8267-7c5a90135223', '', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-14 14:37:12');
INSERT INTO `transdetail` VALUES ('259835ca-5791-4cf1-94bc-7da0888f933f', '', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '0', '1', 'on', '30.0', '人工扣费', '', '-1', '2018-01-14 14:37:48');
INSERT INTO `transdetail` VALUES ('61020700-3fc2-4875-b290-0ba477a5e264', '', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:38:28');
INSERT INTO `transdetail` VALUES ('ee8ce321-93b8-4760-ae8d-cbbb472bc0ba', '', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:39:40');
INSERT INTO `transdetail` VALUES ('29f1070c-7a2f-4878-bb18-f44c90db8bab', '', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:40:06');
INSERT INTO `transdetail` VALUES ('b418584e-d4f0-4314-b324-a44200453b2e', '', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-14 14:41:38');
INSERT INTO `transdetail` VALUES ('0bfd83eb-adc3-4a9b-a995-47b5921be20f', '', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-14 14:42:28');
INSERT INTO `transdetail` VALUES ('e00e71ca-0776-4a38-ae86-d592c83abe81', '', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-14 14:43:11');
INSERT INTO `transdetail` VALUES ('affed5ab-0f60-4299-8b31-30c45b2357d2', '', 'oiDYQ0-d_42Lm88Og8_F8fzK2p6s', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:44:07');
INSERT INTO `transdetail` VALUES ('026ffa0f-dede-48ef-aed5-c57e26c20cf9', '', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:44:52');
INSERT INTO `transdetail` VALUES ('91516a94-d947-4730-a470-6e684bdb9ea6', '', 'oiDYQ00s7-mh45vNt8yKkSnRs_S4', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:46:19');
INSERT INTO `transdetail` VALUES ('2fcb4d26-ea06-45ea-a9bd-b901150bb521', '', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:46:47');
INSERT INTO `transdetail` VALUES ('da423bd3-c034-4674-86cd-84e2214e63c6', '', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '0', '1', 'on', '18.5', '人工扣费', '', '-1', '2018-01-14 14:47:32');
INSERT INTO `transdetail` VALUES ('e619dc74-54b1-40db-a604-888da6f7bcdb', '', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:48:15');
INSERT INTO `transdetail` VALUES ('68c56d37-8069-4cf8-8880-e96162836a42', '', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:48:44');
INSERT INTO `transdetail` VALUES ('e2294941-faea-4d9c-b641-0f249a19082e', '', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '0', '1', 'on', '22.0', '人工扣费', '', '-1', '2018-01-14 14:49:47');
INSERT INTO `transdetail` VALUES ('e56f39e0-1c0a-47f5-a80d-012462749565', '', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-01-14 14:50:12');
INSERT INTO `transdetail` VALUES ('30909e46-ffb3-402c-8b68-8799cd28091a', '', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-01-14 14:50:32');
INSERT INTO `transdetail` VALUES ('3fe19646-6e4a-42ef-abb5-8dee73a35e08', '', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '0', '1', 'on', '11.5', '人工扣费', '', '-1', '2018-01-14 14:51:09');
INSERT INTO `transdetail` VALUES ('7771ff18-fe0f-4345-9a00-75ed684243e8', '', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '0', '1', 'on', '3.5', '人工扣费', '', '-1', '2018-01-14 14:51:55');
INSERT INTO `transdetail` VALUES ('036b946b-a152-41bb-90e2-83db345256e5', '', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '0', '1', 'on', '17.5', '人工扣费', '', '-1', '2018-01-14 14:53:39');
INSERT INTO `transdetail` VALUES ('4186c89d-b03d-4155-bfbf-51dff22f9dda', '', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:54:48');
INSERT INTO `transdetail` VALUES ('4603ec2c-aa13-4add-8ec7-6cdac87577fc', '', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-01-14 14:56:39');
INSERT INTO `transdetail` VALUES ('69b680d5-b04c-47ba-a4e8-60950aed9694', '', 'oiDYQ0z0KHJVEyyVjbJ934RhNdec', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2018-01-14 14:57:01');
INSERT INTO `transdetail` VALUES ('56199798-f18b-431c-9c45-e79deccc402d', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:57:46');
INSERT INTO `transdetail` VALUES ('c0f35189-a032-46a7-b5c8-7f89171bb0ea', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 14:58:07');
INSERT INTO `transdetail` VALUES ('1b4b590c-b176-402b-ae32-8deb0d29ba5e', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-01-14 14:58:54');
INSERT INTO `transdetail` VALUES ('ba2760e8-85c1-4857-95c2-7a71ca1ddf21', '', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '0', '1', 'on', '8.5', '人工扣费', '', '-1', '2018-01-14 14:59:13');
INSERT INTO `transdetail` VALUES ('12e21a1b-1bca-47c2-be70-0cbe586e9c88', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '16.5', '人工扣费', '', '-1', '2018-01-14 14:59:59');
INSERT INTO `transdetail` VALUES ('f375278e-357e-4aff-8cd4-56470ae3e93f', '', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '0', '1', 'on', '12.0', '人工扣费', '', '-1', '2018-01-14 15:00:37');
INSERT INTO `transdetail` VALUES ('7d19c2c3-a6a1-49bd-84b1-bf991854aaa2', '', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2018-01-14 15:01:19');
INSERT INTO `transdetail` VALUES ('19d485ff-b906-4ba9-9645-2ebab3af23e1', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '26.0', '人工扣费', '', '-1', '2018-01-14 15:01:48');
INSERT INTO `transdetail` VALUES ('c122c6da-72f2-4636-b142-253aa678017d', '', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 15:02:24');
INSERT INTO `transdetail` VALUES ('559a891c-308c-47cd-8d18-cd0b6f0da9c3', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 15:03:31');
INSERT INTO `transdetail` VALUES ('4fb4d5cf-2432-4467-83d2-ffea4bcfebd8', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 15:03:36');
INSERT INTO `transdetail` VALUES ('518dc186-48f0-4f66-9604-26031942ad56', '', 'oiDYQ02P6_RdV_AwBp19dHaZDxM8', '0', '1', 'on', '8.0', '人工充值', '', '1', '2018-01-14 15:03:54');
INSERT INTO `transdetail` VALUES ('0661891e-7746-416c-b698-72487f80e2d3', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '12.0', '人工扣费', '', '-1', '2018-01-14 15:04:18');
INSERT INTO `transdetail` VALUES ('84c10afa-6a50-4278-b38a-111020d67023', '', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-01-14 15:04:45');
INSERT INTO `transdetail` VALUES ('8d246d76-1679-436f-aa12-21ffd6bee122', '', 'oiDYQ00SHlm9q6u8pfyoTixw-SD4', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2018-01-14 15:05:49');
INSERT INTO `transdetail` VALUES ('ab23da02-2882-459d-827e-ae5929d3bf0f', '', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-14 15:06:23');
INSERT INTO `transdetail` VALUES ('fb63d1d7-a77a-4891-9a82-d82cddc3b16f', '', 'oiDYQ01MKFX7sn40-qlPEEE1-Zaw', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-14 15:07:19');
INSERT INTO `transdetail` VALUES ('ff8eb914-73e1-45c4-8468-caed1157076f', '', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '0', '1', 'on', '14.0', '人工扣费', '', '-1', '2018-01-14 15:07:41');
INSERT INTO `transdetail` VALUES ('fe1ba87f-392e-424a-b162-4a1d05a79758', '', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-14 15:08:33');
INSERT INTO `transdetail` VALUES ('fec82ea6-a3c6-4d82-af51-e86e7b70fe93', '', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '0', '1', 'on', '7.5', '人工扣费', '', '-1', '2018-01-14 15:09:02');
INSERT INTO `transdetail` VALUES ('5acf301a-d4ba-4de6-b8d7-aa8d9a6bc37d', '', 'oiDYQ0-vlOikutIv3r5oJhRuENjU', '0', '1', 'on', '9.0', '人工扣费', '', '-1', '2018-01-14 15:09:35');
INSERT INTO `transdetail` VALUES ('c9b52b4f-28f7-459e-8b5d-cf24ed0453c6', '', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '0', '1', 'on', '9.0', '人工扣费', '', '-1', '2018-01-14 15:09:59');
INSERT INTO `transdetail` VALUES ('ecd77d53-9973-4495-b819-79ffc9abd512', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '30.0', '人工扣费', '', '-1', '2018-01-14 15:10:19');
INSERT INTO `transdetail` VALUES ('175f96ad-13a4-4563-8b34-cf2ec5c14344', '', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-14 15:11:03');
INSERT INTO `transdetail` VALUES ('0b1c9aef-6e66-4ffb-ba14-57cc245bd463', '', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2018-01-14 19:21:41');
INSERT INTO `transdetail` VALUES ('b11e9884-58c7-4a4a-a37b-dffcd1502c5d', '00000000000000000348', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '1055', '1', 'on', '15.0', '梁静华', '13975200436', '1', '2018-01-14 22:17:32');
INSERT INTO `transdetail` VALUES ('f30e9ae7-fbf3-4ca9-a4de-fadf65602166', '00000000000000000349', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '1055', '1', 'on', '15.0', '张波', '15874212817', '1', '2018-01-15 16:09:22');
INSERT INTO `transdetail` VALUES ('6c25b01d-db7f-4727-9ca2-90187e9ab69c', '00000000000000000350', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '1055', '1', 'on', '15.0', '付玉芳', '18670015918', '1', '2018-01-16 11:59:50');
INSERT INTO `transdetail` VALUES ('2702ebb2-537b-45d0-a96c-0f5ed7dc701d', '00000000000000000351', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '1055', '1', 'on', '15.0', '李雄', '13908468618', '1', '2018-01-20 08:24:26');
INSERT INTO `transdetail` VALUES ('adccb3d5-49e3-4511-ab52-b18b15f64469', '00000000000000000352', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '1055', '1', 'on', '15.0', '彭卿钰', '13278898952', '1', '2018-01-22 10:52:30');
INSERT INTO `transdetail` VALUES ('2a4ceb4d-8d3c-4ace-8a56-757af5cfbd46', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '15.0', '人工充值', '', '1', '2018-01-22 11:57:37');
INSERT INTO `transdetail` VALUES ('562b737a-d096-4554-8843-53e74f1b2c84', '00000000000000000353', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '1314', '1', 'on', '15.0', '李宜珍妈妈', '15367873825', '1', '2018-01-24 14:00:04');
INSERT INTO `transdetail` VALUES ('24ff0423-5c7c-46b1-8fe9-77009c81a3e2', '00000000000000000354', 'oiDYQ09f3umVMPE7giAWka1GOdWc', '1055', '0', 'on', '15.0', '15', '13244556666', '1', '2018-01-27 00:01:27');
INSERT INTO `transdetail` VALUES ('c05ac436-a586-493b-84eb-3b8e4f619b84', '', 'oiDYQ0685DYtrHJ7nerV-RgiXnpk', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 16:47:15');
INSERT INTO `transdetail` VALUES ('66fa8d07-511e-4153-9024-4993b407d24f', '', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 16:51:41');
INSERT INTO `transdetail` VALUES ('5bfa9e87-ddb5-4c40-8c2c-af67539c23fa', '', 'oiDYQ06rNzszOrQcGdvpq9gD2D-Q', '0', '1', 'on', '39.0', '人工扣费', '', '-1', '2018-01-28 16:54:19');
INSERT INTO `transdetail` VALUES ('60b3fce4-e281-4b7a-a353-ff317d04533b', '', 'oiDYQ017uj72LXQrGABRBHI3z85k', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 16:59:58');
INSERT INTO `transdetail` VALUES ('3ca2fb6a-0dbd-4953-82cd-52fd07539b2a', '', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '0', '1', 'on', '11.0', '人工扣费', '', '-1', '2018-01-28 17:01:53');
INSERT INTO `transdetail` VALUES ('c3ef18c1-8a58-437f-9985-fb201fa3e5f2', '', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 17:06:43');
INSERT INTO `transdetail` VALUES ('d2f9f86f-0dc4-40e2-b571-f3f0881c5200', '', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 17:08:33');
INSERT INTO `transdetail` VALUES ('4251c92d-3338-4be4-8467-d2670641282c', '', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 17:10:13');
INSERT INTO `transdetail` VALUES ('72af3845-a1bf-477b-8f0f-91532fa3676e', '', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2018-01-28 17:11:35');
INSERT INTO `transdetail` VALUES ('a719fbf5-9103-4cb8-a1f6-ad491d60af33', '', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '0', '1', 'on', '18.0', '人工扣费', '', '-1', '2018-01-28 17:18:34');
INSERT INTO `transdetail` VALUES ('5ab71f0a-3db8-4564-897e-e3cf9fff0f93', '', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 17:20:01');
INSERT INTO `transdetail` VALUES ('57c7bb34-751b-4285-8f8d-3b25cc2115dd', '', 'oiDYQ0-0HMwVL1RrVQD-llPAF2ws', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2018-01-28 17:22:17');
INSERT INTO `transdetail` VALUES ('9367a8ae-36d4-4dbb-b6df-6ac7428ccd53', '', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 17:23:27');
INSERT INTO `transdetail` VALUES ('56df7df5-3cb9-47df-b6c9-4f76453d1eb7', '', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-28 17:27:42');
INSERT INTO `transdetail` VALUES ('cd5a9e81-1797-4aee-9394-94e1abc952ad', '', 'oiDYQ03Vd346e82SXNKbwJoMKyMk', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 17:34:01');
INSERT INTO `transdetail` VALUES ('a45d16a1-48c6-4f71-bea0-0e589ae050e6', '', 'oiDYQ0_dtBrvFRFXeFuAVSdUFfjI', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 17:48:20');
INSERT INTO `transdetail` VALUES ('2614efb3-8848-4d1e-93d3-26a4506972b1', '', 'oiDYQ03XoovwhDqmo19kIpwx8NOI', '0', '1', 'on', '9.5', '人工充值', '', '1', '2018-01-28 17:51:16');
INSERT INTO `transdetail` VALUES ('3dbefe52-f9da-47a1-8d38-5b18c4583cca', '', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 17:52:25');
INSERT INTO `transdetail` VALUES ('b3f926b9-c03e-46fd-a245-162e551a7fc4', '', 'oiDYQ0zFwjRUE_VSL8egpiRTEheY', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-28 17:56:06');
INSERT INTO `transdetail` VALUES ('3a88e7a9-f4f0-48b7-92b1-4960a45db3b2', '', 'oiDYQ03WX3fU8xS-jfXzAFIjY9fE', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 18:07:20');
INSERT INTO `transdetail` VALUES ('821d4ea3-64d3-421e-8690-901fe2275b11', '', 'oiDYQ0wqcWBWlEMwMwoDt5VjQPUM', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 18:10:25');
INSERT INTO `transdetail` VALUES ('dd5ff8ff-8c03-450a-a9c9-d7eaa1ff69a0', '', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-28 18:13:06');
INSERT INTO `transdetail` VALUES ('221858c4-1e42-4ca8-a389-95f8420c97a6', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-01-28 18:13:51');
INSERT INTO `transdetail` VALUES ('f719555a-e233-432f-beb4-cd0277eeb43a', '', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2018-01-28 18:17:16');
INSERT INTO `transdetail` VALUES ('85399a02-1c6f-4dab-a144-0d1829276ba9', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 18:20:11');
INSERT INTO `transdetail` VALUES ('738eeeaa-f722-4b42-8d9d-3dd4de9701ff', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 18:20:55');
INSERT INTO `transdetail` VALUES ('27421bb3-8401-4a55-baec-637bb19c86f6', '', 'oiDYQ028n2Nvm5BoYIeSseSzgqwU', '0', '1', 'on', '3.5', '人工扣费', '', '-1', '2018-01-28 18:22:01');
INSERT INTO `transdetail` VALUES ('30424f5c-100e-4ef8-87ef-62641d374281', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '11.5', '人工扣费', '', '-1', '2018-01-28 18:23:14');
INSERT INTO `transdetail` VALUES ('5cb101e4-ae84-48fe-8cba-3ca49e55a823', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 18:24:23');
INSERT INTO `transdetail` VALUES ('2ce3f151-37f5-4301-a981-0c70cf001e99', '', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-01-28 18:26:29');
INSERT INTO `transdetail` VALUES ('4ee1d395-f105-4490-88c0-93f6dd076887', '', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-01-28 18:27:41');
INSERT INTO `transdetail` VALUES ('c4ee88b6-c742-4cb4-b921-8df539eb45bd', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-01-28 18:33:02');
INSERT INTO `transdetail` VALUES ('d18838c0-ae70-4175-b49e-ade0ee825738', '', 'oiDYQ0-d_42Lm88Og8_F8fzK2p6s', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2018-01-30 17:42:16');
INSERT INTO `transdetail` VALUES ('ef375e56-da30-4f95-9685-f73067008ce8', '00000000000000000355', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '2068', '1', 'on', '30.0', '杨润芳', '18229975254', '1', '2018-01-31 21:57:14');
INSERT INTO `transdetail` VALUES ('67cd060f-77ae-4d20-a60a-04ec6903ba91', '', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-02-04 13:10:46');
INSERT INTO `transdetail` VALUES ('0016e71e-ad88-4678-8e5f-de8821fddc9e', '', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '0', '1', 'on', '27.0', '人工扣费', '', '-1', '2018-02-04 13:11:49');
INSERT INTO `transdetail` VALUES ('80c6c379-2c8f-4ae1-950b-ab07390a470b', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-02-04 14:19:58');
INSERT INTO `transdetail` VALUES ('86c5d791-69c8-4db9-9a64-ff677af6181a', '', 'oiDYQ06-JqTwcyYm_ibK09F4cPBY', '0', '1', 'on', '13.0', '人工充值', '', '1', '2018-02-04 14:20:52');
INSERT INTO `transdetail` VALUES ('baba8a6f-5bc9-4aa5-a008-7f15c392533b', '', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '0', '1', 'on', '8.0', '人工扣费', '', '-1', '2018-02-04 14:25:56');
INSERT INTO `transdetail` VALUES ('74a5ce0d-4d9c-4ac7-b656-b2cb3093932c', '', 'oiDYQ0zdv_iTned3z_sgsXItPBcY', '0', '1', 'on', '5.0', '人工充值', '', '1', '2018-02-04 14:29:14');
INSERT INTO `transdetail` VALUES ('0e0727c4-b515-4244-9cb5-382ae9406253', '', 'oiDYQ0050iJgTy3uB1BYpiPoaFr4', '0', '1', 'on', '1.0', '人工充值', '', '1', '2018-02-04 14:32:34');
INSERT INTO `transdetail` VALUES ('2cb987fd-a966-4c3a-ad93-8d4b8b331d39', '', 'oiDYQ01kFnFc8ayGkKfjd4T3_iV8', '0', '1', 'on', '22.5', '人工充值', '', '1', '2018-02-04 14:33:34');
INSERT INTO `transdetail` VALUES ('0890ec1a-e0c3-4602-a1cd-8ca93e1f74a9', '', 'oiDYQ05Dy5rcYJZkYmSdKwWHOHuM', '0', '1', 'on', '2.0', '人工充值', '', '1', '2018-02-04 14:33:58');
INSERT INTO `transdetail` VALUES ('351b7f51-8442-46be-962a-14796367e4e6', '', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '0', '1', 'on', '17.5', '人工扣费', '', '-1', '2018-02-04 14:37:52');
INSERT INTO `transdetail` VALUES ('47f582f7-9381-4aa8-9740-955048c00c55', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-02-04 14:41:00');
INSERT INTO `transdetail` VALUES ('07b69a6f-2978-424b-94a5-bde12a0061f9', '', 'oiDYQ01AqrDgXdccSS_km8D7DutM', '0', '1', 'on', '3.5', '人工充值', '', '1', '2018-02-04 14:41:34');
INSERT INTO `transdetail` VALUES ('1b2ed638-3971-4c80-abc0-5a7dd933c9a2', '', 'oiDYQ0yXYR5ls0_6WWf403mHEQX8', '0', '1', 'on', '4.0', '人工充值', '', '1', '2018-02-04 14:42:25');
INSERT INTO `transdetail` VALUES ('43b4f094-c69e-4394-a284-e4814dae3db7', '', 'oiDYQ0zEvm_wGub7bLfuHask-MeI', '0', '1', 'on', '3.0', '人工充值', '', '1', '2018-02-04 14:42:50');
INSERT INTO `transdetail` VALUES ('3bc6d717-ae4a-4307-ba62-a17140210964', '', 'oiDYQ00SUrdUcMn7cxlTC60S5Svg', '0', '1', 'on', '35.0', '人工充值', '', '1', '2018-02-04 14:45:23');
INSERT INTO `transdetail` VALUES ('af0ab298-2afb-4841-ac1d-4ab14ec0eaee', '00000000000000000356', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '1055', '1', 'on', '15.0', '刘红云', '18975891038', '1', '2018-02-04 16:52:59');
INSERT INTO `transdetail` VALUES ('c5e505be-bdb1-4405-a814-af99bbd583c9', '00000000000000000357', null, '1055', '0', 'on', '15.0', '好纠结', '101001879', '1', '2018-02-08 11:22:37');
INSERT INTO `transdetail` VALUES ('6a3d3395-836b-4cd5-abc2-69d47938ee6f', '00000000000000000358', null, '1055', '0', 'on', '15.0', '好纠结', '101001879', '1', '2018-02-08 11:22:44');
INSERT INTO `transdetail` VALUES ('25ae1523-4533-4e61-9cda-26dd39b4ed8c', '00000000000000000359', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:53:56');
INSERT INTO `transdetail` VALUES ('95939117-0b98-404a-b94c-7aec03ba42b3', '00000000000000000360', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:53:59');
INSERT INTO `transdetail` VALUES ('af0f0e39-affe-48f7-9b8f-35b16a885581', '00000000000000000361', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:01');
INSERT INTO `transdetail` VALUES ('03d4af77-25ff-4e97-a7c1-39a00d238931', '00000000000000000362', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('46c992c2-76a7-46c6-9ae6-87695f4ce7b6', '00000000000000000363', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('9508771b-5b50-438e-856d-ac53cb6dce04', '00000000000000000364', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('729540ac-e669-4eba-bf96-cd65f30a52e8', '00000000000000000365', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('f94bc525-9aa8-45fa-8cb2-004de32ea7a1', '00000000000000000366', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('cc94768b-ba13-49df-821b-e128218fc0b4', '00000000000000000367', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('9f637985-fc72-4674-81a7-d3347b0bdf14', '00000000000000000368', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:03');
INSERT INTO `transdetail` VALUES ('d94e0f2e-9762-49d7-a2ec-c7eec3fc2f37', '00000000000000000369', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:04');
INSERT INTO `transdetail` VALUES ('d9abbe2a-39a7-4a6b-90ca-007ad087e8ef', '00000000000000000370', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:05');
INSERT INTO `transdetail` VALUES ('996bd98b-e136-48cc-ac7b-3db78633779c', '00000000000000000371', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:05');
INSERT INTO `transdetail` VALUES ('56b61de0-a446-475a-84ed-fba336b4734d', '00000000000000000372', null, '1055', '0', 'on', '15.0', '测试', '15580063649', '1', '2018-02-12 14:54:05');
INSERT INTO `transdetail` VALUES ('58e358cd-e9ae-4119-96f5-ad4314bbe3cf', '00000000000000000373', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:14');
INSERT INTO `transdetail` VALUES ('546bea3c-336d-4eaf-87d5-bd7a674bd24e', '00000000000000000374', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:15');
INSERT INTO `transdetail` VALUES ('bedd9add-7097-4b6a-84fa-89a8b470c8b1', '00000000000000000375', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:16');
INSERT INTO `transdetail` VALUES ('965a087b-99b4-45aa-951a-2a61c98aa111', '00000000000000000376', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:16');
INSERT INTO `transdetail` VALUES ('4ca0f818-1713-437d-aadd-b9ae032271db', '00000000000000000377', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:16');
INSERT INTO `transdetail` VALUES ('9ed355a0-5cbe-4a98-bc9d-bb1fd74f38e6', '00000000000000000378', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:16');
INSERT INTO `transdetail` VALUES ('308680bd-08f4-41f5-bd8c-61234032d3b3', '00000000000000000379', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:16');
INSERT INTO `transdetail` VALUES ('bef09715-dbb7-423c-aa66-32c6426bd3f1', '00000000000000000380', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:17');
INSERT INTO `transdetail` VALUES ('ffd33455-96e9-44a9-a7a4-7d2db507f258', '00000000000000000381', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:17');
INSERT INTO `transdetail` VALUES ('706fffb8-c6aa-4ae9-b3ec-196a0e2036a0', '00000000000000000382', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:17');
INSERT INTO `transdetail` VALUES ('f4b0ef13-d74f-416b-b87a-b563cfb8c4b3', '00000000000000000383', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:18');
INSERT INTO `transdetail` VALUES ('e398f71d-d3a5-438e-b6f3-7ae1d1d8d65d', '00000000000000000384', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:18');
INSERT INTO `transdetail` VALUES ('d69fd9f3-107d-4b00-aae1-e44fb257d9ca', '00000000000000000385', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:18');
INSERT INTO `transdetail` VALUES ('d2360c8b-22b7-4c02-9a6a-dc600a0edd15', '00000000000000000386', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:19');
INSERT INTO `transdetail` VALUES ('5df876f3-432b-4778-b765-0de1c3abb823', '00000000000000000387', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:19');
INSERT INTO `transdetail` VALUES ('ea0982aa-efd9-4750-9011-05c62d89eddf', '00000000000000000388', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:19');
INSERT INTO `transdetail` VALUES ('015d4c8e-5c0e-4a88-b836-362cd992889c', '00000000000000000389', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:19');
INSERT INTO `transdetail` VALUES ('b21f7e0d-0af0-458d-8805-0f7853387b3b', '00000000000000000390', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:20');
INSERT INTO `transdetail` VALUES ('e103cc2d-8611-4065-b9d4-c7ce5b07679d', '00000000000000000391', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:20');
INSERT INTO `transdetail` VALUES ('49c0e84e-7c8d-464d-a2d0-dbed7cd09e8c', '00000000000000000392', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:20');
INSERT INTO `transdetail` VALUES ('9f23ab37-5d77-480d-ac70-aaba02e0992a', '00000000000000000393', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:20');
INSERT INTO `transdetail` VALUES ('2f03587b-fd75-41ca-a9ad-0b9cf87ef35a', '00000000000000000394', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:21');
INSERT INTO `transdetail` VALUES ('c5a615ee-6b31-4a58-abad-72d6f2a89e5f', '00000000000000000395', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:21');
INSERT INTO `transdetail` VALUES ('27c3c47d-a838-4ed8-8554-d5b01c9b325b', '00000000000000000396', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:21');
INSERT INTO `transdetail` VALUES ('e944b993-2f51-45ce-9ceb-1e3aa4ee83d5', '00000000000000000397', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:21');
INSERT INTO `transdetail` VALUES ('a1f3ec4b-50e6-4d08-8ac5-c44279c771e0', '00000000000000000398', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:21');
INSERT INTO `transdetail` VALUES ('b3866a99-e5c0-4ecc-b158-648dc4920288', '00000000000000000399', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:21');
INSERT INTO `transdetail` VALUES ('37c80b10-d816-4fa2-af84-87f22d43fdaf', '00000000000000000400', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:22');
INSERT INTO `transdetail` VALUES ('73616fbf-027e-43a9-a2f4-c8c18607abea', '00000000000000000401', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:22');
INSERT INTO `transdetail` VALUES ('1373b09f-a6e7-4be7-b80e-c4dab1bc4f1e', '00000000000000000402', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:22');
INSERT INTO `transdetail` VALUES ('c797e639-63ff-4cb0-bc35-552370b437dc', '00000000000000000403', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:23');
INSERT INTO `transdetail` VALUES ('3796c91f-117a-420e-b9b8-3f49d1146904', '00000000000000000404', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:23');
INSERT INTO `transdetail` VALUES ('ccfc3c44-2f88-4a47-880a-917b85b16fe0', '00000000000000000405', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:23');
INSERT INTO `transdetail` VALUES ('629b0da0-e786-4a8d-a801-5f07fc0d41c7', '00000000000000000406', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:24');
INSERT INTO `transdetail` VALUES ('a4144888-f585-4900-b820-d9ab0d42c9f9', '00000000000000000407', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:24');
INSERT INTO `transdetail` VALUES ('77066e4b-e25e-4549-813e-7ed850f1e722', '00000000000000000408', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:24');
INSERT INTO `transdetail` VALUES ('35086419-d179-4923-9fe0-80b77cb68d09', '00000000000000000409', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:24');
INSERT INTO `transdetail` VALUES ('8358e492-f846-49a7-8487-8fa230751ee3', '00000000000000000410', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:24');
INSERT INTO `transdetail` VALUES ('6f4909cf-51be-451c-ab02-6363b5ad70b4', '00000000000000000411', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:24');
INSERT INTO `transdetail` VALUES ('89aed37f-4e16-4b61-b62a-53ce22a5ab1b', '00000000000000000412', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:25');
INSERT INTO `transdetail` VALUES ('975f3ed2-a27a-4164-b2b3-f4bb42cfd5c2', '00000000000000000413', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:25');
INSERT INTO `transdetail` VALUES ('6fb701b6-0154-418c-9c98-cd42b217236f', '00000000000000000414', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:25');
INSERT INTO `transdetail` VALUES ('6accab85-baa9-4c63-9e8a-9b02f497d17b', '00000000000000000415', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:25');
INSERT INTO `transdetail` VALUES ('da6b9695-a669-4015-ad27-d5647d6f8f8f', '00000000000000000416', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:25');
INSERT INTO `transdetail` VALUES ('c4f180d8-7933-4de8-863b-a0def9145aa0', '00000000000000000417', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:25');
INSERT INTO `transdetail` VALUES ('ae0f3a5b-f58a-4b1b-a9a9-e78f3f8da0fa', '00000000000000000418', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:26');
INSERT INTO `transdetail` VALUES ('fd3a659b-f6ba-4328-8f7f-bf8e27e8f0e5', '00000000000000000419', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:26');
INSERT INTO `transdetail` VALUES ('6fbdb989-38d3-4b5c-92d5-a17e6ebd6704', '00000000000000000420', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:27');
INSERT INTO `transdetail` VALUES ('176e7e8c-6df7-45d5-a19a-33eca5df5820', '00000000000000000421', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:27');
INSERT INTO `transdetail` VALUES ('a0bc5364-4910-4266-8ae6-75c0348a14b5', '00000000000000000422', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:27');
INSERT INTO `transdetail` VALUES ('a9377250-fc4a-423a-a8e6-c823bc74a8d1', '00000000000000000423', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:42');
INSERT INTO `transdetail` VALUES ('d7fdf00d-55e5-44fd-9454-1112343c9a4c', '00000000000000000424', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:43');
INSERT INTO `transdetail` VALUES ('806b21ff-58cf-4412-b292-2c3f87c01117', '00000000000000000425', null, '1055', '0', 'on', '15.0', '测试', '15580830349', '1', '2018-02-12 14:54:43');
INSERT INTO `transdetail` VALUES ('4c8b0340-b037-4c7a-99c8-cc771a8fa69d', '00000000000000000426', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:08');
INSERT INTO `transdetail` VALUES ('b5d98de7-de68-4492-ae6d-4f2158655b77', '00000000000000000427', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:08');
INSERT INTO `transdetail` VALUES ('1a3f491a-765f-4faf-8ccb-98e796f2593c', '00000000000000000428', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:09');
INSERT INTO `transdetail` VALUES ('d834649c-f852-446f-9df7-13c5f30ab5d9', '00000000000000000429', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:09');
INSERT INTO `transdetail` VALUES ('286a4555-11d8-480a-bf29-5ead1f190860', '00000000000000000430', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:10');
INSERT INTO `transdetail` VALUES ('b59ad538-e1b6-4b3d-9f0a-7ece43adf480', '00000000000000000431', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:10');
INSERT INTO `transdetail` VALUES ('36a878c9-a4e2-4cc8-9001-ced7c51ae68a', '00000000000000000432', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:10');
INSERT INTO `transdetail` VALUES ('b0f66e1e-8bff-459c-8a7e-b5f73195a588', '00000000000000000433', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:10');
INSERT INTO `transdetail` VALUES ('4e58a953-f0de-45b2-b2ef-1f08dfeec406', '00000000000000000434', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:10');
INSERT INTO `transdetail` VALUES ('bf0de9b3-c74e-420b-81f1-692cbe9b213f', '00000000000000000435', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:10');
INSERT INTO `transdetail` VALUES ('3350f10d-da5d-420c-a90e-5603e44d5480', '00000000000000000436', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:11');
INSERT INTO `transdetail` VALUES ('a2c0799b-82ed-4ebe-ae34-1b41308348ef', '00000000000000000437', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:11');
INSERT INTO `transdetail` VALUES ('36f54114-2f92-4768-bb49-3f360c71be40', '00000000000000000438', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:11');
INSERT INTO `transdetail` VALUES ('e1ebde30-d793-4c9a-a2d6-bcc45cf98eee', '00000000000000000439', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:11');
INSERT INTO `transdetail` VALUES ('d141ee69-12f8-4924-8349-e4b50ddc2e04', '00000000000000000440', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:11');
INSERT INTO `transdetail` VALUES ('ab22741b-2b51-4fa1-8e30-facfd4cf55c6', '00000000000000000441', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:12');
INSERT INTO `transdetail` VALUES ('c82d5608-d25f-4a7a-bcbd-7fc2b8e1f6a5', '00000000000000000442', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:12');
INSERT INTO `transdetail` VALUES ('446f5f0a-e4dc-4a3e-b2e5-f0d61275370a', '00000000000000000443', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:12');
INSERT INTO `transdetail` VALUES ('2d8dbffd-30b9-4e45-981c-b1db672230e6', '00000000000000000444', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:13');
INSERT INTO `transdetail` VALUES ('126cb38f-e0e9-4dff-9575-0daa1725fad8', '00000000000000000445', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:13');
INSERT INTO `transdetail` VALUES ('3b303309-f479-4e2b-8b01-e9886ce12540', '00000000000000000446', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:13');
INSERT INTO `transdetail` VALUES ('11a6cdc9-ac1b-4f34-8d67-f3239012199f', '00000000000000000447', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 14:55:14');
INSERT INTO `transdetail` VALUES ('0c1bf4c7-d84d-42ff-9606-ec2d441c33e1', '00000000000000000448', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:00');
INSERT INTO `transdetail` VALUES ('acdde9d0-f415-4255-ab68-f317eca0ea76', '00000000000000000449', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:01');
INSERT INTO `transdetail` VALUES ('c965c457-5c5b-4808-a215-4e539f01a023', '00000000000000000450', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:01');
INSERT INTO `transdetail` VALUES ('8cad7a03-85ce-47b7-ae42-ed474c2f9c79', '00000000000000000451', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:01');
INSERT INTO `transdetail` VALUES ('74804e4f-e3a3-4d01-844c-ca94d463065b', '00000000000000000452', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:01');
INSERT INTO `transdetail` VALUES ('35e0fd1b-3684-4e73-b232-173b394279bc', '00000000000000000453', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:01');
INSERT INTO `transdetail` VALUES ('a4296dd8-4529-4f6b-ab6c-aff54de6ae9f', '00000000000000000454', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:02');
INSERT INTO `transdetail` VALUES ('bbb2f30c-1ad2-4209-8695-50c1ee0d6c77', '00000000000000000455', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:02');
INSERT INTO `transdetail` VALUES ('55bc4d41-beca-4ca4-9c94-88be42231d07', '00000000000000000456', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:02');
INSERT INTO `transdetail` VALUES ('9b5a3b22-f049-4bb2-9325-af457b94d34a', '00000000000000000457', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:03');
INSERT INTO `transdetail` VALUES ('ab50ccb7-bc1c-4ba3-81c2-b07d2fb487a6', '00000000000000000458', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:03');
INSERT INTO `transdetail` VALUES ('4bf9b1d1-a575-4928-80a8-3fda0375d34f', '00000000000000000459', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:03');
INSERT INTO `transdetail` VALUES ('39e0afa4-609f-48ec-99d9-f504b9c5c63f', '00000000000000000460', null, '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-12 16:26:03');
INSERT INTO `transdetail` VALUES ('93c4cda8-b35e-4447-87d8-be1a8826267a', '00000000000000000461', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:16:26');
INSERT INTO `transdetail` VALUES ('77048767-16d0-49d3-a9b5-50b33fc69f8a', '00000000000000000462', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:35');
INSERT INTO `transdetail` VALUES ('2e459094-40a0-464e-9f0f-cec4c8fc6c0f', '00000000000000000463', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:38');
INSERT INTO `transdetail` VALUES ('a6052987-02e0-481b-a39a-03a7c80c5e6e', '00000000000000000464', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:39');
INSERT INTO `transdetail` VALUES ('332949c5-596a-4d90-884c-089127e5e603', '00000000000000000465', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:39');
INSERT INTO `transdetail` VALUES ('d2572a52-d96a-4234-ad79-590b8dbe9043', '00000000000000000466', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:40');
INSERT INTO `transdetail` VALUES ('573d9d92-4e23-42c1-b474-859ead17e916', '00000000000000000467', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:40');
INSERT INTO `transdetail` VALUES ('5168b03e-71a5-4b7f-8152-64f270b7f9d7', '00000000000000000468', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:40');
INSERT INTO `transdetail` VALUES ('e4f73f1d-2af9-44dd-b350-b30e678bcadd', '00000000000000000469', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:41');
INSERT INTO `transdetail` VALUES ('045f1ac1-53db-4a6b-923e-513750ddb3d0', '00000000000000000470', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:41');
INSERT INTO `transdetail` VALUES ('5b2cc66d-ed79-4dd6-8a34-fc408ac67ca4', '00000000000000000471', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:47');
INSERT INTO `transdetail` VALUES ('32ca3dac-7de7-48c7-a3c6-4dd38b3cf531', '00000000000000000472', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:48');
INSERT INTO `transdetail` VALUES ('a23a56ad-dec9-4901-8a2b-27118661d296', '00000000000000000473', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:48');
INSERT INTO `transdetail` VALUES ('a1f8d2f6-dcdd-4ac9-9d92-ab3ad965ef6a', '00000000000000000474', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:49');
INSERT INTO `transdetail` VALUES ('a7ffe354-7247-4f86-9c3b-9068cc0f04e8', '00000000000000000475', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:51');
INSERT INTO `transdetail` VALUES ('b1ba78e3-9dde-4f00-b9df-9228421068f0', '00000000000000000476', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:51');
INSERT INTO `transdetail` VALUES ('e18b20dc-3d2a-4e0b-93a7-a612a94b9085', '00000000000000000477', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:51');
INSERT INTO `transdetail` VALUES ('7c8de209-7a13-44ff-a89d-0584462b43af', '00000000000000000478', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:52');
INSERT INTO `transdetail` VALUES ('cf748d60-4706-499c-8207-498308e4acee', '00000000000000000479', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:52');
INSERT INTO `transdetail` VALUES ('5d11d70e-c6fe-4d25-a958-e9f62daccf0d', '00000000000000000480', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:52');
INSERT INTO `transdetail` VALUES ('6a3b9852-6c25-4054-ace0-d830f0ba9f74', '00000000000000000481', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:53');
INSERT INTO `transdetail` VALUES ('a69e0cde-a4f8-46f7-a359-17abf04d242f', '00000000000000000482', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:54');
INSERT INTO `transdetail` VALUES ('c7eb6da3-41c2-4e22-8d80-e2508d8ace02', '00000000000000000483', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:54');
INSERT INTO `transdetail` VALUES ('f6d50598-752e-453f-9e68-9b562835f1af', '00000000000000000484', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:54');
INSERT INTO `transdetail` VALUES ('b3ba70f5-df18-46df-8b05-c98ab124438e', '00000000000000000485', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:55');
INSERT INTO `transdetail` VALUES ('80427fcd-e846-40da-b4b1-b83a597b3a47', '00000000000000000486', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:55');
INSERT INTO `transdetail` VALUES ('560c6dbb-4989-4a44-95f6-c59f4edfadd8', '00000000000000000487', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:17:55');
INSERT INTO `transdetail` VALUES ('1e55332e-19c9-4740-aa15-3d1b569d0497', '00000000000000000488', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:18:05');
INSERT INTO `transdetail` VALUES ('949578d1-9bb3-4284-b4c5-565954f741f1', '00000000000000000489', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:18:06');
INSERT INTO `transdetail` VALUES ('74fede49-fc64-4c78-a16b-0a3b726ab4a2', '00000000000000000490', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:18:07');
INSERT INTO `transdetail` VALUES ('20a72ce3-ad00-4352-82bf-837f0e200034', '00000000000000000491', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:18:07');
INSERT INTO `transdetail` VALUES ('7a0aa4b7-0bf5-45fb-9eba-0a579c5dcc8a', '00000000000000000492', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:18:07');
INSERT INTO `transdetail` VALUES ('93d4196b-b8c3-4bb0-99e8-7f71c6c4fc6c', '00000000000000000493', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '测试', '15200531631', '1', '2018-02-13 15:18:08');
INSERT INTO `transdetail` VALUES ('53d2a747-4384-493d-afa0-48dd57d9fd56', '00000000000000000494', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '刘邦', '15200531631', '1', '2018-02-13 15:18:40');
INSERT INTO `transdetail` VALUES ('3b9e10df-ddce-488b-aa68-23b4c0c7c18c', '00000000000000000495', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '刘邦', '15200531631', '1', '2018-02-13 15:18:42');
INSERT INTO `transdetail` VALUES ('dd5ed64e-3f24-40bb-9e47-db7388878e37', '00000000000000000496', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '刘邦', '15200531631', '1', '2018-02-13 15:18:43');
INSERT INTO `transdetail` VALUES ('011819e1-62b9-40d4-8f7f-362ca9fd05f7', '00000000000000000497', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '刘邦', '15200531631', '1', '2018-02-13 15:18:43');
INSERT INTO `transdetail` VALUES ('4ee21035-4a74-4353-891a-32bd912ecadf', '00000000000000000498', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '刘邦', '15200531631', '1', '2018-02-13 15:18:43');
INSERT INTO `transdetail` VALUES ('0921bac1-a65e-4ffa-9591-044093a5018a', '00000000000000000499', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:10');
INSERT INTO `transdetail` VALUES ('886fbbec-460a-4d3e-870a-20e8fa0fb50a', '00000000000000000500', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:13');
INSERT INTO `transdetail` VALUES ('4df0193b-22de-4bbc-bbba-825bcc177f63', '00000000000000000501', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:13');
INSERT INTO `transdetail` VALUES ('dbf499fa-4751-4474-a593-365064065a70', '00000000000000000502', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:13');
INSERT INTO `transdetail` VALUES ('e905ab62-2633-48c2-b272-6522c06a3539', '00000000000000000503', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:14');
INSERT INTO `transdetail` VALUES ('69f33a4f-e0ba-4b2a-8cff-c6f25fe6eb55', '00000000000000000504', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:14');
INSERT INTO `transdetail` VALUES ('c68fb4e7-57a1-4eab-9909-b0762cbf4b47', '00000000000000000505', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:14');
INSERT INTO `transdetail` VALUES ('985392a6-b9c8-4025-a15a-4e7c39244dbe', '00000000000000000506', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:14');
INSERT INTO `transdetail` VALUES ('44aa7e9b-b990-4f6f-b4cc-4c8ac2b5315e', '00000000000000000507', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:15');
INSERT INTO `transdetail` VALUES ('b39c255f-9f90-4732-91b5-fddefa142a92', '00000000000000000508', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:15');
INSERT INTO `transdetail` VALUES ('aa686d9c-948c-49a1-bdae-9db913aead38', '00000000000000000509', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:15');
INSERT INTO `transdetail` VALUES ('d4e7326f-7b57-4eec-989c-308dade5dd2f', '00000000000000000510', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:18');
INSERT INTO `transdetail` VALUES ('8d614581-5621-4632-b306-8aca4f4ab509', '00000000000000000512', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:18');
INSERT INTO `transdetail` VALUES ('8406583f-6f12-479b-ab7e-5f6be64f8820', '00000000000000000512', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:18');
INSERT INTO `transdetail` VALUES ('73363f44-0b3b-4372-9d82-7a0f96f439c3', '00000000000000000513', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:18');
INSERT INTO `transdetail` VALUES ('9956a38e-bf41-4c19-b9b3-ab82f98be79c', '00000000000000000514', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:18');
INSERT INTO `transdetail` VALUES ('f362faa5-06d2-49ce-99c3-370f9d1bf098', '00000000000000000515', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:18');
INSERT INTO `transdetail` VALUES ('8e2a5198-4a99-47ee-a8b1-fc2961c5eba5', '00000000000000000516', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:20');
INSERT INTO `transdetail` VALUES ('f2fae839-5ab5-4030-9807-b17afef937a6', '00000000000000000517', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:20');
INSERT INTO `transdetail` VALUES ('5abc54b5-3666-4d12-95dc-b5ea8f8eb231', '00000000000000000518', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:20');
INSERT INTO `transdetail` VALUES ('5409ce30-0eb1-426e-b160-6a583922d65f', '00000000000000000519', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:20');
INSERT INTO `transdetail` VALUES ('596ec684-ebd6-4906-851b-b1486a183ef5', '00000000000000000520', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:21');
INSERT INTO `transdetail` VALUES ('2b92352a-0f56-4392-ad59-14b811baf887', '00000000000000000521', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:21');
INSERT INTO `transdetail` VALUES ('d24d2d11-bdbe-4117-bdcb-6829d15ba673', '00000000000000000522', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:21');
INSERT INTO `transdetail` VALUES ('4dab04d8-e0f0-424e-87ac-c0ab90798865', '00000000000000000523', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:21');
INSERT INTO `transdetail` VALUES ('480c9e22-4e49-4b02-81ec-356aa481bde2', '00000000000000000524', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:21');
INSERT INTO `transdetail` VALUES ('eba367dd-f716-412c-9713-5336ff4dd4e3', '00000000000000000525', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:21');
INSERT INTO `transdetail` VALUES ('59b05f71-9efd-4518-b1b1-addde418aa75', '00000000000000000526', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:22');
INSERT INTO `transdetail` VALUES ('98a8bb11-be9b-4508-9f94-81adeae94254', '00000000000000000527', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15200864750', '1', '2018-02-13 22:21:22');
INSERT INTO `transdetail` VALUES ('2575438b-e4a0-4461-a964-644f5993f7c8', '', 'oiDYQ0zSru7Imb6j1iFUqS95x7q0', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-02-14 10:54:47');
INSERT INTO `transdetail` VALUES ('e2d3e55b-2550-4f6c-8d49-2c477581829b', '00000000000000000528', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:29');
INSERT INTO `transdetail` VALUES ('fcd9d88c-9c8e-424e-9c0f-cf56430a231d', '00000000000000000529', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:31');
INSERT INTO `transdetail` VALUES ('785560f3-9929-4247-9e12-90d494b1c615', '00000000000000000530', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:32');
INSERT INTO `transdetail` VALUES ('84f6d197-7c16-4205-80de-e43bdd6b9d98', '00000000000000000531', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:32');
INSERT INTO `transdetail` VALUES ('9b30d9d5-210d-4396-ab30-44e8b0031ab6', '00000000000000000532', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:33');
INSERT INTO `transdetail` VALUES ('9ef409d3-ed2e-4d02-a62c-75c7dac4688f', '00000000000000000533', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:33');
INSERT INTO `transdetail` VALUES ('f6afe357-4590-4b0b-b7f4-3dc2ffaa7a0c', '00000000000000000534', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:33');
INSERT INTO `transdetail` VALUES ('d3013827-67e9-491f-830a-39c4f158a22b', '00000000000000000535', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:33');
INSERT INTO `transdetail` VALUES ('3d2c85b9-c019-4e58-9ab0-449805fc0517', '00000000000000000536', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:33');
INSERT INTO `transdetail` VALUES ('aaa6fa1a-9ef7-43a4-aa5f-0cf094abf8c9', '00000000000000000537', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:37');
INSERT INTO `transdetail` VALUES ('97438916-320d-4241-9091-dd8fed096da5', '00000000000000000538', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:38');
INSERT INTO `transdetail` VALUES ('58542eb0-c9f3-486b-86ca-8641d6ea8220', '00000000000000000539', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:38');
INSERT INTO `transdetail` VALUES ('71b7a5aa-6c53-44e4-8095-90e5162732cd', '00000000000000000540', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:38');
INSERT INTO `transdetail` VALUES ('c33da574-9989-4349-b02e-3821feba48bf', '00000000000000000541', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:38');
INSERT INTO `transdetail` VALUES ('65fed8b1-7cc8-44c2-8f0e-10af7af91625', '00000000000000000542', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:39');
INSERT INTO `transdetail` VALUES ('144f5791-19d7-4491-bbbc-0da30275100f', '00000000000000000543', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:39');
INSERT INTO `transdetail` VALUES ('cade35dd-1d67-4a41-8834-ffe65e70f148', '00000000000000000544', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:39');
INSERT INTO `transdetail` VALUES ('e14f1731-13e9-42fe-9bb0-2d7ee072957e', '00000000000000000545', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:39');
INSERT INTO `transdetail` VALUES ('f322583f-bc62-45fa-a425-1f905662ee68', '00000000000000000546', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:40');
INSERT INTO `transdetail` VALUES ('4276b993-4b7d-4621-8c9e-bead57d88868', '00000000000000000547', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:40');
INSERT INTO `transdetail` VALUES ('f70d69e5-1c78-4278-ad52-b1eeb1c9c2fd', '00000000000000000548', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:41');
INSERT INTO `transdetail` VALUES ('d21e1598-7fff-4dc0-a39c-faa7441dad98', '00000000000000000549', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:41');
INSERT INTO `transdetail` VALUES ('5ad780f2-e615-40c3-8e30-87b66f2b05db', '00000000000000000550', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:41');
INSERT INTO `transdetail` VALUES ('9b8020d3-c1ad-4c1b-a177-c93a2685e29f', '00000000000000000551', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:41');
INSERT INTO `transdetail` VALUES ('72782188-9e51-47a7-aa08-8a594fe90f0e', '00000000000000000552', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('7f8ed08e-aacf-45ad-961a-7f348bfa2eda', '00000000000000000553', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('bb12bdaf-f02d-4033-b5d7-87d9fc88c58b', '00000000000000000554', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('93c8b7d0-b4c9-4b6e-8bed-32bef3779315', '00000000000000000555', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('ea90dba6-c4f9-479f-9707-ebdb2c373a23', '00000000000000000556', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('d2af1183-bce3-4d70-a971-c1fa4ba553bd', '00000000000000000557', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('bc2d1346-948e-4b2b-ac0f-3324015d0ec6', '00000000000000000558', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:42');
INSERT INTO `transdetail` VALUES ('1c3ebd40-f704-4bc3-9fac-ddb7743c48f9', '00000000000000000559', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:43');
INSERT INTO `transdetail` VALUES ('bc92c84c-d528-4e39-92b2-81aa985841a4', '00000000000000000560', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:43');
INSERT INTO `transdetail` VALUES ('7eaf3726-a4f0-4feb-834e-bf95c34d339d', '00000000000000000561', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:43');
INSERT INTO `transdetail` VALUES ('fa833b3b-636e-4a71-a1d0-436dc94fa358', '00000000000000000562', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:48');
INSERT INTO `transdetail` VALUES ('e10dee36-3211-46af-8631-bfe10f9869fc', '00000000000000000563', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:48');
INSERT INTO `transdetail` VALUES ('41cbb695-99ba-4fe5-b085-3ae9b155fd4e', '00000000000000000564', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-14 13:59:49');
INSERT INTO `transdetail` VALUES ('506cecfa-b613-4897-97da-51c244b634dd', '00000000000000000565', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '哈哈哈', '18769495', '1', '2018-02-17 09:32:29');
INSERT INTO `transdetail` VALUES ('f6f3aa40-3866-46f3-bebb-8ecac078defd', '00000000000000000566', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '哈哈哈', '18769495', '1', '2018-02-17 09:32:42');
INSERT INTO `transdetail` VALUES ('6f59fca3-219d-4d8c-9af9-25941cb8c2c5', '00000000000000000567', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '11', '111', '1', '2018-02-17 09:35:38');
INSERT INTO `transdetail` VALUES ('19ab3c3a-9569-4b9a-bc46-8d1c59b53512', '00000000000000000568', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:00');
INSERT INTO `transdetail` VALUES ('6b083917-39b0-483d-993f-2dbabc6bc03d', '00000000000000000569', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:02');
INSERT INTO `transdetail` VALUES ('76194881-c373-4abb-8ea9-ed25d36f53c6', '00000000000000000570', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('cf658a01-0b07-4870-aff3-46e304b169d8', '00000000000000000571', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('b127c27c-8cee-400e-bc6a-dedb2eef6476', '00000000000000000572', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('46af1671-a1ef-49fa-ac0b-67e481dedb1f', '00000000000000000573', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('2a4daa39-99f1-44da-8f44-10b856074c5c', '00000000000000000574', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('57fb373f-ed71-4a26-9a15-755c806a7153', '00000000000000000575', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('bb35c7b0-b8cc-4bc5-a8c0-925c4dc618ea', '00000000000000000576', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:03');
INSERT INTO `transdetail` VALUES ('663b9af9-f517-49b1-9811-d9762614c5d8', '00000000000000000577', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '908', '0', 'on', '15.0', '测试', '15580830348', '1', '2018-02-18 08:29:04');
INSERT INTO `transdetail` VALUES ('9af2fe21-6c01-4bf7-be68-ca55212c6d33', '00000000000000000578', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-22 14:26:47');
INSERT INTO `transdetail` VALUES ('82db8c15-69cf-4e03-ba4c-0691f7b87608', '00000000000000000579', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-22 14:26:50');
INSERT INTO `transdetail` VALUES ('157fdeb9-5bf1-4d1c-9461-a0abea7763b2', '00000000000000000580', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-23 08:40:00');
INSERT INTO `transdetail` VALUES ('2878ca04-bcfb-4e7f-9ab5-b7779e44b618', '00000000000000000581', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-23 08:40:03');
INSERT INTO `transdetail` VALUES ('5dbda068-76d1-4320-8176-f757fa6bed09', '00000000000000000582', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-23 08:40:08');
INSERT INTO `transdetail` VALUES ('7838de14-74cb-432a-908e-bcefca302ef1', '00000000000000000583', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-23 09:23:40');
INSERT INTO `transdetail` VALUES ('f64ed35d-032d-46c0-827a-ac7e644fc96f', '00000000000000000584', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '2', '2', '1', '2018-02-23 09:23:49');
INSERT INTO `transdetail` VALUES ('fe9685fa-811d-452b-a7d4-e539bb827a3e', '00000000000000000585', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 09:56:05');
INSERT INTO `transdetail` VALUES ('9c83715f-698b-42c9-9a2a-c5d79f839dd0', '00000000000000000586', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 09:56:11');
INSERT INTO `transdetail` VALUES ('3d92547f-42e4-4833-bafa-b835db79ba83', '00000000000000000587', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 10:04:57');
INSERT INTO `transdetail` VALUES ('2cc3d8e6-ac01-46fd-bc98-6b3b36ca37b7', '00000000000000000588', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 10:08:25');
INSERT INTO `transdetail` VALUES ('9fc40b96-f497-40cd-aabc-a79dca58968b', '00000000000000000589', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 10:08:36');
INSERT INTO `transdetail` VALUES ('b0644746-5cbe-4a82-a7d0-2d0f243de88e', '00000000000000000590', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '22', '1555', '1', '2018-02-23 10:17:19');
INSERT INTO `transdetail` VALUES ('28279b4f-1fbf-433e-8cb6-b22a6cad4fae', '00000000000000000591', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '1055', '0', 'on', '15.0', '测试', '1234324', '1', '2018-02-23 11:15:15');
INSERT INTO `transdetail` VALUES ('893500b1-0a49-4507-b91b-1bb84afcc69f', '00000000000000000592', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '测试', '1587', '1', '2018-02-23 11:16:26');
INSERT INTO `transdetail` VALUES ('5eee3f13-8c17-4afc-be63-1a48a4c9d96a', '00000000000000000593', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '测试', '1587', '1', '2018-02-23 11:16:50');
INSERT INTO `transdetail` VALUES ('f71cc55f-bdaa-43c3-9eaf-5946ab5a299d', '00000000000000000594', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '测试', '1477', '1', '2018-02-23 12:03:28');
INSERT INTO `transdetail` VALUES ('134ecf47-fe56-44a9-9534-0506944dbe6a', '00000000000000000595', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 13:40:59');
INSERT INTO `transdetail` VALUES ('75a8e96e-e0a9-4cdd-b872-9d12db3a738f', '00000000000000000596', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 13:41:04');
INSERT INTO `transdetail` VALUES ('f5293853-0a9c-49c2-b8ba-695e2e7c6a98', '00000000000000000597', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 13:46:12');
INSERT INTO `transdetail` VALUES ('d2993765-ad3f-436b-b8af-89036abce4de', '00000000000000000598', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '15200531631', '1', '2018-02-23 13:47:24');
INSERT INTO `transdetail` VALUES ('2360b418-c420-42ed-a85a-0dfb789db900', '00000000000000000599', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '111', '111', '1', '2018-02-23 13:52:18');
INSERT INTO `transdetail` VALUES ('ddd0b8ad-302e-43c0-a63b-3b52f62b05ef', '00000000000000000600', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '333', '1', '2018-02-23 13:53:09');
INSERT INTO `transdetail` VALUES ('16847252-3772-4c46-8f0a-4e0dc8e68cdd', '00000000000000000601', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '333', '1', '2018-02-23 13:54:03');
INSERT INTO `transdetail` VALUES ('94e401ce-fe8d-44b1-a979-f9c932961b81', '00000000000000000602', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '22', '1111', '1', '2018-02-23 14:07:17');
INSERT INTO `transdetail` VALUES ('6b5e0b0f-8224-49f9-8dac-801974d7de87', '00000000000000000603', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '222', '3333', '1', '2018-02-23 14:08:44');
INSERT INTO `transdetail` VALUES ('718736f2-7101-46e7-b4e3-08bce3476761', '00000000000000000604', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '333', '14444', '1', '2018-02-23 14:09:03');
INSERT INTO `transdetail` VALUES ('0e7699c2-f776-4b3e-ba91-01b5cb47d37c', '00000000000000000605', 'oVbXbwyftnipRWJD_hiNXBZPY4Ic', '1055', '0', 'on', '15.0', '333', '14444', '1', '2018-02-23 14:09:11');
INSERT INTO `transdetail` VALUES ('2c81dec6-0ee7-4a1a-b317-b12d48d054cf', '00000000000000000606', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '15580036947', '1', '2018-02-23 14:14:17');
INSERT INTO `transdetail` VALUES ('9e53656c-4425-486d-af8f-5da2fc72c837', '00000000000000000607', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '2068', '0', 'on', '30.0', '测试', '15580830694', '1', '2018-02-23 14:14:54');
INSERT INTO `transdetail` VALUES ('f6f65511-b576-480d-941e-48e2e98c2ba9', '00000000000000000608', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '2068', '0', 'on', '30.0', '测试', '15580830694', '1', '2018-02-23 14:15:21');
INSERT INTO `transdetail` VALUES ('2712db86-2b45-4d27-9d2e-0ffd469a5991', '00000000000000000609', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '1055', '0', 'on', '15.0', '测试', '1558083066', '1', '2018-02-23 19:53:30');
INSERT INTO `transdetail` VALUES ('b0072adb-9c78-4f83-b90e-b3f5be941e0c', '00000000000000000610', 'oVbXbw7MaOziw-8cwjHeYR6WKavw', '2068', '0', 'on', '30.0', '。。', '1686', '1', '2018-02-23 22:40:03');
INSERT INTO `transdetail` VALUES ('8eb9147e-5e13-4df4-8080-791b74c6f9b0', '00000000000000000611', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '测试', '123456', '1', '2018-02-23 22:47:12');
INSERT INTO `transdetail` VALUES ('2650d3c3-c2d3-48dc-bc25-211488ff3786', '00000000000000000612', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '5398', '0', 'on', '80.0', '测试', '123456', '1', '2018-02-23 22:55:35');
INSERT INTO `transdetail` VALUES ('0b09ca76-4e8f-43bc-a588-092f522c2777', '00000000000000000613', 'oVbXbw4x8YNsY8M4mkHsprPUNLoo', '2600', '0', 'on', '30.0', 'VB呢', '15580830647', '1', '2018-02-27 14:36:47');
INSERT INTO `transdetail` VALUES ('f903a906-acfb-49b2-8d37-8f2817396b07', '00000000000000000614', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '1055', '0', 'on', '15.0', '测试', '123', '1', '2018-02-27 21:25:44');
INSERT INTO `transdetail` VALUES ('88841ce9-cde4-462e-a42a-28a88ae25732', '', 'oiDYQ0zVT0ta9jCwTN6dyp0cS0u0', '0', '1', 'on', '5.0', '人工扣费', '', '-1', '2018-02-28 12:20:57');
INSERT INTO `transdetail` VALUES ('3fa1b06e-9f88-4565-80eb-c5495f715f16', '00000000000000000615', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '1055', '0', 'on', '15.0', '张党秀', '15367316996', '1', '2018-02-28 13:22:08');
INSERT INTO `transdetail` VALUES ('f89638ed-fa00-4537-b64a-a1cd9743218d', '00000000000000000616', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '1055', '1', 'on', '15.0', '张党秀', '15367316996', '1', '2018-02-28 13:23:23');
INSERT INTO `transdetail` VALUES ('edc7acd5-344c-4f86-8b4b-d629fee7231e', '00000000000000000617', 'oVbXbwz-ICbeaaDxA_QC9TC0bbJw', '908', '0', 'on', '15.0', '测试', '1111', '1', '2018-03-02 23:15:03');
INSERT INTO `transdetail` VALUES ('91745122-65cb-46b6-906b-62f4c1fc50a6', '', 'oiDYQ0_NmkOldluJsz2cuEeP_umY', '0', '1', 'on', '0.5', '人工充值', '', '1', '2018-03-05 10:08:11');
INSERT INTO `transdetail` VALUES ('b02877d8-98b3-4476-8790-8b80f59cb185', '', 'oiDYQ0-LUX7vJqq9gQKydLvNuRuQ', '0', '1', 'on', '9.0', '人工充值', '', '1', '2018-03-05 10:09:21');
INSERT INTO `transdetail` VALUES ('e53059bf-968e-4cf6-a5b9-9be2a2d763dd', '', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '0', '1', 'on', '7.0', '人工扣费', '', '-1', '2018-03-08 12:55:23');
INSERT INTO `transdetail` VALUES ('b81182a0-4746-4925-9125-7b1faacf8cc5', '', 'oiDYQ03gDTQi99IIKCy4ilNiu0lk', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-03-08 12:55:54');
INSERT INTO `transdetail` VALUES ('4f4e3507-3366-4db1-9781-698ccc12dc2a', '', 'oiDYQ0zhz2gPJzG-KM9V-O13eE9o', '0', '1', 'on', '13.0', '人工扣费', '', '-1', '2018-03-19 19:31:59');
INSERT INTO `transdetail` VALUES ('7f4d7181-a58a-4aeb-a9c9-c272f49b37d4', '', 'oVbXbwy88K-QqNxARIgJGAc2Dndk', '0', '1', 'on', '15.0', '人工扣费', '', '-1', '2018-04-09 11:11:10');
INSERT INTO `transdetail` VALUES ('94afd7b7-e968-42d2-898b-da9ebb0384fa', '', 'oiDYQ0-JjFKzSEd0OtWYzqdTnALs', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-04-09 11:15:20');
INSERT INTO `transdetail` VALUES ('d2d899a5-0896-43bc-9ae3-4c43efa6d301', '', 'oiDYQ09Olg-RfXX11FmP6N0yz7V0', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-04-09 11:16:24');
INSERT INTO `transdetail` VALUES ('c46d7662-dfb4-4b00-85a9-36fc8f2fbdea', '', 'oiDYQ0ygSdCS8MYmDatWUXKvFyVI', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 11:16:44');
INSERT INTO `transdetail` VALUES ('646acd5e-66be-4fd7-a61d-3dd32b019fc8', '', 'oiDYQ0-GzpLh_35JikEx1x6UeesE', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 11:17:24');
INSERT INTO `transdetail` VALUES ('bb142879-1da8-401f-a458-b1e6fabd4462', '', 'oiDYQ0xVo82KAEgzeAh0uFGbDlJE', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 20:34:53');
INSERT INTO `transdetail` VALUES ('b8b66fe2-dfe0-4682-a05e-158ea3e64316', '', 'oiDYQ0wikFPSDaHRj6-cLBFxvaoc', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-04-09 20:35:27');
INSERT INTO `transdetail` VALUES ('fd2bb77a-baf8-4e6f-b886-cdc929eb8fdd', '', 'oiDYQ03Cj6Jc-A_HLW7zvoXN6Z5I', '0', '1', 'on', '78.0', '人工扣费', '', '-1', '2018-04-09 20:35:53');
INSERT INTO `transdetail` VALUES ('6f6e371b-2071-442b-846f-be95486d6e62', '', 'oiDYQ0-q5HCANK-P1Po8Odku0nvE', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 20:36:04');
INSERT INTO `transdetail` VALUES ('8f03f3bf-4485-4c1e-be12-f81d562fd2ac', '', 'oiDYQ07MSdojJeifDrBeddlagQIE', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 20:36:14');
INSERT INTO `transdetail` VALUES ('de68953d-9b70-4ef8-8a42-cff771f3b4a5', '', 'oiDYQ0y0eV0QwAutndz8uxE3r4qM', '0', '1', 'on', '2.5', '人工扣费', '', '-1', '2018-04-09 20:36:25');
INSERT INTO `transdetail` VALUES ('137c121e-f9a0-478a-9f24-867a9c29df76', '', 'oiDYQ0wZfX4LzE2K-N_FPbH3gZ7k', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 20:36:35');
INSERT INTO `transdetail` VALUES ('b8f3dbe4-8db9-4fca-b157-0f3fca3dc9fd', '', 'oiDYQ09g8Lc52bNQ5KLztoBw3sq8', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 20:36:51');
INSERT INTO `transdetail` VALUES ('1f268320-b91b-4a86-bde7-3c073c0d39c3', '', 'oiDYQ014KwEN0xpb6dSijz-kKgCM', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 20:37:02');
INSERT INTO `transdetail` VALUES ('13a65b95-9b8f-4cb8-a801-ce557a358aab', '', 'oiDYQ08aaGNYLRZnYiJqgELpzRb4', '0', '1', 'on', '1.0', '人工扣费', '', '-1', '2018-04-09 20:46:44');
INSERT INTO `transdetail` VALUES ('91aedd54-1947-40ca-9916-2a3a9ed7db9c', '', 'oiDYQ0_pD87vkNU0EojvY_H-Qtu4', '0', '1', 'on', '35.0', '人工扣费', '', '-1', '2018-04-09 20:47:05');
INSERT INTO `transdetail` VALUES ('1384a3b1-3d9c-4452-9a55-7e32c45e4ee4', '', 'oiDYQ01ozPm5-5h4VYVMpVL9C6IY', '0', '1', 'on', '10.0', '人工扣费', '', '-1', '2018-04-09 20:47:20');
INSERT INTO `transdetail` VALUES ('6654b081-20ad-4f10-b1dc-0a6d3db3a09a', '', 'oiDYQ07XGu6PjWUzJrOg4hPgVLNA', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 20:47:44');
INSERT INTO `transdetail` VALUES ('976f9688-c4f3-4244-bc76-00ab7edff22d', '', 'oiDYQ0ziAArh7BoaTl725rcA05w0', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 20:48:01');
INSERT INTO `transdetail` VALUES ('984724c0-9f3e-4fde-8290-ba51027c9ae0', '', 'oiDYQ05IW9Fu2ymlwydqFnbG_FC4', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 20:48:10');
INSERT INTO `transdetail` VALUES ('a62dc81d-ac78-44a1-bcde-5268645019a6', '', 'oiDYQ0z7LHLc1MFH5TihI0sccs5M', '0', '1', 'on', '3.5', '人工扣费', '', '-1', '2018-04-09 20:48:25');
INSERT INTO `transdetail` VALUES ('c137b4db-0655-4f45-8374-361af69479f0', '', 'oiDYQ051hnXZHOwy8sjLL7whBqkY', '0', '1', 'on', '6.0', '人工扣费', '', '-1', '2018-04-09 20:48:36');
INSERT INTO `transdetail` VALUES ('5876adc9-9544-43eb-8c09-0e0b03c99c17', '', 'oiDYQ073ScJjraWpAndc9ltrfUe4', '0', '1', 'on', '2.0', '人工扣费', '', '-1', '2018-04-09 20:48:46');
INSERT INTO `transdetail` VALUES ('5d5fae0d-2664-4f67-91c4-37961689bb3f', '', 'oiDYQ0yNCSCv0C4B7y2-cwo0GWAA', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 21:14:36');
INSERT INTO `transdetail` VALUES ('8f68a933-27f0-463d-afd7-105d748cbd39', '', 'oiDYQ0x4ZiE0CKDyISj8lBANv1WM', '0', '1', 'on', '3.0', '人工扣费', '', '-1', '2018-04-09 21:14:46');
INSERT INTO `transdetail` VALUES ('a44b24ad-5374-4ec7-923e-eaf40b015f61', '', 'oiDYQ05vC1k-8YoiyeY9_7szxMUo', '0', '1', 'on', '4.0', '人工扣费', '', '-1', '2018-04-09 21:15:07');
INSERT INTO `transdetail` VALUES ('6bac76ef-7cd9-4c9d-bda3-f3d63ef0299b', '', 'oiDYQ0yrl9cXp4XxBCOfGftZ7dcA', '0', '1', 'on', '9.5', '人工扣费', '', '-1', '2018-04-09 21:15:21');
INSERT INTO `transdetail` VALUES ('c8bf0e52-3aa5-49dd-a8b1-351cd0a52743', '', 'oiDYQ02PGBKowaxWbmoq-liifVmI', '0', '1', 'on', '32.0', '人工扣费', '', '-1', '2018-04-10 18:50:19');

-- ----------------------------
-- Table structure for useraccount
-- ----------------------------
DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `uuid` varchar(36) NOT NULL,
  `account` varchar(20) DEFAULT NULL,
  `name` varchar(800) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `loginPass` varchar(80) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraccount
-- ----------------------------
INSERT INTO `useraccount` VALUES ('1', '1', '1', '1', 'c4ca4238a0b923820dcc509a6f75849b', '1');
