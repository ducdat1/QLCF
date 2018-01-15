-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: qlcf
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `db_ban`
--

DROP TABLE IF EXISTS `db_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_ban` (
  `id_ban` int(11) NOT NULL AUTO_INCREMENT,
  `id_nhanvien` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `tinhtrang` int(11) DEFAULT NULL,
  `tongtien` double DEFAULT NULL,
  `dc_nhan` varchar(100) DEFAULT NULL,
  `payment` int(2) DEFAULT NULL,
  `gio_giao_hang` char(16) DEFAULT NULL,
  `ghi_chu` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ban`),
  KEY `fk_ban_customer` (`id_customer`),
  CONSTRAINT `fk_ban_customer` FOREIGN KEY (`id_customer`) REFERENCES `db_customer` (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_ban`
--

LOCK TABLES `db_ban` WRITE;
/*!40000 ALTER TABLE `db_ban` DISABLE KEYS */;
INSERT INTO `db_ban` VALUES (1,2,1,1,109000,'Bien hoa',2,NULL,NULL,'2017-10-03 21:33:54'),(2,2,2,2,55000,'Bien hoa',2,NULL,NULL,'2017-10-04 21:33:54'),(3,2,2,3,90000,'Bien hoa',2,NULL,NULL,'2017-10-04 21:33:54'),(4,2,1,4,90000,'Bien hoa',2,NULL,NULL,'2017-10-04 21:33:54'),(16,NULL,1,2,11111,NULL,2,NULL,NULL,'2017-12-23 00:59:21'),(17,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-23 01:02:51'),(18,NULL,1,2,11111,NULL,2,NULL,NULL,'2017-12-23 01:22:27'),(19,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-23 01:23:37'),(20,NULL,1,2,116212,NULL,2,NULL,NULL,'2017-12-31 23:45:50'),(21,NULL,1,2,116212,NULL,2,NULL,NULL,'2017-12-31 23:46:00'),(22,NULL,1,2,90212,NULL,2,NULL,NULL,'2017-12-31 23:48:43'),(23,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:53:38'),(24,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:54:00'),(25,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:54:13'),(26,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:55:01'),(27,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:55:29'),(28,NULL,1,2,138000,NULL,2,NULL,NULL,'2017-12-31 23:56:57'),(29,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:58:27'),(30,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:59:18'),(31,NULL,1,2,11212,NULL,2,NULL,NULL,'2017-12-31 23:59:20'),(32,NULL,1,2,11212,NULL,2,NULL,NULL,'2018-01-01 00:00:11'),(33,NULL,1,2,11212,NULL,2,NULL,NULL,'2018-01-01 00:06:05'),(34,NULL,1,2,11212,NULL,2,NULL,NULL,'2018-01-01 00:07:17'),(35,NULL,1,2,11212,NULL,2,NULL,NULL,'2018-01-01 00:08:34'),(36,NULL,1,2,22424,NULL,2,NULL,NULL,'2018-01-01 00:10:11'),(37,NULL,1,2,11212,NULL,2,NULL,NULL,'2018-01-01 00:40:19'),(38,NULL,1,2,323212,NULL,2,NULL,NULL,'2018-01-01 00:42:01'),(39,NULL,1,2,480212,NULL,2,NULL,NULL,'2018-01-01 00:48:02'),(40,NULL,1,2,218000,NULL,2,NULL,NULL,'2018-01-01 00:52:04'),(41,NULL,1,2,90212,NULL,2,NULL,NULL,'2018-01-01 01:05:33'),(42,NULL,1,2,11212,NULL,2,NULL,NULL,'2018-01-01 01:13:12'),(43,NULL,1,2,140424,NULL,2,NULL,NULL,'2018-01-01 07:33:30'),(44,NULL,1,2,22424,NULL,2,NULL,NULL,'2018-01-01 07:38:15'),(45,NULL,1,2,22424,NULL,2,NULL,NULL,'2018-01-01 07:40:08'),(46,NULL,1,2,22424,NULL,2,NULL,NULL,'2018-01-01 07:53:31'),(47,NULL,1,2,22424,NULL,2,NULL,NULL,'2018-01-01 07:56:08'),(48,NULL,1,2,44848,NULL,2,NULL,NULL,'2018-01-01 07:58:50'),(49,NULL,1,2,56060,NULL,2,NULL,NULL,'2018-01-01 08:01:24'),(50,NULL,1,2,1025000,NULL,2,NULL,NULL,'2018-01-08 23:22:38');
/*!40000 ALTER TABLE `db_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_campaign`
--

DROP TABLE IF EXISTS `db_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_campaign` (
  `id_campaign` int(11) NOT NULL AUTO_INCREMENT,
  `camname` varchar(50) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `deletedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_campaign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_campaign`
--

LOCK TABLES `db_campaign` WRITE;
/*!40000 ALTER TABLE `db_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_chitiet_ban`
--

DROP TABLE IF EXISTS `db_chitiet_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_chitiet_ban` (
  `id_chitiet_ban` int(11) NOT NULL AUTO_INCREMENT,
  `id_ban` int(11) DEFAULT NULL,
  `id_thucuong` int(11) DEFAULT NULL,
  `soluong_thucuong` int(11) DEFAULT NULL,
  `sp_kemtheo` int(11) DEFAULT NULL,
  `sl_spkemtheo` int(11) DEFAULT NULL,
  `thanhtien` double DEFAULT NULL,
  PRIMARY KEY (`id_chitiet_ban`),
  KEY `fk_chitiet_ban` (`id_ban`),
  KEY `fk_chitiet_thucuong` (`id_thucuong`),
  CONSTRAINT `fk_chitiet_ban` FOREIGN KEY (`id_ban`) REFERENCES `db_ban` (`id_ban`),
  CONSTRAINT `fk_chitiet_thucuong` FOREIGN KEY (`id_thucuong`) REFERENCES `db_thucuong` (`id_thucuong`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_chitiet_ban`
--

LOCK TABLES `db_chitiet_ban` WRITE;
/*!40000 ALTER TABLE `db_chitiet_ban` DISABLE KEYS */;
INSERT INTO `db_chitiet_ban` VALUES (1,1,1,1,24,1,15000),(2,1,4,1,26,1,15000),(3,2,3,1,28,1,15000),(4,2,4,1,27,1,15000),(5,3,7,1,29,1,15000),(6,3,8,1,25,1,15000),(7,41,45,1,NULL,NULL,11212),(8,41,1,1,NULL,NULL,79000),(9,42,45,1,NULL,NULL,11212),(10,43,45,2,NULL,NULL,11212),(11,43,2,2,NULL,NULL,59000),(12,44,45,2,NULL,NULL,11212),(13,45,45,2,NULL,NULL,11212),(14,46,45,2,NULL,NULL,11212),(15,47,45,2,NULL,NULL,11212),(16,48,45,4,NULL,NULL,11212),(17,49,45,5,NULL,NULL,11212),(18,50,45,11,NULL,NULL,50000),(19,50,3,19,NULL,NULL,25000);
/*!40000 ALTER TABLE `db_chitiet_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_customer`
--

DROP TABLE IF EXISTS `db_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `cus_email` varchar(100) DEFAULT NULL,
  `cus_account` varchar(50) DEFAULT NULL,
  `cus_password` varchar(100) DEFAULT NULL,
  `cus_address` varchar(200) DEFAULT NULL,
  `cus_phone` varchar(14) DEFAULT NULL,
  `plus` char(5) DEFAULT '0',
  `point_sum` int(11) DEFAULT '0',
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_customer`
--

LOCK TABLES `db_customer` WRITE;
/*!40000 ALTER TABLE `db_customer` DISABLE KEYS */;
INSERT INTO `db_customer` VALUES (1,'Dat','Nguyen',NULL,'test1','25d55ad283aa400af464c76d713c07ad',NULL,NULL,'54414',98974999),(2,'Bao','Tran',NULL,'test2','25d55ad283aa400af464c76d713c07ad',NULL,NULL,'25000',700000),(5,'Lê Thị','Thủy Tiên','Tienle3103@gmail.com','test3','25f9e794323b453885f5181f1b624d0b',NULL,NULL,'0',2050000);
/*!40000 ALTER TABLE `db_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_nhanvien`
--

DROP TABLE IF EXISTS `db_nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_nhanvien` (
  `id_nv` int(11) NOT NULL AUTO_INCREMENT,
  `tennv` varchar(100) DEFAULT NULL,
  `giolam` double DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `sdt` int(11) DEFAULT NULL,
  `diachi` varchar(200) DEFAULT NULL,
  `luong` double DEFAULT NULL,
  `capdo` char(1) DEFAULT NULL,
  `ngayvaolam` datetime DEFAULT NULL,
  `ngaynghiviec` datetime DEFAULT NULL,
  `taikhoan` varchar(30) DEFAULT NULL,
  `matkhau` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nv`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_nhanvien`
--

LOCK TABLES `db_nhanvien` WRITE;
/*!40000 ALTER TABLE `db_nhanvien` DISABLE KEYS */;
INSERT INTO `db_nhanvien` VALUES (1,'Dat',8,'1993-11-25',1677116797,'Biên Hòa',8000000,'5','2017-09-18 00:00:00',NULL,'admin','admin1'),(2,'Bao',4,'1991-10-15',NULL,NULL,7000000,'2','2017-09-18 00:00:00',NULL,'nhanvien1','nhanvien1'),(7,'Phượng',1,'1993-04-02',12206669,'Quận 9',8000000,'2',NULL,NULL,'phuong0402','123456'),(8,'Phượng',1,'1993-04-02',12206669,'Quận 9',8000000,'2',NULL,NULL,'phuong0402','123456'),(9,'Phượng',1,'1993-04-02',12206669,'Quận 9',8000000,'2',NULL,NULL,'phuong0402','123456'),(10,'Phượng',1,'1993-04-02',12206669,'Quận 9',8000000,'2',NULL,NULL,'phuong0402','123456'),(11,'Phượng',2,'1993-04-02',12312511,'Quận 9',8000000,'1',NULL,NULL,'phuong0402','123456');
/*!40000 ALTER TABLE `db_nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_payment`
--

DROP TABLE IF EXISTS `db_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_payment` (
  `id_pay` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_pay` varchar(45) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `deletedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pay`),
  UNIQUE KEY `id_pay_UNIQUE` (`id_pay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_payment`
--

LOCK TABLES `db_payment` WRITE;
/*!40000 ALTER TABLE `db_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_thucuong`
--

DROP TABLE IF EXISTS `db_thucuong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_thucuong` (
  `id_thucuong` int(11) NOT NULL AUTO_INCREMENT,
  `ten_thucuong` varchar(100) DEFAULT NULL,
  `giaban` double DEFAULT NULL,
  `rank` double DEFAULT NULL,
  `url_image` varchar(100) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `size` char(2) DEFAULT NULL,
  `extra1` char(5) DEFAULT NULL,
  `extra2` char(5) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_thucuong`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_thucuong`
--

LOCK TABLES `db_thucuong` WRITE;
/*!40000 ALTER TABLE `db_thucuong` DISABLE KEYS */;
INSERT INTO `db_thucuong` VALUES (1,'Cappuccino',79000,4,'cappuccino.jpg','Thưởng thức 1 Ly cappuccino mỗi ngày làm cho cảm hứng làm việc thêm nhiều hơn',1,'M','','1','2017-09-10 00:00:00'),(2,'Latte Mochino',59000,4,'lattemochino.jpg','1 Ly Latte Mochino ngọt ngào và ấm áp',1,'M','','1','2017-09-10 00:00:00'),(3,'Black coffee',25000,4,'blackcoffee.jpg','1 Ly cà phê đen thuần chất mang lại cảm hứng làm sáng tạo',1,'M','','1','2017-09-10 00:00:00'),(4,'Black coffee milk',30000,4,'blackcoffeemilk.jpg','1 Ly cà phê sữa nhẹ nhàng khởi động ngày mới',1,'M','','1','2017-09-10 00:00:00'),(5,'Black coffee milk 2',35000,4,'blackcoffeemilk2.jpg','1 Ly cà phê sữa cho cả ngày năng động',1,'M','','1','2017-09-10 00:00:00'),(6,'Black coffee milk 3',39000,4,'blackcoffeemilk3.jpg','1 Ly Latte Mochino mỗi ngày',1,'M','','1','2017-10-20 00:00:00'),(7,'Espresso ',45000,4,'espresso.jpg','1 Ly Espresso  mỗi ngày',1,'S','','1','2017-09-10 00:00:00'),(8,'Mocha',45000,4,'mocha.jpg','1 Ly Mocha  mỗi ngày',1,'M','','1','2017-09-10 00:00:00'),(9,'Black tea macchiato',38000,4,'black-tea-macchiato-1444613620-107603-1458627372.jpg','1 Ly Black tea macchiato mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(10,'Ô long macchiato',38000,4,'timthumb.php.jpg','1 Ly Ô long macchiato mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(11,'Houjicha',30000,4,'image.jpg','Trà rang nhật bản, cảm nhận mới',1,'M','','2','2017-09-10 00:00:00'),(12,'Matcha',35000,4,'image.jpg','matcha',1,'M','','2','2017-09-10 00:00:00'),(13,'Matcha macchiato',40000,4,'koi-matcha-macchiato.jpg','1 Ly Matcha macchiato mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(14,'Trà đào',25000,4,'1465547469-13407523_1043723289057679_36060980_n.jpg','1 Ly trà đào mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(15,'Trà vải',25000,4,'cach-pha-tra-vai-sieu-ngon-sieu-hot-giai-nhiet-mua-he-15-e1461255955364.jpg','1 Ly trà vải mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(16,'Trà ô long',30000,4,'2017111114116-201710311643-tra-o-long-sakura-kem-cheese.jpg','1 Ly ô long mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(17,'Trà alisan',25000,4,'Alisan Mận.jpg','1 Ly alisan mỗi sáng',1,'M','','2','2017-09-10 00:00:00'),(18,'Trà xanh hương quế',30000,4,'tra-huong-lai-tra-thai-nguyen(1).JPG','Trà xanh hương quế, cảm nhận mới',1,'M','','2','2017-10-20 00:00:00'),(19,'Trà xanh',25000,4,'greentea3_xpdy.jpg','Trà xanh',1,'M','','2','2017-10-20 00:00:00'),(20,'Hồng trà',25000,4,'Rooibos-feature.jpg','Hồng trà',1,'M','','2','2017-09-10 00:00:00'),(21,'Hồng trà hương quế',30000,4,'2017914114953-hong-tra-vai-kem.jpg','Hồng trà hương quế',1,'M','','2','2017-09-10 00:00:00'),(22,'Black tea',30000,4,'foody-black-tea-tra-sua-alisan-180-636452455494011728.jpg','Black tea',1,'M','','2','2017-09-10 00:00:00'),(23,'Trà sữa',25000,4,'foody-mobile-212c7dcm-jpg-382-635790472729648243.jpg','Trà sữa nhật bản',1,'M','','2','2017-10-20 00:00:00'),(24,'Thạch thủy tinh ngọc trai',5000,0,'ngoctrai.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(25,'Trân châu trắng',5000,0,'chantrautrang.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(26,'Trân châu đen',5000,0,'chantrauden.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(27,'Thạch yourt',5000,0,'tumblr_nu1g2lzcwC1u581vyo4_400.jpg','',1,'M','','3','2017-09-10 00:00:00'),(28,'Thạch bánh lăng',5000,0,'banhlang.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(29,'Thạch trà xanh',5000,0,'tumblr_nya0ag0eDu1uiqgypo2_1280.jpg','',1,'M','','3','2017-09-10 00:00:00'),(30,'Bánh bông lan',20000,0,'GatoBatBai.jpg','',1,'M','','4','2017-09-10 00:00:00'),(31,'Pudding',15000,0,'recipe-image-legacy-id--1270451_8.jpg','',1,'M','','4','2017-09-10 00:00:00'),(32,'Bánh ngọt',20000,0,'foody-mobile-tiramisu-1-155034904-273-635984956616966331.jpg','',1,'M','','4','2017-09-10 00:00:00'),(33,'Bánh Quy',20000,0,'BanhQuyBo.jpg','',1,'M','','4','2017-09-10 00:00:00'),(34,'Bánh kem ',25000,0,'Cách-làm-bánh-tiramisu-banner.jpg','',1,'M','','4','2017-10-20 00:00:00'),(35,'Bánh bông lan nho',20000,0,'banh-nho-kho-7-1501311778735.jpg','',1,'M','','4','2017-10-20 00:00:00'),(45,'Trà đào sakura',50000,3.4,'img20161218192449534.jpg','New giảm 50%',1,'M','','2','2017-11-08 00:25:02'),(52,'Thạch trà xanh',123124,NULL,'18.jpg','',1,'M','','3','2017-11-19 10:25:10');
/*!40000 ALTER TABLE `db_thucuong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_tinhtrang`
--

DROP TABLE IF EXISTS `db_tinhtrang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_tinhtrang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_tinhtrang`
--

LOCK TABLES `db_tinhtrang` WRITE;
/*!40000 ALTER TABLE `db_tinhtrang` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_tinhtrang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-12  8:11:25
