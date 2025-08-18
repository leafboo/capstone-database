-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.1

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
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Authors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaperReferences`
--

DROP TABLE IF EXISTS `PaperReferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaperReferences` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `APA` text NOT NULL,
  `IEEE` text NOT NULL,
  `WorkspaceId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WorkspaceId` (`WorkspaceId`),
  CONSTRAINT `PaperReferences_ibfk_1` FOREIGN KEY (`WorkspaceId`) REFERENCES `Workspaces` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ResearchPaperAuthors`
--

DROP TABLE IF EXISTS `ResearchPaperAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ResearchPaperAuthors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PaperId` int DEFAULT NULL,
  `AuthorId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PaperId` (`PaperId`),
  KEY `AuthorId` (`AuthorId`),
  CONSTRAINT `ResearchPaperAuthors_ibfk_1` FOREIGN KEY (`PaperId`) REFERENCES `ResearchPapers` (`Id`),
  CONSTRAINT `ResearchPaperAuthors_ibfk_2` FOREIGN KEY (`AuthorId`) REFERENCES `Authors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-18 10:10:10
