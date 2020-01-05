CREATE TABLE `guest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�˿�id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '�˿�����',
  `credentialNo` varchar(32) NOT NULL COMMENT '֤����',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '�ֻ��� ',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�Ա� 0=δ֪ 1=�� 2=Ů',
  `totalCharge` int(11) NOT NULL DEFAULT '0' COMMENT '�ۼƳ�ֵ',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '��ǰ���',
  `totalConsume` int(11) NOT NULL DEFAULT '0' COMMENT '�ۼ�����',
  `consumeTimes` int(11) NOT NULL DEFAULT '0' COMMENT '���Ѵ���',
  `guestLvId` int(11) NOT NULL DEFAULT '0' COMMENT 'vip�ȼ�',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=�������� 9=�˻����� ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `guest_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��Ա����id',
  `name` varchar(32) NOT NULL COMMENT '��Ա��������',
  `discount` float NOT NULL DEFAULT '1' COMMENT '��Ա�����ۿ� 1.0��ʾ���ۿ�',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=���� 99=ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ա��id',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT 'Ա���ֻ���',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Ա������',
  `pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '����',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=���� 99=ɾ��',
  `roleId` int(11) NOT NULL DEFAULT '0' COMMENT '��ɫid',
  `isSuper` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�Ƿ��ǳ��� 1=����',
  `lastLoginAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����¼ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `oper_log` (
  `id` int(11) NOT NULL COMMENT '������¼id',
  `managerId` int(11) NOT NULL COMMENT '����Աid ��ӦԱ��id',
  `managerName` varchar(32) NOT NULL DEFAULT '' COMMENT '����������',
  `operBiz` varchar(64) NOT NULL COMMENT '����ҵ�� ö��',
  `operParams` text NOT NULL COMMENT '�������ݲ���',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `roomId` int(11) NOT NULL COMMENT '����id',
  `roomNo` varchar(32) NOT NULL COMMENT '�����',
  `guestId` int(11) NOT NULL DEFAULT '0' COMMENT '�˿�id',
  `questPhone` varchar(12) NOT NULL DEFAULT '' COMMENT '�˿��ֻ���',
  `inTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '��סʱ��',
  `outTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '�뿪ʱ��',
  `dayNum` int(11) NOT NULL DEFAULT '1' COMMENT '��ס����',
  `cashPledge` int(11) NOT NULL DEFAULT '0' COMMENT 'Ѻ�� ��λ��',
  `totalAmount` int(11) NOT NULL DEFAULT '0' COMMENT '�����۸� ��λ��',
  `payAmount` int(11) NOT NULL DEFAULT '0' COMMENT 'ʵ������ ��λ0',
  `guestLvId` int(11) NOT NULL DEFAULT '0' COMMENT '�˿͵�ʱ����',
  `remark` text NOT NULL COMMENT '������ע',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=��Ԥ�� 2=����ס 3=�ѳ���',
  `payStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '����״̬ 0=δ���� 1=�Ѹ��� 2=���˿�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��ɫid',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '��ɫ����',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=�������� 99=ɾ��',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `permit` text NOT NULL COMMENT '��Ȩ���� json',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `roomNo` varchar(16) NOT NULL COMMENT '����',
  `floorId` int(11) NOT NULL DEFAULT '1' COMMENT '¥��',
  `idx` int(11) NOT NULL DEFAULT '0' COMMENT '�������� ԽСԽǰ',
  `roomTypeId` int(11) NOT NULL DEFAULT '0' COMMENT '�������ͼ��� ����󴲷�',
  `remark` text NOT NULL COMMENT '���䱸ע',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '���ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=���п�Ԥ�� 2=��Ԥ��δ��ס 3=����ס 4=��ɨ�� 99=ɾ�� ',
  `orderId` int(11) NOT NULL DEFAULT '0' COMMENT '��ǰ��ס���� ��ռ�õĶ���id',
  `guestId` int(11) NOT NULL DEFAULT '0' COMMENT '��ǰԤ������ס�˿�id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `room_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `name` varchar(32) NOT NULL COMMENT '������������ ����󴲷�',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '����ʱ��',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 1=�ϼ� 99=�¼�',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '�۸� ��λ��',
  `desc` text NOT NULL COMMENT '������Ϣ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

