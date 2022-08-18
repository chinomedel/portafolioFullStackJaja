CREATE DATABASE  IF NOT EXISTS `si_pr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `si_pr`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: si_pr
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_usuario` (
  `id_estado_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(59) NOT NULL,
  PRIMARY KEY (`id_estado_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
INSERT INTO `estado_usuario` VALUES (1,'Activo'),(2,'Bloqueado'),(3,'Eliminado');
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(59) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Cliente'),(2,'Administrativo'),(3,'Profesional');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `run` int NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `edadUsuario` int DEFAULT NULL,
  `tipoUsuario` int NOT NULL,
  `rutCliente` int DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `telefono` mediumtext,
  `afp` enum('Capital','Cuprum','Provida','PlanVital','Habitat','Uno','') DEFAULT NULL,
  `sistemaSalud` enum('Fonasa','Isapre','') DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `comuna` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `experienciaPrevia` text,
  `titulo` varchar(50) DEFAULT NULL,
  `fechaDeIngreso` date DEFAULT NULL,
  `estado` int NOT NULL,
  `fechaCreacion` timestamp NULL DEFAULT ((now() + interval 1 hour)),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','1234',55555555,'1980-01-28',42,1,999999999,'Nelson','Medel','10456456','Habitat','Isapre','Los placeres #790','Valparaiso','','','','1900-01-01',1,'2022-07-15 04:00:00'),(2,'admin1','1234',222222,'1980-01-01',40,1,222222,'Nelson','Medel','56951377780','Capital','Fonasa','Los placeres #790','Valparaíso','','','','1900-01-01',1,'2022-07-15 04:00:00'),(18,'administrador','1234',55555555,'2022-07-14',11,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RRHH','Poca',NULL,NULL,1,'2022-07-19 04:07:33'),(21,'pamela','123',151515,'2022-07-14',15,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ventas','Mucha experiencia y trabajo duro',NULL,NULL,1,'2022-07-19 14:51:29'),(22,'juan','123',151515,'1980-01-01',66,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vendedoraaaaaa','2022-07-12','Contador','2022-07-12',1,'2022-07-19 15:20:06'),(23,'juanjose','123',464646,'2022-07-15',55,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Vendedor','2022-07-01',1,'2022-07-19 15:26:10'),(24,'maria','123',123,'2022-07-14',22,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Contabilidad','Mucha',NULL,NULL,1,'2022-07-19 15:31:46'),(25,'antonia','456',456,'2022-07-09',22,1,111111111,'antonia','medel','65464654','Capital','Fonasa','','',NULL,NULL,NULL,NULL,1,'2022-07-19 15:32:21'),(26,'ani','123',333333333,'2022-07-15',44,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Contadora','2022-07-13','Vendedor','2022-07-01',1,'2022-07-19 15:38:06');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-19 12:59:34
