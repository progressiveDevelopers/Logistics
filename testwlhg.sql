/*
Navicat MySQL Data Transfer

Source Server         : 评分系统
Source Server Version : 50639
Source Host           : 47.98.40.183:3306
Source Database       : testwlhg

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2018-05-24 17:34:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for check_avg_result
-- ----------------------------
DROP TABLE IF EXISTS `check_avg_result`;
CREATE TABLE `check_avg_result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `monthid` int(10) DEFAULT NULL,
  `month` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `nameid` int(10) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `allscore` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of check_avg_result
-- ----------------------------
INSERT INTO `check_avg_result` VALUES ('49', '4', '201805', '16', '鲁晓', '54.6');
INSERT INTO `check_avg_result` VALUES ('50', '4', '201805', '13', '宋金凤', '57.1');
INSERT INTO `check_avg_result` VALUES ('51', '4', '201805', '11', '彭文君', '53.6');
INSERT INTO `check_avg_result` VALUES ('52', '4', '201805', '24', '杨仙', '51.3');
INSERT INTO `check_avg_result` VALUES ('53', '4', '201805', '17', '王超楠', '51.6');

-- ----------------------------
-- Table structure for check_month
-- ----------------------------
DROP TABLE IF EXISTS `check_month`;
CREATE TABLE `check_month` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) DEFAULT NULL COMMENT '月份记录',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_month
-- ----------------------------
INSERT INTO `check_month` VALUES ('4', '201805', '2018年5月', '2018-05-23 14:34:15', '0');

-- ----------------------------
-- Table structure for check_option
-- ----------------------------
DROP TABLE IF EXISTS `check_option`;
CREATE TABLE `check_option` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `checkOption` varchar(20) DEFAULT NULL COMMENT '评价选项',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_option
-- ----------------------------
INSERT INTO `check_option` VALUES ('1', '服务量考评', '日常工作是否饱和，有效完成本职工作', '2018-01-24 14:34:08', '0');
INSERT INTO `check_option` VALUES ('2', '服务时效', '对客户经理需求相应迅速，在承诺时间内完成', '2018-01-24 14:34:26', '0');
INSERT INTO `check_option` VALUES ('3', '服务质量', '按照服务承诺保质保量完成工作', '2018-01-24 14:34:44', '0');
INSERT INTO `check_option` VALUES ('4', '服务表现', '贯彻执行首问责任制，积极主动为客户经理排忧解难', '2018-01-24 14:34:59', '0');
INSERT INTO `check_option` VALUES ('5', '服务态度', '工作热情、积极；处事态度端正', '2018-01-24 14:35:14', '0');
INSERT INTO `check_option` VALUES ('6', '综合满意度', '对于综合工作满意度打分', '2018-01-25 13:38:49', '0');

-- ----------------------------
-- Table structure for check_relation
-- ----------------------------
DROP TABLE IF EXISTS `check_relation`;
CREATE TABLE `check_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `user` varchar(20) DEFAULT NULL COMMENT '用户',
  `relationUserId` varchar(20) DEFAULT NULL COMMENT '关联用户ID',
  `relationUser` varchar(20) DEFAULT NULL COMMENT '关联用户',
  `desription` varchar(200) DEFAULT NULL COMMENT '描述',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_relation
-- ----------------------------
INSERT INTO `check_relation` VALUES ('1', '14', '杨少清', '13', '宋金凤', null, '2018-02-02 17:42:07', '0');
INSERT INTO `check_relation` VALUES ('2', '28', '万强', '13', '宋金凤', null, '2018-02-02 17:42:11', '0');
INSERT INTO `check_relation` VALUES ('3', '33', '周丽咪', '13', '宋金凤', null, '2018-02-02 17:42:17', '0');
INSERT INTO `check_relation` VALUES ('4', '46', '黄为一', '13', '宋金凤', null, '2018-02-02 17:42:21', '0');
INSERT INTO `check_relation` VALUES ('5', '61', '王韵盟', '13', '宋金凤', null, '2018-02-02 17:42:40', '0');
INSERT INTO `check_relation` VALUES ('6', '14', '杨少清', '11', '彭文君', null, '2018-02-02 17:43:57', '0');
INSERT INTO `check_relation` VALUES ('7', '19', '涂登峰', '11', '彭文君', null, '2018-02-02 17:44:20', '0');
INSERT INTO `check_relation` VALUES ('8', '25', '王林飞', '11', '彭文君', null, '2018-02-02 17:44:24', '0');
INSERT INTO `check_relation` VALUES ('9', '48', '陈佳伟', '11', '彭文君', null, '2018-02-02 17:44:28', '0');
INSERT INTO `check_relation` VALUES ('10', '59', '黄鞭', '11', '彭文君', null, '2018-02-02 17:44:50', '0');
INSERT INTO `check_relation` VALUES ('11', '15', '李沙', '16', '鲁晓', null, '2018-02-02 17:46:27', '0');
INSERT INTO `check_relation` VALUES ('12', '25', '王林飞', '16', '鲁晓', null, '2018-02-02 17:46:31', '0');
INSERT INTO `check_relation` VALUES ('13', '28', '万强', '16', '鲁晓', null, '2018-02-02 17:46:35', '0');
INSERT INTO `check_relation` VALUES ('14', '58', '赵佳祺', '16', '鲁晓', null, '2018-02-02 17:46:39', '0');
INSERT INTO `check_relation` VALUES ('15', '62', '余正同', '16', '鲁晓', null, '2018-02-02 17:46:41', '0');
INSERT INTO `check_relation` VALUES ('16', '10', '王维', '17', '王超楠', null, '2018-02-02 17:48:52', '0');
INSERT INTO `check_relation` VALUES ('17', '28', '万强', '17', '王超楠', null, '2018-02-02 17:48:55', '0');
INSERT INTO `check_relation` VALUES ('18', '30', '朱子晔', '17', '王超楠', null, '2018-02-02 17:48:58', '0');
INSERT INTO `check_relation` VALUES ('19', '33', '周丽咪', '17', '王超楠', null, '2018-02-02 17:49:03', '0');
INSERT INTO `check_relation` VALUES ('20', '61', '王韵盟', '17', '王超楠', null, '2018-02-02 17:49:15', '0');
INSERT INTO `check_relation` VALUES ('21', '25', '王林飞', '23', '杨莉', null, '2018-02-02 17:51:06', '0');
INSERT INTO `check_relation` VALUES ('22', '28', '万强', '23', '杨莉', null, '2018-02-02 17:51:08', '0');
INSERT INTO `check_relation` VALUES ('23', '33', '周丽咪', '23', '杨莉', null, '2018-02-02 17:51:11', '0');
INSERT INTO `check_relation` VALUES ('24', '46', '黄为一', '23', '杨莉', null, '2018-02-02 17:51:14', '0');
INSERT INTO `check_relation` VALUES ('25', '48', '陈佳伟', '23', '杨莉', null, '2018-02-02 17:51:17', '0');
INSERT INTO `check_relation` VALUES ('26', '15', '李沙', '24', '杨仙', null, '2018-02-02 17:52:54', '0');
INSERT INTO `check_relation` VALUES ('27', '28', '万强', '24', '杨仙', null, '2018-02-02 17:52:59', '0');
INSERT INTO `check_relation` VALUES ('28', '30', '朱子晔', '24', '杨仙', null, '2018-02-02 17:53:01', '0');
INSERT INTO `check_relation` VALUES ('29', '46', '黄为一', '24', '杨仙', null, '2018-02-02 17:53:04', '0');
INSERT INTO `check_relation` VALUES ('30', '61', '王韵盟', '24', '杨仙', null, '2018-02-02 17:53:08', '0');
INSERT INTO `check_relation` VALUES ('31', '19', '涂登峰', '26', '季寰宇', null, '2018-02-02 17:54:36', '0');
INSERT INTO `check_relation` VALUES ('32', '21', '范毛毛', '26', '季寰宇', null, '2018-02-02 17:54:40', '0');
INSERT INTO `check_relation` VALUES ('33', '22', '宗立', '26', '季寰宇', null, '2018-02-02 17:54:46', '0');
INSERT INTO `check_relation` VALUES ('34', '28', '万强', '26', '季寰宇', null, '2018-02-02 17:54:50', '0');
INSERT INTO `check_relation` VALUES ('35', '30', '朱子晔', '26', '季寰宇', null, '2018-02-02 17:55:15', '0');
INSERT INTO `check_relation` VALUES ('36', '12', '韩云登', '37', '杨沁', null, '2018-02-02 17:56:51', '0');
INSERT INTO `check_relation` VALUES ('37', '25', '王林飞', '37', '杨沁', null, '2018-02-02 17:56:59', '0');
INSERT INTO `check_relation` VALUES ('38', '28', '万强', '37', '杨沁', null, '2018-02-02 17:57:03', '0');
INSERT INTO `check_relation` VALUES ('39', '59', '黄鞭', '37', '杨沁', null, '2018-02-02 17:57:09', '0');
INSERT INTO `check_relation` VALUES ('40', '63', '谢博文', '37', '杨沁', null, '2018-02-02 17:57:10', '0');
INSERT INTO `check_relation` VALUES ('41', '9', '郑海洋', '39', '王妍', null, '2018-02-02 18:00:01', '0');
INSERT INTO `check_relation` VALUES ('42', '12', '韩云登', '39', '王妍', null, '2018-02-02 18:00:02', '0');
INSERT INTO `check_relation` VALUES ('43', '19', '涂登峰', '39', '王妍', null, '2018-02-02 18:00:02', '0');
INSERT INTO `check_relation` VALUES ('44', '28', '万强', '39', '王妍', null, '2018-02-02 18:00:03', '0');
INSERT INTO `check_relation` VALUES ('45', '33', '周丽咪', '39', '王妍', null, '2018-02-02 18:00:22', '0');
INSERT INTO `check_relation` VALUES ('46', '9', '郑海洋', '41', '杨露', null, '2018-02-02 18:01:26', '0');
INSERT INTO `check_relation` VALUES ('47', '10', '王维', '41', '杨露', null, '2018-02-02 18:01:31', '0');
INSERT INTO `check_relation` VALUES ('48', '12', '韩云登', '41', '杨露', null, '2018-02-02 18:01:36', '0');
INSERT INTO `check_relation` VALUES ('49', '19', '涂登峰', '41', '杨露', null, '2018-02-02 18:01:41', '0');
INSERT INTO `check_relation` VALUES ('50', '25', '王林飞', '41', '杨露', null, '2018-02-02 18:01:44', '0');
INSERT INTO `check_relation` VALUES ('51', '9', '郑海洋', '43', '虞炯辉', null, '2018-02-02 18:03:25', '0');
INSERT INTO `check_relation` VALUES ('52', '10', '王维', '43', '虞炯辉', null, '2018-02-02 18:03:27', '0');
INSERT INTO `check_relation` VALUES ('53', '21', '范毛毛', '43', '虞炯辉', null, '2018-02-02 18:03:30', '0');
INSERT INTO `check_relation` VALUES ('54', '33', '周丽咪', '43', '虞炯辉', null, '2018-02-02 18:03:32', '0');
INSERT INTO `check_relation` VALUES ('55', '62', '余正同', '43', '虞炯辉', null, '2018-02-02 18:03:57', '0');
INSERT INTO `check_relation` VALUES ('56', '22', '宗立', '45', '袁芝伟', null, '2018-02-02 18:05:03', '0');
INSERT INTO `check_relation` VALUES ('57', '25', '王林飞', '45', '袁芝伟', null, '2018-02-02 18:05:07', '0');
INSERT INTO `check_relation` VALUES ('58', '46', '黄为一', '45', '袁芝伟', null, '2018-02-02 18:05:10', '0');
INSERT INTO `check_relation` VALUES ('59', '47', '冯志强', '45', '袁芝伟', null, '2018-02-02 18:05:12', '0');
INSERT INTO `check_relation` VALUES ('60', '59', '黄鞭', '45', '袁芝伟', null, '2018-02-02 18:05:16', '0');
INSERT INTO `check_relation` VALUES ('61', '9', '郑海洋', '29', '刘崧', null, '2018-02-02 18:06:42', '0');
INSERT INTO `check_relation` VALUES ('62', '12', '韩云登', '29', '刘崧', null, '2018-02-02 18:06:44', '0');
INSERT INTO `check_relation` VALUES ('63', '19', '涂登峰', '29', '刘崧', null, '2018-02-02 18:06:47', '0');
INSERT INTO `check_relation` VALUES ('64', '22', '宗立', '29', '刘崧', null, '2018-02-02 18:06:49', '0');
INSERT INTO `check_relation` VALUES ('65', '57', '李吁', '29', '刘崧', null, '2018-02-02 18:06:52', '0');
INSERT INTO `check_relation` VALUES ('66', '8', '葛汤华', '49', '陈伊盈', null, '2018-02-02 18:08:29', '0');
INSERT INTO `check_relation` VALUES ('67', '25', '王林飞', '49', '陈伊盈', null, '2018-02-02 18:08:32', '0');
INSERT INTO `check_relation` VALUES ('68', '28', '万强', '49', '陈伊盈', null, '2018-02-02 18:08:35', '0');
INSERT INTO `check_relation` VALUES ('69', '30', '朱子晔', '49', '陈伊盈', null, '2018-02-02 18:08:37', '0');
INSERT INTO `check_relation` VALUES ('70', '33', '周丽咪', '49', '陈伊盈', null, '2018-02-02 18:08:41', '0');
INSERT INTO `check_relation` VALUES ('71', '12', '韩云登', '52', '陈默', null, '2018-02-02 18:10:16', '0');
INSERT INTO `check_relation` VALUES ('72', '28', '万强', '52', '陈默', null, '2018-02-02 18:10:12', '0');
INSERT INTO `check_relation` VALUES ('73', '30', '朱子晔', '52', '陈默', null, '2018-02-02 18:10:07', '0');
INSERT INTO `check_relation` VALUES ('74', '59', '黄鞭', '52', '陈默', null, '2018-02-02 18:10:05', '0');
INSERT INTO `check_relation` VALUES ('75', '63', '谢博文', '52', '陈默', null, '2018-02-02 18:10:01', '0');
INSERT INTO `check_relation` VALUES ('76', '9', '郑海洋', '53', '高国峰', null, '2018-02-02 18:11:39', '0');
INSERT INTO `check_relation` VALUES ('77', '10', '王维', '53', '高国峰', null, '2018-02-02 18:11:42', '0');
INSERT INTO `check_relation` VALUES ('78', '12', '韩云登', '53', '高国峰', null, '2018-02-02 18:11:44', '0');
INSERT INTO `check_relation` VALUES ('79', '21', '范毛毛', '53', '高国峰', null, '2018-02-02 18:11:46', '0');
INSERT INTO `check_relation` VALUES ('80', '28', '万强', '53', '高国峰', null, '2018-02-02 18:11:48', '0');
INSERT INTO `check_relation` VALUES ('81', '10', '王维', '54', '缪一帆', null, '2018-02-02 18:13:21', '0');
INSERT INTO `check_relation` VALUES ('82', '25', '王林飞', '54', '缪一帆', null, '2018-02-02 18:13:22', '0');
INSERT INTO `check_relation` VALUES ('83', '28', '万强', '54', '缪一帆', null, '2018-02-02 18:13:27', '0');
INSERT INTO `check_relation` VALUES ('84', '58', '赵佳祺', '54', '缪一帆', null, '2018-02-02 18:13:31', '0');
INSERT INTO `check_relation` VALUES ('85', '63', '谢博文', '54', '缪一帆', null, '2018-02-02 18:13:35', '0');
INSERT INTO `check_relation` VALUES ('86', '21', '范毛毛', '50', '陈秋婷', null, '2018-02-02 18:15:00', '0');
INSERT INTO `check_relation` VALUES ('87', '25', '王林飞', '50', '陈秋婷', null, '2018-02-02 18:15:03', '0');
INSERT INTO `check_relation` VALUES ('88', '33', '周丽咪', '50', '陈秋婷', null, '2018-02-02 18:15:07', '0');
INSERT INTO `check_relation` VALUES ('89', '59', '黄鞭', '50', '陈秋婷', null, '2018-02-02 18:15:10', '0');
INSERT INTO `check_relation` VALUES ('90', '63', '谢博文', '50', '陈秋婷', null, '2018-02-02 18:15:22', '0');

-- ----------------------------
-- Table structure for check_result
-- ----------------------------
DROP TABLE IF EXISTS `check_result`;
CREATE TABLE `check_result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `monthId` int(10) DEFAULT NULL COMMENT '月份ID',
  `month` varchar(20) DEFAULT NULL COMMENT '月份记录',
  `evaluatorId` int(20) DEFAULT NULL COMMENT '评价人ID',
  `evaluator` varchar(20) DEFAULT NULL COMMENT '评价人',
  `operationPostId` varchar(20) DEFAULT NULL COMMENT '被评价人ID',
  `operationPost` varchar(20) DEFAULT NULL COMMENT '被评价人',
  `checkOptionId` int(20) DEFAULT NULL COMMENT '评价选项ID',
  `checkOption` varchar(20) DEFAULT NULL COMMENT '评价选项',
  `checkResult` int(20) DEFAULT '0' COMMENT '评价结果',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4321 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_result
-- ----------------------------
INSERT INTO `check_result` VALUES ('3241', '4', '201805', '48', '陈佳伟', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3242', '4', '201805', '48', '陈佳伟', '11', '彭文君', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3243', '4', '201805', '48', '陈佳伟', '11', '彭文君', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3244', '4', '201805', '48', '陈佳伟', '11', '彭文君', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3245', '4', '201805', '48', '陈佳伟', '11', '彭文君', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3246', '4', '201805', '48', '陈佳伟', '11', '彭文君', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3247', '4', '201805', '59', '黄鞭', '11', '彭文君', '1', '服务量考评', '6', null, '2018-05-24 14:39:06', '0');
INSERT INTO `check_result` VALUES ('3248', '4', '201805', '59', '黄鞭', '11', '彭文君', '2', '服务时效', '6', null, '2018-05-24 14:39:06', '0');
INSERT INTO `check_result` VALUES ('3249', '4', '201805', '59', '黄鞭', '11', '彭文君', '3', '服务质量', '6', null, '2018-05-24 14:39:06', '0');
INSERT INTO `check_result` VALUES ('3250', '4', '201805', '59', '黄鞭', '11', '彭文君', '4', '服务表现', '4', null, '2018-05-24 14:39:06', '0');
INSERT INTO `check_result` VALUES ('3251', '4', '201805', '59', '黄鞭', '11', '彭文君', '5', '服务态度', '6', null, '2018-05-24 14:39:06', '0');
INSERT INTO `check_result` VALUES ('3252', '4', '201805', '59', '黄鞭', '11', '彭文君', '6', '综合满意度', '6', null, '2018-05-24 14:39:06', '0');
INSERT INTO `check_result` VALUES ('3253', '4', '201805', '27', '张艳', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3254', '4', '201805', '27', '张艳', '11', '彭文君', '2', '服务时效', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3255', '4', '201805', '27', '张艳', '11', '彭文君', '3', '服务质量', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3256', '4', '201805', '27', '张艳', '11', '彭文君', '4', '服务表现', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3257', '4', '201805', '27', '张艳', '11', '彭文君', '5', '服务态度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3258', '4', '201805', '27', '张艳', '11', '彭文君', '6', '综合满意度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3259', '4', '201805', '25', '王林飞', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3260', '4', '201805', '25', '王林飞', '11', '彭文君', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3261', '4', '201805', '25', '王林飞', '11', '彭文君', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3262', '4', '201805', '25', '王林飞', '11', '彭文君', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3263', '4', '201805', '25', '王林飞', '11', '彭文君', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3264', '4', '201805', '25', '王林飞', '11', '彭文君', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3265', '4', '201805', '8', '葛汤华', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3266', '4', '201805', '8', '葛汤华', '11', '彭文君', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3267', '4', '201805', '8', '葛汤华', '11', '彭文君', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3268', '4', '201805', '8', '葛汤华', '11', '彭文君', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3269', '4', '201805', '8', '葛汤华', '11', '彭文君', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3270', '4', '201805', '8', '葛汤华', '11', '彭文君', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3271', '4', '201805', '42', '李珍', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3272', '4', '201805', '42', '李珍', '11', '彭文君', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3273', '4', '201805', '42', '李珍', '11', '彭文君', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3274', '4', '201805', '42', '李珍', '11', '彭文君', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3275', '4', '201805', '42', '李珍', '11', '彭文君', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3276', '4', '201805', '42', '李珍', '11', '彭文君', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3277', '4', '201805', '21', '范毛毛', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-24 10:55:21', '0');
INSERT INTO `check_result` VALUES ('3278', '4', '201805', '21', '范毛毛', '11', '彭文君', '2', '服务时效', '9', null, '2018-05-24 10:55:21', '0');
INSERT INTO `check_result` VALUES ('3279', '4', '201805', '21', '范毛毛', '11', '彭文君', '3', '服务质量', '8', null, '2018-05-24 10:55:21', '0');
INSERT INTO `check_result` VALUES ('3280', '4', '201805', '21', '范毛毛', '11', '彭文君', '4', '服务表现', '7', null, '2018-05-24 10:55:21', '0');
INSERT INTO `check_result` VALUES ('3281', '4', '201805', '21', '范毛毛', '11', '彭文君', '5', '服务态度', '9', null, '2018-05-24 10:55:21', '0');
INSERT INTO `check_result` VALUES ('3282', '4', '201805', '21', '范毛毛', '11', '彭文君', '6', '综合满意度', '8', null, '2018-05-24 10:55:21', '0');
INSERT INTO `check_result` VALUES ('3283', '4', '201805', '47', '冯志强', '11', '彭文君', '1', '服务量考评', '6', null, '2018-05-24 14:51:26', '0');
INSERT INTO `check_result` VALUES ('3284', '4', '201805', '47', '冯志强', '11', '彭文君', '2', '服务时效', '8', null, '2018-05-24 14:51:26', '0');
INSERT INTO `check_result` VALUES ('3285', '4', '201805', '47', '冯志强', '11', '彭文君', '3', '服务质量', '7', null, '2018-05-24 14:51:26', '0');
INSERT INTO `check_result` VALUES ('3286', '4', '201805', '47', '冯志强', '11', '彭文君', '4', '服务表现', '7', null, '2018-05-24 14:51:26', '0');
INSERT INTO `check_result` VALUES ('3287', '4', '201805', '47', '冯志强', '11', '彭文君', '5', '服务态度', '8', null, '2018-05-24 14:51:26', '0');
INSERT INTO `check_result` VALUES ('3288', '4', '201805', '47', '冯志强', '11', '彭文君', '6', '综合满意度', '6', null, '2018-05-24 14:51:26', '0');
INSERT INTO `check_result` VALUES ('3289', '4', '201805', '62', '余正同', '11', '彭文君', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3290', '4', '201805', '62', '余正同', '11', '彭文君', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3291', '4', '201805', '62', '余正同', '11', '彭文君', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3292', '4', '201805', '62', '余正同', '11', '彭文君', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3293', '4', '201805', '62', '余正同', '11', '彭文君', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3294', '4', '201805', '62', '余正同', '11', '彭文君', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3295', '4', '201805', '46', '黄为一', '11', '彭文君', '1', '服务量考评', '6', null, '2018-05-24 14:44:56', '0');
INSERT INTO `check_result` VALUES ('3296', '4', '201805', '46', '黄为一', '11', '彭文君', '2', '服务时效', '6', null, '2018-05-24 14:44:56', '0');
INSERT INTO `check_result` VALUES ('3297', '4', '201805', '46', '黄为一', '11', '彭文君', '3', '服务质量', '6', null, '2018-05-24 14:44:56', '0');
INSERT INTO `check_result` VALUES ('3298', '4', '201805', '46', '黄为一', '11', '彭文君', '4', '服务表现', '6', null, '2018-05-24 14:44:56', '0');
INSERT INTO `check_result` VALUES ('3299', '4', '201805', '46', '黄为一', '11', '彭文君', '5', '服务态度', '6', null, '2018-05-24 14:44:56', '0');
INSERT INTO `check_result` VALUES ('3300', '4', '201805', '46', '黄为一', '11', '彭文君', '6', '综合满意度', '6', null, '2018-05-24 14:44:56', '0');
INSERT INTO `check_result` VALUES ('3301', '4', '201805', '61', '王韵盟', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3302', '4', '201805', '61', '王韵盟', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3303', '4', '201805', '61', '王韵盟', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3304', '4', '201805', '61', '王韵盟', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3305', '4', '201805', '61', '王韵盟', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3306', '4', '201805', '61', '王韵盟', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3307', '4', '201805', '28', '万强', '13', '宋金凤', '1', '服务量考评', '6', null, '2018-05-24 10:30:00', '0');
INSERT INTO `check_result` VALUES ('3308', '4', '201805', '28', '万强', '13', '宋金凤', '2', '服务时效', '6', null, '2018-05-24 10:30:00', '0');
INSERT INTO `check_result` VALUES ('3309', '4', '201805', '28', '万强', '13', '宋金凤', '3', '服务质量', '6', null, '2018-05-24 10:30:00', '0');
INSERT INTO `check_result` VALUES ('3310', '4', '201805', '28', '万强', '13', '宋金凤', '4', '服务表现', '6', null, '2018-05-24 10:30:00', '0');
INSERT INTO `check_result` VALUES ('3311', '4', '201805', '28', '万强', '13', '宋金凤', '5', '服务态度', '7', null, '2018-05-24 10:30:00', '0');
INSERT INTO `check_result` VALUES ('3312', '4', '201805', '28', '万强', '13', '宋金凤', '6', '综合满意度', '6', null, '2018-05-24 10:30:00', '0');
INSERT INTO `check_result` VALUES ('3313', '4', '201805', '58', '赵佳祺', '13', '宋金凤', '1', '服务量考评', '6', null, '2018-05-24 13:50:24', '0');
INSERT INTO `check_result` VALUES ('3314', '4', '201805', '58', '赵佳祺', '13', '宋金凤', '2', '服务时效', '6', null, '2018-05-24 13:50:24', '0');
INSERT INTO `check_result` VALUES ('3315', '4', '201805', '58', '赵佳祺', '13', '宋金凤', '3', '服务质量', '6', null, '2018-05-24 13:50:24', '0');
INSERT INTO `check_result` VALUES ('3316', '4', '201805', '58', '赵佳祺', '13', '宋金凤', '4', '服务表现', '6', null, '2018-05-24 13:50:24', '0');
INSERT INTO `check_result` VALUES ('3317', '4', '201805', '58', '赵佳祺', '13', '宋金凤', '5', '服务态度', '6', null, '2018-05-24 13:50:24', '0');
INSERT INTO `check_result` VALUES ('3318', '4', '201805', '58', '赵佳祺', '13', '宋金凤', '6', '综合满意度', '6', null, '2018-05-24 13:50:24', '0');
INSERT INTO `check_result` VALUES ('3319', '4', '201805', '9', '郑海洋', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3320', '4', '201805', '9', '郑海洋', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3321', '4', '201805', '9', '郑海洋', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3322', '4', '201805', '9', '郑海洋', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3323', '4', '201805', '9', '郑海洋', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3324', '4', '201805', '9', '郑海洋', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3325', '4', '201805', '33', '周丽咪', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3326', '4', '201805', '33', '周丽咪', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3327', '4', '201805', '33', '周丽咪', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3328', '4', '201805', '33', '周丽咪', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3329', '4', '201805', '33', '周丽咪', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3330', '4', '201805', '33', '周丽咪', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3331', '4', '201805', '57', '李吁', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3332', '4', '201805', '57', '李吁', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3333', '4', '201805', '57', '李吁', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3334', '4', '201805', '57', '李吁', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3335', '4', '201805', '57', '李吁', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3336', '4', '201805', '57', '李吁', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3337', '4', '201805', '60', '钟文宇', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3338', '4', '201805', '60', '钟文宇', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3339', '4', '201805', '60', '钟文宇', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3340', '4', '201805', '60', '钟文宇', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3341', '4', '201805', '60', '钟文宇', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3342', '4', '201805', '60', '钟文宇', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3343', '4', '201805', '10', '王维', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3344', '4', '201805', '10', '王维', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3345', '4', '201805', '10', '王维', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3346', '4', '201805', '10', '王维', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3347', '4', '201805', '10', '王维', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3348', '4', '201805', '10', '王维', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3349', '4', '201805', '42', '李珍', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3350', '4', '201805', '42', '李珍', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3351', '4', '201805', '42', '李珍', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3352', '4', '201805', '42', '李珍', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3353', '4', '201805', '42', '李珍', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3354', '4', '201805', '42', '李珍', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3355', '4', '201805', '25', '王林飞', '13', '宋金凤', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3356', '4', '201805', '25', '王林飞', '13', '宋金凤', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3357', '4', '201805', '25', '王林飞', '13', '宋金凤', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3358', '4', '201805', '25', '王林飞', '13', '宋金凤', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3359', '4', '201805', '25', '王林飞', '13', '宋金凤', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3360', '4', '201805', '25', '王林飞', '13', '宋金凤', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3361', '4', '201805', '28', '万强', '16', '鲁晓', '1', '服务量考评', '6', null, '2018-05-24 09:57:48', '0');
INSERT INTO `check_result` VALUES ('3362', '4', '201805', '28', '万强', '16', '鲁晓', '2', '服务时效', '6', null, '2018-05-24 09:57:48', '0');
INSERT INTO `check_result` VALUES ('3363', '4', '201805', '28', '万强', '16', '鲁晓', '3', '服务质量', '6', null, '2018-05-24 09:57:48', '0');
INSERT INTO `check_result` VALUES ('3364', '4', '201805', '28', '万强', '16', '鲁晓', '4', '服务表现', '6', null, '2018-05-24 09:57:48', '0');
INSERT INTO `check_result` VALUES ('3365', '4', '201805', '28', '万强', '16', '鲁晓', '5', '服务态度', '6', null, '2018-05-24 09:57:48', '0');
INSERT INTO `check_result` VALUES ('3366', '4', '201805', '28', '万强', '16', '鲁晓', '6', '综合满意度', '6', null, '2018-05-24 09:57:48', '0');
INSERT INTO `check_result` VALUES ('3367', '4', '201805', '15', '李沙', '16', '鲁晓', '1', '服务量考评', '6', null, '2018-05-24 10:35:03', '0');
INSERT INTO `check_result` VALUES ('3368', '4', '201805', '15', '李沙', '16', '鲁晓', '2', '服务时效', '6', null, '2018-05-24 10:35:03', '0');
INSERT INTO `check_result` VALUES ('3369', '4', '201805', '15', '李沙', '16', '鲁晓', '3', '服务质量', '6', null, '2018-05-24 10:35:03', '0');
INSERT INTO `check_result` VALUES ('3370', '4', '201805', '15', '李沙', '16', '鲁晓', '4', '服务表现', '6', null, '2018-05-24 10:35:03', '0');
INSERT INTO `check_result` VALUES ('3371', '4', '201805', '15', '李沙', '16', '鲁晓', '5', '服务态度', '6', null, '2018-05-24 10:35:03', '0');
INSERT INTO `check_result` VALUES ('3372', '4', '201805', '15', '李沙', '16', '鲁晓', '6', '综合满意度', '6', null, '2018-05-24 10:35:03', '0');
INSERT INTO `check_result` VALUES ('3373', '4', '201805', '22', '宗立', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 10:48:34', '0');
INSERT INTO `check_result` VALUES ('3374', '4', '201805', '22', '宗立', '16', '鲁晓', '2', '服务时效', '8', null, '2018-05-24 10:48:34', '0');
INSERT INTO `check_result` VALUES ('3375', '4', '201805', '22', '宗立', '16', '鲁晓', '3', '服务质量', '8', null, '2018-05-24 10:48:34', '0');
INSERT INTO `check_result` VALUES ('3376', '4', '201805', '22', '宗立', '16', '鲁晓', '4', '服务表现', '9', null, '2018-05-24 10:48:34', '0');
INSERT INTO `check_result` VALUES ('3377', '4', '201805', '22', '宗立', '16', '鲁晓', '5', '服务态度', '3', null, '2018-05-24 10:48:34', '0');
INSERT INTO `check_result` VALUES ('3378', '4', '201805', '22', '宗立', '16', '鲁晓', '6', '综合满意度', '3', null, '2018-05-24 10:48:34', '0');
INSERT INTO `check_result` VALUES ('3379', '4', '201805', '33', '周丽咪', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3380', '4', '201805', '33', '周丽咪', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3381', '4', '201805', '33', '周丽咪', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3382', '4', '201805', '33', '周丽咪', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3383', '4', '201805', '33', '周丽咪', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3384', '4', '201805', '33', '周丽咪', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3385', '4', '201805', '9', '郑海洋', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3386', '4', '201805', '9', '郑海洋', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3387', '4', '201805', '9', '郑海洋', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3388', '4', '201805', '9', '郑海洋', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3389', '4', '201805', '9', '郑海洋', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3390', '4', '201805', '9', '郑海洋', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3391', '4', '201805', '48', '陈佳伟', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3392', '4', '201805', '48', '陈佳伟', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3393', '4', '201805', '48', '陈佳伟', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3394', '4', '201805', '48', '陈佳伟', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3395', '4', '201805', '48', '陈佳伟', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3396', '4', '201805', '48', '陈佳伟', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3397', '4', '201805', '8', '葛汤华', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3398', '4', '201805', '8', '葛汤华', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3399', '4', '201805', '8', '葛汤华', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3400', '4', '201805', '8', '葛汤华', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3401', '4', '201805', '8', '葛汤华', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3402', '4', '201805', '8', '葛汤华', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3403', '4', '201805', '14', '杨少清', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3404', '4', '201805', '14', '杨少清', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3405', '4', '201805', '14', '杨少清', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3406', '4', '201805', '14', '杨少清', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3407', '4', '201805', '14', '杨少清', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3408', '4', '201805', '14', '杨少清', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3409', '4', '201805', '62', '余正同', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3410', '4', '201805', '62', '余正同', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3411', '4', '201805', '62', '余正同', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3412', '4', '201805', '62', '余正同', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3413', '4', '201805', '62', '余正同', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3414', '4', '201805', '62', '余正同', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3415', '4', '201805', '42', '李珍', '16', '鲁晓', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3416', '4', '201805', '42', '李珍', '16', '鲁晓', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3417', '4', '201805', '42', '李珍', '16', '鲁晓', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3418', '4', '201805', '42', '李珍', '16', '鲁晓', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3419', '4', '201805', '42', '李珍', '16', '鲁晓', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3420', '4', '201805', '42', '李珍', '16', '鲁晓', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3421', '4', '201805', '10', '王维', '17', '王超楠', '1', '服务量考评', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3422', '4', '201805', '10', '王维', '17', '王超楠', '2', '服务时效', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3423', '4', '201805', '10', '王维', '17', '王超楠', '3', '服务质量', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3424', '4', '201805', '10', '王维', '17', '王超楠', '4', '服务表现', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3425', '4', '201805', '10', '王维', '17', '王超楠', '5', '服务态度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3426', '4', '201805', '10', '王维', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3427', '4', '201805', '61', '王韵盟', '17', '王超楠', '1', '服务量考评', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3428', '4', '201805', '61', '王韵盟', '17', '王超楠', '2', '服务时效', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3429', '4', '201805', '61', '王韵盟', '17', '王超楠', '3', '服务质量', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3430', '4', '201805', '61', '王韵盟', '17', '王超楠', '4', '服务表现', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3431', '4', '201805', '61', '王韵盟', '17', '王超楠', '5', '服务态度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3432', '4', '201805', '61', '王韵盟', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3433', '4', '201805', '21', '范毛毛', '17', '王超楠', '1', '服务量考评', '8', null, '2018-05-24 10:55:47', '0');
INSERT INTO `check_result` VALUES ('3434', '4', '201805', '21', '范毛毛', '17', '王超楠', '2', '服务时效', '8', null, '2018-05-24 10:55:47', '0');
INSERT INTO `check_result` VALUES ('3435', '4', '201805', '21', '范毛毛', '17', '王超楠', '3', '服务质量', '7', null, '2018-05-24 10:55:47', '0');
INSERT INTO `check_result` VALUES ('3436', '4', '201805', '21', '范毛毛', '17', '王超楠', '4', '服务表现', '7', null, '2018-05-24 10:55:47', '0');
INSERT INTO `check_result` VALUES ('3437', '4', '201805', '21', '范毛毛', '17', '王超楠', '5', '服务态度', '7', null, '2018-05-24 10:55:47', '0');
INSERT INTO `check_result` VALUES ('3438', '4', '201805', '21', '范毛毛', '17', '王超楠', '6', '综合满意度', '7', null, '2018-05-24 10:55:47', '0');
INSERT INTO `check_result` VALUES ('3439', '4', '201805', '19', '涂登峰', '17', '王超楠', '1', '服务量考评', '6', null, '2018-05-24 14:28:00', '0');
INSERT INTO `check_result` VALUES ('3440', '4', '201805', '19', '涂登峰', '17', '王超楠', '2', '服务时效', '6', null, '2018-05-24 14:28:00', '0');
INSERT INTO `check_result` VALUES ('3441', '4', '201805', '19', '涂登峰', '17', '王超楠', '3', '服务质量', '6', null, '2018-05-24 14:28:00', '0');
INSERT INTO `check_result` VALUES ('3442', '4', '201805', '19', '涂登峰', '17', '王超楠', '4', '服务表现', '6', null, '2018-05-24 14:28:00', '0');
INSERT INTO `check_result` VALUES ('3443', '4', '201805', '19', '涂登峰', '17', '王超楠', '5', '服务态度', '6', null, '2018-05-24 14:28:00', '0');
INSERT INTO `check_result` VALUES ('3444', '4', '201805', '19', '涂登峰', '17', '王超楠', '6', '综合满意度', '6', null, '2018-05-24 14:28:00', '0');
INSERT INTO `check_result` VALUES ('3445', '4', '201805', '14', '杨少清', '17', '王超楠', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3446', '4', '201805', '14', '杨少清', '17', '王超楠', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3447', '4', '201805', '14', '杨少清', '17', '王超楠', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3448', '4', '201805', '14', '杨少清', '17', '王超楠', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3449', '4', '201805', '14', '杨少清', '17', '王超楠', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3450', '4', '201805', '14', '杨少清', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3451', '4', '201805', '38', '洪卫峰', '17', '王超楠', '1', '服务量考评', '6', null, '2018-05-24 14:51:55', '0');
INSERT INTO `check_result` VALUES ('3452', '4', '201805', '38', '洪卫峰', '17', '王超楠', '2', '服务时效', '6', null, '2018-05-24 14:51:55', '0');
INSERT INTO `check_result` VALUES ('3453', '4', '201805', '38', '洪卫峰', '17', '王超楠', '3', '服务质量', '7', null, '2018-05-24 14:51:55', '0');
INSERT INTO `check_result` VALUES ('3454', '4', '201805', '38', '洪卫峰', '17', '王超楠', '4', '服务表现', '6', null, '2018-05-24 14:51:55', '0');
INSERT INTO `check_result` VALUES ('3455', '4', '201805', '38', '洪卫峰', '17', '王超楠', '5', '服务态度', '7', null, '2018-05-24 14:51:55', '0');
INSERT INTO `check_result` VALUES ('3456', '4', '201805', '38', '洪卫峰', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 14:51:55', '0');
INSERT INTO `check_result` VALUES ('3457', '4', '201805', '46', '黄为一', '17', '王超楠', '1', '服务量考评', '8', null, '2018-05-24 14:45:34', '0');
INSERT INTO `check_result` VALUES ('3458', '4', '201805', '46', '黄为一', '17', '王超楠', '2', '服务时效', '7', null, '2018-05-24 14:45:34', '0');
INSERT INTO `check_result` VALUES ('3459', '4', '201805', '46', '黄为一', '17', '王超楠', '3', '服务质量', '8', null, '2018-05-24 14:45:34', '0');
INSERT INTO `check_result` VALUES ('3460', '4', '201805', '46', '黄为一', '17', '王超楠', '4', '服务表现', '8', null, '2018-05-24 14:45:34', '0');
INSERT INTO `check_result` VALUES ('3461', '4', '201805', '46', '黄为一', '17', '王超楠', '5', '服务态度', '6', null, '2018-05-24 14:45:34', '0');
INSERT INTO `check_result` VALUES ('3462', '4', '201805', '46', '黄为一', '17', '王超楠', '6', '综合满意度', '7', null, '2018-05-24 14:45:34', '0');
INSERT INTO `check_result` VALUES ('3463', '4', '201805', '48', '陈佳伟', '17', '王超楠', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3464', '4', '201805', '48', '陈佳伟', '17', '王超楠', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3465', '4', '201805', '48', '陈佳伟', '17', '王超楠', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3466', '4', '201805', '48', '陈佳伟', '17', '王超楠', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3467', '4', '201805', '48', '陈佳伟', '17', '王超楠', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3468', '4', '201805', '48', '陈佳伟', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3469', '4', '201805', '59', '黄鞭', '17', '王超楠', '1', '服务量考评', '9', null, '2018-05-24 14:38:36', '0');
INSERT INTO `check_result` VALUES ('3470', '4', '201805', '59', '黄鞭', '17', '王超楠', '2', '服务时效', '6', null, '2018-05-24 14:38:36', '0');
INSERT INTO `check_result` VALUES ('3471', '4', '201805', '59', '黄鞭', '17', '王超楠', '3', '服务质量', '6', null, '2018-05-24 14:38:36', '0');
INSERT INTO `check_result` VALUES ('3472', '4', '201805', '59', '黄鞭', '17', '王超楠', '4', '服务表现', '6', null, '2018-05-24 14:38:36', '0');
INSERT INTO `check_result` VALUES ('3473', '4', '201805', '59', '黄鞭', '17', '王超楠', '5', '服务态度', '6', null, '2018-05-24 14:38:36', '0');
INSERT INTO `check_result` VALUES ('3474', '4', '201805', '59', '黄鞭', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 14:38:36', '0');
INSERT INTO `check_result` VALUES ('3475', '4', '201805', '30', '朱子晔', '17', '王超楠', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3476', '4', '201805', '30', '朱子晔', '17', '王超楠', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3477', '4', '201805', '30', '朱子晔', '17', '王超楠', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3478', '4', '201805', '30', '朱子晔', '17', '王超楠', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3479', '4', '201805', '30', '朱子晔', '17', '王超楠', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3480', '4', '201805', '30', '朱子晔', '17', '王超楠', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3481', '4', '201805', '48', '陈佳伟', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3482', '4', '201805', '48', '陈佳伟', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3483', '4', '201805', '48', '陈佳伟', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3484', '4', '201805', '48', '陈佳伟', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3485', '4', '201805', '48', '陈佳伟', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3486', '4', '201805', '48', '陈佳伟', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3487', '4', '201805', '25', '王林飞', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3488', '4', '201805', '25', '王林飞', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3489', '4', '201805', '25', '王林飞', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3490', '4', '201805', '25', '王林飞', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3491', '4', '201805', '25', '王林飞', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3492', '4', '201805', '25', '王林飞', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3493', '4', '201805', '58', '赵佳祺', '23', '杨莉', '1', '服务量考评', '6', null, '2018-05-24 13:50:40', '0');
INSERT INTO `check_result` VALUES ('3494', '4', '201805', '58', '赵佳祺', '23', '杨莉', '2', '服务时效', '6', null, '2018-05-24 13:50:40', '0');
INSERT INTO `check_result` VALUES ('3495', '4', '201805', '58', '赵佳祺', '23', '杨莉', '3', '服务质量', '6', null, '2018-05-24 13:50:40', '0');
INSERT INTO `check_result` VALUES ('3496', '4', '201805', '58', '赵佳祺', '23', '杨莉', '4', '服务表现', '6', null, '2018-05-24 13:50:40', '0');
INSERT INTO `check_result` VALUES ('3497', '4', '201805', '58', '赵佳祺', '23', '杨莉', '5', '服务态度', '6', null, '2018-05-24 13:50:40', '0');
INSERT INTO `check_result` VALUES ('3498', '4', '201805', '58', '赵佳祺', '23', '杨莉', '6', '综合满意度', '6', null, '2018-05-24 13:50:40', '0');
INSERT INTO `check_result` VALUES ('3499', '4', '201805', '8', '葛汤华', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3500', '4', '201805', '8', '葛汤华', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3501', '4', '201805', '8', '葛汤华', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3502', '4', '201805', '8', '葛汤华', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3503', '4', '201805', '8', '葛汤华', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3504', '4', '201805', '8', '葛汤华', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3505', '4', '201805', '57', '李吁', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3506', '4', '201805', '57', '李吁', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3507', '4', '201805', '57', '李吁', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3508', '4', '201805', '57', '李吁', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3509', '4', '201805', '57', '李吁', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3510', '4', '201805', '57', '李吁', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3511', '4', '201805', '33', '周丽咪', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3512', '4', '201805', '33', '周丽咪', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3513', '4', '201805', '33', '周丽咪', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3514', '4', '201805', '33', '周丽咪', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3515', '4', '201805', '33', '周丽咪', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3516', '4', '201805', '33', '周丽咪', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3517', '4', '201805', '38', '洪卫峰', '23', '杨莉', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3518', '4', '201805', '38', '洪卫峰', '23', '杨莉', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3519', '4', '201805', '38', '洪卫峰', '23', '杨莉', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3520', '4', '201805', '38', '洪卫峰', '23', '杨莉', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3521', '4', '201805', '38', '洪卫峰', '23', '杨莉', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3522', '4', '201805', '38', '洪卫峰', '23', '杨莉', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3523', '4', '201805', '10', '王维', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3524', '4', '201805', '10', '王维', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3525', '4', '201805', '10', '王维', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3526', '4', '201805', '10', '王维', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3527', '4', '201805', '10', '王维', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3528', '4', '201805', '10', '王维', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3529', '4', '201805', '19', '涂登峰', '23', '杨莉', '1', '服务量考评', '6', null, '2018-05-24 14:28:10', '0');
INSERT INTO `check_result` VALUES ('3530', '4', '201805', '19', '涂登峰', '23', '杨莉', '2', '服务时效', '6', null, '2018-05-24 14:28:10', '0');
INSERT INTO `check_result` VALUES ('3531', '4', '201805', '19', '涂登峰', '23', '杨莉', '3', '服务质量', '6', null, '2018-05-24 14:28:10', '0');
INSERT INTO `check_result` VALUES ('3532', '4', '201805', '19', '涂登峰', '23', '杨莉', '4', '服务表现', '6', null, '2018-05-24 14:28:10', '0');
INSERT INTO `check_result` VALUES ('3533', '4', '201805', '19', '涂登峰', '23', '杨莉', '5', '服务态度', '6', null, '2018-05-24 14:28:10', '0');
INSERT INTO `check_result` VALUES ('3534', '4', '201805', '19', '涂登峰', '23', '杨莉', '6', '综合满意度', '6', null, '2018-05-24 14:28:10', '0');
INSERT INTO `check_result` VALUES ('3535', '4', '201805', '30', '朱子晔', '23', '杨莉', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3536', '4', '201805', '30', '朱子晔', '23', '杨莉', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3537', '4', '201805', '30', '朱子晔', '23', '杨莉', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3538', '4', '201805', '30', '朱子晔', '23', '杨莉', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3539', '4', '201805', '30', '朱子晔', '23', '杨莉', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3540', '4', '201805', '30', '朱子晔', '23', '杨莉', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3541', '4', '201805', '15', '李沙', '24', '杨仙', '1', '服务量考评', '2', null, '2018-05-24 10:35:38', '0');
INSERT INTO `check_result` VALUES ('3542', '4', '201805', '15', '李沙', '24', '杨仙', '2', '服务时效', '2', null, '2018-05-24 10:35:38', '0');
INSERT INTO `check_result` VALUES ('3543', '4', '201805', '15', '李沙', '24', '杨仙', '3', '服务质量', '2', null, '2018-05-24 10:35:38', '0');
INSERT INTO `check_result` VALUES ('3544', '4', '201805', '15', '李沙', '24', '杨仙', '4', '服务表现', '2', null, '2018-05-24 10:35:38', '0');
INSERT INTO `check_result` VALUES ('3545', '4', '201805', '15', '李沙', '24', '杨仙', '5', '服务态度', '4', null, '2018-05-24 10:35:38', '0');
INSERT INTO `check_result` VALUES ('3546', '4', '201805', '15', '李沙', '24', '杨仙', '6', '综合满意度', '4', null, '2018-05-24 10:35:38', '0');
INSERT INTO `check_result` VALUES ('3547', '4', '201805', '61', '王韵盟', '24', '杨仙', '1', '服务量考评', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3548', '4', '201805', '61', '王韵盟', '24', '杨仙', '2', '服务时效', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3549', '4', '201805', '61', '王韵盟', '24', '杨仙', '3', '服务质量', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3550', '4', '201805', '61', '王韵盟', '24', '杨仙', '4', '服务表现', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3551', '4', '201805', '61', '王韵盟', '24', '杨仙', '5', '服务态度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3552', '4', '201805', '61', '王韵盟', '24', '杨仙', '6', '综合满意度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3553', '4', '201805', '30', '朱子晔', '24', '杨仙', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3554', '4', '201805', '30', '朱子晔', '24', '杨仙', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3555', '4', '201805', '30', '朱子晔', '24', '杨仙', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3556', '4', '201805', '30', '朱子晔', '24', '杨仙', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3557', '4', '201805', '30', '朱子晔', '24', '杨仙', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3558', '4', '201805', '30', '朱子晔', '24', '杨仙', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3559', '4', '201805', '62', '余正同', '24', '杨仙', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3560', '4', '201805', '62', '余正同', '24', '杨仙', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3561', '4', '201805', '62', '余正同', '24', '杨仙', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3562', '4', '201805', '62', '余正同', '24', '杨仙', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3563', '4', '201805', '62', '余正同', '24', '杨仙', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3564', '4', '201805', '62', '余正同', '24', '杨仙', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3565', '4', '201805', '47', '冯志强', '24', '杨仙', '1', '服务量考评', '6', null, '2018-05-24 14:51:36', '0');
INSERT INTO `check_result` VALUES ('3566', '4', '201805', '47', '冯志强', '24', '杨仙', '2', '服务时效', '6', null, '2018-05-24 14:51:36', '0');
INSERT INTO `check_result` VALUES ('3567', '4', '201805', '47', '冯志强', '24', '杨仙', '3', '服务质量', '6', null, '2018-05-24 14:51:36', '0');
INSERT INTO `check_result` VALUES ('3568', '4', '201805', '47', '冯志强', '24', '杨仙', '4', '服务表现', '6', null, '2018-05-24 14:51:36', '0');
INSERT INTO `check_result` VALUES ('3569', '4', '201805', '47', '冯志强', '24', '杨仙', '5', '服务态度', '6', null, '2018-05-24 14:51:36', '0');
INSERT INTO `check_result` VALUES ('3570', '4', '201805', '47', '冯志强', '24', '杨仙', '6', '综合满意度', '6', null, '2018-05-24 14:51:36', '0');
INSERT INTO `check_result` VALUES ('3571', '4', '201805', '42', '李珍', '24', '杨仙', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3572', '4', '201805', '42', '李珍', '24', '杨仙', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3573', '4', '201805', '42', '李珍', '24', '杨仙', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3574', '4', '201805', '42', '李珍', '24', '杨仙', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3575', '4', '201805', '42', '李珍', '24', '杨仙', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3576', '4', '201805', '42', '李珍', '24', '杨仙', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3577', '4', '201805', '12', '韩云登', '24', '杨仙', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3578', '4', '201805', '12', '韩云登', '24', '杨仙', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3579', '4', '201805', '12', '韩云登', '24', '杨仙', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3580', '4', '201805', '12', '韩云登', '24', '杨仙', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3581', '4', '201805', '12', '韩云登', '24', '杨仙', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3582', '4', '201805', '12', '韩云登', '24', '杨仙', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3583', '4', '201805', '14', '杨少清', '24', '杨仙', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3584', '4', '201805', '14', '杨少清', '24', '杨仙', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3585', '4', '201805', '14', '杨少清', '24', '杨仙', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3586', '4', '201805', '14', '杨少清', '24', '杨仙', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3587', '4', '201805', '14', '杨少清', '24', '杨仙', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3588', '4', '201805', '14', '杨少清', '24', '杨仙', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('3589', '4', '201805', '19', '涂登峰', '24', '杨仙', '1', '服务量考评', '6', null, '2018-05-24 14:29:00', '0');
INSERT INTO `check_result` VALUES ('3590', '4', '201805', '19', '涂登峰', '24', '杨仙', '2', '服务时效', '6', null, '2018-05-24 14:29:00', '0');
INSERT INTO `check_result` VALUES ('3591', '4', '201805', '19', '涂登峰', '24', '杨仙', '3', '服务质量', '6', null, '2018-05-24 14:29:00', '0');
INSERT INTO `check_result` VALUES ('3592', '4', '201805', '19', '涂登峰', '24', '杨仙', '4', '服务表现', '6', null, '2018-05-24 14:29:00', '0');
INSERT INTO `check_result` VALUES ('3593', '4', '201805', '19', '涂登峰', '24', '杨仙', '5', '服务态度', '8', null, '2018-05-24 14:29:00', '0');
INSERT INTO `check_result` VALUES ('3594', '4', '201805', '19', '涂登峰', '24', '杨仙', '6', '综合满意度', '6', null, '2018-05-24 14:29:00', '0');
INSERT INTO `check_result` VALUES ('3595', '4', '201805', '21', '范毛毛', '24', '杨仙', '1', '服务量考评', '6', null, '2018-05-24 10:58:18', '0');
INSERT INTO `check_result` VALUES ('3596', '4', '201805', '21', '范毛毛', '24', '杨仙', '2', '服务时效', '6', null, '2018-05-24 10:58:18', '0');
INSERT INTO `check_result` VALUES ('3597', '4', '201805', '21', '范毛毛', '24', '杨仙', '3', '服务质量', '6', null, '2018-05-24 10:58:18', '0');
INSERT INTO `check_result` VALUES ('3598', '4', '201805', '21', '范毛毛', '24', '杨仙', '4', '服务表现', '6', null, '2018-05-24 10:58:18', '0');
INSERT INTO `check_result` VALUES ('3599', '4', '201805', '21', '范毛毛', '24', '杨仙', '5', '服务态度', '6', null, '2018-05-24 10:58:18', '0');
INSERT INTO `check_result` VALUES ('3600', '4', '201805', '21', '范毛毛', '24', '杨仙', '6', '综合满意度', '6', null, '2018-05-24 10:58:18', '0');
INSERT INTO `check_result` VALUES ('3601', '4', '201805', '22', '宗立', '26', '季寰宇', '1', '服务量考评', '10', null, '2018-05-24 10:50:46', '0');
INSERT INTO `check_result` VALUES ('3602', '4', '201805', '22', '宗立', '26', '季寰宇', '2', '服务时效', '9', null, '2018-05-24 10:50:46', '0');
INSERT INTO `check_result` VALUES ('3603', '4', '201805', '22', '宗立', '26', '季寰宇', '3', '服务质量', '7', null, '2018-05-24 10:50:46', '0');
INSERT INTO `check_result` VALUES ('3604', '4', '201805', '22', '宗立', '26', '季寰宇', '4', '服务表现', '9', null, '2018-05-24 10:50:46', '0');
INSERT INTO `check_result` VALUES ('3605', '4', '201805', '22', '宗立', '26', '季寰宇', '5', '服务态度', '9', null, '2018-05-24 10:50:46', '0');
INSERT INTO `check_result` VALUES ('3606', '4', '201805', '22', '宗立', '26', '季寰宇', '6', '综合满意度', '2', null, '2018-05-24 10:50:46', '0');
INSERT INTO `check_result` VALUES ('3607', '4', '201805', '21', '范毛毛', '26', '季寰宇', '1', '服务量考评', '6', null, '2018-05-24 10:59:30', '0');
INSERT INTO `check_result` VALUES ('3608', '4', '201805', '21', '范毛毛', '26', '季寰宇', '2', '服务时效', '6', null, '2018-05-24 10:59:30', '0');
INSERT INTO `check_result` VALUES ('3609', '4', '201805', '21', '范毛毛', '26', '季寰宇', '3', '服务质量', '6', null, '2018-05-24 10:59:30', '0');
INSERT INTO `check_result` VALUES ('3610', '4', '201805', '21', '范毛毛', '26', '季寰宇', '4', '服务表现', '6', null, '2018-05-24 10:59:30', '0');
INSERT INTO `check_result` VALUES ('3611', '4', '201805', '21', '范毛毛', '26', '季寰宇', '5', '服务态度', '6', null, '2018-05-24 10:59:30', '0');
INSERT INTO `check_result` VALUES ('3612', '4', '201805', '21', '范毛毛', '26', '季寰宇', '6', '综合满意度', '7', null, '2018-05-24 10:59:30', '0');
INSERT INTO `check_result` VALUES ('3613', '4', '201805', '46', '黄为一', '26', '季寰宇', '1', '服务量考评', '7', null, '2018-05-24 15:55:37', '0');
INSERT INTO `check_result` VALUES ('3614', '4', '201805', '46', '黄为一', '26', '季寰宇', '2', '服务时效', '7', null, '2018-05-24 15:55:37', '0');
INSERT INTO `check_result` VALUES ('3615', '4', '201805', '46', '黄为一', '26', '季寰宇', '3', '服务质量', '4', null, '2018-05-24 15:55:37', '0');
INSERT INTO `check_result` VALUES ('3616', '4', '201805', '46', '黄为一', '26', '季寰宇', '4', '服务表现', '4', null, '2018-05-24 15:55:37', '0');
INSERT INTO `check_result` VALUES ('3617', '4', '201805', '46', '黄为一', '26', '季寰宇', '5', '服务态度', '10', null, '2018-05-24 15:55:37', '0');
INSERT INTO `check_result` VALUES ('3618', '4', '201805', '46', '黄为一', '26', '季寰宇', '6', '综合满意度', '10', null, '2018-05-24 15:55:37', '0');
INSERT INTO `check_result` VALUES ('3619', '4', '201805', '63', '谢博文', '26', '季寰宇', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3620', '4', '201805', '63', '谢博文', '26', '季寰宇', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3621', '4', '201805', '63', '谢博文', '26', '季寰宇', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3622', '4', '201805', '63', '谢博文', '26', '季寰宇', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3623', '4', '201805', '63', '谢博文', '26', '季寰宇', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3624', '4', '201805', '63', '谢博文', '26', '季寰宇', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3625', '4', '201805', '59', '黄鞭', '26', '季寰宇', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3626', '4', '201805', '59', '黄鞭', '26', '季寰宇', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3627', '4', '201805', '59', '黄鞭', '26', '季寰宇', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3628', '4', '201805', '59', '黄鞭', '26', '季寰宇', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3629', '4', '201805', '59', '黄鞭', '26', '季寰宇', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3630', '4', '201805', '59', '黄鞭', '26', '季寰宇', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3631', '4', '201805', '60', '钟文宇', '26', '季寰宇', '1', '服务量考评', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3632', '4', '201805', '60', '钟文宇', '26', '季寰宇', '2', '服务时效', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3633', '4', '201805', '60', '钟文宇', '26', '季寰宇', '3', '服务质量', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3634', '4', '201805', '60', '钟文宇', '26', '季寰宇', '4', '服务表现', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3635', '4', '201805', '60', '钟文宇', '26', '季寰宇', '5', '服务态度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3636', '4', '201805', '60', '钟文宇', '26', '季寰宇', '6', '综合满意度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3637', '4', '201805', '61', '王韵盟', '26', '季寰宇', '1', '服务量考评', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3638', '4', '201805', '61', '王韵盟', '26', '季寰宇', '2', '服务时效', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3639', '4', '201805', '61', '王韵盟', '26', '季寰宇', '3', '服务质量', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3640', '4', '201805', '61', '王韵盟', '26', '季寰宇', '4', '服务表现', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3641', '4', '201805', '61', '王韵盟', '26', '季寰宇', '5', '服务态度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3642', '4', '201805', '61', '王韵盟', '26', '季寰宇', '6', '综合满意度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3643', '4', '201805', '12', '韩云登', '26', '季寰宇', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3644', '4', '201805', '12', '韩云登', '26', '季寰宇', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3645', '4', '201805', '12', '韩云登', '26', '季寰宇', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3646', '4', '201805', '12', '韩云登', '26', '季寰宇', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3647', '4', '201805', '12', '韩云登', '26', '季寰宇', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3648', '4', '201805', '12', '韩云登', '26', '季寰宇', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3649', '4', '201805', '42', '李珍', '26', '季寰宇', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3650', '4', '201805', '42', '李珍', '26', '季寰宇', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3651', '4', '201805', '42', '李珍', '26', '季寰宇', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3652', '4', '201805', '42', '李珍', '26', '季寰宇', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3653', '4', '201805', '42', '李珍', '26', '季寰宇', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3654', '4', '201805', '42', '李珍', '26', '季寰宇', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3655', '4', '201805', '33', '周丽咪', '26', '季寰宇', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3656', '4', '201805', '33', '周丽咪', '26', '季寰宇', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3657', '4', '201805', '33', '周丽咪', '26', '季寰宇', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3658', '4', '201805', '33', '周丽咪', '26', '季寰宇', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3659', '4', '201805', '33', '周丽咪', '26', '季寰宇', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3660', '4', '201805', '33', '周丽咪', '26', '季寰宇', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3661', '4', '201805', '12', '韩云登', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3662', '4', '201805', '12', '韩云登', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3663', '4', '201805', '12', '韩云登', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3664', '4', '201805', '12', '韩云登', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3665', '4', '201805', '12', '韩云登', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3666', '4', '201805', '12', '韩云登', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3667', '4', '201805', '9', '郑海洋', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3668', '4', '201805', '9', '郑海洋', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3669', '4', '201805', '9', '郑海洋', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3670', '4', '201805', '9', '郑海洋', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3671', '4', '201805', '9', '郑海洋', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3672', '4', '201805', '9', '郑海洋', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3673', '4', '201805', '33', '周丽咪', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3674', '4', '201805', '33', '周丽咪', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3675', '4', '201805', '33', '周丽咪', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3676', '4', '201805', '33', '周丽咪', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3677', '4', '201805', '33', '周丽咪', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3678', '4', '201805', '33', '周丽咪', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3679', '4', '201805', '62', '余正同', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3680', '4', '201805', '62', '余正同', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3681', '4', '201805', '62', '余正同', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3682', '4', '201805', '62', '余正同', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3683', '4', '201805', '62', '余正同', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3684', '4', '201805', '62', '余正同', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3685', '4', '201805', '21', '范毛毛', '29', '刘崧', '1', '服务量考评', '6', null, '2018-05-24 10:59:47', '0');
INSERT INTO `check_result` VALUES ('3686', '4', '201805', '21', '范毛毛', '29', '刘崧', '2', '服务时效', '6', null, '2018-05-24 10:59:47', '0');
INSERT INTO `check_result` VALUES ('3687', '4', '201805', '21', '范毛毛', '29', '刘崧', '3', '服务质量', '6', null, '2018-05-24 10:59:47', '0');
INSERT INTO `check_result` VALUES ('3688', '4', '201805', '21', '范毛毛', '29', '刘崧', '4', '服务表现', '6', null, '2018-05-24 10:59:47', '0');
INSERT INTO `check_result` VALUES ('3689', '4', '201805', '21', '范毛毛', '29', '刘崧', '5', '服务态度', '6', null, '2018-05-24 10:59:47', '0');
INSERT INTO `check_result` VALUES ('3690', '4', '201805', '21', '范毛毛', '29', '刘崧', '6', '综合满意度', '6', null, '2018-05-24 10:59:47', '0');
INSERT INTO `check_result` VALUES ('3691', '4', '201805', '60', '钟文宇', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3692', '4', '201805', '60', '钟文宇', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3693', '4', '201805', '60', '钟文宇', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3694', '4', '201805', '60', '钟文宇', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3695', '4', '201805', '60', '钟文宇', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3696', '4', '201805', '60', '钟文宇', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3697', '4', '201805', '38', '洪卫峰', '29', '刘崧', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3698', '4', '201805', '38', '洪卫峰', '29', '刘崧', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3699', '4', '201805', '38', '洪卫峰', '29', '刘崧', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3700', '4', '201805', '38', '洪卫峰', '29', '刘崧', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3701', '4', '201805', '38', '洪卫峰', '29', '刘崧', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3702', '4', '201805', '38', '洪卫峰', '29', '刘崧', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3703', '4', '201805', '19', '涂登峰', '29', '刘崧', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3704', '4', '201805', '19', '涂登峰', '29', '刘崧', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3705', '4', '201805', '19', '涂登峰', '29', '刘崧', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3706', '4', '201805', '19', '涂登峰', '29', '刘崧', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3707', '4', '201805', '19', '涂登峰', '29', '刘崧', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3708', '4', '201805', '19', '涂登峰', '29', '刘崧', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3709', '4', '201805', '57', '李吁', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3710', '4', '201805', '57', '李吁', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3711', '4', '201805', '57', '李吁', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3712', '4', '201805', '57', '李吁', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3713', '4', '201805', '57', '李吁', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3714', '4', '201805', '57', '李吁', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('3715', '4', '201805', '48', '陈佳伟', '29', '刘崧', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3716', '4', '201805', '48', '陈佳伟', '29', '刘崧', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3717', '4', '201805', '48', '陈佳伟', '29', '刘崧', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3718', '4', '201805', '48', '陈佳伟', '29', '刘崧', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3719', '4', '201805', '48', '陈佳伟', '29', '刘崧', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3720', '4', '201805', '48', '陈佳伟', '29', '刘崧', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3721', '4', '201805', '25', '王林飞', '37', '杨沁', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3722', '4', '201805', '25', '王林飞', '37', '杨沁', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3723', '4', '201805', '25', '王林飞', '37', '杨沁', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3724', '4', '201805', '25', '王林飞', '37', '杨沁', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3725', '4', '201805', '25', '王林飞', '37', '杨沁', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3726', '4', '201805', '25', '王林飞', '37', '杨沁', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3727', '4', '201805', '63', '谢博文', '37', '杨沁', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3728', '4', '201805', '63', '谢博文', '37', '杨沁', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3729', '4', '201805', '63', '谢博文', '37', '杨沁', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3730', '4', '201805', '63', '谢博文', '37', '杨沁', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3731', '4', '201805', '63', '谢博文', '37', '杨沁', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3732', '4', '201805', '63', '谢博文', '37', '杨沁', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3733', '4', '201805', '22', '宗立', '37', '杨沁', '1', '服务量考评', '6', null, '2018-05-24 10:51:02', '0');
INSERT INTO `check_result` VALUES ('3734', '4', '201805', '22', '宗立', '37', '杨沁', '2', '服务时效', '6', null, '2018-05-24 10:51:02', '0');
INSERT INTO `check_result` VALUES ('3735', '4', '201805', '22', '宗立', '37', '杨沁', '3', '服务质量', '6', null, '2018-05-24 10:51:02', '0');
INSERT INTO `check_result` VALUES ('3736', '4', '201805', '22', '宗立', '37', '杨沁', '4', '服务表现', '6', null, '2018-05-24 10:51:02', '0');
INSERT INTO `check_result` VALUES ('3737', '4', '201805', '22', '宗立', '37', '杨沁', '5', '服务态度', '6', null, '2018-05-24 10:51:02', '0');
INSERT INTO `check_result` VALUES ('3738', '4', '201805', '22', '宗立', '37', '杨沁', '6', '综合满意度', '6', null, '2018-05-24 10:51:02', '0');
INSERT INTO `check_result` VALUES ('3739', '4', '201805', '15', '李沙', '37', '杨沁', '1', '服务量考评', '10', null, '2018-05-24 10:37:56', '0');
INSERT INTO `check_result` VALUES ('3740', '4', '201805', '15', '李沙', '37', '杨沁', '2', '服务时效', '10', null, '2018-05-24 10:37:56', '0');
INSERT INTO `check_result` VALUES ('3741', '4', '201805', '15', '李沙', '37', '杨沁', '3', '服务质量', '10', null, '2018-05-24 10:37:56', '0');
INSERT INTO `check_result` VALUES ('3742', '4', '201805', '15', '李沙', '37', '杨沁', '4', '服务表现', '9', null, '2018-05-24 10:37:56', '0');
INSERT INTO `check_result` VALUES ('3743', '4', '201805', '15', '李沙', '37', '杨沁', '5', '服务态度', '9', null, '2018-05-24 10:37:56', '0');
INSERT INTO `check_result` VALUES ('3744', '4', '201805', '15', '李沙', '37', '杨沁', '6', '综合满意度', '8', null, '2018-05-24 10:37:56', '0');
INSERT INTO `check_result` VALUES ('3745', '4', '201805', '59', '黄鞭', '37', '杨沁', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3746', '4', '201805', '59', '黄鞭', '37', '杨沁', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3747', '4', '201805', '59', '黄鞭', '37', '杨沁', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3748', '4', '201805', '59', '黄鞭', '37', '杨沁', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3749', '4', '201805', '59', '黄鞭', '37', '杨沁', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3750', '4', '201805', '59', '黄鞭', '37', '杨沁', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3751', '4', '201805', '60', '钟文宇', '37', '杨沁', '1', '服务量考评', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3752', '4', '201805', '60', '钟文宇', '37', '杨沁', '2', '服务时效', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3753', '4', '201805', '60', '钟文宇', '37', '杨沁', '3', '服务质量', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3754', '4', '201805', '60', '钟文宇', '37', '杨沁', '4', '服务表现', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3755', '4', '201805', '60', '钟文宇', '37', '杨沁', '5', '服务态度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3756', '4', '201805', '60', '钟文宇', '37', '杨沁', '6', '综合满意度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3757', '4', '201805', '61', '王韵盟', '37', '杨沁', '1', '服务量考评', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3758', '4', '201805', '61', '王韵盟', '37', '杨沁', '2', '服务时效', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3759', '4', '201805', '61', '王韵盟', '37', '杨沁', '3', '服务质量', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3760', '4', '201805', '61', '王韵盟', '37', '杨沁', '4', '服务表现', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3761', '4', '201805', '61', '王韵盟', '37', '杨沁', '5', '服务态度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3762', '4', '201805', '61', '王韵盟', '37', '杨沁', '6', '综合满意度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('3763', '4', '201805', '58', '赵佳祺', '37', '杨沁', '1', '服务量考评', '6', null, '2018-05-24 13:51:03', '0');
INSERT INTO `check_result` VALUES ('3764', '4', '201805', '58', '赵佳祺', '37', '杨沁', '2', '服务时效', '6', null, '2018-05-24 13:51:03', '0');
INSERT INTO `check_result` VALUES ('3765', '4', '201805', '58', '赵佳祺', '37', '杨沁', '3', '服务质量', '6', null, '2018-05-24 13:51:03', '0');
INSERT INTO `check_result` VALUES ('3766', '4', '201805', '58', '赵佳祺', '37', '杨沁', '4', '服务表现', '6', null, '2018-05-24 13:51:03', '0');
INSERT INTO `check_result` VALUES ('3767', '4', '201805', '58', '赵佳祺', '37', '杨沁', '5', '服务态度', '6', null, '2018-05-24 13:51:03', '0');
INSERT INTO `check_result` VALUES ('3768', '4', '201805', '58', '赵佳祺', '37', '杨沁', '6', '综合满意度', '6', null, '2018-05-24 13:51:03', '0');
INSERT INTO `check_result` VALUES ('3769', '4', '201805', '42', '李珍', '37', '杨沁', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3770', '4', '201805', '42', '李珍', '37', '杨沁', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3771', '4', '201805', '42', '李珍', '37', '杨沁', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3772', '4', '201805', '42', '李珍', '37', '杨沁', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3773', '4', '201805', '42', '李珍', '37', '杨沁', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3774', '4', '201805', '42', '李珍', '37', '杨沁', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('3775', '4', '201805', '47', '冯志强', '37', '杨沁', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3776', '4', '201805', '47', '冯志强', '37', '杨沁', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3777', '4', '201805', '47', '冯志强', '37', '杨沁', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3778', '4', '201805', '47', '冯志强', '37', '杨沁', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3779', '4', '201805', '47', '冯志强', '37', '杨沁', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3780', '4', '201805', '47', '冯志强', '37', '杨沁', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3781', '4', '201805', '33', '周丽咪', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3782', '4', '201805', '33', '周丽咪', '39', '王妍', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3783', '4', '201805', '33', '周丽咪', '39', '王妍', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3784', '4', '201805', '33', '周丽咪', '39', '王妍', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3785', '4', '201805', '33', '周丽咪', '39', '王妍', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3786', '4', '201805', '33', '周丽咪', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3787', '4', '201805', '9', '郑海洋', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3788', '4', '201805', '9', '郑海洋', '39', '王妍', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3789', '4', '201805', '9', '郑海洋', '39', '王妍', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3790', '4', '201805', '9', '郑海洋', '39', '王妍', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3791', '4', '201805', '9', '郑海洋', '39', '王妍', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3792', '4', '201805', '9', '郑海洋', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3793', '4', '201805', '30', '朱子晔', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3794', '4', '201805', '30', '朱子晔', '39', '王妍', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3795', '4', '201805', '30', '朱子晔', '39', '王妍', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3796', '4', '201805', '30', '朱子晔', '39', '王妍', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3797', '4', '201805', '30', '朱子晔', '39', '王妍', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3798', '4', '201805', '30', '朱子晔', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3799', '4', '201805', '19', '涂登峰', '39', '王妍', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3800', '4', '201805', '19', '涂登峰', '39', '王妍', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3801', '4', '201805', '19', '涂登峰', '39', '王妍', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3802', '4', '201805', '19', '涂登峰', '39', '王妍', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3803', '4', '201805', '19', '涂登峰', '39', '王妍', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3804', '4', '201805', '19', '涂登峰', '39', '王妍', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3805', '4', '201805', '12', '韩云登', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3806', '4', '201805', '12', '韩云登', '39', '王妍', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3807', '4', '201805', '12', '韩云登', '39', '王妍', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3808', '4', '201805', '12', '韩云登', '39', '王妍', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3809', '4', '201805', '12', '韩云登', '39', '王妍', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3810', '4', '201805', '12', '韩云登', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3811', '4', '201805', '38', '洪卫峰', '39', '王妍', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3812', '4', '201805', '38', '洪卫峰', '39', '王妍', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3813', '4', '201805', '38', '洪卫峰', '39', '王妍', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3814', '4', '201805', '38', '洪卫峰', '39', '王妍', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3815', '4', '201805', '38', '洪卫峰', '39', '王妍', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3816', '4', '201805', '38', '洪卫峰', '39', '王妍', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3817', '4', '201805', '8', '葛汤华', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3818', '4', '201805', '8', '葛汤华', '39', '王妍', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3819', '4', '201805', '8', '葛汤华', '39', '王妍', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3820', '4', '201805', '8', '葛汤华', '39', '王妍', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3821', '4', '201805', '8', '葛汤华', '39', '王妍', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3822', '4', '201805', '8', '葛汤华', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3823', '4', '201805', '63', '谢博文', '39', '王妍', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3824', '4', '201805', '63', '谢博文', '39', '王妍', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3825', '4', '201805', '63', '谢博文', '39', '王妍', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3826', '4', '201805', '63', '谢博文', '39', '王妍', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3827', '4', '201805', '63', '谢博文', '39', '王妍', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3828', '4', '201805', '63', '谢博文', '39', '王妍', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3829', '4', '201805', '27', '张艳', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3830', '4', '201805', '27', '张艳', '39', '王妍', '2', '服务时效', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3831', '4', '201805', '27', '张艳', '39', '王妍', '3', '服务质量', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3832', '4', '201805', '27', '张艳', '39', '王妍', '4', '服务表现', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3833', '4', '201805', '27', '张艳', '39', '王妍', '5', '服务态度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3834', '4', '201805', '27', '张艳', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3835', '4', '201805', '48', '陈佳伟', '39', '王妍', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3836', '4', '201805', '48', '陈佳伟', '39', '王妍', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3837', '4', '201805', '48', '陈佳伟', '39', '王妍', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3838', '4', '201805', '48', '陈佳伟', '39', '王妍', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3839', '4', '201805', '48', '陈佳伟', '39', '王妍', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3840', '4', '201805', '48', '陈佳伟', '39', '王妍', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3841', '4', '201805', '9', '郑海洋', '41', '杨露', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3842', '4', '201805', '9', '郑海洋', '41', '杨露', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3843', '4', '201805', '9', '郑海洋', '41', '杨露', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3844', '4', '201805', '9', '郑海洋', '41', '杨露', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3845', '4', '201805', '9', '郑海洋', '41', '杨露', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3846', '4', '201805', '9', '郑海洋', '41', '杨露', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('3847', '4', '201805', '10', '王维', '41', '杨露', '1', '服务量考评', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3848', '4', '201805', '10', '王维', '41', '杨露', '2', '服务时效', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3849', '4', '201805', '10', '王维', '41', '杨露', '3', '服务质量', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3850', '4', '201805', '10', '王维', '41', '杨露', '4', '服务表现', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3851', '4', '201805', '10', '王维', '41', '杨露', '5', '服务态度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3852', '4', '201805', '10', '王维', '41', '杨露', '6', '综合满意度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('3853', '4', '201805', '12', '韩云登', '41', '杨露', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3854', '4', '201805', '12', '韩云登', '41', '杨露', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3855', '4', '201805', '12', '韩云登', '41', '杨露', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3856', '4', '201805', '12', '韩云登', '41', '杨露', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3857', '4', '201805', '12', '韩云登', '41', '杨露', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3858', '4', '201805', '12', '韩云登', '41', '杨露', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3859', '4', '201805', '21', '范毛毛', '41', '杨露', '1', '服务量考评', '6', null, '2018-05-24 11:02:08', '0');
INSERT INTO `check_result` VALUES ('3860', '4', '201805', '21', '范毛毛', '41', '杨露', '2', '服务时效', '6', null, '2018-05-24 11:02:08', '0');
INSERT INTO `check_result` VALUES ('3861', '4', '201805', '21', '范毛毛', '41', '杨露', '3', '服务质量', '6', null, '2018-05-24 11:02:08', '0');
INSERT INTO `check_result` VALUES ('3862', '4', '201805', '21', '范毛毛', '41', '杨露', '4', '服务表现', '6', null, '2018-05-24 11:02:08', '0');
INSERT INTO `check_result` VALUES ('3863', '4', '201805', '21', '范毛毛', '41', '杨露', '5', '服务态度', '8', null, '2018-05-24 11:02:08', '0');
INSERT INTO `check_result` VALUES ('3864', '4', '201805', '21', '范毛毛', '41', '杨露', '6', '综合满意度', '6', null, '2018-05-24 11:02:08', '0');
INSERT INTO `check_result` VALUES ('3865', '4', '201805', '48', '陈佳伟', '41', '杨露', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3866', '4', '201805', '48', '陈佳伟', '41', '杨露', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3867', '4', '201805', '48', '陈佳伟', '41', '杨露', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3868', '4', '201805', '48', '陈佳伟', '41', '杨露', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3869', '4', '201805', '48', '陈佳伟', '41', '杨露', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3870', '4', '201805', '48', '陈佳伟', '41', '杨露', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3871', '4', '201805', '59', '黄鞭', '41', '杨露', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3872', '4', '201805', '59', '黄鞭', '41', '杨露', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3873', '4', '201805', '59', '黄鞭', '41', '杨露', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3874', '4', '201805', '59', '黄鞭', '41', '杨露', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3875', '4', '201805', '59', '黄鞭', '41', '杨露', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3876', '4', '201805', '59', '黄鞭', '41', '杨露', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3877', '4', '201805', '33', '周丽咪', '41', '杨露', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3878', '4', '201805', '33', '周丽咪', '41', '杨露', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3879', '4', '201805', '33', '周丽咪', '41', '杨露', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3880', '4', '201805', '33', '周丽咪', '41', '杨露', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3881', '4', '201805', '33', '周丽咪', '41', '杨露', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3882', '4', '201805', '33', '周丽咪', '41', '杨露', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3883', '4', '201805', '60', '钟文宇', '41', '杨露', '1', '服务量考评', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3884', '4', '201805', '60', '钟文宇', '41', '杨露', '2', '服务时效', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3885', '4', '201805', '60', '钟文宇', '41', '杨露', '3', '服务质量', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3886', '4', '201805', '60', '钟文宇', '41', '杨露', '4', '服务表现', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3887', '4', '201805', '60', '钟文宇', '41', '杨露', '5', '服务态度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3888', '4', '201805', '60', '钟文宇', '41', '杨露', '6', '综合满意度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3889', '4', '201805', '19', '涂登峰', '41', '杨露', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3890', '4', '201805', '19', '涂登峰', '41', '杨露', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3891', '4', '201805', '19', '涂登峰', '41', '杨露', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3892', '4', '201805', '19', '涂登峰', '41', '杨露', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3893', '4', '201805', '19', '涂登峰', '41', '杨露', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3894', '4', '201805', '19', '涂登峰', '41', '杨露', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3895', '4', '201805', '22', '宗立', '41', '杨露', '1', '服务量考评', '5', null, '2018-05-24 10:51:25', '0');
INSERT INTO `check_result` VALUES ('3896', '4', '201805', '22', '宗立', '41', '杨露', '2', '服务时效', '4', null, '2018-05-24 10:51:25', '0');
INSERT INTO `check_result` VALUES ('3897', '4', '201805', '22', '宗立', '41', '杨露', '3', '服务质量', '1', null, '2018-05-24 10:51:25', '0');
INSERT INTO `check_result` VALUES ('3898', '4', '201805', '22', '宗立', '41', '杨露', '4', '服务表现', '6', null, '2018-05-24 10:51:25', '0');
INSERT INTO `check_result` VALUES ('3899', '4', '201805', '22', '宗立', '41', '杨露', '5', '服务态度', '6', null, '2018-05-24 10:51:25', '0');
INSERT INTO `check_result` VALUES ('3900', '4', '201805', '22', '宗立', '41', '杨露', '6', '综合满意度', '6', null, '2018-05-24 10:51:25', '0');
INSERT INTO `check_result` VALUES ('3901', '4', '201805', '21', '范毛毛', '43', '虞炯辉', '1', '服务量考评', '6', null, '2018-05-24 11:02:31', '0');
INSERT INTO `check_result` VALUES ('3902', '4', '201805', '21', '范毛毛', '43', '虞炯辉', '2', '服务时效', '6', null, '2018-05-24 11:02:31', '0');
INSERT INTO `check_result` VALUES ('3903', '4', '201805', '21', '范毛毛', '43', '虞炯辉', '3', '服务质量', '6', null, '2018-05-24 11:02:31', '0');
INSERT INTO `check_result` VALUES ('3904', '4', '201805', '21', '范毛毛', '43', '虞炯辉', '4', '服务表现', '6', null, '2018-05-24 11:02:31', '0');
INSERT INTO `check_result` VALUES ('3905', '4', '201805', '21', '范毛毛', '43', '虞炯辉', '5', '服务态度', '6', null, '2018-05-24 11:02:31', '0');
INSERT INTO `check_result` VALUES ('3906', '4', '201805', '21', '范毛毛', '43', '虞炯辉', '6', '综合满意度', '6', null, '2018-05-24 11:02:31', '0');
INSERT INTO `check_result` VALUES ('3907', '4', '201805', '62', '余正同', '43', '虞炯辉', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3908', '4', '201805', '62', '余正同', '43', '虞炯辉', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3909', '4', '201805', '62', '余正同', '43', '虞炯辉', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3910', '4', '201805', '62', '余正同', '43', '虞炯辉', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3911', '4', '201805', '62', '余正同', '43', '虞炯辉', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3912', '4', '201805', '62', '余正同', '43', '虞炯辉', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('3913', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3914', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3915', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3916', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3917', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3918', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3919', '4', '201805', '19', '涂登峰', '43', '虞炯辉', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3920', '4', '201805', '19', '涂登峰', '43', '虞炯辉', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3921', '4', '201805', '19', '涂登峰', '43', '虞炯辉', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3922', '4', '201805', '19', '涂登峰', '43', '虞炯辉', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3923', '4', '201805', '19', '涂登峰', '43', '虞炯辉', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3924', '4', '201805', '19', '涂登峰', '43', '虞炯辉', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3925', '4', '201805', '27', '张艳', '43', '虞炯辉', '1', '服务量考评', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3926', '4', '201805', '27', '张艳', '43', '虞炯辉', '2', '服务时效', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3927', '4', '201805', '27', '张艳', '43', '虞炯辉', '3', '服务质量', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3928', '4', '201805', '27', '张艳', '43', '虞炯辉', '4', '服务表现', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3929', '4', '201805', '27', '张艳', '43', '虞炯辉', '5', '服务态度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3930', '4', '201805', '27', '张艳', '43', '虞炯辉', '6', '综合满意度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('3931', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', '1', '服务量考评', '6', null, '2018-05-24 13:50:44', '0');
INSERT INTO `check_result` VALUES ('3932', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', '2', '服务时效', '6', null, '2018-05-24 13:50:44', '0');
INSERT INTO `check_result` VALUES ('3933', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', '3', '服务质量', '6', null, '2018-05-24 13:50:44', '0');
INSERT INTO `check_result` VALUES ('3934', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', '4', '服务表现', '6', null, '2018-05-24 13:50:44', '0');
INSERT INTO `check_result` VALUES ('3935', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', '5', '服务态度', '6', null, '2018-05-24 13:50:44', '0');
INSERT INTO `check_result` VALUES ('3936', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', '6', '综合满意度', '6', null, '2018-05-24 13:50:44', '0');
INSERT INTO `check_result` VALUES ('3937', '4', '201805', '30', '朱子晔', '43', '虞炯辉', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3938', '4', '201805', '30', '朱子晔', '43', '虞炯辉', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3939', '4', '201805', '30', '朱子晔', '43', '虞炯辉', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3940', '4', '201805', '30', '朱子晔', '43', '虞炯辉', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3941', '4', '201805', '30', '朱子晔', '43', '虞炯辉', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3942', '4', '201805', '30', '朱子晔', '43', '虞炯辉', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3943', '4', '201805', '47', '冯志强', '43', '虞炯辉', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3944', '4', '201805', '47', '冯志强', '43', '虞炯辉', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3945', '4', '201805', '47', '冯志强', '43', '虞炯辉', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3946', '4', '201805', '47', '冯志强', '43', '虞炯辉', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3947', '4', '201805', '47', '冯志强', '43', '虞炯辉', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3948', '4', '201805', '47', '冯志强', '43', '虞炯辉', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3949', '4', '201805', '33', '周丽咪', '43', '虞炯辉', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3950', '4', '201805', '33', '周丽咪', '43', '虞炯辉', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3951', '4', '201805', '33', '周丽咪', '43', '虞炯辉', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3952', '4', '201805', '33', '周丽咪', '43', '虞炯辉', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3953', '4', '201805', '33', '周丽咪', '43', '虞炯辉', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3954', '4', '201805', '33', '周丽咪', '43', '虞炯辉', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('3955', '4', '201805', '8', '葛汤华', '43', '虞炯辉', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3956', '4', '201805', '8', '葛汤华', '43', '虞炯辉', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3957', '4', '201805', '8', '葛汤华', '43', '虞炯辉', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3958', '4', '201805', '8', '葛汤华', '43', '虞炯辉', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3959', '4', '201805', '8', '葛汤华', '43', '虞炯辉', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3960', '4', '201805', '8', '葛汤华', '43', '虞炯辉', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('3961', '4', '201805', '25', '王林飞', '45', '袁芝伟', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3962', '4', '201805', '25', '王林飞', '45', '袁芝伟', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3963', '4', '201805', '25', '王林飞', '45', '袁芝伟', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3964', '4', '201805', '25', '王林飞', '45', '袁芝伟', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3965', '4', '201805', '25', '王林飞', '45', '袁芝伟', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3966', '4', '201805', '25', '王林飞', '45', '袁芝伟', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('3967', '4', '201805', '47', '冯志强', '45', '袁芝伟', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3968', '4', '201805', '47', '冯志强', '45', '袁芝伟', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3969', '4', '201805', '47', '冯志强', '45', '袁芝伟', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3970', '4', '201805', '47', '冯志强', '45', '袁芝伟', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3971', '4', '201805', '47', '冯志强', '45', '袁芝伟', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3972', '4', '201805', '47', '冯志强', '45', '袁芝伟', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3973', '4', '201805', '30', '朱子晔', '45', '袁芝伟', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3974', '4', '201805', '30', '朱子晔', '45', '袁芝伟', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3975', '4', '201805', '30', '朱子晔', '45', '袁芝伟', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3976', '4', '201805', '30', '朱子晔', '45', '袁芝伟', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3977', '4', '201805', '30', '朱子晔', '45', '袁芝伟', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3978', '4', '201805', '30', '朱子晔', '45', '袁芝伟', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('3979', '4', '201805', '60', '钟文宇', '45', '袁芝伟', '1', '服务量考评', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3980', '4', '201805', '60', '钟文宇', '45', '袁芝伟', '2', '服务时效', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3981', '4', '201805', '60', '钟文宇', '45', '袁芝伟', '3', '服务质量', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3982', '4', '201805', '60', '钟文宇', '45', '袁芝伟', '4', '服务表现', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3983', '4', '201805', '60', '钟文宇', '45', '袁芝伟', '5', '服务态度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3984', '4', '201805', '60', '钟文宇', '45', '袁芝伟', '6', '综合满意度', '10', null, '2018-05-24 14:08:58', '0');
INSERT INTO `check_result` VALUES ('3985', '4', '201805', '12', '韩云登', '45', '袁芝伟', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3986', '4', '201805', '12', '韩云登', '45', '袁芝伟', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3987', '4', '201805', '12', '韩云登', '45', '袁芝伟', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3988', '4', '201805', '12', '韩云登', '45', '袁芝伟', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3989', '4', '201805', '12', '韩云登', '45', '袁芝伟', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3990', '4', '201805', '12', '韩云登', '45', '袁芝伟', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('3991', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3992', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3993', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3994', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3995', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3996', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('3997', '4', '201805', '59', '黄鞭', '45', '袁芝伟', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3998', '4', '201805', '59', '黄鞭', '45', '袁芝伟', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('3999', '4', '201805', '59', '黄鞭', '45', '袁芝伟', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4000', '4', '201805', '59', '黄鞭', '45', '袁芝伟', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4001', '4', '201805', '59', '黄鞭', '45', '袁芝伟', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4002', '4', '201805', '59', '黄鞭', '45', '袁芝伟', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4003', '4', '201805', '22', '宗立', '45', '袁芝伟', '1', '服务量考评', '4', null, '2018-05-24 10:52:36', '0');
INSERT INTO `check_result` VALUES ('4004', '4', '201805', '22', '宗立', '45', '袁芝伟', '2', '服务时效', '6', null, '2018-05-24 10:52:36', '0');
INSERT INTO `check_result` VALUES ('4005', '4', '201805', '22', '宗立', '45', '袁芝伟', '3', '服务质量', '9', null, '2018-05-24 10:52:36', '0');
INSERT INTO `check_result` VALUES ('4006', '4', '201805', '22', '宗立', '45', '袁芝伟', '4', '服务表现', '8', null, '2018-05-24 10:52:36', '0');
INSERT INTO `check_result` VALUES ('4007', '4', '201805', '22', '宗立', '45', '袁芝伟', '5', '服务态度', '8', null, '2018-05-24 10:52:36', '0');
INSERT INTO `check_result` VALUES ('4008', '4', '201805', '22', '宗立', '45', '袁芝伟', '6', '综合满意度', '8', null, '2018-05-24 10:52:36', '0');
INSERT INTO `check_result` VALUES ('4009', '4', '201805', '62', '余正同', '45', '袁芝伟', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4010', '4', '201805', '62', '余正同', '45', '袁芝伟', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4011', '4', '201805', '62', '余正同', '45', '袁芝伟', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4012', '4', '201805', '62', '余正同', '45', '袁芝伟', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4013', '4', '201805', '62', '余正同', '45', '袁芝伟', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4014', '4', '201805', '62', '余正同', '45', '袁芝伟', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4015', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', '1', '服务量考评', '6', null, '2018-05-24 13:50:48', '0');
INSERT INTO `check_result` VALUES ('4016', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', '2', '服务时效', '6', null, '2018-05-24 13:50:48', '0');
INSERT INTO `check_result` VALUES ('4017', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', '3', '服务质量', '6', null, '2018-05-24 13:50:48', '0');
INSERT INTO `check_result` VALUES ('4018', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', '4', '服务表现', '6', null, '2018-05-24 13:50:48', '0');
INSERT INTO `check_result` VALUES ('4019', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', '5', '服务态度', '6', null, '2018-05-24 13:50:48', '0');
INSERT INTO `check_result` VALUES ('4020', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', '6', '综合满意度', '6', null, '2018-05-24 13:50:48', '0');
INSERT INTO `check_result` VALUES ('4021', '4', '201805', '30', '朱子晔', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4022', '4', '201805', '30', '朱子晔', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4023', '4', '201805', '30', '朱子晔', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4024', '4', '201805', '30', '朱子晔', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4025', '4', '201805', '30', '朱子晔', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4026', '4', '201805', '30', '朱子晔', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4027', '4', '201805', '25', '王林飞', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4028', '4', '201805', '25', '王林飞', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4029', '4', '201805', '25', '王林飞', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4030', '4', '201805', '25', '王林飞', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4031', '4', '201805', '25', '王林飞', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4032', '4', '201805', '25', '王林飞', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4033', '4', '201805', '12', '韩云登', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4034', '4', '201805', '12', '韩云登', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4035', '4', '201805', '12', '韩云登', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4036', '4', '201805', '12', '韩云登', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4037', '4', '201805', '12', '韩云登', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4038', '4', '201805', '12', '韩云登', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4039', '4', '201805', '14', '杨少清', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4040', '4', '201805', '14', '杨少清', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4041', '4', '201805', '14', '杨少清', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4042', '4', '201805', '14', '杨少清', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4043', '4', '201805', '14', '杨少清', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4044', '4', '201805', '14', '杨少清', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4045', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', '1', '服务量考评', '6', null, '2018-05-24 13:50:56', '0');
INSERT INTO `check_result` VALUES ('4046', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', '2', '服务时效', '6', null, '2018-05-24 13:50:56', '0');
INSERT INTO `check_result` VALUES ('4047', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', '3', '服务质量', '6', null, '2018-05-24 13:50:56', '0');
INSERT INTO `check_result` VALUES ('4048', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', '4', '服务表现', '6', null, '2018-05-24 13:50:56', '0');
INSERT INTO `check_result` VALUES ('4049', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', '5', '服务态度', '6', null, '2018-05-24 13:50:56', '0');
INSERT INTO `check_result` VALUES ('4050', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', '6', '综合满意度', '6', null, '2018-05-24 13:50:56', '0');
INSERT INTO `check_result` VALUES ('4051', '4', '201805', '33', '周丽咪', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('4052', '4', '201805', '33', '周丽咪', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('4053', '4', '201805', '33', '周丽咪', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('4054', '4', '201805', '33', '周丽咪', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('4055', '4', '201805', '33', '周丽咪', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('4056', '4', '201805', '33', '周丽咪', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-24 11:15:15', '0');
INSERT INTO `check_result` VALUES ('4057', '4', '201805', '47', '冯志强', '49', '陈伊盈', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4058', '4', '201805', '47', '冯志强', '49', '陈伊盈', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4059', '4', '201805', '47', '冯志强', '49', '陈伊盈', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4060', '4', '201805', '47', '冯志强', '49', '陈伊盈', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4061', '4', '201805', '47', '冯志强', '49', '陈伊盈', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4062', '4', '201805', '47', '冯志强', '49', '陈伊盈', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4063', '4', '201805', '8', '葛汤华', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4064', '4', '201805', '8', '葛汤华', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4065', '4', '201805', '8', '葛汤华', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4066', '4', '201805', '8', '葛汤华', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4067', '4', '201805', '8', '葛汤华', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4068', '4', '201805', '8', '葛汤华', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4069', '4', '201805', '46', '黄为一', '49', '陈伊盈', '1', '服务量考评', '6', null, '2018-05-24 15:55:43', '0');
INSERT INTO `check_result` VALUES ('4070', '4', '201805', '46', '黄为一', '49', '陈伊盈', '2', '服务时效', '6', null, '2018-05-24 15:55:43', '0');
INSERT INTO `check_result` VALUES ('4071', '4', '201805', '46', '黄为一', '49', '陈伊盈', '3', '服务质量', '6', null, '2018-05-24 15:55:43', '0');
INSERT INTO `check_result` VALUES ('4072', '4', '201805', '46', '黄为一', '49', '陈伊盈', '4', '服务表现', '6', null, '2018-05-24 15:55:43', '0');
INSERT INTO `check_result` VALUES ('4073', '4', '201805', '46', '黄为一', '49', '陈伊盈', '5', '服务态度', '6', null, '2018-05-24 15:55:43', '0');
INSERT INTO `check_result` VALUES ('4074', '4', '201805', '46', '黄为一', '49', '陈伊盈', '6', '综合满意度', '6', null, '2018-05-24 15:55:43', '0');
INSERT INTO `check_result` VALUES ('4075', '4', '201805', '42', '李珍', '49', '陈伊盈', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4076', '4', '201805', '42', '李珍', '49', '陈伊盈', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4077', '4', '201805', '42', '李珍', '49', '陈伊盈', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4078', '4', '201805', '42', '李珍', '49', '陈伊盈', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4079', '4', '201805', '42', '李珍', '49', '陈伊盈', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4080', '4', '201805', '42', '李珍', '49', '陈伊盈', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4081', '4', '201805', '21', '范毛毛', '50', '陈秋婷', '1', '服务量考评', '6', null, '2018-05-24 11:05:24', '0');
INSERT INTO `check_result` VALUES ('4082', '4', '201805', '21', '范毛毛', '50', '陈秋婷', '2', '服务时效', '6', null, '2018-05-24 11:05:24', '0');
INSERT INTO `check_result` VALUES ('4083', '4', '201805', '21', '范毛毛', '50', '陈秋婷', '3', '服务质量', '6', null, '2018-05-24 11:05:24', '0');
INSERT INTO `check_result` VALUES ('4084', '4', '201805', '21', '范毛毛', '50', '陈秋婷', '4', '服务表现', '6', null, '2018-05-24 11:05:24', '0');
INSERT INTO `check_result` VALUES ('4085', '4', '201805', '21', '范毛毛', '50', '陈秋婷', '5', '服务态度', '5', null, '2018-05-24 11:05:24', '0');
INSERT INTO `check_result` VALUES ('4086', '4', '201805', '21', '范毛毛', '50', '陈秋婷', '6', '综合满意度', '1', null, '2018-05-24 11:05:24', '0');
INSERT INTO `check_result` VALUES ('4087', '4', '201805', '63', '谢博文', '50', '陈秋婷', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4088', '4', '201805', '63', '谢博文', '50', '陈秋婷', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4089', '4', '201805', '63', '谢博文', '50', '陈秋婷', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4090', '4', '201805', '63', '谢博文', '50', '陈秋婷', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4091', '4', '201805', '63', '谢博文', '50', '陈秋婷', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4092', '4', '201805', '63', '谢博文', '50', '陈秋婷', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4093', '4', '201805', '57', '李吁', '50', '陈秋婷', '1', '服务量考评', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4094', '4', '201805', '57', '李吁', '50', '陈秋婷', '2', '服务时效', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4095', '4', '201805', '57', '李吁', '50', '陈秋婷', '3', '服务质量', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4096', '4', '201805', '57', '李吁', '50', '陈秋婷', '4', '服务表现', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4097', '4', '201805', '57', '李吁', '50', '陈秋婷', '5', '服务态度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4098', '4', '201805', '57', '李吁', '50', '陈秋婷', '6', '综合满意度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4099', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', '1', '服务量考评', '6', null, '2018-05-24 13:50:52', '0');
INSERT INTO `check_result` VALUES ('4100', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', '2', '服务时效', '6', null, '2018-05-24 13:50:52', '0');
INSERT INTO `check_result` VALUES ('4101', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', '3', '服务质量', '6', null, '2018-05-24 13:50:52', '0');
INSERT INTO `check_result` VALUES ('4102', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', '4', '服务表现', '6', null, '2018-05-24 13:50:52', '0');
INSERT INTO `check_result` VALUES ('4103', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', '5', '服务态度', '6', null, '2018-05-24 13:50:52', '0');
INSERT INTO `check_result` VALUES ('4104', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', '6', '综合满意度', '6', null, '2018-05-24 13:50:52', '0');
INSERT INTO `check_result` VALUES ('4105', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4106', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4107', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4108', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4109', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4110', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4111', '4', '201805', '59', '黄鞭', '50', '陈秋婷', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4112', '4', '201805', '59', '黄鞭', '50', '陈秋婷', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4113', '4', '201805', '59', '黄鞭', '50', '陈秋婷', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4114', '4', '201805', '59', '黄鞭', '50', '陈秋婷', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4115', '4', '201805', '59', '黄鞭', '50', '陈秋婷', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4116', '4', '201805', '59', '黄鞭', '50', '陈秋婷', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4117', '4', '201805', '25', '王林飞', '50', '陈秋婷', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4118', '4', '201805', '25', '王林飞', '50', '陈秋婷', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4119', '4', '201805', '25', '王林飞', '50', '陈秋婷', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4120', '4', '201805', '25', '王林飞', '50', '陈秋婷', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4121', '4', '201805', '25', '王林飞', '50', '陈秋婷', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4122', '4', '201805', '25', '王林飞', '50', '陈秋婷', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4123', '4', '201805', '27', '张艳', '50', '陈秋婷', '1', '服务量考评', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4124', '4', '201805', '27', '张艳', '50', '陈秋婷', '2', '服务时效', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4125', '4', '201805', '27', '张艳', '50', '陈秋婷', '3', '服务质量', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4126', '4', '201805', '27', '张艳', '50', '陈秋婷', '4', '服务表现', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4127', '4', '201805', '27', '张艳', '50', '陈秋婷', '5', '服务态度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4128', '4', '201805', '27', '张艳', '50', '陈秋婷', '6', '综合满意度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4129', '4', '201805', '14', '杨少清', '50', '陈秋婷', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4130', '4', '201805', '14', '杨少清', '50', '陈秋婷', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4131', '4', '201805', '14', '杨少清', '50', '陈秋婷', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4132', '4', '201805', '14', '杨少清', '50', '陈秋婷', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4133', '4', '201805', '14', '杨少清', '50', '陈秋婷', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4134', '4', '201805', '14', '杨少清', '50', '陈秋婷', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4135', '4', '201805', '9', '郑海洋', '50', '陈秋婷', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4136', '4', '201805', '9', '郑海洋', '50', '陈秋婷', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4137', '4', '201805', '9', '郑海洋', '50', '陈秋婷', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4138', '4', '201805', '9', '郑海洋', '50', '陈秋婷', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4139', '4', '201805', '9', '郑海洋', '50', '陈秋婷', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4140', '4', '201805', '9', '郑海洋', '50', '陈秋婷', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4141', '4', '201805', '28', '万强', '52', '陈默', '1', '服务量考评', '6', null, '2018-05-24 10:31:50', '0');
INSERT INTO `check_result` VALUES ('4142', '4', '201805', '28', '万强', '52', '陈默', '2', '服务时效', '6', null, '2018-05-24 10:31:50', '0');
INSERT INTO `check_result` VALUES ('4143', '4', '201805', '28', '万强', '52', '陈默', '3', '服务质量', '6', null, '2018-05-24 10:31:50', '0');
INSERT INTO `check_result` VALUES ('4144', '4', '201805', '28', '万强', '52', '陈默', '4', '服务表现', '6', null, '2018-05-24 10:31:50', '0');
INSERT INTO `check_result` VALUES ('4145', '4', '201805', '28', '万强', '52', '陈默', '5', '服务态度', '6', null, '2018-05-24 10:31:50', '0');
INSERT INTO `check_result` VALUES ('4146', '4', '201805', '28', '万强', '52', '陈默', '6', '综合满意度', '10', null, '2018-05-24 10:31:50', '0');
INSERT INTO `check_result` VALUES ('4147', '4', '201805', '59', '黄鞭', '52', '陈默', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4148', '4', '201805', '59', '黄鞭', '52', '陈默', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4149', '4', '201805', '59', '黄鞭', '52', '陈默', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4150', '4', '201805', '59', '黄鞭', '52', '陈默', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4151', '4', '201805', '59', '黄鞭', '52', '陈默', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4152', '4', '201805', '59', '黄鞭', '52', '陈默', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4153', '4', '201805', '14', '杨少清', '52', '陈默', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4154', '4', '201805', '14', '杨少清', '52', '陈默', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4155', '4', '201805', '14', '杨少清', '52', '陈默', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4156', '4', '201805', '14', '杨少清', '52', '陈默', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4157', '4', '201805', '14', '杨少清', '52', '陈默', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4158', '4', '201805', '14', '杨少清', '52', '陈默', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4159', '4', '201805', '62', '余正同', '52', '陈默', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4160', '4', '201805', '62', '余正同', '52', '陈默', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4161', '4', '201805', '62', '余正同', '52', '陈默', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4162', '4', '201805', '62', '余正同', '52', '陈默', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4163', '4', '201805', '62', '余正同', '52', '陈默', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4164', '4', '201805', '62', '余正同', '52', '陈默', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4165', '4', '201805', '47', '冯志强', '52', '陈默', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4166', '4', '201805', '47', '冯志强', '52', '陈默', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4167', '4', '201805', '47', '冯志强', '52', '陈默', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4168', '4', '201805', '47', '冯志强', '52', '陈默', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4169', '4', '201805', '47', '冯志强', '52', '陈默', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4170', '4', '201805', '47', '冯志强', '52', '陈默', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4171', '4', '201805', '48', '陈佳伟', '52', '陈默', '1', '服务量考评', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4172', '4', '201805', '48', '陈佳伟', '52', '陈默', '2', '服务时效', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4173', '4', '201805', '48', '陈佳伟', '52', '陈默', '3', '服务质量', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4174', '4', '201805', '48', '陈佳伟', '52', '陈默', '4', '服务表现', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4175', '4', '201805', '48', '陈佳伟', '52', '陈默', '5', '服务态度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4176', '4', '201805', '48', '陈佳伟', '52', '陈默', '6', '综合满意度', '10', null, '2018-05-24 11:16:17', '0');
INSERT INTO `check_result` VALUES ('4177', '4', '201805', '30', '朱子晔', '52', '陈默', '1', '服务量考评', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4178', '4', '201805', '30', '朱子晔', '52', '陈默', '2', '服务时效', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4179', '4', '201805', '30', '朱子晔', '52', '陈默', '3', '服务质量', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4180', '4', '201805', '30', '朱子晔', '52', '陈默', '4', '服务表现', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4181', '4', '201805', '30', '朱子晔', '52', '陈默', '5', '服务态度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4182', '4', '201805', '30', '朱子晔', '52', '陈默', '6', '综合满意度', '10', null, '2018-05-24 11:11:45', '0');
INSERT INTO `check_result` VALUES ('4183', '4', '201805', '15', '李沙', '52', '陈默', '1', '服务量考评', '6', null, '2018-05-24 10:39:13', '0');
INSERT INTO `check_result` VALUES ('4184', '4', '201805', '15', '李沙', '52', '陈默', '2', '服务时效', '6', null, '2018-05-24 10:39:13', '0');
INSERT INTO `check_result` VALUES ('4185', '4', '201805', '15', '李沙', '52', '陈默', '3', '服务质量', '6', null, '2018-05-24 10:39:13', '0');
INSERT INTO `check_result` VALUES ('4186', '4', '201805', '15', '李沙', '52', '陈默', '4', '服务表现', '9', null, '2018-05-24 10:39:13', '0');
INSERT INTO `check_result` VALUES ('4187', '4', '201805', '15', '李沙', '52', '陈默', '5', '服务态度', '6', null, '2018-05-24 10:39:13', '0');
INSERT INTO `check_result` VALUES ('4188', '4', '201805', '15', '李沙', '52', '陈默', '6', '综合满意度', '6', null, '2018-05-24 10:39:13', '0');
INSERT INTO `check_result` VALUES ('4189', '4', '201805', '58', '赵佳祺', '52', '陈默', '1', '服务量考评', '6', null, '2018-05-24 13:50:59', '0');
INSERT INTO `check_result` VALUES ('4190', '4', '201805', '58', '赵佳祺', '52', '陈默', '2', '服务时效', '6', null, '2018-05-24 13:50:59', '0');
INSERT INTO `check_result` VALUES ('4191', '4', '201805', '58', '赵佳祺', '52', '陈默', '3', '服务质量', '6', null, '2018-05-24 13:50:59', '0');
INSERT INTO `check_result` VALUES ('4192', '4', '201805', '58', '赵佳祺', '52', '陈默', '4', '服务表现', '6', null, '2018-05-24 13:50:59', '0');
INSERT INTO `check_result` VALUES ('4193', '4', '201805', '58', '赵佳祺', '52', '陈默', '5', '服务态度', '6', null, '2018-05-24 13:50:59', '0');
INSERT INTO `check_result` VALUES ('4194', '4', '201805', '58', '赵佳祺', '52', '陈默', '6', '综合满意度', '6', null, '2018-05-24 13:50:59', '0');
INSERT INTO `check_result` VALUES ('4195', '4', '201805', '61', '王韵盟', '52', '陈默', '1', '服务量考评', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('4196', '4', '201805', '61', '王韵盟', '52', '陈默', '2', '服务时效', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('4197', '4', '201805', '61', '王韵盟', '52', '陈默', '3', '服务质量', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('4198', '4', '201805', '61', '王韵盟', '52', '陈默', '4', '服务表现', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('4199', '4', '201805', '61', '王韵盟', '52', '陈默', '5', '服务态度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('4200', '4', '201805', '61', '王韵盟', '52', '陈默', '6', '综合满意度', '10', null, '2018-05-24 14:09:12', '0');
INSERT INTO `check_result` VALUES ('4201', '4', '201805', '12', '韩云登', '53', '高国峰', '1', '服务量考评', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4202', '4', '201805', '12', '韩云登', '53', '高国峰', '2', '服务时效', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4203', '4', '201805', '12', '韩云登', '53', '高国峰', '3', '服务质量', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4204', '4', '201805', '12', '韩云登', '53', '高国峰', '4', '服务表现', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4205', '4', '201805', '12', '韩云登', '53', '高国峰', '5', '服务态度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4206', '4', '201805', '12', '韩云登', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-23 17:57:02', '0');
INSERT INTO `check_result` VALUES ('4207', '4', '201805', '21', '范毛毛', '53', '高国峰', '1', '服务量考评', '6', null, '2018-05-24 11:05:56', '0');
INSERT INTO `check_result` VALUES ('4208', '4', '201805', '21', '范毛毛', '53', '高国峰', '2', '服务时效', '6', null, '2018-05-24 11:05:56', '0');
INSERT INTO `check_result` VALUES ('4209', '4', '201805', '21', '范毛毛', '53', '高国峰', '3', '服务质量', '6', null, '2018-05-24 11:05:56', '0');
INSERT INTO `check_result` VALUES ('4210', '4', '201805', '21', '范毛毛', '53', '高国峰', '4', '服务表现', '6', null, '2018-05-24 11:05:56', '0');
INSERT INTO `check_result` VALUES ('4211', '4', '201805', '21', '范毛毛', '53', '高国峰', '5', '服务态度', '6', null, '2018-05-24 11:05:56', '0');
INSERT INTO `check_result` VALUES ('4212', '4', '201805', '21', '范毛毛', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-24 11:05:56', '0');
INSERT INTO `check_result` VALUES ('4213', '4', '201805', '8', '葛汤华', '53', '高国峰', '1', '服务量考评', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4214', '4', '201805', '8', '葛汤华', '53', '高国峰', '2', '服务时效', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4215', '4', '201805', '8', '葛汤华', '53', '高国峰', '3', '服务质量', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4216', '4', '201805', '8', '葛汤华', '53', '高国峰', '4', '服务表现', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4217', '4', '201805', '8', '葛汤华', '53', '高国峰', '5', '服务态度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4218', '4', '201805', '8', '葛汤华', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-23 18:12:22', '0');
INSERT INTO `check_result` VALUES ('4219', '4', '201805', '22', '宗立', '53', '高国峰', '1', '服务量考评', '6', null, '2018-05-24 10:52:47', '0');
INSERT INTO `check_result` VALUES ('4220', '4', '201805', '22', '宗立', '53', '高国峰', '2', '服务时效', '6', null, '2018-05-24 10:52:47', '0');
INSERT INTO `check_result` VALUES ('4221', '4', '201805', '22', '宗立', '53', '高国峰', '3', '服务质量', '6', null, '2018-05-24 10:52:47', '0');
INSERT INTO `check_result` VALUES ('4222', '4', '201805', '22', '宗立', '53', '高国峰', '4', '服务表现', '6', null, '2018-05-24 10:52:47', '0');
INSERT INTO `check_result` VALUES ('4223', '4', '201805', '22', '宗立', '53', '高国峰', '5', '服务态度', '6', null, '2018-05-24 10:52:47', '0');
INSERT INTO `check_result` VALUES ('4224', '4', '201805', '22', '宗立', '53', '高国峰', '6', '综合满意度', '6', null, '2018-05-24 10:52:47', '0');
INSERT INTO `check_result` VALUES ('4225', '4', '201805', '57', '李吁', '53', '高国峰', '1', '服务量考评', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4226', '4', '201805', '57', '李吁', '53', '高国峰', '2', '服务时效', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4227', '4', '201805', '57', '李吁', '53', '高国峰', '3', '服务质量', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4228', '4', '201805', '57', '李吁', '53', '高国峰', '4', '服务表现', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4229', '4', '201805', '57', '李吁', '53', '高国峰', '5', '服务态度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4230', '4', '201805', '57', '李吁', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4231', '4', '201805', '14', '杨少清', '53', '高国峰', '1', '服务量考评', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4232', '4', '201805', '14', '杨少清', '53', '高国峰', '2', '服务时效', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4233', '4', '201805', '14', '杨少清', '53', '高国峰', '3', '服务质量', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4234', '4', '201805', '14', '杨少清', '53', '高国峰', '4', '服务表现', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4235', '4', '201805', '14', '杨少清', '53', '高国峰', '5', '服务态度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4236', '4', '201805', '14', '杨少清', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-24 11:15:37', '0');
INSERT INTO `check_result` VALUES ('4237', '4', '201805', '27', '张艳', '53', '高国峰', '1', '服务量考评', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4238', '4', '201805', '27', '张艳', '53', '高国峰', '2', '服务时效', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4239', '4', '201805', '27', '张艳', '53', '高国峰', '3', '服务质量', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4240', '4', '201805', '27', '张艳', '53', '高国峰', '4', '服务表现', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4241', '4', '201805', '27', '张艳', '53', '高国峰', '5', '服务态度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4242', '4', '201805', '27', '张艳', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-24 11:11:09', '0');
INSERT INTO `check_result` VALUES ('4243', '4', '201805', '15', '李沙', '53', '高国峰', '1', '服务量考评', '9', null, '2018-05-24 10:47:36', '0');
INSERT INTO `check_result` VALUES ('4244', '4', '201805', '15', '李沙', '53', '高国峰', '2', '服务时效', '9', null, '2018-05-24 10:47:36', '0');
INSERT INTO `check_result` VALUES ('4245', '4', '201805', '15', '李沙', '53', '高国峰', '3', '服务质量', '3', null, '2018-05-24 10:47:36', '0');
INSERT INTO `check_result` VALUES ('4246', '4', '201805', '15', '李沙', '53', '高国峰', '4', '服务表现', '3', null, '2018-05-24 10:47:36', '0');
INSERT INTO `check_result` VALUES ('4247', '4', '201805', '15', '李沙', '53', '高国峰', '5', '服务态度', '4', null, '2018-05-24 10:47:36', '0');
INSERT INTO `check_result` VALUES ('4248', '4', '201805', '15', '李沙', '53', '高国峰', '6', '综合满意度', '4', null, '2018-05-24 10:47:36', '0');
INSERT INTO `check_result` VALUES ('4249', '4', '201805', '46', '黄为一', '53', '高国峰', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4250', '4', '201805', '46', '黄为一', '53', '高国峰', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4251', '4', '201805', '46', '黄为一', '53', '高国峰', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4252', '4', '201805', '46', '黄为一', '53', '高国峰', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4253', '4', '201805', '46', '黄为一', '53', '高国峰', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4254', '4', '201805', '46', '黄为一', '53', '高国峰', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4255', '4', '201805', '42', '李珍', '53', '高国峰', '1', '服务量考评', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4256', '4', '201805', '42', '李珍', '53', '高国峰', '2', '服务时效', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4257', '4', '201805', '42', '李珍', '53', '高国峰', '3', '服务质量', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4258', '4', '201805', '42', '李珍', '53', '高国峰', '4', '服务表现', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4259', '4', '201805', '42', '李珍', '53', '高国峰', '5', '服务态度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4260', '4', '201805', '42', '李珍', '53', '高国峰', '6', '综合满意度', '10', null, '2018-05-24 11:16:04', '0');
INSERT INTO `check_result` VALUES ('4261', '4', '201805', '28', '万强', '54', '缪一帆', '1', '服务量考评', '6', null, '2018-05-24 10:32:54', '0');
INSERT INTO `check_result` VALUES ('4262', '4', '201805', '28', '万强', '54', '缪一帆', '2', '服务时效', '6', null, '2018-05-24 10:32:54', '0');
INSERT INTO `check_result` VALUES ('4263', '4', '201805', '28', '万强', '54', '缪一帆', '3', '服务质量', '6', null, '2018-05-24 10:32:54', '0');
INSERT INTO `check_result` VALUES ('4264', '4', '201805', '28', '万强', '54', '缪一帆', '4', '服务表现', '6', null, '2018-05-24 10:32:54', '0');
INSERT INTO `check_result` VALUES ('4265', '4', '201805', '28', '万强', '54', '缪一帆', '5', '服务态度', '6', null, '2018-05-24 10:32:54', '0');
INSERT INTO `check_result` VALUES ('4266', '4', '201805', '28', '万强', '54', '缪一帆', '6', '综合满意度', '6', null, '2018-05-24 10:32:54', '0');
INSERT INTO `check_result` VALUES ('4267', '4', '201805', '25', '王林飞', '54', '缪一帆', '1', '服务量考评', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4268', '4', '201805', '25', '王林飞', '54', '缪一帆', '2', '服务时效', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4269', '4', '201805', '25', '王林飞', '54', '缪一帆', '3', '服务质量', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4270', '4', '201805', '25', '王林飞', '54', '缪一帆', '4', '服务表现', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4271', '4', '201805', '25', '王林飞', '54', '缪一帆', '5', '服务态度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4272', '4', '201805', '25', '王林飞', '54', '缪一帆', '6', '综合满意度', '10', null, '2018-05-24 11:11:00', '0');
INSERT INTO `check_result` VALUES ('4273', '4', '201805', '9', '郑海洋', '54', '缪一帆', '1', '服务量考评', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4274', '4', '201805', '9', '郑海洋', '54', '缪一帆', '2', '服务时效', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4275', '4', '201805', '9', '郑海洋', '54', '缪一帆', '3', '服务质量', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4276', '4', '201805', '9', '郑海洋', '54', '缪一帆', '4', '服务表现', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4277', '4', '201805', '9', '郑海洋', '54', '缪一帆', '5', '服务态度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4278', '4', '201805', '9', '郑海洋', '54', '缪一帆', '6', '综合满意度', '10', null, '2018-05-24 11:15:29', '0');
INSERT INTO `check_result` VALUES ('4279', '4', '201805', '57', '李吁', '54', '缪一帆', '1', '服务量考评', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4280', '4', '201805', '57', '李吁', '54', '缪一帆', '2', '服务时效', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4281', '4', '201805', '57', '李吁', '54', '缪一帆', '3', '服务质量', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4282', '4', '201805', '57', '李吁', '54', '缪一帆', '4', '服务表现', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4283', '4', '201805', '57', '李吁', '54', '缪一帆', '5', '服务态度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4284', '4', '201805', '57', '李吁', '54', '缪一帆', '6', '综合满意度', '10', null, '2018-05-24 14:15:10', '0');
INSERT INTO `check_result` VALUES ('4285', '4', '201805', '38', '洪卫峰', '54', '缪一帆', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4286', '4', '201805', '38', '洪卫峰', '54', '缪一帆', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4287', '4', '201805', '38', '洪卫峰', '54', '缪一帆', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4288', '4', '201805', '38', '洪卫峰', '54', '缪一帆', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4289', '4', '201805', '38', '洪卫峰', '54', '缪一帆', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4290', '4', '201805', '38', '洪卫峰', '54', '缪一帆', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4291', '4', '201805', '63', '谢博文', '54', '缪一帆', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4292', '4', '201805', '63', '谢博文', '54', '缪一帆', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4293', '4', '201805', '63', '谢博文', '54', '缪一帆', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4294', '4', '201805', '63', '谢博文', '54', '缪一帆', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4295', '4', '201805', '63', '谢博文', '54', '缪一帆', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4296', '4', '201805', '63', '谢博文', '54', '缪一帆', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4297', '4', '201805', '10', '王维', '54', '缪一帆', '1', '服务量考评', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('4298', '4', '201805', '10', '王维', '54', '缪一帆', '2', '服务时效', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('4299', '4', '201805', '10', '王维', '54', '缪一帆', '3', '服务质量', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('4300', '4', '201805', '10', '王维', '54', '缪一帆', '4', '服务表现', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('4301', '4', '201805', '10', '王维', '54', '缪一帆', '5', '服务态度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('4302', '4', '201805', '10', '王维', '54', '缪一帆', '6', '综合满意度', '10', null, '2018-05-24 14:06:36', '0');
INSERT INTO `check_result` VALUES ('4303', '4', '201805', '22', '宗立', '54', '缪一帆', '1', '服务量考评', '6', null, '2018-05-24 10:53:10', '0');
INSERT INTO `check_result` VALUES ('4304', '4', '201805', '22', '宗立', '54', '缪一帆', '2', '服务时效', '6', null, '2018-05-24 10:53:10', '0');
INSERT INTO `check_result` VALUES ('4305', '4', '201805', '22', '宗立', '54', '缪一帆', '3', '服务质量', '6', null, '2018-05-24 10:53:10', '0');
INSERT INTO `check_result` VALUES ('4306', '4', '201805', '22', '宗立', '54', '缪一帆', '4', '服务表现', '6', null, '2018-05-24 10:53:10', '0');
INSERT INTO `check_result` VALUES ('4307', '4', '201805', '22', '宗立', '54', '缪一帆', '5', '服务态度', '6', null, '2018-05-24 10:53:10', '0');
INSERT INTO `check_result` VALUES ('4308', '4', '201805', '22', '宗立', '54', '缪一帆', '6', '综合满意度', '6', null, '2018-05-24 10:53:10', '0');
INSERT INTO `check_result` VALUES ('4309', '4', '201805', '62', '余正同', '54', '缪一帆', '1', '服务量考评', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4310', '4', '201805', '62', '余正同', '54', '缪一帆', '2', '服务时效', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4311', '4', '201805', '62', '余正同', '54', '缪一帆', '3', '服务质量', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4312', '4', '201805', '62', '余正同', '54', '缪一帆', '4', '服务表现', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4313', '4', '201805', '62', '余正同', '54', '缪一帆', '5', '服务态度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4314', '4', '201805', '62', '余正同', '54', '缪一帆', '6', '综合满意度', '10', null, '2018-05-24 11:16:28', '0');
INSERT INTO `check_result` VALUES ('4315', '4', '201805', '19', '涂登峰', '54', '缪一帆', '1', '服务量考评', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4316', '4', '201805', '19', '涂登峰', '54', '缪一帆', '2', '服务时效', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4317', '4', '201805', '19', '涂登峰', '54', '缪一帆', '3', '服务质量', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4318', '4', '201805', '19', '涂登峰', '54', '缪一帆', '4', '服务表现', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4319', '4', '201805', '19', '涂登峰', '54', '缪一帆', '5', '服务态度', '0', null, '2018-05-23 17:42:55', '0');
INSERT INTO `check_result` VALUES ('4320', '4', '201805', '19', '涂登峰', '54', '缪一帆', '6', '综合满意度', '0', null, '2018-05-23 17:42:55', '0');

-- ----------------------------
-- Table structure for check_task_assignment
-- ----------------------------
DROP TABLE IF EXISTS `check_task_assignment`;
CREATE TABLE `check_task_assignment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `monthId` int(10) DEFAULT NULL COMMENT '月份ID',
  `month` varchar(20) DEFAULT NULL COMMENT '月份记录',
  `evaluatorId` varchar(20) DEFAULT NULL COMMENT '评价人ID',
  `evaluator` varchar(20) DEFAULT NULL COMMENT '评价人',
  `operationPostId` varchar(20) DEFAULT NULL COMMENT '被评价人ID',
  `operationPost` varchar(20) DEFAULT NULL COMMENT '被评价人',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  `ifLike` varchar(1) DEFAULT NULL COMMENT '1喜欢,0默认',
  `status` int(1) DEFAULT '0' COMMENT '提交状态 0未提交 1已提交',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_task_assignment
-- ----------------------------
INSERT INTO `check_task_assignment` VALUES ('541', '4', '201805', '48', '陈佳伟', '11', '彭文君', null, '2018-05-24 11:16:17', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('542', '4', '201805', '59', '黄鞭', '11', '彭文君', null, '2018-05-24 14:39:06', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('543', '4', '201805', '27', '张艳', '11', '彭文君', null, '2018-05-24 11:11:09', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('544', '4', '201805', '25', '王林飞', '11', '彭文君', null, '2018-05-24 11:11:00', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('545', '4', '201805', '8', '葛汤华', '11', '彭文君', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('546', '4', '201805', '42', '李珍', '11', '彭文君', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('547', '4', '201805', '21', '范毛毛', '11', '彭文君', null, '2018-05-24 10:55:21', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('548', '4', '201805', '47', '冯志强', '11', '彭文君', null, '2018-05-24 14:51:26', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('549', '4', '201805', '62', '余正同', '11', '彭文君', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('550', '4', '201805', '46', '黄为一', '11', '彭文君', null, '2018-05-24 14:44:56', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('551', '4', '201805', '61', '王韵盟', '13', '宋金凤', null, '2018-05-24 14:09:12', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('552', '4', '201805', '28', '万强', '13', '宋金凤', null, '2018-05-24 10:30:00', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('553', '4', '201805', '58', '赵佳祺', '13', '宋金凤', null, '2018-05-24 13:50:24', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('554', '4', '201805', '9', '郑海洋', '13', '宋金凤', null, '2018-05-24 11:15:30', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('555', '4', '201805', '33', '周丽咪', '13', '宋金凤', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('556', '4', '201805', '57', '李吁', '13', '宋金凤', null, '2018-05-24 14:15:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('557', '4', '201805', '60', '钟文宇', '13', '宋金凤', null, '2018-05-24 14:08:58', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('558', '4', '201805', '10', '王维', '13', '宋金凤', null, '2018-05-24 14:06:38', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('559', '4', '201805', '42', '李珍', '13', '宋金凤', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('560', '4', '201805', '25', '王林飞', '13', '宋金凤', null, '2018-05-24 11:11:00', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('561', '4', '201805', '28', '万强', '16', '鲁晓', null, '2018-05-24 09:57:48', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('562', '4', '201805', '15', '李沙', '16', '鲁晓', null, '2018-05-24 10:35:03', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('563', '4', '201805', '22', '宗立', '16', '鲁晓', null, '2018-05-24 10:48:34', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('564', '4', '201805', '33', '周丽咪', '16', '鲁晓', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('565', '4', '201805', '9', '郑海洋', '16', '鲁晓', null, '2018-05-24 11:15:30', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('566', '4', '201805', '48', '陈佳伟', '16', '鲁晓', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('567', '4', '201805', '8', '葛汤华', '16', '鲁晓', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('568', '4', '201805', '14', '杨少清', '16', '鲁晓', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('569', '4', '201805', '62', '余正同', '16', '鲁晓', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('570', '4', '201805', '42', '李珍', '16', '鲁晓', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('571', '4', '201805', '10', '王维', '17', '王超楠', null, '2018-05-24 14:06:38', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('572', '4', '201805', '61', '王韵盟', '17', '王超楠', null, '2018-05-24 14:09:12', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('573', '4', '201805', '21', '范毛毛', '17', '王超楠', null, '2018-05-24 10:55:47', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('574', '4', '201805', '19', '涂登峰', '17', '王超楠', null, '2018-05-24 14:28:00', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('575', '4', '201805', '14', '杨少清', '17', '王超楠', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('576', '4', '201805', '38', '洪卫峰', '17', '王超楠', null, '2018-05-24 14:51:55', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('577', '4', '201805', '46', '黄为一', '17', '王超楠', null, '2018-05-24 14:45:34', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('578', '4', '201805', '48', '陈佳伟', '17', '王超楠', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('579', '4', '201805', '59', '黄鞭', '17', '王超楠', null, '2018-05-24 14:38:36', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('580', '4', '201805', '30', '朱子晔', '17', '王超楠', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('581', '4', '201805', '48', '陈佳伟', '23', '杨莉', null, '2018-05-24 11:16:17', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('582', '4', '201805', '25', '王林飞', '23', '杨莉', null, '2018-05-24 11:11:00', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('583', '4', '201805', '58', '赵佳祺', '23', '杨莉', null, '2018-05-24 13:50:40', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('584', '4', '201805', '8', '葛汤华', '23', '杨莉', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('585', '4', '201805', '57', '李吁', '23', '杨莉', null, '2018-05-24 14:15:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('586', '4', '201805', '33', '周丽咪', '23', '杨莉', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('587', '4', '201805', '38', '洪卫峰', '23', '杨莉', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('588', '4', '201805', '10', '王维', '23', '杨莉', null, '2018-05-24 14:06:38', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('589', '4', '201805', '19', '涂登峰', '23', '杨莉', null, '2018-05-24 14:28:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('590', '4', '201805', '30', '朱子晔', '23', '杨莉', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('591', '4', '201805', '15', '李沙', '24', '杨仙', null, '2018-05-24 10:35:38', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('592', '4', '201805', '61', '王韵盟', '24', '杨仙', null, '2018-05-24 14:09:12', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('593', '4', '201805', '30', '朱子晔', '24', '杨仙', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('594', '4', '201805', '62', '余正同', '24', '杨仙', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('595', '4', '201805', '47', '冯志强', '24', '杨仙', null, '2018-05-24 14:51:36', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('596', '4', '201805', '42', '李珍', '24', '杨仙', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('597', '4', '201805', '12', '韩云登', '24', '杨仙', null, '2018-05-23 17:57:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('598', '4', '201805', '14', '杨少清', '24', '杨仙', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('599', '4', '201805', '19', '涂登峰', '24', '杨仙', null, '2018-05-24 14:29:00', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('600', '4', '201805', '21', '范毛毛', '24', '杨仙', null, '2018-05-24 10:58:18', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('601', '4', '201805', '22', '宗立', '26', '季寰宇', null, '2018-05-24 10:50:46', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('602', '4', '201805', '21', '范毛毛', '26', '季寰宇', null, '2018-05-24 10:59:30', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('603', '4', '201805', '46', '黄为一', '26', '季寰宇', null, '2018-05-24 15:55:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('604', '4', '201805', '63', '谢博文', '26', '季寰宇', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('605', '4', '201805', '59', '黄鞭', '26', '季寰宇', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('606', '4', '201805', '60', '钟文宇', '26', '季寰宇', null, '2018-05-24 14:08:58', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('607', '4', '201805', '61', '王韵盟', '26', '季寰宇', null, '2018-05-24 14:09:12', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('608', '4', '201805', '12', '韩云登', '26', '季寰宇', null, '2018-05-23 17:57:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('609', '4', '201805', '42', '李珍', '26', '季寰宇', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('610', '4', '201805', '33', '周丽咪', '26', '季寰宇', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('611', '4', '201805', '12', '韩云登', '29', '刘崧', null, '2018-05-23 17:57:03', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('612', '4', '201805', '9', '郑海洋', '29', '刘崧', null, '2018-05-24 11:15:30', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('613', '4', '201805', '33', '周丽咪', '29', '刘崧', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('614', '4', '201805', '62', '余正同', '29', '刘崧', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('615', '4', '201805', '21', '范毛毛', '29', '刘崧', null, '2018-05-24 10:59:47', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('616', '4', '201805', '60', '钟文宇', '29', '刘崧', null, '2018-05-24 14:08:58', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('617', '4', '201805', '38', '洪卫峰', '29', '刘崧', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('618', '4', '201805', '19', '涂登峰', '29', '刘崧', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('619', '4', '201805', '57', '李吁', '29', '刘崧', null, '2018-05-24 14:15:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('620', '4', '201805', '48', '陈佳伟', '29', '刘崧', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('621', '4', '201805', '25', '王林飞', '37', '杨沁', null, '2018-05-24 11:11:00', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('622', '4', '201805', '63', '谢博文', '37', '杨沁', null, '2018-05-23 17:42:52', '0', '1', '0');
INSERT INTO `check_task_assignment` VALUES ('623', '4', '201805', '22', '宗立', '37', '杨沁', null, '2018-05-24 10:51:02', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('624', '4', '201805', '15', '李沙', '37', '杨沁', null, '2018-05-24 10:37:56', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('625', '4', '201805', '59', '黄鞭', '37', '杨沁', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('626', '4', '201805', '60', '钟文宇', '37', '杨沁', null, '2018-05-24 14:08:58', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('627', '4', '201805', '61', '王韵盟', '37', '杨沁', null, '2018-05-24 14:09:12', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('628', '4', '201805', '58', '赵佳祺', '37', '杨沁', null, '2018-05-24 13:51:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('629', '4', '201805', '42', '李珍', '37', '杨沁', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('630', '4', '201805', '47', '冯志强', '37', '杨沁', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('631', '4', '201805', '33', '周丽咪', '39', '王妍', null, '2018-05-24 11:15:15', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('632', '4', '201805', '9', '郑海洋', '39', '王妍', null, '2018-05-24 11:15:30', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('633', '4', '201805', '30', '朱子晔', '39', '王妍', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('634', '4', '201805', '19', '涂登峰', '39', '王妍', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('635', '4', '201805', '12', '韩云登', '39', '王妍', null, '2018-05-23 17:57:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('636', '4', '201805', '38', '洪卫峰', '39', '王妍', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('637', '4', '201805', '8', '葛汤华', '39', '王妍', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('638', '4', '201805', '63', '谢博文', '39', '王妍', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('639', '4', '201805', '27', '张艳', '39', '王妍', null, '2018-05-24 11:11:09', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('640', '4', '201805', '48', '陈佳伟', '39', '王妍', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('641', '4', '201805', '9', '郑海洋', '41', '杨露', null, '2018-05-24 11:15:30', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('642', '4', '201805', '10', '王维', '41', '杨露', null, '2018-05-24 14:06:38', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('643', '4', '201805', '12', '韩云登', '41', '杨露', null, '2018-05-23 17:57:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('644', '4', '201805', '21', '范毛毛', '41', '杨露', null, '2018-05-24 11:02:08', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('645', '4', '201805', '48', '陈佳伟', '41', '杨露', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('646', '4', '201805', '59', '黄鞭', '41', '杨露', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('647', '4', '201805', '33', '周丽咪', '41', '杨露', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('648', '4', '201805', '60', '钟文宇', '41', '杨露', null, '2018-05-24 14:08:58', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('649', '4', '201805', '19', '涂登峰', '41', '杨露', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('650', '4', '201805', '22', '宗立', '41', '杨露', null, '2018-05-24 10:51:26', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('651', '4', '201805', '21', '范毛毛', '43', '虞炯辉', null, '2018-05-24 11:02:31', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('652', '4', '201805', '62', '余正同', '43', '虞炯辉', null, '2018-05-24 11:16:28', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('653', '4', '201805', '38', '洪卫峰', '43', '虞炯辉', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('654', '4', '201805', '19', '涂登峰', '43', '虞炯辉', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('655', '4', '201805', '27', '张艳', '43', '虞炯辉', null, '2018-05-24 11:11:09', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('656', '4', '201805', '58', '赵佳祺', '43', '虞炯辉', null, '2018-05-24 13:50:44', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('657', '4', '201805', '30', '朱子晔', '43', '虞炯辉', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('658', '4', '201805', '47', '冯志强', '43', '虞炯辉', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('659', '4', '201805', '33', '周丽咪', '43', '虞炯辉', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('660', '4', '201805', '8', '葛汤华', '43', '虞炯辉', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('661', '4', '201805', '25', '王林飞', '45', '袁芝伟', null, '2018-05-24 11:11:00', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('662', '4', '201805', '47', '冯志强', '45', '袁芝伟', null, '2018-05-23 17:42:52', '0', '1', '0');
INSERT INTO `check_task_assignment` VALUES ('663', '4', '201805', '30', '朱子晔', '45', '袁芝伟', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('664', '4', '201805', '60', '钟文宇', '45', '袁芝伟', null, '2018-05-24 14:08:58', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('665', '4', '201805', '12', '韩云登', '45', '袁芝伟', null, '2018-05-23 17:57:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('666', '4', '201805', '48', '陈佳伟', '45', '袁芝伟', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('667', '4', '201805', '59', '黄鞭', '45', '袁芝伟', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('668', '4', '201805', '22', '宗立', '45', '袁芝伟', null, '2018-05-24 10:52:36', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('669', '4', '201805', '62', '余正同', '45', '袁芝伟', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('670', '4', '201805', '58', '赵佳祺', '45', '袁芝伟', null, '2018-05-24 13:50:48', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('671', '4', '201805', '30', '朱子晔', '49', '陈伊盈', null, '2018-05-24 11:11:45', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('672', '4', '201805', '25', '王林飞', '49', '陈伊盈', null, '2018-05-24 11:11:00', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('673', '4', '201805', '12', '韩云登', '49', '陈伊盈', null, '2018-05-23 17:57:03', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('674', '4', '201805', '14', '杨少清', '49', '陈伊盈', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('675', '4', '201805', '58', '赵佳祺', '49', '陈伊盈', null, '2018-05-24 13:50:56', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('676', '4', '201805', '33', '周丽咪', '49', '陈伊盈', null, '2018-05-24 11:15:15', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('677', '4', '201805', '47', '冯志强', '49', '陈伊盈', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('678', '4', '201805', '8', '葛汤华', '49', '陈伊盈', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('679', '4', '201805', '46', '黄为一', '49', '陈伊盈', null, '2018-05-24 15:55:43', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('680', '4', '201805', '42', '李珍', '49', '陈伊盈', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('681', '4', '201805', '21', '范毛毛', '50', '陈秋婷', null, '2018-05-24 11:05:24', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('682', '4', '201805', '63', '谢博文', '50', '陈秋婷', null, '2018-05-23 17:42:52', '0', '1', '0');
INSERT INTO `check_task_assignment` VALUES ('683', '4', '201805', '57', '李吁', '50', '陈秋婷', null, '2018-05-24 14:15:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('684', '4', '201805', '58', '赵佳祺', '50', '陈秋婷', null, '2018-05-24 13:50:52', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('685', '4', '201805', '48', '陈佳伟', '50', '陈秋婷', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('686', '4', '201805', '59', '黄鞭', '50', '陈秋婷', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('687', '4', '201805', '25', '王林飞', '50', '陈秋婷', null, '2018-05-24 11:11:00', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('688', '4', '201805', '27', '张艳', '50', '陈秋婷', null, '2018-05-24 11:11:09', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('689', '4', '201805', '14', '杨少清', '50', '陈秋婷', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('690', '4', '201805', '9', '郑海洋', '50', '陈秋婷', null, '2018-05-24 11:15:30', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('691', '4', '201805', '28', '万强', '52', '陈默', null, '2018-05-24 10:31:50', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('692', '4', '201805', '59', '黄鞭', '52', '陈默', null, '2018-05-23 17:42:52', '0', '1', '0');
INSERT INTO `check_task_assignment` VALUES ('693', '4', '201805', '14', '杨少清', '52', '陈默', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('694', '4', '201805', '62', '余正同', '52', '陈默', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('695', '4', '201805', '47', '冯志强', '52', '陈默', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('696', '4', '201805', '48', '陈佳伟', '52', '陈默', null, '2018-05-24 11:16:17', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('697', '4', '201805', '30', '朱子晔', '52', '陈默', null, '2018-05-24 11:11:45', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('698', '4', '201805', '15', '李沙', '52', '陈默', null, '2018-05-24 10:39:13', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('699', '4', '201805', '58', '赵佳祺', '52', '陈默', null, '2018-05-24 13:50:59', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('700', '4', '201805', '61', '王韵盟', '52', '陈默', null, '2018-05-24 14:09:12', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('701', '4', '201805', '12', '韩云登', '53', '高国峰', null, '2018-05-23 17:57:03', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('702', '4', '201805', '21', '范毛毛', '53', '高国峰', null, '2018-05-24 11:05:56', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('703', '4', '201805', '8', '葛汤华', '53', '高国峰', null, '2018-05-23 18:12:22', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('704', '4', '201805', '22', '宗立', '53', '高国峰', null, '2018-05-24 10:52:47', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('705', '4', '201805', '57', '李吁', '53', '高国峰', null, '2018-05-24 14:15:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('706', '4', '201805', '14', '杨少清', '53', '高国峰', null, '2018-05-24 11:15:37', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('707', '4', '201805', '27', '张艳', '53', '高国峰', null, '2018-05-24 11:11:09', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('708', '4', '201805', '15', '李沙', '53', '高国峰', null, '2018-05-24 10:47:36', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('709', '4', '201805', '46', '黄为一', '53', '高国峰', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('710', '4', '201805', '42', '李珍', '53', '高国峰', null, '2018-05-24 11:16:05', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('711', '4', '201805', '28', '万强', '54', '缪一帆', null, '2018-05-24 10:32:54', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('712', '4', '201805', '25', '王林飞', '54', '缪一帆', null, '2018-05-24 11:11:00', '0', '1', '1');
INSERT INTO `check_task_assignment` VALUES ('713', '4', '201805', '9', '郑海洋', '54', '缪一帆', null, '2018-05-24 11:15:30', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('714', '4', '201805', '57', '李吁', '54', '缪一帆', null, '2018-05-24 14:15:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('715', '4', '201805', '38', '洪卫峰', '54', '缪一帆', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('716', '4', '201805', '63', '谢博文', '54', '缪一帆', null, '2018-05-23 17:42:52', '0', '0', '0');
INSERT INTO `check_task_assignment` VALUES ('717', '4', '201805', '10', '王维', '54', '缪一帆', null, '2018-05-24 14:06:38', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('718', '4', '201805', '22', '宗立', '54', '缪一帆', null, '2018-05-24 10:53:10', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('719', '4', '201805', '62', '余正同', '54', '缪一帆', null, '2018-05-24 11:16:28', '0', '0', '1');
INSERT INTO `check_task_assignment` VALUES ('720', '4', '201805', '19', '涂登峰', '54', '缪一帆', null, '2018-05-23 17:42:52', '0', '0', '0');

-- ----------------------------
-- Table structure for ly_buttom
-- ----------------------------
DROP TABLE IF EXISTS `ly_buttom`;
CREATE TABLE `ly_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `buttom` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_buttom
-- ----------------------------
INSERT INTO `ly_buttom` VALUES ('1', '新增', '<button type=\"button\" id=\"addFun\" class=\"btn btn-primary marR10\">新增</button>', '');
INSERT INTO `ly_buttom` VALUES ('2', '编辑', '<button type=\"button\" id=\"editFun\" class=\"btn btn-info marR10\">编辑</button>', null);
INSERT INTO `ly_buttom` VALUES ('3', '删除', '<button type=\"button\" id=\"delFun\" class=\"btn btn-danger marR10\">删除</button>', null);
INSERT INTO `ly_buttom` VALUES ('4', '上传', '<button type=\"button\" id=\"upLoad\" class=\"btn btn-primary marR10\">上传</button>', null);
INSERT INTO `ly_buttom` VALUES ('5', '下载', '<button type=\"button\" id=\"downLoad\" class=\"btn btn-primary marR10\">下载</button>', null);
INSERT INTO `ly_buttom` VALUES ('6', '上移', '<button type=\"button\" id=\"lyGridUp\" class=\"btn btn-success marR10\">上移</button>', null);
INSERT INTO `ly_buttom` VALUES ('7', '下移', '<button type=\"button\" id=\"lyGridDown\" class=\"btn btn btn-grey marR10\">下移</button>', null);
INSERT INTO `ly_buttom` VALUES ('8', '分配权限', '<button type=\"button\" id=\"permissions\" class=\"btn btn btn-grey marR10\">分配权限</button>', null);

-- ----------------------------
-- Table structure for ly_group
-- ----------------------------
DROP TABLE IF EXISTS `ly_group`;
CREATE TABLE `ly_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_group
-- ----------------------------
INSERT INTO `ly_group` VALUES ('1', '系统管理员');
INSERT INTO `ly_group` VALUES ('2', '信贷管理团队');
INSERT INTO `ly_group` VALUES ('3', '业务支持团队');
INSERT INTO `ly_group` VALUES ('4', '交运团队1');
INSERT INTO `ly_group` VALUES ('5', '交运团队2');
INSERT INTO `ly_group` VALUES ('6', '零售团队1');
INSERT INTO `ly_group` VALUES ('7', '零售团队2');
INSERT INTO `ly_group` VALUES ('8', '快运团队');
INSERT INTO `ly_group` VALUES ('9', '部门领导');

-- ----------------------------
-- Table structure for ly_group_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_group_role`;
CREATE TABLE `ly_group_role` (
  `groupId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`groupId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_group_role
-- ----------------------------
INSERT INTO `ly_group_role` VALUES ('1', '1');
INSERT INTO `ly_group_role` VALUES ('1', '2');
INSERT INTO `ly_group_role` VALUES ('1', '3');
INSERT INTO `ly_group_role` VALUES ('2', '4');
INSERT INTO `ly_group_role` VALUES ('2', '6');
INSERT INTO `ly_group_role` VALUES ('2', '7');
INSERT INTO `ly_group_role` VALUES ('3', '4');
INSERT INTO `ly_group_role` VALUES ('3', '6');
INSERT INTO `ly_group_role` VALUES ('3', '7');
INSERT INTO `ly_group_role` VALUES ('3', '8');
INSERT INTO `ly_group_role` VALUES ('3', '11');
INSERT INTO `ly_group_role` VALUES ('4', '4');
INSERT INTO `ly_group_role` VALUES ('4', '6');
INSERT INTO `ly_group_role` VALUES ('4', '7');
INSERT INTO `ly_group_role` VALUES ('5', '4');
INSERT INTO `ly_group_role` VALUES ('5', '6');
INSERT INTO `ly_group_role` VALUES ('5', '7');
INSERT INTO `ly_group_role` VALUES ('6', '4');
INSERT INTO `ly_group_role` VALUES ('6', '6');
INSERT INTO `ly_group_role` VALUES ('6', '7');
INSERT INTO `ly_group_role` VALUES ('7', '4');
INSERT INTO `ly_group_role` VALUES ('7', '6');
INSERT INTO `ly_group_role` VALUES ('7', '7');
INSERT INTO `ly_group_role` VALUES ('8', '4');
INSERT INTO `ly_group_role` VALUES ('8', '6');
INSERT INTO `ly_group_role` VALUES ('8', '7');
INSERT INTO `ly_group_role` VALUES ('8', '8');
INSERT INTO `ly_group_role` VALUES ('9', '9');
INSERT INTO `ly_group_role` VALUES ('9', '10');

-- ----------------------------
-- Table structure for ly_group_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_group_user`;
CREATE TABLE `ly_group_user` (
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`groupId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_group_user
-- ----------------------------
INSERT INTO `ly_group_user` VALUES ('2', '11');
INSERT INTO `ly_group_user` VALUES ('2', '13');
INSERT INTO `ly_group_user` VALUES ('2', '16');
INSERT INTO `ly_group_user` VALUES ('2', '17');
INSERT INTO `ly_group_user` VALUES ('2', '23');
INSERT INTO `ly_group_user` VALUES ('2', '24');
INSERT INTO `ly_group_user` VALUES ('2', '26');
INSERT INTO `ly_group_user` VALUES ('2', '31');
INSERT INTO `ly_group_user` VALUES ('2', '32');
INSERT INTO `ly_group_user` VALUES ('3', '4');
INSERT INTO `ly_group_user` VALUES ('3', '29');
INSERT INTO `ly_group_user` VALUES ('3', '35');
INSERT INTO `ly_group_user` VALUES ('3', '37');
INSERT INTO `ly_group_user` VALUES ('3', '39');
INSERT INTO `ly_group_user` VALUES ('3', '41');
INSERT INTO `ly_group_user` VALUES ('3', '43');
INSERT INTO `ly_group_user` VALUES ('3', '45');
INSERT INTO `ly_group_user` VALUES ('3', '49');
INSERT INTO `ly_group_user` VALUES ('3', '50');
INSERT INTO `ly_group_user` VALUES ('3', '51');
INSERT INTO `ly_group_user` VALUES ('3', '52');
INSERT INTO `ly_group_user` VALUES ('3', '53');
INSERT INTO `ly_group_user` VALUES ('3', '54');
INSERT INTO `ly_group_user` VALUES ('4', '5');
INSERT INTO `ly_group_user` VALUES ('4', '6');
INSERT INTO `ly_group_user` VALUES ('4', '8');
INSERT INTO `ly_group_user` VALUES ('4', '9');
INSERT INTO `ly_group_user` VALUES ('4', '10');
INSERT INTO `ly_group_user` VALUES ('4', '12');
INSERT INTO `ly_group_user` VALUES ('4', '14');
INSERT INTO `ly_group_user` VALUES ('4', '15');
INSERT INTO `ly_group_user` VALUES ('5', '18');
INSERT INTO `ly_group_user` VALUES ('5', '19');
INSERT INTO `ly_group_user` VALUES ('5', '21');
INSERT INTO `ly_group_user` VALUES ('5', '22');
INSERT INTO `ly_group_user` VALUES ('5', '25');
INSERT INTO `ly_group_user` VALUES ('5', '27');
INSERT INTO `ly_group_user` VALUES ('5', '28');
INSERT INTO `ly_group_user` VALUES ('5', '30');
INSERT INTO `ly_group_user` VALUES ('5', '33');
INSERT INTO `ly_group_user` VALUES ('6', '34');
INSERT INTO `ly_group_user` VALUES ('6', '36');
INSERT INTO `ly_group_user` VALUES ('6', '38');
INSERT INTO `ly_group_user` VALUES ('6', '40');
INSERT INTO `ly_group_user` VALUES ('6', '42');
INSERT INTO `ly_group_user` VALUES ('7', '44');
INSERT INTO `ly_group_user` VALUES ('7', '46');
INSERT INTO `ly_group_user` VALUES ('7', '47');
INSERT INTO `ly_group_user` VALUES ('7', '48');
INSERT INTO `ly_group_user` VALUES ('8', '5');
INSERT INTO `ly_group_user` VALUES ('8', '55');
INSERT INTO `ly_group_user` VALUES ('8', '56');
INSERT INTO `ly_group_user` VALUES ('8', '57');
INSERT INTO `ly_group_user` VALUES ('8', '58');
INSERT INTO `ly_group_user` VALUES ('8', '59');
INSERT INTO `ly_group_user` VALUES ('8', '60');
INSERT INTO `ly_group_user` VALUES ('8', '61');
INSERT INTO `ly_group_user` VALUES ('8', '62');
INSERT INTO `ly_group_user` VALUES ('8', '63');
INSERT INTO `ly_group_user` VALUES ('9', '64');
INSERT INTO `ly_group_user` VALUES ('9', '65');

-- ----------------------------
-- Table structure for ly_log
-- ----------------------------
DROP TABLE IF EXISTS `ly_log`;
CREATE TABLE `ly_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `methods` varchar(5000) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1598 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_log
-- ----------------------------
INSERT INTO `ly_log` VALUES ('792', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '10975', '127.0.0.1', '2018-03-20 14:35:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('793', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '29582', '127.0.0.1', '2018-03-20 16:06:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('794', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '14076', '127.0.0.1', '2018-03-20 16:54:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('795', '无法获取登录用户信息！', '系统管理', '<font colo/font>', '0', '127.0.0.1', '2018-03-20 17:39:45', '<font color=\"red\">执行方法异常:sedCodeByUserId</font>');
INSERT INTO `ly_log` VALUES ('796', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码</font>', '0', '127.0.0.1', '2018-03-20 17:40:15', '<font color=\"red\">执行方法异常:sedCodeByUserId</font>');
INSERT INTO `ly_log` VALUES ('800', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码</font>', '0', '127.0.0.1', '2018-03-20 18:05:54', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.executor.ExecutorException: A query was run and no Result Maps were found for the Mapped Statement com.numberONe.mapper.ValidateEmailMapper.getUnusedCodeByUserId.  Its likely that neither a Result Type nor a Result Map was specified.</font>');
INSERT INTO `ly_log` VALUES ('801', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '26154', '127.0.0.1', '2018-03-21 09:17:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('802', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '838', '127.0.0.1', '2018-03-21 09:18:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('803', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码</font>', '0', '127.0.0.1', '2018-03-21 10:41:47', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer\r\n### The error may exist in file [D:Code.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsLogisticsWEB-INFclassesmappingsvaludateEmail-mapper.xml]\r\n### The error may involve com.numberONe.mapper.ValidateEmailMapper.validateCode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT COUNT(*) FROM validate_email t         WHERE t.accountName = ?         AND t.`code` = ?         AND t.`status` = 0\r\n### Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer</font>');
INSERT INTO `ly_log` VALUES ('804', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '72', '127.0.0.1', '2018-03-21 10:44:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('805', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码验证</font>', '0', '127.0.0.1', '2018-03-21 10:44:43', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer\r\n### The error may exist in file [D:Code.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsLogisticsWEB-INFclassesmappingsvaludateEmail-mapper.xml]\r\n### The error may involve com.numberONe.mapper.ValidateEmailMapper.validateCode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT COUNT(*) FROM validate_email t         WHERE t.accountName = ?         AND t.`code` = ?         AND t.`status` = 0\r\n### Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer</font>');
INSERT INTO `ly_log` VALUES ('806', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码验证</font>', '0', '127.0.0.1', '2018-03-21 10:45:11', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer\r\n### The error may exist in file [D:Code.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsLogisticsWEB-INFclassesmappingsvaludateEmail-mapper.xml]\r\n### The error may involve com.numberONe.mapper.ValidateEmailMapper.validateCode-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT COUNT(*) FROM validate_email t         WHERE t.accountName = ?         AND t.`code` = ?         AND t.`status` = 0\r\n### Cause: java.lang.ClassCastException: java.lang.String cannot be cast to java.lang.Integer</font>');
INSERT INTO `ly_log` VALUES ('807', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '9236', '127.0.0.1', '2018-03-21 10:46:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('808', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '12127', '127.0.0.1', '2018-03-21 13:39:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('809', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码验证</font>', '0', '127.0.0.1', '2018-03-21 13:40:17', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: java.lang.IllegalArgumentException: principal argument cannot be null.</font>');
INSERT INTO `ly_log` VALUES ('810', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '32423', '127.0.0.1', '2018-03-21 14:11:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('811', '无法获取登录用户信息！', '系统管理', '<font color=\"red\">执行方法异常:-->用户管理-忘记密码验证</font>', '0', '127.0.0.1', '2018-03-21 14:12:17', '<font color=\"red\">执行方法异常:-->java.lang.RuntimeException: org.apache.shiro.authc.IncorrectCredentialsException: Submitted credentials for token [com.numberONe.shiro.EasyTypeToken - zhangwei, rememberMe=false] did not match the expected credentials.</font>');
INSERT INTO `ly_log` VALUES ('812', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '22961', '127.0.0.1', '2018-03-21 15:12:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('813', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '38204', '127.0.0.1', '2018-03-21 15:13:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('814', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '26488', '127.0.0.1', '2018-03-21 15:21:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('815', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '33714', '127.0.0.1', '2018-03-21 15:25:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('816', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '4291', '127.0.0.1', '2018-03-21 15:27:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('817', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '5705', '127.0.0.1', '2018-03-21 15:33:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('818', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '3449', '127.0.0.1', '2018-03-21 15:34:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('819', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '5156', '127.0.0.1', '2018-03-21 15:35:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('820', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '11552', '127.0.0.1', '2018-03-21 15:36:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('821', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '5140', '127.0.0.1', '2018-03-21 15:51:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('822', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '5495', '127.0.0.1', '2018-03-21 15:52:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('823', 'zhangwei', '系统管理', '用户管理-修改密码', '74', '127.0.0.1', '2018-03-21 15:52:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('824', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '14609', '127.0.0.1', '2018-03-21 15:54:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('825', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '11325', '127.0.0.1', '2018-03-21 15:54:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('826', 'zhangwei', '系统管理', '用户管理-修改密码', '259236', '127.0.0.1', '2018-03-21 15:59:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('827', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '3124', '127.0.0.1', '2018-03-21 16:00:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('828', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '110134', '127.0.0.1', '2018-03-21 16:08:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('829', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '5222', '127.0.0.1', '2018-03-21 16:17:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('830', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '16032', '127.0.0.1', '2018-03-21 16:17:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('831', 'zhangwei', '系统管理', '用户管理-修改密码', '87090', '127.0.0.1', '2018-03-21 16:19:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('832', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '3274', '127.0.0.1', '2018-03-21 16:28:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('833', 'zhangwei', '系统管理', '用户管理-修改密码', '25938', '127.0.0.1', '2018-03-21 16:28:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('834', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '9174', '127.0.0.1', '2018-03-21 17:19:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('835', 'zhangwei', '系统管理', '用户管理-修改密码', '6156', '127.0.0.1', '2018-03-21 17:19:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('836', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '9278', '127.0.0.1', '2018-03-26 09:27:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('837', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '5462', '127.0.0.1', '2018-03-26 09:29:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('838', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '28', '127.0.0.1', '2018-03-26 09:30:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('839', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '4922', '127.0.0.1', '2018-03-26 09:30:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('840', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '369', '127.0.0.1', '2018-03-26 09:31:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('841', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '414', '127.0.0.1', '2018-03-26 09:31:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('842', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '433', '127.0.0.1', '2018-03-26 09:32:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('843', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '503', '127.0.0.1', '2018-03-26 09:42:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('844', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '657', '127.0.0.1', '2018-03-26 09:43:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('845', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1076', '127.0.0.1', '2018-03-26 09:48:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('846', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '843', '127.0.0.1', '2018-03-26 09:50:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('847', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '7998', '127.0.0.1', '2018-03-26 09:58:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('848', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '30', '127.0.0.1', '2018-03-26 09:58:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('849', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '3388', '127.0.0.1', '2018-03-26 10:12:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('850', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '2770', '127.0.0.1', '2018-03-26 10:13:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('851', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '2487', '127.0.0.1', '2018-03-26 10:13:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('852', 'zhangwei', '系统管理', '用户管理-修改密码', '12309', '127.0.0.1', '2018-03-26 10:15:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('853', 'zhangwei', '系统管理', '用户管理-修改密码', '6689', '127.0.0.1', '2018-03-26 10:16:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('854', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '2389', '127.0.0.1', '2018-03-26 10:16:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('855', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '2115', '127.0.0.1', '2018-03-26 10:17:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('856', 'zhangwei', '系统管理', '用户管理-忘记密码', '668', '127.0.0.1', '2018-03-26 10:18:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('857', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '5222', '127.0.0.1', '2018-03-26 10:19:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('858', 'zhangwei', '系统管理', '用户管理-修改密码', '1441', '127.0.0.1', '2018-03-26 10:21:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('859', 'zhangwei', '系统管理', '资源管理-修改资源', '37', '127.0.0.1', '2018-03-26 11:10:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('860', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127448', '180.167.77.138', '2018-03-26 11:31:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('861', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127220', '180.167.77.138', '2018-03-26 11:31:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('862', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127373', '180.167.77.138', '2018-03-26 11:33:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('863', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127248', '180.167.77.138', '2018-03-26 11:33:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('864', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127335', '180.167.77.138', '2018-03-26 11:33:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('865', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127298', '180.167.77.138', '2018-03-26 11:33:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('866', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127380', '180.167.77.138', '2018-03-26 11:33:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('867', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127266', '180.167.77.138', '2018-03-26 11:33:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('868', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1053', '127.0.0.1', '2018-03-26 12:27:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('869', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '806', '127.0.0.1', '2018-03-26 13:43:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('870', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127311', '180.167.77.138', '2018-03-26 13:46:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('871', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127265', '180.167.77.138', '2018-03-26 13:46:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('872', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127287', '180.167.77.138', '2018-03-26 13:47:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('873', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127269', '180.167.77.138', '2018-03-26 13:48:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('874', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127215', '180.167.77.138', '2018-03-26 13:49:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('875', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127277', '180.167.77.138', '2018-03-26 13:52:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('876', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '701', '127.0.0.1', '2018-03-26 14:01:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('877', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '21824', '127.0.0.1', '2018-03-26 14:08:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('878', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '21311', '127.0.0.1', '2018-03-26 14:09:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('879', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '6704', '127.0.0.1', '2018-03-26 14:10:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('880', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '8635', '127.0.0.1', '2018-03-26 14:12:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('881', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1280', '127.0.0.1', '2018-03-26 14:15:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('882', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '829', '127.0.0.1', '2018-03-26 14:19:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('883', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '713', '127.0.0.1', '2018-03-26 14:20:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('884', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1035', '127.0.0.1', '2018-03-26 14:24:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('885', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '790', '127.0.0.1', '2018-03-26 14:24:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('886', 'zhangwei', '系统管理', '用户管理-修改密码', '77', '127.0.0.1', '2018-03-26 14:25:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('887', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127511', '180.167.77.138', '2018-03-26 14:32:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('888', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '17873', '180.167.77.138', '2018-03-26 14:46:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('889', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127549', '180.167.77.138', '2018-03-26 14:56:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('890', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127364', '180.167.77.138', '2018-03-26 15:08:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('891', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127373', '180.167.77.138', '2018-03-26 15:09:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('892', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '127246', '180.167.77.138', '2018-03-26 15:09:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('893', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '18682', '180.167.77.138', '2018-03-26 15:12:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('894', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '17029', '180.167.77.138', '2018-03-26 15:23:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('895', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '17525', '180.167.77.138', '2018-03-26 15:35:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('896', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '17207', '180.167.77.138', '2018-03-26 15:36:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('897', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '34539', '180.167.77.138', '2018-03-26 15:49:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('898', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '3346', '127.0.0.1', '2018-03-26 15:51:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('899', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '186', '127.0.0.1', '2018-03-26 15:52:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('900', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '226', '127.0.0.1', '2018-03-26 15:52:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('901', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '238', '127.0.0.1', '2018-03-26 15:52:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('902', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '135', '127.0.0.1', '2018-03-26 15:53:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('903', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '6192', '127.0.0.1', '2018-03-26 15:53:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('904', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '4529', '127.0.0.1', '2018-03-26 15:54:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('905', 'zhangwei', '系统管理', '用户管理-忘记密码', '6088', '127.0.0.1', '2018-03-26 15:56:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('906', 'zhangwei', '系统管理', '用户管理-忘记密码', '6721', '127.0.0.1', '2018-03-26 15:57:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('907', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '18828', '127.0.0.1', '2018-03-26 16:00:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('908', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '5949', '127.0.0.1', '2018-03-26 16:01:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('909', 'zhangwei', '系统管理', '用户管理-忘记密码', '5057', '127.0.0.1', '2018-03-26 16:19:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('910', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '61254', '180.167.77.138', '2018-03-26 16:20:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('911', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '17562', '180.167.77.138', '2018-03-26 16:20:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('912', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '741', '180.167.77.138', '2018-03-26 16:23:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('913', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '126', '180.167.77.138', '2018-03-26 16:26:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('914', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '34', '180.167.77.138', '2018-03-26 16:26:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('915', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '317', '180.167.77.138', '2018-03-26 16:26:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('916', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '72', '180.167.77.138', '2018-03-26 16:26:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('917', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1190', '180.167.77.138', '2018-03-27 10:25:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('918', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '196', '180.167.77.138', '2018-03-27 10:26:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('919', 'zhangwei', '系统管理', '用户管理-忘记密码', '511', '180.167.77.138', '2018-03-27 10:28:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('920', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '57', '180.167.77.138', '2018-03-27 10:28:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('921', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '357', '180.167.77.138', '2018-03-27 10:29:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('922', 'zhangwei', '系统管理', '用户管理-修改密码', '36', '180.167.77.138', '2018-03-27 10:29:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('923', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '227', '180.167.77.138', '2018-03-27 10:36:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('924', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '493', '180.167.77.138', '2018-03-27 10:36:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('925', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '58', '180.167.77.138', '2018-03-27 10:36:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('926', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '213', '180.167.77.138', '2018-03-27 10:37:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('927', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '23', '180.167.77.138', '2018-03-27 10:39:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('928', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '389', '180.167.77.138', '2018-03-27 10:39:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('929', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '620', '180.167.77.138', '2018-03-27 10:39:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('930', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '129', '180.167.77.138', '2018-03-27 10:40:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('931', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '23', '180.167.77.138', '2018-03-27 10:40:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('932', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '400', '180.167.77.138', '2018-03-27 10:40:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('933', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '241', '180.167.77.138', '2018-03-27 10:40:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('934', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '356', '180.167.77.138', '2018-03-27 10:42:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('935', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '113', '180.167.77.138', '2018-03-27 10:43:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('936', 'zhangwei', '系统管理', '用户管理-忘记密码', '567', '180.167.77.138', '2018-03-27 10:45:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('937', 'huxiaopeng', '系统管理', '用户管理-忘记密码', '432', '180.167.77.138', '2018-03-27 10:46:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('938', 'huxiaopeng', '系统管理', '用户管理-忘记密码验证', '212', '180.167.77.138', '2018-03-27 10:46:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('939', 'huxiaopeng', '系统管理', '用户管理-忘记密码', '412', '180.167.77.138', '2018-03-27 10:46:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('940', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '131', '180.167.77.138', '2018-03-27 10:46:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('941', 'huxiaopeng', '系统管理', '用户管理-忘记密码验证', '23', '180.167.77.138', '2018-03-27 10:46:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('942', 'huxiaopeng', '系统管理', '用户管理-忘记密码验证', '22', '180.167.77.138', '2018-03-27 10:47:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('943', 'huxiaopeng', '系统管理', '用户管理-忘记密码验证', '24', '180.167.77.138', '2018-03-27 10:47:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('944', 'huxiaopeng', '系统管理', '用户管理-忘记密码', '349', '180.167.77.138', '2018-03-27 10:48:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('945', 'huxiaopeng', '系统管理', '用户管理-忘记密码验证', '28', '180.167.77.138', '2018-03-27 10:48:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('946', 'huxiaopeng', '系统管理', '用户管理-忘记密码', '307', '180.167.77.138', '2018-03-27 10:48:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('947', 'huxiaopeng', '系统管理', '用户管理-忘记密码验证', '112', '180.167.77.138', '2018-03-27 10:48:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('948', 'zhenghaiyang', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-03-27 10:49:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('949', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '421', '180.167.77.138', '2018-03-27 10:50:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('950', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '25', '180.167.77.138', '2018-03-27 10:50:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('951', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '22', '180.167.77.138', '2018-03-27 10:50:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('952', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '129', '180.167.77.138', '2018-03-27 10:51:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('953', 'fanmaomao', '系统管理', '用户管理-忘记密码', '21', '180.167.77.138', '2018-03-27 10:51:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('954', 'zhangwei', '系统管理', '用户管理-忘记密码', '3457', '180.167.77.138', '2018-03-27 10:52:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('955', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '15781', '127.0.0.1', '2018-03-27 10:53:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('956', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '320731', '127.0.0.1', '2018-03-27 10:58:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('957', 'fanmaomao', '系统管理', '用户管理-忘记密码', '391', '180.167.77.138', '2018-03-27 11:06:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('958', 'fanmaomao', '系统管理', '用户管理-忘记密码验证', '20', '180.167.77.138', '2018-03-27 11:06:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('959', 'fanmaomao', '系统管理', '用户管理-忘记密码验证', '28', '180.167.77.138', '2018-03-27 11:06:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('960', 'fanmaomao', '系统管理', '用户管理-忘记密码', '21', '180.167.77.138', '2018-03-27 11:06:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('961', 'fanmaomao', '系统管理', '用户管理-忘记密码验证', '135', '180.167.77.138', '2018-03-27 11:07:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('962', 'huxiaopeng', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-03-27 11:07:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('963', 'huxiaopeng', '系统管理', '用户管理-修改密码', '9', '180.167.77.138', '2018-03-27 11:08:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('964', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '4896', '127.0.0.1', '2018-03-27 11:10:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('965', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '21', '180.167.77.138', '2018-03-27 11:10:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('966', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '6063', '127.0.0.1', '2018-03-27 11:10:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('967', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '48', '180.167.77.138', '2018-03-27 11:11:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('968', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '341', '180.167.77.138', '2018-03-27 11:11:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('969', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '391', '180.167.77.138', '2018-03-27 11:11:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('970', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '111', '180.167.77.138', '2018-03-27 11:11:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('971', 'zhangwei', '系统管理', '用户管理-忘记密码', '998', '127.0.0.1', '2018-03-27 11:12:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('972', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '46499', '127.0.0.1', '2018-03-27 11:13:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('973', 'zhangwei', '系统管理', '用户管理-忘记密码', '1530', '127.0.0.1', '2018-03-27 11:14:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('974', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '9990', '127.0.0.1', '2018-03-27 11:15:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('975', 'zhangwei', '系统管理', '用户管理-忘记密码', '153', '127.0.0.1', '2018-03-27 11:31:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('976', 'zhangwei', '系统管理', '用户管理-忘记密码', '1034', '127.0.0.1', '2018-03-27 11:31:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('977', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '729', '127.0.0.1', '2018-03-27 11:31:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('978', 'zhangwei', '系统管理', '用户管理-修改密码', '1843', '127.0.0.1', '2018-03-27 11:32:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('979', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1064', '180.167.77.138', '2018-03-27 12:06:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('980', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '387', '180.167.77.138', '2018-03-27 12:07:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('981', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '395', '180.167.77.138', '2018-03-27 12:08:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('982', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '742', '180.167.77.138', '2018-03-27 12:10:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('983', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '208', '180.167.77.138', '2018-03-27 12:11:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('984', 'zhangwei', '系统管理', '用户管理-修改密码', '23', '180.167.77.138', '2018-03-27 12:16:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('985', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '368', '180.167.77.138', '2018-03-27 12:17:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('986', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '150', '180.167.77.138', '2018-03-27 12:18:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('987', 'zhangwei', '系统管理', '用户管理-忘记密码', '394', '180.167.77.138', '2018-03-27 12:20:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('988', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '167', '180.167.77.138', '2018-03-27 12:20:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('989', 'zhangwei', '系统管理', '用户管理-忘记密码', '525', '180.167.77.138', '2018-03-27 12:21:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('990', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '125', '180.167.77.138', '2018-03-27 12:22:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('991', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '416', '180.167.77.138', '2018-03-27 13:32:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('992', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '22', '180.167.77.138', '2018-03-27 13:32:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('993', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '113', '180.167.77.138', '2018-03-27 13:32:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('994', 'zhenghaiyang', '系统管理', '用户管理-忘记密码', '360', '180.167.77.138', '2018-03-27 13:33:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('995', 'zhenghaiyang', '系统管理', '用户管理-忘记密码验证', '119', '180.167.77.138', '2018-03-27 13:33:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('996', 'zhenghaiyang', '系统管理', '用户管理-忘记密码验证', '59', '180.167.77.138', '2018-03-27 13:33:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('997', 'zhenghaiyang', '系统管理', '用户管理-忘记密码', '6590', '180.167.77.138', '2018-03-27 13:34:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('998', 'zhenghaiyang', '系统管理', '用户管理-忘记密码', '2070', '180.167.77.138', '2018-03-27 13:34:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('999', 'zhenghaiyang', '系统管理', '用户管理-忘记密码验证', '27', '180.167.77.138', '2018-03-27 13:34:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1000', 'zhenghaiyang', '系统管理', '用户管理-忘记密码验证', '119', '180.167.77.138', '2018-03-27 13:35:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1001', 'zhenghaiyang', '系统管理', '用户管理-修改密码', '12', '180.167.77.138', '2018-03-27 13:35:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1002', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '22', '180.167.77.138', '2018-03-27 13:36:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1003', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '23', '180.167.77.138', '2018-03-27 13:36:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1004', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '20', '180.167.77.138', '2018-03-27 13:37:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1005', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '429', '180.167.77.138', '2018-03-27 13:37:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1006', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '20', '180.167.77.138', '2018-03-27 13:37:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1007', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '170', '180.167.77.138', '2018-03-27 13:37:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1008', 'fanmaomao', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-03-27 13:38:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1009', 'fanmaomao', '系统管理', '用户管理-修改密码', '24', '180.167.77.138', '2018-03-27 13:40:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1010', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '367', '180.167.77.138', '2018-03-27 13:42:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1011', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '108', '180.167.77.138', '2018-03-27 13:42:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1012', 'zhangwei', '系统管理', '用户管理-修改密码', '51', '180.167.77.138', '2018-03-27 13:42:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1013', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '21', '180.167.77.138', '2018-03-27 13:47:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1014', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '368', '180.167.77.138', '2018-03-27 13:47:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1015', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '130', '180.167.77.138', '2018-03-27 13:48:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1016', 'zongli', '系统管理', '用户管理-忘记密码', '383', '180.167.77.138', '2018-03-27 14:05:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1017', 'zongli', '系统管理', '用户管理-忘记密码验证', '113', '180.167.77.138', '2018-03-27 14:05:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1018', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '371', '180.167.77.138', '2018-03-27 14:07:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1019', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '194', '180.167.77.138', '2018-03-27 14:08:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1020', 'zongli', '系统管理', '用户管理-忘记密码', '76', '180.167.77.138', '2018-03-27 14:08:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1021', 'zongli', '系统管理', '用户管理-忘记密码', '568', '180.167.77.138', '2018-03-27 14:08:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1022', 'zongli', '系统管理', '用户管理-忘记密码验证', '148', '180.167.77.138', '2018-03-27 14:09:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1023', 'zongli', '系统管理', '用户管理-忘记密码', '728', '180.167.77.138', '2018-03-27 14:11:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1024', 'zongli', '系统管理', '用户管理-忘记密码验证', '110', '180.167.77.138', '2018-03-27 14:11:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1025', 'zongli', '系统管理', '用户管理-修改密码', '8', '180.167.77.138', '2018-03-27 14:11:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1026', 'zongli', '部门评价', '考核评价-结果暂存', '66', '180.167.77.138', '2018-03-27 14:12:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1027', 'zongli', '部门评价', '考核评价-结果暂存', '50', '180.167.77.138', '2018-03-27 14:12:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1028', 'zongli', '部门评价', '考核评价-结果暂存', '45', '180.167.77.138', '2018-03-27 14:12:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1029', 'zongli', '部门评价', '考核评价-结果暂存', '54', '180.167.77.138', '2018-03-27 14:12:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1030', 'zongli', '部门评价', '考核评价-结果暂存', '120', '180.167.77.138', '2018-03-27 14:12:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1031', 'zongli', '部门评价', '考核评价-结果暂存', '45', '180.167.77.138', '2018-03-27 14:12:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1032', 'zongli', '部门评价', '考核评价-结果暂存', '44', '180.167.77.138', '2018-03-27 14:12:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1033', 'zongli', '部门评价', '考核评价-结果暂存', '51', '180.167.77.138', '2018-03-27 14:13:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1034', 'zongli', '部门评价', '考核评价-结果暂存', '45', '180.167.77.138', '2018-03-27 14:13:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1035', 'zongli', '部门评价', '考核评价-结果暂存', '42', '180.167.77.138', '2018-03-27 14:13:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1036', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '353', '180.167.77.138', '2018-03-27 14:14:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1037', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '115', '180.167.77.138', '2018-03-27 14:14:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1038', 'fanmaomao', '系统管理', '用户管理-修改密码', '9', '180.167.77.138', '2018-03-27 14:14:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1039', 'fanmaomao', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-03-27 14:15:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1040', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '419', '180.167.77.138', '2018-03-27 14:16:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1041', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '131', '180.167.77.138', '2018-03-27 14:17:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1042', 'zhenghaiyang', '系统管理', '用户管理-修改密码', '9', '180.167.77.138', '2018-03-27 14:17:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1043', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '411', '180.167.77.138', '2018-03-27 14:17:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1044', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '122', '180.167.77.138', '2018-03-27 14:17:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('1045', 'zhenghaiyang', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-03-27 14:18:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1046', 'fanmaomao', '部门评价', '考核评价-结果暂存', '43', '180.167.77.138', '2018-03-27 14:19:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1047', 'fanmaomao', '部门评价', '考核评价-结果暂存', '47', '180.167.77.138', '2018-03-27 14:19:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1048', 'fanmaomao', '部门评价', '考核评价-结果暂存', '46', '180.167.77.138', '2018-03-27 14:19:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1049', 'fanmaomao', '部门评价', '考核评价-结果暂存', '46', '180.167.77.138', '2018-03-27 14:19:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1050', 'fanmaomao', '部门评价', '考核评价-结果暂存', '42', '180.167.77.138', '2018-03-27 14:19:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1051', 'fanmaomao', '部门评价', '考核评价-结果暂存', '46', '180.167.77.138', '2018-03-27 14:19:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1052', 'fanmaomao', '部门评价', '考核评价-结果暂存', '44', '180.167.77.138', '2018-03-27 14:19:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1053', 'fanmaomao', '部门评价', '考核评价-结果暂存', '43', '180.167.77.138', '2018-03-27 14:19:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1054', 'fanmaomao', '部门评价', '考核评价-结果暂存', '42', '180.167.77.138', '2018-03-27 14:20:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('1055', 'fanmaomao', '部门评价', '考核评价-结果暂存', '49', '180.167.77.138', '2018-03-27 14:20:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1056', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '41', '180.167.77.138', '2018-03-27 14:21:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1057', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '63', '180.167.77.138', '2018-03-27 14:21:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('1058', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '58', '180.167.77.138', '2018-03-27 14:22:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1059', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '45', '180.167.77.138', '2018-03-27 14:22:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1060', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '61', '180.167.77.138', '2018-03-27 14:22:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1061', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '43', '180.167.77.138', '2018-03-27 14:22:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1062', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '43', '180.167.77.138', '2018-03-27 14:22:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1063', 'wanqiang', '系统管理', '用户管理-修改密码', '64', '180.167.77.138', '2018-03-27 17:43:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1064', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '438', '180.167.77.138', '2018-03-27 17:43:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('1065', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '276', '180.167.77.138', '2018-03-27 17:44:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1066', 'wanqiang', '系统管理', '用户管理-修改密码', '11', '180.167.77.138', '2018-03-27 17:44:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1067', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '415', '180.167.77.138', '2018-03-27 17:45:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1068', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '436', '180.167.77.138', '2018-03-27 17:46:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('1069', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '386', '180.167.77.138', '2018-03-27 17:46:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1070', 'liyu', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-03-27 17:46:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1071', 'zhangwei', '系统管理', '用户管理-忘记密码', '438', '180.167.77.138', '2018-03-27 17:50:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1072', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '8530', '127.0.0.1', '2018-03-27 17:55:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1073', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1443', '180.167.77.138', '2018-03-27 18:01:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1074', 'zhangwei', '系统管理', '用户管理-忘记密码', '394', '180.167.77.138', '2018-03-27 18:05:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1075', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1118', '101.90.127.198', '2018-03-27 18:38:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1076', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1023', '180.167.77.138', '2018-03-28 09:36:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1077', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '26', '180.167.77.138', '2018-03-28 09:41:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('1078', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '391', '180.167.77.138', '2018-03-28 09:42:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1079', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '19090', '127.0.0.1', '2018-03-28 16:24:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1080', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '978', '127.0.0.1', '2018-03-28 16:27:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1081', 'zhangwei', '系统管理', '用户管理-忘记密码', '1307', '127.0.0.1', '2018-03-28 16:27:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1082', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '901', '127.0.0.1', '2018-03-28 16:28:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1083', 'zhangwei', '系统管理', '用户管理-修改密码', '6242', '127.0.0.1', '2018-03-28 16:28:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1084', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1316', '127.0.0.1', '2018-03-28 17:40:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1085', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '792', '127.0.0.1', '2018-03-28 17:41:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1086', 'zhangwei', '系统管理', '用户管理-忘记密码', '943', '127.0.0.1', '2018-03-28 17:41:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1087', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '882', '127.0.0.1', '2018-03-28 17:42:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1088', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1362', '127.0.0.1', '2018-03-28 17:47:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1089', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '942', '127.0.0.1', '2018-03-28 17:47:50', '执行成功!');
INSERT INTO `ly_log` VALUES ('1090', 'zhangwei', '系统管理', '用户管理-忘记密码', '1068', '127.0.0.1', '2018-03-28 17:48:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1091', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '769', '127.0.0.1', '2018-03-28 17:49:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1092', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1252', '127.0.0.1', '2018-03-28 17:53:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1093', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1664', '127.0.0.1', '2018-03-28 17:56:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1094', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '720', '127.0.0.1', '2018-03-28 17:56:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1095', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1010', '127.0.0.1', '2018-03-28 17:57:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1096', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1192', '127.0.0.1', '2018-03-28 17:59:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('1097', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1029', '127.0.0.1', '2018-03-28 18:01:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1098', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '986', '127.0.0.1', '2018-03-28 18:05:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1099', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '11090', '127.0.0.1', '2018-03-28 18:09:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1100', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '18451', '127.0.0.1', '2018-03-28 18:10:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1101', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '7362', '127.0.0.1', '2018-03-29 08:44:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('1102', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '843', '127.0.0.1', '2018-03-29 08:45:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1103', 'zhangwei', '系统管理', '用户管理-忘记密码', '5653', '127.0.0.1', '2018-03-29 08:46:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1104', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '837', '127.0.0.1', '2018-03-29 08:47:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1105', 'zhangwei', '系统管理', '用户管理-忘记密码', '997', '127.0.0.1', '2018-03-29 08:47:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1106', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '916', '127.0.0.1', '2018-03-29 08:47:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1107', 'zhangwei', '系统管理', '用户管理-忘记密码', '1088', '127.0.0.1', '2018-03-29 08:48:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1108', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '798', '127.0.0.1', '2018-03-29 08:48:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1109', 'zhangwei', '系统管理', '用户管理-忘记密码', '883', '127.0.0.1', '2018-03-29 08:49:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1110', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '694', '127.0.0.1', '2018-03-29 08:49:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1111', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1469', '127.0.0.1', '2018-03-29 09:18:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1112', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '194', '127.0.0.1', '2018-03-29 09:19:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1113', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '716', '127.0.0.1', '2018-03-29 09:20:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1114', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '897', '127.0.0.1', '2018-03-29 09:20:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('1115', 'zhangwei', '系统管理', '用户管理-忘记密码', '823', '127.0.0.1', '2018-03-29 09:21:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1116', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '715', '127.0.0.1', '2018-03-29 09:21:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1117', 'zhangwei', '系统管理', '用户管理-忘记密码', '1134', '127.0.0.1', '2018-03-29 09:23:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1118', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '916', '127.0.0.1', '2018-03-29 09:23:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1119', 'zhangwei', '系统管理', '用户管理-忘记密码', '926', '127.0.0.1', '2018-03-29 09:31:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1120', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '855', '127.0.0.1', '2018-03-29 09:31:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1121', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1447', '127.0.0.1', '2018-03-29 10:21:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1122', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '791', '127.0.0.1', '2018-03-29 10:21:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1123', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '230', '127.0.0.1', '2018-03-29 11:01:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1124', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '134', '127.0.0.1', '2018-03-29 11:01:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1125', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '546', '127.0.0.1', '2018-03-29 11:02:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1126', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '799', '127.0.0.1', '2018-03-29 11:03:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('1127', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '575', '127.0.0.1', '2018-03-29 11:05:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1128', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '603', '127.0.0.1', '2018-03-29 11:05:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1129', 'zhangwei', '系统管理', '用户管理-修改密码', '74', '127.0.0.1', '2018-03-29 11:06:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1130', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1521', '127.0.0.1', '2018-03-29 11:10:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1131', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '757', '127.0.0.1', '2018-03-29 11:12:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1132', 'zhangwei', '系统管理', '用户管理-修改密码', '106', '127.0.0.1', '2018-03-29 11:12:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('1133', 'zhangwei', '系统管理', '用户管理-修改密码', '51', '127.0.0.1', '2018-03-29 11:12:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1134', 'zhangwei', '系统管理', '用户管理-修改密码', '48', '127.0.0.1', '2018-03-29 11:13:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1135', 'zhangwei', '系统管理', '用户管理-修改密码', '111', '127.0.0.1', '2018-03-29 11:13:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1136', 'zhangwei', '系统管理', '用户管理-忘记密码', '2883', '127.0.0.1', '2018-03-29 15:28:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1137', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '2086', '127.0.0.1', '2018-03-29 15:29:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1138', 'liusong', '系统管理', '用户管理-修改密码', '115', '127.0.0.1', '2018-03-29 15:29:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('1139', 'zhoulimi', '部门评价', '考核评价-结果暂存', '88', '180.167.77.138', '2018-04-02 14:37:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1140', 'zhoulimi', '部门评价', '考核评价-结果暂存', '34', '180.167.77.138', '2018-04-02 14:37:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1141', 'zhoulimi', '部门评价', '考核评价-结果暂存', '26', '180.167.77.138', '2018-04-02 14:37:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1142', 'zhoulimi', '部门评价', '考核评价-结果暂存', '34', '180.167.77.138', '2018-04-02 14:37:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1143', 'zhoulimi', '部门评价', '考核评价-结果暂存', '48', '180.167.77.138', '2018-04-02 14:37:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1144', 'zhoulimi', '部门评价', '考核评价-结果暂存', '32', '180.167.77.138', '2018-04-02 14:37:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1145', 'zhoulimi', '部门评价', '考核评价-结果暂存', '45', '180.167.77.138', '2018-04-02 14:37:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1146', 'zhoulimi', '部门评价', '考核评价-结果暂存', '30', '180.167.77.138', '2018-04-02 14:37:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1147', 'zhoulimi', '部门评价', '考核评价-结果暂存', '26', '180.167.77.138', '2018-04-02 14:38:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1148', 'zhoulimi', '部门评价', '考核评价-结果暂存', '40', '180.167.77.138', '2018-04-02 14:38:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1149', 'zhoulimi', '部门评价', '考核评价-结果暂存', '67', '180.167.77.138', '2018-04-02 14:38:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1150', 'zhoulimi', '部门评价', '考核评价-结果暂存', '25', '180.167.77.138', '2018-04-02 14:38:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1151', 'zhoulimi', '部门评价', '考核评价-结果暂存', '28', '180.167.77.138', '2018-04-02 14:38:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1152', 'pengwenjun', '系统管理', '用户管理-修改密码', '10', '180.167.77.138', '2018-04-02 14:44:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1153', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '322', '127.0.0.1', '2018-04-02 15:02:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('1154', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '173', '127.0.0.1', '2018-04-02 15:02:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1155', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '142', '127.0.0.1', '2018-04-02 15:02:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1156', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '147', '127.0.0.1', '2018-04-02 15:02:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1157', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '199', '127.0.0.1', '2018-04-02 15:03:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1158', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '146', '127.0.0.1', '2018-04-02 15:03:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1159', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '143', '127.0.0.1', '2018-04-02 15:03:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1160', 'yuzhengtong', '部门评价', '考核评价-结果暂存', '185', '127.0.0.1', '2018-04-02 15:03:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1161', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '460', '180.167.77.138', '2018-04-08 17:31:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1162', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '170', '180.167.77.138', '2018-04-08 17:31:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1163', 'zhaojiaqi', '系统管理', '用户管理-修改密码', '16', '180.167.77.138', '2018-04-08 17:31:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1164', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '410', '180.167.77.138', '2018-04-10 12:38:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1165', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '328', '180.167.77.138', '2018-04-10 12:39:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1166', 'fanmaomao', '系统管理', '用户管理-修改密码', '11', '180.167.77.138', '2018-04-10 12:39:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1167', 'zhangwei', '系统管理', '用户管理-新增用户', '88', '0:0:0:0:0:0:0:1', '2018-05-08 14:37:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1168', 'zhangwei', '系统管理', '用户管理-删除用户', '123', '0:0:0:0:0:0:0:1', '2018-05-08 14:37:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1169', 'zhangwei', '系统管理', '用户管理-修改用户', '120', '127.0.0.1', '2018-05-09 14:06:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1170', 'zhangwei', '系统管理', '用户管理-修改用户', '62', '127.0.0.1', '2018-05-09 14:06:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1171', 'zhangwei', '系统管理', '用户管理-修改用户', '58', '127.0.0.1', '2018-05-09 14:11:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('1172', 'zhangwei', '系统管理', '用户管理-修改用户', '68', '127.0.0.1', '2018-05-09 14:11:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1173', 'zhangwei', '系统管理', '用户管理-修改用户', '1', '127.0.0.1', '2018-05-09 14:46:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1174', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 14:46:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1175', 'zhangwei', '系统管理', '用户管理-修改用户', '4', '127.0.0.1', '2018-05-09 14:57:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1176', 'zhangwei', '系统管理', '用户管理-修改用户', '1', '127.0.0.1', '2018-05-09 14:57:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1177', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:05:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1178', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:06:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1179', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:07:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('1180', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:08:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1181', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:08:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1182', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:09:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1183', 'zhangwei', '系统管理', '用户管理-修改用户', '0', '127.0.0.1', '2018-05-09 15:11:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1184', 'zhangwei', '系统管理', '用户管理-修改用户', '1', '127.0.0.1', '2018-05-09 15:11:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('1185', 'zhangwei', '系统管理', '用户管理-修改用户', '56348', '127.0.0.1', '2018-05-09 15:13:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1186', 'zhangwei', '系统管理', '用户管理-修改用户', '5123', '127.0.0.1', '2018-05-09 15:14:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1187', 'zhangwei', '系统管理', '用户管理-修改用户', '4535', '127.0.0.1', '2018-05-09 15:29:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1188', 'zhangwei', '系统管理', '用户管理-修改用户', '28', '127.0.0.1', '2018-05-09 15:30:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1189', 'zhangwei', '系统管理', '用户管理-修改用户', '24', '127.0.0.1', '2018-05-09 15:30:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1190', 'zhangwei', '系统管理', '用户管理-修改用户', '34', '127.0.0.1', '2018-05-09 15:30:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1191', 'zhangwei', '系统管理', '用户管理-新增用户', '52', '127.0.0.1', '2018-05-10 11:11:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('1192', 'zhangwei', '系统管理', '用户管理-新增用户', '27', '127.0.0.1', '2018-05-10 11:17:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1193', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '71', '127.0.0.1', '2018-05-10 11:17:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1194', 'zhangwei', '系统管理', '组管理-新增组', '31', '127.0.0.1', '2018-05-14 15:52:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1195', 'zhangwei', '系统管理', '组管理-删除组', '40', '127.0.0.1', '2018-05-14 15:53:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1196', 'zhangwei', '系统管理', '组管理-新增组', '39', '127.0.0.1', '2018-05-14 15:53:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1197', 'zhangwei', '系统管理', '组管理-修改组', '30', '127.0.0.1', '2018-05-14 16:03:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1198', 'zhangwei', '系统管理', '组管理-修改组', '23', '127.0.0.1', '2018-05-14 16:03:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1199', 'zhangwei', '系统管理', '组管理-新增组', '31', '127.0.0.1', '2018-05-14 16:03:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1200', 'zhangwei', '系统管理', '组管理-删除组', '28', '127.0.0.1', '2018-05-14 16:03:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1201', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '218', '127.0.0.1', '2018-05-15 10:07:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1202', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '201', '127.0.0.1', '2018-05-15 10:11:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('1203', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '146', '127.0.0.1', '2018-05-15 10:12:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1204', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '141', '127.0.0.1', '2018-05-15 10:12:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1205', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '4477', '127.0.0.1', '2018-05-16 17:55:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1206', 'zhenghaiyang', '部门评价', '考核评价-结果暂存', '7052', '127.0.0.1', '2018-05-16 18:02:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1207', 'fanmaomao', '部门评价', '考核评价-结果暂存', '3992', '127.0.0.1', '2018-05-16 18:05:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1208', 'fanmaomao', '部门评价', '考核评价-结果暂存', '164', '127.0.0.1', '2018-05-16 18:06:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1209', 'fanmaomao', '部门评价', '考核评价-结果暂存', '144', '127.0.0.1', '2018-05-16 18:07:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1210', 'fanmaomao', '部门评价', '考核评价-结果暂存', '156', '127.0.0.1', '2018-05-16 18:08:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1211', 'fanmaomao', '部门评价', '考核评价-结果暂存', '200', '127.0.0.1', '2018-05-16 18:09:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1212', 'fanmaomao', '部门评价', '考核评价-结果暂存', '172', '127.0.0.1', '2018-05-16 18:10:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1213', 'fanmaomao', '部门评价', '考核评价-结果暂存', '218', '127.0.0.1', '2018-05-17 09:41:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1214', 'wangwei', '部门评价', '考核评价-结果暂存', '162', '127.0.0.1', '2018-05-17 09:46:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1215', 'wangwei', '部门评价', '考核评价-结果暂存', '187', '127.0.0.1', '2018-05-17 09:47:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1216', 'wangwei', '部门评价', '考核评价-结果暂存', '196', '127.0.0.1', '2018-05-17 09:55:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1217', 'wangwei', '部门评价', '考核评价-结果暂存', '176', '127.0.0.1', '2018-05-17 09:56:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1218', 'wangwei', '部门评价', '考核评价-结果暂存', '165', '127.0.0.1', '2018-05-17 10:15:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1219', 'zhangwei', '系统管理', '用户管理-修改密码', '24422', '127.0.0.1', '2018-05-17 13:47:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1220', 'zhangwei', '系统管理', '用户管理-修改密码', '4393', '127.0.0.1', '2018-05-17 13:51:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1221', 'zhangwei', '系统管理', '用户管理-修改密码', '79', '127.0.0.1', '2018-05-17 13:52:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1222', 'zhangwei', '系统管理', '用户管理-修改密码', '47', '127.0.0.1', '2018-05-17 13:58:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1223', 'zhenghaiyang', '系统管理', '用户管理-修改密码', '86', '127.0.0.1', '2018-05-17 14:03:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1224', 'zhangwei', '系统管理', '用户管理-修改密码', '61', '127.0.0.1', '2018-05-17 14:11:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1225', 'zhangwei', '系统管理', '用户管理-修改密码', '61', '127.0.0.1', '2018-05-17 14:13:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1226', 'zhangwei', '系统管理', '用户管理-修改密码', '55', '127.0.0.1', '2018-05-17 14:14:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1227', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '189', '127.0.0.1', '2018-05-17 18:15:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1228', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '251', '127.0.0.1', '2018-05-17 18:15:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1229', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1475', '127.0.0.1', '2018-05-17 18:16:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('1230', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '153', '127.0.0.1', '2018-05-17 18:23:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('1231', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '191', '127.0.0.1', '2018-05-17 18:23:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1232', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '184', '127.0.0.1', '2018-05-17 18:28:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1233', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '148', '127.0.0.1', '2018-05-17 18:29:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1234', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '194', '127.0.0.1', '2018-05-17 18:49:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1235', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '312', '127.0.0.1', '2018-05-17 18:50:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('1236', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '151', '127.0.0.1', '2018-05-17 18:55:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('1237', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '155', '127.0.0.1', '2018-05-17 18:55:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1238', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '163', '127.0.0.1', '2018-05-17 18:56:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1239', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1208', '127.0.0.1', '2018-05-17 18:57:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1240', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '879', '127.0.0.1', '2018-05-17 19:16:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1241', 'zhangwei', '系统管理', '用户管理-忘记密码', '903', '127.0.0.1', '2018-05-17 19:21:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1242', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '1177', '127.0.0.1', '2018-05-17 19:23:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1243', 'zhangwei', '系统管理', '用户管理-修改密码', '113', '127.0.0.1', '2018-05-17 19:24:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1244', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '978', '127.0.0.1', '2018-05-17 19:24:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1245', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '867', '127.0.0.1', '2018-05-17 19:26:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1246', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1771', '127.0.0.1', '2018-05-18 09:30:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1247', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '951', '127.0.0.1', '2018-05-18 09:30:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1248', 'zhangwei', '系统管理', '用户管理-忘记密码', '1452', '127.0.0.1', '2018-05-18 09:33:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1249', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '915', '127.0.0.1', '2018-05-18 09:33:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1250', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '143', '127.0.0.1', '2018-05-18 09:33:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1251', 'zhangwei', '系统管理', '用户管理-忘记密码', '234', '127.0.0.1', '2018-05-18 09:38:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1252', 'zhangwei', '系统管理', '用户管理-忘记密码', '1086', '127.0.0.1', '2018-05-18 09:39:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1253', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '1027', '127.0.0.1', '2018-05-18 09:39:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1254', 'zhangwei', '系统管理', '用户管理-修改密码', '92', '127.0.0.1', '2018-05-18 09:40:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1255', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1007', '127.0.0.1', '2018-05-18 09:45:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1256', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '840', '127.0.0.1', '2018-05-18 09:46:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1257', 'zhangwei', '系统管理', '用户管理-忘记密码', '1494', '127.0.0.1', '2018-05-18 09:48:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('1258', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '816', '127.0.0.1', '2018-05-18 09:48:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1259', 'zhangwei', '系统管理', '用户管理-忘记密码', '168', '127.0.0.1', '2018-05-18 09:49:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1260', 'zhangwei', '系统管理', '用户管理-忘记密码', '231', '127.0.0.1', '2018-05-18 09:50:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1261', 'zhangwei', '系统管理', '用户管理-忘记密码', '218', '127.0.0.1', '2018-05-18 09:51:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1262', 'zhangwei', '系统管理', '用户管理-忘记密码', '152', '127.0.0.1', '2018-05-18 09:51:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1263', 'zhangwei', '系统管理', '用户管理-忘记密码', '255', '127.0.0.1', '2018-05-18 09:51:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1264', 'zhangwei', '系统管理', '用户管理-忘记密码', '158', '127.0.0.1', '2018-05-18 09:51:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1265', 'zhangwei', '系统管理', '用户管理-忘记密码', '157', '127.0.0.1', '2018-05-18 09:51:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1266', 'zhangwei', '系统管理', '用户管理-忘记密码', '181', '127.0.0.1', '2018-05-18 09:51:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1267', 'zhangwei', '系统管理', '用户管理-忘记密码', '1144', '127.0.0.1', '2018-05-18 09:56:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1268', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '836', '127.0.0.1', '2018-05-18 09:57:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1269', 'zhangwei', '系统管理', '用户管理-忘记密码', '1074', '127.0.0.1', '2018-05-18 09:58:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1270', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '832', '127.0.0.1', '2018-05-18 09:59:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1271', 'zhangwei', '系统管理', '用户管理-忘记密码', '1166', '127.0.0.1', '2018-05-18 10:00:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1272', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '769', '127.0.0.1', '2018-05-18 10:01:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1273', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '814', '127.0.0.1', '2018-05-18 10:03:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1274', 'zhangwei', '系统管理', '用户管理-修改密码', '71', '127.0.0.1', '2018-05-18 10:03:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1275', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '908', '127.0.0.1', '2018-05-18 10:04:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1276', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '809', '127.0.0.1', '2018-05-18 10:06:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('1277', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '1049', '127.0.0.1', '2018-05-18 10:10:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1278', 'zhangwei', '系统管理', '用户管理-修改密码', '75', '127.0.0.1', '2018-05-18 10:12:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1279', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '914', '127.0.0.1', '2018-05-18 10:12:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1280', 'zhangwei', '系统管理', '用户管理-修改密码', '57', '127.0.0.1', '2018-05-18 10:12:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1281', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '860', '127.0.0.1', '2018-05-18 10:14:50', '执行成功!');
INSERT INTO `ly_log` VALUES ('1282', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '1486', '127.0.0.1', '2018-05-18 10:16:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('1283', 'zhangwei', '系统管理', '用户管理-修改密码', '66', '127.0.0.1', '2018-05-18 10:17:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1284', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '187', '127.0.0.1', '2018-05-18 10:18:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1285', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '841', '127.0.0.1', '2018-05-18 10:18:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1286', 'zhangwei', '系统管理', '用户管理-修改密码', '56', '127.0.0.1', '2018-05-18 10:19:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1287', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1454', '127.0.0.1', '2018-05-18 10:19:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1288', 'zhangwei', '系统管理', '用户管理-修改密码', '123', '127.0.0.1', '2018-05-18 10:20:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1289', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1685', '127.0.0.1', '2018-05-18 10:21:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('1290', 'zhangwei', '系统管理', '用户管理-修改密码', '86', '127.0.0.1', '2018-05-18 10:21:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1291', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1596', '127.0.0.1', '2018-05-18 10:22:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1292', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '148', '127.0.0.1', '2018-05-18 10:22:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1293', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '1266', '127.0.0.1', '2018-05-18 10:23:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1294', 'zhangwei', '系统管理', '用户管理-修改密码', '56', '127.0.0.1', '2018-05-18 10:23:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1295', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '2300', '127.0.0.1', '2018-05-18 10:29:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1296', 'zhangwei', '系统管理', '用户管理-修改密码', '70', '127.0.0.1', '2018-05-18 10:29:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1297', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1510', '127.0.0.1', '2018-05-18 10:29:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1298', 'zhangwei', '系统管理', '用户管理-修改密码', '97', '127.0.0.1', '2018-05-18 10:29:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1299', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1772', '127.0.0.1', '2018-05-18 10:30:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1300', 'zhangwei', '系统管理', '用户管理-修改密码', '69', '127.0.0.1', '2018-05-18 10:30:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('1301', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1546', '127.0.0.1', '2018-05-18 10:31:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1302', 'zhangwei', '系统管理', '用户管理-修改密码', '93', '127.0.0.1', '2018-05-18 10:31:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1303', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '469', '127.0.0.1', '2018-05-18 10:35:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1304', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '563', '127.0.0.1', '2018-05-18 10:35:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1305', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '3332', '127.0.0.1', '2018-05-18 10:35:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1306', 'zhangwei', '系统管理', '用户管理-修改密码', '183', '127.0.0.1', '2018-05-18 10:35:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1307', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '196', '127.0.0.1', '2018-05-18 10:36:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1308', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '955', '127.0.0.1', '2018-05-18 10:36:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1309', 'zhangwei', '系统管理', '用户管理-修改密码', '60', '127.0.0.1', '2018-05-18 10:36:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1310', 'zhangwei', '系统管理', '用户管理-修改密码', '50', '127.0.0.1', '2018-05-18 10:37:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1311', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1015', '127.0.0.1', '2018-05-18 10:38:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1312', 'zhangwei', '系统管理', '用户管理-修改密码', '65', '127.0.0.1', '2018-05-18 10:39:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1313', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '836', '127.0.0.1', '2018-05-18 10:41:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1314', 'zhangwei', '系统管理', '用户管理-修改密码', '78', '127.0.0.1', '2018-05-18 10:41:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1315', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '852', '127.0.0.1', '2018-05-18 10:43:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1316', 'zhangwei', '系统管理', '用户管理-修改密码', '67', '127.0.0.1', '2018-05-18 10:43:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1317', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1275', '127.0.0.1', '2018-05-18 10:47:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1318', 'zhangwei', '系统管理', '用户管理-修改密码', '85', '127.0.0.1', '2018-05-18 10:48:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1319', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '846', '127.0.0.1', '2018-05-18 10:52:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1320', 'zhangwei', '系统管理', '用户管理-修改密码', '76', '127.0.0.1', '2018-05-18 10:52:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1321', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '935', '127.0.0.1', '2018-05-18 10:54:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1322', 'zhangwei', '系统管理', '用户管理-修改密码', '60', '127.0.0.1', '2018-05-18 10:54:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1323', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '140', '127.0.0.1', '2018-05-18 14:41:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1324', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '202', '127.0.0.1', '2018-05-18 14:42:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1325', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1300', '127.0.0.1', '2018-05-18 14:42:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1326', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '769', '127.0.0.1', '2018-05-18 14:43:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1327', 'yangli', '系统管理', '用户管理-修改密码', '61', '127.0.0.1', '2018-05-18 14:43:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1328', 'zhangwei', '系统管理', '用户管理-修改密码', '50', '127.0.0.1', '2018-05-18 15:31:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1329', 'zhangwei', '系统管理', '用户管理-修改密码', '63', '127.0.0.1', '2018-05-18 15:32:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1330', 'zhangwei', '系统管理', '用户管理-忘记密码', '1192', '101.90.125.78', '2018-05-18 16:03:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1331', 'zhangwei', '系统管理', '用户管理-忘记密码验证', '181', '101.90.125.78', '2018-05-18 16:04:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1332', 'zhangwei', '系统管理', '用户管理-修改密码', '34', '101.90.125.78', '2018-05-18 16:04:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1333', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '22', '180.167.77.138', '2018-05-18 16:24:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1334', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '432', '180.167.77.138', '2018-05-18 16:25:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('1335', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '108', '180.167.77.138', '2018-05-18 16:26:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1336', 'zongli', '系统管理', '用户管理-修改密码', '11', '180.167.77.138', '2018-05-18 16:26:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('1337', 'zongli', '部门评价', '考核评价-结果暂存', '51', '180.167.77.138', '2018-05-18 16:28:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1338', 'zongli', '部门评价', '考核评价-结果暂存', '40', '180.167.77.138', '2018-05-18 16:29:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1339', 'zongli', '部门评价', '考核评价-结果暂存', '52', '180.167.77.138', '2018-05-18 16:29:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1340', 'zongli', '系统管理', '用户管理-修改密码', '211', '10.1.129.41', '2018-05-18 17:10:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1341', 'zongli', '部门评价', '考核评价-结果暂存', '195', '10.1.129.41', '2018-05-21 14:33:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('1342', 'zongli', '部门评价', '考核评价-结果暂存', '153', '10.1.129.41', '2018-05-21 14:34:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1343', 'zongli', '部门评价', '考核评价-结果暂存', '147', '10.1.129.41', '2018-05-21 14:41:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1344', 'zongli', '部门评价', '考核评价-结果暂存', '171', '10.1.129.41', '2018-05-21 14:44:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('1345', 'zongli', '系统管理', '用户管理-修改密码', '68', '10.1.129.41', '2018-05-21 14:44:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1346', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '921', '10.1.129.41', '2018-05-21 14:47:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1347', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '796', '10.1.129.41', '2018-05-21 14:47:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1348', 'wanglinfei', '系统管理', '用户管理-修改密码', '51', '10.1.129.41', '2018-05-21 14:47:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1349', 'wanglinfei', '部门评价', '考核评价-结果暂存', '145', '10.1.129.41', '2018-05-21 14:48:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1350', 'wanglinfei', '部门评价', '考核评价-结果暂存', '147', '10.1.129.41', '2018-05-21 14:48:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1351', 'wanglinfei', '部门评价', '考核评价-结果暂存', '180', '10.1.129.41', '2018-05-21 14:48:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1352', 'wanglinfei', '部门评价', '考核评价-结果暂存', '140', '10.1.129.41', '2018-05-21 14:48:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1353', 'wanglinfei', '部门评价', '考核评价-结果暂存', '167', '10.1.129.41', '2018-05-21 14:49:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1354', 'wanglinfei', '部门评价', '考核评价-结果暂存', '215', '10.1.129.41', '2018-05-21 14:49:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1355', 'wanglinfei', '部门评价', '考核评价-结果暂存', '147', '10.1.129.41', '2018-05-21 14:49:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1356', 'wanglinfei', '部门评价', '考核评价-结果暂存', '325', '10.1.129.41', '2018-05-21 14:49:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1357', 'wanglinfei', '部门评价', '考核评价-结果暂存', '162', '10.1.129.41', '2018-05-21 14:49:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1358', 'wanglinfei', '部门评价', '考核评价-结果暂存', '155', '10.1.129.41', '2018-05-21 14:50:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1359', 'zongli', '系统管理', '用户管理-修改密码', '57', '10.1.129.41', '2018-05-21 14:51:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1360', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1096', '10.1.129.41', '2018-05-21 14:56:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1361', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '900', '10.1.129.41', '2018-05-21 14:56:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1362', 'zongli', '系统管理', '用户管理-修改密码', '57', '10.1.129.41', '2018-05-21 14:57:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1363', 'zongli', '部门评价', '考核评价-结果暂存', '161', '10.1.129.41', '2018-05-21 15:37:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1364', 'zongli', '部门评价', '考核评价-结果暂存', '88', '61.151.180.39', '2018-05-21 16:41:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1365', 'zhangwei', '系统管理', '资源管理-新增资源', '52', '127.0.0.1', '2018-05-22 11:15:42', '执行成功!');
INSERT INTO `ly_log` VALUES ('1366', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '57', '127.0.0.1', '2018-05-22 13:53:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1367', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '74', '127.0.0.1', '2018-05-22 13:53:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1368', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '49', '127.0.0.1', '2018-05-22 13:55:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1369', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '48', '127.0.0.1', '2018-05-22 13:56:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1370', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '62', '127.0.0.1', '2018-05-22 13:56:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1371', 'zhangwei', '系统管理', '用户管理/组管理-修改权限', '52', '127.0.0.1', '2018-05-22 13:57:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1372', 'zhangwei', '人员管理', '人员离职', '50807', '127.0.0.1', '2018-05-22 14:29:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1373', 'zhangwei', '人员管理', '人员离职', '10333', '127.0.0.1', '2018-05-22 14:29:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1374', 'zhangwei', '人员管理', '人员离职', '6821', '127.0.0.1', '2018-05-22 14:30:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1375', 'zhangwei', '人员管理', '人员离职', '82812', '127.0.0.1', '2018-05-22 14:33:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1376', 'zhangwei', '人员管理', '人员离职', '19824', '127.0.0.1', '2018-05-22 14:34:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1377', 'zhangwei', '人员管理', '人员离职', '4214', '127.0.0.1', '2018-05-22 14:36:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1379', 'dumingjie', '部门评价', '考核评价-结果暂存', '235', '127.0.0.1', '2018-05-22 15:12:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1389', 'zhangwei', '人员管理', '人员离职自动评分', '27085', '127.0.0.1', '2018-05-22 18:15:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1390', 'zhangwei', '人员管理', '人员离职自动评分', '13479', '127.0.0.1', '2018-05-23 09:29:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1392', 'zhangwei', '人员管理', '人员离职自动评分', '4842', '127.0.0.1', '2018-05-23 10:11:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('1393', 'zhangwei', '人员管理', '人员离职自动评分', '309365', '127.0.0.1', '2018-05-23 10:28:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1394', 'zhangwei', '人员管理', '人员离职自动评分', '11079', '127.0.0.1', '2018-05-23 10:40:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1395', 'zhangwei', '人员管理', '人员离职自动评分', '129891', '127.0.0.1', '2018-05-23 10:43:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1396', 'zhangwei', '人员管理', '人员离职自动评分', '86682', '127.0.0.1', '2018-05-23 10:44:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('1397', 'zhangwei', '人员管理', '人员离职自动评分', '3604', '127.0.0.1', '2018-05-23 11:07:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('1398', 'zhangwei', '人员管理', '人员离职自动评分', '62493', '127.0.0.1', '2018-05-23 11:11:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1399', 'zhangwei', '人员管理', '人员离职自动评分', '4287', '127.0.0.1', '2018-05-23 11:12:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1400', 'zhangwei', '人员管理', '人员离职自动评分', '32518', '127.0.0.1', '2018-05-23 11:13:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1401', 'zhangwei', '人员管理', '人员离职自动评分', '369734', '127.0.0.1', '2018-05-23 11:27:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1402', 'zhangwei', '系统管理', '用户管理-新增用户', '63', '127.0.0.1', '2018-05-23 14:13:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1403', 'getanghua', '部门评价', '考核评价-结果暂存', '189', '127.0.0.1', '2018-05-23 14:44:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1404', 'zhangwei', '人员管理', '人员离职自动评分', '14825', '127.0.0.1', '2018-05-23 14:58:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('1405', 'zhangwei', '人员管理', '人员离职自动评分', '306173', '127.0.0.1', '2018-05-23 15:09:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('1406', 'zhangwei', '人员管理', '人员离职自动评分', '306', '127.0.0.1', '2018-05-23 15:14:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1407', 'zhangwei', '人员管理', '人员离职自动评分', '47', '127.0.0.1', '2018-05-23 15:14:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1408', 'zhangwei', '人员管理', '人员离职自动评分', '28', '127.0.0.1', '2018-05-23 15:14:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1409', 'zhangwei', '人员管理', '人员离职自动评分', '203', '127.0.0.1', '2018-05-23 15:14:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1410', 'zhangwei', '人员管理', '人员离职自动评分', '30896', '127.0.0.1', '2018-05-23 15:24:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1411', 'zhangwei', '人员管理', '人员离职自动评分', '4219', '127.0.0.1', '2018-05-23 15:25:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1412', 'zhangwei', '人员管理', '人员离职自动评分', '34', '127.0.0.1', '2018-05-23 15:29:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1413', 'zhangwei', '人员管理', '人员离职自动评分', '24', '127.0.0.1', '2018-05-23 15:30:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1414', 'zhangwei', '人员管理', '人员离职自动评分', '233', '127.0.0.1', '2018-05-23 15:30:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1415', 'zhangwei', '人员管理', '人员离职自动评分', '232', '127.0.0.1', '2018-05-23 15:30:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1416', 'zhangwei', '人员管理', '人员离职自动评分', '215', '127.0.0.1', '2018-05-23 15:30:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1417', 'zhangwei', '人员管理', '人员离职自动评分', '179', '127.0.0.1', '2018-05-23 15:30:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1418', 'zhangwei', '人员管理', '人员离职自动评分', '214', '127.0.0.1', '2018-05-23 15:30:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('1419', 'zhangwei', '人员管理', '人员离职自动评分', '183', '127.0.0.1', '2018-05-23 15:30:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1420', 'zhangwei', '人员管理', '人员离职自动评分', '194', '127.0.0.1', '2018-05-23 15:31:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1421', 'zhangwei', '人员管理', '人员离职自动评分', '196', '127.0.0.1', '2018-05-23 15:31:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1422', 'zhangwei', '人员管理', '人员离职自动评分', '222', '127.0.0.1', '2018-05-23 15:31:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1423', 'zhangwei', '人员管理', '人员离职自动评分', '27', '127.0.0.1', '2018-05-23 15:31:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('1424', 'zhangwei', '人员管理', '人员离职自动评分', '181', '127.0.0.1', '2018-05-23 15:31:50', '执行成功!');
INSERT INTO `ly_log` VALUES ('1425', 'zhangwei', '人员管理', '人员离职自动评分', '185', '127.0.0.1', '2018-05-23 15:31:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1426', 'zhangwei', '人员管理', '人员离职自动评分', '44', '127.0.0.1', '2018-05-23 15:32:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1427', 'zhangwei', '人员管理', '人员离职自动评分', '247', '127.0.0.1', '2018-05-23 15:32:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1428', 'zhangwei', '人员管理', '人员离职自动评分', '22', '127.0.0.1', '2018-05-23 15:32:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1429', 'zhangwei', '人员管理', '人员离职自动评分', '210', '127.0.0.1', '2018-05-23 15:32:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1430', 'zhangwei', '人员管理', '人员离职自动评分', '219', '127.0.0.1', '2018-05-23 15:32:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1431', 'zhangwei', '人员管理', '人员离职自动评分', '191', '127.0.0.1', '2018-05-23 15:32:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1432', 'zhangwei', '人员管理', '人员离职自动评分', '178', '127.0.0.1', '2018-05-23 15:32:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1433', 'zhangwei', '人员管理', '人员离职自动评分', '42', '127.0.0.1', '2018-05-23 15:32:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1434', 'zhangwei', '人员管理', '人员离职自动评分', '372', '127.0.0.1', '2018-05-23 15:32:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('1435', 'zhangwei', '人员管理', '人员离职自动评分', '213', '127.0.0.1', '2018-05-23 15:32:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1436', 'zhangwei', '人员管理', '人员离职自动评分', '267', '127.0.0.1', '2018-05-23 15:33:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1437', 'zhangwei', '人员管理', '人员离职自动评分', '216', '127.0.0.1', '2018-05-23 15:33:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1438', 'zhangwei', '人员管理', '人员离职自动评分', '183', '127.0.0.1', '2018-05-23 15:33:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1439', 'zhangwei', '人员管理', '人员离职自动评分', '459', '127.0.0.1', '2018-05-23 15:33:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('1440', 'zhangwei', '人员管理', '人员离职自动评分', '636', '127.0.0.1', '2018-05-23 15:34:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1441', 'zhangwei', '人员管理', '人员离职自动评分', '39', '127.0.0.1', '2018-05-23 15:35:07', '执行成功!');
INSERT INTO `ly_log` VALUES ('1442', 'zhangwei', '人员管理', '人员离职自动评分', '24', '127.0.0.1', '2018-05-23 15:35:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1443', 'zhangwei', '人员管理', '人员离职自动评分', '28', '127.0.0.1', '2018-05-23 15:35:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1444', 'zhangwei', '人员管理', '人员离职自动评分', '566', '127.0.0.1', '2018-05-23 15:36:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1445', 'zhangwei', '人员管理', '人员离职自动评分', '25', '127.0.0.1', '2018-05-23 15:40:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1446', 'zhangwei', '人员管理', '人员离职自动评分', '23', '127.0.0.1', '2018-05-23 15:40:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1447', 'zhangwei', '人员管理', '人员离职自动评分', '210', '127.0.0.1', '2018-05-23 15:42:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1448', 'zhangwei', '人员管理', '人员离职自动评分', '215', '127.0.0.1', '2018-05-23 15:49:41', '执行成功!');
INSERT INTO `ly_log` VALUES ('1449', 'zhangwei', '人员管理', '人员离职自动评分', '200', '127.0.0.1', '2018-05-23 15:51:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1450', 'zhangwei', '人员管理', '人员离职自动评分', '315', '127.0.0.1', '2018-05-23 15:52:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('1451', 'zhangwei', '人员管理', '人员离职自动评分', '233', '127.0.0.1', '2018-05-23 15:52:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1452', 'zhangwei', '人员管理', '人员离职自动评分', '184', '127.0.0.1', '2018-05-23 15:52:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1453', 'zhangwei', '人员管理', '人员离职自动评分', '203', '127.0.0.1', '2018-05-23 15:53:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1454', 'zhangwei', '人员管理', '人员离职自动评分', '241', '127.0.0.1', '2018-05-23 15:53:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('1455', 'zhangwei', '人员管理', '人员离职自动评分', '245', '127.0.0.1', '2018-05-23 15:53:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1456', 'zhangwei', '人员管理', '人员离职自动评分', '180', '127.0.0.1', '2018-05-23 15:53:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1457', 'zhangwei', '人员管理', '人员离职自动评分', '186', '127.0.0.1', '2018-05-23 15:53:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1458', 'zhangwei', '人员管理', '人员离职自动评分', '276', '127.0.0.1', '2018-05-23 15:53:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1459', 'zhangwei', '人员管理', '人员离职自动评分', '220', '127.0.0.1', '2018-05-23 15:54:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1460', 'zhangwei', '人员管理', '人员离职自动评分', '280', '127.0.0.1', '2018-05-23 15:54:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('1461', 'zhangwei', '人员管理', '人员离职自动评分', '167', '127.0.0.1', '2018-05-23 15:54:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1462', 'zhangwei', '人员管理', '人员离职自动评分', '332', '127.0.0.1', '2018-05-23 15:54:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1463', 'zhangwei', '人员管理', '人员离职自动评分', '152', '127.0.0.1', '2018-05-23 15:54:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1464', 'zhangwei', '人员管理', '人员离职自动评分', '198', '127.0.0.1', '2018-05-23 15:54:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1465', 'zhangwei', '人员管理', '人员离职自动评分', '176', '127.0.0.1', '2018-05-23 15:54:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1466', 'zhangwei', '人员管理', '人员离职自动评分', '26', '127.0.0.1', '2018-05-23 15:54:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1467', 'zhangwei', '人员管理', '人员离职自动评分', '30', '127.0.0.1', '2018-05-23 15:55:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1468', 'zhangwei', '人员管理', '人员离职自动评分', '188', '127.0.0.1', '2018-05-23 15:55:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1469', 'zhangwei', '人员管理', '人员离职自动评分', '226', '127.0.0.1', '2018-05-23 15:55:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1470', 'zhangwei', '人员管理', '人员离职自动评分', '226', '127.0.0.1', '2018-05-23 15:56:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1471', 'zhangwei', '人员管理', '人员离职自动评分', '205', '127.0.0.1', '2018-05-23 15:57:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1472', 'zhangwei', '人员管理', '人员离职自动评分', '330458', '127.0.0.1', '2018-05-23 16:04:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1473', 'zhangwei', '人员管理', '人员离职自动评分', '196641', '127.0.0.1', '2018-05-23 16:29:20', '执行成功!');
INSERT INTO `ly_log` VALUES ('1478', 'zhangwei', '人员管理', '人员离职自动评分', '50924', '127.0.0.1', '2018-05-23 16:50:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1479', 'zhangwei', '人员管理', '人员离职自动评分', '805', '127.0.0.1', '2018-05-23 16:54:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1480', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '240', '127.0.0.1', '2018-05-23 16:55:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1481', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '410', '127.0.0.1', '2018-05-23 16:55:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1482', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '239', '127.0.0.1', '2018-05-23 16:55:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1483', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '225', '127.0.0.1', '2018-05-23 16:55:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('1484', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '241', '127.0.0.1', '2018-05-23 16:55:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1485', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '294', '127.0.0.1', '2018-05-23 16:55:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1486', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '249', '127.0.0.1', '2018-05-23 16:56:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1487', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '236', '127.0.0.1', '2018-05-23 16:56:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1488', 'zhangwei', '人员管理', '人员离职自动评分', '33191', '127.0.0.1', '2018-05-23 16:58:58', '执行成功!');
INSERT INTO `ly_log` VALUES ('1489', 'huangbian', '部门评价', '考核评价-结果暂存', '189', '127.0.0.1', '2018-05-23 17:00:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1490', 'huangbian', '部门评价', '考核评价-结果暂存', '148', '127.0.0.1', '2018-05-23 17:00:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1491', 'huangbian', '部门评价', '考核评价-结果暂存', '169', '127.0.0.1', '2018-05-23 17:00:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1492', 'huangbian', '部门评价', '考核评价-结果暂存', '189', '127.0.0.1', '2018-05-23 17:00:25', '执行成功!');
INSERT INTO `ly_log` VALUES ('1493', 'huangbian', '部门评价', '考核评价-结果暂存', '215', '127.0.0.1', '2018-05-23 17:00:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1494', 'huangbian', '部门评价', '考核评价-结果暂存', '131', '127.0.0.1', '2018-05-23 17:00:33', '执行成功!');
INSERT INTO `ly_log` VALUES ('1495', 'huangbian', '部门评价', '考核评价-结果暂存', '200', '127.0.0.1', '2018-05-23 17:00:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1496', 'huangbian', '部门评价', '考核评价-结果暂存', '155', '127.0.0.1', '2018-05-23 17:00:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1497', 'xiebowen', '系统管理', '用户管理-忘记密码', '1515', '127.0.0.1', '2018-05-23 17:02:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1498', 'xiebowen', '系统管理', '用户管理-忘记密码验证', '865', '127.0.0.1', '2018-05-23 17:03:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1499', 'xiebowen', '系统管理', '用户管理-修改密码', '8067', '127.0.0.1', '2018-05-23 17:03:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1500', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '1231', '127.0.0.1', '2018-05-23 17:07:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('1501', 'xiebowen', '系统管理', '用户管理-忘记密码验证', '901', '127.0.0.1', '2018-05-23 17:08:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1502', 'xiebowen', '系统管理', '用户管理-修改密码', '65', '127.0.0.1', '2018-05-23 17:08:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1503', 'xiebowen', '部门评价', '考核评价-结果暂存', '136', '127.0.0.1', '2018-05-23 17:09:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1504', 'xiebowen', '部门评价', '考核评价-结果暂存', '156', '127.0.0.1', '2018-05-23 17:09:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1505', 'xiebowen', '部门评价', '考核评价-结果暂存', '225', '127.0.0.1', '2018-05-23 17:09:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('1506', 'xiebowen', '部门评价', '考核评价-结果暂存', '207', '127.0.0.1', '2018-05-23 17:09:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1507', 'xiebowen', '部门评价', '考核评价-结果暂存', '163', '127.0.0.1', '2018-05-23 17:09:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('1508', 'zhangwei', '人员管理', '人员离职自动评分', '3772', '127.0.0.1', '2018-05-23 17:10:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1509', 'zhangwei', '人员管理', '人员离职自动评分', '792', '127.0.0.1', '2018-05-23 17:10:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1510', 'zhangwei', '人员管理', '人员离职自动评分', '357', '127.0.0.1', '2018-05-23 17:19:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1511', 'zhangwei', '人员管理', '人员离职自动评分', '28825', '127.0.0.1', '2018-05-23 17:27:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1512', 'zhangwei', '人员管理', '人员离职自动评分', '8247', '127.0.0.1', '2018-05-23 17:27:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1513', 'zhangwei', '人员管理', '人员离职自动评分', '16307', '127.0.0.1', '2018-05-23 17:28:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1516', 'zhangwei', '人员管理', '人员离职自动评分', '13', '180.167.77.138', '2018-05-23 17:39:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('1518', 'zhangwei', '人员管理', '人员离职自动评分', '10', '180.167.77.138', '2018-05-23 17:39:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1519', 'zhangwei', '人员管理', '人员离职自动评分', '45', '180.167.77.138', '2018-05-23 17:39:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1520', 'zhangwei', '人员管理', '人员离职自动评分', '9', '180.167.77.138', '2018-05-23 17:39:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1521', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码', '1131', '180.167.77.138', '2018-05-23 17:48:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1522', '无法获取登录用户信息！', '系统管理', '用户管理-忘记密码验证', '143', '180.167.77.138', '2018-05-23 17:48:51', '执行成功!');
INSERT INTO `ly_log` VALUES ('1523', 'zhaojiaqi', '系统管理', '用户管理-修改密码', '19', '180.167.77.138', '2018-05-23 17:49:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1524', 'zhangwei', '人员管理', '人员离职自动评分', '15', '180.167.77.138', '2018-05-23 17:52:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1525', 'zhangwei', '人员管理', '人员离职自动评分', '8', '180.167.77.138', '2018-05-23 17:53:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('1526', 'zhangwei', '人员管理', '人员离职自动评分', '8', '180.167.77.138', '2018-05-23 17:53:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1527', 'zhangwei', '人员管理', '人员离职自动评分', '13', '180.167.77.138', '2018-05-23 17:53:32', '执行成功!');
INSERT INTO `ly_log` VALUES ('1528', 'zhangwei', '人员管理', '人员离职自动评分', '13', '180.167.77.138', '2018-05-23 17:55:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1529', 'zhangwei', '人员管理', '人员离职自动评分', '27940', '127.0.0.1', '2018-05-23 17:56:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1530', 'zhangwei', '人员管理', '人员离职自动评分', '1735', '127.0.0.1', '2018-05-23 17:56:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('1531', 'zhangwei', '人员管理', '人员离职自动评分', '1876', '127.0.0.1', '2018-05-23 17:56:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1532', 'zhangwei', '人员管理', '人员离职自动评分', '39703', '127.0.0.1', '2018-05-23 17:57:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1533', 'zhangwei', '人员管理', '人员离职自动评分', '354', '180.167.77.138', '2018-05-23 18:12:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('1534', 'wanqiang', '部门评价', '考核评价-结果暂存', '58', '180.167.77.138', '2018-05-24 09:57:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1535', 'wanqiang', '部门评价', '考核评价-结果暂存', '219', '10.1.129.41', '2018-05-24 10:30:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1536', 'wanqiang', '部门评价', '考核评价-结果暂存', '160', '10.1.129.41', '2018-05-24 10:31:50', '执行成功!');
INSERT INTO `ly_log` VALUES ('1537', 'wanqiang', '部门评价', '考核评价-结果暂存', '142', '10.1.129.41', '2018-05-24 10:32:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('1538', 'lisha', '部门评价', '考核评价-结果暂存', '152', '127.0.0.1', '2018-05-24 10:35:04', '执行成功!');
INSERT INTO `ly_log` VALUES ('1539', 'lisha', '部门评价', '考核评价-结果暂存', '150', '10.1.129.41', '2018-05-24 10:35:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1540', 'lisha', '部门评价', '考核评价-结果暂存', '163', '127.0.0.1', '2018-05-24 10:37:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1541', 'lisha', '部门评价', '考核评价-结果暂存', '127', '10.1.129.41', '2018-05-24 10:39:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('1542', 'lisha', '部门评价', '考核评价-结果暂存', '217', '10.1.129.41', '2018-05-24 10:47:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1543', 'zongli', '部门评价', '考核评价-结果暂存', '141', '10.1.129.41', '2018-05-24 10:48:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1544', 'zongli', '部门评价', '考核评价-结果暂存', '152', '10.1.129.41', '2018-05-24 10:50:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1545', 'zongli', '部门评价', '考核评价-结果暂存', '190', '10.1.129.41', '2018-05-24 10:51:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('1546', 'zongli', '部门评价', '考核评价-结果暂存', '231', '10.1.129.41', '2018-05-24 10:51:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('1547', 'zongli', '部门评价', '考核评价-结果暂存', '150', '10.1.129.41', '2018-05-24 10:52:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1548', 'zongli', '部门评价', '考核评价-结果暂存', '130', '10.1.129.41', '2018-05-24 10:52:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1549', 'zongli', '部门评价', '考核评价-结果暂存', '184', '10.1.129.41', '2018-05-24 10:53:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1550', 'fanmaomao', '部门评价', '考核评价-结果暂存', '145', '10.1.129.41', '2018-05-24 10:55:21', '执行成功!');
INSERT INTO `ly_log` VALUES ('1551', 'fanmaomao', '部门评价', '考核评价-结果暂存', '167', '10.1.129.41', '2018-05-24 10:55:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1552', 'fanmaomao', '部门评价', '考核评价-结果暂存', '221', '10.1.129.41', '2018-05-24 10:58:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('1553', 'fanmaomao', '部门评价', '考核评价-结果暂存', '200', '10.1.129.41', '2018-05-24 10:59:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1554', 'fanmaomao', '部门评价', '考核评价-结果暂存', '236', '10.1.129.41', '2018-05-24 10:59:47', '执行成功!');
INSERT INTO `ly_log` VALUES ('1555', 'fanmaomao', '部门评价', '考核评价-结果暂存', '188', '10.1.129.41', '2018-05-24 11:02:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('1556', 'fanmaomao', '部门评价', '考核评价-结果暂存', '151', '10.1.129.41', '2018-05-24 11:02:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('1557', 'fanmaomao', '部门评价', '考核评价-结果暂存', '345', '10.1.129.41', '2018-05-24 11:05:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1558', 'fanmaomao', '部门评价', '考核评价-结果暂存', '143', '10.1.129.41', '2018-05-24 11:05:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1559', 'zhangwei', '人员管理', '人员离职自动评分', '420', '10.1.129.41', '2018-05-24 11:11:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('1560', 'zhangwei', '人员管理', '人员离职自动评分', '361', '10.1.129.41', '2018-05-24 11:11:09', '执行成功!');
INSERT INTO `ly_log` VALUES ('1561', 'zhangwei', '人员管理', '人员离职自动评分', '653', '10.1.129.41', '2018-05-24 11:11:45', '执行成功!');
INSERT INTO `ly_log` VALUES ('1562', 'zhangwei', '人员管理', '人员离职自动评分', '95', '10.1.129.41', '2018-05-24 11:11:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('1563', 'zhangwei', '人员管理', '人员离职自动评分', '436', '10.1.129.41', '2018-05-24 11:15:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1564', 'zhangwei', '人员管理', '人员离职自动评分', '60', '10.1.129.41', '2018-05-24 11:15:16', '执行成功!');
INSERT INTO `ly_log` VALUES ('1565', 'zhangwei', '人员管理', '人员离职自动评分', '476', '10.1.129.41', '2018-05-24 11:15:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1566', 'zhangwei', '人员管理', '人员离职自动评分', '72', '10.1.129.41', '2018-05-24 11:15:30', '执行成功!');
INSERT INTO `ly_log` VALUES ('1567', 'zhangwei', '人员管理', '人员离职自动评分', '1047', '10.1.129.41', '2018-05-24 11:15:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('1568', 'zhangwei', '人员管理', '人员离职自动评分', '79', '10.1.129.41', '2018-05-24 11:15:39', '执行成功!');
INSERT INTO `ly_log` VALUES ('1569', 'zhangwei', '人员管理', '人员离职自动评分', '452', '10.1.129.41', '2018-05-24 11:16:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('1570', 'zhangwei', '人员管理', '人员离职自动评分', '547', '10.1.129.41', '2018-05-24 11:16:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1571', 'zhangwei', '人员管理', '人员离职自动评分', '585', '10.1.129.41', '2018-05-24 11:16:28', '执行成功!');
INSERT INTO `ly_log` VALUES ('1572', 'zhangwei', '人员管理', '人员离职自动评分', '57', '10.1.129.41', '2018-05-24 11:16:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('1573', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '243', '127.0.0.1', '2018-05-24 13:50:24', '执行成功!');
INSERT INTO `ly_log` VALUES ('1574', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '132', '127.0.0.1', '2018-05-24 13:50:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('1575', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '144', '127.0.0.1', '2018-05-24 13:50:44', '执行成功!');
INSERT INTO `ly_log` VALUES ('1576', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '183', '127.0.0.1', '2018-05-24 13:50:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('1577', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '219', '127.0.0.1', '2018-05-24 13:50:52', '执行成功!');
INSERT INTO `ly_log` VALUES ('1578', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '207', '127.0.0.1', '2018-05-24 13:50:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1579', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '133', '127.0.0.1', '2018-05-24 13:50:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1580', 'zhaojiaqi', '部门评价', '考核评价-结果暂存', '136', '127.0.0.1', '2018-05-24 13:51:03', '执行成功!');
INSERT INTO `ly_log` VALUES ('1581', 'zhangwei', '人员管理', '人员离职自动评分', '14874', '127.0.0.1', '2018-05-24 14:06:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1582', 'zhangwei', '人员管理', '人员离职自动评分', '369', '127.0.0.1', '2018-05-24 14:08:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('1583', 'zhangwei', '人员管理', '人员离职自动评分', '438', '127.0.0.1', '2018-05-24 14:09:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('1584', 'zhangwei', '人员管理', '人员离职自动评分', '7203', '127.0.0.1', '2018-05-24 14:15:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('1585', 'tudengfeng', '部门评价', '考核评价-结果暂存', '55', '61.129.8.203', '2018-05-24 14:28:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1586', 'tudengfeng', '部门评价', '考核评价-结果暂存', '208', '61.129.8.203', '2018-05-24 14:28:10', '执行成功!');
INSERT INTO `ly_log` VALUES ('1587', 'tudengfeng', '部门评价', '考核评价-结果暂存', '31', '61.129.8.203', '2018-05-24 14:29:00', '执行成功!');
INSERT INTO `ly_log` VALUES ('1588', 'zhangwei', '人员管理', '人员离职自动评分', '49', '180.167.77.138', '2018-05-24 14:32:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('1589', 'huangbian', '部门评价', '考核评价-结果暂存', '29', '180.167.77.138', '2018-05-24 14:38:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1590', 'huangbian', '部门评价', '考核评价-结果暂存', '29', '180.167.77.138', '2018-05-24 14:39:06', '执行成功!');
INSERT INTO `ly_log` VALUES ('1591', 'huangweiyi', '部门评价', '考核评价-结果暂存', '26', '124.160.215.231', '2018-05-24 14:44:56', '执行成功!');
INSERT INTO `ly_log` VALUES ('1592', 'huangweiyi', '部门评价', '考核评价-结果暂存', '37', '124.160.215.231', '2018-05-24 14:45:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('1593', 'fengzhiqiang', '部门评价', '考核评价-结果暂存', '311', '10.1.129.41', '2018-05-24 14:51:27', '执行成功!');
INSERT INTO `ly_log` VALUES ('1594', 'fengzhiqiang', '部门评价', '考核评价-结果暂存', '239', '10.1.129.41', '2018-05-24 14:51:36', '执行成功!');
INSERT INTO `ly_log` VALUES ('1595', 'hongweifeng', '部门评价', '考核评价-结果暂存', '193', '10.1.129.41', '2018-05-24 14:51:55', '执行成功!');
INSERT INTO `ly_log` VALUES ('1596', 'huangweiyi', '部门评价', '考核评价-结果暂存', '95', '180.167.77.138', '2018-05-24 15:55:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('1597', 'huangweiyi', '部门评价', '考核评价-结果暂存', '39', '180.167.77.138', '2018-05-24 15:55:43', '执行成功!');

-- ----------------------------
-- Table structure for ly_res_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_res_user`;
CREATE TABLE `ly_res_user` (
  `resId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_res_user
-- ----------------------------
INSERT INTO `ly_res_user` VALUES ('1', '3');
INSERT INTO `ly_res_user` VALUES ('2', '3');
INSERT INTO `ly_res_user` VALUES ('3', '3');
INSERT INTO `ly_res_user` VALUES ('4', '3');
INSERT INTO `ly_res_user` VALUES ('5', '3');
INSERT INTO `ly_res_user` VALUES ('6', '3');
INSERT INTO `ly_res_user` VALUES ('7', '3');
INSERT INTO `ly_res_user` VALUES ('8', '3');
INSERT INTO `ly_res_user` VALUES ('9', '3');
INSERT INTO `ly_res_user` VALUES ('10', '3');
INSERT INTO `ly_res_user` VALUES ('11', '3');
INSERT INTO `ly_res_user` VALUES ('25', '3');
INSERT INTO `ly_res_user` VALUES ('26', '3');
INSERT INTO `ly_res_user` VALUES ('27', '3');
INSERT INTO `ly_res_user` VALUES ('28', '3');
INSERT INTO `ly_res_user` VALUES ('29', '3');
INSERT INTO `ly_res_user` VALUES ('30', '3');
INSERT INTO `ly_res_user` VALUES ('31', '3');
INSERT INTO `ly_res_user` VALUES ('32', '3');
INSERT INTO `ly_res_user` VALUES ('33', '3');
INSERT INTO `ly_res_user` VALUES ('34', '3');
INSERT INTO `ly_res_user` VALUES ('35', '3');
INSERT INTO `ly_res_user` VALUES ('40', '3');
INSERT INTO `ly_res_user` VALUES ('1', '4');
INSERT INTO `ly_res_user` VALUES ('2', '4');
INSERT INTO `ly_res_user` VALUES ('3', '4');
INSERT INTO `ly_res_user` VALUES ('4', '4');
INSERT INTO `ly_res_user` VALUES ('5', '4');
INSERT INTO `ly_res_user` VALUES ('6', '4');
INSERT INTO `ly_res_user` VALUES ('7', '4');
INSERT INTO `ly_res_user` VALUES ('8', '4');
INSERT INTO `ly_res_user` VALUES ('9', '4');
INSERT INTO `ly_res_user` VALUES ('10', '4');
INSERT INTO `ly_res_user` VALUES ('11', '4');
INSERT INTO `ly_res_user` VALUES ('29', '4');
INSERT INTO `ly_res_user` VALUES ('30', '4');
INSERT INTO `ly_res_user` VALUES ('31', '4');
INSERT INTO `ly_res_user` VALUES ('34', '4');
INSERT INTO `ly_res_user` VALUES ('37', '4');
INSERT INTO `ly_res_user` VALUES ('40', '4');
INSERT INTO `ly_res_user` VALUES ('41', '4');
INSERT INTO `ly_res_user` VALUES ('47', '4');
INSERT INTO `ly_res_user` VALUES ('48', '4');
INSERT INTO `ly_res_user` VALUES ('37', '5');
INSERT INTO `ly_res_user` VALUES ('38', '5');
INSERT INTO `ly_res_user` VALUES ('41', '5');
INSERT INTO `ly_res_user` VALUES ('37', '6');
INSERT INTO `ly_res_user` VALUES ('38', '6');
INSERT INTO `ly_res_user` VALUES ('46', '6');
INSERT INTO `ly_res_user` VALUES ('37', '7');
INSERT INTO `ly_res_user` VALUES ('38', '7');
INSERT INTO `ly_res_user` VALUES ('41', '7');
INSERT INTO `ly_res_user` VALUES ('37', '8');
INSERT INTO `ly_res_user` VALUES ('38', '8');
INSERT INTO `ly_res_user` VALUES ('46', '8');
INSERT INTO `ly_res_user` VALUES ('37', '9');
INSERT INTO `ly_res_user` VALUES ('38', '9');
INSERT INTO `ly_res_user` VALUES ('46', '9');
INSERT INTO `ly_res_user` VALUES ('37', '10');
INSERT INTO `ly_res_user` VALUES ('38', '10');
INSERT INTO `ly_res_user` VALUES ('46', '10');
INSERT INTO `ly_res_user` VALUES ('37', '11');
INSERT INTO `ly_res_user` VALUES ('43', '11');
INSERT INTO `ly_res_user` VALUES ('37', '12');
INSERT INTO `ly_res_user` VALUES ('38', '12');
INSERT INTO `ly_res_user` VALUES ('46', '12');
INSERT INTO `ly_res_user` VALUES ('37', '13');
INSERT INTO `ly_res_user` VALUES ('43', '13');
INSERT INTO `ly_res_user` VALUES ('37', '14');
INSERT INTO `ly_res_user` VALUES ('38', '14');
INSERT INTO `ly_res_user` VALUES ('46', '14');
INSERT INTO `ly_res_user` VALUES ('37', '15');
INSERT INTO `ly_res_user` VALUES ('38', '15');
INSERT INTO `ly_res_user` VALUES ('46', '15');
INSERT INTO `ly_res_user` VALUES ('37', '16');
INSERT INTO `ly_res_user` VALUES ('43', '16');
INSERT INTO `ly_res_user` VALUES ('37', '17');
INSERT INTO `ly_res_user` VALUES ('43', '17');
INSERT INTO `ly_res_user` VALUES ('37', '18');
INSERT INTO `ly_res_user` VALUES ('38', '18');
INSERT INTO `ly_res_user` VALUES ('41', '18');
INSERT INTO `ly_res_user` VALUES ('37', '19');
INSERT INTO `ly_res_user` VALUES ('38', '19');
INSERT INTO `ly_res_user` VALUES ('46', '19');
INSERT INTO `ly_res_user` VALUES ('37', '21');
INSERT INTO `ly_res_user` VALUES ('38', '21');
INSERT INTO `ly_res_user` VALUES ('46', '21');
INSERT INTO `ly_res_user` VALUES ('37', '22');
INSERT INTO `ly_res_user` VALUES ('38', '22');
INSERT INTO `ly_res_user` VALUES ('46', '22');
INSERT INTO `ly_res_user` VALUES ('37', '23');
INSERT INTO `ly_res_user` VALUES ('43', '23');
INSERT INTO `ly_res_user` VALUES ('37', '24');
INSERT INTO `ly_res_user` VALUES ('43', '24');
INSERT INTO `ly_res_user` VALUES ('37', '25');
INSERT INTO `ly_res_user` VALUES ('38', '25');
INSERT INTO `ly_res_user` VALUES ('46', '25');
INSERT INTO `ly_res_user` VALUES ('37', '26');
INSERT INTO `ly_res_user` VALUES ('43', '26');
INSERT INTO `ly_res_user` VALUES ('37', '27');
INSERT INTO `ly_res_user` VALUES ('38', '27');
INSERT INTO `ly_res_user` VALUES ('46', '27');
INSERT INTO `ly_res_user` VALUES ('37', '28');
INSERT INTO `ly_res_user` VALUES ('38', '28');
INSERT INTO `ly_res_user` VALUES ('46', '28');
INSERT INTO `ly_res_user` VALUES ('37', '29');
INSERT INTO `ly_res_user` VALUES ('43', '29');
INSERT INTO `ly_res_user` VALUES ('37', '30');
INSERT INTO `ly_res_user` VALUES ('38', '30');
INSERT INTO `ly_res_user` VALUES ('46', '30');
INSERT INTO `ly_res_user` VALUES ('37', '31');
INSERT INTO `ly_res_user` VALUES ('43', '31');
INSERT INTO `ly_res_user` VALUES ('37', '32');
INSERT INTO `ly_res_user` VALUES ('43', '32');
INSERT INTO `ly_res_user` VALUES ('37', '33');
INSERT INTO `ly_res_user` VALUES ('38', '33');
INSERT INTO `ly_res_user` VALUES ('46', '33');
INSERT INTO `ly_res_user` VALUES ('37', '34');
INSERT INTO `ly_res_user` VALUES ('38', '34');
INSERT INTO `ly_res_user` VALUES ('41', '34');
INSERT INTO `ly_res_user` VALUES ('37', '36');
INSERT INTO `ly_res_user` VALUES ('38', '36');
INSERT INTO `ly_res_user` VALUES ('46', '36');
INSERT INTO `ly_res_user` VALUES ('37', '37');
INSERT INTO `ly_res_user` VALUES ('43', '37');
INSERT INTO `ly_res_user` VALUES ('37', '38');
INSERT INTO `ly_res_user` VALUES ('38', '38');
INSERT INTO `ly_res_user` VALUES ('46', '38');
INSERT INTO `ly_res_user` VALUES ('37', '39');
INSERT INTO `ly_res_user` VALUES ('43', '39');
INSERT INTO `ly_res_user` VALUES ('37', '40');
INSERT INTO `ly_res_user` VALUES ('38', '40');
INSERT INTO `ly_res_user` VALUES ('46', '40');
INSERT INTO `ly_res_user` VALUES ('37', '41');
INSERT INTO `ly_res_user` VALUES ('43', '41');
INSERT INTO `ly_res_user` VALUES ('37', '42');
INSERT INTO `ly_res_user` VALUES ('38', '42');
INSERT INTO `ly_res_user` VALUES ('46', '42');
INSERT INTO `ly_res_user` VALUES ('37', '43');
INSERT INTO `ly_res_user` VALUES ('43', '43');
INSERT INTO `ly_res_user` VALUES ('37', '44');
INSERT INTO `ly_res_user` VALUES ('38', '44');
INSERT INTO `ly_res_user` VALUES ('41', '44');
INSERT INTO `ly_res_user` VALUES ('37', '45');
INSERT INTO `ly_res_user` VALUES ('43', '45');
INSERT INTO `ly_res_user` VALUES ('37', '46');
INSERT INTO `ly_res_user` VALUES ('38', '46');
INSERT INTO `ly_res_user` VALUES ('46', '46');
INSERT INTO `ly_res_user` VALUES ('37', '47');
INSERT INTO `ly_res_user` VALUES ('38', '47');
INSERT INTO `ly_res_user` VALUES ('46', '47');
INSERT INTO `ly_res_user` VALUES ('37', '48');
INSERT INTO `ly_res_user` VALUES ('38', '48');
INSERT INTO `ly_res_user` VALUES ('46', '48');
INSERT INTO `ly_res_user` VALUES ('37', '49');
INSERT INTO `ly_res_user` VALUES ('43', '49');
INSERT INTO `ly_res_user` VALUES ('37', '50');
INSERT INTO `ly_res_user` VALUES ('43', '50');
INSERT INTO `ly_res_user` VALUES ('1', '51');
INSERT INTO `ly_res_user` VALUES ('2', '51');
INSERT INTO `ly_res_user` VALUES ('3', '51');
INSERT INTO `ly_res_user` VALUES ('4', '51');
INSERT INTO `ly_res_user` VALUES ('5', '51');
INSERT INTO `ly_res_user` VALUES ('6', '51');
INSERT INTO `ly_res_user` VALUES ('7', '51');
INSERT INTO `ly_res_user` VALUES ('8', '51');
INSERT INTO `ly_res_user` VALUES ('9', '51');
INSERT INTO `ly_res_user` VALUES ('10', '51');
INSERT INTO `ly_res_user` VALUES ('11', '51');
INSERT INTO `ly_res_user` VALUES ('29', '51');
INSERT INTO `ly_res_user` VALUES ('30', '51');
INSERT INTO `ly_res_user` VALUES ('31', '51');
INSERT INTO `ly_res_user` VALUES ('34', '51');
INSERT INTO `ly_res_user` VALUES ('37', '51');
INSERT INTO `ly_res_user` VALUES ('40', '51');
INSERT INTO `ly_res_user` VALUES ('41', '51');
INSERT INTO `ly_res_user` VALUES ('47', '51');
INSERT INTO `ly_res_user` VALUES ('37', '52');
INSERT INTO `ly_res_user` VALUES ('43', '52');
INSERT INTO `ly_res_user` VALUES ('37', '53');
INSERT INTO `ly_res_user` VALUES ('43', '53');
INSERT INTO `ly_res_user` VALUES ('37', '54');
INSERT INTO `ly_res_user` VALUES ('43', '54');
INSERT INTO `ly_res_user` VALUES ('37', '55');
INSERT INTO `ly_res_user` VALUES ('38', '55');
INSERT INTO `ly_res_user` VALUES ('46', '55');
INSERT INTO `ly_res_user` VALUES ('37', '56');
INSERT INTO `ly_res_user` VALUES ('38', '56');
INSERT INTO `ly_res_user` VALUES ('41', '56');
INSERT INTO `ly_res_user` VALUES ('37', '57');
INSERT INTO `ly_res_user` VALUES ('38', '57');
INSERT INTO `ly_res_user` VALUES ('46', '57');
INSERT INTO `ly_res_user` VALUES ('37', '58');
INSERT INTO `ly_res_user` VALUES ('38', '58');
INSERT INTO `ly_res_user` VALUES ('46', '58');
INSERT INTO `ly_res_user` VALUES ('37', '59');
INSERT INTO `ly_res_user` VALUES ('38', '59');
INSERT INTO `ly_res_user` VALUES ('46', '59');
INSERT INTO `ly_res_user` VALUES ('37', '60');
INSERT INTO `ly_res_user` VALUES ('38', '60');
INSERT INTO `ly_res_user` VALUES ('46', '60');
INSERT INTO `ly_res_user` VALUES ('37', '61');
INSERT INTO `ly_res_user` VALUES ('38', '61');
INSERT INTO `ly_res_user` VALUES ('46', '61');
INSERT INTO `ly_res_user` VALUES ('37', '62');
INSERT INTO `ly_res_user` VALUES ('38', '62');
INSERT INTO `ly_res_user` VALUES ('46', '62');
INSERT INTO `ly_res_user` VALUES ('37', '63');
INSERT INTO `ly_res_user` VALUES ('38', '63');
INSERT INTO `ly_res_user` VALUES ('46', '63');
INSERT INTO `ly_res_user` VALUES ('37', '64');
INSERT INTO `ly_res_user` VALUES ('41', '64');
INSERT INTO `ly_res_user` VALUES ('37', '65');
INSERT INTO `ly_res_user` VALUES ('41', '65');
INSERT INTO `ly_res_user` VALUES ('37', '68');
INSERT INTO `ly_res_user` VALUES ('38', '68');
INSERT INTO `ly_res_user` VALUES ('41', '68');
INSERT INTO `ly_res_user` VALUES ('43', '68');
INSERT INTO `ly_res_user` VALUES ('46', '68');
INSERT INTO `ly_res_user` VALUES ('47', '68');

-- ----------------------------
-- Table structure for ly_resources
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '1', 'fa-desktop', '0', '系统基础管理');
INSERT INTO `ly_resources` VALUES ('2', '用户管理', '1', 'account', '1', '/user/list.shtml', '2', null, '0', null);
INSERT INTO `ly_resources` VALUES ('3', '角色管理', '1', 'role', '1', '/role/list.shtml', '7', 'fa-list', '0', '组管理');
INSERT INTO `ly_resources` VALUES ('4', '菜单管理', '1', 'ly_resources', '1', '/resources/list.shtml', '12', 'fa-list-alt', '0', '菜单管理');
INSERT INTO `ly_resources` VALUES ('5', '新增用户', '2', 'account_add', '2', '/user/addUI.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('6', '修改用户', '2', 'account_edit', '2', '/user/editUI.shtml', '4', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('7', '删除用户', '2', 'account_delete', '2', '/user/deleteById.shtml', '5', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('8', '新增角色', '3', 'role_add', '2', '/role/addUI.shtml', '8', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRole&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('9', '修改角色', '3', 'role_edit', '2', '/role/editUI.shtml', '9', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRole&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('10', '删除角色', '3', 'role_delete', '2', '/role/delete.shtml', '10', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delRole&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('11', '分配权限', '3', 'role_perss', '2', '/resources/permissions.shtml', '11', '无', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('25', '登陆信息管理', '0', 'ly_login', '0', 'ly_login', '18', 'fa-calendar', '0', '登陆信息管理');
INSERT INTO `ly_resources` VALUES ('26', '用户登录记录', '25', 'ly_log_list', '1', '/userlogin/listUI.shtml', '19', null, '0', '用户登录记录');
INSERT INTO `ly_resources` VALUES ('27', '操作日志管理', '0', 'ly_log', '0', 'ly_log', '20', 'fa-picture-o', '1', '操作日志管理');
INSERT INTO `ly_resources` VALUES ('28', '日志查询', '27', 'ly_log', '1', '/log/list.shtml', '21', null, '0', null);
INSERT INTO `ly_resources` VALUES ('29', '新增菜单资源', '4', 'ly_resources_add', '2', '/resources/addUI.shtml', '13', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('30', '修改菜单资源', '4', 'ly_resources_edit', '2', '/resources/editUI.shtml', '14', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('31', '删除菜单资源', '4', 'ly_resources_delete', '2', '/resources/delete.shtml', '15', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('32', '系统监控管理', '0', 'monitor', '0', 'monitor', '16', 'fa-tag', '0', '系统监控管理');
INSERT INTO `ly_resources` VALUES ('33', '实时监控', '32', 'sysmonitor', '1', '/monitor/monitor.shtml', '17', null, '0', '实时监控');
INSERT INTO `ly_resources` VALUES ('34', '分配权限', '2', 'permissions', '2', '/resources/permissions.shtml', '6', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('35', '告警列表', '32', 'monitor_warn', '1', '/monitor/list.shtml', null, null, '0', '告警列表');
INSERT INTO `ly_resources` VALUES ('37', '部门考核管理', '0', 'check', '0', 'check', '23', 'calendar-check', '0', '部门评级考核');
INSERT INTO `ly_resources` VALUES ('38', '本月考评', '37', 'Assess', '2', '/check/list.shtml', '24', '', '0', '&lt;button type=&quot;button&quot; id=&quot;delFun&quot; class=&quot;btn btn-danger marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('40', '人员架构图', '1', 'empRelative', '1', '/userInfo/userRelativeTreeView.shtml', '25', null, '0', '人员架构图');
INSERT INTO `ly_resources` VALUES ('41', '团队考核详情', '37', 'subordinateRateInfo', '1', '/userInfo/subordinateRateView.shtml', '26', null, '0', '查看员工打分详情');
INSERT INTO `ly_resources` VALUES ('43', '考评结果', '37', 'AssessResults', '1', '/userInfo/rateInfo.shtml', '27', '', '0', '考核结果查询');
INSERT INTO `ly_resources` VALUES ('46', '评分历史', '37', 'CheckHistory', '2', '/check/checkHistoryList.shtml', '28', null, '0', '客户经理可以看到自己的考评历史');
INSERT INTO `ly_resources` VALUES ('47', '评分进度', '37', 'rateProgress', '0', '/check/rateProgressForAllView.shtml', null, null, '0', '查看总评分进度');
INSERT INTO `ly_resources` VALUES ('48', '人员离职', '2', 'dimissions', '2', '/user/dimission.shtml', '7', '', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;dimission&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;标记为离职&lt;/button&gt;');

-- ----------------------------
-- Table structure for ly_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_role`;
CREATE TABLE `ly_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
INSERT INTO `ly_role` VALUES ('1', '0', '管理员', 'admin', '管理员', '11');
INSERT INTO `ly_role` VALUES ('4', '0', '团队长', null, '(中后台)团队长', '10');
INSERT INTO `ly_role` VALUES ('6', '0', '客户经理', null, '客户经理', '8');
INSERT INTO `ly_role` VALUES ('7', '0', '中后台', null, '中后台', '5');
INSERT INTO `ly_role` VALUES ('8', '0', '组长', null, '组长', '9');
INSERT INTO `ly_role` VALUES ('9', '0', '总经理', null, '部门领导', '11');
INSERT INTO `ly_role` VALUES ('10', '0', '总经理助理', null, '部门领导', '11');
INSERT INTO `ly_role` VALUES ('11', '0', '全量专用', null, '张炜、胡小鹏', '11');
INSERT INTO `ly_role` VALUES ('13', '1', '555', '555555555', '5555555555', null);

-- ----------------------------
-- Table structure for ly_server_info
-- ----------------------------
DROP TABLE IF EXISTS `ly_server_info`;
CREATE TABLE `ly_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_server_info
-- ----------------------------

-- ----------------------------
-- Table structure for ly_user
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `credentialsSalt` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `locked` varchar(3) DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('3', '管理员', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '3434', '0', '2018-04-03 21:46:32', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('4', '张炜1', 'zhangwei', '2953f59fc74952be1e35f20d1b13edaf', '57d9b4ff17862ab18e22752958542661', null, '0', '2018-05-21 13:42:51', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('5', '骆敬忠', 'luojingzhong', '7c0a6fca7c8dc73e2d282e0ab526f7ec', '74f485d2d4dea8b18c6a44481650fbe6', '交运一团队--团队长', '0', '2018-05-21 13:42:51', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('6', '杜明杰', 'dumingjie', '2cef2ef1c628391f295635ba85e50f21', '62f33ce1bf76aff718f71d26cbff929b', '交运一团队--副经理', '0', '2018-05-23 11:13:48', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('7', '祁炜', 'qiwei', 'a15546c2825c9d4ef404ee3d141e7271', '3437ed4f02723614991de7a189eef38e', '信贷管理团队--副经理', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('8', '葛汤华', 'getanghua', '07311cfe162845ea718b7fccd00d8f78', 'd883836f6885fcca964c0096ce5c4a2c', '交运一客户经理1', '0', '2018-05-23 17:59:14', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('9', '郑海洋', 'zhenghaiyang', 'f8fa5ea7de2af9f24f6287df0407ded9', 'ea0ff8a47bcccf41ed513d6120281c73', '交运一客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('10', '王维', 'wangwei', 'a193d3909d31b775c9371db25dfff7bb', '8e88b97117b2447c4c40c771fdb72a8c', '交运一客户经理', '0', '2018-05-23 17:59:14', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('11', '彭文君', 'pengwenjun', 'd49d500597c051531da35cb76b58cc2f', '5d2cee969fd5cd7f3d8f26424abdb684', '信贷管理团队--审批岗', '0', '2018-04-02 14:44:26', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('12', '韩云登', 'hanyundeng', '6d47fd94009a364c7d67addd9e12e85b', '654e0a32039f99d47cc22a81aac21b49', '交运一客户经理', '0', '2018-05-23 17:59:14', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('13', '宋金凤', 'songjinfeng', 'b89cc92137b290518d4e37d75d64f01f', '646e921991b6654b2b316dc87e043f22', '信贷管理团队--审批岗', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('14', '杨少清', 'yangshaoqing', 'c332180377265673d66d37bb8f0eb8e1', 'c4ad3be80445ae7811bdcf1324459818', '交运一客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('15', '李沙', 'lisha', '92de2b13586f6cc502e723b1dc1690cd', '561b66806fe4adf367b27d181adb38bd', '交运一客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('16', '鲁晓', 'luxiao', 'fcd932d6b49f20be2e9d06d08d941d36', 'b56c48c67f7f0b8a9988381802fc7ef1', '信贷管理团队--贷后岗', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('17', '王超楠', 'wangchaonan', '366d6acea70c9060efbe8129808dbe8e', '8f8bfcd71efa1a5c93c05d402e7dd4d4', '信贷管理团队--贷后岗', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('18', '郭雪山', 'guoxueshan', 'dae0baa3ef71993c6b7df2ed08a11e16', '42d872c90b90450e71deef15d6e8f9f9', '交运二团队--团队长', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('19', '涂登峰', 'tudengfeng', 'caadb82f78a53d5193e28d75c977db0f', '0f30201e0d77cdebf1c347dff15e8a6b', '交运二客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('21', '范毛毛', 'fanmaomao', '39511a4b868a644b790f900f52c48c08', 'a9bca41d8d848b402ee7632a1915d004', '交运二客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('22', '宗立', 'zongli', '1eb8b71aedc8fe7d38431c52f012af24', '96652462c4a0fd2341d094974d3bcd3a', '交运二客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('23', '杨莉', 'yangli', 'c939f8e393046d3db62dbfefbfbe7112', 'd5359dbdb499af56c2652b17d88b3495', '信贷管理团队档案--押品管理', '0', '2018-05-21 13:42:51', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('24', '杨仙', 'yangxian', '341b83ea1b573b44b3ee468d3544cf69', '80a72f8df776274f3f34d3ba84118401', '信贷管理团队档案--押品管理', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('25', '王林飞', 'wanglinfei', '335b6a55f0941516b070808d5ab4f2e6', '8392b95a60b2cc7bba762af34175a13b', '交运二客户经理', '0', '2018-05-23 17:54:53', '1', 'chenyh.me@gmail.com');
INSERT INTO `ly_user` VALUES ('26', '季寰宇', 'jihuanyu', '313c566de29c90b0a882f2baaeafa2e0', '0b35a06130f2af93da62145e999eb697', '信贷管理团队档案--押品管理', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('27', '张艳', 'zhangyan', '76989476714d83a0e3e2ca3923296147', '7ffd1a3fa8ef77a3bf6d87a32c5e92c2', '交运二客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('28', '万强', 'wanqiang', 'ed51e411e857eb9c381842814b49acc5', 'ed613740a2d0830172fb994783012feb', '交运二客户经理', '0', '2018-05-23 17:54:53', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('29', '刘崧', 'liusong', '79fde825ed1777f60f9d76c0fec6b013', '6e84870d7bc30b05947261668c9de8c0', '业务支持团队--集中作业组', '0', '2018-05-21 13:42:51', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('30', '朱子晔', 'zhuziye', '5ad6c0e34bc07b47e56fb8e8d2bd0d97', '606b779583672e50ffa0de555db1b694', '交运二客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('33', '周丽咪', 'zhoulimi', '7bf1b25ba227b95b3ca8ebe20f800014', '7f9a8a15f8b5d519399649d2b9257688', '交运二客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('34', '于杰', 'yujie', 'a7cee8a017fc90bb87fa3c81d64eebaa', 'dce603b081281cc6128b242ca5e3805e', '零售一团队--团队长', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('35', '陈任倩', 'chenrenqian', '9a73cbbeeb22567c8c28ea05404d51f5', '1c6ed212ffdbd6cd6863785925bbc7a0', '业务支持团队--集中作业组组长', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('36', '程瑶', 'chengyao', '58f880e294323a051ef763141767abd4', 'cc29da43881ab28ef2d2f4c8b425387d', '零售一团队客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('37', '杨沁', 'yangqin', 'e868006af9f8d38520932ce2e6a358b6', '0ff75adf4a5b912756f42cfaf70ba711', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('38', '洪卫峰', 'hongweifeng', '5d35b08683941f4f130a151b8f98a00a', '99a3b55d7df030081f535a17bca589b7', '零售一团队客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('39', '王妍', 'wangyan', 'be48d6842398b83a6abe51283661ee35', '8bfc851a46dfe624b686cfecc9fa28a5', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('40', '殷俊', 'yinjun', '6f3ce8f55ed01637a1aae183a7f4aa33', '3e005f92c07107c5d52a7da8f0747537', '零售一团队客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('41', '杨露', 'yanglu', 'c8cdf818826678af70567006b8a397a0', '5eb4038430c0a9b58f921b484dd0c9bf', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('42', '李珍', 'lizhen', 'b9897c667c2604806753d903e373f1a5', '8888a2caf899f82476f68614de9509a5', '零售一团队客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('43', '虞炯辉', 'yujionghui', '3f19f1618eb7c6e9a031e181ba112da3', 'e817b56d247f29abea9937a8b0d7d00c', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('44', '胡佳雯', 'hujiawen', '9d789be2fa488fb87f4e6f4618585660', '0beeac262bf8f7ffa99b06dd46164f89', '零售二团队--团队长', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('45', '袁芝伟', 'yuanzhiwei', 'b73e4300ac115d6687707ff74b4bbe9a', 'a9f7f784b3ec4c5d9c8ce7283b42fc14', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('46', '黄为一', 'huangweiyi', '1879ac1ebcf412324fee8414ffdd6bb3', '9eba23ce55d049caf4f11e5bb6b1bda1', '零售二团队客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('47', '冯志强', 'fengzhiqiang', '511aa3ee56a2377c2b490e7f940a9828', 'c67e5a0f58618c118605a85ee42acf13', '零售二团队客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('48', '陈佳伟', 'chenjiawei', '61c4b74e7f48547196aeffddf39e3ec3', '840e9ab7e851393918cc94a854d10abf', '零售二团队客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('49', '陈伊盈', 'chenyiying', '14899e5bb4bfe3613604abd6de68d4f5', 'eebc662f8b1362db626f37700bf96077', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('50', '陈秋婷', 'chenqiuting', 'b57f469f4f3b69ce698b36629e4624a1', '0f5d4774f810d3ea0bd4e42b8945a6c0', '业务支持团队--集中作业组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('51', '胡小鹏', 'huxiaopeng', 'a5a5c463640382a464f82f0e9a86d80b', 'fe6f836fe2bb4e189839d63065bce36e', '业务支持团队科技--运营组组长', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('52', '陈默', 'chenmo', '1cf21fcc610d126550a14e24ee34560d', '360a0424433f3f7e2c27beef2061c58e', '业务支持团队--科技运营组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('53', '高国峰', 'gaoguofeng', '887a9361e5e4c8c63dde0de8d89a8354', 'd12752eba16955bd5074918ea01ef201', '业务支持团队--科技运营组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('54', '缪一帆', 'miaoyifan', 'f83c9ffb027eeb3b48be36306f861c06', '7337ab5aaa7fa493dbbbaa51498ce51a', '业务支持团队--科技运营组', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('55', '徐菲', 'xufei', '99325178cdd22ab210dff7e59c100f54', '45cb627016b075d77aa6f8428cd200f9', '快运团队客户经理', '0', '2018-05-23 17:44:52', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('56', '曹亚文', 'caoyawen', '6130b3670e0d18188bd3cb8e60f23b3e', '307e2d6aa5051465ea0736b472578718', '加盟商业务中心负责人', '0', '2018-03-28 09:54:35', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('57', '李吁', 'liyu', '39586a6c174f0bb50d7a6b4b14e84c0f', 'dc137541a0dd86c5e8b139af31155eda', '快运团队客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('58', '赵佳祺', 'zhaojiaqi', 'b6178da81c91401b9ed5373c29b69d6a', 'bc1a7403ff28f66330bf0351e6269c98', '加盟商业务中心负责人助理', '0', '2018-05-23 17:49:02', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('59', '黄鞭', 'huangbian', '0b68154c9587f80bc85001a0e070475c', '771241d3732b7bcbfd3927f98e40e032', '快运团队客户经理', '0', '2018-05-23 15:42:05', '0', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('60', '钟文宇', 'zhongwenyu', '9e9a35d7b7d78acec41ef40c21531642', '0e7706d3ac0c19df2140edf61f665a1e', '快运团队客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('61', '王韵盟', 'wangyunmeng', '4cac13a14c4f74a61f2a83f12dbfe07f', '00ea0a27b0cddc6c441d8f1047adee9f', '快运团队客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('62', '余正同', 'yuzhengtong', 'a0c47813f3024ef6a09b278b8418187a', '04124c19d5005cfc47a70eb6a7f04b4e', '快运团队客户经理', '0', '2018-05-23 17:44:52', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('63', '谢博文', 'xiebowen', 'e0acbb6d4b61a171ddce2d238cbd019f', '7c6df8e654ec1a2daa5e7116d5856ece', '快运团队客户经理', '0', '2018-05-23 17:08:51', '0', 'chenyh.me@gmail.com');
INSERT INTO `ly_user` VALUES ('64', '戎波', 'rongbo', '0d2eb404a21ff0f4079f262b86adbcbf', '21774cb24e35235f9d6158e8bcfa76ec', '部门总经理', '0', '2018-03-28 09:54:35', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('65', '施颖', 'shiying', '7c4616c0e8ac284371c3a9efadf78ac3', '6dca1e20b838ac821bba5ae6f77858d0', '总经理助理', '0', '2018-03-28 09:54:35', '1', '17606852971@163.com');
INSERT INTO `ly_user` VALUES ('69', '12312', '312313', 'd766c696d985d80b9e3dba1de2c0e43b', 'ee27842d90bf652085e3b4985c83e5f5', '1231321', '0', '2018-05-23 14:13:43', '0', '');

-- ----------------------------
-- Table structure for ly_user_data
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_data`;
CREATE TABLE `ly_user_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user_data
-- ----------------------------

-- ----------------------------
-- Table structure for ly_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE `ly_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------
INSERT INTO `ly_user_role` VALUES ('3', '1');
INSERT INTO `ly_user_role` VALUES ('4', '11');
INSERT INTO `ly_user_role` VALUES ('5', '4');
INSERT INTO `ly_user_role` VALUES ('6', '4');
INSERT INTO `ly_user_role` VALUES ('7', '4');
INSERT INTO `ly_user_role` VALUES ('8', '6');
INSERT INTO `ly_user_role` VALUES ('9', '6');
INSERT INTO `ly_user_role` VALUES ('10', '6');
INSERT INTO `ly_user_role` VALUES ('11', '7');
INSERT INTO `ly_user_role` VALUES ('12', '6');
INSERT INTO `ly_user_role` VALUES ('13', '7');
INSERT INTO `ly_user_role` VALUES ('14', '6');
INSERT INTO `ly_user_role` VALUES ('15', '6');
INSERT INTO `ly_user_role` VALUES ('16', '7');
INSERT INTO `ly_user_role` VALUES ('17', '7');
INSERT INTO `ly_user_role` VALUES ('18', '4');
INSERT INTO `ly_user_role` VALUES ('19', '6');
INSERT INTO `ly_user_role` VALUES ('21', '6');
INSERT INTO `ly_user_role` VALUES ('22', '6');
INSERT INTO `ly_user_role` VALUES ('23', '7');
INSERT INTO `ly_user_role` VALUES ('24', '7');
INSERT INTO `ly_user_role` VALUES ('25', '6');
INSERT INTO `ly_user_role` VALUES ('26', '7');
INSERT INTO `ly_user_role` VALUES ('27', '6');
INSERT INTO `ly_user_role` VALUES ('28', '6');
INSERT INTO `ly_user_role` VALUES ('29', '7');
INSERT INTO `ly_user_role` VALUES ('30', '6');
INSERT INTO `ly_user_role` VALUES ('31', '7');
INSERT INTO `ly_user_role` VALUES ('32', '7');
INSERT INTO `ly_user_role` VALUES ('33', '6');
INSERT INTO `ly_user_role` VALUES ('34', '4');
INSERT INTO `ly_user_role` VALUES ('35', '8');
INSERT INTO `ly_user_role` VALUES ('36', '6');
INSERT INTO `ly_user_role` VALUES ('37', '7');
INSERT INTO `ly_user_role` VALUES ('38', '6');
INSERT INTO `ly_user_role` VALUES ('39', '7');
INSERT INTO `ly_user_role` VALUES ('40', '6');
INSERT INTO `ly_user_role` VALUES ('41', '7');
INSERT INTO `ly_user_role` VALUES ('42', '6');
INSERT INTO `ly_user_role` VALUES ('43', '7');
INSERT INTO `ly_user_role` VALUES ('44', '4');
INSERT INTO `ly_user_role` VALUES ('45', '7');
INSERT INTO `ly_user_role` VALUES ('46', '6');
INSERT INTO `ly_user_role` VALUES ('47', '6');
INSERT INTO `ly_user_role` VALUES ('48', '6');
INSERT INTO `ly_user_role` VALUES ('49', '7');
INSERT INTO `ly_user_role` VALUES ('50', '7');
INSERT INTO `ly_user_role` VALUES ('51', '11');
INSERT INTO `ly_user_role` VALUES ('52', '7');
INSERT INTO `ly_user_role` VALUES ('53', '7');
INSERT INTO `ly_user_role` VALUES ('54', '7');
INSERT INTO `ly_user_role` VALUES ('55', '6');
INSERT INTO `ly_user_role` VALUES ('56', '8');
INSERT INTO `ly_user_role` VALUES ('57', '6');
INSERT INTO `ly_user_role` VALUES ('58', '6');
INSERT INTO `ly_user_role` VALUES ('59', '6');
INSERT INTO `ly_user_role` VALUES ('60', '6');
INSERT INTO `ly_user_role` VALUES ('61', '6');
INSERT INTO `ly_user_role` VALUES ('62', '6');
INSERT INTO `ly_user_role` VALUES ('63', '6');
INSERT INTO `ly_user_role` VALUES ('64', '9');
INSERT INTO `ly_user_role` VALUES ('65', '10');

-- ----------------------------
-- Table structure for ly_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `ly_userlogin`;
CREATE TABLE `ly_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1359 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('1283', '4', 'zhangwei', '2018-05-23 14:13:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1284', '4', 'zhangwei', '2018-05-23 14:43:35', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1285', '8', 'getanghua', '2018-05-23 14:44:25', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1286', '4', 'zhangwei', '2018-05-23 14:48:48', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1287', '8', 'getanghua', '2018-05-23 15:00:06', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1288', '4', 'zhangwei', '2018-05-23 15:11:01', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1289', '8', 'getanghua', '2018-05-23 15:11:12', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1290', '4', 'zhangwei', '2018-05-23 15:27:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1291', '8', 'getanghua', '2018-05-23 15:43:14', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1292', '16', 'luxiao', '2018-05-23 15:49:07', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1293', '4', 'zhangwei', '2018-05-23 16:24:32', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1294', '4', 'zhangwei', '2018-05-23 16:44:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1295', '4', 'zhangwei', '2018-05-23 16:49:57', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1296', '4', 'zhangwei', '2018-05-23 16:51:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1297', '58', 'zhaojiaqi', '2018-05-23 16:55:21', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1298', '59', 'huangbian', '2018-05-23 17:00:02', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1299', '63', 'xiebowen', '2018-05-23 17:01:28', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1300', '63', 'xiebowen', '2018-05-23 17:09:01', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1301', '4', 'zhangwei', '2018-05-23 17:19:05', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1302', '4', 'zhangwei', '2018-05-23 17:26:33', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1303', '4', 'zhangwei', '2018-05-23 17:36:41', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1304', '4', 'zhangwei', '2018-05-23 17:44:23', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1305', '58', 'zhaojiaqi', '2018-05-23 17:49:19', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1306', '4', 'zhangwei', '2018-05-23 17:50:35', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1307', '4', 'zhangwei', '2018-05-23 17:54:45', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1308', '4', 'zhangwei', '2018-05-23 17:55:23', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1309', '4', 'zhangwei', '2018-05-23 18:12:05', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1310', '4', 'zhangwei', '2018-05-24 09:55:36', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1311', '28', 'wanqiang', '2018-05-24 09:57:21', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1312', '28', 'wanqiang', '2018-05-24 09:59:49', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1313', '28', 'wanqiang', '2018-05-24 10:01:17', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1314', '4', 'zhangwei', '2018-05-24 10:09:15', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1315', '28', 'wanqiang', '2018-05-24 10:09:39', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1316', '28', 'wanqiang', '2018-05-24 10:17:18', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1317', '28', 'wanqiang', '2018-05-24 10:17:49', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1318', '4', 'zhangwei', '2018-05-24 10:21:55', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1319', '28', 'wanqiang', '2018-05-24 10:21:57', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1320', '28', 'wanqiang', '2018-05-24 10:23:21', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1321', '28', 'wanqiang', '2018-05-24 10:24:45', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1322', '28', 'wanqiang', '2018-05-24 10:25:26', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1323', '15', 'lisha', '2018-05-24 10:34:49', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1324', '15', 'lisha', '2018-05-24 10:34:56', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1325', '15', 'lisha', '2018-05-24 10:38:47', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1326', '22', 'zongli', '2018-05-24 10:48:18', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1327', '58', 'zhaojiaqi', '2018-05-24 10:53:48', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1328', '21', 'fanmaomao', '2018-05-24 10:55:03', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1329', '21', 'fanmaomao', '2018-05-24 10:58:01', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1330', '4', 'zhangwei', '2018-05-24 11:06:37', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1331', '4', 'zhangwei', '2018-05-24 11:28:20', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1332', '58', 'zhaojiaqi', '2018-05-24 11:29:30', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1333', '4', 'zhangwei', '2018-05-24 13:43:10', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1334', '58', 'zhaojiaqi', '2018-05-24 13:43:31', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1335', '4', 'zhangwei', '2018-05-24 13:57:26', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1336', '4', 'zhangwei', '2018-05-24 13:58:41', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1337', '58', 'zhaojiaqi', '2018-05-24 13:59:36', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1338', '4', 'zhangwei', '2018-05-24 14:21:20', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1339', '4', 'zhangwei', '2018-05-24 14:24:00', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1340', '19', 'tudengfeng', '2018-05-24 14:27:42', '61.129.8.203');
INSERT INTO `ly_userlogin` VALUES ('1341', '16', 'luxiao', '2018-05-24 14:30:46', '61.129.8.203');
INSERT INTO `ly_userlogin` VALUES ('1342', '22', 'zongli', '2018-05-24 14:34:37', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1343', '59', 'huangbian', '2018-05-24 14:35:42', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1344', '59', 'huangbian', '2018-05-24 14:36:13', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1345', '46', 'huangweiyi', '2018-05-24 14:36:56', '124.160.215.231');
INSERT INTO `ly_userlogin` VALUES ('1346', '59', 'huangbian', '2018-05-24 14:40:40', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1347', '46', 'huangweiyi', '2018-05-24 14:43:47', '101.90.253.167');
INSERT INTO `ly_userlogin` VALUES ('1348', '46', 'huangweiyi', '2018-05-24 14:45:00', '127.0.0.1');
INSERT INTO `ly_userlogin` VALUES ('1349', '59', 'huangbian', '2018-05-24 14:46:04', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1350', '38', 'hongweifeng', '2018-05-24 14:48:36', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1351', '59', 'huangbian', '2018-05-24 14:48:45', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1352', '47', 'fengzhiqiang', '2018-05-24 14:50:59', '10.1.129.41');
INSERT INTO `ly_userlogin` VALUES ('1353', '4', 'zhangwei', '2018-05-24 15:40:18', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1354', '4', 'zhangwei', '2018-05-24 15:40:38', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1355', '46', 'huangweiyi', '2018-05-24 15:48:59', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1356', '16', 'luxiao', '2018-05-24 15:56:00', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1357', '46', 'huangweiyi', '2018-05-24 17:21:01', '180.167.77.138');
INSERT INTO `ly_userlogin` VALUES ('1358', '59', 'huangbian', '2018-05-24 17:21:23', '112.65.48.99');

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(20) DEFAULT NULL COMMENT '健值',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('1', 'count', '10', '2018-01-29 11:01:26', '0');
INSERT INTO `parameter` VALUES ('2', 'priorityCount', '2', '2018-01-29 11:02:10', '0');

-- ----------------------------
-- Table structure for validate_email
-- ----------------------------
DROP TABLE IF EXISTS `validate_email`;
CREATE TABLE `validate_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0' COMMENT '是否已经使用过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of validate_email
-- ----------------------------
INSERT INTO `validate_email` VALUES ('81', '63', 'xiebowen', '谢博文', '923739', '2018-05-23 17:02:30', '1');
INSERT INTO `validate_email` VALUES ('82', '58', 'zhaojiaqi', '赵佳祺', '608099', '2018-05-23 17:48:03', '1');

-- ----------------------------
-- View structure for role_info
-- ----------------------------
DROP VIEW IF EXISTS `role_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`temproot`@`%` SQL SECURITY DEFINER VIEW `role_info` AS select `r`.`id` AS `roleId`,`r`.`name` AS `roleName`,`g`.`id` AS `groupId`,`g`.`groupName` AS `groupName` from ((`ly_role` `r` join `ly_group_role` `gr` on((`r`.`id` = `gr`.`roleId`))) join `ly_group` `g` on((`gr`.`groupId` = `g`.`id`))) ;

-- ----------------------------
-- View structure for user_info
-- ----------------------------
DROP VIEW IF EXISTS `user_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`temproot`@`%` SQL SECURITY DEFINER VIEW `user_info` AS select `u`.`id` AS `userId`,`u`.`userName` AS `userName`,`u`.`accountName` AS `accountName`,`u`.`deletestatus` AS `deletestatus`,`u`.`description` AS `userDescription`,`r`.`id` AS `roleId`,`r`.`name` AS `roleName`,`r`.`level` AS `level`,`r`.`state` AS `state`,`g`.`id` AS `groupId`,`g`.`groupName` AS `groupName`,`u`.`email` AS `email` from (((((`ly_group_role` `gr` join `ly_role` `r` on((`r`.`id` = `gr`.`roleId`))) join `ly_group` `g` on((`g`.`id` = `gr`.`groupId`))) join `ly_user_role` `ur` on((`ur`.`roleId` = `r`.`id`))) join `ly_user` `u` on((`u`.`id` = `ur`.`userId`))) join `ly_group_user` `gu` on(((`gu`.`groupId` = `g`.`id`) and (`gu`.`userId` = `u`.`id`)))) order by `u`.`id` ;
