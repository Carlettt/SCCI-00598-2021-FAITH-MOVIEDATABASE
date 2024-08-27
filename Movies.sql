/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - movies
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movies` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `movies`;

/*Table structure for table `directors` */

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `directorid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `photo` blob NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`directorid`),
  KEY `addedby` (`addedby`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `chk_deleted_director` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `directors` */

/*Table structure for table `genres` */

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genreid` int(11) NOT NULL AUTO_INCREMENT,
  `genrename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`genreid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `genres_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `chk_deleted_genre` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `genres` */

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL AUTO_INCREMENT,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  KEY `userid` (`userid`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `languages_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `languages` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `mediaid` int(11) NOT NULL AUTO_INCREMENT,
  `medianame` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`mediaid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `media` */

/*Table structure for table `moviecast` */

DROP TABLE IF EXISTS `moviecast`;

CREATE TABLE `moviecast` (
  `castid` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `starid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `roledescription` varchar(1000) NOT NULL,
  `castname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`castid`),
  KEY `movieid` (`movieid`),
  KEY `starid` (`starid`),
  KEY `roleid` (`roleid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  KEY `userid` (`userid`),
  CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `moviecast_ibfk_2` FOREIGN KEY (`starid`) REFERENCES `stars` (`starid`),
  CONSTRAINT `moviecast_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `roles` (`addedby`),
  CONSTRAINT `moviecast_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `moviecast_ibfk_5` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `moviecast_ibfk_6` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deletedby` is null or `deletedby` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviecast` */

/*Table structure for table `moviecategory` */

DROP TABLE IF EXISTS `moviecategory`;

CREATE TABLE `moviecategory` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `addedby` int(11) NOT NULL,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviecategory` */

insert  into `moviecategory`(`categoryid`,`categoryname`,`description`,`addedby`,`deletedby`,`datedeleted`,`deleted`,`dateadded`) values 
(1,'Action','Motion pictures with a lot of action',1,0,'0000-00-00 00:00:00',0,'2024-07-30 00:26:16'),
(2,'Drama','Motion pictures based on real life events',1,0,'0000-00-00 00:00:00',0,'2024-07-30 00:33:00'),
(3,'Comedy','Motion pictures that are funny',1,1,'2024-07-30 00:43:50',1,'2024-07-30 00:33:34'),
(4,'True Story','Real life stories of life events',1,1,'2024-07-30 20:42:29',1,'2024-07-30 20:32:11'),
(5,'Animations','Catoons and animated pictures',1,0,NULL,0,'2024-07-30 20:35:36');

/*Table structure for table `moviegenres` */

DROP TABLE IF EXISTS `moviegenres`;

CREATE TABLE `moviegenres` (
  `movieid` int(11) NOT NULL,
  `genreid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  KEY `movieid` (`movieid`),
  KEY `genreid` (`genreid`),
  CONSTRAINT `moviegenres_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `moviegenres_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviegenres` */

/*Table structure for table `movielanguages` */

DROP TABLE IF EXISTS `movielanguages`;

CREATE TABLE `movielanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movieid` (`movieid`),
  KEY `languageid` (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movielanguages_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movielanguages_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  CONSTRAINT `movielanguages_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movielanguages_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movielanguages` */

/*Table structure for table `moviemedia` */

DROP TABLE IF EXISTS `moviemedia`;

CREATE TABLE `moviemedia` (
  `movieid` int(11) NOT NULL,
  `mediaid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  KEY `mediaid` (`mediaid`),
  CONSTRAINT `moviemedia_ibfk_1` FOREIGN KEY (`mediaid`) REFERENCES `media` (`mediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviemedia` */

/*Table structure for table `movieproductioncompanies` */

DROP TABLE IF EXISTS `movieproductioncompanies`;

CREATE TABLE `movieproductioncompanies` (
  `movieid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  KEY `movieid` (`movieid`),
  KEY `companyid` (`companyid`),
  CONSTRAINT `movieproductioncompanies_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movieproductioncompanies_ibfk_2` FOREIGN KEY (`companyid`) REFERENCES `productioncompanies` (`companyid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieproductioncompanies` */

/*Table structure for table `movieratings` */

DROP TABLE IF EXISTS `movieratings`;

CREATE TABLE `movieratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `ratingid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `ratingid` (`ratingid`),
  KEY `movieid` (`movieid`),
  CONSTRAINT `movieratings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `movieratings_ibfk_2` FOREIGN KEY (`ratingid`) REFERENCES `ratings` (`ratingsid`),
  CONSTRAINT `movieratings_ibfk_3` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `chk_deleted_movie_rating` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieratings` */

/*Table structure for table `movieresolution` */

DROP TABLE IF EXISTS `movieresolution`;

CREATE TABLE `movieresolution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `resolutionid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movieid` (`movieid`),
  KEY `resolutionid` (`resolutionid`),
  CONSTRAINT `movieresolution_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movieresolution_ibfk_2` FOREIGN KEY (`resolutionid`) REFERENCES `resolution` (`resolutionid`),
  CONSTRAINT `chk_deleted_movie_resolution` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movieresolution` */

/*Table structure for table `movies` */

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `runningtime` time NOT NULL,
  `synopsis` varchar(1000) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime NOT NULL,
  `directorid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `languageid` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  KEY `directorid` (`directorid`),
  KEY `userid` (`userid`),
  KEY `languageid` (`languageid`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`directorid`) REFERENCES `directors` (`directorid`),
  CONSTRAINT `movies_ibfk_4` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `movies_ibfk_5` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`runningtime` > 0),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_3` CHECK (`runningtime` > 0),
  CONSTRAINT `CONSTRAINT_4` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movies` */

/*Table structure for table `movietitles` */

DROP TABLE IF EXISTS `movietitles`;

CREATE TABLE `movietitles` (
  `movieid` int(11) DEFAULT NULL,
  `movietitle` varchar(60) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `releaseyear` int(11) DEFAULT NULL,
  `rating` decimal(5,2) DEFAULT NULL,
  `synopsis` varchar(50) DEFAULT NULL,
  `dateadded` date DEFAULT NULL,
  `moviestatus` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  CONSTRAINT `CONSTRAINT_1` CHECK (`moviestatus` in ('upcoming','released','cancelled')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`moviestatus` in ('upcoming','released','cancelled'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movietitles` */

insert  into `movietitles`(`movieid`,`movietitle`,`director`,`releaseyear`,`rating`,`synopsis`,`dateadded`,`moviestatus`,`deleted`,`addedby`) values 
(1,'Spiderman','Sam Raimi',1998,7.50,'A young man gets stung by a spider and gains super','2024-06-05','released',0,1),
(2,'Bruce Almighty','Sam Raimi',2002,9.80,'A young man blames God for all his misfortunes','2024-06-05','released',0,2),
(3,'Ginny and Georgia','Tom Cleveland',2019,10.00,'Messy situationship','2019-09-02','released',0,NULL),
(4,'Exit Wounds','Stephen Seagull',1998,9.80,'A young man blames God for all his misfortunes','2024-06-05','released',0,2);

/*Table structure for table `nationalities` */

DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(50) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nationalities` */

insert  into `nationalities`(`countryid`,`countryname`) values 
(1,'USA');

/*Table structure for table `objects` */

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `objectid` int(11) NOT NULL AUTO_INCREMENT,
  `objectname` varchar(100) NOT NULL,
  PRIMARY KEY (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objects` */

/*Table structure for table `priviledges` */

DROP TABLE IF EXISTS `priviledges`;

CREATE TABLE `priviledges` (
  `userid` int(11) NOT NULL,
  `objectid` int(11) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  KEY `addedby` (`addedby`),
  CONSTRAINT `priviledges_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`valid` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `priviledges` */

/*Table structure for table `productioncompanies` */

DROP TABLE IF EXISTS `productioncompanies`;

CREATE TABLE `productioncompanies` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`companyid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `productioncompanies_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `chk_deleted_production_company` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productioncompanies` */

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `ratingsid` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`ratingsid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `chk_rating_value` CHECK (`value` between 1 and 10),
  CONSTRAINT `chk_deleted_rating` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`value` between 1 and 10),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ratings` */

/*Table structure for table `resolution` */

DROP TABLE IF EXISTS `resolution`;

CREATE TABLE `resolution` (
  `resolutionid` int(11) NOT NULL AUTO_INCREMENT,
  `resolutionname` varchar(20) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  PRIMARY KEY (`resolutionid`),
  KEY `userid` (`userid`),
  CONSTRAINT `resolution_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `chk_deleted_resolution` CHECK (`deleted` in (0,1)),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resolution` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  KEY `roles_ibfk_1` (`addedby`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

/*Table structure for table `stars` */

DROP TABLE IF EXISTS `stars`;

CREATE TABLE `stars` (
  `starid` int(11) NOT NULL AUTO_INCREMENT,
  `referenceno` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `nationalityid` int(11) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `alist` tinyint(1) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`starid`),
  KEY `nationalityid` (`nationalityid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  KEY `userid` (`userid`),
  CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`countryid`),
  CONSTRAINT `stars_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `stars_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `stars_ibfk_4` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`alist` in (0,1)),
  CONSTRAINT `CONSTRAINT_2` CHECK (`alist` in (0,1)),
  CONSTRAINT `CONSTRAINT_3` CHECK (`gender` in ('Male','Female'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stars` */

insert  into `stars`(`starid`,`referenceno`,`firstname`,`middlename`,`lastname`,`gender`,`nationalityid`,`photo`,`alist`,`addedby`,`dateadded`,`deleted`,`datedeleted`,`deletedby`,`userid`) values 
(1,'HOL001','Glen','Powel',' ','Male',1,'',0,1,'2024-07-30 01:59:42',0,NULL,NULL,NULL),
(2,'HOL002','Dakota','Johnson',' ','Female',1,'',0,1,'2024-07-30 02:01:11',0,NULL,NULL,NULL),
(3,'HOL003','Ryan','Renolds',' ','Male',1,'',0,1,'2024-07-30 02:01:51',1,'2024-07-30 02:13:19',1,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `systemadmin` tinyint(1) NOT NULL,
  `accountactive` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`userid`,`username`,`firstname`,`lastname`,`password`,`salt`,`systemadmin`,`accountactive`,`dateadded`,`addedby`,`mobile`,`email`) values 
(1,'admin','system','administrator','','',0,0,'0000-00-00 00:00:00',0,'',''),
(2,'support','user','support','','',0,0,'0000-00-00 00:00:00',0,'',''),
(5,'faith','Faith','Carlet','','',0,0,'0000-00-00 00:00:00',0,'',''),
(6,'faith1','Faith','Carlet','','',0,0,'0000-00-00 00:00:00',0,'','');

/* Procedure structure for procedure `get_moviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_moviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_moviecategory`()
BEGIN
                select c.*, concat (`firstname`,' ',`lastname`) addedby
                from `moviecategory` c
                join `users` s on `userid`=c.addedby
                where `deleted`=0
                order by `categoryname`;
                
	END */$$
DELIMITER ;

/* Procedure structure for procedure `get_moviecategorydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_moviecategorydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_moviecategorydetails`($categoryid int)
BEGIN
              select * from `moviecategory`
              where `categoryid`=$categoryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_adduser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_adduser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adduser`(
       $username varchar(50),
       $firstname varchar(50),
       $lastname varchar(50)
       )
if not exists(select * from `users`where `username`=$username)then 
       insert `users`(`username`,`firstname`,`lastname`)
       values ($username,$firstname,$lastname);
end if */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkmoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkmoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkmoviecategory`($categoryid INT,$categoryname VARCHAR(50))
BEGIN
            SELECT * FROM `moviecategory`
            WHERE `categoryid`!=$categoryid AND `categoryname`=$categoryname
            AND `deleted`=0;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkstar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkstar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkstar`($starid int, $referenceno varchar (50))
BEGIN
                 select * from `stars`
                 where `starid`!=$starid and `referenceno`=$referenceno;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletemoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletemoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletemoviecategory`($categoryid INT, $userid INT)
BEGIN
                    UPDATE`moviecategory`
                  SET `deleted`=1,`datedeleted`= NOW(), `deletedby`=$userid
                  WHERE `categoryid`=$categoryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletestar`($starid int,$userid int)
begin	
    update `stars`
    set `deleted`=1,`datedeleted`=now(),`deletedby`=$userid
    where `starid`=$starid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtermovies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtermovies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtermovies`(
 $title varchar (50)
 )
select *
 from `vwmovietitleswithusers`
 where movietitle
  like concat( '%',$title,'%') */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getallusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getallusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallusers`()
select * from users
order by firstname,lastname */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getstardetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getstardetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getstardetails`($starid int)
BEGIN
                   select * from `stars`
                   where `starid` = $starid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getstars` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getstars` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getstars`()
BEGIN
    SELECT s.*, c.countryname, CONCAT(u.firstname, ' ', u.lastname) AS addedbyname
    FROM `stars` s
    JOIN `users` u ON u.userid = s.addedby
    JOIN `nationalities` c ON c.countryid = s.nationalityid
    WHERE s.deleted = 0
    ORDER BY s.firstname, s.lastname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savemoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savemoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savemoviecategory`($categoryid INT, $categoryname VARCHAR (50), $categorydescription VARCHAR (1000),$userid INT)
BEGIN
                   IF $categoryid =0 THEN
               INSERT INTO `moviecategory`(`categoryname`,`description`,`dateadded`,`addedby`)
               VALUES ($categoryname, $categorydescription, NOW(),$userid);
               ELSE
               UPDATE `moviecategory`
               SET `categoryname`=$categoryname, `description`=$categorydescription
               WHERE `categoryid`=$categoryid;
               END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savestar`(
    IN starid INT,
    IN referenceno VARCHAR(50),
    IN firstname VARCHAR(50),
    IN middlename VARCHAR(50),
    IN lastname VARCHAR(50),
    IN gender VARCHAR(10),
    IN photo VARCHAR(1000),
    IN nationality INT,
    IN userid INT
)
BEGIN
    IF starid = 0 THEN
        INSERT INTO `stars`(`referenceno`, `firstname`, `middlename`, `lastname`, `gender`, `nationalityid`, `photo`, `dateadded`, `addedby`)
        VALUES (referenceno, firstname, middlename, lastname, gender, nationality, photo, NOW(), userid);
    ELSE
        UPDATE `stars`
        SET `referenceno` = referenceno, `firstname` = firstname, `middlename` = middlename, `lastname` = lastname, `gender` = gender, `nationalityid` = nationality
        WHERE `starid` = starid;
    END IF;
END */$$
DELIMITER ;

/*Table structure for table `vwmovietitleswithusers` */

DROP TABLE IF EXISTS `vwmovietitleswithusers`;

/*!50001 DROP VIEW IF EXISTS `vwmovietitleswithusers` */;
/*!50001 DROP TABLE IF EXISTS `vwmovietitleswithusers` */;

/*!50001 CREATE TABLE  `vwmovietitleswithusers`(
 `movieid` int(11) ,
 `movietitle` varchar(60) ,
 `director` varchar(50) ,
 `releaseyear` int(11) ,
 `rating` decimal(5,2) ,
 `synopsis` varchar(50) ,
 `dateadded` date ,
 `moviestatus` varchar(50) ,
 `deleted` tinyint(1) ,
 `addedby` int(11) ,
 `addedbyname` varchar(101) 
)*/;

/*View structure for view vwmovietitleswithusers */

/*!50001 DROP TABLE IF EXISTS `vwmovietitleswithusers` */;
/*!50001 DROP VIEW IF EXISTS `vwmovietitleswithusers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmovietitleswithusers` AS select `m`.`movieid` AS `movieid`,`m`.`movietitle` AS `movietitle`,`m`.`director` AS `director`,`m`.`releaseyear` AS `releaseyear`,`m`.`rating` AS `rating`,`m`.`synopsis` AS `synopsis`,`m`.`dateadded` AS `dateadded`,`m`.`moviestatus` AS `moviestatus`,`m`.`deleted` AS `deleted`,`m`.`addedby` AS `addedby`,ifnull(concat(`u`.`firstname`,' ',`u`.`lastname`),'<Unavailable>') AS `addedbyname` from (`movietitles` `m` left join `users` `u` on(`u`.`userid` = `m`.`addedby`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
