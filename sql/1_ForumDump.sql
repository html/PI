-- MySQL dump 10.11
--
-- Host: localhost    Database: pi
-- ------------------------------------------------------
-- Server version	5.0.51a-24

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
-- Table structure for table `phpbb_acl_groups`
--

DROP TABLE IF EXISTS `phpbb_acl_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_acl_groups`
--

LOCK TABLES `phpbb_acl_groups` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_groups` DISABLE KEYS */;
INSERT INTO `phpbb_acl_groups` VALUES (1,0,85,0,1),(1,0,93,0,1),(1,0,111,0,1),(5,0,0,5,0),(5,0,0,1,0),(2,0,0,6,0),(3,0,0,6,0),(4,0,0,5,0),(4,0,0,10,0),(1,1,0,17,0),(2,1,0,17,0),(3,1,0,17,0),(6,1,0,17,0),(1,2,0,17,0),(2,2,0,15,0),(3,2,0,15,0),(4,2,0,21,0),(5,2,0,14,0),(5,2,0,10,0),(6,2,0,19,0);
/*!40000 ALTER TABLE `phpbb_acl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_options`
--

DROP TABLE IF EXISTS `phpbb_acl_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL auto_increment,
  `auth_option` varchar(50) collate utf8_bin NOT NULL default '',
  `is_global` tinyint(1) unsigned NOT NULL default '0',
  `is_local` tinyint(1) unsigned NOT NULL default '0',
  `founder_only` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_acl_options`
--

LOCK TABLES `phpbb_acl_options` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_options` DISABLE KEYS */;
INSERT INTO `phpbb_acl_options` VALUES (1,'f_',0,1,0),(2,'f_announce',0,1,0),(3,'f_attach',0,1,0),(4,'f_bbcode',0,1,0),(5,'f_bump',0,1,0),(6,'f_delete',0,1,0),(7,'f_download',0,1,0),(8,'f_edit',0,1,0),(9,'f_email',0,1,0),(10,'f_flash',0,1,0),(11,'f_icons',0,1,0),(12,'f_ignoreflood',0,1,0),(13,'f_img',0,1,0),(14,'f_list',0,1,0),(15,'f_noapprove',0,1,0),(16,'f_poll',0,1,0),(17,'f_post',0,1,0),(18,'f_postcount',0,1,0),(19,'f_print',0,1,0),(20,'f_read',0,1,0),(21,'f_reply',0,1,0),(22,'f_report',0,1,0),(23,'f_search',0,1,0),(24,'f_sigs',0,1,0),(25,'f_smilies',0,1,0),(26,'f_sticky',0,1,0),(27,'f_subscribe',0,1,0),(28,'f_user_lock',0,1,0),(29,'f_vote',0,1,0),(30,'f_votechg',0,1,0),(31,'m_',1,1,0),(32,'m_approve',1,1,0),(33,'m_chgposter',1,1,0),(34,'m_delete',1,1,0),(35,'m_edit',1,1,0),(36,'m_info',1,1,0),(37,'m_lock',1,1,0),(38,'m_merge',1,1,0),(39,'m_move',1,1,0),(40,'m_report',1,1,0),(41,'m_split',1,1,0),(42,'m_ban',1,0,0),(43,'m_warn',1,0,0),(44,'a_',1,0,0),(45,'a_aauth',1,0,0),(46,'a_attach',1,0,0),(47,'a_authgroups',1,0,0),(48,'a_authusers',1,0,0),(49,'a_backup',1,0,0),(50,'a_ban',1,0,0),(51,'a_bbcode',1,0,0),(52,'a_board',1,0,0),(53,'a_bots',1,0,0),(54,'a_clearlogs',1,0,0),(55,'a_email',1,0,0),(56,'a_fauth',1,0,0),(57,'a_forum',1,0,0),(58,'a_forumadd',1,0,0),(59,'a_forumdel',1,0,0),(60,'a_group',1,0,0),(61,'a_groupadd',1,0,0),(62,'a_groupdel',1,0,0),(63,'a_icons',1,0,0),(64,'a_jabber',1,0,0),(65,'a_language',1,0,0),(66,'a_mauth',1,0,0),(67,'a_modules',1,0,0),(68,'a_names',1,0,0),(69,'a_phpinfo',1,0,0),(70,'a_profile',1,0,0),(71,'a_prune',1,0,0),(72,'a_ranks',1,0,0),(73,'a_reasons',1,0,0),(74,'a_roles',1,0,0),(75,'a_search',1,0,0),(76,'a_server',1,0,0),(77,'a_styles',1,0,0),(78,'a_switchperm',1,0,0),(79,'a_uauth',1,0,0),(80,'a_user',1,0,0),(81,'a_userdel',1,0,0),(82,'a_viewauth',1,0,0),(83,'a_viewlogs',1,0,0),(84,'a_words',1,0,0),(85,'u_',1,0,0),(86,'u_attach',1,0,0),(87,'u_chgavatar',1,0,0),(88,'u_chgcensors',1,0,0),(89,'u_chgemail',1,0,0),(90,'u_chggrp',1,0,0),(91,'u_chgname',1,0,0),(92,'u_chgpasswd',1,0,0),(93,'u_download',1,0,0),(94,'u_hideonline',1,0,0),(95,'u_ignoreflood',1,0,0),(96,'u_masspm',1,0,0),(97,'u_masspm_group',1,0,0),(98,'u_pm_attach',1,0,0),(99,'u_pm_bbcode',1,0,0),(100,'u_pm_delete',1,0,0),(101,'u_pm_download',1,0,0),(102,'u_pm_edit',1,0,0),(103,'u_pm_emailpm',1,0,0),(104,'u_pm_flash',1,0,0),(105,'u_pm_forward',1,0,0),(106,'u_pm_img',1,0,0),(107,'u_pm_printpm',1,0,0),(108,'u_pm_smilies',1,0,0),(109,'u_readpm',1,0,0),(110,'u_savedrafts',1,0,0),(111,'u_search',1,0,0),(112,'u_sendemail',1,0,0),(113,'u_sendim',1,0,0),(114,'u_sendpm',1,0,0),(115,'u_sig',1,0,0),(116,'u_viewonline',1,0,0),(117,'u_viewprofile',1,0,0);
/*!40000 ALTER TABLE `phpbb_acl_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_roles`
--

DROP TABLE IF EXISTS `phpbb_acl_roles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL auto_increment,
  `role_name` varchar(255) collate utf8_bin NOT NULL default '',
  `role_description` text collate utf8_bin NOT NULL,
  `role_type` varchar(10) collate utf8_bin NOT NULL default '',
  `role_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_acl_roles`
--

LOCK TABLES `phpbb_acl_roles` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_roles` DISABLE KEYS */;
INSERT INTO `phpbb_acl_roles` VALUES (1,'ROLE_ADMIN_STANDARD','ROLE_DESCRIPTION_ADMIN_STANDARD','a_',1),(2,'ROLE_ADMIN_FORUM','ROLE_DESCRIPTION_ADMIN_FORUM','a_',3),(3,'ROLE_ADMIN_USERGROUP','ROLE_DESCRIPTION_ADMIN_USERGROUP','a_',4),(4,'ROLE_ADMIN_FULL','ROLE_DESCRIPTION_ADMIN_FULL','a_',2),(5,'ROLE_USER_FULL','ROLE_DESCRIPTION_USER_FULL','u_',3),(6,'ROLE_USER_STANDARD','ROLE_DESCRIPTION_USER_STANDARD','u_',1),(7,'ROLE_USER_LIMITED','ROLE_DESCRIPTION_USER_LIMITED','u_',2),(8,'ROLE_USER_NOPM','ROLE_DESCRIPTION_USER_NOPM','u_',4),(9,'ROLE_USER_NOAVATAR','ROLE_DESCRIPTION_USER_NOAVATAR','u_',5),(10,'ROLE_MOD_FULL','ROLE_DESCRIPTION_MOD_FULL','m_',3),(11,'ROLE_MOD_STANDARD','ROLE_DESCRIPTION_MOD_STANDARD','m_',1),(12,'ROLE_MOD_SIMPLE','ROLE_DESCRIPTION_MOD_SIMPLE','m_',2),(13,'ROLE_MOD_QUEUE','ROLE_DESCRIPTION_MOD_QUEUE','m_',4),(14,'ROLE_FORUM_FULL','ROLE_DESCRIPTION_FORUM_FULL','f_',7),(15,'ROLE_FORUM_STANDARD','ROLE_DESCRIPTION_FORUM_STANDARD','f_',5),(16,'ROLE_FORUM_NOACCESS','ROLE_DESCRIPTION_FORUM_NOACCESS','f_',1),(17,'ROLE_FORUM_READONLY','ROLE_DESCRIPTION_FORUM_READONLY','f_',2),(18,'ROLE_FORUM_LIMITED','ROLE_DESCRIPTION_FORUM_LIMITED','f_',3),(19,'ROLE_FORUM_BOT','ROLE_DESCRIPTION_FORUM_BOT','f_',9),(20,'ROLE_FORUM_ONQUEUE','ROLE_DESCRIPTION_FORUM_ONQUEUE','f_',8),(21,'ROLE_FORUM_POLLS','ROLE_DESCRIPTION_FORUM_POLLS','f_',6),(22,'ROLE_FORUM_LIMITED_POLLS','ROLE_DESCRIPTION_FORUM_LIMITED_POLLS','f_',4);
/*!40000 ALTER TABLE `phpbb_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_roles_data`
--

DROP TABLE IF EXISTS `phpbb_acl_roles_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_acl_roles_data`
--

LOCK TABLES `phpbb_acl_roles_data` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_roles_data` DISABLE KEYS */;
INSERT INTO `phpbb_acl_roles_data` VALUES (1,44,1),(1,46,1),(1,47,1),(1,48,1),(1,50,1),(1,51,1),(1,52,1),(1,56,1),(1,57,1),(1,58,1),(1,59,1),(1,60,1),(1,61,1),(1,62,1),(1,63,1),(1,66,1),(1,68,1),(1,70,1),(1,71,1),(1,72,1),(1,73,1),(1,79,1),(1,80,1),(1,81,1),(1,82,1),(1,83,1),(1,84,1),(2,44,1),(2,47,1),(2,48,1),(2,56,1),(2,57,1),(2,58,1),(2,59,1),(2,66,1),(2,71,1),(2,79,1),(2,82,1),(2,83,1),(3,44,1),(3,47,1),(3,48,1),(3,50,1),(3,60,1),(3,61,1),(3,62,1),(3,72,1),(3,79,1),(3,80,1),(3,82,1),(3,83,1),(4,44,1),(4,45,1),(4,46,1),(4,47,1),(4,48,1),(4,49,1),(4,50,1),(4,51,1),(4,52,1),(4,53,1),(4,54,1),(4,55,1),(4,56,1),(4,57,1),(4,58,1),(4,59,1),(4,60,1),(4,61,1),(4,62,1),(4,63,1),(4,64,1),(4,65,1),(4,66,1),(4,67,1),(4,68,1),(4,69,1),(4,70,1),(4,71,1),(4,72,1),(4,73,1),(4,74,1),(4,75,1),(4,76,1),(4,77,1),(4,78,1),(4,79,1),(4,80,1),(4,81,1),(4,82,1),(4,83,1),(4,84,1),(5,85,1),(5,86,1),(5,87,1),(5,88,1),(5,89,1),(5,90,1),(5,91,1),(5,92,1),(5,93,1),(5,94,1),(5,95,1),(5,96,1),(5,97,1),(5,98,1),(5,99,1),(5,100,1),(5,101,1),(5,102,1),(5,103,1),(5,104,1),(5,105,1),(5,106,1),(5,107,1),(5,108,1),(5,109,1),(5,110,1),(5,111,1),(5,112,1),(5,113,1),(5,114,1),(5,115,1),(5,116,1),(5,117,1),(6,85,1),(6,86,1),(6,87,1),(6,88,1),(6,89,1),(6,92,1),(6,93,1),(6,94,1),(6,96,1),(6,97,1),(6,98,1),(6,99,1),(6,100,1),(6,101,1),(6,102,1),(6,103,1),(6,106,1),(6,107,1),(6,108,1),(6,109,1),(6,110,1),(6,111,1),(6,112,1),(6,113,1),(6,114,1),(6,115,1),(6,117,1),(7,85,1),(7,87,1),(7,88,1),(7,89,1),(7,92,1),(7,93,1),(7,94,1),(7,99,1),(7,100,1),(7,101,1),(7,102,1),(7,105,1),(7,106,1),(7,107,1),(7,108,1),(7,109,1),(7,114,1),(7,115,1),(7,117,1),(8,85,1),(8,87,1),(8,88,1),(8,89,1),(8,92,1),(8,93,1),(8,94,1),(8,115,1),(8,117,1),(8,96,0),(8,97,0),(8,109,0),(8,114,0),(9,85,1),(9,88,1),(9,89,1),(9,92,1),(9,93,1),(9,94,1),(9,99,1),(9,100,1),(9,101,1),(9,102,1),(9,105,1),(9,106,1),(9,107,1),(9,108,1),(9,109,1),(9,114,1),(9,115,1),(9,117,1),(9,87,0),(9,96,0),(9,97,0),(10,31,1),(10,32,1),(10,42,1),(10,33,1),(10,34,1),(10,35,1),(10,36,1),(10,37,1),(10,38,1),(10,39,1),(10,40,1),(10,41,1),(10,43,1),(11,31,1),(11,32,1),(11,34,1),(11,35,1),(11,36,1),(11,37,1),(11,38,1),(11,39,1),(11,40,1),(11,41,1),(11,43,1),(12,31,1),(12,34,1),(12,35,1),(12,36,1),(12,40,1),(13,31,1),(13,32,1),(13,35,1),(14,1,1),(14,2,1),(14,3,1),(14,4,1),(14,5,1),(14,6,1),(14,7,1),(14,8,1),(14,9,1),(14,10,1),(14,11,1),(14,12,1),(14,13,1),(14,14,1),(14,15,1),(14,16,1),(14,17,1),(14,18,1),(14,19,1),(14,20,1),(14,21,1),(14,22,1),(14,23,1),(14,24,1),(14,25,1),(14,26,1),(14,27,1),(14,28,1),(14,29,1),(14,30,1),(15,1,1),(15,3,1),(15,4,1),(15,5,1),(15,6,1),(15,7,1),(15,8,1),(15,9,1),(15,11,1),(15,13,1),(15,14,1),(15,15,1),(15,17,1),(15,18,1),(15,19,1),(15,20,1),(15,21,1),(15,22,1),(15,23,1),(15,24,1),(15,25,1),(15,27,1),(15,29,1),(15,30,1),(16,1,0),(17,1,1),(17,7,1),(17,14,1),(17,19,1),(17,20,1),(17,23,1),(17,27,1),(18,1,1),(18,4,1),(18,7,1),(18,8,1),(18,9,1),(18,13,1),(18,14,1),(18,15,1),(18,17,1),(18,18,1),(18,19,1),(18,20,1),(18,21,1),(18,22,1),(18,23,1),(18,24,1),(18,25,1),(18,27,1),(18,29,1),(19,1,1),(19,7,1),(19,14,1),(19,19,1),(19,20,1),(20,1,1),(20,3,1),(20,4,1),(20,7,1),(20,8,1),(20,9,1),(20,13,1),(20,14,1),(20,17,1),(20,18,1),(20,19,1),(20,20,1),(20,21,1),(20,22,1),(20,23,1),(20,24,1),(20,25,1),(20,27,1),(20,29,1),(20,15,0),(21,1,1),(21,3,1),(21,4,1),(21,5,1),(21,6,1),(21,7,1),(21,8,1),(21,9,1),(21,11,1),(21,13,1),(21,14,1),(21,15,1),(21,16,1),(21,17,1),(21,18,1),(21,19,1),(21,20,1),(21,21,1),(21,22,1),(21,23,1),(21,24,1),(21,25,1),(21,27,1),(21,29,1),(21,30,1),(22,1,1),(22,4,1),(22,7,1),(22,8,1),(22,9,1),(22,13,1),(22,14,1),(22,15,1),(22,16,1),(22,17,1),(22,18,1),(22,19,1),(22,20,1),(22,21,1),(22,22,1),(22,23,1),(22,24,1),(22,25,1),(22,27,1),(22,29,1);
/*!40000 ALTER TABLE `phpbb_acl_roles_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_acl_users`
--

DROP TABLE IF EXISTS `phpbb_acl_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL default '0',
  `auth_setting` tinyint(2) NOT NULL default '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_acl_users`
--

LOCK TABLES `phpbb_acl_users` WRITE;
/*!40000 ALTER TABLE `phpbb_acl_users` DISABLE KEYS */;
INSERT INTO `phpbb_acl_users` VALUES (2,0,0,5,0);
/*!40000 ALTER TABLE `phpbb_acl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_attachments`
--

DROP TABLE IF EXISTS `phpbb_attachments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL auto_increment,
  `post_msg_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `in_message` tinyint(1) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `is_orphan` tinyint(1) unsigned NOT NULL default '1',
  `physical_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `real_filename` varchar(255) collate utf8_bin NOT NULL default '',
  `download_count` mediumint(8) unsigned NOT NULL default '0',
  `attach_comment` text collate utf8_bin NOT NULL,
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  `mimetype` varchar(100) collate utf8_bin NOT NULL default '',
  `filesize` int(20) unsigned NOT NULL default '0',
  `filetime` int(11) unsigned NOT NULL default '0',
  `thumbnail` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_attachments`
--

LOCK TABLES `phpbb_attachments` WRITE;
/*!40000 ALTER TABLE `phpbb_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_banlist`
--

DROP TABLE IF EXISTS `phpbb_banlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) unsigned NOT NULL default '0',
  `ban_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `ban_email` varchar(100) collate utf8_bin NOT NULL default '',
  `ban_start` int(11) unsigned NOT NULL default '0',
  `ban_end` int(11) unsigned NOT NULL default '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL default '0',
  `ban_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `ban_give_reason` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_banlist`
--

LOCK TABLES `phpbb_banlist` WRITE;
/*!40000 ALTER TABLE `phpbb_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_bbcodes`
--

DROP TABLE IF EXISTS `phpbb_bbcodes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_bbcodes` (
  `bbcode_id` tinyint(3) NOT NULL default '0',
  `bbcode_tag` varchar(16) collate utf8_bin NOT NULL default '',
  `bbcode_helpline` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_match` text collate utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext collate utf8_bin NOT NULL,
  `first_pass_match` mediumtext collate utf8_bin NOT NULL,
  `first_pass_replace` mediumtext collate utf8_bin NOT NULL,
  `second_pass_match` mediumtext collate utf8_bin NOT NULL,
  `second_pass_replace` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_bbcodes`
--

LOCK TABLES `phpbb_bbcodes` WRITE;
/*!40000 ALTER TABLE `phpbb_bbcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_bbcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_bookmarks`
--

DROP TABLE IF EXISTS `phpbb_bookmarks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_bookmarks`
--

LOCK TABLES `phpbb_bookmarks` WRITE;
/*!40000 ALTER TABLE `phpbb_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_bots`
--

DROP TABLE IF EXISTS `phpbb_bots`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bot_active` tinyint(1) unsigned NOT NULL default '1',
  `bot_name` varchar(255) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bot_agent` varchar(255) collate utf8_bin NOT NULL default '',
  `bot_ip` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_bots`
--

LOCK TABLES `phpbb_bots` WRITE;
/*!40000 ALTER TABLE `phpbb_bots` DISABLE KEYS */;
INSERT INTO `phpbb_bots` VALUES (1,1,'AdsBot [Google]',3,'AdsBot-Google',''),(2,1,'Alexa [Bot]',4,'ia_archiver',''),(3,1,'Alta Vista [Bot]',5,'Scooter/',''),(4,1,'Ask Jeeves [Bot]',6,'Ask Jeeves',''),(5,1,'Baidu [Spider]',7,'Baiduspider+(',''),(6,1,'Exabot [Bot]',8,'Exabot/',''),(7,1,'FAST Enterprise [Crawler]',9,'FAST Enterprise Crawler',''),(8,1,'FAST WebCrawler [Crawler]',10,'FAST-WebCrawler/',''),(9,1,'Francis [Bot]',11,'http://www.neomo.de/',''),(10,1,'Gigabot [Bot]',12,'Gigabot/',''),(11,1,'Google Adsense [Bot]',13,'Mediapartners-Google',''),(12,1,'Google Desktop',14,'Google Desktop',''),(13,1,'Google Feedfetcher',15,'Feedfetcher-Google',''),(14,1,'Google [Bot]',16,'Googlebot',''),(15,1,'Heise IT-Markt [Crawler]',17,'heise-IT-Markt-Crawler',''),(16,1,'Heritrix [Crawler]',18,'heritrix/1.',''),(17,1,'IBM Research [Bot]',19,'ibm.com/cs/crawler',''),(18,1,'ICCrawler - ICjobs',20,'ICCrawler - ICjobs',''),(19,1,'ichiro [Crawler]',21,'ichiro/',''),(20,1,'Majestic-12 [Bot]',22,'MJ12bot/',''),(21,1,'Metager [Bot]',23,'MetagerBot/',''),(22,1,'MSN NewsBlogs',24,'msnbot-NewsBlogs/',''),(23,1,'MSN [Bot]',25,'msnbot/',''),(24,1,'MSNbot Media',26,'msnbot-media/',''),(25,1,'NG-Search [Bot]',27,'NG-Search/',''),(26,1,'Nutch [Bot]',28,'http://lucene.apache.org/nutch/',''),(27,1,'Nutch/CVS [Bot]',29,'NutchCVS/',''),(28,1,'OmniExplorer [Bot]',30,'OmniExplorer_Bot/',''),(29,1,'Online link [Validator]',31,'online link validator',''),(30,1,'psbot [Picsearch]',32,'psbot/0',''),(31,1,'Seekport [Bot]',33,'Seekbot/',''),(32,1,'Sensis [Crawler]',34,'Sensis Web Crawler',''),(33,1,'SEO Crawler',35,'SEO search Crawler/',''),(34,1,'Seoma [Crawler]',36,'Seoma [SEO Crawler]',''),(35,1,'SEOSearch [Crawler]',37,'SEOsearch/',''),(36,1,'Snappy [Bot]',38,'Snappy/1.1 ( http://www.urltrends.com/ )',''),(37,1,'Steeler [Crawler]',39,'http://www.tkl.iis.u-tokyo.ac.jp/~crawler/',''),(38,1,'Synoo [Bot]',40,'SynooBot/',''),(39,1,'Telekom [Bot]',41,'crawleradmin.t-info@telekom.de',''),(40,1,'TurnitinBot [Bot]',42,'TurnitinBot/',''),(41,1,'Voyager [Bot]',43,'voyager/1.0',''),(42,1,'W3 [Sitesearch]',44,'W3 SiteSearch Crawler',''),(43,1,'W3C [Linkcheck]',45,'W3C-checklink/',''),(44,1,'W3C [Validator]',46,'W3C_*Validator',''),(45,1,'WiseNut [Bot]',47,'http://www.WISEnutbot.com',''),(46,1,'YaCy [Bot]',48,'yacybot',''),(47,1,'Yahoo MMCrawler [Bot]',49,'Yahoo-MMCrawler/',''),(48,1,'Yahoo Slurp [Bot]',50,'Yahoo! DE Slurp',''),(49,1,'Yahoo [Bot]',51,'Yahoo! Slurp',''),(50,1,'YahooSeeker [Bot]',52,'YahooSeeker/','');
/*!40000 ALTER TABLE `phpbb_bots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_config`
--

DROP TABLE IF EXISTS `phpbb_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_config` (
  `config_name` varchar(255) collate utf8_bin NOT NULL default '',
  `config_value` varchar(255) collate utf8_bin NOT NULL default '',
  `is_dynamic` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_config`
--

LOCK TABLES `phpbb_config` WRITE;
/*!40000 ALTER TABLE `phpbb_config` DISABLE KEYS */;
INSERT INTO `phpbb_config` VALUES ('active_sessions','0',0),('allow_attachments','1',0),('allow_autologin','1',0),('allow_avatar_local','0',0),('allow_avatar_remote','0',0),('allow_avatar_upload','0',0),('allow_bbcode','1',0),('allow_birthdays','1',0),('allow_bookmarks','1',0),('allow_emailreuse','0',0),('allow_forum_notify','1',0),('allow_mass_pm','1',0),('allow_name_chars','USERNAME_CHARS_ANY',0),('allow_namechange','0',0),('allow_nocensors','0',0),('allow_pm_attach','0',0),('allow_post_flash','1',0),('allow_post_links','1',0),('allow_privmsg','1',0),('allow_sig','1',0),('allow_sig_bbcode','1',0),('allow_sig_flash','0',0),('allow_sig_img','1',0),('allow_sig_links','1',0),('allow_sig_pm','1',0),('allow_sig_smilies','1',0),('allow_smilies','1',0),('allow_topic_notify','1',0),('attachment_quota','52428800',0),('auth_bbcode_pm','1',0),('auth_flash_pm','0',0),('auth_img_pm','1',0),('auth_method','db',0),('auth_smilies_pm','1',0),('avatar_filesize','6144',0),('avatar_gallery_path','images/avatars/gallery',0),('avatar_max_height','90',0),('avatar_max_width','90',0),('avatar_min_height','20',0),('avatar_min_width','20',0),('avatar_path','images/avatars/upload',0),('avatar_salt','81f4612a602096037fb5ce6262e4d8d2',0),('board_contact','1galactic@gmail.com',0),('board_disable','0',0),('board_disable_msg','',0),('board_dst','0',0),('board_email','1galactic@gmail.com',0),('board_email_form','0',0),('board_email_sig','Thanks, The Management',0),('board_hide_emails','1',0),('board_timezone','0',0),('browser_check','1',0),('bump_interval','10',0),('bump_type','d',0),('cache_gc','7200',0),('captcha_gd','1',0),('captcha_gd_foreground_noise','0',0),('captcha_gd_x_grid','25',0),('captcha_gd_y_grid','25',0),('captcha_gd_wave','0',0),('captcha_gd_3d_noise','1',0),('captcha_gd_fonts','1',0),('confirm_refresh','1',0),('check_attachment_content','1',0),('check_dnsbl','0',0),('chg_passforce','0',0),('cookie_domain','pi',0),('cookie_name','phpbb3_1t2ma',0),('cookie_path','/',0),('cookie_secure','0',0),('coppa_enable','0',0),('coppa_fax','',0),('coppa_mail','',0),('database_gc','604800',0),('dbms_version','5.0.51a-24',0),('default_dateformat','D M d, Y g:i a',0),('default_style','1',0),('display_last_edited','1',0),('display_order','0',0),('edit_time','0',0),('email_check_mx','1',0),('email_enable','1',0),('email_function_name','mail',0),('email_package_size','50',0),('enable_confirm','1',0),('enable_pm_icons','1',0),('enable_post_confirm','1',0),('enable_queue_trigger','0',0),('flood_interval','15',0),('force_server_vars','0',0),('form_token_lifetime','7200',0),('form_token_mintime','0',0),('form_token_sid_guests','1',0),('forward_pm','1',0),('forwarded_for_check','0',0),('full_folder_action','2',0),('fulltext_mysql_max_word_len','254',0),('fulltext_mysql_min_word_len','4',0),('fulltext_native_common_thres','5',0),('fulltext_native_load_upd','1',0),('fulltext_native_max_chars','14',0),('fulltext_native_min_chars','3',0),('gzip_compress','0',0),('hot_threshold','25',0),('icons_path','images/icons',0),('img_create_thumbnail','0',0),('img_display_inlined','1',0),('img_imagick','',0),('img_link_height','0',0),('img_link_width','0',0),('img_max_height','0',0),('img_max_thumb_width','400',0),('img_max_width','0',0),('img_min_thumb_filesize','12000',0),('ip_check','3',0),('jab_enable','0',0),('jab_host','',0),('jab_password','',0),('jab_package_size','20',0),('jab_port','5222',0),('jab_use_ssl','0',0),('jab_username','',0),('ldap_base_dn','',0),('ldap_email','',0),('ldap_password','',0),('ldap_port','',0),('ldap_server','',0),('ldap_uid','',0),('ldap_user','',0),('ldap_user_filter','',0),('limit_load','0',0),('limit_search_load','0',0),('load_anon_lastread','0',0),('load_birthdays','1',0),('load_cpf_memberlist','0',0),('load_cpf_viewprofile','1',0),('load_cpf_viewtopic','0',0),('load_db_lastread','1',0),('load_db_track','1',0),('load_jumpbox','1',0),('load_moderators','1',0),('load_online','1',0),('load_online_guests','1',0),('load_online_time','5',0),('load_onlinetrack','1',0),('load_search','1',0),('load_tplcompile','0',0),('load_user_activity','1',0),('max_attachments','3',0),('max_attachments_pm','1',0),('max_autologin_time','0',0),('max_filesize','262144',0),('max_filesize_pm','262144',0),('max_login_attempts','3',0),('max_name_chars','20',0),('max_num_search_keywords','10',0),('max_pass_chars','30',0),('max_poll_options','10',0),('max_post_chars','60000',0),('max_post_font_size','200',0),('max_post_img_height','0',0),('max_post_img_width','0',0),('max_post_smilies','0',0),('max_post_urls','0',0),('max_quote_depth','3',0),('max_reg_attempts','5',0),('max_sig_chars','255',0),('max_sig_font_size','200',0),('max_sig_img_height','0',0),('max_sig_img_width','0',0),('max_sig_smilies','0',0),('max_sig_urls','5',0),('min_name_chars','3',0),('min_pass_chars','6',0),('min_search_author_chars','3',0),('mime_triggers','body|head|html|img|plaintext|a href|pre|script|table|title',0),('override_user_style','0',0),('pass_complex','PASS_TYPE_ANY',0),('pm_edit_time','0',0),('pm_max_boxes','4',0),('pm_max_msgs','50',0),('pm_max_recipients','0',0),('posts_per_page','10',0),('print_pm','1',0),('queue_interval','600',0),('queue_trigger_posts','3',0),('ranks_path','images/ranks',0),('require_activation','0',0),('referer_validation','1',0),('script_path','/forum',0),('search_block_size','250',0),('search_gc','7200',0),('search_interval','0',0),('search_anonymous_interval','0',0),('search_type','fulltext_native',0),('search_store_results','1800',0),('secure_allow_deny','1',0),('secure_allow_empty_referer','1',0),('secure_downloads','0',0),('server_name','pi',0),('server_port','80',0),('server_protocol','http://',0),('session_gc','3600',0),('session_length','3600',0),('site_desc','A short text to describe your forum',0),('sitename','yourdomain.com',0),('smilies_path','images/smilies',0),('smtp_auth_method','PLAIN',0),('smtp_delivery','0',0),('smtp_host','',0),('smtp_password','',0),('smtp_port','25',0),('smtp_username','',0),('topics_per_page','25',0),('tpl_allow_php','0',0),('upload_icons_path','images/upload_icons',0),('upload_path','files',0),('version','3.0.5',0),('warnings_expire_days','90',0),('warnings_gc','14400',0),('cache_last_gc','1249493616',1),('cron_lock','0',1),('database_last_gc','1249480737',1),('last_queue_run','0',1),('newest_user_colour','AA0000',1),('newest_user_id','2',1),('newest_username','admin',1),('num_files','0',1),('num_posts','1',1),('num_topics','1',1),('num_users','1',1),('rand_seed','08a9ace029988f6ff08b7a45f4689d46',1),('rand_seed_last_update','1249494017',1),('record_online_date','1249472240',1),('record_online_users','2',1),('search_indexing_state','',1),('search_last_gc','1249493790',1),('session_last_gc','1249493793',1),('upload_dir_size','0',1),('warnings_last_gc','1249480711',1),('board_startdate','1249472216',0),('default_lang','uk',0);
/*!40000 ALTER TABLE `phpbb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_confirm`
--

DROP TABLE IF EXISTS `phpbb_confirm`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_confirm` (
  `confirm_id` char(32) collate utf8_bin NOT NULL default '',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `confirm_type` tinyint(3) NOT NULL default '0',
  `code` varchar(8) collate utf8_bin NOT NULL default '',
  `seed` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_confirm`
--

LOCK TABLES `phpbb_confirm` WRITE;
/*!40000 ALTER TABLE `phpbb_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_disallow`
--

DROP TABLE IF EXISTS `phpbb_disallow`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_disallow`
--

LOCK TABLES `phpbb_disallow` WRITE;
/*!40000 ALTER TABLE `phpbb_disallow` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_disallow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_drafts`
--

DROP TABLE IF EXISTS `phpbb_drafts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `save_time` int(11) unsigned NOT NULL default '0',
  `draft_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `draft_message` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_drafts`
--

LOCK TABLES `phpbb_drafts` WRITE;
/*!40000 ALTER TABLE `phpbb_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_extension_groups`
--

DROP TABLE IF EXISTS `phpbb_extension_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `cat_id` tinyint(2) NOT NULL default '0',
  `allow_group` tinyint(1) unsigned NOT NULL default '0',
  `download_mode` tinyint(1) unsigned NOT NULL default '1',
  `upload_icon` varchar(255) collate utf8_bin NOT NULL default '',
  `max_filesize` int(20) unsigned NOT NULL default '0',
  `allowed_forums` text collate utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_extension_groups`
--

LOCK TABLES `phpbb_extension_groups` WRITE;
/*!40000 ALTER TABLE `phpbb_extension_groups` DISABLE KEYS */;
INSERT INTO `phpbb_extension_groups` VALUES (1,'Images',1,1,1,'',0,'',0),(2,'Archives',0,1,1,'',0,'',0),(3,'Plain Text',0,0,1,'',0,'',0),(4,'Documents',0,0,1,'',0,'',0),(5,'Real Media',3,0,1,'',0,'',0),(6,'Windows Media',2,0,1,'',0,'',0),(7,'Flash Files',5,0,1,'',0,'',0),(8,'Quicktime Media',6,0,1,'',0,'',0),(9,'Downloadable Files',0,0,1,'',0,'',0);
/*!40000 ALTER TABLE `phpbb_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_extensions`
--

DROP TABLE IF EXISTS `phpbb_extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `extension` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_extensions`
--

LOCK TABLES `phpbb_extensions` WRITE;
/*!40000 ALTER TABLE `phpbb_extensions` DISABLE KEYS */;
INSERT INTO `phpbb_extensions` VALUES (1,1,'gif'),(2,1,'png'),(3,1,'jpeg'),(4,1,'jpg'),(5,1,'tif'),(6,1,'tiff'),(7,1,'tga'),(8,2,'gtar'),(9,2,'gz'),(10,2,'tar'),(11,2,'zip'),(12,2,'rar'),(13,2,'ace'),(14,2,'torrent'),(15,2,'tgz'),(16,2,'bz2'),(17,2,'7z'),(18,3,'txt'),(19,3,'c'),(20,3,'h'),(21,3,'cpp'),(22,3,'hpp'),(23,3,'diz'),(24,3,'csv'),(25,3,'ini'),(26,3,'log'),(27,3,'js'),(28,3,'xml'),(29,4,'xls'),(30,4,'xlsx'),(31,4,'xlsm'),(32,4,'xlsb'),(33,4,'doc'),(34,4,'docx'),(35,4,'docm'),(36,4,'dot'),(37,4,'dotx'),(38,4,'dotm'),(39,4,'pdf'),(40,4,'ai'),(41,4,'ps'),(42,4,'ppt'),(43,4,'pptx'),(44,4,'pptm'),(45,4,'odg'),(46,4,'odp'),(47,4,'ods'),(48,4,'odt'),(49,4,'rtf'),(50,5,'rm'),(51,5,'ram'),(52,6,'wma'),(53,6,'wmv'),(54,7,'swf'),(55,8,'mov'),(56,8,'m4v'),(57,8,'m4a'),(58,8,'mp4'),(59,8,'3gp'),(60,8,'3g2'),(61,8,'qt'),(62,9,'mpeg'),(63,9,'mpg'),(64,9,'mp3'),(65,9,'ogg'),(66,9,'ogm');
/*!40000 ALTER TABLE `phpbb_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums`
--

DROP TABLE IF EXISTS `phpbb_forums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_parents` mediumtext collate utf8_bin NOT NULL,
  `forum_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc` text collate utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_desc_options` int(11) unsigned NOT NULL default '7',
  `forum_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_password` varchar(40) collate utf8_bin NOT NULL default '',
  `forum_style` mediumint(8) unsigned NOT NULL default '0',
  `forum_image` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules` text collate utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_rules_options` int(11) unsigned NOT NULL default '7',
  `forum_rules_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `forum_topics_per_page` tinyint(4) NOT NULL default '0',
  `forum_type` tinyint(4) NOT NULL default '0',
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_post_time` int(11) unsigned NOT NULL default '0',
  `forum_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `forum_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `forum_flags` tinyint(4) NOT NULL default '32',
  `display_subforum_list` tinyint(1) unsigned NOT NULL default '1',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL default '1',
  `enable_icons` tinyint(1) unsigned NOT NULL default '1',
  `enable_prune` tinyint(1) unsigned NOT NULL default '0',
  `prune_next` int(11) unsigned NOT NULL default '0',
  `prune_days` mediumint(8) unsigned NOT NULL default '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL default '0',
  `prune_freq` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_forums`
--

LOCK TABLES `phpbb_forums` WRITE;
/*!40000 ALTER TABLE `phpbb_forums` DISABLE KEYS */;
INSERT INTO `phpbb_forums` VALUES (1,0,1,4,'','Your first category','','',7,'','','',0,'','','','',7,'',0,0,0,1,1,1,1,2,'',1249472216,'admin','AA0000',32,1,1,1,1,0,0,0,0,0),(2,1,2,3,'a:1:{i:1;a:2:{i:0;s:19:\"Your first category\";i:1;i:0;}}','Your first forum','Description of your first forum.','',7,'','','',0,'','','','',7,'',0,1,0,1,1,1,1,2,'Welcome to phpBB3',1249472216,'admin','AA0000',32,1,1,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `phpbb_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums_access`
--

DROP TABLE IF EXISTS `phpbb_forums_access`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`forum_id`,`user_id`,`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_forums_access`
--

LOCK TABLES `phpbb_forums_access` WRITE;
/*!40000 ALTER TABLE `phpbb_forums_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_forums_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums_track`
--

DROP TABLE IF EXISTS `phpbb_forums_track`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_forums_track`
--

LOCK TABLES `phpbb_forums_track` WRITE;
/*!40000 ALTER TABLE `phpbb_forums_track` DISABLE KEYS */;
INSERT INTO `phpbb_forums_track` VALUES (2,2,1249480787),(2,0,1249480787);
/*!40000 ALTER TABLE `phpbb_forums_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_forums_watch`
--

DROP TABLE IF EXISTS `phpbb_forums_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_forums_watch`
--

LOCK TABLES `phpbb_forums_watch` WRITE;
/*!40000 ALTER TABLE `phpbb_forums_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_forums_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_groups`
--

DROP TABLE IF EXISTS `phpbb_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc` text collate utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `group_desc_options` int(11) unsigned NOT NULL default '7',
  `group_desc_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `group_display` tinyint(1) unsigned NOT NULL default '0',
  `group_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `group_avatar_type` tinyint(2) NOT NULL default '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `group_rank` mediumint(8) unsigned NOT NULL default '0',
  `group_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL default '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL default '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL default '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL default '0',
  `group_legend` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_groups`
--

LOCK TABLES `phpbb_groups` WRITE;
/*!40000 ALTER TABLE `phpbb_groups` DISABLE KEYS */;
INSERT INTO `phpbb_groups` VALUES (1,3,0,'GUESTS','','',7,'',0,'',0,0,0,0,'',0,0,0,5,0),(2,3,0,'REGISTERED','','',7,'',0,'',0,0,0,0,'',0,0,0,5,0),(3,3,0,'REGISTERED_COPPA','','',7,'',0,'',0,0,0,0,'',0,0,0,5,0),(4,3,0,'GLOBAL_MODERATORS','','',7,'',0,'',0,0,0,0,'00AA00',0,0,0,0,1),(5,3,1,'ADMINISTRATORS','','',7,'',0,'',0,0,0,0,'AA0000',0,0,0,0,1),(6,3,0,'BOTS','','',7,'',0,'',0,0,0,0,'9E8DA7',0,0,0,5,0);
/*!40000 ALTER TABLE `phpbb_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_icons`
--

DROP TABLE IF EXISTS `phpbb_icons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL auto_increment,
  `icons_url` varchar(255) collate utf8_bin NOT NULL default '',
  `icons_width` tinyint(4) NOT NULL default '0',
  `icons_height` tinyint(4) NOT NULL default '0',
  `icons_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_icons`
--

LOCK TABLES `phpbb_icons` WRITE;
/*!40000 ALTER TABLE `phpbb_icons` DISABLE KEYS */;
INSERT INTO `phpbb_icons` VALUES (1,'misc/fire.gif',16,16,1,1),(2,'smile/redface.gif',16,16,9,1),(3,'smile/mrgreen.gif',16,16,10,1),(4,'misc/heart.gif',16,16,4,1),(5,'misc/star.gif',16,16,2,1),(6,'misc/radioactive.gif',16,16,3,1),(7,'misc/thinking.gif',16,16,5,1),(8,'smile/info.gif',16,16,8,1),(9,'smile/question.gif',16,16,6,1),(10,'smile/alert.gif',16,16,7,1);
/*!40000 ALTER TABLE `phpbb_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_lang`
--

DROP TABLE IF EXISTS `phpbb_lang`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL auto_increment,
  `lang_iso` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_dir` varchar(30) collate utf8_bin NOT NULL default '',
  `lang_english_name` varchar(100) collate utf8_bin NOT NULL default '',
  `lang_local_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_author` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_lang`
--

LOCK TABLES `phpbb_lang` WRITE;
/*!40000 ALTER TABLE `phpbb_lang` DISABLE KEYS */;
INSERT INTO `phpbb_lang` VALUES (1,'en','en','British English','British English','phpBB Group'),(2,'uk','uk','Ukrainian','Українська','Black_SN');
/*!40000 ALTER TABLE `phpbb_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_log`
--

DROP TABLE IF EXISTS `phpbb_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `log_type` tinyint(4) NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `reportee_id` mediumint(8) unsigned NOT NULL default '0',
  `log_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  `log_operation` text collate utf8_bin NOT NULL,
  `log_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_log`
--

LOCK TABLES `phpbb_log` WRITE;
/*!40000 ALTER TABLE `phpbb_log` DISABLE KEYS */;
INSERT INTO `phpbb_log` VALUES (1,0,2,0,0,0,'127.0.0.1',1249472222,'LOG_INSTALL_INSTALLED','a:1:{i:0;s:5:\"3.0.5\";}'),(2,0,2,0,0,0,'127.0.0.1',1249480860,'LOG_ADMIN_AUTH_SUCCESS',''),(3,0,2,0,0,0,'127.0.0.1',1249481763,'LOG_LANGUAGE_PACK_INSTALLED','a:1:{i:0;s:9:\"Ukrainian\";}'),(4,0,2,0,0,0,'127.0.0.1',1249481871,'LOG_CONFIG_SETTINGS',''),(5,0,1,0,0,0,'127.0.0.1',1249481884,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(6,0,1,0,0,0,'127.0.0.1',1249481884,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(7,0,1,0,0,0,'127.0.0.1',1249481893,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(8,0,1,0,0,0,'127.0.0.1',1249481896,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(9,0,1,0,0,0,'127.0.0.1',1249481922,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(10,0,1,0,0,0,'127.0.0.1',1249481947,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(11,0,1,0,0,0,'127.0.0.1',1249481951,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(12,0,1,0,0,0,'127.0.0.1',1249481956,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(13,0,1,0,0,0,'127.0.0.1',1249482080,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(14,0,1,0,0,0,'127.0.0.1',1249485967,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(15,0,1,0,0,0,'127.0.0.1',1249486167,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(16,0,1,0,0,0,'127.0.0.1',1249493615,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(17,0,1,0,0,0,'127.0.0.1',1249493789,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(18,0,1,0,0,0,'127.0.0.1',1249493793,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(19,0,1,0,0,0,'127.0.0.1',1249493797,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}'),(20,0,1,0,0,0,'127.0.0.1',1249494017,'LOG_IMAGESET_LANG_MISSING','a:2:{i:0;s:9:\"prosilver\";i:1;s:2:\"uk\";}');
/*!40000 ALTER TABLE `phpbb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_moderator_cache`
--

DROP TABLE IF EXISTS `phpbb_moderator_cache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `group_name` varchar(255) collate utf8_bin NOT NULL default '',
  `display_on_index` tinyint(1) unsigned NOT NULL default '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_moderator_cache`
--

LOCK TABLES `phpbb_moderator_cache` WRITE;
/*!40000 ALTER TABLE `phpbb_moderator_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_moderator_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_modules`
--

DROP TABLE IF EXISTS `phpbb_modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL auto_increment,
  `module_enabled` tinyint(1) unsigned NOT NULL default '1',
  `module_display` tinyint(1) unsigned NOT NULL default '1',
  `module_basename` varchar(255) collate utf8_bin NOT NULL default '',
  `module_class` varchar(10) collate utf8_bin NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `left_id` mediumint(8) unsigned NOT NULL default '0',
  `right_id` mediumint(8) unsigned NOT NULL default '0',
  `module_langname` varchar(255) collate utf8_bin NOT NULL default '',
  `module_mode` varchar(255) collate utf8_bin NOT NULL default '',
  `module_auth` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_modules`
--

LOCK TABLES `phpbb_modules` WRITE;
/*!40000 ALTER TABLE `phpbb_modules` DISABLE KEYS */;
INSERT INTO `phpbb_modules` VALUES (1,1,1,'','acp',0,1,60,'ACP_CAT_GENERAL','',''),(2,1,1,'','acp',1,4,17,'ACP_QUICK_ACCESS','',''),(3,1,1,'','acp',1,18,39,'ACP_BOARD_CONFIGURATION','',''),(4,1,1,'','acp',1,40,47,'ACP_CLIENT_COMMUNICATION','',''),(5,1,1,'','acp',1,48,59,'ACP_SERVER_CONFIGURATION','',''),(6,1,1,'','acp',0,61,78,'ACP_CAT_FORUMS','',''),(7,1,1,'','acp',6,62,67,'ACP_MANAGE_FORUMS','',''),(8,1,1,'','acp',6,68,77,'ACP_FORUM_BASED_PERMISSIONS','',''),(9,1,1,'','acp',0,79,102,'ACP_CAT_POSTING','',''),(10,1,1,'','acp',9,80,91,'ACP_MESSAGES','',''),(11,1,1,'','acp',9,92,101,'ACP_ATTACHMENTS','',''),(12,1,1,'','acp',0,103,156,'ACP_CAT_USERGROUP','',''),(13,1,1,'','acp',12,104,135,'ACP_CAT_USERS','',''),(14,1,1,'','acp',12,136,143,'ACP_GROUPS','',''),(15,1,1,'','acp',12,144,155,'ACP_USER_SECURITY','',''),(16,1,1,'','acp',0,157,204,'ACP_CAT_PERMISSIONS','',''),(17,1,1,'','acp',16,160,169,'ACP_GLOBAL_PERMISSIONS','',''),(18,1,1,'','acp',16,170,179,'ACP_FORUM_BASED_PERMISSIONS','',''),(19,1,1,'','acp',16,180,189,'ACP_PERMISSION_ROLES','',''),(20,1,1,'','acp',16,190,203,'ACP_PERMISSION_MASKS','',''),(21,1,1,'','acp',0,205,218,'ACP_CAT_STYLES','',''),(22,1,1,'','acp',21,206,209,'ACP_STYLE_MANAGEMENT','',''),(23,1,1,'','acp',21,210,217,'ACP_STYLE_COMPONENTS','',''),(24,1,1,'','acp',0,219,238,'ACP_CAT_MAINTENANCE','',''),(25,1,1,'','acp',24,220,229,'ACP_FORUM_LOGS','',''),(26,1,1,'','acp',24,230,237,'ACP_CAT_DATABASE','',''),(27,1,1,'','acp',0,239,264,'ACP_CAT_SYSTEM','',''),(28,1,1,'','acp',27,240,243,'ACP_AUTOMATION','',''),(29,1,1,'','acp',27,244,255,'ACP_GENERAL_TASKS','',''),(30,1,1,'','acp',27,256,263,'ACP_MODULE_MANAGEMENT','',''),(31,1,1,'','acp',0,265,266,'ACP_CAT_DOT_MODS','',''),(32,1,1,'attachments','acp',3,19,20,'ACP_ATTACHMENT_SETTINGS','attach','acl_a_attach'),(33,1,1,'attachments','acp',11,93,94,'ACP_ATTACHMENT_SETTINGS','attach','acl_a_attach'),(34,1,1,'attachments','acp',11,95,96,'ACP_MANAGE_EXTENSIONS','extensions','acl_a_attach'),(35,1,1,'attachments','acp',11,97,98,'ACP_EXTENSION_GROUPS','ext_groups','acl_a_attach'),(36,1,1,'attachments','acp',11,99,100,'ACP_ORPHAN_ATTACHMENTS','orphan','acl_a_attach'),(37,1,1,'ban','acp',15,145,146,'ACP_BAN_EMAILS','email','acl_a_ban'),(38,1,1,'ban','acp',15,147,148,'ACP_BAN_IPS','ip','acl_a_ban'),(39,1,1,'ban','acp',15,149,150,'ACP_BAN_USERNAMES','user','acl_a_ban'),(40,1,1,'bbcodes','acp',10,81,82,'ACP_BBCODES','bbcodes','acl_a_bbcode'),(41,1,1,'board','acp',3,21,22,'ACP_BOARD_SETTINGS','settings','acl_a_board'),(42,1,1,'board','acp',3,23,24,'ACP_BOARD_FEATURES','features','acl_a_board'),(43,1,1,'board','acp',3,25,26,'ACP_AVATAR_SETTINGS','avatar','acl_a_board'),(44,1,1,'board','acp',3,27,28,'ACP_MESSAGE_SETTINGS','message','acl_a_board'),(45,1,1,'board','acp',10,83,84,'ACP_MESSAGE_SETTINGS','message','acl_a_board'),(46,1,1,'board','acp',3,29,30,'ACP_POST_SETTINGS','post','acl_a_board'),(47,1,1,'board','acp',3,31,32,'ACP_SIGNATURE_SETTINGS','signature','acl_a_board'),(48,1,1,'board','acp',3,33,34,'ACP_REGISTER_SETTINGS','registration','acl_a_board'),(49,1,1,'board','acp',4,41,42,'ACP_AUTH_SETTINGS','auth','acl_a_server'),(50,1,1,'board','acp',4,43,44,'ACP_EMAIL_SETTINGS','email','acl_a_server'),(51,1,1,'board','acp',5,49,50,'ACP_COOKIE_SETTINGS','cookie','acl_a_server'),(52,1,1,'board','acp',5,51,52,'ACP_SERVER_SETTINGS','server','acl_a_server'),(53,1,1,'board','acp',5,53,54,'ACP_SECURITY_SETTINGS','security','acl_a_server'),(54,1,1,'board','acp',5,55,56,'ACP_LOAD_SETTINGS','load','acl_a_server'),(55,1,1,'bots','acp',29,245,246,'ACP_BOTS','bots','acl_a_bots'),(56,1,1,'captcha','acp',3,35,36,'ACP_VC_SETTINGS','visual','acl_a_board'),(57,1,0,'captcha','acp',3,37,38,'ACP_VC_CAPTCHA_DISPLAY','img','acl_a_board'),(58,1,1,'database','acp',26,231,232,'ACP_BACKUP','backup','acl_a_backup'),(59,1,1,'database','acp',26,233,234,'ACP_RESTORE','restore','acl_a_backup'),(60,1,1,'disallow','acp',15,151,152,'ACP_DISALLOW_USERNAMES','usernames','acl_a_names'),(61,1,1,'email','acp',29,247,248,'ACP_MASS_EMAIL','email','acl_a_email && cfg_email_enable'),(62,1,1,'forums','acp',7,63,64,'ACP_MANAGE_FORUMS','manage','acl_a_forum'),(63,1,1,'groups','acp',14,137,138,'ACP_GROUPS_MANAGE','manage','acl_a_group'),(64,1,1,'icons','acp',10,85,86,'ACP_ICONS','icons','acl_a_icons'),(65,1,1,'icons','acp',10,87,88,'ACP_SMILIES','smilies','acl_a_icons'),(66,1,1,'inactive','acp',13,107,108,'ACP_INACTIVE_USERS','list','acl_a_user'),(67,1,1,'jabber','acp',4,45,46,'ACP_JABBER_SETTINGS','settings','acl_a_jabber'),(68,1,1,'language','acp',29,249,250,'ACP_LANGUAGE_PACKS','lang_packs','acl_a_language'),(69,1,1,'logs','acp',25,221,222,'ACP_ADMIN_LOGS','admin','acl_a_viewlogs'),(70,1,1,'logs','acp',25,223,224,'ACP_MOD_LOGS','mod','acl_a_viewlogs'),(71,1,1,'logs','acp',25,225,226,'ACP_USERS_LOGS','users','acl_a_viewlogs'),(72,1,1,'logs','acp',25,227,228,'ACP_CRITICAL_LOGS','critical','acl_a_viewlogs'),(73,1,1,'main','acp',1,2,3,'ACP_INDEX','main',''),(74,1,1,'modules','acp',30,257,258,'ACP','acp','acl_a_modules'),(75,1,1,'modules','acp',30,259,260,'UCP','ucp','acl_a_modules'),(76,1,1,'modules','acp',30,261,262,'MCP','mcp','acl_a_modules'),(77,1,1,'permission_roles','acp',19,181,182,'ACP_ADMIN_ROLES','admin_roles','acl_a_roles && acl_a_aauth'),(78,1,1,'permission_roles','acp',19,183,184,'ACP_USER_ROLES','user_roles','acl_a_roles && acl_a_uauth'),(79,1,1,'permission_roles','acp',19,185,186,'ACP_MOD_ROLES','mod_roles','acl_a_roles && acl_a_mauth'),(80,1,1,'permission_roles','acp',19,187,188,'ACP_FORUM_ROLES','forum_roles','acl_a_roles && acl_a_fauth'),(81,1,1,'permissions','acp',16,158,159,'ACP_PERMISSIONS','intro','acl_a_authusers || acl_a_authgroups || acl_a_viewauth'),(82,1,0,'permissions','acp',20,191,192,'ACP_PERMISSION_TRACE','trace','acl_a_viewauth'),(83,1,1,'permissions','acp',18,171,172,'ACP_FORUM_PERMISSIONS','setting_forum_local','acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),(84,1,1,'permissions','acp',18,173,174,'ACP_FORUM_MODERATORS','setting_mod_local','acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),(85,1,1,'permissions','acp',17,161,162,'ACP_USERS_PERMISSIONS','setting_user_global','acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(86,1,1,'permissions','acp',13,109,110,'ACP_USERS_PERMISSIONS','setting_user_global','acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(87,1,1,'permissions','acp',18,175,176,'ACP_USERS_FORUM_PERMISSIONS','setting_user_local','acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),(88,1,1,'permissions','acp',13,111,112,'ACP_USERS_FORUM_PERMISSIONS','setting_user_local','acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),(89,1,1,'permissions','acp',17,163,164,'ACP_GROUPS_PERMISSIONS','setting_group_global','acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(90,1,1,'permissions','acp',14,139,140,'ACP_GROUPS_PERMISSIONS','setting_group_global','acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),(91,1,1,'permissions','acp',18,177,178,'ACP_GROUPS_FORUM_PERMISSIONS','setting_group_local','acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),(92,1,1,'permissions','acp',14,141,142,'ACP_GROUPS_FORUM_PERMISSIONS','setting_group_local','acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),(93,1,1,'permissions','acp',17,165,166,'ACP_ADMINISTRATORS','setting_admin_global','acl_a_aauth && (acl_a_authusers || acl_a_authgroups)'),(94,1,1,'permissions','acp',17,167,168,'ACP_GLOBAL_MODERATORS','setting_mod_global','acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),(95,1,1,'permissions','acp',20,193,194,'ACP_VIEW_ADMIN_PERMISSIONS','view_admin_global','acl_a_viewauth'),(96,1,1,'permissions','acp',20,195,196,'ACP_VIEW_USER_PERMISSIONS','view_user_global','acl_a_viewauth'),(97,1,1,'permissions','acp',20,197,198,'ACP_VIEW_GLOBAL_MOD_PERMISSIONS','view_mod_global','acl_a_viewauth'),(98,1,1,'permissions','acp',20,199,200,'ACP_VIEW_FORUM_MOD_PERMISSIONS','view_mod_local','acl_a_viewauth'),(99,1,1,'permissions','acp',20,201,202,'ACP_VIEW_FORUM_PERMISSIONS','view_forum_local','acl_a_viewauth'),(100,1,1,'php_info','acp',29,251,252,'ACP_PHP_INFO','info','acl_a_phpinfo'),(101,1,1,'profile','acp',13,113,114,'ACP_CUSTOM_PROFILE_FIELDS','profile','acl_a_profile'),(102,1,1,'prune','acp',7,65,66,'ACP_PRUNE_FORUMS','forums','acl_a_prune'),(103,1,1,'prune','acp',15,153,154,'ACP_PRUNE_USERS','users','acl_a_userdel'),(104,1,1,'ranks','acp',13,115,116,'ACP_MANAGE_RANKS','ranks','acl_a_ranks'),(105,1,1,'reasons','acp',29,253,254,'ACP_MANAGE_REASONS','main','acl_a_reasons'),(106,1,1,'search','acp',5,57,58,'ACP_SEARCH_SETTINGS','settings','acl_a_search'),(107,1,1,'search','acp',26,235,236,'ACP_SEARCH_INDEX','index','acl_a_search'),(108,1,1,'styles','acp',22,207,208,'ACP_STYLES','style','acl_a_styles'),(109,1,1,'styles','acp',23,211,212,'ACP_TEMPLATES','template','acl_a_styles'),(110,1,1,'styles','acp',23,213,214,'ACP_THEMES','theme','acl_a_styles'),(111,1,1,'styles','acp',23,215,216,'ACP_IMAGESETS','imageset','acl_a_styles'),(112,1,1,'update','acp',28,241,242,'ACP_VERSION_CHECK','version_check','acl_a_board'),(113,1,1,'users','acp',13,105,106,'ACP_MANAGE_USERS','overview','acl_a_user'),(114,1,0,'users','acp',13,117,118,'ACP_USER_FEEDBACK','feedback','acl_a_user'),(115,1,0,'users','acp',13,119,120,'ACP_USER_PROFILE','profile','acl_a_user'),(116,1,0,'users','acp',13,121,122,'ACP_USER_PREFS','prefs','acl_a_user'),(117,1,0,'users','acp',13,123,124,'ACP_USER_AVATAR','avatar','acl_a_user'),(118,1,0,'users','acp',13,125,126,'ACP_USER_RANK','rank','acl_a_user'),(119,1,0,'users','acp',13,127,128,'ACP_USER_SIG','sig','acl_a_user'),(120,1,0,'users','acp',13,129,130,'ACP_USER_GROUPS','groups','acl_a_user && acl_a_group'),(121,1,0,'users','acp',13,131,132,'ACP_USER_PERM','perm','acl_a_user && acl_a_viewauth'),(122,1,0,'users','acp',13,133,134,'ACP_USER_ATTACH','attach','acl_a_user'),(123,1,1,'words','acp',10,89,90,'ACP_WORDS','words','acl_a_words'),(124,1,1,'users','acp',2,5,6,'ACP_MANAGE_USERS','overview','acl_a_user'),(125,1,1,'groups','acp',2,7,8,'ACP_GROUPS_MANAGE','manage','acl_a_group'),(126,1,1,'forums','acp',2,9,10,'ACP_MANAGE_FORUMS','manage','acl_a_forum'),(127,1,1,'logs','acp',2,11,12,'ACP_MOD_LOGS','mod','acl_a_viewlogs'),(128,1,1,'bots','acp',2,13,14,'ACP_BOTS','bots','acl_a_bots'),(129,1,1,'php_info','acp',2,15,16,'ACP_PHP_INFO','info','acl_a_phpinfo'),(130,1,1,'permissions','acp',8,69,70,'ACP_FORUM_PERMISSIONS','setting_forum_local','acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),(131,1,1,'permissions','acp',8,71,72,'ACP_FORUM_MODERATORS','setting_mod_local','acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),(132,1,1,'permissions','acp',8,73,74,'ACP_USERS_FORUM_PERMISSIONS','setting_user_local','acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),(133,1,1,'permissions','acp',8,75,76,'ACP_GROUPS_FORUM_PERMISSIONS','setting_group_local','acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),(134,1,1,'','mcp',0,1,10,'MCP_MAIN','',''),(135,1,1,'','mcp',0,11,18,'MCP_QUEUE','',''),(136,1,1,'','mcp',0,19,26,'MCP_REPORTS','',''),(137,1,1,'','mcp',0,27,32,'MCP_NOTES','',''),(138,1,1,'','mcp',0,33,42,'MCP_WARN','',''),(139,1,1,'','mcp',0,43,50,'MCP_LOGS','',''),(140,1,1,'','mcp',0,51,58,'MCP_BAN','',''),(141,1,1,'ban','mcp',140,52,53,'MCP_BAN_USERNAMES','user','acl_m_ban'),(142,1,1,'ban','mcp',140,54,55,'MCP_BAN_IPS','ip','acl_m_ban'),(143,1,1,'ban','mcp',140,56,57,'MCP_BAN_EMAILS','email','acl_m_ban'),(144,1,1,'logs','mcp',139,44,45,'MCP_LOGS_FRONT','front','acl_m_ || aclf_m_'),(145,1,1,'logs','mcp',139,46,47,'MCP_LOGS_FORUM_VIEW','forum_logs','acl_m_,$id'),(146,1,1,'logs','mcp',139,48,49,'MCP_LOGS_TOPIC_VIEW','topic_logs','acl_m_,$id'),(147,1,1,'main','mcp',134,2,3,'MCP_MAIN_FRONT','front',''),(148,1,1,'main','mcp',134,4,5,'MCP_MAIN_FORUM_VIEW','forum_view','acl_m_,$id'),(149,1,1,'main','mcp',134,6,7,'MCP_MAIN_TOPIC_VIEW','topic_view','acl_m_,$id'),(150,1,1,'main','mcp',134,8,9,'MCP_MAIN_POST_DETAILS','post_details','acl_m_,$id || (!$id && aclf_m_)'),(151,1,1,'notes','mcp',137,28,29,'MCP_NOTES_FRONT','front',''),(152,1,1,'notes','mcp',137,30,31,'MCP_NOTES_USER','user_notes',''),(153,1,1,'queue','mcp',135,12,13,'MCP_QUEUE_UNAPPROVED_TOPICS','unapproved_topics','aclf_m_approve'),(154,1,1,'queue','mcp',135,14,15,'MCP_QUEUE_UNAPPROVED_POSTS','unapproved_posts','aclf_m_approve'),(155,1,1,'queue','mcp',135,16,17,'MCP_QUEUE_APPROVE_DETAILS','approve_details','acl_m_approve,$id || (!$id && aclf_m_approve)'),(156,1,1,'reports','mcp',136,20,21,'MCP_REPORTS_OPEN','reports','aclf_m_report'),(157,1,1,'reports','mcp',136,22,23,'MCP_REPORTS_CLOSED','reports_closed','aclf_m_report'),(158,1,1,'reports','mcp',136,24,25,'MCP_REPORT_DETAILS','report_details','acl_m_report,$id || (!$id && aclf_m_report)'),(159,1,1,'warn','mcp',138,34,35,'MCP_WARN_FRONT','front','aclf_m_warn'),(160,1,1,'warn','mcp',138,36,37,'MCP_WARN_LIST','list','aclf_m_warn'),(161,1,1,'warn','mcp',138,38,39,'MCP_WARN_USER','warn_user','aclf_m_warn'),(162,1,1,'warn','mcp',138,40,41,'MCP_WARN_POST','warn_post','acl_m_warn && acl_f_read,$id'),(163,1,1,'','ucp',0,1,12,'UCP_MAIN','',''),(164,1,1,'','ucp',0,13,22,'UCP_PROFILE','',''),(165,1,1,'','ucp',0,23,30,'UCP_PREFS','',''),(166,1,1,'','ucp',0,31,42,'UCP_PM','',''),(167,1,1,'','ucp',0,43,48,'UCP_USERGROUPS','',''),(168,1,1,'','ucp',0,49,54,'UCP_ZEBRA','',''),(169,1,1,'attachments','ucp',163,10,11,'UCP_MAIN_ATTACHMENTS','attachments','acl_u_attach'),(170,1,1,'groups','ucp',167,44,45,'UCP_USERGROUPS_MEMBER','membership',''),(171,1,1,'groups','ucp',167,46,47,'UCP_USERGROUPS_MANAGE','manage',''),(172,1,1,'main','ucp',163,2,3,'UCP_MAIN_FRONT','front',''),(173,1,1,'main','ucp',163,4,5,'UCP_MAIN_SUBSCRIBED','subscribed',''),(174,1,1,'main','ucp',163,6,7,'UCP_MAIN_BOOKMARKS','bookmarks','cfg_allow_bookmarks'),(175,1,1,'main','ucp',163,8,9,'UCP_MAIN_DRAFTS','drafts',''),(176,1,0,'pm','ucp',166,32,33,'UCP_PM_VIEW','view','cfg_allow_privmsg'),(177,1,1,'pm','ucp',166,34,35,'UCP_PM_COMPOSE','compose','cfg_allow_privmsg'),(178,1,1,'pm','ucp',166,36,37,'UCP_PM_DRAFTS','drafts','cfg_allow_privmsg'),(179,1,1,'pm','ucp',166,38,39,'UCP_PM_OPTIONS','options','cfg_allow_privmsg'),(180,1,0,'pm','ucp',166,40,41,'UCP_PM_POPUP_TITLE','popup','cfg_allow_privmsg'),(181,1,1,'prefs','ucp',165,24,25,'UCP_PREFS_PERSONAL','personal',''),(182,1,1,'prefs','ucp',165,26,27,'UCP_PREFS_POST','post',''),(183,1,1,'prefs','ucp',165,28,29,'UCP_PREFS_VIEW','view',''),(184,1,1,'profile','ucp',164,14,15,'UCP_PROFILE_PROFILE_INFO','profile_info',''),(185,1,1,'profile','ucp',164,16,17,'UCP_PROFILE_SIGNATURE','signature',''),(186,1,1,'profile','ucp',164,18,19,'UCP_PROFILE_AVATAR','avatar',''),(187,1,1,'profile','ucp',164,20,21,'UCP_PROFILE_REG_DETAILS','reg_details',''),(188,1,1,'zebra','ucp',168,50,51,'UCP_ZEBRA_FRIENDS','friends',''),(189,1,1,'zebra','ucp',168,52,53,'UCP_ZEBRA_FOES','foes','');
/*!40000 ALTER TABLE `phpbb_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_poll_options`
--

DROP TABLE IF EXISTS `phpbb_poll_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_text` text collate utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL default '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_poll_options`
--

LOCK TABLES `phpbb_poll_options` WRITE;
/*!40000 ALTER TABLE `phpbb_poll_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_poll_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_poll_votes`
--

DROP TABLE IF EXISTS `phpbb_poll_votes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `poll_option_id` tinyint(4) NOT NULL default '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_poll_votes`
--

LOCK TABLES `phpbb_poll_votes` WRITE;
/*!40000 ALTER TABLE `phpbb_poll_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_poll_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_posts`
--

DROP TABLE IF EXISTS `phpbb_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `poster_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `post_time` int(11) unsigned NOT NULL default '0',
  `post_approved` tinyint(1) unsigned NOT NULL default '1',
  `post_reported` tinyint(1) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `post_username` varchar(255) collate utf8_bin NOT NULL default '',
  `post_subject` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `post_text` mediumtext collate utf8_bin NOT NULL,
  `post_checksum` varchar(32) collate utf8_bin NOT NULL default '',
  `post_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `post_postcount` tinyint(1) unsigned NOT NULL default '1',
  `post_edit_time` int(11) unsigned NOT NULL default '0',
  `post_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `post_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `post_edit_count` smallint(4) unsigned NOT NULL default '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `tid_post_time` (`topic_id`,`post_time`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_posts`
--

LOCK TABLES `phpbb_posts` WRITE;
/*!40000 ALTER TABLE `phpbb_posts` DISABLE KEYS */;
INSERT INTO `phpbb_posts` VALUES (1,1,2,2,0,'127.0.0.1',1249472216,1,0,1,1,1,1,'','Welcome to phpBB3','This is an example post in your phpBB3 installation. Everything seems to be working. You may delete this post if you like and continue to set up your board. During the installation process your first category and your first forum are assigned an appropriate set of permissions for the predefined usergroups administrators, bots, global moderators, guests, registered users and registered COPPA users. If you also choose to delete your first category and your first forum, do not forget to assign permissions for all these usergroups for all new categories and forums you create. It is recommended to rename your first category and your first forum and copy permissions from these while creating new categories and forums. Have fun!','5dd683b17f641daf84c040bfefc58ce9',0,'','',1,0,'',0,0,0);
/*!40000 ALTER TABLE `phpbb_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs`
--

DROP TABLE IF EXISTS `phpbb_privmsgs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `root_level` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `author_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `message_time` int(11) unsigned NOT NULL default '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL default '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL default '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL default '1',
  `enable_sig` tinyint(1) unsigned NOT NULL default '1',
  `message_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `message_text` mediumtext collate utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) collate utf8_bin NOT NULL default '',
  `message_edit_user` mediumint(8) unsigned NOT NULL default '0',
  `message_attachment` tinyint(1) unsigned NOT NULL default '0',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `message_edit_time` int(11) unsigned NOT NULL default '0',
  `message_edit_count` smallint(4) unsigned NOT NULL default '0',
  `to_address` text collate utf8_bin NOT NULL,
  `bcc_address` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_privmsgs`
--

LOCK TABLES `phpbb_privmsgs` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs_folder`
--

DROP TABLE IF EXISTS `phpbb_privmsgs_folder`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `folder_name` varchar(255) collate utf8_bin NOT NULL default '',
  `pm_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_privmsgs_folder`
--

LOCK TABLES `phpbb_privmsgs_folder` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs_rules`
--

DROP TABLE IF EXISTS `phpbb_privmsgs_rules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_check` mediumint(8) unsigned NOT NULL default '0',
  `rule_connection` mediumint(8) unsigned NOT NULL default '0',
  `rule_string` varchar(255) collate utf8_bin NOT NULL default '',
  `rule_user_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL default '0',
  `rule_action` mediumint(8) unsigned NOT NULL default '0',
  `rule_folder_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_privmsgs_rules`
--

LOCK TABLES `phpbb_privmsgs_rules` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_privmsgs_to`
--

DROP TABLE IF EXISTS `phpbb_privmsgs_to`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `author_id` mediumint(8) unsigned NOT NULL default '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL default '0',
  `pm_new` tinyint(1) unsigned NOT NULL default '1',
  `pm_unread` tinyint(1) unsigned NOT NULL default '1',
  `pm_replied` tinyint(1) unsigned NOT NULL default '0',
  `pm_marked` tinyint(1) unsigned NOT NULL default '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL default '0',
  `folder_id` int(11) NOT NULL default '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_privmsgs_to`
--

LOCK TABLES `phpbb_privmsgs_to` WRITE;
/*!40000 ALTER TABLE `phpbb_privmsgs_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_privmsgs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_fields`
--

DROP TABLE IF EXISTS `phpbb_profile_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL auto_increment,
  `field_name` varchar(255) collate utf8_bin NOT NULL default '',
  `field_type` tinyint(4) NOT NULL default '0',
  `field_ident` varchar(20) collate utf8_bin NOT NULL default '',
  `field_length` varchar(20) collate utf8_bin NOT NULL default '',
  `field_minlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_maxlen` varchar(255) collate utf8_bin NOT NULL default '',
  `field_novalue` varchar(255) collate utf8_bin NOT NULL default '',
  `field_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  `field_validation` varchar(20) collate utf8_bin NOT NULL default '',
  `field_required` tinyint(1) unsigned NOT NULL default '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL default '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL default '0',
  `field_hide` tinyint(1) unsigned NOT NULL default '0',
  `field_no_view` tinyint(1) unsigned NOT NULL default '0',
  `field_active` tinyint(1) unsigned NOT NULL default '0',
  `field_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_profile_fields`
--

LOCK TABLES `phpbb_profile_fields` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_fields_data`
--

DROP TABLE IF EXISTS `phpbb_profile_fields_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_profile_fields_data`
--

LOCK TABLES `phpbb_profile_fields_data` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_fields_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_profile_fields_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_fields_lang`
--

DROP TABLE IF EXISTS `phpbb_profile_fields_lang`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `option_id` mediumint(8) unsigned NOT NULL default '0',
  `field_type` tinyint(4) NOT NULL default '0',
  `lang_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`,`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_profile_fields_lang`
--

LOCK TABLES `phpbb_profile_fields_lang` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_fields_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_profile_fields_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_profile_lang`
--

DROP TABLE IF EXISTS `phpbb_profile_lang`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_id` mediumint(8) unsigned NOT NULL default '0',
  `lang_name` varchar(255) collate utf8_bin NOT NULL default '',
  `lang_explain` text collate utf8_bin NOT NULL,
  `lang_default_value` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`field_id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_profile_lang`
--

LOCK TABLES `phpbb_profile_lang` WRITE;
/*!40000 ALTER TABLE `phpbb_profile_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_profile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_ranks`
--

DROP TABLE IF EXISTS `phpbb_ranks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL auto_increment,
  `rank_title` varchar(255) collate utf8_bin NOT NULL default '',
  `rank_min` mediumint(8) unsigned NOT NULL default '0',
  `rank_special` tinyint(1) unsigned NOT NULL default '0',
  `rank_image` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_ranks`
--

LOCK TABLES `phpbb_ranks` WRITE;
/*!40000 ALTER TABLE `phpbb_ranks` DISABLE KEYS */;
INSERT INTO `phpbb_ranks` VALUES (1,'Site Admin',0,1,'');
/*!40000 ALTER TABLE `phpbb_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_reports`
--

DROP TABLE IF EXISTS `phpbb_reports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_reports` (
  `report_id` mediumint(8) unsigned NOT NULL auto_increment,
  `reason_id` smallint(4) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `report_closed` tinyint(1) unsigned NOT NULL default '0',
  `report_time` int(11) unsigned NOT NULL default '0',
  `report_text` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_reports`
--

LOCK TABLES `phpbb_reports` WRITE;
/*!40000 ALTER TABLE `phpbb_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_reports_reasons`
--

DROP TABLE IF EXISTS `phpbb_reports_reasons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL auto_increment,
  `reason_title` varchar(255) collate utf8_bin NOT NULL default '',
  `reason_description` mediumtext collate utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`reason_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_reports_reasons`
--

LOCK TABLES `phpbb_reports_reasons` WRITE;
/*!40000 ALTER TABLE `phpbb_reports_reasons` DISABLE KEYS */;
INSERT INTO `phpbb_reports_reasons` VALUES (1,'warez','The post contains links to illegal or pirated software.',1),(2,'spam','The reported post has the only purpose to advertise for a website or another product.',2),(3,'off_topic','The reported post is off topic.',3),(4,'other','The reported post does not fit into any other category, please use the further information field.',4);
/*!40000 ALTER TABLE `phpbb_reports_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_search_results`
--

DROP TABLE IF EXISTS `phpbb_search_results`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_search_results` (
  `search_key` varchar(32) collate utf8_bin NOT NULL default '',
  `search_time` int(11) unsigned NOT NULL default '0',
  `search_keywords` mediumtext collate utf8_bin NOT NULL,
  `search_authors` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`search_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_search_results`
--

LOCK TABLES `phpbb_search_results` WRITE;
/*!40000 ALTER TABLE `phpbb_search_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_search_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_search_wordlist`
--

DROP TABLE IF EXISTS `phpbb_search_wordlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_text` varchar(255) collate utf8_bin NOT NULL default '',
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  `word_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_search_wordlist`
--

LOCK TABLES `phpbb_search_wordlist` WRITE;
/*!40000 ALTER TABLE `phpbb_search_wordlist` DISABLE KEYS */;
INSERT INTO `phpbb_search_wordlist` VALUES (1,'this',0,1),(2,'example',0,1),(3,'post',0,1),(4,'your',0,1),(5,'phpbb3',0,2),(6,'installation',0,1),(7,'everything',0,1),(8,'seems',0,1),(9,'working',0,1),(10,'you',0,1),(11,'may',0,1),(12,'delete',0,1),(13,'like',0,1),(14,'and',0,1),(15,'continue',0,1),(16,'set',0,1),(17,'board',0,1),(18,'during',0,1),(19,'the',0,1),(20,'process',0,1),(21,'first',0,1),(22,'category',0,1),(23,'forum',0,1),(24,'are',0,1),(25,'assigned',0,1),(26,'appropriate',0,1),(27,'permissions',0,1),(28,'for',0,1),(29,'predefined',0,1),(30,'usergroups',0,1),(31,'administrators',0,1),(32,'bots',0,1),(33,'global',0,1),(34,'moderators',0,1),(35,'guests',0,1),(36,'registered',0,1),(37,'users',0,1),(38,'coppa',0,1),(39,'also',0,1),(40,'choose',0,1),(41,'not',0,1),(42,'forget',0,1),(43,'assign',0,1),(44,'all',0,1),(45,'these',0,1),(46,'new',0,1),(47,'categories',0,1),(48,'forums',0,1),(49,'create',0,1),(50,'recommended',0,1),(51,'rename',0,1),(52,'copy',0,1),(53,'from',0,1),(54,'while',0,1),(55,'creating',0,1),(56,'have',0,1),(57,'fun',0,1),(58,'welcome',0,1);
/*!40000 ALTER TABLE `phpbb_search_wordlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_search_wordmatch`
--

DROP TABLE IF EXISTS `phpbb_search_wordmatch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) unsigned NOT NULL default '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_search_wordmatch`
--

LOCK TABLES `phpbb_search_wordmatch` WRITE;
/*!40000 ALTER TABLE `phpbb_search_wordmatch` DISABLE KEYS */;
INSERT INTO `phpbb_search_wordmatch` VALUES (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,5,1),(1,6,0),(1,7,0),(1,8,0),(1,9,0),(1,10,0),(1,11,0),(1,12,0),(1,13,0),(1,14,0),(1,15,0),(1,16,0),(1,17,0),(1,18,0),(1,19,0),(1,20,0),(1,21,0),(1,22,0),(1,23,0),(1,24,0),(1,25,0),(1,26,0),(1,27,0),(1,28,0),(1,29,0),(1,30,0),(1,31,0),(1,32,0),(1,33,0),(1,34,0),(1,35,0),(1,36,0),(1,37,0),(1,38,0),(1,39,0),(1,40,0),(1,41,0),(1,42,0),(1,43,0),(1,44,0),(1,45,0),(1,46,0),(1,47,0),(1,48,0),(1,49,0),(1,50,0),(1,51,0),(1,52,0),(1,53,0),(1,54,0),(1,55,0),(1,56,0),(1,57,0),(1,58,1);
/*!40000 ALTER TABLE `phpbb_search_wordmatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_sessions`
--

DROP TABLE IF EXISTS `phpbb_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_sessions` (
  `session_id` char(32) collate utf8_bin NOT NULL default '',
  `session_user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL default '0',
  `session_last_visit` int(11) unsigned NOT NULL default '0',
  `session_start` int(11) unsigned NOT NULL default '0',
  `session_time` int(11) unsigned NOT NULL default '0',
  `session_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `session_browser` varchar(150) collate utf8_bin NOT NULL default '',
  `session_forwarded_for` varchar(255) collate utf8_bin NOT NULL default '',
  `session_page` varchar(255) collate utf8_bin NOT NULL default '',
  `session_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `session_autologin` tinyint(1) unsigned NOT NULL default '0',
  `session_admin` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_sessions`
--

LOCK TABLES `phpbb_sessions` WRITE;
/*!40000 ALTER TABLE `phpbb_sessions` DISABLE KEYS */;
INSERT INTO `phpbb_sessions` VALUES ('197c869291daf0b842d00036306e3d24',1,0,1249493615,1249493615,1249493615,'127.0.0.1','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.12) Gecko/2009070610 Firefox/3.0.12 FirePHP/0.2.4','','index.php',1,0,0),('c178e47dccdfef711c008075a9b5806e',1,0,1249493789,1249493789,1249493789,'127.0.0.1','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.12) Gecko/2009070610 Firefox/3.0.12 FirePHP/0.2.4','','index.php',1,0,0),('bc5eaf54bdc1f4fefc2d9e6a28784812',1,0,1249493793,1249493793,1249493793,'127.0.0.1','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.12) Gecko/2009070610 Firefox/3.0.12 FirePHP/0.2.4','','index.php',1,0,0),('80d1f3303b472fdcfec71572a7ebeea1',2,0,1249480717,1249494017,1249494021,'127.0.0.1','Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.12) Gecko/2009070610 Firefox/3.0.12 FirePHP/0.2.4','','index.php',1,0,0);
/*!40000 ALTER TABLE `phpbb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_sessions_keys`
--

DROP TABLE IF EXISTS `phpbb_sessions_keys`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_sessions_keys` (
  `key_id` char(32) collate utf8_bin NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `last_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `last_login` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_sessions_keys`
--

LOCK TABLES `phpbb_sessions_keys` WRITE;
/*!40000 ALTER TABLE `phpbb_sessions_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_sessions_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_sitelist`
--

DROP TABLE IF EXISTS `phpbb_sitelist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL auto_increment,
  `site_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `site_hostname` varchar(255) collate utf8_bin NOT NULL default '',
  `ip_exclude` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_sitelist`
--

LOCK TABLES `phpbb_sitelist` WRITE;
/*!40000 ALTER TABLE `phpbb_sitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_sitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_smilies`
--

DROP TABLE IF EXISTS `phpbb_smilies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL auto_increment,
  `code` varchar(50) collate utf8_bin NOT NULL default '',
  `emotion` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_url` varchar(50) collate utf8_bin NOT NULL default '',
  `smiley_width` smallint(4) unsigned NOT NULL default '0',
  `smiley_height` smallint(4) unsigned NOT NULL default '0',
  `smiley_order` mediumint(8) unsigned NOT NULL default '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_smilies`
--

LOCK TABLES `phpbb_smilies` WRITE;
/*!40000 ALTER TABLE `phpbb_smilies` DISABLE KEYS */;
INSERT INTO `phpbb_smilies` VALUES (1,':D','Very Happy','icon_e_biggrin.gif',15,17,1,1),(2,':-D','Very Happy','icon_e_biggrin.gif',15,17,2,1),(3,':grin:','Very Happy','icon_e_biggrin.gif',15,17,3,1),(4,':)','Smile','icon_e_smile.gif',15,17,4,1),(5,':-)','Smile','icon_e_smile.gif',15,17,5,1),(6,':smile:','Smile','icon_e_smile.gif',15,17,6,1),(7,';)','Wink','icon_e_wink.gif',15,17,7,1),(8,';-)','Wink','icon_e_wink.gif',15,17,8,1),(9,':wink:','Wink','icon_e_wink.gif',15,17,9,1),(10,':(','Sad','icon_e_sad.gif',15,17,10,1),(11,':-(','Sad','icon_e_sad.gif',15,17,11,1),(12,':sad:','Sad','icon_e_sad.gif',15,17,12,1),(13,':o','Surprised','icon_e_surprised.gif',15,17,13,1),(14,':-o','Surprised','icon_e_surprised.gif',15,17,14,1),(15,':eek:','Surprised','icon_e_surprised.gif',15,17,15,1),(16,':shock:','Shocked','icon_eek.gif',15,17,16,1),(17,':?','Confused','icon_e_confused.gif',15,17,17,1),(18,':-?','Confused','icon_e_confused.gif',15,17,18,1),(19,':???:','Confused','icon_e_confused.gif',15,17,19,1),(20,'8-)','Cool','icon_cool.gif',15,17,20,1),(21,':cool:','Cool','icon_cool.gif',15,17,21,1),(22,':lol:','Laughing','icon_lol.gif',15,17,22,1),(23,':x','Mad','icon_mad.gif',15,17,23,1),(24,':-x','Mad','icon_mad.gif',15,17,24,1),(25,':mad:','Mad','icon_mad.gif',15,17,25,1),(26,':P','Razz','icon_razz.gif',15,17,26,1),(27,':-P','Razz','icon_razz.gif',15,17,27,1),(28,':razz:','Razz','icon_razz.gif',15,17,28,1),(29,':oops:','Embarrassed','icon_redface.gif',15,17,29,1),(30,':cry:','Crying or Very Sad','icon_cry.gif',15,17,30,1),(31,':evil:','Evil or Very Mad','icon_evil.gif',15,17,31,1),(32,':twisted:','Twisted Evil','icon_twisted.gif',15,17,32,1),(33,':roll:','Rolling Eyes','icon_rolleyes.gif',15,17,33,1),(34,':!:','Exclamation','icon_exclaim.gif',15,17,34,1),(35,':?:','Question','icon_question.gif',15,17,35,1),(36,':idea:','Idea','icon_idea.gif',15,17,36,1),(37,':arrow:','Arrow','icon_arrow.gif',15,17,37,1),(38,':|','Neutral','icon_neutral.gif',15,17,38,1),(39,':-|','Neutral','icon_neutral.gif',15,17,39,1),(40,':mrgreen:','Mr. Green','icon_mrgreen.gif',15,17,40,1),(41,':geek:','Geek','icon_e_geek.gif',17,17,41,1),(42,':ugeek:','Uber Geek','icon_e_ugeek.gif',17,18,42,1);
/*!40000 ALTER TABLE `phpbb_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles`
--

DROP TABLE IF EXISTS `phpbb_styles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL auto_increment,
  `style_name` varchar(255) collate utf8_bin NOT NULL default '',
  `style_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `style_active` tinyint(1) unsigned NOT NULL default '1',
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `theme_id` mediumint(8) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_styles`
--

LOCK TABLES `phpbb_styles` WRITE;
/*!40000 ALTER TABLE `phpbb_styles` DISABLE KEYS */;
INSERT INTO `phpbb_styles` VALUES (1,'prosilver','&copy; phpBB Group',1,1,1,1);
/*!40000 ALTER TABLE `phpbb_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles_imageset`
--

DROP TABLE IF EXISTS `phpbb_styles_imageset`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL auto_increment,
  `imageset_name` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `imageset_path` varchar(100) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_styles_imageset`
--

LOCK TABLES `phpbb_styles_imageset` WRITE;
/*!40000 ALTER TABLE `phpbb_styles_imageset` DISABLE KEYS */;
INSERT INTO `phpbb_styles_imageset` VALUES (1,'prosilver','&copy; phpBB Group','prosilver');
/*!40000 ALTER TABLE `phpbb_styles_imageset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles_imageset_data`
--

DROP TABLE IF EXISTS `phpbb_styles_imageset_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL auto_increment,
  `image_name` varchar(200) collate utf8_bin NOT NULL default '',
  `image_filename` varchar(200) collate utf8_bin NOT NULL default '',
  `image_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `image_height` smallint(4) unsigned NOT NULL default '0',
  `image_width` smallint(4) unsigned NOT NULL default '0',
  `imageset_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_styles_imageset_data`
--

LOCK TABLES `phpbb_styles_imageset_data` WRITE;
/*!40000 ALTER TABLE `phpbb_styles_imageset_data` DISABLE KEYS */;
INSERT INTO `phpbb_styles_imageset_data` VALUES (1,'site_logo','site_logo.gif','',52,139,1),(2,'forum_link','forum_link.gif','',27,27,1),(3,'forum_read','forum_read.gif','',27,27,1),(4,'forum_read_locked','forum_read_locked.gif','',27,27,1),(5,'forum_read_subforum','forum_read_subforum.gif','',27,27,1),(6,'forum_unread','forum_unread.gif','',27,27,1),(7,'forum_unread_locked','forum_unread_locked.gif','',27,27,1),(8,'forum_unread_subforum','forum_unread_subforum.gif','',27,27,1),(9,'topic_moved','topic_moved.gif','',27,27,1),(10,'topic_read','topic_read.gif','',27,27,1),(11,'topic_read_mine','topic_read_mine.gif','',27,27,1),(12,'topic_read_hot','topic_read_hot.gif','',27,27,1),(13,'topic_read_hot_mine','topic_read_hot_mine.gif','',27,27,1),(14,'topic_read_locked','topic_read_locked.gif','',27,27,1),(15,'topic_read_locked_mine','topic_read_locked_mine.gif','',27,27,1),(16,'topic_unread','topic_unread.gif','',27,27,1),(17,'topic_unread_mine','topic_unread_mine.gif','',27,27,1),(18,'topic_unread_hot','topic_unread_hot.gif','',27,27,1),(19,'topic_unread_hot_mine','topic_unread_hot_mine.gif','',27,27,1),(20,'topic_unread_locked','topic_unread_locked.gif','',27,27,1),(21,'topic_unread_locked_mine','topic_unread_locked_mine.gif','',27,27,1),(22,'sticky_read','sticky_read.gif','',27,27,1),(23,'sticky_read_mine','sticky_read_mine.gif','',27,27,1),(24,'sticky_read_locked','sticky_read_locked.gif','',27,27,1),(25,'sticky_read_locked_mine','sticky_read_locked_mine.gif','',27,27,1),(26,'sticky_unread','sticky_unread.gif','',27,27,1),(27,'sticky_unread_mine','sticky_unread_mine.gif','',27,27,1),(28,'sticky_unread_locked','sticky_unread_locked.gif','',27,27,1),(29,'sticky_unread_locked_mine','sticky_unread_locked_mine.gif','',27,27,1),(30,'announce_read','announce_read.gif','',27,27,1),(31,'announce_read_mine','announce_read_mine.gif','',27,27,1),(32,'announce_read_locked','announce_read_locked.gif','',27,27,1),(33,'announce_read_locked_mine','announce_read_locked_mine.gif','',27,27,1),(34,'announce_unread','announce_unread.gif','',27,27,1),(35,'announce_unread_mine','announce_unread_mine.gif','',27,27,1),(36,'announce_unread_locked','announce_unread_locked.gif','',27,27,1),(37,'announce_unread_locked_mine','announce_unread_locked_mine.gif','',27,27,1),(38,'global_read','announce_read.gif','',27,27,1),(39,'global_read_mine','announce_read_mine.gif','',27,27,1),(40,'global_read_locked','announce_read_locked.gif','',27,27,1),(41,'global_read_locked_mine','announce_read_locked_mine.gif','',27,27,1),(42,'global_unread','announce_unread.gif','',27,27,1),(43,'global_unread_mine','announce_unread_mine.gif','',27,27,1),(44,'global_unread_locked','announce_unread_locked.gif','',27,27,1),(45,'global_unread_locked_mine','announce_unread_locked_mine.gif','',27,27,1),(46,'pm_read','topic_read.gif','',27,27,1),(47,'pm_unread','topic_unread.gif','',27,27,1),(48,'icon_back_top','icon_back_top.gif','',11,11,1),(49,'icon_contact_aim','icon_contact_aim.gif','',20,20,1),(50,'icon_contact_email','icon_contact_email.gif','',20,20,1),(51,'icon_contact_icq','icon_contact_icq.gif','',20,20,1),(52,'icon_contact_jabber','icon_contact_jabber.gif','',20,20,1),(53,'icon_contact_msnm','icon_contact_msnm.gif','',20,20,1),(54,'icon_contact_www','icon_contact_www.gif','',20,20,1),(55,'icon_contact_yahoo','icon_contact_yahoo.gif','',20,20,1),(56,'icon_post_delete','icon_post_delete.gif','',20,20,1),(57,'icon_post_info','icon_post_info.gif','',20,20,1),(58,'icon_post_report','icon_post_report.gif','',20,20,1),(59,'icon_post_target','icon_post_target.gif','',9,11,1),(60,'icon_post_target_unread','icon_post_target_unread.gif','',9,11,1),(61,'icon_topic_attach','icon_topic_attach.gif','',10,7,1),(62,'icon_topic_latest','icon_topic_latest.gif','',9,11,1),(63,'icon_topic_newest','icon_topic_newest.gif','',9,11,1),(64,'icon_topic_reported','icon_topic_reported.gif','',14,16,1),(65,'icon_topic_unapproved','icon_topic_unapproved.gif','',14,16,1),(66,'icon_user_warn','icon_user_warn.gif','',20,20,1),(67,'subforum_read','subforum_read.gif','',9,11,1),(68,'subforum_unread','subforum_unread.gif','',9,11,1),(69,'icon_contact_pm','icon_contact_pm.gif','en',20,28,1),(70,'icon_post_edit','icon_post_edit.gif','en',20,42,1),(71,'icon_post_quote','icon_post_quote.gif','en',20,54,1),(72,'icon_user_online','icon_user_online.gif','en',58,58,1),(73,'button_pm_forward','button_pm_forward.gif','en',25,96,1),(74,'button_pm_new','button_pm_new.gif','en',25,84,1),(75,'button_pm_reply','button_pm_reply.gif','en',25,96,1),(76,'button_topic_locked','button_topic_locked.gif','en',25,88,1),(77,'button_topic_new','button_topic_new.gif','en',25,96,1),(78,'button_topic_reply','button_topic_reply.gif','en',25,96,1);
/*!40000 ALTER TABLE `phpbb_styles_imageset_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles_template`
--

DROP TABLE IF EXISTS `phpbb_styles_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(255) collate utf8_bin NOT NULL default '',
  `template_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `template_path` varchar(100) collate utf8_bin NOT NULL default '',
  `bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL default '0',
  `template_inherits_id` int(4) unsigned NOT NULL default '0',
  `template_inherit_path` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_styles_template`
--

LOCK TABLES `phpbb_styles_template` WRITE;
/*!40000 ALTER TABLE `phpbb_styles_template` DISABLE KEYS */;
INSERT INTO `phpbb_styles_template` VALUES (1,'prosilver','&copy; phpBB Group','prosilver','lNg=',0,0,'');
/*!40000 ALTER TABLE `phpbb_styles_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles_template_data`
--

DROP TABLE IF EXISTS `phpbb_styles_template_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL default '0',
  `template_filename` varchar(100) collate utf8_bin NOT NULL default '',
  `template_included` text collate utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL default '0',
  `template_data` mediumtext collate utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_styles_template_data`
--

LOCK TABLES `phpbb_styles_template_data` WRITE;
/*!40000 ALTER TABLE `phpbb_styles_template_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_styles_template_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_styles_theme`
--

DROP TABLE IF EXISTS `phpbb_styles_theme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL auto_increment,
  `theme_name` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_copyright` varchar(255) collate utf8_bin NOT NULL default '',
  `theme_path` varchar(100) collate utf8_bin NOT NULL default '',
  `theme_storedb` tinyint(1) unsigned NOT NULL default '0',
  `theme_mtime` int(11) unsigned NOT NULL default '0',
  `theme_data` mediumtext collate utf8_bin NOT NULL,
  PRIMARY KEY  (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_styles_theme`
--

LOCK TABLES `phpbb_styles_theme` WRITE;
/*!40000 ALTER TABLE `phpbb_styles_theme` DISABLE KEYS */;
INSERT INTO `phpbb_styles_theme` VALUES (1,'prosilver','&copy; phpBB Group','prosilver',1,1249472240,'/*  phpBB 3.0 Style Sheet\n    --------------------------------------------------------------\n	Style name:		proSilver\n	Based on style:	proSilver (this is the default phpBB 3 style)\n	Original author:	subBlue ( http://www.subBlue.com/ )\n	Modified by:		\n	\n	Copyright 2006 phpBB Group ( http://www.phpbb.com/ )\n    --------------------------------------------------------------\n*/\n\n/* General proSilver Markup Styles\n---------------------------------------- */\n\n* {\n	/* Reset browsers default margin, padding and font sizes */\n	margin: 0;\n	padding: 0;\n}\n\nhtml {\n	font-size: 100%;\n	/* Always show a scrollbar for short pages - stops the jump when the scrollbar appears. non-IE browsers */\n	height: 100%;\n	margin-bottom: 1px;\n}\n\nbody {\n	/* Text-Sizing with ems: http://www.clagnut.com/blog/348/ */\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	color: #828282;\n	background-color: #FFFFFF;\n	/*font-size: 62.5%;			 This sets the default font size to be equivalent to 10px */\n	font-size: 10px;\n	margin: 0;\n	padding: 12px 0;\n}\n\nh1 {\n	/* Forum name */\n	font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n	margin-right: 200px;\n	color: #FFFFFF;\n	margin-top: 15px;\n	font-weight: bold;\n	font-size: 2em;\n}\n\nh2 {\n	/* Forum header titles */\n	font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n	font-weight: normal;\n	color: #3f3f3f;\n	font-size: 2em;\n	margin: 0.8em 0 0.2em 0;\n}\n\nh2.solo {\n	margin-bottom: 1em;\n}\n\nh3 {\n	/* Sub-headers (also used as post headers, but defined later) */\n	font-family: Arial, Helvetica, sans-serif;\n	font-weight: bold;\n	text-transform: uppercase;\n	border-bottom: 1px solid #CCCCCC;\n	margin-bottom: 3px;\n	padding-bottom: 2px;\n	font-size: 1.05em;\n	color: #989898;\n	margin-top: 20px;\n}\n\nh4 {\n	/* Forum and topic list titles */\n	font-family: \"Trebuchet MS\", Verdana, Helvetica, Arial, Sans-serif;\n	font-size: 1.3em;\n}\n\np {\n	line-height: 1.3em;\n	font-size: 1.1em;\n	margin-bottom: 1.5em;\n}\n\nimg {\n	border-width: 0;\n}\n\nhr {\n	/* Also see tweaks.css */\n	border: 0 none #FFFFFF;\n	border-top: 1px solid #CCCCCC;\n	height: 1px;\n	margin: 5px 0;\n	display: block;\n	clear: both;\n}\n\nhr.dashed {\n	border-top: 1px dashed #CCCCCC;\n	margin: 10px 0;\n}\n\nhr.divider {\n	display: none;\n}\n\np.right {\n	text-align: right;\n}\n\n/* Main blocks\n---------------------------------------- */\n#wrap {\n	padding: 0 20px;\n	min-width: 650px;\n}\n\n#simple-wrap {\n	padding: 6px 10px;\n}\n\n#page-body {\n	margin: 4px 0;\n	clear: both;\n}\n\n#page-footer {\n	clear: both;\n}\n\n#page-footer h3 {\n	margin-top: 20px;\n}\n\n#logo {\n	float: left;\n	width: auto;\n	padding: 10px 13px 0 10px;\n}\n\na#logo:hover {\n	text-decoration: none;\n}\n\n/* Search box\n--------------------------------------------- */\n#search-box {\n	color: #FFFFFF;\n	position: relative;\n	margin-top: 30px;\n	margin-right: 5px;\n	display: block;\n	float: right;\n	text-align: right;\n	white-space: nowrap; /* For Opera */\n}\n\n#search-box #keywords {\n	width: 95px;\n	background-color: #FFF;\n}\n\n#search-box input {\n	border: 1px solid #b0b0b0;\n}\n\n/* .button1 style defined later, just a few tweaks for the search button version */\n#search-box input.button1 {\n	padding: 1px 5px;\n}\n\n#search-box li {\n	text-align: right;\n	margin-top: 4px;\n}\n\n#search-box img {\n	vertical-align: middle;\n	margin-right: 3px;\n}\n\n/* Site description and logo */\n#site-description {\n	float: left;\n	width: 70%;\n}\n\n#site-description h1 {\n	margin-right: 0;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background: #ebebeb none repeat-x 0 0;\n	color: #FFFFFF;\n	margin-bottom: 4px;\n	padding: 0 5px;\n}\n\n.navbar {\n	background-color: #ebebeb;\n	padding: 0 10px;\n}\n\n.forabg {\n	background: #b1b1b1 none repeat-x 0 0;\n	margin-bottom: 4px;\n	padding: 0 5px;\n	clear: both;\n}\n\n.forumbg {\n	background: #ebebeb none repeat-x 0 0;\n	margin-bottom: 4px;\n	padding: 0 5px;\n	clear: both;\n}\n\n.panel {\n	margin-bottom: 4px;\n	padding: 0 10px;\n	background-color: #f3f3f3;\n	color: #3f3f3f;\n}\n\n.post {\n	padding: 0 10px;\n	margin-bottom: 4px;\n	background-repeat: no-repeat;\n	background-position: 100% 0;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #f7f7f7;}\n.bg2	{ background-color: #f2f2f2; }\n.bg3	{ background-color: #ebebeb; }\n\n.rowbg {\n	margin: 5px 5px 2px 5px;\n}\n\n.ucprowbg {\n	background-color: #e2e2e2;\n}\n\n.fieldsbg {\n	/*border: 1px #DBDEE2 solid;*/\n	background-color: #eaeaea;\n}\n\nspan.corners-top, span.corners-bottom, span.corners-top span, span.corners-bottom span {\n	font-size: 1px;\n	line-height: 1px;\n	display: block;\n	height: 5px;\n	background-repeat: no-repeat;\n}\n\nspan.corners-top {\n	background-image: none;\n	background-position: 0 0;\n	margin: 0 -5px;\n}\n\nspan.corners-top span {\n	background-image: none;\n	background-position: 100% 0;\n}\n\nspan.corners-bottom {\n	background-image: none;\n	background-position: 0 100%;\n	margin: 0 -5px;\n	clear: both;\n}\n\nspan.corners-bottom span {\n	background-image: none;\n	background-position: 100% 100%;\n}\n\n.headbg span.corners-bottom {\n	margin-bottom: -1px;\n}\n\n.post span.corners-top, .post span.corners-bottom, .panel span.corners-top, .panel span.corners-bottom, .navbar span.corners-top, .navbar span.corners-bottom {\n	margin: 0 -10px;\n}\n\n.rules span.corners-top {\n	margin: 0 -10px 5px -10px;\n}\n\n.rules span.corners-bottom {\n	margin: 5px -10px 0 -10px;\n}\n\n/* Horizontal lists\n----------------------------------------*/\nul.linklist {\n	display: block;\n	margin: 0;\n}\n\nul.linklist li {\n	display: block;\n	list-style-type: none;\n	float: left;\n	width: auto;\n	margin-right: 5px;\n	font-size: 1.1em;\n	line-height: 2.2em;\n}\n\nul.linklist li.rightside, p.rightside {\n	float: right;\n	margin-right: 0;\n	margin-left: 5px;\n	text-align: right;\n}\n\nul.navlinks {\n	padding-bottom: 1px;\n	margin-bottom: 1px;\n	border-bottom: 1px solid #FFFFFF;\n	font-weight: bold;\n}\n\nul.leftside {\n	float: left;\n	margin-left: 0;\n	margin-right: 5px;\n	text-align: left;\n}\n\nul.rightside {\n	float: right;\n	margin-left: 5px;\n	margin-right: -5px;\n	text-align: right;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 {\n	/* See tweaks.css */\n}\n\n#ucp-main table.table1 {\n	padding: 2px;\n}\n\ntable.table1 thead th {\n	font-weight: normal;\n	text-transform: uppercase;\n	color: #FFFFFF;\n	line-height: 1.3em;\n	font-size: 1em;\n	padding: 0 0 4px 3px;\n}\n\ntable.table1 thead th span {\n	padding-left: 7px;\n}\n\ntable.table1 tbody tr {\n	border: 1px solid #cfcfcf;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #f6f6f6;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #6a6a6a;\n	font-size: 1.1em;\n}\n\ntable.table1 tbody td {\n	padding: 5px;\n	border-top: 1px solid #FAFAFA;\n}\n\ntable.table1 tbody th {\n	padding: 5px;\n	border-bottom: 1px solid #000000;\n	text-align: left;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\n/* Specific column styles */\ntable.table1 .name		{ text-align: left; }\ntable.table1 .posts		{ text-align: center !important; width: 7%; }\ntable.table1 .joined	{ text-align: left; width: 15%; }\ntable.table1 .active	{ text-align: left; width: 15%; }\ntable.table1 .mark		{ text-align: center; width: 7%; }\ntable.table1 .info		{ text-align: left; width: 30%; }\ntable.table1 .info div	{ width: 100%; white-space: normal; overflow: hidden; }\ntable.table1 .autocol	{ line-height: 2em; white-space: nowrap; }\ntable.table1 thead .autocol { padding-left: 1em; }\n\ntable.table1 span.rank-img {\n	float: right;\n	width: auto;\n}\n\ntable.info td {\n	padding: 3px;\n}\n\ntable.info tbody th {\n	padding: 3px;\n	text-align: right;\n	vertical-align: top;\n	color: #000000;\n	font-weight: normal;\n}\n\n.forumbg table.table1 {\n	margin: 0 -2px -1px -1px;\n}\n\n/* Misc layout styles\n---------------------------------------- */\n/* column[1-2] styles are containers for two column layouts \n   Also see tweaks.css */\n.column1 {\n	float: left;\n	clear: left;\n	width: 49%;\n}\n\n.column2 {\n	float: right;\n	clear: right;\n	width: 49%;\n}\n\n/* General classes for placing floating blocks */\n.left-box {\n	float: left;\n	width: auto;\n	text-align: left;\n}\n\n.right-box {\n	float: right;\n	width: auto;\n	text-align: right;\n}\n\ndl.details {\n	/*font-family: \"Lucida Grande\", Verdana, Helvetica, Arial, sans-serif;*/\n	font-size: 1.1em;\n}\n\ndl.details dt {\n	float: left;\n	clear: left;\n	width: 30%;\n	text-align: right;\n	color: #000000;\n	display: block;\n}\n\ndl.details dd {\n	margin-left: 0;\n	padding-left: 5px;\n	margin-bottom: 5px;\n	color: #828282;\n	float: left;\n	width: 65%;\n}\n\n/* Pagination\n---------------------------------------- */\n.pagination {\n	height: 1%; /* IE tweak (holly hack) */\n	width: auto;\n	text-align: right;\n	margin-top: 5px;\n	float: right;\n}\n\n.pagination span.page-sep {\n	display: none;\n}\n\nli.pagination {\n	margin-top: 0;\n}\n\n.pagination strong, .pagination b {\n	font-weight: normal;\n}\n\n.pagination span strong {\n	padding: 0 2px;\n	margin: 0 2px;\n	font-weight: normal;\n	color: #FFFFFF;\n	background-color: #bfbfbf;\n	border: 1px solid #bfbfbf;\n	font-size: 0.9em;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\n	font-weight: normal;\n	text-decoration: none;\n	color: #747474;\n	margin: 0 2px;\n	padding: 0 2px;\n	background-color: #eeeeee;\n	border: 1px solid #bababa;\n	font-size: 0.9em;\n	line-height: 1.5em;\n}\n\n.pagination span a:hover {\n	border-color: #d2d2d2;\n	background-color: #d2d2d2;\n	color: #FFF;\n	text-decoration: none;\n}\n\n.pagination img {\n	vertical-align: middle;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	display: block;\n	float: right;\n	width: auto;\n	margin-top: 0;\n	padding: 1px 0 1px 15px;\n	font-size: 0.9em;\n	background: none 0 50% no-repeat;\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #d2d2d2;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n#forum-permissions {\n	float: right;\n	width: auto;\n	padding-left: 5px;\n	margin-left: 5px;\n	margin-top: 10px;\n	text-align: right;\n}\n\n.copyright {\n	padding: 5px;\n	text-align: center;\n	color: #555555;\n}\n\n.small {\n	font-size: 0.9em !important;\n}\n\n.titlespace {\n	margin-bottom: 15px;\n}\n\n.headerspace {\n	margin-top: 20px;\n}\n\n.error {\n	color: #bcbcbc;\n	font-weight: bold;\n	font-size: 1em;\n}\n\n.reported {\n	background-color: #f7f7f7;\n}\n\nli.reported:hover {\n	background-color: #ececec;\n}\n\ndiv.rules {\n	background-color: #ececec;\n	color: #bcbcbc;\n	padding: 0 10px;\n	margin: 10px 0;\n	font-size: 1.1em;\n}\n\ndiv.rules ul, div.rules ol {\n	margin-left: 20px;\n}\n\np.rules {\n	background-color: #ececec;\n	background-image: none;\n	padding: 5px;\n}\n\np.rules img {\n	vertical-align: middle;\n}\n\np.rules a {\n	vertical-align: middle;\n	clear: both;\n}\n\n#top {\n	position: absolute;\n	top: -20px;\n}\n\n.clear {\n	display: block;\n	clear: both;\n	font-size: 1px;\n	line-height: 1px;\n	background: transparent;\n}\n/* proSilver Link Styles\n---------------------------------------- */\n\na:link	{ color: #898989; text-decoration: none; }\na:visited	{ color: #898989; text-decoration: none; }\na:hover	{ color: #d3d3d3; text-decoration: underline; }\na:active	{ color: #d2d2d2; text-decoration: none; }\n\n/* Coloured usernames */\n.username-coloured {\n	font-weight: bold;\n	display: inline !important;\n	padding: 0 !important;\n}\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n	text-decoration: none;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n	text-decoration: none;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #ffffff;\n	text-decoration: underline;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #ffffff;\n	text-decoration: none;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	font-family: \"Trebuchet MS\", Helvetica, Arial, Sans-serif;\n	font-size: 1.2em;\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n/* a.forumtitle:visited { color: #898989; } */\n\na.forumtitle:hover {\n	color: #bcbcbc;\n	text-decoration: underline;\n}\n\na.forumtitle:active {\n	color: #898989;\n}\n\na.topictitle {\n	font-family: \"Trebuchet MS\", Helvetica, Arial, Sans-serif;\n	font-size: 1.2em;\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n/* a.topictitle:visited { color: #d2d2d2; } */\n\na.topictitle:hover {\n	color: #bcbcbc;\n	text-decoration: underline;\n}\n\na.topictitle:active {\n	color: #898989;\n}\n\n/* Post body links */\n.postlink {\n	text-decoration: none;\n	color: #d2d2d2;\n	border-bottom: 1px solid #d2d2d2;\n	padding-bottom: 0;\n}\n\n.postlink:visited {\n	color: #bdbdbd;\n	border-bottom-style: dotted;\n	border-bottom-color: #666666;\n}\n\n.postlink:active {\n	color: #d2d2d2;\n}\n\n.postlink:hover {\n	background-color: #f6f6f6;\n	text-decoration: none;\n	color: #404040;\n}\n\n.signature a, .signature a:visited, .signature a:active, .signature a:hover {\n	border: none;\n	text-decoration: underline;\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:active, .postprofile a:visited, .postprofile dt.author a {\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	text-decoration: underline;\n	color: #d3d3d3;\n}\n\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #898989;\n	text-decoration: none; \n	font-weight: normal;\n}\n\n.search .postprofile a:hover {\n	color: #d3d3d3;\n	text-decoration: underline; \n}\n\n/* Back to top of page */\n.back2top {\n	clear: both;\n	height: 11px;\n	text-align: right;\n}\n\na.top {\n	background: none no-repeat top left;\n	text-decoration: none;\n	width: {IMG_ICON_BACK_TOP_WIDTH}px;\n	height: {IMG_ICON_BACK_TOP_HEIGHT}px;\n	display: block;\n	float: right;\n	overflow: hidden;\n	letter-spacing: 1000px;\n	text-indent: 11px;\n}\n\na.top2 {\n	background: none no-repeat 0 50%;\n	text-decoration: none;\n	padding-left: 15px;\n}\n\n/* Arrow links  */\na.up		{ background: none no-repeat left center; }\na.down		{ background: none no-repeat right center; }\na.left		{ background: none no-repeat 3px 60%; }\na.right		{ background: none no-repeat 95% 60%; }\n\na.up, a.up:link, a.up:active, a.up:visited {\n	padding-left: 10px;\n	text-decoration: none;\n	border-bottom-width: 0;\n}\n\na.up:hover {\n	background-position: left top;\n	background-color: transparent;\n}\n\na.down, a.down:link, a.down:active, a.down:visited {\n	padding-right: 10px;\n}\n\na.down:hover {\n	background-position: right bottom;\n	text-decoration: none;\n}\n\na.left, a.left:active, a.left:visited {\n	padding-left: 12px;\n}\n\na.left:hover {\n	color: #d2d2d2;\n	text-decoration: none;\n	background-position: 0 60%;\n}\n\na.right, a.right:active, a.right:visited {\n	padding-right: 12px;\n}\n\na.right:hover {\n	color: #d2d2d2;\n	text-decoration: none;\n	background-position: 100% 60%;\n}\n\n/* invisible skip link, used for accessibility  */\n.skiplink {\n	position: absolute;\n	left: -999px;\n	width: 990px;\n}\n/* proSilver Content Styles\n---------------------------------------- */\n\nul.topiclist {\n	display: block;\n	list-style-type: none;\n	margin: 0;\n}\n\nul.forums {\n	background: #f9f9f9 none repeat-x 0 0;\n}\n\nul.topiclist li {\n	display: block;\n	list-style-type: none;\n	color: #777777;\n	margin: 0;\n}\n\nul.topiclist dl {\n	position: relative;\n}\n\nul.topiclist li.row dl {\n	padding: 2px 0;\n}\n\nul.topiclist dt {\n	display: block;\n	float: left;\n	width: 50%;\n	font-size: 1.1em;\n	padding-left: 5px;\n	padding-right: 5px;\n}\n\nul.topiclist dd {\n	display: block;\n	float: left;\n	border-left: 1px solid #FFFFFF;\n	padding: 4px 0;\n}\n\nul.topiclist dfn {\n	/* Labels for post/view counts */\n	position: absolute;\n	left: -999px;\n	width: 990px;\n}\n\nul.topiclist li.row dt a.subforum {\n	background-image: none;\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	position: relative;\n	white-space: nowrap;\n	padding: 0 0 0 12px;\n}\n\n.forum-image {\n	float: left;\n	padding-top: 5px;\n	margin-right: 5px;\n}\n\nli.row {\n	border-top: 1px solid #FFFFFF;\n	border-bottom: 1px solid #8f8f8f;\n}\n\nli.row strong {\n	font-weight: normal;\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #f6f6f6;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\nli.header dt, li.header dd {\n	line-height: 1em;\n	border-left-width: 0;\n	margin: 2px 0 4px 0;\n	color: #FFFFFF;\n	padding-top: 2px;\n	padding-bottom: 2px;\n	font-size: 1em;\n	font-family: Arial, Helvetica, sans-serif;\n	text-transform: uppercase;\n}\n\nli.header dt {\n	font-weight: bold;\n}\n\nli.header dd {\n	margin-left: 1px;\n}\n\nli.header dl.icon {\n	min-height: 0;\n}\n\nli.header dl.icon dt {\n	/* Tweak for headers alignment when folder icon used */\n	padding-left: 0;\n	padding-right: 50px;\n}\n\n/* Forum list column styles */\ndl.icon {\n	min-height: 35px;\n	background-position: 10px 50%;		/* Position of folder icon */\n	background-repeat: no-repeat;\n}\n\ndl.icon dt {\n	padding-left: 45px;					/* Space for folder icon */\n	background-repeat: no-repeat;\n	background-position: 5px 95%;		/* Position of topic icon */\n}\n\ndd.posts, dd.topics, dd.views {\n	width: 8%;\n	text-align: center;\n	line-height: 2.2em;\n	font-size: 1.2em;\n}\n\ndd.lastpost {\n	width: 25%;\n	font-size: 1.1em;\n}\n\ndd.redirect {\n	font-size: 1.1em;\n	line-height: 2.5em;\n}\n\ndd.moderation {\n	font-size: 1.1em;\n}\n\ndd.lastpost span, ul.topiclist dd.searchby span, ul.topiclist dd.info span, ul.topiclist dd.time span, dd.redirect span, dd.moderation span {\n	display: block;\n	padding-left: 5px;\n}\n\ndd.time {\n	width: auto;\n	line-height: 200%;\n	font-size: 1.1em;\n}\n\ndd.extra {\n	width: 12%;\n	line-height: 200%;\n	text-align: center;\n	font-size: 1.1em;\n}\n\ndd.mark {\n	float: right !important;\n	width: 9%;\n	text-align: center;\n	line-height: 200%;\n	font-size: 1.2em;\n}\n\ndd.info {\n	width: 30%;\n}\n\ndd.option {\n	width: 15%;\n	line-height: 200%;\n	text-align: center;\n	font-size: 1.1em;\n}\n\ndd.searchby {\n	width: 47%;\n	font-size: 1.1em;\n	line-height: 1em;\n}\n\nul.topiclist dd.searchextra {\n	margin-left: 5px;\n	padding: 0.2em 0;\n	font-size: 1.1em;\n	color: #333333;\n	border-left: none;\n	clear: both;\n	width: 98%;\n	overflow: hidden;\n}\n\n/* Container for post/reply buttons and pagination */\n.topic-actions {\n	margin-bottom: 3px;\n	font-size: 1.1em;\n	height: 28px;\n	min-height: 28px;\n}\ndiv[class].topic-actions {\n	height: auto;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	padding: 0;\n	line-height: 1.48em;\n	color: #333333;\n	width: 76%;\n	float: left;\n	clear: both;\n}\n\n.postbody .ignore {\n	font-size: 1.1em;\n}\n\n.postbody h3.first {\n	/* The first post on the page uses this */\n	font-size: 1.7em;\n}\n\n.postbody h3 {\n	/* Postbody requires a different h3 format - so change it here */\n	font-size: 1.5em;\n	padding: 2px 0 0 0;\n	margin: 0 0 0.3em 0 !important;\n	text-transform: none;\n	border: none;\n	font-family: \"Trebuchet MS\", Verdana, Helvetica, Arial, sans-serif;\n	line-height: 125%;\n}\n\n.postbody h3 img {\n	/* Also see tweaks.css */\n	vertical-align: bottom;\n}\n\n.postbody .content {\n	font-size: 1.3em;\n}\n\n.search .postbody {\n	width: 68%\n}\n\n/* Topic review panel\n----------------------------------------*/\n#review {\n	margin-top: 2em;\n}\n\n#topicreview {\n	padding-right: 5px;\n	overflow: auto;\n	height: 300px;\n}\n\n#topicreview .postbody {\n	width: auto;\n	float: none;\n	margin: 0;\n	height: auto;\n}\n\n#topicreview .post {\n	height: auto;\n}\n\n#topicreview h2 {\n	border-bottom-width: 0;\n}\n\n.post-ignore .postbody {\n	display: none;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	min-height: 3em;\n	overflow: hidden;\n	line-height: 1.4em;\n	font-family: \"Lucida Grande\", \"Trebuchet MS\", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1em;\n	color: #333333;\n}\n\n.content h2, .panel h2 {\n	font-weight: normal;\n	color: #989898;\n	border-bottom: 1px solid #CCCCCC;\n	font-size: 1.6em;\n	margin-top: 0.5em;\n	margin-bottom: 0.5em;\n	padding-bottom: 0.5em;\n}\n\n.panel h3 {\n	margin: 0.5em 0;\n}\n\n.panel p {\n	font-size: 1.2em;\n	margin-bottom: 1em;\n	line-height: 1.4em;\n}\n\n.content p {\n	font-family: \"Lucida Grande\", \"Trebuchet MS\", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.2em;\n	margin-bottom: 1em;\n	line-height: 1.4em;\n}\n\ndl.faq {\n	font-family: \"Lucida Grande\", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n	margin-top: 1em;\n	margin-bottom: 2em;\n	line-height: 1.4em;\n}\n\ndl.faq dt {\n	font-weight: bold;\n	color: #333333;\n}\n\n.content dl.faq {\n	font-size: 1.2em;\n	margin-bottom: 0.5em;\n}\n\n.content li {\n	list-style-type: inherit;\n}\n\n.content ul, .content ol {\n	margin-bottom: 1em;\n	margin-left: 3em;\n}\n\n.posthilit {\n	background-color: #f3f3f3;\n	color: #BCBCBC;\n	padding: 0 2px 1px 2px;\n}\n\n.announce, .unreadpost {\n	/* Highlight the announcements & unread posts box */\n	border-left-color: #BCBCBC;\n	border-right-color: #BCBCBC;\n}\n\n/* Post author */\np.author {\n	margin: 0 15em 0.6em 0;\n	padding: 0 0 5px 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1em;\n	line-height: 1.2em;\n}\n\n/* Post signature */\n.signature {\n	margin-top: 1.5em;\n	padding-top: 0.2em;\n	font-size: 1.1em;\n	border-top: 1px solid #CCCCCC;\n	clear: left;\n	line-height: 140%;\n	overflow: hidden;\n	width: 100%;\n}\n\ndd .signature {\n	margin: 0;\n	padding: 0;\n	clear: none;\n	border: none;\n}\n\n.signature li {\n	list-style-type: inherit;\n}\n\n.signature ul, .signature ol {\n	margin-bottom: 1em;\n	margin-left: 3em;\n}\n\n/* Post noticies */\n.notice {\n	font-family: \"Lucida Grande\", Verdana, Helvetica, Arial, sans-serif;\n	width: auto;\n	margin-top: 1.5em;\n	padding-top: 0.2em;\n	font-size: 1em;\n	border-top: 1px dashed #CCCCCC;\n	clear: left;\n	line-height: 130%;\n}\n\n/* Jump to post link for now */\nul.searchresults {\n	list-style: none;\n	text-align: right;\n	clear: both;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background: #ebebeb none 6px 8px no-repeat;\n	border: 1px solid #dbdbdb;\n	font-size: 0.95em;\n	margin: 0.5em 1px 0 25px;\n	overflow: hidden;\n	padding: 5px;\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color: #bababa;\n	font-size: 1em;\n	margin: 0.5em 1px 0 15px;	\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #e4e4e4;\n}\n\nblockquote cite {\n	/* Username/source of quoter */\n	font-style: normal;\n	font-weight: bold;\n	margin-left: 20px;\n	display: block;\n	font-size: 0.9em;\n}\n\nblockquote cite cite {\n	font-size: 1em;\n}\n\nblockquote.uncited {\n	padding-top: 25px;\n}\n\n/* Code block */\ndl.codebox {\n	padding: 3px;\n	background-color: #FFFFFF;\n	border: 1px solid #d8d8d8;\n	font-size: 1em;\n}\n\ndl.codebox dt {\n	text-transform: uppercase;\n	border-bottom: 1px solid #CCCCCC;\n	margin-bottom: 3px;\n	font-size: 0.8em;\n	font-weight: bold;\n	display: block;\n}\n\nblockquote dl.codebox {\n	margin-left: 0;\n}\n\ndl.codebox code {\n	/* Also see tweaks.css */\n	overflow: auto;\n	display: block;\n	height: auto;\n	max-height: 200px;\n	white-space: normal;\n	padding-top: 5px;\n	font: 0.9em Monaco, \"Andale Mono\",\"Courier New\", Courier, mono;\n	line-height: 1.3em;\n	color: #8b8b8b;\n	margin: 2px 0;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #000000; }\n.syntaxdefault	{ color: #bcbcbc; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #585858; }\n.syntaxstring	{ color: #a7a7a7; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	float: left;\n	width: auto; \n	margin: 5px 5px 5px 0;\n	padding: 6px;\n	background-color: #FFFFFF;\n	border: 1px dashed #d8d8d8;\n	clear: left;\n}\n\n.pm-message .attachbox {\n	background-color: #f3f3f3;\n}\n\n.attachbox dt {\n	font-family: Arial, Helvetica, sans-serif;\n	text-transform: uppercase;\n}\n\n.attachbox dd {\n	margin-top: 4px;\n	padding-top: 4px;\n	clear: left;\n	border-top: 1px solid #d8d8d8;\n}\n\n.attachbox dd dd {\n	border: none;\n}\n\n.attachbox p {\n	line-height: 110%;\n	color: #666666;\n	font-weight: normal;\n	clear: left;\n}\n\n.attachbox p.stats\n{\n	line-height: 110%;\n	color: #666666;\n	font-weight: normal;\n	clear: left;\n}\n\n.attach-image {\n	margin: 3px 0;\n	width: 100%;\n	max-height: 350px;\n	overflow: auto;\n}\n\n.attach-image img {\n	border: 1px solid #999999;\n/*	cursor: move; */\n	cursor: default;\n}\n\n/* Inline image thumbnails */\ndiv.inline-attachment dl.thumbnail, div.inline-attachment dl.file {\n	display: block;\n	margin-bottom: 4px;\n}\n\ndiv.inline-attachment p {\n	font-size: 100%;\n}\n\ndl.file {\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n	display: block;\n}\n\ndl.file dt {\n	text-transform: none;\n	margin: 0;\n	padding: 0;\n	font-weight: bold;\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n}\n\ndl.file dd {\n	color: #666666;\n	margin: 0;\n	padding: 0;	\n}\n\ndl.thumbnail img {\n	padding: 3px;\n	border: 1px solid #666666;\n	background-color: #FFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n	font-style: italic;\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n}\n\n.attachbox dl.thumbnail dd {\n	font-size: 100%;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border: 1px solid #d2d2d2;\n}\n\n/* Post poll styles\n----------------------------------------*/\nfieldset.polls {\n	font-family: \"Trebuchet MS\", Verdana, Helvetica, Arial, sans-serif;\n}\n\nfieldset.polls dl {\n	margin-top: 5px;\n	border-top: 1px solid #e2e2e2;\n	padding: 5px 0 0 0;\n	line-height: 120%;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	font-weight: bold;\n	color: #000000;\n}\n\nfieldset.polls dt {\n	text-align: left;\n	float: left;\n	display: block;\n	width: 30%;\n	border-right: none;\n	padding: 0;\n	margin: 0;\n	font-size: 1.1em;\n}\n\nfieldset.polls dd {\n	float: left;\n	width: 10%;\n	border-left: none;\n	padding: 0 5px;\n	margin-left: 0;\n	font-size: 1.1em;\n}\n\nfieldset.polls dd.resultbar {\n	width: 50%;\n}\n\nfieldset.polls dd input {\n	margin: 2px 0;\n}\n\nfieldset.polls dd div {\n	text-align: right;\n	font-family: Arial, Helvetica, sans-serif;\n	color: #FFFFFF;\n	font-weight: bold;\n	padding: 0 2px;\n	overflow: visible;\n	min-width: 2%;\n}\n\n.pollbar1 {\n	background-color: #aaaaaa;\n	border-bottom: 1px solid #747474;\n	border-right: 1px solid #747474;\n}\n\n.pollbar2 {\n	background-color: #bebebe;\n	border-bottom: 1px solid #8c8c8c;\n	border-right: 1px solid #8c8c8c;\n}\n\n.pollbar3 {\n	background-color: #D1D1D1;\n	border-bottom: 1px solid #aaaaaa;\n	border-right: 1px solid #aaaaaa;\n}\n\n.pollbar4 {\n	background-color: #e4e4e4;\n	border-bottom: 1px solid #bebebe;\n	border-right: 1px solid #bebebe;\n}\n\n.pollbar5 {\n	background-color: #f8f8f8;\n	border-bottom: 1px solid #D1D1D1;\n	border-right: 1px solid #D1D1D1;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	/* Also see tweaks.css */\n	margin: 5px 0 10px 0;\n	min-height: 80px;\n	color: #666666;\n	border-left: 1px solid #FFFFFF;\n	width: 22%;\n	float: right;\n	display: inline;\n}\n.pm .postprofile {\n	border-left: 1px solid #DDDDDD;\n}\n\n.postprofile dd, .postprofile dt {\n	line-height: 1.2em;\n	margin-left: 8px;\n}\n\n.postprofile strong {\n	font-weight: normal;\n	color: #000000;\n}\n\n.avatar {\n	border: none;\n	margin-bottom: 3px;\n}\n\n.online {\n	background-image: none;\n	background-position: 100% 0;\n	background-repeat: no-repeat;\n}\n\n/* Poster profile used by search*/\n.search .postprofile {\n	width: 30%;\n}\n\n/* pm list in compose message if mass pm is enabled */\ndl.pmlist dt {\n	width: 60% !important;\n}\n\ndl.pmlist dt textarea {\n	width: 95%;\n}\n\ndl.pmlist dd {\n	margin-left: 61% !important;\n	margin-bottom: 2px;\n}\n/* proSilver Button Styles\n---------------------------------------- */\n\n/* Rollover buttons\n   Based on: http://wellstyled.com/css-nopreload-rollovers.html\n----------------------------------------*/\n.buttons {\n	float: left;\n	width: auto;\n	height: auto;\n}\n\n/* Rollover state */\n.buttons div {\n	float: left;\n	margin: 0 5px 0 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\n.buttons div a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n	position: relative;\n	overflow: hidden;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\n/*.buttons div span		{ display: none; }*/\n/*.buttons div a:hover	{ background-image: none; }*/\n.buttons div span			{ position: absolute; width: 100%; height: 100%; cursor: pointer;}\n.buttons div a:hover span	{ background-position: 0 100%; }\n\n/* Big button images */\n.reply-icon span	{ background: transparent none 0 0 no-repeat; }\n.post-icon span		{ background: transparent none 0 0 no-repeat; }\n.locked-icon span	{ background: transparent none 0 0 no-repeat; }\n.pmreply-icon span	{ background: none 0 0 no-repeat; }\n.newpm-icon span 	{ background: none 0 0 no-repeat; }\n.forwardpm-icon span 	{ background: none 0 0 no-repeat; }\n\n/* Set big button dimensions */\n.buttons div.reply-icon		{ width: {IMG_BUTTON_TOPIC_REPLY_WIDTH}px; height: {IMG_BUTTON_TOPIC_REPLY_HEIGHT}px; }\n.buttons div.post-icon		{ width: {IMG_BUTTON_TOPIC_NEW_WIDTH}px; height: {IMG_BUTTON_TOPIC_NEW_HEIGHT}px; }\n.buttons div.locked-icon	{ width: {IMG_BUTTON_TOPIC_LOCKED_WIDTH}px; height: {IMG_BUTTON_TOPIC_LOCKED_HEIGHT}px; }\n.buttons div.pmreply-icon	{ width: {IMG_BUTTON_PM_REPLY_WIDTH}px; height: {IMG_BUTTON_PM_REPLY_HEIGHT}px; }\n.buttons div.newpm-icon		{ width: {IMG_BUTTON_PM_NEW_WIDTH}px; height: {IMG_BUTTON_PM_NEW_HEIGHT}px; }\n.buttons div.forwardpm-icon	{ width: {IMG_BUTTON_PM_FORWARD_WIDTH}px; height: {IMG_BUTTON_PM_FORWARD_HEIGHT}px; }\n\n/* Sub-header (navigation bar)\n--------------------------------------------- */\na.print, a.sendemail, a.fontsize {\n	display: block;\n	overflow: hidden;\n	height: 18px;\n	text-indent: -5000px;\n	text-align: left;\n	background-repeat: no-repeat;\n}\n\na.print {\n	background-image: none;\n	width: 22px;\n}\n\na.sendemail {\n	background-image: none;\n	width: 22px;\n}\n\na.fontsize {\n	background-image: none;\n	background-position: 0 -1px;\n	width: 29px;\n}\n\na.fontsize:hover {\n	background-position: 0 -20px;\n	text-decoration: none;\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome, .icon-faq, .icon-members, .icon-home, .icon-ucp, .icon-register, .icon-logout,\n.icon-bookmark, .icon-bump, .icon-subscribe, .icon-unsubscribe, .icon-pages, .icon-search {\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	background-image: none;\n	padding: 1px 0 0 17px;\n}\n\n/* Poster profile icons\n----------------------------------------*/\nul.profile-icons {\n	padding-top: 10px;\n	list-style: none;\n}\n\n/* Rollover state */\nul.profile-icons li {\n	float: left;\n	margin: 0 6px 3px 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\nul.profile-icons li a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\nul.profile-icons li span { display:none; }\nul.profile-icons li a:hover { background: none; }\n\n/* Positioning of moderator icons */\n.postbody ul.profile-icons {\n	float: right;\n	width: auto;\n	padding: 0;\n}\n\n.postbody ul.profile-icons li {\n	margin: 0 3px;\n}\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background: none top left no-repeat; }\n.aim-icon, .aim-icon a			{ background: none top left no-repeat; }\n.yahoo-icon, .yahoo-icon a		{ background: none top left no-repeat; }\n.web-icon, .web-icon a			{ background: none top left no-repeat; }\n.msnm-icon, .msnm-icon a			{ background: none top left no-repeat; }\n.icq-icon, .icq-icon a			{ background: none top left no-repeat; }\n.jabber-icon, .jabber-icon a		{ background: none top left no-repeat; }\n.pm-icon, .pm-icon a				{ background: none top left no-repeat; }\n.quote-icon, .quote-icon a		{ background: none top left no-repeat; }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background: none top left no-repeat; }\n.warn-icon, .warn-icon a			{ background: none top left no-repeat; }\n.edit-icon, .edit-icon a			{ background: none top left no-repeat; }\n.delete-icon, .delete-icon a		{ background: none top left no-repeat; }\n.info-icon, .info-icon a			{ background: none top left no-repeat; }\n\n/* Set profile icon dimensions */\nul.profile-icons li.email-icon		{ width: {IMG_ICON_CONTACT_EMAIL_WIDTH}px; height: {IMG_ICON_CONTACT_EMAIL_HEIGHT}px; }\nul.profile-icons li.aim-icon	{ width: {IMG_ICON_CONTACT_AIM_WIDTH}px; height: {IMG_ICON_CONTACT_AIM_HEIGHT}px; }\nul.profile-icons li.yahoo-icon	{ width: {IMG_ICON_CONTACT_YAHOO_WIDTH}px; height: {IMG_ICON_CONTACT_YAHOO_HEIGHT}px; }\nul.profile-icons li.web-icon	{ width: {IMG_ICON_CONTACT_WWW_WIDTH}px; height: {IMG_ICON_CONTACT_WWW_HEIGHT}px; }\nul.profile-icons li.msnm-icon	{ width: {IMG_ICON_CONTACT_MSNM_WIDTH}px; height: {IMG_ICON_CONTACT_MSNM_HEIGHT}px; }\nul.profile-icons li.icq-icon	{ width: {IMG_ICON_CONTACT_ICQ_WIDTH}px; height: {IMG_ICON_CONTACT_ICQ_HEIGHT}px; }\nul.profile-icons li.jabber-icon	{ width: {IMG_ICON_CONTACT_JABBER_WIDTH}px; height: {IMG_ICON_CONTACT_JABBER_HEIGHT}px; }\nul.profile-icons li.pm-icon		{ width: {IMG_ICON_CONTACT_PM_WIDTH}px; height: {IMG_ICON_CONTACT_PM_HEIGHT}px; }\nul.profile-icons li.quote-icon	{ width: {IMG_ICON_POST_QUOTE_WIDTH}px; height: {IMG_ICON_POST_QUOTE_HEIGHT}px; }\nul.profile-icons li.report-icon	{ width: {IMG_ICON_POST_REPORT_WIDTH}px; height: {IMG_ICON_POST_REPORT_HEIGHT}px; }\nul.profile-icons li.edit-icon	{ width: {IMG_ICON_POST_EDIT_WIDTH}px; height: {IMG_ICON_POST_EDIT_HEIGHT}px; }\nul.profile-icons li.delete-icon	{ width: {IMG_ICON_POST_DELETE_WIDTH}px; height: {IMG_ICON_POST_DELETE_HEIGHT}px; }\nul.profile-icons li.info-icon	{ width: {IMG_ICON_POST_INFO_WIDTH}px; height: {IMG_ICON_POST_INFO_HEIGHT}px; }\nul.profile-icons li.warn-icon	{ width: {IMG_ICON_USER_WARN_WIDTH}px; height: {IMG_ICON_USER_WARN_HEIGHT}px; }\n\n/* Fix profile icon default margins */\nul.profile-icons li.edit-icon	{ margin: 0 0 0 3px; }\nul.profile-icons li.quote-icon	{ margin: 0 0 0 10px; }\nul.profile-icons li.info-icon, ul.profile-icons li.report-icon	{ margin: 0 3px 0 0; }\n/* proSilver Control Panel Styles\n---------------------------------------- */\n\n\n/* Main CP box\n----------------------------------------*/\n#cp-menu {\n	float:left;\n	width: 19%;\n	margin-top: 1em;\n	margin-bottom: 5px;\n}\n\n#cp-main {\n	float: left;\n	width: 81%;\n}\n\n#cp-main .content {\n	padding: 0;\n}\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #bfbfbf;\n}\n\n#cp-main .panel p {\n	font-size: 1.1em;\n}\n\n#cp-main .panel ol {\n	margin-left: 2em;\n	font-size: 1.1em;\n}\n\n#cp-main .panel li.row {\n	border-bottom: 1px solid #cbcbcb;\n	border-top: 1px solid #F9F9F9;\n}\n\nul.cplist {\n	margin-bottom: 5px;\n	border-top: 1px solid #cbcbcb;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #000000;\n	margin-bottom: 2px;\n}\n\n#cp-main table.table1 {\n	margin-bottom: 1em;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	font-weight: bold;\n	border-bottom: 1px solid #333333;\n	padding: 5px;\n}\n\n#cp-main table.table1 tbody th {\n	font-style: italic;\n	background-color: transparent !important;\n	border-bottom: none;\n}\n\n#cp-main .pagination {\n	float: right;\n	width: auto;\n	padding-top: 1px;\n}\n\n#cp-main .postbody p {\n	font-size: 1.1em;\n}\n\n#cp-main .pm-message {\n	border: 1px solid #e2e2e2;\n	margin: 10px 0;\n	background-color: #FFFFFF;\n	width: auto;\n	float: none;\n}\n\n.pm-message h2 {\n	padding-bottom: 5px;\n}\n\n#cp-main .postbody h3, #cp-main .box2 h3 {\n	margin-top: 0;\n}\n\n#cp-main .buttons {\n	margin-left: 0;\n}\n\n#cp-main ul.linklist {\n	margin: 0;\n}\n\n/* MCP Specific tweaks */\n.mcp-main .postbody {\n	width: 100%;\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs {\n	line-height: normal;\n	margin: 20px 0 -1px 7px;\n	min-width: 570px;\n}\n\n#tabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#tabs li {\n	display: inline;\n	margin: 0;\n	padding: 0;\n	font-size: 1em;\n	font-weight: bold;\n}\n\n#tabs a {\n	float: left;\n	background: none no-repeat 0% -35px;\n	margin: 0 1px 0 0;\n	padding: 0 0 0 5px;\n	text-decoration: none;\n	position: relative;\n	cursor: pointer;\n}\n\n#tabs a span {\n	float: left;\n	display: block;\n	background: none no-repeat 100% -35px;\n	padding: 6px 10px 6px 5px;\n	color: #828282;\n	white-space: nowrap;\n}\n\n#tabs a:hover span {\n	color: #bcbcbc;\n}\n\n#tabs .activetab a {\n	background-position: 0 0;\n	border-bottom: 1px solid #ebebeb;\n}\n\n#tabs .activetab a span {\n	background-position: 100% 0;\n	padding-bottom: 7px;\n	color: #333333;\n}\n\n#tabs a:hover {\n	background-position: 0 -70px;\n}\n\n#tabs a:hover span {\n	background-position:100% -70px;\n}\n\n#tabs .activetab a:hover {\n	background-position: 0 0;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n	background-position: 100% 0;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs {\n	line-height: normal;\n	margin: -20px 7px 0 0;\n}\n\n#minitabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#minitabs li {\n	display: block;\n	float: right;\n	padding: 0 10px 4px 10px;\n	font-size: 1em;\n	font-weight: bold;\n	background-color: #f2f2f2;\n	margin-left: 2px;\n}\n\n#minitabs a {\n}\n\n#minitabs a:hover {\n	text-decoration: none;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n/* Container for sub-navigation list */\n#navigation {\n	width: 100%;\n	padding-top: 36px;\n}\n\n#navigation ul {\n	list-style:none;\n}\n\n/* Default list state */\n#navigation li {\n	margin: 1px 0;\n	padding: 0;\n	font-weight: bold;\n	display: inline;\n}\n\n/* Link styles for the sub-section links */\n#navigation a {\n	display: block;\n	padding: 5px;\n	margin: 1px 0;\n	text-decoration: none;\n	font-weight: bold;\n	color: #333;\n	background: #cfcfcf none repeat-y 100% 0;\n}\n\n#navigation a:hover {\n	text-decoration: none;\n	background-color: #c6c6c6;\n	color: #bcbcbc;\n	background-image: none;\n}\n\n#navigation #active-subsection a {\n	display: block;\n	color: #d3d3d3;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #d3d3d3;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	border-bottom: none;\n	padding: 0;\n	margin-left: 10px;\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: none;\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: none;\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: none;\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #f9f9f9;\n	padding: 0 5px;\n	margin: 10px 15px 10px 5px;\n}\n\n.cp-mini span.corners-top, .cp-mini span.corners-bottom {\n	margin: 0 -5px;\n}\n\ndl.mini dt {\n	font-weight: bold;\n	color: #676767;\n}\n\ndl.mini dd {\n	padding-top: 4px;\n}\n\n.friend-online {\n	font-weight: bold;\n}\n\n.friend-offline {\n	font-style: italic;\n}\n\n/* PM Styles\n----------------------------------------*/\n#pm-menu {\n	line-height: 2.5em;\n}\n\n/* PM Message history */\n.current {\n	color: #999999;\n}\n\n/* Defined rules list for PM options */\nol.def-rules {\n	padding-left: 0;\n}\n\nol.def-rules li {\n	line-height: 180%;\n	padding: 1px;\n}\n\n/* PM marking colours */\n.pmlist li.bg1 {\n	border: solid 3px transparent;\n	border-width: 0 3px;\n}\n\n.pmlist li.bg2 {\n	border: solid 3px transparent;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #bcbcbc;\n	border-right-color: #bcbcbc;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	border: solid 3px #ffffff;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	border: solid 3px #c2c2c2;\n	border-width: 0 3px;	\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	border: solid 3px #bdbdbd;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	border: solid 3px #000000;\n	border-width: 0 3px;\n}\n\n.pm-legend {\n	border-left-width: 10px;\n	border-left-style: solid;\n	border-right-width: 0;\n	margin-bottom: 3px;\n	padding-left: 3px;\n}\n\n/* Avatar gallery */\n#gallery label {\n	position: relative;\n	float: left;\n	margin: 10px;\n	padding: 5px;\n	width: auto;\n	background: #FFFFFF;\n	border: 1px solid #CCC;\n	text-align: center;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n/* proSilver Form Styles\n---------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nfieldset {\n	border-width: 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n}\n\ninput {\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	padding: 0 3px;\n	font-size: 1em;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n}\n\nselect {\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	border: 1px solid #666666;\n	padding: 1px;\n	background-color: #FAFAFA;\n}\n\noption {\n	padding-right: 1em;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\ntextarea {\n	font-family: \"Lucida Grande\", Verdana, Helvetica, Arial, sans-serif;\n	width: 60%;\n	padding: 2px;\n	font-size: 1em;\n	line-height: 1.4em;\n}\n\nlabel {\n	cursor: default;\n	padding-right: 5px;\n	color: #676767;\n}\n\nlabel input {\n	vertical-align: middle;\n}\n\nlabel img {\n	vertical-align: middle;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\nfieldset dl {\n	padding: 4px 0;\n}\n\nfieldset dt {\n	float: left;	\n	width: 40%;\n	text-align: left;\n	display: block;\n}\n\nfieldset dd {\n	margin-left: 41%;\n	vertical-align: top;\n	margin-bottom: 3px;\n}\n\n/* Specific layout 1 */\nfieldset.fields1 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields1 dd {\n	margin-left: 15em;\n	border-left-width: 0;\n}\n\nfieldset.fields1 {\n	background-color: transparent;\n}\n\nfieldset.fields1 div {\n	margin-bottom: 3px;\n}\n\n/* Specific layout 2 */\nfieldset.fields2 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields2 dd {\n	margin-left: 16em;\n	border-left-width: 0;\n}\n\n/* Form elements */\ndt label {\n	font-weight: bold;\n	text-align: left;\n}\n\ndd label {\n	white-space: nowrap;\n	color: #333;\n}\n\ndd input, dd textarea {\n	margin-right: 3px;\n}\n\ndd select {\n	width: auto;\n}\n\ndd textarea {\n	width: 85%;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n#timezone {\n	width: 95%;\n}\n\n* html #timezone {\n	width: 50%;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login {\n	margin-top: 5px;\n}\n\nfieldset.quick-login input {\n	width: auto;\n}\n\nfieldset.quick-login input.inputbox {\n	width: 15%;\n	vertical-align: middle;\n	margin-right: 5px;\n	background-color: #f3f3f3;\n}\n\nfieldset.quick-login label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\n/* Display options on viewtopic/viewforum pages  */\nfieldset.display-options {\n	text-align: center;\n	margin: 3px 0 5px 0;\n}\n\nfieldset.display-options label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.display-options a {\n	margin-top: 3px;\n}\n\n/* Display actions for ucp and mcp pages */\nfieldset.display-actions {\n	text-align: right;\n	line-height: 2em;\n	white-space: nowrap;\n	padding-right: 1em;\n}\n\nfieldset.display-actions label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.sort-options {\n	line-height: 2em;\n}\n\n/* MCP forum selection*/\nfieldset.forum-selection {\n	margin: 5px 0 3px 0;\n	float: right;\n}\n\nfieldset.forum-selection2 {\n	margin: 13px 0 3px 0;\n	float: right;\n}\n\n/* Jumpbox */\nfieldset.jumpbox {\n	text-align: right;\n	margin-top: 15px;\n	height: 2.5em;\n}\n\nfieldset.quickmod {\n	width: 50%;\n	float: right;\n	text-align: right;\n	height: 2.5em;\n}\n\n/* Submit button fieldset */\nfieldset.submit-buttons {\n	text-align: center;\n	vertical-align: middle;\n	margin: 5px 0;\n}\n\nfieldset.submit-buttons input {\n	vertical-align: middle;\n	padding-top: 3px;\n	padding-bottom: 3px;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n/* Buttons used in the editor */\n#format-buttons {\n	margin: 15px 0 2px 0;\n}\n\n#format-buttons input, #format-buttons select {\n	vertical-align: middle;\n}\n\n/* Main message box */\n#message-box {\n	width: 80%;\n}\n\n#message-box textarea {\n	font-family: \"Trebuchet MS\", Verdana, Helvetica, Arial, sans-serif;\n	width: 100%;\n	font-size: 1.2em;\n	color: #333333;\n}\n\n/* Emoticons panel */\n#smiley-box {\n	width: 18%;\n	float: right;\n}\n\n#smiley-box img {\n	margin: 3px;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF;\n	border: 1px solid #c0c0c0;\n	color: #333333;\n	padding: 2px;\n	cursor: text;\n}\n\n.inputbox:hover {\n	border: 1px solid #eaeaea;\n}\n\n.inputbox:focus {\n	border: 1px solid #eaeaea;\n	color: #4b4b4b;\n}\n\ninput.inputbox	{ width: 85%; }\ninput.medium	{ width: 50%; }\ninput.narrow	{ width: 25%; }\ninput.tiny		{ width: 125px; }\n\ntextarea.inputbox {\n	width: 85%;\n}\n\n.autowidth {\n	width: auto !important;\n}\n\n/* Form button styles\n---------------------------------------- */\ninput.button1, input.button2 {\n	font-size: 1em;\n}\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	width: auto !important;\n	padding-top: 1px;\n	padding-bottom: 1px;\n	font-family: \"Lucida Grande\", Verdana, Helvetica, Arial, sans-serif;\n	color: #000;\n	background: #FAFAFA none repeat-x top;\n}\n\na.button1, input.button1 {\n	font-weight: bold;\n	border: 1px solid #666666;\n}\n\ninput.button3 {\n	padding: 0;\n	margin: 0;\n	line-height: 5px;\n	height: 12px;\n	background-image: none;\n	font-variant: small-caps;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border: 1px solid #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	text-decoration: none;\n	color: #000000;\n	padding: 2px 8px;\n	line-height: 250%;\n	vertical-align: text-bottom;\n	background-position: 0 1px;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border: 1px solid #BCBCBC;\n	background-position: 0 100%;\n	color: #BCBCBC;\n}\n\ninput.disabled {\n	font-weight: normal;\n	color: #666666;\n}\n\n/* Topic and forum Search */\n.search-box {\n	margin-top: 3px;\n	margin-left: 5px;\n	float: left;\n}\n\n.search-box input {\n}\n\ninput.search {\n	background-image: none;\n	background-repeat: no-repeat;\n	background-position: left 1px;\n	padding-left: 17px;\n}\n\n.full { width: 95%; }\n.medium { width: 50%;}\n.narrow { width: 25%;}\n.tiny { width: 10%;}\n/* proSilver Style Sheet Tweaks\n\nThese style definitions are mainly IE specific \ntweaks required due to its poor CSS support.\n-------------------------------------------------*/\n\n* html table, * html select, * html input { font-size: 100%; }\n* html hr { margin: 0; }\n* html span.corners-top, * html span.corners-bottom { background-image: url(\"{T_THEME_PATH}/images/corners_left.gif\"); }\n* html span.corners-top span, * html span.corners-bottom span { background-image: url(\"{T_THEME_PATH}/images/corners_right.gif\"); }\n\ntable.table1 {\n	width: 99%;		/* IE < 6 browsers */\n	/* Tantek hack */\n	voice-family: \"\\\"}\\\"\";\n	voice-family: inherit;\n	width: 100%;\n}\nhtml>body table.table1 { width: 100%; }	/* Reset 100% for opera */\n\n* html ul.topiclist li { position: relative; }\n* html .postbody h3 img { vertical-align: middle; }\n\n/* Form styles */\nhtml>body dd label input { vertical-align: text-bottom; }	/* Align checkboxes/radio buttons nicely */\n\n* html input.button1, * html input.button2 {\n	padding-bottom: 0;\n	margin-bottom: 1px;\n}\n\n/* Misc layout styles */\n* html .column1, * html .column2 { width: 45%; }\n\n/* Nice method for clearing floated blocks without having to insert any extra markup (like spacer above)\n   From http://www.positioniseverything.net/easyclearing.html \n#tabs:after, #minitabs:after, .post:after, .navbar:after, fieldset dl:after, ul.topiclist dl:after, ul.linklist:after, dl.polls:after {\n	content: \".\"; \n	display: block; \n	height: 0; \n	clear: both; \n	visibility: hidden;\n}*/\n\n.clearfix, #tabs, #minitabs, fieldset dl, ul.topiclist dl, dl.polls {\n	height: 1%;\n	overflow: hidden;\n}\n\n/* viewtopic fix */\n* html .post {\n	height: 25%;\n	overflow: hidden;\n}\n\n/* navbar fix */\n* html .clearfix, * html .navbar, ul.linklist {\n	height: 4%;\n	overflow: hidden;\n}\n\n/* Simple fix so forum and topic lists always have a min-height set, even in IE6\n	From http://www.dustindiaz.com/min-height-fast-hack */\ndl.icon {\n	min-height: 35px;\n	height: auto !important;\n	height: 35px;\n}\n\n* html #search-box {\n	width: 25%;\n}\n\n/* Correctly clear floating for details on profile view */\n*:first-child+html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n* html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n* html .forumbg table.table1 {\n	margin: 0 -2px 0px -1px;\n}\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for common.css\n-------------------------------------------------------------- */\n\nhtml, body {\n	color: #536482;\n	background-color: #FFFFFF;\n}\n\nh1 {\n	color: #FFFFFF;\n}\n\nh2 {\n	color: #28313F;\n}\n\nh3 {\n	border-bottom-color: #CCCCCC;\n	color: #115098;\n}\n\nhr {\n	border-color: #FFFFFF;\n	border-top-color: #CCCCCC;\n}\n\nhr.dashed {\n	border-top-color: #CCCCCC;\n}\n\n/* Search box\n--------------------------------------------- */\n\n#search-box {\n	color: #FFFFFF;\n}\n\n#search-box #keywords {\n	background-color: #FFF;\n}\n\n#search-box input {\n	border-color: #0075B0;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background-color: #12A3EB;\n	background-image: url(\"{T_THEME_PATH}/images/bg_header.gif\");\n	color: #FFFFFF;\n}\n\n.navbar {\n	background-color: #cadceb;\n}\n\n.forabg {\n	background-color: #0076b1;\n	background-image: url(\"{T_THEME_PATH}/images/bg_list.gif\");\n}\n\n.forumbg {\n	background-color: #12A3EB;\n	background-image: url(\"{T_THEME_PATH}/images/bg_header.gif\");\n}\n\n.panel {\n	background-color: #ECF1F3;\n	color: #28313F;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #ECF3F7; }\n.bg2	{ background-color: #e1ebf2;  }\n.bg3	{ background-color: #cadceb; }\n\n.ucprowbg {\n	background-color: #DCDEE2;\n}\n\n.fieldsbg {\n	background-color: #E7E8EA;\n}\n\nspan.corners-top {\n	background-image: url(\"{T_THEME_PATH}/images/corners_left.png\");\n}\n\nspan.corners-top span {\n	background-image: url(\"{T_THEME_PATH}/images/corners_right.png\");\n}\n\nspan.corners-bottom {\n	background-image: url(\"{T_THEME_PATH}/images/corners_left.png\");\n}\n\nspan.corners-bottom span {\n	background-image: url(\"{T_THEME_PATH}/images/corners_right.png\");\n}\n\n/* Horizontal lists\n----------------------------------------*/\n\nul.navlinks {\n	border-bottom-color: #FFFFFF;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 thead th {\n	color: #FFFFFF;\n}\n\ntable.table1 tbody tr {\n	border-color: #BFC1CF;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #CFE1F6;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #536482;\n}\n\ntable.table1 tbody td {\n	border-top-color: #FAFAFA;\n}\n\ntable.table1 tbody th {\n	border-bottom-color: #000000;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\ntable.info tbody th {\n	color: #000000;\n}\n\n/* Misc layout styles\n---------------------------------------- */\ndl.details dt {\n	color: #000000;\n}\n\ndl.details dd {\n	color: #536482;\n}\n\n.sep {\n	color: #1198D9;\n}\n\n/* Pagination\n---------------------------------------- */\n\n.pagination span strong {\n	color: #FFFFFF;\n	background-color: #4692BF;\n	border-color: #4692BF;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\n	color: #5C758C;\n	background-color: #ECEDEE;\n	border-color: #B4BAC0;\n}\n\n.pagination span a:hover {\n	border-color: #368AD2;\n	background-color: #368AD2;\n	color: #FFF;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	background-image: url(\"{T_THEME_PATH}/images/icon_pages.gif\");\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #368AD2;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n\n.copyright {\n	color: #555555;\n}\n\n.error {\n	color: #BC2A4D;\n}\n\n.reported {\n	background-color: #F7ECEF;\n}\n\nli.reported:hover {\n	background-color: #ECD5D8 !important;\n}\n.sticky, .announce {\n	/* you can add a background for stickies and announcements*/\n}\n\ndiv.rules {\n	background-color: #ECD5D8;\n	color: #BC2A4D;\n}\n\np.rules {\n	background-color: #ECD5D8;\n	background-image: none;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for links.css\n-------------------------------------------------------------- */\n\na:link	{ color: #105289; }\na:visited	{ color: #105289; }\na:hover	{ color: #D31141; }\na:active	{ color: #368AD2; }\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #A8D8FF;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #C8E6FF;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	color: #105289;\n}\n\n/* a.forumtitle:visited { color: #105289; } */\n\na.forumtitle:hover {\n	color: #BC2A4D;\n}\n\na.forumtitle:active {\n	color: #105289;\n}\n\na.topictitle {\n	color: #105289;\n}\n\n/* a.topictitle:visited { color: #368AD2; } */\n\na.topictitle:hover {\n	color: #BC2A4D;\n}\n\na.topictitle:active {\n	color: #105289;\n}\n\n/* Post body links */\n.postlink {\n	color: #368AD2;\n	border-bottom-color: #368AD2;\n}\n\n.postlink:visited {\n	color: #5D8FBD;\n	border-bottom-color: #666666;\n}\n\n.postlink:active {\n	color: #368AD2;\n}\n\n.postlink:hover {\n	background-color: #D0E4F6;\n	color: #0D4473;\n}\n\n.signature a, .signature a:visited, .signature a:active, .signature a:hover {\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:active, .postprofile a:visited, .postprofile dt.author a {\n	color: #105289;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	color: #D31141;\n}\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #105289;\n}\n\n.search .postprofile a:hover {\n	color: #D31141;\n}\n\n/* Back to top of page */\na.top {\n	background-image: url(\"{IMG_ICON_BACK_TOP_SRC}\");\n}\n\na.top2 {\n	background-image: url(\"{IMG_ICON_BACK_TOP_SRC}\");\n}\n\n/* Arrow links  */\na.up		{ background-image: url(\"{T_THEME_PATH}/images/arrow_up.gif\") }\na.down		{ background-image: url(\"{T_THEME_PATH}/images/arrow_down.gif\") }\na.left		{ background-image: url(\"{T_THEME_PATH}/images/arrow_left.gif\") }\na.right		{ background-image: url(\"{T_THEME_PATH}/images/arrow_right.gif\") }\n\na.up:hover {\n	background-color: transparent;\n}\n\na.left:hover {\n	color: #368AD2;\n}\n\na.right:hover {\n	color: #368AD2;\n}\n\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for content.css\n-------------------------------------------------------------- */\n\nul.forums {\n	background-color: #eef5f9;\n	background-image: url(\"{T_THEME_PATH}/images/gradient.gif\");\n}\n\nul.topiclist li {\n	color: #4C5D77;\n}\n\nul.topiclist dd {\n	border-left-color: #FFFFFF;\n}\n\n.rtl ul.topiclist dd {\n	border-right-color: #fff;\n	border-left-color: transparent;\n}\n\nul.topiclist li.row dt a.subforum.read {\n	background-image: url(\"{IMG_SUBFORUM_READ_SRC}\");\n}\n\nul.topiclist li.row dt a.subforum.unread {\n	background-image: url(\"{IMG_SUBFORUM_UNREAD_SRC}\");\n}\n\nli.row {\n	border-top-color:  #FFFFFF;\n	border-bottom-color: #00608F;\n}\n\nli.row strong {\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #F6F4D0;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\n.rtl li.row:hover dd {\n	border-right-color: #CCCCCC;\n	border-left-color: transparent;\n}\n\nli.header dt, li.header dd {\n	color: #FFFFFF;\n}\n\n/* Forum list column styles */\nul.topiclist dd.searchextra {\n	color: #333333;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	color: #333333;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	color: #333333;\n}\n\n.content h2, .panel h2 {\n	color: #115098;\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.faq dt {\n	color: #333333;\n}\n\n.posthilit {\n	background-color: #F3BFCC;\n	color: #BC2A4D;\n}\n\n/* Post signature */\n.signature {\n	border-top-color: #CCCCCC;\n}\n\n/* Post noticies */\n.notice {\n	border-top-color:  #CCCCCC;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background-color: #EBEADD;\n	background-image: url(\"{T_THEME_PATH}/images/quote.gif\");\n	border-color:#DBDBCE;\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color:#EFEED9;\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #EBEADD;\n}\n\n/* Code block */\ndl.codebox {\n	background-color: #FFFFFF;\n	border-color: #C9D2D8;\n}\n\ndl.codebox dt {\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.codebox code {\n	color: #2E8B57;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #FF8000; }\n.syntaxdefault	{ color: #0000BB; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #007700; }\n.syntaxstring	{ color: #DD0000; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	background-color: #FFFFFF;\n	border-color:  #C9D2D8;\n}\n\n.pm-message .attachbox {\n	background-color: #F2F3F3;\n}\n\n.attachbox dd {\n	border-top-color: #C9D2D8;\n}\n\n.attachbox p {\n	color: #666666;\n}\n\n.attachbox p.stats {\n	color: #666666;\n}\n\n.attach-image img {\n	border-color: #999999;\n}\n\n/* Inline image thumbnails */\n\ndl.file dd {\n	color: #666666;\n}\n\ndl.thumbnail img {\n	border-color: #666666;\n	background-color: #FFFFFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border-color: #368AD2;\n}\n\n/* Post poll styles\n----------------------------------------*/\n\nfieldset.polls dl {\n	border-top-color: #DCDEE2;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	color: #000000;\n}\n\nfieldset.polls dd div {\n	color: #FFFFFF;\n}\n\n.rtl .pollbar1, .rtl .pollbar2, .rtl .pollbar3, .rtl .pollbar4, .rtl .pollbar5 {\n	border-right-color: transparent;\n}\n\n.pollbar1 {\n	background-color: #AA2346;\n	border-bottom-color: #74162C;\n	border-right-color: #74162C;\n}\n\n.rtl .pollbar1 {\n	border-left-color: #74162C;\n}\n\n.pollbar2 {\n	background-color: #BE1E4A;\n	border-bottom-color: #8C1C38;\n	border-right-color: #8C1C38;\n}\n\n.rtl .pollbar2 {\n	border-left-color: #8C1C38;\n}\n\n.pollbar3 {\n	background-color: #D11A4E;\n	border-bottom-color: #AA2346;\n	border-right-color: #AA2346;\n}\n\n.rtl .pollbar3 {\n	border-left-color: #AA2346;\n}\n\n.pollbar4 {\n	background-color: #E41653;\n	border-bottom-color: #BE1E4A;\n	border-right-color: #BE1E4A;\n}\n\n.rtl .pollbar4 {\n	border-left-color: #BE1E4A;\n}\n\n.pollbar5 {\n	background-color: #F81157;\n	border-bottom-color: #D11A4E;\n	border-right-color: #D11A4E;\n}\n\n.rtl .pollbar5 {\n	border-left-color: #D11A4E;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	color: #666666;\n	border-left-color: #FFFFFF;\n}\n\n.rtl .postprofile {\n	border-right-color: #FFFFFF;\n	border-left-color: transparent;\n}\n\n.pm .postprofile {\n	border-left-color: #DDDDDD;\n}\n\n.rtl .pm .postprofile {\n	border-right-color: #DDDDDD;\n	border-left-color: transparent;\n}\n\n.postprofile strong {\n	color: #000000;\n}\n\n.online {\n	background-image: url(\"{T_IMAGESET_LANG_PATH}/icon_user_online.gif\");\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for buttons.css\n-------------------------------------------------------------- */\n\n/* Big button images */\n.reply-icon span	{ background-image: url(\"{IMG_BUTTON_TOPIC_REPLY_SRC}\"); }\n.post-icon span		{ background-image: url(\"{IMG_BUTTON_TOPIC_NEW_SRC}\"); }\n.locked-icon span	{ background-image: url(\"{IMG_BUTTON_TOPIC_LOCKED_SRC}\"); }\n.pmreply-icon span	{ background-image: url(\"{IMG_BUTTON_PM_REPLY_SRC}\") ;}\n.newpm-icon span 	{ background-image: url(\"{IMG_BUTTON_PM_NEW_SRC}\") ;}\n.forwardpm-icon span	{ background-image: url(\"{IMG_BUTTON_PM_FORWARD_SRC}\") ;}\n\na.print {\n	background-image: url(\"{T_THEME_PATH}/images/icon_print.gif\");\n}\n\na.sendemail {\n	background-image: url(\"{T_THEME_PATH}/images/icon_sendemail.gif\");\n}\n\na.fontsize {\n	background-image: url(\"{T_THEME_PATH}/images/icon_fontsize.gif\");\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome						{ background-image: url(\"{T_THEME_PATH}/images/icon_home.gif\"); }\n.icon-faq						{ background-image: url(\"{T_THEME_PATH}/images/icon_faq.gif\"); }\n.icon-members					{ background-image: url(\"{T_THEME_PATH}/images/icon_members.gif\"); }\n.icon-home						{ background-image: url(\"{T_THEME_PATH}/images/icon_home.gif\"); }\n.icon-ucp						{ background-image: url(\"{T_THEME_PATH}/images/icon_ucp.gif\"); }\n.icon-register					{ background-image: url(\"{T_THEME_PATH}/images/icon_register.gif\"); }\n.icon-logout					{ background-image: url(\"{T_THEME_PATH}/images/icon_logout.gif\"); }\n.icon-bookmark					{ background-image: url(\"{T_THEME_PATH}/images/icon_bookmark.gif\"); }\n.icon-bump						{ background-image: url(\"{T_THEME_PATH}/images/icon_bump.gif\"); }\n.icon-subscribe					{ background-image: url(\"{T_THEME_PATH}/images/icon_subscribe.gif\"); }\n.icon-unsubscribe				{ background-image: url(\"{T_THEME_PATH}/images/icon_unsubscribe.gif\"); }\n.icon-pages						{ background-image: url(\"{T_THEME_PATH}/images/icon_pages.gif\"); }\n.icon-search					{ background-image: url(\"{T_THEME_PATH}/images/icon_search.gif\"); }\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background-image: url(\"{IMG_ICON_CONTACT_EMAIL_SRC}\"); }\n.aim-icon, .aim-icon a			{ background-image: url(\"{IMG_ICON_CONTACT_AIM_SRC}\"); }\n.yahoo-icon, .yahoo-icon a		{ background-image: url(\"{IMG_ICON_CONTACT_YAHOO_SRC}\"); }\n.web-icon, .web-icon a			{ background-image: url(\"{IMG_ICON_CONTACT_WWW_SRC}\"); }\n.msnm-icon, .msnm-icon a			{ background-image: url(\"{IMG_ICON_CONTACT_MSNM_SRC}\"); }\n.icq-icon, .icq-icon a			{ background-image: url(\"{IMG_ICON_CONTACT_ICQ_SRC}\"); }\n.jabber-icon, .jabber-icon a		{ background-image: url(\"{IMG_ICON_CONTACT_JABBER_SRC}\"); }\n.pm-icon, .pm-icon a				{ background-image: url(\"{IMG_ICON_CONTACT_PM_SRC}\"); }\n.quote-icon, .quote-icon a		{ background-image: url(\"{IMG_ICON_POST_QUOTE_SRC}\"); }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background-image: url(\"{IMG_ICON_POST_REPORT_SRC}\"); }\n.edit-icon, .edit-icon a			{ background-image: url(\"{IMG_ICON_POST_EDIT_SRC}\"); }\n.delete-icon, .delete-icon a		{ background-image: url(\"{IMG_ICON_POST_DELETE_SRC}\"); }\n.info-icon, .info-icon a			{ background-image: url(\"{IMG_ICON_POST_INFO_SRC}\"); }\n.warn-icon, .warn-icon a			{ background-image: url(\"{IMG_ICON_USER_WARN_SRC}\"); } /* Need updated warn icon */\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for cp.css\n-------------------------------------------------------------- */\n\n/* Main CP box\n----------------------------------------*/\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #A4B3BF;\n}\n\n#cp-main .panel li.row {\n	border-bottom-color: #B5C1CB;\n	border-top-color: #F9F9F9;\n}\n\nul.cplist {\n	border-top-color: #B5C1CB;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #000000;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	border-bottom-color: #333333;\n}\n\n#cp-main .pm-message {\n	border-color: #DBDEE2;\n	background-color: #FFFFFF;\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs a {\n	background-image: url(\"{T_THEME_PATH}/images/bg_tabs1.gif\");\n}\n\n#tabs a span {\n	background-image: url(\"{T_THEME_PATH}/images/bg_tabs2.gif\");\n	color: #536482;\n}\n\n#tabs a:hover span {\n	color: #BC2A4D;\n}\n\n#tabs .activetab a {\n	border-bottom-color: #CADCEB;\n}\n\n#tabs .activetab a span {\n	color: #333333;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs li {\n	background-color: #E1EBF2;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n\n/* Link styles for the sub-section links */\n#navigation a {\n	color: #333;\n	background-color: #B2C2CF;\n	background-image: url(\"{T_THEME_PATH}/images/bg_menu.gif\");\n}\n\n#navigation a:hover {\n	background-color: #aabac6;\n	color: #BC2A4D;\n}\n\n#navigation #active-subsection a {\n	color: #D31141;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #D31141;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: url(\"{T_THEME_PATH}/images/corners_left2.gif\");\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: url(\"{T_THEME_PATH}/images/corners_right2.gif\");\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: url(\"{T_THEME_PATH}/images/corners_left2.gif\");\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: url(\"{T_THEME_PATH}/images/corners_right2.gif\");\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: url(\"{T_THEME_PATH}/images/corners_left.gif\");\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: url(\"{T_THEME_PATH}/images/corners_right.gif\");\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: url(\"{T_THEME_PATH}/images/corners_left.gif\");\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: url(\"{T_THEME_PATH}/images/corners_right.gif\");\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #eef5f9;\n}\n\ndl.mini dt {\n	color: #425067;\n}\n\n/* PM Styles\n----------------------------------------*/\n/* PM Message history */\n.current {\n	color: #999999 !important;\n}\n\n/* PM marking colours */\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #BC2A4D;\n	border-right-color: #BC2A4D;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	border-color: #FF6600;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	border-color: #A9B8C2;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	border-color: #5D8FBD;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	border-color: #000000;\n}\n\n/* Avatar gallery */\n#gallery label {\n	background-color: #FFFFFF;\n	border-color: #CCC;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for forms.css\n-------------------------------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nselect {\n	border-color: #666666;\n	background-color: #FAFAFA;\n	color: #000;\n}\n\nlabel {\n	color: #425067;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\ndd label {\n	color: #333;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login input.inputbox {\n	background-color: #F2F3F3;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n#message-box textarea {\n	color: #333333;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF; \n	border-color: #B4BAC0;\n	color: #333333;\n}\n\n.inputbox:hover {\n	border-color: #11A3EA;\n}\n\n.inputbox:focus {\n	border-color: #11A3EA;\n	color: #0F4987;\n}\n\n/* Form button styles\n---------------------------------------- */\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	color: #000;\n	background-color: #FAFAFA;\n	background-image: url(\"{T_THEME_PATH}/images/bg_button.gif\");\n}\n\na.button1, input.button1 {\n	border-color: #666666;\n}\n\ninput.button3 {\n	background-image: none;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border-color: #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	color: #000000;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border-color: #BC2A4D;\n	color: #BC2A4D;\n}\n\ninput.search {\n	background-image: url(\"{T_THEME_PATH}/images/icon_textbox_search.gif\");\n}\n\ninput.disabled {\n	color: #666666;\n}\n');
/*!40000 ALTER TABLE `phpbb_styles_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics`
--

DROP TABLE IF EXISTS `phpbb_topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `icon_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL default '0',
  `topic_approved` tinyint(1) unsigned NOT NULL default '1',
  `topic_reported` tinyint(1) unsigned NOT NULL default '0',
  `topic_title` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `topic_poster` mediumint(8) unsigned NOT NULL default '0',
  `topic_time` int(11) unsigned NOT NULL default '0',
  `topic_time_limit` int(11) unsigned NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_first_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_last_poster_name` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_poster_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `topic_last_post_subject` varchar(255) collate utf8_bin NOT NULL default '',
  `topic_last_post_time` int(11) unsigned NOT NULL default '0',
  `topic_last_view_time` int(11) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL default '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL default '0',
  `poll_title` varchar(255) collate utf8_bin NOT NULL default '',
  `poll_start` int(11) unsigned NOT NULL default '0',
  `poll_length` int(11) unsigned NOT NULL default '0',
  `poll_max_options` tinyint(4) NOT NULL default '1',
  `poll_last_vote` int(11) unsigned NOT NULL default '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_topics`
--

LOCK TABLES `phpbb_topics` WRITE;
/*!40000 ALTER TABLE `phpbb_topics` DISABLE KEYS */;
INSERT INTO `phpbb_topics` VALUES (1,2,0,0,1,0,'Welcome to phpBB3',2,1249472216,0,1,0,0,0,0,1,'admin','AA0000',1,2,'admin','AA0000','Welcome to phpBB3',1249472216,1249480787,0,0,0,'',0,0,1,0,0);
/*!40000 ALTER TABLE `phpbb_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics_posted`
--

DROP TABLE IF EXISTS `phpbb_topics_posted`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_posted` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_topics_posted`
--

LOCK TABLES `phpbb_topics_posted` WRITE;
/*!40000 ALTER TABLE `phpbb_topics_posted` DISABLE KEYS */;
INSERT INTO `phpbb_topics_posted` VALUES (2,1,1);
/*!40000 ALTER TABLE `phpbb_topics_posted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics_track`
--

DROP TABLE IF EXISTS `phpbb_topics_track`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` mediumint(8) unsigned NOT NULL default '0',
  `mark_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_topics_track`
--

LOCK TABLES `phpbb_topics_track` WRITE;
/*!40000 ALTER TABLE `phpbb_topics_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_topics_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_topics_watch`
--

DROP TABLE IF EXISTS `phpbb_topics_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `notify_status` tinyint(1) unsigned NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_topics_watch`
--

LOCK TABLES `phpbb_topics_watch` WRITE;
/*!40000 ALTER TABLE `phpbb_topics_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_topics_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_user_group`
--

DROP TABLE IF EXISTS `phpbb_user_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `group_leader` tinyint(1) unsigned NOT NULL default '0',
  `user_pending` tinyint(1) unsigned NOT NULL default '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_user_group`
--

LOCK TABLES `phpbb_user_group` WRITE;
/*!40000 ALTER TABLE `phpbb_user_group` DISABLE KEYS */;
INSERT INTO `phpbb_user_group` VALUES (1,1,0,0),(2,2,0,0),(4,2,0,0),(5,2,1,0),(6,3,0,0),(6,4,0,0),(6,5,0,0),(6,6,0,0),(6,7,0,0),(6,8,0,0),(6,9,0,0),(6,10,0,0),(6,11,0,0),(6,12,0,0),(6,13,0,0),(6,14,0,0),(6,15,0,0),(6,16,0,0),(6,17,0,0),(6,18,0,0),(6,19,0,0),(6,20,0,0),(6,21,0,0),(6,22,0,0),(6,23,0,0),(6,24,0,0),(6,25,0,0),(6,26,0,0),(6,27,0,0),(6,28,0,0),(6,29,0,0),(6,30,0,0),(6,31,0,0),(6,32,0,0),(6,33,0,0),(6,34,0,0),(6,35,0,0),(6,36,0,0),(6,37,0,0),(6,38,0,0),(6,39,0,0),(6,40,0,0),(6,41,0,0),(6,42,0,0),(6,43,0,0),(6,44,0,0),(6,45,0,0),(6,46,0,0),(6,47,0,0),(6,48,0,0),(6,49,0,0),(6,50,0,0),(6,51,0,0),(6,52,0,0);
/*!40000 ALTER TABLE `phpbb_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_users`
--

DROP TABLE IF EXISTS `phpbb_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_type` tinyint(2) NOT NULL default '0',
  `group_id` mediumint(8) unsigned NOT NULL default '3',
  `user_permissions` mediumtext collate utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL default '0',
  `user_ip` varchar(40) collate utf8_bin NOT NULL default '',
  `user_regdate` int(11) unsigned NOT NULL default '0',
  `username` varchar(255) collate utf8_bin NOT NULL default '',
  `username_clean` varchar(255) collate utf8_bin NOT NULL default '',
  `user_password` varchar(40) collate utf8_bin NOT NULL default '',
  `user_passchg` int(11) unsigned NOT NULL default '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL default '0',
  `user_email` varchar(100) collate utf8_bin NOT NULL default '',
  `user_email_hash` bigint(20) NOT NULL default '0',
  `user_birthday` varchar(10) collate utf8_bin NOT NULL default '',
  `user_lastvisit` int(11) unsigned NOT NULL default '0',
  `user_lastmark` int(11) unsigned NOT NULL default '0',
  `user_lastpost_time` int(11) unsigned NOT NULL default '0',
  `user_lastpage` varchar(200) collate utf8_bin NOT NULL default '',
  `user_last_confirm_key` varchar(10) collate utf8_bin NOT NULL default '',
  `user_last_search` int(11) unsigned NOT NULL default '0',
  `user_warnings` tinyint(4) NOT NULL default '0',
  `user_last_warning` int(11) unsigned NOT NULL default '0',
  `user_login_attempts` tinyint(4) NOT NULL default '0',
  `user_inactive_reason` tinyint(2) NOT NULL default '0',
  `user_inactive_time` int(11) unsigned NOT NULL default '0',
  `user_posts` mediumint(8) unsigned NOT NULL default '0',
  `user_lang` varchar(30) collate utf8_bin NOT NULL default '',
  `user_timezone` decimal(5,2) NOT NULL default '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL default '0',
  `user_dateformat` varchar(30) collate utf8_bin NOT NULL default 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` mediumint(8) unsigned NOT NULL default '0',
  `user_colour` varchar(6) collate utf8_bin NOT NULL default '',
  `user_new_privmsg` int(4) NOT NULL default '0',
  `user_unread_privmsg` int(4) NOT NULL default '0',
  `user_last_privmsg` int(11) unsigned NOT NULL default '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL default '0',
  `user_full_folder` int(11) NOT NULL default '-3',
  `user_emailtime` int(11) unsigned NOT NULL default '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_topic_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_topic_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL default '0',
  `user_post_sortby_type` varchar(1) collate utf8_bin NOT NULL default 't',
  `user_post_sortby_dir` varchar(1) collate utf8_bin NOT NULL default 'a',
  `user_notify` tinyint(1) unsigned NOT NULL default '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_notify_type` tinyint(4) NOT NULL default '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL default '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL default '1',
  `user_options` int(11) unsigned NOT NULL default '895',
  `user_avatar` varchar(255) collate utf8_bin NOT NULL default '',
  `user_avatar_type` tinyint(2) NOT NULL default '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL default '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL default '0',
  `user_sig` mediumtext collate utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) collate utf8_bin NOT NULL default '',
  `user_sig_bbcode_bitfield` varchar(255) collate utf8_bin NOT NULL default '',
  `user_from` varchar(100) collate utf8_bin NOT NULL default '',
  `user_icq` varchar(15) collate utf8_bin NOT NULL default '',
  `user_aim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_yim` varchar(255) collate utf8_bin NOT NULL default '',
  `user_msnm` varchar(255) collate utf8_bin NOT NULL default '',
  `user_jabber` varchar(255) collate utf8_bin NOT NULL default '',
  `user_website` varchar(200) collate utf8_bin NOT NULL default '',
  `user_occ` text collate utf8_bin NOT NULL,
  `user_interests` text collate utf8_bin NOT NULL,
  `user_actkey` varchar(32) collate utf8_bin NOT NULL default '',
  `user_newpasswd` varchar(40) collate utf8_bin NOT NULL default '',
  `user_form_salt` varchar(32) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_users`
--

LOCK TABLES `phpbb_users` WRITE;
/*!40000 ALTER TABLE `phpbb_users` DISABLE KEYS */;
INSERT INTO `phpbb_users` VALUES (1,2,1,'00000000003khra3nk\ni1cjyo000000\ni1cjyo000000',0,'',1249472216,'Anonymous','anonymous','',0,0,'',0,'',0,0,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'d M Y H:i',1,0,'',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','63cf0566338d9759'),(2,3,5,'zik0zjzik0zjzik0xs\ni1cjyo000000\nzik0zjzhb2tc',0,'127.0.0.1',1249472216,'admin','admin','',0,0,'1galactic@gmail.com',83287104519,'',1249480717,0,0,'index.php','',0,0,0,0,0,0,1,'en','0.00',0,'D M d, Y g:i a',1,1,'AA0000',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,1,895,'',0,0,0,'','','','','','','','','','','','','','',''),(3,2,6,'',0,'',1249472221,'AdsBot [Google]','adsbot [google]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','69c1cafa341457f7'),(4,2,6,'',0,'',1249472221,'Alexa [Bot]','alexa [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','3afafef07dde1d6e'),(5,2,6,'',0,'',1249472221,'Alta Vista [Bot]','alta vista [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','9fbc014d3dbffd5f'),(6,2,6,'',0,'',1249472221,'Ask Jeeves [Bot]','ask jeeves [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','2d59b39f9103e01c'),(7,2,6,'',0,'',1249472221,'Baidu [Spider]','baidu [spider]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','90936ef402fac0f0'),(8,2,6,'',0,'',1249472221,'Exabot [Bot]','exabot [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','f4fc05ca2dbe6281'),(9,2,6,'',0,'',1249472221,'FAST Enterprise [Crawler]','fast enterprise [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','91b278d7db0ada09'),(10,2,6,'',0,'',1249472221,'FAST WebCrawler [Crawler]','fast webcrawler [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','addea30e173112c9'),(11,2,6,'',0,'',1249472221,'Francis [Bot]','francis [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','bc0d249bd968423e'),(12,2,6,'',0,'',1249472221,'Gigabot [Bot]','gigabot [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','8e76539d7f6053f0'),(13,2,6,'',0,'',1249472221,'Google Adsense [Bot]','google adsense [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','f296b0a30f7a30a8'),(14,2,6,'',0,'',1249472221,'Google Desktop','google desktop','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','c0e1afe87c5b2dec'),(15,2,6,'',0,'',1249472221,'Google Feedfetcher','google feedfetcher','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','decb9e991ca8414d'),(16,2,6,'',0,'',1249472221,'Google [Bot]','google [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','bcffa84627131b94'),(17,2,6,'',0,'',1249472221,'Heise IT-Markt [Crawler]','heise it-markt [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','73ca0314181f4d8b'),(18,2,6,'',0,'',1249472221,'Heritrix [Crawler]','heritrix [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','d47ca691ebb32216'),(19,2,6,'',0,'',1249472221,'IBM Research [Bot]','ibm research [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','697c1b57ce8bc1d8'),(20,2,6,'',0,'',1249472221,'ICCrawler - ICjobs','iccrawler - icjobs','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','98cb2dbfeab5dd11'),(21,2,6,'',0,'',1249472221,'ichiro [Crawler]','ichiro [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','692067bf0bf785e3'),(22,2,6,'',0,'',1249472221,'Majestic-12 [Bot]','majestic-12 [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','02390e9c1576c12d'),(23,2,6,'',0,'',1249472221,'Metager [Bot]','metager [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','172be3f259026f44'),(24,2,6,'',0,'',1249472221,'MSN NewsBlogs','msn newsblogs','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','82a51ff78e015660'),(25,2,6,'',0,'',1249472221,'MSN [Bot]','msn [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','5638f28a2fe42083'),(26,2,6,'',0,'',1249472221,'MSNbot Media','msnbot media','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','caea20737227b7dd'),(27,2,6,'',0,'',1249472221,'NG-Search [Bot]','ng-search [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','88b18e99258f483f'),(28,2,6,'',0,'',1249472221,'Nutch [Bot]','nutch [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','1dfe169acc4de9ee'),(29,2,6,'',0,'',1249472221,'Nutch/CVS [Bot]','nutch/cvs [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','0b465b301b7f4677'),(30,2,6,'',0,'',1249472221,'OmniExplorer [Bot]','omniexplorer [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','d37d98bd1e34b820'),(31,2,6,'',0,'',1249472221,'Online link [Validator]','online link [validator]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','6362c3a32d0ab345'),(32,2,6,'',0,'',1249472221,'psbot [Picsearch]','psbot [picsearch]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','354dc7b9f8fc5b8b'),(33,2,6,'',0,'',1249472221,'Seekport [Bot]','seekport [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','30437918507635ab'),(34,2,6,'',0,'',1249472221,'Sensis [Crawler]','sensis [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','6124c15f1d3244e6'),(35,2,6,'',0,'',1249472221,'SEO Crawler','seo crawler','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','bf3f7135ebb83546'),(36,2,6,'',0,'',1249472221,'Seoma [Crawler]','seoma [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','76d2191f2eb26320'),(37,2,6,'',0,'',1249472221,'SEOSearch [Crawler]','seosearch [crawler]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','3280c2193c114bed'),(38,2,6,'',0,'',1249472221,'Snappy [Bot]','snappy [bot]','',1249472221,0,'',0,'',0,1249472221,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','3373c35301f12714'),(39,2,6,'',0,'',1249472222,'Steeler [Crawler]','steeler [crawler]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','74fb2c31c804a230'),(40,2,6,'',0,'',1249472222,'Synoo [Bot]','synoo [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','8a555d29bc68153c'),(41,2,6,'',0,'',1249472222,'Telekom [Bot]','telekom [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','5dd83358b5f7aced'),(42,2,6,'',0,'',1249472222,'TurnitinBot [Bot]','turnitinbot [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','e28666344aa31293'),(43,2,6,'',0,'',1249472222,'Voyager [Bot]','voyager [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','7fe6bc37202b2a8f'),(44,2,6,'',0,'',1249472222,'W3 [Sitesearch]','w3 [sitesearch]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','006e4fa5b47d22c8'),(45,2,6,'',0,'',1249472222,'W3C [Linkcheck]','w3c [linkcheck]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','84265d022bc6ae10'),(46,2,6,'',0,'',1249472222,'W3C [Validator]','w3c [validator]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','6ba997358131950b'),(47,2,6,'',0,'',1249472222,'WiseNut [Bot]','wisenut [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','3e33e4739f7f5f26'),(48,2,6,'',0,'',1249472222,'YaCy [Bot]','yacy [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','602ba5bfb2b7d6ea'),(49,2,6,'',0,'',1249472222,'Yahoo MMCrawler [Bot]','yahoo mmcrawler [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','a478751833640abc'),(50,2,6,'',0,'',1249472222,'Yahoo Slurp [Bot]','yahoo slurp [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','63df8b6ecde92487'),(51,2,6,'',0,'',1249472222,'Yahoo [Bot]','yahoo [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','276ce86edac93544'),(52,2,6,'',0,'',1249472222,'YahooSeeker [Bot]','yahooseeker [bot]','',1249472222,0,'',0,'',0,1249472222,0,'','',0,0,0,0,0,0,0,'en','0.00',0,'D M d, Y g:i a',1,0,'9E8DA7',0,0,0,0,-3,0,0,'t','d',0,'t','a',0,1,0,1,1,1,0,895,'',0,0,0,'','','','','','','','','','','','','','','d6d7ad91b35dfb1b');
/*!40000 ALTER TABLE `phpbb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_warnings`
--

DROP TABLE IF EXISTS `phpbb_warnings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `log_id` mediumint(8) unsigned NOT NULL default '0',
  `warning_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`warning_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_warnings`
--

LOCK TABLES `phpbb_warnings` WRITE;
/*!40000 ALTER TABLE `phpbb_warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_words`
--

DROP TABLE IF EXISTS `phpbb_words`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` varchar(255) collate utf8_bin NOT NULL default '',
  `replacement` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_words`
--

LOCK TABLES `phpbb_words` WRITE;
/*!40000 ALTER TABLE `phpbb_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phpbb_zebra`
--

DROP TABLE IF EXISTS `phpbb_zebra`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `phpbb_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `zebra_id` mediumint(8) unsigned NOT NULL default '0',
  `friend` tinyint(1) unsigned NOT NULL default '0',
  `foe` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`zebra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `phpbb_zebra`
--

LOCK TABLES `phpbb_zebra` WRITE;
/*!40000 ALTER TABLE `phpbb_zebra` DISABLE KEYS */;
/*!40000 ALTER TABLE `phpbb_zebra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-05 17:49:05
