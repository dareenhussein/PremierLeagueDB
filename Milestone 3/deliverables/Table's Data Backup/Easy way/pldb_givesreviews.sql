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
-- Table structure for table `givesreviews`
--

DROP TABLE IF EXISTS `givesreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `givesreviews` (
  `Username` varchar(255) NOT NULL,
  `Rating` enum('1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `Text` varchar(1024) DEFAULT NULL,
  `Review_Date` date DEFAULT NULL,
  `Home_team` varchar(255) DEFAULT NULL,
  `Away_Team` varchar(255) DEFAULT NULL,
  `Match_Date` date DEFAULT NULL,
  PRIMARY KEY (`Username`),
  KEY `Match_Date` (`Match_Date`),
  CONSTRAINT `givesreviews_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `fan` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `givesreviews_ibfk_2` FOREIGN KEY (`Match_Date`) REFERENCES `matchs` (`Date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `givesreviews`
--

LOCK TABLES `givesreviews` WRITE;
/*!40000 ALTER TABLE `givesreviews` DISABLE KEYS */;
INSERT INTO `givesreviews` VALUES ('animats','3','Better than expected but yet not that best ','2022-08-16','Leeds','Southampton','2022-04-02'),('bflong','10','A very great match and the goalkeeper were better than expected','2021-01-05','Spurs','West Ham','2022-03-20'),('boftx','5','A very great match and the goalkeeper were better than expected','2021-07-12','Chelsea','Brentford','2022-04-02'),('cfhsoft','4','The match didn\'t go that well','2021-01-01','Burnley','Everton','2022-04-06'),('cumarana','6','The match didn\'t go that well','2021-01-03','Everton','Man Utd','2022-04-09'),('esokullu','2','The match didn\'t go that well','2020-02-01','Man Utd','Leicester','2022-04-02'),('facet','8','A very great match and the goalkeeper were better than expected','2022-04-20','Southampton','Chelsea','2022-04-09'),('falcao','1','Not the best premieum league ever','2022-08-16','Aston Villa','Spurs','2022-04-09'),('flavell','6','Not the best premieum league ever','2021-01-01','Wolves','Aston Villa','2022-04-02'),('gozer','3','I didn\'t like the players performance','2020-04-20','Burnley','Man City','2022-04-02'),('jessicajohnson','3','Not the best premieum league ever','2021-08-09','Newcastle','Wolves','2022-04-09'),('jfmulder','2','I didn\'t like the players performance','2021-02-01','Crystal Palace','Arsenal','2022-04-05'),('jonadab','5','Better than expected but yet not that best ','2020-02-05','Spurs','Newcastle','2022-04-03'),('leeashley','1','The match didn\'t go that well','2021-11-11','Brentford','West Ham','2022-04-10'),('lyonspeter','1','I didn\'t like the players performance','2022-03-03','Leicester','Crystal Palace','2022-04-10'),('melnik','7','A very great match and the goalkeeper were better than expected','2021-03-04','West Ham','Everton','2022-04-03'),('monica23','8','A very great match and the goalkeeper were better than expected','2022-01-04','Norwich','Burnley','2022-04-10'),('perezbilly','6','Better than expected but yet not that best ','2021-10-10','Man City','Liverpool','2022-04-10'),('rafasgj','9','Better than expected but yet not that best ','2022-07-12','Watford','Leeds','2022-04-09'),('sjmuir','7','I didn\'t like the players performance','2021-02-26','Arsenal','Brighton','2022-04-09'),('sriha','2','The match didn\'t go that well','2021-02-26','Brighton','Norwich','2022-04-02'),('storerm','4','I didn\'t like the players performance','2021-05-05','Leicester','Brentford','2022-03-20'),('uraeus','4','Not the best premieum league ever','2000-01-07','Liverpool','Watford','2022-04-02');
/*!40000 ALTER TABLE `givesreviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 23:58:13
