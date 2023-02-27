CREATE DATABASE  IF NOT EXISTS `joy_bundler_names_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `joy_bundler_names_schema`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: joy_bundler_names_schema
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `names` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `baby_name` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `meaning` varchar(255) NOT NULL,
  `origin` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `votes` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKltnryc3v06behg68clt7j2y0r` (`user_id`),
  CONSTRAINT `FKltnryc3v06behg68clt7j2y0r` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names`
--

LOCK TABLES `names` WRITE;
/*!40000 ALTER TABLE `names` DISABLE KEYS */;
INSERT INTO `names` VALUES (1,'Peter Parker','2023-02-22 10:50:20.029000','Male','pretty cool','Spiderman',NULL,NULL,1),(2,'Tony Stark','2023-02-22 10:50:30.330000','Male','Pretty Smart','Iron Man Movie','2023-02-22 10:50:42.620000',NULL,1),(3,'Wanda','2023-02-22 10:52:13.415000','Female','magical','Scarlet Wtich ',NULL,NULL,2),(4,'111','2023-02-22 10:52:25.662000','Neutral','2222','1111','2023-02-22 10:54:28.429000',NULL,2),(8,'Wanda1','2023-02-22 11:01:02.593000','Female','111','111',NULL,NULL,2);
/*!40000 ALTER TABLE `names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-02-22 10:50:10.266000','111@111.com','$2a$10$I/lbzN.rJUNA3Mwefo5cVu3JQOmLChvdCNrCwkXLWwDQwyz9F/qfG',NULL,'John'),(2,'2023-02-22 10:50:57.939000','222@222.com','$2a$10$NdMw4lCYNU6BqhD/MQ1bBee9gr0amXQvCOZqRf9L9Da7o0E4aayuC',NULL,'Mary'),(3,'2023-02-22 10:58:21.392000','333@333.com','$2a$10$9O.i2dzqymde.vckFDPH4e6jKEwMVH9wqzQzYzgRUVbDivcPbQw9u',NULL,'BoWang');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `user_id` bigint NOT NULL,
  `name_id` bigint NOT NULL,
  KEY `FKnreiyxt2pxtq59aus0eofjxas` (`name_id`),
  KEY `FKli4uj3ic2vypf5pialchj925e` (`user_id`),
  CONSTRAINT `FKli4uj3ic2vypf5pialchj925e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKnreiyxt2pxtq59aus0eofjxas` FOREIGN KEY (`name_id`) REFERENCES `names` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,1),(2,1),(3,3);
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-22 20:12:33
