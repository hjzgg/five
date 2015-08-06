/*
Navicat MySQL Data Transfer

Source Server         : hrh
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : five

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-05-20 13:12:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `consignee`
-- ----------------------------
DROP TABLE IF EXISTS `consignee`;
CREATE TABLE `consignee` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `cname` varchar(10) NOT NULL,
  `caddr` varchar(50) NOT NULL,
  `ctel` varchar(20) NOT NULL,
  `cpostcode` varchar(10) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_consigneewuser` (`uid`),
  CONSTRAINT `FK_consigneewuser` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consignee
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `gname` varchar(10) NOT NULL,
  `gtype` int(11) NOT NULL,
  `gkindcode` int(11) NOT NULL,
  `gprice` varchar(10) NOT NULL,
  `ghot` int(11) NOT NULL,
  `gsales` int(11) NOT NULL,
  `gtime` varchar(50) NOT NULL,
  `gimg` varchar(100) NOT NULL,
  `gnum` varchar(10) NOT NULL,
  `gcount` varchar(10) DEFAULT NULL,
  `gdetail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `FK_goodswshopping` (`mid`),
  CONSTRAINT `FK_goodswshopping` FOREIGN KEY (`mid`) REFERENCES `merchant` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '765', '4', '1', '765', '0', '0', 'Mon May 18 15:14:49 CST 2015', '/five/fiveImages/1.jpg', '765', '100', '7567657');
INSERT INTO `goods` VALUES ('2', '1', '344', '3', '1', '432', '0', '0', 'Mon May 18 16:30:36 CST 2015', '/five/fiveImages/2.jpg', '432', '100', 'rewfsd');
INSERT INTO `goods` VALUES ('3', '1', 'dfsd', '3', '1', '432', '0', '0', 'Mon May 18 16:31:10 CST 2015', '/five/fiveImages/1.jpg', '4334', '100', 'rewfsd');
INSERT INTO `goods` VALUES ('4', '1', 'dfsdxx', '3', '1', '432', '0', '0', 'Mon May 18 16:31:25 CST 2015', '/five/fiveImages/3.jpg', '4334', '100', 'rewfsd');
INSERT INTO `goods` VALUES ('5', '1', 'dfsdxxfdf', '2', '1', '432', '0', '0', 'Mon May 18 16:57:57 CST 2015', '/five/fiveImages/1431939477140.jpg', '4334', '100', 'rewfsd');
INSERT INTO `goods` VALUES ('6', '1', '我与世界只差一个你', '5', '3', '20', '0', '0', 'Mon May 18 17:14:44 CST 2015', '/five/fiveImages/1431940484281.jpg', '2700', '100', '张皓宸');
INSERT INTO `goods` VALUES ('7', '1', '手链', '2', '1', '20', '0', '0', 'Mon May 18 17:15:21 CST 2015', '/five/fiveImages/1431940521781.jpg', '2700', '100', '手链');
INSERT INTO `goods` VALUES ('8', '1', 'hnjjj', '1', '2', '20', '0', '0', 'Mon May 18 17:16:15 CST 2015', '/five/fiveImages/1431940575250.jpg', '2700', '100', 'ddsffs');
INSERT INTO `goods` VALUES ('9', '1', 'dfre', '2', '1', '20', '0', '0', 'Mon May 18 17:16:29 CST 2015', '/five/fiveImages/1431940589750.jpg', '4455', '100', 'eeee');
INSERT INTO `goods` VALUES ('10', '1', 'ghdfgh', '3', '1', '52', '0', '0', 'Mon May 18 17:16:47 CST 2015', '/five/fiveImages/1431940607390.jpg', '444', '100', 'egkjhjk');
INSERT INTO `goods` VALUES ('11', '1', 'gdhuftu', '3', '1', '52', '0', '0', 'Mon May 18 17:17:10 CST 2015', '/five/fiveImages/1431940630531.jpg', '545', '100', 'retetet');
INSERT INTO `goods` VALUES ('12', '1', 'yrtyr', '3', '1', '52', '0', '0', 'Mon May 18 17:17:23 CST 2015', '/five/fiveImages/1431940643718.jpg', '5454', '100', 'rtewt');
INSERT INTO `goods` VALUES ('13', '1', 'aaerer', '3', '1', '5', '0', '0', 'Mon May 18 17:17:42 CST 2015', '/five/fiveImages/1431940662984.jpg', '4564', '100', 'fgujhd');
INSERT INTO `goods` VALUES ('14', '1', 'fvghf', '3', '1', '55', '0', '0', 'Mon May 18 17:18:00 CST 2015', '/five/fiveImages/1431940680062.jpg', '88', '100', 'fgkgk');
INSERT INTO `goods` VALUES ('15', '1', 'jhggfjh', '3', '1', '55', '0', '0', 'Mon May 18 17:18:17 CST 2015', '/five/fiveImages/1431940697203.jpg', '555', '100', 'ertewtewt');
INSERT INTO `goods` VALUES ('16', '1', 'food', '3', '1', '10', '0', '0', 'Mon May 18 17:18:36 CST 2015', '/five/fiveImages/1431940716421.jpg', '100', '100', 'fgdfgfsdfg');
INSERT INTO `goods` VALUES ('17', '1', 'food7', '3', '1', '10', '0', '0', 'Mon May 18 17:18:52 CST 2015', '/five/fiveImages/1431940732625.jpg', '200', '100', 'fghgdfjjk');
INSERT INTO `goods` VALUES ('18', '1', 'food4', '3', '1', '12', '0', '0', 'Mon May 18 17:19:10 CST 2015', '/five/fiveImages/1431940750515.jpg', '5555', '10', 'fdgdfgfdg');
INSERT INTO `goods` VALUES ('19', '1', 'food2', '3', '2', '15', '0', '0', 'Mon May 18 17:19:29 CST 2015', '/five/fiveImages/1431940769640.jpg', '1234', '100', 'gfhfhd');
INSERT INTO `goods` VALUES ('20', '1', 'food8', '3', '3', '52', '0', '0', 'Mon May 18 17:19:50 CST 2015', '/five/fiveImages/1431940790062.jpg', '7885', '100', 'dfghfdghfs');
INSERT INTO `goods` VALUES ('21', '1', 'cloth54', '1', '1', '100', '0', '0', 'Mon May 18 17:20:14 CST 2015', '/five/fiveImages/1431940814875.jpg', '453', '100', 'vcbcxvb');
INSERT INTO `goods` VALUES ('22', '1', 'cgbxf', '4', '1', '4500', '0', '0', 'Mon May 18 17:20:32 CST 2015', '/five/fiveImages/1431940832343.jpg', '50', '100', 'cgsdfgdg');
INSERT INTO `goods` VALUES ('23', '1', 'cbxcvb', '6', '1', '45', '0', '0', 'Mon May 18 17:20:50 CST 2015', '/five/fiveImages/1431940850203.jpg', '45', '100', 'nbmn');
INSERT INTO `goods` VALUES ('24', '1', 'ghujd', '4', '3', '85221', '0', '0', 'Mon May 18 17:21:13 CST 2015', '/five/fiveImages/1431940873250.jpg', '54547', '100', 'bnvcnvbn');
INSERT INTO `goods` VALUES ('25', '1', 'dfgfdsg', '3', '4', '45', '0', '0', 'Mon May 18 17:21:30 CST 2015', '/five/fiveImages/1431940890593.jpg', '89', '100', 'xvcbcvbn');

-- ----------------------------
-- Table structure for `merchant`
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(20) NOT NULL,
  `mtel` varchar(20) NOT NULL,
  `matype` int(11) NOT NULL,
  `maddr` varchar(50) NOT NULL,
  `mimg` varchar(100) NOT NULL,
  `mdetail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES ('1', 'hjzgg', '132', '132', '123', '123', '13');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `otime` varchar(20) NOT NULL,
  `ostatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_orderswconsignee` (`cid`),
  CONSTRAINT `FK_orderswconsignee` FOREIGN KEY (`cid`) REFERENCES `consignee` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `remark`
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `rcon` varchar(100) NOT NULL,
  `rtime` varchar(20) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `FK_remarkwgoods` (`gid`),
  KEY `FK_remarkwuser` (`uid`),
  CONSTRAINT `FK_remarkwgoods` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `FK_remarkwuser` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remark
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping`
-- ----------------------------
DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `snum` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `FK_shoppingwgoods` (`gid`),
  KEY `FK_shoppingworders` (`oid`),
  CONSTRAINT `FK_shoppingwgoods` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `FK_shoppingworders` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `birth` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'hjzgg', '123', null, null, null);
