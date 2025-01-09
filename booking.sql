-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: train_booking_system
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `PassengerID` int NOT NULL,
  `TrainID` int NOT NULL,
  `ScheduleID` int NOT NULL,
  `SeatID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `BookingStatus` enum('Confirmed','Cancelled','Pending') DEFAULT 'Pending',
  PRIMARY KEY (`BookingID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `TrainID` (`TrainID`),
  KEY `ScheduleID` (`ScheduleID`),
  KEY `SeatID` (`SeatID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`TrainID`) REFERENCES `trains` (`TrainID`),
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`ScheduleID`) REFERENCES `schedules` (`ScheduleID`),
  CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`SeatID`) REFERENCES `seats` (`SeatID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,1,1,1,'2025-01-05','Confirmed'),(2,2,2,2,3,'2025-01-06','Pending'),(3,3,1,3,2,'2025-01-05','Confirmed'),(4,4,2,4,4,'2025-01-06','Pending'),(5,5,1,5,5,'2025-01-05','Confirmed'),(6,6,2,6,6,'2025-01-06','Pending');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'MarkLewis Mutugi','ngondimarklewis@gmail.com','0790767347'),(2,'Mos Melvin','mosmelvin@gmail.com','0787654321'),(3,'Ann Thaara','annthaara@gmail.com','07i9184999'),(4,'Stephen Omondi','stephen88@gmail.com','0712345678'),(5,'Romeo Kanja','romeokj@gmail.com','0730303030'),(6,'Eric Muray','muriithi@yahoo.com','0123456789'),(7,'Kenyan Prince','princeke@yahoo.com','0763000000'),(8,'Mkurugenzi Abel','mkurugenzi@gmail.com','0711112222'),(9,'Kimani Njugush','njugushkim@gmail.com','0700000000'),(10,'Trevor Munene','trevornene@gmail.com','0725860592');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentStatus` enum('Paid','Failed','Pending') DEFAULT 'Pending',
  PRIMARY KEY (`PaymentID`),
  KEY `BookingID` (`BookingID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,100.50,'2025-01-06','Paid'),(2,2,200.00,'2025-01-07','Pending'),(3,3,300.50,'2025-01-06','Paid'),(4,4,4400.00,'2025-01-07','Pending'),(5,5,100.50,'2025-01-06','Paid'),(6,6,2050.00,'2025-01-07','Pending');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `TrainID` int NOT NULL,
  `StationID` int NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `TrainID` (`TrainID`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `trains` (`TrainID`),
  CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`StationID`) REFERENCES `stations` (`StationID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,1,'08:00:00','12:00:00','2025-01-10'),(2,2,2,'14:00:00','18:00:00','2025-01-11'),(3,1,3,'09:00:00','14:00:00','2025-01-11'),(4,2,4,'09:00:00','12:00:00','2025-01-12'),(5,1,5,'08:00:00','18:00:00','2025-01-13'),(6,2,6,'14:00:00','18:00:00','2025-01-14'),(7,2,7,'07:00:00','10:00:00','2025-01-10'),(8,1,8,'09:00:00','18:00:00','2025-01-17');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `SeatID` int NOT NULL AUTO_INCREMENT,
  `TrainID` int NOT NULL,
  `SeatNumber` varchar(10) NOT NULL,
  `ClassType` enum('Economy','Business','First-Class') DEFAULT 'Economy',
  `Availability` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`SeatID`),
  KEY `TrainID` (`TrainID`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `trains` (`TrainID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,1,'A1','Economy',1),(2,1,'A2','Economy',1),(3,1,'A3','Economy',0),(4,1,'B1','Business',1),(5,1,'B2','Business',0),(6,1,'C1','First-Class',1),(7,2,'A1','Economy',1),(8,2,'A2','Economy',0),(9,2,'A3','Economy',1),(10,2,'B1','Business',1),(11,2,'B2','Business',1),(12,2,'C1','First-Class',1),(13,2,'C2','First-Class',0);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `StationID` int NOT NULL AUTO_INCREMENT,
  `StationName` varchar(100) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StationID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Nairobi Terminus','Nairobi City'),(2,'Mtito Andei station','Makueni,Kenya'),(3,'Mombasa Station','Mombasa City'),(4,'Voi Station','Voi'),(5,'Athi River Station','Athi River,Kenya'),(6,'Kibwezi Station','Makueni,Kenya'),(7,'Nakuru Station','Nakuru City'),(8,'Dar es Salaam Central Station','Tanzania'),(9,'Kampala Station','Uganda');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `TrainID` int NOT NULL AUTO_INCREMENT,
  `TrainName` varchar(100) NOT NULL,
  `TrainType` varchar(50) NOT NULL,
  PRIMARY KEY (`TrainID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (1,'Madaraka Express (SGR)','Express'),(2,'Nairobi Commuter Rail','Regular');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-09 20:30:53
