-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: easyCake
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Current Database: `easyCake`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `easyCake` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `easyCake`;

--
-- Table structure for table `bakery`
--

DROP TABLE IF EXISTS `bakery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bakery` (
  `nit` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `registered_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `activity` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `neighborhood` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telephone` decimal(12,0) DEFAULT NULL,
  `cellphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `web_page` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bakery`
--

LOCK TABLES `bakery` WRITE;
/*!40000 ALTER TABLE `bakery` DISABLE KEYS */;
/*!40000 ALTER TABLE `bakery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `cost` decimal(10,0) NOT NULL,
  `code_ingredient_type` varchar(10) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_type`
--

DROP TABLE IF EXISTS `ingredient_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_type`
--

LOCK TABLES `ingredient_type` WRITE;
/*!40000 ALTER TABLE `ingredient_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nit_bakery` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `cost` decimal(10,0) unsigned NOT NULL,
  `state` char(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`ingredient_id`),
  KEY `fk_order_ingredient1_idx` (`ingredient_id`),
  CONSTRAINT `fk_order_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_bakery`
--

DROP TABLE IF EXISTS `order_bakery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_bakery` (
  `bakery_nit` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`bakery_nit`,`order_id`),
  KEY `fk_bakery_has_order_order1_idx` (`order_id`),
  KEY `fk_bakery_has_order_bakery_idx` (`bakery_nit`),
  CONSTRAINT `fk_bakery_has_order_bakery` FOREIGN KEY (`bakery_nit`) REFERENCES `bakery` (`nit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bakery_has_order_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_bakery`
--

LOCK TABLES `order_bakery` WRITE;
/*!40000 ALTER TABLE `order_bakery` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_bakery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cost` decimal(10,0) unsigned DEFAULT NULL,
  `image` blob,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`order_id`,`order_ingredient_id`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fk_product_order1_idx` (`order_id`,`order_ingredient_id`),
  CONSTRAINT `fk_product_order1` FOREIGN KEY (`order_id`, `order_ingredient_id`) REFERENCES `order` (`id`, `ingredient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ingredient`
--

DROP TABLE IF EXISTS `product_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ingredient` (
  `product_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`,`ingredient_id`),
  KEY `fk_product_has_ingredient_ingredient1_idx` (`ingredient_id`),
  KEY `fk_product_has_ingredient_product1_idx` (`product_id`),
  CONSTRAINT `fk_product_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_ingredient_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ingredient`
--

LOCK TABLES `product_ingredient` WRITE;
/*!40000 ALTER TABLE `product_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `namel` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `surname` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `adress` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `neighborhood` varchar(45) DEFAULT NULL,
  `phone` int(12) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `code_user_type` varchar(10) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_type_id`,`order_id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  KEY `fk_user_order1_idx` (`order_id`),
  CONSTRAINT `fk_user_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-25  6:02:01
