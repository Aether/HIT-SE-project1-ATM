-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: Blog
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `url` varchar(300) NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES ('https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1524278699&di=bbbb6545f291cd7014d597c867c30874&src=http://img.ph.126.net/k_iQwJKjSwt7txqJ9JoKpg==/2665005079497734877.jpg'),('https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1524278719&di=a688a37d4dcf0ec24f22ed1c19a789fb&src=http://www.ne.jp/asahi/syaraku/kichinyado/hana/hanaajisai2/ajisai50/ajisai502.jpg'),('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523945956265&di=62d4d7a81ab5dea63be6e7146c69944a&imgtype=0&src=http%3A%2F%2Fwww.wyzu.cn%2Fuploadfile%2F2013%2F0603%2F20130603123602957.jpg'),('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524288535415&di=d03438c44fba5b346902ea2d5a8be5b6&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D37940582%2C3851101670%26fm%3D214%26gp%3D0.jpg'),('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524288753960&di=f9cf9e859e738b4cbb629e97e9ff12c3&imgtype=jpg&src=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D3752969016%2C855142098%26fm%3D214%26gp%3D0.jpg'),('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524377169771&di=686dc5d2dd379b1f9a0c18cf4cfa6090&imgtype=0&src=http%3A%2F%2Fimage.tupian114.com%2F20090928%2F15512316.jpg');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-22 11:53:24
