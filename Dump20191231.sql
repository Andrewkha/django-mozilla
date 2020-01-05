-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 192.168.1.78    Database: library
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Library members'),(2,'Librerian');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,2,45);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add book',7,'add_book'),(26,'Can change book',7,'change_book'),(27,'Can delete book',7,'delete_book'),(28,'Can view book',7,'view_book'),(29,'Can add genre',8,'add_genre'),(30,'Can change genre',8,'change_genre'),(31,'Can delete genre',8,'delete_genre'),(32,'Can view genre',8,'view_genre'),(33,'Can add author',9,'add_author'),(34,'Can change author',9,'change_author'),(35,'Can delete author',9,'delete_author'),(36,'Can view author',9,'view_author'),(37,'Can add book instance',10,'add_bookinstance'),(38,'Can change book instance',10,'change_bookinstance'),(39,'Can delete book instance',10,'delete_bookinstance'),(40,'Can view book instance',10,'view_bookinstance'),(41,'Can add language',11,'add_language'),(42,'Can change language',11,'change_language'),(43,'Can delete language',11,'delete_language'),(44,'Can view language',11,'view_language'),(45,'Set a book as returned',10,'can_mark_returned');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$KgPBbxaT9XsZ$jX21rNhIUBLaAj1xfzwH8Ts0qogeQ5Y45oDyU4V2S8Y=','2019-12-30 13:39:25.722097',1,'andrew','','','andrew@andrew.ru',1,1,'2019-12-26 18:53:00.565966'),(2,'pbkdf2_sha256$180000$0EP1IXyQsmqV$nWrSHj7gwbDBKY3UVpnKgL4BWQszBomXkkdiYBXIEz8=','2019-12-30 18:36:37.150635',0,'user1','','','',0,1,'2019-12-30 11:17:20.000000'),(3,'pbkdf2_sha256$180000$qzjj4ZxQrRJK$kGUnpmuQjdw6Z9JTBMGMCmr2d4Su+WJ6ymQPHrhPqMw=','2019-12-30 18:38:37.307119',0,'user2','','','',0,1,'2019-12-30 13:01:54.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_author`
--

DROP TABLE IF EXISTS `catalog_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_author`
--

LOCK TABLES `catalog_author` WRITE;
/*!40000 ALTER TABLE `catalog_author` DISABLE KEYS */;
INSERT INTO `catalog_author` VALUES (1,'Александр','Беляев',NULL,NULL),(2,'Аркадий и Борис','Стругацкие',NULL,NULL),(3,'Daniel','Defoe',NULL,NULL),(4,'Alexander S','Pushkin','1799-01-01','1837-06-05');
/*!40000 ALTER TABLE `catalog_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_book`
--

DROP TABLE IF EXISTS `catalog_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` longtext NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_book_author_id_b0849980_fk_catalog_author_id` (`author_id`),
  KEY `catalog_book_language_id_447f859e_fk_catalog_language_id` (`language_id`),
  CONSTRAINT `catalog_book_author_id_b0849980_fk_catalog_author_id` FOREIGN KEY (`author_id`) REFERENCES `catalog_author` (`id`),
  CONSTRAINT `catalog_book_language_id_447f859e_fk_catalog_language_id` FOREIGN KEY (`language_id`) REFERENCES `catalog_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_book`
--

LOCK TABLES `catalog_book` WRITE;
/*!40000 ALTER TABLE `catalog_book` DISABLE KEYS */;
INSERT INTO `catalog_book` VALUES (1,'Голова профессора Доуэля','Голова профессора Доуэля','1111111111111',1,1),(2,'Человек-Амфибия','Человек-Амфибия','2222222222222',1,1),(3,'Трудно быть богом','Трудно быть богом','3333333333333',2,1),(4,'Robinson Cruzo','Robinson Cruzo','1212121212121',3,2),(5,'Тупая голова','sdsdsd','2342342342424',1,1);
/*!40000 ALTER TABLE `catalog_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_book_genre`
--

DROP TABLE IF EXISTS `catalog_book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_book_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_book_genre_book_id_genre_id_d15f6922_uniq` (`book_id`,`genre_id`),
  KEY `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` (`genre_id`),
  CONSTRAINT `catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  CONSTRAINT `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `catalog_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_book_genre`
--

LOCK TABLES `catalog_book_genre` WRITE;
/*!40000 ALTER TABLE `catalog_book_genre` DISABLE KEYS */;
INSERT INTO `catalog_book_genre` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,3),(5,5,1);
/*!40000 ALTER TABLE `catalog_book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_bookinstance`
--

DROP TABLE IF EXISTS `catalog_bookinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_bookinstance` (
  `id` char(32) NOT NULL,
  `imprint` varchar(200) NOT NULL,
  `due_back` date DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` (`book_id`),
  KEY `catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id` (`borrower_id`),
  CONSTRAINT `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  CONSTRAINT `catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id` FOREIGN KEY (`borrower_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_bookinstance`
--

LOCK TABLES `catalog_bookinstance` WRITE;
/*!40000 ALTER TABLE `catalog_bookinstance` DISABLE KEYS */;
INSERT INTO `catalog_bookinstance` VALUES ('369326d01ec74ea4b47f368c7806567c','4343434','2020-01-20','o',4,2),('3bada0cf5bf14b8aac1b4b2074ed6733','d3e',NULL,'m',2,NULL),('3dca89cab3ff49628ba77bb0c1a2a5d0','r33434','2020-01-20','o',3,3),('6e9539cd01d7494daae802b9c402439d','332eew',NULL,'m',1,NULL),('6f42820c18a345bf92109b502b1eb403','asasasas',NULL,'m',1,NULL),('89e034a104404020ab78f9c9fd6e619f','rr34r34r',NULL,'a',3,NULL),('dbb96f12eb5743bba7563c527c35bc3b','4r4r32r23','2019-12-31','o',4,2);
/*!40000 ALTER TABLE `catalog_bookinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_genre`
--

DROP TABLE IF EXISTS `catalog_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_genre`
--

LOCK TABLES `catalog_genre` WRITE;
/*!40000 ALTER TABLE `catalog_genre` DISABLE KEYS */;
INSERT INTO `catalog_genre` VALUES (1,'Fantasy'),(2,'Science fiction'),(3,'Travel'),(4,'fiction');
/*!40000 ALTER TABLE `catalog_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_language`
--

DROP TABLE IF EXISTS `catalog_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_language`
--

LOCK TABLES `catalog_language` WRITE;
/*!40000 ALTER TABLE `catalog_language` DISABLE KEYS */;
INSERT INTO `catalog_language` VALUES (1,'Русский'),(2,'English');
/*!40000 ALTER TABLE `catalog_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-12-26 19:25:37.330090','1','Беляев, Александр',1,'[{\"added\": {}}]',9,1),(2,'2019-12-26 19:25:58.295244','1','Fantasy',1,'[{\"added\": {}}]',8,1),(3,'2019-12-26 19:26:07.016503','1','Русский',1,'[{\"added\": {}}]',11,1),(4,'2019-12-26 19:26:17.785300','1','Голова профессора Доуэля',1,'[{\"added\": {}}]',7,1),(5,'2019-12-26 19:26:47.287086','2','Science fiction',1,'[{\"added\": {}}]',8,1),(6,'2019-12-26 19:26:54.710923','2','Человек-Амфибия',1,'[{\"added\": {}}]',7,1),(7,'2019-12-26 19:27:17.938581','2','Стругацкие, Аркадий и Борис',1,'[{\"added\": {}}]',9,1),(8,'2019-12-26 19:27:33.020611','3','Трудно быть богом',1,'[{\"added\": {}}]',7,1),(9,'2019-12-26 19:28:12.756083','3','Defoe, Daniel',1,'[{\"added\": {}}]',9,1),(10,'2019-12-26 19:28:26.402124','3','Travel',1,'[{\"added\": {}}]',8,1),(11,'2019-12-26 19:28:33.061021','2','English',1,'[{\"added\": {}}]',11,1),(12,'2019-12-26 19:28:34.764526','4','Robinson Cruzo',1,'[{\"added\": {}}]',7,1),(13,'2019-12-26 19:37:29.078206','6f42820c-18a3-45bf-9210-9b502b1eb403','6f42820c-18a3-45bf-9210-9b502b1eb403 (Голова профессора Доуэля)',1,'[{\"added\": {}}]',10,1),(14,'2019-12-26 19:37:38.206081','6e9539cd-01d7-494d-aae8-02b9c402439d','6e9539cd-01d7-494d-aae8-02b9c402439d (Голова профессора Доуэля)',1,'[{\"added\": {}}]',10,1),(15,'2019-12-26 19:37:47.443487','3bada0cf-5bf1-4b8a-ac1b-4b2074ed6733','3bada0cf-5bf1-4b8a-ac1b-4b2074ed6733 (Человек-Амфибия)',1,'[{\"added\": {}}]',10,1),(16,'2019-12-26 19:39:14.643262','89e034a1-0440-4020-ab78-f9c9fd6e619f','89e034a1-0440-4020-ab78-f9c9fd6e619f (Трудно быть богом)',1,'[{\"added\": {}}]',10,1),(17,'2019-12-26 19:39:23.788421','3dca89ca-b3ff-4962-8ba7-7bb0c1a2a5d0','3dca89ca-b3ff-4962-8ba7-7bb0c1a2a5d0 (Трудно быть богом)',1,'[{\"added\": {}}]',10,1),(18,'2019-12-26 19:39:42.433680','369326d0-1ec7-4ea4-b47f-368c7806567c','369326d0-1ec7-4ea4-b47f-368c7806567c (Robinson Cruzo)',1,'[{\"added\": {}}]',10,1),(19,'2019-12-26 19:40:19.162526','dbb96f12-eb57-43bb-a756-3c527c35bc3b','dbb96f12-eb57-43bb-a756-3c527c35bc3b (Robinson Cruzo)',1,'[{\"added\": {}}]',10,1),(20,'2019-12-27 08:41:45.307615','4','fiction',1,'[{\"added\": {}}]',8,1),(21,'2019-12-27 08:42:26.314154','5','Тупая голова',1,'[{\"added\": {}}]',7,1),(22,'2019-12-30 11:16:31.582763','1','Library members',1,'[{\"added\": {}}]',3,1),(23,'2019-12-30 11:17:20.870800','2','user1',1,'[{\"added\": {}}]',4,1),(24,'2019-12-30 11:18:20.487845','2','user1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(25,'2019-12-30 12:35:23.312730','dbb96f12-eb57-43bb-a756-3c527c35bc3b','dbb96f12-eb57-43bb-a756-3c527c35bc3b (Robinson Cruzo)',2,'[{\"changed\": {\"fields\": [\"Status\", \"Borrower\"]}}]',10,1),(26,'2019-12-30 12:35:34.751967','369326d0-1ec7-4ea4-b47f-368c7806567c','369326d0-1ec7-4ea4-b47f-368c7806567c (Robinson Cruzo)',2,'[{\"changed\": {\"fields\": [\"Borrower\"]}}]',10,1),(27,'2019-12-30 13:01:30.131566','2','Librerian',1,'[{\"added\": {}}]',3,1),(28,'2019-12-30 13:01:54.431452','3','user2',1,'[{\"added\": {}}]',4,1),(29,'2019-12-30 13:02:21.028867','3','user2',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(30,'2019-12-30 13:39:55.038503','3dca89ca-b3ff-4962-8ba7-7bb0c1a2a5d0','3dca89ca-b3ff-4962-8ba7-7bb0c1a2a5d0 (Трудно быть богом)',2,'[{\"changed\": {\"fields\": [\"Status\", \"To be available\", \"Borrower\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'catalog','author'),(7,'catalog','book'),(10,'catalog','bookinstance'),(8,'catalog','genre'),(11,'catalog','language'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-25 19:08:10.338492'),(2,'auth','0001_initial','2019-12-25 19:08:12.573662'),(3,'admin','0001_initial','2019-12-25 19:08:18.235840'),(4,'admin','0002_logentry_remove_auto_add','2019-12-25 19:08:19.644975'),(5,'admin','0003_logentry_add_action_flag_choices','2019-12-25 19:08:19.691847'),(6,'contenttypes','0002_remove_content_type_name','2019-12-25 19:08:20.921727'),(7,'auth','0002_alter_permission_name_max_length','2019-12-25 19:08:21.618225'),(8,'auth','0003_alter_user_email_max_length','2019-12-25 19:08:21.822566'),(9,'auth','0004_alter_user_username_opts','2019-12-25 19:08:21.893820'),(10,'auth','0005_alter_user_last_login_null','2019-12-25 19:08:22.473452'),(11,'auth','0006_require_contenttypes_0002','2019-12-25 19:08:22.520341'),(12,'auth','0007_alter_validators_add_error_messages','2019-12-25 19:08:22.614066'),(13,'auth','0008_alter_user_username_max_length','2019-12-25 19:08:23.410884'),(14,'auth','0009_alter_user_last_name_max_length','2019-12-25 19:08:24.067503'),(15,'auth','0010_alter_group_name_max_length','2019-12-25 19:08:24.223743'),(16,'auth','0011_update_proxy_permissions','2019-12-25 19:08:24.301862'),(17,'sessions','0001_initial','2019-12-25 19:08:24.677048'),(18,'catalog','0001_initial','2019-12-26 18:37:13.090974'),(19,'catalog','0002_auto_20191226_2146','2019-12-26 18:46:20.097067'),(20,'catalog','0003_auto_20191230_1531','2019-12-30 12:31:50.923080'),(21,'catalog','0004_auto_20191230_1559','2019-12-30 12:59:58.852537');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ftpi3eow9af66hfzdw0eqfdz7n52mpa2','OTAzNDExOTRmNmIyNTFjODg3YWM1MWE1NDg4M2Y5NDZkMmY4ODczNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTY2NWU5OGZkYTdmN2IzMTgzODY2YjYyMjZiMzYwNDM1ZjliY2QxIn0=','2020-01-13 16:28:51.466174'),('xpq4eke2hi7s4pjm00itmx7r8ytu362z','OTAzNDExOTRmNmIyNTFjODg3YWM1MWE1NDg4M2Y5NDZkMmY4ODczNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YTY2NWU5OGZkYTdmN2IzMTgzODY2YjYyMjZiMzYwNDM1ZjliY2QxIn0=','2020-01-13 18:38:37.385233'),('xxr9s53bded7w6le08zuxkb8wbtcrr1c','NjNkMjZmYjJlODVjNmNlYmFlZDQwNjlkOGU2NTU5YjBiMWI1NWI5MTp7Im51bV92aXNpdHMiOjF9','2020-01-13 16:16:34.358584');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-31 11:03:51
