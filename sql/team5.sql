-- MySQL dump 10.13  Distrib 5.1.67, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: poochi.t5
-- ------------------------------------------------------
-- Server version	5.1.67-log

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(75) NOT NULL,
  `qualifiers` text NOT NULL,
  `response` varchar(75) NOT NULL,
  `response_vars` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user defined actions triggered by certain events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_log`
--

DROP TABLE IF EXISTS `actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of triggered actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_log`
--

LOCK TABLES `actions_log` WRITE;
/*!40000 ALTER TABLE `actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores alerts subscribers information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_category`
--

DROP TABLE IF EXISTS `alert_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_id` (`alert_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores subscriber alert categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_category`
--

LOCK TABLES `alert_category` WRITE;
/*!40000 ALTER TABLE `alert_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_sent`
--

DROP TABLE IF EXISTS `alert_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `alert_id` bigint(20) unsigned NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `alert_id` (`alert_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores a log of alerts sent out to subscribers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_sent`
--

LOCK TABLES `alert_sent` WRITE;
/*!40000 ALTER TABLE `alert_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_banned`
--

DROP TABLE IF EXISTS `api_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='For logging banned API IP addresses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_banned`
--

LOCK TABLES `api_banned` WRITE;
/*!40000 ALTER TABLE `api_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_log`
--

DROP TABLE IF EXISTS `api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) NOT NULL,
  `api_parameters` varchar(100) NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='For logging API activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_log`
--

LOCK TABLES `api_log` WRITE;
/*!40000 ALTER TABLE `api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_settings`
--

DROP TABLE IF EXISTS `api_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing API logging settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_settings`
--

LOCK TABLES `api_settings` WRITE;
/*!40000 ALTER TABLE `api_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge`
--

DROP TABLE IF EXISTS `badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores description of badges to be assigned';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge`
--

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_users`
--

DROP TABLE IF EXISTS `badge_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_users` (
  `user_id` int(11) unsigned NOT NULL,
  `badge_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`badge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores assigned badge information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_users`
--

LOCK TABLES `badge_users` WRITE;
/*!40000 ALTER TABLE `badge_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_position` tinyint(4) NOT NULL DEFAULT '0',
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_image_thumb` varchar(255) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Holds information about categories defined for a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'en_US',0,'Location','Where the DIY shop located','ffffff','category_1_1414225277.png','category_1_1414225277_16x16.png',1,0),(2,0,'en_US',2,'Education','How to use machine','ffffff','category_2_1414225293.png','category_2_1414225293_16x16.png',1,0),(3,0,'en_US',1,'Community','Community for DIY projects','ffffff','category_3_1414225269.png','category_3_1414225269_16x16.png',1,0),(4,0,'en_US',3,'Trusted Reports','Reports from trusted reporters','339900',NULL,NULL,0,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_lang`
--

DROP TABLE IF EXISTS `category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Holds translations for category titles and descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_lang`
--

LOCK TABLES `category_lang` WRITE;
/*!40000 ALTER TABLE `category_lang` DISABLE KEYS */;
INSERT INTO `category_lang` VALUES (1,1,'ko_KR','DIY공간','공작소의 위치'),(2,2,'ko_KR','교육','기계 사용법 교육'),(3,3,'ko_KR','커뮤니티','커뮤니티 모임');
/*!40000 ALTER TABLE `category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores cities of countries retrieved by user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cluster`
--

DROP TABLE IF EXISTS `cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information used for clustering of reports on the map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cluster`
--

LOCK TABLES `cluster` WRITE;
/*!40000 ALTER TABLE `cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores comments made on reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='Stores a list of all countries and their capital cities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AD','Andorra','Andorra la Vella',0),(2,'AE','United Arab Emirates','Abu Dhabi',0),(3,'AF','Afghanistan','Kabul',0),(4,'AG','Antigua and Barbuda','St. John\'s',0),(5,'AI','Anguilla','The Valley',0),(6,'AL','Albania','Tirana',0),(7,'AM','Armenia','Yerevan',0),(8,'AN','Netherlands Antilles','Willemstad',0),(9,'AO','Angola','Luanda',0),(10,'AQ','Antarctica','',0),(11,'AR','Argentina','Buenos Aires',0),(12,'AS','American Samoa','Pago Pago',0),(13,'AT','Austria','Vienna',0),(14,'AU','Australia','Canberra',0),(15,'AW','Aruba','Oranjestad',0),(16,'AX','Aland Islands','Mariehamn',0),(17,'AZ','Azerbaijan','Baku',0),(18,'BA','Bosnia and Herzegovina','Sarajevo',0),(19,'BB','Barbados','Bridgetown',0),(20,'BD','Bangladesh','Dhaka',0),(21,'BE','Belgium','Brussels',0),(22,'BF','Burkina Faso','Ouagadougou',0),(23,'BG','Bulgaria','Sofia',0),(24,'BH','Bahrain','Manama',0),(25,'BI','Burundi','Bujumbura',0),(26,'BJ','Benin','Porto-Novo',0),(27,'BL','Saint Barthélemy','Gustavia',0),(28,'BM','Bermuda','Hamilton',0),(29,'BN','Brunei','Bandar Seri Begawan',0),(30,'BO','Bolivia','La Paz',0),(31,'BR','Brazil','Brasília',0),(32,'BS','Bahamas','Nassau',0),(33,'BT','Bhutan','Thimphu',0),(34,'BV','Bouvet Island','',0),(35,'BW','Botswana','Gaborone',0),(36,'BY','Belarus','Minsk',0),(37,'BZ','Belize','Belmopan',0),(38,'CA','Canada','Ottawa',0),(39,'CC','Cocos Islands','West Island',0),(40,'CD','Democratic Republic of the Congo','Kinshasa',0),(41,'CF','Central African Republic','Bangui',0),(42,'CG','Congo Brazzavile','Brazzaville',0),(43,'CH','Switzerland','Berne',0),(44,'CI','Ivory Coast','Yamoussoukro',0),(45,'CK','Cook Islands','Avarua',0),(46,'CL','Chile','Santiago',0),(47,'CM','Cameroon','Yaoundé',0),(48,'CN','China','Beijing',0),(49,'CO','Colombia','Bogotá',0),(50,'CR','Costa Rica','San José',0),(51,'CS','Serbia and Montenegro','Belgrade',0),(52,'CU','Cuba','Havana',0),(53,'CV','Cape Verde','Praia',0),(54,'CX','Christmas Island','Flying Fish Cove',0),(55,'CY','Cyprus','Nicosia',0),(56,'CZ','Czech Republic','Prague',0),(57,'DE','Germany','Berlin',0),(58,'DJ','Djibouti','Djibouti',0),(59,'DK','Denmark','Copenhagen',0),(60,'DM','Dominica','Roseau',0),(61,'DO','Dominican Republic','Santo Domingo',0),(62,'DZ','Algeria','Algiers',0),(63,'EC','Ecuador','Quito',0),(64,'EE','Estonia','Tallinn',0),(65,'EG','Egypt','Cairo',0),(66,'EH','Western Sahara','El-Aaiun',0),(67,'ER','Eritrea','Asmara',0),(68,'ES','Spain','Madrid',0),(69,'ET','Ethiopia','Addis Ababa',0),(70,'FI','Finland','Helsinki',0),(71,'FJ','Fiji','Suva',0),(72,'FK','Falkland Islands','Stanley',0),(73,'FM','Micronesia','Palikir',0),(74,'FO','Faroe Islands','Tórshavn',0),(75,'FR','France','Paris',0),(76,'GA','Gabon','Libreville',0),(77,'GB','United Kingdom','London',0),(78,'GD','Grenada','St. George\'s',0),(79,'GE','Georgia','Tbilisi',0),(80,'GF','French Guiana','Cayenne',0),(81,'GG','Guernsey','St Peter Port',0),(82,'GH','Ghana','Accra',0),(83,'GI','Gibraltar','Gibraltar',0),(84,'GL','Greenland','Nuuk',0),(85,'GM','Gambia','Banjul',0),(86,'GN','Guinea','Conakry',0),(87,'GP','Guadeloupe','Basse-Terre',0),(88,'GQ','Equatorial Guinea','Malabo',0),(89,'GR','Greece','Athens',0),(90,'GS','South Georgia and the South Sandwich Islands','Grytviken',0),(91,'GT','Guatemala','Guatemala City',0),(92,'GU','Guam','Hagåtña',0),(93,'GW','Guinea-Bissau','Bissau',0),(94,'GY','Guyana','Georgetown',0),(95,'HK','Hong Kong','Hong Kong',0),(96,'HM','Heard Island and McDonald Islands','',0),(97,'HN','Honduras','Tegucigalpa',0),(98,'HR','Croatia','Zagreb',0),(99,'HT','Haiti','Port-au-Prince',0),(100,'HU','Hungary','Budapest',0),(101,'ID','Indonesia','Jakarta',0),(102,'IE','Ireland','Dublin',0),(103,'IL','Israel','Jerusalem',0),(104,'IM','Isle of Man','Douglas, Isle of Man',0),(105,'IN','India','New Delhi',0),(106,'IO','British Indian Ocean Territory','Diego Garcia',0),(107,'IQ','Iraq','Baghdad',0),(108,'IR','Iran','Tehran',0),(109,'IS','Iceland','Reykjavík',0),(110,'IT','Italy','Rome',0),(111,'JE','Jersey','Saint Helier',0),(112,'JM','Jamaica','Kingston',0),(113,'JO','Jordan','Amman',0),(114,'JP','Japan','Tokyo',0),(115,'KE','Kenya','Nairobi',0),(116,'KG','Kyrgyzstan','Bishkek',0),(117,'KH','Cambodia','Phnom Penh',0),(118,'KI','Kiribati','South Tarawa',0),(119,'KM','Comoros','Moroni',0),(120,'KN','Saint Kitts and Nevis','Basseterre',0),(121,'KP','North Korea','Pyongyang',0),(122,'KR','South Korea','Seoul',0),(123,'KW','Kuwait','Kuwait City',0),(124,'KY','Cayman Islands','George Town',0),(125,'KZ','Kazakhstan','Astana',0),(126,'LA','Laos','Vientiane',0),(127,'LB','Lebanon','Beirut',0),(128,'LC','Saint Lucia','Castries',0),(129,'LI','Liechtenstein','Vaduz',0),(130,'LK','Sri Lanka','Colombo',0),(131,'LR','Liberia','Monrovia',0),(132,'LS','Lesotho','Maseru',0),(133,'LT','Lithuania','Vilnius',0),(134,'LU','Luxembourg','Luxembourg',0),(135,'LV','Latvia','Riga',0),(136,'LY','Libya','Tripolis',0),(137,'MA','Morocco','Rabat',0),(138,'MC','Monaco','Monaco',0),(139,'MD','Moldova','Chi_in_u',0),(140,'ME','Montenegro','Podgorica',0),(141,'MF','Saint Martin','Marigot',0),(142,'MG','Madagascar','Antananarivo',0),(143,'MH','Marshall Islands','Uliga',0),(144,'MK','Macedonia','Skopje',0),(145,'ML','Mali','Bamako',0),(146,'MM','Myanmar','Yangon',0),(147,'MN','Mongolia','Ulan Bator',0),(148,'MO','Macao','Macao',0),(149,'MP','Northern Mariana Islands','Saipan',0),(150,'MQ','Martinique','Fort-de-France',0),(151,'MR','Mauritania','Nouakchott',0),(152,'MS','Montserrat','Plymouth',0),(153,'MT','Malta','Valletta',0),(154,'MU','Mauritius','Port Louis',0),(155,'MV','Maldives','Malé',0),(156,'MW','Malawi','Lilongwe',0),(157,'MX','Mexico','Mexico City',0),(158,'MY','Malaysia','Kuala Lumpur',0),(159,'MZ','Mozambique','Maputo',0),(160,'NA','Namibia','Windhoek',0),(161,'NC','New Caledonia','Nouméa',0),(162,'NE','Niger','Niamey',0),(163,'NF','Norfolk Island','Kingston',0),(164,'NG','Nigeria','Abuja',0),(165,'NI','Nicaragua','Managua',0),(166,'NL','Netherlands','Amsterdam',0),(167,'NO','Norway','Oslo',0),(168,'NP','Nepal','Kathmandu',0),(169,'NR','Nauru','Yaren',0),(170,'NU','Niue','Alofi',0),(171,'NZ','New Zealand','Wellington',0),(172,'OM','Oman','Muscat',0),(173,'PA','Panama','Panama City',0),(174,'PE','Peru','Lima',0),(175,'PF','French Polynesia','Papeete',0),(176,'PG','Papua New Guinea','Port Moresby',0),(177,'PH','Philippines','Manila',0),(178,'PK','Pakistan','Islamabad',0),(179,'PL','Poland','Warsaw',0),(180,'PM','Saint Pierre and Miquelon','Saint-Pierre',0),(181,'PN','Pitcairn','Adamstown',0),(182,'PR','Puerto Rico','San Juan',0),(183,'PS','Palestinian Territory','East Jerusalem',0),(184,'PT','Portugal','Lisbon',0),(185,'PW','Palau','Koror',0),(186,'PY','Paraguay','Asunción',0),(187,'QA','Qatar','Doha',0),(188,'RE','Reunion','Saint-Denis',0),(189,'RO','Romania','Bucharest',0),(190,'RS','Serbia','Belgrade',0),(191,'RU','Russia','Moscow',0),(192,'RW','Rwanda','Kigali',0),(193,'SA','Saudi Arabia','Riyadh',0),(194,'SB','Solomon Islands','Honiara',0),(195,'SC','Seychelles','Victoria',0),(196,'SD','Sudan','Khartoum',0),(197,'SE','Sweden','Stockholm',0),(198,'SG','Singapore','Singapur',0),(199,'SH','Saint Helena','Jamestown',0),(200,'SI','Slovenia','Ljubljana',0),(201,'SJ','Svalbard and Jan Mayen','Longyearbyen',0),(202,'SK','Slovakia','Bratislava',0),(203,'SL','Sierra Leone','Freetown',0),(204,'SM','San Marino','San Marino',0),(205,'SN','Senegal','Dakar',0),(206,'SO','Somalia','Mogadishu',0),(207,'SR','Suriname','Paramaribo',0),(208,'ST','Sao Tome and Principe','São Tomé',0),(209,'SV','El Salvador','San Salvador',0),(210,'SY','Syria','Damascus',0),(211,'SZ','Swaziland','Mbabane',0),(212,'TC','Turks and Caicos Islands','Cockburn Town',0),(213,'TD','Chad','N\'Djamena',0),(214,'TF','French Southern Territories','Martin-de-Viviès',0),(215,'TG','Togo','Lomé',0),(216,'TH','Thailand','Bangkok',0),(217,'TJ','Tajikistan','Dushanbe',0),(218,'TK','Tokelau','',0),(219,'TL','East Timor','Dili',0),(220,'TM','Turkmenistan','Ashgabat',0),(221,'TN','Tunisia','Tunis',0),(222,'TO','Tonga','Nuku\'alofa',0),(223,'TR','Turkey','Ankara',0),(224,'TT','Trinidad and Tobago','Port of Spain',0),(225,'TV','Tuvalu','Vaiaku',0),(226,'TW','Taiwan','Taipei',0),(227,'TZ','Tanzania','Dar es Salaam',0),(228,'UA','Ukraine','Kiev',0),(229,'UG','Uganda','Kampala',0),(230,'UM','United States Minor Outlying Islands','',0),(231,'US','United States','Washington',0),(232,'UY','Uruguay','Montevideo',0),(233,'UZ','Uzbekistan','Tashkent',0),(234,'VA','Vatican','Vatican City',0),(235,'VC','Saint Vincent and the Grenadines','Kingstown',0),(236,'VE','Venezuela','Caracas',0),(237,'VG','British Virgin Islands','Road Town',0),(238,'VI','U.S. Virgin Islands','Charlotte Amalie',0),(239,'VN','Vietnam','Hanoi',0),(240,'VU','Vanuatu','Port Vila',0),(241,'WF','Wallis and Futuna','Matâ\'Utu',0),(242,'WS','Samoa','Apia',0),(243,'YE','Yemen','San‘a’',0),(244,'YT','Mayotte','Mamoudzou',0),(245,'ZA','South Africa','Pretoria',0),(246,'ZM','Zambia','Lusaka',0),(247,'ZW','Zimbabwe','Harare',0),(248,'XK','Kosovo','Pristina',0),(249,'SS','South Sudan','Juba',0);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externalapp`
--

DROP TABLE IF EXISTS `externalapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Info on external apps(mobile) that work with your deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externalapp`
--

LOCK TABLES `externalapp` WRITE;
/*!40000 ALTER TABLE `externalapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `externalapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed`
--

DROP TABLE IF EXISTS `feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information about RSS Feeds a deployment subscribes to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed`
--

LOCK TABLES `feed` WRITE;
/*!40000 ALTER TABLE `feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_item`
--

DROP TABLE IF EXISTS `feed_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) unsigned NOT NULL,
  `location_id` bigint(20) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_title` varchar(255) DEFAULT NULL,
  `item_description` text,
  `item_link` varchar(255) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_id` (`feed_id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores feed items pulled from each RSS Feed';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_item`
--

LOCK TABLES `feed_item` WRITE;
/*!40000 ALTER TABLE `feed_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_item_category`
--

DROP TABLE IF EXISTS `feed_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feed_item_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `feed_item_category_ids` (`feed_item_id`,`category_id`),
  KEY `feed_item_id` (`feed_item_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores fetched feed items categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_item_category`
--

LOCK TABLES `feed_item_category` WRITE;
/*!40000 ALTER TABLE `feed_item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `feed_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_title` (`form_title`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores all report submission forms created(default+custom)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (1,'공작소','소유하고 계신 기계 목록을 추가하실 수 있습니다.',1),(2,'기본','커뮤니티 미팅과 교육 일정을 리포트 할 수 있는 기본 폼입니다.',1);
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` text,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_visible` tinyint(4) NOT NULL DEFAULT '0',
  `field_ispublic_submit` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field_name`,`form_id`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores all custom form fields created by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field`
--

LOCK TABLES `form_field` WRITE;
/*!40000 ALTER TABLE `form_field` DISABLE KEYS */;
INSERT INTO `form_field` VALUES (1,1,'소유중인 공구',6,0,1,'CNC Router, CNC Miling, 3D Printer, Laser Cutter, 3D scanner, Electronic part',0,0,5,0,0,0);
/*!40000 ALTER TABLE `form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_field_option`
--

DROP TABLE IF EXISTS `form_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(200) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`),
  KEY `form_field_id` (`form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Options related to custom form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_field_option`
--

LOCK TABLES `form_field_option` WRITE;
/*!40000 ALTER TABLE `form_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_response`
--

DROP TABLE IF EXISTS `form_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) unsigned NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Stores responses to custom form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_response`
--

LOCK TABLES `form_response` WRITE;
/*!40000 ALTER TABLE `form_response` DISABLE KEYS */;
INSERT INTO `form_response` VALUES (1,1,3,''),(2,1,4,'CNC Router,CNC Miling,3D Printer,Laser Cutter,3D scanner,Electronic part'),(3,1,9,''),(4,1,10,''),(5,1,11,'CNC Router,CNC Miling,3D Printer,Laser Cutter'),(6,1,12,''),(7,1,13,''),(8,1,14,''),(9,1,15,'');
/*!40000 ALTER TABLE `form_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geometry`
--

DROP TABLE IF EXISTS `geometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geometry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `geometry` geometry NOT NULL,
  `geometry_label` varchar(150) DEFAULT NULL,
  `geometry_comment` varchar(255) DEFAULT NULL,
  `geometry_color` varchar(20) DEFAULT NULL,
  `geometry_strokewidth` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `geometry` (`geometry`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores map geometries i.e polygons, lines etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geometry`
--

LOCK TABLES `geometry` WRITE;
/*!40000 ALTER TABLE `geometry` DISABLE KEYS */;
/*!40000 ALTER TABLE `geometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` int(11) unsigned DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  `incident_zoom` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`),
  KEY `form_id` (`form_id`),
  KEY `user_id` (`user_id`),
  KEY `incident_mode` (`incident_mode`),
  KEY `incident_verified` (`incident_verified`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Stores reports submitted';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident`
--

LOCK TABLES `incident` WRITE;
/*!40000 ALTER TABLE `incident` DISABLE KEYS */;
INSERT INTO `incident` VALUES (5,5,2,'en_US',1,'[언메이크 랩] 라운드 테이블 : 누가 D.I.Y 시민을 만들까?','라운드 테이블 : 누가 D.I.Y 시민을 만들까?\n \n\'능동적 시민성\'을 강조하는 흐름이 점점 강해지고 있습니다. 이것은 사회의 구조가 자기 자발성으로 움직이는 시민들을 지원하는 방식으로 재편되는 흐름으로 나타나고 있습니다. 마을 만들기와 사회적 경제, 거버넌스의 확대적 양상에서도 이러한 흐름을 짚어볼 수 있습니다. 이러한 능동적 시민성에 대해서는 양가적인 시각이 존재합니다. \'국가가 행해야 할 영역을 민간의 영역 혹은 시민의 자발성으로 작동 시키기 위한 것\' 이라는 시선이 그 한 축이며, 또 다른 한축으로는 \'시민 사회가 자치적 역량을 넓혀가는 흐름이며 대안성을 가지고 있다\' 라는 시선이 있습니다. \'누가 D.I.Y 시민을 만들까\' 라는 제목으로 열리는 이 라운드 테이블은 두 가지 입장 모두에 시선을 두면서도 \'빅 소사이어티(big society)\'나 \'사회적 자본\' 등에 대한 거시적인 차원의 이야기가 아닌, 연결된 맥락에서 활동하는 분들과 직접적이고 현실적인 대화의 자리를 만들어 보려고 합니다. \n\n이것은 정말로 시민성의 토대를 강화하고 지원하는 방식으로 이루어 지고 있을까요? 그렇다면 시민성이란 무엇일까요? 한국처럼 관주도적 정책에 의해 많은 사회적 프로그램이 작동하는 사회에서 이러한 흐름은 현실에서는 어떻게 작동하고 있을까요? 이것은 국가도 시장도 해결하지 못하는 문제를 각자가 해결해야 하는 시기에 필연적으로 나타나는 새로운 구조일까요? 혁신과 창조가 어김없이 따라 붙는 여러가지 사회적 프로그램 속에서 우리는 정말로 삶의 능동적 회복을 위해 무언가를 하고 있는 것이 맞을까요? \n\n\n또한 이러한 D.I.Y. 시민성이 ‘만들기 문화’와 연결되는 양상은 어떨까요? 이번 라운드 테이블은 D.I.Y. 문화의 역사적, 의미적 맥락을 짚어보는 것과 동시에 \'능동적 시민성\'이 \'자발성\'의 정신과 밀접한 \'D.I.Y. 문화와는 어떤 공명을 이루고 있는지 생각해 보려고 합니다. 또한 제작(make) 문화와 신경제, 자립적 경제, 창조경제가 호응할 때, 그리고 그것이 \'D.I.Y 시민성\' 이라고 할 만한 폭 넓은 상징으로 나타날 때, 과연 그것은 어떠한 의미가 있는지에 대해서도 생각을 해보려고 합니다.\n\n\n과연 D.I.Y 시민을 만들고 있는 것은 (우리 자신을 포함해) 누구인지 질문을 던져 봅시다. 자립과 공유, 자치가 함께 강조되는 지금,  D.I.Y 문화와 시민성은 어떻게 연결되고 있는지를 이야기 나누는 이 자리에 비슷한 의문을 품었으나 풀길 없었던 당신의 참여를 환영합니다\n\n\n협업 _ 최영숙 \n\n런던대학 도시지리학 대학원에서 &lt;젠더 소수자와 일상 공간의 관계&gt;를 주제로 박사학위를 취득한 후, 도시의 소외 계층과 다양성에 관련한 주제들에 중점을 두고 연구 작업과 공공문화예술 프로그램들을 기획해왔다. 그중 도시 내 소규모 제조 공간 및 생산 공동체의 회복 가능성에 관심을 두고, &lt;락희럭키구로공단&gt; 프로젝트를 진행 했다. \nselfmadecities.net','2014-10-25 15:42:00',1,1,1,'2014-10-25 15:44:10',NULL,'2014-10-25 16:15:43',2,7),(4,4,1,'en_US',1,'FABLAB Seoul','Fab Lab (Fabrication Laboratory)은 레이저 커터, 3D 프린터 등 디지털 제작장비들을 통해 자신의 아이디어를 구현할 수 있는 공간입니다.\n\nFab Lab은 공공도서관과 같이 누구나 찾아와이용할 수 있는 공공 제작공간으로, MIT 미디어랩에서 처음 탄생하여 현재 세계 36개국 127개소가 운영 중입니다.\n\nFab Lab은 사람들에게 디지털 기술을 이용해 사물을 제작하는 새로운 방법을 교육하는데 중점을 두고 있습니다.\n\n레이저 커터, CNC 라우터, 3D 프린터 등의 디지털 제작(Digital Fabrication)장비 들은 사용자의 숙련도가 완성품의 품질에 미치는 영향이 적고 동일한 품질로 반복 생산이 가능한 것이 특징입니다.\n\n이러한 장비들을 이용하면 어린아이나 복잡한 기술에 익숙하지 않은 사람들도 쉽게 자신의 아이디어를 실제로 구현할 수 있습니다.\n팹랩 네트워크는 무엇을 제공하나요?\n네트워크는 하나의 랩에서 해결가능한 역량을 넘어서는 운영, 교육, 기술, 재정, 물류적 지원을 제공합니다.\n\n누가 랩을 이용할 수 있나요?\n팹랩은 개인 차원에서, 또는 행사를 위해 이용가능한 지역사회의 자원입니다.\n\n랩을 이용할 때 따르는 책임은 무엇이 있나요?\n\n안전: 사람과 기계를 다치게 하지 말 것\n운영: 청소, 관리, 랩의 개선을 도울 것 기록과 설명을 통해 랩의 지식 향상에 기여할 것\n팹랩의 창작물들은 누가 소유하나요?\n팹랩에서 태어난 디자인과 프로세스들은 창작자의 선택에 따라 보호받을 수 있으며 판매가 가능합니다. 그러나 개인들이 이를 사용하고 배울 수 있도록 접근이 가능해야 합니다.\n\n상업적 용도의 랩 이용은 어떻게 해야하나요?\n상업적 활동은 팹랩에서 제작되고 배양될 수 있으나 랩의 다른 용도들과 충돌해서는 안됩니다. 상업적 활동은 랩안에 남아있기보다 랩 너머로 성장해야하며, 그 성공에 기여한 발명가, 랩, 네트워크에 유익한 것이어야 합니다.','2014-10-25 15:07:00',1,1,1,'2014-10-25 15:11:21',NULL,'2014-10-25 16:16:20',2,16),(3,3,1,'en_US',1,'무한상상실','창의성을 경제의 핵심가치로 두고 새로운 부가가치, 일자리, 성장동력을 만들어 내는 경제\n\n국민의 창의성과 과학기술, 정보통신기술의 융합을 통해 산업과 산업이 융합하고 산업과 문화가 융합해 새로운 부가가치를 창출함으로써 새로운 성장동력과 일자리를 만들어 내는 경제','2014-10-25 14:48:00',1,1,1,'2014-10-25 15:03:59',NULL,'2014-10-25 16:17:02',2,9),(6,6,2,'en_US',1,'[공공도큐먼트3 : 다들 만들고 계십니까?] 출간회를 기념한 \'제작의 정치\' 토크에 초대합니다.','참가 신청 -&gt; <a href=\"https://docs.google.com/forms/d/1OvseahcfqhNCnEVtxSqVpi2Lrx8sGDUFUEnOAT7Dykw/viewform\">신청하러 가기</a>\n\n* 공간이 작아 인원을 파악할 수 있게 신청서 작성을 부탁드립니다.\n \n\n이날 출간 기념회는 고규흔, 조동원씨의 발표 이후 참여하신 분들과 함께 서로 소개도 하고 맥주도 한잔 하려고 합니다.오실 때 나눌 수 있는 먹을거리 마실거리를 가지고 와주시면 더욱 좋습니다. :)\n\n \n\n제작의 정치\n\n진행 _ 고규흔, 조동원 \n\n청개구리 제작소와 미디어버스가 공동 기획,편집한 &lt;공공도큐멘트3 : 다들 만들고 계십니까?&gt;는 제작기술문화에 대한 여러 지형과 내용을 담고 있는 탐색서입니다. 책에서는 지금의 제작 문화를 관통하는 여러 개념을 담음과 동시에 그것이 변화시키고 있는 정치, 경제, 기술, 문화적 지형을 추적하고 있습니다. 또한 많은 글들이 제작문화의 부상에 따른 노동의 변화를 다루며, 제작문화가 우리 사회에서 어떤 의미를 가지고 생산적인 도구로 활용될 수 있을지에 대한 질문을 던집니다. 오는 17일 (금), &lt;공공 도큐멘트 3 :다들 만들고 계십니까?&gt; 출간을  기념하며 함께 제작문화에 대한 이야기를 나눌 수 있는 자리를 마련했습니다. 책의 저자로 참여한 조동원, 고규흔이 &lt;제작의 정치&gt;라는 주제로 대화의 문을 열어 줄 예정이며 이후 서로 인사를 나누며 이야기를 자리가 될 예정입니다. 소박한 음식을 준비하고 기다리고 있겠습니다 :)','2014-10-25 15:44:00',1,1,1,'2014-10-25 15:45:13',NULL,'2014-10-25 16:15:08',2,9),(7,7,2,'en_US',1,'진동젤리  공연 @ 변방연극제 서울역 284 RTO','7월 중순, 청개구리제작소는 이글거리는 태양 아래 디스코-텍 옥상에서 진동젤리의 연극 &lt;법앞에서&gt;의 설치물을 제작했습니다.&lt;법앞에서&gt;는 콜트콜텍 해고노동자들 x 까페 그 x 진동젤리 가 함께 만들어 서울역 284 RTO홀에서 7월 25일부터 3일동안 공연! \n\n\n좁은 공간이라 옥상에서 설치물을 만들며 집주인의 핍박에 짐들을 이리저리 옮겨야 했던 며칠. 그 설치물이 연극 마친 후 출연진과 스텝, 관객들의 손길로 순식간에 해체되어 버려지는 모습도 호쾌하군요. 설치물이라기보다는 공간을 재구성하는 \'불공정한\' 혹은 \'말많은 사물\'들을 만들며 다른 방식의 제작 그리고 공연 예술과의 결합에, 재현과 표현의 양식에 생각해 볼 수 있었던 기회였지요.\n\n공연을 지켜보며 배운 것. 법은 정의가 아니라 소송일 뿐, 아무 것도 해결해주지 못한다.','2014-10-25 15:45:00',1,1,1,'2014-10-25 15:46:30',NULL,'2014-10-25 16:13:15',2,17),(8,8,2,'en_US',1,'전술적 기술 캠프 공유회 기록','2013년 6월 ‘증거과 영향 (evidence &amp; influence)’ 이라는 주제로 밀라노 인근의 마을에서 열린 ‘전술적 기술 캠프’는 세계 각지에서 140여명의 활동가, 예술가, 디자이너, 연구자들이 참여해 정보/인터넷 기술을 기반으로 한 정보 수집, 조사,데이터 시각화, 캠페인 조직등의 방식으로 사회 이슈에 개입하는 전술을 공유하는 7일간의 캠프였습니다. \n\n이 캠프에 참여한 청개구리제작소 요원의 경험을 나누는 &lt;전술적 기술 캠프&gt; 공유회가 12월 3일 7:00 어쩌면 사무소에서 있었습니다. 관심을 가지고 참여해 주신 활동가 분들께 감사드립니다.\n\n아래 문서는 전술적 기술 캠프 공유회를 준비하는 과정에서 만들어졌으며 자율적으로 공유되고 배포될 수 있습니다.','2014-10-25 15:46:00',1,1,1,'2014-10-25 15:47:55',NULL,'2014-10-25 15:53:56',2,9),(9,9,1,'en_US',1,'삼각산재미난마을사업단','재미있게 사는 사람들이 모인 \'재미난마을’을 아시나요?\n서울시 강북구에 자리한 재미난마을은 수유동, 인수동, 우이동 등에 사는 사람들이 여러 활동을 함께 하는 공간이다.\n재미난마을에는 마을배움터, 마을사랑방 재미난카페와 마을목수공작단을 개설 등 지역 내 생활문화공동체 활성화를 꾀하는 ‘삼각산재미난마을 사업단’이꾸려져있다.\n그 중에서도 재미난마을 사람들이 자주 모이는 장소는 ‘마을카페 재미난’. 재미난은 작은 공연이나 전시회, 음악회도 볼 수 있으며, 공부를 하거나 다양한 프로그램을 배울 수 있는 놀이터이다. 또한 이 곳은 마을 사람들의 책을 모아 두어 도서관으로도 활용 되기도 한다.\n재미난마을은 2003년 ‘삼각산재미난학교’라는 대안학교가 만들어지면서 시작됐다. 무척 평화롭고 아름다운 풍경을 지닌 이 곳은 일반 주택을 직접 고쳐서 만들었다. 그들은 ‘따뜻한 돌봄과 자유로운 배움이 일어나는 마을 속 학교공동체’라고 설명하고 있다.\n학교 밖에서도 마을의 배움은 자란다. 마을 자체가 주민들의 평생교육의 장이 되는 셈이다. 마을 주민 각자가 갖고 있는 재능을 다른 사람들과 나누기 때문에 가능한 것이다. 이렇듯 재미난마을에는 일상의 배움을 모아내고 나누는 순환과정이 있다.\n재미난마을을 여럿이 함께 탐방하고 싶다면, 사단법인 삼각산재미난마을 사무국(070-7525-3868)으로 연락하면 된다.','2014-10-25 17:50:00',1,1,1,'2014-10-25 17:58:17',NULL,NULL,2,6),(10,10,1,'en_US',1,'서울테크노파크','.','2014-10-25 18:05:00',1,1,1,'2014-10-25 18:10:23',NULL,NULL,2,12),(11,11,1,'en_US',1,'시제품제작터','디자인ㆍ제품설계ㆍ시제품으로 이어지는 원스톱서비스를 지원하여, 초기(예비) 창업자의 아이디어를 시제품으로 제작하는 사업입니다. 3년 미만 중소기업, 예비창업자, 20인 이하 소기업, 수출유망 중소기업을 우선 지원해 드립니다.','2014-10-25 18:35:00',1,1,1,'2014-10-25 18:42:25',NULL,NULL,2,15),(12,12,1,'en_US',1,'세미나x워크샵 2회','&lt;데이터 공작 오픈 세미나 x 워크숍&gt;\n \n\n\'데이터 공작\'에서는 데이터라는 이 시대의 주요한 방식을 바라봅니다. 한쪽에선 데이터가 새로운 광맥이며 시장이라며 떠들썩하고, 또 한쪽에서는 개인 정보 침해의 문제, 정보 자본의 토대가 되고 있다는 경고음이 날카롭습니다.이미 페이스북, 신용카드 정보 등 개인 데이터에 접근할 수 있는 권한은 판매되고 있으며, 곧 \'내 (데이터) 프라이버시는 얼마 받을 수 있지? 라고 묻게 될 거 같습니다. 몰래 추적하고 누출한 데이터를 거래하는 암시장이건, 스스로의 생활을 자가 추적(self-tracking)하여 이루는 자기 혁신과 관리이든, 우리는 이미 데이터의 대량 생산자이며 소비자 혹은 공유자인 시대를 살고 있습니다.  그 사이에서 우리는 이런 데이터로 만들어지는 변화에 대한 생각을 충분히 하지 못하고 있습니다. 이 트랙에서는 데이터에 대한 다양한 관점을 나누고 자신의 데이터에 대해 다루어 보는 시간을 가져보려고 합니다. \n\n\n정보화 시대의 데이터 _ 이태호 \n\n데이터가 범람하는 시대에, 원하는 것을 알지 못하는 것은 마치 자본주의 사회에서 돈 없이 사는 듯 합니다. 그러면 지금 시대에 필요한 데이터에 대해 알아보는 것은 어떤 의미일까요. 데이터를 찾고, 조합해 가는 시간을 통해서 가려져 있던 데이터에 새로운 의미를 부여하고 바라보는 시간을 만들어 볼 예정입니다. \n \n\n데비관 (데이터 신비주의 관점) _ 최승준\n\n수비관 (数秘觀, Numerology)이 숫자와 사람, 장소, 사물, 문화 등의 사이에 숨겨진 의미와 연관성에 대해 생각해 보는 것이라면 데비관은 데이터에 대해서 그와 비슷한 생각하기를 시도해 보는 것입니다. 숫자, 특히 이진수와 큰 관계가 있으며 부호, 신호, 기호, 정보에 대한 여러가지 이야기를 담아보려고 합니다. 나의 존재를 태초로 거슬러 올라가 보는 생각을 한다거나, 있고 없음이 자아내는 다양한 조합, 거기에 의미를 부여하고자 했던 사람들의 이야기 혹은 주관적인 발상을 담은 엉뚱한 이야기가 될 예정입니다.','2014-10-25 18:42:00',1,1,1,'2014-10-25 18:45:33',NULL,'2014-10-25 19:02:19',2,9),(13,13,1,'en_US',1,'세미나x워크샵','&lt;데이터 공작 오픈 세미나 x 워크숍&gt;\n \n\n\'데이터 공작\'에서는 데이터라는 이 시대의 주요한 방식을 바라봅니다. 한쪽에선 데이터가 새로운 광맥이며 시장이라며 떠들썩하고, 또 한쪽에서는 개인 정보 침해의 문제, 정보 자본의 토대가 되고 있다는 경고음이 날카롭습니다.이미 페이스북, 신용카드 정보 등 개인 데이터에 접근할 수 있는 권한은 판매되고 있으며, 곧 \'내 (데이터) 프라이버시는 얼마 받을 수 있지? 라고 묻게 될 거 같습니다. 몰래 추적하고 누출한 데이터를 거래하는 암시장이건, 스스로의 생활을 자가 추적(self-tracking)하여 이루는 자기 혁신과 관리이든, 우리는 이미 데이터의 대량 생산자이며 소비자 혹은 공유자인 시대를 살고 있습니다.  그 사이에서 우리는 이런 데이터로 만들어지는 변화에 대한 생각을 충분히 하지 못하고 있습니다. 이 트랙에서는 데이터에 대한 다양한 관점을 나누고 자신의 데이터에 대해 다루어 보는 시간을 가져보려고 합니다. \n\n\n정보화 시대의 데이터 _ 이태호 \n\n데이터가 범람하는 시대에, 원하는 것을 알지 못하는 것은 마치 자본주의 사회에서 돈 없이 사는 듯 합니다. 그러면 지금 시대에 필요한 데이터에 대해 알아보는 것은 어떤 의미일까요. 데이터를 찾고, 조합해 가는 시간을 통해서 가려져 있던 데이터에 새로운 의미를 부여하고 바라보는 시간을 만들어 볼 예정입니다. \n \n\n데비관 (데이터 신비주의 관점) _ 최승준\n\n수비관 (数秘觀, Numerology)이 숫자와 사람, 장소, 사물, 문화 등의 사이에 숨겨진 의미와 연관성에 대해 생각해 보는 것이라면 데비관은 데이터에 대해서 그와 비슷한 생각하기를 시도해 보는 것입니다. 숫자, 특히 이진수와 큰 관계가 있으며 부호, 신호, 기호, 정보에 대한 여러가지 이야기를 담아보려고 합니다. 나의 존재를 태초로 거슬러 올라가 보는 생각을 한다거나, 있고 없음이 자아내는 다양한 조합, 거기에 의미를 부여하고자 했던 사람들의 이야기 혹은 주관적인 발상을 담은 엉뚱한 이야기가 될 예정입니다.','2014-10-25 18:42:00',1,1,1,'2014-10-25 18:45:44',NULL,NULL,2,9),(14,14,1,'en_US',1,'도끼빗과 자작 베틀 만들기','하세요 당신의 환대와 우리의 환대가 만나는 곳,\n가옥 X 청개구리 제작소입니다.\n\n우리의 기품 어린 생활을 위한 기예!\n그간 여러 사람들이 지대한 관심을 표하셨던\n&lt;자작 베틀 만들기&gt; 워크샵을 열어보려고 합니다.\n \n\n<b>무엇을?</b>\n\n우리는 가장 단순한 형태의\n자작 베틀을 만들어 보려고 합니다.\n\n(이런 형태들이죠) http://bit.ly/108arA2\n\n이 베틀은 사각 프레임 + 못으로 제작할 수 있으며\n특별히 다른 방식에 대한 아이디어가 없는 분은 \n이 방식으로 만들어도 됩니다.\n\n하지만 이 외에도 다양한 방식의 베틀 만들기가 가능합니다.\n나뭇가지나 골판지로 만들수도 있고 창틀을\n재활용해 만들 수도 있습니다.\n\n단순한 베틀의 방식이니 재료에 대해서는\n여러가지 방식으로 상상할 수 있습니다.\n아래 이미지와 동영상들을 참고해 주세요\n\n하지만 너무 복잡하면 4시간 안에 제작하기 어려우니\n난이도를 조절해 주세요. \n \n\n<b>어떻게?</b>\n\n&lt;자작 베틀 만들기&gt; 워크샵은 연구 워크샵이며\n이것은 여러 사람이 다양한 아이디어와 자료를\n공유하고, 돕고 연구해 가며 만드는 방법입니다.\n\n그리고 최종적으로 이 연구 워크샵에서\n나온 아이디어와 과정들은 묶어서 다른 분들이 참고할 수\n있도록 간단한 &lt;자가 베틀 제작 매뉴얼&gt; 을 만들어\n공유해 보려고 합니다.\n\n\n<b>일시</b>\n\n4월 6일, 13일(토) 2시-6시\n(6일은 베틀 제작을,13일은 베틀로 천짜기를 할 예정입니다)\n\n\n<b>장소</b>\n\n안국동 가옥\n\n3호선 안국역 1번 출구, 스타벅스 골목으로 직진,\n용화당 한의원을 지나 좀더 올라오면\n카페 지유카오카 8번가(JIYUGAOKA 8)\n옆 골목에 있는 한옥이 가옥입니다\n\n\n<b>참여인원</b>\n\n10명','2014-10-25 18:45:00',1,1,1,'2014-10-25 18:49:20',NULL,NULL,2,11),(15,15,1,'en_US',1,'실크 스크린 공유 포럼 보고 &amp; zine 다운로드 안내','10월 27일 토요일 문래동 프로젝트 공간 lab 39에서 열린\n실크 스크린 공유 포럼 &lt;기적의 실크 스크린 : 밀어라 찍힐 것이다&gt;가\n많은 분들의 참여 속에 잘 마무리 되었습니다.\n\n이번 포럼은 9월, 10월 동안 8명의 작업자가 실크 스크린의 전 과정을 탐색하며\n진행한 &lt;실크 스크린 연구 워크샵&gt;의 과정과 결과를 공유하기 위한 포럼이었는데요,\n실크 스크린 작업에 목 마른 많은 분들이\n맥주와 와인, 케익까지 풍성한 선물들을 가지고 참석해 주셨습니다 :)\n\n이날 포럼에서 연구 워크샵을 함께 진행한 작업자들이 공동 제작한\n-실크스크린 과정을 정리한 간단한 zine도 선보였는데요,\n관련 자료는 facebook 실크스크린 연구 워크샵 그룹에서  PDF 형태로 다운로드 받을 수 있습니다.\n\nhttp://www.facebook.com/groups/silkscreen/\n\n연구 워크샵을 함께 해 주시고, 공유 포럼, zine 제작까지 함께 해주신 작업자 분들,\n그리고 공유 포럼에 참석하신 분들 모두에게 감사를! ^^','2014-10-25 18:49:00',1,1,1,'2014-10-25 18:53:37',NULL,NULL,2,11);
/*!40000 ALTER TABLE `incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_category`
--

DROP TABLE IF EXISTS `incident_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`),
  KEY `incident_id` (`incident_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Stores submitted reports categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_category`
--

LOCK TABLES `incident_category` WRITE;
/*!40000 ALTER TABLE `incident_category` DISABLE KEYS */;
INSERT INTO `incident_category` VALUES (16,5,3),(17,4,1),(18,3,1),(15,6,3),(14,7,3),(9,8,3),(19,9,1),(20,10,1),(21,11,1),(30,12,2),(29,12,1),(24,13,1),(25,13,2),(26,14,2),(27,15,3),(28,15,2);
/*!40000 ALTER TABLE `incident_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_lang`
--

DROP TABLE IF EXISTS `incident_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds translations for report titles and descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_lang`
--

LOCK TABLES `incident_lang` WRITE;
/*!40000 ALTER TABLE `incident_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incident_person`
--

DROP TABLE IF EXISTS `incident_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Holds information provided by people who submit reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_person`
--

LOCK TABLES `incident_person` WRITE;
/*!40000 ALTER TABLE `incident_person` DISABLE KEYS */;
INSERT INTO `incident_person` VALUES (16,3,'','','',NULL,NULL,'2014-10-25 16:17:02'),(15,4,'','','',NULL,NULL,'2014-10-25 16:16:20'),(14,5,'','','',NULL,NULL,'2014-10-25 16:15:43'),(13,6,'','','',NULL,NULL,'2014-10-25 16:15:08'),(12,7,'','','',NULL,NULL,'2014-10-25 16:13:15'),(7,8,'','','',NULL,NULL,'2014-10-25 15:53:56'),(17,9,'','','',NULL,NULL,'2014-10-25 17:58:17'),(18,10,'','','',NULL,NULL,'2014-10-25 18:10:23'),(19,11,'','','',NULL,NULL,'2014-10-25 18:42:25'),(24,12,'','','',NULL,NULL,'2014-10-25 19:02:20'),(21,13,'','','',NULL,NULL,'2014-10-25 18:45:44'),(22,14,'','','',NULL,NULL,'2014-10-25 18:49:20'),(23,15,'','','',NULL,NULL,'2014-10-25 18:53:38');
/*!40000 ALTER TABLE `incident_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer`
--

DROP TABLE IF EXISTS `layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) DEFAULT NULL,
  `layer_url` varchar(255) DEFAULT NULL,
  `layer_file` varchar(100) DEFAULT NULL,
  `layer_color` varchar(20) DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds static layer information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer`
--

LOCK TABLES `layer` WRITE;
/*!40000 ALTER TABLE `layer` DISABLE KEYS */;
/*!40000 ALTER TABLE `layer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) DEFAULT NULL,
  `level_description` varchar(200) DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores level of trust assigned to reporters of the platform';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'SPAM + Delete','SPAM + Delete',-2),(2,'SPAM','SPAM',-1),(3,'Untrusted','Untrusted',0),(4,'Trusted','Trusted',1),(5,'Trusted + Verify','Trusted + Verify',2);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Stores location information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (5,'문래1동 새마을문고, 경인로 (Gyeongin St), 문래동 (Mullae-dong), 영등포구, 서울특별시, 121839, 대한민국',122,37.5136,126.897528,1,'2014-10-25 16:15:43'),(4,'세운상가 550호, 장사동 116-4, 종로구, 서울특별시, 대한민국',122,37.568885,126.995304,1,'2014-10-25 16:16:20'),(3,'국립과천과학관(Gwacheon National Science Museum), 312, 과천동, 과천시, 경기도, 대한민국',0,37.438487,127.006152,1,'2014-10-25 16:17:02'),(6,'문래1동 새마을문고, 경인로 (Gyeongin St), 문래동 (Mullae-dong), 영등포구, 서울특별시, 121839, 대한민국',122,37.5136,126.897528,1,'2014-10-25 16:15:08'),(7,'서울역, 한강대로, 회현동 (Hoehyeon-dong), 중구, 서울특별시, 100-790, 대한민국',122,37.55488,126.97231,1,'2014-10-25 16:13:15'),(8,'약수동, 다산로 (Dasanno), 약수동 (Yaksu-dong), 중구, 서울특별시, 대한민국',122,37.55283,127.00926,1,'2014-10-25 15:53:56'),(9,'수유동, 강북구, 서울특별시, 대한민국',0,37.63697,127.00573,1,'2014-10-25 17:58:17'),(10,'공릉로, 하계1동 (Hagye1-dong), 하계동, 노원구, 서울특별시, 대한민국',0,37.631819,127.072849,1,'2014-10-25 18:10:23'),(11,'수원시영통구, 경기도, 대한민국',0,37.251375,127.078062,1,'2014-10-25 18:42:25'),(12,'아르코미술관, 대학로, 이화동, 종로구, 서울특별시, 110-810, 대한민국',122,37.580239,127.00314,1,'2014-10-25 19:02:19'),(13,'아르코미술관, 대학로, 이화동, 종로구, 서울특별시, 110-810, 대한민국',0,37.580239,127.00314,1,'2014-10-25 18:45:44'),(14,'안국동, 우정국로 (Ujeonggungno), 종로1.2.3.4가동 (Jongno-1.2.3.4 ga-dong), 종로 (Jongno-dong), 종로구, 서울특별시, 대한민국',0,37.57458,126.98269,1,'2014-10-25 18:49:20'),(15,'문래동 (Mullae-dong), 영등포구, 서울특별시, 대한민국',0,37.515251,126.892854,1,'2014-10-25 18:53:37');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance` (
  `allowed_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`allowed_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Puts a site in maintenance mode if data exists in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) DEFAULT NULL,
  `media_description` longtext,
  `media_link` varchar(255) DEFAULT NULL,
  `media_medium` varchar(255) DEFAULT NULL,
  `media_thumb` varchar(255) DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`),
  KEY `location_id` (`location_id`),
  KEY `badge_id` (`badge_id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='Stores any media submitted along with a report';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (20,4,4,NULL,NULL,4,NULL,NULL,'http://fablab-seoul.org/',NULL,NULL,'2014-10-25 16:16:20',1),(22,3,3,NULL,NULL,4,NULL,NULL,'http://www.ideaall.net/main/Main.do?req_site_id=HOMEPAGE',NULL,NULL,'2014-10-25 16:17:02',1),(23,3,3,NULL,NULL,1,NULL,NULL,'3_1_1414221422.jpg','3_1_1414221422_m.jpg','3_1_1414221422_t.jpg','2014-10-25 16:17:02',1),(21,4,4,NULL,NULL,1,NULL,NULL,'4_1_1414221380.jpg','4_1_1414221380.jpg','4_1_1414221380_t.jpg','2014-10-25 16:16:20',1),(14,7,7,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/1609',NULL,NULL,'2014-10-25 16:13:15',1),(15,7,7,NULL,NULL,1,NULL,NULL,'7_1_1414221195.jpg','7_1_1414221195_m.jpg','7_1_1414221195_t.jpg','2014-10-25 16:13:15',1),(16,6,6,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/1659',NULL,NULL,'2014-10-25 16:15:08',1),(17,6,6,NULL,NULL,1,NULL,NULL,'6_1_1414221308.jpg','6_1_1414221308_m.jpg','6_1_1414221308_t.jpg','2014-10-25 16:15:08',1),(18,5,5,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/1666',NULL,NULL,'2014-10-25 16:15:43',1),(19,5,5,NULL,NULL,1,NULL,NULL,'5_1_1414221343.jpg','5_1_1414221343_m.jpg','5_1_1414221343_t.jpg','2014-10-25 16:15:43',1),(24,NULL,NULL,NULL,NULL,1,NULL,NULL,'banner_1414226215.png','banner_1414226215_m.png','banner_1414226215_t.png','2014-10-25 17:36:55',1),(25,NULL,NULL,NULL,NULL,1,NULL,NULL,'banner_1414226275.png','banner_1414226275_m.png','banner_1414226275_t.png','2014-10-25 17:37:55',1),(26,9,9,NULL,NULL,4,NULL,NULL,'http://cafe.naver.com/maeulro53',NULL,NULL,'2014-10-25 17:58:17',1),(27,9,9,NULL,NULL,1,NULL,NULL,'9_1_1414227497.jpg','9_1_1414227497_m.jpg','9_1_1414227497_t.jpg','2014-10-25 17:58:17',1),(31,NULL,NULL,NULL,NULL,1,NULL,NULL,'banner_1414229170.png','banner_1414229170_m.png','banner_1414229170_t.png','2014-10-25 18:26:11',1),(29,10,10,NULL,NULL,1,NULL,NULL,'10_1_1414228223.jpg','10_1_1414228223.jpg','10_1_1414228223_t.jpg','2014-10-25 18:10:23',1),(32,11,11,NULL,NULL,1,NULL,NULL,'11_1_1414230145.jpg','11_1_1414230145_m.jpg','11_1_1414230145_t.jpg','2014-10-25 18:42:25',1),(48,12,12,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/1646',NULL,NULL,'2014-10-25 19:02:19',1),(34,13,13,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/1646',NULL,NULL,'2014-10-25 18:45:44',1),(35,13,13,NULL,NULL,1,NULL,NULL,'13_1_1414230344.jpg','13_1_1414230344_m.jpg','13_1_1414230344_t.jpg','2014-10-25 18:45:44',1),(36,14,14,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/1023',NULL,NULL,'2014-10-25 18:49:20',1),(37,14,14,NULL,NULL,1,NULL,NULL,'14_1_1414230560.jpg','14_1_1414230560_m.jpg','14_1_1414230560_t.jpg','2014-10-25 18:49:20',1),(38,15,15,NULL,NULL,4,NULL,NULL,'http://www.fabcoop.org/archives/727',NULL,NULL,'2014-10-25 18:53:37',1),(39,15,15,NULL,NULL,1,NULL,NULL,'15_1_1414230817.jpg','15_1_1414230817_m.jpg','15_1_1414230817_t.jpg','2014-10-25 18:53:37',1),(40,15,15,NULL,NULL,1,NULL,NULL,'15_2_1414230817.jpg','15_2_1414230817_m.jpg','15_2_1414230817_t.jpg','2014-10-25 18:53:37',1),(41,15,15,NULL,NULL,1,NULL,NULL,'15_3_1414230817.jpg','15_3_1414230817_m.jpg','15_3_1414230817_t.jpg','2014-10-25 18:53:37',1),(42,15,15,NULL,NULL,1,NULL,NULL,'15_4_1414230817.jpg','15_4_1414230817_m.jpg','15_4_1414230817_t.jpg','2014-10-25 18:53:38',1),(43,15,15,NULL,NULL,1,NULL,NULL,'15_5_1414230818.jpg','15_5_1414230818_m.jpg','15_5_1414230818_t.jpg','2014-10-25 18:53:38',1),(44,15,15,NULL,NULL,1,NULL,NULL,'15_6_1414230818.jpg','15_6_1414230818_m.jpg','15_6_1414230818_t.jpg','2014-10-25 18:53:38',1),(45,15,15,NULL,NULL,1,NULL,NULL,'15_7_1414230818.jpg','15_7_1414230818_m.jpg','15_7_1414230818_t.jpg','2014-10-25 18:53:38',1),(46,15,15,NULL,NULL,1,NULL,NULL,'15_8_1414230818.jpg','15_8_1414230818_m.jpg','15_8_1414230818_t.jpg','2014-10-25 18:53:38',1),(47,15,15,NULL,NULL,1,NULL,NULL,'15_9_1414230818.jpg','15_9_1414230818_m.jpg','15_9_1414230818_t.jpg','2014-10-25 18:53:38',1),(49,12,12,NULL,NULL,1,NULL,NULL,'12_1_1414231339.jpg','12_1_1414231339_m.jpg','12_1_1414231339_t.jpg','2014-10-25 19:02:20',1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT '0',
  `reporter_id` bigint(20) unsigned DEFAULT NULL,
  `service_messageid` varchar(100) DEFAULT NULL,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin), 3 - DELETED',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0' COMMENT '0 - UNREAD, 1 - READ, 99 - SPAM',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `reporter_id` (`reporter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores tweets, emails and SMS messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openid`
--

DROP TABLE IF EXISTS `openid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `openid_email` varchar(127) NOT NULL,
  `openid_server` varchar(255) NOT NULL,
  `openid_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores users’ openid information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openid`
--

LOCK TABLES `openid` WRITE;
/*!40000 ALTER TABLE `openid` DISABLE KEYS */;
/*!40000 ALTER TABLE `openid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_description` longtext,
  `page_tab` varchar(100) NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user created pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Stores permissions used for access control';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'reports_view'),(2,'reports_edit'),(4,'reports_comments'),(5,'reports_download'),(6,'reports_upload'),(7,'messages'),(8,'messages_reporters'),(9,'stats'),(10,'settings'),(11,'manage'),(12,'users'),(13,'manage_roles'),(16,'reports_verify'),(17,'reports_approve'),(18,'admin_ui'),(19,'member_ui'),(20,'delete_all_reports');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores permissions assigned to roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES (1,14),(2,1),(2,2),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,14),(2,15),(2,16),(2,17),(2,18),(3,1),(3,2),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,20),(4,19);
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(100) NOT NULL,
  `plugin_url` varchar(250) DEFAULT NULL,
  `plugin_description` text,
  `plugin_priority` tinyint(4) DEFAULT '0',
  `plugin_active` tinyint(4) DEFAULT '0',
  `plugin_installed` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name` (`plugin_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Holds a list of all plugins installed on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES (1,'clickatell',NULL,NULL,0,0,0),(2,'frontlinesms',NULL,NULL,0,0,0),(3,'sharing',NULL,NULL,0,0,0),(4,'smssync',NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL,
  `from_user_id` int(11) DEFAULT '0',
  `private_subject` varchar(255) NOT NULL,
  `private_message` text NOT NULL,
  `private_message_date` datetime NOT NULL,
  `private_message_new` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores private messages sent between Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_message`
--

LOCK TABLES `private_message` WRITE;
/*!40000 ALTER TABLE `private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `incident_id` (`incident_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores credibility ratings for reports and comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporter`
--

DROP TABLE IF EXISTS `reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `service_account` varchar(255) DEFAULT NULL,
  `reporter_first` varchar(200) DEFAULT NULL,
  `reporter_last` varchar(200) DEFAULT NULL,
  `reporter_email` varchar(120) DEFAULT NULL,
  `reporter_phone` varchar(60) DEFAULT NULL,
  `reporter_ip` varchar(50) DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `service_id` (`service_id`),
  KEY `level_id` (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Information on report submitters via email, twitter and sms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporter`
--

LOCK TABLES `reporter` WRITE;
/*!40000 ALTER TABLE `reporter` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `access_level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Defines user access levels and privileges on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'login','Login privileges, granted after account confirmation',0),(2,'admin','Administrative user, has access to almost everything.',90),(3,'superadmin','Super administrative user, has access to everything.',100),(4,'member','Regular user with access only to the member area',10);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores roles assigned to users registered on a deployment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Stores schedules for cron jobs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler`
--

LOCK TABLES `scheduler` WRITE;
/*!40000 ALTER TABLE `scheduler` DISABLE KEYS */;
INSERT INTO `scheduler` VALUES (1,'Feeds',1414231218,-1,-1,-1,0,'s_feeds',1),(2,'Alerts',1414234022,-1,-1,-1,-1,'s_alerts',1),(3,'Email',1414231205,-1,-1,-1,0,'s_email',1),(4,'Twitter',1414231205,-1,-1,-1,0,'s_twitter',1),(5,'Cleanup',1414231205,-1,-1,-1,0,'s_cleanup',1);
/*!40000 ALTER TABLE `scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_log`
--

DROP TABLE IF EXISTS `scheduler_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(10) unsigned NOT NULL,
  `scheduler_status` varchar(20) DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduler_id` (`scheduler_id`)
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='Stores a log of scheduler actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_log`
--

LOCK TABLES `scheduler_log` WRITE;
/*!40000 ALTER TABLE `scheduler_log` DISABLE KEYS */;
INSERT INTO `scheduler_log` VALUES (1,1,'200',1414211051),(2,2,'200',1414211051),(3,3,'200',1414211051),(4,4,'200',1414211051),(5,5,'200',1414211051),(6,2,'200',1414211213),(7,2,'200',1414211223),(8,2,'200',1414211283),(9,2,'200',1414211386),(10,2,'200',1414211415),(11,2,'200',1414211460),(12,2,'200',1414211466),(13,2,'200',1414211524),(14,2,'200',1414211582),(15,2,'200',1414211794),(16,2,'200',1414211841),(17,2,'200',1414211881),(18,2,'200',1414211984),(19,2,'200',1414212000),(20,2,'200',1414212009),(21,2,'200',1414212085),(22,2,'200',1414212120),(23,2,'200',1414212125),(24,2,'200',1414212215),(25,2,'200',1414212267),(26,2,'200',1414212687),(27,2,'200',1414212720),(28,2,'200',1414212724),(29,2,'200',1414212782),(30,1,'200',1414213608),(31,2,'200',1414213608),(32,3,'200',1414213608),(33,4,'200',1414213608),(34,5,'200',1414213608),(35,2,'200',1414213738),(36,2,'200',1414213744),(37,2,'200',1414213819),(38,2,'200',1414213954),(39,2,'200',1414214005),(40,2,'200',1414214049),(41,2,'200',1414214106),(42,2,'200',1414214164),(43,2,'200',1414214227),(44,2,'200',1414214374),(45,2,'200',1414214403),(46,2,'200',1414214480),(47,2,'200',1414214567),(48,2,'200',1414214587),(49,2,'200',1414214776),(50,2,'200',1414214826),(51,2,'200',1414214946),(52,2,'200',1414215010),(53,2,'200',1414215076),(54,2,'200',1414215138),(55,2,'200',1414216084),(56,2,'200',1414216234),(57,2,'200',1414216263),(58,2,'200',1414216325),(59,2,'200',1414216390),(60,2,'200',1414216449),(61,1,'200',1414217023),(62,2,'200',1414217023),(63,3,'200',1414217023),(64,4,'200',1414217023),(65,5,'200',1414217023),(66,2,'200',1414217041),(67,2,'200',1414217110),(68,2,'200',1414217237),(69,2,'200',1414217483),(70,2,'200',1414217539),(71,2,'200',1414217582),(72,2,'200',1414217699),(73,2,'200',1414217824),(74,2,'200',1414217961),(75,2,'200',1414218008),(76,2,'200',1414218065),(77,2,'200',1414218199),(78,2,'200',1414218543),(79,2,'200',1414218632),(80,2,'200',1414218712),(81,2,'200',1414218832),(82,2,'200',1414219159),(83,2,'200',1414219357),(84,2,'200',1414219436),(85,2,'200',1414219454),(86,2,'200',1414219518),(87,2,'200',1414219596),(88,2,'200',1414219679),(89,2,'200',1414219694),(90,2,'200',1414219864),(91,2,'200',1414219961),(92,2,'200',1414220003),(93,2,'200',1414220045),(94,2,'200',1414220133),(95,2,'200',1414220253),(96,2,'200',1414220285),(97,2,'200',1414220357),(98,1,'200',1414220409),(99,2,'200',1414220409),(100,3,'200',1414220409),(101,4,'200',1414220409),(102,5,'200',1414220409),(103,2,'200',1414220471),(104,2,'200',1414220582),(105,2,'200',1414220645),(106,2,'200',1414220727),(107,2,'200',1414220764),(108,2,'200',1414220821),(109,2,'200',1414220889),(110,2,'200',1414220981),(111,2,'200',1414221014),(112,2,'200',1414221062),(113,2,'200',1414221120),(114,2,'200',1414221123),(115,2,'200',1414221190),(116,2,'200',1414221254),(117,2,'200',1414221319),(118,2,'200',1414221381),(119,2,'200',1414221423),(120,2,'200',1414221531),(121,2,'200',1414221540),(122,2,'200',1414221540),(123,2,'200',1414221571),(124,2,'200',1414221604),(125,2,'200',1414221862),(126,2,'200',1414221917),(127,2,'200',1414222037),(128,2,'200',1414222205),(129,2,'200',1414222543),(130,2,'200',1414222560),(131,2,'200',1414222561),(132,2,'200',1414222627),(133,2,'200',1414222682),(134,2,'200',1414222789),(135,2,'200',1414222951),(136,2,'200',1414223189),(137,2,'200',1414223294),(138,2,'200',1414223340),(139,2,'200',1414223364),(140,2,'200',1414223410),(141,2,'200',1414223504),(142,2,'200',1414223534),(143,2,'200',1414223734),(144,2,'200',1414223763),(145,2,'200',1414223825),(146,2,'200',1414223882),(147,2,'200',1414223943),(148,1,'200',1414224314),(149,2,'200',1414224314),(150,3,'200',1414224315),(151,4,'200',1414224315),(152,5,'200',1414224315),(153,2,'200',1414224377),(154,2,'200',1414224423),(155,2,'200',1414224483),(156,2,'200',1414224544),(157,2,'200',1414224619),(158,2,'200',1414225055),(159,2,'200',1414225203),(160,2,'200',1414225262),(161,2,'200',1414225323),(162,2,'200',1414225435),(163,2,'200',1414225443),(164,2,'200',1414225506),(165,2,'200',1414225563),(166,2,'200',1414225622),(167,2,'200',1414225695),(168,2,'200',1414225756),(169,2,'200',1414225814),(170,2,'200',1414225863),(171,2,'200',1414225931),(172,2,'200',1414225982),(173,2,'200',1414226043),(174,2,'200',1414226103),(175,2,'200',1414226161),(176,2,'200',1414226220),(177,2,'200',1414226224),(178,2,'200',1414226285),(179,2,'200',1414226354),(180,2,'200',1414226449),(181,2,'200',1414226467),(182,2,'200',1414226685),(183,2,'200',1414226779),(184,2,'200',1414226836),(185,2,'200',1414227027),(186,2,'200',1414227184),(187,2,'200',1414227253),(188,2,'200',1414227465),(189,2,'200',1414227498),(190,2,'200',1414227543),(191,1,'200',1414227633),(192,2,'200',1414227635),(193,3,'200',1414227635),(194,4,'200',1414227635),(195,5,'200',1414227635),(196,2,'200',1414227725),(197,2,'200',1414227795),(198,2,'200',1414227858),(199,2,'200',1414227901),(200,2,'200',1414227962),(201,2,'200',1414228020),(202,2,'200',1414228029),(203,2,'200',1414228085),(204,2,'200',1414228163),(205,2,'200',1414228211),(206,2,'200',1414228284),(207,2,'200',1414228343),(208,2,'200',1414228385),(209,2,'200',1414228440),(210,2,'200',1414228447),(211,2,'200',1414228629),(212,2,'200',1414228826),(213,2,'200',1414229111),(214,2,'200',1414229166),(215,2,'200',1414229237),(216,2,'200',1414229322),(217,2,'200',1414229362),(218,2,'200',1414229400),(219,2,'200',1414229400),(220,2,'200',1414229406),(221,2,'200',1414229466),(222,2,'200',1414229522),(223,2,'200',1414229584),(224,2,'200',1414229642),(225,2,'200',1414229722),(226,2,'200',1414229762),(227,2,'200',1414229943),(228,2,'200',1414230012),(229,2,'200',1414230149),(230,2,'200',1414230181),(231,2,'200',1414230323),(232,2,'200',1414230408),(233,2,'200',1414230561),(234,2,'200',1414230829),(235,2,'200',1414230844),(236,2,'200',1414230909),(237,2,'200',1414231027),(238,2,'200',1414231162),(239,1,'200',1414231200),(240,2,'200',1414231205),(241,3,'200',1414231205),(242,4,'200',1414231205),(243,5,'200',1414231205),(244,1,'200',1414231218),(245,2,'200',1414231286),(246,2,'200',1414231347),(247,2,'200',1414231749),(248,2,'200',1414231831),(249,2,'200',1414231864),(250,2,'200',1414231926),(251,2,'200',1414231988),(252,2,'200',1414232046),(253,2,'200',1414232115),(254,2,'200',1414232160),(255,2,'200',1414232217),(256,2,'200',1414232250),(257,2,'200',1414232286),(258,2,'200',1414233424),(259,2,'200',1414233728),(260,2,'200',1414233785),(261,2,'200',1414233843),(262,2,'200',1414233907),(263,2,'200',1414233962),(264,2,'200',1414234022);
/*!40000 ALTER TABLE `scheduler_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Info on input sources i.e SMS, Email, Twitter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'SMS','Text messages from phones',NULL,NULL),(2,'Email','Email messages sent to your deployment',NULL,NULL),(3,'Twitter','Tweets tweets tweets','http://twitter.com',NULL);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1gigb422l3l06p2153g539hle1',1414233963,'cNBVWfORh/9Muwsxxi25Y9YL86/GqFfzT6oCwnQYUNZnPVotROXr3+ChfJbA8NdPofT+Nw29FXHNZW8Z/2yvbl1nmwkUFX8giel0SXFVTlQoCDjZ539OqjZbVPtPC/iSaLpEjM2J9X1btWPhpuqWoxO/uIfKMaKfujOnoCiPWKzcnbgt//NBgxvFG4Qr4/t/WOlcE/lRYCCKSIMMI6W6mJtH/+k8LRZ5Pb2pGSGKwTQOplDpyeZvR8Jv5zg1O84vnU7wMGp3jcTLvXMefk0qy1h5AGh9hHofizPs3J6hINXOUX3f6ChNQJYVdbI6iHk2z6rqHgr4BXvNuJxVJA7XxhAhTQ+jZKL+d7aTn40V/t2gG9LhACWBwzsuYR/LDScLy8kwp9sUHE6ziyy114/+yNOM98nlRtjPrVlBaRyv/bQsdYlbvB+1ieOiOitALeqb3sh2PvVzEstqyYSUyFP4EWcHsbp/3IYvDCtl5arcPKo4d9Sorg0uELg+cbFTadHnyjczP03m+oRa++iixZx+3GOzrNl0ZD5PH2+xzssDjoERy2JwuGVLFQ+JgvfHY3FRFtOuu4W8ijVNIA=='),('gdjsacnt4g8uquoqq20tdtmal1',1414234045,'S9tPhHZn18kSI4HJp2goQQVW+4jUwPqQy4Dthue5tn3ae+qhrW72pzl8La4xENDU14FF/8hjhQ8K9aSbvrIuhIdejK63lTMzHKSRWf/ied/tBrh/hShoTi27LXlwWs7P4JB86BF+z7sdNzmJLTBMPWsK0gJw7VkYwy7HVMpd5bCmWWmZZ/kOLJBsmvsmibn2MVfzKVVAYEo8KApXkKSyaZ3eQ5ndj+cHY2j/+6jwibNo5DhRKd9b832qoF/8Xfe20r4vfftNqmtv8cNQv7zQL9LzyP2HbVFhRrCGjRyzy4BlJkpgnmapxlW+Zjr5HT3me575T0dro91djjLCL53PgqWOKUmcVrfymGO49/DcTr5yGvVIrV3xSjniv0M4Ra39qh9CIM0BqWXjsKGv+tT46EQTId6pun3+z0SorO349aEsOLAQhIvCQcdISihgMjRo/d51v/TCwEygVyIZcEx5bmkoXr+GJCh9S+k4O7/ox6M/ilzizK9UEFfqngeEWHoae1jBRqUDd39vLDEUd10TOtJOPO/aHYdG7ILyRrdJgdPUPgSBKGU+4bRPQCyRj4XQ3xVH6yA460iJbg=='),('n0ccspv15e28h42rcn8lqhf0u5',1414231778,'IP4bQ4aCe9jo/y/gVdd8ZWeYThOSliIfDdO1xOO97Zt7E3EAUVNGzdEREpRy85x2UVzWEZa7VpIc9BozMI8QezfkMBcWg5TBT+0BkLYPrPIWnZtGpe+BQ4lNTKqQets1FMBNTEwgQuZnimSPrT6R8FpK2IDtRbY24nA78rwALcgSFC+VTpv1ZsAfuey/2J6qq6Guje33DpCNBdtYbQybPrvOrK2vrfqJB3IXOS6XS0sTLWrdy04te86CXCftzfzaFHCvR19aiwmpdundgI2XcNc7JnWVdsdBinB4OiT+qla9vxACZ/+YB2ECvBU4fz3SDtMOAkc0YfB3rhPhNZyTF6wmh1vnS5LpOPzHzKvaeQZwmBKhy1kf6++eBJ/4uvRmpUaIK/sC4s5m8dMgp6UhlZSfxDdrSHf4FPGC6JIE2vXV+uKGIPYLTCCKYvIUOHWumMYgKTf3U896c+8xWBXdDtbYLZ6z0SjLFWIqvMNr13hD//aMz8QG5bcfRnz2PFrA3pHXQtBVra/wB0mytjP6DSBEySSMlCRImDG0FnCTaeonmKJ4NqGzN/Ey9x1RifNvZkOyLW4XpyRcvQeTM/CWRS+DZnx8lN5v0ar3LmtShE1uO0JpU39FyIUotF7erilQ4uCY2kPRz+cMfRl0rEc8GH5bzM9CWAZz1XqSgPYBxcl81TYA+A1fXuU8JbcxU95Cf+9KoqIPJr2bNjsbI5lW0dj90foQ8lqtwni53ZJZrfarMD2c7JdLECGQfkKlenUSNS/rExkH6sWPlu46RDTgMNuO/dIKeS/LOFH14amDWoYQgIhEM/CrVxwlg/o4qMrlX1CyCF5XiX1V67kLBWrbkSwH2h2epPtlJVqIe/4NWIO+xxeadF/5IhTlBG0nSPqplSiRVjVDBzu7PGwJ5JAQ4R9Hd4TPgoBFDAoE/V0EEp4ZADuWVeQiBtjIQx7tKxPZCbk5ooJ8fd7DPf9Qj5fWfl9mQ5SamdcrNvu6iDww8S5DSjRXuHYrSiYkgcSnbtPeqng0Bpsbc6VE6ps8qVwEFSiA1SO2i+ZzpluEppnyHqOwlkDnIgBiWvUIohIjxULsfXNEKCFrtBlitRlAsdCrwt7gXjKEMaoBgEkd9GR/ifht9iYygTpE1bWqTM8+SvXNZAxxFSimw+Nn9hJT8+hJtmIQLcwr/iieImbD6g3VLdPJNBJydk/vm7tNMQIWJByRAlxKjsqUOGpLGcRbg2dwfMmKbdscGCjem0jHu70iWZqG1WDeL3ayod0ZsM98PF5o2/gbC17SIFzD1s55nIYXeQA4jXlS8X7uCIoKvt9tHETj5YW/Arbt7HTZ5pDsqc2uR0PU1hc4UNj2Ga3i9ADKgUIeFatHthiLWoTELb0tBxNA7fdFoPK406+grgRLlB1CThF+W+u3/ZWpqzyKnjZwosPwpGOKIYw+foagANotmvLxyR/TS5As673fnR/wlcQ5rs5VOPcWECvH9IpteBIr3L5Ohforhe4SwszRQ9RjNYvT0sQCt2x0rqw/RMsPexdW/4EbwsxP+y0xqhyK//Wjf/QIPlmkKX6GoTMSwyHn9k+Xiw=='),('kj0969lsvu0kqanoojknlpjv10',1414232318,'+/1JhGxu0lCkm8nTfvLZdcPeUUcBJASYrikbOS5HEkrrvf5YwkQMNYyFbvbvf9bkHaEVHfITWk0g7nAZkjXi8hznINNfeo1AR9SWh8m8ft44M13puw4DTwMEZ//RpnrzPsXP/V/oA7uZZhVRA5mhb5RomJ7g21G+YkWXnZX/0iFY+cKjmudSNJqf4M0+YdidI8XjepHxhyKzdNlsKbfsDRjk1rBUz0CtHPRNXGxAkt273wg2XJuKq53CAi7Ml0M+9H1JiJ4XeM6euzxzT99wcvhwmHFVJjyiCbNSw800Ql6iCUb1LStw0pi7DkH/zT6fLNS9bvsauXj9YIznnmOfQz6rgIQmI7Wf6k2DpPFNeY9WocZo2WrRTuXYtZIOlDqrXcsPb0K+RJCt3Q0qnkIDu5Af6ydbYiGHLYpzaaToF9MKaFV9/h/EEXHSkh9MesOCE5kLNy3BVNNy58gz3pA3C4roEz68KoXPdbhonShCD+b0637KFaZ5Gbxyp34ZjPzGTMXI3E9F9tg4TPoluO1R6IzBiKt5dnf8RQY2PyEpvHlftdHs2WQoYXJUXS0ovkeWQlUlisLNIaguIi9mQW4ypI/HefJvNqA83hpV4PTswL27P2hD/0Xjk7o2FaOLZ2mTQ+CHcR8iBRHgSjPc+wUzj9QcSllubazVh3ZEA8Hk7f92tWfcYZFfVOCGYmSFgYwgbkkKtaRpcSQAKD/dMs764MJuYiYLOfkEzp84FoAWPiRDh7NX88z4TD/jD+7cz7rw6TKPuK9fH0Qnuicw+F3mXp+eC4kj5sh/JGlt33GsFD9bYB9Pl4ZFwR1WEDSdMpcHkQCIeGcok1Mms9N07wQ0P6VnKxBtCbmARL4OGUcPjg5enk2U2pM6zBt3HXYdxh+/RVoFS/c9lRewgC3iSjd2v1xQLAJGmeidxfj5lqb3/ug1RjoN96r2qkOI/UrQSqgGo6suTU3zJPtrhxJOGj2vEvHOfJlka0Z5hkjDutSX1ZM0luPv3otOY4Yvu+togznPCQ2Mm/QptioNSal9YWru32FE36D7wE97NMXj4Ioiu+6W8qoKdaNMN83Ls58sH9l2Niqa0mpgzr0RTtXXUxs9YOjgBA+TNDd2EEP4uMGLHyWx/RlP7D5bkuQvCwrdu++4TeKl79xofMGfP/Ky0R7jxo9utGvcixJy5mR0vdB29vze/6g5dJxeLsfVb3F/Oniph5c1dfZ+tQzW/ZEtSeUuBwIysfOvRKkOJnpnQvpQw4/1Sthj13hTpNQCAFS8g7YpWWV0f2iIChhRg4q3GekVeqomZ2qV1nIZITBZTE85Ycj5Oxyln2f17hmoApUzCkxliE2oUzALGhfItoUoFCs3NYV5hqHT+FFs/+fa3Rv+3ZDrT6sM8wQk0TDyl64OhO0E8ObN4/TFHq8pUuBGti5xMV7Covv4+d0pjTPQDNV1WVK6gp70N70GX4ci0cU='),('ve9g6jratf0u0qtjbfb69rkuq6',1414232217,'BkMi+zVu2Pa9au1VCT2H3sTUP2onXxB1Lm+USji14/Ay5jlTwa/kDDnOTOkhJ/ykX4TAxdZf0fB9t5fKnBZMXzjBrwK/chXBvYw2OLxRIaNrolBYodGLIRTz/G1p5ZgHYZe3OhuLm2w4Mt9hF7d3kIXAGh/J+X3/ay/VLPkxo0N5wJTNi6hQpU9VuDGgfuo4cCnP0t2YZQnIBj14OVOAQfcZeGgHaNSRywq6nlN/SdTwn1IGVAY4awzB+eGtVXmbgf6onEmIpW1k9gjss3g10SdHRIrsy24yZ9THwTzYWfSGwlSKdpCOyEoz5IaiseuJXFThQpFlbNeRY8aviVqw6Qexr0HyCyc6G/ReTJI3HpC2oCHHtrCuFoo2RvQ9su3vxGQIC+x/LTXv3f51XwMW21sizAU9i2mo6kqGGKL9XK1KOvnvL2wF4dYQOSzWazOqeKSTV2T+NXEM6ysvOYT9YInH0SQfpJ7p1w5PjVhWF4m8kIBwQo1LVr4rU3lRHUW1/zWW6x11R5f8kRpLpyk51I7U0y1SrTy2nMrjiu1AuT7L+nJiZkcYYevIyeKrsTZlFQG2tJWitNkPbrlQ+5JFkKvdmprSVG9pdcSwurIk/6awR9HBKtCUQ3LBRYcUOFfzeqZiSdDTSjGuLElfXRi1lA4hOBaWbjyD8BmVFcRdjCq6ZB87XGsukeU93/noqGWgcFdjIut6FXLdLe4liorZDyZ4Mn1ZfqzMJ6G+/q85t3NhckAYUAQEYAJ6dx8Cse0/GQqj3+x1eXnTppNSqVeqenEfUrGp/ektSqbklL/mAWBoWOre4P7Q9jAUur+bYcoDyL+BJRefxxcEMfbQ6GBoMhKAqNQ3RC0DvYdROZdy7PZc3Okpc8tmVrjC3aBKUeLVLqGzOeqyOc0IG8OwwM5Rsdu1/REQAXQagcJAZmLYeQq8k4OGdTS6JNd6++RgIEWJEV6g+Lz1iqXDXuJ5KOWn2sOS5t7FBszmDLAL/Z42fvG9b7q/6bFiqQTwmdT9Q9lOVF+zspp4oIkCFm1NoBKOiyYQND2tq3oI3OKMvXXeteBEiJjmIbpPxVukW/LNzKcWQbAwQBawAqyP3JBPsCko0Ma4qXCEkkpRV9x90YX+ZrOciD7sTdxvFG0xELCQDz34YhGMRKrHh1WaMA+EQpVQ8UGxd+Jqsj6I9MhXRIG65f8LUmqDbfJ8ix4Mz2OTSwuN6CjO7IrVeONNXpETPLstDdIqHgk5RRTsj0mFt2glQxOepSColdD9cnfo5IYoyMzLrKlx0rnCOgpSbkwiC9RZy7zAqS4XhfNjZhKMnTcgeROeEp71K2Yj7jK3JiTVHYScvKPTbR4iu7bmI/10BHewJTs0JLfomoio5tL7TGAtbXmNZ3APrsMFu5Pep/WTUxHAXjN/XsRPRqYkpaytqyVdpDFyKP5ZCnp8wkWsQdehPqnWH0FDguIviOEugNGSq7P9x1DM5eeLiGl/PC4CRVselTim9EuutiuBtX3x0Zm860wZvKhu5dLXMyLDZIJ6OyCTo/dlgJZWEFs='),('gr5vt6ouun2oe5u25f7cd731d5',1414232324,'Pou2N+m5WVbOQZDFGbgjQ9Nu2KumuejorNvliNR9QB3cLjIfP2K58E7IL7rkVjA8ass8LQC2dJcn7YYr/fUJljczmYolPcfwTP2ddb6DtTzk1w5xVYqMhZgobC3RGuv5mk0FXvvzPO0xuEOWtb97iEQw0ohbhA+yBSlpSejgbvCvkuUjnkqY1WlmRdKTIsjquV9HnLY/OE+ZN3LshIs8AKiEXKoVI173iAbb1q8s50qQxZ/lLyxVI7/svRiMmUlI7BfV1hd0HJkNLCcTNCkodQd0XSpzQKAr6gDF9pnHQDJHArqP3uQjF0RFPDYicPyeGCQbZdlq6v/7oAwaA4TT9fxvrzwI2oUnRQ30ZxyPZOdNF5j3C1i86oRSKKa+nQh78gplqJl/2HysW2YdYGkGXNEyxUbZe4WkbfqrbQzhfygQ/yZspfHkIq/fbBt3nw9oos7MMzcVEsI9RSFsJRGSSA3khIlUzw7CCo3mBY4QFESQODHm6orvJPuhjrFB5eN6aiOspCy6ddFh7NZCjt7wxKhpbtHrhShQSdvBwrGGZ4fqvOaME5yUOE86Y2jRhmJ8x73RWJpgpofJsAeq5tpihF8vj96+tHmcF2hyFa1gxbvZwR8vMGJVMqdKJ0Dz7xuaMXSTAfrx/WK5ZwMbjMSq003UT650YWEMIC3fFVtEAqqBP4A8u5h70oVdSGggaJD+h0l2pily41N4kXQFU7+d8mLax9XpiqbbpccYDx1M2xRE4vQtULjtt/XkMjGUGt1f7Pn1x9PoaPakqpi8xh3mgWxILolk/M59VIPqXXU5cZwCik+4xtkcaExPQYtzHeMX6T8dz4BnjWOsS5Hr8EIRQOoj3zNbG8I1vNgxW+DrDwc9NM6NaGq3etL5MOHXAc1XgWF/PGyljS2MIFxMgTzhNVccr5dOMxnZZ88KVtfH/ABRB/5BCoOwLn8nwdYIsYbYeg9Djh/oRZKhZ7ouEyrp9uHdyYnLdnB41D5AEUZvCv3qkjsuy3RGKg2NDBC3EnPB/EtAPSVAz+WNRiH+VzT52eL8BfbOKVpIQyRVbY7Ad4DtFb1oiQC/Bn53likJc2KjV4lVmzDYtY2cHsE6xqcUV1LVpSYJ8smVJquPht34C3nXBrs+zgtX2XeQesIUURz9vCP6K6luhZFqTVlhFUfIan1tNmkASasScGd3Exr2eeLT6BL0Fo5wrU5cJX730MrjMGAjUYuMg1UWt8dj1ssEJdN1i2H72waNflbttXmspLhDgQfMqKwywKhVY/8o1SiAHj5AS41Np+57999HFPcuh9Y58i7i0UGf85nI4pGU4/cUgm1CRLijcnsEdmogACI4WMertcnhRnOUll4cdwXSQUq2xzWWf+j+ZfZ/Cq5em2bQB77LrtY9sRPWYgCXgja51I9SK1RaM5Kt5IRD+ACwFsg4X5HQ1hU74B8yd0hxkYko1gGiEzw6pZftyw=='),('l9mbiqsrhosat97p37jn6juun0',1414231887,'Je3xvjlKyKALi/p5KJg4PVzfhOYaNfPrvJThbibtMOmQcmDOECFFoxpOR5DqU6cV2xCuoiriy6LsAlElpNGKcDm1x1MaIPORffBybsyEjvVfJ0lgTg1lei3MrxeyZEK3IdxLoH/tBopmB+oU0DrDHUMVpchytuucVHDTK3ALKg9ioxh2adn0/MGTzXCdrV16U99kucJdebtAtUb448OJgnpbiwXHDtklyZ4c3Sk84/fOK/yReEV7WMrmEKz18Ztxfw0R+YprvhdcaJzMHjI1nZ7ItkJ3/yqfhg/zZdftSB+a/GXCCYgr1ezgBHV899HEDku7bNWQBzf0YTQgd2H2sGl6sCA6ht8SuneBgNHguB1YZdy5PFQT1jKUMkD2+GXh+WaxtWZojpfRMx/wCAwqU2JMs9tw2yBCJXrCk0XhNvwqERJxoYnfCIckJHLpqxUlab9ySXgmP6Sur9kJXIsWjj9NXETIEynPBALE4pjOnBI9fgx6h5a4ziG8212P1tIHi0iaAO6kf5m1pqiYn+O9CNdAzKImEL/vkqidNKUWbi7moCNAea9mxz48xYH8L2oTZCtzrSLgUHr4rGbodsi0zf4qrOiX/Uxv8sf1zp5u9knW7ry6Jrox4SInC/n+fDVpnytT7O4tqhliv+DMubITLyMzYw=='),('4vtdinhl5bqcjgj9d86421r9g4',1414233448,'4v+5Mmwm93srJ79EcXokIeR7LDJkS/399zkK3D6c+kOaoHies24AzKx1Knd+cgxeEk29K4Z+54LzNtBJfmSIZf+OxV/3jNUMyVjAezST1cHF9067gpgZ7dMni3J8dKSXDQKKqnIu3yAofks13ZYW1o0Bm5lPfbwMqXyNGCmetby2pd9RrJT78Zf/DgD/FrDS1ancuVg1L1je533/GOvcC8DpbHkCjxO/EB6LLHByTv/HMWDQ/4d098J1ZTYihN3ZCmfLPkL1kmgDnmTv5hg0KFL/uF3u7kNgX0//iE6Lp19XcrtmTugF+/Kb90ctIdAUpm6YHZF7aGRqZbRD367YBvGCpu8Qk1GgbAZV8ViNrJh22PoHkit3mzmA/IM9bgmbF/KRmtXIitOSPpWl5xC8oKefrgnG64M/ar4U6iD2H5V30uSiAND9+BClbWnyuD9UT+EAJobnd9IfCSmztY4SguZh5g3ZLiKUI9wg29LWQ15zukYBNYZMG6cHhHAqv7kGLkcOfvAYkZov/aiAVgmF61KUbanZcKeUET90Spr89q0ihYVVySQbUI8K4/tEIxQGzhYNWsnLPYuXgL4xJlZEjYQi'),('een2v4e74tbf4u14fa9aamprn5',1414233899,'3yDzveMHnvGfvzvJkYu2ad6MZF5U4CicjsGUwOg+DxmNEv7umQpIfkYbJSbolsyY8kTaghNONnVwItoMaaLXQg9oR191OwOPwgLE66rxC7oiXniEEVHiKbVCxdO88JvnXoA2Osh5iAUPvRYfGp49CiDDaPNQoNp/M43k7PXkZU042SxJl5+taPxdNpUIQkj22U/v3uoB1HAR0Hf5dhcLkEOqfocdPhRh4N0DLjmczV9ctrXMPKVUn0F8eFJiq1TwwibeEfgCTgpexwOJju6vqVPBvlqYmMM/J/upCv3pYDqHtrHPRnnvmsTc+yrgiNJF/M/eMhhQGVEMQoZm5MOv7XEx4fZ0v/QXPMN9souuQhZdrfhI1jevVcK0nU+HNKkENr6USsww+3BlpNiIkgifzQcShHYkG1agmT9WuYErB6nLqIJ3kfKN891PDeyKggIsPIuMR2HpvWyyt8pQDOq369Mgl6Dy3+8yjeLrVFvRCJlGrsl67A3H2PM='),('vfop3ithf9q3c26t7a7qtvuv52',1414231888,'MvX7F3pKjvBw1GFFgGM5UKolkghxLB1qOSszBojff3KBoRH7TNcWK2Fi7/+5G2KGaqGeq2uQQH03ucKJB8ZHSwcE7evhVk6IPh7L0Y+LS1g76HXqJLCQvgNFVbdnZGNaKEbFD4QCLeCVJQS/12TYbBNwtd57GLK8TP5HutasdQFsueXxvrGGylOHRzjzBUWDDbYUIt796i4XgCgIRLOuvgozhP13/eIL/8WarSlJUInnDJAyUc3kfkPYRyvQIfgapA5wUWMUizgMJaNcqKR4UqoUP0mKzOiZY76nv0BOAjAa3BLLeZQ+nqO5ONRHfPF4UQ+OQsIOTcuk5TpuBdFvRj8AagWd73bx3ycSC5CvYPflkzjIIuhtuz9OKyoanlVLBwYV7SCv3VTpRfiwDnLq0Oj/yY183rQ='),('jre0b1f812em4p2gvg8qvh6sp1',1414232250,'UnFQ2MDJbsQezz4e2bIyigN4tRX2opyOICKyvzUMtmEc/U/g01Jc9HvuMk3O3lNdU63bX4dLaKJlw3QlcYLq17sek3yy9zSDNTXP94aFQDLSNcZJQMZke6XDF6/hastD1UydWR6I7a0AOWIdhcsUypsZa7jEggaoU80Nyw7Tdd/pE3I6dgnEqQzGdqLVrkAP9hHXZFp+fe/cEj5p5XTXrTrK4gXFCQZ2KZ1v2BcUX5awLLszzqiUEwN9x0yneC7ZrkztnwK/XHleEE2bMNNjKGf5xVzDnryWhDbArHIepEV+bos5FeQOugnhcT6nGXaoubTkGJXUK+57xP/OqrQb89yz5kKeqmPKoZ6W2z6Wb+vt5HmDzxsPznk8mE1INKCwRy38aVLT/oS4+oU3kfMwgRXd2VWEvgPcdDTytXQ5pE965yVakwbngl6vo5OnOd4GZNc+MY1zk4rGAKTm3X1CgKoTojYpuRalGN14YhMMq3038IABz+NyJ0g='),('jh5r3tube9ab786gpgr7k06s65',1414232012,'DW0JZ5Bvc4F0cKIBrH2+Cx9ix5II7KrlQq+sRmTjmy+T09o9Ul/y3/ia13jTlvYHbuek6/03I6GZk0LmOETpsVs6IYcZ5IrT+43pt+JdmHiSBrFwqJWG+4UJmXaPKozI5elzSzgSmbkh25WaLDdbbvTgRlrdR8Df+jEG1OkDP0kgi37fRffKA7+MjfADSsrbLvLngHrNvg69StR8/Cx3PIEXLntaA3xSOBzb8nf/QSz958/Kff4PNTI+z0Kvun+9GgTO34y9JgJAUUwGMjSr/GHOIRi7sw9SvVjnkqLe7tTLjaOzw22PC67/cQxIBZVXXoKQc/SxNIWypYpwShyzE+sdXtzAyQAAWiazkkVWTHguq3YJE7aR+GlqVTzEuKyZut589Vf81yXg2iHxs+dbc3v13Y/2OKVKSMljMkJzky1yXpzAuwilmkrqXc8cX/4L1F/IXsczQ6X6RJKGEhpHRrGxeeb9xle8K96oubaSJ3zZWMEA+koUvxfIOlgiMHkNpsXC1JeZT9nG1jTa5CDKZXimmNC7nrvNbHp4ln9qOySJaTewMv98LLI7cGGe+ixX0DqD4haUcKLQ'),('tg3mrmifk99eg2mldtn6f671f2',1414229787,'GZYeguN0msHMd5mZ+mUBj7iHZwI2HPt6NlkTOTKJv3oFqs/sZe8e3Ur+cDyU4W1MzjQChzdEqjprniW6DBkdxdJKOVuxKDB8EJHEyTXKabYTdXQq4m3bM+l+got+rxuFekGGhkWnIjoAygrd/4a2kq79KAO7CZeT7iJ0Kq4Q8SB1nXDGRsaoalxXzyJ/mflETf112A60HAPslHtFpeuo6Rl8plK/jFhgshqG42ZtMAE8Y9kZuYXFZTEFofghr1SLW2/JdBk6POoEFLXqqGRGX/k7riegLqadqypkJo3iIGLQ0KEUBbdYl0WZhdqhYMd1fUrdVAn5GcjF37FEAg8FEVDfza29ePOCHO8fY3PM98LMoPkm3fcxyKas23uLkJoXQ5ih4fB57X+L6mZPiiEKxxkh3pQKdpd+pFjKdGPAtl9u1nGWoYYZibGZAlHTgirDEdHuCBvWkoanX+hTI68wvINy3ou3zNl+kTLomYsCYzpz5AO60R0txTYU+78JzxUzFt+IouLBKxeOOTXx0fZ7MsjEgdcdYYQSt1+VdgmT4Ive2qrDQxYvkEJgWZiDVLZxhasIBEa5uLegKGWezsbLoMc07aYqjQDf25fhladugMED4IhiIuaBidfoAeBXH+Ymos4BgQT18mf1hP3vTEhEPhJYo2nca4/V9kmmhZmnHSyfJO4JDT7OUeiJztzBn4ivTJElZJ4MQ0s/kIvPApiyt97OOVuc2/gVjx/uxNait9e5QIpQpycaqcsiJEnc0byBD/oHxRQV1euu/EZaJXKZqw+kE3I8Y8jPsO1Xa19AmvmV1SA/2gp8zeT3Ti16et6cPI9U7mldERjauH+Yu78SeEnTk1OlVvI1EYZYXbTwMQFrO10WyEl9Oo/XtgGQgYcp4n9zHky2XPUGBSSRHEN1FP35RLudt+W3ac2r4ZKVfRqfQsuMgDvmU1xUqOYGat96am1qJKuTL+/CUWIVKrtgHrgjr6ERr+ZK/3O2j9Zl2yWKbcoe7RwLG3xr+gdyHuubdIDLPZzI0e8xGKWCsmcma2hkQYwETcEwOZo5dzUC/fTOojTnVmHTsFuE5zpu50Cbi6vWHw5xUsWSaHm18LX7pmnpJxeMIy51ZV0nQewqybi4J1fLdZgCI83yYiQ06IaNhSp4Y633VKQ4uKKbedjo1Kr07oxKtHWchv3RTUrw246hJ+YGveNAFg4yeUX+dlCufZn38Wdn4EiXMdxQhrCT+DSq9ubP7ozqI6BtOYIXwPH8BBEqBzOiKlHfWRr7iRq59NMop6HczoutWBj8ETN9cC1pbnviLth6SlTF0TPKnn/zaoawni2g9a2b8ZCeo878I2UikASgKzPXN2j2C5feOASzoQE8qPTJocTqF7/gJXwlJn2qAtdgqG1Z1HjpprilzgxOUFCwUToHl4Hcl/V+8qAH7XMoiSJfYzKWDMA7KJ9y0cC/ZXRsNgp262oqAT9BJZYRj9jnNjisdrmJ+RQxXX5RHgLqemwoUWJxLY+EyQBp6TZ/8WQZYnb67oGJpYlTqTMq8C9wFBY='),('m948ss2nl9tuoqe1bdhjce0i60',1414229762,'A3M0RT3M2mRon5EK/UkLsHOh4kuazEsqsq7OPgANdK7TKI/nKp9YYpVYcsLJHduDu8bZ3O9i2T/FubNu2qhJyd9I2ty14eDLtLUwNoOHlnQGkZ6bXARJnwnRxyElQBL+PVuunn/uZT4MDcekUNjeSWDTKhKjOYOLA7pTs+DEjy5l1f1XkxarWoevH4N2w9ltXmvrERffYEdM7zmywZFDBEqAePOo1EYcJ1C66rVod+H1KNBam/FaipWFViqk1Mki9dgAbG5JnIQawTzE3UFA+YEJCY+jr5s0kDKn8Wq9XaUzTClXDiJHEosTrleABF43aNvInAEcnAyd5ZHtvly/bux9DbNN6WOsbRH0WiwuweZzb7V70EXvGJUO/z0FPS4Dgt/XeJbbK8B3I/avPAuT/mxpt6P0BCEjbkHqCkezdDS0/vHQH0wupej005R4YPc5Uy9GSqKF4S7xsIgq3mTKj0s0r5l5mxL3zzKgImlzIpzbf0Zisvo51Pd3f42tpzDE82zXqnNHBX7FokiE83ll8erZ4bh1N7l10HpJwBReUo6Yuhjv7fSBlj4YR+KgMdG89FmJr9dcMgGr1RQXr8By94NySO10316cPyFjmsg8eahyDjBqi54JAdUgO1xqjKwHlL4JOXcFV4tQDaEvJYl1v/e5+RBFGQUBUQeitXQdkRXo7k6BsrfWfGL1LZc6vBEIp1jB5mOFhc4yg9ZmTlpOCY4OsDn8CUKweppdYS/B/WpXOhLAQ5R8Z2u3PRnrZRIdjdmaDdlQ7xbyRYgeCicJ+jdjcHm6yVsyzJRtuqt3VaQDAfJBP2XW6PVqGpYab/8gfXH0Pi0P8dz9Ub/yDH8HvastnCICPy2ZzdZPyijgQea0WKLj9FtLbcfmw6Z+TXR+hYm6Rw+0LCaqPt8HarQp4covKng8tTUrh18UayapxVSo+fKhqViaxtlRf2OilTq6VDG9VgtWoGiKwqcROjaIIQs51y6YcJEZSVL5qYgn18sPNycw08XbHgYcFX7N5ZBsAShzOYpRXCidnHtPGMkys2DABgz4Xv8Wl6zLOHAsM7TEPK6BF/JyXYwtXWQ1IFX6e1LzmhqFGbveA4iRAsavmj7t3KiCeyUUwT7oJyXn+Mu8DMjlB3lGSdncMvSJ0PUuklaqlWwUnhgIwdyCgKuuTUscpn7L/aempjzgXCRhrA94Mm4zG6VdddXomynIrw1nn1XH0T5727YHoWgQEhcPjW4njOFLaTYt2avSn+CILG97ftDvJnyemxsRrisH2kd4FIpF2q42nD139n9dWaki/RWxkdAsKZ41qpWdhhrYhouSdy9UW5gkjfnSXEsRQLSnHWe6TALibBM40Ecuqj10APJ5yhqeTHaL7dR1cU9IQ91EPMFVaCH13OPnWNzVw+vW');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL DEFAULT '' COMMENT 'Unique identifier for the configuration parameter',
  `value` text COMMENT 'Value for the settings parameter',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_settings_key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site_name','HackerSpace'),(2,'site_tagline','당신을 위한 DIY 공간'),(3,'site_banner_id','31'),(4,'site_email','team5@example.com'),(5,'site_key',NULL),(6,'site_language','ko_KR'),(7,'site_style','unicorn_modify'),(8,'site_timezone','Asia/Seoul'),(9,'site_contact_page','1'),(10,'site_help_page','1'),(11,'site_message',''),(12,'site_copyright_statement','LGPL'),(13,'site_submit_report_message',''),(14,'allow_reports','1'),(15,'allow_comments','1'),(16,'allow_feed','1'),(17,'allow_stat_sharing','1'),(18,'allow_clustering','1'),(19,'cache_pages','0'),(20,'cache_pages_lifetime','1800'),(21,'private_deployment','0'),(22,'default_map','google_normal'),(23,'default_map_all','0000cc'),(24,'default_map_all_icon_id',NULL),(25,'api_google',''),(26,'api_live','Apumcka0uPOF2lKLorq8aeo4nuqfVVeNRqJjqOcLMJ9iMCTsnMsNd9_OvpA8gR0i'),(27,'api_akismet',''),(28,'default_country','122'),(29,'multi_country','0'),(30,'default_city','nairobi'),(31,'default_lat','37.53229347818242'),(32,'default_lon','126.91462126490723'),(33,'default_zoom','11'),(34,'items_per_page','50'),(35,'items_per_page_admin','50'),(36,'sms_provider',''),(37,'sms_no1',NULL),(38,'sms_no2',NULL),(39,'sms_no3',NULL),(40,'google_analytics',''),(41,'twitter_hashtags',NULL),(42,'blocks','reports_block'),(43,'blocks_per_row','2'),(44,'date_modify','2014-10-25 18:26:10'),(45,'stat_id','66926'),(46,'stat_key','55e63b46671f2b8e88b3e7c09d4275'),(47,'email_username',NULL),(48,'email_password',NULL),(49,'email_port',NULL),(50,'email_host',NULL),(51,'email_servertype',NULL),(52,'email_ssl',NULL),(53,'ftp_server',NULL),(54,'ftp_user_name',NULL),(55,'alerts_email','team5@example.com'),(57,'facebook_appid',NULL),(58,'facebook_appsecret',NULL),(59,'db_version','119'),(60,'ushahidi_version','2.7.4'),(61,'allow_alerts','1'),(62,'require_email_confirmation','0'),(63,'manually_approve_users','0'),(64,'enable_timeline','0'),(65,'feed_geolocation_user',''),(66,'allow_feed_category','0'),(67,'max_upload_size','10'),(68,'forgot_password_secret','EQsqN`r4Hmr557b3nmi8zAoa6qRMYtyHB]%%i&:KUUgs5:f}691L@cN7$%HJiY]g'),(69,'scheduler_lock','0'),(70,'timeline_graph','line'),(71,'timeline_point_label','0');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores browser tokens assigned to users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (1,1,'39c74b0ab5b807d9ba1c9f8076dc1c817ef741b0','yMJixtxi721OXX46Ba3Sga1P8WspNT1H',1414211043,1415420643),(2,1,'e14a59fd3c4000adc62d0b84782f6e0d239fcb98','ffGAfWZ8Mu5SHRFlOCLwYwY24xxzy3bm',1414211203,1415420803),(3,1,'e14a59fd3c4000adc62d0b84782f6e0d239fcb98','8Pq85VvHygGRdlLd7kMSk6lJXEAEryn9',1414211206,1415420806),(4,1,'39c74b0ab5b807d9ba1c9f8076dc1c817ef741b0','DqK74C2X9IFq0YcTeYEn48j253JVrXFq',1414211409,1415421009),(5,1,'e14a59fd3c4000adc62d0b84782f6e0d239fcb98','ICE2rvktOcjG2UneDcdblWri1E05nCy4',1414211838,1415421438),(6,1,'494843650974df9712e6a9bfd2ae52308ea5453a','3ViFFfNw3yDK2lrxqa6ahalgAOxGhwAO',1414215050,1415424650),(7,1,'e14a59fd3c4000adc62d0b84782f6e0d239fcb98','v828t0mxkSiSrynN8q40vWV6rMbvVopN',1414220575,1415430175);
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `riverid` varchar(128) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `color` varchar(6) NOT NULL DEFAULT 'FF0000',
  `code` varchar(30) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `public_profile` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `needinfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores registered users’ information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','Administrator','team5@example.com','admin','9beb6fed8f853d1547ae719b412ebb59621bd4d4f4e38d0250',9,1414223193,0,'2014-10-25 07:46:33','FF0000',NULL,1,0,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified`
--

DROP TABLE IF EXISTS `verified`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `incident_id` (`incident_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Stores all verified reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified`
--

LOCK TABLES `verified` WRITE;
/*!40000 ALTER TABLE `verified` DISABLE KEYS */;
INSERT INTO `verified` VALUES (1,3,1,'2014-10-25 15:04:45',1),(2,4,1,'2014-10-25 15:11:41',1),(3,4,1,'2014-10-25 15:12:49',1),(4,3,1,'2014-10-25 15:12:49',1),(5,1,1,'2014-10-25 15:12:49',1),(6,1,1,'2014-10-25 15:12:54',1),(7,5,1,'2014-10-25 15:44:10',1),(8,6,1,'2014-10-25 15:45:13',1),(9,7,1,'2014-10-25 15:46:31',1),(10,8,1,'2014-10-25 15:47:55',1),(11,8,1,'2014-10-25 15:53:56',1),(12,7,1,'2014-10-25 15:55:29',1),(13,6,1,'2014-10-25 15:57:30',1),(14,5,1,'2014-10-25 15:59:56',1),(15,3,1,'2014-10-25 16:07:24',1),(16,7,1,'2014-10-25 16:13:15',1),(17,6,1,'2014-10-25 16:15:08',1),(18,5,1,'2014-10-25 16:15:43',1),(19,4,1,'2014-10-25 16:16:20',1),(20,3,1,'2014-10-25 16:17:02',1),(21,9,1,'2014-10-25 17:58:17',0),(22,9,1,'2014-10-25 18:04:21',2),(23,9,1,'2014-10-25 18:04:23',1),(24,9,1,'2014-10-25 18:04:34',1),(25,10,1,'2014-10-25 18:10:23',1),(26,11,1,'2014-10-25 18:42:25',1),(27,12,1,'2014-10-25 18:45:33',0),(28,13,1,'2014-10-25 18:45:44',1),(29,14,1,'2014-10-25 18:49:20',0),(30,15,1,'2014-10-25 18:53:37',1),(31,14,1,'2014-10-25 18:54:17',2),(32,12,1,'2014-10-25 18:54:17',2),(33,14,1,'2014-10-25 18:54:24',1),(34,12,1,'2014-10-25 18:54:24',1),(35,12,1,'2014-10-25 19:02:19',1);
/*!40000 ALTER TABLE `verified` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-25 20:15:39
