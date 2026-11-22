/*M!999999\- enable the sandbox mode */
-- MariaDB dump 10.19-11.8.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Act002. Activitats d'un centre esportiu
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
-- Current Database: `Act002. Activitats d'un centre esportiu`
--

DROP DATABASE IF EXISTS `Act002. Activitats d'un centre esportiu`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Act002. Activitats d'un centre esportiu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Act002. Activitats d'un centre esportiu`;

--
-- Table structure for table `ACTIVITAT`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTIVITAT` (
  `codi_activitat` varchar(100) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `places_maximes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codi_activitat`),
  CONSTRAINT `ACTIVITAT_CHECK` CHECK (`places_maximes` > 0 and `places_maximes` < 31)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITAT`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ACTIVITAT` WRITE;
/*!40000 ALTER TABLE `ACTIVITAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVITAT` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `INSCRIPCIO`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSCRIPCIO` (
  `id_soci` int(11) unsigned NOT NULL,
  `id_sessio` int(11) unsigned NOT NULL,
  `data_inscripcio` date NOT NULL,
  `estat` varchar(50) NOT NULL,
  `assistencia` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_soci`,`id_sessio`),
  KEY `fk_inscripcio_sessio` (`id_sessio`),
  CONSTRAINT `fk_inscripcio_sessio` FOREIGN KEY (`id_sessio`) REFERENCES `SESSIO` (`id_sessio`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inscripcio_soci` FOREIGN KEY (`id_soci`) REFERENCES `SOCI` (`id_soci`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `INSCRIPCIO_CHECK` CHECK ('estat' in ('confirmada','llista_espera','cancel·lada'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSCRIPCIO`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `INSCRIPCIO` WRITE;
/*!40000 ALTER TABLE `INSCRIPCIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSCRIPCIO` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `SESSIO`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SESSIO` (
  `id_sessio` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_sessio` date NOT NULL,
  `hora_inici` time NOT NULL,
  `durada_minuts` int(10) unsigned NOT NULL,
  `sala` varchar(100) DEFAULT NULL,
  `codi_activitat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_sessio`),
  KEY `SESSIO_ACTIVITAT_FK` (`codi_activitat`),
  CONSTRAINT `SESSIO_ACTIVITAT_FK` FOREIGN KEY (`codi_activitat`) REFERENCES `ACTIVITAT` (`codi_activitat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `SESSIO_CHECK` CHECK (`durada_minuts` between 15 and 55)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
BD
--
-- Dumping data for table `SESSIO`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `SESSIO` WRITE;
/*!40000 ALTER TABLE `SESSIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SESSIO` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `SOCI`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOCI` (
  `id_soci` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `cognoms` varchar(100) DEFAULT NULL,
  `data_alta` date NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_soci`),
  UNIQUE KEY `SOCI_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOCI`
--
BD
SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `SOCI` WRITE;
/*!40000 ALTER TABLE `SOCI` DISABLE KEYS */;
/*!40000 ALTER TABLE `SOCI` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Dumping routines for database 'Act002. Activitats d'un centre esportiu'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-04 17:03:26