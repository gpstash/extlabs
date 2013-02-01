-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 01, 2013 at 05:58 AM
-- Server version: 5.5.29
-- PHP Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `itmg_labs`
--

-- --------------------------------------------------------

--
-- Table structure for table `CONTENTS`
--

CREATE TABLE IF NOT EXISTS `CONTENTS` (
  `CONTENT_ID` int(19) NOT NULL AUTO_INCREMENT,
  `TREE_STORE_CHILDREN_ID` int(19) NOT NULL,
  `XTYPE` varchar(100) NOT NULL,
  `STORE` varchar(100) NOT NULL,
  `BORDER` tinyint(1) NOT NULL DEFAULT '0',
  `ID` varchar(100) NOT NULL,
  `REGION` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CONTENT_ID`),
  KEY `TREE_STORE_CHILDREN_ID` (`TREE_STORE_CHILDREN_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- RELATIONS FOR TABLE `CONTENTS`:
--   `TREE_STORE_CHILDREN_ID`
--       `TREE_STORE_CHILDREN` -> `TREE_STORE_CHILDREN_ID`
--

--
-- Dumping data for table `CONTENTS`
--

INSERT INTO `CONTENTS` (`CONTENT_ID`, `TREE_STORE_CHILDREN_ID`, `XTYPE`, `STORE`, `BORDER`, `ID`, `REGION`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'gridpanel', 'Investors', 0, 'investors-list-investors-grid', 'center', '2013-01-28 22:45:20', '2013-01-29 08:00:01'),
(2, 3, 'gridpanel', 'InvestorLocations', 0, 'investors-investor-location-grid', 'center', '2013-01-30 17:24:15', '2013-01-30 10:24:15'),
(3, 2, 'gridpanel', 'InvestorTypes', 0, 'investors-list-investortype', 'center', '2013-01-30 17:44:13', '2013-01-30 10:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `CONTENT_MODEL`
--

CREATE TABLE IF NOT EXISTS `CONTENT_MODEL` (
  `CONTENT_ID` int(19) NOT NULL,
  `MODEL_ID` int(19) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CONTENT_ID`,`MODEL_ID`),
  KEY `MODEL_ID` (`MODEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `CONTENT_MODEL`:
--   `CONTENT_ID`
--       `CONTENTS` -> `CONTENT_ID`
--   `MODEL_ID`
--       `MODELS` -> `MODEL_ID`
--

--
-- Dumping data for table `CONTENT_MODEL`
--

INSERT INTO `CONTENT_MODEL` (`CONTENT_ID`, `MODEL_ID`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, '2013-01-29 11:35:38', '2013-01-29 04:35:38'),
(2, 2, '2013-01-30 17:31:16', '2013-01-30 10:31:16'),
(3, 3, '2013-01-30 17:44:25', '2013-01-30 10:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `CONTENT_TBAR`
--

CREATE TABLE IF NOT EXISTS `CONTENT_TBAR` (
  `CONTENT_TBAR_ID` int(19) NOT NULL AUTO_INCREMENT,
  `CONTENT_ID` int(19) NOT NULL,
  `ID` varchar(100) NOT NULL,
  `XTYPE` varchar(100) NOT NULL,
  `TEXT` varchar(100) NOT NULL,
  `ICONCLS` varchar(100) NOT NULL,
  `DISABLED` tinyint(1) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CONTENT_TBAR_ID`),
  KEY `CONTENT_ID` (`CONTENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- RELATIONS FOR TABLE `CONTENT_TBAR`:
--   `CONTENT_ID`
--       `CONTENTS` -> `CONTENT_ID`
--

--
-- Dumping data for table `CONTENT_TBAR`
--

INSERT INTO `CONTENT_TBAR` (`CONTENT_TBAR_ID`, `CONTENT_ID`, `ID`, `XTYPE`, `TEXT`, `ICONCLS`, `DISABLED`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'investors-add-new-investor-button', 'button', 'Add New Investor', '', 0, '2013-01-30 15:56:17', '2013-01-31 05:23:32'),
(2, 1, 'investors-upload-excel-button', 'button', 'Upload Excel', '', 0, '2013-01-30 15:56:33', '2013-01-31 05:23:41'),
(3, 2, 'locations-add-new-location-button', 'button', 'Add New Location', '', 0, '2013-01-30 17:25:26', '2013-01-31 05:23:53'),
(4, 3, 'investor-type-add-new-investor-type-button', 'button', 'Add Investor Type', '', 0, '2013-01-30 17:54:30', '2013-01-31 05:24:37'),
(5, 1, 'investors-sync-investor-button', 'button', 'Sync', '', 0, '2013-01-30 19:24:33', '2013-01-31 05:24:51'),
(6, 1, 'investors-search-investor', 'button', 'Search', '', 0, '2013-01-31 15:53:53', '2013-01-31 08:53:53'),
(7, 1, 'investors-view-detail', 'button', 'View Detail', '', 0, '2013-01-31 18:09:33', '2013-01-31 11:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `CONTENT_TBAR_LISTENER`
--

CREATE TABLE IF NOT EXISTS `CONTENT_TBAR_LISTENER` (
  `CONTENT_TBAR_LISTENER_ID` int(19) NOT NULL AUTO_INCREMENT,
  `CONTENT_TBAR_ID` int(19) DEFAULT NULL,
  `LISTENER_PATH` varchar(255) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CONTENT_TBAR_LISTENER_ID`),
  KEY `CONTENT_TBAR_ID` (`CONTENT_TBAR_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- RELATIONS FOR TABLE `CONTENT_TBAR_LISTENER`:
--   `CONTENT_TBAR_ID`
--       `CONTENT_TBAR` -> `CONTENT_TBAR_ID`
--

--
-- Dumping data for table `CONTENT_TBAR_LISTENER`
--

INSERT INTO `CONTENT_TBAR_LISTENER` (`CONTENT_TBAR_LISTENER_ID`, `CONTENT_TBAR_ID`, `LISTENER_PATH`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 5, '/dashboard/tbar/investors/sync.js', '2013-01-31 13:54:19', '2013-01-31 07:51:43'),
(2, 6, '/dashboard/tbar/investors/search.js', '2013-01-31 15:55:17', '2013-01-31 08:55:17'),
(3, 1, '/dashboard/tbar/investors/add-investor.js', '2013-01-31 17:10:03', '2013-01-31 10:10:03'),
(4, 2, '/dashboard/tbar/investors/upload-excel.js', '2013-01-31 17:10:47', '2013-01-31 10:13:31'),
(5, 7, '/dashboard/tbar/investors/view-detail.js', '2013-01-31 18:10:26', '2013-01-31 11:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `GRIDPANEL_COLUMNS`
--

CREATE TABLE IF NOT EXISTS `GRIDPANEL_COLUMNS` (
  `GRIDPANEL_COLUMN_ID` int(19) NOT NULL AUTO_INCREMENT,
  `CONTENT_ID` int(19) NOT NULL,
  `TEXT` varchar(100) NOT NULL,
  `DATAINDEX` varchar(100) NOT NULL,
  `WIDTH` int(3) NOT NULL,
  `ALIGN` varchar(20) NOT NULL DEFAULT 'left',
  `DATA_TYPE` varchar(100) NOT NULL,
  `STORE` varchar(100) NOT NULL,
  `DISPLAY_FIELD` varchar(100) NOT NULL,
  `EDITABLE` tinyint(1) NOT NULL DEFAULT '0',
  `INDEX` int(19) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`GRIDPANEL_COLUMN_ID`),
  KEY `CONTENT_ID` (`CONTENT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- RELATIONS FOR TABLE `GRIDPANEL_COLUMNS`:
--   `CONTENT_ID`
--       `CONTENTS` -> `CONTENT_ID`
--

--
-- Dumping data for table `GRIDPANEL_COLUMNS`
--

INSERT INTO `GRIDPANEL_COLUMNS` (`GRIDPANEL_COLUMN_ID`, `CONTENT_ID`, `TEXT`, `DATAINDEX`, `WIDTH`, `ALIGN`, `DATA_TYPE`, `STORE`, `DISPLAY_FIELD`, `EDITABLE`, `INDEX`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'Company Name', 'COMPANY_NAME', 220, 'left', 'string', '', '', 1, 20, '2013-01-29 11:06:42', '2013-01-30 16:34:36'),
(2, 1, 'Style', 'STYLE', 70, 'center', 'string', '', '', 1, 30, '2013-01-29 11:09:17', '2013-01-30 17:04:35'),
(3, 1, 'Investor Type', 'INVESTOR_TYPE', 200, 'left', 'combobox', 'InvestorTypes', 'INVESTOR_TYPE', 1, 40, '2013-01-29 11:20:27', '2013-01-30 16:34:36'),
(4, 1, 'Equity Assets', 'EQUITY_ASSETS', 80, 'center', 'int', '', '', 1, 50, '2013-01-29 11:20:53', '2013-01-30 17:04:00'),
(5, 1, 'Office Location', 'LOCATION', 150, 'left', 'combobox', 'InvestorLocations', 'LOCATION', 1, 60, '2013-01-29 11:21:25', '2013-01-30 16:34:36'),
(6, 1, 'Last Data Update', 'MODIFIED_DATE', 120, 'center', 'string', '', '', 0, 70, '2013-01-29 11:21:57', '2013-01-31 10:08:32'),
(8, 2, 'Location ID', 'LOCATION_ID', 80, 'center', 'int', '', '', 0, 0, '2013-01-30 17:29:26', '2013-01-31 19:49:59'),
(9, 2, 'Location', 'LOCATION', 100, 'left', 'string', '', '', 1, 0, '2013-01-30 17:30:09', '2013-01-30 11:24:00'),
(10, 2, 'Created Date', 'CREATED_DATE', 200, 'center', 'string', '', '', 0, 0, '2013-01-30 17:30:09', '2013-01-31 19:48:51'),
(11, 2, 'Modified Date', 'MODIFIED_DATE', 200, 'center', 'string', '', '', 0, 0, '2013-01-30 17:30:09', '2013-01-31 19:48:17'),
(12, 3, 'Investor Type ID', 'INVESTOR_TYPE_ID', 130, 'center', 'int', '', '', 0, 0, '2013-01-30 17:44:46', '2013-01-31 19:49:35'),
(13, 3, 'Investor Type', 'INVESTOR_TYPE', 220, 'left', 'string', '', '', 1, 0, '2013-01-30 17:45:34', '2013-01-30 11:24:00'),
(14, 3, 'Created Date', 'CREATED_DATE', 150, 'center', 'string', '', '', 0, 0, '2013-01-30 17:45:34', '2013-01-31 19:48:58'),
(15, 3, 'Modified Date', 'MODIFIED_DATE', 150, 'center', 'string', '', '', 0, 0, '2013-01-30 17:45:34', '2013-01-31 19:48:34'),
(16, 1, 'Investor ID', 'INVESTOR_ID', 90, 'center', 'int', '', '', 0, 10, '2013-01-30 23:35:25', '2013-01-30 17:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `GRIDPANEL_COLUMN_STORE`
--

CREATE TABLE IF NOT EXISTS `GRIDPANEL_COLUMN_STORE` (
  `GRIDPANEL_COLUMN_ID` int(19) NOT NULL,
  `STORE_ID` int(19) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`GRIDPANEL_COLUMN_ID`,`STORE_ID`),
  KEY `STORE_ID` (`STORE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `GRIDPANEL_COLUMN_STORE`:
--   `GRIDPANEL_COLUMN_ID`
--       `GRIDPANEL_COLUMNS` -> `GRIDPANEL_COLUMN_ID`
--   `STORE_ID`
--       `STORES` -> `STORE_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `INVESTORS`
--

CREATE TABLE IF NOT EXISTS `INVESTORS` (
  `INVESTOR_ID` int(19) NOT NULL AUTO_INCREMENT,
  `INVESTOR_TYPE_ID` int(19) NOT NULL,
  `LOCATION_ID` int(19) NOT NULL,
  `COMPANY_NAME` varchar(100) NOT NULL,
  `STYLE` varchar(100) NOT NULL,
  `EQUITY_ASSETS` int(11) NOT NULL,
  `PHONE_1` varchar(30) DEFAULT NULL,
  `PHONE_2` varchar(30) DEFAULT NULL,
  `FAX` varchar(30) DEFAULT NULL,
  `EMAIL_1` varchar(100) DEFAULT NULL,
  `EMAIL_2` varchar(100) DEFAULT NULL,
  `WEBSITE` varchar(100) DEFAULT NULL,
  `ADDRESS` text,
  `COMPANY_OVERVIEW` text,
  `INVESTMENT_STRATEGY` text,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`INVESTOR_ID`),
  KEY `INVESTOR_TYPE_ID` (`INVESTOR_TYPE_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=88 ;

--
-- RELATIONS FOR TABLE `INVESTORS`:
--   `INVESTOR_TYPE_ID`
--       `INVESTOR_TYPE` -> `INVESTOR_TYPE_ID`
--   `LOCATION_ID`
--       `LOCATIONS` -> `LOCATION_ID`
--

--
-- Dumping data for table `INVESTORS`
--

INSERT INTO `INVESTORS` (`INVESTOR_ID`, `INVESTOR_TYPE_ID`, `LOCATION_ID`, `COMPANY_NAME`, `STYLE`, `EQUITY_ASSETS`, `PHONE_1`, `PHONE_2`, `FAX`, `EMAIL_1`, `EMAIL_2`, `WEBSITE`, `ADDRESS`, `COMPANY_OVERVIEW`, `INVESTMENT_STRATEGY`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, '+61 2 9270 0300', NULL, '+61 2 9270 0310', 'admin@google.com', NULL, 'www.google.com', 'Level 23, Alfred Street<br/>\r\nSydney 2000', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', '2013-01-29 15:28:08', '2013-01-31 21:56:27'),
(2, 1, 2, 'Chilla Asset Management Ltd.', 'GARP', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:00', '2013-01-31 15:44:41'),
(3, 1, 3, 'Merryll Linch Asset Management Ltd.', 'GARP', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:12', '2013-01-31 15:44:41'),
(4, 1, 4, 'Citi Asset Management Ltd.', 'GARP', 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:18', '2013-01-31 15:44:41'),
(5, 1, 5, 'Big Asset Management Ltd.', 'GARP', 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:19', '2013-01-31 15:44:41'),
(6, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:21', '2013-01-31 15:44:41'),
(7, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:22', '2013-01-31 15:44:41'),
(8, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:23', '2013-01-31 15:44:41'),
(9, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:23', '2013-01-31 15:44:41'),
(10, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:24', '2013-01-31 15:44:41'),
(11, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:25', '2013-01-31 15:44:41'),
(12, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:26', '2013-01-31 15:44:41'),
(13, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:27', '2013-01-31 15:44:41'),
(14, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:27', '2013-01-31 15:44:41'),
(15, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:28', '2013-01-31 15:44:41'),
(16, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:29', '2013-01-31 15:44:41'),
(17, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:29', '2013-01-31 15:44:41'),
(18, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:30', '2013-01-31 15:44:41'),
(19, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:31', '2013-01-31 15:44:41'),
(20, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 15:44:32', '2013-01-31 15:44:41'),
(21, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:27', '2013-01-31 15:44:41'),
(22, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:35', '2013-01-31 15:44:41'),
(23, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:37', '2013-01-31 15:44:41'),
(24, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:38', '2013-01-31 15:44:41'),
(25, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:44', '2013-01-31 15:44:41'),
(26, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:45', '2013-01-31 15:44:41'),
(27, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:46', '2013-01-31 15:44:41'),
(28, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:53', '2013-01-31 15:44:41'),
(29, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:54', '2013-01-31 15:44:41'),
(30, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:55', '2013-01-31 15:44:41'),
(31, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:56', '2013-01-31 15:44:41'),
(32, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:56', '2013-01-31 15:44:41'),
(33, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-29 17:25:57', '2013-01-31 15:44:41'),
(34, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(35, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(36, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(37, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(38, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(39, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(40, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(41, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(42, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:36', '2013-01-31 15:44:41'),
(43, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(44, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(45, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(46, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(47, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(48, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(49, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(50, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(51, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(52, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(53, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(54, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(55, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(56, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(57, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:37', '2013-01-31 15:44:41'),
(58, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(59, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(60, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(61, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(62, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(63, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(64, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(65, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(66, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(67, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(68, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(69, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41');
INSERT INTO `INVESTORS` (`INVESTOR_ID`, `INVESTOR_TYPE_ID`, `LOCATION_ID`, `COMPANY_NAME`, `STYLE`, `EQUITY_ASSETS`, `PHONE_1`, `PHONE_2`, `FAX`, `EMAIL_1`, `EMAIL_2`, `WEBSITE`, `ADDRESS`, `COMPANY_OVERVIEW`, `INVESTMENT_STRATEGY`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(70, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(71, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(72, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(73, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(74, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(75, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:38', '2013-01-31 15:44:41'),
(76, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(77, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(78, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(79, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(80, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(81, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(82, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(83, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(84, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(85, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(86, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:39', '2013-01-31 15:44:41'),
(87, 1, 1, 'Treasury Asia Asset Management Ltd.', 'GARP', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec velit odio, semper vel egestas ac, mattis non elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur a tempus dolor. Pellentesque blandit consequat urna ac euismod. Donec in turpis non ante fermentum dictum nec nec ligula. Fusce non orci nisi. Nunc volutpat volutpat dui ut eleifend. Morbi pretium dui in ipsum condimentum quis volutpat risus sagittis. Aenean metus sapien, egestas in pretium sollicitudin, tincidunt mollis enim. ', NULL, '2013-01-30 11:30:40', '2013-01-31 15:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `INVESTOR_KEY_PERSONS`
--

CREATE TABLE IF NOT EXISTS `INVESTOR_KEY_PERSONS` (
  `INVESTOR_KEY_PERSON_ID` int(19) NOT NULL AUTO_INCREMENT,
  `INVESTOR_ID` int(19) NOT NULL,
  `FNAME` varchar(100) NOT NULL,
  `LNAME` varchar(100) NOT NULL,
  `POSITION` varchar(100) NOT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`INVESTOR_KEY_PERSON_ID`),
  KEY `INVESTOR_ID` (`INVESTOR_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- RELATIONS FOR TABLE `INVESTOR_KEY_PERSONS`:
--   `INVESTOR_ID`
--       `INVESTORS` -> `INVESTOR_ID`
--

--
-- Dumping data for table `INVESTOR_KEY_PERSONS`
--

INSERT INTO `INVESTOR_KEY_PERSONS` (`INVESTOR_KEY_PERSON_ID`, `INVESTOR_ID`, `FNAME`, `LNAME`, `POSITION`, `PHONE`, `EMAIL`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'Peter', 'Sartory', 'Chief Investment Officer', NULL, NULL, '2013-02-01 00:14:18', '2013-01-31 17:14:18'),
(2, 1, 'Ushanti', 'Jayasinghe, CFA', 'Analyst - Equity', NULL, NULL, '2013-02-01 00:14:50', '2013-01-31 17:14:50'),
(3, 1, 'Peter', 'Sartory', 'Chief Investment Officer', NULL, NULL, '2013-02-01 00:47:57', '2013-01-31 17:47:57'),
(4, 1, 'Peter', 'Sartory', 'Chief Investment Officer', NULL, NULL, '2013-02-01 00:48:03', '2013-01-31 17:48:03'),
(5, 1, 'Peter', 'Sartory', 'Chief Investment Officer', NULL, NULL, '2013-02-01 00:48:03', '2013-01-31 17:48:03'),
(6, 1, 'Peter', 'Sartory', 'Chief Investment Officer', NULL, NULL, '2013-02-01 00:48:03', '2013-01-31 17:48:03'),
(7, 1, 'Peter', 'Sartory', 'Chief Investment Officer', NULL, NULL, '2013-02-01 00:48:03', '2013-01-31 17:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `INVESTOR_TYPE`
--

CREATE TABLE IF NOT EXISTS `INVESTOR_TYPE` (
  `INVESTOR_TYPE_ID` int(19) NOT NULL AUTO_INCREMENT,
  `INVESTOR_TYPE` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`INVESTOR_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `INVESTOR_TYPE`
--

INSERT INTO `INVESTOR_TYPE` (`INVESTOR_TYPE_ID`, `INVESTOR_TYPE`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 'Investment Advisor', '2013-01-28 18:14:49', '2013-01-28 04:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `ITEMS`
--

CREATE TABLE IF NOT EXISTS `ITEMS` (
  `ITEM_ID` int(19) NOT NULL AUTO_INCREMENT,
  `TREE_PANEL_ID` int(19) NOT NULL,
  `XTYPE` varchar(100) NOT NULL,
  `ID` varchar(100) NOT NULL,
  `REGION` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ITEM_ID`),
  KEY `TREE_PANEL_ID` (`TREE_PANEL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- RELATIONS FOR TABLE `ITEMS`:
--   `TREE_PANEL_ID`
--       `TREE_PANEL` -> `TREE_PANEL_ID`
--

--
-- Dumping data for table `ITEMS`
--

INSERT INTO `ITEMS` (`ITEM_ID`, `TREE_PANEL_ID`, `XTYPE`, `ID`, `REGION`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'gridpanel', 'investors-list-investors-tabs', 'center', '2013-01-28 20:46:20', '2013-01-28 13:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `LOCATIONS`
--

CREATE TABLE IF NOT EXISTS `LOCATIONS` (
  `LOCATION_ID` int(19) NOT NULL AUTO_INCREMENT,
  `LOCATION` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `LOCATIONS`
--

INSERT INTO `LOCATIONS` (`LOCATION_ID`, `LOCATION`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 'Australia', '2013-01-28 18:16:45', '2013-01-28 04:16:45'),
(2, 'Singapore', '2013-01-28 18:16:53', '2013-01-28 04:16:53'),
(3, 'China', '2013-01-31 17:33:56', '2013-01-31 10:33:56'),
(4, 'US', '2013-01-31 17:34:01', '2013-01-31 10:34:01'),
(5, 'UK', '2013-01-31 17:34:06', '2013-01-31 10:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `MEETING_ACTIVITIES`
--

CREATE TABLE IF NOT EXISTS `MEETING_ACTIVITIES` (
  `MEETING_ACTIVITY_ID` int(19) NOT NULL AUTO_INCREMENT,
  `INVESTOR_ID` int(19) NOT NULL,
  `MEETING_ACTIVITY_NAME` varchar(100) NOT NULL,
  `MEETING_DATE` date NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MEETING_ACTIVITY_ID`),
  KEY `INVESTOR_ID` (`INVESTOR_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- RELATIONS FOR TABLE `MEETING_ACTIVITIES`:
--   `INVESTOR_ID`
--       `INVESTORS` -> `INVESTOR_ID`
--

--
-- Dumping data for table `MEETING_ACTIVITIES`
--

INSERT INTO `MEETING_ACTIVITIES` (`MEETING_ACTIVITY_ID`, `INVESTOR_ID`, `MEETING_ACTIVITY_NAME`, `MEETING_DATE`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'MLAsian Stars 2011', '2011-05-20', '2013-02-01 01:31:36', '2013-01-31 18:31:36'),
(2, 1, 'MLAsian Stars 2011 - 2', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(3, 1, 'MLAsian Stars 2011 - 3', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(4, 1, 'MLAsian Stars 2011 - 4', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(5, 1, 'MLAsian Stars 2011 - 5', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(6, 1, 'MLAsian Stars 2011 - 6', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(7, 1, 'MLAsian Stars 2011 - 7', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(8, 1, 'MLAsian Stars 2011 - 8', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15'),
(9, 1, 'MLAsian Stars 2011 - 9', '2011-05-20', '2013-02-01 01:32:15', '2013-01-31 18:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `MEETING_ACTIVITY_DOCUMENTS`
--

CREATE TABLE IF NOT EXISTS `MEETING_ACTIVITY_DOCUMENTS` (
  `MEETING_ACTIVITY_DOCUMENT_ID` int(19) NOT NULL AUTO_INCREMENT,
  `MEETING_ACTIVITY_ID` int(19) NOT NULL,
  `DOCUMENT_TITLE` varchar(100) NOT NULL,
  `FILE_NAME` varchar(100) NOT NULL,
  `SIZE` int(19) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MEETING_ACTIVITY_DOCUMENT_ID`),
  KEY `MEETING_ACTIVITY_ID` (`MEETING_ACTIVITY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- RELATIONS FOR TABLE `MEETING_ACTIVITY_DOCUMENTS`:
--   `MEETING_ACTIVITY_ID`
--       `MEETING_ACTIVITIES` -> `MEETING_ACTIVITY_ID`
--

--
-- Dumping data for table `MEETING_ACTIVITY_DOCUMENTS`
--

INSERT INTO `MEETING_ACTIVITY_DOCUMENTS` (`MEETING_ACTIVITY_DOCUMENT_ID`, `MEETING_ACTIVITY_ID`, `DOCUMENT_TITLE`, `FILE_NAME`, `SIZE`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'Meeting Documentation #1', 'meeting_doc1.docx', 129330, '2013-02-01 05:14:09', '2013-01-31 22:14:09'),
(2, 1, 'Meeting Documentation #2', 'meeting_doc2.docx', 154972, '2013-02-01 05:14:23', '2013-01-31 22:15:26'),
(3, 1, 'Meeting Documentation #3', 'meeting_doc3.docx', 54330, '2013-02-01 05:15:01', '2013-01-31 22:15:01'),
(4, 1, 'Meeting Documentation #4', 'meeting_doc4.docx', 19230, '2013-02-01 05:15:01', '2013-01-31 22:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `MEETING_ACTIVITY_PERSONS`
--

CREATE TABLE IF NOT EXISTS `MEETING_ACTIVITY_PERSONS` (
  `MEETING_ACTIVITY_ID` int(19) NOT NULL,
  `INVESTOR_KEY_PERSON_ID` int(19) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MEETING_ACTIVITY_ID`,`INVESTOR_KEY_PERSON_ID`),
  KEY `INVESTOR_KEY_PERSON_ID` (`INVESTOR_KEY_PERSON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `MEETING_ACTIVITY_PERSONS`:
--   `MEETING_ACTIVITY_ID`
--       `MEETING_ACTIVITIES` -> `MEETING_ACTIVITY_ID`
--   `INVESTOR_KEY_PERSON_ID`
--       `INVESTOR_KEY_PERSONS` -> `INVESTOR_KEY_PERSON_ID`
--

--
-- Dumping data for table `MEETING_ACTIVITY_PERSONS`
--

INSERT INTO `MEETING_ACTIVITY_PERSONS` (`MEETING_ACTIVITY_ID`, `INVESTOR_KEY_PERSON_ID`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, '2013-02-01 03:29:21', '0000-00-00 00:00:00'),
(1, 2, '2013-02-01 03:29:21', '0000-00-00 00:00:00'),
(1, 3, '2013-02-01 03:29:21', '0000-00-00 00:00:00'),
(1, 4, '2013-02-01 03:29:21', '0000-00-00 00:00:00'),
(1, 5, '2013-02-01 03:29:21', '0000-00-00 00:00:00'),
(1, 6, '2013-02-01 03:29:21', '0000-00-00 00:00:00'),
(1, 7, '2013-02-01 03:29:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `MODELS`
--

CREATE TABLE IF NOT EXISTS `MODELS` (
  `MODEL_ID` int(19) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MODEL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `MODELS`
--

INSERT INTO `MODELS` (`MODEL_ID`, `NAME`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 'Investor', '2013-01-29 11:30:50', '2013-01-29 04:30:50'),
(2, 'InvestorLocation', '2013-01-30 17:26:08', '2013-01-30 10:26:08'),
(3, 'InvestorType', '2013-01-30 17:40:43', '2013-01-30 10:40:43'),
(4, 'KeyPerson', '2013-02-01 00:15:35', '2013-01-31 17:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `MODEL_FIELDS`
--

CREATE TABLE IF NOT EXISTS `MODEL_FIELDS` (
  `MODEL_FIELD_ID` int(19) NOT NULL AUTO_INCREMENT,
  `MODEL_ID` int(19) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TYPE` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MODEL_FIELD_ID`),
  KEY `MODEL_ID` (`MODEL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- RELATIONS FOR TABLE `MODEL_FIELDS`:
--   `MODEL_ID`
--       `MODELS` -> `MODEL_ID`
--

--
-- Dumping data for table `MODEL_FIELDS`
--

INSERT INTO `MODEL_FIELDS` (`MODEL_FIELD_ID`, `MODEL_ID`, `NAME`, `TYPE`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'COMPANY_NAME', 'string', '2013-01-29 11:31:29', '2013-01-29 04:31:29'),
(2, 1, 'STYLE', 'string', '2013-01-29 11:31:44', '2013-01-29 04:31:44'),
(3, 1, 'INVESTOR_TYPE', 'string', '2013-01-29 11:32:00', '2013-01-29 04:32:00'),
(4, 1, 'EQUITY_ASSETS', 'int', '2013-01-29 11:32:16', '2013-01-29 04:32:16'),
(5, 1, 'LOCATION', 'string', '2013-01-29 11:32:37', '2013-01-29 04:32:37'),
(6, 1, 'MODIFIED_DATE', 'string', '2013-01-29 11:33:03', '2013-01-29 04:33:03'),
(8, 2, 'LOCATION_ID', 'int', '2013-01-30 17:27:05', '2013-01-30 10:27:05'),
(9, 2, 'LOCATION', 'string', '2013-01-30 17:27:17', '2013-01-30 10:27:17'),
(10, 2, 'CREATED_DATE', 'string', '2013-01-30 17:27:38', '2013-01-30 10:27:38'),
(11, 2, 'MODIFIED_DATE', 'string', '2013-01-30 17:27:38', '2013-01-30 10:27:38'),
(12, 3, 'INVESTOR_TYPE_ID', 'int', '2013-01-30 17:41:37', '2013-01-30 10:41:37'),
(13, 3, 'INVESTOR_TYPE', 'string', '2013-01-30 17:42:10', '2013-01-30 10:42:10'),
(14, 3, 'CREATED_DATE', 'string', '2013-01-30 17:42:11', '2013-01-30 10:42:11'),
(15, 3, 'MODIFIED_DATE', 'string', '2013-01-30 17:42:11', '2013-01-30 10:42:11'),
(16, 1, 'INVESTOR_ID', 'int', '2013-01-30 23:37:05', '2013-01-30 16:37:05'),
(17, 4, 'FNAME', 'string', '2013-02-01 00:16:12', '2013-01-31 17:16:12'),
(18, 4, 'LNAME', 'string', '2013-02-01 00:17:09', '2013-01-31 17:17:09'),
(19, 4, 'POSITION', 'string', '2013-02-01 00:17:09', '2013-01-31 17:17:09'),
(20, 4, 'PHONE', 'string', '2013-02-01 00:17:09', '2013-01-31 17:17:09'),
(21, 4, 'EMAIL', 'string', '2013-02-01 00:17:09', '2013-01-31 17:17:09'),
(22, 4, 'CREATED_DATE', 'string', '2013-02-01 00:17:09', '2013-01-31 17:17:09'),
(23, 4, 'MODIFIED_DATE', 'string', '2013-02-01 00:17:10', '2013-01-31 17:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `STORES`
--

CREATE TABLE IF NOT EXISTS `STORES` (
  `STORE_ID` int(19) NOT NULL AUTO_INCREMENT,
  `MODEL_ID` int(19) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PROXY_TYPE` varchar(100) NOT NULL,
  `PROXY_API_READ` varchar(255) NOT NULL,
  `PROXY_API_CREATE` varchar(255) NOT NULL,
  `PROXY_API_UPDATE` varchar(255) NOT NULL,
  `PROXY_API_DESTROY` varchar(255) NOT NULL,
  `PROXY_READER_IDPROPERTY` varchar(100) NOT NULL,
  `PROXY_READER_TYPE` varchar(100) NOT NULL,
  `PROXY_READER_ROOT` varchar(100) NOT NULL,
  `PROXY_READER_TOTALPROPERTY` varchar(100) NOT NULL,
  `PROXY_WRITER_TYPE` varchar(100) NOT NULL,
  `PROXY_WRITER_WRITEALLFIELDS` tinyint(1) NOT NULL DEFAULT '0',
  `PROXY_WRITER_ROOT` varchar(100) NOT NULL,
  `SORTERS_PROPERTY` varchar(100) NOT NULL,
  `SORTERS_DIRECTION` varchar(10) NOT NULL DEFAULT 'ASC',
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`STORE_ID`),
  KEY `MODEL_ID` (`MODEL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- RELATIONS FOR TABLE `STORES`:
--   `MODEL_ID`
--       `MODELS` -> `MODEL_ID`
--

--
-- Dumping data for table `STORES`
--

INSERT INTO `STORES` (`STORE_ID`, `MODEL_ID`, `NAME`, `PROXY_TYPE`, `PROXY_API_READ`, `PROXY_API_CREATE`, `PROXY_API_UPDATE`, `PROXY_API_DESTROY`, `PROXY_READER_IDPROPERTY`, `PROXY_READER_TYPE`, `PROXY_READER_ROOT`, `PROXY_READER_TOTALPROPERTY`, `PROXY_WRITER_TYPE`, `PROXY_WRITER_WRITEALLFIELDS`, `PROXY_WRITER_ROOT`, `SORTERS_PROPERTY`, `SORTERS_DIRECTION`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'Investors', 'ajax', '/investors/request/list-investors', '/investors/request/add-investors', '/investors/request/edit-investors', '/investors/request/delete-investors', 'INVESTOR_ID', 'json', 'data.items', 'data.totalCount', 'json', 0, 'data.items', 'INVESTOR_ID', 'ASC', '2013-01-29 13:42:24', '2013-01-31 08:36:30'),
(2, 2, 'InvestorLocations', 'ajax', '/investors/request/list-locations', '/investors/request/add-locations', '/investors/request/edit-locations', '/investors/request/delete-locations', 'LOCATION_ID', 'json', 'data.items', 'data.totalCount', 'json', 0, 'data.items', 'LOCATION_ID', 'ASC', '2013-01-30 17:28:54', '2013-01-31 08:33:18'),
(3, 3, 'InvestorTypes', 'ajax', '/investors/request/list-investortype', '/investors/request/add-investortype', '/investors/request/edit-investortype', '/investors/request/delete-investortype', 'INVESTOR_TYPE_ID', 'json', 'data.items', 'data.totalCount', 'json', 0, 'data.items', 'INVESTOR_TYPE_ID', 'ASC', '2013-01-30 17:43:27', '2013-01-31 08:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `TREE_PANEL`
--

CREATE TABLE IF NOT EXISTS `TREE_PANEL` (
  `TREE_PANEL_ID` int(19) NOT NULL AUTO_INCREMENT,
  `ID` varchar(100) NOT NULL,
  `TITLE` varchar(100) NOT NULL,
  `ROOTVISIBLE` tinyint(1) NOT NULL DEFAULT '0',
  `AUTOSCROLL` tinyint(1) NOT NULL DEFAULT '1',
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TREE_PANEL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `TREE_PANEL`
--

INSERT INTO `TREE_PANEL` (`TREE_PANEL_ID`, `ID`, `TITLE`, `ROOTVISIBLE`, `AUTOSCROLL`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 'investors-panel', 'Investors', 0, 1, '2013-01-28 19:17:33', '2013-01-28 12:17:33'),
(2, 'shareholdings-panel', 'Shareholdings', 0, 1, '2013-01-28 19:17:55', '2013-01-28 12:17:55'),
(3, 'peers-panel', 'Peers', 0, 1, '2013-01-28 19:18:10', '2013-01-28 12:18:10'),
(4, 'shareprices-panel', 'Shareprices', 0, 1, '2013-01-28 19:18:23', '2013-01-28 12:18:23'),
(5, 'reports-panel', 'Reports', 0, 1, '2013-01-28 19:18:33', '2013-01-28 12:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `TREE_STORE`
--

CREATE TABLE IF NOT EXISTS `TREE_STORE` (
  `TREE_STORE_ID` int(19) NOT NULL AUTO_INCREMENT,
  `TREE_PANEL_ID` int(19) NOT NULL,
  `ID` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TREE_STORE_ID`),
  KEY `TREE_PANEL_ID` (`TREE_PANEL_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- RELATIONS FOR TABLE `TREE_STORE`:
--   `TREE_PANEL_ID`
--       `TREE_PANEL` -> `TREE_PANEL_ID`
--

--
-- Dumping data for table `TREE_STORE`
--

INSERT INTO `TREE_STORE` (`TREE_STORE_ID`, `TREE_PANEL_ID`, `ID`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'investors-tree-store', '2013-01-28 19:18:59', '2013-01-28 12:18:59'),
(2, 2, 'shareholdings-tree-store', '2013-01-28 19:19:13', '2013-01-28 12:19:13'),
(3, 3, 'peers-tree-store', '2013-01-28 19:19:24', '2013-01-28 12:19:24'),
(4, 4, 'shareprices-tree-store', '2013-01-28 19:19:36', '2013-01-28 12:19:36'),
(5, 5, 'reports-tree-store', '2013-01-28 19:19:46', '2013-01-28 12:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `TREE_STORE_CHILDREN`
--

CREATE TABLE IF NOT EXISTS `TREE_STORE_CHILDREN` (
  `TREE_STORE_CHILDREN_ID` int(19) NOT NULL AUTO_INCREMENT,
  `TREE_STORE_ID` int(19) NOT NULL,
  `TEXT` varchar(100) NOT NULL,
  `ID` varchar(100) NOT NULL,
  `LEAF` tinyint(1) NOT NULL DEFAULT '1',
  `CREATED_DATE` datetime NOT NULL,
  `MODIFIED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TREE_STORE_CHILDREN_ID`),
  KEY `TREE_STORE_ID` (`TREE_STORE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- RELATIONS FOR TABLE `TREE_STORE_CHILDREN`:
--   `TREE_STORE_ID`
--       `TREE_STORE` -> `TREE_STORE_ID`
--

--
-- Dumping data for table `TREE_STORE_CHILDREN`
--

INSERT INTO `TREE_STORE_CHILDREN` (`TREE_STORE_CHILDREN_ID`, `TREE_STORE_ID`, `TEXT`, `ID`, `LEAF`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 1, 'Investor List', 'investors-list-investors', 1, '2013-01-28 19:51:37', '2013-01-28 12:51:37'),
(2, 1, 'Investor Type', 'investors-investor-type', 1, '2013-01-30 17:21:01', '2013-01-30 10:21:01'),
(3, 1, 'Investor Location', 'investors-investor-location', 1, '2013-01-30 17:21:50', '2013-01-30 10:21:50');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CONTENTS`
--
ALTER TABLE `CONTENTS`
  ADD CONSTRAINT `CONTENTS_ibfk_1` FOREIGN KEY (`TREE_STORE_CHILDREN_ID`) REFERENCES `TREE_STORE_CHILDREN` (`TREE_STORE_CHILDREN_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `CONTENT_MODEL`
--
ALTER TABLE `CONTENT_MODEL`
  ADD CONSTRAINT `CONTENT_MODEL_ibfk_1` FOREIGN KEY (`CONTENT_ID`) REFERENCES `CONTENTS` (`CONTENT_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CONTENT_MODEL_ibfk_2` FOREIGN KEY (`MODEL_ID`) REFERENCES `MODELS` (`MODEL_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `CONTENT_TBAR`
--
ALTER TABLE `CONTENT_TBAR`
  ADD CONSTRAINT `CONTENT_TBAR_ibfk_1` FOREIGN KEY (`CONTENT_ID`) REFERENCES `CONTENTS` (`CONTENT_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `CONTENT_TBAR_LISTENER`
--
ALTER TABLE `CONTENT_TBAR_LISTENER`
  ADD CONSTRAINT `CONTENT_TBAR_LISTENER_ibfk_1` FOREIGN KEY (`CONTENT_TBAR_ID`) REFERENCES `CONTENT_TBAR` (`CONTENT_TBAR_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `GRIDPANEL_COLUMNS`
--
ALTER TABLE `GRIDPANEL_COLUMNS`
  ADD CONSTRAINT `GRIDPANEL_COLUMNS_ibfk_1` FOREIGN KEY (`CONTENT_ID`) REFERENCES `CONTENTS` (`CONTENT_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `GRIDPANEL_COLUMN_STORE`
--
ALTER TABLE `GRIDPANEL_COLUMN_STORE`
  ADD CONSTRAINT `GRIDPANEL_COLUMN_STORE_ibfk_1` FOREIGN KEY (`GRIDPANEL_COLUMN_ID`) REFERENCES `GRIDPANEL_COLUMNS` (`GRIDPANEL_COLUMN_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `GRIDPANEL_COLUMN_STORE_ibfk_2` FOREIGN KEY (`STORE_ID`) REFERENCES `STORES` (`STORE_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `INVESTORS`
--
ALTER TABLE `INVESTORS`
  ADD CONSTRAINT `INVESTORS_ibfk_1` FOREIGN KEY (`INVESTOR_TYPE_ID`) REFERENCES `INVESTOR_TYPE` (`INVESTOR_TYPE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `INVESTORS_ibfk_2` FOREIGN KEY (`LOCATION_ID`) REFERENCES `LOCATIONS` (`LOCATION_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `INVESTOR_KEY_PERSONS`
--
ALTER TABLE `INVESTOR_KEY_PERSONS`
  ADD CONSTRAINT `INVESTOR_KEY_PERSONS_ibfk_1` FOREIGN KEY (`INVESTOR_ID`) REFERENCES `INVESTORS` (`INVESTOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ITEMS`
--
ALTER TABLE `ITEMS`
  ADD CONSTRAINT `ITEMS_ibfk_1` FOREIGN KEY (`TREE_PANEL_ID`) REFERENCES `TREE_PANEL` (`TREE_PANEL_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `MEETING_ACTIVITIES`
--
ALTER TABLE `MEETING_ACTIVITIES`
  ADD CONSTRAINT `MEETING_ACTIVITIES_ibfk_1` FOREIGN KEY (`INVESTOR_ID`) REFERENCES `INVESTORS` (`INVESTOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MEETING_ACTIVITY_DOCUMENTS`
--
ALTER TABLE `MEETING_ACTIVITY_DOCUMENTS`
  ADD CONSTRAINT `MEETING_ACTIVITY_DOCUMENTS_ibfk_1` FOREIGN KEY (`MEETING_ACTIVITY_ID`) REFERENCES `MEETING_ACTIVITIES` (`MEETING_ACTIVITY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MEETING_ACTIVITY_PERSONS`
--
ALTER TABLE `MEETING_ACTIVITY_PERSONS`
  ADD CONSTRAINT `MEETING_ACTIVITY_PERSONS_ibfk_1` FOREIGN KEY (`MEETING_ACTIVITY_ID`) REFERENCES `MEETING_ACTIVITIES` (`MEETING_ACTIVITY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `MEETING_ACTIVITY_PERSONS_ibfk_2` FOREIGN KEY (`INVESTOR_KEY_PERSON_ID`) REFERENCES `INVESTOR_KEY_PERSONS` (`INVESTOR_KEY_PERSON_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MODEL_FIELDS`
--
ALTER TABLE `MODEL_FIELDS`
  ADD CONSTRAINT `MODEL_FIELDS_ibfk_1` FOREIGN KEY (`MODEL_ID`) REFERENCES `MODELS` (`MODEL_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `STORES`
--
ALTER TABLE `STORES`
  ADD CONSTRAINT `STORES_ibfk_1` FOREIGN KEY (`MODEL_ID`) REFERENCES `MODELS` (`MODEL_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `TREE_STORE`
--
ALTER TABLE `TREE_STORE`
  ADD CONSTRAINT `TREE_STORE_ibfk_1` FOREIGN KEY (`TREE_PANEL_ID`) REFERENCES `TREE_PANEL` (`TREE_PANEL_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `TREE_STORE_CHILDREN`
--
ALTER TABLE `TREE_STORE_CHILDREN`
  ADD CONSTRAINT `TREE_STORE_CHILDREN_ibfk_1` FOREIGN KEY (`TREE_STORE_ID`) REFERENCES `TREE_STORE` (`TREE_STORE_ID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
