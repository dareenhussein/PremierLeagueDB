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
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `Name` varchar(255) NOT NULL,
  `ClubName` varchar(255) NOT NULL,
  `Attendance` int unsigned DEFAULT NULL,
  `BuildingDate` int unsigned DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `District` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Capacity` int unsigned DEFAULT NULL,
  `PitchSize` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `ClubName` (`ClubName`),
  CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`ClubName`) REFERENCES `club` (`Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES ('Amex Stadium','Brighton',30565,2011,'American Express Community Stadium, Village Way','BN1 9BL','Brighton',30666,'105m x 68m'),('Anfield','Liverpool',53292,1884,'Anfield, Anfield Road','L4 0TH','Liverpool',53394,'101m x 68m'),('Brentford Community Stadium','Brentford',NULL,2020,'Brentford Community Stadium, Lionel Road South','TW8 0RU','Brentford',17250,'105m x 68m'),('Carrow Road','Norwich',NULL,1935,'Carrow Road','NR1 1JE','Norwich',27359,'104m x 68m'),('Elland Road','Leeds',NULL,1897,'Elland Road','LS11 0ES','Leeds',37890,'106m x 69m'),('Emirates Stadium','Arsenal',60161,2006,'Highbury House, 75 Drayton Park','N5 1BU','London',60260,'105m x 68m'),('Etihad Stadium','Man City',54693,2002,'Etihad Stadium, Etihad Campus','M11 3FF','Manchester',55017,'105m x 68m'),('Goodison Park','Everton',40552,1892,'Goodison Park, Goodison Road','L4 4EL','Liverpool',39221,'100.48m x 68m'),('King Power Stadium','Leicester',32242,2002,'King Power Stadium, Filbert Way','LE2 7FL','Leicester',32273,'105m x 68m'),('London Stadium','West Ham',59946,2011,'London Stadium, Queen Elizabeth Olympic Park','E20 2ST','London',60000,'105m x 68m'),('Molineux Stadium','Wolves',31322,1889,'Molineux Stadium, Waterloo Rd','WV1 4QR','Wolverhampton',32050,'105m x 68m'),('Old Trafford','Man Utd',76098,1909,'Sir Matt Busby Way, Old Trafford','M16 0RA','Manchester',74879,'105m x 68m'),('Selhurst Park','Crystal Palace',30115,1924,'Selhurst Park Stadium, Holmesdale Road','SE25 6PU','London',25486,'101m x 68m'),('St. James\' Park','Newcastle',52490,1892,'St. James\' Park, Strawberry Place','NE1 4ST','Newcastle Upon Tyne',52305,'105m x 68m'),('St. Mary\'s Stadium','Southampton',32151,2001,'St Mary\'s Stadium, Britannia Road','SO14 5FP','Southampton',32384,'105m x 68m'),('Stamford Bridge','Chelsea',42332,1877,'Stamford Bridge, Fulham Road','SW6 1HS','London',40853,'103m x 67.5m'),('Tottenham Hotspur Stadium','Spurs',NULL,2019,' Lilywhite House, 782 High Road, Tottenham','N17 0BX','London',62062,'100m x 67m'),('Turf Moor','Burnley',21870,1883,' Turf Moor, Harry Potts Way, Burnley','BB10 4BX','Lancashire',21944,'105m x 68m'),('Vicarage Road','Watford',21590,1922,'Vicarage Road Stadium, Watford','WD18 0ER','Hertfordshire',21000,'105m x 68m'),('Villa Park','Aston Villa',NULL,1897,'Villa Park, Trinity Road','B6 6HE','Birmingham',42682,'105m x 68m');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
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
