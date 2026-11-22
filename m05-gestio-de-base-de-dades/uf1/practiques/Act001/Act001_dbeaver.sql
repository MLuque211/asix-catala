/*M!999999\- enable the sandbox mode */
-- MariaDB dump 10.19-11.8.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Act001. Reserva de tutories
-- ------------------------------------------------------
-- Server version	11.8.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `Act001. Reserva de tutories`
--

DROP DATABASE IF EXISTS `Act001. Reserva de tutories`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Act001. Reserva de tutories` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Act001. Reserva de tutories`;

--
-- Table structure for table `ALUMNE`
--

DROP TABLE IF EXISTS `ALUMNE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALUMNE` (
  `id_alumne` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `cognoms` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alumne`),
  UNIQUE KEY `ALUMNE_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALUMNE`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ALUMNE` WRITE;
/*!40000 ALTER TABLE `ALUMNE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ALUMNE` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ASSIGNATURA`
--

DROP TABLE IF EXISTS `ASSIGNATURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSIGNATURA` (
  `codi_assignatura` varchar(100) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `nivell` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codi_assignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGNATURA`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ASSIGNATURA` WRITE;
/*!40000 ALTER TABLE `ASSIGNATURA` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSIGNATURA` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `RESERVA`
--

DROP TABLE IF EXISTS `RESERVA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESERVA` (
  `id_reserva` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_reserva` date NOT NULL,
  `hora_inici` time NOT NULL,
  `durada_minuts` int(10) unsigned NOT NULL,
  `canal` varchar(100) NOT NULL,
  `estat` varchar(100) NOT NULL,
  `codi_assignatura` varchar(100) DEFAULT NULL,
  `id_alumne` int(10) unsigned NOT NULL,
  `id_tutor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `RESERVA_ASSIGNATURA_FK` (`codi_assignatura`),
  KEY `RESERVA_ALUMNE_FK` (`id_alumne`),
  KEY `RESERVA_TUTOR_FK` (`id_tutor`),
  CONSTRAINT `RESERVA_ALUMNE_FK` FOREIGN KEY (`id_alumne`) REFERENCES `ALUMNE` (`id_alumne`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `RESERVA_ASSIGNATURA_FK` FOREIGN KEY (`codi_assignatura`) REFERENCES `ASSIGNATURA` (`codi_assignatura`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `RESERVA_TUTOR_FK` FOREIGN KEY (`id_tutor`) REFERENCES `TUTOR` (`id_tutor`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `RESERVA_CHECK` CHECK (`canal` in ('aula','videoconferencia')),
  CONSTRAINT `RESERVA_CHECK_1` CHECK (`estat` in ('pendent','confirmada','cancel·lada','realitzada'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVA`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `RESERVA` WRITE;
/*!40000 ALTER TABLE `RESERVA` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESERVA` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `TUTOR`
--

DROP TABLE IF EXISTS `TUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TUTOR` (
  `id_tutor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `modalitat_treball` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tutor`),
  UNIQUE KEY `TUTOR_UNIQUE` (`email`),
  CONSTRAINT `modalitat_treball` CHECK (`modalitat_treball` in ('presencial','remot'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TUTOR`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `TUTOR` WRITE;
/*!40000 ALTER TABLE `TUTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `TUTOR` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'Act001. Reserva de tutories'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-04 17:03:14