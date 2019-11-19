-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: supermercados
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `codigoSucursal` int(11) NOT NULL,
  `barrio` varchar(30) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codigoSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (101,'Belgrano','Blanco Encalada 1844'),(102,'Coghlan','Quesada 3657'),(103,'Villa Devoto','Chivilcoy 3900'),(104,'Villa Luro','Av Juan B Justo 8166'),(105,'Belgrano','Av Cabildo 1710'),(106,'Colegiales','Av Elcano 3345'),(107,'Caballito','Rosario 690'),(108,'Flores','Av Rivadavia 7324'),(109,'Parque Patricios','Av Caseros 3832'),(110,'Monserrat','Paseo Colon 568');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `nroTicket` int(11) NOT NULL,
  `codigoSucursal` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `montoTotal` float DEFAULT NULL,
  `medioDePago` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nroTicket`),
  KEY `codigoSucursal` (`codigoSucursal`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`codigoSucursal`) REFERENCES `sucursales` (`codigoSucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (6623,103,'2019-10-24',223.89,'Efectivo'),(6785,105,'2019-09-18',424,'Credito'),(6786,109,'2019-10-22',396.35,'Debito'),(6793,107,'2019-11-03',285,'Debito'),(6796,104,'2019-09-02',706,'Efectivo'),(6797,106,'2019-09-15',503,'Debito'),(6798,105,'2019-09-17',425,'Credito'),(6802,105,'2019-09-20',950,'Debito'),(6809,103,'2019-10-04',385,'Efectivo'),(6812,103,'2019-09-29',406,'Efectivo'),(6813,104,'2019-10-20',824.54,'Credito'),(6818,101,'2019-08-29',564.5,'Efectivo'),(6824,110,'2019-10-30',910,'Debito'),(6834,102,'2019-09-24',343.99,'Debito'),(6844,107,'2019-10-05',270.89,'Debito'),(6849,107,'2019-11-02',418,'Efectivo'),(6853,106,'2019-11-03',405,'Debito'),(6854,108,'2019-10-12',587,'Debito'),(6857,109,'2019-10-24',340,'Efectivo'),(6859,105,'2019-10-01',475,'Efectivo'),(6865,108,'2019-10-17',124.35,'Efectivo'),(6866,108,'2019-10-29',451,'Debito'),(6892,102,'2019-11-13',314,'Efectivo'),(6895,110,'2019-11-15',341.15,'Credito');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 18:09:17
