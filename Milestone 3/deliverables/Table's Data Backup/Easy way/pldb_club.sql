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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `Name` varchar(255) NOT NULL,
  `HomeStadium` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('Arsenal','Emirates Stadium','https://www.arsenal.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Aston Villa','Villa Park','https://www.avfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Barnsley','Oakwell',NULL),('Birmingham City','St. Andrew\'s Trillion Trophy Stadium',NULL),('Blackburn Rovers','Ewood Park',NULL),('Blackpool','Bloomfield Road',NULL),('Bolton Wanderers','University of Bolton Stadium',NULL),('Bournemouth','Vitality Stadium','http://www.afcb.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Bradford City','Valley Parade',NULL),('Brentford','Brentford Community Stadium','https://www.brentfordfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Brighton','Amex Stadium','https://www.brightonandhovealbion.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Burnley','Turf Moor','http://www.burnleyfootballclub.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Cardiff','Cardiff City Stadium','http://www.cardiffcityfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Charlton Athletic','The Valley',NULL),('Chelsea','Stamford Bridge','https://www.chelseafc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Coventry City','Highfield Road',NULL),('Crystal Palace','Selhurst Park','http://www.cpfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Derby County','Pride Park Stadium',NULL),('Everton','Goodison Park','http://www.evertonfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Fulham','Craven Cottage','http://www.fulhamfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Huddersfield','John Smith\'s Stadium','https://www.htafc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Hull City','KCOM Stadium','http://www.hullcitytigers.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Ipswich Town','Portman Road',NULL),('Lech Poznan',NULL,'https://www.lechpoznan.pl/'),('Leeds','Elland Road','http://www.leedsunited.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Leicester','King Power Stadium','http://www.lcfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Liverpool','Anfield','http://www.liverpoolfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Man City','Etihad Stadium','http://www.mancity.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Man Utd','Old Trafford','http://www.manutd.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Middlesbrough','Riverside Stadium','http://www.mfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Newcastle','St. James\' Park','http://www.nufc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Norwich','Carrow Road','http://www.canaries.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Nottingham Forest','City Ground',NULL),('Oldham Athletic','Boundary Park',NULL),('Portsmouth','Fratton Park',NULL),('Queens Park Rangers','Loftus Road',NULL),('Reading','Madejski Stadium',NULL),('Sheffield Utd','Bramall Lane','http://www.sufc.co.uk/?utm_source=www.premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Sheffield Wednesday','Hillsborough',NULL),('Southampton','St. Mary\'s Stadium','https://www.southamptonfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Spurs','Tottenham Hotspur Stadium','http://www.tottenhamhotspur.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Stoke City','bet365 Stadium','http://www.stokecityfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Sunderland','Stadium of Light','http://www.safc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Swansea City','Liberty Stadium','http://www.swanseacity.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Swindon Town','County Ground',NULL),('Watford','Vicarage Road','https://www.watfordfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('West Brom','The Hawthorns','http://www.wba.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('West Ham','London Stadium','http://www.whufc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Wigan Athletic','DW Stadium',NULL),('Wimbledon','Selhurst Park',NULL),('Wolves','Molineux Stadium','http://www.wolves.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
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
