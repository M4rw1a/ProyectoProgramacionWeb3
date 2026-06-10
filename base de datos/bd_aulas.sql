-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: reporte_aulas
-- ------------------------------------------------------
-- Server version	8.0.46

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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add seguimiento',10,'add_seguimiento'),(26,'Can change seguimiento',10,'change_seguimiento'),(27,'Can delete seguimiento',10,'delete_seguimiento'),(28,'Can view seguimiento',10,'view_seguimiento'),(29,'Can add incidencia',8,'add_incidencia'),(30,'Can change incidencia',8,'change_incidencia'),(31,'Can delete incidencia',8,'delete_incidencia'),(32,'Can view incidencia',8,'view_incidencia'),(33,'Can add aula',7,'add_aula'),(34,'Can change aula',7,'change_aula'),(35,'Can delete aula',7,'delete_aula'),(36,'Can view aula',7,'view_aula'),(37,'Can add perfil',9,'add_perfil'),(38,'Can change perfil',9,'change_perfil'),(39,'Can delete perfil',9,'delete_perfil'),(40,'Can view perfil',9,'view_perfil');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$sDHxf4oDtrVWmtXm8qvAFz$2nV1CqZo09jIF+WOAYsGbR+9O7Tjp8MzftulqOpCWwA=','2026-06-10 00:19:17.634356',1,'usuario','','','mariadelosangelesalvaradoavila@gmail.com',1,1,'2026-06-09 04:14:46.325719'),(2,'pbkdf2_sha256$1200000$Szi1uGolZhwRO9qhpUbCRU$W3j1YzDnq51llnJOrm3lU39jgOOWrJU5fJu7uUQ57fY=',NULL,0,'usuario2','','','',0,1,'2026-06-10 01:41:18.454172'),(3,'pbkdf2_sha256$1200000$OnKYvJTRnnyP4vwFKt247t$C+zbB07XtnfBvtiqivtpHdSopMGSoM3NY93klsyMc+4=',NULL,0,'usuario3','','','',0,1,'2026-06-10 01:42:13.405045'),(4,'pbkdf2_sha256$1200000$ES2aICvjVWHRBh37fbPN2F$RlOF18fOhvwQscvvsPGAaDxFWqwwxls/O12B5AlR3u4=',NULL,0,'usuario1','','','',0,1,'2026-06-10 01:42:51.795646');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-06-10 00:25:35.150183','1','ss-a1',1,'[{\"added\": {}}]',7,1),(2,'2026-06-10 00:27:46.936981','2','ss-a2',1,'[{\"added\": {}}]',7,1),(3,'2026-06-10 00:28:06.674320','3','ss-a3',1,'[{\"added\": {}}]',7,1),(4,'2026-06-10 00:28:21.017968','4','ss-a4',1,'[{\"added\": {}}]',7,1),(5,'2026-06-10 00:33:53.890037','5','pb-a1',1,'[{\"added\": {}}]',7,1),(6,'2026-06-10 00:35:38.775404','6','pb-a2',1,'[{\"added\": {}}]',7,1),(7,'2026-06-10 00:36:13.525267','7','p1-a3',1,'[{\"added\": {}}]',7,1),(8,'2026-06-10 00:38:03.053546','8','p1-a2',1,'[{\"added\": {}}]',7,1),(9,'2026-06-10 00:38:21.071722','9','p1-a1',1,'[{\"added\": {}}]',7,1),(10,'2026-06-10 00:39:44.167909','10','P3-L3',1,'[{\"added\": {}}]',7,1),(11,'2026-06-10 00:40:10.997788','11','P3-L2',1,'[{\"added\": {}}]',7,1),(12,'2026-06-10 00:40:37.581701','12','P3-L1',1,'[{\"added\": {}}]',7,1),(13,'2026-06-10 00:43:46.986541','13','P4-A1',1,'[{\"added\": {}}]',7,1),(14,'2026-06-10 00:44:30.023255','14','P4-A2',1,'[{\"added\": {}}]',7,1),(15,'2026-06-10 00:44:47.279333','15','P4-A3',1,'[{\"added\": {}}]',7,1),(16,'2026-06-10 00:45:10.865333','16','P4-L1',1,'[{\"added\": {}}]',7,1),(17,'2026-06-10 00:45:36.379369','17','P4-L2',1,'[{\"added\": {}}]',7,1),(18,'2026-06-10 00:47:46.777268','18','P5-A1',1,'[{\"added\": {}}]',7,1),(19,'2026-06-10 00:48:18.391790','19','P5-A2',1,'[{\"added\": {}}]',7,1),(20,'2026-06-10 00:48:41.265958','20','P5-A3',1,'[{\"added\": {}}]',7,1),(21,'2026-06-10 00:49:30.016131','21','P5-L1',1,'[{\"added\": {}}]',7,1),(22,'2026-06-10 00:50:00.683614','22','P5-L2',1,'[{\"added\": {}}]',7,1),(23,'2026-06-10 00:50:36.731109','23','P6-AU1',1,'[{\"added\": {}}]',7,1),(24,'2026-06-10 01:41:22.280101','2','usuario2',1,'[{\"added\": {}}]',4,1),(25,'2026-06-10 01:42:16.486824','3','usuario3',1,'[{\"added\": {}}]',4,1),(26,'2026-06-10 01:42:55.007768','4','usuario1',1,'[{\"added\": {}}]',4,1),(27,'2026-06-10 01:45:49.203697','1','usuario1 - ESTUDIANTE',1,'[{\"added\": {}}]',9,1),(28,'2026-06-10 01:46:25.523458','2','usuario2 - DOCENTE',1,'[{\"added\": {}}]',9,1),(29,'2026-06-10 01:46:43.560129','3','usuario3 - ADMINISTRADOR',1,'[{\"added\": {}}]',9,1),(30,'2026-06-10 01:48:50.954803','1','Incidencia 1',1,'[{\"added\": {}}]',8,1),(31,'2026-06-10 01:58:29.735725','2','Incidencia 2',1,'[{\"added\": {}}]',8,1),(32,'2026-06-10 01:59:06.565427','3','Incidencia 3',1,'[{\"added\": {}}]',8,1),(33,'2026-06-10 02:00:05.236489','1','Seguimiento 1',1,'[{\"added\": {}}]',10,1),(34,'2026-06-10 02:00:46.427996','2','Seguimiento 2',1,'[{\"added\": {}}]',10,1),(35,'2026-06-10 02:00:59.981552','3','Seguimiento 3',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'incidencias','aula'),(8,'incidencias','incidencia'),(9,'incidencias','perfil'),(10,'incidencias','seguimiento'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-09 02:50:25.510754'),(2,'auth','0001_initial','2026-06-09 02:50:38.990216'),(3,'admin','0001_initial','2026-06-09 02:50:42.101302'),(4,'admin','0002_logentry_remove_auto_add','2026-06-09 02:50:42.222811'),(5,'admin','0003_logentry_add_action_flag_choices','2026-06-09 02:50:42.338570'),(6,'contenttypes','0002_remove_content_type_name','2026-06-09 02:50:44.502511'),(7,'auth','0002_alter_permission_name_max_length','2026-06-09 02:50:45.734588'),(8,'auth','0003_alter_user_email_max_length','2026-06-09 02:50:45.990096'),(9,'auth','0004_alter_user_username_opts','2026-06-09 02:50:46.094392'),(10,'auth','0005_alter_user_last_login_null','2026-06-09 02:50:47.180722'),(11,'auth','0006_require_contenttypes_0002','2026-06-09 02:50:47.240110'),(12,'auth','0007_alter_validators_add_error_messages','2026-06-09 02:50:47.340013'),(13,'auth','0008_alter_user_username_max_length','2026-06-09 02:50:48.806128'),(14,'auth','0009_alter_user_last_name_max_length','2026-06-09 02:50:50.144840'),(15,'auth','0010_alter_group_name_max_length','2026-06-09 02:50:50.421082'),(16,'auth','0011_update_proxy_permissions','2026-06-09 02:50:50.522846'),(17,'auth','0012_alter_user_first_name_max_length','2026-06-09 02:50:51.778427'),(18,'sessions','0001_initial','2026-06-09 02:50:52.657605'),(19,'incidencias','0001_initial','2026-06-09 04:08:47.616610'),(20,'incidencias','0002_alter_aula_piso','2026-06-10 00:32:41.766991');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('50fx2mxouzjcsruyzwbkzsyg1wb486ui','.eJxVjEEKwyAQAP-y5yKVaNQce-8bZNdda9qiEJNT6N9LIIf2OjPMDhG3tcStyxJnhgk0XH4ZYXpJPQQ_sT6aSq2uy0zqSNRpu7o3lvftbP8GBXuBCQx5pEETY6CUMursdCBL6AZnOWBmEoOjy4mNWKPHqzfBe-sJxfiE8PkCH8U5Kg:1wX6f7:stt3wjA5i1JDvupVfm8P3CFp58qm_AU4Xs7rTa3zbe4','2026-06-24 00:19:17.809571'),('b45tf5w2w9vwn2dcutojzkt3cqvehnz1','.eJxVjEEKwyAQAP-y5yKVaNQce-8bZNdda9qiEJNT6N9LIIf2OjPMDhG3tcStyxJnhgk0XH4ZYXpJPQQ_sT6aSq2uy0zqSNRpu7o3lvftbP8GBXuBCQx5pEETY6CUMursdCBL6AZnOWBmEoOjy4mNWKPHqzfBe-sJxfiE8PkCH8U5Kg:1wWnv3:W3eIl-RVcJ-I_jWOPnc37hPxw0X8P2_AIA_pwxthH5Y','2026-06-23 04:18:29.997785');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias_aula`
--

DROP TABLE IF EXISTS `incidencias_aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias_aula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `piso` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias_aula`
--

LOCK TABLES `incidencias_aula` WRITE;
/*!40000 ALTER TABLE `incidencias_aula` DISABLE KEYS */;
INSERT INTO `incidencias_aula` VALUES (1,'ss-a1','AULA','subsuelo'),(2,'ss-a2','AULA','subsuelo'),(3,'ss-a3','AULA','subsuelo'),(4,'ss-a4','AULA','subsuelo'),(5,'pb-a1','AULA','Planta baja'),(6,'pb-a2','AULA','Planta baja'),(7,'p1-a3','AULA','piso 1'),(8,'p1-a2','AULA','piso 1'),(9,'p1-a1','AULA','piso 1'),(10,'P3-L3','LABORATORIO','piso 3'),(11,'P3-L2','LABORATORIO','piso 3'),(12,'P3-L1','LABORATORIO','piso 3'),(13,'P4-A1','AULA','piso 4'),(14,'P4-A2','AULA','piso 4'),(15,'P4-A3','AULA','piso 4'),(16,'P4-L1','LABORATORIO','piso 4'),(17,'P4-L2','LABORATORIO','piso 4'),(18,'P5-A1','AULA','piso 5'),(19,'P5-A2','AULA','piso 5'),(20,'P5-A3','AULA','piso 5'),(21,'P5-L1','AULA','piso 5'),(22,'P5-L2','LABORATORIO','piso 5'),(23,'P6-AU1','AUDITORIO','piso 6');
/*!40000 ALTER TABLE `incidencias_aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias_incidencia`
--

DROP TABLE IF EXISTS `incidencias_incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias_incidencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo_problema` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_reporte` datetime(6) NOT NULL,
  `aula_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `incidencias_incidencia_aula_id_b39b8797_fk_incidencias_aula_id` (`aula_id`),
  KEY `incidencias_incidencia_usuario_id_3be48ac5_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `incidencias_incidencia_aula_id_b39b8797_fk_incidencias_aula_id` FOREIGN KEY (`aula_id`) REFERENCES `incidencias_aula` (`id`),
  CONSTRAINT `incidencias_incidencia_usuario_id_3be48ac5_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias_incidencia`
--

LOCK TABLES `incidencias_incidencia` WRITE;
/*!40000 ALTER TABLE `incidencias_incidencia` DISABLE KEYS */;
INSERT INTO `incidencias_incidencia` VALUES (1,'COMPUTADORA','no inicia no enciende sepa dios','PENDIENTE','2026-06-10 01:48:50.838527',12,4),(2,'PROYECTOR','jsdiakdfvna','EN_PROCESO','2026-06-10 01:58:29.730953',7,2),(3,'CONECTIVIDAD','l,kjffnlisknf','RESUELTA','2026-06-10 01:59:06.561867',4,2);
/*!40000 ALTER TABLE `incidencias_incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias_perfil`
--

DROP TABLE IF EXISTS `incidencias_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `registro_ud` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registro_ud` (`registro_ud`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `incidencias_perfil_usuario_id_1f186baf_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias_perfil`
--

LOCK TABLES `incidencias_perfil` WRITE;
/*!40000 ALTER TABLE `incidencias_perfil` DISABLE KEYS */;
INSERT INTO `incidencias_perfil` VALUES (1,'12345','ESTUDIANTE',4),(2,'24680','DOCENTE',2),(3,'13579','ADMINISTRADOR',3);
/*!40000 ALTER TABLE `incidencias_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias_seguimiento`
--

DROP TABLE IF EXISTS `incidencias_seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias_seguimiento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comentario` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `incidencia_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `incidencias_seguimie_incidencia_id_debfe7de_fk_incidenci` (`incidencia_id`),
  CONSTRAINT `incidencias_seguimie_incidencia_id_debfe7de_fk_incidenci` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias_incidencia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias_seguimiento`
--

LOCK TABLES `incidencias_seguimiento` WRITE;
/*!40000 ALTER TABLE `incidencias_seguimiento` DISABLE KEYS */;
INSERT INTO `incidencias_seguimiento` VALUES (1,'un niño floto sobre mi y me apunto con su rasho laser','2026-06-10 02:00:05.234044',1),(2,'se quemo ya fue ya','2026-06-10 02:00:46.422995',2),(3,'quedo josha','2026-06-10 02:00:59.942402',3);
/*!40000 ALTER TABLE `incidencias_seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'reporte_aulas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-09 23:10:31
