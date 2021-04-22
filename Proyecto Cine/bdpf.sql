-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectolleno
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asiento` (
  `idasiento` int(11) NOT NULL,
  `fila` varchar(1) DEFAULT NULL,
  `col` int(11) DEFAULT NULL,
  PRIMARY KEY (`idasiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,'A',1),(2,'A',2),(3,'A',3),(4,'A',4),(5,'A',5),(6,'A',6),(7,'B',1),(8,'B',2),(9,'B',3),(10,'B',4),(11,'B',5),(12,'B',6),(13,'C',1),(14,'C',2),(15,'C',3),(16,'C',4),(17,'C',5),(18,'C',6),(19,'D',1),(20,'D',2),(21,'D',3),(22,'D',4),(23,'D',5),(24,'D',6);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `boleto` (
  `idboleto` int(11) NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `idasiento` int(11) DEFAULT NULL,
  `idfuncion` int(11) DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  `notaquilla` int(11) DEFAULT NULL,
  PRIMARY KEY (`idboleto`),
  KEY `idasiento` (`idasiento`),
  KEY `idfuncion` (`idfuncion`),
  KEY `idventa` (`idventa`),
  KEY `notaquilla` (`notaquilla`),
  CONSTRAINT `boleto_ibfk_1` FOREIGN KEY (`idasiento`) REFERENCES `asiento` (`idasiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boleto_ibfk_2` FOREIGN KEY (`idfuncion`) REFERENCES `funcion` (`idfuncion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boleto_ibfk_3` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boleto_ibfk_4` FOREIGN KEY (`notaquilla`) REFERENCES `taquilla` (`notaquilla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidor`
--

DROP TABLE IF EXISTS `distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `distribuidor` (
  `idDistribuidor` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `tel` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idDistribuidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidor`
--

LOCK TABLES `distribuidor` WRITE;
/*!40000 ALTER TABLE `distribuidor` DISABLE KEYS */;
INSERT INTO `distribuidor` VALUES (1,'Walt Disney',' 500 S. Buena Vista StreetBurbank, California (United States)','85601000'),(2,'Summit intertainment','Santa Monica, California','08284132'),(3,'Paramount Picture','5555 melrose avenue Hollywood California','520211'),(4,'Warner Bros','Warner Blvd 4000 Burbank California','91777289'),(5,'20th Century Fox','Century City Los Angeles California','03691000'),(6,'Screen Gems','Culver city California','05455871');
/*!40000 ALTER TABLE `distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dulceria`
--

DROP TABLE IF EXISTS `dulceria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dulceria` (
  `nodulceria` int(11) NOT NULL,
  `idempleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`nodulceria`),
  KEY `idempleado` (`idempleado`),
  CONSTRAINT `dulceria_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dulceria`
--

LOCK TABLES `dulceria` WRITE;
/*!40000 ALTER TABLE `dulceria` DISABLE KEYS */;
INSERT INTO `dulceria` VALUES (1,2),(2,5);
/*!40000 ALTER TABLE `dulceria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ap` varchar(30) DEFAULT NULL,
  `am` varchar(30) DEFAULT NULL,
  `contraseña` varchar(20) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Eli','Sanchez','Martinez','1234','Matutino'),(2,'Jose','Pazaran','Alvarez','1234','Vespertino'),(3,'Edgar','Poblano','Diaz','1234','Vespertino'),(4,'Brando Jared','Alcantara','Borreguin','1234','matutino'),(5,'Edna','Rosales','Valdez','0099','Matutino');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcion` (
  `idFuncion` int(11) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFuncion`),
  KEY `nombre` (`nombre`),
  KEY `numero` (`numero`),
  CONSTRAINT `funcion_ibfk_1` FOREIGN KEY (`nombre`) REFERENCES `pelicula` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funcion_ibfk_2` FOREIGN KEY (`numero`) REFERENCES `sala` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (1,'03-11-18','12:50','Animales Fantasticos',1),(2,'03-11-18','15:50','Animales Fantasticos',1),(3,'03-11-18','18:50','Animales Fantasticos',1),(4,'03-11-18','21:50','Animales Fantasticos',1),(5,'04-11-18','12:50','Animales Fantasticos',1),(6,'04-11-18','15:50','Animales Fantasticos',1),(7,'04-11-18','18:50','Animales Fantasticos',1),(8,'04-11-18','21:50','Animales Fantasticos',1),(9,'05-11-18','12:50','Animales Fantasticos',1),(10,'05-11-18','15:50','Animales Fantasticos',1),(11,'05-11-18','18:50','Animales Fantasticos',1),(12,'05-11-18','21:50','Animales Fantasticos',1),(13,'06-11-18','12:50','Animales Fantasticos',1),(14,'06-11-18','15:50','Animales Fantasticos',1),(15,'06-11-18','18:50','Animales Fantasticos',1),(16,'06-11-18','21:50','Animales Fantasticos',1),(17,'07-11-18','12:50','Animales Fantasticos',1),(18,'07-11-18','15:50','Animales Fantasticos',1),(19,'07-11-18','18:50','Animales Fantasticos',1),(20,'07-11-18','21:50','Animales Fantasticos',1),(21,'03-11-18','13:50','Animales Fantasticos',2),(22,'03-11-18','16:50','Animales Fantasticos',2),(23,'03-11-18','19:50','Animales Fantasticos',2),(24,'03-11-18','22:50','Animales Fantasticos',2),(25,'04-11-18','13:50','Animales Fantasticos',2),(26,'04-11-18','16:50','Animales Fantasticos',2),(27,'04-11-18','19:50','Animales Fantasticos',2),(28,'04-11-18','22:50','Animales Fantasticos',2),(29,'04-11-18','13:50','Animales Fantasticos',2),(30,'04-11-18','16:50','Animales Fantasticos',2),(31,'04-11-18','19:50','Animales Fantasticos',2),(32,'04-11-18','22:50','Animales Fantasticos',2),(33,'05-11-18','13:50','Animales Fantasticos',2),(34,'05-11-18','16:50','Animales Fantasticos',2),(35,'05-11-18','19:50','Animales Fantasticos',2),(36,'05-11-18','22:50','Animales Fantasticos',2),(37,'06-11-18','13:50','Animales Fantasticos',2),(38,'06-11-18','16:50','Animales Fantasticos',2),(39,'06-11-18','19:50','Animales Fantasticos',2),(40,'06-11-18','22:50','Animales Fantasticos',2),(41,'07-11-18','13:50','Animales Fantasticos',2),(42,'07-11-18','16:50','Animales Fantasticos',2),(43,'07-11-18','19:50','Animales Fantasticos',2),(44,'07-11-18','22:50','Animales Fantasticos',2),(45,'03-11-18','12:00','Bohemian Rhapsody',3),(46,'03-11-18','15:00','Bohemian Rhapsody',3),(47,'03-11-18','18:00','Bohemian Rhapsody',3),(48,'03-11-18','21:00','Bohemian Rhapsody',3),(49,'04-11-18','12:00','Bohemian Rhapsody',3),(50,'04-11-18','15:00','Bohemian Rhapsody',3),(51,'04-11-18','18:00','Bohemian Rhapsody',3),(52,'04-11-18','21:00','Bohemian Rhapsody',3),(53,'05-11-18','12:00','Bohemian Rhapsody',3),(54,'05-11-18','15:00','Bohemian Rhapsody',3),(55,'05-11-18','18:00','Bohemian Rhapsody',3),(56,'05-11-18','21:00','Bohemian Rhapsody',3),(57,'06-11-18','12:00','Bohemian Rhapsody',3),(58,'06-11-18','15:00','Bohemian Rhapsody',3),(59,'06-11-18','18:00','Bohemian Rhapsody',3),(60,'06-11-18','21:00','Bohemian Rhapsody',3),(61,'07-11-18','12:00','Bohemian Rhapsody',3),(62,'07-11-18','15:00','Bohemian Rhapsody',3),(63,'07-11-18','18:00','Bohemian Rhapsody',3),(64,'07-11-18','21:00','Bohemian Rhapsody',3),(65,'03-11-18','13;10','Robin Hood',4),(66,'03-11-18','16:10','Robin Hood',4),(67,'03-11-18','19;10','Robin Hood',4),(68,'03-11-18','22;10','Robin Hood',4),(69,'04-11-18','13;10','Robin Hood',4),(70,'04-11-18','16:10','Robin Hood',4),(71,'04-11-18','19;10','Robin Hood',4),(72,'04-11-18','22;10','Robin Hood',4),(73,'05-11-18','13;10','Robin Hood',4),(74,'05-11-18','16:10','Robin Hood',4),(75,'05-11-18','19;10','Robin Hood',4),(76,'05-11-18','22;10','Robin Hood',4),(77,'06-11-18','13;10','Robin Hood',4),(78,'06-11-18','16:10','Robin Hood',4),(79,'06-11-18','19;10','Robin Hood',4),(80,'06-11-18','22;10','Robin Hood',4),(81,'07-11-18','13;10','Robin Hood',4),(82,'07-11-18','16:10','Robin Hood',4),(83,'07-11-18','19;10','Robin Hood',4),(84,'07-11-18','22;10','Robin Hood',4),(85,'03-11-18','12:00','Familia al Instante',5),(86,'03-11-18','15:00','Deadpool 2',5),(87,'03-11-18','19:00','Familia al instante',5),(88,'03-11-18','22:00','Cadaver',5),(89,'04-11-18','12:00','Familia al Instante',5),(90,'04-11-18','15:00','Deadpool 2',5),(91,'04-11-18','19:00','Familia al instante',5),(92,'04-11-18','22:00','Cadaver',5),(93,'05-11-18','12:00','Familia al Instante',5),(94,'05-11-18','15:00','Deadpool 2',5),(95,'05-11-18','19:00','Familia al instante',5),(96,'05-11-18','22:00','Cadaver',5),(97,'06-11-18','12:00','Familia al Instante',5),(98,'06-11-18','15:00','Deadpool 2',5),(99,'06-11-18','19:00','Familia al instante',5),(100,'06-11-18','22:00','Cadaver',5),(101,'07-11-18','12:00','Familia al Instante',5),(102,'07-11-18','15:00','Deadpool 2',5),(103,'07-11-18','19:00','Familia al instante',5),(104,'07-11-18','22:00','Cadaver',5),(105,'03-11-18','12:00','Wifi Ralph',6),(106,'03-11-18','15:00','Wifi Ralph',6),(107,'03-11-18','18:00','Wifi Ralph',6),(108,'03-11-18','21:00','Wifi Ralph',6),(109,'04-11-18','12:00','Wifi Ralph',6),(110,'04-11-18','15:00','Wifi Ralph',6),(111,'04-11-18','18:00','Wifi Ralph',6),(112,'04-11-18','21:00','Wifi Ralph',6),(113,'05-11-18','12:00','Wifi Ralph',6),(114,'05-11-18','15:00','Wifi Ralph',6),(115,'05-11-18','18:00','Wifi Ralph',6),(116,'05-11-18','21:00','Wifi Ralph',6),(117,'06-11-18','12:00','Wifi Ralph',6),(118,'06-11-18','15:00','Wifi Ralph',6),(119,'06-11-18','18:00','Wifi Ralph',6),(120,'06-11-18','21:00','Wifi Ralph',6),(121,'07-11-18','12:00','Wifi Ralph',6),(122,'07-11-18','15:00','Wifi Ralph',6),(123,'07-11-18','18:00','Wifi Ralph',6),(124,'07-11-18','21:00','Wifi Ralph',6);
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `nodulceria` int(11) DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `idproducto` (`idproducto`),
  KEY `nodulceria` (`nodulceria`),
  KEY `idventa` (`idventa`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`nodulceria`) REFERENCES `dulceria` (`nodulceria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pelicula` (
  `nombre` varchar(50) NOT NULL,
  `fechaEstreno` varchar(8) DEFAULT NULL,
  `fechaSalida` varchar(8) DEFAULT NULL,
  `duracion` varchar(10) DEFAULT NULL,
  `clasificacion` varchar(3) DEFAULT NULL,
  `género` varchar(20) DEFAULT NULL,
  `idDistribuidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `idDistribuidor` (`idDistribuidor`),
  CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`idDistribuidor`) REFERENCES `distribuidor` (`iddistribuidor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES ('Animales Fantasticos','15-11-18','20-12-18','2hr 14min','B','Aventura',4),('Bohemian Rhapsody','24-10-18','01-01-19','2hr 14min','B','Drama',5),('Cadaver','30-11-18','30-12-18','1hr 26min','B15','Terror',6),('Deadpool 2','18-07-18','07-12-18','1hr 59min','B15','Accion',5),('Familia al Instante','16-11-18','27-1-19','1hr 59 min','B','Comedia',3),('Robin Hood','21-11-18','27-01-19','2hr 20 min','AA','Accion',2),('Wifi Ralph','22-11-18','22-02-19','1hr 56 min','AA','Animacion',1);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `qtyInventario` int(11) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `idproveedor` (`idproveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Hershey\'s Blanco',34.5,4,1),(2,'Palomitas',47,50,2),(3,'Refresco',41.5,50,3);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `tel` varchar(8) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Hershey\'s Mexico','09569964','CARR. GUADALAJARA - EL CASTILLO KM 8.05 C.P. 45680 EL SALTO, JALISCO'),(2,'Act ii Mexico','01112547',' 20 de Noviembre E Izazaga 99, Centro, 06000 Ciudad de M├®xico, CDMX'),(3,'Coca-cola','15195000','Polanco, Polanco V Secc, 11560 Ciudad de M├®xico, CDMX');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sala` (
  `numero` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `noAsientos` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'3D',24),(2,'Extreme',24),(3,'normal',24),(4,'normal',24),(5,'normal',24),(6,'kids',24);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taquilla`
--

DROP TABLE IF EXISTS `taquilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taquilla` (
  `notaquilla` int(11) NOT NULL,
  `idempleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`notaquilla`),
  KEY `idempleado` (`idempleado`),
  CONSTRAINT `taquilla_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taquilla`
--

LOCK TABLES `taquilla` WRITE;
/*!40000 ALTER TABLE `taquilla` DISABLE KEYS */;
INSERT INTO `taquilla` VALUES (1,1),(2,3),(3,4);
/*!40000 ALTER TABLE `taquilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  KEY `idempleado` (`idempleado`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-01 23:56:33
