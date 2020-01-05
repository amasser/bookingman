CREATE TABLE `guest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '顾客id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '顾客姓名',
  `credentialNo` varchar(32) NOT NULL COMMENT '证件号',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '手机号 ',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别 0=未知 1=男 2=女',
  `totalCharge` int(11) NOT NULL DEFAULT '0' COMMENT '累计充值',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '当前余额',
  `totalConsume` int(11) NOT NULL DEFAULT '0' COMMENT '累计消费',
  `consumeTimes` int(11) NOT NULL DEFAULT '0' COMMENT '消费次数',
  `guestLvId` int(11) NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常启用 9=账户冻结 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `guest_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员级别id',
  `name` varchar(32) NOT NULL COMMENT '会员级别名称',
  `discount` float NOT NULL DEFAULT '1' COMMENT '会员级别折扣 1.0表示无折扣',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=启用 99=删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '员工手机号',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '员工名称',
  `pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常 99=删除',
  `roleId` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `isSuper` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是超管 1=超管',
  `lastLoginAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `oper_log` (
  `id` int(11) NOT NULL COMMENT '操作记录id',
  `managerId` int(11) NOT NULL COMMENT '操作员id 对应员工id',
  `managerName` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `operBiz` varchar(64) NOT NULL COMMENT '操作业务 枚举',
  `operParams` text NOT NULL COMMENT '操作内容参数',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `roomId` int(11) NOT NULL COMMENT '房间id',
  `roomNo` varchar(32) NOT NULL COMMENT '房间号',
  `guestId` int(11) NOT NULL DEFAULT '0' COMMENT '顾客id',
  `questPhone` varchar(12) NOT NULL DEFAULT '' COMMENT '顾客手机号',
  `inTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '入住时间',
  `outTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '离开时间',
  `dayNum` int(11) NOT NULL DEFAULT '1' COMMENT '入住天数',
  `cashPledge` int(11) NOT NULL DEFAULT '0' COMMENT '押金 单位分',
  `totalAmount` int(11) NOT NULL DEFAULT '0' COMMENT '订单价格 单位分',
  `payAmount` int(11) NOT NULL DEFAULT '0' COMMENT '实付款金额 单位0',
  `guestLvId` int(11) NOT NULL DEFAULT '0' COMMENT '顾客当时级别',
  `remark` text NOT NULL COMMENT '订单备注',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=已预定 2=已入住 3=已撤销',
  `payStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '付款状态 0=未付款 1=已付款 2=已退款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=正常启用 99=删除',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `permit` text NOT NULL COMMENT '授权内容 json',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间主键id',
  `roomNo` varchar(16) NOT NULL COMMENT '房号',
  `floorId` int(11) NOT NULL DEFAULT '1' COMMENT '楼层',
  `idx` int(11) NOT NULL DEFAULT '0' COMMENT '房号排序 越小越前',
  `roomTypeId` int(11) NOT NULL DEFAULT '0' COMMENT '房间类型级别 比如大床房',
  `remark` text NOT NULL COMMENT '房间备注',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=空闲可预定 2=已预定未入住 3=已入住 4=打扫中 99=删除 ',
  `orderId` int(11) NOT NULL DEFAULT '0' COMMENT '当前入住订单 被占用的订单id',
  `guestId` int(11) NOT NULL DEFAULT '0' COMMENT '当前预定或入住顾客id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `room_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '房间类型id',
  `name` varchar(32) NOT NULL COMMENT '房间类型名称 比如大床房',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1=上架 99=下架',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格 单位分',
  `desc` text NOT NULL COMMENT '描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

