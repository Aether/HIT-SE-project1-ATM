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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `userid` varchar(20) NOT NULL,
  PRIMARY KEY (`articleid`,`title`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `articleid_UNIQUE` (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'动态平衡','Q:向稀硫酸铵溶液中再加入少量硫酸铵固体，铵根离子和硫酸根离子的比值将变大。\r\nA:铵根离子与硫酸根离子的比值相当于水解程度(负相关)。加入固体，溶液变浓。越稀越水解，水解程度降低，比值变大。\r\n','ly'),(2,'电离与水解','Q:稀醋酸钠溶液加水稀释，由水电离出的氢离子和氢氧根离子物质的量浓度积减小。\nA:正常情况下水电离的氢离子与氢氧根离子浓度相等。醋酸钠中一部分氢离子与醋酸根离子结合，促进水的电离。故原式即氢氧根物质的量浓度平方。加水pH降低，氢氧根浓度减小。','ly'),(3,'生物知识点1','森林中各生物的垂直分层现象由光照条件决定×\n（动物：植物和栖息环境，植物：光照）\nAA×aa，Aa的出现是基因重组的结果。×\n（基因重组：在生物体进行有性生殖的过程中，控制不同性状的基因重新组合。一对基因控制是基因分离的结果）','ly'),(4,'生物知识点2','免疫系统功能：监控，防卫，清除\n糖蛋白功能：识别，保护，润滑\n生态系统功能：物质循环，能量流动，信息交流\n生态系统的结构包括两部分内容:\n1.生态系统的成分:由非生物的物质和能量、生产者、消费者、分解者组成\n2.生态系统的营养结构:食物链和食物网\n主要元素CHONP\n基本元素CHON\n最基本元素C\n大量元素OCHNCaPKMg','ly'),(7,'爱自己，是对生命最好的感恩','这世上，你最爱、最不可辜负的人，首先是自己！对自己足够好，你才会快乐，才能欣然地去爱这个世界，才能好好地去爱别人；你的生命，会更温暖真挚，更具存在的意义。\r\n\r\n木心说：“一个人到世界上来，来做什么？爱最可爱的，最好听的，最好看的，最好吃的。”人生，就这么简单，也最安妥。想多了，活得复杂了，那是你的错。爱自己，让自己每天都开心愉悦，是对生命最好的感恩。\r\n\r\n爱自己，努力有一个健康的身体。有个健康明朗的好身体，才能安然享受生命中拥有的一切，包括亲情、友情、爱情。爱别人最好的方式，就是经营好自己。\r\n\r\n做个有节制、有规律的人，读书、健身、听音乐、旅行，注重自我提升的每一种方式；在心与灵魂获得收益的同时，也丰富了生命的内涵。做一个生活的有心人，生活才会对你用心。','fnd');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
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
