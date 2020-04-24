-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: shiro
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_cred`
--

DROP TABLE IF EXISTS `auth_cred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_cred` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `user_role` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_cred`
--

LOCK TABLES `auth_cred` WRITE;
/*!40000 ALTER TABLE `auth_cred` DISABLE KEYS */;
INSERT INTO `auth_cred` VALUES (1,'sandeep','sandeep','admin'),(2,'rul','rul','normal'),(3,'tariq','tariq','admin'),(4,'manoj','manoj','admin'),(5,'lala','lala','user');
/*!40000 ALTER TABLE `auth_cred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `user_permission` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'ViewAll'),(2,'Register'),(3,'ViewSelf');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL DEFAULT '0',
  `user_permission` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role`
--

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;
INSERT INTO `auth_role` VALUES (1,'admin','ViewAll'),(2,'admin','Register'),(3,'sandeep','ViewSelf');
/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `user_age` int(10) NOT NULL,
  `user_dob` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1001,'Dharma','Sharkveer',24,'07/06/1994','dharma@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `hobbies` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2,'Utsav Chauhan','utsav@fff.com','Male','Browsing','Japan','FranConnect India C 94 Sector 8'),(4,'Tushar Agrawal','tushagrawal2012@gmail.com','Male','Sports,Browsing,Running,Chatting','Sri Lanka','96 C NEW AVAS VIKAS COLONYyyy\r\nBETIA HATA SOUTH'),(18,'SAGAR CHAND GUPTA','hghmgk@gmail.com','Female','Browsing','0','C-32 dggf'),(19,'SAGAR CHAND GUPTA','hghmgk@gmail.com','Female','Sports,Running','Pakistan','NOIDA'),(26,'bbbbb','bbbb@bbb.bbb','Male','Sports','Japan','bbbbbbbbbb'),(27,'bbbbb','bbbb@bbb.bbb','Male','Sports','Japan','bbbbbbbbbb'),(28,'fffffffffffff','fffff@ffff.fff','Male','Sports','Australia','ffffffffffffff'),(31,'QQQQQ','QQQ@QQQ.QQQ','Male',',Sports,Running','America','QQQQQ'),(32,'dddd','dddd@dddd.dddd','Female',',Browsing,Chatting','Canada','qgwyjqsgq'),(33,'ggg','ggg@ggg.ggg','Male',',Sports,Running','India','C-94 Sector 56'),(34,'Tushar Agrawal','tushagrawal2012@gmail.com','Male',',Sports,Running,Sports,Running','0','96 C NEW AVAS VIKAS COLONY\r\nBETIA HATA SOUTH'),(35,'Tushar Agrawal','tushagrawal2012@gmail.com','Male',',Sports,Running,Sports,Running','0','96 C NEW AVAS VIKAS COLONY\r\nBETIA HATA SOUTH'),(36,'Tushar Agrawal','tushagrawal2012@gmail.com','Male',',Sports,Running,Sports,Running','Australia2','96 C NEW AVAS VIKAS COLONY\r\nBETIA HATA SOUTH'),(42,'kkk','kkk@kkk.kkk','Male','Sports','Japan','kkkkk'),(44,'Tushar Agrawal','tushagrawal2012@gmail.com','Female','Sports','Pakistan','96 C NEW AVAS VIKAS COLONY\r\nBETIA HATA SOUTH'),(45,'Arya arya','hghmgk@gmail.com','Male','Sports,Running','0','qgwyjqsgq'),(46,'Arya arya','hghmgk@gmail.com','Male','Sports,Browsing,Running,Chatting','0','qgwyjqsgq'),(47,'abcd','abcd@abcd.abc','Male','Sports,Running','Australia','FranConnect India C 94 Sector 8'),(48,'Arya arya','hghmgk@gmail.com','Male','Sports,Running','','FranConnect India C 94 Sector 8'),(49,'zzzzz','zzzzz@zzzz.zzz','Male','Sports,Running','Australia2','FranConnect India'),(52,'ccccc ccccc','cccc@ccc.cc','Male','Sports,Running','Pakistan','C-94 Sector 56'),(53,'rrrr rrrr','rrrr@rrr.rrr','Male','Sports,Browsing','Australia','rrrrr'),(54,'dfdsfdzf','fdzzfd@dasfd.ghfg','Male','Sports,Browsing,Running,Chatting','Australia',' xcvxfcv'),(55,'vxvcvxcb','bbxb@fdf.hf','Male','Sports','Australia','dsczx'),(56,'AA','aa@aa.com','Male','Sports,Browsing','Australia','aaaa');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `issues` (
  `issue_num` int(5) NOT NULL,
  `issue_topic` varchar(100) NOT NULL,
  `issue_date` date NOT NULL,
  PRIMARY KEY (`issue_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,'Polymorphism','2018-08-10'),(2,'Generics','2018-08-16'),(3,'FileRead','2018-08-23'),(4,'ReadWriteCSV','2018-09-28');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `taskName` text,
  `description` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1001,'Call Rio','Talk to Kul','2018-09-19 17:36:24'),(1003,'Play Hard ','Leh','1970-01-01 05:30:00'),(1005,'Buy Quad','Fly high','2018-09-25 00:00:00'),(1019,'Work Hard','Laos','1970-01-01 05:30:00'),(1014,'Work Hard','Laos','1970-01-01 05:30:00');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Rul','980','B 32'),(2,'Cul','790','J 23'),(3,'Sul','285','M 12'),(4,'Akki','70086','Noida'),(5,'Akshay','267','Noida'),(6,'NeoLuck','301','Noida'),(7,'Sachin','620','Delhi'),(8,'Amit','780','Ashok Nagar'),(9,'Hariram','630','Noida'),(10,'Vikash','890','Delhi'),(11,'Nikhil','783','Noida'),(12,'Arjun','663','GZB');
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

-- Dump completed on 2020-04-24 10:31:11
