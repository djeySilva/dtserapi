CREATE DATABASE  IF NOT EXISTS `app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `app`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: app
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fines` (
  `ID_fine` int(11) NOT NULL AUTO_INCREMENT,
  `RUPE` int(11) DEFAULT NULL,
  `FK_Vehicle` int(11) DEFAULT NULL,
  `statePay` enum('Yes','Not') DEFAULT 'Not',
  `stateNotify` enum('sent','ToSend') DEFAULT 'ToSend',
  `FK_listFines` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`ID_fine`),
  KEY `FK_listFines` (`FK_listFines`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines`
--

LOCK TABLES `fines` WRITE;
/*!40000 ALTER TABLE `fines` DISABLE KEYS */;
INSERT INTO `fines` VALUES (1,223423443,1,'Not','sent',2,'2022-05-04'),(2,223323443,1,'Not','sent',2,'2022-05-04'),(3,222323443,1,'Not','sent',2,'2022-05-04'),(4,222553443,1,'Not','sent',2,'2022-05-04'),(5,222533443,1,'Not','sent',2,'2022-05-04'),(6,222535543,1,'Not','sent',2,'2022-05-04'),(7,222535243,1,'Not','sent',2,'2022-05-04'),(8,222533443,1,'Not','sent',2,'2022-05-04'),(9,223912332,2,'Not','ToSend',4,'2024-02-01'),(10,223322332,2,'Not','ToSend',3,'2024-02-01');
/*!40000 ALTER TABLE `fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finestypes`
--

DROP TABLE IF EXISTS `finestypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finestypes` (
  `ID_fineType` int(11) NOT NULL AUTO_INCREMENT,
  `fineType` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID_fineType`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finestypes`
--

LOCK TABLES `finestypes` WRITE;
/*!40000 ALTER TABLE `finestypes` DISABLE KEYS */;
INSERT INTO `finestypes` VALUES (1,'Estacionamento'),(2,'Transição'),(3,'Estacionamento'),(4,'Desatenção'),(5,'Direção'),(6,'Transporte');
/*!40000 ALTER TABLE `finestypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genus`
--

DROP TABLE IF EXISTS `genus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genus` (
  `ID_genus` int(11) NOT NULL AUTO_INCREMENT,
  `type_genus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_genus`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genus`
--

LOCK TABLES `genus` WRITE;
/*!40000 ALTER TABLE `genus` DISABLE KEYS */;
INSERT INTO `genus` VALUES (1,'Masculio'),(2,'Femenino');
/*!40000 ALTER TABLE `genus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infraction`
--

DROP TABLE IF EXISTS `infraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infraction` (
  `ID_infraction` int(11) NOT NULL AUTO_INCREMENT,
  `dateInfraction` datetime DEFAULT NULL,
  `FK_infractionType` int(11) DEFAULT NULL,
  `FK_finesTypes` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_infraction`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infraction`
--

LOCK TABLES `infraction` WRITE;
/*!40000 ALTER TABLE `infraction` DISABLE KEYS */;
INSERT INTO `infraction` VALUES (1,'2023-04-04 20:30:30',1,NULL);
/*!40000 ALTER TABLE `infraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infractiontype`
--

DROP TABLE IF EXISTS `infractiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infractiontype` (
  `ID_infractionType` int(11) NOT NULL AUTO_INCREMENT,
  `infractionType` varchar(150) DEFAULT NULL,
  `infractionPoint` int(11) DEFAULT NULL,
  `valuePayment` float DEFAULT NULL,
  PRIMARY KEY (`ID_infractionType`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infractiontype`
--

LOCK TABLES `infractiontype` WRITE;
/*!40000 ALTER TABLE `infractiontype` DISABLE KEYS */;
INSERT INTO `infractiontype` VALUES (1,'Leve',3,2.548),(2,'Média',4,3.904),(3,'Grave',5,5.856),(4,'Gravíssima',7,26.412);
/*!40000 ALTER TABLE `infractiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listfines`
--

DROP TABLE IF EXISTS `listfines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listfines` (
  `ID_listFine` int(11) NOT NULL AUTO_INCREMENT,
  `fine` text,
  `FK_fineType` int(11) DEFAULT NULL,
  `FK_infractionType` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_listFine`),
  KEY `FK_fineType` (`FK_fineType`),
  KEY `FK_infractionType` (`FK_infractionType`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listfines`
--

LOCK TABLES `listfines` WRITE;
/*!40000 ALTER TABLE `listfines` DISABLE KEYS */;
INSERT INTO `listfines` VALUES (1,'Estacionou o veículo ao lado de outro veículo em fila dupla.',1,1),(2,'Parou o veículo sobre faixa de pedestres.',1,1),(3,'Estacionou o veículo afastado da guia da calçada (meio-fio) a uma distância superior a 50 cm.',1,1),(4,'Transitar em velocidade até 20% superior à máxima permitida na via.',2,2),(5,'Estacionou o veículo ao lado de outro veículo em fila única, fora das áreas demarcadas.',1,2),(6,'Estacionou em locais e horários proibidos pela sinalização.',1,2),(7,'Transitou em velocidade entre 20% e 50% superior à máxima permitida na via.',2,3),(8,'Estacionou o veículo em local e horário proibidos pela sinalização.',1,3),(9,'Deixou de prestar socorro à vítima de acidente de trânsito quando solicitado.',4,3),(10,'Dirigiu ameaçando os pedestres que estejam atravessando a via pública.',5,3),(11,'Transitou em velocidade acima de 50% da máxima permitida.',2,4),(12,'Dirigiu sob a influência de álcool ou substância psicoativa.',5,4),(13,'Participou de corrida, disputa ou competição automobilística não autorizada.',5,4),(14,'Ultrapassar veículos em locais proibidos pela sinalização.',5,4),(15,'Fez manobras perigosas (como empinar moto ou derrapar o veículo).',5,4);
/*!40000 ALTER TABLE `listfines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markvehicle`
--

DROP TABLE IF EXISTS `markvehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markvehicle` (
  `ID_markVehicle` int(11) NOT NULL AUTO_INCREMENT,
  `mark_vehicle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_markVehicle`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markvehicle`
--

LOCK TABLES `markvehicle` WRITE;
/*!40000 ALTER TABLE `markvehicle` DISABLE KEYS */;
INSERT INTO `markvehicle` VALUES (1,'Range Rover'),(2,'Toyota'),(3,'BMW'),(4,'Honda');
/*!40000 ALTER TABLE `markvehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelvehicle`
--

DROP TABLE IF EXISTS `modelvehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelvehicle` (
  `ID_modelVehicle` int(11) NOT NULL AUTO_INCREMENT,
  `model_vehicle` varchar(50) DEFAULT NULL,
  `FK_markVehicle` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_modelVehicle`),
  KEY `FK_markVehicle` (`FK_markVehicle`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelvehicle`
--

LOCK TABLES `modelvehicle` WRITE;
/*!40000 ALTER TABLE `modelvehicle` DISABLE KEYS */;
INSERT INTO `modelvehicle` VALUES (1,'Sport 84',1),(2,'Corola',2),(3,'YB22',3),(4,'256',4);
/*!40000 ALTER TABLE `modelvehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typevehicle`
--

DROP TABLE IF EXISTS `typevehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typevehicle` (
  `ID_typeVehicle` int(11) NOT NULL AUTO_INCREMENT,
  `type_vehicle` enum('Motocicleta','Viatura') DEFAULT NULL,
  PRIMARY KEY (`ID_typeVehicle`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typevehicle`
--

LOCK TABLES `typevehicle` WRITE;
/*!40000 ALTER TABLE `typevehicle` DISABLE KEYS */;
INSERT INTO `typevehicle` VALUES (1,'Motocicleta'),(2,'Viatura');
/*!40000 ALTER TABLE `typevehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID_user` int(11) NOT NULL AUTO_INCREMENT,
  `ID_app` int(11) DEFAULT '0',
  `name_user` varchar(150) DEFAULT NULL,
  `BI_user` int(11) DEFAULT NULL,
  `card_user` int(11) DEFAULT NULL,
  `phone_user` int(11) DEFAULT NULL,
  `FK_genus` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_user`),
  UNIQUE KEY `BI_user` (`BI_user`),
  UNIQUE KEY `card_user` (`card_user`),
  UNIQUE KEY `phone_user` (`phone_user`),
  UNIQUE KEY `ID_app` (`ID_app`),
  KEY `FK_genus` (`FK_genus`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Jemilsom da Silva',222,222,921006782,1),(2,6187,'Augusto Jofrei Fernandes',223223223,223223223,913807785,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `ID_vehicle` int(11) NOT NULL AUTO_INCREMENT,
  `FK_type_vehicle` int(11) DEFAULT NULL,
  `FK_mark_vehicle` int(11) DEFAULT NULL,
  `registration` int(11) DEFAULT NULL,
  `FK_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_vehicle`),
  UNIQUE KEY `registration` (`registration`),
  KEY `FK_user` (`FK_user`),
  KEY `FK_type_vehicle` (`FK_type_vehicle`),
  KEY `FK_mark_vehicle` (`FK_mark_vehicle`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,2,1,222,1),(2,1,4,233233,2);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'app'
--
/*!50003 DROP PROCEDURE IF EXISTS `allFines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `allFines`( paramsID int)
begin 
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    WHERE paramsID = users.ID_user
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AllFinesWithFilterInfractionType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AllFinesWithFilterInfractionType`(typeInfraction varchar(50))
BEGIN
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    where infractiontype.infractionType = typeInfraction
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `authentication`(bi int, registration int)
BEGIN
	SELECT * FROM vehicle 
    INNER JOIN users 
    ON vehicle.FK_user = users.ID_user 
    WHERE BI_user = bi and registration = registration;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filterFines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filterFines`(idfine int, iduser int)
BEGIN
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    where users.ID_user = iduser and finesTypes.ID_fineType = idfine
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findFines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findFines`(idFine int)
BEGIN
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    WHERE ID_fine = idFine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findFinesText` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findFinesText`(iduser int, texto varchar(50))
BEGIN
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    where users.ID_user = iduser and finesTypes.fineType = texto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fineSelected` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fineSelected`(idFine int)
BEGIN
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    WHERE ID_fine = idFine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generateIDAPP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generateIDAPP`(idapp int, iduser int)
BEGIN
	Update users set ID_app = idapp Where ID_user = iduser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userAllFines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userAllFines`()
begin 
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserAndFinesFilterID_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserAndFinesFilterID_user`( paramsID int)
begin 
	SELECT * FROM fines 
	INNER JOIN listFines ON fines.FK_listFines = listFines.ID_listFine
	INNER JOIN finesTypes ON listFines.FK_fineType = finesTypes.ID_fineType
	INNER JOIN infractiontype ON listFines.FK_infractionType = infractiontype.ID_infractionType
	INNER JOIN vehicle ON fines.FK_Vehicle = vehicle.ID_vehicle
	INNER JOIN users ON vehicle.FK_user = users.ID_user
	INNER JOIN typeVehicle ON vehicle.FK_type_vehicle = typeVehicle.ID_typeVehicle
	INNER JOIN markVehicle ON vehicle.FK_mark_vehicle = markVehicle.ID_markVehicle
	inner join modelVehicle on markVehicle.ID_markVehicle = modelVehicle.FK_markVehicle
    WHERE paramsID = users.ID_user
    Limit 3 
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-25  8:00:33
