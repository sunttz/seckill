-- 数据库初始化脚本
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `success_killed`;
CREATE TABLE `success_killed` (
  `seckill_id` bigint(20) NOT NULL COMMENT '秒杀商品id',
  `user_phone` bigint(20) NOT NULL COMMENT '用户手机号',
  `state` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '状态标识（-1无效0成功1已付款）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`,`user_phone`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

DROP TABLE IF EXISTS  `seckill`;
CREATE TABLE `seckill` (
  `seckill_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `name` varchar(120) NOT NULL COMMENT '商品名称',
  `number` int(11) NOT NULL COMMENT '库存数量',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '秒杀开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '秒杀结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

insert into `seckill`(`seckill_id`,`name`,`number`,`start_time`,`end_time`,`create_time`) values
('1000','1000元秒杀iPhone6','100','2017-04-01 00:00:00','2017-04-02 00:00:00','2017-03-24 23:24:16'),
('1001','500元秒杀ipad','200','2017-04-01 00:00:00','2017-04-02 00:00:00','2017-03-24 23:24:16'),
('1002','300元秒杀小米4','300','2017-04-01 00:00:00','2017-04-02 00:00:00','2017-03-24 23:24:16'),
('1003','200元秒杀红迷note','400','2017-04-01 00:00:00','2017-04-02 00:00:00','2017-03-24 23:24:16');
SET FOREIGN_KEY_CHECKS = 1;

