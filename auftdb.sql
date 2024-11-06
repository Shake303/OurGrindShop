-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: auftDb
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `Bestellpositionen`
--

DROP TABLE IF EXISTS `Bestellpositionen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bestellpositionen` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `bestell_id` int DEFAULT NULL,
  `artikel_id` int DEFAULT NULL,
  `menge` int NOT NULL,
  `einzelpreis` decimal(10,2) NOT NULL,
  `gesamtpreis` decimal(10,2) NOT NULL,
  PRIMARY KEY (`position_id`),
  KEY `bestell_id` (`bestell_id`),
  CONSTRAINT `Bestellpositionen_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `Bestellungen` (`bestell_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bestellpositionen`
--

LOCK TABLES `Bestellpositionen` WRITE;
/*!40000 ALTER TABLE `Bestellpositionen` DISABLE KEYS */;
INSERT INTO `Bestellpositionen` VALUES (1,1,1,2,49.95,99.90),(2,1,2,1,99.00,99.00),(3,2,1,1,49.95,49.95),(4,2,3,2,49.75,99.50),(5,3,2,3,99.00,297.00),(6,3,4,1,49.95,49.95),(7,4,3,1,89.75,89.75),(8,5,1,1,59.99,59.99),(9,6,2,4,87.45,349.80),(10,7,1,3,73.33,219.99),(11,8,3,5,55.88,279.40),(12,9,2,2,64.95,129.90),(13,10,4,4,49.95,199.80);
/*!40000 ALTER TABLE `Bestellpositionen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bestellungen`
--

DROP TABLE IF EXISTS `Bestellungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bestellungen` (
  `bestell_id` int NOT NULL AUTO_INCREMENT,
  `kunden_id` int DEFAULT NULL,
  `bestelldatum` datetime DEFAULT CURRENT_TIMESTAMP,
  `gesamtbetrag` decimal(10,2) NOT NULL,
  `status` enum('In Bearbeitung','Versandt','Abgeschlossen','Storniert') NOT NULL,
  `zahlungsart` enum('Kreditkarte','PayPal','Überweisung','Barzahlung') NOT NULL,
  `lieferadresse` text,
  PRIMARY KEY (`bestell_id`),
  KEY `kunden_id` (`kunden_id`),
  CONSTRAINT `Bestellungen_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `Kunden` (`kunden_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bestellungen`
--

LOCK TABLES `Bestellungen` WRITE;
/*!40000 ALTER TABLE `Bestellungen` DISABLE KEYS */;
INSERT INTO `Bestellungen` VALUES (1,1,'2024-11-05 19:30:53',199.90,'In Bearbeitung','Kreditkarte','Münstergasse 15, 3000 Bern'),(2,2,'2024-11-05 19:30:53',149.50,'Versandt','PayPal','Bollwerk 10, 3011 Bern'),(3,3,'2024-11-05 19:30:53',299.95,'Abgeschlossen','Überweisung','Kramgasse 22, 3011 Bern'),(4,4,'2024-11-05 19:30:53',89.75,'In Bearbeitung','Kreditkarte','Zytgloggelaube 4, 3000 Bern'),(5,5,'2024-11-05 19:30:53',59.99,'Versandt','Kreditkarte','Marktgasse 12, 3011 Bern'),(6,6,'2024-11-05 19:30:53',349.80,'Abgeschlossen','Überweisung','Postgasse 21, 3011 Bern'),(7,7,'2024-11-05 19:30:53',219.99,'Storniert','Kreditkarte','Herrengasse 9, 3011 Bern'),(8,8,'2024-11-05 19:30:53',279.40,'In Bearbeitung','PayPal','Kornhausplatz 5, 3000 Bern'),(9,9,'2024-11-05 19:30:53',129.90,'Abgeschlossen','Kreditkarte','Theaterplatz 8, 3011 Bern'),(10,10,'2024-11-05 19:30:53',199.90,'Versandt','PayPal','Schauplatzgasse 16, 3000 Bern');
/*!40000 ALTER TABLE `Bestellungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kunden`
--

DROP TABLE IF EXISTS `Kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kunden` (
  `kunden_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefonnummer` varchar(20) DEFAULT NULL,
  `rechnungsadresse` text,
  PRIMARY KEY (`kunden_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kunden`
--

LOCK TABLES `Kunden` WRITE;
/*!40000 ALTER TABLE `Kunden` DISABLE KEYS */;
INSERT INTO `Kunden` VALUES (1,'Lukas Meier','lukas.meier@bluewin.ch','+41 79 112 34 56','Münstergasse 15, 3000 Bern'),(2,'Sarah Müller','sarah.mueller@gmx.ch','+41 79 223 45 67','Bollwerk 10, 3011 Bern'),(3,'Martin Gerber','martin.gerber@hotmail.com','+41 79 334 56 78','Kramgasse 22, 3011 Bern'),(4,'Anna Schmid','anna.schmid@bluewin.ch','+41 79 445 67 89','Zytgloggelaube 4, 3000 Bern'),(5,'Peter Keller','peter.keller@gmx.ch','+41 79 556 78 90','Marktgasse 12, 3011 Bern'),(6,'Laura Weber','laura.weber@hotmail.com','+41 79 667 89 01','Postgasse 21, 3011 Bern'),(7,'Michael Frei','michael.frei@bluewin.ch','+41 79 778 90 12','Herrengasse 9, 3011 Bern'),(8,'Sandra Baumann','sandra.baumann@gmx.ch','+41 79 889 01 23','Kornhausplatz 5, 3000 Bern'),(9,'Daniel Steiner','daniel.steiner@hotmail.com','+41 79 990 12 34','Theaterplatz 8, 3011 Bern'),(10,'Nina Hofmann','nina.hofmann@bluewin.ch','+41 79 101 23 45','Schauplatzgasse 16, 3000 Bern');
/*!40000 ALTER TABLE `Kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lieferungen`
--

DROP TABLE IF EXISTS `Lieferungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lieferungen` (
  `liefer_id` int NOT NULL AUTO_INCREMENT,
  `bestell_id` int DEFAULT NULL,
  `lieferstatus` enum('In Bearbeitung','Versandt','Geliefert') NOT NULL,
  `lieferdatum` datetime DEFAULT NULL,
  `versanddienstleister` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`liefer_id`),
  KEY `bestell_id` (`bestell_id`),
  CONSTRAINT `Lieferungen_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `Bestellungen` (`bestell_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lieferungen`
--

LOCK TABLES `Lieferungen` WRITE;
/*!40000 ALTER TABLE `Lieferungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lieferungen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zahlungen`
--

DROP TABLE IF EXISTS `Zahlungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zahlungen` (
  `zahlungs_id` int NOT NULL AUTO_INCREMENT,
  `bestell_id` int DEFAULT NULL,
  `zahlungsdatum` datetime DEFAULT CURRENT_TIMESTAMP,
  `betrag` decimal(10,2) NOT NULL,
  `zahlungsmethode` enum('Kreditkarte','PayPal','Überweisung') NOT NULL,
  `transaktions_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`zahlungs_id`),
  UNIQUE KEY `transaktions_id` (`transaktions_id`),
  KEY `bestell_id` (`bestell_id`),
  CONSTRAINT `Zahlungen_ibfk_1` FOREIGN KEY (`bestell_id`) REFERENCES `Bestellungen` (`bestell_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zahlungen`
--

LOCK TABLES `Zahlungen` WRITE;
/*!40000 ALTER TABLE `Zahlungen` DISABLE KEYS */;
INSERT INTO `Zahlungen` VALUES (1,1,'2024-11-05 19:30:53',199.90,'Kreditkarte','TXN1001'),(2,2,'2024-11-05 19:30:53',149.50,'PayPal','TXN1002'),(3,3,'2024-11-05 19:30:53',299.95,'Überweisung','TXN1003'),(4,4,'2024-11-05 19:30:53',89.75,'Kreditkarte','TXN1004'),(5,5,'2024-11-05 19:30:53',59.99,'Kreditkarte','TXN1005'),(6,6,'2024-11-05 19:30:53',349.80,'Überweisung','TXN1006'),(7,7,'2024-11-05 19:30:53',219.99,'Kreditkarte','TXN1007'),(8,8,'2024-11-05 19:30:53',279.40,'PayPal','TXN1008'),(9,9,'2024-11-05 19:30:53',129.90,'Kreditkarte','TXN1009'),(10,10,'2024-11-05 19:30:53',199.90,'PayPal','TXN1010');
/*!40000 ALTER TABLE `Zahlungen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-05 20:38:29
