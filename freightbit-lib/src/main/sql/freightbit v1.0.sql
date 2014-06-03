-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2014 at 03:45 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ ZERO";
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


--Permission table
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


--Permission_user_group table
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
