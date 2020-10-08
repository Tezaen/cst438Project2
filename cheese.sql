-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: localhost    Database: cheese
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `totalCheeses`
--

DROP TABLE IF EXISTS `totalCheeses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totalCheeses` (
  `cheeseId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `cheeseName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `cost` mediumint(97) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `invnum` mediumint(97) NOT NULL,
  PRIMARY KEY (`cheeseId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalCheeses`
--

LOCK TABLES `totalCheeses` WRITE;
/*!40000 ALTER TABLE `totalCheeses` DISABLE KEYS */;
INSERT INTO `totalCheeses` VALUES (1,'Mozzarella',40,'Melt','https://upload.wikimedia.org/wikipedia/commons/5/57/Mozzarella_di_bufala3.jpg','Stretch goo to put on pizza and other stuff',10),(2,'Cheddar Cheese',35,'Flavor','https://pinconningcheese.com/wp-content/uploads/Mild-Cheddar-cropped.jpg','Standard Yellow flavorful cheese you can put in your sandwich',15),(3,'Cheese Wheel',889,'Parmesan','https://images.costco-static.com/ImageDelivery/imageService?profileId=12026540&itemId=845390-847&recipeName=680','A cheese wheel is a wheel or block of cured cheese that is typically still covered in a protective rind. Most cheeses are made in the shape of wheels, with cheese shops cutting out wedges when clients request a particular cheese.',1),(4,'Goronzola',15,'Topping','https://www.welcometothetable.coop/sites/default/files/wp-content/uploads/2011/06/Gorgonzola1_0.jpg','It can be buttery or firm, crumbly and quite salty, with a \"bite\" from its blue veining.',10),(5,'Kraft Easy Cheese Spray',20,'Spray','https://www.grocery.com/store/image/cache/catalog/kraft/kraft-easy-cheese-spray-can-variety-pack-of-4-shar-2-500x500.jpg','Cheese in a spray can :D',12),(6,'Bleu Cheese',15,'Topping','https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Bleu_de_Gex.jpg/1200px-Bleu_de_Gex.jpg','Stinky',300);
/*!40000 ALTER TABLE `totalCheeses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` tinyint(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'roob','roob'),(2,'mytzy','mytzy'),(3,'miguel','mytzy'),(4,'gerard','mytzy'),(5,'kim','mytzy'),(6,'angel','mytzy'),(7,'yeesus','mytzy'),(8,'chuy','mytzy'),(9,'chu','mytzy'),(10,'caas','mytzy'),(11,'humphrey','mytzy'),(12,'jenjen','mytzy'),(13,'theobald','mytzy'),(14,'trinh','mytzy'),(15,'escobar','mytzy'),(16,'mizel','mytzy'),(17,'doug','mytzy'),(18,'dimma','mytzy'),(19,'dome','mytzy'),(20,'bruce','mytzy'),(21,'mytzy17','$2b$10$lWCCVb1g4cRT1oOvQwuXMuEjGYARpeAmf0PlesqB.pajCsmI9ky7S'),(22,'yeet','$2b$10$sEpr7HwgSkIvWsvsgKEKdu57kTJ0oyFxiad5YfLValel79QdCvT86');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08  0:41:56
