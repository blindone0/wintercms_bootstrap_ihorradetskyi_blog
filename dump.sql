-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: october
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_access_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'127.0.0.1','2021-05-30 13:35:24','2021-05-30 13:35:24');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Owners','2021-05-30 13:18:22','2021-05-30 13:18:22','owners','Default group for website owners.',0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_roles`
--

DROP TABLE IF EXISTS `backend_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_roles`
--

LOCK TABLES `backend_user_roles` WRITE;
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` VALUES (1,'Publisher','publisher','Site editor with access to publishing tools.','',1,'2021-05-30 13:18:22','2021-05-30 13:18:22'),(2,'Developer','developer','Site administrator with access to developer tools.','',1,'2021-05-30 13:18:22','2021-05-30 13:18:22');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'127.0.0.1',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Admin','Person','admin','admin@example.com','$2y$10$d28wB5cN.oOoImdSe0ctcuCmCszevLwsZAAp2PzghC/Rkvz3v9Xsa',NULL,'$2y$10$YCu3iz3n6NvnzJNOOAVHYeRD6cd4gSyhxT5pF.87T5kZTqc1Uok2.',NULL,'',1,2,NULL,'2021-05-30 13:35:24','2021-05-30 13:18:23','2021-05-30 13:35:24',NULL,1);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_logs`
--

LOCK TABLES `cms_theme_logs` WRITE;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_templates`
--

DROP TABLE IF EXISTS `cms_theme_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_theme_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_templates`
--

LOCK TABLES `cms_theme_templates` WRITE;
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deferred_bindings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_10_01_000001_Db_Deferred_Bindings',1),(2,'2013_10_01_000002_Db_System_Files',1),(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),(4,'2013_10_01_000004_Db_System_Plugin_History',1),(5,'2013_10_01_000005_Db_System_Settings',1),(6,'2013_10_01_000006_Db_System_Parameters',1),(7,'2013_10_01_000007_Db_System_Add_Disabled_Flag',1),(8,'2013_10_01_000008_Db_System_Mail_Templates',1),(9,'2013_10_01_000009_Db_System_Mail_Layouts',1),(10,'2014_10_01_000010_Db_Jobs',1),(11,'2014_10_01_000011_Db_System_Event_Logs',1),(12,'2014_10_01_000012_Db_System_Request_Logs',1),(13,'2014_10_01_000013_Db_System_Sessions',1),(14,'2015_10_01_000014_Db_System_Mail_Layout_Rename',1),(15,'2015_10_01_000015_Db_System_Add_Frozen_Flag',1),(16,'2015_10_01_000016_Db_Cache',1),(17,'2015_10_01_000017_Db_System_Revisions',1),(18,'2015_10_01_000018_Db_FailedJobs',1),(19,'2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),(20,'2016_10_01_000020_Db_System_Timestamp_Fix',1),(21,'2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session',1),(22,'2017_10_01_000021_Db_System_Sessions_Update',1),(23,'2017_10_01_000022_Db_Jobs_FailedJobs_Update',1),(24,'2017_10_01_000023_Db_System_Mail_Partials',1),(25,'2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field',1),(26,'2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings',1),(27,'2013_10_01_000001_Db_Backend_Users',2),(28,'2013_10_01_000002_Db_Backend_User_Groups',2),(29,'2013_10_01_000003_Db_Backend_Users_Groups',2),(30,'2013_10_01_000004_Db_Backend_User_Throttle',2),(31,'2014_01_04_000005_Db_Backend_User_Preferences',2),(32,'2014_10_01_000006_Db_Backend_Access_Log',2),(33,'2014_10_01_000007_Db_Backend_Add_Description_Field',2),(34,'2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),(35,'2016_10_01_000009_Db_Backend_Timestamp_Fix',2),(36,'2017_10_01_000010_Db_Backend_User_Roles',2),(37,'2018_12_16_000011_Db_Backend_Add_Deleted_At',2),(38,'2014_10_01_000001_Db_Cms_Theme_Data',3),(39,'2016_10_01_000002_Db_Cms_Timestamp_Fix',3),(40,'2017_10_01_000003_Db_Cms_Theme_Logs',3),(41,'2018_11_01_000001_Db_Cms_Theme_Templates',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_categories`
--

DROP TABLE IF EXISTS `rainlab_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_blog_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int unsigned DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_categories`
--

LOCK TABLES `rainlab_blog_categories` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_categories` DISABLE KEYS */;
INSERT INTO `rainlab_blog_categories` VALUES (1,'Uncategorized','uncategorized',NULL,NULL,NULL,1,2,0,'2021-05-30 13:38:18','2021-05-30 13:38:18');
/*!40000 ALTER TABLE `rainlab_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_posts`
--

DROP TABLE IF EXISTS `rainlab_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_blog_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_posts`
--

LOCK TABLES `rainlab_blog_posts` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_posts` DISABLE KEYS */;
INSERT INTO `rainlab_blog_posts` VALUES (1,1,'First blog post','first-blog-post','The first ever blog post is here. It might be a good idea to update this post with some more relevant content.','This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*','<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>','2021-05-30 13:38:18',1,'2021-05-30 13:38:18','2021-05-30 13:38:18',NULL);
/*!40000 ALTER TABLE `rainlab_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainlab_blog_posts_categories`
--

DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainlab_blog_posts_categories`
--

LOCK TABLES `rainlab_blog_posts_categories` WRITE;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rainlab_blog_posts_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_event_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (1,'error','Symfony\\Component\\Console\\Exception\\CommandNotFoundException: Command \"winter:migrate\" is not defined.\n\nDid you mean one of these?\n    tinker\n    winter:down\n    winter:env\n    winter:fresh\n    winter:install\n    winter:mirror\n    winter:passwd\n    winter:up\n    winter:update\n    winter:util\n    winter:version in C:\\laragon\\www\\mywinter\\vendor\\symfony\\console\\Application.php:676\nStack trace:\n#0 C:\\laragon\\www\\mywinter\\vendor\\symfony\\console\\Application.php(237): Symfony\\Component\\Console\\Application->find(\'winter:migrate\')\n#1 C:\\laragon\\www\\mywinter\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#2 C:\\laragon\\www\\mywinter\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#3 C:\\laragon\\www\\mywinter\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#4 C:\\laragon\\www\\mywinter\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#5 {main}',NULL,'2021-05-30 13:19:20','2021-05-30 13:19:20'),(2,'error','Symfony\\Component\\Console\\Exception\\CommandNotFoundException: Command \"winter:\" is ambiguous.\nDid you mean one of these?\n    winter:up       Builds database tables for Winter and all plugins.\n    winter:down     Destroys all database tables for Winter and all plugins.\n    winter:update   Updates Winter CMS and all plugins, database and files.\n    winter:util     Utility commands for Winter\n    winter:mirror   Generates a mirrored public folder using symbolic links.\n    winter:fresh    Removes the demo theme and plugin.\n    winter:env      Creates .env file with default configuration values.\n    winter:install  Set up Winter for the first time.\n    winter:passwd   Change the password of a Backend user.\n    winter:version  Detects the build number (version) of this Winter CMS instance.. in C:\\laragon\\www\\mywinter\\vendor\\symfony\\console\\Application.php:717\nStack trace:\n#0 C:\\laragon\\www\\mywinter\\vendor\\symfony\\console\\Application.php(237): Symfony\\Component\\Console\\Application->find(\'winter:\')\n#1 C:\\laragon\\www\\mywinter\\vendor\\symfony\\console\\Application.php(149): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#2 C:\\laragon\\www\\mywinter\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#3 C:\\laragon\\www\\mywinter\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(131): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#4 C:\\laragon\\www\\mywinter\\artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#5 {main}',NULL,'2021-05-30 13:33:46','2021-05-30 13:33:46');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2021-05-30 13:18:22','2021-05-30 13:18:22'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2021-05-30 13:18:22','2021-05-30 13:18:22');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_partials`
--

DROP TABLE IF EXISTS `system_mail_partials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_partials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_partials`
--

LOCK TABLES `system_mail_partials` WRITE;
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','update','retry','1622478930'),(3,'cms','theme','active','\"ihorradetskyi\"');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (1,'Winter.Demo','comment','1.0.1','First version of Demo','2021-05-30 13:18:21'),(2,'RainLab.Builder','comment','1.0.1','Initialize plugin.','2021-05-30 13:37:22'),(3,'RainLab.Builder','comment','1.0.2','Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.','2021-05-30 13:37:23'),(4,'RainLab.Builder','comment','1.0.3','Improved handling of the enum data type.','2021-05-30 13:37:23'),(5,'RainLab.Builder','comment','1.0.4','Added user permissions to work with the Builder.','2021-05-30 13:37:23'),(6,'RainLab.Builder','comment','1.0.5','Fixed permissions registration.','2021-05-30 13:37:24'),(7,'RainLab.Builder','comment','1.0.6','Fixed front-end record ordering in the Record List component.','2021-05-30 13:37:24'),(8,'RainLab.Builder','comment','1.0.7','Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.','2021-05-30 13:37:24'),(9,'RainLab.Builder','comment','1.0.8','Added the Reorder Controller behavior.','2021-05-30 13:37:25'),(10,'RainLab.Builder','comment','1.0.9','Minor API and UI updates.','2021-05-30 13:37:25'),(11,'RainLab.Builder','comment','1.0.10','Minor styling update.','2021-05-30 13:37:25'),(12,'RainLab.Builder','comment','1.0.11','Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.','2021-05-30 13:37:25'),(13,'RainLab.Builder','comment','1.0.12','Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.','2021-05-30 13:37:26'),(14,'RainLab.Builder','comment','1.0.13','Minor styling fix on the database editor.','2021-05-30 13:37:26'),(15,'RainLab.Builder','comment','1.0.14','Added support for published_at timestamp field','2021-05-30 13:37:26'),(16,'RainLab.Builder','comment','1.0.15','Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.','2021-05-30 13:37:26'),(17,'RainLab.Builder','comment','1.0.16','Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.','2021-05-30 13:37:27'),(18,'RainLab.Builder','comment','1.0.17','Added support Trigger attribute support for RecordFinder and Repeater form widgets.','2021-05-30 13:37:27'),(19,'RainLab.Builder','comment','1.0.18','Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.','2021-05-30 13:37:27'),(20,'RainLab.Builder','comment','1.0.19','Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.','2021-05-30 13:37:27'),(21,'RainLab.Builder','comment','1.0.20','Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.','2021-05-30 13:37:27'),(22,'RainLab.Builder','comment','1.0.21','Back-end navigation sort order updated.','2021-05-30 13:37:28'),(23,'RainLab.Builder','comment','1.0.22','Added scopeValue property to the RecordList component.','2021-05-30 13:37:28'),(24,'RainLab.Builder','comment','1.0.23','Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs','2021-05-30 13:37:28'),(25,'RainLab.Builder','comment','1.0.24','Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces','2021-05-30 13:37:28'),(26,'RainLab.Builder','comment','1.0.25','Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.','2021-05-30 13:37:29'),(27,'RainLab.Builder','comment','1.0.26','Allow special default values for columns and added new \"Add ID column\" button to database editor.','2021-05-30 13:37:29'),(28,'RainLab.Builder','comment','1.0.27','Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.','2021-05-30 13:37:29'),(29,'RainLab.Blog','script','1.0.1','create_posts_table.php','2021-05-30 13:38:16'),(30,'RainLab.Blog','script','1.0.1','create_categories_table.php','2021-05-30 13:38:18'),(31,'RainLab.Blog','script','1.0.1','seed_all_tables.php','2021-05-30 13:38:18'),(32,'RainLab.Blog','comment','1.0.1','Initialize plugin.','2021-05-30 13:38:18'),(33,'RainLab.Blog','comment','1.0.2','Added the processed HTML content column to the posts table.','2021-05-30 13:38:19'),(34,'RainLab.Blog','comment','1.0.3','Category component has been merged with Posts component.','2021-05-30 13:38:19'),(35,'RainLab.Blog','comment','1.0.4','Improvements to the Posts list management UI.','2021-05-30 13:38:19'),(36,'RainLab.Blog','comment','1.0.5','Removes the Author column from blog post list.','2021-05-30 13:38:19'),(37,'RainLab.Blog','comment','1.0.6','Featured images now appear in the Post component.','2021-05-30 13:38:20'),(38,'RainLab.Blog','comment','1.0.7','Added support for the Static Pages menus.','2021-05-30 13:38:20'),(39,'RainLab.Blog','comment','1.0.8','Added total posts to category list.','2021-05-30 13:38:20'),(40,'RainLab.Blog','comment','1.0.9','Added support for the Sitemap plugin.','2021-05-30 13:38:20'),(41,'RainLab.Blog','comment','1.0.10','Added permission to prevent users from seeing posts they did not create.','2021-05-30 13:38:20'),(42,'RainLab.Blog','comment','1.0.11','Deprecate \"idParam\" component property in favour of \"slug\" property.','2021-05-30 13:38:20'),(43,'RainLab.Blog','comment','1.0.12','Fixes issue where images cannot be uploaded caused by latest Markdown library.','2021-05-30 13:38:21'),(44,'RainLab.Blog','comment','1.0.13','Fixes problem with providing pages to Sitemap and Pages plugins.','2021-05-30 13:38:21'),(45,'RainLab.Blog','comment','1.0.14','Add support for CSRF protection feature added to core.','2021-05-30 13:38:21'),(46,'RainLab.Blog','comment','1.1.0','Replaced the Post editor with the new core Markdown editor.','2021-05-30 13:38:21'),(47,'RainLab.Blog','comment','1.1.1','Posts can now be imported and exported.','2021-05-30 13:38:21'),(48,'RainLab.Blog','comment','1.1.2','Posts are no longer visible if the published date has not passed.','2021-05-30 13:38:21'),(49,'RainLab.Blog','comment','1.1.3','Added a New Post shortcut button to the blog menu.','2021-05-30 13:38:21'),(50,'RainLab.Blog','script','1.2.0','categories_add_nested_fields.php','2021-05-30 13:38:22'),(51,'RainLab.Blog','comment','1.2.0','Categories now support nesting.','2021-05-30 13:38:22'),(52,'RainLab.Blog','comment','1.2.1','Post slugs now must be unique.','2021-05-30 13:38:22'),(53,'RainLab.Blog','comment','1.2.2','Fixes issue on new installs.','2021-05-30 13:38:22'),(54,'RainLab.Blog','comment','1.2.3','Minor user interface update.','2021-05-30 13:38:22'),(55,'RainLab.Blog','script','1.2.4','update_timestamp_nullable.php','2021-05-30 13:38:23'),(56,'RainLab.Blog','comment','1.2.4','Database maintenance. Updated all timestamp columns to be nullable.','2021-05-30 13:38:23'),(57,'RainLab.Blog','comment','1.2.5','Added translation support for blog posts.','2021-05-30 13:38:23'),(58,'RainLab.Blog','comment','1.2.6','The published field can now supply a time with the date.','2021-05-30 13:38:23'),(59,'RainLab.Blog','comment','1.2.7','Introduced a new RSS feed component.','2021-05-30 13:38:24'),(60,'RainLab.Blog','comment','1.2.8','Fixes issue with translated `content_html` attribute on blog posts.','2021-05-30 13:38:24'),(61,'RainLab.Blog','comment','1.2.9','Added translation support for blog categories.','2021-05-30 13:38:24'),(62,'RainLab.Blog','comment','1.2.10','Added translation support for post slugs.','2021-05-30 13:38:24'),(63,'RainLab.Blog','comment','1.2.11','Fixes bug where excerpt is not translated.','2021-05-30 13:38:24'),(64,'RainLab.Blog','comment','1.2.12','Description field added to category form.','2021-05-30 13:38:24'),(65,'RainLab.Blog','comment','1.2.13','Improved support for Static Pages menus, added a blog post and all blog posts.','2021-05-30 13:38:24'),(66,'RainLab.Blog','comment','1.2.14','Added post exception property to the post list component, useful for showing related posts.','2021-05-30 13:38:24'),(67,'RainLab.Blog','comment','1.2.15','Back-end navigation sort order updated.','2021-05-30 13:38:25'),(68,'RainLab.Blog','comment','1.2.16','Added `nextPost` and `previousPost` to the blog post component.','2021-05-30 13:38:25'),(69,'RainLab.Blog','comment','1.2.17','Improved the next and previous logic to sort by the published date.','2021-05-30 13:38:25'),(70,'RainLab.Blog','comment','1.2.18','Minor change to internals.','2021-05-30 13:38:25'),(71,'RainLab.Blog','comment','1.2.19','Improved support for Build 420+','2021-05-30 13:38:25'),(72,'RainLab.Blog','script','1.3.0','posts_add_metadata.php','2021-05-30 13:38:26'),(73,'RainLab.Blog','comment','1.3.0','Added metadata column for plugins to store data in','2021-05-30 13:38:26'),(74,'RainLab.Blog','comment','1.3.1','Fixed metadata column not being jsonable','2021-05-30 13:38:26'),(75,'RainLab.Blog','comment','1.3.2','Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.','2021-05-30 13:38:26'),(76,'RainLab.Blog','comment','1.3.3','Fixed \'excluded categories\' filter from being run when value is empty.','2021-05-30 13:38:26'),(77,'RainLab.Blog','comment','1.3.4','Allow post author to be specified. Improved translations.','2021-05-30 13:38:26'),(78,'RainLab.Blog','comment','1.3.5','Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.','2021-05-30 13:38:26'),(79,'RainLab.Blog','comment','1.3.6','Improved French translations.','2021-05-30 13:38:27'),(80,'RainLab.Blog','comment','1.4.0','Stability improvements. Rollback custom slug names for components','2021-05-30 13:38:27'),(81,'RainLab.Blog','comment','1.4.1','Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.','2021-05-30 13:38:27'),(82,'RainLab.Blog','comment','1.4.2','Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.','2021-05-30 13:38:27'),(83,'RainLab.Blog','comment','1.4.3','Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.','2021-05-30 13:38:27'),(84,'RainLab.Blog','comment','1.4.4','Rollback translated bylines, please move or override the default component markup instead.','2021-05-30 13:38:27'),(85,'RainLab.Blog','comment','1.5.0','Implement support for October CMS v2.0','2021-05-30 13:38:28');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_plugin_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (1,'Winter.Demo','1.0.1','2021-05-30 13:18:21',0,0),(2,'RainLab.Builder','1.0.27','2021-05-30 13:37:29',0,0),(3,'RainLab.Blog','1.5.0','2021-05-30 13:38:28',0,0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_revisions`
--

LOCK TABLES `system_revisions` WRITE;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'rainlab_builder_settings','{\"author_name\":\"ihorr\",\"author_namespace\":\"Ihorr\"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-30 23:27:27
