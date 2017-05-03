/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : tp

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2017-04-27 18:03:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_chargecard`
-- ----------------------------
DROP TABLE IF EXISTS `tb_chargecard`;
CREATE TABLE `tb_chargecard` (
  `cid` int(11) NOT NULL auto_increment,
  `cType` varchar(20) NOT NULL COMMENT '充值卡类型',
  `cValue` decimal(8,2) NOT NULL COMMENT '充值卡金额',
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chargecard
-- ----------------------------
INSERT INTO `tb_chargecard` VALUES ('11', '铜卡', '500.00');
INSERT INTO `tb_chargecard` VALUES ('12', '银卡', '5000.00');
INSERT INTO `tb_chargecard` VALUES ('13', '金卡', '3000.00');
INSERT INTO `tb_chargecard` VALUES ('14', '钻石卡', '5000.00');

-- ----------------------------
-- Table structure for `tb_chargereward`
-- ----------------------------
DROP TABLE IF EXISTS `tb_chargereward`;
CREATE TABLE `tb_chargereward` (
  `crid` int(11) NOT NULL auto_increment,
  `vtid` int(3) default NULL,
  `chargeMoney` decimal(8,2) default '100.00',
  `rewardMoney` decimal(8,2) default NULL,
  PRIMARY KEY  (`crid`),
  KEY `vtid` (`vtid`),
  CONSTRAINT `tb_chargereward_ibfk_1` FOREIGN KEY (`vtid`) REFERENCES `tb_vipcardtype` (`vtid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chargereward
-- ----------------------------
INSERT INTO `tb_chargereward` VALUES ('2', '2', '100.00', '10.00');
INSERT INTO `tb_chargereward` VALUES ('3', '3', '100.00', '15.00');
INSERT INTO `tb_chargereward` VALUES ('4', '4', '100.00', '20.00');
INSERT INTO `tb_chargereward` VALUES ('5', '1', '50.00', '1.00');
INSERT INTO `tb_chargereward` VALUES ('6', '1', '100.00', '10.00');

-- ----------------------------
-- Table structure for `tb_job`
-- ----------------------------
DROP TABLE IF EXISTS `tb_job`;
CREATE TABLE `tb_job` (
  `jid` int(11) NOT NULL auto_increment,
  `jName` varchar(30) NOT NULL,
  PRIMARY KEY  (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_job
-- ----------------------------
INSERT INTO `tb_job` VALUES ('1', '管理员');
INSERT INTO `tb_job` VALUES ('2', '会员');

-- ----------------------------
-- Table structure for `tb_jobmenu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_jobmenu`;
CREATE TABLE `tb_jobmenu` (
  `jmid` int(11) NOT NULL auto_increment,
  `jid` int(2) default NULL,
  `mid` int(2) default NULL,
  PRIMARY KEY  (`jmid`),
  KEY `jid` (`jid`),
  KEY `mid` (`mid`),
  CONSTRAINT `tb_jobmenu_ibfk_1` FOREIGN KEY (`jid`) REFERENCES `tb_job` (`jid`),
  CONSTRAINT `tb_jobmenu_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `tb_menu` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_jobmenu
-- ----------------------------
INSERT INTO `tb_jobmenu` VALUES ('41', '1', '2');
INSERT INTO `tb_jobmenu` VALUES ('42', '1', '3');
INSERT INTO `tb_jobmenu` VALUES ('43', '1', '4');
INSERT INTO `tb_jobmenu` VALUES ('44', '1', '23');
INSERT INTO `tb_jobmenu` VALUES ('45', '1', '24');
INSERT INTO `tb_jobmenu` VALUES ('46', '1', '25');
INSERT INTO `tb_jobmenu` VALUES ('47', '1', '26');
INSERT INTO `tb_jobmenu` VALUES ('48', '1', '27');
INSERT INTO `tb_jobmenu` VALUES ('49', '1', '28');
INSERT INTO `tb_jobmenu` VALUES ('50', '1', '29');
INSERT INTO `tb_jobmenu` VALUES ('51', '1', '30');
INSERT INTO `tb_jobmenu` VALUES ('52', '1', '31');
INSERT INTO `tb_jobmenu` VALUES ('53', '1', '32');
INSERT INTO `tb_jobmenu` VALUES ('54', '1', '33');
INSERT INTO `tb_jobmenu` VALUES ('55', '1', '34');
INSERT INTO `tb_jobmenu` VALUES ('56', '1', '35');
INSERT INTO `tb_jobmenu` VALUES ('57', '1', '36');
INSERT INTO `tb_jobmenu` VALUES ('58', '1', '37');
INSERT INTO `tb_jobmenu` VALUES ('59', '1', '38');
INSERT INTO `tb_jobmenu` VALUES ('60', '1', '39');
INSERT INTO `tb_jobmenu` VALUES ('61', '1', '40');
INSERT INTO `tb_jobmenu` VALUES ('62', '2', '23');
INSERT INTO `tb_jobmenu` VALUES ('63', '2', '24');
INSERT INTO `tb_jobmenu` VALUES ('64', '2', '25');
INSERT INTO `tb_jobmenu` VALUES ('65', '2', '26');
INSERT INTO `tb_jobmenu` VALUES ('66', '2', '27');
INSERT INTO `tb_jobmenu` VALUES ('67', '2', '40');
INSERT INTO `tb_jobmenu` VALUES ('68', '1', '41');

-- ----------------------------
-- Table structure for `tb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `mid` int(11) NOT NULL auto_increment,
  `mName` varchar(20) NOT NULL,
  `url` varchar(100) default NULL,
  `parentid` int(10) default NULL,
  `isshow` int(2) default NULL,
  `level` int(2) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '系统菜单', '', '-1', '1', '1');
INSERT INTO `tb_menu` VALUES ('2', '权限管理', '', '1', '1', '2');
INSERT INTO `tb_menu` VALUES ('3', '菜单列表', 'http://localhost:8080/tp/Application/Home/View/menuList.php', '2', '1', '3');
INSERT INTO `tb_menu` VALUES ('4', '职位列表', 'http://localhost:8080/tp/Application/Home/View/jobList.php', '2', '1', '3');
INSERT INTO `tb_menu` VALUES ('23', '个人中心', '', '1', '1', '2');
INSERT INTO `tb_menu` VALUES ('24', '修改个人资料', 'http://localhost:8080/tp/Application/Home/View/editUser.php', '23', '1', '3');
INSERT INTO `tb_menu` VALUES ('25', '查询个人信息', 'http://localhost:8080/tp/Application/Home/View/queryUserInfo.php', '23', '1', '3');
INSERT INTO `tb_menu` VALUES ('26', '个人账户充值', 'http://localhost:8080/tp/Application/Home/View/chargeUserCount.php', '23', '1', '3');
INSERT INTO `tb_menu` VALUES ('27', '查询个人积分', 'http://localhost:8080/tp/Application/Home/View/queryUserPoint.php', '23', '1', '3');
INSERT INTO `tb_menu` VALUES ('28', '报表管理', '', '1', '1', '2');
INSERT INTO `tb_menu` VALUES ('29', '会员卡报表管理', 'http://localhost:8080/tp/Application/Home/View/vipCardFormManage.php', '28', '1', '3');
INSERT INTO `tb_menu` VALUES ('30', '会员信息报表管理', 'http://localhost:8080/tp/Application/Home/View/userInfoFormManage.php', '28', '1', '3');
INSERT INTO `tb_menu` VALUES ('31', '用户管理', '', '1', '1', '2');
INSERT INTO `tb_menu` VALUES ('32', '用户列表', 'http://localhost:8080/tp/Application/Home/View/queryAllUserInfo.php', '31', '1', '3');
INSERT INTO `tb_menu` VALUES ('33', '注销用户', 'http://localhost:8080/tp/Application/Home/View/logoutUser.php', '31', '1', '3');
INSERT INTO `tb_menu` VALUES ('34', '类型管理', '', '1', '1', '2');
INSERT INTO `tb_menu` VALUES ('35', '设定充值卡类型', 'http://localhost:8080/tp/Application/Home/View/editChargeCardGrade.php', '34', '1', '3');
INSERT INTO `tb_menu` VALUES ('36', '设定会员类型', 'http://localhost:8080/tp/Application/Home/View/editVipCardGrade.php', '34', '1', '3');
INSERT INTO `tb_menu` VALUES ('37', '优惠管理', '', '1', '1', '2');
INSERT INTO `tb_menu` VALUES ('38', '设定充值奖励', 'http://localhost:8080/tp/Application/Home/View/chargeDiscountManage.php', '37', '1', '3');
INSERT INTO `tb_menu` VALUES ('39', '设定消费奖励', 'http://localhost:8080/tp/Application/Home/View/expenseDiscountManage.php', '37', '1', '3');
INSERT INTO `tb_menu` VALUES ('40', '消费结算', 'http://localhost:8080/tp/Application/Home/View/userCheckOut.php', '31', '1', '3');
INSERT INTO `tb_menu` VALUES ('41', '用户列表2', 'http://localhost:8080/tp/index.php/Home/User/loadUserListByPage', '31', '1', '3');

-- ----------------------------
-- Table structure for `tb_shoppingreward`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shoppingreward`;
CREATE TABLE `tb_shoppingreward` (
  `srid` int(11) NOT NULL auto_increment,
  `vtid` int(3) default NULL,
  `shoppingMoney` decimal(8,2) default '100.00',
  `rewardPoint` int(11) default NULL,
  PRIMARY KEY  (`srid`),
  KEY `vtid` (`vtid`),
  CONSTRAINT `tb_shoppingreward_ibfk_1` FOREIGN KEY (`vtid`) REFERENCES `tb_vipcardtype` (`vtid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shoppingreward
-- ----------------------------
INSERT INTO `tb_shoppingreward` VALUES ('1', '1', '100.00', '50');
INSERT INTO `tb_shoppingreward` VALUES ('2', '2', '100.00', '60');
INSERT INTO `tb_shoppingreward` VALUES ('3', '3', '100.00', '80');
INSERT INTO `tb_shoppingreward` VALUES ('4', '4', '100.00', '100');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `uid` int(11) NOT NULL auto_increment,
  `uName` varchar(20) NOT NULL,
  `uPass` varchar(20) NOT NULL,
  `uTrueName` varchar(20) NOT NULL,
  `uSex` varchar(4) NOT NULL,
  `uAddress` varchar(50) NOT NULL,
  `uPhone` varchar(20) NOT NULL,
  `uEmail` varchar(50) default NULL,
  `uCreditCardNo` varchar(50) NOT NULL,
  `uAccount` decimal(10,2) default '0.00',
  `uPoint` int(11) default '0',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin1', '1', '唐云', '男', '重庆市洪崖洞', '15683776777', '495789532@qq.com', '0000000000000', '0.00', '0');
INSERT INTO `tb_user` VALUES ('2', 'aaaazm', '123123', '赵敏', '女', '重庆市解放碑', '15683776778', '495789532@qq.com', '8888888888888889', '0.00', '0');
INSERT INTO `tb_user` VALUES ('3', 'aaaazg', '123123', '赵高', '男', '重庆市两路口', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('4', 'bbbgxq', '123123', '高小琴', '女', '重庆市较场口', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('5', 'bbbgyl', '123123', '高育良', '男', '重庆市岔路口', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('6', 'bbbbcd', '123123', '程度', '男', '重庆市鱼洞', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('7', 'cccgxf', '123123', '高小凤', '女', '重庆市土桥', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('8', 'ccclhh', '123123', '林华华', '女', '重庆市南坪', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('9', 'cccgxa', '123123', '高小爱', '女', '重庆市花溪', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('10', 'dddsrj', '123123', '沙瑞金', '男', '重庆市两路', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('11', 'aaazdh', '123123', '赵德汉', '男', '重庆市中兴路', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');
INSERT INTO `tb_user` VALUES ('12', 'ddddtq', '123123', '唐强', '男', '重庆市大山村', '15683776778', '495789532@qq.com', '8888888888888888', '0.00', '0');

-- ----------------------------
-- Table structure for `tb_userjob`
-- ----------------------------
DROP TABLE IF EXISTS `tb_userjob`;
CREATE TABLE `tb_userjob` (
  `ujid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `jid` int(11) default NULL,
  PRIMARY KEY  (`ujid`),
  KEY `uid` (`uid`),
  KEY `jid` (`jid`),
  CONSTRAINT `tb_userjob_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`),
  CONSTRAINT `tb_userjob_ibfk_2` FOREIGN KEY (`jid`) REFERENCES `tb_job` (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_userjob
-- ----------------------------
INSERT INTO `tb_userjob` VALUES ('46', '1', '1');
INSERT INTO `tb_userjob` VALUES ('90', '2', '2');
INSERT INTO `tb_userjob` VALUES ('91', '3', '2');
INSERT INTO `tb_userjob` VALUES ('92', '4', '2');
INSERT INTO `tb_userjob` VALUES ('93', '5', '2');
INSERT INTO `tb_userjob` VALUES ('94', '6', '2');
INSERT INTO `tb_userjob` VALUES ('95', '7', '2');
INSERT INTO `tb_userjob` VALUES ('96', '8', '2');
INSERT INTO `tb_userjob` VALUES ('97', '9', '2');
INSERT INTO `tb_userjob` VALUES ('98', '10', '2');
INSERT INTO `tb_userjob` VALUES ('99', '11', '2');
INSERT INTO `tb_userjob` VALUES ('100', '12', '2');

-- ----------------------------
-- Table structure for `tb_vipcard`
-- ----------------------------
DROP TABLE IF EXISTS `tb_vipcard`;
CREATE TABLE `tb_vipcard` (
  `vid` int(11) NOT NULL auto_increment,
  `vNo` int(11) NOT NULL,
  `issueDate` datetime default NULL,
  `validDate` datetime default NULL,
  `vtid` int(11) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`vid`),
  KEY `vtid` (`vtid`),
  KEY `uid` (`uid`),
  CONSTRAINT `tb_vipcard_ibfk_1` FOREIGN KEY (`vtid`) REFERENCES `tb_vipcardtype` (`vtid`),
  CONSTRAINT `tb_vipcard_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_vipcard
-- ----------------------------
INSERT INTO `tb_vipcard` VALUES ('1', '8000001', '2017-04-03 00:00:00', '2018-04-03 00:00:00', '1', '2');
INSERT INTO `tb_vipcard` VALUES ('2', '8000002', '2017-03-03 00:00:00', '2018-03-03 00:00:00', '1', '3');
INSERT INTO `tb_vipcard` VALUES ('3', '8000003', '2017-02-03 00:00:00', '2018-02-03 00:00:00', '1', '4');
INSERT INTO `tb_vipcard` VALUES ('4', '8000004', '2017-01-03 00:00:00', '2018-01-03 00:00:00', '1', '5');
INSERT INTO `tb_vipcard` VALUES ('5', '8000005', '2016-12-03 00:00:00', '2017-12-03 00:00:00', '1', '6');
INSERT INTO `tb_vipcard` VALUES ('6', '8000006', '2016-11-03 00:00:00', '2017-11-03 00:00:00', '1', '7');
INSERT INTO `tb_vipcard` VALUES ('7', '8000007', '2016-10-03 00:00:00', '2017-10-03 00:00:00', '1', '8');
INSERT INTO `tb_vipcard` VALUES ('8', '8000008', '2016-09-03 00:00:00', '2017-09-03 00:00:00', '1', '9');
INSERT INTO `tb_vipcard` VALUES ('9', '8000009', '2016-08-03 00:00:00', '2017-08-03 00:00:00', '1', '10');
INSERT INTO `tb_vipcard` VALUES ('10', '8000010', '2016-08-09 00:00:00', '2017-08-09 00:00:00', '1', '11');
INSERT INTO `tb_vipcard` VALUES ('11', '8000011', '2016-07-03 00:00:00', '2017-07-03 00:00:00', '1', '12');
INSERT INTO `tb_vipcard` VALUES ('13', '8000000', '2016-06-06 00:00:00', '2018-06-06 00:00:00', '1', '1');

-- ----------------------------
-- Table structure for `tb_vipcardtype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_vipcardtype`;
CREATE TABLE `tb_vipcardtype` (
  `vtid` int(11) NOT NULL auto_increment,
  `vtName` varchar(20) NOT NULL,
  `vtPoint` int(11) NOT NULL COMMENT '等级积分为等级的平方乘以500',
  PRIMARY KEY  (`vtid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_vipcardtype
-- ----------------------------
INSERT INTO `tb_vipcardtype` VALUES ('1', '临时卡', '200');
INSERT INTO `tb_vipcardtype` VALUES ('2', '白银卡', '500');
INSERT INTO `tb_vipcardtype` VALUES ('3', '黄金卡', '2000');
INSERT INTO `tb_vipcardtype` VALUES ('4', '钻石卡', '4500');
