CREATE DATABASE  IF NOT EXISTS `ernest` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ernest`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: ernest
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` varchar(10) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_customer`
--

DROP TABLE IF EXISTS `address_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_customer` (
  `customer_id` varchar(10) NOT NULL,
  `address_id` varchar(10) NOT NULL,
  `is_primary_customer_address` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `fk_address_customer_addr_idx` (`address_id`),
  KEY `fk_address_customer_cust_idx` (`customer_id`),
  CONSTRAINT `fk_address_customer_addr` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_customer_cust` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_customer`
--

LOCK TABLES `address_customer` WRITE;
/*!40000 ALTER TABLE `address_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_supplier`
--

DROP TABLE IF EXISTS `address_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_supplier` (
  `supplier_id` varchar(10) NOT NULL,
  `address_id` varchar(10) NOT NULL,
  `is_primary_supplier_address` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`supplier_id`,`address_id`),
  KEY `fk_address_supplier_addr_idx` (`address_id`),
  CONSTRAINT `fk_address_supplier_addr` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_supplier`
--

LOCK TABLES `address_supplier` WRITE;
/*!40000 ALTER TABLE `address_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` varchar(10) NOT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `contact_type` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_type_idx` (`contact_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_customer`
--

DROP TABLE IF EXISTS `contact_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_customer` (
  `customer_id` varchar(10) NOT NULL,
  `contact_id` varchar(10) NOT NULL,
  `is_primary_customer_contact` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`customer_id`,`contact_id`),
  KEY `fk_contact_customer_contct_idx` (`contact_id`),
  CONSTRAINT `fk_contact_customer_contct` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contact_customer_custmr` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_customer`
--

LOCK TABLES `contact_customer` WRITE;
/*!40000 ALTER TABLE `contact_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_supplier`
--

DROP TABLE IF EXISTS `contact_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_supplier` (
  `supplier_id` varchar(10) NOT NULL,
  `contact_id` varchar(10) NOT NULL,
  `is_primary_supplier_contact` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`supplier_id`,`contact_id`),
  KEY `fk_contact_supplier_contct_idx` (`contact_id`),
  CONSTRAINT `fk_contact_supplier_supp` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contact_supplier_contct` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_supplier`
--

LOCK TABLES `contact_supplier` WRITE;
/*!40000 ALTER TABLE `contact_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` varchar(10) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_code_idx` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','Mighty Co','CUST_MC1','2014-02-16 00:00:00',NULL,'admin',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `id` varchar(10) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `license` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `supplier_id` varchar(10) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driver_status_idx` (`status`),
  KEY `fk_supplier_idx` (`supplier_id`),
  CONSTRAINT `fk_supplier_driver` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` varchar(10) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `plate_number` varchar(45) DEFAULT NULL,
  `supplier_id` varchar(10) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipment_status_idx` (`status`),
  KEY `fk_supplier_idx` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` varchar(10) NOT NULL,
  `group_name` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1','ADMIN','2014-02-16 00:00:00',NULL,'admin',NULL);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter` (
  `param_id` varchar(10) NOT NULL,
  `param_nm` varchar(45) DEFAULT NULL,
  `key` varchar(45) NOT NULL,
  `value` varchar(45) NOT NULL,
  `label` varchar(45) NOT NULL,
  `comments` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`param_id`),
  KEY `KEY` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` VALUES ('1','ACCOUNT_TYPE','ACCT_CUST','Customer','Customer',NULL,'2014-02-16 00:00:00',NULL,'admin',NULL),('2','ACCOUNT_TYPE','ACCT_STAFF','Staff','Staff',NULL,'2014-02-16 00:00:00',NULL,'admin',NULL),('3','CUSTOMER_NAME','CUST_MC1','Mighty Corp','Mighty Corp',NULL,'2014-02-16 00:00:00',NULL,'admin',NULL),('4','STATUS','ACTIVE','Active','Active',NULL,'2014-02-16 00:00:00',NULL,'admin',NULL),('5','STATUS','INACTIVE','Inactive','Inactive',NULL,'2014-02-16 00:00:00',NULL,'admin',NULL);
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` varchar(10) NOT NULL,
  `carrier` varchar(45) DEFAULT NULL,
  `vessel_number` varchar(45) DEFAULT NULL,
  `origin` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `estimated_time_departure` varchar(45) DEFAULT NULL,
  `estimated_time_arrival` varchar(45) DEFAULT NULL,
  `supplier_id` varchar(10) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schedule_carrier_idx` (`carrier`),
  KEY `fk_supplier_schedule_idx` (`supplier_id`),
  CONSTRAINT `fk_supplier_schedule` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` varchar(10) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_class_idx` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `group_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `updated_by` varchar(45) DEFAULT NULL,
  `date_last_visited` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group_user_idx` (`group_id`),
  KEY `fk_user_customer_idx` (`customer_id`),
  KEY `fk_user_status_idx` (`status`),
  CONSTRAINT `fk_group_user` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','admin','admin','ACCT_STAFF','1','1','admin@test.com','ACTIVE','Ronnie Mar Ramos',NULL,'2014-02-16 00:00:00',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2014-03-03  1:57:37
