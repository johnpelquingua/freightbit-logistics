-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2014 at 02:43 AM
-- Server version: 5.6.21
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `freightbit`
--
CREATE DATABASE IF NOT EXISTS `freightbit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `freightbit`;

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
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  `contactReferenceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceId` (`referenceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `clientId`, `referenceTable`, `referenceId`, `addressType`, `addressLine1`, `addressLine2`, `city`, `state`, `zip`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `contactReferenceId`) VALUES
(111, 1, 'CUSTOMERS', 47, 'Annex1', '123 annex road', 'barangay annex', 'annex city', 'ncr', '1800', '2014-11-13 19:06:37', 'admin', '2014-11-13 19:06:37', 'admin', NULL),
(112, 1, 'CUSTOMERS', 47, 'Branch1', '123 branch road', 'barangay branch', 'branch city', 'ncr', '1900', '2014-11-13 19:07:11', 'admin', '2014-11-13 19:07:11', 'admin', NULL),
(113, 1, 'CUSTOMERS', 47, 'CONSIGNEE', 'Con street', '', 'Con City', 'NCR', '2000', '2014-11-13 19:34:46', 'admin', '2014-11-17 09:13:57', 'admin', 2),
(114, 1, 'CUSTOMERS', 46, 'Branch2', 'ateweyjaej', '', 'aety', '', '4846', '2014-11-21 08:04:51', 'admin', '2014-11-21 08:04:51', 'admin', NULL),
(115, 1, 'CUSTOMERS', 46, 'CONSIGNEE', 'Jdrydryjrdjk', '', 'drhjdr', '', '6758', '2014-11-21 08:05:45', 'admin', '2014-11-21 08:05:45', 'admin', 5),
(116, 1, 'CUSTOMERS', 48, 'Main', 'Banaba', '', 'San Mateo Rizal', '', '18501', '2014-12-12 02:09:16', 'admin', '2014-12-12 02:09:16', 'admin', NULL),
(117, 1, 'CUSTOMERS', 48, 'CONSIGNEE', 'Nangka', '', 'Marikina City', '', '1852', '2014-12-12 02:10:19', 'admin', '2014-12-12 02:10:19', 'admin', 7);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `clientId` int(11) NOT NULL AUTO_INCREMENT,
  `addressLine1` varchar(50) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `clientName` varchar(50) NOT NULL,
  `createdBy` varchar(25) NOT NULL,
  `createdTimestamp` datetime NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `modifiedBy` varchar(25) NOT NULL,
  `modifiedTimestamp` datetime NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clientId`, `addressLine1`, `addressLine2`, `city`, `clientName`, `createdBy`, `createdTimestamp`, `email`, `fax`, `mobile`, `modifiedBy`, `modifiedTimestamp`, `phone`, `state`, `website`, `zip`) VALUES
(1, 'Quezon City', '10', NULL, 'Ernest', 'admin', '2014-05-22 04:01:47', 'admin@test.com', '1234567', '1234567', '2014-05-22', '2014-05-22 04:01:47', '1234567', 'NA', 'www.website.com', '1200');

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
  `createdTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceId` (`referenceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contactId`, `clientId`, `referenceTable`, `referenceId`, `contactType`, `firstName`, `middleName`, `lastName`, `phone`, `mobile`, `fax`, `email`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `position`) VALUES
(1, 1, 'CUSTOMERS', 47, 'shipper', 'Homer', '', 'Simpson', '(425) 626-2624', '(+63726)(252-6257)', '', 'homer@yahoo.com', '2014-11-17 09:05:28', 'admin', '2014-11-17 09:12:55', 'admin', 'Mr'),
(2, 1, 'CUSTOMERS', 47, 'CONSIGNEE', 'Confirst', 'Conmiddle', 'Conlast', '(123) 456-7890', '(+63121)(234-567', '(123) 456-7890', 'con@email.com', '2014-11-13 19:34:46', 'admin', '2014-11-17 09:12:55', 'admin', NULL),
(3, 1, 'CONTACTS', 2, 'C_CONTACT', 'Sarmiento', '', 'Jonathan', '(252) 673-5735', '(+63753)(573-5735)', '', 'jon@yahoo.com', '2014-11-17 09:15:08', 'admin', '2014-11-17 09:15:08', 'admin', 'Mr'),
(4, 1, 'CUSTOMERS', 46, 'shipper', 'ryisry', '', 'aeyuaseyi', '(689) 689-0680', '(+63806)(896-8680)', '', 'sery@ee.com', '2014-11-21 08:05:09', 'admin', '2014-11-21 08:05:09', 'admin', 'aetu'),
(5, 1, 'CUSTOMERS', 46, 'CONSIGNEE', 'drdu', '', 'seyjkseyk', '(689) 689-6068', '(+63069)(069-0690)', '', 'dukdtuk@etret.com', '2014-11-21 08:05:45', 'admin', '2014-11-21 08:05:45', 'admin', NULL),
(6, 1, 'CUSTOMERS', 48, 'shipper', 'Kevin', 'Narciso', 'Arceo', '(565) 456-6457', '(+63905)(640-3077)', '(576) 565-3465', 'knarceo20@yahoo.com', '2014-12-10 02:32:07', 'admin', '2014-12-10 02:32:07', 'admin', 'Intern'),
(7, 1, 'CUSTOMERS', 48, 'CONSIGNEE', 'Kevin', '', 'Arceo', '(564) 656-7456', '(+63234)(325-3457)', '(456) 574-7567', 'knarceo20@yahoo.com', '2014-12-12 02:10:19', 'admin', '2014-12-12 02:10:19', 'admin', NULL),
(8, 1, 'CUSTOMERS', 48, 'shipper', 'Khin', '', 'Kaizen', '(989) 768-7977', '(+63098)(768-976', '', 'khinkaizen@gmail.com', '2014-12-12 02:51:28', 'admin', '2014-12-12 02:51:28', 'admin', 'Employee'),
(9, 1, 'CUSTOMERS', 48, 'shipper', 'sdfgyhfdth', '', 'jgdfhgdgh', '(678) 5678', '(+63867)(567-5675)', '', 'frdgf@dfh.com', '2014-12-12 02:52:12', 'admin', '2014-12-12 02:52:12', 'admin', 'fgdsg');

-- --------------------------------------------------------

--
-- Table structure for table `container`
--

CREATE TABLE IF NOT EXISTS `container` (
  `containerId` int(11) NOT NULL AUTO_INCREMENT,
  `eirNumber` varchar(45) DEFAULT NULL,
  `eirType` varchar(45) DEFAULT NULL,
  `sealNumber` varchar(45) DEFAULT NULL,
  `containerNumber` varchar(45) DEFAULT NULL,
  `containerSize` varchar(45) DEFAULT NULL,
  `containerType` varchar(45) DEFAULT NULL,
  `gateInTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gateOutTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shipping` varchar(45) DEFAULT NULL,
  `trucking` varchar(45) DEFAULT NULL,
  `plateNumber` varchar(45) DEFAULT NULL,
  `vanNumber` varchar(45) DEFAULT NULL,
  `driver` varchar(45) DEFAULT NULL,
  `vanLocation` varchar(45) DEFAULT NULL,
  `orderNumber` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `vanTo` varchar(45) DEFAULT NULL,
  `vanFrom` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ladenEmpty` varchar(45) DEFAULT NULL,
  `containerStatus` varchar(45) DEFAULT NULL,
  `bookingNum` varchar(45) DEFAULT NULL,
  `forkliftOperator` varchar(45) DEFAULT NULL,
  `operationsDept` varchar(45) DEFAULT NULL,
  `receiptNumber` varchar(45) DEFAULT NULL,
  `portCode` varchar(45) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `container`
--

INSERT INTO `container` (`containerId`, `eirNumber`, `eirType`, `sealNumber`, `containerNumber`, `containerSize`, `containerType`, `gateInTime`, `gateOutTime`, `shipping`, `trucking`, `plateNumber`, `vanNumber`, `driver`, `vanLocation`, `orderNumber`, `remarks`, `vanTo`, `vanFrom`, `createdBy`, `createdTimestamp`, `modifiedBy`, `modifiedTimestamp`, `ladenEmpty`, `containerStatus`, `bookingNum`, `forkliftOperator`, `operationsDept`, `receiptNumber`, `portCode`, `clientId`) VALUES
(13, '321', 'EIR FORM 1', NULL, 'A-1', '10 FOOTER', NULL, '2014-12-04 03:06:00', NULL, '2GO', NULL, NULL, NULL, NULL, 'Manila', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 04:16:43', 'admin', '2014-12-04 04:16:43', NULL, 'CONSOLIDATED', NULL, NULL, NULL, '123', NULL, NULL),
(14, '654', 'EIR FORM 1', NULL, 'A-2', '20 FOOTER', NULL, '2014-12-04 04:11:00', NULL, '2GO', NULL, NULL, NULL, NULL, 'Cebu', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 07:25:55', 'admin', '2014-12-04 07:25:55', NULL, 'OPEN', NULL, NULL, NULL, '456', NULL, NULL),
(15, '987', 'EIR FORM 2', '2467', 'A-3', '40 STD FOOTER', NULL, '2014-12-04 04:12:00', '2014-12-04 06:09:00', '2GO', NULL, NULL, NULL, NULL, 'Davao', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 06:09:39', 'admin', '2014-12-04 06:09:39', NULL, 'GATE OUT', NULL, NULL, NULL, '789', NULL, NULL),
(16, '210', 'EIR FORM 1', NULL, 'A-4', '40 HC FOOTER', NULL, '2014-12-04 04:12:00', NULL, '2GO', NULL, NULL, NULL, NULL, 'Iloilo', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 04:12:56', 'admin', '2014-12-04 04:12:56', NULL, 'OPEN', NULL, NULL, NULL, '012', NULL, NULL),
(17, '4321', 'EIR FORM 1', NULL, 'A-1B', '10 FOOTER', NULL, '2014-12-04 04:13:00', NULL, '2GO', NULL, NULL, NULL, NULL, 'Roxas', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 04:14:24', 'admin', '2014-12-04 04:14:24', NULL, 'OPEN', NULL, NULL, NULL, '1234', NULL, NULL),
(18, '8765', 'EIR FORM 1', NULL, 'A-2B', '20 FOOTER', NULL, '2014-12-04 04:14:00', NULL, '2GO', NULL, NULL, NULL, NULL, 'Palawan', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 04:14:51', 'admin', '2014-12-04 04:14:51', NULL, 'OPEN', NULL, NULL, NULL, '5678', NULL, NULL),
(19, '3210', 'EIR FORM 1', NULL, 'A-3B', '40 STD FOOTER', NULL, '2014-12-04 04:15:00', NULL, '2GO', NULL, NULL, NULL, NULL, 'Iligan', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 04:15:32', 'admin', '2014-12-04 04:15:32', NULL, 'OPEN', NULL, NULL, NULL, '0123', NULL, NULL),
(22, '7654', 'EIR FORM 2', '', 'A-4B', '40 HC FOOTER', NULL, '2014-12-04 06:05:00', '2014-12-04 07:00:00', '2GO', NULL, NULL, NULL, NULL, 'Zamboanga', NULL, NULL, NULL, NULL, 'admin', '2014-12-04 07:16:02', 'admin', '2014-12-04 07:16:02', NULL, 'FINAL', NULL, NULL, NULL, '4567', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customeritems`
--

CREATE TABLE IF NOT EXISTS `customeritems` (
  `customerItemsId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `itemName` varchar(50) DEFAULT NULL,
  `itemCode` varchar(10) NOT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `srp` float DEFAULT NULL,
  `criticalQuality` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  PRIMARY KEY (`customerItemsId`),
  KEY `clientId` (`clientId`),
  KEY `customerId` (`customerId`),
  KEY `itemCode` (`itemCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customeritems`
--

INSERT INTO `customeritems` (`customerItemsId`, `clientId`, `customerId`, `itemName`, `itemCode`, `length`, `width`, `height`, `srp`, `criticalQuality`, `weight`, `note`, `description`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 47, 'SGJSDGJ', 'SGJ', 564, 4684, 468, 4684.68, NULL, 467467, '', 'TESTING', '2014-11-18 02:55:24', 'admin', '2014-11-24 06:08:43', 'admin'),
(2, 1, 46, 'seryksruk', 'KUT', 5785, 578, 578, 5.78, NULL, 8578, 'kjtfruk', 'rhjkd', '2014-11-21 08:05:23', 'admin', '2014-11-21 08:05:23', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customerrates`
--

CREATE TABLE IF NOT EXISTS `customerrates` (
  `customerRateId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `rateType` varchar(10) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  PRIMARY KEY (`customerRateId`),
  KEY `clientId` (`clientId`),
  KEY `customerId` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

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
  `dti` varchar(30) DEFAULT NULL,
  `mayorsPermit` varchar(30) DEFAULT NULL,
  `aaf` varchar(30) DEFAULT NULL,
  `signatureCard` varchar(30) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `customerCode` (`customerCode`),
  KEY `clientId` (`clientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `clientId`, `customerCode`, `customerName`, `customerType`, `website`, `phone`, `mobile`, `fax`, `email`, `dti`, `mayorsPermit`, `aaf`, `signatureCard`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(46, 1, 'aBC', 'Solutions Resource', 'PREMIUM A SAMPLE', 'www.solutionsresource.com', '(002) 268-8215', '(+63923)(659-5322)', '', 'info@solutionsresource.com', '', '', '', '', '2014-11-10 22:54:26', 'admin', '2014-11-10 22:54:26', 'admin'),
(47, 1, 'WAL', 'Walmart', 'REGULAR SPECIAL SAMPLE', 'walmart.com', '(917) 888-7777', '(+632)(123-4567)', '(632) 987-6543', 'wal@email.com', '123456', '01-234567', 'Filed', 'Filed', '2014-11-13 19:05:35', 'admin', '2014-11-13 19:05:49', 'admin'),
(48, 1, 'CSC', 'Khin Kaiser', 'PREMIUM A', 'knarceo@yahoo.com', '(325) 434-5626', '(+63905)(640-3077)', '(344) 343-5345', 'kaiser50124@yahoo.com', '34532253', '56-456745', '345346524', '455345245', '2014-12-04 09:20:43', 'admin', '2014-12-10 02:35:17', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `documentId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `documentName` varchar(50) NOT NULL,
  `documentType` varchar(45) DEFAULT NULL,
  `referenceId` int(11) DEFAULT NULL,
  `referenceTable` varchar(50) DEFAULT NULL,
  `orderNumber` varchar(10) DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `documentStatus` varchar(45) DEFAULT NULL,
  `documentProcessed` int(11) DEFAULT NULL,
  `referenceNumber` varchar(45) DEFAULT NULL,
  `outboundStage` int(11) DEFAULT NULL,
  `inboundStage` int(11) DEFAULT NULL,
  `finalOutboundStage` int(11) DEFAULT NULL,
  `finalInboundStage` int(11) DEFAULT NULL,
  `completeStage` int(11) DEFAULT NULL,
  `archiveStage` int(11) DEFAULT NULL,
  `billingStage` int(11) DEFAULT NULL,
  `inboundReturned` datetime DEFAULT NULL,
  `finalOutboundSent` datetime DEFAULT NULL,
  `finalInboundReturned` datetime DEFAULT NULL,
  `finalOutboundLbc` varchar(15) DEFAULT NULL,
  `finalInboundReceivedBy` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `documentComments` varchar(100) DEFAULT NULL,
  `vendorCode` varchar(45) DEFAULT NULL,
  `orderItemId` int(11) DEFAULT NULL,
  `aging` int(11) DEFAULT NULL,
  PRIMARY KEY (`documentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`documentId`, `clientId`, `documentName`, `documentType`, `referenceId`, `referenceTable`, `orderNumber`, `createdDate`, `documentStatus`, `documentProcessed`, `referenceNumber`, `outboundStage`, `inboundStage`, `finalOutboundStage`, `finalInboundStage`, `completeStage`, `archiveStage`, `billingStage`, `inboundReturned`, `finalOutboundSent`, `finalInboundReturned`, `finalOutboundLbc`, `finalInboundReceivedBy`, `createdBy`, `documentComments`, `vendorCode`, `orderItemId`, `aging`) VALUES
(39, 1, 'BOOKING REQUEST FORM', NULL, 6, 'ORDERS', 'WAL-0000', '2014-11-27 08:34:44', 'PRINTED', 1, 'WAL-0000', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(40, 1, 'HOUSE BILL OF LADING', NULL, 6, 'ORDERS', 'WAL-0000', '2014-11-27 08:34:44', 'FOR REFERENCE', 0, 'WAL-0000', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(41, 1, 'HOUSE WAYBILL DESTINATION', NULL, 6, 'ORDERS', 'WAL-0000', '2014-11-27 08:44:58', 'FOR PRINTING', 2, 'WAL-0000', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CCC', NULL, NULL),
(42, 1, 'PROFORMA BILL OF LADING', NULL, 6, 'ORDERS', 'WAL-0000', '2014-11-27 08:49:27', 'INPUT REFERENCE NUMBER', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AAA', NULL, NULL),
(44, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 8, 'CONTAINERS', NULL, '2014-11-27 11:34:40', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ernest Shipping Corporation', NULL, NULL),
(45, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 10, 'CONTAINERS', NULL, '2014-11-27 16:08:22', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(46, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 11, 'CONTAINERS', NULL, '2014-11-27 16:11:37', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(47, 1, 'HOUSE WAYBILL ORIGIN', NULL, 6, 'ORDERS', 'WAL-0000', '2014-11-27 16:22:55', 'FOR PRINTING', 0, 'WAL-0000', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TTT', NULL, NULL),
(48, 1, 'BOOKING REQUEST FORM', NULL, 7, 'ORDERS', 'WAL-0001', '2014-11-27 16:23:57', 'RECEIVED WITH SIGNATURE', 2, 'WAL-0001', 1, 1, NULL, NULL, NULL, NULL, NULL, '2014-12-03 00:00:00', NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(50, 1, 'PROFORMA BILL OF LADING', NULL, 7, 'ORDERS', 'WAL-0001', '2014-12-02 10:33:27', 'ENTERED REFERENCE NUMBER', 1, 'wwwww43534545', 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL),
(51, 1, 'HOUSE WAYBILL DESTINATION', NULL, 7, 'ORDERS', 'WAL-0001', '2014-11-27 16:26:49', 'FOR PRINTING', 2, 'WAL-0001', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TTT', NULL, NULL),
(52, 1, 'MASTER BILL OF LADING', NULL, 7, 'ORDERS', 'WAL-0001', '2014-12-04 10:18:41', 'DOCUMENT UPDATED!', 1, 'XDK-791', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2014-12-03 00:00:00', NULL, NULL, NULL, NULL, 'admin', '', NULL, NULL, NULL),
(53, 1, 'SALES INVOICE', NULL, 7, 'ORDERS', 'WAL-0001', '2014-12-04 10:20:05', 'DOCUMENT UPDATED!', 1, 'FR-300', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2014-12-03 00:00:00', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL),
(54, 1, 'SALES INVOICE', NULL, 7, 'ORDERS', 'WAL-0001', '2014-12-04 10:21:11', 'DOCUMENT UPDATED!', 1, 'dfjasdfhds2342', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2014-12-03 00:00:00', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL),
(55, 1, 'SALES INVOICE', NULL, 7, 'ORDERS', 'WAL-0001', '2014-12-02 10:34:00', 'PENDING', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2014-12-03 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 1, 'BOOKING REQUEST FORM', NULL, 8, 'ORDERS', 'WAL-0002', '2014-12-02 11:13:32', 'FOR PRINTING', 0, 'WAL-0002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(57, 1, 'HOUSE BILL OF LADING', NULL, 8, 'ORDERS', 'WAL-0002', '2014-12-02 11:13:32', 'FOR REFERENCE', 0, 'WAL-0002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(58, 1, 'BOOKING REQUEST FORM', NULL, 9, 'ORDERS', 'WAL-0002', '2014-12-02 11:14:38', 'FOR PRINTING', 0, 'WAL-0002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(59, 1, 'HOUSE BILL OF LADING', NULL, 9, 'ORDERS', 'WAL-0002', '2014-12-02 11:14:38', 'FOR REFERENCE', 0, 'WAL-0002', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(60, 1, 'BOOKING REQUEST FORM', NULL, 10, 'ORDERS', 'WAL-0003', '2014-12-02 11:22:20', 'FOR PRINTING', 0, 'WAL-0003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(61, 1, 'HOUSE BILL OF LADING', NULL, 10, 'ORDERS', 'WAL-0003', '2014-12-02 11:22:20', 'FOR REFERENCE', 0, 'WAL-0003', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL),
(62, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 12, 'CONTAINERS', NULL, '2014-12-04 10:52:10', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(63, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 13, 'CONTAINERS', NULL, '2014-12-04 11:06:46', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(65, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 15, 'CONTAINERS', NULL, '2014-12-04 12:12:19', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(66, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 16, 'CONTAINERS', NULL, '2014-12-04 12:12:57', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(67, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 17, 'CONTAINERS', NULL, '2014-12-04 12:14:24', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(68, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 18, 'CONTAINERS', NULL, '2014-12-04 12:14:51', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(69, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 19, 'CONTAINERS', NULL, '2014-12-04 12:15:32', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(70, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 20, 'CONTAINERS', NULL, '2014-12-04 12:16:09', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(71, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 21, 'CONTAINERS', NULL, '2014-12-04 12:17:28', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(72, 1, 'BOOKING REQUEST FORM', NULL, 10, 'ORDERS', 'WAL-0003', '2014-12-04 12:21:07', 'FOR PRINTING', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(73, 1, 'HOUSE BILL OF LADING', NULL, 10, 'ORDERS', 'WAL-0003', '2014-12-04 12:21:07', 'FOR REFERENCE', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(74, 1, 'EQUIPMENT INTERCHANGE RECEIPT 1', NULL, 22, 'CONTAINERS', NULL, '2014-12-04 14:05:54', 'FOR PRINTING', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2GO', NULL, NULL),
(75, 1, 'BOOKING REQUEST FORM', NULL, 11, 'ORDERS', 'WAL-0004', '2014-12-04 17:11:11', 'FOR PRINTING', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(76, 1, 'HOUSE BILL OF LADING', NULL, 11, 'ORDERS', 'WAL-0004', '2014-12-04 17:11:11', 'FOR REFERENCE', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(77, 1, 'BOOKING REQUEST FORM', NULL, 12, 'ORDERS', 'WAL-0004', '2014-12-04 17:12:56', 'FOR PRINTING', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(78, 1, 'HOUSE BILL OF LADING', NULL, 12, 'ORDERS', 'WAL-0004', '2014-12-04 17:12:56', 'FOR REFERENCE', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(79, 1, 'BOOKING REQUEST FORM', NULL, 13, 'ORDERS', 'WAL-0005', '2014-12-05 14:33:54', 'FOR PRINTING', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL),
(80, 1, 'HOUSE BILL OF LADING', NULL, 13, 'ORDERS', 'WAL-0005', '2014-12-05 14:33:54', 'FOR REFERENCE', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, 'ELC', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

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
  `createdBy` varchar(25) DEFAULT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`driverId`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driverId`, `clientId`, `vendorId`, `driverCode`, `licenseNumber`, `firstName`, `middleName`, `lastName`, `title`, `status`, `dateHired`, `dateTerminated`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 2, NULL, '352-46-2725235', 'Leonardo', '', 'Marchiano', 'Mr', 'ACTIVE', '2014-11-17', NULL, '2014-11-17 09:20:23', 'admin', '2014-11-17 09:20:23', 'admin'),
(2, 1, 3, NULL, '573-57-3735357', 'Turles', '', 'Donatello', 'Mr.', 'ACTIVE', '2014-11-17', NULL, '2014-11-17 09:23:19', 'admin', '2014-11-17 09:23:19', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `groupId` bigint(20) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(50) NOT NULL,
  `CLIENTID` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `UK_oy92ak6u4rmbq75jgb14npht7` (`name`),
  KEY `FK_macyd219b60yqhb7oo4u2ihg0` (`CLIENTID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`groupId`, `creationDate`, `description`, `modifiedDate`, `name`, `CLIENTID`, `code`) VALUES
(1, NULL, '', NULL, 'Operations', 1, 'OPS'),
(2, NULL, '', NULL, 'Admin', 1, 'ADM'),
(3, '2014-06-04 05:17:14', NULL, '2014-06-04 05:17:14', 'CRD', 1, 'CRD'),
(4, '2014-06-04 05:17:15', NULL, '2014-06-04 05:17:15', 'Planning', 1, 'PLN'),
(5, NULL, '', NULL, 'Customer', 1, 'CUS'),
(6, NULL, 'Solution Resoource Incorporated', NULL, 'Solutions Resource', 1, 'SRI');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE IF NOT EXISTS `group_user` (
  `groupUserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `clientId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupUserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`groupUserId`, `clientId`, `groupId`, `userId`) VALUES
(13, 1, 2, 17),
(14, 1, 2, 9),
(15, 1, 5, 10),
(16, 1, 5, 11),
(17, 1, 5, 14),
(20, 1, 1, 13),
(21, 1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `notificationId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `notificationType` varchar(45) NOT NULL,
  `referenceId` int(11) DEFAULT NULL,
  `referenceTable` varchar(45) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notificationId`, `description`, `notificationType`, `referenceId`, `referenceTable`, `userId`) VALUES
(5, 'BOOKING', 'Email', 1, 'Order', 1),
(6, 'BOOKING', 'Email', 1, 'Order', 1),
(7, 'BOOKING', 'Email', 1, 'Order', 1),
(8, 'BOOKING', 'Email', 1, 'Order', 1),
(9, 'BOOKING', 'Email', 1, 'Order', 1),
(10, 'BOOKING', 'Email', 1, 'Order', 1),
(11, 'BOOKING', 'Email', 1, 'Order', 1),
(12, 'BOOKING', 'Email', 1, 'Order', 1),
(13, 'BOOKING', 'Email', 1, 'Order', 1),
(14, 'BOOKING', 'Email', 1, 'Order', 1),
(15, 'CUSTOMER', 'Email', 1, 'Customer', 1),
(16, 'BOOKING', 'Email', 1, 'Order', 1),
(17, 'CONTAINER', 'Email', 1, 'Container', 1),
(18, 'SHIPMENT_LOGS', 'Email', 1, 'Shipment Logs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE IF NOT EXISTS `orderitems` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `classification` varchar(10) DEFAULT NULL,
  `commodity` varchar(100) DEFAULT NULL,
  `declaredValue` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `createdTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  `rate` float NOT NULL,
  `nameSize` varchar(45) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `vesselScheduleId` varchar(25) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `finalDeliveryDate` date DEFAULT NULL,
  `driverOrigin` varchar(45) DEFAULT NULL,
  `driverDestination` varchar(45) DEFAULT NULL,
  `truckOrigin` varchar(45) DEFAULT NULL,
  `truckDestination` varchar(45) DEFAULT NULL,
  `finalPickupDate` date DEFAULT NULL,
  `vendorDestination` varchar(45) DEFAULT NULL,
  `vendorOrigin` varchar(45) DEFAULT NULL,
  `vendorSea` varchar(45) DEFAULT NULL,
  `vesselName` varchar(45) DEFAULT NULL,
  `containerId` int(11) DEFAULT NULL,
  `serviceRequirement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `clientId` (`clientId`,`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`orderItemId`, `clientId`, `orderId`, `quantity`, `classification`, `commodity`, `declaredValue`, `weight`, `comments`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `rate`, `nameSize`, `status`, `vesselScheduleId`, `volume`, `finalDeliveryDate`, `driverOrigin`, `driverDestination`, `truckOrigin`, `truckDestination`, `finalPickupDate`, `vendorDestination`, `vendorOrigin`, `vendorSea`, `vesselName`, `containerId`, `serviceRequirement`) VALUES
(7, 1, 6, 1, '', 'cigarettes', 5789.56, 18, '', NULL, 'admin', NULL, 'admin', 746.44, '20 FOOTER', 'ON GOING', '2GO-111', 36, '2014-11-28', 'Leonardo Marchiano', 'Turles Donatello', '5357357357', '3457358357', '2014-11-28', 'CCC', 'TTT', 'AAA', NULL, NULL, NULL),
(9, 1, 7, 2, '', 'TESTING', 934934, 6868, '', '2014-12-01 18:50:00', 'admin', NULL, 'admin', 55.75, 'SGJSDGJ', 'ON GOING', '2GO-111', 42, '2014-11-27', NULL, 'Leonardo Marchiano', NULL, '5357357357', NULL, 'TTT', NULL, 'AAA', NULL, NULL, NULL),
(11, 1, 9, 2, NULL, 'goods', 600, 20, 'frfrsfgs', '2014-12-02 03:15:52', 'admin', '2014-12-02 03:15:52', 'admin', 600, 'Good boy', 'PLANNING 1', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 'LESS CONTAINER LOAD'),
(12, 1, 9, 1, NULL, 'TESTING', 467467, 755, '', '2014-12-02 03:16:48', 'admin', '2014-12-12 02:05:39', 'admin', 465.47, 'SGJSDGJ', 'PLANNING 1', NULL, 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LESS CONTAINER LOAD'),
(13, 1, 10, 2, NULL, 'Stern Goods', 150, 30, '', '2014-12-04 04:22:07', 'admin', '2014-12-12 01:51:26', 'admin', 150, '20 FOOTER', 'PLANNING 2', '2GO-111', 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AAA', NULL, NULL, 'FULL CONTAINER LOAD'),
(14, 1, 12, 1, NULL, '', 25.55, 24, '', '2014-12-04 09:13:16', 'admin', '2014-12-12 02:27:51', 'admin', 25.55, '10 FOOTER', 'PLANNING 1', NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FULL CONTAINER LOAD'),
(15, 1, 13, 1, NULL, 'Devon Goods', 320, 57, 'Fragile', '2014-12-05 06:34:27', 'admin', '2014-12-12 02:27:51', 'admin', 320, '10 FOOTER', 'PLANNING 1', NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FULL CONTAINER LOAD');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `orderNumber` varchar(10) NOT NULL,
  `serviceType` varchar(25) NOT NULL,
  `serviceMode` varchar(25) NOT NULL,
  `notificationType` varchar(30) NOT NULL,
  `orderDate` date NOT NULL,
  `paymentMode` varchar(30) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `orderStatus` varchar(25) NOT NULL,
  `vendorCode` varchar(10) DEFAULT NULL,
  `truckCode` varchar(10) DEFAULT NULL,
  `trailerCode` varchar(10) DEFAULT NULL,
  `driverCode` varchar(10) DEFAULT NULL,
  `vesselNumber` varchar(50) DEFAULT NULL,
  `shipperCode` varchar(10) DEFAULT NULL,
  `shipperAddressId` int(11) DEFAULT NULL,
  `shipperContactId` int(11) NOT NULL,
  `consigneeCode` varchar(10) DEFAULT NULL,
  `consigneeAddressId` int(11) DEFAULT NULL,
  `consigneeContactId` int(11) DEFAULT NULL,
  `accountRep` varchar(25) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  `pickupDate` date DEFAULT NULL,
  `originationPort` varchar(25) DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `destinationPort` varchar(25) DEFAULT NULL,
  `rates` float DEFAULT NULL,
  `serviceRequirement` varchar(25) DEFAULT NULL,
  `deliveryTime` time DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `consigneeContactPersonId` int(11) DEFAULT NULL,
  `aging` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderNumber` (`orderNumber`),
  KEY `clientId` (`clientId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `clientId`, `orderNumber`, `serviceType`, `serviceMode`, `notificationType`, `orderDate`, `paymentMode`, `comments`, `orderStatus`, `vendorCode`, `truckCode`, `trailerCode`, `driverCode`, `vesselNumber`, `shipperCode`, `shipperAddressId`, `shipperContactId`, `consigneeCode`, `consigneeAddressId`, `consigneeContactId`, `accountRep`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `pickupDate`, `originationPort`, `deliveryDate`, `destinationPort`, `rates`, `serviceRequirement`, `deliveryTime`, `customerId`, `consigneeContactPersonId`, `aging`) VALUES
(6, 1, 'WAL-0000', 'SHIPPING AND TRUCKING', 'DOOR TO DOOR', 'PHONE, MOBILE', '2014-12-10', 'FREIGHT PREPAID', 'EMERGENCY', 'ON GOING', NULL, NULL, NULL, NULL, NULL, NULL, 111, 1, NULL, 113, 2, 'admin', '2014-12-10 04:00:16', 'admin', '2014-12-10 04:00:16', 'admin', '2014-11-28', 'MANILA', '2014-11-29', 'BACOLOD', 0, 'FULL CONTAINER LOAD', NULL, 47, 3, NULL),
(7, 1, 'WAL-0001', 'SHIPPING AND TRUCKING', 'PIER TO DOOR', 'MOBILE', '2014-12-12', 'FREIGHT COLLECT', 'eszgf', 'ON GOING', NULL, NULL, NULL, NULL, NULL, NULL, 111, 1, NULL, 113, 2, 'admin', '2014-12-12 03:14:40', 'admin', '2014-12-12 03:14:40', 'admin', '2014-11-28', 'BACOLOD', '2014-11-28', 'BUTUAN', 0, 'LESS CONTAINER LOAD', NULL, 47, 3, NULL),
(9, 1, 'WAL-0002', 'SHIPPING AND TRUCKING', 'DOOR TO DOOR', 'E-MAIL', '2014-12-02', 'FREIGHT PREPAID', '', 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, 111, 1, NULL, 113, 2, 'admin', '2014-12-02 03:14:38', 'admin', '2014-12-02 03:14:38', 'admin', '2014-12-02', 'MANILA', '2014-12-03', 'CEBU', 0, 'LESS CONTAINER LOAD', NULL, 47, 3, NULL),
(10, 1, 'WAL-0003', 'SHIPPING AND TRUCKING', 'DOOR TO DOOR', 'E-MAIL', '2014-12-04', 'FREIGHT PREPAID', '', 'ON GOING', NULL, NULL, NULL, NULL, NULL, NULL, 111, 1, NULL, 113, 2, 'admin', '2014-12-04 04:21:06', 'admin', '2014-12-04 04:21:06', 'admin', '2014-12-04', 'CEBU', '2014-12-05', 'ZAMBOANGA', 0, 'FULL CONTAINER LOAD', NULL, 47, 3, NULL),
(12, 1, 'WAL-0004', 'SHIPPING AND TRUCKING', 'DOOR TO DOOR', 'E-MAIL', '2014-12-05', 'FREIGHT PREPAID', '', 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, 111, 1, NULL, 113, 2, 'admin', '2014-12-05 05:24:22', 'admin', '2014-12-05 05:24:22', 'admin', '2014-12-04', 'ZAMBOANGA', '2014-12-05', 'COTABATO', 0, 'FULL CONTAINER LOAD', NULL, 47, 3, NULL),
(13, 1, 'WAL-0005', 'SHIPPING AND TRUCKING', 'DOOR TO DOOR', 'E-MAIL', '2014-12-05', 'FREIGHT PREPAID', '', 'APPROVED', NULL, NULL, NULL, NULL, NULL, NULL, 111, 1, NULL, 113, 2, 'admin', '2014-12-05 06:33:54', 'admin', '2014-12-05 06:33:54', 'admin', '2014-12-05', 'BUTUAN', '2014-12-06', 'DUMAGUETE', 0, 'FULL CONTAINER LOAD', NULL, 47, 3, NULL),
(15, 1, 'CSC-0000', 'SHIPPING AND TRUCKING', 'DOOR TO DOOR', 'E-MAIL', '2014-12-12', 'FREIGHT PREPAID', '', 'INCOMPLETE', NULL, NULL, NULL, NULL, NULL, NULL, 116, 8, NULL, 117, 7, 'admin', '2014-12-12 03:12:38', 'admin', '2014-12-12 03:12:38', 'admin', '2014-12-12', 'ILIGAN', '2014-12-13', 'ILOILO', 0, 'FULL CONTAINER LOAD', NULL, 48, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orderstatuslogs`
--

CREATE TABLE IF NOT EXISTS `orderstatuslogs` (
  `statusId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `orderItemId` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `createdBy` varchar(25) DEFAULT NULL,
  `createdTimestamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deliveryDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pickupDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `departureTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `arrivalTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`statusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parameters`
--

CREATE TABLE IF NOT EXISTS `parameters` (
  `parameterId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `referenceTable` varchar(50) NOT NULL,
  `referenceColumn` varchar(50) NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `createdTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`parameterId`),
  KEY `clientId` (`clientId`),
  KEY `referenceTable` (`referenceTable`),
  KEY `referenceColumn` (`referenceColumn`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=295 ;

--
-- Dumping data for table `parameters`
--

INSERT INTO `parameters` (`parameterId`, `clientId`, `referenceTable`, `referenceColumn`, `key`, `value`, `label`, `notes`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 'USER', 'STATUS', 'ACTIVE', 'Active', 'Active', NULL, '2014-05-10 00:19:28', 'admin', '2014-05-10 00:20:50', 'admin'),
(2, 1, 'USER', 'STATUS', 'INACTIVE', 'Inactive', 'Inactive', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-10 01:30:44', 'admin'),
(3, 1, 'USER', 'USER_TYPE', 'ADMIN', 'Admin', 'Admin', NULL, '2014-05-10 01:30:44', 'admin', '2014-09-26 13:55:21', 'admin'),
(10, 1, 'USER', 'USER_TYPE', 'CUSTOMER RELATIONS DEPARTMENT', 'Customer Relations Department', 'Customer Relations Department', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-13 06:20:33', 'admin'),
(11, 1, 'USER', 'USER_TYPE', 'FREIGHT OPERATIONS OFFICER', 'Freight Operations Officer', 'Freight Operations Officer', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-13 06:20:33', 'admin'),
(12, 1, 'USER', 'USER_TYPE', 'FREIGHT OPERATIONS SPECIALIST', 'Freight Operations Specialist', 'Freight Operations Specialist', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-13 06:20:33', 'admin'),
(13, 1, 'USER', 'USER_TYPE', 'FREIGHT OPERATIONS MANAGER', 'Freight Operations Manager', 'Freight Operations Manager', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-13 06:20:33', 'admin'),
(14, 1, 'USER', 'USER_TYPE', 'FREIGHT DOCUMENTS SPECIALIST', 'Freight Documents Specialist', 'Freight Documents Specialist', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-13 06:20:33', 'admin'),
(15, 1, 'USER', 'USER_TYPE', 'INLAND FREIGHT OFFICER', 'Inland Freight Officer', 'Inland Freight Officer', NULL, '2014-05-10 01:30:44', 'admin', '2014-05-13 06:20:33', 'admin'),
(16, 1, 'ORDER', 'MODE OF SERVICE', 'DOOR TO DOOR', 'Door to Door', 'Door to Door', NULL, '2014-06-06 06:51:35', 'admin', '2014-06-06 06:51:35', NULL),
(17, 1, 'ORDER', 'MODE OF SERVICE', 'DOOR TO PIER', 'Door to Pier', 'Door to Pier', NULL, '2014-06-06 06:51:36', 'admin', '2014-06-06 06:51:36', NULL),
(18, 1, 'ORDER', 'MODE OF SERVICE', 'PIER TO DOOR', 'Pier to Door', 'Pier to Door', NULL, '2014-06-06 06:51:36', 'admin', '2014-06-06 06:51:36', NULL),
(19, 1, 'ORDER', 'MODE OF SERVICE', 'PIER TO PIER', 'Pier to Pier', 'Pier to Pier', NULL, '2014-06-06 06:51:36', 'admin', '2014-06-06 06:51:36', NULL),
(20, 1, 'ORDER', 'MODE OF PAYMENT', 'FREIGHT PREPAID', 'Freight Prepaid', 'Freight Prepaid', NULL, '2014-06-06 06:51:36', 'admin', '2014-06-06 06:51:36', NULL),
(21, 1, 'ORDER', 'MODE OF PAYMENT', 'FREIGHT COLLECT', 'Freight Collect', 'Freight Collect', NULL, '2014-06-06 06:51:36', 'admin', '2014-06-06 06:51:36', NULL),
(22, 1, 'ORDER', 'MODE OF PAYMENT', 'ACCOUNT ORIGIN', 'Account Origin', 'Account Origin', NULL, '2014-06-06 06:51:36', 'admin', '2014-06-06 06:51:36', NULL),
(23, 1, 'ORDER', 'MODE OF PAYMENT', 'ACCOUNT DESTINATION', 'Account Destination', 'Account Destination', NULL, '2014-06-06 06:51:37', 'admin', '2014-06-06 06:51:37', NULL),
(24, 1, 'ORDER', 'NOTIFY BY', 'PHONE', 'Phone', 'Phone', NULL, '2014-06-06 06:51:37', 'admin', '2014-06-06 06:51:37', NULL),
(25, 1, 'ORDER', 'NOTIFY BY', 'MOBILE', 'Mobile', 'Mobile', NULL, '2014-06-06 06:51:37', 'admin', '2014-06-06 06:51:37', NULL),
(26, 1, 'ORDER', 'NOTIFY BY', 'SMS', 'SMS', 'SMS', NULL, '2014-06-06 06:51:37', 'admin', '2014-06-06 06:51:37', NULL),
(27, 1, 'ORDER', 'NOTIFY BY', 'FAX', 'Fax', 'Fax', NULL, '2014-06-06 06:51:37', 'admin', '2014-06-06 06:51:37', NULL),
(28, 1, 'ORDER', 'SERVICE REQUIREMENT', 'FULL CONTAINER LOAD', 'Full Container Load', 'Full Container Load', NULL, '2014-06-06 06:51:37', 'admin', '2014-10-21 11:15:54', NULL),
(29, 1, 'ORDER', 'SERVICE REQUIREMENT', 'LESS CONTAINER LOAD', 'Less Container Load', 'Less Container Load', NULL, '2014-06-06 06:51:38', 'admin', '2014-10-21 11:15:55', NULL),
(30, 1, 'ORDER', 'SERVICE REQUIREMENT', 'LOOSE CARGO LOAD', 'Loose Cargo Load', 'Loose Cargo Load', NULL, '2014-06-06 06:51:38', 'admin', '2014-11-03 10:35:29', NULL),
(31, 1, 'ORDER', 'SERVICE REQUIREMENT', 'ROLLING CARGO LOAD', 'Rolling Cargo Load', 'Rolling Cargo Load', NULL, '2014-06-06 06:51:38', 'admin', '2014-11-03 10:35:29', NULL),
(32, 1, 'ORDER', 'FREIGHT TYPE', 'SHIPPING AND TRUCKING', 'Shipping and Trucking', 'Shipping and Trucking', NULL, '2014-06-10 07:14:38', 'admin', '2014-08-13 17:41:38', NULL),
(33, 1, 'ORDER', 'FREIGHT TYPE', 'TRUCKING', 'Trucking', 'Trucking', NULL, '2014-06-10 07:14:38', 'admin', '2014-08-13 17:41:39', NULL),
(35, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Main', 'Main', 'Main', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:06:31', 'admin'),
(36, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Branch1', 'Branch 1', 'Branch 1', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:06:31', 'admin'),
(37, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Branch2', 'Branch 2', 'Branch 2', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:06:31', 'admin'),
(38, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Branch3', 'Branch 3', 'Branch 3', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:06:31', 'admin'),
(39, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Branch4', 'Branch 4', 'Branch 4', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:06:31', 'admin'),
(40, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Branch5', 'Branch 5', 'Branch 5', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:06:32', 'admin'),
(41, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Annex1', 'Annex 1', 'Annex 1', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:07:02', 'admin'),
(42, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Annex2', 'Annex 2', 'Annex 2', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:07:02', 'admin'),
(43, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Annex3', 'Annex 3', 'Annex 3', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:07:02', 'admin'),
(44, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Annex4', 'Annex 4', 'Annex 4', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:07:03', 'admin'),
(45, 1, 'ADDRESS', 'ADDRESS_TYPE', 'Annex5', 'Annex 5', 'Annex 5', '', '2014-06-02 15:23:21', 'admin', '2014-09-24 17:07:03', 'admin'),
(47, 1, 'VENDORS', 'VENDOR_TYPE', 'TRUCKING', 'Trucking', 'Trucking', '', '2014-05-28 15:04:35', 'admin', '2014-08-21 04:27:47', 'admin'),
(48, 1, 'VENDORS', 'VENDOR_TYPE', 'SHIPPING', 'Shipping', 'Shipping', '', '2014-05-28 15:04:35', 'admin', '2014-08-21 04:27:48', 'admin'),
(49, 1, 'TRUCKS', 'TRUCK_TYPE', 'TRACTOR HEAD', 'Tractor Head', 'Tractor Head', '', '2014-05-29 17:48:36', 'admin', '2014-05-29 17:48:36', 'admin'),
(50, 1, 'TRUCKS', 'TRUCK_TYPE', 'CLOSED VAN', 'Closed Van', 'Closed Van', '', '2014-05-29 17:48:36', 'admin', '2014-05-29 17:48:36', 'admin'),
(51, 1, 'VENDORS', 'VENDOR_SEARCH', 'COMPANY NAME', 'Company Name', 'Company Name', '', '2014-05-30 11:30:24', 'admin', '2014-08-21 04:27:48', 'admin'),
(52, 1, 'VENDORS', 'VENDOR_SEARCH', 'COMPANY CODE', 'Company Code', 'Company Code', '', '2014-05-30 11:30:24', 'admin', '2014-08-21 04:27:48', 'admin'),
(53, 1, 'VENDORS', 'VENDOR_SEARCH', 'VENDOR TYPE', 'Vendor Type', 'Vendor Type', '', '2014-05-30 11:30:24', 'admin', '2014-08-21 04:27:48', 'admin'),
(56, 1, 'VENDORS', 'VENDOR_SEARCH', 'CLASS', 'Class', 'Class', '', '2014-05-30 11:30:24', 'admin', '2014-08-21 04:27:49', 'admin'),
(58, 1, 'VENDORS', 'VENDOR_CLASS', 'PREMIUM', 'Premium', 'Premium', '', '2014-06-03 10:58:41', 'admin', '2014-08-21 04:27:49', 'admin'),
(59, 1, 'VENDORS', 'VENDOR_CLASS', 'CLASS A', 'Class A', 'Class A', '', '2014-06-03 10:58:41', 'admin', '2014-08-21 04:27:50', 'admin'),
(60, 1, 'VENDORS', 'VENDOR_CLASS', 'CLASS B', 'Class B', 'Class B', '', '2014-06-03 10:58:41', 'admin', '2014-08-21 04:27:50', 'admin'),
(61, 1, 'VENDORS', 'VENDOR_CLASS', 'CLASS C', 'Class C', 'Class C', '', '2014-06-03 10:58:41', 'admin', '2014-08-21 04:27:50', 'admin'),
(62, 1, 'VENDORS', 'VENDOR_CLASS', 'ECONOMY', 'Economy', 'Economy', '', '2014-06-03 10:58:41', 'admin', '2014-08-21 04:27:50', 'admin'),
(63, 1, 'VENDORS', 'VENDOR_SEARCH', 'STATUS', 'Status', 'Status', NULL, '2014-06-11 05:58:18', 'admin', '2014-08-21 04:27:50', NULL),
(64, 1, 'CUSTOMERS', 'CUSTOMER_TYPE', 'PREMIUM A', 'Premium A', 'Customer Type', '', '2014-05-30 11:30:24', 'admin', '2014-10-31 12:45:58', 'admin'),
(65, 1, 'CUSTOMERS', 'CUSTOMER_TYPE', 'REGULAR SPECIAL', 'Regular Special', 'Customer Type', '', '2014-05-30 11:30:24', 'admin', '2014-09-22 10:31:49', 'admin'),
(66, 1, 'CUSTOMERS', 'CUSTOMER_TYPE', 'ECONOMY A', 'Economy A', 'Customer Type', '', '2014-05-30 11:30:24', 'admin', '2014-10-31 12:45:58', 'admin'),
(68, 1, 'CUSTOMERS', 'CUSTOMER_SEARCH', 'customerName', 'Customer Name', 'Customer Name', NULL, '2014-06-13 07:28:13', 'admin', '2014-08-21 04:27:47', NULL),
(69, 1, 'CUSTOMERS', 'CUSTOMER_SEARCH', 'customerType', 'Customer Type', 'Customer Type', NULL, '2014-06-13 07:29:05', 'admin', '2014-08-21 04:27:47', NULL),
(70, 1, 'CUSTOMERS', 'CUSTOMER_SEARCH', 'customerId', 'Customer Id', 'Customer Id', NULL, '2014-06-13 07:30:45', 'admin', '2014-08-21 04:27:47', NULL),
(71, 1, 'CUSTOMERS', 'CUSTOMER_SEARCH', 'email', 'Email', 'Email', NULL, '2014-06-13 07:31:23', 'admin', '2014-08-21 04:27:47', NULL),
(72, 1, 'CONTACTS', 'CONTACT_TYPE', 'shipper', 'Shipper', 'Shipper', NULL, '2014-06-13 07:31:23', 'admin', '2014-08-21 04:27:55', NULL),
(73, 1, 'CONTACTS', 'CONTACT_TYPE', 'billTo', 'Bill To', 'Bill To', NULL, '2014-06-13 07:31:23', 'admin', '2014-08-21 04:27:55', NULL),
(74, 1, 'CONTACTS', 'CONTACT_TYPE', 'solicitor', 'Solicitor', 'Solicitor', NULL, '2014-06-13 07:31:23', 'admin', '2014-08-21 04:27:55', NULL),
(76, 1, 'USER', 'SEARCH_CRITERIA', 'USER TYPE', 'User Type', 'User Type', NULL, '2014-06-02 23:02:44', 'Juno', '2014-06-04 22:43:52', NULL),
(77, 1, 'USER', 'SEARCH_CRITERIA ', 'NAME', 'Name', 'Name', NULL, '2014-06-02 23:02:44', 'Juno', '2014-06-04 22:43:52', NULL),
(78, 1, 'USER', 'SEARCH_CRITERIA', 'USER NAME', 'User Name', 'User Name', NULL, '2014-06-02 23:02:44', 'Juno', '2014-06-04 22:43:52', NULL),
(79, 1, 'ORDER', 'ORDER_SEARCH', 'BOOKING NUMBER', 'Booking Number', 'Booking Number', NULL, '2014-07-03 04:06:08', 'admin', '2014-07-03 04:06:08', NULL),
(80, 1, 'ORDER', 'ORDER_SEARCH', 'SHIPPER NAME', 'Shipper Name', 'Shipper Name', NULL, '2014-07-03 04:06:09', 'admin', '2014-12-11 14:04:27', NULL),
(81, 1, 'ORDER', 'ORDER_SEARCH', 'CONSIGNEE NAME', 'Consignee Name', 'Consignee Name', NULL, '2014-07-03 04:06:10', 'admin', '2014-12-11 14:04:28', NULL),
(82, 1, 'ORDER', 'ORDER_SEARCH', 'SERVICE MODE', 'Service Mode', 'Service Mode', NULL, '2014-07-03 04:06:11', 'admin', '2014-12-11 14:04:28', NULL),
(83, 1, 'ORDER', 'ORDER_SEARCH', 'SERVICE TYPE', 'Service Type', 'Service Type', NULL, '2014-07-03 04:06:11', 'admin', '2014-12-11 14:04:28', NULL),
(84, 1, 'ORDER', 'ORDER_SEARCH', 'STATUS', 'Status', 'Status', NULL, '2014-07-03 04:06:12', 'admin', '2014-12-11 14:04:28', NULL),
(85, 1, 'VESSELSCHEDULES', 'VESSEL_SCHEDULE_SEARCH', 'ESTIMATED DATE OF DEPARTURE', 'Estimated Date of Departure', 'Estimated Date of Departure', '', '2014-07-23 11:39:12', 'admin', '2014-08-21 04:27:54', ''),
(86, 1, 'VESSELSCHEDULES', 'VESSEL_SCHEDULE_SEARCH', 'PIER ORIGIN', 'Pier Origin', 'Pier Origin', '', '2014-07-23 11:39:12', 'admin', '2014-08-21 04:27:54', ''),
(87, 1, 'VESSELSCHEDULES', 'VESSEL_SCHEDULE_SEARCH', 'VOYAGE NUMBER', 'Voyage Number', 'Voyage Number', '', '2014-07-23 11:39:12', 'admin', '2014-08-21 04:27:54', ''),
(88, 1, 'VESSELSCHEDULES', 'VESSEL_SCHEDULE_SEARCH', 'ESTIMATED DATE OF ARRIVAL', 'Estimated Date of Arrival', 'Estimated Date of Arrival', '', '2014-07-23 11:39:12', 'admin', '2014-08-21 04:27:54', ''),
(89, 1, 'VESSELSCHEDULES', 'VESSEL_SCHEDULE_SEARCH', 'PIER DESTINATION', 'Pier Destination', 'Pier Destination', '', '2014-07-23 11:39:12', 'admin', '2014-08-21 04:27:55', ''),
(90, 1, 'ORDER', 'PORTS', 'MANILA', 'MANILA', 'Manila', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(91, 1, 'ORDER', 'PORTS', 'BACOLOD', 'BACOLOD', 'Bacolod', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(92, 1, 'ORDER', 'PORTS', 'BUTUAN', 'BUTUAN', 'Butuan', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(93, 1, 'ORDER', 'PORTS', 'CAGAYAN', 'CAGAYAN', 'Cagayan', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(94, 1, 'ORDER', 'PORTS', 'CEBU', 'CEBU', 'Cebu', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(95, 1, 'ORDER', 'PORTS', 'COTABATO', 'COTABATO', 'Cotabato', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(96, 1, 'ORDER', 'PORTS', 'DAVAO', 'DAVAO', 'Davao', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(97, 1, 'ORDER', 'PORTS', 'DUMAGUETE', 'DUMAGUETE', 'Dumaguete', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(98, 1, 'ORDER', 'PORTS', 'GEN. SANTOS', 'GEN. SANTOS', 'Gen. Santos', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(99, 1, 'ORDER', 'PORTS', 'ILIGAN', 'ILIGAN', 'Iligan', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(100, 1, 'ORDER', 'PORTS', 'ILOILO', 'ILOILO', 'Iloilo', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(101, 1, 'ORDER', 'PORTS', 'OZAMIS', 'OZAMIS', 'Ozamis', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(102, 1, 'ORDER', 'PORTS', 'PALAWAN', 'PALAWAN', 'Palawan', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(103, 1, 'ORDER', 'PORTS', 'ROXAS', 'ROXAS', 'Roxas', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(104, 1, 'ORDER', 'PORTS', 'TAGBILARAN', 'TAGBILARAN', 'Tagbilaran', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(105, 1, 'ORDER', 'PORTS', 'TACLOBAN', 'TACLOBAN', 'Tacloban', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(106, 1, 'ORDER', 'PORTS', 'ZAMBOANGA', 'ZAMBOANGA', 'Zamboanga', '', '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', ''),
(108, 1, 'ORDER', 'ORDER_STATUS', 'DISAPPROVED', 'Disapproved', 'Disapproved', '', '2014-08-05 15:13:42', 'admin', '2014-08-05 15:13:42', ''),
(109, 1, 'ORDER', 'ORDER_STATUS', 'CANCELLED', 'Cancelled', 'Cancelled', '', '2014-08-05 15:13:42', 'admin', '2014-08-05 15:13:42', ''),
(110, 1, 'ORDER', 'ORDER_STATUS', 'PENDING', 'Pending', 'Pending', '', '2014-08-05 15:13:42', 'admin', '2014-08-05 15:13:42', ''),
(197, 1, 'ORDER', 'ORDER_STATUS', 'APPROVED', 'Approved', 'Approved', '', '2014-08-05 15:13:42', 'admin', '2014-08-05 15:13:42', ''),
(199, 1, 'CONTAINERS', 'CONTAINER_SIZE', '10 FOOTER', '10 Footer', '10 Footer', NULL, '2014-06-10 15:14:38', 'admin', '2014-11-25 10:11:07', 'admin'),
(200, 1, 'CONTAINERS', 'CONTAINER_SIZE', '20 FOOTER', '20 Footer', '20 Footer', NULL, '2014-06-10 15:14:38', 'admin', '2014-11-25 10:11:07', 'admin'),
(201, 1, 'CONTAINERS', 'CONTAINER_SIZE', '40 STD FOOTER', '40 Standard Footer', '40 Standard Footer', NULL, '2014-06-10 15:14:38', 'admin', '2014-11-25 10:11:07', 'admin'),
(202, 1, 'ORDER', 'FREIGHT TYPE', 'SHIPPING', 'Shipping', 'Shipping', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(203, 1, 'CUSTOMERRATES', 'RATES_TYPE', 'A', 'A', 'A', NULL, '2014-06-10 15:14:38', 'admin', '2014-08-21 04:27:53', 'admin'),
(204, 1, 'CUSTOMERRATES', 'RATES_TYPE', 'B', 'B', 'B', NULL, '2014-06-10 15:14:38', 'admin', '2014-08-21 04:27:53', 'admin'),
(205, 1, 'CUSTOMERRATES', 'RATES_TYPE', 'C', 'C', 'C', NULL, '2014-06-10 15:14:38', 'admin', '2014-08-21 04:27:53', 'admin'),
(206, 1, 'CUSTOMERRATES', 'RATES_TYPE', 'D', 'D', 'D', NULL, '2014-06-10 15:14:38', 'admin', '2014-08-21 04:27:54', 'admin'),
(207, 1, 'VESSEL_TYPE', 'VESSEL_TYPE', 'RO/PAX', 'RO/PAX', 'RO/PAX', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(208, 1, 'VESSEL_TYPE', 'VESSEL_TYPE', 'GENERAL CARGO', 'GENERAL CARGO', 'GENERAL CARGO', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(209, 1, 'VESSEL_TYPE', 'VESSEL_TYPE', 'TANKER', 'TANKER', 'TANKER', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(210, 1, 'VESSEL_TYPE', 'VESSEL_TYPE', 'DRY BULK CARRIERS', 'DRY BULK CARRIERS', 'DRY BULK CARRIERS', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(211, 1, 'VESSEL_TYPE', 'VESSEL_TYPE', 'MULTI-PURPOSE VESSEL', 'MULTI-PURPOSE VESSEL', 'MULTI-PURPOSE VESSEL', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(212, 1, 'VESSEL_TYPE', 'VESSEL_TYPE', 'REEFER VESSEL', 'REEFER VESSEL', 'REEFER VESSEL', NULL, '2014-06-10 15:14:38', 'admin', '2014-06-10 15:14:38', 'admin'),
(213, 1, 'ORDER', 'MODE OF SERVICE', 'PICKUP', 'Pickup', 'Pickup', NULL, '2014-09-24 11:29:19', 'admin', '2014-09-24 11:30:42', 'admin'),
(214, 1, 'ORDER', 'MODE OF SERVICE', 'DELIVERY', 'Delivery', 'Delivery', NULL, '2014-09-24 11:29:19', 'admin', '2014-09-24 11:30:43', 'admin'),
(215, 1, 'ORDER', 'MODE OF SERVICE', 'INTER-WAREHOUSE', 'Inter-Warehouse', 'Inter-Warehouse', NULL, '2014-09-24 11:29:19', 'admin', '2014-09-24 11:30:43', 'admin'),
(216, 1, 'ORDER', 'SERVICE REQUIREMENT', 'FULL TRUCK LOAD', 'Full Truck Load', 'Full Truck Load', NULL, '2014-09-24 11:29:19', 'admin', '2014-09-24 11:30:43', 'admin'),
(217, 1, 'ORDER', 'SERVICE REQUIREMENT', 'LESS TRUCK LOAD', 'Less Truck Load', 'Less Truck Load', NULL, '2014-09-24 11:29:19', 'admin', '2014-09-24 11:30:43', 'admin'),
(218, 1, 'ORDER', 'NOTIFY BY', 'E-MAIL', 'E-mail', 'E-mail', NULL, '2014-09-24 11:29:19', 'admin', '2014-09-24 11:31:16', 'admin'),
(219, 1, 'DOCUMENT', 'DOCUMENT_STATUS', 'FOR PRINTING', 'For Printing', 'For Printing', NULL, '2014-09-24 11:31:16', 'admin', '2014-09-24 11:31:16', 'admin'),
(220, 1, 'DOCUMENT', 'DOCUMENT_STATUS', 'PRINTED', 'Printed', 'Printed', NULL, '2014-09-24 11:31:16', 'admin', '2014-09-24 11:31:16', 'admin'),
(221, 1, 'DOCUMENT', 'DOCUMENT_STATUS', 'PENDING', 'Pending', 'Pending', NULL, '2014-09-24 11:31:16', 'admin', '2014-09-24 11:31:16', 'admin'),
(222, 1, 'DOCUMENT', 'DOCUMENT_STATUS', 'RECEIVED', 'Received', 'Received', NULL, '2014-09-24 11:31:16', 'admin', '2014-09-24 11:31:16', 'admin'),
(238, 1, 'CONTAINERS', 'CONTAINER_SEARCH', 'CONTAINER NUMBER', 'Container Number', 'Container Number', NULL, '2014-11-17 15:24:13', 'admin', '2014-11-17 15:24:13', 'admin'),
(265, 1, 'CONTAINERS', 'CONTAINER_SIZE', '40 HC FOOTER', '40 High Capacity Footer', '40 High Capacity Footer', NULL, '2014-06-10 15:14:38', 'admin', '2014-11-25 10:09:29', 'admin'),
(266, 1, 'CUSTOMERS', 'CUSTOMER_TYPE', 'PREMIUM B', 'Premium B', 'Customer Type', '', '2014-05-30 11:30:24', 'admin', '2014-09-22 10:31:49', 'admin'),
(267, 1, 'CUSTOMERS', 'CUSTOMER_TYPE', 'ECONOMY B', 'Economy B', 'Customer Type', '', '2014-05-30 11:30:24', 'admin', '2014-09-22 10:31:50', 'admin'),
(268, 1, 'CONTAINERS', 'CONTAINER_SEARCH', 'SIZE', 'Size', 'Size', NULL, '2014-11-17 15:26:45', 'admin', '2014-11-17 15:26:45', 'admin'),
(269, 1, 'CONTAINERS', 'CONTAINER_SEARCH', 'STATUS', 'Status', 'Status', NULL, '2014-11-17 15:27:00', 'admin', '2014-11-17 15:27:00', 'admin'),
(270, 1, 'CONTAINERS', 'EIR_TYPE', 'EIR FORM 1', 'EIR Form 1', 'EIR Form 1', NULL, '2014-11-17 15:27:00', 'admin', '2014-11-24 14:49:51', 'admin'),
(271, 1, 'CONTAINERS', 'EIR_TYPE', 'EIR FORM 2', 'EIR Form 2', 'EIR Form 2', NULL, '2014-11-17 15:27:00', 'admin', '2014-11-24 14:49:51', 'admin'),
(273, 1, 'CONTAINERS', 'CONTAINER_STATUS', 'CONSOLIDATED', 'Consolidated', 'Consolidated', NULL, '2014-11-17 15:27:00', 'admin', '2014-11-17 15:27:00', NULL),
(274, 1, 'SHIPMENT_LOGS', 'INLAND_FREIGHT', 'DELIVERED', 'Delivered', 'Delivered', NULL, '2014-12-10 12:58:12', 'admin', '2014-12-10 12:58:12', 'admin'),
(275, 1, 'SHIPMENT_LOGS', 'INLAND_FREIGHT', 'PICKUP', 'Pickup', 'Pickup', NULL, '2014-12-10 12:59:12', 'admin', '2014-12-10 12:59:12', 'admin'),
(276, 1, 'SHIPMENT_LOGS', 'INLAND_FREIGHT', 'POSITIONED', 'Positioned', 'Positioned', NULL, '2014-12-10 13:09:13', 'admin', '2014-12-10 13:09:13', 'admin'),
(277, 1, 'SHIPMENT_LOGS', 'INLAND_FREIGHT', 'CANCELLED', 'Cancelled', 'Cancelled', NULL, '2014-12-10 13:09:13', 'admin', '2014-12-10 13:09:13', 'admin'),
(278, 1, 'SHIPMENT_LOGS', 'INLAND_FREIGHT', 'PENDING', 'Pending', 'Pending', NULL, '2014-12-10 13:09:13', 'admin', '2014-12-10 13:09:13', 'admin'),
(279, 1, 'SHIPMENT_LOGS', 'INLAND_FREIGHT', 'SERVICE ACCOMPLISHED', 'Service Accomplished', 'Service Accomplished', NULL, '2014-12-10 13:09:13', 'admin', '2014-12-10 13:16:56', 'admin'),
(280, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'QUEUE FOR DEPARTURE', 'Queue for Departure', 'Queue for Departure', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(281, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'IN-TRANSIT', 'In-Transit', 'In-Transit', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(282, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'ARRIVED', 'Arrived', 'Arrived', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(283, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'RETURNED TO ORIGIN', 'Returned to Origin', 'Returned to Origin', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(284, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'QUEUE FOR CONSOLIDATION', 'Queue for Consolidation', 'Queue for Consolidation', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(285, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'CANCELLED', 'Cancelled', 'Cancelled', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(286, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'PENDING', 'Pending', 'Pending', NULL, '2014-12-10 13:43:15', '', '2014-12-11 16:50:46', NULL),
(287, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT_LCL', 'SERVICE ACCOMPLISHED', 'Service Accomplished', 'Service Accomplished', NULL, '2014-12-10 13:43:15', 'admin', '2014-12-11 16:50:46', 'admin'),
(288, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'QUEUE FOR DEPARTURE', 'Queue for Departure', 'Queue for Departure', NULL, '2014-12-11 16:56:03', 'admin', '2014-12-11 16:56:03', 'admin'),
(289, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'IN-TRANSIT', 'In-Transit', 'In-Transit', NULL, '2014-12-11 16:56:03', 'admin', '2014-12-11 16:56:03', 'admin'),
(290, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'ARRIVED', 'Arrived', 'Arrived', NULL, '2014-12-11 16:56:03', 'admin', '2014-12-11 16:56:03', 'admin'),
(291, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'RETURNED TO ORIGIN', 'Returned to Origin', 'Returned to Origin', NULL, '2014-12-11 16:56:03', 'admin', '2014-12-11 16:56:03', 'admin'),
(292, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'CANCELLED', 'Cancelled', 'Cancelled', NULL, '2014-12-11 16:56:03', 'admin', '2014-12-11 16:56:03', 'admin'),
(293, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'PENDING', 'Pending', 'Pending', NULL, '2014-12-11 16:56:03', '', '2014-12-11 16:56:03', NULL),
(294, 1, 'SHIPMENT_LOGS', 'SEA_FREIGHT', 'SERVICE ACCOMPLISHED', 'Service Accomplished', 'Service Accomplished', NULL, '2014-12-11 16:56:03', 'admin', '2014-12-11 16:56:03', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `permissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `clientId` bigint(20) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`permissionId`),
  UNIQUE KEY `UK_2ojme20jpga3r4r79tdso17gi` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permissionId`, `clientId`, `creationDate`, `description`, `modifiedDate`, `name`) VALUES
(1, 1, '2014-06-01 00:00:00', 'Admin System', '2014-06-01 00:00:00', 'ROLE_ADMIN'),
(2, 1, '2014-11-27 00:00:00', 'Customer', '2014-11-27 00:00:00', 'ROLE_CUSTOMER'),
(3, 1, '2014-11-27 00:00:00', 'Customer Relations', '2014-11-27 00:00:00', 'ROLE_CUSTOMER_RELATIONS'),
(4, 1, '2014-11-27 00:00:00', 'Inland Freight', '2014-11-27 00:00:00', 'ROLE_INLAND_FREIGHT'),
(5, 1, '2014-11-27 00:00:00', 'Sea Freight', '2014-11-27 00:00:00', 'ROLE_SEA_FREIGHT'),
(6, 1, '2014-11-27 00:00:00', 'Sales', '2014-11-27 00:00:00', 'ROLE_SALES'),
(7, 1, '2014-11-27 00:00:00', 'Finance', '2014-11-27 00:00:00', 'ROLE_FINANCE'),
(8, 1, '2014-11-27 00:00:00', 'Documentation Specialist', '2014-11-27 00:00:00', 'ROLE_DOC_SPECIALIST');

-- --------------------------------------------------------

--
-- Table structure for table `permission_user_group`
--

CREATE TABLE IF NOT EXISTS `permission_user_group` (
  `permissionId` bigint(20) DEFAULT NULL,
  `clientId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `projectId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `permission_user_group`
--

INSERT INTO `permission_user_group` (`permissionId`, `clientId`, `groupId`, `projectId`, `userId`, `value`, `id`) VALUES
(1, 1, 2, NULL, 9, NULL, 11),
(2, 1, 2, NULL, 9, NULL, 21),
(1, 1, 2, NULL, 17, NULL, 22),
(5, 1, 1, NULL, 13, NULL, 23),
(4, 1, 1, NULL, 12, NULL, 24),
(2, 1, 5, NULL, 10, NULL, 26),
(3, 1, 5, NULL, 11, NULL, 27),
(6, 1, 5, NULL, 14, NULL, 28);

-- --------------------------------------------------------

--
-- Table structure for table `shipmentlogs`
--

CREATE TABLE IF NOT EXISTS `shipmentlogs` (
  `shipmentLogId` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderId` int(11) NOT NULL,
  `createdBy` varchar(45) NOT NULL,
  PRIMARY KEY (`shipmentLogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trailers`
--

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
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  PRIMARY KEY (`trailerId`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`),
  KEY `trailerCode` (`trailerCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

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
  `createdBy` varchar(25) DEFAULT NULL,
  `modifiedTimestamp` timestamp NULL DEFAULT NULL,
  `modifiedBy` varchar(25) DEFAULT NULL,
  `motorVehicleNumber` varchar(45) DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `netWeight` int(11) DEFAULT NULL,
  `netCapacity` int(11) DEFAULT NULL,
  `ownerName` varchar(45) DEFAULT NULL,
  `ownerAddress` varchar(45) DEFAULT NULL,
  `officialReceipt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`truckId`),
  UNIQUE KEY `truckCode` (`truckCode`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`truckId`, `clientId`, `vendorId`, `truckCode`, `truckType`, `plateNumber`, `modelNumber`, `modelYear`, `engineNumber`, `grossWeight`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `motorVehicleNumber`, `issueDate`, `netWeight`, `netCapacity`, `ownerName`, `ownerAddress`, `officialReceipt`) VALUES
(1, 1, 2, '5357357357', 'TRACTOR HEAD', 'AAA-999', 'Toyota', 1999, 'Toyota', 536, '2014-11-17 09:21:29', 'admin', NULL, 'admin', '3543-5735737', '2014-11-05', 35635, 736, 'Guilermo', 'Manila St.', '42624254245'),
(2, 1, 3, '3457358357', 'TRACTOR HEAD', 'HHH-000', 'Silver', 2000, 'Suzuki', 8468468, '2014-11-17 09:23:58', 'admin', NULL, 'admin', '3468-4689468468', '2014-11-06', 468468, 468468, 'Vince', 'Jason St.', '57950575');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `contactNo` varchar(20) DEFAULT NULL,
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `lastVisitDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  `status` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `userType` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `CLIENTID` int(11) NOT NULL,
  `passwordResetToken` varchar(45) DEFAULT NULL,
  `passwordResetTime` datetime DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK_7vi963g3tk5kkl61jy028somd` (`CLIENTID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `contactNo`, `creationDate`, `email`, `firstName`, `lastName`, `lastVisitDate`, `modifiedDate`, `password`, `status`, `title`, `userType`, `username`, `CLIENTID`, `passwordResetToken`, `passwordResetTime`, `customerId`) VALUES
(9, '(233)333-7775', NULL, 'admin@test.com', 'SuperAdmin', 'User', NULL, '2014-09-26 13:55:29', '$2a$10$0BMV8kV6iE0g359gdmZrH.7aqM9AVYcNzR4pmkrH2cVDZfShIv4Y6', 'ACTIVE', 'Admin', 'ADMIN', 'adminUser', 1, NULL, NULL, NULL),
(11, '1234567', NULL, 'customer@test.com', 'Customer', 'Relations', NULL, '2014-08-15 06:31:02', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'Customer', 'CUSTOMER RELATIONS DEPARTMENT', 'customerrelations', 1, NULL, NULL, NULL),
(12, '1234567', NULL, 'freight@test.com', 'Inland', 'Freight', NULL, '2014-08-15 06:31:02', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'Inland Freight', 'INLAND FREIGHT OFFICER', 'inlandfreight', 1, NULL, NULL, NULL),
(13, '1234567', NULL, 'freight@test.com', 'Sea', 'Freight', NULL, '2014-08-15 06:31:02', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'Sea Freight', 'REGISTERED USER', 'seafreight', 1, NULL, NULL, NULL),
(14, '12345678899', NULL, 'sales@test.com', 'Sales', 'Sales', NULL, '2014-08-15 06:31:03', '$2a$10$5IX66sdASDCSc3638Et2ie0iakLv7v7h0rKrPDDjt8vFq065wMani', 'ACTIVE', 'Sales', 'REGISTERED USER', 'sales', 1, NULL, NULL, NULL),
(15, '1234567', NULL, 'finance@test.com', 'Finance', 'Finance', NULL, '2014-08-15 06:31:03', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'Finance', 'REGISTERED USER', 'finance', 1, NULL, NULL, NULL),
(16, '1234567', NULL, 'document@test.com', 'Documents', 'Specialist', NULL, '2014-08-15 06:31:03', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'Doc Specialist', 'FREIGHT DOCUMENTS SPECIALIST', 'documentsspecialist', 1, NULL, NULL, NULL),
(17, '1234567', NULL, 'admin@test.com', 'Super', 'User', '2014-12-12 16:48:23', '2014-08-15 06:28:59', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'Admin', 'REGISTERED USER', 'admin', 1, NULL, NULL, NULL),
(19, '09123456789', NULL, 'janernest@gmail.com', 'Jan Ernest', 'Go', NULL, '2014-08-15 06:31:03', '$2a$10$W5c4n8uS3WmUJhaVwuKSmOey5jTQkdoxDHrPE5gPB1Yz0D83v4SOO', 'ACTIVE', 'CEO', 'REGISTERED USER', 'janernest', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE IF NOT EXISTS `vendors` (
  `vendorId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorCode` varchar(30) NOT NULL,
  `vendorName` varchar(50) DEFAULT NULL,
  `vendorType` varchar(10) DEFAULT NULL,
  `vendorClass` varchar(30) DEFAULT NULL,
  `vendorStatus` varchar(10) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) DEFAULT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`vendorId`),
  KEY `clientId` (`clientId`),
  KEY `vendorCode` (`vendorCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendorId`, `clientId`, `vendorCode`, `vendorName`, `vendorType`, `vendorClass`, `vendorStatus`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`) VALUES
(1, 1, 'AAA', '2GO', 'SHIPPING', 'PREMIUM', 'ACTIVE', '2014-11-17 09:17:57', 'admin', '2014-11-17 09:17:57', 'admin'),
(2, 1, 'TTT', '1 TRUCKING', 'TRUCKING', 'PREMIUM', 'ACTIVE', '2014-11-17 09:19:52', 'admin', '2014-11-17 09:19:52', 'admin'),
(3, 1, 'CCC', 'Century', 'TRUCKING', 'PREMIUM', 'ACTIVE', '2014-11-17 09:22:57', 'admin', '2014-11-17 09:22:57', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `vessels`
--

CREATE TABLE IF NOT EXISTS `vessels` (
  `vesselId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `vesselNumber` varchar(50) DEFAULT NULL,
  `vesselName` varchar(50) NOT NULL,
  `modelNumber` varchar(50) DEFAULT NULL,
  `modelYear` int(11) DEFAULT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  `vesselType` varchar(45) NOT NULL,
  PRIMARY KEY (`vesselId`),
  KEY `clientId` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vessels`
--

INSERT INTO `vessels` (`vesselId`, `clientId`, `vendorId`, `vesselNumber`, `vesselName`, `modelNumber`, `modelYear`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `vesselType`) VALUES
(1, 1, 1, NULL, 'SS Tidehunter', NULL, NULL, '2014-12-10 02:29:48', 'admin', '2014-12-10 02:29:48', 'admin', 'GENERAL CARGO');

-- --------------------------------------------------------

--
-- Table structure for table `vesselschedules`
--

CREATE TABLE IF NOT EXISTS `vesselschedules` (
  `vesselScheduleId` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) NOT NULL,
  `vendorId` int(11) NOT NULL,
  `originPort` varchar(30) NOT NULL,
  `departureDate` varchar(45) NOT NULL,
  `departureTime` varchar(45) NOT NULL,
  `destinationPort` varchar(30) NOT NULL,
  `arrivalDate` varchar(45) NOT NULL,
  `arrivalTime` varchar(45) NOT NULL,
  `createdTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  `voyageNumber` varchar(45) DEFAULT NULL,
  `vendorCode` varchar(45) DEFAULT NULL,
  `vesselName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vesselScheduleId`),
  KEY `clientID` (`clientId`),
  KEY `vendorId` (`vendorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vesselschedules`
--

INSERT INTO `vesselschedules` (`vesselScheduleId`, `clientId`, `vendorId`, `originPort`, `departureDate`, `departureTime`, `destinationPort`, `arrivalDate`, `arrivalTime`, `createdTimestamp`, `createdBy`, `modifiedTimestamp`, `modifiedBy`, `voyageNumber`, `vendorCode`, `vesselName`) VALUES
(1, 1, 1, 'ROXAS', '11-18-2014', '4:00 AM', 'TACLOBAN', '11-18-2014', '5:00 AM', '2014-11-17 09:18:26', 'admin', '2014-11-17 09:18:26', 'admin', '2GO-111', 'AAA', NULL),
(2, 1, 1, 'ROXAS', '12-10-2014', '10:32 AM', 'TACLOBAN', '12-11-2014', '10:32 AM', '2014-12-10 02:33:15', 'admin', '2014-12-10 02:33:48', 'admin', '50124', 'AAA', 'SS Tidehunter');

-- --------------------------------------------------------

--
-- Table structure for table `yardlogs`
--

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
  `createdBy` varchar(25) NOT NULL,
  `modifiedTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` varchar(25) NOT NULL,
  PRIMARY KEY (`yardLogsId`),
  KEY `clientId` (`clientId`),
  KEY `addressId` (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `FK_macyd219b60yqhb7oo4u2ihg0` FOREIGN KEY (`CLIENTID`) REFERENCES `clients` (`clientId`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_7vi963g3tk5kkl61jy028somd` FOREIGN KEY (`CLIENTID`) REFERENCES `clients` (`clientId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
