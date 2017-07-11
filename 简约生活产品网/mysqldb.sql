/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - mysqldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysqldb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `mysqldb`;

/*Table structure for table `jb_user` */

DROP TABLE IF EXISTS `jb_user`;

CREATE TABLE `jb_user` (
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `jb_user` */

insert  into `jb_user`(`username`,`password`) values ('2','2'),('8','8'),('4','4'),('0','0'),('z','z'),('在','2'),('1','1'),('1','1'),('a','a'),('2222','222'),('77','77'),('01','01');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ly_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `ly_title` varchar(200) COLLATE utf8_bin NOT NULL,
  `ly_content` varchar(200) COLLATE utf8_bin NOT NULL,
  `ly_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`ly_name`,`ly_title`,`ly_content`,`ly_time`) values (9,'张建邦','哈哈','2','2017-06-06 00:00:00.000000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
