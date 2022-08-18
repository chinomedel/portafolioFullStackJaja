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
-- Table structure for table `capacitacion`
--

DROP TABLE IF EXISTS `capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacitacion` (
  `identificador` int NOT NULL AUTO_INCREMENT,
  `rutCliente` int NOT NULL,
  `dia` varchar(100) DEFAULT NULL,
  `hora` varchar(100) DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `duracion` varchar(100) DEFAULT NULL,
  `cantidadAsistentes` int DEFAULT NULL,
  `cantidad_asistentes` int DEFAULT NULL,
  `rut_cliente` int DEFAULT NULL,
  PRIMARY KEY (`identificador`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacitacion`
--

LOCK TABLES `capacitacion` WRITE;
/*!40000 ALTER TABLE `capacitacion` DISABLE KEYS */;
INSERT INTO `capacitacion` VALUES (1,12222,'Lunes','15:00','Valpo','2 horas',5,NULL,NULL),(2,6546,'Martes','16:00','Viña','2 horas',5,NULL,NULL),(8,3333,'Lunes','15:00','Valpo','2 horas',56,NULL,NULL),(10,3333,'MIércoles','19:00','valpo','15 minutos',55,NULL,NULL),(12,121212,'dwed','2000','pokpokp','32',321,NULL,NULL);
/*!40000 ALTER TABLE `capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_revision`
--

DROP TABLE IF EXISTS `check_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_revision` (
  `check_id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `estado_check` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_revision`
--

LOCK TABLES `check_revision` WRITE;
/*!40000 ALTER TABLE `check_revision` DISABLE KEYS */;
INSERT INTO `check_revision` VALUES (1,'Charla 5 minutos',1),(2,'Entrega documentos de accidentes',1),(3,'Reunión con Comité Paritario',1),(4,'Ingreso de accidentes',1);
/*!40000 ALTER TABLE `check_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pago`
--

DROP TABLE IF EXISTS `estado_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pago` (
  `estado_pago_id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`estado_pago_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pago`
--

LOCK TABLES `estado_pago` WRITE;
/*!40000 ALTER TABLE `estado_pago` DISABLE KEYS */;
INSERT INTO `estado_pago` VALUES (1,'Sin pagos'),(2,'Pago parcial'),(3,'Pagado');
/*!40000 ALTER TABLE `estado_pago` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `rutCliente` int NOT NULL,
  `estado_pago_id` int NOT NULL,
  `capacitacion_id` int NOT NULL,
  `monto` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `total_a_pagar` int NOT NULL,
  `pago_acumulado` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`pago_id`),
  KEY `pago_FK` (`capacitacion_id`),
  KEY `pago_FK_1` (`estado_pago_id`),
  CONSTRAINT `pago_FK` FOREIGN KEY (`capacitacion_id`) REFERENCES `capacitacion` (`identificador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,156,2,1,150000,'2022-05-15','Transferencia',800000,150000,1);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision` (
  `visita_id` int NOT NULL,
  `check_id` int NOT NULL,
  `check_flag` tinyint(1) NOT NULL DEFAULT '0',
  KEY `check_fk` (`check_id`),
  KEY `visita_fk` (`visita_id`),
  CONSTRAINT `check_fk` FOREIGN KEY (`check_id`) REFERENCES `check_revision` (`check_id`) ON DELETE RESTRICT,
  CONSTRAINT `visita_fk` FOREIGN KEY (`visita_id`) REFERENCES `visita` (`visita_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1),(1,2,1),(1,3,1),(2,1,1),(2,2,1),(2,3,1);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
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
  `id_usuario` int NOT NULL AUTO_INCREMENT,
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
  `disc_usuario` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','1234',55555555,'1980-01-28',42,1,999999999,'Nelson','Medel','10456456','Habitat','Isapre','Los placeres #790','Valparaiso','','','','1900-01-01',1,'2022-07-15 04:00:00',1),(2,'admin1','1234',222222,'1980-01-01',40,1,222222,'Nelson','Medel','56951377780','Capital','Fonasa','Los placeres #790','Valparaíso','','','','1900-01-01',1,'2022-07-15 04:00:00',1),(18,'administrador','1234',55555555,'2022-07-14',11,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RRHH','Poca',NULL,NULL,1,'2022-07-19 04:07:33',2),(21,'pamela','123',151515,'2022-07-14',15,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ventas','Mucha experiencia y trabajo duro',NULL,NULL,1,'2022-07-19 14:51:29',2),(22,'juan','123',151515,'1980-01-01',66,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vendedoraaaaaa','2022-07-12','Contador','2022-07-12',1,'2022-07-19 15:20:06',3),(23,'juanjose','123',464646,'2022-07-15',55,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Vendedor','2022-07-01',1,'2022-07-19 15:26:10',3),(24,'maria','123',123,'2022-07-14',22,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Contabilidad','Mucha',NULL,NULL,1,'2022-07-19 15:31:46',2),(25,'antonia','456',456,'2022-07-09',22,1,111111111,'antonia','medel','65464654','Capital','Fonasa','','',NULL,NULL,NULL,NULL,1,'2022-07-19 15:32:21',1),(31,'andres','123',1231231,'2022-08-12',55,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2022-08-09 21:34:26',1),(34,'dddddd','qwdqwd',123,'2022-09-01',33,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2022-08-09 23:00:57',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `visita_id` int NOT NULL AUTO_INCREMENT,
  `fecha_visita` varchar(100) NOT NULL,
  `id_usuario` int NOT NULL,
  `rut_empresa` int NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `direccion_empresa` varchar(200) NOT NULL,
  PRIMARY KEY (`visita_id`),
  KEY `usuario_fk` (`id_usuario`),
  CONSTRAINT `usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES (1,'2022-01-12',1,12123123,'Las Quintas','El salto #1555, el bosque, santiago'),(2,'2022-01-12',21,12123123,'Hostal Placeres','Los Placeres #55, Valparaíso'),(3,'2022-08-10',1,123,'Hostal Planeta','El granero 3755');
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-10 19:49:05
