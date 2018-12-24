/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : bossdream_db

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-12-25 00:37:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bd_abstracts
-- ----------------------------
DROP TABLE IF EXISTS `bd_abstracts`;
CREATE TABLE `bd_abstracts` (
  `abstracts_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '内容简图',
  `type_id` smallint(2) NOT NULL DEFAULT '0' COMMENT '提取内容类型：0.默认（禁用，未生效）1.注册协议2.押金协议3.pc首页顶部菜单4.pc首页中部内容5.pc首页底部栏6.pc二维码7.pc首页关于我们内容',
  `type_name` varchar(255) NOT NULL COMMENT '类型名称',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态：0.默认（未发布）1.发布9.禁用',
  `skip_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转url',
  `details_url` varchar(255) NOT NULL DEFAULT '' COMMENT '详情H5页url',
  `details_text` text COMMENT '详情页源码',
  `creater_id` bigint(20) NOT NULL COMMENT '创建人ID（管理员ID）',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `subject` varchar(32) NOT NULL DEFAULT '' COMMENT '主题，内容',
  PRIMARY KEY (`abstracts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='提取内容表（提取管理固定内容）';

-- ----------------------------
-- Table structure for bd_abstracts_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_abstracts_type`;
CREATE TABLE `bd_abstracts_type` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '抽离类型ID',
  `type_name` varchar(255) NOT NULL COMMENT '抽离类型名称',
  `type_num` smallint(3) NOT NULL DEFAULT '0' COMMENT '类型编号',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_activity_push_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_activity_push_record`;
CREATE TABLE `bd_activity_push_record` (
  `push_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(2000) NOT NULL DEFAULT '' COMMENT '推送的内容',
  `content_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '推送的内容类型: 1-普通订单 2-售后订单 3-装修订单 4-评价订单 5-材料订单 6-系统公告 7-提现通知 8-中奖通知',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '目标用户ID',
  `user_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '目标用户类型',
  `phones` varchar(255) NOT NULL DEFAULT '' COMMENT '推送说手机号',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '消息状态：0-未读 1-已读',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `url` varchar(500) NOT NULL DEFAULT '' COMMENT 'url',
  PRIMARY KEY (`push_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_activity_time
-- ----------------------------
DROP TABLE IF EXISTS `bd_activity_time`;
CREATE TABLE `bd_activity_time` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '活动名称',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '活动类型:1.年会电脑抽奖 2.手机工人抽奖3.手机普通抽奖',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0.未生效1.生效（同类型只能有一个生效）',
  `begin_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `rule` varchar(1500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '活动规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='活动时间管理';

-- ----------------------------
-- Table structure for bd_ad
-- ----------------------------
DROP TABLE IF EXISTS `bd_ad`;
CREATE TABLE `bd_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `image_md5key` varchar(50) NOT NULL DEFAULT '' COMMENT '广告图片Oss端key',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告路径',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序 1-降序 2-升序',
  `ad_type` int(1) NOT NULL DEFAULT '0' COMMENT '广告类别：1-案例展示 , 2-商品 ,3-设计师,4-监理,5-公司,6-新闻',
  `public_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公共的ID',
  `firm_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `province_id` int(9) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city_id` int(9) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `area_id` int(9) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `area` varchar(32) DEFAULT NULL,
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '区域等级:0-全国通用 1-省 2-市 3-区',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `app_type` int(1) NOT NULL DEFAULT '0' COMMENT 'app类型:0-业主端 1-服务端 ',
  `show_location` int(1) NOT NULL DEFAULT '0' COMMENT '广告展示的位置;0-首页　１-APP启动广告',
  `countdown` bigint(2) NOT NULL DEFAULT '0' COMMENT '倒计时　秒',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_ad_area
-- ----------------------------
DROP TABLE IF EXISTS `bd_ad_area`;
CREATE TABLE `bd_ad_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ad_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '广告ID',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_admin
-- ----------------------------
DROP TABLE IF EXISTS `bd_admin`;
CREATE TABLE `bd_admin` (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `pay_password` varchar(255) NOT NULL DEFAULT '14e1b600b1fd579f47433b88e8d85291' COMMENT '支付密码/审核密码',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `photo` varchar(255) NOT NULL COMMENT '头像',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '负责人姓名',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '性别, 0.女, 1.男',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '联系邮箱',
  `available` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不可用，1可用，2禁用',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID，0非品牌用户',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员负责省份',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员负责市',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员负责区',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员手机号',
  `circle_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商圈类型ID，0为非商圈账户',
  `circle_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商圈类型名',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '厂商（供应商）ID,0非厂商账户',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '厂商名称',
  `warehouse_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库ID(仓库管理员)',
  `warehouse_name` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库名称',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1044 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_aftersale_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_aftersale_order`;
CREATE TABLE `bd_aftersale_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `repairs_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '报修子类型ID',
  `repairs_name` varchar(255) NOT NULL DEFAULT '' COMMENT '子类型名称',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单维修子类型',
  `rep_child_id` int(20) NOT NULL DEFAULT '0' COMMENT '报修类型ID',
  `rep_child_name` varchar(255) NOT NULL DEFAULT '' COMMENT '报修类型名称',
  `tag` int(1) NOT NULL DEFAULT '0' COMMENT '子类型标记：１－设备　２－其他',
  `level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单优先级ID',
  `level_name` varchar(255) NOT NULL DEFAULT '' COMMENT '优先级名称',
  `level_timeliness` int(10) NOT NULL DEFAULT '0' COMMENT '时效规定（小时）',
  `level_ratio` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '费用比例',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '连锁品牌ID',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` varchar(23) NOT NULL DEFAULT '' COMMENT '省',
  `province_id` int(8) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `city_id` int(8) NOT NULL DEFAULT '0' COMMENT '市ID',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单区域ID',
  `street` varchar(32) NOT NULL DEFAULT '' COMMENT '街道',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `longitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '纬度',
  `critic` int(1) NOT NULL DEFAULT '0' COMMENT '评价状态，0.未评价，1.已评价',
  `proof_video` varchar(1000) NOT NULL DEFAULT '' COMMENT '维修凭证视频(维修前)',
  `proof_radio` varchar(1000) NOT NULL DEFAULT '' COMMENT '维修凭证录音(维修前)',
  `proof_image` varchar(255) NOT NULL DEFAULT '' COMMENT '维修凭证图片(维修前)',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '维修说明',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_class` int(1) NOT NULL DEFAULT '0' COMMENT '门店种类 1-连锁门店  2-非连锁门店',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `arrival_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人到店时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `is_guarantee_in` int(1) NOT NULL DEFAULT '0' COMMENT '是否在质保期内：0-质保期外　１－质保期内',
  `pertain_name` varchar(255) NOT NULL DEFAULT '' COMMENT '质保期内为公司,质保期外为个人',
  `fault_name` varchar(30) NOT NULL DEFAULT '' COMMENT '故障名称',
  `server_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '服务人ID',
  `server_name` varchar(255) NOT NULL DEFAULT '' COMMENT '服务人名称',
  `server_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工人费用',
  `details_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '维修详情费用',
  `total_price` decimal(10,2) DEFAULT '0.00' COMMENT '总价格',
  `target_image` varchar(255) NOT NULL DEFAULT '' COMMENT '维修目标图片(维修后)',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `pay_order_num` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `solution` varchar(1000) NOT NULL DEFAULT '' COMMENT '解决方案',
  `is_month_pay` int(1) NOT NULL DEFAULT '0' COMMENT '0-非月结(日结)  1-月结',
  `finish_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单支付完成/取消完成时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0-待服务, 1-已派单 , 2-待支付 , 3-已完成 , 4-已取消',
  `equ_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `equ_num` varchar(255) NOT NULL DEFAULT '' COMMENT '保修设备编号',
  `equ_label` int(1) NOT NULL DEFAULT '0' COMMENT '设备类型: 0-非智能设备  1-智能设备',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_aftersale_order_details
-- ----------------------------
DROP TABLE IF EXISTS `bd_aftersale_order_details`;
CREATE TABLE `bd_aftersale_order_details` (
  `details_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单详情ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `parts_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '配件ID',
  `item` varchar(100) NOT NULL DEFAULT '' COMMENT '项目名称',
  `amount` int(6) NOT NULL DEFAULT '0' COMMENT '单个项目数量',
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计',
  PRIMARY KEY (`details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_aftersale_order_monthly
-- ----------------------------
DROP TABLE IF EXISTS `bd_aftersale_order_monthly`;
CREATE TABLE `bd_aftersale_order_monthly` (
  `monthly_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '月结ID',
  `cus_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '连锁用户ID',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_name` varchar(255) NOT NULL DEFAULT '' COMMENT '门店名',
  `order_count` int(10) NOT NULL DEFAULT '0' COMMENT '门店月度订单总数',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前月度订单总金额',
  `month` int(6) NOT NULL DEFAULT '0' COMMENT '月度:yyyyMM格式',
  `begin_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单完成时间的-本月初起始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单完成时间的-次月起始时间',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态，0未付款，1待审核，2已付款,3取消',
  PRIMARY KEY (`monthly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_aftersale_order_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_aftersale_order_pay_record`;
CREATE TABLE `bd_aftersale_order_pay_record` (
  `link_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cus_name` varchar(255) NOT NULL DEFAULT '' COMMENT '连锁用户登入名',
  `cus_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '连锁用户ID',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前月度门店订单总金额',
  `shroff_account` varchar(19) NOT NULL DEFAULT '' COMMENT '收款账号',
  `shroff_firm_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收款公司名',
  `shroff_bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行',
  `month` int(6) NOT NULL DEFAULT '0' COMMENT '月度',
  `begin_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单完成时间的-本月初起始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单完成时间的-次月起始时间',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态，0未付款，1待审核，2已付款,3取消',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `prove_image` varchar(255) NOT NULL DEFAULT '' COMMENT '付款凭证',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_amap_area
-- ----------------------------
DROP TABLE IF EXISTS `bd_amap_area`;
CREATE TABLE `bd_amap_area` (
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属父级区域ID',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '区域名称',
  `short_name` varchar(200) NOT NULL DEFAULT '' COMMENT '短名，简名',
  `longitude` float NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` float NOT NULL DEFAULT '0' COMMENT '纬度',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '区域级别：省（直辖市），市（地级市），区（县），街道',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_app_versions
-- ----------------------------
DROP TABLE IF EXISTS `bd_app_versions`;
CREATE TABLE `bd_app_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `system_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '系统类型: 0-android  1-ios',
  `app_type` smallint(1) NOT NULL DEFAULT '0' COMMENT 'app类型:0-业主端 1-服务端',
  `version_code` varchar(50) NOT NULL DEFAULT '' COMMENT '版本号',
  `version_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '版本类型: 0-选择更新 1-强制更新',
  `version_big` varchar(50) NOT NULL DEFAULT '' COMMENT '新版本大小',
  `download_url` varchar(50) NOT NULL DEFAULT '' COMMENT '更新地址',
  `update_title` varchar(50) NOT NULL DEFAULT '' COMMENT '升级信息简要',
  `update_message` varchar(4000) NOT NULL COMMENT '升级信息详情',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '版本信息:0-最新版本 1-之前老版本',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '版本创建时间',
  `description` varchar(4000) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_area
-- ----------------------------
DROP TABLE IF EXISTS `bd_area`;
CREATE TABLE `bd_area` (
  `area_id` int(11) NOT NULL COMMENT '区域ID',
  `parent_id` int(11) NOT NULL COMMENT '所属父级区域ID',
  `name` varchar(200) NOT NULL COMMENT '区域名称',
  `short_name` varchar(200) NOT NULL COMMENT '短名，简名',
  `longitude` float NOT NULL COMMENT '经度',
  `latitude` float NOT NULL COMMENT '纬度',
  `level` int(11) NOT NULL COMMENT '区域级别：省（直辖市），市（地级市），区（县），街道',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_attribute
-- ----------------------------
DROP TABLE IF EXISTS `bd_attribute`;
CREATE TABLE `bd_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '属性名',
  `value` text NOT NULL COMMENT '属性值',
  `sort` int(10) NOT NULL DEFAULT '1' COMMENT '排序',
  `category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '类别ID',
  `category_name` varchar(32) NOT NULL DEFAULT '' COMMENT '归属类别名称',
  `is_sku` int(1) NOT NULL DEFAULT '0' COMMENT '是否是库存单元属性：0否，1是',
  `is_condition` int(1) NOT NULL DEFAULT '0' COMMENT '是筛选条件：0否，1是',
  `is_show` int(1) NOT NULL DEFAULT '1' COMMENT '是否可用/显示:0否，1是',
  `select_type` int(1) NOT NULL DEFAULT '0' COMMENT '提供选择的样式类型:1select，2checkbox, 3radio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_audit_op
-- ----------------------------
DROP TABLE IF EXISTS `bd_audit_op`;
CREATE TABLE `bd_audit_op` (
  `audit_op_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '审核操作记录ID',
  `order_type` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未定义，1工装订单2.售后月结记录3.提现记录',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID、记录ID',
  `auditor` bigint(20) unsigned NOT NULL COMMENT '审核人ID',
  `audit_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `audit_type` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未定义，1工装一期审核，2工装二期审核，3工装三期审核，4工装完工审核5.售后月结审核6.提现审核，7.工装投诉审核，8.保险结算审核',
  `audit_status` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态：0未定义，1通过，2拒绝',
  PRIMARY KEY (`audit_op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_award
-- ----------------------------
DROP TABLE IF EXISTS `bd_award`;
CREATE TABLE `bd_award` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '抽奖号',
  `user_type` int(2) NOT NULL DEFAULT '0' COMMENT '用户类型：1.用户端2.服务端',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_icon` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户头像',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '姓名',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '记录类型：1.内部录入2.外来扫码录入',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：1.未签到2.已签到3.已中奖',
  `remarks` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `win` int(2) NOT NULL DEFAULT '0' COMMENT '获奖等级：0特等奖，1.一等奖，2.二等奖，3.三等奖',
  `win_text` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '中奖描述(一等奖，二等奖，三等奖)',
  `win_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '中奖时间',
  `sign_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '签到时间',
  `create_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1 COMMENT='年会抽奖专用';

-- ----------------------------
-- Table structure for bd_bank
-- ----------------------------
DROP TABLE IF EXISTS `bd_bank`;
CREATE TABLE `bd_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `en_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称(英文)',
  `abbreviation` varchar(255) NOT NULL DEFAULT '' COMMENT '银行简写',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '银行网址',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '银行电话',
  `logo_image` varchar(255) NOT NULL DEFAULT '' COMMENT '银行LOGO',
  `background_image` varchar(255) NOT NULL DEFAULT '' COMMENT '银行背景图',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-默认   1-开启(ON)   2-关闭(OFF)',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_banner
-- ----------------------------
DROP TABLE IF EXISTS `bd_banner`;
CREATE TABLE `bd_banner` (
  `banner_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '横幅ID',
  `title` varchar(255) NOT NULL COMMENT '横幅标题',
  `image` varchar(255) NOT NULL COMMENT '显示图片OSS链接（大图1920*540）',
  `skip_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '跳转类型0.不跳转（默认），1.跳URL，2.跳详情h5',
  `skip_url` varchar(255) NOT NULL COMMENT '跳转链接',
  `detail_url` varchar(255) NOT NULL COMMENT 'H5链接',
  `detail_text` text NOT NULL COMMENT 'H5页面内容',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态：0.未展示(默认)1.展示',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `create_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_name` varchar(255) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_brand
-- ----------------------------
DROP TABLE IF EXISTS `bd_brand`;
CREATE TABLE `bd_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `website` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌网址',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌描述',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_business_circle_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_business_circle_type`;
CREATE TABLE `bd_business_circle_type` (
  `circle_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商业圈类型ID',
  `circle_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商业圈名称',
  PRIMARY KEY (`circle_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_business_firm
-- ----------------------------
DROP TABLE IF EXISTS `bd_business_firm`;
CREATE TABLE `bd_business_firm` (
  `business_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `firm_id` bigint(20) NOT NULL COMMENT '公司ID',
  `area_id` int(11) NOT NULL COMMENT '负责区域ID',
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '区域名称',
  `level` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0.主区域（公司地址）1.副区域（绑定区域）',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_case
-- ----------------------------
DROP TABLE IF EXISTS `bd_case`;
CREATE TABLE `bd_case` (
  `case_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '案例详情图片',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '类型ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修类型名称',
  `style_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '风格ID',
  `style_name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修风格名称',
  `proof_image` varchar(255) NOT NULL DEFAULT '' COMMENT '装修凭证图片',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '县区名称',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `acreage` varchar(32) NOT NULL DEFAULT '' COMMENT '面积',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `show_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '新闻展示类型',
  `detail_image_description` text COMMENT '案例详情图片描述',
  `detail_url` varchar(255) NOT NULL DEFAULT '' COMMENT '案例详情URL',
  `detail_text` text COMMENT '案例详情内容',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '案列简介',
  `server_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '服务人员类型 : 0平台发布1工人，2设计师 , 3监理',
  `server_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '服务人员ID  0平台发布',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '案列状态:0-待审核 1-通过 2-未通过',
  `is_referrer` smallint(1) NOT NULL DEFAULT '0' COMMENT '在案例展示里面:,0-不推荐展示 1-推荐展示 2-PC展示',
  `pc_status` int(1) NOT NULL DEFAULT '0' COMMENT '展示状态0，默认不展示，1.展示到PC',
  `case_level` int(1) NOT NULL DEFAULT '0' COMMENT '案例显示等级，0.普通，1.等级一，2.等级二,3.等级三（等级越高越靠前）',
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_category
-- ----------------------------
DROP TABLE IF EXISTS `bd_category`;
CREATE TABLE `bd_category` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `pid` bigint(11) NOT NULL DEFAULT '0' COMMENT '父类别id 为零表示顶层类别',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '类别名称',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '类别主图',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '简要描述',
  `is_promote` int(1) NOT NULL DEFAULT '0' COMMENT '推荐标志 1是 0否',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `is_parent` int(1) NOT NULL DEFAULT '0' COMMENT '是否是父类别：0不是，1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_chauffeur_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `bd_chauffeur_vehicle`;
CREATE TABLE `bd_chauffeur_vehicle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `vehicle_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '车型ID',
  `vehicle_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '车型名称',
  `vehicle_brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '车辆品牌ID',
  `vehicle_brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '车辆品牌名称',
  `series_name` varchar(32) NOT NULL DEFAULT '' COMMENT '车系名称',
  `chauffeur_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '司机ID',
  `body_color` varchar(10) NOT NULL DEFAULT '' COMMENT '车身颜色',
  `plate_color` varchar(10) NOT NULL DEFAULT '' COMMENT '车牌颜色',
  `plate_no` varchar(10) NOT NULL DEFAULT '' COMMENT '车牌号码',
  `specs` varchar(255) NOT NULL DEFAULT '' COMMENT '特殊规格,逗号分隔',
  `vehicle_license_owner` varchar(10) NOT NULL DEFAULT '' COMMENT '行驶证所有者',
  `vehicle_license_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '行驶证照片',
  `chauffeur_license_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '驾驶证照片',
  `profile_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '汽车侧面照片',
  `is_default` int(1) DEFAULT '0' COMMENT '是否默认 0否 1是',
  `status` int(4) DEFAULT '0' COMMENT '审核状态(0待审核， 1审核通过, 2审核不通过)',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `audit_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `audit_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `audit_user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '审核人姓名',
  `audit_notes` varchar(255) NOT NULL DEFAULT '' COMMENT '审核备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='司机车辆';

-- ----------------------------
-- Table structure for bd_comment
-- ----------------------------
DROP TABLE IF EXISTS `bd_comment`;
CREATE TABLE `bd_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID（评论人）',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '0业主用户,1工人，2设计师 , 3监理',
  `user_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名（真实姓名）',
  `user_avatar` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户头像URL',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型：1.维修普通, 2.维修售后, 3.装修设计, 4.装修施工, 6商品, 7.微工程服务',
  `target_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '目标ID（被评论人ID）',
  `target_type` int(1) NOT NULL DEFAULT '0' COMMENT '0业主用户,1工人，2设计师 ,3监理, 4商品',
  `sub_target_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '子目标ID',
  `sub_target_type` int(2) NOT NULL DEFAULT '0' COMMENT '子目标类型',
  `sub_target_value` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '子目标值',
  `grade` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '评分',
  `notes` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '评论内容',
  `images` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图片URL',
  `voices` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '声音',
  `videos` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '视频',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间（评论时间）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 COMMENT='评价2018-9-20 11:38:51';

-- ----------------------------
-- Table structure for bd_common_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_common_order`;
CREATE TABLE `bd_common_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单优先级ID',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `street` varchar(32) NOT NULL DEFAULT '' COMMENT '街道',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单区域ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单价格',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '订单详细说明',
  `proof_video` varchar(1000) NOT NULL DEFAULT '' COMMENT '维修凭证视频(维修前)',
  `proof_radio` varchar(1000) NOT NULL DEFAULT '' COMMENT '维修凭证录音(维修前)',
  `proof_image` varchar(255) NOT NULL DEFAULT '' COMMENT '维修凭证图片',
  `proof_image_md5key` varchar(50) DEFAULT '' COMMENT '维修凭证图片Oss端key',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单状态： 0待支付，1已支付待服务，2服务中， 3待确认，4已取消/已退款, 5已完成',
  `target_image` varchar(500) NOT NULL DEFAULT '' COMMENT '维修目标图片',
  `target_image_md5key` varchar(50) DEFAULT '' COMMENT '维修目标图片在阿里云Oss文件的MD5 key',
  `server_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '服务人接单人ID',
  `pay_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `enter_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '确认完成时间',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店主、下单人 ID',
  `pay_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `pay_order_num` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方支付平台订单号',
  `critic_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '评价状态：0未评价，1已评价',
  `refund_time` bigint(15) DEFAULT '0' COMMENT '退款时间',
  `longitude` varchar(32) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(32) NOT NULL DEFAULT '' COMMENT '纬度',
  `is_month_pay` smallint(1) NOT NULL DEFAULT '0' COMMENT '0-非月结(日结)  1-月结',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_complaint
-- ----------------------------
DROP TABLE IF EXISTS `bd_complaint`;
CREATE TABLE `bd_complaint` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '投诉类型:1-甲方(发起方)，2-乙方（反馈）,3-平台调解',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `order_type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型：1.维修普通, 2.维修售后, 3.装修设计, 4.装修施工, 15.微工程服务',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `notes` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述信息',
  `images` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图片',
  `voices` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '声音',
  `videos` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '视频',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COMMENT='客户投诉2018-9-20 11:36:59';

-- ----------------------------
-- Table structure for bd_consignee_address
-- ----------------------------
DROP TABLE IF EXISTS `bd_consignee_address`;
CREATE TABLE `bd_consignee_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收货地址ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1客户业主端，2：服务端',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '收货省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '收货市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '收货区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细收货街道地址',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '纬度',
  `zipcode` varchar(10) NOT NULL DEFAULT '' COMMENT '收货地区邮编',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `fixed_tel` varchar(32) NOT NULL DEFAULT '' COMMENT '固定电话',
  `is_default` int(1) NOT NULL DEFAULT '0' COMMENT '是否市默认收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_cost_pertain
-- ----------------------------
DROP TABLE IF EXISTS `bd_cost_pertain`;
CREATE TABLE `bd_cost_pertain` (
  `pertain_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '归属ID',
  `pertain_name` varchar(32) NOT NULL DEFAULT '' COMMENT '归属名称',
  PRIMARY KEY (`pertain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=902 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_coupon
-- ----------------------------
DROP TABLE IF EXISTS `bd_coupon`;
CREATE TABLE `bd_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '票券ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '票券名称',
  `value` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '券面值/折扣率值(例如8折为0.8)',
  `quantity` int(10) NOT NULL DEFAULT '0' COMMENT '票券数量',
  `issue` int(4) NOT NULL DEFAULT '0' COMMENT '发放方式：1定向，2广发',
  `display` int(4) NOT NULL DEFAULT '0' COMMENT '是否展示: 0否,1是',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '券类型：1普通，2售后，3押金，4设计，5施工，6商品，7微工程，8货运,9VIP',
  `enjoy_type` int(4) NOT NULL DEFAULT '0' COMMENT '优惠享受类型：1金额,2折扣',
  `start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '有效开始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '有效结束时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间,发布时间',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `logo_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '标志照片地址',
  `main_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '主图地址',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '票据描述、备注、使用指南等',
  `rules` varchar(20048) NOT NULL DEFAULT '{}' COMMENT '券类型对应规则实体序列化的JSON字符串',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_customer
-- ----------------------------
DROP TABLE IF EXISTS `bd_customer`;
CREATE TABLE `bd_customer` (
  `cus_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `gender` int(4) NOT NULL DEFAULT '0' COMMENT '0-女 1-男',
  `login_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL DEFAULT '' COMMENT '登入名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `pay_password` varchar(32) NOT NULL DEFAULT '' COMMENT '支付密码',
  `vip` int(3) NOT NULL DEFAULT '0',
  `vip_start_time` bigint(20) NOT NULL DEFAULT '0',
  `vip_end_time` bigint(20) NOT NULL DEFAULT '0',
  `image` varchar(1000) NOT NULL DEFAULT '' COMMENT '头像地址',
  `image_md5key` varchar(50) NOT NULL DEFAULT '' COMMENT '图片Oss端key',
  `user_level` varchar(32) NOT NULL DEFAULT '' COMMENT '用户级别',
  `is_chain` int(11) NOT NULL DEFAULT '0' COMMENT '是否是连锁客户：0不是，1是',
  `integral` int(4) NOT NULL DEFAULT '80' COMMENT '用户积分',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区县',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `firm_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '帐号状态：0正常， 1禁用',
  `reg_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `referrer_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '推荐人手机号',
  `referrer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '推荐人ID',
  `referrer_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '1- 业主  2-服务人员',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  PRIMARY KEY (`cus_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_brand
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_brand`;
CREATE TABLE `bd_decor_brand` (
  `brand_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '装修品牌ID',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修品牌名称',
  `type_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '装修类型ID',
  `type_name` varchar(255) NOT NULL COMMENT '类型名',
  `design_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '设计费单价',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '设计费总价',
  `count_type` int(1) NOT NULL DEFAULT '0' COMMENT '计费类型：　1-单价计费　２-总价格',
  `brand_rebates_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '品牌回扣回扣点',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_design_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_design_order`;
CREATE TABLE `bd_decor_design_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_level` int(1) NOT NULL DEFAULT '0' COMMENT '0.普通装修订单，1.VIP客户订单',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '装修类型ID',
  `type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '订单类型名称',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '装修品牌名称',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '客户姓名、称呼',
  `customer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '客户电话',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属省份',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属市区',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单所属县区ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属县区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '订单所属详细街道地址',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '地理经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '地理纬度',
  `input_acreage` double NOT NULL DEFAULT '0' COMMENT '用户输入装修面积',
  `real_acreage` double NOT NULL DEFAULT '0' COMMENT '设计师或量房人员真实量房面积',
  `demand` int(1) NOT NULL DEFAULT '0' COMMENT '用户装修方案：0全套统包，1只做设计,2设计转统包',
  `is_assign` int(1) NOT NULL DEFAULT '0' COMMENT '是否指派设计师：0否(系统抢单), 1是',
  `designer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '本单设计师ID',
  `designer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '本单设计姓名',
  `designer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '本单设计师电话',
  `who_upload` int(11) NOT NULL DEFAULT '0' COMMENT '谁上传量房图：1用户，2设计师',
  `refuse_count` int(2) NOT NULL DEFAULT '0' COMMENT '用户审核拒绝次数',
  `refuse_msg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户审核拒绝信息',
  `refuse_imgs` varchar(255) NOT NULL DEFAULT '' COMMENT '拒绝说明图片',
  `refuse_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '拒绝时间',
  `design_refuse_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '设计师拒绝接单时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `receive_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '设计师接单/抢单时间',
  `cancel_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户取消时间',
  `measure_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '测量/量房完成时间',
  `design_start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '设计开始时间',
  `design_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '设计结束时间',
  `customer_confirm_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户审核确认时间',
  `order_done_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单完结时间',
  `earnest_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金费用',
  `earnest_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '定金是否支付：0否，1是',
  `design_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '设计费/定金',
  `design_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '设计费/定金是否支付:0否,1是',
  `start_work_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '开工款',
  `start_work_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '开工款是否支付：0否，1是',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '是否已经对设计师评价：0否，1是',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '订单状态: -1已删除0待抢单, 1待接单, 2用户自主取消, 3拒绝接单, 4已接/抢单/待量房, 5已量房/待确认/待支付, 6已支付/已跳过支付/设计中, 7设计完成/报价中, 8待用户审核/报价完成/待支付, 9审核通过/已支付/已跳过支付, 设计订单完结\r\n\r\n(注：订单0-5状态用户可以自主取消订单，当订单为只找设计时，取消状态7，当用户审核设计/报价不通过式跳转到状态6设计中)',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工程名，门店名，工装项目名',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_order_blob
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_order_blob`;
CREATE TABLE `bd_decor_order_blob` (
  `blob_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blob_type` int(3) NOT NULL DEFAULT '0' COMMENT '大字段类型：1量房图,2初步设计图,3效果图,4施工图,5施工CAD,6施工计划表,7项目完工图片,8项目验收确认书.9结算Execl,10.付款申请书',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID:1装修设计订单、2装修施工订单',
  `order_type` int(1) NOT NULL DEFAULT '0' COMMENT '订单类型：1设计订单，2施工订单',
  `blobs` text NOT NULL COMMENT '文件urls',
  PRIMARY KEY (`blob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1495 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_order_gang_fee
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_order_gang_fee`;
CREATE TABLE `bd_decor_order_gang_fee` (
  `tab_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态 0-未完成 1-已完成',
  `gang_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工班类型',
  `gang_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工班类型名称',
  `gang_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工班费用',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_order_gang_worker
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_order_gang_worker`;
CREATE TABLE `bd_decor_order_gang_worker` (
  `tab_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态 :1-待选择 ３-待施工　5-施工中　6-待验收　7-已完工',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人ID',
  `worker_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工人名称',
  `worker_role` int(1) NOT NULL DEFAULT '0' COMMENT '工人角色  0-普通工人  1-工头',
  `worker_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工人费用',
  `worker_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人类型ID',
  `worker_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工人类型名称',
  `forman_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工头ID',
  `forman_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工头名称',
  `gang_budget_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工班预算费用',
  `gang_settlement_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工班实际费用',
  `gang_fee_proof_img` varchar(255) NOT NULL DEFAULT '' COMMENT '工班费用凭证',
  `complain_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-未投诉　１-投诉/未处理　２-投诉/已处理 ，3.未投诉/完结',
  `complain_details` varchar(255) NOT NULL DEFAULT '' COMMENT '投诉详情',
  `complain_img` varchar(255) NOT NULL DEFAULT '' COMMENT '投诉图片',
  `complain_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '投诉时间',
  `complain_solve_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '投诉处理时间',
  `cmplain_solve_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '投诉处理客服ID',
  `cmplain_solve_details` varchar(255) NOT NULL DEFAULT '' COMMENT '处理描述',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '''是否已经对工人评价：0否，1是'',',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_order_material_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_order_material_record`;
CREATE TABLE `bd_decor_order_material_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_type` int(1) NOT NULL DEFAULT '0' COMMENT '1-工装 2-家装',
  `ser_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监理ID,下单人ID',
  `ser_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人姓名',
  `mo_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '材料订单ID',
  `mo_num` varchar(255) NOT NULL DEFAULT '' COMMENT '材料订单编号',
  `material_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '材料ID',
  `material_num` varchar(255) NOT NULL DEFAULT '' COMMENT '材料编号',
  `material_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料名称',
  `specification` varchar(255) NOT NULL DEFAULT '' COMMENT '材料规格',
  `unit` varchar(255) NOT NULL DEFAULT '' COMMENT '单位',
  `amount` int(6) NOT NULL DEFAULT '0' COMMENT '材料数量',
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '材料单价',
  `subtotal_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '材料小计价格',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `type_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '材料类型ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料名称',
  `brand` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌',
  `warehouse_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `warehouse_name` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-未定义, 1-待发货（仓库）， 2-待收货， 3-已签收（XXXXXXX废弃）',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_order_program
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_order_program`;
CREATE TABLE `bd_decor_order_program` (
  `tab_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `program_name` varchar(255) NOT NULL DEFAULT '' COMMENT '计划名称',
  `scheduled_start_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '预计开始时间',
  `scheduled_stop_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '预计结束时间',
  `actual_start_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '实际开始时间',
  `actual_stop_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '实际结束时间',
  `img` text COMMENT '施工图片',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_order_quote
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_order_quote`;
CREATE TABLE `bd_decor_order_quote` (
  `quote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) NOT NULL COMMENT '装修订单ID',
  `file_url` varchar(255) NOT NULL COMMENT 'xls文件Oss地址',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `edit_count` int(2) NOT NULL DEFAULT '0' COMMENT '重新编辑次数',
  `edit_time` bigint(20) NOT NULL COMMENT '最后编辑时间',
  `quote_type` int(1) NOT NULL DEFAULT '0' COMMENT '0,.未定义，1.通用报价2.其它报价',
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_pay_order`;
CREATE TABLE `bd_decor_pay_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '老板梦商户订单号',
  `order_type` int(1) NOT NULL COMMENT '支付订单类型:1设计费/定金,2开工款,3完工款',
  `subject_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '隶属订单ID',
  `subject_order_type` int(1) NOT NULL DEFAULT '0' COMMENT '隶属订单类型：1设计订单，2施工订单',
  `subject_order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '隶属订单编号',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '下单客户ID',
  `use_coupon` int(1) NOT NULL DEFAULT '0' COMMENT '是否使用优惠券：0否，1是',
  `coupon_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_type` int(1) NOT NULL DEFAULT '0' COMMENT '优惠券类型：待定',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单原始金额',
  `final_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最终支付金额',
  `pay_way` int(1) NOT NULL DEFAULT '0' COMMENT '支付通道：0默认，1线上，2线下，3VIP预支付',
  `pay_method` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1支付宝，2微信，3银联快捷，4，5银行转账，6现金，7余额',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `submit_proof_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '提交线下支付凭证时间',
  `audit_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '后台线下支付审核时间',
  `audit_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '后台线下支付审核人员ID',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_proof` varchar(255) NOT NULL DEFAULT '' COMMENT '支付凭证：线下支付的上传凭证图片',
  `pay_order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `payee_name` varchar(32) NOT NULL DEFAULT '广东昱昊互联网科技有限公司' COMMENT '收款方账户名',
  `payee_bank_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款方开户银行ID',
  `payee_bank_name` varchar(32) NOT NULL DEFAULT '中国工商银行股份有限公司广州北京路支行' COMMENT '收款方开户银行名',
  `payee_bank_account` varchar(32) NOT NULL DEFAULT '3602000909200516632' COMMENT '收款方银行账号',
  `payer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '付款方账户名',
  `payer_bank_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '付款方开户银行ID',
  `payer_bank_name` varchar(32) NOT NULL DEFAULT '' COMMENT '付款方开户银行名',
  `payer_bank_account` varchar(32) NOT NULL DEFAULT '' COMMENT '付款方开户银行账号',
  `offline_status` int(1) NOT NULL DEFAULT '0' COMMENT '线下支付状态：0未上传凭证，1已上传凭证/待审核，2审核不通过，3审核通过.（审核通过时将paid状态改为1已支付），4.已跳过支付（VIP类）',
  `paid` int(1) NOT NULL DEFAULT '0' COMMENT '是否支付：0否，1是',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_program_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_program_type`;
CREATE TABLE `bd_decor_program_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '装修计划表工程类型ID',
  `program_name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修计划表工程类型名称',
  `style_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '装修风格ID',
  `style_name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修风格名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_project_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_project_order`;
CREATE TABLE `bd_decor_project_order` (
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_level` int(1) NOT NULL DEFAULT '0' COMMENT '0.普通装修订单，1.VIP客户订单',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '装修类型ID',
  `type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '订单类型名称',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '装修品牌名称',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人名称',
  `customer_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人手机号',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属省份',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属市区',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单所属县区ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属县区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '订单所属详细街道地址',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '地理经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '地理维度',
  `demand` int(1) NOT NULL DEFAULT '0' COMMENT '用户装修方案：0全套统包，1只做设计, 2-设计转统包 ',
  `real_acreage` double NOT NULL DEFAULT '0' COMMENT '设计师或量房人员真实量房面积',
  `designer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设计师的ID',
  `designer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '设计师真实姓名',
  `supervisor_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监理ID',
  `supervisor_name` varchar(32) NOT NULL DEFAULT '' COMMENT '监理真实姓名',
  `supervisor_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '监理－收益',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '''是否已经对监理评价：0否，1是'',',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '订单状态: \r\n-1-删除　0-初始化订单/取消订单　1-待抢单 3-待接单 4-已接单/待编辑施工计划表 5-已接单/待编辑工班工费 6-待施工/待挑选工长 7-待开工 8-施工中 9-待验收/待监理完工结算 11-待用户确认支付 12-完工款审核通过/72小时后显示完工审核按钮（客户端显示完工结算中）13完工（正式完成，可开始评价）\r\n',
  `start_work_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '开工款',
  `start_work_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '开工款是否支付：0否，1是',
  `scheduled_begin_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '计划开工时间',
  `scheduled_end_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '计划结束时间',
  `actual_begin_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '实际开工时间',
  `actual_end_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '实际结束时间',
  `settlement_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算总金额',
  `finish_work_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '完工款',
  `finish_work_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '完工款是否支付:0-否　1-是',
  `gang_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工班总费用',
  `materials_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '材料总费用',
  `system_commission_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成抽点',
  `system_commission_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成金额',
  `brand_rebates_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '品牌回扣回扣点',
  `brand_rebates_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '品牌回扣的金额',
  `agreed_acceptance_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '约定验收时间',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工程名，门店名，工装项目名',
  `first_audit` bigint(255) NOT NULL DEFAULT '0' COMMENT '首次完工审核人ID',
  `first_audit_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '一审时间',
  `second_audit` bigint(255) NOT NULL DEFAULT '0' COMMENT '二次完工审核人ID',
  `second_audit_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '二审时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_project_order_copy
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_project_order_copy`;
CREATE TABLE `bd_decor_project_order_copy` (
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_level` int(1) NOT NULL DEFAULT '0' COMMENT '0.普通装修订单，1.VIP客户订单',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '装修类型ID',
  `type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '订单类型名称',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '装修品牌名称',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人名称',
  `customer_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人手机号',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属省份',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属市区',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单所属县区ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '订单所属县区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '订单所属详细街道地址',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '地理经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '地理维度',
  `demand` int(1) NOT NULL DEFAULT '0' COMMENT '用户装修方案：0全套统包，1只做设计, 2-设计转统包 ',
  `real_acreage` double NOT NULL DEFAULT '0' COMMENT '设计师或量房人员真实量房面积',
  `designer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设计师的ID',
  `designer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '设计师真实姓名',
  `supervisor_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监理ID',
  `supervisor_name` varchar(32) NOT NULL DEFAULT '' COMMENT '监理真实姓名',
  `supervisor_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '监理－收益',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '''是否已经对监理评价：0否，1是'',',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '订单状态: \r\n-1-删除　0-初始化订单/取消订单　1-待抢单 3-待接单 4-已接单/待编辑施工计划表 5-已接单/待编辑工班工费 6-待施工/待挑选工长 7-待开工 8-施工中 9-待验收/待监理完工结算 11-待用户确认支付 12-完工款审核通过/72小时后显示完工审核按钮（客户端显示完工结算中）13完工（正式完成，可开始评价）\r\n',
  `start_work_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '开工款',
  `start_work_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '开工款是否支付：0否，1是',
  `scheduled_begin_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '计划开工时间',
  `scheduled_end_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '计划结束时间',
  `actual_begin_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '实际开工时间',
  `actual_end_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '实际结束时间',
  `settlement_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算总金额',
  `finish_work_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '完工款',
  `finish_work_fee_paid` int(1) NOT NULL DEFAULT '0' COMMENT '完工款是否支付:0-否　1-是',
  `gang_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工班总费用',
  `materials_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '材料总费用',
  `system_commission_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成抽点',
  `system_commission_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成金额',
  `brand_rebates_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '品牌回扣回扣点',
  `brand_rebates_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '品牌回扣的金额',
  `agreed_acceptance_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '约定验收时间',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工程名，门店名，工装项目名',
  `first_audit` bigint(255) NOT NULL DEFAULT '0' COMMENT '首次完工审核人ID',
  `second_audit` bigint(255) NOT NULL DEFAULT '0' COMMENT '二次完工审核人ID',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_quote_model
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_quote_model`;
CREATE TABLE `bd_decor_quote_model` (
  `model_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_name` varchar(64) NOT NULL COMMENT '工程名称',
  `unit` varchar(32) NOT NULL COMMENT '单位',
  `project_qty` int(16) NOT NULL DEFAULT '0' COMMENT '工程量',
  `main_price` decimal(20,2) NOT NULL COMMENT '主材单价',
  `sub_price` decimal(20,2) NOT NULL,
  `labor_price` decimal(20,2) NOT NULL COMMENT '人工单价',
  `manage_rate` decimal(10,2) NOT NULL COMMENT '管理费费率',
  `profit_rate` decimal(10,2) NOT NULL COMMENT '利润率',
  `total_unit_price` decimal(20,2) NOT NULL COMMENT '综合单价',
  `total_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '合价,（工程量X综合单价）',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `type_id` bigint(20) NOT NULL COMMENT '工程类型',
  `type_name` varchar(255) NOT NULL COMMENT '工程类型名称',
  `num` varchar(10) NOT NULL DEFAULT '' COMMENT '工程类型序号',
  `brand_Id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_quote_project_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_quote_project_type`;
CREATE TABLE `bd_decor_quote_project_type` (
  `type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板工程类型ID',
  `type_name` varchar(255) NOT NULL COMMENT '报价单模板工程类型名称',
  `num` varchar(10) NOT NULL DEFAULT '' COMMENT '序号',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_style
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_style`;
CREATE TABLE `bd_decor_style` (
  `style_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '风格ID',
  `style_name` varchar(255) NOT NULL DEFAULT '' COMMENT '风格属性值',
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_decor_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_decor_type`;
CREATE TABLE `bd_decor_type` (
  `type_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '装修类型ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_deposit
-- ----------------------------
DROP TABLE IF EXISTS `bd_deposit`;
CREATE TABLE `bd_deposit` (
  `deposit_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '押金ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `grade` int(10) NOT NULL DEFAULT '0' COMMENT '等级：1，2，3',
  `role` smallint(1) NOT NULL DEFAULT '0' COMMENT '角色: 1-工班 2-设计师 3-监理,4-司机',
  `number` int(2) NOT NULL DEFAULT '0' COMMENT '可以接单的数量',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_deposit_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_deposit_order`;
CREATE TABLE `bd_deposit_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `grade` int(1) NOT NULL DEFAULT '0' COMMENT '保证金等级',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0待支付，1已支付,4已退款',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `pay_order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '支付方订单号',
  `pay_type` smallint(1) NOT NULL DEFAULT '-1' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单所属用户id',
  `role` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户角色：1工人，2设计师  , 3监理',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_device
-- ----------------------------
DROP TABLE IF EXISTS `bd_device`;
CREATE TABLE `bd_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '设备编号',
  `model` varchar(10) NOT NULL DEFAULT '' COMMENT '设备型号',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备类型ID',
  `type_name` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型名称',
  `subtype_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备子类型ID',
  `subtype_name` varchar(10) NOT NULL DEFAULT '' COMMENT '设备子类型名称',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `supplier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_name` varchar(32) NOT NULL DEFAULT '' COMMENT '门店名称',
  `made_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '生产日期',
  `scrap_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '报废时间',
  `guarantee_period` int(2) NOT NULL DEFAULT '0' COMMENT '保修期(月)',
  `maintenance_cycle` int(2) NOT NULL DEFAULT '0' COMMENT '设备保养期',
  `is_lease` int(1) NOT NULL DEFAULT '0' COMMENT '是否是租赁(0否, 1是)',
  `is_chain` int(1) NOT NULL DEFAULT '0' COMMENT '是否是连锁品牌设备(0否,1是)',
  `lease_start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '租赁开始时间',
  `lease_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '租赁到期时间',
  `register_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间/注册时间',
  `register_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册设备用户ID',
  `register_user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '注册设备用户名称',
  `activation_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '激活时间/到店时间',
  `activation_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '激活工人ID',
  `activation_user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '激活设备用户姓名',
  `parts` varchar(1024) NOT NULL DEFAULT '' COMMENT '配件明细',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bd_device_no_uindex` (`no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='智能设备表';

-- ----------------------------
-- Table structure for bd_device_clean_log
-- ----------------------------
DROP TABLE IF EXISTS `bd_device_clean_log`;
CREATE TABLE `bd_device_clean_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备清洗日志表',
  `device_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `time` bigint(20) NOT NULL DEFAULT '0' COMMENT '清洗时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COMMENT='设备清洗日志表';

-- ----------------------------
-- Table structure for bd_device_error_log
-- ----------------------------
DROP TABLE IF EXISTS `bd_device_error_log`;
CREATE TABLE `bd_device_error_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `device_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `time` bigint(20) NOT NULL DEFAULT '0' COMMENT '错误时间',
  `code` varchar(8) NOT NULL DEFAULT '' COMMENT '错误码',
  `descr` varchar(32) NOT NULL DEFAULT '' COMMENT '错误描述',
  `sub_code` varchar(8) NOT NULL DEFAULT '' COMMENT '子错误码',
  `sub_descr` varchar(32) NOT NULL DEFAULT '' COMMENT '错误子信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8 COMMENT='智能设备错误日志表';

-- ----------------------------
-- Table structure for bd_device_model
-- ----------------------------
DROP TABLE IF EXISTS `bd_device_model`;
CREATE TABLE `bd_device_model` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(32) DEFAULT '' COMMENT '接入编号',
  `model` varchar(32) DEFAULT '' COMMENT '型号名称',
  `type_id` bigint(20) DEFAULT '0' COMMENT '类型ID',
  `type_name` varchar(32) DEFAULT '' COMMENT '类型名',
  `subtype_id` bigint(20) DEFAULT '0' COMMENT '子类型ID',
  `subtype_name` varchar(32) DEFAULT '' COMMENT '子类型名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bd_device_model_no_uindex` (`no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='设备型号表';

-- ----------------------------
-- Table structure for bd_device_monitor_log
-- ----------------------------
DROP TABLE IF EXISTS `bd_device_monitor_log`;
CREATE TABLE `bd_device_monitor_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '监控日志ID',
  `device_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `time` bigint(20) NOT NULL DEFAULT '0' COMMENT '监控上报时间',
  `state` int(1) DEFAULT '0' COMMENT '设备状态码(0禁用-无告警; 1禁用-设备告警; 2可用-无告警; 3可用-设备告警)',
  `water_level` int(5) NOT NULL DEFAULT '0' COMMENT '水位',
  `steam_temperature` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '蒸汽温度',
  `steam_mass` int(5) NOT NULL DEFAULT '0' COMMENT '蒸汽含量',
  `heat_source_temperature` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '热源温度',
  `power` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '实时功率',
  `electric_consume` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '用电量',
  `total_clean` int(10) NOT NULL DEFAULT '0' COMMENT '设备启用至本条数据上报总清洗次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15008 DEFAULT CHARSET=utf8 COMMENT='智能设备监控日志';

-- ----------------------------
-- Table structure for bd_device_runtime_log
-- ----------------------------
DROP TABLE IF EXISTS `bd_device_runtime_log`;
CREATE TABLE `bd_device_runtime_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `device_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `time` bigint(20) NOT NULL DEFAULT '0' COMMENT '上报时间',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '上报类型(1开机,2关机)',
  `day` int(10) NOT NULL DEFAULT '0' COMMENT '截止运行总天数',
  `millis` bigint(20) NOT NULL DEFAULT '0' COMMENT '截止本条数据上报的当天运行时长(毫秒值)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8 COMMENT='设备运行时间日志表';

-- ----------------------------
-- Table structure for bd_export_op
-- ----------------------------
DROP TABLE IF EXISTS `bd_export_op`;
CREATE TABLE `bd_export_op` (
  `op_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '导出记录ID',
  `creator_type` smallint(2) NOT NULL COMMENT '操作人类型：0系统管理员，1手机业主端，2手机服务端，3公司，4店主, 5连锁客户',
  `creator_id` bigint(20) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(255) NOT NULL COMMENT '创建人姓名',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `url` varchar(255) NOT NULL COMMENT '导出文件OSS地址',
  `url_type` smallint(2) NOT NULL COMMENT '导出文件类型：1.xls报价单，2.二维码，3.xls钱包操作记录4.雇主责任险xls',
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_express
-- ----------------------------
DROP TABLE IF EXISTS `bd_express`;
CREATE TABLE `bd_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流ID',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流代码',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '物流名称',
  `tel` varchar(100) NOT NULL DEFAULT '' COMMENT '客服电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1150 DEFAULT CHARSET=utf8 COMMENT='快递表';

-- ----------------------------
-- Table structure for bd_extract
-- ----------------------------
DROP TABLE IF EXISTS `bd_extract`;
CREATE TABLE `bd_extract` (
  `extract_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '提现人名称',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '提现用户ID',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '提现帐号',
  `ext_sum` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '提现金额',
  `ext_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '提现时间',
  `bank_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '银行ID',
  `transfer_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '转账人ID',
  `transfer_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '转账时间',
  `status` smallint(2) NOT NULL DEFAULT '0' COMMENT '状态：0待审核，1通过，2.不通过',
  PRIMARY KEY (`extract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_fault_cause
-- ----------------------------
DROP TABLE IF EXISTS `bd_fault_cause`;
CREATE TABLE `bd_fault_cause` (
  `fault_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '故障ID',
  `fault_name` varchar(32) NOT NULL DEFAULT '' COMMENT '故障名称',
  PRIMARY KEY (`fault_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_feedback
-- ----------------------------
DROP TABLE IF EXISTS `bd_feedback`;
CREATE TABLE `bd_feedback` (
  `feedback_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '意见反馈ID',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '反馈内容',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `user_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0系统管理员，1手机业主端，2手机服务端，3公司，4店主, 5连锁客户，6.游客',
  `submit_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `look_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '查看时间',
  `look_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '查阅状态:  0-未看    1-已看',
  `dispose_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `dispose_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '处理状态: 0-未处理   1-已处理',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_firm
-- ----------------------------
DROP TABLE IF EXISTS `bd_firm`;
CREATE TABLE `bd_firm` (
  `firm_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `signin_name` varchar(32) NOT NULL DEFAULT '' COMMENT '公司帐号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '公司密码',
  `firm_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `telphone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `principal` varchar(32) NOT NULL DEFAULT '' COMMENT '负责人',
  `logo_img` varchar(255) NOT NULL DEFAULT '' COMMENT 'LOGO地址',
  `bg_image` varchar(255) NOT NULL DEFAULT '' COMMENT '背景地址',
  `introduce` varchar(255) NOT NULL DEFAULT '' COMMENT '介绍',
  `email` varchar(32) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `type` varchar(32) NOT NULL DEFAULT '民营公司' COMMENT '公司类型',
  `longitude` varchar(10) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(10) NOT NULL DEFAULT '' COMMENT '纬度',
  `op_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `op_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `province_id` int(10) NOT NULL DEFAULT '-1' COMMENT '省级ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `city_id` int(10) NOT NULL DEFAULT '-1' COMMENT '市级ID',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `area_id` int(10) NOT NULL DEFAULT '-1' COMMENT '区域ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态，0待分配（权限），1已分配，2已禁用',
  PRIMARY KEY (`firm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_firm_nochain_worker
-- ----------------------------
DROP TABLE IF EXISTS `bd_firm_nochain_worker`;
CREATE TABLE `bd_firm_nochain_worker` (
  `nochain_worker_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '维修类型(0:保修；1：保养)',
  `service_group` int(1) NOT NULL DEFAULT '0' COMMENT '服务群体：0-非连锁 1-连锁',
  `warranty` int(10) NOT NULL DEFAULT '0' COMMENT '保修期(0-质保期外　１－质保期内)',
  `firm_id` bigint(20) NOT NULL COMMENT '公司id',
  `worker_id` bigint(20) NOT NULL COMMENT '工人id',
  `repair_child_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修子类型id',
  `province_id` int(10) NOT NULL DEFAULT '-1' COMMENT '省级id',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city_id` int(10) NOT NULL DEFAULT '-1' COMMENT '市级id',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `area_id` int(10) NOT NULL DEFAULT '-1' COMMENT '区域id',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '负责区域',
  PRIMARY KEY (`nochain_worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_firm_worker
-- ----------------------------
DROP TABLE IF EXISTS `bd_firm_worker`;
CREATE TABLE `bd_firm_worker` (
  `firm_worker_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `firm_id` bigint(20) NOT NULL COMMENT '公司ID',
  `worker_id` bigint(20) NOT NULL COMMENT '工人ID',
  PRIMARY KEY (`firm_worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_gang_worker
-- ----------------------------
DROP TABLE IF EXISTS `bd_gang_worker`;
CREATE TABLE `bd_gang_worker` (
  `tab_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人ID',
  `worker_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工人姓名',
  `worker_role` int(1) NOT NULL DEFAULT '0' COMMENT '工人角色　0-普通工人　１-工头',
  `worker_type_id` bigint(1) NOT NULL DEFAULT '0' COMMENT '工人类型ID',
  `worker_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工人类型名称',
  `forman_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工头ID',
  `forman_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工头姓名',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_goods
-- ----------------------------
DROP TABLE IF EXISTS `bd_goods`;
CREATE TABLE `bd_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID ',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名',
  `no` varchar(50) NOT NULL DEFAULT '' COMMENT '商品编号',
  `slogan` varchar(255) NOT NULL DEFAULT '' COMMENT '广告语',
  `photos` text NOT NULL COMMENT '商品主图,多张用,号分隔',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` bigint(20) NOT NULL DEFAULT '0' COMMENT '销量',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '类别ID ',
  `category_name` varchar(32) NOT NULL DEFAULT '' COMMENT '类别名称',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商ID ',
  `supplier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否是新品：0否，1是',
  `is_promote` int(1) NOT NULL DEFAULT '0' COMMENT '是否孙推荐/促销:0否，1是',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热门:1是，0否',
  `audit_status` int(2) NOT NULL DEFAULT '0' COMMENT '审核状态：0待审核，1审核通过，2审核不通过',
  `updown_status` int(1) NOT NULL DEFAULT '0' COMMENT '上下架状态：0下架，1上架',
  `show_note` varchar(255) NOT NULL DEFAULT '' COMMENT '简短的商品介绍语句',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID ',
  `audit_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `audit_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '审核人ID ',
  `update_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `update_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
  `updown_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '上下架时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `bd_goods_attribute`;
CREATE TABLE `bd_goods_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attribute_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '属性ID',
  `attribute_name` varchar(32) NOT NULL DEFAULT '' COMMENT '属性名',
  `attribute_value` text NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_goods_blob
-- ----------------------------
DROP TABLE IF EXISTS `bd_goods_blob`;
CREATE TABLE `bd_goods_blob` (
  `id` bigint(20) NOT NULL COMMENT '商品ID',
  `detail_code` text NOT NULL COMMENT '商品详情html元素',
  `detail_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品详情OSS html文件URL ',
  `packing` varchar(255) NOT NULL DEFAULT '' COMMENT '包装参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_goods_order`;
CREATE TABLE `bd_goods_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号码',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总价格',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '订单状态:0待支付，1已支付/待发货，2已发货/待收货，3已收货/已完成/交易成功，4退换货中，5已取消/交易关闭',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1业主，2服务',
  `quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '总数量',
  `pay_way` int(1) NOT NULL DEFAULT '0' COMMENT '支付类型：1在线支付，2货到付款',
  `pay_method` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_no` varchar(32) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `coupon_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '优惠/折扣ID',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠/折扣金额',
  `avg_coupon_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '平均优惠金额=优惠总金额/商品购买总数量',
  `ship_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `ship_way` int(1) NOT NULL DEFAULT '0' COMMENT '配送方式：1平台，2快递，3自提',
  `express_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '快递ID',
  `express_name` varchar(32) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_tel` varchar(32) NOT NULL DEFAULT '' COMMENT '快递联系电话',
  `express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '快递单号',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货详细地址',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '纬度',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '电话',
  `zipcode` varchar(10) NOT NULL DEFAULT '' COMMENT '邮编',
  `fixed_tel` varchar(32) NOT NULL DEFAULT '' COMMENT '固定电话',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件',
  `return_type` int(1) NOT NULL DEFAULT '0' COMMENT '退货类型: 1已收货退货退款，2未支付退款',
  `invoice_from` int(1) NOT NULL DEFAULT '0' COMMENT '发票格式：0个人，1公司',
  `invoice_type` int(1) NOT NULL DEFAULT '0' COMMENT '发票类型：1普通发票，2增值税发票',
  `invoice_name` varchar(45) NOT NULL DEFAULT '' COMMENT '发票名称',
  `invoice_no` varchar(32) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `invoice_tel` varchar(32) NOT NULL DEFAULT '' COMMENT '发票电话',
  `invoice_addr` varchar(255) NOT NULL DEFAULT '' COMMENT '发票地址',
  `bank_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '银行ID',
  `bank_name` varchar(32) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_account` varchar(32) NOT NULL DEFAULT '' COMMENT '开户银行帐号',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '评价状态：0未评价，1已评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_goods_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `bd_goods_order_detail`;
CREATE TABLE `bd_goods_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品订单细节Id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品订单ID',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品Id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_no` varchar(45) NOT NULL DEFAULT '' COMMENT '商品号',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '库存ID',
  `sku_name` varchar(255) NOT NULL DEFAULT '' COMMENT '库存名称',
  `sku_photos` varchar(255) NOT NULL DEFAULT '' COMMENT '库存图片',
  `sku_attr_val` varchar(255) NOT NULL DEFAULT '' COMMENT '库存规格值',
  `sku_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '库存规格价',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣金额',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商ID ',
  `quantity` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计价格',
  `payment_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `buy_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买金额',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '是否评价：0未评价，1已评价',
  `return_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '退货数量，默认0, 最终不得大于单个详情的商品个数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_goods_return_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_goods_return_order`;
CREATE TABLE `bd_goods_return_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '退货订单ID',
  `no` varchar(64) NOT NULL DEFAULT '' COMMENT '退货编号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '购买订单ID',
  `detail_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单详情项ID',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '库存商品ID',
  `sku_name` varchar(255) NOT NULL DEFAULT '' COMMENT '库存名称',
  `sku_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '库存单价',
  `sku_photos` varchar(255) NOT NULL DEFAULT '' COMMENT '库存图片',
  `sku_attr_val` varchar(255) NOT NULL DEFAULT '' COMMENT '库存属性值',
  `return_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还总金额',
  `return_type` int(1) NOT NULL DEFAULT '0' COMMENT '退货类型：1已收货退货，2未发货退款',
  `quantity` int(10) NOT NULL DEFAULT '0' COMMENT '退货数量',
  `cause` varchar(45) NOT NULL DEFAULT '' COMMENT '退货因由',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '退货备注信息',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT ' 退货附件，证明图片',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '发起人ID ',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '发起人类型：1业主，2服务人员',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '退货状态：0待审核，1审核通过待发回，2发回待平台收货，3平台确认收货退货款完成，4审核不通过，5已取消/退货关闭',
  `express_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物流ID',
  `express_name` varchar(32) NOT NULL DEFAULT '' COMMENT '物流名称',
  `express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '退回运单编号',
  `express_tel` varchar(32) NOT NULL DEFAULT '' COMMENT '物流电话',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `audit_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `update_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_identity
-- ----------------------------
DROP TABLE IF EXISTS `bd_identity`;
CREATE TABLE `bd_identity` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '身份帐号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '认证密码',
  `user_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户种类：0系统管理员，1手机业主端，2手机服务端，3公司，4店主, 5连锁客户 ',
  `show_name` varchar(32) NOT NULL DEFAULT '' COMMENT '显示名称',
  `last_signin_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `token` varchar(45) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `available` int(1) NOT NULL DEFAULT '1' COMMENT '0.不可用,1.可用，2禁用',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3084 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_integral
-- ----------------------------
DROP TABLE IF EXISTS `bd_integral`;
CREATE TABLE `bd_integral` (
  `integral_id` bigint(20) NOT NULL,
  `integral` bigint(50) NOT NULL DEFAULT '0' COMMENT '积分（个数）余额',
  `in_count` int(10) NOT NULL DEFAULT '0' COMMENT '收入积分',
  `out_count` int(10) NOT NULL DEFAULT '0' COMMENT '支出积分',
  PRIMARY KEY (`integral_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_lotto
-- ----------------------------
DROP TABLE IF EXISTS `bd_lotto`;
CREATE TABLE `bd_lotto` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '抽奖ID',
  `activity_type` int(1) NOT NULL DEFAULT '0' COMMENT '活动类型：2.工人抽奖3.普通抽奖',
  `able_count` int(3) NOT NULL DEFAULT '0' COMMENT '可用抽奖次数',
  `user_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1.客户端2.服务端',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `user_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `user_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '扫码时间，入场时间，创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 COMMENT='抽奖池';

-- ----------------------------
-- Table structure for bd_lotto_gift
-- ----------------------------
DROP TABLE IF EXISTS `bd_lotto_gift`;
CREATE TABLE `bd_lotto_gift` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '奖品ID',
  `activity_type` int(1) NOT NULL DEFAULT '0' COMMENT '活动类型：2.工人抽奖3.普通抽奖',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '奖品名称',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '奖品类型：1.实物2.人民币3.优惠券',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '奖品图',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖品金额(价值)',
  `amount` int(10) NOT NULL DEFAULT '0' COMMENT '奖品数量',
  `grade` int(1) NOT NULL DEFAULT '0' COMMENT '级别：0不分等级, 1一等奖, 2二等奖, 3三等奖, 10特等奖',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0未生效1.生效',
  `prob` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '中奖概率，单位%，0.01~100%',
  `update_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `create_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='奖品';

-- ----------------------------
-- Table structure for bd_lotto_prob
-- ----------------------------
DROP TABLE IF EXISTS `bd_lotto_prob`;
CREATE TABLE `bd_lotto_prob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begin_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `prob` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '中奖率',
  `sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2018-12-18 14:05:20可以删掉';

-- ----------------------------
-- Table structure for bd_lotto_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_lotto_record`;
CREATE TABLE `bd_lotto_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '中奖记录',
  `lotto_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '获奖卷编号，抽奖ID',
  `activity_name` varchar(64) NOT NULL DEFAULT '' COMMENT '活动名称',
  `activity_type` int(1) NOT NULL DEFAULT '0' COMMENT '活动类型：1.年会抽奖2.工人抽奖3.普通抽奖',
  `gift_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '奖品ID',
  `gift_name` varchar(64) NOT NULL DEFAULT '' COMMENT '奖品名称',
  `gift_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '中奖金额',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1客户端，2服务端',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否领取，0.未领取，1.已领取,2.已发货',
  `post_name` varchar(64) NOT NULL DEFAULT '' COMMENT '邮寄人姓名',
  `post_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '邮寄人手机号',
  `post_address` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '邮寄地址',
  `post_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '中奖时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 COMMENT='中奖记录';

-- ----------------------------
-- Table structure for bd_material
-- ----------------------------
DROP TABLE IF EXISTS `bd_material`;
CREATE TABLE `bd_material` (
  `material_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '材料ID',
  `material_num` varchar(255) NOT NULL DEFAULT '' COMMENT '材料编号',
  `material_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料名称',
  `specification` varchar(255) NOT NULL DEFAULT '' COMMENT '规格',
  `unit` varchar(255) NOT NULL DEFAULT '' COMMENT '单位',
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `type_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '材料类型ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料类型名称',
  `brand` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌',
  `warehouse_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `warehouse_name` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库名称',
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1979 DEFAULT CHARSET=utf8 COMMENT='材料表\r\n2018-03-17 11:55:01\r\n';

-- ----------------------------
-- Table structure for bd_material_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_material_order`;
CREATE TABLE `bd_material_order` (
  `mo_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '材料订单ID',
  `mo_num` varchar(50) NOT NULL DEFAULT '' COMMENT '材料订单编号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_num` varchar(50) NOT NULL COMMENT '订单编号',
  `order_type` int(1) NOT NULL DEFAULT '0' COMMENT '1-工装 2-家装',
  `ser_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '下单人ID',
  `ser_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人姓名',
  `cus_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '业主ID',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0-未定义, 1-待发货（仓库）， 2-待收货， 3-已签收',
  `send_way` smallint(1) NOT NULL DEFAULT '0' COMMENT '0.未配送1.平台配送2.物流配送',
  `send_phone` varchar(32) NOT NULL DEFAULT '0' COMMENT '配送人手机号（平台发货）',
  `express_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '快递名称',
  `express_num` varchar(50) NOT NULL DEFAULT '' COMMENT '快递单号',
  `send_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `accept_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '收货时间',
  `last_accept_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '限定的最晚收货时间',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `transport_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运输费',
  `warehouse_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `warehouse_name` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `longitude` double(255,0) NOT NULL DEFAULT '0' COMMENT '地理经度',
  `latitude` double(255,0) NOT NULL DEFAULT '0' COMMENT '地理维度',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`mo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_material_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `bd_material_shopping_cart`;
CREATE TABLE `bd_material_shopping_cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_type` int(1) NOT NULL DEFAULT '0' COMMENT '1-工装 2-家装',
  `ser_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '下单人ID',
  `ser_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人姓名',
  `material_id` bigint(20) NOT NULL DEFAULT '0' COMMENT ' 材料ID',
  `material_num` varchar(255) NOT NULL DEFAULT '' COMMENT '材料编号',
  `material_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料名称',
  `specification` varchar(255) NOT NULL DEFAULT '' COMMENT '规格',
  `unit` varchar(255) NOT NULL DEFAULT '' COMMENT '单位',
  `amount` int(6) NOT NULL DEFAULT '0' COMMENT '数量',
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `subtotal_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `type_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '材料类型ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料类型名称',
  `brand` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌',
  `warehouse_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `warehouse_name` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库名称',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_material_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_material_type`;
CREATE TABLE `bd_material_type` (
  `type_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '材料类型的ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '材料类型的名称',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '材料类型的介绍',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_microproject_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_microproject_order`;
CREATE TABLE `bd_microproject_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '订单编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额(支付金额)',
  `worker_price` decimal(10,2) DEFAULT '0.00' COMMENT '工人所得金额',
  `pay_method` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式:1支付宝，2微信，3银联快捷，4，5银行转账，6现金，7余额',
  `pay_no` varchar(32) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `pay_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '0普通订单,1vip单',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '下单客户ID',
  `customer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '下单客户姓名',
  `customer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '下单客户电话',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `microproject_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工程类型id',
  `microproject_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '工程类型名称',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `longitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '纬度',
  `service_before_images` varchar(500) NOT NULL DEFAULT '' COMMENT '服务前照片',
  `service_before_voices` varchar(500) NOT NULL DEFAULT '' COMMENT '服务前语音',
  `service_before_videos` varchar(500) NOT NULL DEFAULT '' COMMENT '服务前视频',
  `service_before_notes` varchar(500) NOT NULL DEFAULT '' COMMENT '服务前备注',
  `service_after_images` varchar(500) NOT NULL DEFAULT '' COMMENT '服务后照片',
  `service_after_voices` varchar(500) NOT NULL DEFAULT '' COMMENT '服务后语音',
  `service_after_videos` varchar(500) NOT NULL DEFAULT '' COMMENT '服务后视频',
  `service_after_notes` varchar(500) NOT NULL DEFAULT '' COMMENT '服务后备注信息（维修方案）',
  `worker_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工种id',
  `worker_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '工种名称',
  `worker_type_label` int(1) NOT NULL DEFAULT '0' COMMENT '工种标记: 0.普通工种, 1.特殊工种',
  `offer_type` int(1) NOT NULL DEFAULT '0' COMMENT '报价类型(0用户报价/1竞标/2指定工人报价)',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人id',
  `worker_name` varchar(32) NOT NULL DEFAULT '' COMMENT '工人姓名',
  `worker_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '工人电话',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态: 0.报价中, 1.已报价/待支付, 2.已支付/待抢单, 3.已支付/已接单/服务中,4.取消(关闭订单，不显示) 5服务完成/待确认, 6.订单完成',
  `complaint_status` int(1) NOT NULL DEFAULT '0' COMMENT '投诉状态(0无投诉,1投诉中，2平台处理中,3投诉完结)',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '评价状态(0未评价,1已评价)',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `service_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '服务时间/(施工)时间',
  `complete_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '完工时间',
  `confirm_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '确认时间',
  `auto_confirm_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '订单自定确认时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COMMENT='微工程订单表';

-- ----------------------------
-- Table structure for bd_microproject_order_insure
-- ----------------------------
DROP TABLE IF EXISTS `bd_microproject_order_insure`;
CREATE TABLE `bd_microproject_order_insure` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '微工程订单ID',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人ID',
  `worker_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工人姓名',
  `worker_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '工人电话',
  `worker_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工种ID',
  `worker_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工种名称',
  `price` decimal(10,2) NOT NULL COMMENT '保险费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微工程工人保险2018-9-20 11:24:40';

-- ----------------------------
-- Table structure for bd_microproject_order_offer
-- ----------------------------
DROP TABLE IF EXISTS `bd_microproject_order_offer`;
CREATE TABLE `bd_microproject_order_offer` (
  `id` bigint(2) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '微工程订单ID',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人ID',
  `worker_name` varchar(32) NOT NULL DEFAULT '' COMMENT '工人姓名',
  `worker_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '工人电话',
  `worker_grade` float(2,1) NOT NULL DEFAULT '0.0' COMMENT '工人评分',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '报价总额',
  `worker_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '工人所得额',
  `manage_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '管理费',
  `manage_revenue` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '管理费计算百分值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='微工程订单报价表';

-- ----------------------------
-- Table structure for bd_microproject_order_offer_detail
-- ----------------------------
DROP TABLE IF EXISTS `bd_microproject_order_offer_detail`;
CREATE TABLE `bd_microproject_order_offer_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `offer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人报价id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '费用名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '费用价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8 COMMENT='微工程订单报价明细表';

-- ----------------------------
-- Table structure for bd_microproject_order_worker
-- ----------------------------
DROP TABLE IF EXISTS `bd_microproject_order_worker`;
CREATE TABLE `bd_microproject_order_worker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单id',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人ID',
  `worker_name` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '工人姓名',
  `worker_type_name` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '工人工种名称',
  `worker_phone` varchar(18) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '工人手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for bd_microproject_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_microproject_type`;
CREATE TABLE `bd_microproject_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '自关联父类型id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='为工程类型表';

-- ----------------------------
-- Table structure for bd_news
-- ----------------------------
DROP TABLE IF EXISTS `bd_news`;
CREATE TABLE `bd_news` (
  `news_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `type_id` int(8) NOT NULL DEFAULT '0' COMMENT '新闻类型',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '新闻类型名称',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `level` smallint(1) NOT NULL DEFAULT '0' COMMENT '区域等级:0-全国通用 1-省 2-市 3-区',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字（简介）',
  `show_type` smallint(1) DEFAULT '0' COMMENT '新闻展示类型 1-html 2-图文',
  `detail_image_description` text COMMENT '新闻详情图片描述',
  `detail_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `detail_text` text COMMENT '新闻H5详情',
  `firm_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公司ID，0为后台添加',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '首页推荐:0-不推荐  1-手机首页推荐',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pc_status` int(1) NOT NULL DEFAULT '0' COMMENT '展示状态0，默认不展示，1.PC展示',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `creator_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人名字',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '新闻简介',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_news_area
-- ----------------------------
DROP TABLE IF EXISTS `bd_news_area`;
CREATE TABLE `bd_news_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '新闻ID',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区ID',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_news_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_news_type`;
CREATE TABLE `bd_news_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '新闻类型ID',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '新闻类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_order_critic
-- ----------------------------
DROP TABLE IF EXISTS `bd_order_critic`;
CREATE TABLE `bd_order_critic` (
  `critic_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `critic_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `critic_user_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '评价的用户类型:0-用户 1-服务人员',
  `user_view` varchar(255) NOT NULL DEFAULT '' COMMENT '评价人用户名和头像:{"name":"张三","photo":"1.jsp"}',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单类型：1普通报修订单， 2售后服务订单  , 3-装修订单',
  `target_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '受评价的目标ID ，可以是人，商品',
  `server_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '服务人员ID',
  `sub_item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '具体子项目ID：附加字段，预留',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '库存单元ID',
  `sku_prop_value` varchar(255) NOT NULL DEFAULT '' COMMENT '库存单元值',
  `grade` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '服务评分',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '评价关键字',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `photos` varchar(255) NOT NULL DEFAULT '' COMMENT '评价图片',
  `critic_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '评价时间',
  PRIMARY KEY (`critic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_order_level
-- ----------------------------
DROP TABLE IF EXISTS `bd_order_level`;
CREATE TABLE `bd_order_level` (
  `level_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优先级ID',
  `level_name` varchar(32) NOT NULL DEFAULT '' COMMENT '优先级名称',
  `timeliness` int(10) NOT NULL DEFAULT '0' COMMENT '时效规定（小时）',
  `ratio` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '费用比例',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_ordinary_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_ordinary_repair_order`;
CREATE TABLE `bd_ordinary_repair_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单等级ID',
  `customer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '下单人客户ID',
  `customer_name` varchar(10) NOT NULL DEFAULT '' COMMENT '客户姓名',
  `customer_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '客户电话',
  `customer_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '客户头像',
  `worker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修工人ID',
  `worker_name` varchar(10) NOT NULL DEFAULT '' COMMENT '维修工名称',
  `worker_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '维修工人手机',
  `worker_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '维修工头像',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '市',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `area` varchar(16) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` double NOT NULL DEFAULT '0' COMMENT '维度',
  `before_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '维修前照片',
  `before_voice` varchar(255) NOT NULL DEFAULT '' COMMENT '维修前语音',
  `before_video` varchar(255) NOT NULL DEFAULT '' COMMENT '维修前视频',
  `before_notes` varchar(255) NOT NULL DEFAULT '' COMMENT '订单维修前备注',
  `after_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '维修后照片',
  `after_voice` varchar(255) NOT NULL DEFAULT '' COMMENT '维修后语音',
  `after_video` varchar(255) NOT NULL DEFAULT '' COMMENT '维修后视频',
  `after_notes` varchar(255) NOT NULL DEFAULT '' COMMENT '订单维修后备注',
  `pay_method` int(4) NOT NULL DEFAULT '0' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `pay_no` varchar(64) NOT NULL DEFAULT '' COMMENT '支付号',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `confirm_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '确认时间',
  `is_month_pay` int(4) NOT NULL DEFAULT '0' COMMENT '是否月结 0否 1是',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '是否评论 0否 1是',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '订单状态： 0待支付，1已支付待服务，2服务中， 3待确认，4已取消/已退款, 5已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='普通的维修订单';

-- ----------------------------
-- Table structure for bd_permission
-- ----------------------------
DROP TABLE IF EXISTS `bd_permission`;
CREATE TABLE `bd_permission` (
  `per_id` bigint(20) NOT NULL COMMENT '主键',
  `per_name` varchar(32) NOT NULL DEFAULT '' COMMENT '资源名称',
  `is_menu` int(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单: 1是, 0否',
  `per_type` varchar(32) NOT NULL DEFAULT '' COMMENT '资源类型：保留字段',
  `url` varchar(128) NOT NULL DEFAULT '' COMMENT '访问url地址',
  `icon` varchar(32) NOT NULL DEFAULT '' COMMENT '图标',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父结点id',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `available` int(1) NOT NULL DEFAULT '0' COMMENT '是否可用,1：可用，0不可用',
  `grade` int(5) NOT NULL DEFAULT '0' COMMENT '层级等级',
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='√权限表（基础数据不要清除）';

-- ----------------------------
-- Table structure for bd_permit
-- ----------------------------
DROP TABLE IF EXISTS `bd_permit`;
CREATE TABLE `bd_permit` (
  `id` varchar(255) NOT NULL,
  `badge` int(3) NOT NULL DEFAULT '0',
  `i18n` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(64) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `level` int(3) NOT NULL DEFAULT '0',
  `pid` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_policy
-- ----------------------------
DROP TABLE IF EXISTS `bd_policy`;
CREATE TABLE `bd_policy` (
  `policy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '保险单ID',
  `policy_type_id` int(2) NOT NULL DEFAULT '0' COMMENT '保险类型ID（前期可以固定，1.意外险，2.安工险）',
  `policy_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '保险类型名称',
  `policy_num` varchar(32) NOT NULL DEFAULT '' COMMENT '团体意外保险预约单号JY2018000001(编号取ID)，安工险AG201800001',
  `policy_img` varchar(255) NOT NULL DEFAULT '' COMMENT '保险单图',
  `policy_pay` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保险费用',
  `policy_status` int(2) NOT NULL DEFAULT '0' COMMENT '保险状态：0.未定义,1.出险中,2.已出险,3.已失效,4.理赔中,5.已完成',
  `policy_claim_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '保险理赔时间',
  `policy_finish_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '保险完成时间（无论有无理赔）',
  `premium` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '两份保险总费用',
  `proof_text` varchar(255) NOT NULL DEFAULT '' COMMENT '理赔凭证文字描述',
  `proof_img` varchar(255) NOT NULL DEFAULT '' COMMENT '理赔凭证图',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型：0默认(其他），1.工装订单，2.家装订单，3.普通维修订单，4.售后维修订单（连锁），5.售后维修订单（非连锁），6.押金订单，8.提现，9.售后连锁月结审核，10.商品，13材料订单 14.优惠券/奖金',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `project_name` varchar(500) NOT NULL DEFAULT '老板梦项目' COMMENT '工程项目名称',
  `address` varchar(1000) NOT NULL DEFAULT '' COMMENT '工程施工地址',
  `ser_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监理ID',
  `ser_user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '被保负责人真实姓名（监理）',
  `ser_user_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '监理/签单人手机号',
  `start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '保险期限，开始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '保险期限，结束时间',
  `sign_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '签单日期',
  `sign_status` int(2) NOT NULL DEFAULT '0' COMMENT '签单状态：0.未签单,1.已签单，2.拒绝签单',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '工程状态：0.未定义,1.',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '保单生成时间',
  `pay_status` int(1) NOT NULL DEFAULT '0' COMMENT '0未付款，1.已付款（月结）',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算时间',
  `count` bigint(10) NOT NULL DEFAULT '0' COMMENT '计数，1~999999999（用于保险单号生成）',
  PRIMARY KEY (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_policy_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_policy_type`;
CREATE TABLE `bd_policy_type` (
  `type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '保险类型ID',
  `type_name` varchar(64) NOT NULL COMMENT '保险类型名',
  `firm_name` varchar(64) NOT NULL COMMENT '保险公司名',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_prepay_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_prepay_order`;
CREATE TABLE `bd_prepay_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '本订单编号',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联订单ID',
  `order_type` int(2) NOT NULL DEFAULT '1' COMMENT '订单类型：1.工装订单，2.家装订单，3.普通维修订单，4.售后维修订单（连锁），5.售后维修订单（非连锁）',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '关联订单编号',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `project_name` varchar(32) NOT NULL DEFAULT '' COMMENT '项目名称',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省名',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市id',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市名',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区县名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '施工地址',
  `apply_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请人ID',
  `apply_user_type` int(1) NOT NULL DEFAULT '0' COMMENT '申请人类型: 1.监理',
  `apply_user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '申请人姓名',
  `apply_user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '申请人电话',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `first_audit_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '一审审核时间',
  `first_audit_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '一审人ID',
  `last_audit_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `last_audit_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '最终审核用户ID',
  `proof_images` varchar(500) NOT NULL DEFAULT '' COMMENT '申请凭证图片',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述备注信息',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态:0.待审核,1审核通过,2.审核不通过,3.已取消',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='预付订单表';

-- ----------------------------
-- Table structure for bd_prepay_order_user
-- ----------------------------
DROP TABLE IF EXISTS `bd_prepay_order_user`;
CREATE TABLE `bd_prepay_order_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '收款人类型:1.工人2.设计师3.监理',
  `user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收款人电话',
  `prepay_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '预付订单ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '收款人姓名',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收款金额',
  `bills_url` varchar(255) NOT NULL DEFAULT '' COMMENT '预支付付款申请书',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='预付订单收款人表';

-- ----------------------------
-- Table structure for bd_q_r_code
-- ----------------------------
DROP TABLE IF EXISTS `bd_q_r_code`;
CREATE TABLE `bd_q_r_code` (
  `code_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '二维码ID',
  `equ_num` varchar(255) NOT NULL DEFAULT '' COMMENT '设备/二维码编号',
  PRIMARY KEY (`code_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45765 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_repair_child
-- ----------------------------
DROP TABLE IF EXISTS `bd_repair_child`;
CREATE TABLE `bd_repair_child` (
  `rep_child_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报修子类型ID',
  `rep_child_name` varchar(32) NOT NULL DEFAULT '' COMMENT '子类型名称',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属父报修类型',
  `tag` smallint(1) NOT NULL DEFAULT '0' COMMENT '子类型标记：１－设备　２－其他',
  `levels` varchar(500) NOT NULL DEFAULT '' COMMENT '维修等级ID数组字符窜',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序0-9999，数字越大，权重越大，排前面',
  PRIMARY KEY (`rep_child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_repair_child_brand_parts
-- ----------------------------
DROP TABLE IF EXISTS `bd_repair_child_brand_parts`;
CREATE TABLE `bd_repair_child_brand_parts` (
  `parts_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rep_child_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修子类型ID',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `parts_num` varchar(255) NOT NULL DEFAULT '' COMMENT '配件编号',
  `parts_name` varchar(255) NOT NULL DEFAULT '' COMMENT '配件名称',
  `parts_model` varchar(255) NOT NULL DEFAULT '' COMMENT '配件型号',
  `device_model` varchar(255) NOT NULL DEFAULT '' COMMENT '设备型号',
  `guarantee_out_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '质保期外的价格',
  `guarantee_in_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '质保期内的价格',
  `guarantee_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '配件质保时间（毫秒，页面填月）',
  PRIMARY KEY (`parts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='维修子类型品牌配件表';

-- ----------------------------
-- Table structure for bd_repair_child_brand_server_fee
-- ----------------------------
DROP TABLE IF EXISTS `bd_repair_child_brand_server_fee`;
CREATE TABLE `bd_repair_child_brand_server_fee` (
  `fee_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID 主键',
  `rep_child_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修子类型ID',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID，0非品牌',
  `guarantee_out_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '质保期外的工人费用',
  `guarantee_in_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '质保期内的工人费用',
  `level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '等级ID',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_repairs
-- ----------------------------
DROP TABLE IF EXISTS `bd_repairs`;
CREATE TABLE `bd_repairs` (
  `repairs_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报修类型ID',
  `repairs_name` varchar(32) NOT NULL DEFAULT '' COMMENT '报修类型名称',
  `tag` smallint(1) NOT NULL DEFAULT '0' COMMENT '子类型标记：１－设备　２－其他',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序0-9999，数字越大，权重越大，排前面',
  PRIMARY KEY (`repairs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_revenue
-- ----------------------------
DROP TABLE IF EXISTS `bd_revenue`;
CREATE TABLE `bd_revenue` (
  `revenue_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收益百分比 ID',
  `type` int(2) NOT NULL DEFAULT '-1' COMMENT '收益百分比类型：0平台，1工人， 2设计师， 3监理， 4推荐人',
  `view_name` varchar(32) NOT NULL DEFAULT '' COMMENT '显示名字',
  `percent_value` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '收益百分率值',
  PRIMARY KEY (`revenue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_role
-- ----------------------------
DROP TABLE IF EXISTS `bd_role`;
CREATE TABLE `bd_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `available` int(1) NOT NULL DEFAULT '1' COMMENT '是否可用,1：可用，0不可用',
  `sort` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `type` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0系统管理员，1手机业主端，2手机服务端，3公司，4普通用户，5连锁用户 ',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_role_new
-- ----------------------------
DROP TABLE IF EXISTS `bd_role_new`;
CREATE TABLE `bd_role_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '角色代码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '角色图片',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `bd_role_permission`;
CREATE TABLE `bd_role_permission` (
  `role_per_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `per_id` bigint(20) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31919 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_role_permit
-- ----------------------------
DROP TABLE IF EXISTS `bd_role_permit`;
CREATE TABLE `bd_role_permit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id',
  `permit_id` varchar(32) NOT NULL DEFAULT '' COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Table structure for bd_server
-- ----------------------------
DROP TABLE IF EXISTS `bd_server`;
CREATE TABLE `bd_server` (
  `ser_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '服务人员ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `pay_password` varchar(32) NOT NULL DEFAULT '' COMMENT '支付密码',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `gender` int(4) NOT NULL DEFAULT '0' COMMENT '0女 1男',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(32) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `role` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户角色：1工人，2设计师 , 3监理, 4司机',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区县',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `icon_md5key` varchar(50) NOT NULL DEFAULT '' COMMENT '头像Oss端key',
  `idcard` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `idimg_front` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证正面照片',
  `idimg_front_md5key` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证正面照片Oss端key',
  `idimg_reverse` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证反面照片',
  `idimg_reverse_md5key` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证反面照片Oss端key',
  `idimg_handheld` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证手持照片',
  `worker_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工种ID',
  `worker_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '工种',
  `worker_label` int(1) NOT NULL DEFAULT '0' COMMENT '标签: 0-非特殊工种　１-特殊工种',
  `other_certificate_img` varchar(255) NOT NULL DEFAULT '' COMMENT '其他证件照片',
  `average` float(2,1) NOT NULL DEFAULT '0.0' COMMENT '平均评分',
  `vip` int(4) NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '可操作数量',
  `vip_start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'vip开始时间',
  `vip_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'vip结束时间',
  `grade` smallint(1) NOT NULL DEFAULT '0' COMMENT '服务人员等级 0-无等级 1-一级 2-二级 3-三级',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '审核状态: 0-待审核  1-通过  2-未通过 3-禁用',
  `is_referrer` smallint(1) NOT NULL DEFAULT '0' COMMENT '是不是首页推荐/是不是要推荐的: 0-不推荐 1-推荐',
  `referrer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '推荐人手机号',
  `referrer_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '推荐人ID',
  `referrer_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '1- 业主  2-服务人员',
  `contacts_name` varchar(32) NOT NULL DEFAULT '' COMMENT '紧急联系人姓名',
  `contacts_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '紧急联系人电话',
  `last_login_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `signup_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`ser_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_server_speciality
-- ----------------------------
DROP TABLE IF EXISTS `bd_server_speciality`;
CREATE TABLE `bd_server_speciality` (
  `spec_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '擅长主键ID',
  `server_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '服务人员ID',
  `public_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '装修风格ID/装修类型ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '装修风格名称',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '擅长类型:1-擅长的技能  2-擅长的装修类型 3-擅长的装修风格',
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_servicebar_material
-- ----------------------------
DROP TABLE IF EXISTS `bd_servicebar_material`;
CREATE TABLE `bd_servicebar_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `spec` varchar(32) NOT NULL DEFAULT '' COMMENT '规格',
  `brand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '品牌',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='app 首页特色服务栏材料信息';

-- ----------------------------
-- Table structure for bd_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `bd_shopping_cart`;
CREATE TABLE `bd_shopping_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '库存单元ID',
  `quantity` int(10) NOT NULL DEFAULT '0' COMMENT '数量',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1客户，2服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_skill
-- ----------------------------
DROP TABLE IF EXISTS `bd_skill`;
CREATE TABLE `bd_skill` (
  `skill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '技能ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '技能名称',
  `describes` varchar(255) NOT NULL DEFAULT '' COMMENT '技能描述',
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_sku
-- ----------------------------
DROP TABLE IF EXISTS `bd_sku`;
CREATE TABLE `bd_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `no` varchar(50) NOT NULL DEFAULT '' COMMENT '库存货号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '库存名字',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '库存单元单价',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `stock` bigint(20) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `photos` varchar(255) NOT NULL DEFAULT '' COMMENT '库存单元照片',
  `sort` int(10) NOT NULL DEFAULT '1' COMMENT '排序',
  `sales` bigint(20) NOT NULL DEFAULT '0' COMMENT '库存单元销量',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `update_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `update_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改人ID',
  `supplier_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `supplier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '供应商名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_sku_attribute
-- ----------------------------
DROP TABLE IF EXISTS `bd_sku_attribute`;
CREATE TABLE `bd_sku_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存单元属性ID',
  `sku_id` bigint(20) NOT NULL COMMENT '库存单元ID',
  `attribute_id` bigint(20) NOT NULL COMMENT '属性ID',
  `attribute_name` varchar(32) NOT NULL DEFAULT '' COMMENT '属性名',
  `attribute_value` text NOT NULL COMMENT '库存单元属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store
-- ----------------------------
DROP TABLE IF EXISTS `bd_store`;
CREATE TABLE `bd_store` (
  `store_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺类型',
  `type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '店铺类型名',
  `scale_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺规模ID',
  `scale_name` varchar(32) NOT NULL DEFAULT '' COMMENT '店铺规模称谓',
  `store_class` int(1) NOT NULL DEFAULT '0' COMMENT '门店种类 1-连锁门店  2-非连锁门店',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '连锁客户ID 0-不是连锁客户',
  `store_num` varchar(32) NOT NULL DEFAULT '' COMMENT '门店编号',
  `store_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `host_name` varchar(32) NOT NULL DEFAULT '' COMMENT '店主姓名',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '联系手机',
  `telphone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '县区',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '区',
  `longitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '维度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '门店图片',
  `is_circle` int(1) NOT NULL DEFAULT '0' COMMENT '是否特殊商圈: 0-非特殊商圈 1-特殊商圈',
  `circle_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商业圈ID',
  `circle_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商业圈名称',
  `circle_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商圈类型ID',
  `circle_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商圈类型名称',
  `brand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `create_cus_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建门店的用户ID',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '申请创建时间',
  `open_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '开店时间',
  `close_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '关闭时间',
  `audit_status` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0主门店，1副门店',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0待分配（权限），1已分配，2已禁用3.已删除（关店）',
  `is_month_pay` int(1) NOT NULL DEFAULT '0' COMMENT '0-非月结(日结)  1-月结',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8750 DEFAULT CHARSET=utf8 COMMENT='√门店表';

-- ----------------------------
-- Table structure for bd_store_customer
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_customer`;
CREATE TABLE `bd_store_customer` (
  `store_cus_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_class` int(1) NOT NULL DEFAULT '0' COMMENT '门店类型',
  `cus_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店员ID',
  `is_keeper` int(1) NOT NULL DEFAULT '0' COMMENT '是否是店主，默认0不是，1是',
  PRIMARY KEY (`store_cus_id`),
  UNIQUE KEY `store_cus_id_UNIQUE` (`store_cus_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_customer_reserve_pool
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_customer_reserve_pool`;
CREATE TABLE `bd_store_customer_reserve_pool` (
  `phone` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_num` varchar(32) NOT NULL DEFAULT '' COMMENT '门店编号',
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_equ_add_server
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_equ_add_server`;
CREATE TABLE `bd_store_equ_add_server` (
  `ser_user_id` bigint(20) NOT NULL COMMENT '工人ID',
  PRIMARY KEY (`ser_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_equipment
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_equipment`;
CREATE TABLE `bd_store_equipment` (
  `equ_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `equ_name` varchar(32) NOT NULL DEFAULT '' COMMENT '设备名称',
  `equ_num` varchar(32) NOT NULL DEFAULT '' COMMENT '设备编号',
  `equ_model` varchar(255) NOT NULL DEFAULT '' COMMENT '设备型号',
  `store_class` int(1) NOT NULL DEFAULT '0' COMMENT '门店种类 1-连锁门店  2-非连锁门店',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '设备价格',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '生产日期',
  `delivery_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '送达时间',
  `guarantee_period` int(10) NOT NULL DEFAULT '0' COMMENT '保障期限（单位：月）',
  `guarantee_expire_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '质保期到期时间',
  `sup_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  `sup_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商、生产商',
  `rep_child_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修子类型ID',
  `rep_child_name` varchar(255) NOT NULL DEFAULT '' COMMENT '维修子类型名称',
  `add_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加门店设备工人ID',
  `add_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '添加门店设备工人姓名',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `sup_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商工人id',
  `sup_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商工人姓名',
  `chip_udid` varchar(255) NOT NULL DEFAULT '' COMMENT '机器码',
  `discard_period` int(5) NOT NULL DEFAULT '0' COMMENT '报废周期',
  `discard_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '报废时间',
  `maintain_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '最近保养时间',
  `next_maintain_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '下次保养时间',
  `maintain_period` int(2) NOT NULL DEFAULT '0' COMMENT '保养周期',
  `is_circle` int(1) NOT NULL DEFAULT '0' COMMENT '是否特殊商圈: 0-非特殊商圈 1-特殊商圈',
  `circle_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商业圈ID',
  `circle_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商业圈名称',
  `circle_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商圈类型，0非商圈设备',
  `circle_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商圈类型名称',
  PRIMARY KEY (`equ_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5608 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_equipment_upkeep_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_equipment_upkeep_record`;
CREATE TABLE `bd_store_equipment_upkeep_record` (
  `upkeep_record_id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '保养记录ID',
  `equ_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '设备ID',
  `equ_name` varchar(255) NOT NULL DEFAULT '' COMMENT '设备名称',
  `equ_num` varchar(255) NOT NULL DEFAULT '' COMMENT '设备编号',
  `store_id` bigint(10) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `discard_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '报废时间',
  `maintain_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '最近保养时间',
  `maintain_ser_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '保养人ID',
  `maintain_ser_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '保养人姓名',
  `maintain_period` int(5) NOT NULL DEFAULT '0' COMMENT '保养周期（单位月）',
  `next_maintain_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '下次保养时间',
  `maintain_contents` varchar(500) NOT NULL DEFAULT '' COMMENT '保养内容',
  `maintain_imgs` varchar(1000) NOT NULL DEFAULT '' COMMENT '保养图片',
  PRIMARY KEY (`upkeep_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_goods
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_goods`;
CREATE TABLE `bd_store_goods` (
  `good_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `good_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `units` varchar(255) NOT NULL DEFAULT '' COMMENT '单位',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `provinceId` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `cityId` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  `areaId` int(11) NOT NULL DEFAULT '0' COMMENT '区ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `longitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '维度',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `current_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `valid_begin_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '有限期开始时间',
  `valid_end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '有限期结束时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `details_html` varchar(1000) NOT NULL DEFAULT '' COMMENT '详情HTML路径',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `status` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0下架/未开售，1上架，2过期，3已禁用',
  `detail_text` text COMMENT '活动详情',
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_issue
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_issue`;
CREATE TABLE `bd_store_issue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0失效(删除），1.待处理，2.处理中，3.已完成',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_name` varchar(64) NOT NULL DEFAULT '' COMMENT '门店名',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `create_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dispose_content` text COMMENT '处理内容',
  `dispose_imgs` text COMMENT '处理图片',
  `dispose_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `finish_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_issue_details_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_issue_details_record`;
CREATE TABLE `bd_store_issue_details_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '问题点ID',
  `subject_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '主题ID',
  `subject_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主题名称',
  `subject_details` text NOT NULL COMMENT '主题详情',
  `issue_imgs` text NOT NULL COMMENT '问题点图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_issue_monitor_user
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_issue_monitor_user`;
CREATE TABLE `bd_store_issue_monitor_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cus_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `chain_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店父类ID（连锁用户ID）',
  `chain_name` varchar(32) NOT NULL DEFAULT '' COMMENT '连锁用户名',
  `auth_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '授权时间',
  `auth_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '授权用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_issue_subject
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_issue_subject`;
CREATE TABLE `bd_store_issue_subject` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '问题点主题名称',
  `details` text NOT NULL COMMENT '问题点详情',
  `issue_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '问题点类型ID',
  `issue_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '问题点类型名称',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人Id',
  `user_type` int(10) NOT NULL DEFAULT '0' COMMENT '0管理员，1工人，2设计师，3监理，5用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_issue_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_issue_type`;
CREATE TABLE `bd_store_issue_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人Id',
  `user_type` int(10) NOT NULL DEFAULT '0' COMMENT '0管理员，1工人，2设计师，3监理，5用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_member
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_member`;
CREATE TABLE `bd_store_member` (
  `link_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `cardno` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡号',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_repair_server
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_repair_server`;
CREATE TABLE `bd_store_repair_server` (
  `link_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店父类-连锁用户ID',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `rep_child_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修子类型ID',
  `server_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '工人ID',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_scale
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_scale`;
CREATE TABLE `bd_store_scale` (
  `scale_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规模ID',
  `scale_name` varchar(32) NOT NULL DEFAULT '' COMMENT '规模名称',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`scale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_server_reserve_pool
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_server_reserve_pool`;
CREATE TABLE `bd_store_server_reserve_pool` (
  `pool_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '工人电话号(未注册)',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '连锁用户ID',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `rep_child_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '维修子类型ID',
  PRIMARY KEY (`pool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_store_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_store_type`;
CREATE TABLE `bd_store_type` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '店铺类型ID',
  `type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_supplier
-- ----------------------------
DROP TABLE IF EXISTS `bd_supplier`;
CREATE TABLE `bd_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商的名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_supplier_customer
-- ----------------------------
DROP TABLE IF EXISTS `bd_supplier_customer`;
CREATE TABLE `bd_supplier_customer` (
  `cus_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `sup_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供应商ID',
  PRIMARY KEY (`cus_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_system_notice
-- ----------------------------
DROP TABLE IF EXISTS `bd_system_notice`;
CREATE TABLE `bd_system_notice` (
  `notice_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_num` varchar(30) NOT NULL DEFAULT '' COMMENT '公告编号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '公告标题',
  `intro` varchar(1000) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人姓名',
  `audience_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '听众类型:0-全部 1-业主端人员 2-服务端人员',
  `html_content` text NOT NULL COMMENT '内容',
  `html_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容html地址',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_transfer_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_transfer_order`;
CREATE TABLE `bd_transfer_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号码',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请人、用户ID',
  `user_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1业主，2工人，3设计师，4监理',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '下单人手机',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '照片',
  `order_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单类型：1余额转账，2保证金转账',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `check_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `check_user_id` bigint(20) NOT NULL DEFAULT '-1' COMMENT '审核人ID',
  `pay_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '转账类型：1支付宝，2微信， 3银联， 4线下，9平台操作',
  `pay_order_num` varchar(32) NOT NULL DEFAULT '' COMMENT '支付平台订单号',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0审核中，1审核通过转账完成，2，审核不通过',
  `done_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_name` varchar(32) NOT NULL DEFAULT '' COMMENT '银行名称',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `user_open_id` varchar(64) NOT NULL DEFAULT '' COMMENT '支付宝userid、微信用户openid',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '支付宝微信用户昵称',
  `order_remark` varchar(255) DEFAULT '' COMMENT '订单备注，拒绝理由',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_transport_demand
-- ----------------------------
DROP TABLE IF EXISTS `bd_transport_demand`;
CREATE TABLE `bd_transport_demand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '需求名称',
  `value` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '费用值/费用百分比值',
  `value_type` int(11) NOT NULL DEFAULT '0' COMMENT '值类型：1金额,2百分值',
  `fee_type` int(4) NOT NULL DEFAULT '0' COMMENT '费用类型:1固定,2待定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='货运需求';

-- ----------------------------
-- Table structure for bd_transport_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_transport_order`;
CREATE TABLE `bd_transport_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '类型(1即时,2预约)',
  `mileage` int(11) NOT NULL DEFAULT '0' COMMENT '总里程(米)',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `mileage_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '总里程费',
  `demand_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '附加需求总金额',
  `timeout_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '超时费',
  `timeout_millisecond` bigint(20) NOT NULL DEFAULT '0' COMMENT '超时毫秒数',
  `service_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '服务时间',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `depart_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '接单/出发时间',
  `arrive_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '到达/装车时间',
  `transport_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '开始运输时间',
  `destination_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '到达终点时间',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '下单人ID',
  `user_type` int(4) NOT NULL DEFAULT '0' COMMENT '下单人类型(1客户,2服务)',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '下单人姓名',
  `user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '下单人手机号',
  `user_avater` varchar(255) NOT NULL DEFAULT '' COMMENT '下单人头像',
  `vehicle_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '车型ID',
  `vehicle_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '车型名称',
  `vehicle_type_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '车型照片',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '订单备注',
  `chauffeur_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '司机ID',
  `chauffeur_name` varchar(32) NOT NULL DEFAULT '' COMMENT '司机姓名',
  `chauffeur_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '司机电话',
  `chauffeur_avater` varchar(255) NOT NULL DEFAULT '' COMMENT '司机头像',
  `vehicle_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '司机车辆ID',
  `vehicle_plate_no` varchar(32) NOT NULL DEFAULT '' COMMENT '车辆车牌号码',
  `vehicle_body_color` varchar(32) NOT NULL DEFAULT '' COMMENT '车辆车身颜色',
  `vehicle_show_name` varchar(32) NOT NULL DEFAULT '' COMMENT '车辆显示名称(车辆品牌名 + 空格 + 车系名)',
  `contain_unpaid` int(4) NOT NULL DEFAULT '0' COMMENT '包含未支付的(0无, 1有)',
  `is_materials` int(1) NOT NULL DEFAULT '0' COMMENT '是否是材料：0否，1是',
  `is_comment` int(1) NOT NULL DEFAULT '0' COMMENT '是否评价0否1是',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '订单状态：0待支付,1已支付/待接单,2已接单/已出发,3已到达/装车中,5运输中,6到达目的地,7订单完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='货运订单';

-- ----------------------------
-- Table structure for bd_transport_order_address
-- ----------------------------
DROP TABLE IF EXISTS `bd_transport_order_address`;
CREATE TABLE `bd_transport_order_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '类型(1始,2途,3终)',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省市ID',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省市名称',
  `city_id` int(20) NOT NULL DEFAULT '0' COMMENT '市区id',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市区名称',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `area` varchar(32) NOT NULL DEFAULT '' COMMENT '区县名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `longitude` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '地理经度',
  `latitude` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '地理维度',
  `floor_doorplate` varchar(32) NOT NULL DEFAULT '' COMMENT '楼层门牌号',
  `contacts_name` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contacts_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '联系人手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='货运订单地址';

-- ----------------------------
-- Table structure for bd_transport_order_demand
-- ----------------------------
DROP TABLE IF EXISTS `bd_transport_order_demand`;
CREATE TABLE `bd_transport_order_demand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '运单ID',
  `demand_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '需求ID',
  `demand_name` varchar(32) NOT NULL DEFAULT '' COMMENT '需求名称',
  `demand_value` double NOT NULL DEFAULT '0' COMMENT '需求值',
  `value_type` int(1) NOT NULL DEFAULT '0' COMMENT '需求值类型：1金额，2百分值',
  `fee_type` int(4) NOT NULL DEFAULT '0' COMMENT '费用类型:1固定,2待定',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '需求价格',
  `paid` int(4) NOT NULL DEFAULT '0' COMMENT '是否支付：0未支付，1已支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货运订单服务项';

-- ----------------------------
-- Table structure for bd_transport_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_transport_pay_order`;
CREATE TABLE `bd_transport_pay_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '运单ID',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '支付类型(1.发车费, 2附加费)',
  `no` varchar(32) NOT NULL DEFAULT '' COMMENT '支付单编号',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价格',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付价格',
  `user_coupon_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户优惠券ID',
  `coupon_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `pay_method` int(4) NOT NULL DEFAULT '0' COMMENT '支付方式：1支付宝，2微信',
  `pay_no` varchar(32) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `paid` int(4) NOT NULL DEFAULT '0' COMMENT '是否支付：0否，1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='货运支付单';

-- ----------------------------
-- Table structure for bd_url
-- ----------------------------
DROP TABLE IF EXISTS `bd_url`;
CREATE TABLE `bd_url` (
  `url_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url_value` varchar(255) NOT NULL DEFAULT '',
  `url_name` varchar(32) NOT NULL DEFAULT '',
  `url_type` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8 COMMENT='url表';

-- ----------------------------
-- Table structure for bd_user_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `bd_user_bank_card`;
CREATE TABLE `bd_user_bank_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型:   0平台， 1业主用户， 2服务人员',
  `cardholder_name` varchar(255) NOT NULL DEFAULT '' COMMENT '持卡人姓名',
  `idcard` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `bank_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '银行ID',
  `bank_card` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡卡号',
  `card_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡名称(E时代卡)',
  `card_type` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡类型:(银联借记卡)',
  `is_credit_card` int(1) NOT NULL DEFAULT '0' COMMENT '是否是信用卡,1为借记卡,2为信用卡',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0-解绑   1-绑定',
  `create_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bind_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `un_bind_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '解绑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `bd_user_coupon`;
CREATE TABLE `bd_user_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户卡券ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名(服务人员放真实姓名）',
  `user_type` int(4) NOT NULL DEFAULT '0' COMMENT '用户类型: 1客户，2服务',
  `coupon_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '券ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '票券名称',
  `value` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '券面值/折扣率值(例如8折为0.8)',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '券类型：1普通，2售后，3押金，4装修，6商品，7微工程，8货运,9VIP',
  `enjoy_type` int(4) NOT NULL DEFAULT '0' COMMENT '优惠享受类型：1金额,2折扣',
  `start_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '有效开始时间',
  `end_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '有效结束时间',
  `gain_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '获取优惠券时间',
  `logo_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '标志图',
  `main_photo` varchar(255) NOT NULL DEFAULT '' COMMENT '主图',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '票据描述、备注、使用指南等',
  `rules` varchar(20048) NOT NULL DEFAULT '{}' COMMENT '券类型对应规则实体序列化的JSON字符串',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '卡券状态：0未使用,1已使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_user_insure
-- ----------------------------
DROP TABLE IF EXISTS `bd_user_insure`;
CREATE TABLE `bd_user_insure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT '' COMMENT '编号',
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '用户真实姓名',
  `user_idcard` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '保险人身份证号',
  `user_type` int(1) DEFAULT '0' COMMENT '用户类型: 1-业主端 2-服务端',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `insured_time` bigint(15) DEFAULT '0' COMMENT '被保时间',
  `insured_end_time` bigint(15) DEFAULT '0' COMMENT '被保结束时间',
  `create_time` bigint(15) DEFAULT '0' COMMENT '创建时间',
  `modify_time` bigint(15) DEFAULT '0' COMMENT '修改时间',
  `province` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '省(订单施工地)',
  `province_id` int(11) DEFAULT '0' COMMENT '省ID(订单施工地)',
  `city` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '市(订单施工地)',
  `city_id` int(11) DEFAULT '0' COMMENT '市ID(订单施工地)',
  `area` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '区(订单施工地)',
  `area_id` int(11) DEFAULT '0' COMMENT '区ID(订单施工地)',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '详细地址(订单施工地)',
  `user_role` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '职业（工种）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=498 DEFAULT CHARSET=latin1 COMMENT='用户保险表';

-- ----------------------------
-- Table structure for bd_user_level
-- ----------------------------
DROP TABLE IF EXISTS `bd_user_level`;
CREATE TABLE `bd_user_level` (
  `user_level_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_user_role
-- ----------------------------
DROP TABLE IF EXISTS `bd_user_role`;
CREATE TABLE `bd_user_role` (
  `user_role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `user_type` int(1) unsigned NOT NULL COMMENT '用户类型：0系统管理员,1手机业主,3公司, 4普通客户，5连锁客户 ',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_user_role_new
-- ----------------------------
DROP TABLE IF EXISTS `bd_user_role_new`;
CREATE TABLE `bd_user_role_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型:0管理员 1客户 2服务',
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_vehicle_brand
-- ----------------------------
DROP TABLE IF EXISTS `bd_vehicle_brand`;
CREATE TABLE `bd_vehicle_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '车辆品牌ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '车辆品牌名称',
  `index` varchar(2) NOT NULL DEFAULT 'A' COMMENT '索引',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '车辆品牌描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='车辆品牌表';

-- ----------------------------
-- Table structure for bd_vehicle_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_vehicle_type`;
CREATE TABLE `bd_vehicle_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '车型名称',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT '车型照片',
  `length` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '长',
  `width` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '宽',
  `height` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '高',
  `load_weight` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '负载重量',
  `load_volume` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '负载体积',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='车辆车型';

-- ----------------------------
-- Table structure for bd_vehicle_type_area_price
-- ----------------------------
DROP TABLE IF EXISTS `bd_vehicle_type_area_price`;
CREATE TABLE `bd_vehicle_type_area_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID 主键',
  `vehicle_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '车型ID',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '价格类型：1普通价格，2监理价格，3.默认价格（全国通用）',
  `province` varchar(64) NOT NULL DEFAULT '' COMMENT '省名称',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID(必有)',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '市名称',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID(0时看上级)',
  `area` varchar(64) NOT NULL DEFAULT '' COMMENT '区名称',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID(0时看上级)',
  `initiate_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '起步价',
  `initiate_mileage` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '起步里程(单位：米)',
  `mileage_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '里程单价',
  `special_time_subjoin_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '特殊时间附加费用',
  `free_waiting_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '免费等待时间(毫秒)',
  `timeout_count_time` bigint(13) NOT NULL DEFAULT '600000' COMMENT '超时计算时间(毫秒)\r\r\n默认600000毫秒（10分钟）',
  `timeout_count_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '超时计算单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='车型区域价格';

-- ----------------------------
-- Table structure for bd_vip
-- ----------------------------
DROP TABLE IF EXISTS `bd_vip`;
CREATE TABLE `bd_vip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '用户类型：1客户, 2工人，3设计师，4监理，5司机',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `vip` int(4) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `amount` int(10) NOT NULL DEFAULT '0' COMMENT '操作xxx数量',
  `notes` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_vip_order
-- ----------------------------
DROP TABLE IF EXISTS `bd_vip_order`;
CREATE TABLE `bd_vip_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(4) NOT NULL DEFAULT '0' COMMENT '会员类型：1客户, 2服务',
  `vip` int(4) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '可操作数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `pay_method` int(4) NOT NULL DEFAULT '0' COMMENT '支付方式(1.支付宝，2微信)',
  `pay_no` varchar(64) NOT NULL DEFAULT '' COMMENT '支付流水编号',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '0待支付,1已支付,2已取消',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户开通vip支付订单';

-- ----------------------------
-- Table structure for bd_wallet
-- ----------------------------
DROP TABLE IF EXISTS `bd_wallet`;
CREATE TABLE `bd_wallet` (
  `wallet_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '钱包ID',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型：0平台， 1业主用户，2服务人员，3公司，4普通用户,5连锁用户',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '押金',
  `deposit_grade` int(10) NOT NULL DEFAULT '0' COMMENT '押金等级，0-未缴纳押金/押金扣除至0时，1-押金等级1，2-押金等级2,3-押金等级3',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `update_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`wallet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3020 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_wallet_op
-- ----------------------------
DROP TABLE IF EXISTS `bd_wallet_op`;
CREATE TABLE `bd_wallet_op` (
  `wallet_op_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '钱包操作ID',
  `wallet_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '钱包ID',
  `out_account` varchar(50) NOT NULL DEFAULT '' COMMENT '支付帐号',
  `in_account` varchar(50) NOT NULL DEFAULT '' COMMENT '收入帐号',
  `pay_method` smallint(1) NOT NULL DEFAULT '-1' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `pay_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `sys_order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '平台订单号',
  `in_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入金额',
  `out_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出金额',
  `sys_income` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台收入',
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '平台余额',
  `op_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `subject` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作主体',
  `out_wallet_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '出帐钱包ID',
  `in_wallet_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '进账钱包ID',
  `op_type` smallint(2) NOT NULL DEFAULT '0' COMMENT '操作记录类型：0默认(其他），1.工装2.家装3.售后4.维修（连锁）5.维修（非连锁）6.押金7.推荐人收益',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `out_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出账户余额',
  `in_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入账户余额',
  PRIMARY KEY (`wallet_op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='XXXXX废弃';

-- ----------------------------
-- Table structure for bd_wallet_op_record
-- ----------------------------
DROP TABLE IF EXISTS `bd_wallet_op_record`;
CREATE TABLE `bd_wallet_op_record` (
  `op_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '钱包操作记录ID',
  `op_type` int(2) NOT NULL DEFAULT '0' COMMENT '操作记录类型：0默认(其他），1.工装2.家装3.普通4.售后（连锁）5.售后（非连锁）6.押金7.推荐人收益8.提现9.售后连锁月结审核10.商品11.平台扣除用户余额  12.平台扣除用户押金,13.材料订单 14.优惠券/奖金，15.余额充值（平台直充）,16.预支付订单',
  `op_subject` varchar(255) NOT NULL DEFAULT '' COMMENT '记录描述',
  `op_time` bigint(15) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `wallet_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '出账钱包ID（用户钱包ID）',
  `io_type` int(1) NOT NULL DEFAULT '0' COMMENT '进出帐类型：1.用户进账（平台支付各种收益），2.用户出账（线上线下各种订单支付），3.流动进帐（交押金，充值），4.流动出帐（退押金，提现）',
  `user_type` int(1) NOT NULL DEFAULT '-1' COMMENT '用户类型：0平台，1业主用户，2服务人员，3公司，4普通用户，5连锁用户',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '出账/进账后,用户钱包余额',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `order_type` int(1) NOT NULL DEFAULT '0' COMMENT '订单类型：0默认(其他），1.工装订单，2.家装订单，3.普通维修订单，4.售后维修订单（连锁），5.售后维修订单（非连锁），6.押金订单，7.微工程订单, 8.提现，9.售后连锁月结审核，10.商品，13材料订单 14.优惠券/奖金 16.预支付订单',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：0默认，1支付宝支付，2微信支付， 3银联支付， 4线下支付，9平台操作',
  `pay_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `tax_rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  `tax` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '税金(pre_tax * tax)',
  `pre_tax` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '税前金额(出账/进账金额)',
  `after_tax` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '税后（pre_tax-tax）',
  `receipt` varchar(255) NOT NULL DEFAULT '' COMMENT '业务回单图，收据',
  `sys_order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '系统订单号',
  `pay_order_num` varchar(255) NOT NULL DEFAULT '' COMMENT '支付宝/微信订单号',
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1820 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `bd_warehouse`;
CREATE TABLE `bd_warehouse` (
  `warehouse_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `warehouse_name` varchar(128) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `province` varchar(64) NOT NULL DEFAULT '' COMMENT '省名称',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '市名称',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区域ID',
  `area` varchar(64) NOT NULL DEFAULT '' COMMENT '区域名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `longitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '经度',
  `latitude` double(10,7) NOT NULL DEFAULT '0.0000000' COMMENT '纬度',
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_warehouse_area
-- ----------------------------
DROP TABLE IF EXISTS `bd_warehouse_area`;
CREATE TABLE `bd_warehouse_area` (
  `wa_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '仓库区域主键ID',
  `warehouse_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省ID',
  `city_id` int(10) NOT NULL DEFAULT '0' COMMENT '市ID',
  `area_id` int(10) NOT NULL DEFAULT '0' COMMENT '区ID',
  PRIMARY KEY (`wa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bd_worker_type
-- ----------------------------
DROP TABLE IF EXISTS `bd_worker_type`;
CREATE TABLE `bd_worker_type` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工种ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '工种名',
  `label` int(1) NOT NULL DEFAULT '0' COMMENT '标签: 0-非特殊工种　１-特殊工种',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
