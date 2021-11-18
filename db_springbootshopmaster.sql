
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activityId` int NOT NULL AUTO_INCREMENT,
  `activityName` varchar(50) NOT NULL,
  `activityDes` varchar(500) NOT NULL,
  `discount` float DEFAULT '1',
  `fullPrice` int DEFAULT NULL,
  `reducePrice` int DEFAULT NULL,
  `fullNum` int DEFAULT NULL,
  `reduceNum` int DEFAULT NULL,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '测试活动', '1231', '1', '123', '123', '1231', '12');
INSERT INTO `activity` VALUES ('2', '开业大酬宾', '开业大酬宾，全场9折。', '9.2', '100', '8', '200', '20');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressID` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `detailAddr` varchar(50) NOT NULL,
  `conName` varchar(50) NOT NULL,
  `conTel` varchar(50) NOT NULL,
  PRIMARY KEY (`addressID`),
  KEY `addressID` (`addressID`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('7', '1', '北京市', '北京市市辖区', '东城区', '12312', '123123', '2131231321');
INSERT INTO `address` VALUES ('8', '3', '河南省', '郑州市', '金水区', '郑州航空工业管理学院', '申长鑫', '18338985721');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '25d55ad283aa400af464c76d713c07ad');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateId` int NOT NULL AUTO_INCREMENT,
  `cateName` varchar(50) NOT NULL,
  PRIMARY KEY (`cateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

INSERT INTO `category` VALUES ('3', '家电');


-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `userId` int NOT NULL,
  `goodsId` int NOT NULL,
  `collectTime` datetime NOT NULL,
  PRIMARY KEY (`userId`,`goodsId`),
  KEY `collection_ibfk_2` (`goodsId`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('3', '93', '2019-05-13 10:47:26');
INSERT INTO `collection` VALUES ('3', '94', '2019-05-13 10:16:11');
INSERT INTO `collection` VALUES ('3', '95', '2019-05-13 10:37:35');
INSERT INTO `collection` VALUES ('3', '97', '2019-05-13 10:23:11');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `goodsId` int NOT NULL,
  `point` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '3', '93', '4', '商品特别好，我非常喜欢', '2019-05-13 10:48:51');

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `deliverId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `sendId` int NOT NULL,
  PRIMARY KEY (`deliverId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliver
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsId` int NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `num` int NOT NULL,
  `upTime` datetime NOT NULL,
  `category` int NOT NULL,
  `detailCate` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `activityId` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodsId`),
  KEY `activityId` (`activityId`),
  KEY `category` (`category`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`cateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('93', '豪华麻将桌', '10', '29', '2019-05-10 19:43:04', '1', '麻将桌', '全自动麻将桌', '1');
INSERT INTO `goods` VALUES ('94', '豪华麻将桌', '23', '34', '2019-05-10 19:44:28', '2', '麻将桌', '全自动麻将桌', '1');
INSERT INTO `goods` VALUES ('95', '豪华麻将桌', '123', '1231', '2019-05-11 11:41:24', '1', '麻将桌', '全自动麻将桌', '1');
INSERT INTO `goods` VALUES ('96', '豪华麻将桌', '213', '222', '2019-05-11 11:42:00', '1', '麻将桌', '全自动麻将桌', '1');
INSERT INTO `goods` VALUES ('97', '豪华麻将桌', '213', '212', '2019-05-13 10:22:58', '1', '麻将桌', '全自动麻将桌', '1');
INSERT INTO `goods` VALUES ('98', '豪华麻将桌', '10', '100', '2021-07-24 11:50:07', '1', '麻将桌', '全自动麻将桌', '1');
INSERT INTO `goods` VALUES ('99', '豪华麻将桌', '1231', '1231', '2021-07-24 11:51:20', '1', '麻将桌', '全自动麻将桌', '1');

-- ----------------------------
-- Table structure for imagepath
-- ----------------------------
DROP TABLE IF EXISTS `imagepath`;
CREATE TABLE `imagepath` (
  `pathId` int NOT NULL AUTO_INCREMENT,
  `goodId` int NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `goodid` (`goodId`),
  CONSTRAINT `imagepath_ibfk_1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagepath
-- ----------------------------
INSERT INTO `imagepath` VALUES ('114', '93', '../image/img01.png');
INSERT INTO `imagepath` VALUES ('115', '93', '../image/img02.png');
INSERT INTO `imagepath` VALUES ('116', '94', '../image/img03.png');
INSERT INTO `imagepath` VALUES ('117', '95', '../image/img04.png');
INSERT INTO `imagepath` VALUES ('118', '96', '../image/img05.png');
INSERT INTO `imagepath` VALUES ('119', '96', '../image/img06.png');
INSERT INTO `imagepath` VALUES ('120', '96', '../image/img08.png');
INSERT INTO `imagepath` VALUES ('121', '97', '../image/img09.png');
INSERT INTO `imagepath` VALUES ('122', '97', '../image/img10.png');
INSERT INTO `imagepath` VALUES ('123', '97', '../image/img01.png');
INSERT INTO `imagepath` VALUES ('124', '97', '../image/img02.png');
INSERT INTO `imagepath` VALUES ('125', '97', '../image/img03.png');
INSERT INTO `imagepath` VALUES ('126', '97', '../image/img04.png');
INSERT INTO `imagepath` VALUES ('127', '97', '../image/img05.png');
INSERT INTO `imagepath` VALUES ('128', '97', '../image/img06.png');
INSERT INTO `imagepath` VALUES ('129', '98', '../image/img01.png');
INSERT INTO `imagepath` VALUES ('130', '99', '../image/img08.png');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `orderTime` datetime NOT NULL,
  `oldPrice` float NOT NULL,
  `newPrice` float NOT NULL,
  `isPay` tinyint(1) NOT NULL,
  `isSend` tinyint(1) NOT NULL,
  `isReceive` tinyint(1) NOT NULL,
  `isComplete` tinyint(1) NOT NULL,
  `addressId` int NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `orderGoods` (`orderTime`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('28', '3', '2019-05-11 11:33:10', '10', '10', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('29', '3', '2019-05-11 11:39:39', '125', '125', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('30', '3', '2019-05-13 10:16:19', '109', '109', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('31', '3', '2019-05-13 10:37:59', '10', '10', '0', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('32', '3', '2019-05-13 10:43:05', '10', '10', '1', '1', '0', '0', '8');
INSERT INTO `indent` VALUES ('33', '3', '2019-05-13 10:47:42', '40', '40', '1', '1', '1', '1', '8');
INSERT INTO `indent` VALUES ('34', '3', '2021-07-24 12:02:01', '40', '40', '1', '1', '0', '0', '8');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `goodsId` int NOT NULL,
  `num` int NOT NULL,
  PRIMARY KEY (`itemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `indent` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('14', '28', '93', '1');
INSERT INTO `orderitem` VALUES ('15', '29', '93', '1');
INSERT INTO `orderitem` VALUES ('16', '29', '94', '5');
INSERT INTO `orderitem` VALUES ('17', '30', '93', '4');
INSERT INTO `orderitem` VALUES ('18', '30', '94', '3');
INSERT INTO `orderitem` VALUES ('19', '31', '93', '1');
INSERT INTO `orderitem` VALUES ('20', '32', '93', '1');
INSERT INTO `orderitem` VALUES ('21', '33', '93', '4');
INSERT INTO `orderitem` VALUES ('22', '34', '98', '4');

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `userId` int NOT NULL,
  `goodsid` int NOT NULL,
  `cateDate` datetime NOT NULL,
  `goodsNum` int NOT NULL,
  PRIMARY KEY (`userId`,`goodsid`),
  KEY `userId` (`userId`),
  KEY `goodsid` (`goodsid`),
  CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `regTime` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'scx', '25d55ad283aa400af464c76d713c07ad', '2019-04-18 17:16:34', '282578874@qq.com', '18338985721');
INSERT INTO `user` VALUES ('2', 'shenchangxin', '25d55ad283aa400af464c76d713c07ad', '2019-04-22 15:29:12', '282578874@qq.com', '18338985721');
INSERT INTO `user` VALUES ('3', 'admin', '25d55ad283aa400af464c76d713c07ad', '2019-05-16 10:46:46', '123123', '1231321');
SET FOREIGN_KEY_CHECKS=1;
