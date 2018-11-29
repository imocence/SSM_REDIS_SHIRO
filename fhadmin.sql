/*
Navicat MySQL Data Transfer

Source Server         : 213
Source Server Version : 50537
Source Host           : 192.168.1.213:3306
Source Database       : fhadmin

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2018-11-29 17:17:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for db_fhdb
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_fhdb
-- ----------------------------

-- ----------------------------
-- Table structure for db_timingbackup
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', '2', '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', '2', '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for im_message
-- ----------------------------
DROP TABLE IF EXISTS `im_message`;
CREATE TABLE `im_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sender_id` varchar(40) NOT NULL COMMENT '发送人id',
  `target_id` varchar(40) NOT NULL COMMENT '接收人id',
  `object_name` varchar(20) NOT NULL COMMENT '消息类型( 1:文本信息；2:图片消息；3:图文消息；4:语音消息)',
  `content` text NOT NULL COMMENT '消息内容 json形式',
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '是否屏蔽',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of im_message
-- ----------------------------

-- ----------------------------
-- Table structure for im_user_token
-- ----------------------------
DROP TABLE IF EXISTS `im_user_token`;
CREATE TABLE `im_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) NOT NULL COMMENT '各个产品的USER_ID',
  `token` text NOT NULL COMMENT '每个USER对应的TOKEN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of im_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for oa_datajur
-- ----------------------------
DROP TABLE IF EXISTS `oa_datajur`;
CREATE TABLE `oa_datajur` (
  `DATAJUR_ID` varchar(100) NOT NULL,
  `DEPARTMENT_IDS` varchar(5000) DEFAULT NULL COMMENT '部门ID组合',
  `STAFF_ID` varchar(100) DEFAULT NULL COMMENT '员工ID',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DATAJUR_ID`),
  KEY `FSTAFF` (`STAFF_ID`),
  CONSTRAINT `FSTAFF` FOREIGN KEY (`STAFF_ID`) REFERENCES `oa_staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_datajur
-- ----------------------------
INSERT INTO `oa_datajur` VALUES ('9fd17463ffd7487ab90e683c76026655', '(\'cbbc84eddde947ba8af7d509e430eb70\',\'8f8b045470f342fdbc4c312ab881d62b\',\'83a25761c618457cae2fa1211bd8696d\',\'a0982dea52554225ab682cd4b421de47\',\'ft\')', '9fd17463ffd7487ab90e683c76026655', '5cccdb7c432449d8b853c52880058140');
INSERT INTO `oa_datajur` VALUES ('c9f05f925dfc485b9e352916612ab669', '(\'a0982dea52554225ab682cd4b421de47\',\'ft\')', 'c9f05f925dfc485b9e352916612ab669', '8f8b045470f342fdbc4c312ab881d62b');

-- ----------------------------
-- Table structure for oa_department
-- ----------------------------
DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department` (
  `DEPARTMENT_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `HEADMAN` varchar(30) DEFAULT NULL COMMENT '负责人',
  `TEL` varchar(50) DEFAULT NULL COMMENT '电话',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '部门职能',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_department
-- ----------------------------
INSERT INTO `oa_department` VALUES ('0956d8c279274fca92f4091f2a69a9ad', '销售会计', 'xiaokuai', '05896', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('3e7227e11dc14b4d9e863dd1a1fcedf6', '成本会计', 'chengb', '03656', 'd41af567914a409893d011aa53eda797', '', '', '', '', '');
INSERT INTO `oa_department` VALUES ('5cccdb7c432449d8b853c52880058140', 'B公司', 'b', '002', '0', '冶铁', '李四', '112', '冶铁', '河北');
INSERT INTO `oa_department` VALUES ('83a25761c618457cae2fa1211bd8696d', '销售B组', 'xiaob', '002365', 'cbbc84eddde947ba8af7d509e430eb70', '', '李四', '', '', '');
INSERT INTO `oa_department` VALUES ('8f8b045470f342fdbc4c312ab881d62b', '销售A组', 'xiaoA', '0326', 'cbbc84eddde947ba8af7d509e430eb70', '', '张三', '0201212', '', '');
INSERT INTO `oa_department` VALUES ('a0982dea52554225ab682cd4b421de47', '1队', 'yidui', '02563', '8f8b045470f342fdbc4c312ab881d62b', '', '小王', '12356989', '', '');
INSERT INTO `oa_department` VALUES ('a6c6695217ba4a4dbfe9f7e9d2c06730', 'A公司', 'a', '001', '0', '挖煤', '张三', '110', '洼煤矿', '山西');
INSERT INTO `oa_department` VALUES ('cbbc84eddde947ba8af7d509e430eb70', '销售部', 'xiaoshoubu', '00201', '5cccdb7c432449d8b853c52880058140', '推销商品', '小明', '11236', '推销商品', '909办公室');
INSERT INTO `oa_department` VALUES ('d41af567914a409893d011aa53eda797', '财务部', 'caiwubu', '00101', 'a6c6695217ba4a4dbfe9f7e9d2c06730', '负责发工资', '王武', '11236', '管理财务', '308办公室');

-- ----------------------------
-- Table structure for oa_fhfile
-- ----------------------------
DROP TABLE IF EXISTS `oa_fhfile`;
CREATE TABLE `oa_fhfile` (
  `FHFILE_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '上传时间',
  `BZ` varchar(100) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '长传者',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门ID',
  `FILESIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`FHFILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_fhfile
-- ----------------------------
INSERT INTO `oa_fhfile` VALUES ('00a3a22cde5a4a87b935f69a07a095cd', 'ssdf', '2016060308062777776.txt', '2016-06-03 20:06:27', 's', 'admin', '0', '0.643');
INSERT INTO `oa_fhfile` VALUES ('10d0d0a30c5a4d1798f6abbb6a4eafb8', 'f1', '2016060211505730809.png', '2016-06-02 23:50:57', '21', 'lisi', '8f8b045470f342fdbc4c312ab881d62b', '522.43');
INSERT INTO `oa_fhfile` VALUES ('1d12e3f914cf493c9bde0cff3584cefb', 'w1', '2016060211500388907.png', '2016-06-02 23:50:03', 'w1', 'san', '5cccdb7c432449d8b853c52880058140', '6.389');

-- ----------------------------
-- Table structure for oa_staff
-- ----------------------------
DROP TABLE IF EXISTS `oa_staff`;
CREATE TABLE `oa_staff` (
  `STAFF_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(100) DEFAULT NULL COMMENT '编码',
  `DEPARTMENT_ID` varchar(100) DEFAULT NULL COMMENT '部门',
  `FUNCTIONS` varchar(255) DEFAULT NULL COMMENT '职责',
  `TEL` varchar(20) DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` varchar(32) DEFAULT NULL COMMENT '出生日期',
  `NATION` varchar(10) DEFAULT NULL COMMENT '民族',
  `JOBTYPE` varchar(30) DEFAULT NULL COMMENT '岗位类别',
  `JOBJOINTIME` varchar(32) DEFAULT NULL COMMENT '参加工作时间',
  `FADDRESS` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `POLITICAL` varchar(30) DEFAULT NULL COMMENT '政治面貌',
  `PJOINTIME` varchar(32) DEFAULT NULL COMMENT '入团时间',
  `SFID` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `MARITAL` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `DJOINTIME` varchar(32) DEFAULT NULL COMMENT '进本单位时间',
  `POST` varchar(30) DEFAULT NULL COMMENT '现岗位',
  `POJOINTIME` varchar(32) DEFAULT NULL COMMENT '上岗时间',
  `EDUCATION` varchar(10) DEFAULT NULL COMMENT '学历',
  `SCHOOL` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `MAJOR` varchar(30) DEFAULT NULL COMMENT '专业',
  `FTITLE` varchar(30) DEFAULT NULL COMMENT '职称',
  `CERTIFICATE` varchar(30) DEFAULT NULL COMMENT '职业资格证',
  `CONTRACTLENGTH` int(2) NOT NULL COMMENT '劳动合同时长',
  `CSTARTTIME` varchar(32) DEFAULT NULL COMMENT '签订日期',
  `CENDTIME` varchar(32) DEFAULT NULL COMMENT '终止日期',
  `ADDRESS` varchar(100) DEFAULT NULL COMMENT '现住址',
  `USER_ID` varchar(100) DEFAULT NULL COMMENT '绑定账号ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_staff
-- ----------------------------
INSERT INTO `oa_staff` VALUES ('9fd17463ffd7487ab90e683c76026655', 'www', 'www', 'ww', '5cccdb7c432449d8b853c52880058140', 'ww', 'ww', 'www', '男', '2016-04-27', 'ww', 'ww', '2016-05-03', 'ww', 'ww', '2016-04-25', 'ww', '未婚', '2016-05-09', 'ww', '2016-05-17', 'w', 'w', 'w', 'w', 'www', '2', '2016-05-23', '2016-05-16', 'w', 'f1', 'www');
INSERT INTO `oa_staff` VALUES ('c9f05f925dfc485b9e352916612ab669', 'fw', 'y', 'y', '8f8b045470f342fdbc4c312ab881d62b', 'y', 'y', 'y', '男', '2016-06-08', 'y', 'y', '2016-06-03', 'y', 'y', '2016-05-31', 'y', '已婚', '2016-06-07', 'y', '2016-06-08', 'y', 'y', 'y', 'y', 'y', '4', '2016-06-21', '2016-06-21', 'y', 'lisi', 'y');

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', '698d51a19d8a121ce581499d7b701668', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', '2', '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('55d00299ec76448790e5f38da99b8ed6', 'dd', '698d51a19d8a121ce581499d7b701668', '1212', '', '1b67fc82ce89457a8347ae53e43a347e', '', '', '1', '1213', '213123', '213', '2016-03-30', '2016-03-31', '123', '1121', '213435345@qq.com');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode` (
  `CREATECODE_ID` varchar(100) NOT NULL,
  `PACKAGENAME` varchar(50) DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('002ea762e3e242a7a10ea5ca633701d8', 'system', 'Buttonrights', 'sys_,ft,BUTTONRIGHTS', 'NAME,ft,String,ft,名称,ft,是,ft,无,ft,255Q313596790', '2016-01-16 23:20:36', '按钮权限', 'single');
INSERT INTO `sys_createcode` VALUES ('043843a286f84549ad3fa71aac827f6f', 'system', 'FHlog', 'SYS_,ft,FHLOG', 'USERNAME,ft,String,ft,用户名,ft,是,ft,无,ft,100,ft,0Q313596790CZTIME,ft,Date,ft,操作时间,ft,否,ft,无,ft,32,ft,0Q313596790CONTENT,ft,String,ft,事件,ft,是,ft,无,ft,255,ft,0Q313596790', '2016-05-10 21:10:16', '操作日志记录', 'single');
INSERT INTO `sys_createcode` VALUES ('04e533ce214a43c7adc9d22f460aea2b', 'sj', 'PublishComment', ',ft,PUBLISHCOMMENT', 'PC_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PM_ID,ft,String,ft,备注2,ft,是,ft,无,ft,36,ft,0Q313596790CONTENT,ft,String,ft,备注3,ft,是,ft,无,ft,200,ft,0Q313596790CREATED_BY,ft,String,ft,备注4,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注5,ft,是,ft,无,ft,19,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790DELETED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-13 15:28:53', '发布评论', 'single');
INSERT INTO `sys_createcode` VALUES ('0ad30206242c4cd8baf5f2a4b05973a1', 'ep', 'Proptype', ',ft,PROPTYPE', 'PROPTYPE_ID,ft,String,ft,道具类型ID,ft,是,ft,无,ft,36,ft,0Q313596790PROPTYPE_NAME,ft,String,ft,道具类型名称,ft,是,ft,无,ft,20,ft,0Q313596790DELETE_FLAG,ft,String,ft,删除标志,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注4,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注5,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注6,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注7,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-15 18:54:03', '道具类型', 'single');
INSERT INTO `sys_createcode` VALUES ('0ee023606efb45b9a3baaa072e502161', 'information', 'FtestMx', 'FH_,ft,FTESTMX', 'TITLE,ft,String,ft,标题,ft,是,ft,无,ft,255,ft,0Q313596790CHANGDU,ft,Integer,ft,长度,ft,是,ft,无,ft,11,ft,0Q313596790', '2016-04-21 01:52:11', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('11f8c3c3c0c64506857fe63cb619f20c', 'bs', 'Publishtype', ',ft,PUBLISHTYPE', 'PTYPE_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PTYPE_NAME,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790ICON_URL,ft,String,ft,备注3,ft,是,ft,无,ft,255,ft,0Q313596790PRRANT_PTYPE_ID,ft,String,ft,备注4,ft,是,ft,无,ft,36,ft,0Q313596790ORDER_BY,ft,Integer,ft,备注5,ft,是,ft,无,ft,11,ft,0Q313596790PUBLISH_TYPE_STATUS,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790CREATED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-25 10:23:09', '发布类型', 'single');
INSERT INTO `sys_createcode` VALUES ('181d9c6c8524468a87bbae6fed51389d', 'ep', 'Information', ',ft,INFORMATION', 'INFORMATION_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790TYPE,ft,String,ft,备注2,ft,是,ft,无,ft,1,ft,0Q313596790BRAND_ID,ft,String,ft,发送品牌,ft,是,ft,无,ft,36,ft,0Q313596790TITLE,ft,String,ft,标题,ft,是,ft,无,ft,255,ft,0Q313596790SUMMARY,ft,String,ft,概述,ft,是,ft,无,ft,255,ft,0Q313596790CONTENT,ft,String,ft,内容,ft,是,ft,无,ft,21845,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-21 16:16:52', '信息', 'single');
INSERT INTO `sys_createcode` VALUES ('1be959583e82473b82f6e62087bd0d38', 'information', 'Attached', 'TB_,ft,ATTACHED', 'NAME,ft,String,ft,NAME,ft,是,ft,无,ft,255,ft,0Q313596790FDESCRIBE,ft,String,ft,FDESCRIBE,ft,是,ft,无,ft,255,ft,0Q313596790PRICE,ft,Double,ft,PRICE,ft,是,ft,无,ft,11,ft,2Q313596790CTIME,ft,Date,ft,CTIME,ft,否,ft,无,ft,32,ft,0Q313596790', '2016-04-21 17:07:59', '主表测试', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('24b95a2f257e487fa252e26a5db3a439', 'ep', 'Express', ',ft,EXPRESS', 'EXPRESS_NAME,ft,String,ft,快递公司,ft,是,ft,无,ft,20,ft,0Q313596790PHONE,ft,String,ft,联系电话,ft,是,ft,无,ft,20,ft,0Q313596790NOTE,ft,String,ft,备注,ft,是,ft,无,ft,255,ft,0Q313596790STATUS,ft,String,ft,状态,ft,是,ft,无,ft,255,ft,0Q313596790DELETE_FLAG,ft,String,ft,删除标记,ft,否,ft,无,ft,255,ft,0Q313596790CREATE_BY,ft,String,ft,创建人,ft,否,ft,无,ft,255,ft,0Q313596790CREATED_TIME,ft,Date,ft,创建时间,ft,否,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,修改人,ft,否,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,修改时间,ft,否,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,删除时间,ft,否,ft,无,ft,19,ft,0Q313596790', '2017-03-17 13:32:46', 'Express 快递公司', 'single');
INSERT INTO `sys_createcode` VALUES ('2c81d5047b604ac29a0c7d35bf12dbeb', 'store', 'Store', ',ft,STORE', 'STORE_NAME,ft,String,ft,门店名称,ft,是,ft,无,ft,20,ft,0Q313596790BRAND_ID,ft,String,ft,所属品牌,ft,是,ft,无,ft,36,ft,0Q313596790AREA_ID,ft,String,ft,所属区域,ft,是,ft,无,ft,36,ft,0Q313596790CITY_ID,ft,String,ft,所在城市 ,ft,是,ft,无,ft,36,ft,0Q313596790ADDRESS,ft,String,ft,地址,ft,是,ft,无,ft,200,ft,0Q313596790STORE_TYPE,ft,String,ft,门店类型,ft,是,ft,无,ft,1,ft,0Q313596790STATUS,ft,String,ft,状态,ft,否,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,删除状态,ft,否,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,创建人,ft,否,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注11,ft,否,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注12,ft,否,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注13,ft,否,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注14,ft,否,ft,无,ft,19,ft,0Q313596790', '2017-03-20 14:08:29', '门店', 'single');
INSERT INTO `sys_createcode` VALUES ('2ec40628ccf84a1caf3ef234076d5105', 'bs', 'SysMessage', ',ft,SYSMESSAGE', 'SYSMESSAGE_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790TITLE,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790MESSAGE_STATE,ft,String,ft,备注3,ft,是,ft,无,ft,1,ft,0Q313596790CONTENT,ft,String,ft,备注4,ft,是,ft,无,ft,200,ft,0Q313596790MESSAGE_TYPE,ft,String,ft,备注5,ft,是,ft,无,ft,1,ft,0Q313596790TARGET_ID,ft,String,ft,备注6,ft,是,ft,无,ft,36,ft,0Q313596790PUBLISH_TIME,ft,Date,ft,备注7,ft,是,ft,无,ft,19,ft,0Q313596790CREATED_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-26 16:30:13', '系统消息', 'single');
INSERT INTO `sys_createcode` VALUES ('34203df4a3e04bcaa114bb3713d2dbc4', 'bs', 'IntegralRule', ',ft,INTEGRALRULE', 'IRULE_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PUBLISH_THEME,ft,Integer,ft,备注2,ft,是,ft,无,ft,3,ft,0Q313596790DAILY_ATTENDANCE,ft,Integer,ft,备注3,ft,是,ft,无,ft,3,ft,0Q313596790REWARD_HIGH,ft,Integer,ft,备注4,ft,是,ft,无,ft,3,ft,0Q313596790CREATED_BY,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注6,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-01 13:20:35', '积分规则', 'single');
INSERT INTO `sys_createcode` VALUES ('3a6d89afc3884763bf5ab2c435511bcc', 'ep', 'Supplier', ',ft,SUPPLIER', 'SUPPLIER_ID,ft,String,ft,供应商ID,ft,否,ft,无,ft,36,ft,0Q313596790SUPPLIER_NAME,ft,String,ft,供应商名称,ft,是,ft,无,ft,255,ft,0Q313596790SHORT_NAME,ft,String,ft,简称,ft,是,ft,无,ft,20,ft,0Q313596790AREA_ID,ft,String,ft,区域,ft,是,ft,无,ft,36,ft,0Q313596790ADDRESS,ft,String,ft,地址,ft,是,ft,无,ft,255,ft,0Q313596790LEGAL_PERSONNAME,ft,String,ft,法人姓名 ,ft,是,ft,无,ft,50,ft,0Q313596790LEGAL_PERSONTEL,ft,String,ft,法人手机,ft,是,ft,无,ft,50,ft,0Q313596790CONTACTS,ft,String,ft,联系人,ft,是,ft,无,ft,50,ft,0Q313596790PHONE,ft,String,ft,联系电话 ,ft,是,ft,无,ft,50,ft,0Q313596790FAX,ft,String,ft,传真,ft,是,ft,无,ft,50,ft,0Q313596790FIXEDTEL,ft,String,ft,固定电话,ft,是,ft,无,ft,50,ft,0Q313596790BUS_SCOPE,ft,String,ft,经营范围,ft,是,ft,无,ft,255,ft,0Q313596790BUS_LICENSE_PATH,ft,String,ft,营业执照,ft,是,ft,无,ft,255,ft,0Q313596790BUS_LICENSE_SPATH,ft,String,ft,营业执照,ft,否,ft,无,ft,255,ft,0Q313596790ORG_CODE_PATH,ft,String,ft,组织机构代码证,ft,是,ft,无,ft,255,ft,0Q313596790ORG_CODE_SPATH,ft,String,ft,组织机构代码证,ft,否,ft,无,ft,255,ft,0Q313596790TAX_REG_PATH,ft,String,ft,税务登记证,ft,是,ft,无,ft,255,ft,0Q313596790TAX_REG_SPATH,ft,String,ft,税务登记证,ft,否,ft,无,ft,255,ft,0Q313596790SERVICE_DAYS,ft,Integer,ft,上门维修最大天数,ft,是,ft,无,ft,2,ft,0Q313596790STATUS,ft,String,ft,备注20,ft,否,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注21,ft,否,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注22,ft,否,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注23,ft,否,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注24,ft,否,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注25,ft,否,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注26,ft,否,ft,无,ft,19,ft,0Q313596790', '2017-03-15 17:03:07', '供应商', 'single');
INSERT INTO `sys_createcode` VALUES ('3da8e8bd757c44148d89931a54d29c88', 'system', 'UserPhoto', 'SYS_,ft,USERPHOTO', 'USERNAME,ft,String,ft,用户名,ft,否,ft,无,ft,30,ft,0Q313596790PHOTO0,ft,String,ft,原图,ft,否,ft,无,ft,100,ft,0Q313596790PHOTO1,ft,String,ft,头像1,ft,否,ft,无,ft,100,ft,0Q313596790PHOTO2,ft,String,ft,头像2,ft,否,ft,无,ft,100,ft,0Q313596790PHOTO3,ft,String,ft,头像3,ft,否,ft,无,ft,100,ft,0Q313596790', '2016-06-05 17:54:25', '用户头像', 'single');
INSERT INTO `sys_createcode` VALUES ('4173a8c56a504dd6b6213d2b9cd3e91b', 'information', 'AttachedMx', 'TB_,ft,ATTACHEDMX', 'NAME,ft,String,ft,NAME,ft,是,ft,无,ft,255,ft,0Q313596790TITLE,ft,String,ft,TITLE,ft,是,ft,无,ft,255,ft,0Q313596790CTIME,ft,Date,ft,CTIME,ft,否,ft,无,ft,32,ft,0Q313596790PRICE,ft,Double,ft,PRICE,ft,是,ft,无,ft,11,ft,2Q313596790', '2016-04-21 17:09:40', '主表测试(明细)', 'sontable');
INSERT INTO `sys_createcode` VALUES ('41e07fb03763434daef41cd99d0406c3', 'system', 'LogInImg', 'SYS_,ft,LOGINIMG', 'NAME,ft,String,ft,文件名,ft,是,ft,无,ft,30,ft,0Q313596790FILEPATH,ft,String,ft,路径,ft,是,ft,无,ft,100,ft,0Q313596790TYPE,ft,Integer,ft,状态,ft,是,ft,无,ft,2,ft,0Q313596790FORDER,ft,Integer,ft,排序,ft,是,ft,无,ft,3,ft,0Q313596790', '2016-06-03 17:53:22', '登录页面背景图片', 'single');
INSERT INTO `sys_createcode` VALUES ('49ae4f3be9d04b7f9d870f87a019803f', 'ep', 'Applyprop', ',ft,APPLYPROP', 'APPLY_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790APPLY_CODE,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790APPLY_INICODE,ft,String,ft,备注3,ft,是,ft,无,ft,50,ft,0Q313596790SUPPLIER_ID,ft,String,ft,备注4,ft,是,ft,无,ft,36,ft,0Q313596790INVOICE_CODE,ft,String,ft,备注5,ft,是,ft,无,ft,50,ft,0Q313596790DELIVERY_TIME,ft,Date,ft,备注6,ft,是,ft,无,ft,19,ft,0Q313596790EXPRESS_ID,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790TRACKING_NUMBER,ft,String,ft,备注8,ft,是,ft,无,ft,50,ft,0Q313596790AGENT_ID,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790STATE,ft,String,ft,备注10,ft,是,ft,无,ft,1,ft,0Q313596790PROPTYPE_ID,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790NOTE,ft,String,ft,备注12,ft,是,ft,无,ft,255,ft,0Q313596790CREATE_BY,ft,String,ft,备注13,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注14,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注15,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注16,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注17,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-22 15:39:57', '申请道具', 'single');
INSERT INTO `sys_createcode` VALUES ('49d985e081ed44e6b34ba1b8c5466e39', 'fhdb', 'TimingBackUp', 'DB_,ft,TIMINGBACKUP', 'JOBNAME,ft,String,ft,任务名称,ft,否,ft,无,ft,50Q313596790CREATE_TIME,ft,Date,ft,创建时间,ft,否,ft,无,ft,32Q313596790TABLENAME,ft,String,ft,表名,ft,是,ft,无,ft,50Q313596790TYPE,ft,Integer,ft,类型,ft,否,ft,无,ft,1Q313596790FHTIME,ft,String,ft,时间规则,ft,是,ft,无,ft,30Q313596790TIMEEXPLAIN,ft,String,ft,规则说明,ft,是,ft,无,ft,100Q313596790BZ,ft,String,ft,备注,ft,是,ft,无,ft,255Q313596790', '2016-04-09 11:53:38', '定时备份', 'single');
INSERT INTO `sys_createcode` VALUES ('4def60c58aa148b7998270978660ef30', 'fhoa', 'Fhfile', 'OA_,ft,FHFILE', 'NAME,ft,String,ft,文件名,ft,是,ft,无,ft,30,ft,0Q313596790FILEPATH,ft,String,ft,路径,ft,是,ft,无,ft,100,ft,0Q313596790CTIME,ft,Date,ft,上传时间,ft,否,ft,无,ft,32,ft,0Q313596790BZ,ft,String,ft,备注,ft,是,ft,无,ft,100,ft,0Q313596790USERNAME,ft,String,ft,长传者,ft,否,ft,无,ft,50,ft,0Q313596790DEPARTMENT_ID,ft,String,ft,部门ID,ft,否,ft,无,ft,100,ft,0Q313596790FILESIZE,ft,String,ft,文件大小,ft,否,ft,无,ft,10,ft,0Q313596790', '2016-05-27 20:52:01', '文件管理', 'single');
INSERT INTO `sys_createcode` VALUES ('60a6ff9b1ee141e89f49e98c461517ef', 'store', 'Store', ',ft,STORE', 'STORE_NAME,ft,String,ft,门店名称,ft,是,ft,无,ft,20,ft,0Q313596790BRAND_ID,ft,String,ft,所属品牌,ft,是,ft,无,ft,36,ft,0Q313596790AREA_ID,ft,String,ft,所属区域,ft,是,ft,无,ft,36,ft,0Q313596790CITY_ID,ft,String,ft,所在城市,ft,是,ft,无,ft,36,ft,0Q313596790所在城市,ft,String,ft,地址,ft,是,ft,无,ft,200,ft,0Q313596790STORE_TYPE,ft,String,ft,门店类型,ft,是,ft,无,ft,1,ft,0Q313596790STATUS,ft,String,ft,备注8,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注9,ft,否,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注10,ft,否,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注11,ft,否,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注12,ft,否,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注13,ft,否,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注14,ft,否,ft,无,ft,19,ft,0Q313596790', '2017-03-20 13:50:17', '门店', 'single');
INSERT INTO `sys_createcode` VALUES ('66aec40b06354820b296fbbcf7feb829', 'bs', 'About', ',ft,ABOUT', 'ABOUT_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790ABOUT_STATE,ft,String,ft,备注2,ft,是,ft,无,ft,1,ft,0Q313596790ORDER_BY,ft,Integer,ft,备注3,ft,是,ft,无,ft,1,ft,0Q313596790TITLE,ft,String,ft,备注4,ft,是,ft,无,ft,20,ft,0Q313596790CONTENT,ft,String,ft,备注5,ft,是,ft,无,ft,2000,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790CREATED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-25 15:53:38', '关于', 'single');
INSERT INTO `sys_createcode` VALUES ('673c58c4bf714ca3907845771187ba19', 'bs', 'Scoretype', ',ft,SCORETYPE', 'STYPE_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790STYPE_NAME,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790NOTE,ft,String,ft,备注3,ft,是,ft,无,ft,200,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注4,ft,是,ft,无,ft,1,ft,0Q313596790CREATED_BY,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注6,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-24 14:01:11', '评分类型', 'single');
INSERT INTO `sys_createcode` VALUES ('6fa8b09a622648f69e56b1966baaf9be', 'ep', 'Fix', ',ft,FIX', 'FIX_CODE,ft,String,ft,维修单号,ft,否,ft,无,ft,50,ft,0Q313596790SUPPLIER_ID,ft,String,ft,维修供应商,ft,是,ft,无,ft,36,ft,0Q313596790FIXTYPE_ID,ft,String,ft,维修类型,ft,是,ft,无,ft,36,ft,0Q313596790DESCRIPTION,ft,String,ft,详情描述,ft,是,ft,无,ft,255,ft,0Q313596790NOTE,ft,String,ft,备注,ft,是,ft,无,ft,255,ft,0Q313596790SMAN_ID,ft,String,ft,维修人员ID,ft,是,ft,无,ft,36,ft,0Q313596790SERVICE_TIME,ft,String,ft,上门时间,ft,是,ft,无,ft,255,ft,0Q313596790STATE,ft,String,ft,维修状态,ft,是,ft,无,ft,1,ft,0Q313596790ACCEPT_TIME,ft,Date,ft,受理时间,ft,是,ft,无,ft,19,ft,0Q313596790FINISHED_TIME,ft,Date,ft,完成时间,ft,是,ft,无,ft,19,ft,0Q313596790COMMENT_TIME,ft,Date,ft,评论时间,ft,是,ft,无,ft,19,ft,0Q313596790SERVICE_SCORE1,ft,Integer,ft,服务态度,ft,是,ft,无,ft,1,ft,0Q313596790SERVICE_SCORE2,ft,Integer,ft,上门时间,ft,是,ft,无,ft,1,ft,0Q313596790SERVICE_SCORE3,ft,Integer,ft,维修质量,ft,是,ft,无,ft,1,ft,0Q313596790COMMENT_CONTENT,ft,String,ft,评论内容,ft,是,ft,无,ft,255,ft,0Q313596790COMPLAIN_TIME,ft,Date,ft,投诉时间,ft,是,ft,无,ft,19,ft,0Q313596790COMPLAIN_CONTENT,ft,String,ft,投诉内容,ft,是,ft,无,ft,255,ft,0Q313596790SUPPLIER_FEEDBACK,ft,String,ft,供应商反馈,ft,是,ft,无,ft,255,ft,0Q313596790CREATE_BY,ft,String,ft,申请人,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,申请时间,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,最后修改人,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,最后修改时间,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,删除时间,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-20 11:15:26', '维修管理', 'fathertable');
INSERT INTO `sys_createcode` VALUES ('74d68ca738ad4abb965e0e84a8dd7282', 'bs', 'IntegralRecord', ',ft,INTEGRALRECORD', 'IRECORD_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790INTEGRAL_TYPE,ft,String,ft,备注2,ft,是,ft,无,ft,1,ft,0Q313596790SCORE,ft,Integer,ft,备注3,ft,是,ft,无,ft,3,ft,0Q313596790USER_ID,ft,String,ft,备注4,ft,是,ft,无,ft,36,ft,0Q313596790USER_FROM,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790USER_TO,ft,String,ft,备注6,ft,是,ft,无,ft,36,ft,0Q313596790THEME_ID,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-06 14:34:39', '积分流水', 'single');
INSERT INTO `sys_createcode` VALUES ('78e7a434e3a84e44aba9cfbe124c5247', 'en', 'Ad', ',ft,AD', 'AD_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790AD_NAME,ft,String,ft,备注2,ft,是,ft,无,ft,20,ft,0Q313596790BRAND_ID,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790POSITION,ft,String,ft,备注4,ft,是,ft,无,ft,1,ft,0Q313596790PICURL,ft,String,ft,备注5,ft,是,ft,无,ft,255,ft,0Q313596790STATUS,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-13 14:14:52', '广告表', 'single');
INSERT INTO `sys_createcode` VALUES ('7c7f8c77afef495eaeb316e84535f923', 'bs', 'Follow', ',ft,FOLLOW', 'FO_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790FOLLOW_PERSON,ft,String,ft,备注2,ft,是,ft,无,ft,36,ft,0Q313596790BE_FOLLOW_PERSON,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注4,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-13 10:10:22', '关注', 'single');
INSERT INTO `sys_createcode` VALUES ('7cd9ffff77fb465ca52366330c92ca15', 'ep', 'Sman', ',ft,SMAN', 'SUPPLIER_ID,ft,String,ft,供应商ID,ft,否,ft,无,ft,36,ft,0Q313596790NAME,ft,String,ft,姓名,ft,是,ft,无,ft,50,ft,0Q313596790TELEPHONE,ft,String,ft,电话,ft,是,ft,无,ft,50,ft,0Q313596790CITY_ID,ft,String,ft,城市ID,ft,是,ft,无,ft,36,ft,0Q313596790STATUS,ft,String,ft,状态,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790BZ,ft,String,ft,备注,ft,是,ft,无,ft,255,ft,0Q313596790CREATE_BY,ft,String,ft,创建人,ft,否,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,创建时间,ft,否,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,修改人,ft,否,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,修改时间,ft,否,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,删除时间,ft,否,ft,无,ft,19,ft,0Q313596790', '2017-03-16 12:23:39', 'ServiceMan 维修人员', 'single');
INSERT INTO `sys_createcode` VALUES ('91af9fe509704fa68f6bca121359e3ec', 'fhoa', 'Staff', 'OA_,ft,STAFF', 'NAME,ft,String,ft,姓名,ft,是,ft,无,ft,50,ft,0Q313596790NAME_EN,ft,String,ft,英文,ft,是,ft,无,ft,50,ft,0Q313596790BIANMA,ft,String,ft,编码,ft,是,ft,无,ft,100,ft,0Q313596790DEPARTMENT_ID,ft,String,ft,部门,ft,是,ft,无,ft,100,ft,0Q313596790FUNCTIONS,ft,String,ft,职责,ft,是,ft,无,ft,255,ft,0Q313596790TEL,ft,String,ft,电话,ft,是,ft,无,ft,20,ft,0Q313596790EMAIL,ft,String,ft,邮箱,ft,是,ft,无,ft,50,ft,0Q313596790SEX,ft,String,ft,性别,ft,是,ft,无,ft,10,ft,0Q313596790BIRTHDAY,ft,Date,ft,出生日期,ft,是,ft,无,ft,32,ft,0Q313596790NATION,ft,String,ft,民族,ft,是,ft,无,ft,10,ft,0Q313596790JOBTYPE,ft,String,ft,岗位类别,ft,是,ft,无,ft,30,ft,0Q313596790JOBJOINTIME,ft,Date,ft,参加工作时间,ft,是,ft,无,ft,32,ft,0Q313596790FADDRESS,ft,String,ft,籍贯,ft,是,ft,无,ft,100,ft,0Q313596790POLITICAL,ft,String,ft,政治面貌,ft,是,ft,无,ft,30,ft,0Q313596790PJOINTIME,ft,Date,ft,入团时间,ft,是,ft,无,ft,32,ft,0Q313596790SFID,ft,String,ft,身份证号,ft,是,ft,无,ft,20,ft,0Q313596790MARITAL,ft,String,ft,婚姻状况,ft,是,ft,无,ft,10,ft,0Q313596790DJOINTIME,ft,Date,ft,进本单位时间,ft,是,ft,无,ft,32,ft,0Q313596790POST,ft,String,ft,现岗位,ft,是,ft,无,ft,30,ft,0Q313596790POJOINTIME,ft,Date,ft,上岗时间,ft,是,ft,无,ft,32,ft,0Q313596790EDUCATION,ft,String,ft,学历,ft,是,ft,无,ft,10,ft,0Q313596790SCHOOL,ft,String,ft,毕业学校,ft,是,ft,无,ft,30,ft,0Q313596790MAJOR,ft,String,ft,专业,ft,是,ft,无,ft,30,ft,0Q313596790FTITLE,ft,String,ft,职称,ft,是,ft,无,ft,30,ft,0Q313596790CERTIFICATE,ft,String,ft,职业资格证,ft,是,ft,无,ft,30,ft,0Q313596790CONTRACTLENGTH,ft,Integer,ft,劳动合同时长,ft,是,ft,无,ft,2,ft,0Q313596790CSTARTTIME,ft,Date,ft,签订日期,ft,是,ft,无,ft,32,ft,0Q313596790CENDTIME,ft,Date,ft,终止日期,ft,是,ft,无,ft,32,ft,0Q313596790ADDRESS,ft,String,ft,现住址,ft,是,ft,无,ft,100,ft,0Q313596790USER_ID,ft,String,ft,绑定账号ID,ft,否,ft,无,ft,100,ft,0Q313596790BZ,ft,String,ft,备注,ft,是,ft,无,ft,255,ft,0Q313596790', '2016-04-23 20:44:31', '员工管理', 'single');
INSERT INTO `sys_createcode` VALUES ('9361cd567b594e3f8deabfd41973713e', 'ep', 'Handbook', ',ft,HANDBOOK', 'HANDBOOK_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790HANDBOOK_CODE,ft,String,ft, 编号,ft,是,ft,无,ft,50,ft,0Q313596790TITLE,ft,String,ft,标题,ft,是,ft,无,ft,255,ft,0Q313596790TYPE,ft,String,ft,类型,ft,是,ft,无,ft,1,ft,0Q313596790COVER_PATH,ft,String,ft,封面路径,ft,是,ft,无,ft,255,ft,0Q313596790FILE_PATH,ft,String,ft,文件路径,ft,是,ft,无,ft,255,ft,0Q313596790BRAND_ID,ft,String,ft,发送品牌,ft,是,ft,无,ft,36,ft,0Q313596790AREA_ID,ft,String,ft,发送区域,ft,是,ft,无,ft,36,ft,0Q313596790CITY_ID,ft,String,ft,发送城市,ft,是,ft,无,ft,36,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注10,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注13,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注14,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注15,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-17 10:07:24', '指导手册', 'single');
INSERT INTO `sys_createcode` VALUES ('968e73c9443d4392920a2851ee0ee108', 'ep', 'FixComment', 'ep_,ft,FIXCOMMENT', 'FIX_ID,ft,String,ft,维修ID,ft,否,ft,无,ft,36,ft,0Q313596790FIX_CODE,ft,String,ft,维修单号,ft,是,ft,无,ft,50,ft,0Q313596790SUPPLIER_ID,ft,String,ft,供应商ID,ft,是,ft,无,ft,36,ft,0Q313596790FIXTYPE_ID,ft,String,ft,维修类型,ft,是,ft,无,ft,36,ft,0Q313596790SERVICE_SCORE1,ft,Integer,ft,服务态度,ft,是,ft,无,ft,1,ft,0Q313596790SERVICE_SCORE2,ft,Integer,ft,上门时间,ft,是,ft,无,ft,1,ft,0Q313596790SERVICE_SCORE3,ft,Integer,ft,维修质量,ft,是,ft,无,ft,1,ft,0Q313596790COMPLAIN_CONTENT,ft,String,ft,评论内容,ft,是,ft,无,ft,255,ft,0Q313596790', '2017-03-21 18:09:48', '评论', 'single');
INSERT INTO `sys_createcode` VALUES ('96b767108fb145638b7534f92508c864', 'ep', 'Prop', ',ft,PROP', 'PROP_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PROP_NAME,ft,String,ft,道具名称,ft,是,ft,无,ft,20,ft,0Q313596790PROPTYPE_ID,ft,String,ft,道具类型,ft,是,ft,无,ft,36,ft,0Q313596790PRICE,ft,String,ft,价格,ft,是,ft,无,ft,12,ft,2Q313596790PICTURE_PATH,ft,String,ft,原图片路径,ft,是,ft,无,ft,255,ft,0Q313596790PICTURE_SPATH,ft,String,ft,缩略图路径,ft,是,ft,无,ft,255,ft,0Q313596790STATUS,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注8,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注13,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-16 11:35:48', '道具', 'single');
INSERT INTO `sys_createcode` VALUES ('a01c338fc93c4999ad03f4526eab9b2e', 'bs', 'SensitiveWords', ',ft,SENSITIVEWORDS', 'SWORDS_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790SWORD,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790CREATED_BY,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注4,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注6,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-01 14:16:32', '敏感词汇', 'single');
INSERT INTO `sys_createcode` VALUES ('a8f65ab4bcfe4962afed7aac41672bb9', 'bs', 'AppVersion', ',ft,APPVERSION', 'VERSION_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790APP_TYPE,ft,String,ft,备注2,ft,是,ft,无,ft,1,ft,0Q313596790VERSION_CODE,ft,String,ft,备注3,ft,是,ft,无,ft,50,ft,0Q313596790UPDATE_INSTALL,ft,Integer,ft,备注4,ft,是,ft,无,ft,1,ft,0Q313596790UPDATE_MESSAGE,ft,String,ft,备注5,ft,是,ft,无,ft,200,ft,0Q313596790DOWNLOAD_URL,ft,String,ft,备注6,ft,是,ft,无,ft,200,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790MESSAGE_STATE,ft,String,ft,备注8,ft,是,ft,无,ft,1,ft,0Q313596790IS_NEW,ft,String,ft,备注9,ft,是,ft,无,ft,1,ft,0Q313596790PUBLISH_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790CREATED_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注13,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注14,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注15,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注16,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-27 11:00:36', 'app版本', 'single');
INSERT INTO `sys_createcode` VALUES ('aaab4c73df1e4b059db6cefcb7b2f3f4', 'lg', 'Prop', ',ft,PROP', 'PROP_ID,ft,String,ft,道具ID,ft,是,ft,无,ft,36,ft,0Q313596790PROP_NAME,ft,String,ft,道具名称,ft,是,ft,无,ft,20,ft,0Q313596790PROPTYPE_ID,ft,String,ft,道具类型,ft,是,ft,无,ft,36,ft,0Q313596790PRICE,ft,String,ft,价格,ft,是,ft,无,ft,12,ft,2Q313596790PICTURE_PATH,ft,String,ft,原图片路径,ft,是,ft,无,ft,255,ft,0Q313596790PICTURE_SPATH,ft,String,ft,缩略图路径,ft,是,ft,无,ft,255,ft,0Q313596790STATUS,ft,String,ft,状态,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注8,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注13,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-16 11:29:52', '道具', 'single');
INSERT INTO `sys_createcode` VALUES ('adc7df6d62b84d8e99bd4e463e528590', 'rr', 'Df', ',ft,DF', 'AD_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790AD_NAME,ft,String,ft,备注2,ft,是,ft,无,ft,20,ft,0Q313596790BRAND_ID,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790POSITION,ft,String,ft,备注4,ft,是,ft,无,ft,1,ft,0Q313596790PICURL,ft,String,ft,备注5,ft,是,ft,无,ft,255,ft,0Q313596790STATUS,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-04-11 10:00:53', '423', 'single');
INSERT INTO `sys_createcode` VALUES ('ae92803163ff44539e91711cfbe35411', 'fhoa', 'Datajur', 'OA_,ft,DATAJUR', 'DEPARTMENT_IDS,ft,String,ft,部门ID组合,ft,否,ft,无,ft,5000,ft,0Q313596790STAFF_ID,ft,String,ft,员工ID,ft,否,ft,无,ft,100,ft,0Q313596790DEPARTMENT_ID,ft,String,ft,部门ID,ft,是,ft,无,ft,100,ft,0Q313596790', '2016-04-27 03:49:39', '数据权限表', 'single');
INSERT INTO `sys_createcode` VALUES ('b8bc34d3c22f45fb91216fd100440db7', 'bs', 'Goods', ',ft,GOODS', 'GOODS_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PTYPE_ID,ft,String,ft,备注2,ft,是,ft,无,ft,36,ft,0Q313596790SUB_PTYPE_ID,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790GOODS_NAME,ft,String,ft,备注4,ft,是,ft,无,ft,50,ft,0Q313596790COVERS_PIC,ft,String,ft,备注5,ft,是,ft,无,ft,255,ft,0Q313596790GOODS_STATUS,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注7,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-31 13:53:36', '发布商品', 'single');
INSERT INTO `sys_createcode` VALUES ('bf35ab8b2d064bf7928a04bba5e5a6dd', 'system', 'Fhsms', 'SYS_,ft,FHSMS', 'CONTENT,ft,String,ft,内容,ft,是,ft,无,ft,1000Q313596790TYPE,ft,String,ft,类型,ft,否,ft,无,ft,5Q313596790TO_USERNAME,ft,String,ft,收信人,ft,是,ft,无,ft,255Q313596790FROM_USERNAME,ft,String,ft,发信人,ft,是,ft,无,ft,255Q313596790SEND_TIME,ft,String,ft,发信时间,ft,是,ft,无,ft,100Q313596790STATUS,ft,String,ft,状态,ft,否,ft,无,ft,5Q313596790SANME_ID,ft,String,ft,共同ID,ft,是,ft,无,ft,100Q313596790', '2016-03-27 21:39:45', '站内信', 'single');
INSERT INTO `sys_createcode` VALUES ('c7586f931fd44c61beccd3248774c68c', 'system', 'Department', 'SYS_,ft,DEPARTMENT', 'NAME,ft,String,ft,名称,ft,是,ft,无,ft,30Q313596790NAME_EN,ft,String,ft,英文,ft,是,ft,无,ft,50Q313596790BIANMA,ft,String,ft,编码,ft,是,ft,无,ft,50Q313596790PARENT_ID,ft,String,ft,上级ID,ft,否,ft,无,ft,100Q313596790BZ,ft,String,ft,备注,ft,是,ft,无,ft,255Q313596790HEADMAN,ft,String,ft,负责人,ft,是,ft,无,ft,30Q313596790TEL,ft,String,ft,电话,ft,是,ft,无,ft,50Q313596790FUNCTIONS,ft,String,ft,部门职能,ft,是,ft,无,ft,255Q313596790ADDRESS,ft,String,ft,地址,ft,是,ft,无,ft,255Q313596790', '2015-12-20 01:49:25', '组织机构', 'tree');
INSERT INTO `sys_createcode` VALUES ('c937e21208914e5b8fb1202c685bbf2f', 'fhdb', 'Fhdb', 'DB_,ft,FHDB', 'USERNAME,ft,String,ft,操作用户,ft,否,ft,无,ft,50Q313596790BACKUP_TIME,ft,Date,ft,备份时间,ft,否,ft,无,ft,32Q313596790TABLENAME,ft,String,ft,表名,ft,是,ft,无,ft,50Q313596790SQLPATH,ft,String,ft,存储位置,ft,否,ft,无,ft,300Q313596790TYPE,ft,Integer,ft,类型,ft,是,ft,无,ft,1Q313596790DBSIZE,ft,String,ft,文件大小,ft,否,ft,无,ft,10Q313596790BZ,ft,String,ft,备注,ft,否,ft,无,ft,255Q313596790', '2016-03-30 13:46:54', '数据库管理', 'single');
INSERT INTO `sys_createcode` VALUES ('ca4191e897d94e9e805de6ca7da39335', 'ep', 'Employee', ',ft,EMPLOYEE', 'EMP_ID,ft,String,ft,备注1,ft,否,ft,无,ft,36,ft,0Q313596790NAME,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790TELEPHONE,ft,String,ft,备注3,ft,是,ft,无,ft,50,ft,0Q313596790EMAIL,ft,String,ft,备注4,ft,是,ft,无,ft,50,ft,0Q313596790JOB,ft,String,ft,备注5,ft,是,ft,无,ft,50,ft,0Q313596790STORE_ID,ft,String,ft,备注6,ft,是,ft,无,ft,36,ft,0Q313596790SHOPOWNER,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790OPENID,ft,String,ft,备注8,ft,是,ft,无,ft,255,ft,0Q313596790STATUS,ft,String,ft,备注9,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注10,ft,是,ft,无,ft,1,ft,0Q313596790BZ,ft,String,ft,备注11,ft,是,ft,无,ft,255,ft,0Q313596790CREATE_BY,ft,String,ft,备注12,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注13,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注14,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注15,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注16,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-13 16:45:49', 'Employee 员工', 'single');
INSERT INTO `sys_createcode` VALUES ('cd90856d22e145e39a4fd6375d8666da', 'ep', 'Brand', ',ft,BRAND', 'BRAND_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790BRAND_NAME,ft,String,ft,备注2,ft,是,ft,无,ft,20,ft,0Q313596790LEVEL_ID,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注4,ft,是,ft,无,ft,1,ft,0Q313596790CREATE_BY,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注6,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-15 12:03:08', '品牌', 'single');
INSERT INTO `sys_createcode` VALUES ('d3647344f96547c8a1d8ea2eaff14cd8', 'bs', 'Publish', ',ft,PUBLISH', 'PM_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PTYPE_ID,ft,String,ft,备注2,ft,是,ft,无,ft,36,ft,0Q313596790SUB_PTYPE_ID,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790GOODS_NAME,ft,String,ft,备注4,ft,是,ft,无,ft,50,ft,0Q313596790GOODS_ID,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790BUY_PRICE,ft,Integer,ft,备注6,ft,是,ft,无,ft,9,ft,0Q313596790HOPE_PRICE,ft,Integer,ft,备注7,ft,是,ft,无,ft,9,ft,0Q313596790SHOW_TYPE,ft,String,ft,备注8,ft,是,ft,无,ft,1,ft,0Q313596790COVERS_PIC,ft,String,ft,备注9,ft,是,ft,无,ft,255,ft,0Q313596790POSITION_CITY,ft,String,ft,备注10,ft,是,ft,无,ft,100,ft,0Q313596790POSITION_ADDRESS,ft,String,ft,备注11,ft,是,ft,无,ft,100,ft,0Q313596790VIRTUES,ft,String,ft,备注12,ft,是,ft,无,ft,200,ft,0Q313596790FLAWS,ft,String,ft,备注13,ft,是,ft,无,ft,200,ft,0Q313596790SUGGESTION,ft,String,ft,备注14,ft,是,ft,无,ft,200,ft,0Q313596790IS_RECOMMEND,ft,String,ft,备注15,ft,是,ft,无,ft,1,ft,0Q313596790IS_SHIELD,ft,String,ft,备注16,ft,是,ft,无,ft,1,ft,0Q313596790PUBLISH_STATE,ft,String,ft,备注17,ft,是,ft,无,ft,1,ft,0Q313596790PUBLISH_TIME,ft,Date,ft,备注18,ft,是,ft,无,ft,19,ft,0Q313596790INTEGRAL,ft,Integer,ft,备注19,ft,是,ft,无,ft,11,ft,0Q313596790CLICK_COUNT,ft,Integer,ft,备注20,ft,是,ft,无,ft,11,ft,0Q313596790LIKE_COUNT,ft,Integer,ft,备注21,ft,是,ft,无,ft,11,ft,0Q313596790COMMENT_COUNT,ft,Integer,ft,备注22,ft,是,ft,无,ft,11,ft,0Q313596790COLLECT_COUNT,ft,Integer,ft,备注23,ft,是,ft,无,ft,11,ft,0Q313596790CREATED_BY,ft,String,ft,备注24,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注25,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注26,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注27,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-07 14:09:41', '发布', 'single');
INSERT INTO `sys_createcode` VALUES ('d3bb375ca822421c9fca1475a341109c', 'bs', 'Feedback', ',ft,FEEDBACK', 'FEEDBACK_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790USER_ID,ft,String,ft,备注2,ft,是,ft,无,ft,36,ft,0Q313596790ABOUT_STATE,ft,String,ft,备注3,ft,是,ft,无,ft,1,ft,0Q313596790CONTENT,ft,String,ft,备注4,ft,是,ft,无,ft,200,ft,0Q313596790TELEPHONE,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790DO_FLAG,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注7,ft,是,ft,无,ft,1,ft,0Q313596790CREATED_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注12,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注13,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-26 16:37:05', '反馈', 'single');
INSERT INTO `sys_createcode` VALUES ('d4e364b7e3474448a91fecc4a85f7b9b', 'bs', 'SysMessage', ',ft,SYSMESSAGE', 'SYSMESSAGE_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790TITLE,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790MESSAGE_STATE,ft,String,ft,备注3,ft,是,ft,无,ft,1,ft,0Q313596790CONTENT,ft,String,ft,备注4,ft,是,ft,无,ft,200,ft,0Q313596790MESSAGE_TYPE,ft,String,ft,备注5,ft,是,ft,无,ft,1,ft,0Q313596790TARGET_ID,ft,String,ft,备注6,ft,是,ft,无,ft,36,ft,0Q313596790PUBLISH_TIME,ft,Date,ft,备注7,ft,是,ft,无,ft,19,ft,0Q313596790CREATED_BY,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注9,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-08 11:03:01', '系统消息', 'single');
INSERT INTO `sys_createcode` VALUES ('d5cf7998bb174c8aace38b5466291f5d', 'bs', 'AppUser', ',ft,APPUSER', 'USER_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790USER_NAME,ft,String,ft,备注2,ft,是,ft,无,ft,36,ft,0Q313596790ACCOUNT,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790PASSWORD,ft,String,ft,备注4,ft,是,ft,无,ft,50,ft,0Q313596790NICKNAME,ft,String,ft,备注5,ft,是,ft,无,ft,50,ft,0Q313596790GENDER,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790EMAIL,ft,String,ft,备注7,ft,是,ft,无,ft,50,ft,0Q313596790BIRHTDAY,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790CITY,ft,String,ft,备注9,ft,是,ft,无,ft,50,ft,0Q313596790CAREER,ft,String,ft,备注10,ft,是,ft,无,ft,50,ft,0Q313596790SIGN,ft,String,ft,备注11,ft,是,ft,无,ft,50,ft,0Q313596790AVATER,ft,String,ft,备注12,ft,是,ft,无,ft,200,ft,0Q313596790INTEGRAL,ft,Integer,ft,备注13,ft,是,ft,无,ft,9,ft,0Q313596790STATUS,ft,String,ft,备注14,ft,是,ft,无,ft,1,ft,0Q313596790UUID,ft,String,ft,备注15,ft,是,ft,无,ft,36,ft,0Q313596790JPUSH_REGIS_ID,ft,String,ft,备注16,ft,是,ft,无,ft,50,ft,0Q313596790LAST_LOGIN,ft,Date,ft,备注17,ft,是,ft,无,ft,19,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注18,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注19,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注20,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-06-02 14:07:48', '会员', 'single');
INSERT INTO `sys_createcode` VALUES ('e28195c3db5a48a3a57799d7ccbc2ac9', 'lg', 'Displayfb', ',ft,DISPLAYFB', 'DISPLAYFB_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790DISPLAYFB_CODE,ft,String,ft,陈列反馈编号,ft,是,ft,无,ft,50,ft,0Q313596790STORE_ID,ft,String,ft,门店ID,ft,是,ft,无,ft,36,ft,0Q313596790PROPTYPE_ID,ft,String,ft,类型,ft,是,ft,无,ft,36,ft,0Q313596790REMARKS,ft,String,ft,备注,ft,是,ft,无,ft,255,ft,0Q313596790NUM,ft,Integer,ft,反馈次数,ft,是,ft,无,ft,2,ft,0Q313596790STATE,ft,String,ft,状态,ft,是,ft,无,ft,1,ft,0Q313596790SUGGESTION_PERSON,ft,String,ft,反馈意见,ft,是,ft,无,ft,36,ft,0Q313596790SUGGESTION,ft,String,ft,备注9,ft,是,ft,无,ft,255,ft,0Q313596790CREATE_BY,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注11,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注12,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注13,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-20 16:19:49', '陈列反馈', 'single');
INSERT INTO `sys_createcode` VALUES ('f1eada5f17a24132bd7d2885da6e859f', 'bs', 'AppAbout', ',ft,APPABOUT', 'ABOUT_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790ABOUT_STATE,ft,String,ft,备注2,ft,是,ft,无,ft,1,ft,0Q313596790ORDER_BY,ft,Integer,ft,备注3,ft,是,ft,无,ft,1,ft,0Q313596790TITLE,ft,String,ft,备注4,ft,是,ft,无,ft,20,ft,0Q313596790CONTENT,ft,String,ft,备注5,ft,是,ft,无,ft,2000,ft,0Q313596790DELETE_FLAG,ft,String,ft,备注6,ft,是,ft,无,ft,1,ft,0Q313596790CREATED_BY,ft,String,ft,备注7,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注8,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注9,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注10,ft,是,ft,无,ft,19,ft,0Q313596790DELETED_BY,ft,String,ft,备注11,ft,是,ft,无,ft,36,ft,0Q313596790DELETED_TIME,ft,Date,ft,备注12,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-05-25 14:22:42', '关于', 'single');
INSERT INTO `sys_createcode` VALUES ('f8dfc60c00fc459896c565a1c058cd72', 'ep', 'Order', ',ft,ORDER', 'ORDER_ID,ft,String,ft,备注1,ft,是,ft,无,ft,36,ft,0Q313596790PUBPROP_CODE,ft,String,ft,备注2,ft,是,ft,无,ft,50,ft,0Q313596790PUBPROP_ID,ft,String,ft,备注3,ft,是,ft,无,ft,36,ft,0Q313596790SUPPLIER_ID,ft,String,ft,备注4,ft,是,ft,无,ft,36,ft,0Q313596790STORE_ID,ft,String,ft,备注5,ft,是,ft,无,ft,36,ft,0Q313596790INVOICE_CODE,ft,String,ft,备注6,ft,是,ft,无,ft,50,ft,0Q313596790DELIVERY_TIME,ft,Date,ft,备注7,ft,是,ft,无,ft,19,ft,0Q313596790EXPRESS_ID,ft,String,ft,备注8,ft,是,ft,无,ft,36,ft,0Q313596790TRACKING_NUMBER,ft,String,ft,备注9,ft,是,ft,无,ft,50,ft,0Q313596790AGENT_ID,ft,String,ft,备注10,ft,是,ft,无,ft,36,ft,0Q313596790STATE,ft,String,ft,备注11,ft,是,ft,无,ft,1,ft,0Q313596790PROPTYPE_ID,ft,String,ft,备注12,ft,是,ft,无,ft,36,ft,0Q313596790CREATE_BY,ft,String,ft,备注13,ft,是,ft,无,ft,36,ft,0Q313596790CREATED_TIME,ft,Date,ft,备注14,ft,是,ft,无,ft,19,ft,0Q313596790MODIFIED_BY,ft,String,ft,备注15,ft,是,ft,无,ft,36,ft,0Q313596790MODIFIED_TIME,ft,Date,ft,备注16,ft,是,ft,无,ft,19,ft,0Q313596790DEETED_TIME,ft,Date,ft,备注17,ft,是,ft,无,ft,19,ft,0Q313596790', '2017-03-22 10:13:20', '道具申请发货', 'single');
INSERT INTO `sys_createcode` VALUES ('fe239f8742194481a5b56f90cad71520', 'system', 'Fhbutton', 'SYS_,ft,FHBUTTON', 'NAME,ft,String,ft,名称,ft,是,ft,无,ft,30Q313596790QX_NAME,ft,String,ft,权限标识,ft,是,ft,无,ft,50Q313596790BZ,ft,String,ft,备注,ft,是,ft,无,ft,255Q313596790', '2016-01-15 18:38:40', '按钮管理', 'single');
INSERT INTO `sys_createcode` VALUES ('ff6e6cdc87ba42579b033cf4925d4d70', 'dst', 'DataSource2', 'DS_,ft,DATASOURCE2', 'TITLE,ft,String,ft,标题,ft,是,ft,无,ft,100,ft,0Q313596790CONTENT,ft,String,ft,内容,ft,是,ft,无,ft,255,ft,0Q313596790', '2016-05-23 15:51:46', '第2数据源例子', 'single');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('0193ffbfae1e49e0b7810546cada316a', '济南', 'JiNan', '0030301', '1', '10f46a521ea0471f8d71ee75ac3b5f3a', '济南', '');
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', '1', 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', '');
INSERT INTO `sys_dictionaries` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'ShanDong', '00303', '3', 'be4a8c5182c744d28282a5345783a77f', '山东省', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', '1', 'be4a8c5182c744d28282a5345783a77f', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', '1', '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', '');
INSERT INTO `sys_dictionaries` VALUES ('66f1ff79b13947da98525aff7380ef50', '高新区', 'gaoxinqu', '003030101', '1', '0193ffbfae1e49e0b7810546cada316a', '高新区', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', '1', 'fce20eb06d7b4b4d8f200eda623f725c', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', '1', '0', '分类', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', '3', '0', '地区1', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', '1', '8ea7c44af25f48b993a14f791c8d689f', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', '2', '8ea7c44af25f48b993a14f791c8d689f', '绿色', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', '2', 'be4a8c5182c744d28282a5345783a77f', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', '2', '0', '课程', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4c7f34b9eed54683957f356afcda24df', '组织机构数据权限', 'Datajur', '组织机构数据权限按钮');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
INSERT INTO `sys_fhbutton` VALUES ('fc5e8767b4564f34a0d2ce2375fcc92e', '绑定用户', 'userBinding', '绑定用户');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('01b74e94355e40b2957c50c0b0b7c12c', 'admin', '2017-03-20 13:44:45', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('02940ed1d7ab4b5ab306837981c7d436', 'admin', '2017-05-25 13:08:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('02b6d540cd0e4ca0b0d6ee6f2b2aa8a7', 'admin', '2017-03-23 09:28:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('02e035a2b50648608028168f0d7899d2', 'admin', '2017-03-22 15:38:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('054394a726a44c43835537566d52dd61', 'admin', '2017-03-17 09:37:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('08b53636829245eaaf7710be16349e92', 'admin', '2017-03-13 16:37:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a2551e7209c4f4db8f44bdf180defec', 'admin', '2017-03-13 09:55:22', '新增菜单111111');
INSERT INTO `sys_fhlog` VALUES ('0a9b0e7e45b144c1b1d57cd9cf969fb4', 'admin', '2017-03-13 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('110ce7878b0e4419a8e74c552565226c', 'admin', '2017-05-04 10:23:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1261856d234e406eb63f8978852a50fd', 'san', '2016-06-06 03:09:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('12ec4ac547944b879db0b8ff6fff9aff', 'admin', '2017-03-13 10:03:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('13b3cd3b0add428685065099fe0b94ba', 'admin', '2018-11-24 13:25:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('147c021e3cbc482883ddeea3b861638e', 'admin', '2017-06-13 15:20:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('163ca888fe854fb2a7bb94fbb497e2b3', 'admin', '2017-03-13 09:55:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('164f7cadd0db4de78a135205baffb0d1', 'admin', '2018-11-29 14:39:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('168c3d936ffb4ca3ac52fe9b3d892cd0', 'admin', '2018-11-22 16:31:32', '新增按钮权限pd{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=7f7962b303c24cca809dec94651a3e90, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875492559}');
INSERT INTO `sys_fhlog` VALUES ('1734627b6ccf4403ac173f898acd3d68', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('17f5b391f0184a8d98eda539e9a5ab43', 'admin', '2017-03-13 10:02:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1803c2a6038544369c172acdceed7971', 'admin', '2018-11-22 16:31:40', '新增按钮权限pd{BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=42a52623aa144b619263b50fd9d7bad8, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875500782}');
INSERT INTO `sys_fhlog` VALUES ('18b36887ebde473ca4c655d1cfd35249', 'admin', '2018-11-22 16:31:38', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=e7fc2b2996254d67a680ecd71b8baa06, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875498003}');
INSERT INTO `sys_fhlog` VALUES ('19630f81261346a09e527117701e5410', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1a8186db769c4fb1bf1b9ad5da15201b', 'admin', '2017-03-13 09:32:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1b09016f20fb4dc39d517aa5e2420dd0', 'admin', '2017-06-13 15:17:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1b9f6ca0d07042888d0dfda65a8ce266', 'admin', '2017-03-13 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('1bec01aef9f64453974b4a7d6c2491ae', 'admin', '2018-11-22 16:31:37', '新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=1b40f834aa0749ce8b54df04b26968b3, ROLE_ID=de9de2f006e145a29d52dfadda295353, guid=1542875497207}');
INSERT INTO `sys_fhlog` VALUES ('2042d93032d44ae7a74fbc6e4903ae36', 'admin', '2017-03-15 16:52:39', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('20ae7542a6b146a388779fab27db4c50', 'admin', '2018-11-24 11:54:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('22683b42e5b54c02aedbbdbf04d9d971', 'admin', '2017-03-15 18:50:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2284da762df04f18a94ccaf70f5db90a', 'san', '2017-03-13 13:55:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('229356097b7942b6bd673cfbbbba0fe5', 'admin', '2017-03-13 09:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('23c26739ec3e4e03a559429c5f238f02', 'admin', '2018-11-26 10:28:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('257474da6f7f4ba1b054cd24bdb7fedf', 'admin', '2018-11-26 10:04:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27086bcf39c5419789e703ed8c9705ca', 'admin', '2017-03-20 14:05:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('27fb959f6e85461d89f1e58e5511e736', 'admin', '2017-03-13 14:28:38', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('2834e757254444a9b6431d5d3aa2637b', 'admin', '2017-03-16 12:24:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('291f8b683dd244a39e3a427503efe20b', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('29d605ec91b34ecdac261877d52446e2', 'admin', '2017-03-13 09:41:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b48ad9e1d7341d2ba70245ccb5075cb', 'admin', '2017-05-24 13:57:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2dc19d6de523418ebcdbb46d088337a6', 'admin', '2017-05-26 15:57:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ea7edee88f6417eabca52a3b83e8ae4', 'admin', '2017-03-22 10:09:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2ef88ca1fcf54cc2b27fd8384c9fd7dd', 'admin', '2017-03-27 16:55:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30d2c495371c47109a60459ce4b86b41', 'admin', '2017-03-15 14:28:49', '退出');
INSERT INTO `sys_fhlog` VALUES ('31751e81c7a64e809b2b691624397efb', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('327d6014b8974d89aa0dbe98955b4809', 'admin', '2017-03-16 14:30:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32a7ce0e634f4bd0a1b99026fc2d078f', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('33bb5fe48cf94988a20bcc4abf9d25fd', 'admin', '2017-03-13 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('344608ce3ea540c783163bf4e9dbdebc', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('347e9cf44e5e4a9791e2e07208b95a81', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('36b7bbb148414f8ca2b384670bb6023f', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('36e108df2330413a9e85351ec0bd10da', 'admin', '2017-03-23 09:25:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('37d6705fcf1c4002b1f2e109b8166bfb', 'admin', '2017-03-13 09:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3908db9a0ab34ad19ff5283d6d4567d1', 'admin', '2017-03-13 09:42:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('3c3d64b58255425cac7055d4d73cfaef', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('3c718a1a4e5746e7becef29e6700bcc7', 'admin', '2017-03-23 14:18:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d024cdb961647098826a3eb8cca73f0', 'admin', '2017-06-07 13:55:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3d48c435284c461e9f91f8029287b2a3', 'admin', '2017-03-13 09:54:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ed5f3aadba14cf08013faecbfa2f2ba', 'admin', '2017-03-15 17:07:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41620cb286d8423c8ef6d9539dc901c7', 'admin', '2017-04-11 09:57:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('41c1fbfd4aec45d195bfb68cebd36085', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4205ee2c20ad45cd93e006bad9b4ccc1', 'admin', '2017-06-08 16:11:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('438baf325c0f4ccca145f8bfdbb51dce', 'admin', '2017-06-13 15:24:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('452bc8791124485b8f1ca94934c55ebf', 'admin', '2017-06-06 14:33:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4727bbf49d364f0c9da332f321d5636f', 'admin', '2017-03-13 13:55:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('478bbe3f51e8435c8ad45a50eac5f0ca', 'admin', '2017-03-21 15:56:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4827404482034c849443bce01262642c', 'admin', '2018-11-22 16:31:50', '删除按钮权限{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875510627}');
INSERT INTO `sys_fhlog` VALUES ('4c6667adeeda43b487cebfbf32fa59c5', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('4d0b0eaf28b04f27a7460c4d123e068a', 'admin', '2017-03-13 10:05:05', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4def7f309d194c8e87f12fd4bccd4aab', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('4fcdb8492cf5436cb19fd9be3b82ad72', 'admin', '2017-03-13 14:27:14', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('4fe2b8fc0dd3431899770864dd3d7752', 'admin', '2018-11-22 16:31:35', '新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=e46a7a4dbf09466baf3dc51f42b0a277, ROLE_ID=3, guid=1542875495134}');
INSERT INTO `sys_fhlog` VALUES ('5000134423bc4fd5a8bbbd23b7fd0518', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('5136c42d3c2149efa36cf7a96025d5d5', 'wk', '2017-03-23 14:18:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('51bd4260f8b34edeab138d904d715ace', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('52172ab83d0f45bea6225b3f8d43c602', 'admin', '2017-03-13 14:04:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('53ba23cc0ee24844843f772b4f36b2db', 'admin', '2017-06-02 14:06:40', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('550678b7ace5439da59fba3561627a47', 'admin', '2018-11-22 16:31:42', '新增按钮权限pd{BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, RB_ID=d7cfd9be8deb4123a881ccc469c54c93, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875502341}');
INSERT INTO `sys_fhlog` VALUES ('565d68fdbfad4909a839993e607c57c9', 'admin', '2018-11-22 16:31:49', '删除按钮权限{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875509101}');
INSERT INTO `sys_fhlog` VALUES ('56993534280647c68c1858f3dca70c14', 'admin', '2017-03-13 14:06:36', '修改cha_qx权限，角色ID为:7d6ee171b7f544f180fcc622b76b0d02');
INSERT INTO `sys_fhlog` VALUES ('5753e5096c18453792094a0866901354', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('577f5f50056e4108beeb5af4539864b6', 'admin', '2017-06-01 10:04:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('582c45ee77a54e6180f7a994de0f01d6', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5ab8dec7e1eb43568abb39f03b3ff965', 'admin', '2017-06-08 10:58:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5bda212221e74eb4b3f196dd74a91c3a', 'admin', '2018-11-22 16:31:35', '新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=3507dfe6c4714f4aaf7f1fe1ec797068, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1542875495641}');
INSERT INTO `sys_fhlog` VALUES ('5cf7a67640d249f981b55aaa1303ca4e', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('5d45e631c91f45ac860dfa82734477c6', 'admin', '2017-03-21 17:52:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5db0e35e64654c2891ec86514e2fbe7f', 'san', '2016-06-06 02:28:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5ddb0786e46643d7a64c47a5c8eab89c', 'admin', '2017-03-20 17:17:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5fdc7438a9fd45d99ce556f90c1cd5ca', 'admin', '2017-03-13 14:07:02', '退出');
INSERT INTO `sys_fhlog` VALUES ('61468219bb8f4fe99276bef50496010f', 'admin', '2018-11-22 16:27:42', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('61a6aa77042a40f1a43478b8c55016e6', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('6356a59e151a42299546d8510192ec49', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('63dee828e71e4f209d2d1a2a350c13c0', 'admin', '2017-03-13 14:05:22', '新增角色:管理员');
INSERT INTO `sys_fhlog` VALUES ('6403179eefcb4f5f91db4843c7a26f52', 'admin', '2017-03-15 14:28:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('644311283ce74453b19f2b2ea04f6f52', 'admin', '2017-03-20 16:14:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('66be3420db424a2fba5d5ea21ef64d38', 'admin', '2018-11-24 11:45:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69ddbf04fca84ef2aedf03a375352efe', 'admin', '2018-11-24 11:40:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6a7c8821b0cb42ac877d54e3d223a66f', 'admin', '2017-03-17 09:59:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6a8557f7f0294baa9291273831f51417', 'admin', '2017-03-15 14:29:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6b70b9c8c70a434b8013e1322113b3c5', 'admin', '2017-03-13 09:33:10', '修改菜单一级菜单');
INSERT INTO `sys_fhlog` VALUES ('6c11c810a4044840a648ad5c66e3e717', 'admin', '2017-03-17 13:24:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6cb2028745fe4e4dad870c193ce066d5', 'admin', '2017-05-23 14:59:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6cc3d7f8bfcf4dd4b978f76698a48afd', 'admin', '2018-11-22 16:31:40', '新增按钮权限pd{BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=20eb3b45d5c441bc8295ee3fba9f730e, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1542875500269}');
INSERT INTO `sys_fhlog` VALUES ('6f11e7b2c6e4430189666dcada25ab2c', 'admin', '2017-05-27 10:57:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7083218bf47b4c84b3294675600b0803', 'admin', '2017-03-13 13:53:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7088c2d150754bf6b1ded2abc2a7f6af', 'admin', '2017-03-15 14:30:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('70f93717233d4ea6b61ecb01fd41dbf6', 'admin', '2018-11-22 16:31:39', '新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=b1cadd17f8d44994a40a28176c61a0d7, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875499078}');
INSERT INTO `sys_fhlog` VALUES ('719ede6d3ae44f738285e7c05edb9f56', 'admin', '2017-03-13 14:06:28', '修改add_qx权限，角色ID为:7d6ee171b7f544f180fcc622b76b0d02');
INSERT INTO `sys_fhlog` VALUES ('72026bf14e2240acb0cb5240b7cee47a', 'admin', '2018-11-24 14:04:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('73e093cebf084ecda968706423f7b6d3', 'admin', '2017-03-16 10:12:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('743a2de618904d85af22fd1b734edaba', 'admin', '2017-03-13 09:42:29', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('7452d8fe3bcd451c9a2f93f730de5387', 'admin', '2018-11-24 13:47:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74714129d8ad4b4293ca308cad96bd09', 'admin', '2017-03-13 14:06:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('74ed32c22aa244ef8d39de76db601d51', 'admin', '2017-03-13 10:03:16', '新增菜单2222222222');
INSERT INTO `sys_fhlog` VALUES ('75aff19401fc4cb9929131fe102c64d5', 'admin', '2017-03-13 18:00:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('78ab5f7348fd4632b1f550cebca99054', 'admin', '2018-11-22 16:31:33', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=76670900b7864a2392372ed2f97da5b3, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1542875493698}');
INSERT INTO `sys_fhlog` VALUES ('7903c7a40a164f2788c96b51b6134ffe', 'admin', '2017-03-13 14:07:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('794390066c8e4e3ba059d18809e00681', 'admin', '2017-03-15 14:22:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7c2236be32d84716872ba81138a47593', 'admin', '2018-11-22 16:31:41', '新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=ff064398b6614284a9fc48475468802b, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875501234}');
INSERT INTO `sys_fhlog` VALUES ('7c6fc5c3a438447ba983b18bd5beba8d', 'admin', '2017-03-15 13:26:36', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7d76b3152b3a4d1a8d333696d5ca705d', 'admin', '2017-03-15 16:53:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7e37e8b526764b928325642b977c5d54', 'admin', '2018-11-22 16:31:49', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=8f2083bcbaac4a18aebd5b5466b4f8a2, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875509808}');
INSERT INTO `sys_fhlog` VALUES ('7fbabbca15d640639cc0fd261a76725f', 'admin', '2017-03-13 17:54:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('80c1c69342a040a29ff0d354feda4b87', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('8347b67035b74827a3458e5b9df7b9ef', 'admin', '2017-03-13 09:55:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('844b9de809ca4909a353b69948f25f94', 'admin', '2018-11-26 09:45:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('852a8f7b0e3247a3ba8d41edb72a9d28', 'admin', '2016-06-06 02:28:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('868894eae3b24307afb727ac4fd890d1', 'admin', '2017-03-13 13:54:08', '修改系统用户：san');
INSERT INTO `sys_fhlog` VALUES ('87c7f863a2e64c98a314d7f3c584f3ac', 'admin', '2016-06-06 02:27:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('88787fa884964ba69893e307f0f854b3', 'admin', '2017-03-13 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('8b57d2c10a104397bdedfd9a9e100edb', 'admin', '2018-11-26 10:26:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b6e35ecdc88497a8b4caef66cbabc41', 'admin', '2017-06-01 14:15:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8cb44e4b63cd44af9ddf7bc8b03ddeed', 'admin', '2017-06-07 13:55:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8ded458daa534f95ac9090feda2a4dc3', 'wk', '2017-03-23 09:28:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e219f7637234bd4bbee549cf1678eab', 'admin', '2017-03-13 13:54:24', '退出');
INSERT INTO `sys_fhlog` VALUES ('9015673d04f34395844eb33d30ff058b', 'admin', '2017-06-07 15:06:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9058e3e971d54864949867fd87cc4955', 'admin', '2017-03-22 14:38:47', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('905cadd055b847cb9dce295861a1dbf2', 'san', '2016-06-06 02:29:18', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('91c1e99294bb48338086522f76690d8e', 'admin', '2017-03-15 16:52:38', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('924532d3304b457b8e773f6bb082e77e', 'admin', '2017-03-13 09:42:27', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('92ff9bf9cfdf47edb24af82aaee3515e', 'admin', '2018-11-26 09:55:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9510415f2ead425991edb5ebadce932d', 'admin', '2017-03-13 09:47:07', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('956224104ffb4aa49b7ef77f7a776067', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('958eadba9ef94d4ab694679a9f9c0ed1', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('95ff655ef02d4f2ba9480da0679072be', 'admin', '2017-03-23 09:28:15', '新增系统用户：wk');
INSERT INTO `sys_fhlog` VALUES ('983a263914834cd3bd9eca9938472aa1', 'admin', '2017-03-13 09:55:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('984889fd03ea4d949a4ed6cfe1e43fb0', 'admin', '2017-03-13 10:05:05', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('985f68384f8f4b96a3e2367535814baa', 'admin', '2018-11-22 16:31:36', '新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=ba125298bbb64981b4a2690f5f15c034, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875496686}');
INSERT INTO `sys_fhlog` VALUES ('99feaa7da09548228466b99cedaa60d3', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9a69dffea0d44a05b9811f44fc24153d', 'admin', '2017-03-15 19:16:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c230e4494794d4cb43cc6e2809bc301', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('9c74645f0f5142d6bd93c877faba3e26', 'admin', '2017-03-15 14:41:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c7b94008ac941fb9fd4c154104645ef', 'admin', '2017-05-25 15:19:13', '修改菜单111111');
INSERT INTO `sys_fhlog` VALUES ('9d4486c519734a17b2e1e06cf5c36543', 'admin', '2018-11-22 16:31:52', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=afb07921516047ab9af67f33eca28267, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875512163}');
INSERT INTO `sys_fhlog` VALUES ('9f24d9cc64cd45eb81c11532354155c4', 'admin', '2017-03-13 10:03:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a38beeb7942e4634834c53b40f6c857d', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a54a275f6f9b4637aa3299de9e541747', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('a8a00e2dea704e13b3acf230a6bdac96', 'admin', '2017-03-13 13:54:54', '退出');
INSERT INTO `sys_fhlog` VALUES ('a97f183200344d77b4e3c06be1da0e45', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('aa6a831afa5942c892444f3ee16ea7b5', 'admin', '2018-11-26 10:14:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('aa7d0399a604491f8c14e4d09b055140', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ac3c8b679e7a4545be619b7d3d285e19', 'admin', '2018-11-24 11:35:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('acbc4f8a32cd424f96a5102891dbcf09', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ad552538ec24414babd6c2268b98c5f3', 'admin', '2018-11-22 16:26:57', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ae9c32e8589646cb8c3a4a98fa0f9a3e', 'admin', '2017-03-15 16:52:41', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('af4aee65e0f14c869db350c4bd4c1bf7', 'admin', '2016-06-06 00:15:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('afb8af60a8464f589ef5c88dac200fc6', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b0eadaacc0cd436aac04bdc9634f3cb9', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b2676f8fe04748259332b7595f408353', 'admin', '2017-04-12 13:33:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b38e9ac2d84740209682ad4a52b78f1b', 'admin', '2018-11-22 16:31:36', '新增按钮权限pd{BUTTON_ID=4c7f34b9eed54683957f356afcda24df, RB_ID=0486fd7a672a44cba0952d00fd6ee1c8, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875496101}');
INSERT INTO `sys_fhlog` VALUES ('b65e0b3bb4024859897caae807c557f8', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('b995978636184e53aca7a4225c444102', 'admin', '2017-05-31 13:51:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bb9a0a07635f402aaf99f8dfcfa0160a', 'admin', '2017-03-13 13:54:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbdae2f3fa984d9b859470d05901152d', 'admin', '2018-11-22 16:28:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bc1dc171267c4ae1867b396005c53495', 'admin', '2017-03-15 14:28:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('be19fc683ac8467ea79acaaaae6334a6', 'admin', '2017-03-13 09:42:28', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('be62ef9f308a4254aa0cf17acbdea61c', 'admin', '2017-06-13 10:09:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c0025888b9074d36b78accfa83340bfa', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('c24f88af7638476e84481e65ffb3b7d3', 'san', '2016-06-06 02:29:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c2fc47e44c0547cc946b48c044ed2db4', 'admin', '2017-06-06 11:02:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c331020a178349eda16228b112209139', 'admin', '2018-11-22 16:31:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c34559e8e3a24d56a951d7a285bc76f9', 'admin', '2017-03-15 11:57:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c34983f3d67f4088a215fb0fbe549a8a', 'admin', '2017-03-16 15:12:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c48f330c5a854a6a98b1b39e4d9427aa', 'admin', '2017-03-13 14:06:19', '修改角色菜单权限，角色ID为:7d6ee171b7f544f180fcc622b76b0d02');
INSERT INTO `sys_fhlog` VALUES ('c537d6c9ae934635a3da1c19b131b312', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('c9ba6e4d0c3749eabef86f8108018286', 'admin', '2017-03-30 10:28:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cac5921ada564e8ca80fb07a7e713eb7', 'admin', '2018-11-22 16:26:23', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('cd16b906ebd645ab8125ea4cab14d578', 'admin', '2017-03-20 13:45:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ce0bbb2d57a64f2d9d41f2ceac9e9b83', 'admin', '2018-11-22 16:31:41', '新增按钮权限pd{BUTTON_ID=fc5e8767b4564f34a0d2ce2375fcc92e, RB_ID=4ce9c33a51094dc9ac5b016834a52ff9, ROLE_ID=68f8e4a39efe47c7bb869e9d15ab925d, guid=1542875501854}');
INSERT INTO `sys_fhlog` VALUES ('cf5a93108460436099c9d2f04974ea7e', 'admin', '2017-05-25 10:16:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d0b056dc0dc94a6d8d35368585d42ca8', 'admin', '2017-03-13 09:55:02', '修改系统用户：lisi');
INSERT INTO `sys_fhlog` VALUES ('d2dcfce8055a42908c9429e13e2b6939', 'ADMIN', '2017-03-13 17:54:40', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d3c15fbf5e7340e5bc86ad6c950c4341', 'admin', '2017-05-25 09:56:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('d85c40d89e164ead8e36916ed616ef09', 'admin', '2017-03-13 09:33:12', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('d89323286b454d8ab50728a5ca3e41c1', 'admin', '2017-03-16 11:57:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('daa2b19f5f0844e1a05dbc3fe8ec25bf', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('db1f34353600454792f17a02bfad031d', 'admin', '2017-03-13 10:03:16', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('dcf319fce5d44577bc0f4677bb852469', '333', '2017-03-13 13:54:33', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ddb563100d9249c3aaf71f65886d4f3a', 'admin', '2017-03-13 09:42:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('df279f7ecae24dd09551039e7a2a241b', 'admin', '2017-03-15 16:52:49', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('e327d6a8415a4cf8bf2d92491c1b428f', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('e33d7f2661544c049036b3aa58faa978', 'admin', '2018-11-22 16:31:38', '新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=695b2630960b458daf7028a83a4dca6f, ROLE_ID=3264c8e83d0248bb9e3ea6195b4c0216, guid=1542875498615}');
INSERT INTO `sys_fhlog` VALUES ('e352db7854cb41229e70c2e01241a38a', 'admin', '2017-03-13 09:55:22', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('e7bf3ac392954e509e4c0341f4869a95', 'san', '2016-06-06 02:29:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('e81f5297ab9b413eacd22b7c31312588', 'admin', '2017-03-13 14:28:27', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('e92d120c058d4751bfc97b3cd5cfc6b8', 'admin', '2017-03-16 14:10:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e9c72d2d705b4dca97b9ab3082b54026', 'admin', '2017-05-25 09:55:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ea396b083d014dfdba7941199e54618e', 'admin', '2017-03-13 10:05:06', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('ec7f28039c074740879f1622ee288784', 'admin', '2017-03-13 09:55:23', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f09f5cfb4ae44e60a1873cc1b015cc2e', 'admin', '2017-03-16 11:26:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f106264860544b5c82fede19daf3204f', 'admin', '2017-06-08 09:06:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f12c62cc36ba4266812297d729c1c556', 'admin', '2017-03-13 09:33:11', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f293e6069e794da9a69d9ea5e4549995', 'admin', '2017-03-13 09:42:27', '修改菜单null');
INSERT INTO `sys_fhlog` VALUES ('f2db2fbccf2047538103f4141ef8cc3d', 'admin', '2017-03-13 09:55:24', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('f9a438d2df864322b4b98560f6f2bcff', 'admin', '2017-06-07 09:18:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fb0a54a615a74a7abe302823bfdffec9', 'admin', '2017-03-23 09:26:58', '修改del_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('fd0b7af40c8c45349d5fd4865f40defc', 'admin', '2017-03-13 10:03:17', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fd2f5b75bf5146b9ad98588cad9c08e2', 'admin', '2017-03-13 10:05:05', '新增菜单null');
INSERT INTO `sys_fhlog` VALUES ('fd90d61ecf1143e185ff92467a3e96b2', 'admin', '2017-03-20 09:41:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fddfd6f7a8fc45e8b59b8a0e774dce1f', 'admin', '2018-11-22 16:31:33', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=6a70ee7f337848dda537e04ad35d466f, ROLE_ID=7d6ee171b7f544f180fcc622b76b0d02, guid=1542875493128}');

-- ----------------------------
-- Table structure for sys_fhsms
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhsms`;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhsms
-- ----------------------------
INSERT INTO `sys_fhsms` VALUES ('05879f5868824f35932ee9f2062adc03', '你好', '2', 'admin', 'san', '2016-01-25 14:05:31', '1', 'b311e893228f42d5a05dbe16917fd16f');
INSERT INTO `sys_fhsms` VALUES ('2635dd035c6f4bb5a091abdd784bd899', '你好', '2', 'san', 'admin', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('52378ccd4e2d4fe08994d1652af87c68', '你好', '1', 'admin', 'san', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');
INSERT INTO `sys_fhsms` VALUES ('77ed13f9c49a4c4bb460c41b8580dd36', 'gggg', '2', 'admin', 'san', '2016-01-24 21:22:43', '2', 'dd9ee339576e48c5b046b94fa1901d00');
INSERT INTO `sys_fhsms` VALUES ('98a6869f942042a1a037d9d9f01cb50f', '你好', '1', 'admin', 'san', '2016-01-25 14:05:02', '1', '1b7637306683460f89174c2b025862b5');
INSERT INTO `sys_fhsms` VALUES ('9e00295529014b6e8a27019cbccb3da1', '柔柔弱弱', '1', 'admin', 'san', '2016-01-24 21:22:57', '1', 'a29603d613ea4e54b5678033c1bf70a6');
INSERT INTO `sys_fhsms` VALUES ('d3aedeb430f640359bff86cd657a8f59', '你好', '1', 'admin', 'san', '2016-01-24 21:22:12', '1', 'f022fbdce3d845aba927edb698beb90b');
INSERT INTO `sys_fhsms` VALUES ('e5376b1bd54b489cb7f2203632bd74ec', '管理员好', '2', 'admin', 'san', '2016-01-25 14:06:13', '2', 'b347b2034faf43c79b54be4627f3bd2b');
INSERT INTO `sys_fhsms` VALUES ('e613ac0fcc454f32895a70b747bf4fb5', '你也好', '2', 'admin', 'san', '2016-01-25 16:27:54', '2', 'ce8dc3b15afb40f28090f8b8e13f078d');
INSERT INTO `sys_fhsms` VALUES ('f25e00cfafe741a3a05e3839b66dc7aa', '你好', '2', 'san', 'admin', '2016-01-25 16:26:44', '1', '920b20dafdfb4c09b560884eb277c51d');

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_loginimg
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('4', '文件管理', 'fhfile/list.do', '59', '3', 'menu-icon fa fa-folder-open purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', '1');
INSERT INTO `sys_menu` VALUES ('7', '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '8', 'menu-icon fa fa-tachometer red', '1', '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', '1');
INSERT INTO `sys_menu` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', 'menu-icon fa fa-envelope-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', 'menu-icon fa fa-barcode green', '1', '1');
INSERT INTO `sys_menu` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', 'menu-icon fa fa-globe black', '1', '1');
INSERT INTO `sys_menu` VALUES ('15', '微信管理', '#', '0', '4', 'menu-icon fa fa-comments purple', '2', '1');
INSERT INTO `sys_menu` VALUES ('16', '文本回复', 'textmsg/list.do', '15', '2', 'menu-icon fa fa-comment green', '2', '1');
INSERT INTO `sys_menu` VALUES ('17', '应用命令', 'command/list.do', '15', '4', 'menu-icon fa fa-comment grey', '2', '1');
INSERT INTO `sys_menu` VALUES ('18', '图文回复', 'imgmsg/list.do', '15', '3', 'menu-icon fa fa-comment pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('19', '关注回复', 'textmsg/goSubscribe.do', '15', '1', 'menu-icon fa fa-comment orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `sys_menu` VALUES ('21', '打印测试', 'tool/printTest.do', '9', '7', 'menu-icon fa fa-hdd-o grey', '1', '1');
INSERT INTO `sys_menu` VALUES ('22', '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '2', '1');
INSERT INTO `sys_menu` VALUES ('23', '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('24', '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('30', '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('31', '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('32', '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('33', '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('34', '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('35', '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('42', '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', '1');
INSERT INTO `sys_menu` VALUES ('43', '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', '1');
INSERT INTO `sys_menu` VALUES ('44', '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', '1');
INSERT INTO `sys_menu` VALUES ('45', '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('46', '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('47', '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('48', '图表报表', ' tool/fusionchartsdemo.do', '9', '5', 'menu-icon fa fa-bar-chart-o black', '1', '1');
INSERT INTO `sys_menu` VALUES ('50', '站内信', 'fhsms/list.do', '6', '3', 'menu-icon fa fa-envelope green', '1', '1');
INSERT INTO `sys_menu` VALUES ('51', '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', '1');
INSERT INTO `sys_menu` VALUES ('52', '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', '1');
INSERT INTO `sys_menu` VALUES ('53', '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('54', '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('55', '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('56', '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('57', '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('58', 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('59', 'OA办公', '#', '0', '6', 'menu-icon fa fa-laptop pink', '2', '1');
INSERT INTO `sys_menu` VALUES ('60', '组织机构', 'department/listAllDepartment.do?DEPARTMENT_ID=0', '59', '1', 'menu-icon fa fa-users green', '1', '1');
INSERT INTO `sys_menu` VALUES ('61', '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('62', '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', '1');
INSERT INTO `sys_menu` VALUES ('63', '主附结构', 'attached/list.do', '6', '2', 'menu-icon fa fa-folder-open blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('64', '员工管理', 'staff/list.do', '59', '2', 'menu-icon fa fa-users blue', '1', '1');
INSERT INTO `sys_menu` VALUES ('65', '多数据源', 'datasource2/list.do', '6', '4', 'menu-icon fa fa-folder-open-o purple', '1', '0');
INSERT INTO `sys_menu` VALUES ('66', '下拉联动', 'linkage/view.do', '6', '5', 'menu-icon fa fa-exchange green', '1', '1');
INSERT INTO `sys_menu` VALUES ('67', '111111', '#', '0', '11', 'menu-icon fa fa-leaf black', '1', '0');
INSERT INTO `sys_menu` VALUES ('68', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('69', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('70', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('71', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('72', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('73', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('74', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('75', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('76', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('77', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('78', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('79', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('80', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('81', '2222222222', '#', '0', '22', 'menu-icon fa fa-leaf black', '1', '1');
INSERT INTO `sys_menu` VALUES ('82', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('83', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('84', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('85', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('86', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('87', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('88', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('89', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('90', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('91', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('92', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('93', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('94', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('95', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('96', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('97', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('98', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('99', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('100', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);
INSERT INTO `sys_menu` VALUES ('101', null, null, null, null, 'menu-icon fa fa-leaf black', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '147573389638682795998', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '会员组', '', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3', '注册用户', '', '1', '', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '147573389638682795998', '1', '36892925196425486294', '36892917499844091862', '36892925196425486294', '36892925196425486294');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '73786413343844589510', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('7d6ee171b7f544f180fcc622b76b0d02', '管理员', '9826886221838', '1', '9826886221838', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '73786413343844589510', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('0486fd7a672a44cba0952d00fd6ee1c8', '68f8e4a39efe47c7bb869e9d15ab925d', '4c7f34b9eed54683957f356afcda24df');
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('1b40f834aa0749ce8b54df04b26968b3', 'de9de2f006e145a29d52dfadda295353', '4c7f34b9eed54683957f356afcda24df');
INSERT INTO `sys_role_fhbutton` VALUES ('20eb3b45d5c441bc8295ee3fba9f730e', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('3507dfe6c4714f4aaf7f1fe1ec797068', '3264c8e83d0248bb9e3ea6195b4c0216', '4c7f34b9eed54683957f356afcda24df');
INSERT INTO `sys_role_fhbutton` VALUES ('42a52623aa144b619263b50fd9d7bad8', '7d6ee171b7f544f180fcc622b76b0d02', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('469ffb4848ad49c389867d99560a4698', 'de9de2f006e145a29d52dfadda295353', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('4ce9c33a51094dc9ac5b016834a52ff9', '68f8e4a39efe47c7bb869e9d15ab925d', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('4ee1e2bc03a64ef1bc578fcf2e2ea2c1', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('5669c8754b4d4e368365ed5065f9fc10', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('695b2630960b458daf7028a83a4dca6f', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('6a70ee7f337848dda537e04ad35d466f', '7d6ee171b7f544f180fcc622b76b0d02', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('6cc655a1f9b746eea6af9df540f8e743', '3', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('76670900b7864a2392372ed2f97da5b3', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('7f7962b303c24cca809dec94651a3e90', '7d6ee171b7f544f180fcc622b76b0d02', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('81d31bc5bf02490a85ce496b6755ef26', '3', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('88f66a65ee1642bea7979e0e1050ac5f', '3', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('8e478e8615ee455e95671ba05a29e457', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('91958c938bfe4a5fb7b18c7c6a871848', '3264c8e83d0248bb9e3ea6195b4c0216', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('9c30cc6b58da480b83c8566f83f9f639', '3', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('a45f54074f634b698038455f204faf26', 'de9de2f006e145a29d52dfadda295353', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('afb07921516047ab9af67f33eca28267', '68f8e4a39efe47c7bb869e9d15ab925d', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('b1cadd17f8d44994a40a28176c61a0d7', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('ba125298bbb64981b4a2690f5f15c034', '7d6ee171b7f544f180fcc622b76b0d02', '4c7f34b9eed54683957f356afcda24df');
INSERT INTO `sys_role_fhbutton` VALUES ('cebf4460cdb64161aa158baae84962fa', 'de9de2f006e145a29d52dfadda295353', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('d51dc41918b040a78a021c9a43caf8d5', '68f8e4a39efe47c7bb869e9d15ab925d', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('d7cfd9be8deb4123a881ccc469c54c93', '7d6ee171b7f544f180fcc622b76b0d02', 'fc5e8767b4564f34a0d2ce2375fcc92e');
INSERT INTO `sys_role_fhbutton` VALUES ('d80abc961d594f75b65e90d5b7437aa9', '3', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('e46a7a4dbf09466baf3dc51f42b0a277', '3', '4c7f34b9eed54683957f356afcda24df');
INSERT INTO `sys_role_fhbutton` VALUES ('e7fc2b2996254d67a680ecd71b8baa06', '7d6ee171b7f544f180fcc622b76b0d02', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f919c1f620634bdaa353a9f63194a2e0', '3', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('ff064398b6614284a9fc48475468802b', '7d6ee171b7f544f180fcc622b76b0d02', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('065202edd0cc44188e9c59c07b4742e1', 'f5', 'ee799c79f95442fe304a9a8f62d3988ae034cde8', 'f5', '', '3', '', '', '0', '注册用户', 'default', '12121212@qq.com', '', '');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 'FH', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2018-11-29 14:39:14', '0:0:0:0:0:0:0:1', '0', 'admin', 'default', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('151aeac5570e4059b06329b65095f6a6', 'w5', 'b59f639d71549e18865961c6872a6140dcbb3c6c', 'ssssw', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', '121312', 'default', '121212121@qq.com', '21312312', '13798585856');
INSERT INTO `sys_user` VALUES ('280417faf62348ad82de85fa82206c85', 'w3', 'd77c1e457d6af24fa0bf31f0c08c331aaa15fd44', 'kkl', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', 'q1', 'default', '25222222@qq.com', '33656', '13796586965');
INSERT INTO `sys_user` VALUES ('3f9724ccba2c47eb80697d58ad281b60', 'wk', 'c1cc5017f5374596b15eefb74eb6d609f9b07a46', '1', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2017-03-23 09:28:30', '192.168.4.78', '0', '', 'default', 'dddd@sina.com', '1', '11111111111');
INSERT INTO `sys_user` VALUES ('456a34455b1241ebb7c373e4a245694c', 'f3', '2002cd759cf57a4eacdfe45110a76cf2a517c5fd', '111', '', '3', '', '', '0', '注册用户', 'default', '111@qq.com', '', '');
INSERT INTO `sys_user` VALUES ('69177258a06e4927b4639ab1684c3320', 'san', '47c4a8dc64ac2f0bb46bbd8813b037c9718f9349', '三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2017-03-13 13:55:02', '127.0.0.1', '0', '111', 'default', '978336446@qq.com', '333', '13562202556');
INSERT INTO `sys_user` VALUES ('69a8805832814c78b61563b6e787bd40', 'w2', 'a5815a141484a0a71ac71a11ca2faf5f7c67e8e7', 'wwqw', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', '1121', 'default', '12111111@qq.com', '121212', '13562202225');
INSERT INTO `sys_user` VALUES ('896496bf0906410d8495110e1b14f69e', 'oo1', '6a3833e90aeb440deba899cc9b39fbc79c18a946', 'D1', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '121', 'default', 'pppp@qq.com', '12ww', '13793758969');
INSERT INTO `sys_user` VALUES ('9991f4d7782a4ccfb8a65bd96ea7aafa', 'lisi', '2612ade71c1e48cd7150b5f4df152faa699cedfe', '李四333', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2016-06-02 23:51:57', '127.0.0.1', '0', '小李', 'default', '313596790@qq.com', '1102', '13566233663');
INSERT INTO `sys_user` VALUES ('9a89f6cd9b654b71b39c6f8c6a54d6df', 's2', '796927602c27126ba11cb413b8549e8dc9c20fad', 'qwq', '', 'de9de2f006e145a29d52dfadda295353', '', '', '0', 'qq1', 'default', 'wwwwww@qq.com', '121211212', '13797858569');
INSERT INTO `sys_user` VALUES ('e128d0b8807b4a128d6390c44a6accef', 'tt1', '92617286a7ea59a8674463ea055e4fc727fb62b4', 'sss', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', 'ww', 'default', 'qqqqq@qq.com', '122121', '13793736586');
INSERT INTO `sys_user` VALUES ('e29149962e944589bb7da23ad18ddeed', 'zhangsan', 'c2da1419caf053885c492e10ebde421581cdc03f', '张三', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', '小张', 'default', 'zhangsan@www.com', '1101', '2147483647');
INSERT INTO `sys_user` VALUES ('e4a6c22ca4244d18ab969367677f5d5a', 'f1', '172179e343c5a9e153d41a658821556da74d1926', 'FH', '', '3', '2016-05-10 17:25:52', '127.0.0.1', '0', '注册用户', 'default', 'fhadmin@183.com', '', '');
INSERT INTO `sys_user` VALUES ('eded77bdf35347249b2bacfa181c869d', 'w1', 'c46e5c325e9edfbf213d5d82018ba3c522eabbea', '1212', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '111', 'default', '1111116@qq.com', '112', '13566625555');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userphoto
-- ----------------------------

-- ----------------------------
-- Table structure for tb_attached
-- ----------------------------
DROP TABLE IF EXISTS `tb_attached`;
CREATE TABLE `tb_attached` (
  `ATTACHED_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `FDESCRIBE` varchar(255) DEFAULT NULL COMMENT '描述',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '价格',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ATTACHED_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attached
-- ----------------------------
INSERT INTO `tb_attached` VALUES ('08610c0a7b8c4513b27774b60ab51fea', '333333', '33', '3.00', '2017-03-17 10:00:55');
INSERT INTO `tb_attached` VALUES ('60d05d8e7d9046a4893f8bdaa34d6488', 'eee', 'ee', '22.00', '2016-04-22 15:33:23');
INSERT INTO `tb_attached` VALUES ('d74b6f507e784607b8f85e31e3cfad22', 'AA', 'aaa', '222.00', '2016-04-17 18:20:41');

-- ----------------------------
-- Table structure for tb_attachedmx
-- ----------------------------
DROP TABLE IF EXISTS `tb_attachedmx`;
CREATE TABLE `tb_attachedmx` (
  `ATTACHEDMX_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '创建日期',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ATTACHED_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ATTACHEDMX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attachedmx
-- ----------------------------
INSERT INTO `tb_attachedmx` VALUES ('04717d1a034c4e51aacd5e062a4c63bd', 'ddd', 'ddd', '2016-03-29', '111.00', 'd74b6f507e784607b8f85e31e3cfad22');
INSERT INTO `tb_attachedmx` VALUES ('5aae8f93f5e144f9b6f203f029bbeba6', '1', '1', '2017-02-28', '1.00', '60d05d8e7d9046a4893f8bdaa34d6488');
INSERT INTO `tb_attachedmx` VALUES ('7992c783fd0b476d90be363858a941ba', 'ddd', 'ddsds', '2016-04-06', '222.00', 'd74b6f507e784607b8f85e31e3cfad22');
INSERT INTO `tb_attachedmx` VALUES ('907e81090ecb46cf9dc7e5c1c04492a9', '1', '1', '2017-02-28', '1.00', '08610c0a7b8c4513b27774b60ab51fea');
INSERT INTO `tb_attachedmx` VALUES ('908ff382f82c4038a6adde8a25435aa9', '2', '2', '2017-03-06', '11.00', '60d05d8e7d9046a4893f8bdaa34d6488');
INSERT INTO `tb_attachedmx` VALUES ('e94f702d4435431ba91a9a9b683e6dfd', '11', '1', '2017-05-30', '1.00', '08610c0a7b8c4513b27774b60ab51fea');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('1a10aa29f5c44308a40a59433aaf699a', '图片', '285ae68f4095489da02660ee778dc8dd.jpg', '20170315/285ae68f4095489da02660ee778dc8dd.jpg', '2017-03-15 14:30:50', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('b67dcf6325ef45ebb1f32e7c35020eec', '图片', '1cb82a2482e947cf8b161dc1d0d20665.jpg', '', '2017-03-15 12:04:11', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '2', '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '这里是关注后回复的内容', '2015-05-11 02:12:36', '1', '关注回复');
