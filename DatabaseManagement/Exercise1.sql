CREATE DATABASE  IF NOT EXISTS `Evergreen_Shipment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `Evergreen_Shipment`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Evergreen_Shipment
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `CategoriesInfo`
--

DROP TABLE IF EXISTS `CategoriesInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CategoriesInfo` (
  `CategoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CategoryName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoriesInfo_CategoryName_UQ00` (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriesInfo`
--

LOCK TABLES `CategoriesInfo` WRITE;
/*!40000 ALTER TABLE `CategoriesInfo` DISABLE KEYS */;
INSERT INTO `CategoriesInfo` VALUES ('CA101','Beverages'),('CA102','Condiments'),('CA103','Confections'),('CA104','Dairy Products'),('CA110','Fruits/Vegetables'),('CA105','Grains/Cereals'),('CA106','Meat/Poultry'),('CA109','Office'),('CA107','Produce'),('CA108','Seafood');
/*!40000 ALTER TABLE `CategoriesInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersInfo`
--

DROP TABLE IF EXISTS `CustomersInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CustomersInfo` (
  `CustomerID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FirstName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerAddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerCity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerRegion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerPostalCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerCountry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerPhone` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersInfo`
--

LOCK TABLES `CustomersInfo` WRITE;
/*!40000 ALTER TABLE `CustomersInfo` DISABLE KEYS */;
INSERT INTO `CustomersInfo` VALUES ('C101','Schmitt','Carine ','Male','54 rue Royale','Lynwood','WA','90262','USA','40.32.2555'),('C102','King','Jean','Male','8489 Strong St.','Las Vegas','NV','89108','USA','7025551838'),('C103','Ferguson','Peter','Male','636 St Kilda Road','Bothell','WA','98012','USA','03 9520 4555'),('C104','Labrune','Janine ','Female','67, rue des Cinquante Otages','Bellevue','WA','98006','USA','40.67.8555'),('C105','Bergulfsen','Jonas ','Female','Erling Skakkes gate 78','Bellevue','WA','98006','USA','07-98 9555'),('C106','Nelson','Susan','Female','5677 Strong St.','San Rafael','CA','94901','USA','4155551450'),('C107','Piestrzeniewicz','Zbyszek ','Male','ul. Filtrowa 68','Orange','CA','92867','USA','(26) 642-7555'),('C108','Keitel','Roland','Male','Lyonerstr. 34','Auburn','AL','36830','USA','+49 69 66 90 2555'),('C109','Murphy','Julie','Female','5557 North Pendale Street','San Francisco','CA','94112','USA','6505555787'),('C110','Lee','Kwai','Male','897 Long Airport Avenue','NYC','NY','11368','USA','2125557818'),('C111','Freyre','Diego ','Male','C/ Moralzarzal 86','Redmond','WA','98052','USA','(91) 555 94 44'),('C112','Berglund','Christina ','Female','Berguvsvägen  8','Napa','CA','94558','USA','0921-12 3555'),('C113','Petersen','Jytte ','Male','Vinbæltet 34','Los Angeles','CA','90011','USA','31 12 3555'),('C114','Saveley','Mary ','Female','2 rue du Commerce','Buffalo','NY','14215','USA','78.32.5555'),('C115','Natividad','Eric','Male','Bronz Apt. 3/6 Tesvikiye','Seattle','WA','98199','USA','+65 221 7555'),('C116','Young','Jeff','Male','4092 Furth Circle','NYC','NY','11368','USA','2125557413'),('C117','Leong','Kelvin','Male','7586 Pompton St.','Allentown','PA','18102','USA','2155551555'),('C118','Hashimoto','Juri','Female','9408 Furth Circle','Burlingame','CA','94010','USA','6505556809'),('C119','Victorino','Wendy','Female','106 Linden Road Sandown','Los Angeles','CA','90011','USA','+65 224 1555'),('C120','Oeztan','Veysel','Male','Brehmen St. 121','New York','NY','11368','USA','+47 2267 3215'),('C121','Franco','Keith','Male','149 Spinnaker Dr.','New Haven','CT','06511','USA','2035557845'),('C122','de Castro','Isabel ','Female','Estrada da saúde n. 58','Renton','WA','98056','USA','(1) 356-5555'),('C123','Rancé','Martine ','Female','184 chaussée de Tournai','Seattle','WA','98199','USA','20.16.1555'),('C124','Bertrand','Marie','Female','265 boulevard Charonne','Orange','CA','92867','USA','(1) 42.34.2555'),('C125','Tseng','Jerry','Male','4658 Baden Av.','Cambridge','MA','02139','USA','6175555555');
/*!40000 ALTER TABLE `CustomersInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeesInfo`
--

DROP TABLE IF EXISTS `EmployeesInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EmployeesInfo` (
  `EmployeeID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FirstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `HiringDate` date DEFAULT NULL,
  `EmployeeStreetAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmployeeCity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmployeeState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmployeeCountry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmployeePhoneNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PhoneNumberExtension` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmployeeReportsTo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `EmployeesInfo_FK00` (`EmployeeReportsTo`),
  CONSTRAINT `EmployeesInfo_FK00` FOREIGN KEY (`EmployeeReportsTo`) REFERENCES `employeesinfo` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeesInfo`
--

LOCK TABLES `EmployeesInfo` WRITE;
/*!40000 ALTER TABLE `EmployeesInfo` DISABLE KEYS */;
INSERT INTO `EmployeesInfo` VALUES ('E101','Qiyu','Ye','Female','Chief Financial Officer','1980-05-28','2018-03-16','44rd Dr SE','Bothell','WA','USA','(206) 778-9918','234',NULL),('E102','Ankita','Pathak','Female','Chief Operation Officer','1982-03-23','2018-02-18','Northeast 8th Street','Bellevue','WA','USA','(206) 372-6638','121',NULL),('E103','Nancy','Jain','Female','Chief Executive Officer','1981-10-12','2018-02-18','3212-16th Ave. N.E.','Seattle','WA','USA','(206) 642-7623','889',NULL),('E104','Nancy','Davolio','Female','Sales Representative','1948-12-08','2018-05-01','507 - 20th Ave. E.Apt. 2A','Seattle','WA','USA','(206) 555-9857','5467','E101'),('E105','Andrew','Fuller','Male','Vice President, Sales','1952-02-19','2018-08-14','908 W. Capital Way','Tacoma','WA','USA','(206) 555-9482','3457','E102'),('E106','Janet','Leverling','Female','Sales Representative','1963-08-30','2019-04-01','722 Moss Bay Blvd.','Kirkland','WA','USA','(206) 555-3412','3355','E103'),('E107','Margaret','Peacock','Male','Sales Representative','1937-09-19','2018-05-03','4110 Old Redmond Rd.','Redmond','WA','USA','(206) 555-8122','5176','E105'),('E108','Steven','Buchanan','Male','Sales Manager','1955-03-04','2017-10-17','14 Garrett Hill','London',NULL,'UK','(71) 555-4848','3453','E104'),('E109','Suyama','Michael','Male','Sales Representative','1963-07-02','2018-10-17','Coventry House Miner Rd.','London',NULL,'UK','(71) 555-7773','428','E104'),('E110','Robert','King','Male','Sales Representative','1960-05-29','2018-01-02','Edgeham Hollow Winchester Way','London',NULL,'UK','(71) 555-5598','465','E106'),('E111','Laura','Callahan','Female','Inside Sales Coordinator','1958-01-09','2019-03-05','4726 - 11th Ave. N.E.','Seattle','WA','USA','(206) 555-1189','2344','E108'),('E112','Anne','Dodsworth','Female','Sales Representative','1966-01-27','2018-11-15','7 Houndstooth Rd.','London',NULL,'UK','(71) 555-4444','452','E106');
/*!40000 ALTER TABLE `EmployeesInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeTerritoriesInfo`
--

DROP TABLE IF EXISTS `EmployeeTerritoriesInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EmployeeTerritoriesInfo` (
  `EmployeeID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TerritoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `EmployeeTerritoriesInfo_FK01` (`TerritoryID`),
  CONSTRAINT `EmployeeTerritoriesInfo_FK00` FOREIGN KEY (`EmployeeID`) REFERENCES `employeesinfo` (`EmployeeID`),
  CONSTRAINT `EmployeeTerritoriesInfo_FK01` FOREIGN KEY (`TerritoryID`) REFERENCES `territoriesinfo` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeTerritoriesInfo`
--

LOCK TABLES `EmployeeTerritoriesInfo` WRITE;
/*!40000 ALTER TABLE `EmployeeTerritoriesInfo` DISABLE KEYS */;
INSERT INTO `EmployeeTerritoriesInfo` VALUES ('E101','T101'),('E111','T101'),('E102','T102'),('E112','T102'),('E103','T103'),('E104','T104'),('E105','T105'),('E106','T106'),('E107','T107'),('E108','T108'),('E109','T109'),('E110','T110');
/*!40000 ALTER TABLE `EmployeeTerritoriesInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetailsInfo`
--

DROP TABLE IF EXISTS `OrderDetailsInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `OrderDetailsInfo` (
  `OrderID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UnitPrice` float(10,4) NOT NULL DEFAULT '0.0000',
  `Quantity` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `OrderDetailsInfo_FK01` (`ProductID`),
  CONSTRAINT `OrderDetailsInfo_FK00` FOREIGN KEY (`OrderID`) REFERENCES `ordersinfo` (`OrderID`),
  CONSTRAINT `OrderDetailsInfo_FK01` FOREIGN KEY (`ProductID`) REFERENCES `productsinfo` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetailsInfo`
--

LOCK TABLES `OrderDetailsInfo` WRITE;
/*!40000 ALTER TABLE `OrderDetailsInfo` DISABLE KEYS */;
INSERT INTO `OrderDetailsInfo` VALUES ('O101','P111',5.0000,6),('O101','P116',5.0000,15),('O102','P107',30.0000,6),('O102','P109',97.0000,6),('O102','P117',5.0000,15),('O103','P108',40.0000,15),('O103','P110',31.0000,15),('O103','P117',5.0000,6),('O104','P104',22.0000,15),('O104','P109',97.0000,6),('O104','P111',5.0000,6),('O105','P105',21.3500,6),('O105','P111',5.0000,15),('O105','P112',5.0000,15),('O105','P115',10.0000,15),('O106','P106',25.0000,15),('O106','P109',97.0000,6),('O107','P106',25.0000,15),('O107','P112',5.0000,6),('O107','P113',2.0000,15),('O107','P117',5.0000,6),('O108','P113',2.0000,15),('O109','P114',2.0000,6),('O109','P116',4.0000,15),('O110','P110',31.0000,15),('O110','P117',5.0000,6),('O111','P108',40.0000,15),('O111','P117',5.0000,15),('O112','P117',5.0000,6);
/*!40000 ALTER TABLE `OrderDetailsInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersInfo`
--

DROP TABLE IF EXISTS `OrdersInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `OrdersInfo` (
  `OrderID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CustomerID` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EmployeeID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `ExpectedArrivalDate` datetime DEFAULT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `ShipperID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TrackingID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FreightAmount` float(10,4) DEFAULT '0.0000',
  `ShipName` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ShipAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ShipCity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ShipRegion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ShipPostalCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ShipCountry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrdersInfo_TrackingID_UQ00` (`TrackingID`),
  KEY `OrdersInfo_FK00` (`CustomerID`),
  KEY `OrdersInfo_FK01` (`EmployeeID`),
  KEY `OrdersInfo_FK02` (`ShipperID`),
  CONSTRAINT `OrdersInfo_FK00` FOREIGN KEY (`CustomerID`) REFERENCES `customersinfo` (`CustomerID`),
  CONSTRAINT `OrdersInfo_FK01` FOREIGN KEY (`EmployeeID`) REFERENCES `employeesinfo` (`EmployeeID`),
  CONSTRAINT `OrdersInfo_FK02` FOREIGN KEY (`ShipperID`) REFERENCES `shippersinfo` (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersInfo`
--

LOCK TABLES `OrdersInfo` WRITE;
/*!40000 ALTER TABLE `OrdersInfo` DISABLE KEYS */;
INSERT INTO `OrdersInfo` VALUES ('O101','C102','E101','2018-07-04 00:00:00','2018-07-11 00:00:00','2018-07-05 00:00:00','SH103','ES9876222',32.3800,'Vins et alcools Chevalier','59 rue de l-Abbaye','Mount Vernon','WA','98274','USA'),('O102','C101','E103','2018-07-05 00:00:00','2018-07-12 00:00:00','2018-07-06 00:00:00','SH104','ES0000987',11.6100,'Toms Spezialitten','Luisenstr. 48','Prineville','OR','97754','USA'),('O103','C104','E104','2018-07-08 00:00:00','2018-07-15 00:00:00','2018-07-09 00:00:00','SH102','ES0987123',65.8300,'Hanari Carnes','Rua do Pao, 67','Buckeye','AZ','85326','USA'),('O104','C103','E105','2018-07-08 00:00:00','2018-07-15 00:00:00','2018-07-09 00:00:00','SH101','ES9876233',41.3400,'Victuailles en stock','2, rue du Commerce','Paradise Valley','AZ',' 85253','USA'),('O105','C106','E102','2018-07-09 00:00:00','2018-07-16 00:00:00','2018-07-10 00:00:00','SH102','ES9333322',51.3000,'Suprmes dlices','Boulevard Tirou, 255','Newark','CA','94560','USA'),('O106','C105','E103','2018-07-10 00:00:00','2018-07-17 00:00:00','2018-07-11 00:00:00','SH102','ES1678903',58.1700,'Hanari Carnes','Rua do Pao, 67',' Lysite','WY','82642','USA'),('O107','C108','E105','2018-07-11 00:00:00','2018-07-18 00:00:00','2018-07-12 00:00:00','SH102','ES1111111',22.9800,'Chop-suey Chinese','Hauptstr. 31','Wood Lake','MN','56297','USA'),('O108','C109','E109','2018-07-12 00:00:00','2018-07-13 00:00:00','2018-07-13 00:00:00','SH103','ES0000001',148.3300,'Richter Supermarkt','Starenweg 5','Annville','PA','17003','USA'),('O109','C110','E103','2018-07-15 00:00:00','2018-07-22 00:00:00','2018-07-16 00:00:00','SH102','ES3333333',13.9700,'Wellington Importadora','Rua do Mercado, 12','Whitehouse Station','NJ','08889','USA'),('O110','C109','E104','2018-07-16 00:00:00','2018-07-23 00:00:00','2018-07-17 00:00:00','SH103','ES6753428',81.9100,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','Cary','NC','27511','USA'),('O111','C112','E101','2018-07-17 00:00:00','2018-07-18 00:00:00','2018-07-18 00:00:00','SH104','ES2220983',140.5100,'Ernst Handel','Kirchgasse 6','Roanoke','VA','24012','USA'),('O112','C111','E104','2018-07-18 00:00:00','2018-07-25 00:00:00','2018-07-19 00:00:00','SH103','ES0943222',3.2500,'Centro comercial Moctezuma','Sierras de Granada 9993','Gastonia','NC','28052','USA'),('O113','C114','E103','2018-07-19 00:00:00','2018-07-26 00:00:00','2018-07-20 00:00:00','SH101','ES9004084',55.0900,'Ottilies Kseladen','Mehrheimerstr. 369','North Wales','PA','19454','USA'),('O114','C113','E108','2018-07-19 00:00:00','2018-07-26 00:00:00','2018-07-20 00:00:00','SH102','ES9819797',3.0500,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','USA'),('O115','C116','E105','2018-07-22 00:00:00','2018-07-29 00:00:00','2018-07-23 00:00:00','SH103','ES3533004',48.2900,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA'),('O116','C116','E109','2018-07-23 00:00:00','2018-07-24 00:00:00','2018-07-24 00:00:00','SH103','ES2067346',146.0600,'Ernst Handel','Kirchgasse 6','Milwaukee','WI','53204','USA'),('O117','C118','E102','2018-07-24 00:00:00','2018-07-31 00:00:00','2018-07-25 00:00:00','SH103','ES9888888',3.6700,'Folk och f HB','kergatan 24','Fullerton','CA','92831','USA'),('O118','C118','E106','2018-07-25 00:00:00','2018-08-01 00:00:00','2018-07-26 00:00:00','SH101','ES9999006',55.2800,'Blondel pre et fils','24, place Klber','Salisbury','MD','21801','USA'),('O119','C115','E103','2018-07-26 00:00:00','2018-08-02 00:00:00','2018-07-27 00:00:00','SH103','ES5432222',25.7300,'Wartian Herkku','Torikatu 38','Huntersville','NC','28078','USA'),('O120','C121','E104','2018-07-29 00:00:00','2018-08-26 00:00:00','2018-07-30 00:00:00','SH101','ES0987444',208.5800,'Frankenversand','Berliner Platz 43','West Palm Beach','FL','33404','USA'),('O121','C112','E108','2018-07-30 00:00:00','2018-08-06 00:00:00','2018-07-31 00:00:00','SH103','ES9005195',66.2900,'GROSELLA-Restaurante','5 Ave. Los Palos Grandes','Park Forest','IL','60466','USA'),('O122','C124','E105','2018-07-31 00:00:00','2018-08-07 00:00:00','2018-08-01 00:00:00','SH101','ES9956260',4.5600,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA'),('O123','C123','E101','2018-08-01 00:00:00','2018-08-02 00:00:00','2018-08-02 00:00:00','SH101','ES3330002',136.5400,'Wartian Herkku','Torikatu 38','Dubuque','IA','52001','USA'),('O124','C120','E106','2018-08-01 00:00:00','2018-08-08 00:00:00','2018-08-02 00:00:00','SH102','ES2067775',4.5400,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA'),('O125','C104','E106','2018-08-02 00:00:00','2018-08-04 00:00:00','2018-08-03 00:00:00','SH102','ES9045678',98.0300,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
/*!40000 ALTER TABLE `OrdersInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsInfo`
--

DROP TABLE IF EXISTS `ProductsInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ProductsInfo` (
  `ProductID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProductName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SupplierID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CategoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `QuantityPerUnit` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UnitPrice` float(10,4) DEFAULT '0.0000',
  `UnitsInStock` int(2) DEFAULT '0',
  `UnitsOnOrder` int(2) DEFAULT '0',
  PRIMARY KEY (`ProductID`),
  KEY `ProductsInfo_FK00` (`CategoryID`),
  KEY `ProductsInfo_FK01` (`SupplierID`),
  CONSTRAINT `ProductsInfo_FK00` FOREIGN KEY (`CategoryID`) REFERENCES `categoriesinfo` (`CategoryID`),
  CONSTRAINT `ProductsInfo_FK01` FOREIGN KEY (`SupplierID`) REFERENCES `suppliersinfo` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsInfo`
--

LOCK TABLES `ProductsInfo` WRITE;
/*!40000 ALTER TABLE `ProductsInfo` DISABLE KEYS */;
INSERT INTO `ProductsInfo` VALUES ('P101','Chai','S101','CA101','10 boxes x 20 bags',18.0000,390,0),('P102','Chang','S101','CA101','24 - 12 oz bottles',19.0000,170,40),('P103','Aniseed Syrup','S101','CA102','12 - 550 ml bottles',10.0000,130,70),('P104','Chef Anton\'s Cajun Seasoning','S102','CA102','48 - 6 oz jars',22.0000,530,0),('P105','Chef Anton\'s Gumbo Mix','S102','CA102','36 boxes',21.3500,100,0),('P106','Grandma\'s Boysenberry Spread','S103','CA102','12 - 8 oz jars',25.0000,120,0),('P107','Uncle Bob\'s Organic Dried Pears','S103','CA107','12 - 1 lb pkgs.',30.0000,159,0),('P108','Northwoods Cranberry Sauce','S103','CA102','12 - 12 oz jars',40.0000,601,0),('P109','Mishi Kobe Niku','S104','CA106','18 - 500 g pkgs.',97.0000,290,0),('P110','Ikura','S105','CA108','12 - 200 ml jars',31.0000,310,0),('P111','Pen','S105','CA109','10 Packets X 20 boxes',5.0000,310,0),('P112','Markers','S106','CA109','10 Packets X 20 boxes',5.0000,350,0),('P113','Paper clips','S106','CA109','10 Packets X 20 boxes',2.0000,500,0),('P114','Blind clips','S106','CA109','10 Packets X 20 boxes',2.0000,500,0),('P115','Stapler','S107','CA109','20 boxes',10.0000,500,0),('P116','Glue sticks','S108','CA109','10 Packets X 20 boxes',5.0000,400,0),('P117','Highlighters','S108','CA109','10 Packets X 20 boxes',5.0000,400,0),('P118','Butter','S109','CA104','12 - 200 ml jars',15.0000,400,0),('P119','Cheese','S109','CA104','12 - 200 ml jars',10.0000,300,0),('P120','Milk','S109','CA104','12 - 200 ml jars',3.0000,300,0),('P121','Whey','S110','CA104','12 - 200 ml jars',10.0000,200,0);
/*!40000 ALTER TABLE `ProductsInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegionInfo`
--

DROP TABLE IF EXISTS `RegionInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `RegionInfo` (
  `RegionID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RegionName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegionInfo`
--

LOCK TABLES `RegionInfo` WRITE;
/*!40000 ALTER TABLE `RegionInfo` DISABLE KEYS */;
INSERT INTO `RegionInfo` VALUES ('R101','East'),('R102','West'),('R103','North'),('R104','South');
/*!40000 ALTER TABLE `RegionInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShippersInfo`
--

DROP TABLE IF EXISTS `ShippersInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ShippersInfo` (
  `ShipperID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Phone` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShippersInfo`
--

LOCK TABLES `ShippersInfo` WRITE;
/*!40000 ALTER TABLE `ShippersInfo` DISABLE KEYS */;
INSERT INTO `ShippersInfo` VALUES ('SH101','Seattle Car Shipping','(503) 555-9831'),('SH102','Coastal Transportation Inc','(503) 555-3199'),('SH103','Navis Pack&Ship','(503) 555-9931'),('SH104','Seattle Bulk Shipping','(503) 255-2383');
/*!40000 ALTER TABLE `ShippersInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuppliersInfo`
--

DROP TABLE IF EXISTS `SuppliersInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SuppliersInfo` (
  `SupplierID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CompanyName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ContactName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ContactTitle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierCity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierRegion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierPostalCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierCountry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SupplierPhone` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuppliersInfo`
--

LOCK TABLES `SuppliersInfo` WRITE;
/*!40000 ALTER TABLE `SuppliersInfo` DISABLE KEYS */;
INSERT INTO `SuppliersInfo` VALUES ('S101','Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gilbert St.','Anchorage','AK','99501','USA','(171) 555-2222'),('S102','New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822'),('S103','Grandma Kelly\'s Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735'),('S104','Tokyo Traders','Yoshi Nagase','Marketing Manager','9-8 Sekimai Musashino-shi','Phoenix','AZ','85001','USA','(03) 3555-5011'),('S105','Cooperativa de Quesos \'Las Cabras\'','Antonio del Valle Saavedra ','Export Administrator','Calle del Rosal 4','Los Angeles','CA','90001','USA','(98) 598 76 54'),('S106','Mayumi\'s','Mayumi Ohno','Marketing Representative','92 Setsuko Chuo-ku','Sacramento','CA','94203','USA','(06) 431-7877'),('S107','Pavlova, Ltd.','Ian Devling','Marketing Manager','74 Rose St.Moonie Ponds','Orlando','FL','32801','USA','(03) 444-2343'),('S108','Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative','29 King\'s Way','	Atlanta','GA','30301','USA','(161) 555-4448'),('S109','PB Knckebrd AB','Lars Peterson','Sales Agent','Kaloadagatan 13','Bellevue','WA','98004','USA','031-987 65 43'),('S110','Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager','Av. das Americanas 12.890','Cleveland','OH','44101','USA','(11) 555 4640');
/*!40000 ALTER TABLE `SuppliersInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TerritoriesInfo`
--

DROP TABLE IF EXISTS `TerritoriesInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TerritoriesInfo` (
  `TerritoryID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TerritoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RegionID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`TerritoryID`),
  KEY `TerritoriesInfo_FK00` (`RegionID`),
  CONSTRAINT `TerritoriesInfo_FK00` FOREIGN KEY (`RegionID`) REFERENCES `regioninfo` (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TerritoriesInfo`
--

LOCK TABLES `TerritoriesInfo` WRITE;
/*!40000 ALTER TABLE `TerritoriesInfo` DISABLE KEYS */;
INSERT INTO `TerritoriesInfo` VALUES ('T101','Westboro','R101'),('T102','Bedford','R102'),('T103','Georgetown','R103'),('T104','Boston','R104'),('T105','Cambridge','R101'),('T106','Braintree','R102'),('T107','Providence','R103'),('T108','Hollis','R104'),('T109','Portsmouth','R101'),('T110','Wilton','R102');
/*!40000 ALTER TABLE `TerritoriesInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_alphabetical_list_of_products`
--

DROP TABLE IF EXISTS `vw_alphabetical_list_of_products`;
/*!50001 DROP VIEW IF EXISTS `vw_alphabetical_list_of_products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_alphabetical_list_of_products` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `SupplierID`,
 1 AS `CategoryID`,
 1 AS `QuantityPerUnit`,
 1 AS `UnitPrice`,
 1 AS `UnitsInStock`,
 1 AS `UnitsOnOrder`,
 1 AS `CategoryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_invoices`
--

DROP TABLE IF EXISTS `vw_invoices`;
/*!50001 DROP VIEW IF EXISTS `vw_invoices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_invoices` AS SELECT 
 1 AS `ShipName`,
 1 AS `ShipAddress`,
 1 AS `ShipCity`,
 1 AS `ShipRegion`,
 1 AS `ShipPostalCode`,
 1 AS `ShipCountry`,
 1 AS `CustomerID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `CustomerAddress`,
 1 AS `CustomerCity`,
 1 AS `CustomerRegion`,
 1 AS `CustomerPostalCode`,
 1 AS `CustomerCountry`,
 1 AS `Salesperson`,
 1 AS `OrderID`,
 1 AS `OrderDate`,
 1 AS `ExpectedArrivalDate`,
 1 AS `ShippedDate`,
 1 AS `ShipperName`,
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `UnitPrice`,
 1 AS `Quantity`,
 1 AS `ExtendedPrice`,
 1 AS `FreightAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_order_sales`
--

DROP TABLE IF EXISTS `vw_order_sales`;
/*!50001 DROP VIEW IF EXISTS `vw_order_sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_order_sales` AS SELECT 
 1 AS `OrderID`,
 1 AS `Sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_above_average_price`
--

DROP TABLE IF EXISTS `vw_products_above_average_price`;
/*!50001 DROP VIEW IF EXISTS `vw_products_above_average_price`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vw_products_above_average_price` AS SELECT 
 1 AS `ProductName`,
 1 AS `UnitPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Evergreen_Shipment'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddModify_OrderDetailsAndProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=CURRENT_USER PROCEDURE `sp_AddModify_OrderDetailsAndProducts`(
IN order_ID NVARCHAR(10),
IN product_ID NVARCHAR(10),
IN quantity_bought INT(2))
BEGIN

IF quantity_bought > (SELECT UnitsInStock FROM ProductsInfo WHERE ProductID = product_id) THEN

signal sqlstate '45000' set message_text = 'Quantity of product ordered is larger than instock quantity.';

ELSE

INSERT INTO OrderDetailsInfo VALUES
(order_ID,
product_ID,
(SELECT UnitPrice FROM ProductsInfo WHERE ProductID = product_id),
quantity);

UPDATE ProductsInfo
SET UnitsInStock = UnitsInStock - quantity_bought 
WHERE ProductID = product_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddModify_Products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

DELIMITER ;;
CREATE DEFINER=CURRENT_USER PROCEDURE `sp_AddModify_Products`(
IN product_id NVARCHAR(10),
IN product_name NVARCHAR(40),
IN supplier_id NVARCHAR(10),
IN category_id NVARCHAR(10),
IN qty_perunit NVARCHAR(20),
IN unit_price FLOAT(10,4),
IN units_toinsert INT(2),
IN unitson_order INT(2))
BEGIN

IF NOT EXISTS  (SELECT * FROM ProductsInfo WHERE ProductID = product_id ) THEN

INSERT INTO ProductsInfo VALUES
(product_id,
product_name,
supplier_id,
category_id,
qty_perunit,
unit_price,
units_toinsert,
unitson_order);

ELSE

UPDATE ProductsInfo
SET
UnitsInStock = UnitsInStock + units_toinsert 
WHERE ProductID = product_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CustOrdersTracking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=CURRENT_USER PROCEDURE `sp_CustOrdersTracking`(in AtCustomerID varchar(5))
BEGIN
      SELECT OrderID,
	OrderDate,
	ExpectedArrivalDate,
	ShippedDate,
    TrackingID
FROM OrdersInfo
WHERE CustomerID = AtCustomerID
ORDER BY OrderID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Sales_by_Month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=CURRENT_USER PROCEDURE `sp_Sales_by_Month`(in AtBeginning_Date Datetime,in AtEnding_Date Datetime)
BEGIN

    SELECT OrdersInfo.ShippedDate,
	   OrdersInfo.OrderID,
	  vw_Order_Sales.Sales,
	  ShippedDate AS Month
FROM OrdersInfo  LEFT JOIN vw_Order_Sales ON OrdersInfo.OrderID = vw_Order_Sales.OrderID
WHERE ShippedDate in (Select ShippedDate from OrdersInfo 
						where OrdersInfo.ShippedDate Between AtBeginning_Date And AtEnding_Date);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_alphabetical_list_of_products`
--

/*!50001 DROP VIEW IF EXISTS `vw_alphabetical_list_of_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=CURRENT_USER SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alphabetical_list_of_products` AS select `Products`.`ProductID` AS `ProductID`,`Products`.`ProductName` AS `ProductName`,`Products`.`SupplierID` AS `SupplierID`,`Products`.`CategoryID` AS `CategoryID`,`Products`.`QuantityPerUnit` AS `QuantityPerUnit`,`Products`.`UnitPrice` AS `UnitPrice`,`Products`.`UnitsInStock` AS `UnitsInStock`,`Products`.`UnitsOnOrder` AS `UnitsOnOrder`,`Categories`.`CategoryName` AS `CategoryName` from (`CategoriesInfo` `Categories` left join `ProductsInfo` `Products` on((`Categories`.`CategoryID` = `Products`.`CategoryID`))) order by `Products`.`ProductName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_invoices`
--

/*!50001 DROP VIEW IF EXISTS `vw_invoices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=CURRENT_USER SQL SECURITY DEFINER */
/*!50001 VIEW `vw_invoices` AS select `Orders`.`ShipName` AS `ShipName`,`Orders`.`ShipAddress` AS `ShipAddress`,`Orders`.`ShipCity` AS `ShipCity`,`Orders`.`ShipRegion` AS `ShipRegion`,`Orders`.`ShipPostalCode` AS `ShipPostalCode`,`Orders`.`ShipCountry` AS `ShipCountry`,`Orders`.`CustomerID` AS `CustomerID`,`Customers`.`FirstName` AS `FirstName`,`Customers`.`LastName` AS `LastName`,`Customers`.`CustomerAddress` AS `CustomerAddress`,`Customers`.`CustomerCity` AS `CustomerCity`,`Customers`.`CustomerRegion` AS `CustomerRegion`,`Customers`.`CustomerPostalCode` AS `CustomerPostalCode`,`Customers`.`CustomerCountry` AS `CustomerCountry`,((`Employees`.`FirstName` + ' ') + `Employees`.`LastName`) AS `Salesperson`,`Orders`.`OrderID` AS `OrderID`,`Orders`.`OrderDate` AS `OrderDate`,`Orders`.`ExpectedArrivalDate` AS `ExpectedArrivalDate`,`Orders`.`ShippedDate` AS `ShippedDate`,`Shippers`.`CompanyName` AS `ShipperName`,`Order Details`.`ProductID` AS `ProductID`,`Products`.`ProductName` AS `ProductName`,`Order Details`.`UnitPrice` AS `UnitPrice`,`Order Details`.`Quantity` AS `Quantity`,floor((`Order Details`.`UnitPrice` * `Order Details`.`Quantity`)) AS `ExtendedPrice`,`Orders`.`FreightAmount` AS `FreightAmount` from (((((`CustomersInfo` `Customers` left join `OrdersInfo` `Orders` on((`Customers`.`CustomerID` = `Orders`.`CustomerID`))) left join `EmployeesInfo` `Employees` on((`Employees`.`EmployeeID` = `Orders`.`EmployeeID`))) left join `OrderDetailsInfo` `Order Details` on((`Orders`.`OrderID` = `Order Details`.`OrderID`))) left join `ProductsInfo` `Products` on((`Products`.`ProductID` = `Order Details`.`ProductID`))) left join `ShippersInfo` `Shippers` on((`Shippers`.`ShipperID` = `Orders`.`ShipperID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_order_sales`
--

/*!50001 DROP VIEW IF EXISTS `vw_order_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=CURRENT_USER SQL SECURITY DEFINER */
/*!50001 VIEW `vw_order_sales` AS select `OrderDetailsInfo`.`OrderID` AS `OrderID`,sum((`OrderDetailsInfo`.`UnitPrice` * `OrderDetailsInfo`.`Quantity`)) AS `Sales` from `OrderDetailsInfo` group by `OrderDetailsInfo`.`OrderID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_above_average_price`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_above_average_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=CURRENT_USER SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_above_average_price` AS select `ProductsInfo`.`ProductName` AS `ProductName`,`ProductsInfo`.`UnitPrice` AS `UnitPrice` from `ProductsInfo` where (`ProductsInfo`.`UnitPrice` > (select avg(`ProductsInfo`.`UnitPrice`) from `ProductsInfo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 22:34:37
