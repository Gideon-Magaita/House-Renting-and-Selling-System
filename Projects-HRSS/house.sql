-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2023 at 10:07 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `house`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'House Owner'),
(2, 'tenant'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add house', 7, 'add_house'),
(26, 'Can change house', 7, 'change_house'),
(27, 'Can delete house', 7, 'delete_house'),
(28, 'Can view house', 7, 'view_house'),
(29, 'Can add house type', 8, 'add_housetype'),
(30, 'Can change house type', 8, 'change_housetype'),
(31, 'Can delete house type', 8, 'delete_housetype'),
(32, 'Can view house type', 8, 'view_housetype'),
(33, 'Can add chatroom', 9, 'add_chatroom'),
(34, 'Can change chatroom', 9, 'change_chatroom'),
(35, 'Can delete chatroom', 9, 'delete_chatroom'),
(36, 'Can view chatroom', 9, 'view_chatroom'),
(37, 'Can add message', 10, 'add_message'),
(38, 'Can change message', 10, 'change_message'),
(39, 'Can delete message', 10, 'delete_message'),
(40, 'Can view message', 10, 'view_message'),
(41, 'Can add feedback', 11, 'add_feedback'),
(42, 'Can change feedback', 11, 'change_feedback'),
(43, 'Can delete feedback', 11, 'delete_feedback'),
(44, 'Can view feedback', 11, 'view_feedback'),
(45, 'Can add tenant message', 12, 'add_tenantmessage'),
(46, 'Can change tenant message', 12, 'change_tenantmessage'),
(47, 'Can delete tenant message', 12, 'delete_tenantmessage'),
(48, 'Can view tenant message', 12, 'view_tenantmessage'),
(49, 'Can add owner message', 13, 'add_ownermessage'),
(50, 'Can change owner message', 13, 'change_ownermessage'),
(51, 'Can delete owner message', 13, 'delete_ownermessage'),
(52, 'Can view owner message', 13, 'view_ownermessage'),
(53, 'Can add location', 14, 'add_location'),
(54, 'Can change location', 14, 'change_location'),
(55, 'Can delete location', 14, 'delete_location'),
(56, 'Can view location', 14, 'view_location'),
(57, 'Can add house_location', 15, 'add_house_location'),
(58, 'Can change house_location', 15, 'change_house_location'),
(59, 'Can delete house_location', 15, 'delete_house_location'),
(60, 'Can view house_location', 15, 'view_house_location'),
(61, 'Can add group', 16, 'add_group'),
(62, 'Can change group', 16, 'change_group'),
(63, 'Can delete group', 16, 'delete_group'),
(64, 'Can view group', 16, 'view_group'),
(65, 'Can add agents', 17, 'add_agents'),
(66, 'Can change agents', 17, 'change_agents'),
(67, 'Can delete agents', 17, 'delete_agents'),
(68, 'Can view agents', 17, 'view_agents');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$oeMPsQtFTZWsfbOUrIJ9i4$Agr+kzpiNLuVzjhyaPQBuTJ1nvs6ktmlk1P55IlG3kI=', '2023-06-23 10:03:49.034706', 1, 'stella', '', '', '', 1, 1, '2023-03-18 11:55:19.000000'),
(3, 'pbkdf2_sha256$390000$zAabQZUNTcKfTsncue7aac$oB5p12jiDLPsgMXhUz0XlUY64hEKzP62dJJGWH00Cx4=', '2023-06-23 09:47:15.742559', 0, 'eliza', '', '', 'eliza@gmail.com', 0, 1, '2023-03-18 21:01:19.129772'),
(22, 'pbkdf2_sha256$390000$QF8dQN1yyqzzUDKsAgZmqx$PjzJY4G+LNj8rNGVrmHVRSUpfCTW/KLZMXHFj5j+HSk=', '2023-06-23 09:52:08.178737', 0, 'admin', '', '', '', 0, 1, '2023-05-09 07:49:36.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 12, 1),
(6, 13, 1),
(7, 14, 2),
(8, 15, 1),
(9, 16, 2),
(10, 17, 1),
(11, 18, 1),
(12, 19, 2),
(13, 20, 1),
(14, 21, 2),
(15, 22, 3),
(16, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-18 11:56:09.928515', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(2, '2023-03-18 11:56:14.353565', '2', 'tenant', 1, '[{\"added\": {}}]', 3, 1),
(3, '2023-03-18 11:56:25.225985', '1', 'stella', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(4, '2023-03-18 11:57:01.570995', '1', 'Single-family house', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-03-18 11:57:05.192417', '2', 'Multi-family House', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-03-18 20:43:26.814239', '1', 'Stellah', 1, '[{\"added\": {}}]', 7, 1),
(7, '2023-03-18 20:43:55.767311', '1', 'Stellah', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 7, 1),
(8, '2023-03-18 20:45:24.713554', '2', 'Stellah', 1, '[{\"added\": {}}]', 7, 1),
(9, '2023-03-18 20:56:33.762739', '2', 'magaita', 1, '[{\"added\": {}}]', 4, 1),
(10, '2023-03-18 20:57:04.509217', '2', 'magaita', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(11, '2023-03-22 09:07:17.632023', '1', 'mabibo', 1, '[{\"added\": {}}]', 14, 1),
(12, '2023-03-22 09:16:54.289977', '2', 'mabibo', 1, '[{\"added\": {}}]', 14, 1),
(13, '2023-03-22 09:16:59.497399', '3', 'ilala', 1, '[{\"added\": {}}]', 14, 1),
(14, '2023-03-22 09:17:06.044152', '4', 'kinondoni', 1, '[{\"added\": {}}]', 14, 1),
(15, '2023-03-22 09:17:13.627248', '5', 'bunju', 1, '[{\"added\": {}}]', 14, 1),
(16, '2023-03-22 09:21:34.565771', '6', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(17, '2023-03-22 09:24:15.008127', '8', 'Kigoma', 1, '[{\"added\": {}}]', 14, 1),
(18, '2023-03-22 09:33:56.963166', '9', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(19, '2023-03-22 09:33:59.289866', '10', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(20, '2023-03-22 09:34:00.970458', '11', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(21, '2023-03-22 09:34:02.767926', '12', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(22, '2023-03-22 09:48:03.774007', '13', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(23, '2023-03-22 09:48:05.365644', '14', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(24, '2023-03-22 09:48:06.701998', '15', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(25, '2023-03-22 09:48:08.147153', '16', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(26, '2023-03-22 09:48:09.500318', '17', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(27, '2023-03-22 09:48:10.881049', '18', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(28, '2023-03-22 09:48:12.242532', '19', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(29, '2023-03-22 10:05:08.996335', '22', 'Mabibo', 1, '[{\"added\": {}}]', 14, 1),
(30, '2023-03-22 10:28:28.124356', '25', 'jhdhsdghh', 3, '', 14, 1),
(31, '2023-03-22 15:19:01.262097', '19', 'Stella', 1, '[{\"added\": {}}]', 7, 1),
(32, '2023-03-22 15:42:04.263886', '1', 'sinza madukani', 1, '[{\"added\": {}}]', 15, 1),
(33, '2023-03-22 15:42:10.197331', '2', 'kimara', 1, '[{\"added\": {}}]', 15, 1),
(34, '2023-03-22 20:02:50.438974', '1', 'admin', 1, '[{\"added\": {}}]', 16, 1),
(35, '2023-03-22 20:02:57.087080', '2', 'tenant', 1, '[{\"added\": {}}]', 16, 1),
(36, '2023-03-23 07:13:01.171509', '1', 'House Owner', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(37, '2023-05-09 07:48:27.811849', '3', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(38, '2023-05-09 07:48:33.653460', '3', 'admin', 2, '[]', 3, 1),
(39, '2023-05-09 07:49:36.444189', '22', 'admin', 1, '[{\"added\": {}}]', 4, 1),
(40, '2023-05-09 07:54:01.049700', '22', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(41, '2023-05-10 07:18:34.797815', '22', 'enock', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'houseapp', 'house'),
(8, 'houseapp', 'housetype'),
(9, 'houseapp', 'chatroom'),
(10, 'houseapp', 'message'),
(11, 'houseapp', 'feedback'),
(12, 'houseapp', 'tenantmessage'),
(13, 'houseapp', 'ownermessage'),
(14, 'houseapp', 'location'),
(15, 'houseapp', 'house_location'),
(16, 'houseapp', 'group'),
(17, 'houseapp', 'agents');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-18 11:54:44.592945'),
(2, 'auth', '0001_initial', '2023-03-18 11:54:45.432083'),
(3, 'admin', '0001_initial', '2023-03-18 11:54:45.610206'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-18 11:54:45.616750'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-18 11:54:45.632409'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-18 11:54:45.748426'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-18 11:54:45.795456'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-18 11:54:45.848821'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-18 11:54:45.879936'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-18 11:54:45.917499'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-18 11:54:45.933127'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-18 11:54:45.933127'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-18 11:54:45.980137'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-18 11:54:46.048783'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-18 11:54:46.080187'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-18 11:54:46.095681'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-18 11:54:46.133166'),
(18, 'houseapp', '0001_initial', '2023-03-18 11:54:46.164411'),
(19, 'houseapp', '0002_house_image', '2023-03-18 11:54:46.180172'),
(20, 'houseapp', '0003_housetype_alter_house_number_alter_house_owner', '2023-03-18 11:54:46.365237'),
(21, 'houseapp', '0004_house_category', '2023-03-18 11:54:46.434028'),
(22, 'houseapp', '0005_chatroom_alter_house_category', '2023-03-18 11:54:46.549699'),
(23, 'houseapp', '0006_alter_chatroom_chattitle', '2023-03-18 11:54:46.581085'),
(24, 'houseapp', '0007_house_user', '2023-03-18 11:54:46.634099'),
(25, 'houseapp', '0008_alter_house_user', '2023-03-18 11:54:46.918354'),
(26, 'houseapp', '0009_alter_house_user', '2023-03-18 11:54:47.150349'),
(27, 'houseapp', '0010_alter_house_owner', '2023-03-18 11:54:47.334580'),
(28, 'houseapp', '0011_alter_house_user', '2023-03-18 11:54:47.535274'),
(29, 'houseapp', '0012_remove_house_user_house_user', '2023-03-18 11:54:47.867253'),
(30, 'houseapp', '0013_remove_house_user_house_user', '2023-03-18 11:54:47.998529'),
(31, 'houseapp', '0014_house_purpose', '2023-03-18 11:54:48.167676'),
(32, 'houseapp', '0015_message', '2023-03-18 11:54:48.336794'),
(33, 'sessions', '0001_initial', '2023-03-18 11:54:48.399159'),
(34, 'houseapp', '0016_remove_house_user', '2023-03-18 19:52:41.452918'),
(35, 'houseapp', '0017_house_user', '2023-03-18 19:53:49.317897'),
(36, 'houseapp', '0018_feedback', '2023-03-18 20:02:01.207918'),
(37, 'houseapp', '0019_alter_house_number', '2023-03-18 20:37:38.326656'),
(38, 'houseapp', '0020_alter_feedback_feedback', '2023-03-18 21:23:00.168735'),
(39, 'houseapp', '0021_alter_feedback_feedback', '2023-03-18 21:59:00.299280'),
(40, 'houseapp', '0022_alter_feedback_feedback', '2023-03-18 22:00:20.300419'),
(41, 'houseapp', '0023_alter_house_price', '2023-03-19 05:33:55.825931'),
(42, 'houseapp', '0024_alter_house_price', '2023-03-19 05:37:15.664249'),
(43, 'houseapp', '0025_house_status', '2023-03-19 05:47:16.377459'),
(44, 'houseapp', '0026_ownermessage_tenantmessage_delete_message', '2023-03-19 07:58:29.197149'),
(45, 'houseapp', '0027_alter_ownermessage_timestamp_and_more', '2023-03-19 08:10:46.666419'),
(46, 'houseapp', '0028_alter_feedback_feedback', '2023-03-19 10:13:35.646088'),
(47, 'houseapp', '0029_location', '2023-03-22 08:49:07.300658'),
(48, 'houseapp', '0030_alter_location_name', '2023-03-22 09:29:30.750979'),
(49, 'houseapp', '0031_alter_location_name', '2023-03-22 09:58:20.784614'),
(50, 'houseapp', '0032_rename_name_location_location_name', '2023-03-22 10:34:13.156832'),
(51, 'houseapp', '0033_alter_house_user', '2023-03-22 14:54:43.521645'),
(52, 'houseapp', '0034_alter_house_user', '2023-03-22 14:54:43.917116'),
(53, 'houseapp', '0035_house_location_delete_location', '2023-03-22 15:10:06.962508'),
(54, 'houseapp', '0036_rename_location_name_house_location_location', '2023-03-22 15:12:57.462976'),
(55, 'houseapp', '0029_house_location', '2023-03-22 15:41:35.930316'),
(56, 'houseapp', '0030_group', '2023-03-22 20:01:15.101705'),
(57, 'houseapp', '0030_ownermessage_owner_tenantmessage_tenant', '2023-06-18 21:43:53.607163'),
(58, 'houseapp', '0031_house_video', '2023-06-20 16:58:09.794559'),
(59, 'houseapp', '0032_agents', '2023-06-20 21:28:03.040139');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('snk5840i2atl5uyo5ofwu7i6cafohdil', '.eJxVjDsOwjAQBe_iGln-xTGU9DmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRFaHH63RDowXUH6Q711iS1ui4zyl2RB-1yaomf18P9OyjQy7em8-AyAbI3OZs8WE0pJB2QUQFjgFGp7KxFq41xo0Pl2UNgmygE9ijeHw2SOLY:1pdcVp:Q9zlaXTXKvoCmsRTvf4OY5vqCGoZyfD54XKU3FmKUD8', '2023-04-01 19:46:45.684287'),
('pc66vbdxi5frox9gcgaqd7thznt11074', '.eJxVjMEOwiAQRP-FsyFsFhbx6N1vILBLpWpoUtqT8d9tkx40mdO8N_NWMa1LjWsvcxxFXRSq02-XEz9L24E8UrtPmqe2zGPWu6IP2vVtkvK6Hu7fQU29bmuwFhN78Z6zgSBkgeU8DGglMGwxBBQcoStIgNk7cGgoF0_gggnq8wXKmzaK:1peufP:hUG81tOcDPN7gwUeViqSUev81KkSmgyOzUlgsxR4cQU', '2023-04-05 09:21:59.938503'),
('8h6yepj3maui01ww7zthm101kut802ut', '.eJxVjDsOwjAQBe_iGln-xTGU9DmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRFaHH63RDowXUH6Q711iS1ui4zyl2RB-1yaomf18P9OyjQy7em8-AyAbI3OZs8WE0pJB2QUQFjgFGp7KxFq41xo0Pl2UNgmygE9ijeHw2SOLY:1pf0OI:M-rvzjrJGJJlpNyEFsPZHTHIworrUHXVEKXTZ2NBFbk', '2023-04-05 15:28:42.019507'),
('c3ut418rr70l2dxfmud4pe8e8qhww8ci', '.eJxVjDsOwjAQBe_iGln-xTGU9DmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRFaHH63RDowXUH6Q711iS1ui4zyl2RB-1yaomf18P9OyjQy7em8-AyAbI3OZs8WE0pJB2QUQFjgFGp7KxFq41xo0Pl2UNgmygE9ijeHw2SOLY:1pdeys:HpQsyCkEIbnRXUBQETBgUTMVGG9hp8p75ozBwy7tG0E', '2023-04-01 22:24:54.844479'),
('uhlrzhvg5y8qq27kz6cc0p82j5fk0n4n', '.eJxVjMEOwiAQRP-FsyFsFhbx6N1vILBLpWpoUtqT8d9tkx40mdO8N_NWMa1LjWsvcxxFXRSq02-XEz9L24E8UrtPmqe2zGPWu6IP2vVtkvK6Hu7fQU29bmuwFhN78Z6zgSBkgeU8DGglMGwxBBQcoStIgNk7cGgoF0_gggnq8wXKmzaK:1peula:vyIa6jCxQaZoX_4cRsAZNfy7r9NJFTeW9mhZqTYbIe4', '2023-04-05 09:28:22.662698'),
('jsdr22s727uijj6llbf7cy4eid9vgx1k', '.eJxVjDsOwjAQBe_iGln-xTGU9DmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRFaHH63RDowXUH6Q711iS1ui4zyl2RB-1yaomf18P9OyjQy7em8-AyAbI3OZs8WE0pJB2QUQFjgFGp7KxFq41xo0Pl2UNgmygE9ijeHw2SOLY:1pkKh3:Zzv0UKhEPtAml27c217eE3Y7Ch2xuL25DmAa7m5R0ro', '2023-04-20 08:10:05.668749'),
('cnhyi10rhg1hccw8x90m5obp9j61d5q3', '.eJxVjDsOwjAQBe_iGllrJ_5R0nMGa727IQHkSHFSIe4OkVJA-2bmvVTGbR3z1mTJE6uzsladfseC9JC6E75jvc2a5rouU9G7og_a9HVmeV4O9-9gxDZ-696IlCKAxroYbRjS4AHYdBIIILLvKRLbgIPxBIkc90GQOu-SC5yMen8ADJw4CA:1pwd97:I3MhJKuoeHABwrLF_PtH72n9VtvWByCdzC4lC25IRaw', '2023-05-24 06:17:53.470140'),
('zst162tbfo9ss94i7nzandfmjsjtiyl4', '.eJxVjDsOwjAQBe_iGln-xTGU9DmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRFaHH63RDowXUH6Q711iS1ui4zyl2RB-1yaomf18P9OyjQy7em8-AyAbI3OZs8WE0pJB2QUQFjgFGp7KxFq41xo0Pl2UNgmygE9ijeHw2SOLY:1qCddt:nKCEz2DlXlMCHsDG7g75VGeFhxXPWXpQwmetZaORkAI', '2023-07-07 10:03:49.038703'),
('rl0wz1s8bu0wlqa3ison9cub83pq117f', '.eJxVjDsOwjAQBe_iGln-xTGU9DmDtbte4wCypTipEHeHSCmgfTPzXiLCtpa4dV7inMRFaHH63RDowXUH6Q711iS1ui4zyl2RB-1yaomf18P9OyjQy7em8-AyAbI3OZs8WE0pJB2QUQFjgFGp7KxFq41xo0Pl2UNgmygE9ijeHw2SOLY:1pwdzZ:b1-PxT_63A91dRRacOb_IMa9ji1rXLFAmSQN-18iaoA', '2023-05-24 07:12:05.205955');

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_agents`
--

DROP TABLE IF EXISTS `houseapp_agents`;
CREATE TABLE IF NOT EXISTS `houseapp_agents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caption` varchar(50) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_agents`
--

INSERT INTO `houseapp_agents` (`id`, `caption`, `picture`) VALUES
(1, 'HaloPesa *150*88#', 'halopesa.png'),
(2, 'M-pesa *150*00#', 'mpesa.png'),
(3, 'Tigopesa', 'Tigo.png'),
(4, 'Airtel Money', 'airtell.png');

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_chatroom`
--

DROP TABLE IF EXISTS `houseapp_chatroom`;
CREATE TABLE IF NOT EXISTS `houseapp_chatroom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chattitle` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_feedback`
--

DROP TABLE IF EXISTS `houseapp_feedback`;
CREATE TABLE IF NOT EXISTS `houseapp_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_feedback`
--

INSERT INTO `houseapp_feedback` (`id`, `feedback`) VALUES
(97, 'Consider my feedbacks'),
(96, 'Consider integrating the payment system'),
(95, 'feeback2'),
(94, 'feedback'),
(93, 'write a feedback here'),
(92, 'Hello , this is my feedback');

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_house`
--

DROP TABLE IF EXISTS `houseapp_house`;
CREATE TABLE IF NOT EXISTS `houseapp_house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` varchar(200) DEFAULT NULL,
  `number` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rooms` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `houseapp_house_category_id_ef4aa23e` (`category_id`),
  KEY `houseapp_house_user_id_a0e810e2` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_house`
--

INSERT INTO `houseapp_house` (`id`, `owner`, `number`, `location`, `price`, `rooms`, `image`, `category_id`, `purpose`, `user_id`, `status`, `video`) VALUES
(17, 'Stellah', '67', 'Mabibo', 30000, '10', 'house5.jpg', 1, 'For Sale', 1, 'pending', 'images/23/OFFICIAL_VIDEO_Dont_Call_Me_Angel_-_Citizen_Queen_ho3fLz3.mp4'),
(31, 'Stellah', '001', 'NIT', 9000000, '5', 'house6_f4vqUeh.jfif', 1, 'For Sale', 1, 'pending', 'images/23/Soso_Choir_Version.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_housetype`
--

DROP TABLE IF EXISTS `houseapp_housetype`;
CREATE TABLE IF NOT EXISTS `houseapp_housetype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_housetype`
--

INSERT INTO `houseapp_housetype` (`id`, `category`) VALUES
(1, 'Single-family house'),
(2, 'Multi-family House');

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_house_location`
--

DROP TABLE IF EXISTS `houseapp_house_location`;
CREATE TABLE IF NOT EXISTS `houseapp_house_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(200) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_house_location`
--

INSERT INTO `houseapp_house_location` (`id`, `location_name`, `date`) VALUES
(1, 'sinza madukani', '2023-03-22 15:42:04.263886'),
(2, 'kimara', '2023-03-22 15:42:10.197331'),
(3, 'kigamboni', '2023-03-22 21:17:38.190949'),
(4, 'Mabibo', '2023-03-23 08:27:46.191485'),
(5, 'Mabibo', '2023-03-23 10:56:46.845141'),
(6, 'Mabibo', '2023-03-23 11:28:30.496733'),
(7, 'Mabibo', '2023-04-25 18:19:42.451789'),
(8, 'Mabibo', '2023-04-29 08:18:41.529811');

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_ownermessage`
--

DROP TABLE IF EXISTS `houseapp_ownermessage`;
CREATE TABLE IF NOT EXISTS `houseapp_ownermessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `houseapp_ownermessage_tenant_id_f76c4a03` (`tenant_id`),
  KEY `houseapp_ownermessage_owner_id_c6213100` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_ownermessage`
--

INSERT INTO `houseapp_ownermessage` (`id`, `timestamp`, `content`, `tenant_id`, `owner_id`) VALUES
(10, '2023-06-18 21:52:57.627069', 'yeeeees', 3, 1),
(11, '2023-06-18 21:56:39.582264', 'its possible', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `houseapp_tenantmessage`
--

DROP TABLE IF EXISTS `houseapp_tenantmessage`;
CREATE TABLE IF NOT EXISTS `houseapp_tenantmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `owner_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `houseapp_tenantmessage_owner_id_bfeb5b7f` (`owner_id`),
  KEY `houseapp_tenantmessage_tenant_id_dc8bce7b` (`tenant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houseapp_tenantmessage`
--

INSERT INTO `houseapp_tenantmessage` (`id`, `timestamp`, `content`, `owner_id`, `tenant_id`) VALUES
(21, '2023-06-18 21:50:18.140890', 'hello', 1, 3),
(22, '2023-06-18 21:55:56.228619', 'can i buy ur house', 1, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
