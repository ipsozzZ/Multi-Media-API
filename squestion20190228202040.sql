-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: squestion
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `behavior`
--

DROP TABLE IF EXISTS `behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behavior` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL COMMENT '用户Id',
  `Type` smallint(6) NOT NULL DEFAULT '0' COMMENT '用户操作类型，1为搜索题目，2为点赞，3收藏',
  `QuestionId` int(11) DEFAULT '0' COMMENT '问题Id',
  PRIMARY KEY (`Id`),
  KEY `用户Id外键` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behavior`
--

LOCK TABLES `behavior` WRITE;
/*!40000 ALTER TABLE `behavior` DISABLE KEYS */;
/*!40000 ALTER TABLE `behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL COMMENT '分类名',
  `Class` varchar(255) DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='题目分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MistakeId` int(11) DEFAULT NULL COMMENT '错题Id',
  `QuestionId` int(11) NOT NULL DEFAULT '0' COMMENT '题目Id',
  `UserId` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  PRIMARY KEY (`Id`),
  KEY `错题Id` (`MistakeId`),
  KEY `题目Id` (`QuestionId`),
  KEY `用户外键` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mistake`
--

DROP TABLE IF EXISTS `mistake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mistake` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `QuestionId` int(11) NOT NULL DEFAULT '0',
  `Correct` longtext COMMENT '错题整理',
  `LikeNumber` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `CollectNumber` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`Id`),
  KEY `错题用户外键` (`UserId`),
  KEY `错题题目外键` (`QuestionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='错题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mistake`
--

LOCK TABLES `mistake` WRITE;
/*!40000 ALTER TABLE `mistake` DISABLE KEYS */;
/*!40000 ALTER TABLE `mistake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `Headline` varchar(255) DEFAULT NULL COMMENT '标题',
  `Content` longtext COMMENT '笔记内容',
  `CategoryId` int(11) NOT NULL DEFAULT '0' COMMENT '分类Id',
  PRIMARY KEY (`Id`),
  KEY `笔记用户Id` (`UserId`),
  KEY `CategoryId` (`CategoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='笔记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notecategory`
--

DROP TABLE IF EXISTS `notecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notecategory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '' COMMENT '类名',
  `UserId` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `Intro` varchar(255) DEFAULT NULL COMMENT '分类简介',
  PRIMARY KEY (`Id`),
  KEY `用户外键` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='笔记分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notecategory`
--

LOCK TABLES `notecategory` WRITE;
/*!40000 ALTER TABLE `notecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `notecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL DEFAULT '0' COMMENT '分类Id',
  `KeyWords` varchar(255) DEFAULT NULL COMMENT '关键字(逗号隔开)',
  `Content` longtext NOT NULL COMMENT '题目内容',
  `Analysis` longtext COMMENT '题目解析',
  PRIMARY KEY (`Id`),
  KEY `题目分类外键` (`CategoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='题库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recharge`
--

DROP TABLE IF EXISTS `recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recharge` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL COMMENT '用户Id',
  `Money` double(8,2) DEFAULT '0.00' COMMENT '充值金额',
  `Coin` int(11) DEFAULT NULL COMMENT 'coin数',
  PRIMARY KEY (`Id`),
  KEY `充值用户外键` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recharge`
--

LOCK TABLES `recharge` WRITE;
/*!40000 ALTER TABLE `recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Phone` char(30) DEFAULT NULL COMMENT '手机号',
  `Class` varchar(20) DEFAULT NULL COMMENT '年级',
  `Sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `School` varchar(255) DEFAULT NULL COMMENT '学校',
  `Address` varchar(255) DEFAULT NULL COMMENT '地址',
  `Intro` varchar(500) DEFAULT NULL COMMENT '简介',
  `Occupation` varchar(255) DEFAULT NULL COMMENT '职业',
  `Coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-28 20:20:43
