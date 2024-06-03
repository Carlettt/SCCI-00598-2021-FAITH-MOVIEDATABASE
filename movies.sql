-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 10:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `directorid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `photo` blob NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genreid` int(11) NOT NULL,
  `genrename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `mediaid` int(11) NOT NULL,
  `medianame` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moviecast`
--

CREATE TABLE `moviecast` (
  `castid` int(11) NOT NULL,
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
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moviegenres`
--

CREATE TABLE `moviegenres` (
  `movieid` int(11) NOT NULL,
  `genreid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movielanguages`
--

CREATE TABLE `movielanguages` (
  `id` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moviemedia`
--

CREATE TABLE `moviemedia` (
  `movieid` int(11) NOT NULL,
  `mediaid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movieproductioncompanies`
--

CREATE TABLE `movieproductioncompanies` (
  `movieid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movieratings`
--

CREATE TABLE `movieratings` (
  `id` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `ratingid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movieresolution`
--

CREATE TABLE `movieresolution` (
  `id` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `resolutionid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `runningtime` time NOT NULL,
  `synopsis` varchar(1000) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `directorid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `languageid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `countryid` int(11) NOT NULL,
  `countryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objects`
--

CREATE TABLE `objects` (
  `objectid` int(11) NOT NULL,
  `objectname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priviledges`
--

CREATE TABLE `priviledges` (
  `userid` int(11) NOT NULL,
  `objectid` int(11) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productioncompanies`
--

CREATE TABLE `productioncompanies` (
  `companyid` int(11) NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ratingsid` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resolution`
--

CREATE TABLE `resolution` (
  `resolutionid` int(11) NOT NULL,
  `resolutionname` varchar(20) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE `stars` (
  `starid` int(11) NOT NULL,
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
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
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
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`directorid`),
  ADD KEY `addedby` (`addedby`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genreid`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`languageid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`mediaid`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD PRIMARY KEY (`castid`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `starid` (`starid`),
  ADD KEY `roleid` (`roleid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `moviegenres`
--
ALTER TABLE `moviegenres`
  ADD KEY `movieid` (`movieid`),
  ADD KEY `genreid` (`genreid`);

--
-- Indexes for table `movielanguages`
--
ALTER TABLE `movielanguages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `languageid` (`languageid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `moviemedia`
--
ALTER TABLE `moviemedia`
  ADD KEY `mediaid` (`mediaid`);

--
-- Indexes for table `movieproductioncompanies`
--
ALTER TABLE `movieproductioncompanies`
  ADD KEY `movieid` (`movieid`),
  ADD KEY `companyid` (`companyid`);

--
-- Indexes for table `movieratings`
--
ALTER TABLE `movieratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `ratingid` (`ratingid`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `movieresolution`
--
ALTER TABLE `movieresolution`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `resolutionid` (`resolutionid`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `directorid` (`directorid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `languageid` (`languageid`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`countryid`);

--
-- Indexes for table `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`objectid`);

--
-- Indexes for table `priviledges`
--
ALTER TABLE `priviledges`
  ADD KEY `addedby` (`addedby`);

--
-- Indexes for table `productioncompanies`
--
ALTER TABLE `productioncompanies`
  ADD PRIMARY KEY (`companyid`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ratingsid`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `resolution`
--
ALTER TABLE `resolution`
  ADD PRIMARY KEY (`resolutionid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD KEY `roles_ibfk_1` (`addedby`);

--
-- Indexes for table `stars`
--
ALTER TABLE `stars`
  ADD PRIMARY KEY (`starid`),
  ADD KEY `nationalityid` (`nationalityid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `directorid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genreid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `languageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `mediaid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moviecast`
--
ALTER TABLE `moviecast`
  MODIFY `castid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movielanguages`
--
ALTER TABLE `movielanguages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movieratings`
--
ALTER TABLE `movieratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movieresolution`
--
ALTER TABLE `movieresolution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `countryid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objects`
--
ALTER TABLE `objects`
  MODIFY `objectid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productioncompanies`
--
ALTER TABLE `productioncompanies`
  MODIFY `companyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ratingsid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resolution`
--
ALTER TABLE `resolution`
  MODIFY `resolutionid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stars`
--
ALTER TABLE `stars`
  MODIFY `starid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `directors`
--
ALTER TABLE `directors`
  ADD CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `genres`
--
ALTER TABLE `genres`
  ADD CONSTRAINT `genres_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `languages_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `moviecast_ibfk_2` FOREIGN KEY (`starid`) REFERENCES `stars` (`starid`),
  ADD CONSTRAINT `moviecast_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `roles` (`addedby`),
  ADD CONSTRAINT `moviecast_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `moviecast_ibfk_5` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `moviecast_ibfk_6` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `moviegenres`
--
ALTER TABLE `moviegenres`
  ADD CONSTRAINT `moviegenres_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `moviegenres_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`);

--
-- Constraints for table `movielanguages`
--
ALTER TABLE `movielanguages`
  ADD CONSTRAINT `movielanguages_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `movielanguages_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  ADD CONSTRAINT `movielanguages_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movielanguages_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `moviemedia`
--
ALTER TABLE `moviemedia`
  ADD CONSTRAINT `moviemedia_ibfk_1` FOREIGN KEY (`mediaid`) REFERENCES `media` (`mediaid`);

--
-- Constraints for table `movieproductioncompanies`
--
ALTER TABLE `movieproductioncompanies`
  ADD CONSTRAINT `movieproductioncompanies_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `movieproductioncompanies_ibfk_2` FOREIGN KEY (`companyid`) REFERENCES `productioncompanies` (`companyid`);

--
-- Constraints for table `movieratings`
--
ALTER TABLE `movieratings`
  ADD CONSTRAINT `movieratings_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movieratings_ibfk_2` FOREIGN KEY (`ratingid`) REFERENCES `ratings` (`ratingsid`),
  ADD CONSTRAINT `movieratings_ibfk_3` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`);

--
-- Constraints for table `movieresolution`
--
ALTER TABLE `movieresolution`
  ADD CONSTRAINT `movieresolution_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `movieresolution_ibfk_2` FOREIGN KEY (`resolutionid`) REFERENCES `resolution` (`resolutionid`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`directorid`) REFERENCES `directors` (`directorid`),
  ADD CONSTRAINT `movies_ibfk_4` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movies_ibfk_5` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`);

--
-- Constraints for table `priviledges`
--
ALTER TABLE `priviledges`
  ADD CONSTRAINT `priviledges_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `productioncompanies`
--
ALTER TABLE `productioncompanies`
  ADD CONSTRAINT `productioncompanies_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `resolution`
--
ALTER TABLE `resolution`
  ADD CONSTRAINT `resolution_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `stars`
--
ALTER TABLE `stars`
  ADD CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`countryid`),
  ADD CONSTRAINT `stars_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `stars_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `stars_ibfk_4` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
