-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: pldb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `fan`
--

DROP TABLE IF EXISTS `fan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fan` (
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `ClubName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  KEY `ClubName` (`ClubName`),
  CONSTRAINT `fan_ibfk_1` FOREIGN KEY (`ClubName`) REFERENCES `club` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fan`
--

LOCK TABLES `fan` WRITE;
/*!40000 ALTER TABLE `fan` DISABLE KEYS */;
INSERT INTO `fan` VALUES ('animats','animats@live.com','M','1945-01-03','Blackpool'),('bflong','bflong@att.net','M','2022-08-16','Brentford'),('boftx','boftx@msn.com','M','1998-02-01','Norwich'),('cfhsoft','cfhsoft@optonline.net','F','2022-08-16','Leeds'),('cumarana','cumarana@icloud.com','M','1990-01-01','Everton'),('esokullu','esokullu@yahoo.ca','M','1930-04-20','Bournemouth'),('facet','facet@yahoo.com','F','1978-03-04','Huddersfield'),('falcao','falcao@yahoo.com','M','2000-01-07','Ipswich Town'),('flavell','flavell@live.com','F','1982-02-26','Bolton Wanderers'),('gozer','gozer@gmail.com','M','1990-01-01','Newcastle'),('jessicajohnson','aaronhopkins@hotmail.com','F','2022-08-16','Liverpool'),('jfmulder','jfmulder@comcast.net','F','1945-01-03','Leicester'),('jonadab','jonadab@msn.com','M','1930-04-20','Man City'),('leeashley','tamaramorrison@hotmail.com','M','1945-01-03','Chelsea'),('lyonspeter','deborah64@gmail.com','M','1982-02-26','Arsenal'),('melnik','melnik@optonline.net','F','1982-02-26','Liverpool'),('monica23','danny30@yahoo.com','M','1930-04-20','Liverpool'),('perezbilly','epetersen@yahoo.com','F','1988-07-12','Portsmouth'),('rafasgj','rafasgj@live.com','M','1980-02-05','Hull City'),('sjmuir','sjmuir@me.com','F','1998-02-01','Fulham'),('sriha','sriha@yahoo.com','M','2022-08-16','Middlesbrough'),('storerm','storerm@optonline.net','M','1988-07-12','Bradford City'),('uraeus','uraeus@optonline.net','M','1988-07-12','Man Utd');
/*!40000 ALTER TABLE `fan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 23:58:12
