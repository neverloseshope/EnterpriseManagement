/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.39 : Database - springboot_vue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springboot_vue` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `springboot_vue`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `user` int(11) DEFAULT NULL COMMENT '归属人',
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时间',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '待审核，审核通过，审核不通过',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`user`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`user`,`time`,`img`,`state`) values 
(8,'改变页面背景不显示的bug',13,'2022-04-26','https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500','审核不通过'),
(9,'解决修改密码bug',14,'2022-04-26','https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500','审核通过'),
(10,'解决bug',15,'2022-04-26','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e','审核通过'),
(11,'1',21,'2022-04-28','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e','审核不通过');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`name`,`value`,`type`) values 
('user','el-icon-user','icon'),
('home','el-icon-house','icon'),
('person','el-icon-s-custom','icon'),
('role','el-icon-s-custom','icon'),
('menu','el-icon-platform-eleme','icon'),
('modify','el-icon-s-cooperation','icon'),
('info','el-icon-s-tools','icon'),
('file','el-icon-document','icon'),
('system','el-icon-menu','icon'),
('data','el-icon-s-data','icon'),
('building','el-icon-office-building\n','icon'),
('goods','el-icon-suitcase','icon'),
('message','el-icon-chat-dot-round','icon'),
(NULL,NULL,NULL);

/*Table structure for table `sys_file` */

DROP TABLE IF EXISTS `sys_file`;

CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用',
  `md5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'md5',
  `user` int(11) DEFAULT NULL COMMENT '归属人',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`user`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_file` */

insert  into `sys_file`(`id`,`name`,`type`,`size`,`url`,`is_delete`,`enable`,`md5`,`user`) values 
(3,'z1.jpg','jpg',42,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F57042223022940.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339381&t=47f566683fa3894397afcb693a8dffd9',0,1,'83dad6cc67b18fdafefd3a7ce1c1b5e1',12),
(4,'z1.jpg','jpg',42,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F57042223022940.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339381&t=47f566683fa3894397afcb693a8dffd9',0,1,'83dad6cc67b18fdafefd3a7ce1c1b5e1',15),
(5,'1.jpg','jpg',800,'https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',0,1,'4542d01a991d65d12e3d15ae6bf61a19',15),
(6,'3aaf7b6d561a4886be28381f3c235e4d.jpg','jpg',42,'https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',0,1,'83dad6cc67b18fdafefd3a7ce1c1b5e1',15),
(7,'d35810bfb5532bf76ca94e008a648892.jpeg','jpeg',1014,'https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',0,1,'cc4b4026c3257f9bc84e5549e83ca621',13),
(8,'9f16aa36db265c05258ec41d3818d956.jpeg','jpeg',188,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F57042223022940.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339381&t=47f566683fa3894397afcb693a8dffd9',0,1,'b0098e9516296b8f1881ca6c72b3b661',13),
(9,'unit 2-reading 1 self-study test.pdf','pdf',234,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F57042223022940.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339381&t=47f566683fa3894397afcb693a8dffd9',0,0,'561d0af2eef0e381292e3af1bd42e94a',13),
(10,'3aaf7b6d561a4886be28381f3c235e4d.jpg','jpg',42,'https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',0,0,'83dad6cc67b18fdafefd3a7ce1c1b5e1',13),
(11,'3aaf7b6d561a4886be28381f3c235e4d.jpg','jpg',42,'https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',0,0,'83dad6cc67b18fdafefd3a7ce1c1b5e1',13),
(12,'3aaf7b6d561a4886be28381f3c235e4d.jpg','jpg',42,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F57042223022940.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339381&t=47f566683fa3894397afcb693a8dffd9',0,0,'83dad6cc67b18fdafefd3a7ce1c1b5e1',15),
(13,'3aaf7b6d561a4886be28381f3c235e4d.jpg','jpg',42,'https://img0.baidu.com/it/u=2747776293,3603828582&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500',0,1,'83dad6cc67b18fdafefd3a7ce1c1b5e1',15),
(14,'e0124ce7b38f4f39972a40136cb98767.jpeg','jpeg',340,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F57042223022940.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339381&t=47f566683fa3894397afcb693a8dffd9',0,1,'4c66e781b504281c6c746d81d971b4af',14),
(15,'3aaf7b6d561a4886be28381f3c235e4d.jpg','jpg',42,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e',0,0,'83dad6cc67b18fdafefd3a7ce1c1b5e1',14),
(16,'7266b1a4c4081fa38e964d4c41da0f00.jpeg','jpeg',60,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e',0,0,'819355c7ae165c4a0f06d7ded238203e',15),
(17,'7da866bd8743cbb7708cb4bae4c53209.jpeg','jpeg',63,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'29b082eae4951f58626fbf2db9794bba',13),
(18,'af9c518be1592acf9f3a8e013735694a.jpeg','jpeg',110,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e',0,0,'9bec9ae6f7ac0bc09c12c94ea037f5e6',13),
(19,'7da866bd8743cbb7708cb4bae4c53209.jpeg','jpeg',63,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'29b082eae4951f58626fbf2db9794bba',13),
(20,'c0e3cc543e24f0ba96c21f2c8e764743.jpeg','jpeg',69,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'a2ffbcb8ff6c50e3a14089717ae4d703',13),
(21,'3.jpg','jpg',74,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e',0,0,'a75fdc17900aaf49b8093d553df8985b',14),
(22,'2.jpg','jpg',101,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'5a5cfa12a5363b3b89d4523e98eb8211',14),
(23,'3.jpg','jpg',74,'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z92109393023V-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659339563&t=a12541752808dc6d240f450856c0565e',0,0,'a75fdc17900aaf49b8093d553df8985b',14),
(24,'2.jpg','jpg',101,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'5a5cfa12a5363b3b89d4523e98eb8211',12),
(25,'1.jpg','jpg',800,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'4542d01a991d65d12e3d15ae6bf61a19',13),
(26,'2.jpg','jpg',101,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'5a5cfa12a5363b3b89d4523e98eb8211',14),
(27,'3.jpg','jpg',74,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'a75fdc17900aaf49b8093d553df8985b',11),
(28,'2.jpg','jpg',101,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'5a5cfa12a5363b3b89d4523e98eb8211',11),
(29,'1.jpg','jpg',800,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'4542d01a991d65d12e3d15ae6bf61a19',11),
(30,'2.jpg','jpg',101,'https://img2.baidu.com/it/u=4010367258,1752169979&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',0,0,'5a5cfa12a5363b3b89d4523e98eb8211',11),
(31,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'a75fdc17900aaf49b8093d553df8985b',30),
(33,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'a75fdc17900aaf49b8093d553df8985b',42),
(38,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'a75fdc17900aaf49b8093d553df8985b',30),
(41,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'a75fdc17900aaf49b8093d553df8985b',31),
(47,'2.jpg','jpg',101,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'5a5cfa12a5363b3b89d4523e98eb8211',31),
(48,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'a75fdc17900aaf49b8093d553df8985b',47),
(53,'net.jpeg','jpeg',63,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'29b082eae4951f58626fbf2db9794bba',32),
(55,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'a75fdc17900aaf49b8093d553df8985b',32),
(56,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'a75fdc17900aaf49b8093d553df8985b',32),
(57,'2.jpg','jpg',101,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'5a5cfa12a5363b3b89d4523e98eb8211',36),
(58,'2.jpg','jpg',101,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'5a5cfa12a5363b3b89d4523e98eb8211',37),
(59,'3.jpg','jpg',74,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'a75fdc17900aaf49b8093d553df8985b',38),
(60,'Snipaste_2022-04-03_14-19-09.jpg','jpg',63,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'5a5d35d04cbc73defaed97e3f1ba8b96',35),
(61,'1.cpp','cpp',0,'https://img0.baidu.com/it/u=2787351444,4184612003&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'fcec9943f8fb10465e4a854732742080',34),
(62,'2.cpp','cpp',0,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,1,'e4d9773de824ac6863f53a358ab45f4a',33),
(64,'Snipaste_2022-04-02_22-04-27.jpg','jpg',59,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'109794fd68c4f55ed94bc05b7c166e8c',31),
(65,'net.jpeg','jpeg',63,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'29b082eae4951f58626fbf2db9794bba',32),
(66,'Snipaste_2022-04-02_10-07-16.jpg','jpg',87,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'d9bca74788c45ca3dee1cfc13f7d10d6',38),
(67,'Snipaste_2022-04-03_14-19-09.jpg','jpg',63,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'5a5d35d04cbc73defaed97e3f1ba8b96',41),
(68,'Snipaste_2022-04-02_10-07-16.jpg','jpg',87,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'d9bca74788c45ca3dee1cfc13f7d10d6',36),
(70,'Snipaste_2022-05-08_18-38-18.jpg','jpg',41,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'b4e75ea8a19c573bc1824928d37e5440',36),
(71,'img-1652890448729a3130491091810d4b2546f35123697be.jpg','jpg',200,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'4cf4cde2b007782c43c5d7f4725f4f8f',37),
(72,'1575729525092.jpeg','jpeg',897,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'1b53dbfd6b3ed6129e7e21fe7ad89e48',11),
(73,'img-8ead379564fdf84002c4ba6bc4111f94.jpg','jpg',784,'https://img2.baidu.com/it/u=2998119432,2760702507&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',0,0,'0455d9a4e95060cb8c687c850e2f1b25',15);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`path`,`icon`,`description`,`pid`,`page_path`,`sorts`) values 
(4,'信息管理',NULL,'el-icon-s-tools','对个人信息进行管理',NULL,NULL,4),
(5,'个人信息','/person','el-icon-s-custom','查看个人信息',4,'Person',9),
(6,'系统管理',NULL,'el-icon-menu','整个系统的增删改查以及赋予权限',NULL,NULL,3),
(7,'密码修改','/modify','el-icon-s-cooperation','修改密码',4,'Modify',10),
(8,'员工管理','/user','el-icon-s-custom','对员工进行管理',6,'User',5),
(9,'文件管理','/file','el-icon-document','文件管理',6,'File',6),
(10,'菜单管理','/menu','el-icon-platform-eleme','菜单管理',6,'Menu',8),
(11,'角色管理','/role','el-icon-s-custom','角色管理',6,'Role',7),
(12,'数据报表','/data','el-icon-s-data','查看公司的员工以及营收情况',NULL,'Data',2),
(13,'首页','/home','el-icon-house','系统首页',NULL,'Home',1),
(14,'公司分布','/china','el-icon-office-building\n','全国分公司的数量',NULL,'China',2),
(15,'工作审核','/goods','el-icon-suitcase',NULL,NULL,'Goods',2);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`description`,`type`) values 
(1,'管理员','拥有系统的所有功能，并且赋予其他人权限','success'),
(4,'普通员工','只能对系统有最基本的操作功能','danger'),
(5,'主管','能够对员工进行管理以及对文件进行操作','primary');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `menuKey` (`menu_id`),
  CONSTRAINT `roleKey` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `menuKey` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(1,4),
(4,4),
(5,4),
(1,5),
(4,5),
(5,5),
(1,6),
(1,7),
(4,7),
(5,7),
(1,8),
(1,9),
(4,9),
(5,9),
(1,10),
(1,11),
(1,12),
(5,12),
(1,13),
(4,13),
(5,13),
(1,14),
(4,14),
(5,14),
(1,15),
(4,15),
(5,15);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni` (`username`),
  KEY `role_Key` (`role`),
  CONSTRAINT `role_Key` FOREIGN KEY (`role`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`nickname`,`email`,`phone`,`address`,`create_time`,`avatar_url`,`role`) values 
(11,'admin','123456','管理员','1234@qq.com','19815749550','湖南','2022-07-04 16:15:01','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F8a%2F54%2F9e%2F8a549e5130a10daad7765a21b9f35fd9.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653105894&t=33f55fba77e07b768f2f347dc4255de2',1),
(12,'admin12','123456','12号管理员','123@qq.com','19815749550','湖南','2022-07-04 20:16:19','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F8a%2F54%2F9e%2F8a549e5130a10daad7765a21b9f35fd9.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653105894&t=33f55fba77e07b768f2f347dc4255de2',1),
(13,'chen','123456','陈管理员','123@qq.com','19815749111','湖南','2022-07-04 20:13:34','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F8a%2F54%2F9e%2F8a549e5130a10daad7765a21b9f35fd9.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653105894&t=33f55fba77e07b768f2f347dc4255de2',1),
(14,'zheng','123457','郑管理员','124@qq.com','19815749550','重庆','2022-07-04 20:15:30','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F210F2130512J47-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=8e4735126431a8c2f0e408884444683a',1),
(15,'tan','123458','谭管理员','125@qq.com','19815749550','重庆','2022-07-04 20:15:35','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F210F2130512J47-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=8e4735126431a8c2f0e408884444683a',1),
(16,'xiao','123459','肖管理员','126@qq.com','19815749550','重庆','2022-07-04 20:15:40','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F210F2130512J47-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=8e4735126431a8c2f0e408884444683a',1),
(17,'wang','123460','王管理员','127@qq.com','19815749550','四川','2022-07-04 20:15:44','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F210F2130512J47-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=8e4735126431a8c2f0e408884444683a',1),
(18,'li','123461','李管理员','128@qq.com','19815749550','四川','2022-07-04 20:15:49','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp09%2F210F2130512J47-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=8e4735126431a8c2f0e408884444683a',1),
(19,'zhaoran','123462','赵管理员','129@qq.com','19815749550','河北','2022-07-04 20:15:55','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242332225H9-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=6473d51bfe4271c8298a69ca391b2e50',1),
(20,'zhang','123463','张管理员','130@qq.com','19815749550','内蒙古','2022-07-04 20:16:00','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242332225H9-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=6473d51bfe4271c8298a69ca391b2e50',1),
(21,'kang','123464','康管理员','131@qq.com','19815749550','河南','2022-07-04 20:16:09','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242332225H9-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=6473d51bfe4271c8298a69ca391b2e50',1),
(30,'111','123456','1号员工','123@qq.com','123','北京','2022-07-05 11:21:53','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242332225H9-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=6473d51bfe4271c8298a69ca391b2e50',4),
(31,'222','123456','2号员工','123@qq.com','124','新疆','2022-07-05 11:21:54','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G020114924%2F200G0114924-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=919c4d3bea6777099da4b0cedf02848a',4),
(32,'333','123456','3号员工','123@qq.com','125','北京','2022-07-05 11:21:56','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G020114924%2F200G0114924-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=919c4d3bea6777099da4b0cedf02848a',4),
(33,'444','123456','4号员工','123@qq.com','126','西藏','2022-07-05 11:21:58','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G020114924%2F200G0114924-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=919c4d3bea6777099da4b0cedf02848a',4),
(34,'555','123457','5号员工','124@qq.com','127','北京','2022-07-05 11:21:59','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G020114924%2F200G0114924-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=919c4d3bea6777099da4b0cedf02848a',4),
(35,'666','123458','6号员工','125@qq.com','128','北京','2022-07-05 11:22:01','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F0G020114924%2F200G0114924-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=919c4d3bea6777099da4b0cedf02848a',4),
(36,'777','123459','7号员工','126@qq.com','129','广东','2022-07-05 11:22:02','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F0ZR1095111%2F210ZP95111-7-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=ef55af5d62f07e0949280249613d7011',4),
(37,'888','123460','8号员工','127@qq.com','130','北京','2022-07-05 11:22:03','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F0ZR1095111%2F210ZP95111-7-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=ef55af5d62f07e0949280249613d7011',4),
(38,'999','123461','9号员工','128@qq.com','131','上海','2022-07-05 11:22:05','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F0ZR1095111%2F210ZP95111-7-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=ef55af5d62f07e0949280249613d7011',4),
(41,'big','123464','大主管','131@qq.com','134','北京','2022-07-04 20:20:36','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F4k%2Fs%2F02%2F2109242332225H9-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1659228249&t=6473d51bfe4271c8298a69ca391b2e50',5),
(42,'mid','123465','中主管','132@qq.com','135','北京','2022-07-04 20:20:42','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F8a%2F54%2F9e%2F8a549e5130a10daad7765a21b9f35fd9.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653105894&t=33f55fba77e07b768f2f347dc4255de2',5),
(47,'small','123456','小主管','123456@126.com','19815749550','陕西','2022-07-04 20:20:47','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F8a%2F54%2F9e%2F8a549e5130a10daad7765a21b9f35fd9.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653105894&t=33f55fba77e07b768f2f347dc4255de2',5),
(48,'admin1','123456','1号管理员','123@qq.c','198157495','湖北','2022-07-04 20:20:56','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F8a%2F54%2F9e%2F8a549e5130a10daad7765a21b9f35fd9.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1653105894&t=33f55fba77e07b768f2f347dc4255de2',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
