-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2014 at 03:45 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `freightbit`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `referenceTable` varchar(50) NOT NULL,
  `referenceId` int(11) NOT NULL,
  `addressType` varchar(10) NOT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceId` (`referenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `clientId` int(11) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(50) NOT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` int(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `referenceTable` varchar(50) NOT NULL,
  `referenceId` int(11) NOT NULL,
  `contactType` varchar(10) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `middleName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`contactId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceId` (`referenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customeritems`
--

DROP TABLE IF EXISTS `customeritems`;
CREATE TABLE IF NOT EXISTS `customeritems` (
  `customerItemsId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `itemName` varchar(50) DEFAULT NULL,
  `itemCode` varchar(10) NOT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `srp` float DEFAULT NULL,
  `criticalQuality` int(11) DEFAULT NULL,
  `basePrice` float DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`customerItemsId`),
  KEY `clientId` (`clientId`),
  KEY `customerId` (`customerId`),
  KEY `itemCode` (`itemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customerrates`
--

DROP TABLE IF EXISTS `customerrates`;
CREATE TABLE IF NOT EXISTS `customerrates` (
  `customerRateId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `rateType` varchar(10) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`customerRateId`),
  KEY `clientId` (`clientId`),
  KEY `customerId` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `customerCode` varchar(10) NOT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `customerType` varchar(100) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dti` tinyint(1) DEFAULT NULL,
  `mayorsPermit` tinyint(1) DEFAULT NULL,
  `aaf` tinyint(1) DEFAULT NULL,
  `signatureCard` tinyint(1) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `customerCode` (`customerCode`),
  KEY `clientId` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE IF NOT EXISTS `drivers` (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorId` int(10) NOT NULL,
  `driverCode` varchar(10) DEFAULT NULL,
  `licenseNumber` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `dateHired` date DEFAULT NULL,
  `dateTerminated` date DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) DEFAULT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`driverId`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
CREATE TABLE IF NOT EXISTS `parameters` (
  `parameterId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `referenceTable` varchar(50) NOT NULL,
  `referenceColumn` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`parameterId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceColumn` (`referenceColumn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


INSERT INTO `parameters` (`parameterId`, `clientId`, `referenceTable`, `referenceColumn`, `key`, `value`, `label`, `notes`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES (1,1,'USER','STATUS','ACTIVE','Active','Active','','2014-05-09 16:19:28','admin','2014-05-09 16:20:50','admin'),(2,1,'USER','STATUS','INACTIVE','Inactive','Inactive','','2014-05-09 17:30:44','admin','2014-05-09 17:30:44','admin'),(3,1,'USER','USER_TYPE','REGISTERED USER','Registered User','Registered User','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(10,1,'USER','USER_TYPE','CUSTOMER RELATIONS DEPARTMENT','Customer Relations Department','Customer Relations Department','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(11,1,'USER','USER_TYPE','FREIGHT OPERATIONS OFFICER','Freight Operations Officer','Freight Operations Officer','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(12,1,'USER','USER_TYPE','FREIGHT OPERATIONS SPECIALIST','Freight Operations Specialist','Freight Operations Specialist','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(13,1,'USER','USER_TYPE','FREIGHT OPERATIONS MANAGER','Freight Operations Manager','Freight Operations Manager','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(14,1,'USER','USER_TYPE','FREIGHT DOCUMENTS SPECIALIST','Freight Documents Specialist','Freight Documents Specialist','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(15,1,'USER','USER_TYPE','INLAND FREIGHT OFFICER','Inland Freight Officer','Inland Freight Officer','','2014-05-09 17:30:44','admin','2014-05-12 22:20:33','admin'),(16,1,'VENDOR','VENDOR_TYPE','TRUCKING','Trucking','Trucking','','2014-05-28 07:04:35','admin','2014-05-28 07:04:35','admin'),(17,1,'VENDOR','VENDOR_TYPE','SHIPPING','Shipping','Shipping','','2014-05-28 07:04:35','admin','2014-05-28 07:04:35','admin'),(18,1,'TRUCKS','TRUCK_TYPE','TRACTOR HEAD','Tractor Head','Tractor Head','','2014-05-29 09:48:36','admin','2014-05-29 09:48:36','admin'),(19,1,'TRUCKS','TRUCK_TYPE','CLOSED VAN','Closed Van','Closed Van','','2014-05-29 09:48:36','admin','2014-05-29 09:48:36','admin'),(20,1,'VENDOR_SEARCH','VENDOR_SEARCH','COMPANY NAME','Company Name','Company Name','','2014-05-30 03:30:24','admin','2014-05-30 03:30:24','admin'),(21,1,'VENDOR_SEARCH','VENDOR_SEARCH','COMPANY CODE','Company Code','Company Code','','2014-05-30 03:30:24','admin','2014-06-04 07:53:42','admin'),(22,1,'VENDOR_SEARCH','VENDOR_SEARCH','VENDOR TYPE','Vendor Type','Vendor Type','','2014-05-30 03:30:24','admin','2014-05-30 03:30:24','admin'),(23,1,'VENDOR_SEARCH','VENDOR_SEARCH','EMAIL ADDRESS','Email Address','Email Address','','2014-05-30 03:30:24','admin','2014-05-30 03:30:24','admin'),(24,1,'VENDOR_SEARCH','VENDOR_SEARCH','CONTACT NUMBER','Contact Number','Contact Number','','2014-05-30 03:30:24','admin','2014-05-30 03:30:24','admin'),(25,1,'VENDOR_SEARCH','VENDOR_SEARCH','CLASS','Class','Class','','2014-05-30 03:30:24','admin','2014-05-30 03:30:24','admin'),(26,1,'VENDOR_SEARCH','VENDOR_SEARCH','CITY','City','City','','2014-05-30 03:30:24','admin','2014-05-30 03:30:24','admin'),(27,1,'VENDOR_CLASS','VENDOR_CLASS','PREMIUM','Premium','Premium','','2014-06-03 02:58:41','admin','2014-06-03 02:58:41',''),(28,1,'VENDOR_CLASS','VENDOR_CLASS','CLASS A','Class A','Class A','','2014-06-03 02:58:41','admin','2014-06-03 02:58:41',''),(29,1,'VENDOR_CLASS','VENDOR_CLASS','CLASS B','Class B','Class B','','2014-06-03 02:58:41','admin','2014-06-03 02:58:41',''),(30,1,'VENDOR_CLASS','VENDOR_CLASS','CLASS C','Class C','Class C','','2014-06-03 02:58:41','admin','2014-06-03 02:58:41',''),(31,1,'VENDOR_CLASS','VENDOR_CLASS','ECONOMY','Economy','Economy','','2014-06-03 02:58:41','admin','2014-06-04 02:28:39','');


-- --------------------------------------------------------

--
-- Table structure for table `trailers`
--

DROP TABLE IF EXISTS `trailers`;
CREATE TABLE IF NOT EXISTS `trailers` (
  `trailerId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `trailerCode` varchar(10) NOT NULL,
  `trailerType` varchar(10) NOT NULL,
  `trailerLength` int(11) NOT NULL,
  `grossWeight` float NOT NULL,
  `modelName` varchar(30) NOT NULL,
  `modelYear` varchar(10) NOT NULL,
  `axle` int(11) NOT NULL,
  `vin` varchar(50) NOT NULL,
  `plateNumber` varchar(10) NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`trailerId`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`),
  KEY `trailerCode` (`trailerCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

DROP TABLE IF EXISTS `trucks`;
CREATE TABLE IF NOT EXISTS `trucks` (
  `truckId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(10) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `truckCode` varchar(10) NOT NULL,
  `truckType` varchar(30) DEFAULT NULL,
  `plateNumber` varchar(30) DEFAULT NULL,
  `modelNumber` varchar(30) DEFAULT NULL,
  `modelYear` int(11) DEFAULT NULL,
  `engineNumber` varchar(50) DEFAULT NULL,
  `grossWeight` int(11) DEFAULT NULL,
  `createdTimestamp` timestamp NULL DEFAULT NULL,
  `createdBy` varchar(10) DEFAULT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT NULL,
  `modifiedBy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`truckId`),
  UNIQUE KEY `truckCode` (`truckCode`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `vendorId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorCode` varchar(30) NOT NULL,
  `vendorName` varchar(50) DEFAULT NULL,
  `vendorType` varchar(10) DEFAULT NULL,
  `vendorClass` varchar(30) DEFAULT NULL,
  `vendorStatus` varchar(10) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) DEFAULT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vendorId`),
  KEY `clientId` (`clientId`),
  KEY `vendorCode` (`vendorCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vessels`
--

DROP TABLE IF EXISTS `vessels`;
CREATE TABLE IF NOT EXISTS `vessels` (
  `vesselId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `vesselNumber` varchar(50) NOT NULL,
  `vesselName` varchar(50) NOT NULL,
  `modelNumber` varchar(50) NOT NULL,
  `modelYear` int(11) NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`vesselId`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vesselschedules`
--

DROP TABLE IF EXISTS `vesselschedules`;
CREATE TABLE IF NOT EXISTS `vesselschedules` (
  `vesselScheduleId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `originPort` varchar(30) NOT NULL,
  `departureDate` date NOT NULL,
  `departureTime` time NOT NULL,
  `destinationPort` varchar(30) NOT NULL,
  `arrivalDate` date NOT NULL,
  `arrivalTime` time NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`vesselScheduleId`),
  KEY `clientID` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yardlogs`
--

DROP TABLE IF EXISTS `yardlogs`;
CREATE TABLE IF NOT EXISTS `yardlogs` (
  `yardLogsId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL,
  `gateInDate` date NOT NULL,
  `gateInTime` time NOT NULL,
  `gateOutDate` date NOT NULL,
  `gateOutTime` time NOT NULL,
  `truckCode` varchar(10) NOT NULL,
  `trailerCode` varchar(10) NOT NULL,
  `driverCode` varchar(10) NOT NULL,
  `bayNumber` int(11) NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`yardLogsId`),
  KEY `clientId` (`clientId`),
  KEY `addressId` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- Users table
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `clientId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastVisitDate` timestamp NULL DEFAULT NULL,
  `status` varchar(8) NOT NULL,
  `contactNo` varchar(20) DEFAULT NULL,
  `userType` varchar(30) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  KEY `clientId_idx` (`clientId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Group table
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `clientId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `name` (`name`),
  KEY `fk.clientId_idx` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Group_user table
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `clientId` bigint(20) NOT NULL,
  `groupUserId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupUserId`),
  KEY `fk_groupuser_group_idx` (`groupId`),
  KEY `fk.groupuser_user_idx` (`userId`),
  KEY `fk.groupuser_client_idx` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Permission table
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `clientId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permissionId`),
  UNIQUE KEY `name` (`name`),
  KEY `fk.permission_client_idx` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Permission_user_group table
DROP TABLE IF EXISTS `permission_user_group`;
CREATE TABLE `permission_user_group` (
  `clientId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `projectId` bigint(20) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`permissionId`),
  KEY `fk.permissionusergroup_user_idx` (`userId`),
  KEY `fk.permissionusergroup_client_idx` (`clientId`),
  KEY `fk.permissionusergroup_group_idx` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `serviceType` varchar(10) NOT NULL,
  `serviceMode` varchar(10) NOT NULL,
  `notificationType` varchar(10) NOT NULL,
  `orderDate` date NOT NULL,
  `paymentMode` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `classification` varchar(50) NOT NULL,
  `estimatedWeight` float NOT NULL,
  `declaredValue` float NOT NULL,
  `commodity` varchar(50) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  `orderStatus` varchar(10) NOT NULL,
  `vendorCode` varchar(10) DEFAULT NULL,
  `truckCode` varchar(10) DEFAULT NULL,
  `trailerCode` varchar(10) DEFAULT NULL,
  `driverCode` varchar(10) DEFAULT NULL,
  `vesselNumber` varchar(50) DEFAULT NULL,
  `accountRep` varchar(10) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderNumber` (`orderNumber`),
  KEY `clientId` (`clientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `clientId`, `orderNumber`, `serviceType`, `serviceMode`, `notificationType`, `orderDate`, `paymentMode`, `quantity`, `size`, `classification`, `estimatedWeight`, `declaredValue`, `commodity`, `comments`, `rate`, `orderStatus`, `vendorCode`, `truckCode`, `trailerCode`, `driverCode`, `vesselNumber`, `accountRep`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 100000, 'FCL', 'D2D', 'EMAIL', '2014-05-26', 'COD', 100, '100', 'UNCLASSIFIED', 1000, 2000, 'MISC GOODS', 'TEST ORDER CREATE', 1000, 'AVAILABLE', NULL, NULL, NULL, NULL, NULL, 'JCASTR00', '2014-05-27 05:44:08', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- --------------------------------------------------------

--
-- Table structure for table `orderstops`
--

CREATE TABLE IF NOT EXISTS `orderstops` (
  `orderStopId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `stopNumber` int(11) NOT NULL,
  `stopType` varchar(10) NOT NULL,
  `stopName` varchar(50) NOT NULL,
  `addressId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` time NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`orderStopId`),
  KEY `clientId` (`clientId`,`orderId`,`stopNumber`,`addressId`,`contactId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orderstops`
--

INSERT INTO `orderstops` (`orderStopId`, `clientId`, `orderId`, `stopNumber`, `stopType`, `stopName`, `addressId`, `contactId`, `appointmentDate`, `appointmentTime`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 1, 1, 'PICKUP', 'PICKUP LOCATION', 2, 1, '2014-05-31', '08:00:00', '2014-05-27 05:47:06', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00'),
(2, 1, 1, 1, 'DELIVERY', 'DELIVERY LOCATION', 3, 2, '2014-06-02', '08:00:00', '2014-05-27 05:47:06', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `customerCode` varchar(10) NOT NULL,
  `customerName` varchar(50) DEFAULT NULL,
  `customerType` varchar(10) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dti` tinyint(1) DEFAULT NULL,
  `mayorsPermit` tinyint(1) DEFAULT NULL,
  `aaf` tinyint(1) DEFAULT NULL,
  `signatureCard` tinyint(1) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `customerCode` (`customerCode`),
  KEY `clientId` (`clientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `clientId`, `customerCode`, `customerName`, `customerType`, `website`, `phone`, `mobile`, `fax`, `email`, `dti`, `mayorsPermit`, `aaf`, `signatureCard`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 'WALMART', 'WALMART', 'NOT_USED', 'WWW.WALMART.COM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 'JCASTR00', '2014-05-27 05:38:29', 'JCASTR00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `referenceTable` varchar(50) NOT NULL,
  `referenceId` int(11) NOT NULL,
  `addressType` varchar(10) NOT NULL,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceId` (`referenceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `clientId`, `referenceTable`, `referenceId`, `addressType`, `addressLine1`, `addressLine2`, `city`, `state`, `zip`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 'CUSTOMERS', 1, 'MAIN', '14040 NE 8TH STREET', 'SUITE 226', 'BELLEVUE', 'WA', '98007', '2014-05-27 05:19:56', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00'),
(2, 1, 'CUSTOMERS', 1, 'SHIPPER', '14040 NE 8TH STREET', 'SUITE 226', 'BELLEVUE', 'WA', '98007', '2014-05-27 05:20:03', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00'),
(3, 1, 'CUSTOMERS', 1, 'RECEIVER', '2018 156TH AVE NE', 'SUITE 100', 'BELLEVUE', 'WA', '98007', '2014-05-27 05:20:11', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00'),
(4, 1, 'CUSTOMERS', 1, 'BILLTO', '1040 140TH AVE NE', 'SUITE F', 'BELLEVUE', 'WA', '98007', '2014-05-27 05:21:54', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00'),
(5, 1, 'CUSTOMERS', 1, 'SOLICITOR', '2018 156TH AVE NE', 'SUITE 343', 'BELLEVUE', 'WA', '98007', '2014-05-27 05:23:43', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `referenceTable` varchar(50) NOT NULL,
  `referenceId` int(11) NOT NULL,
  `contactType` varchar(10) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `middleName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` varchar(10) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedBy` varchar(10) NOT NULL,
  PRIMARY KEY (`contactId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceId` (`referenceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contactId`, `clientId`, `referenceTable`, `referenceId`, `contactType`, `firstName`, `middleName`, `lastName`, `phone`, `mobile`, `fax`, `email`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 'CUSTOMERS', 1, 'SHIPPER', 'JET', 'L', 'CASTRO', '415-439-0697', NULL, NULL, NULL, '2014-05-27 05:25:13', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00'),
(2, 1, 'CUSTOMERS', 1, 'RECEIVER', 'JETHRO', 'L', 'CASTRO', '415-439-0697', NULL, NULL, NULL, '2014-05-27 05:25:13', 'JCASTR00', '0000-00-00 00:00:00', 'JCASTR00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
