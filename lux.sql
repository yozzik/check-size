-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: localhost    Database: lux
-- ------------------------------------------------------
-- Server version	5.7.23

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfFile` varchar(255) NOT NULL,
  `sizeOfFiles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'file1',3182041),(2,'file2',15120),(3,'file3',4719241),(4,'file4',311582041),(5,'file5',3182041),(6,'file6',15123123),(7,'file7',1512311223),(8,'file8',1512312133),(9,'file9',1512312133),(10,'file10',318215104);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2018-09-10 23:08:01
