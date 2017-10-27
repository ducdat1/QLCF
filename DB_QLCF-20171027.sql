CREATE DATABASE  IF NOT EXISTS `qlcf` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `qlcf`;
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
  `id_customer` int(11) DEFAULT NULL,
  `tinhtrang` int(11) DEFAULT NULL,
  `tongtien` double DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_ban`),
  KEY `fk_ban_customer` (`id_customer`),
  CONSTRAINT `fk_ban_customer` FOREIGN KEY (`id_customer`) REFERENCES `db_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_ban`
--

LOCK TABLES `db_ban` WRITE;
/*!40000 ALTER TABLE `db_ban` DISABLE KEYS */;
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
  `thanhtien` double DEFAULT NULL,
  PRIMARY KEY (`id_chitiet_ban`),
  KEY `fk_chitiet_ban` (`id_ban`),
  KEY `fk_chitiet_thucuong` (`id_thucuong`),
  CONSTRAINT `fk_chitiet_ban` FOREIGN KEY (`id_ban`) REFERENCES `db_ban` (`id_ban`),
  CONSTRAINT `fk_chitiet_thucuong` FOREIGN KEY (`id_thucuong`) REFERENCES `db_thucuong` (`id_thucuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_chitiet_ban`
--

LOCK TABLES `db_chitiet_ban` WRITE;
/*!40000 ALTER TABLE `db_chitiet_ban` DISABLE KEYS */;
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
  `cus_password` varchar(30) DEFAULT NULL,
  `cus_address` varchar(200) DEFAULT NULL,
  `cus_phone` varchar(14) DEFAULT NULL,
  `plus` char(5) DEFAULT NULL,
  `point_sum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_customer`
--

LOCK TABLES `db_customer` WRITE;
/*!40000 ALTER TABLE `db_customer` DISABLE KEYS */;
INSERT INTO `db_customer` VALUES (1,'Dat','Nguyen',NULL,'test1','12345678',NULL,NULL,'30000',500000);
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
  `taikhoan` varchar(30) DEFAULT NULL,
  `matkhau` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_nhanvien`
--

LOCK TABLES `db_nhanvien` WRITE;
/*!40000 ALTER TABLE `db_nhanvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_nhanvien` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_thucuong`
--

LOCK TABLES `db_thucuong` WRITE;
/*!40000 ALTER TABLE `db_thucuong` DISABLE KEYS */;
INSERT INTO `db_thucuong` VALUES (1,'Cappuccino',79000,4,'cappuccino.jpg','1 Ly cappuccino mỗi sáng',2,'M',NULL,'1','2017-09-10 00:00:00'),(2,'Latte Mochino',59000,4,'lattemochino.jpg','1 Ly Latte Mochino mỗi sáng',2,'M',NULL,'1','2017-09-10 00:00:00'),(3,'Black coffee',25000,4,'blackcoffee.jpg','1 Ly Latte Mochino mỗi sáng',2,'M',NULL,'1','2017-09-10 00:00:00'),(4,'Black coffee milk',30000,4,'blackcoffeemilk.jpg','1 Ly Latte Mochino mỗi sáng',2,'M',NULL,'1','2017-09-10 00:00:00'),(5,'Black coffee milk 2',35000,4,'blackcoffeemilk2.jpg','1 Ly Latte Mochino mỗi sáng',2,'M',NULL,'1','2017-09-10 00:00:00'),(6,'Black coffee milk 3',39000,4,'blackcoffeemilk2.jpg','1 Ly Latte Mochino mỗi sáng',2,'M',NULL,'1','2017-10-20 00:00:00'),(7,'Espresso ',45000,4,'espresso.jpg','1 Ly Espresso  mỗi sáng',2,'S',NULL,'1','2017-09-10 00:00:00'),(8,'Mocha',45000,4,'mocha.jpg','1 Ly Mocha  mỗi sáng',1,'M',NULL,'1','2017-09-10 00:00:00'),(9,'Black tea macchiato',38000,4,'blackmacchiato.jpg','1 Ly Black tea macchiato mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(10,'Ô long macchiato',38000,4,'olongmacchiato.jpg','1 Ly Ô long macchiato mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(11,'Houjicha',30000,4,'houjicha.jpg','Trà rang nhật bản, cảm nhận mới',1,'M',NULL,'2','2017-09-10 00:00:00'),(12,'Matcha',35000,4,'matcha.jpg','matcha',2,'M',NULL,'2','2017-09-10 00:00:00'),(13,'Matcha macchiato',40000,4,'matchamacchiato.jpg','1 Ly Matcha macchiato mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(14,'Trà đào',25000,4,'tradao.jpg','1 Ly trà đào mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(15,'Trà vải',25000,4,'travai.jpg','1 Ly trà vải mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(16,'Trà ô long',30000,4,'olong.jpg','1 Ly ô long mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(17,'Trà alisan',25000,4,'alisan.jpg','1 Ly alisan mỗi sáng',2,'M',NULL,'2','2017-09-10 00:00:00'),(18,'Trà xanh hương quế',30000,4,'xanhhuongque.jpg','Trà xanh hương quế, cảm nhận mới',2,'M',NULL,'2','2017-10-20 00:00:00'),(19,'Trà xanh',25000,4,'traxanh.jpg','Trà xanh',2,'M',NULL,'2','2017-10-20 00:00:00'),(20,'Hồng trà',25000,4,'hongtra.jpg','Hồng trà',2,'M',NULL,'2','2017-09-10 00:00:00'),(21,'Hồng trà hương quế',30000,4,'hongtra2.jpg','Hồng trà hương quế',2,'M',NULL,'2','2017-09-10 00:00:00'),(22,'Black tea',30000,4,'blacktea.jpg','Black tea',2,'M',NULL,'2','2017-09-10 00:00:00'),(23,'Trà sữa',25000,4,'trasua.jpg','1 Ly Trà sữa mỗi sáng',2,'M',NULL,'2','2017-10-20 00:00:00'),(24,'Thạch thủy tinh ngọc trai',5000,0,'ngoctrai.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(25,'Trân châu trắng',5000,0,'chantrautrang.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(26,'Trân châu đen',5000,0,'chantrauden.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(27,'Thạch yourt',5000,0,'thachyourt.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(28,'Thạch bánh lăng',5000,0,'banhlang.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(29,'Thạch trà xanh',5000,0,'thachtraxanh.jpg','',5,'',NULL,'3','2017-09-10 00:00:00'),(30,'Bánh bông lan',20000,0,'bonglan.jpg','',5,'',NULL,'4','2017-09-10 00:00:00'),(31,'Pudding',15000,0,'pudding.jpg','',5,'',NULL,'4','2017-09-10 00:00:00'),(32,'Bánh ngọt',20000,0,'banhngot.jpg','',5,'',NULL,'4','2017-09-10 00:00:00'),(33,'Bánh Quy',20000,0,'banhquy.jpg','',5,'',NULL,'4','2017-09-10 00:00:00'),(34,'Bánh kem nhỏ',25000,0,'banhkem.jpg','',5,'',NULL,'4','2017-10-20 00:00:00'),(35,'Bánh mỳ nho',10000,0,'banhnho.jpg','',5,'',NULL,'4','2017-10-20 00:00:00');
/*!40000 ALTER TABLE `db_thucuong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qlcf'
--

--
-- Dumping routines for database 'qlcf'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-27  7:20:50
