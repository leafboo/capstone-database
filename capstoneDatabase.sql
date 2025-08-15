-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.2

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
-- Table structure for table `ResearchPapers`
--

DROP TABLE IF EXISTS `ResearchPapers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResearchPapers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `YearOfPublication` year NOT NULL,
  `Keywords` text,
  `Abstract` text,
  `Methods` text,
  `Results` text,
  `WorkspacesIn` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResearchPapers`
--

LOCK TABLES `ResearchPapers` WRITE;
/*!40000 ALTER TABLE `ResearchPapers` DISABLE KEYS */;
INSERT INTO `ResearchPapers` VALUES (1,'Research on Philippine Education',2023,'Philippines, education, policy, learning outcomes','This study explores the current state of education in the Philippines, focusing on access, quality, and policy reforms over the past decade.','A mixed-methods approach was employed, combining statistical analysis of government education data with semi-structured interviews of educators.','Results indicate a persistent gap between rural and urban education quality, with policy reforms showing gradual but uneven improvements.',1),(2,'Research on Philippine Education',2024,'Philippines, curriculum reform, teacher training, student performance','This paper examines the effects of recent curriculum reforms in the Philippines, particularly the K-12 program, on student performance and teacher preparedness.','Quantitative analysis of national exam results was paired with surveys from over 500 teachers across various regions.','Findings show significant improvement in competency-based learning, though challenges remain in resource allocation and teacher training.',1);
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
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'leafboo','sampleEmail@gmail.com');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkspaceResearchPapers`
--

DROP TABLE IF EXISTS `WorkspaceResearchPapers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkspaceResearchPapers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `WorkspaceId` int NOT NULL,
  `PaperId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkspaceId` (`WorkspaceId`),
  KEY `PaperId` (`PaperId`),
  CONSTRAINT `WorkspaceResearchPapers_ibfk_1` FOREIGN KEY (`WorkspaceId`) REFERENCES `Workspaces` (`Id`),
  CONSTRAINT `WorkspaceResearchPapers_ibfk_2` FOREIGN KEY (`PaperId`) REFERENCES `ResearchPapers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkspaceResearchPapers`
--

LOCK TABLES `WorkspaceResearchPapers` WRITE;
/*!40000 ALTER TABLE `WorkspaceResearchPapers` DISABLE KEYS */;
INSERT INTO `WorkspaceResearchPapers` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `WorkspaceResearchPapers` ENABLE KEYS */;
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
  `NumberOfPapers` int DEFAULT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `Workspaces_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workspaces`
--

LOCK TABLES `Workspaces` WRITE;
/*!40000 ALTER TABLE `Workspaces` DISABLE KEYS */;
INSERT INTO `Workspaces` VALUES (1,'Research on Philippine Education','2025-08-14',2,1);
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

-- Dump completed on 2025-08-15  9:31:29
