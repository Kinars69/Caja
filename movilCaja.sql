-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: movilCaja
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB-2ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aperturacaja`
--

DROP TABLE IF EXISTS `aperturacaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aperturacaja` (
  `idregistro` int(11) NOT NULL,
  `caja` int(11) DEFAULT NULL,
  `estacion` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL,
  `cierre` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `fechaapertura` date DEFAULT NULL,
  `estaciones_NumeroEstacion` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_aperturacaja_estaciones1_idx` (`estaciones_NumeroEstacion`),
  CONSTRAINT `fk_aperturacaja_estaciones1` FOREIGN KEY (`estaciones_NumeroEstacion`) REFERENCES `estaciones` (`NumeroEstacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aperturacaja`
--

LOCK TABLES `aperturacaja` WRITE;
/*!40000 ALTER TABLE `aperturacaja` DISABLE KEYS */;
INSERT INTO `aperturacaja` VALUES (1,1,1,'2022-07-25',1,500,'2022-07-25',1),(2,1,1,'2022-07-25',1,500,'2022-07-25',1);
/*!40000 ALTER TABLE `aperturacaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajas` (
  `estacion` int(11) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `cierrecaja_idregistro` int(11) NOT NULL,
  PRIMARY KEY (`estacion`),
  KEY `fk_cajas_cierrecaja1_idx` (`cierrecaja_idregistro`),
  CONSTRAINT `fk_cajas_cierrecaja1` FOREIGN KEY (`cierrecaja_idregistro`) REFERENCES `cierrecaja` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cierrecaja`
--

DROP TABLE IF EXISTS `cierrecaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cierrecaja` (
  `idregistro` int(11) NOT NULL,
  `caja` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `estacion` int(11) DEFAULT NULL,
  `apertura` int(11) DEFAULT NULL,
  `fechahora` date DEFAULT NULL,
  `efectivoreal` double DEFAULT NULL,
  `efectivosistema` double DEFAULT NULL,
  `tarjetadevolucionreal` double DEFAULT NULL,
  `tarjetamontoreal` double DEFAULT NULL,
  `tarjetamontosistema` double DEFAULT NULL,
  `ventasefectivo` double DEFAULT NULL,
  `ventastarjeta` double DEFAULT NULL,
  `egresos` double DEFAULT NULL,
  `propina` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `impuesto15` double DEFAULT NULL,
  `impuesto18` double DEFAULT NULL,
  `exento` double DEFAULT NULL,
  `fechacierre` date DEFAULT NULL,
  `aperturacaja_idregistro` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_cierrecaja_aperturacaja_idx` (`aperturacaja_idregistro`),
  CONSTRAINT `fk_cierrecaja_aperturacaja` FOREIGN KEY (`aperturacaja_idregistro`) REFERENCES `aperturacaja` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cierrecaja`
--

LOCK TABLES `cierrecaja` WRITE;
/*!40000 ALTER TABLE `cierrecaja` DISABLE KEYS */;
INSERT INTO `cierrecaja` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `cierrecaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denominacionmonedas`
--

DROP TABLE IF EXISTS `denominacionmonedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denominacionmonedas` (
  `idregistro` int(11) NOT NULL,
  `moneda` int(11) DEFAULT NULL,
  `denominacion` varchar(25) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `monedas_idregistro` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_denominacionmonedas_monedas1_idx` (`monedas_idregistro`),
  CONSTRAINT `fk_denominacionmonedas_monedas1` FOREIGN KEY (`monedas_idregistro`) REFERENCES `monedas` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denominacionmonedas`
--

LOCK TABLES `denominacionmonedas` WRITE;
/*!40000 ALTER TABLE `denominacionmonedas` DISABLE KEYS */;
INSERT INTO `denominacionmonedas` VALUES (1,1,'denominacion 1',25,'tipo1',1);
/*!40000 ALTER TABLE `denominacionmonedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_aperturacaja`
--

DROP TABLE IF EXISTS `detalle_aperturacaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_aperturacaja` (
  `idregistro` int(11) NOT NULL,
  `idapertura` int(11) DEFAULT NULL,
  `iddenominacion` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `aperturacaja_idregistro` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_detalle_aperturacaja_aperturacaja1_idx` (`aperturacaja_idregistro`),
  CONSTRAINT `fk_detalle_aperturacaja_aperturacaja1` FOREIGN KEY (`aperturacaja_idregistro`) REFERENCES `aperturacaja` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_aperturacaja`
--

LOCK TABLES `detalle_aperturacaja` WRITE;
/*!40000 ALTER TABLE `detalle_aperturacaja` DISABLE KEYS */;
INSERT INTO `detalle_aperturacaja` VALUES (1,1,1,1,1,1),(2,1,1,1,1,1),(3,1,1,4,500,1),(4,1,1,2,1000,2);
/*!40000 ALTER TABLE `detalle_aperturacaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_cierrecaja`
--

DROP TABLE IF EXISTS `detalle_cierrecaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_cierrecaja` (
  `idregistro` int(11) NOT NULL,
  `idcierre` int(11) DEFAULT NULL,
  `iddenominacion` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `detalle_aperturacaja_idregistro` int(11) NOT NULL,
  `denominacionmonedas_idregistro` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_detalle_cierrecaja_detalle_aperturacaja1_idx` (`detalle_aperturacaja_idregistro`),
  KEY `fk_detalle_cierrecaja_denominacionmonedas1_idx` (`denominacionmonedas_idregistro`),
  CONSTRAINT `fk_detalle_cierrecaja_denominacionmonedas1` FOREIGN KEY (`denominacionmonedas_idregistro`) REFERENCES `denominacionmonedas` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_cierrecaja_detalle_aperturacaja1` FOREIGN KEY (`detalle_aperturacaja_idregistro`) REFERENCES `detalle_aperturacaja` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_cierrecaja`
--

LOCK TABLES `detalle_cierrecaja` WRITE;
/*!40000 ALTER TABLE `detalle_cierrecaja` DISABLE KEYS */;
INSERT INTO `detalle_cierrecaja` VALUES (1,1,1,1,1,2,1),(3,1,1,1,1,1,1),(4,1,1,5,2000,1,1);
/*!40000 ALTER TABLE `detalle_cierrecaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecierrecajapos`
--

DROP TABLE IF EXISTS `detallecierrecajapos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallecierrecajapos` (
  `idregistro` int(11) NOT NULL,
  `idcierre` int(11) DEFAULT NULL,
  `idtipos` int(11) DEFAULT NULL,
  `devolucion` double DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `cierrecaja_idregistro` int(11) NOT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_detallecierrecajapos_cierrecaja1_idx` (`cierrecaja_idregistro`),
  CONSTRAINT `fk_detallecierrecajapos_cierrecaja1` FOREIGN KEY (`cierrecaja_idregistro`) REFERENCES `cierrecaja` (`idregistro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecierrecajapos`
--

LOCK TABLES `detallecierrecajapos` WRITE;
/*!40000 ALTER TABLE `detallecierrecajapos` DISABLE KEYS */;
INSERT INTO `detallecierrecajapos` VALUES (1,1,1,1,1,1),(2,2,2,500,1000,1),(3,1,1,1,1,1),(5,1,1,100,800,2);
/*!40000 ALTER TABLE `detallecierrecajapos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciones`
--

DROP TABLE IF EXISTS `estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estaciones` (
  `NumeroEstacion` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `vistaprevia` int(11) DEFAULT NULL,
  `tecladovirtual` int(11) DEFAULT NULL,
  `nombretipo` int(11) DEFAULT NULL,
  `nombreproducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumeroEstacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES (1,'Estacion 1',1,1,1,1,1);
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monedas`
--

DROP TABLE IF EXISTS `monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monedas` (
  `idregistro` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `simbolo` varchar(45) DEFAULT NULL,
  `cambio` double DEFAULT NULL,
  `nacional` int(11) DEFAULT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monedas`
--

LOCK TABLES `monedas` WRITE;
/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
INSERT INTO `monedas` VALUES (1,'Lempira','Moneda de Honduras','L',25,1),(2,'Dolar','Moneda Americana','$',24.5,0),(3,'Euro','Moneda europea','€',28.5,0);
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-29 18:08:32
