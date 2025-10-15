-- MySQL dump 10.13  Distrib 9.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `capstone`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `capstone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `capstone`;

--
-- Table structure for table `ResearchPapers`
--

DROP TABLE IF EXISTS `ResearchPapers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResearchPapers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `PublicationYear` year NOT NULL,
  `Keywords` text,
  `Abstract` text,
  `Methods` text,
  `Findings` text,
  `WorkspaceId` int DEFAULT NULL,
  `APA` text NOT NULL,
  `IEEE` text NOT NULL,
  `Authors` text NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkspaceId` (`WorkspaceId`),
  CONSTRAINT `ResearchPapers_ibfk_1` FOREIGN KEY (`WorkspaceId`) REFERENCES `Workspaces` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResearchPapers`
--

LOCK TABLES `ResearchPapers` WRITE;
/*!40000 ALTER TABLE `ResearchPapers` DISABLE KEYS */;
INSERT INTO `ResearchPapers` VALUES (9,'Machine Learning in Healthcare',2018,'AI, Machine Learning','Study of ML models for healthcare. I changed the abstract for this research paper. (Added extra info).','Supervised learning with trees.','Accuracy increased by 12%.',13,'Doe, J. (2018). Machine Learning in Healthcare. Journal of AI.','J. Doe, \'Machine Learning in Healthcare,\' Journal of AI, 2018.','John Doe, Jane Smith'),(11,'Cybersecurity Threat Detection',2017,'Cybersecurity, Threat Detection','Study of anomaly detection methods.','Machine learning with SVM.','Detected 87% of attacks.',13,'Harris, K., & Clark, L. (2017). Cybersecurity threat detection using machine learning. Journal of Information Security, 6(4), 201-214.','K. Harris and L. Clark, \"Cybersecurity Threat Detection Using Machine Learning,\" J. Inf. Security, vol. 6, no. 4, pp. 201-214, 2017.\n','Kevin Harris, Linda Clark');
/*!40000 ALTER TABLE `ResearchPapers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Salt` varchar(29) DEFAULT NULL,
  `Hash` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserName` (`UserName`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (14,'leafboo','dummyEmail@gmail.com','$2b$10$/v5GOOw2lN1xJZAt79See.','$2b$10$/v5GOOw2lN1xJZAt79See.bkf8Rq5JOQx4TT79ldptPyZrj/2.EEW');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workspaces`
--

DROP TABLE IF EXISTS `Workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Workspaces` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `DateCreated` date NOT NULL,
  `UserId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `Workspaces_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workspaces`
--

LOCK TABLES `Workspaces` WRITE;
/*!40000 ALTER TABLE `Workspaces` DISABLE KEYS */;
INSERT INTO `Workspaces` VALUES (13,'moon base','2025-10-03',14),(16,'new workspace','2025-10-14',14);
/*!40000 ALTER TABLE `Workspaces` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-14 14:43:17
