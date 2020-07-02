/*
SQLyog Community Edition- MySQL GUI v8.04 
MySQL - 5.5.43 : Database - officeadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`officeadmin` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `officeadmin`;

/*Table structure for table `calls` */

DROP TABLE IF EXISTS `calls`;

CREATE TABLE `calls` (
  `CallID` int(3) NOT NULL AUTO_INCREMENT,
  `CallerName` varchar(100) DEFAULT NULL,
  `ReceiverName` varchar(100) DEFAULT NULL,
  `Number` decimal(10,0) unsigned zerofill DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Message` varchar(100) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `CallStatus` varchar(10) DEFAULT NULL,
  `TransferredTo` varchar(30) DEFAULT NULL,
  `CallType` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`CallID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;


/*Table structure for table `couriers` */

DROP TABLE IF EXISTS `couriers`;

CREATE TABLE `couriers` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CourierFrom` varchar(20) DEFAULT NULL,
  `ForDept` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Urgency` varchar(30) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `CourierNo` varchar(20) DEFAULT NULL,
  `BillNo` varchar(20) DEFAULT NULL,
  `Response` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `FullName` varchar(25) DEFAULT NULL,
  `EmpID` varchar(10) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `MaritalStatus` varchar(15) DEFAULT NULL,
  `AnniversaryDate` date DEFAULT '0000-00-00',
  `MobileNo` decimal(10,0) DEFAULT NULL,
  `EmailID` varchar(40) DEFAULT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `BankAccNo` decimal(15,0) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `PinCode` decimal(6,0) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  `UserType` varchar(20) DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL,
  `AadharCardNo` decimal(12,0) DEFAULT NULL,
  `PANCardNo` varchar(10) DEFAULT NULL,
  `OtherDetails` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*Table structure for table `itemspurchased` */

DROP TABLE IF EXISTS `itemspurchased`;

CREATE TABLE `itemspurchased` (
  `BillNo` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Quantity` decimal(3,0) NOT NULL,
  `Time` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Amount` double(10,2) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BillNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*Table structure for table `itemssold` */

DROP TABLE IF EXISTS `itemssold`;

CREATE TABLE `itemssold` (
  `BillNo` varchar(25) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Quantity` decimal(10,0) DEFAULT NULL,
  `Amount` double(10,2) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*Table structure for table `marketing` */

DROP TABLE IF EXISTS `marketing`;

CREATE TABLE `marketing` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `EnquiryFrom` varchar(30) DEFAULT NULL,
  `EnquiryMode` varchar(10) DEFAULT NULL,
  `EnquiryMsg` varchar(100) DEFAULT NULL,
  `EnquiryTime` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Response` varchar(100) DEFAULT NULL,
  `Quotation` varchar(100) DEFAULT NULL,
  `ResponseTime` time DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `FollowUp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `materials` */

DROP TABLE IF EXISTS `materials`;

CREATE TABLE `materials` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) DEFAULT NULL,
  `Quantity` decimal(3,0) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `ProductFrom` varchar(25) DEFAULT NULL,
  `ForDept` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `BillNo` varchar(20) DEFAULT NULL,
  `PaymentFor` varchar(50) DEFAULT NULL,
  `Amount` double(10,2) DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ServiceFrom` varchar(25) DEFAULT NULL,
  `ServiceType` varchar(25) DEFAULT NULL,
  `RequestMode` varchar(25) DEFAULT NULL,
  `Issue` varchar(100) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `RequestTime` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Response` varchar(100) DEFAULT NULL,
  `ResponseTime` time DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `SEN` varchar(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` double(10,2) DEFAULT NULL,
  `Specifications` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tasksheet` */

DROP TABLE IF EXISTS `tasksheet`;

CREATE TABLE `tasksheet` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Task` varchar(100) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `CompanyName` varchar(30) DEFAULT NULL,
  `Priority` varchar(20) DEFAULT NULL,
  `ScheduleTime` time DEFAULT '00:00:00',
  `Remarks` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `FollowUp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Table structure for table `visitors` */

DROP TABLE IF EXISTS `visitors`;

CREATE TABLE `visitors` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `Purpose` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `EnquiryMsg` varchar(100) DEFAULT NULL,
  `HandledBy` varchar(20) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `Response` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


/* Trigger structure for table `calls` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigmarkcalls` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trigmarkcalls` AFTER INSERT ON `calls` FOR EACH ROW BEGIN
	declare frm varchar(20);
	declare enqmode varchar(20);
	declare enqtime time;
	declare enqdate date;
	if new.TransferredTo = 'Marketing' then
		set frm=new.CallerName;
		set enqmode= 'Call';
		set enqtime=new.Time;
		set enqdate=new.Date;
		insert into marketing values('',frm,enqmode,'',enqtime,enqdate,'','','','',''); 
	end if;	
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
