CREATE TABLE `m_resource` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `pid` BIGINT(20) NOT NULL COMMENT '父级',
  `name` VARCHAR(50) NOT NULL COMMENT '资源名称',
  `code` VARCHAR(20) DEFAULT NULL COMMENT '资源编码',
  `status` INT(5) DEFAULT NULL COMMENT '1 启用 2 禁用',
  `zh_msg` VARCHAR(255) DEFAULT NULL COMMENT '中文提示话术',
  `en_msg` VARCHAR(255) DEFAULT NULL COMMENT '英文提示话术',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB COMMENT = '微信资源表';

CREATE TABLE `m_role_resource` (
   `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `user_type` VARCHAR(10) DEFAULT NULL COMMENT '用户类型 mgu(01) or tpa(02)  ',
   `resource_id` BIGINT(20) DEFAULT NULL COMMENT '资源id',
   `status` INT(5) DEFAULT NULL COMMENT '1 启用 2 禁用',
   `underwrite_id` VARCHAR(50) DEFAULT NULL COMMENT '承保商id',
   `create_time` DATETIME DEFAULT NULL COMMENT '创建时间',
   `client_id` VARCHAR(64) DEFAULT '' COMMENT '公司ID',
   PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 COMMENT = '模块白名单表';

CREATE TABLE `m_login_restrict_list` (
    `acskey` BIGINT(11) NOT NULL AUTO_INCREMENT,
    `reversal_flag` VARCHAR(1) NOT NULL COMMENT '限制反转标记：1黑名单，2白名单',
    `buss_type` VARCHAR(30) NOT NULL COMMENT '业务类型：01MGU，02TPA',
    `uw_id` VARCHAR(15) NOT NULL DEFAULT '' COMMENT '承包商id',
    `sub_uw_id` VARCHAR(15) DEFAULT NULL COMMENT '子承包商id',
    `sp_cate` VARCHAR(30) DEFAULT NULL COMMENT '特殊分类',
    `client_id` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '公司ID',
    `client_short_name` VARCHAR(255) DEFAULT NULL COMMENT '公司简称',
    `emp_id` VARCHAR(100) DEFAULT NULL COMMENT '会员ID',
    `is_valid` VARCHAR(5) DEFAULT '0' COMMENT '是否有效：0可用，1禁用',
    PRIMARY KEY (`acskey`)
) ENGINE=INNODB COMMENT '登录限制表';


CREATE TABLE `m_mobile_project_wx` (
   `ACSKEY` BIGINT(11) NOT NULL AUTO_INCREMENT,
   `underwriterid` TEXT COMMENT '承包商',
   `underwritername` TEXT,
   `Subunderwriterid` TEXT,
   `subuwname` TEXT,
   `CategoryID` TEXT,
   `categoryName` TEXT,
   `client` TEXT COMMENT '客户',
   `clientname` TEXT,
   `chomepagetitle` VARCHAR(100) DEFAULT NULL COMMENT '中文首页标题',
   `ehomepagetitle` VARCHAR(100) DEFAULT NULL COMMENT '英文首页标题',
   `cintroduction` TEXT COMMENT '中文介绍',
   `eintroduction` TEXT COMMENT '英文介绍',
   `caddress` TEXT COMMENT '中文地址',
   `eaddress` TEXT COMMENT '英文地址',
   `email` VARCHAR(32) DEFAULT NULL COMMENT '邮箱',
   `status` VARCHAR(4) DEFAULT NULL COMMENT '状态',
   `adddate` DATETIME DEFAULT NULL COMMENT '创建时间',
   `updatedate` DATETIME DEFAULT NULL COMMENT '修改时间',
   `AAE011` VARCHAR(20) DEFAULT NULL,
   `AAE017` VARCHAR(16) DEFAULT NULL,
   `AAE036` DATETIME DEFAULT NULL,
   `AAE012` VARCHAR(20) DEFAULT NULL,
   `AAE018` VARCHAR(16) DEFAULT NULL,
   `AAE037` DATETIME DEFAULT NULL,
   PRIMARY KEY (`ACSKEY`) USING BTREE
) ENGINE=INNODB COMMENT '承保商配置表';


CREATE TABLE `m_mobile_project_detail_wx` (
  `acskey` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `projectid` BIGINT(11) NOT NULL COMMENT '手机项目id',
  `number` VARCHAR(40) DEFAULT NULL COMMENT '号码（热线/电话/传真）',
  `cdesrc` VARCHAR(255) DEFAULT NULL COMMENT '中文说明',
  `edesrc` VARCHAR(255) DEFAULT NULL COMMENT '英文说明',
  `status` VARCHAR(4) DEFAULT NULL COMMENT '类型（1：电话，2：热线，3：传真）',
  `adddate` DATETIME DEFAULT NULL COMMENT '创建时间',
  `updatedate` DATETIME DEFAULT NULL COMMENT '修改时间',
  `AAE011` VARCHAR(20) DEFAULT NULL,
  `AAE017` VARCHAR(16) DEFAULT NULL,
  `AAE036` DATETIME DEFAULT NULL,
  `AAE012` VARCHAR(20) DEFAULT NULL,
  `AAE018` VARCHAR(16) DEFAULT NULL,
  `AAE037` DATETIME DEFAULT NULL,
  `priority` VARCHAR(2) NOT NULL COMMENT '优先级（1,2,3...）',
  PRIMARY KEY (`acskey`) USING BTREE
) ENGINE=INNODB COMMENT '客服热线配置表';


-- 测试数据
-- 15905 m_resource 数据导入
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('1','0','我的保单','20001','1','无权限','No permission','按钮','2020-07-15 10:08:22','2020-07-15 10:08:25');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('2','0','理赔申请','20002','1','根据您的保险公司内部监管要求，暂时无法受理影像件理赔，请您将理赔件快递至万欣和，我们会尽快处理您的理赔。','The Online Claim Submission service is currently unavailable for your insurance policy.','按钮','2020-07-15 10:09:10','2020-07-15 10:09:13');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('3','0','理赔查询','20003','1','无权限','No permission','按钮','2020-07-15 10:09:56','2020-07-15 10:09:58');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('4','0','资料下载','20004','1','无权限','No permission','按钮','2020-07-15 10:10:28','2020-07-15 10:10:30');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('5','0','合作医院','20005','1','无权限','No permission','按钮','2020-07-15 10:11:02','2020-07-15 10:11:05');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('6','0','医院查询','20006','1','无权限','No permission','按钮','2020-07-15 10:11:25','2020-07-15 10:11:27');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('7','0','就诊预约','20007','1','无权限','No permission','按钮','2020-07-15 10:12:23','2020-07-15 10:12:25');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('8','0','授权申请','20008','1','无权限','No permission','按钮','2020-07-15 10:12:55','2020-07-15 10:12:57');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('9','0','自付金额','20009','1','无权限','No permission','按钮','2020-07-15 10:13:29','2020-07-15 10:13:32');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('10','0','预授权','30001','1','无权限','No permission','按钮','2020-07-15 10:23:12','2020-07-15 10:23:14');
INSERT INTO `m_resource` (`id`, `pid`, `name`, `code`, `status`, `zh_msg`, `en_msg`, `remark`, `create_time`, `update_time`) VALUES('11','0','预约','30002','1','无权限','No permission','按钮','2020-07-15 10:23:36','2020-07-15 10:23:38');



-- 15905 m_role_resource 数据导入
-- 017
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '017', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '017', '', SYSDATE());

-- 094
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '094', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '094', '', SYSDATE());

-- 055
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '055', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '055', '', SYSDATE());

-- 078
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '078', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '078', '', SYSDATE());


-- 083
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '083', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '083', '', SYSDATE());

-- 089
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '089', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '089', '', SYSDATE());

-- 047
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '047', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '047', '', SYSDATE());

-- 010
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '010', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '010', '', SYSDATE());

-- 045
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '045', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '045', '', SYSDATE());

-- 075
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '075', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '075', '', SYSDATE());

-- 003
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '003', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '003', '', SYSDATE());

-- 014
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '014', '', SYSDATE());
-- INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '014', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '014', '', SYSDATE());

-- 093
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '093', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '093', '', SYSDATE());

-- 081
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '081', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '081', '', SYSDATE());

-- 027
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '027', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '027', '', SYSDATE());

-- 054
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '054', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '054', '', SYSDATE());

-- 077
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '077', '', SYSDATE());

-- 099
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '077', '', SYSDATE());
-- INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '077', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '077', '', SYSDATE());


-- 040
-- YK Pao
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '040', '9375', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '040', '9375', SYSDATE());
-- NYU Shanghai
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '040', '37574', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '040', '37574', SYSDATE());

-- Deloitte CN 35766
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '040', '35766', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '040', '35766', SYSDATE());

-- CXMT 35631
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '040', '35631', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '040', '35631', SYSDATE());

-- SCHWARZMAN
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '040', '38321', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '040', '38321', SYSDATE());

-- 058
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '058', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '058', '', SYSDATE());

-- 044
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '044', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '044', '', SYSDATE());

-- 103
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '103', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '103', '', SYSDATE());

-- 092
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '1','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '2','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '3','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '4','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '5','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '6','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '7','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '8','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '9','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '10','1', '092', '', SYSDATE());
INSERT INTO m_role_resource(user_type, resource_id,`status`,underwrite_id, client_id,create_time) VALUES('02', '11','1', '092', '', SYSDATE());



INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('1','1','01','','','','391','Alibaba','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('2','1','01','','','','20164','HZ Alibaba','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('3','1','01','','','','24726','Alibabapictures','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('4','2','02','017','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('5','2','02','094','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('8','2','02','083','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('9','2','02','089','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('10','2','02','047','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('12','2','02','045','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('13','2','02','075','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('14','2','02','003','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('15','2','02','014','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('17','2','02','081','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('19','2','02','054','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('20','2','02','077','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('21','2','02','099','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('22','2','02','058','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('23','2','02','044','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('24','2','02','103','','','','','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('26','2','02','040','','','35766','Deloitte CN','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('27','2','02','040','','','37574','NYU Shanghai','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('28','2','02','040','','','35631','CXMT','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('29','2','02','040','','','38321','SCHWARZMAN','','0');
INSERT INTO `m_login_restrict_list` (`acskey`, `reversal_flag`, `buss_type`, `uw_id`, `sub_uw_id`, `sp_cate`, `client_id`, `client_short_name`, `emp_id`, `is_valid`) VALUES('30','2','02','040','','','9375','YK PAO','','0');



-- m_mobile_project_wx
-- 默认
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('1','','','','','','','','','万欣和','MSH CHINA','<p>\r\n	<strong>MSH CHINA 简介</strong>\r\n</p>\r\n<p>\r\n	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<strong>MSH INTERNATIONAL 简介</strong>\r\n</p>\r\n<p>\r\n	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。\r\n</p>','<!--StartFragment -->\r\n<div>\r\n	<strong>About MSH CHINA</strong> \r\n	<p>\r\n		Founded in 2001, MSH CHINA is a leading high-end health insurance services provider in China. Our headquarters and operations center is in Shanghai. We have branch offices in Beijing, Guangzhou, Shenzhen, Chengdu and service offices in Dalian, Wuhan and Suzhou. MSH CHINA is the Asia pacific headquarter of MSH INTERNATIONAL. In addition, MSH INTERNATIONAL has a branch office in Singapore to serve the rest of the Asia-Pacific region.\r\n	</p>\r\n	<p>\r\n		MSH CHINA\'s main business is to provide high-end insurance products and far-reaching service to corporate clients and individuals. Currently, we hold the largest market share in China\'s high-end health insurance and serve over 1,000 companies, many of which are Fortune 500 companies.\r\n	</p>\r\n	<p>\r\n		<strong>Brief Introduction of MSH INTERNATIONAL</strong>\r\n	</p>\r\n	<p>\r\n		Founded in 1974, MSH INTERNATIONAL is a world leader in the design and management of international healthcare solutions. Via its four regional headquarters in Paris, Calgary, Dubai and Shanghai, MSH INTERNATIONAL provides 24/7, round-clock assistance in 40 languages for its 2,000 corporate clients and 330,000 insured members across 200 countries. Its majority shareholder is the House of Rothschild, a major player in the financial industry in Europe for more than two centuries.\r\n	</p>\r\n</div>','<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		万欣和（上海）企业服务有限公司/上海服务中心\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层\r\n		</div>\r\n		<div>\r\n			邮编：200127\r\n		</div>\r\n		<div>\r\n			电话：400 613 0330/ +86 21 6187 0330\r\n		</div>\r\n		<div>\r\n			传真： +86 21 6160 0208\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		北京分公司\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室\r\n		</div>\r\n		<div>\r\n			邮编 ：100022\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		广州分公司\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			地址：中国广州环市东路339号广东国际大厦主楼1210房\r\n		</div>\r\n		<div>\r\n			邮编：510098\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		深圳办公室\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C\r\n		</div>\r\n		<div>\r\n			邮编：518934\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		成都办公室\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806\r\n		</div>\r\n		<div>\r\n			邮编：610041\r\n		</div>\r\n	</div>\r\n</div>','<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		MSH China Enterprise Co.,Ltd / Shanghai Service Center\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C\r\n		</div>\r\n		<div>\r\n			Post code: 200127\r\n		</div>\r\n		<div>\r\n			Tel: 400 613 0330 / +86 21 6187 0330\r\n		</div>\r\n		<div>\r\n			Fax: +86 21 6160 0208\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		Beijing Branch\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C\r\n		</div>\r\n		<div>\r\n			Post code: 100022\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		GuangZhou Branch\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China\r\n		</div>\r\n		<div>\r\n			Post code: 510098\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		Shenzhen Office\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China\r\n		</div>\r\n		<div>\r\n			Post code: 518934\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"item page_list no_margin_top\">\r\n	<div class=\"page_list_title\">\r\n		Chengdu Office\r\n	</div>\r\n	<div class=\"page_list_text\">\r\n		<div>\r\n			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China\r\n		</div>\r\n		<div>\r\n			Post code: 610041\r\n		</div>\r\n	</div>\r\n</div>','','','2016-10-12 13:58:06','2017-06-07 13:55:27','admin','1000000000000000','2016-10-12 14:20:20','admin','1000000000000000','2017-06-07 13:55:27');
-- 017
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('2','017','AEGON THTF','','','','','','','同方保险 - 万欣和','AEGON THTF– MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 094
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('3','094','AIC-AXA','','','','','','','AIC - 万欣和','AIC – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-10-25 14:14:54','2019-11-19 13:53:29','admin','1000000000000000','2019-10-25 14:18:15','admin','1000000000000000','2019-11-19 13:53:29');
-- 055
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('4','055','Avrist','','','','','','','Avrist General Insurance–MSH','Avrist General Insurance–MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('5','055','Avrist','','','','','7976,35345','NAE,NAE SEA','Avrist General Insurance–MSH','Avrist General Insurance–MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 078
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('6','078','Bao Long','','','','','','','MSH','MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('7','078','Bao Long','','','','','7976,35345','NAE,NAE SEA','MSH','MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 083
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('8','083','Beijing Life','','','','','','','北京人寿保险医疗保险服务中心','BEIJING LIFE Insurance Service Center','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-01-25 13:14:49','2019-01-29 10:49:47','admin','1000000000000000','2019-01-25 13:17:46','admin','1000000000000000','2019-01-29 10:49:47');
-- 089
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('9','089','BoComm Life','','','','','','','交银康联 - 万欣和','Bocommlife – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-10-28 10:36:35','2019-10-28 10:39:16','admin','1000000000000000','2019-10-28 10:39:16','','','2019-10-28 10:39:16');
-- 047
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('10','047','Bohai Life','','','','','','','渤海人寿 - 万欣和','Bohai Life – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2019-07-13 12:04:47','admin','1000000000000000','2019-07-13 12:04:47','','',NULL);
-- 010
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('11','010','CCIC','','','','','','','MSH-万欣和','MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2019-07-13 12:04:47','admin','1000000000000000','2019-07-13 12:04:47','','',NULL);
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('12','010','CCIC','','','','','7976,25638,35345','NAE,NAE Group,NAE SEA','MSH-万欣和','MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2019-07-13 12:04:47','admin','1000000000000000','2019-07-13 12:04:47','','',NULL);
-- 045
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('13','045','CCIC-Hannover Re','','','','','','','大地上分-汉诺威再保险公司','CCIC-Hannover Re MSH Service','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2019-07-13 12:04:47','admin','1000000000000000','2019-07-13 12:04:47','','',NULL);
-- 075
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('14','075','CCIC-Partner Re','','','','','','','MSH-万欣和','MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2019-07-13 12:04:47','admin','1000000000000000','2019-07-13 12:04:47','','',NULL);
-- 003
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('15','003','CCIC-Scor','','','','','','','MSH-万欣和','MSH','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2019-07-13 12:04:47','admin','1000000000000000','2019-07-13 12:04:47','','',NULL);
-- 014
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('16','014','China Life','','','','','','','中国人寿 - 万欣和','China Life – MSH China','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 093
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('17','093','DIC','','','','','','','Dubai Insurance Company - 万欣和','Dubai Insurance Company – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-08-03 17:39:57','2020-08-04 09:28:56','admin','1000000000000000','2020-08-03 17:47:49','admin','1000000000000000','2020-08-04 09:28:56');
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('18','093','DIC','','','','','25638','NAE Group','Dubai Insurance Company - 万欣和','Dubai Insurance Company – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-08-03 17:39:57','2020-08-04 09:28:56','admin','1000000000000000','2020-08-03 17:47:49','admin','1000000000000000','2020-08-04 09:28:56');
-- 081
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('19','081','Dilnia-Fosun United','','','','','','','Dilnia-Fosun United','Dilnia-Fosun United','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-03-17 16:54:12','2020-03-17 17:06:23','admin','1000000000000000','2020-03-17 16:57:20','admin','1000000000000000','2020-03-17 17:06:23');
-- 027
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('20','027','Forte','','','','','','','富得保险 - 万欣和','FORTE – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('21','027','Forte','','','','','35345','NAE SEA','富得保险 - 万欣和','FORTE – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 054
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('22','054','Fosun United','','','','','','','复星联合健康万欣和服务中心','Fosun United Health MSH Servic','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2020-06-03 13:56:43','admin','1000000000000000','2019-07-13 12:04:47','admin','1000000000000000','2020-06-03 13:56:43');
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('23','054','Fosun United','','','','','12395','Zhuhai Gaoling Equity Investment Management Ltd.','复星联合健康万欣和服务中心','Fosun United Health MSH Servic','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-07-13 12:04:47','2020-06-03 13:56:43','admin','1000000000000000','2019-07-13 12:04:47','admin','1000000000000000','2020-06-03 13:56:43');
-- 077
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('24','077','Liberty','','','','','','','利宝保险—万欣和','Liberty-MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 099
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('25','099','New China Life','','','','','','','新华人寿 - 万欣和','NewChina Life – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-04-27 16:52:19','2020-04-27 16:56:11','admin','1000000000000000','2020-04-27 16:56:11','','','2020-04-27 16:56:11');
-- 040
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('26','040','PICC 财险','','','','','','','中国人民财产保险股份有限公司','PICC P&C','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');
-- 058
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('27','058','Trust Mutual Life','','','','','','','信美相互医疗保险服务中心','Trust Life Insurance Service','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');

-- 044
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('28','044','ZhongAn','','','','','','','众安保险 - 万欣和','ZhongAn – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2019-12-18 15:44:38','2019-12-18 15:44:38','admin','1000000000000000','2019-12-18 15:44:38','','','2019-12-18 15:44:38');

-- 103
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('29','103','Guohua Life','','','','','','','国华人寿 - 万欣和','GuoHua Life – MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-07-14 16:38:52','2020-07-14 16:46:47','admin','1000000000000000','2020-07-14 16:46:47','','','2020-07-14 16:46:47');

-- 092
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('30','092','Zetta','','','','','','','Zetta Insurance Company Ltd - 万欣和','Zetta Insurance Company Ltd– MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-08-03 17:48:07','2020-08-04 09:28:29','admin','1000000000000000','2020-08-03 17:51:08','admin','1000000000000000','2020-08-04 09:28:29');
INSERT INTO `m_mobile_project_wx` (`ACSKEY`, `underwriterid`, `underwritername`, `Subunderwriterid`, `subuwname`, `CategoryID`, `categoryName`, `client`, `clientname`, `chomepagetitle`, `ehomepagetitle`, `cintroduction`, `eintroduction`, `caddress`, `eaddress`, `email`, `status`, `adddate`, `updatedate`, `AAE011`, `AAE017`, `AAE036`, `AAE012`, `AAE018`, `AAE037`) VALUES('31','092','Zetta','','','','','25638','NAE Group','Zetta Insurance Company Ltd - 万欣和','Zetta Insurance Company Ltd– MSH CHINA','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<p>
	<strong>MSH CHINA 简介</strong>
</p>
<p>
	万欣和（上海）企业服务公司（“万欣和”）成立于2001年，在中国高端健康险服务领域排名第一。作为全国最大的高端健康险管理服务商，我们拥有超过1,000家企业客户，包括多家世界500强企业。我们的总部和运营中心位于上海，设有北京分公司、广州分公司，深圳办公室，成都办公室，及大连、武汉和苏州3个服务代表处。我们的主营业务是为企业客户和个人客户提供高端保险产品和服务。万欣和是MSH INTERNATIONAL 的亚太区区域总部。 同时，我们与MSH INTERNATIONAL新加坡服务代表处紧密合作，为其他亚太地区提供无远弗届的服务。
</p>
<p>
	&nbsp;
</p>
<p>
	<strong>MSH INTERNATIONAL 简介</strong>
</p>
<p>
	MSH INTERNATIONAL 成立于1974年，是国际健康险设计和管理方面的全球领军者。设有法国巴黎、加拿大卡尔加里、中东迪拜和中国上海4个区域总部，为客户提供24小时不间断的服务。 MSH INTERNATIONAL来自各个国家的员工具备40种语言能力，为遍布全球200个国家，超过2000家企业的33万被保险人提供服务，致力于为个人客户提供高质量的保险方案，为企业客户提供量身定做的保险产品。MSH INTERNATIONAL的大股东是活跃于欧洲金融界长达两个多世纪的罗斯柴尔德家族（the House of Rothschild）。
</p>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		万欣和（上海）企业服务有限公司/上海服务中心
	</div>
	<div class="page_list_text">
		<div>
			地址：中国上海浦东峨山路91弄陆家嘴软件园9号楼北塔5层
		</div>
		<div>
			邮编：200127
		</div>
		<div>
			电话：400 613 0330/ +86 21 6187 0330
		</div>
		<div>
			传真： +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		北京分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国北京朝阳区东三环中路39号建外SOHO西区18号楼2702室
		</div>
		<div>
			邮编 ：100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		广州分公司
	</div>
	<div class="page_list_text">
		<div>
			地址：中国广州环市东路339号广东国际大厦主楼1210房
		</div>
		<div>
			邮编：510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		深圳办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：深圳市福田区滨河大道京基滨河时代广场北区（二期）1905C
		</div>
		<div>
			邮编：518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		成都办公室
	</div>
	<div class="page_list_text">
		<div>
			地址：成都市武侯区新希望路9号锦官新城西区金榕园A栋1806
		</div>
		<div>
			邮编：610041
		</div>
	</div>
</div>','<div class="item page_list no_margin_top">
	<div class="page_list_title">
		MSH China Enterprise Co.,Ltd / Shanghai Service Center
	</div>
	<div class="page_list_text">
		<div>
			Address: 5/F, Building 9, Lujiazui Software Park, Lane 91, E Shan Road, Pudong, Shanghai, P.R.C
		</div>
		<div>
			Post code: 200127
		</div>
		<div>
			Tel: 400 613 0330 / +86 21 6187 0330
		</div>
		<div>
			Fax: +86 21 6160 0208
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Beijing Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: 2702 Building 18, JianWai SOHO, 39 East 3rd-Ring Road,Chao Yang District, Beijing, P.R.C
		</div>
		<div>
			Post code: 100022
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		GuangZhou Branch
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1210, 12/F, Main Tower, Guangdong International Building, No 339 Huanshi Road East, Guangzhou, China
		</div>
		<div>
			Post code: 510098
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Shenzhen Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1905C, Tower North, KingKey BinHe times square, Futian District, Shenzhen, China
		</div>
		<div>
			Post code: 518934
		</div>
	</div>
</div>
<div class="item page_list no_margin_top">
	<div class="page_list_title">
		Chengdu Office
	</div>
	<div class="page_list_text">
		<div>
			Address: Room 1806, Building A, Jinrong Yard, West Zone, Jinguan Xincheng, No. 9 Xinxi Wang Road, Wuhou District, Chengdu, China
		</div>
		<div>
			Post code: 610041
		</div>
	</div>
</div>','','','2020-08-03 17:48:07','2020-08-04 09:28:29','admin','1000000000000000','2020-08-03 17:51:08','admin','1000000000000000','2020-08-04 09:28:29');


-- m_mobile_project_detail_wx
-- 默认 mgu取的热线
INSERT INTO `m_mobile_project_detail_wx` (`projectid`, `number`, `cdesrc`, `edesrc`, `status`, `adddate`, `updatedate`, `priority`) VALUES('1','4006130330','中国大陆免长途费','24/7 Service Hotline','1', SYSDATE(), SYSDATE(), '1');
INSERT INTO `m_mobile_project_detail_wx` ( `projectid`, `number`, `cdesrc`, `edesrc`, `status`, `adddate`, `updatedate`, `priority`) VALUES('1','+862161870330','7*24小时服务热线','Overseas Hotline','2', SYSDATE(), SYSDATE(), '2');
-- 017
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('2', '4006521660', '中国大陆免长途费', '24/7 Service Hotline', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('2', '+862161870466', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 094
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('3', '+862160605100', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 055 others
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('4', '001803490700', '印度尼西亚免长途费', 'Indonesia Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('4', '+862161870205', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 055 m_mobile_project_detail_wx (NAE,NAE SEA)
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('5', '001803490700', '印度尼西亚免长途费', 'Indonesia Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('5', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 078 others
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('6', '12011959', '越南免长途费', 'Vietnam Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('6', '+862161870276', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 078 m_mobile_project_detail_wx (NAE,NAE SEA)
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('7', '12011959', '越南免长途费', 'Vietnam Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('7', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 083
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('8', '4006361956', '中国大陆免长途费', '24/7 Service Hotline', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('8', '+862161871596', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 089
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('9', '+862160605105', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '2');
-- 047
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('10', '+862161870273', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 010 others
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('11', '+862161870278', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 010 m_mobile_project_detail_wx (NAE,NAE SEA)
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('12', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 045
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('13', '+862161870278', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 075
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('14', '+862161870278', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 003
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('15', '+862161870278', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 014
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('16', '4006530399', '中国大陆免长途费', '24/7 Service Hotline', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('16', '+862161870399', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 093
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('17', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 093 m_mobile_project_detail_wx (含NAE Group）
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('18', '80004910898', '阿联酋免长途费', 'UAE Toll Free', '1', SYSDATE(), SYSDATE(), '3');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('18', '00800100777', '卡塔尔免长途费', 'Qatar Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('18', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 081
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('19', '+862160605100', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 027 others
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('20', '1800211800', '柬埔寨免长途费', 'Cambodia Toll Free', '1', SYSDATE(), SYSDATE(), '4');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('20', '00308123510', '韩国免长途费', 'South Korea Toll Free', '1', SYSDATE(), SYSDATE(), '3');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('20', '0018004910237', '泰国免长途费', 'Thailand Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('20', '+862161871597', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 027 m_mobile_project_detail_wx NAE SEA
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('21', '1800211800', '柬埔寨免长途费', 'Cambodia Toll Free', '1', SYSDATE(), SYSDATE(), '4');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('21', '00308123510', '韩国免长途费', 'South Korea Toll Free', '1', SYSDATE(), SYSDATE(), '3');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('21', '0018004910237', '泰国免长途费', 'Thailand Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('21', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 054 Others
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('22', '+862161870286', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');
-- 054 HH
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('23', '+862160605116', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 077
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('24', '+862161870292', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 099
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('25', '4009205263', '中国大陆免长途费', '24/7 Service Hotline', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('25', '+862160605115', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 040
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('26', '4006193310', '中国大陆免长途费', '24/7 Service Hotline', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('26', '+862161870217', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 058
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('27', '+862161870243', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 044
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('28', '+862161870215', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 103
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('29', '4008217932', '中国大陆免长途费', '24/7 Service Hotline', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('29', '+862160605117', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 092
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('30', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');

-- 092  (含NAE Group）
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('31', '88003013823', '俄罗斯免长途费', 'Russia Toll Free', '1', SYSDATE(), SYSDATE(), '2');
INSERT INTO m_mobile_project_detail_wx(projectid, number, cdesrc, edesrc, `status`, `adddate`, updatedate,  priority) VALUES('31', '+862161870252', '7*24小时服务热线', 'Overseas Hotline', '2', SYSDATE(), SYSDATE(), '1');