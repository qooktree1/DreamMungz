CREATE DATABASE  IF NOT EXISTS `dreammungz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dreammungz`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: j7a605.p.ssafy.io    Database: dreammungz
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `achievement_id` bigint NOT NULL AUTO_INCREMENT,
  `achieve` varchar(255) NOT NULL,
  `achieve_date` datetime(6) DEFAULT NULL,
  `tier` varchar(255) DEFAULT NULL,
  `job_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`achievement_id`),
  KEY `FKdwmys8abehh4mc0gqm4m935k7` (`job_id`),
  KEY `FK6q6bvyfywq6uitf4029hh7whi` (`member_id`),
  CONSTRAINT `FK6q6bvyfywq6uitf4029hh7whi` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKdwmys8abehh4mc0gqm4m935k7` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES (1,'N',NULL,NULL,1,1),(2,'N',NULL,NULL,2,1),(3,'N',NULL,NULL,3,1),(4,'N',NULL,NULL,4,1),(5,'N',NULL,NULL,5,1),(6,'N',NULL,NULL,6,1),(7,'N',NULL,NULL,7,1),(8,'N',NULL,NULL,8,1),(9,'N',NULL,NULL,9,1),(10,'N',NULL,NULL,10,1),(11,'N',NULL,NULL,11,1),(12,'N',NULL,NULL,12,1),(13,'N',NULL,NULL,13,1),(14,'N',NULL,NULL,14,1),(15,'N',NULL,NULL,15,1),(16,'N',NULL,NULL,16,1),(17,'N',NULL,NULL,17,1),(18,'N',NULL,NULL,18,1),(19,'N',NULL,NULL,19,1),(20,'N',NULL,NULL,20,1),(21,'N',NULL,NULL,21,1),(22,'N',NULL,NULL,22,1),(23,'N',NULL,NULL,23,1),(24,'N',NULL,NULL,24,1),(25,'N',NULL,NULL,25,1),(26,'N',NULL,NULL,26,1),(27,'N',NULL,NULL,27,1),(28,'N',NULL,NULL,28,1);
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `buyer_id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`buyer_id`),
  KEY `FKw70g737m31d79dtqydhwwjqh` (`member_id`),
  CONSTRAINT `FKw70g737m31d79dtqydhwwjqh` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_id` bigint NOT NULL AUTO_INCREMENT,
  `cur_scene` bigint NOT NULL,
  `father` bigint DEFAULT NULL,
  `mother` bigint DEFAULT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_result`
--

DROP TABLE IF EXISTS `game_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_result` (
  `game_result_id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  `face` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `hair` varchar(255) NOT NULL,
  `tier` varchar(255) NOT NULL,
  `game_id` bigint DEFAULT NULL,
  `job_id` bigint NOT NULL,
  PRIMARY KEY (`game_result_id`),
  KEY `FKg7hnlts78dmtl1nqjleq4v1ku` (`game_id`),
  KEY `FKi72j5s6l190e96s46e333ryg8` (`job_id`),
  CONSTRAINT `FKg7hnlts78dmtl1nqjleq4v1ku` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
  CONSTRAINT `FKi72j5s6l190e96s46e333ryg8` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_result`
--

LOCK TABLES `game_result` WRITE;
/*!40000 ALTER TABLE `game_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_result_status`
--

DROP TABLE IF EXISTS `game_result_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_result_status` (
  `game_result_status_id` bigint NOT NULL AUTO_INCREMENT,
  `value` bigint NOT NULL,
  `game_result_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  PRIMARY KEY (`game_result_status_id`),
  KEY `FK4sd74cuomurft5nejxhvt00m3` (`game_result_id`),
  KEY `FKl8vo1i3t17qivf49kju5uc33n` (`status_id`),
  CONSTRAINT `FK4sd74cuomurft5nejxhvt00m3` FOREIGN KEY (`game_result_id`) REFERENCES `game_result` (`game_result_id`),
  CONSTRAINT `FKl8vo1i3t17qivf49kju5uc33n` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_result_status`
--

LOCK TABLES `game_result_status` WRITE;
/*!40000 ALTER TABLE `game_result_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_result_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_status` (
  `game_status_id` bigint NOT NULL AUTO_INCREMENT,
  `value` bigint NOT NULL,
  `game_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  PRIMARY KEY (`game_status_id`),
  KEY `FKsonvfr21kch4twjm59bic6k9j` (`game_id`),
  KEY `FKlihc3d3aam7q02m3rk95g5v37` (`status_id`),
  CONSTRAINT `FKlihc3d3aam7q02m3rk95g5v37` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `FKsonvfr21kch4twjm59bic6k9j` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_story`
--

DROP TABLE IF EXISTS `game_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_story` (
  `game_story_id` bigint NOT NULL AUTO_INCREMENT,
  `sequence` bigint NOT NULL,
  `state` varchar(255) NOT NULL,
  `game_id` bigint NOT NULL,
  `story_id` bigint NOT NULL,
  PRIMARY KEY (`game_story_id`),
  KEY `FKeojewc1qbxqx1fsn4pisdce72` (`game_id`),
  KEY `FKhqhshyd52x5igo2yowvtq19yo` (`story_id`),
  CONSTRAINT `FKeojewc1qbxqx1fsn4pisdce72` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`),
  CONSTRAINT `FKhqhshyd52x5igo2yowvtq19yo` FOREIGN KEY (`story_id`) REFERENCES `story` (`story_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_story`
--

LOCK TABLES `game_story` WRITE;
/*!40000 ALTER TABLE `game_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'KING'),(2,'ASTRONAUT'),(3,'ATHLETE'),(4,'DOCTOR'),(5,'POLICE'),(6,'CHEF'),(7,'IDOL'),(8,'DEVELOPER'),(9,'MUNGPIA'),(10,'TEACHER'),(11,'JUDGE'),(12,'MYSTERIOUS_THIEF'),(13,'TRAVELER'),(14,'ARTIST'),(15,'SCIENTIST'),(16,'JANITOR'),(17,'REPORTER'),(18,'BUILDING_OWNER'),(19,'VOCALIST'),(20,'SCULPTOR'),(21,'UNKNOWN_AUTHOR'),(22,'YOUTUBER'),(23,'BODYGUARD'),(24,'FORTUNE_TELLER'),(25,'THIEF'),(26,'PHILOSOPHER'),(27,'FARMER'),(28,'JOBLESS');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `nonce` bigint NOT NULL,
  `playing` varchar(255) NOT NULL,
  `rep_icon` varchar(255) NOT NULL,
  `game_id` bigint DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `UK_fdsep41w3gtrt6qfmmnxc6j1h` (`address`),
  KEY `FK9t0rjq7homqoo7tqv0i1l2h2u` (`game_id`),
  CONSTRAINT `FK9t0rjq7homqoo7tqv0i1l2h2u` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negotiation`
--

DROP TABLE IF EXISTS `negotiation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negotiation` (
  `negotiation_id` bigint NOT NULL AUTO_INCREMENT,
  `cancel` varchar(255) NOT NULL,
  `choice` varchar(255) NOT NULL,
  `contract_id` bigint NOT NULL,
  `nego_time` datetime(6) NOT NULL,
  `price` bigint NOT NULL,
  `refund` varchar(255) NOT NULL,
  `member_id` bigint NOT NULL,
  `trade_id` bigint NOT NULL,
  PRIMARY KEY (`negotiation_id`),
  UNIQUE KEY `UK_3fvmyrlph0brjxtbbsocn0723` (`contract_id`),
  KEY `FKq92sltbg5fx3gyl4vv37dqd` (`member_id`),
  KEY `FKnn63vs7qm8fvi8efi4le16qj` (`trade_id`),
  CONSTRAINT `FKnn63vs7qm8fvi8efi4le16qj` FOREIGN KEY (`trade_id`) REFERENCES `trade` (`trade_id`),
  CONSTRAINT `FKq92sltbg5fx3gyl4vv37dqd` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negotiation`
--

LOCK TABLES `negotiation` WRITE;
/*!40000 ALTER TABLE `negotiation` DISABLE KEYS */;
/*!40000 ALTER TABLE `negotiation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nft`
--

DROP TABLE IF EXISTS `nft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nft` (
  `nft_id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL,
  `face` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `hair` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `metadata` varchar(255) NOT NULL,
  `tier` varchar(255) NOT NULL,
  `token_id` bigint NOT NULL,
  `job_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`nft_id`),
  UNIQUE KEY `UK_poiart65ffprxv2gnm9fn85pa` (`metadata`),
  UNIQUE KEY `UK_kh4s58jvelfa4k46x02q5b0x9` (`token_id`),
  KEY `FKchfc8ummt07pb36kfdy03rtt0` (`job_id`),
  KEY `FK4k2026y0y087aeo0upalqivtk` (`member_id`),
  CONSTRAINT `FK4k2026y0y087aeo0upalqivtk` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKchfc8ummt07pb36kfdy03rtt0` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nft`
--

LOCK TABLES `nft` WRITE;
/*!40000 ALTER TABLE `nft` DISABLE KEYS */;
/*!40000 ALTER TABLE `nft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nft_status`
--

DROP TABLE IF EXISTS `nft_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nft_status` (
  `nft_status_id` bigint NOT NULL AUTO_INCREMENT,
  `value` bigint NOT NULL,
  `nft_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  PRIMARY KEY (`nft_status_id`),
  KEY `FK1ecd23f13lxoxosx9q7kh7aqk` (`nft_id`),
  KEY `FKh2v9pum1uu9w5gx8oor7cqj7w` (`status_id`),
  CONSTRAINT `FK1ecd23f13lxoxosx9q7kh7aqk` FOREIGN KEY (`nft_id`) REFERENCES `nft` (`nft_id`),
  CONSTRAINT `FKh2v9pum1uu9w5gx8oor7cqj7w` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nft_status`
--

LOCK TABLES `nft_status` WRITE;
/*!40000 ALTER TABLE `nft_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `nft_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `requirement_id` bigint NOT NULL AUTO_INCREMENT,
  `satisfied_amount` bigint NOT NULL,
  `job_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  PRIMARY KEY (`requirement_id`),
  KEY `FKkwbwoq0gtm3g6v11v1nqaucy6` (`job_id`),
  KEY `FKh8vshfl2n6kbiyrtacf7rbj53` (`status_id`),
  CONSTRAINT `FKh8vshfl2n6kbiyrtacf7rbj53` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `FKkwbwoq0gtm3g6v11v1nqaucy6` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,5,1,1),(2,5,1,2),(3,5,1,3),(4,5,1,4),(5,5,1,5),(6,5,1,6),(7,5,1,7),(8,5,1,8),(9,5,1,9),(10,5,1,10),(11,1,1,11),(12,9,2,2),(13,9,2,3),(14,9,2,4),(15,9,2,5),(16,9,3,1),(17,9,3,3),(18,9,3,6),(19,9,3,8),(20,9,4,2),(21,9,4,4),(22,9,4,6),(23,9,4,8),(24,9,5,1),(25,9,5,3),(26,9,5,5),(27,9,5,9),(28,1,5,11),(29,9,6,3),(30,9,6,4),(31,9,6,7),(32,9,6,8),(33,7,7,6),(34,7,7,7),(35,7,7,9),(36,7,8,1),(37,7,8,4),(38,7,8,8),(39,7,9,3),(40,7,9,5),(41,7,9,10),(42,-1,9,11),(43,7,10,2),(44,7,10,5),(45,7,10,9),(46,1,10,11),(47,7,11,2),(48,7,11,5),(49,7,11,9),(50,1,11,11),(51,5,12,3),(52,5,12,8),(53,-1,12,11),(54,5,13,4),(55,5,13,7),(56,5,14,7),(57,5,14,8),(58,5,15,2),(59,5,15,4),(60,5,16,1),(61,5,16,8),(62,1,16,11),(63,5,17,2),(64,5,17,5),(65,3,18,10),(66,3,19,9),(67,3,20,8),(68,3,21,7),(69,3,22,6),(70,3,23,5),(71,3,24,4),(72,3,25,3),(73,3,26,2),(74,3,27,1),(75,0,28,1);
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scene`
--

DROP TABLE IF EXISTS `scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scene` (
  `scene_id` bigint NOT NULL AUTO_INCREMENT,
  `bgm` varchar(255) DEFAULT NULL,
  `content` varchar(3000) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `story_id` bigint NOT NULL,
  PRIMARY KEY (`scene_id`),
  KEY `FK5wgvktdlgqbhklchxxvyknriu` (`story_id`),
  CONSTRAINT `FK5wgvktdlgqbhklchxxvyknriu` FOREIGN KEY (`story_id`) REFERENCES `story` (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scene`
--

LOCK TABLES `scene` WRITE;
/*!40000 ALTER TABLE `scene` DISABLE KEYS */;
INSERT INTO `scene` VALUES (1,'Game','날이 선선한 어느 날..<br/><br/>\"일어나!!\"<br/>\"...\"<br/>\"얼른 일어나라니깐!! 갈 길이 먼데 첫날부터 이러면 어떡해!!\"<br/>\"...아!\"<br/><br/>갑자기 놀란 듯, 아기 강아지가 벌떡 일어났다. 그렇다, 이 강아지가 이번 이야기의 주인공으로, 오늘 태어난지 딱 한 살이 되는 날이다.<br/><br/>\"빨리 나와, 와서 생일 축하해야지.\"<br/><br/>엄마 강아지는 걱정스러운 눈빛으로 아기 강아지를 깨우고 거실로 나갔다.','Start.jpg',1),(2,'Game','아기 강아지는 졸린 눈을 비비며 엄마 강아지를 따라 나갔다. 거실로 나오자 보이는 거대한 케이크와 촛불들, 그리고 아빠 강아지가 있었다.<br/><br/>\"생일 축하합니다~ 사랑하는 우리 아가의 생일 축하합니다~ 와!!!\"<br/><br/>아기 강아지는 엄마, 아빠 강아지의 환영을 받으며 촛불을 껐다. 이어서 그들은 간단한 아침을 먹었다. 어쩐지 입맛이 없어 보이는 아기 강아지.. 억지로 밥을 꾸역꾸역 먹으며 조심스럽게 물었다.',NULL,1),(3,'Game','\"물론이지. 이 엄마도, 아빠도 너만했을 때 산신견님을 만났단다. 한 살이 되면 산신견님을 찾으러 여행을 떠나는게 우리 강아지들의 전통이잖니. 가면 너에게 가장 적합한 직업을 알려주실거야. 뭐 소문으로는 항상 좋은 직업만을 알려주시는건 아니지만... 우리 아가는 좋은 직업을 받지 않을까?\"<br/><br/>엄마 강아지는 해맑은 표정으로 말씀을 이어나갔다.<br/><br/>\"참, 오늘 아침에 보니까 너 준비가 하나도 안되어있던데. 아직 시간은 있으니까 밥 먹고 올라가서 준비하고 내려와.\"',NULL,1),(4,'Game','2층 창고로 올라와서 여행 가방을 준비한다. 어떤 것을 준비할까?','Bag.jpg',1),(5,'Game','가방을 싸고 내려가려고 하는데, 앞에 전신 거울이 보인다. 강아지는 빤히 거울을 보다 혼잣말로 중얼거린다.',NULL,1),(6,'Game','아기 강아지가 밖으로 나오자, 엄마 아빠 강아지도 배웅을 위해 따라 나왔다.<br/><br/>\"산신견님께 가서 인사 잘 드리고 오렴~ 우리 안부도 전해주고. 아 참, 내가 그 말을 깜빡했네. 산신견님은 특히 자신을 만나러 오는 길에 일어났던 일들을 유심히 지켜보신다고 하니까, 조심해야 한단다!\"<br/>\"네 알겠어요. 그럼, 다녀오겠습니다!\"<br/><br/>아기 강아지는 힘찬 목소리로 부모님께 인사를 드리고 집을 나섰다.<br/><br/>\"녀석, 아까는 겁먹은 표정이더니 지금은 또 씩씩해졌구만.\"<br/><br/>아빠 강아지는 점점 멀어지는 아기 강아지를 흐뭇한 표정으로 바라보면서, 중얼거렸다. 선선한 바람과 따스한 햇살을 맞으며 아기 강아지는 머나먼 여행을 떠났다.',NULL,1),(7,'Game','그렇게 얼마나 걸었을까.. 드디어 눈 앞에 산신견님이 계신다는 산이 나타났다. 소문대로 아주 거대하고 높은 산이었다. 강아지는 부지런히 걸어 높은 산을 등반했다. 정상에 올라오니, 거대한 연못이 보였다.<br/><br/>\"여기까지 오느라 수고 많았네, 젊은이.\"<br/><br/>갑자기 낮고 중후한 음성이 들렸다. 연못의 물결이 흔들리더니 이내 물이 보글보글 끓어오르면서 산신견이 등장했다.<br/><br/>\"당신이 바로 산신견님이시군요..!!\"<br/><br/>\"...그래. 한 살이 되어 날 찾아왔나보군... 오는데 힘들지는 않았나?\"<br/>','Ohmygod.jpg',2),(8,'Game','\"그래.. 여기까지 포기하지 않고 오다니 기특하구만. 매 순간이 선택의 연속이었겠지. 때론 하고 싶은 대로 선택하기도, 때론 상대방을 위해서 선택하기도 했을거야. 그렇지만 세상에 정답이 있지는 않단다. 틀린 선택지는 없다는 뜻이야. 서로가 약속한 규칙만 깨지 않는다면, 모든 선택들은 존중받을 가치가 있단다. 그러니 두려워하지 말고 너의 마음을 따라서 살아가거라.\"<br/><br/>산신견은 이내 고민하더니 말을 이어나갔다.<br/><br/>\"그래.. 어디 한 번 직업을 볼까... 오! 자네... 재미있는 여행을 하면서 왔구만... 많은 동물들도 만나고 많은 일들도 경험하고... 음 그래... 이게 좋겠군. 좋아 말해주지... 자네의 직업은 바로...!\"',NULL,2),(9,'Game','어느덧 깜깜한 밤이 되었다. 달빛도 사라진 어둠만이 가득한 하늘에, 은하수가 보이기 시작했다. 별이 하나 둘 늘어나더니 어느새 밤하늘을 가득 채웠다. 머리 위로 별빛이 쏟아진다는 표현이 결코 과한 표현이 아니라는 것을 깨닫는 순간이었다.','Milkyway.png',3),(10,'Game','반짝 반짝 작은 별~ 아름답게 비치네...\' 강아지는 그렇게 감성에 젖은 채 밤을 보냈다.',NULL,3),(11,'Game','아름다운 별을 보면서 부모님의 사랑을 다시 한 번 떠올리게 되었다. 강아지는 그렇게 감성에 젖은 밤을 보냈다.',NULL,3),(12,'Game','눈 앞에 산이 보인다. 높지는 않아 금방 올라갈 수 있을 듯 하다.','Climbing.png',4),(13,'Game','오랜만에 등산을 하니까 신이 난다. 정상에서 야호를 원없이 외쳤다!',NULL,4),(14,'Game','언제 체력이 떨어질지 모르니 산은 나중에 올라가기로 한다.',NULL,4),(15,'Game','저쪽에 강아지들이 모여서 이야기를 나누고 있다. 심각한 분위기는 아닌 것 같은데.. 한번 가볼까?',NULL,5),(16,'Game','자세히 가보니 의문의 상자와 쪽지가 붙어있었다. 쪽지에는 <br/><i>\'영리한 자만이 배부름을 누릴 수 있다.\'</i><br/> 라는 말과 함께 다음의 식이 적혀있다.<br/><br/>1★3 = 32<br/>7★9 = 632<br/>10★15 = ?<br/><br/>? 안에 들어갈 숫자는 무엇일까?','Smartbox.png',5),(17,'Game','별로 궁금하지 않기 때문에 가던 길을 마저 가기로 했다.',NULL,5),(18,'Game','숫자를 입력해봤지만 자물쇠는 굳게 잠긴 채 열리지 않았다.',NULL,5),(19,'Game','자물쇠가 덜컥 하고 열렸다! 상자 안에는 약간의 개껌이 들어있어 맛있게 먹을 수 있었다.',NULL,5),(20,'Game','잠을 자려고 하는데, 저 멀리 작은 집이 보인다. 버려진 집인 것 같은데, 혼자 자기에는 적당한 사이즈인 것 같다. 보수를 조금 하면 잘 수 있겠지만, 집이 꽤  낡아 보여 보수를 하다가 집이 무너질지도 모르겠다.','Oldhouse.png',6),(21,'Game','집을 잘 보수하여, 오늘은 편안하게 잘 수 있었다.',NULL,6),(22,'Game','건강이 최우선이니까, 무리하지 않고 근처 길가에서 잠을 청했다.',NULL,6),(23,'Game','아기 고양이 삼형제가 울고 있다. 이유를 물어보니 가지고 놀던 공이 저기 구멍에 빠졌다고 한다. 생각보다 구멍이 크고 깊어 조금은 위험해 보이는데.. 어떻게 할까?','Threecats.png',7),(24,'Game','아기들에게 미안하다고 말하며 인사를 하고 헤어졌다.',NULL,7),(25,'Game','위험했지만 공을 가져왔다. 아기 고양이들이 크게 고마워했다.',NULL,7),(26,'Game','아뿔싸, 벌집을 건드려버렸다. 뛰어!!','Honeycomb.png',8),(27,'Game','휴, 간신히 벌들의 위협에서 벗어났다.',NULL,8),(28,'Game','벌들과 맞서 싸웠지만, 역부족이었다. 머리에 작은 혹이 생겼다.',NULL,8),(29,'Game','날이 어두워져 잠을 자려고 하는데, 저 멀리 숲 속에서 정체를 알 수 없는 불빛이 보인다. 용기를 내서 가볼까?','Wisp.png',9),(30,'Game','두려움을 이겨내고 가봤는데, 불빛의 정체는 다름 아닌 반딧불이였다! 휴..',NULL,9),(31,'Game','깜깜한 밤에 무모한 도전은 안하는 것이 좋다고 생각한다.',NULL,9),(32,'Game','길을 잃었다. 어딜 가야 할까...?','Gilchi.png',10),(33,'Game','선택이 맞았다! 다시 가던 길을 갈 수 있게 됐다.',NULL,10),(34,'Game','운이 좋았다! 선택한 길이 지름길이라 다시 가던 길을 갈 수 있었다.',NULL,10),(35,'Game','만약 이 게임을 즐기고 있다면 선택해라. 단, 솔직해져야 한다.','Godjoke.png',11),(36,'Game','솔직하지 못하군.',NULL,11),(37,'Game','솔직하지 못하군.',NULL,11),(38,'Game','불량배들이 부르고 있다. 어떻게 할까?','Bully.png',12),(39,'Game','불량배들이 잡지 못할 정도로 빠르게 도망쳐 나왔다.',NULL,12),(40,'Game','몸이 아프지만, 용기 있게 싸우고 나니 뿌듯한 마음이 든다.',NULL,12),(41,'Game','지나가다 본 나무에 마지막 사과 열매가 달려있다. 아슬아슬하게 떨어질 것 같은데… 어디 방법이 없을까?','Lastapple.png',13),(42,'Game','목이 욱씬거리지만 사과가 떨어져서 맛있게 먹을 수 있었다.',NULL,13),(43,'Game','주변에 돌멩이를 던져 사과를 떨어뜨렸다. 힘을 안 들이고 맛있게 먹을 수 있었다.',NULL,13),(44,'Game','바닥에 원반이 놓여져있다. 마침 심심했는데, 가지고 놀까?','Flyingdisk.png',14),(45,'Game','배도 출출한데, 힘 빼지 않기로 한다.',NULL,14),(46,'Game','배가 고파졌지만, 튼튼한 체력을 얻을 수 있었다.',NULL,14),(47,'Game','과일 장수가 과일을 판매하고 있는데, 구매하려는 손님이 너무 많아 일이 버거워보인다.','Fruitsales.png',15),(48,'Game','일을 도와드렸더니, 감사하다고 말씀하시며 약간의 수고비를 주셨다.',NULL,15),(49,'Game','사람이 너무 많아, 그냥 지나가기로 한다.',NULL,15),(50,'Game','줄을 서서 기다리며, 과일을 사먹었다. 아주 달고 맛있었다.',NULL,15),(51,'Game','지나가던 중 발견한 어느 마을 근처에 개울가가 있다. 그 주변에서 쉬려고 한다.','Movehometown.png',16),(52,'Game','쉼터를 제작하며 발놀림이 늘어났다.',NULL,16),(53,'Game','바로 누워서 그런지 체력을 충분히 보충한 느낌이 든다.',NULL,16),(54,'Oldwatch','다시 길을 나선지도 며칠 째, 드넓은 들판의 풍경은 바뀌지 않고 그저 걷는 일상이 반복되고 있었다. 잠시 후 얼마나 더 걸었을까, 저 멀리 숲이 보이는 것 같다. 허겁지겁 달려가보니, 무려 자작나무들이 빽빽한 숲이었다. 보기만 해도 마음이 시원해지는게, 그 동안의 피로가 한꺼번에 풀리는 느낌이다. 숲 입구에 벤치가 놓여있는 것 같아 그 쪽으로 가보는데, 가까이 가보니 노견 한 마리가 앉아있었다. 그런데 한숨을 푹푹 내쉬는 모습이, 마치 무슨 일이 있는 것처럼 보인다.',NULL,17),(55,'Oldwatch','\"할아버지, 안녕하세요?\"<br/>\"...자네는 누구인가?\"<br/>\"그냥 여행하던 강아지입니다. 표정을 보니 무슨 사연이 있으신 것 같아서요.\"<br/><br/>할아버지는 한숨을 내쉬며, 이야기를 시작했다.<br/><br/>\"내가 시계를 잃어버려서 말야. 오는 길에 잃어버렸는데, 나에겐 몹시 소중하다네. 저 자작나무숲에서 잃어버린 것 같은데, 혼자서는 막막해서 들어가지 못하고 앉아있었다네. 혹시 자네가 도와줄 수 있는가?\"',NULL,17),(56,'Oldwatch','너무 피곤했던 강아지는 숲 입구에서 잠시 쉬었다가 길을 마저 떠났다.',NULL,17),(57,'Oldwatch','\"힘든 결정해줘서 고맙네, 날이 저물기 전에 가봅세.\"<br/><br/>그렇게 강아지는 할아버지와 함께 자작나무 숲으로 들어가게 되었다. 숲은 생각보다 고요했다. 그리고 어두웠다... 높게 뻗은 자작나무들이 분위기를 한 층 긴장시키는 기분이었다. 살짝 겁에 질린 듯한 모습을 노견은 보았는지, 강아지에게 말을 걸었다.<br/><br/>\"그래, 지금 여행을 다닌다고 했나? 혹시 산신견님을 만나러?\"<br/><br/>말 없이 고개만 끄덕이는 강아지를 보곤, 노견은 이야기를 꺼내기 시작했다.<br/><br/>\"나도 옛날에는 그렇게 여행을 떠났었지. 난 사실 여행을 떠나는 걸 좋아하진 않았다네. 한 살이 되면 산신견님을 만나러 가야 하는 강아지들의 전통이 아니었다면 아마 평생을 태어난 곳에서 벗어나지 않았을 게야. 그래도 여행을 떠난 덕분에, 많은 이들을 만나고 많은 것들을 경험할 수 있었지. 무엇보다 좋은 아내를 만나 행복하게 살 수 있었다네. \"<br/>\"그렇군요. 근데 할머니는 같이 안오셨나요?\"<br/>\"아, 그 이는 잠깐 어디 갔다네. 곧 다시 만날게야. 아무튼 자네를 보니 그 때의 기억들이 새록새록 나는구만. 여행하면서 힘든 점은 없나?\"',NULL,17),(58,'Oldwatch','할아버지를 도와드리기엔 너무 피곤했던 강아지는 숲 입구에서 잠시 쉬었다가 길을 마저 떠났다.',NULL,17),(59,'Oldwatch','\"하하하! 자네와 같은 용기를 가진 사람들을 만나본 적이 있지. 다들 어찌 그리 확신이 찬 모습에 생각은 또 어찌 그리 긍정적인지. 나로서는 상상도 못한다니까. 건너건너 그들의 근황을 들어보면 다들 멋진 직업을 가지고 잘 살고 있다고 하더군. 자네도 그런 강아지가 될거라 생각하네. 이렇게 길에서 처음 만난 늙은이의 부탁을 들어주고 있지 않은가. 틀림없이 좋은 강아지가 될게야. 내 응원하지\"',NULL,17),(60,'Oldwatch','\"그래.. 나도 그 때는 참 겁이 많았지. 스스로 길을 개척해나가는 것이 누군가에겐 낭만일 수 있지만 나에게는 그러지 않았거든. 그저 눈 앞에 보이는 것은 내가 걸어온 길들이었으니까 말야. 그래서인지 자꾸 옛날을 그리워하곤 했지. 그러던 어느날 깨달았다네. 그렇게 그리워하던 옛날들도 그 당시에는 앞을 몰라 두려움이 앞서던 내일이라는 것을 말이야. 지금은 그저 그 길의 끝에 서서 모든 걸 돌아봤을 때, 행복하게 웃기를 바랄 뿐이네.\"',NULL,17),(61,'Oldwatch','\"아무튼 자네도.. 아니 잠깐!\"<br/><br/>갑자기 할아버지가 하늘을 보면서 걸음을 멈췄다.<br/><br/>\"저길 보세. 내 시계가 저기에 있었구만!\"<br/><br/>할아버지가 가리킨 곳에는 다람쥐가 시계를 들고 나뭇가지 위에서 쉬고 있었다. 저 높은 나무에는 어떻게 올라갔는지... 무슨 방법이 없을까?',NULL,17),(62,'Oldwatch','성공이다! 돌이 나뭇가지에 정확히 맞아, 다람쥐가 놀라 시계를 떨어뜨렸다.',NULL,17),(63,'Oldwatch','성공했다! 숨을 크게 쉬고 순간적으로 큰 소리를 냈더니, 다람쥐가 깜짝 놀랐는지 시계를 떨어뜨리며 나무 위로 도망가버렸다.',NULL,17),(64,'Oldwatch','성공이다! 용기를 내어 대화를 시도했더니, 다람쥐는 흔쾌히 시계를 주고 떠났다.',NULL,17),(65,'Oldwatch','\"할아버지, 시계 여기 있어요.\"<br/><br/>할아버지는 시계를 덥석 받아 설레는 표정으로 시계를 이리저리 살펴보면서 대답했다.<br/><br/>\"오오, 틀림없이 내 것이 맞다네. 고맙네 젊은이.. 오래된 시계라 낡아서 볼품은 없지만 자네의 그 선의가 이 늙은이에게 얼마나 큰 행복을 안겨주었는지 모를게야.\"<br/><br/>할아버지는 시계를 스윽 내밀면서 뚜껑을 열었다.',NULL,17),(66,'Oldwatch','시계에는 할아버지와 그의 부인이 함께 찍은 사진이 담겨있었다.<br/><br/>\"그 이가 나에게 준 첫 선물이라네. 뭐가 그리 급했는지 먼저 무지개별로 떠났는데, 이 시계를 보면 꼭 나와 함께하고 있는 것 같단 말이지. 몇십년이 지났는데도 아직도 잘 움직인다오. 지금까지 잘 버텨준 만큼 내가 떠날 때까지만 좀 더 힘을 내줬으면 하는데..\"<br/><br/>할아버지는 그렇게 아무 말씀이 없으셨다. 강아지는 인사를 드리고 가던 길을 마저 떠났다. 고요한 바람 소리와 작은 시계 소리만이 거리를 가득 채울 뿐이었다.','Grandfa.jpg',17),(67,'Game','오늘은 날씨가 유난히 좋은 날이다. 길에 동물들도 거의 안보여서 마음 편히 혼자 여행하고 있었다. 아쉬운 점이 있다면.. 햇빛이 살짝 뜨겁다는 정도? 오랫동안 걸어서 그런지 피부가 좀 따가워지는 것 같기도 한다. 마침 저 멀리 거대한 느티나무가 보여, 강아지는 잠시 느티나무 아래에서 쉬어가기로 했다. 그런데 이런, 자세히 보니 느티나무 아래에 호랑이 한 마리가 낮잠을 자고 있었다. 그냥 좀 더 걸어보기로 생각하며 등을 돌리던 찰나에, 중후한 목소리가 들렸다.<br/><br/>\"이봐...!\"',NULL,18),(68,'Game','\"그래 너. 여기 너 말고 누가 있냐?\"<br/><br/>자기도 모르게 까칠한 말투가 튀어나온 호랑이는 당황한 듯 헛기침을 했다. 이내 자상한 목소리로 대화를 이어갔다.<br/><br/>\"해치지 않으니까 걱정은 말고.. 혹시 너 지금 시간 있니? 부탁을 좀 하고 싶은데.\"',NULL,18),(69,'Game','애써 모른척하고 지나가기로 마음을 먹었다. 그렇게 걸어가는데 뒤에서 아무 소리도 안들리길래 안도의 한 숨을 내쉬고 있었다. 그런데 갑자기 목덜미가 잡혔고, 고개를 돌려보니 호랑이가 목을 잡은 채 노려보고 있었다.',NULL,18),(70,'Game','\"너. 내가 부르는거 못 들었어?\"<br/><br/>등골이 오싹해졌다.. 그렇지만, 여기서 사실대로 말했다간 무사하지 못할 것 같은 생각에, 강아지는 자기도 모르게 거짓말을 해버렸다.',NULL,18),(71,'Game','\"그래 뭐.. 들었는데도 그냥 갔으면 넌 무사하지 못했을거야. 뭐 해치려고 부른건 아니니까 걱정 말고. 너 혹시 시간 있냐? 부탁이 좀 있는데.\"',NULL,18),(72,'Game','\"칫 그래. 할 수 없군. 가라.\"<br/><br/>호랑이는 생각보다 순순히 강아지를 놓아주었다. 무슨 이유로 불렀을까 찝찝한 생각만 남은 채, 강아지는 가던 길을 마저 걸어갔다.',NULL,18),(73,'Game','호랑이는 잠시 머뭇거리더니, 말을 꺼냈다.<br/><br/>\"그.. 내가 사실 오늘 이따가 결혼을 하거든. 그런데 결혼식 때 끼기로 한 반지를 잃어버렸지 뭐야. 주문제작이라서 다른걸로 바꿀 수도 없고.. 혹시 네가 좀 찾아줄 수 있냐?\"',NULL,18),(74,'Game','\"칫 그래. 할 수 없군. 가라.\"<br/><br/>호랑이는 생각보다 순순히 강아지를 놓아주었다. 강아지는 안도의 한숨과 더불어 호랑이가 반지를 끼는지 의구심을 가지며 가던 길을 마저 걸어갔다.',NULL,18),(75,'Game','호랑이 말대로 뒷동산에 가서 반지를 찾고 있는데, 역시나 찾을 수 없었다. 반지를 찾는게 쉬운 일은 아니니까.. 그러다 사자를 마주쳤다. 같은 날 호랑이에 이어 사자까지 만나게 되다니, 운도 지지리 없다고 생각하던 찰나 사자가 말을 걸어왔다.<br/><br/>\"응? 강아지가 여기엔 무슨 일로?\"',NULL,18),(76,'Game','무슨 일인지 자초지종을 들은 사자는 당황스러워하며 대답했다.<br/><br/>\"그럴 리가 없는데... 호랑 성격 상 반지를 잃어버리지도 않을 뿐더러, 잃어버렸다 해도 처음 본 남에게 부탁할리가 없어. 부탁할거면 차라리 나한테 부탁했겠지..... 너 혹시 호랑이 손 확인은 해본거야? 반지 없는거 확실해?\"<br/><br/>거북이는 말 없이 고개를 저었다.<br/><br/>\"안되겠군. 마침 나도 결혼식 때문에 호랑이 보러 가는 길인데, 같이 가서 얘기해보자.\"',NULL,18),(77,'Game','강아지가 사자와 함께 나타나자, 호랑이는 당황스러워 하며 질문했다.<br/><br/>\"둘이 어떻게 같이 오는거지...? 그나저나 강아지, 내 반지는 찾았나?\"',NULL,18),(78,'Game','\"음.. 그래 괜찮아. 사실 반지는 여기 있거든.\"<br/><br/>호랑이는 살며시 자기 손을 보여줬다. 손가락에는 반지가 영롱하게 반짝이고 있었다. 사자와 강아지는 서로 말없이 바라보다가, 강아지가 말을 꺼냈다.',NULL,18),(79,'Game','호랑이는 말까지 더듬었다.<br/><br/>\"그... 그게 무슨 말이야? 내가 거짓말을 했다니?\"<br/>\"이상하잖아요. 결혼 반지를 잃어버렸는데도 여기 앉아서 낮잠을 잔다는게. 그것도 결혼식을 당장 앞둔 상황에서 말이에요. 호랑씨가 그럴 분이 아니라고 사자 아저씨가 말하시는 것도 그렇고요.\"<br/>\"하... 너 꽤나 똑똑한 녀석이었구나. 맞아... 사실 반지는 잃어버리지 않았어.\"<br/><br/>호랑이는 살며시 자기 손을 보여줬다. 손가락에는 반지가 영롱하게 반짝이고 있었다.',NULL,18),(80,'Game','\"사실 결혼식인데 마음이 준비가 덜 됐나봐. 난 그 동안 줄곧 혼자 지내왔거든. 물론 사자 쟤를 비롯해서 함께 어울렸던 친구들도 있긴 한데... 결혼은 평생을 함께 하는 가족이 생기는 거잖아? 그렇게 생각을 하니까 겁이 나더라고. 무엇보다 나 때문에 신부가 힘들어할까 봐 걱정돼. 행복한 결혼 생활을 안겨줘야 하는데 나도 모르게 상처를 주고 아픔을 줄까봐..\"',NULL,18),(81,'Game','\"맞아.. 강해 보이는 이미지와 성격 때문인지 어느 순간부터 남들에게 고민이나 걱정을 말하기가 꺼려진 것 같아. 사자와도 어릴 때부터 친하게 지낸 사이인데 이런 말도 못 꺼내고. 참 바보 같았네. 그래도 지금은 좀 나아진 것 같아. 얘기를 털어놓아서 그런가? 앞으로도 고민이나 걱정이 생기면 좀 털어놓는 습관을 가져야겠어.\"',NULL,18),(82,'Game','\"그래 맞아... 내가 이렇게 도망치고 있으면 안되지. 결혼을 하기로 한 순간부터 내가 최우선으로 생각하고 지켜야 할 존재가 생겼으니까. 참 바보 같은 생각을 하고 있었네..\"',NULL,18),(83,'Game','호랑이는 잠시 생각하더니 대답하기 시작했다.<br/>\"그래.. 맞아. 생각났어. 여기 느티나무 아래에서, 그냥 지금처럼 낮잠을 자고 있었어. 그러다 닭이 우는 바람에 놀라서 깼지. 그렇게 부스스한 상태로 서로 눈이 마주쳤는데, 그 때 결혼을 결심했던 것 같아. 매일 아침에 눈을 뜨면 마주할 그 장면이, 그 모습이 너무 행복했거든. 물론 지금도 행복하고.\"',NULL,18),(84,'Game','호랑이는 말을 이었다.<br/><br/>\"아무튼 고맙다. 생판 남인 나를 위해 반지도 찾아주려고 하고, 이렇게 훌륭한 조언까지 해주다니 말이야. 덕분에 다시 용기가 나는 구만! 두려워도 직접 겪어보면서 하나씩 이겨내겠어!.\"<br/><br/>옆에서 흐뭇하게 가만히 보고 있던 사자는 시계를 보며 말했다.<br/><br/>\"자자, 대화는 이쯤 하자고. 결혼식까지 시간 얼마 안 남았으니까 얼른 가서 준비해야 해. 호랑 준비 됐지? 어서 가자. 아, 그래. 강아지 너! 시간 되니? 이왕 여기까지 왔는데 너도 호랑 결혼식 같이 갈래?',NULL,18),(85,'Game','\"보면 볼수록 마음에 드는 녀석이군. 시간 없으니까 가자!\"<br/><br/>서둘러 도착한 식장에는 온갖 동물들이 함께 있었다. 오늘따라 길에 동물들이 없다 했더니 다 여기에 있었던 거였나? 토끼와 사슴부터 시작해서 고양이, 심지어는 거북이까지 참석한 모양이다. 결혼식이 시작하면서 호랑씨가 등장했다. 아까의 긴장한 모습은 온데간데 없는, 늠름한 호랑이 그 자체였다. 여러 순서가 지나가고 주례하시는 분의 이야기가 시작됐다. 집중하면서 이야기를 들으려했지만, 점점 지루하다는 느낌을 지울 수 없었다. 집중력이 흐트려질 때 쯤, 사자 아저씨가 말을 걸었다.<br/><br/>\"재미없지? 여러 결혼식에 참석해봤지만, 하나같이 주례사는 재미가 없더군. 아까는 미안했다. 길 가다가 호랑이가 말을 거니 많이 놀랐지? 호랑이 저 녀석이 원래 장난치는 걸 좋아했어. 어릴 때부터 나를 어찌나 괴롭히던지, 처음에는 짜증도 났지만 진심이 아니라는 걸 알고는 나도 같이 장난치고 그랬지. 그런데 오늘 일은 결이 좀 다른 것 같더군. 그만큼 결혼이 긴장되고 그랬나봐... 근데 어딜 가다가 호랑이를 만난 거였니?\"',NULL,18),(86,'Game','\"뭐? 여행? 누굴 만난다고? 흠.... 그렇구만. 뭐 난 강아지들 세계는 잘 모르니까.... 그래도 뭐랄까. 넌 좋은 강아지가 될 것 같다. 이렇게 길가다가 처음 만난 생판 남을 위해 반지도 찾고, 결혼식에도 참석해서 축하해주고.. 보통 쉬운 일이 아니잖아?\"<br/><br/>그렇다. 말 그대로 생판 남을 위해 반지도 찾고, 심지어 결혼식에도 온 강아지였다. 물론 이타적인 마음에서 그런건지, 호랑이라는 두려움에서 시작된 건지는 모르지만. 아무쪼록 결과적으로 여기에 앉아서 호랑이의 결혼을 축하해주는 자신의 모습에 강아지는 대견함을 느꼈다. 그 모습을 흐뭇하게 바라보던 사자는 말을 이어갔다.<br/><br/>\"나중에 여행이 얼추 마무리가 되고 심심해지면, 한 번 놀러와. 이렇게 만난 것도 인연인데 가끔 얼굴 보면 좋지 않겠어? 아까 그 느티나무 아래로 오면 되겠네. 와서 이후의 여행 이야기들도 들려줘. 새신랑 호랑이도 데리고 갈테니까. 엇, 주례사 끝났다.\"<br/><br/>길고 지루한 축사가 끝나고 난 후 양가 부모님이 인사를 드리고, 많은 이들의 환호를 받으며 행사는 마무리가 되었다.',NULL,18),(87,'Game','행진이 끝나고 식장을 나오려는데, 갑자기 맑은 하늘에 비가 쏟아졌다.<br/><br/>\"엇.. 비가 오네요? 날씨가 이렇게 맑은데..?\"<br/><br/>사자 아저씨는 무덤덤하게 대답했다.<br/><br/>\"호랑이 장가가는 날이거든.\"<br/>\"아하...\"<br/><br/>잠시 후 언제 그랬냐는듯 비가 그쳤다. 기약 없는 약속을 뒤로한 채,  강아지는 다시 먼 길을 떠났다. 호랑씨의 앞날도 궁금하지만 여행을 멈출 수는 없으니.. 그저 앞으로의 호랑씨의 결혼 생활이 행복하기를 바랄 뿐이었다.','Tiger.jpg',18),(88,'Game','저 멀리 초록 물결이 일렁인다.',NULL,19),(89,'Game','자세히 가보니 광활한 감자밭이었다! 배가 고프지만, 주인이 따로 있을텐데 고민이 된다.','Potato.jpg',19),(90,'Game','배가 고프지만, 조금 더 가보도록 하자.',NULL,19),(91,'Game','급하게 배를 채웠지만, 금세 죄책감을 가지게 되었다.',NULL,19),(92,'Game','한 서너시간쯤 지났을까, 주인으로 추정되는 농사꾼 황소가 왔다.',NULL,19),(93,'Game','다시 갈 길을 간다.',NULL,19),(94,'Game','농사꾼은 기꺼이 나에게 밥을 내주었다.',NULL,19),(95,'Game','주인은 나를 보고 겁내며 도망갔다. 덕분에 포식을 할 수 있었다.',NULL,19),(96,'Game','주인은 나를 보고선 불쌍했는지 밥을 챙겨주고 떠났다.',NULL,19),(97,'Game','맙소사, 순식간에 밥을 다 먹었다! 농사꾼 황소는 흐뭇한 표정을 지으며 나에게 농사일을 도와주면 밥을 원하는 만큼 주겠다고 한다.',NULL,19),(98,'Game','며칠 동안 농사꾼 황소의 일을 도우며, 숙식을 해결했다. 힘들었지만 덕분에 약간의 힘을 얻을 수 있었다. 농사꾼의 인사를 마치고 길을 마저 떠났다.',NULL,19),(99,'Game','주인은 아쉬움을 뒤로 하고 온화한 미소를 보이며 작별 인사를 했다.',NULL,19),(100,'Game','햇살이 듬뿍 내려 길가의 꽃과 풀들이 싱그럽게 반짝이는 날이다. 좋은 기분으로 길을 걸어가고 있을 때 어디선가 이상한 소리가 들려왔다.<br/><br/>\"낑낑\"<br/><br/>주위를 둘러봤지만 소리의 근원지를 알 수 없었다. 한참을 살펴 본 끝에 겨우 풀들 사이로 기어가고 있는 무언가를 발견할 수 있었다. 강아지는 그것의 이름을 알고 있었다.',NULL,20),(101,'Game','\"반갑구나, 아가야. 모습을 보니 산신견 님을 뵈러 가는 것 같구나.\"<br/>\"어떻게 아셨나요?\"<br/><br/>거북이는 숨이 차는 지 잠시 숨을 길게 들이쉬고 내쉬더니 말을 이었다.<br/><br/>\"그 동안 살아오면서 자네 같은 강아지를 많이 보았지. 두 눈에 생기가 가득하고, 무엇이라도 될 수 있을 것 같은 자신감으로 가득 차 있어. 혹시 지금 당장 행선지가 있느냐. 없다면 나와 이야기라도 나누며 걸어가자꾸나.\"',NULL,20),(102,'Game','같이 가기에 거북이의 속도는 너무 느렸다. 미안하다고 사과하는 강아지에게 거북이는 이해한다는 듯 인자하게 웃으며 손을 흔들어 주었다.',NULL,20),(103,'Game','거북이의 걸음은 느렸기 때문에 강아지는 계속해서 걸음을 늦춰야 했다.<br/><br/>\"내가 많이 느려서 미안하구나, 정 급하면 먼저 떠나도 괜찮단다.\"<br/>\"괜찮아요. 오늘은 날씨도 좋아서 천천히 걷기 좋은걸요.\"<br/><br/>계속해서 걷다보니 어느 새 강아지도 거북이의 속도에 적응해서 의식하지 않아도 맞춰 걸을 수 있게 되었다.<br/>천천히 길을 걸어가며 거북이는 세상의 많은 이야기를 해주었다.<br/>세상에 이제 막 나온 강아지에게는 하나 같이 거짓말 같고 신비한 이야기들이었다.<br/>두 눈을 초롱초롱 빛내며 이야기를 듣는 강아지에게 거북이는 미소를 지으며 물었다.<br/><br/>\"재밌어해서 다행이구나. 어떤 이야기가 가장 재밌었니?\"',NULL,20),(104,'Game','그래, 힘이 아니라 지혜로움이 문제를 해결해주는 열쇠라는 것을 잊지 않았으면 좋겠구나.',NULL,20),(105,'Game','그래, 쓸모 없는 동물은 어디에도 없단다. 누구나 발견하지 못했을 뿐 감춰진 보석을 품고 있다는 걸 잊지 않았으면 좋겠구나.',NULL,20),(106,'Game','그래, 당장은 능력이 없고 힘이 없는 것처럼 느껴져도, 끈기와 노력으로 이겨낸다면 좋은 결실을 맺을 것이란 걸 잊지 않았으면 좋겠구나.',NULL,20),(107,'Game','총총총\'... 그렇게 얼마나 더 걸었을까,  뒤에서 누군가 부리나케 뛰어오는 소리가 들려왔다. 강아지는 그것의 이름도 알고 있었다.<br/><br/>\"토끼?\"<br/><br/>토끼는 강아지와 거북이를 번갈아 보더니 별안간 웃음을 터뜨렸다.<br/><br/>\"푸하하, 느림보한테도 친구가 생겼잖아? 느림보 친구니까 이름은 느림보 투 인가? 푸하하. 야, 너, 이런 느림보랑 같이 가다가는 목적지엔 도착도 못할 걸? 길이나 안 잃으면 다행이지. 어때? 나랑 같이 가는 건?\"',NULL,20),(108,'Game','\"그래. 느림보는 느림보랑 같이 가라. 난 갈 길이 바쁘거든.\"<br/><br/>그렇게 말한 토끼는 총총 뛰며 가버렸다. 잠시나마 고민했던 강아지는 거북이에게 미안한 마음이 들어 아무 말도 하지 못했다. 그렇게 한참을 말 없이 걷다가 해질녘이 되었고 그제서야 거북이가 입을 열었다.<br/><br/>\"아가야. 모두에게는 저마다의 속도가 있단다. 걸음이 빠른 이도, 걸음이 느린 이도 있지. 자신의 속도를 다른 이에게 강요하는 것만큼 이기적인 것도 없단다. 속도는 달라도 앞으로만 나아간다면 언젠가 도달할 수 있으니 조급해 하지 말고 지금 네가 하고 싶고, 할 수 있는 일들을 하나씩 해 나가거라.\"<br/><br/>조금 더 걷자 길가에 누워 코를 골며 자고 있는 토끼가 보였다. 강아지와 거북이가 지나가는지도 모른 채 잠에 빠진 토끼를 지나쳐 조금 더 걸었을까, 해가 완전히 저물어 앞이 보이지 않게 되었다.<br/><br/>\"오늘은 이만 이쯤에서 묵어야겠구나. \"<br/><br/>잔가지와 나뭇잎을 모아 불을 피우고 강아지는 거북이와 나란히 누웠다. 구름 한 점 없이 맑은 하늘에는 찬란한 별들이 수 놓아져 있었다.<br/><br/>\"별들이 참 많구나. 눈에 띄는 별이 있니?\"<br/><br/>강아지는 발을 뻗어 국자 모양을 한 별자리를 가리켰다.<br/><br/>\"용케 북두칠성을 찾아 냈구나. 지금은 누구나에게 알려지고 유명한 별자리지만, 과거의 동물들은 두려워했단다. 죽음을 관장하는 별자리였기 때문이지.\"','Turtle.jpg',20),(109,'Game','강아지도 은근히 마음이 조급해지려는 찰나였다. 토끼의 손에 이끌리며 그 곳을 벗어났지만 차마 거북이의 모습을 쳐다볼 수가 없었다. 그렇지만 거북이는 분명 평소처럼 미소 지어 주었을 것이라고 생각했다.',NULL,20),(110,'Game','\"그래, 칠성이라는 죽음의 신이 있는데, 그 신의 별들이 바로 북두칠성이라는 이야기가 있단다.\"<br/>\"왜 그런 신이 있는 걸까요? 아무도 죽지 않으면 좋겠어요.\"<br/><br/>거북이는 싱긋 웃으며 말을 이었다.<br/><br/>\"무서워 하지 않아도 괜찮단다. 다시 한 번 보렴. 네가 어두운 밤하늘에서도 바로 찾아낼 만큼 밝게 빛나고 있지 않니? 죽음은 끝이 아니라, 열심히 달려온 이에게 새로운 시작이 주어지는 것일 뿐이란다. 두려워 하지 말고 저 별들처럼 지금 자신의 자리에서 자신의 속도로 밝게 빛나는 씩씩한 강아지가 되었으면 좋겠구나. 약속해 주겠니?\"<br/><br/>강아지는 왠지 모르게 슬픈 감정이 들어 말없이 고개만 끄덕였다. 거북이는 조용히 강아지를 쓰다듬어 주었다.<br/><br/>\"잘 자려무나.\"<br/><br/>다음 날, 눈을 뜬 강아지는 거북이를 흔들어 깨웠다.<br/><br/>\"할아버지.\"<br/>\"...\"<br/>\"할아버지..\"<br/><br/>거북이는 움직이지 않았다. 강아지는 거북이의 이야기들을 가슴에 고이 간직한 채 눈물을 훔치며 다시 길을 나섰다.',NULL,20),(111,'Game','\"그래, 아직 아가에겐 어렵고 무서울 수 있겠구나.<br/>그만 잠에 들자꾸나. 잘 자고 앞으로 힘든 일이 있더라도 잘 헤쳐나갈 수 있을게다. 앞으로 꿋꿋이 나가가거라.\"<br/><br/>거북이의 말을 들으며 강아지는 스르르 잠에 들었다. 다음 날, 눈을 뜬 강아지는 거북이를 흔들어 깨웠다.<br/><br/>\"할아버지.\"<br/>\"...\"<br/>\"할아버지..\"<br/><br/>거북이는 움직이지 않았다. 강아지는 거북이의 이야기들을 가슴에 고이 간직한 채 눈물을 훔치며 다시 길을 나섰다.',NULL,20),(112,'Game','강아지 마을에 도착했다! 부모님이 르노 삼촌을 만나라는 말이 생각이 난다. 어떤 방식으로 삼촌을 찾아볼까?','Leuno.jpg',21),(113,'Game','르노 삼촌 집은 촌장님 댁 옆에 있다는 사실을 수소문 끝에 알게 됐다. 방향을 따라 길을 걷다 르노 삼촌이 보인다.',NULL,21),(114,'Game','거리를 돌아다니다 촌장댁 옆에 서성이는 르노 삼촌이 보인다.',NULL,21),(115,'Game','르노 삼촌이 놀라며 주인공에게 뛰어간다.',NULL,21),(116,'Game','\"정말 오랜만이구나. 잘 지냈니? 마을은 무슨 일이니?\"<br/><br/>강아지는 집을 나올때 부모님이 말씀하신 말들을 떠올리며 말한다.<br/><br/>\"부모님께서 마을에 들리면 삼촌 일거리를 도우라고 하셔서 들렸어요!<br/>혹시 도와드릴 일이 있을까요?\"',NULL,21),(117,'Game','\"조만간 마을에 요리 축제가 있어서 대회에 참가하려고 준비 중인데 요리 재료가 부족해. 혹시 꿀을 구해다 줄 수 있겠니?\"',NULL,21),(118,'Game','삼촌의 요리에 들어갈 꿀을 구하기 위해 어디로 가볼까?',NULL,21),(119,'Game','\"꿀? 다행히 식당에 꿀이 남아있어 줄 수 있다.<br/>다만 한 가지 부탁을 해도 될까?\"<br/><br/>요리사가 대답했다.<br/><br/>\"저녁 식사를 준비해야 하는데 밀가루가 없어 오늘 저녁 메뉴를 못 만들고 있다.<br/>마트 사장에게서 밀가루 2포대를 받아와 주겠니?\"',NULL,21),(120,'Game','마트에 들어가 마트 사장님을 만날 수 있었다.<br/>사정을 얘기하니 사장님은 흔쾌히 밀가루 2포대를 주었다.',NULL,21),(121,'Game','밀가루가 무거워 힘들었지만 다시 식당까지 무사히 도착하였다.',NULL,21),(122,'Game','요리사에게 밀가루 2포대를 건네주니 기쁜듯한 얼굴을 했다. <br/><br/>\"고마워\"<br/><br/>요리사한테 꿀을 받았다.',NULL,21),(123,'Game','르노 삼촌에게 꿀을 건넸다.<br/>르노 삼촌은 꿀을 이용해 요리를 준비했고 결과적으로 요리 콘테스트 날 1등을 차지했다!',NULL,21),(124,'Game','마을 서쪽 숲에서 꿀벌들이 존재한다는 소문을 들었다.<br/>거리가 조금 멀지만 걸어 가보자.',NULL,21),(125,'Game','숲 속을 탐색하다 꿀벌 집을 발견했다.<br/>꿀벌들은 주위 꽃들에 정신이 팔려 꿀을 채취하고 있다.<br/>어떤 방식으로 꿀을 구할까?',NULL,21),(126,'Game','꿀벌들은 이번 한 번만 꿀을 주겠다고 말하며 꿀을 건네주었다.',NULL,21),(127,'Game','꿀, 꿀맛이다!',NULL,21),(128,'Game','꿀을 챙겨 재빨리 숲 속을 벗어났다.',NULL,21),(129,'Game','시장에서 꿀을 구할 수 있지 않을까 하는 생각에 시장 쪽으로 발길을 돌려 꿀을 구매했다.',NULL,21),(130,'Game','길을 걷다 어느 한적한 공원에 도착했다. <br/>관리자가 신경을 쓰는 모양인지 상당히 관리가 잘 되어 있는 공원이다.<br/>잠시 공원을 둘러보는 데 경비실 앞에서 누군가가 분주하게 무언가 하고 있는 것 같다.<br/>궁금한데 한 번 다가가 볼까?',NULL,22),(131,'Game','\"후.. 긴장 하지 말자.. 멋진 모습..! 멋진 모습..!\"<br/><br/>다가가 보니 반달곰이 잔뜩 긴장한 표정으로 매무새를 다듬고 있었다.<br/>가만 보니 강아지가 옆에 온 것조차 모를 정도로 긴장한 모양이다.<br/><br/>\"무슨 일 있으신가요?\"<br/>\"으악! 깜짝이야!!\"<br/><br/>어깨에 손만 가져다 댔을 뿐인데 반달곰은 경기를 일으켰다.<br/>반달곰을 겨우 진정시키고 나서야 무슨 상황인지 들어볼 수 있었다.<br/><br/>\"방금은 미안해. 나는 이 공원의 관리자인 반달곰이라고 해.<br/>오늘은 나한테 굉장히 중요한 날이거든. 그래서 너무 긴장이 돼..\"',NULL,22),(132,'Game','\"그래, 오늘은 내가 몇 년 동안 짝사랑한 반달곰 양에게 프로포즈 하기로 한 날이거든.<br/>준비는 열심히 했지만 내가 소심해서 잘 할 수 있을지 모르겠어..<br/>지금도 긴장되고, 걱정이 된단 말이야. 어떡하면 좋지?\"<br/><br/>반달곰은 더 이상 고쳐 매지 않아도 될 것 같은 나비넥타이를 계속 안절부절 살피며 이야기했다.<br/><br/>\"준비를 열심히 하셨다면, 좋은 결과가 있지 않을까요? 자신감을 가지세요.\"<br/>\"그치만 실수하면 어떡해? 갑자기 무슨 일이 일어나면 어떡하냐구?<br/>프로포즈를 했는데 반달곰 양이 받아주지 않는다면? 흐윽..<br/>아, 안되겠어 역시 프로포즈는 내일로 미루는게 좋을까?\"','Bear.jpg',22),(133,'Game','\"정말? 고, 고마워! 곧 반달곰 양이 올 시간이야. 감사 인사는 나중에 할 게.<br/>오늘 내가 준비한 첫 번째는 우리 공원의 명물 3년에 한 번 열리는 꿀 사과야.<br/>다만 수확을 하고 시간이 지나면 맛이 떨어져서 아직 나무에 달려 있거든.<br/>나는 반달곰 양을 만나서 갈 테니까. 미리 가서 사과가 잘 있는지 확인해 줄 수 있을까?\"',NULL,22),(134,'Game','\"그, 그렇지..? 고마워.<br/>나도 그렇게 생각하던 참이었어.<br/>그래 역시 내일.. 내일이 좋겠다!\"<br/><br/>프로포즈를 몇 번이나 미뤘을지 짐작이 가지 않는 반달곰을 뒤로하고 강아지는 다시 길을 나섰다.',NULL,22),(135,'Game','반달곰이 일러준 장소에 도착하자, 정말 크고 탐스럽게 생긴 사과를 발견할 수 있었다.<br/>앗! 그런데 사과가 열린 가지 위에 애벌레가 사과를 향해 힘차게 나아가고 있다.<br/>가지가 높은데 어떻게 하면 좋지..?',NULL,22),(136,'Game','베일 듯 날카로운 조준 실력으로 애벌레의 옆을 스치도록 돌을 던져 다가가지 못하도록 위협했다.<br/><br/>\"칫, 거의 다 왔는데..\"<br/><br/>애벌레는 황급히 가지에서 벗어났다.',NULL,22),(137,'Game','\"여기 애벌레가 있다!!\"<br/><br/>말이 끝나기도 전에  주변에 있던 참새가 순식간에 날아와 애벌레를 낚아챘다. 참새는 고맙다는 듯이 강아지에게 찡긋 윙크를 날리더니 날아갔다.',NULL,22),(138,'Game','나무를 흔들었더니 애벌레가 떨어졌다.<br/>문제는 반달곰이 준비한 사과도 같이 나무에서 떨어져 반으로 쪼개져 버렸다. 강아지는 화가 난 반달곰에게 저 사과처럼 되기 전에 황급히 공원을 빠져나왔다.',NULL,22),(139,'Game','무사히 애벌레를 쫓아내고 수풀에 숨어 다가 온 반달곰을 지켜봤다.<br/>반달곰은 옆에 있는 반달곰 양에게 잔뜩 상기된 표정으로 사과에 대해 설명하고 있었다.<br/><br/>\"에, 아, 그러니까 이, 이게 그, 저희 공원의 명물인 꿀 사과입니다. 하하.<br/>반달곰 양을 위해서 가장 크고 맛있어 보이는 녀석을 남겨 놨어요.\"<br/><br/>반달곰은 능숙하게 나무를 타고 사과를 따 반달곰 양에게 건넸다.<br/>기뻐하는 반달곰 양을 뒤로 하고 반달곰은 강아지를 향해 엄지를 몰래 치켜 올려주었다.<br/>그와 함께 쪽지가 날아왔다.<br/><br/>\'저쪽으로 가면 우리 공원의 최대 명물 왕 벌집이 있어. 곰은 프로포즈의 끝에 벌집을 선물하거든.<br/>정말 중요한 순간이야. 가서 벌집을 살펴봐 줘. 부탁해!.\'',NULL,22),(140,'Game','반달곰이 알려준 장소에 도착하니 정말 거대한 벌집이 나무 꼭대기에 매달려 있었다.<br/>앗! 그런데 저 반대편에서 먹보 불곰이 다가오고 있다.<br/>이대로는 벌집이 불곰에게 발각 되는 건 시간 문제다. 어떻게 하면 좋지?',NULL,22),(141,'Game','뒷발차기로 신속하게 구덩이를 만들어 나뭇가지와 나뭇잎으로 위장하니 감쪽같이 숨겨졌다.<br/>잠시 후, 아무것도 모르는 불곰이 구덩이 근처로 다가왔다.<br/><br/>\'우당탕!\'<br/><br/>\"으아악!, 뭐야 이 구덩이는!\"<br/><br/>성공적으로 불곰을 함정에 빠뜨렸다.<br/>구덩이가 깊어서 나오는 데 시간이 걸릴테니 그 사이 프로포즈를 성공시켜야 한다!',NULL,22),(142,'Game','\"아! 저~쪽에 엄청 맛있는 과일들이 있다던데,<br/>늦으면 다른 동물들이 다 먹어 버리겠지? 얼른 가야겠다!\"<br/><br/>강아지는 벌집의 반대편을 가리키며 최대한 크게 외쳤다.<br/><br/>\"뭐라고? 맛있는 과일? 어디야! 나도 간다!\"<br/><br/>불곰은 강아지가 가리킨 방향으로 헐레벌떡 달려갔다.',NULL,22),(143,'Game','\"와 저 불곰 진짜 뚱뚱하다!<br/>맨날 왕창 먹기만 하니까 그렇지!\"<br/>\"저 녀석이 뭐라고..?\"<br/><br/>강아지는 생명의 위협을 느끼며 전력으로 달아났다.<br/>그 덕에 공원에는 얼씬도 못하게 되었다.',NULL,22),(144,'Game','잠시 후, 반달곰과 반달곰 양이 벌집 앞에 도착했다.<br/><br/>\"바, 바, 반달곰 양! 하, 하, 할 말이 있습니다.<br/>저, 저는 사실 반달곰 양을..\"<br/><br/>뿌듯해하며 나무의 벌집을 바라 본 강아지는 놀랄 수 밖에 없었다.<br/>거대한 벌집의 무게 때문에 벌집이 달려있는 가지가 부러지기 일보 직전이었다.<br/><br/>\'우드득, 콰직!\'<br/><br/>\"위험해요!\"<br/><br/>반달곰 양이 몸을 날려 반달곰을 구해내고, 벌집은 방금까지 반달곰이 서 있던 자리에 떨어져 산산조각이 나버렸다.<br/><br/>\"괜찮아요? 반달곰 씨?\"<br/>\"으.. 반달곰 양. 전 괜찮아요. 고마워요. 다만..\"<br/><br/>반달곰은 산산조각 나 버린 벌집을 허망하게 바라보며 말을 이었다.<br/><br/>\"오늘 반달곰 양에게 저 벌집을 선물하려고 했는데, 망쳐버렸어요..<br/>멋진 모습은 커녕, 도움이나 받고.. 저는 정말 구제불능이에요. 이런 저를 반달곰 양도 좋아하지 않겠죠..\"<br/>\"반달곰 씨, 저도 반달곰 씨가 듬직한 곰이라고는 생각하지 않아요. 그렇지만.. 그동안 제가 공원에 찾아올 때마다 보여줬던 상냥함과 공원을 진심으로 생각하는 멋있는 모습이 반달곰 씨의 매력이라고 생각해요. 그리고 이렇게 한 눈 팔면 늘 위험에 빠지니까. 계속 바라보게 되고, 혼자 두기가 싫어져요. 저도 오늘 가져온 게 있어요.\"<br/><br/>반달곰 양은 핸드백에서 작은 벌집을 꺼냈다.<br/><br/>\"반달곰 씨 것처럼 크진 않지만, 정말 맛있는 꿀이 들어있어요. 오늘 반달곰 씨에게 드리려고 가져왔어요... 받아줄래요?\"<br/>\"..네? 정말요..? 너, 너무 좋아요!\"<br/><br/>반달곰은 눈물이 그렁그렁한 채 벌집을 건네 받았다.<br/><br/>\"반달곰 양, 정말 좋아해요.\"<br/>\"저도요. 반달곰 씨\"<br/><br/>강아지에게 사랑은 아직 이해하기 어려웠지만, 저 두 반달곰이 보여준 모습이 사랑에 가깝지 않을까 생각했다. 강아지는 미소 지으며 조용히 공원을 빠져나와 다시 여정을 시작했다.',NULL,22),(145,'Game','길을 나아가다 보니 울창한 숲을 만나게 되었다. 숲에 들어서니 높고 무성한 나무들 덕에 어둡고, 우거진 수풀이 가득했다. 열심히 수풀을 헤치며 나아가는데, 어디선가 울음소리가 들려왔다.<br/><br/>\"훌쩍, 훌쩍, 우에엥.\"<br/><br/>소리는 꽤 가까웠지만 수풀을 헤치며 찾기란 쉽지 않았다. 울음소리의 주인을 발견한 건 그로부터 10분은 지나서였다.<br/><br/>\"비겁한 여우 자식, 우에엥!\"<br/>\"여우 자식! 여우 자식! 우에엥!\"<br/><br/>다섯 마리의 미어캣들이 옹기종기 모여 앉아 엉엉 울고있었다.',NULL,23),(146,'Game','이런 울창한 숲에서 밤을 맞이했다가는 위험할지도 모른다. 시간이 끌릴만한 일은 최대한 만들지 않는 게 좋을 것 같아, 강아지는 얼른 자리를 떴다.',NULL,23),(147,'Game','\"저기 다들 왜 울고 있는거죠?\"<br/>\"훌쩍, 여우.. 비겁한 여우 녀석이 사기를 쳤어!\"<br/>\"맞아! 사기야, 사기!\"<br/>\"나쁜 녀석!\"<br/><br/>자초지종을 들어보니 숲 속 카지노에 야바위꾼 여우가 있는데, 미어캣들은 그가 진행하는 야바위에 돈을 걸었다가 돈을 모조리 잃은 모양이었다.<br/><br/>\"여러분들이 잘못 골랐을 확률은 없나요?\"<br/>\"무슨 소리야! 우리는 눈이 열 개라고, 분명 1번으로 들어가는 걸 봤는데..!\"<br/>\"맞아, 맞아, 분명 1번이었어.\"<br/>\"그런데 왜 공이 3번에서 나오냐고!\"<br/>\"비겁한 자식이 무슨 수를 쓴 게 분명해!\"<br/>\"비겁한 자식!\"<br/><br/>확실히 다섯 마리가 동시에 보았는데도 결과가 틀렸다는 건, 납득이 가지 않았다.',NULL,23),(148,'Game','카지노에 도착하니 강아지는 단번에 여우가 있는 곳을 알 수 있었다. 여우의 야바위는 인기가 많은지 문전성시를 이루고 있었기 때문이었다. 동물들 틈을 비집고 들어가 겨우 앞 쪽에 자리를 잡을 수 있었다.<br/><br/>\"사람이 정말 많네요.\"<br/>\"자, 어서 저걸 보라고!\"<br/>\"빨리 봐!\"<br/><br/>미어캣들의 독촉에 숨 돌릴 틈 없이 여우의 야바위를 지켜보았다.<br/><br/>\"자, 시작합니다~\"<br/><br/>여우는 조그만 붉은 공을 군중들에게 보여주고는 가운데 컵에 집어 넣었다. 이번 야바위에 돈을 건 것 같은 코끼리는 긴장했는지 코를 배배 꼰 채 컵에 집중하고 있었다. 여우는 유려한 손놀림으로 컵을 섞었다. 왼쪽에서 오른쪽으로, 오른쪽에서 가운데로.. 분명히 섞는 속도는 빨랐지만 공이 든 컵이 어떻게 움직이는지 파악하지 못할 정도는 아니었다. 야바위가 끝나고, 여우는 코끼리에게 컵을 선택하도록 했다.<br/><br/>\"오른쪽이다! 확실해! 내가 봤어!\"<br/><br/>코끼리는 잔뜩 상기된 표정으로 코로 오른쪽 컵을 가리켰다. 강아지가 보기에도 공은 오른쪽에 들어있었다.<br/><br/>\"오른쪽이라고요? 자, 정답은.. 짜잔! 왼쪽이었습니다. 아쉽네요~\"<br/><br/>공은 모두의 예상을 뒤집고 왼쪽 컵에서 나타났다. 군중들은 술렁였고, 결과를 납득하지 못한 코끼리는 난동을 부리다 경비대에게 끌려나갔다.','Fox.jpg',23),(149,'Game','\"봤지? 저 여우 녀석. 아주 간사하다고.\"<br/><br/>미어캣들은 자신들이 당했던 일이 다시 떠올랐는지 이를 갈았다. 분명 정상적인 방법으로는 공이 오른쪽에서 나올 수 없다. 어떻게 하면 저 속임수를 간파할 수 있을까?',NULL,23),(150,'Game','여우의 야바위는 해가 질 때 까지 계속되었고, 그나마 적게 돈을 건 몇몇 동물들이 돈을 땄을 뿐이었다. 돈을 많이 걸었던 동물들은 어김없이 돈을 잃었다.<br/><br/>\"숨어서 여우를 좀 더 살펴보죠.\"<br/><br/>강아지와 미어캣들이 여우를 살피기 위해 담장 뒤에 막 숨었을 때였다.<br/><br/>\"빨리 기어나와! 이 녀석들.\"',NULL,23),(151,'Game','\"이 사기꾼! 허튼 수작 부리지마!\"<br/><br/>강아지는 용감하게 달려나가 여우에게 따져 물었다.<br/><br/>\"네? 사기요? 제가 그랬다는 증거가 있나요?\"<br/>\"어, 어..\"<br/><br/>결국 여우가 호출한 경비대에게 카지노 밖으로 끌려나갔다. 비밀은 밝혀내지 못했지만, 현장에 있었던 동물들은 적어도 정의로운 강아지로 기억해줄 것이다..',NULL,23),(152,'Game','이미 발각되었나 싶어 담장 앞으로 나가려던 찰나, 야바위 컵들 속에서 무언가 튀어나왔다.<br/><br/>\"흑흑, 힘들어요. 찍.\"<br/><br/>컵 속에서 튀어나온 건 다름 아닌 조그만 어린 쥐들이었다. 쥐들은 기진맥진한 표정으로 테이블 위에 뻗어버렸다.<br/><br/>\"실수투성이인 주제에 힘들다는 말이 나와?! 엉? 큰 판에서 그랬으면 너희는 다 큰일 났어. 너희 부모들한테 돈 벌어줘야 하잖아? 똑바로 하자? \"<br/><br/>여우는 테이블에 나온 쥐들을 발가락으로 툭툭 치면서 역정을 냈다.<br/><br/>\'저게 바로 비밀이었나!\'<br/><br/>쥐 세 마리는 각 컵 속에 숨어 공을 들고 있고, 쥐들은 돈을 건 동물의 선택에 따라 공을 쥐었다 놓았다 했던 것이다. 미어캣들은 진실을 알게 되자 분노하며 부들댔다.<br/><br/>\"저런 어린 아이들을 협박해서 사기를 치다니 악랄한 녀석!\"',NULL,23),(153,'Game','\"쥐들을 풀어줘, 비겁한 여우!\"<br/><br/>강아지는 용감하게 나서서 여우에게 소리쳤다. 여우는 화들짝 놀랐지만, 이내 평정을 되찾고 이야기했다.<br/><br/>\"하, 귀찮게 트릭을 알아버리다니. 뭐, 좋아. 이 곳에선 벌 만큼 벌었으니까.\"<br/><br/>\'휙!\'<br/><br/>여우는 무심하게 쥐들을 잡아 강아지에게 던졌다. 쥐들을 겨우 받아낸 강아지는 여우를 노려봤다.<br/><br/>\"비겁하게 번 돈도 내놓고 가야지!\"<br/>\"내가 왜? 내 돈인 걸.\"<br/><br/>여우는 심드렁한 표정으로 말을 이었다.<br/><br/>\"어디 경비대에 신고라도 하려고? 증거는 가지고 그러는 거겠지?\"',NULL,23),(154,'Game','\"여, 여우님 저를 데려가주세요! 찍!\"<br/>\"저,저도요. 찍!\"<br/><br/>쥐들은 강아지의 손에서 내려와 허겁지겁 여우의 발바닥 털을 붙잡았다.<br/><br/>\"어, 어째서..\"<br/>\"이 녀석들이 그렇다는데? 이러면 데려가도 되겠지?\"<br/><br/>여우는 쥐들을 보따리에 주섬주섬 집어 넣고는 떠나버렸다. 강아지는 어안이 벙벙한 표정으로 떠나는 뒷모습을 지켜볼 수 밖에 없었다.<br/><br/>\"아무래도 쥐들은 돈 때문에 여우를 벗어날 수 없나 봐.\"<br/>\"딱한 녀석들!\"<br/>\"우리보다도 더 딱해!\"<br/>\"생각보다 더 간악한 놈이었어. 어쩔 수 없지. 그래도 우리를 위해서 노력해 줘서 고마워.\"<br/><br/>다시 길을 떠나는 강아지의 마음은 무거웠다. 더 훌륭한 강아지가 되어서 쥐들처럼 가엾은 동물들을 도와야겠다고 다짐하게 되었다.',NULL,23),(155,'Game','다음날, 날이 밝자 강아지와 미어캣들은 다시 카지노로 향했다. 여우는 여전히 어제 그 자리에서 야바위를 허고 있었다.<br/><br/>\"자, 자신 있는 분은 도전하세요.\"<br/>\"제가 한 번 해 볼게요.\"<br/><br/>강아지는 당당히 앞으로 나서 돈을 냈다.<br/><br/>\"감사합니다, 손님. 공은 가운데에 있고요.이제 시작하겠습니다?\"<br/><br/>여우는 공을 가운데 컵에 넣고 여전한 손놀림으로 컵들을 섞어댔다.<br/><br/>\"자, 이제 고르시면 됩니다.\"<br/><br/>강아지는 컵을 신중히 고르는 척 하며 테이블에 가까이 다가갔다. 어느 정도 가까워지자 강아지는 앞발로 테이블을 구석을 힘차게 내리쳤다.<br/><br/>\'쾅!\'<br/><br/>\"찍!\"<br/>\"이, 이게 뭐하는 짓이야!\"<br/><br/>여우는 웃던 얼굴을 순식간에 얼굴을 일그러뜨리더니, 경비대를 부르려는 듯 두리번거렸다.<br/><br/>\"잠깐, 근데 방금 쥐 소리가 들리지 않았어?\"<br/>\"나도 들은 것 같아!\"<br/>\"뭐냐! 여우가 속임수를 쓴 건 아니겠지?\"<br/><br/>군중 속에서 미어캣들이 한 마디씩 하자 동물들이 동요했다. 군중들이 테이블 앞으로 다가오자, 여우는 얼굴이 새파래졌다.',NULL,23),(156,'Game','\"으아악! 겨, 경비대는 안 돼! 살려줘!\"<br/><br/>여우는 경비대라는 말에 사색이 된 채로 금고까지 버리고 줄행랑을 쳤다. 강아지는 금고를 열어 미어캣들과 이 카지노에서 여우에게 부당하게 돈을 잏은 동물들에게 나누어주었다. 그럼에도 금고에는 여전히 돈이 한참 남아있었다.<br/><br/>\"어지간히 여러 군데에서 사기를 쳤나 보군.\"<br/><br/>그 때, 컵 속에서 떨고 있던 쥐들이 모습을 드러냈다.<br/><br/>\"이, 이제 우리 가족은 끝이야..\"<br/>\"엄마, 아빠!\"<br/><br/>쥐들은 망연자실한 표정으로 테이블 위에서 대성통곡했다. 쥐들은 아프거나 늙은 부모를 위해서 급하게 돈을 벌어야 했고, 여우는 그런 쥐들을 협박해서 붙잡아 놓고 사기를 쳤던 것이다. 강아지는 자신의 부모님을 떠올리며 남은 돈을 쥐들에게 건넸다.<br/><br/>\"이 돈으로 돌아가서 부모님을 행복하게 모셔드려.\"<br/>\"정말, 그래도 될까요..? 감, 감사합니다!\"<br/><br/>쥐들은 연신 감사 인사를 하며 고향으로 돌아갔다. 강아지와 미어캣들은 그 뒷모습을 뿌듯하게 지켜보았다.<br/><br/>\"고마워, 너는 우리가 본 최고로 영리하고 용감한 강아지야.\"<br/>\"맞아, 맞아! 멋있었어!\"<br/>\"우리도 사례하고 싶어!\"<br/><br/>미어캣들은 되찾은 돈의 일부를 강아지에게 건넸다.',NULL,23),(157,'Game','\"그래! 앞으로의 여행에 꼭 보탬이 됐으면 좋겠어!\"<br/><br/>미어캣들의 배웅을 받으며 숲을 빠져나왔다. 넓게 나타난 길을 따라 강아지는 다시 여행을 시작했다.',NULL,23),(158,'Game','\"영리하고 용감한데 인성까지 좋다니..\"<br/>\"그냥 최고의 강아지야!\"<br/><br/>등 뒤로 쏟아지는 미어캣들의 칭찬을 들으며 숲을 빠져나왔다. 넓게 나타난 길을 따라 강아지는 다시 여행을 시작했다.',NULL,23),(159,'Game','당신도 할 수 있다. 서커스단 모집 중!<br/>벽에 붙어있는 서커스단 모집 공고를 1개 발견했다.<br/>마침 돈도 부족했는데 지원해볼까?',NULL,24),(160,'Game','강아지는 공고를 무시하고 다른 곳을 향해 걸어갔다.',NULL,24),(161,'Game','공고를 제거해서 휴지통에 버렸다.<br/>길거리가 깨끗해졌다.',NULL,24),(162,'Game','서커스단 천막을 열고 안으로 들어갔다. <br/>천막 안에는 곰, 사자, 코브라, 조랑말이 있었다.<br/>모두 강아지를 무섭게 쳐다본다.',NULL,24),(163,'Game','\"서커스단을 하고 싶다고? 목청도 크고 좋구먼! 하하하\"<br/><br/>사자가 천막이 무너질 정도로 크게 웃으며 말했다.<br/><br/>\"서커스단을 하고 싶다고? 멋진 강아지구먼! 어떤 묘기를 하고 싶지?\"<br/><br/>곰이 강아지에게 물어봤다.',NULL,24),(164,'Game','\"서커스단을 하고 싶다고?\"<br/><br/>사자가 천막이 무너질 정도로 큰 소리로 말했다.<br/><br/>\"서커스단을 하고 싶다고? 멋진 강아지구먼! 어떤 묘기를 하고 싶지?\"<br/><br/>곰이 강아지에게 물어봤다.',NULL,24),(165,'Game','\"너 서커스가 하고 싶어?\"<br/><br/>조랑말이 날카롭게 물어봤다.<br/><br/>\"네...\"<br/><br/>강아지는 소심하게 대답했다.<br/><br/>\"그럼 뭐 열심히 해봐...\"<br/><br/>조랑말이 새침하게 말했다.<br/><br/>\"서커스단을 하고 싶다고? 멋진 강아지구먼! 어떤 묘기를 하고 싶지?\"<br/><br/>곰이 강아지에게 물어봤다.',NULL,24),(166,'Game','\"공 물어오기? 그런 건 누구나 할 수 있어\"<br/><br/>조랑말이 비웃으면서 말했다.<br/><br/>\"독특한 묘기를 더 연습해서 찾아와\"<br/><br/>코브라가 혀를 날름거리며 말했다.<br/>강아지는 서커스단 천막 밖으로 쫓겨났다.<br/>강아지는 서커스단을 지나 다른 곳으로 이동을 시작했다.',NULL,24),(167,'Game','\"오? 외발자전거는 하고 싶어 하는 사람이 별로 없던데\"<br/><br/>곰이 관심을 보이기 시작했다.<br/><br/>\"외발자전거를 타는 모습이 멋있어 보였거든요. 그래서 저도 타보고 싶었어요.\"<br/><br/>강아지가 자신 있게 말했다.<br/><br/>\"멋있어 보인다는 마음으로는 힘들 텐데... 그래도 외발자전거 타기를 할 거냐?\"<br/><br/>곰이 엄격한 표정을 지으면서 강아지에게 말했다.<br/><br/>\"네...! 저도 멋있어지고 싶어요!\"<br/>\"그러면 우선 천막 밖에 있는 잡초부터 뽑거라\"<br/><br/>외발자전거를 타고 싶었을 뿐인데 잡초 뽑기라니... 너무 부당하다.',NULL,24),(168,'Game','\"저글링? 그런 건 누구나 할 수 있어\"<br/><br/>조랑말이 비웃으면서 말했다.<br/><br/>\"독특한 묘기를 더 연습해서 찾아와\"<br/><br/>코브라가 혀를 날름거리며 말했다.<br/>강아지는 서커스단 천막 밖으로 쫓겨났다.<br/>강아지는 서커스단을 지나 다른 곳으로 이동을 시작했다.',NULL,24),(169,'Game','\"넌 아직 외발자전거를 타기에는 체력이 부족해 보여... 그러니 잡초를 뽑으면서 체력을 길러야지\"<br/><br/>곰의 말은 맞는 것 같으면서 이해가 안 된다.<br/>하지만 외발자전거를 타볼 기회는 다시 안 올지도 모른다.<br/>어떻게 할까?',NULL,24),(170,'Game','\"서커스에 대해 진심이 아녔구나\"<br/><br/>조랑말이 비웃으면서 말했다.<br/><br/>\"그렇다면 어쩔 수 없지...\"<br/><br/>곰이 아쉽다는 듯이 말했다.<br/>강아지는 서커스단 천막 밖으로 나갔다.<br/>강아지는 서커스단을 지나 다른 곳으로 이동을 시작했다.',NULL,24),(171,'Game','천막 밖으로 나가니 밀림처럼 자란 잡초들이 보인다.<br/>천막 입구에는 양말, 모종삽이 보인다.<br/>어떤 도구로 잡초를 제거할까?',NULL,24),(172,'Game','강아지는 양말을 발에 착용하고 잡초를 열심히 뽑았다.<br/>천막 앞이 꺠끗해졌다.<br/><br/>\"그거 내 양말인데...\"<br/><br/>조랑말이 울먹거리며 말했다.<br/><br/>\"발로 잡초를 뽑을거면 뿌리도 뽑아야지... 나중에 다시 자란다고...\"<br/><br/>곰이 이마를 짚으며 말했다.<br/><br/>\"그래도 외발 자전거 탈 수 있을 정도의 체력은 생겼겠지 외발 자전거 타는 법을 알려주겠다.\"',NULL,24),(173,'Game','강아지는 곰의 도움을 받아 외발 자전거 위에 올라갔다.<br/>하지만 중심을 잡지 못해 넘어졌다.<br/><br/>\"전 왜 이렇게 못 하는 게 많은 것 같죠?\"<br/><br/>강아지가 우울한 목소리로 말했다.<br/><br/>\"이제 하나씩 알아가면 되는 거지\"<br/><br/>곰이 담담한 목소리로 대답했다.<br/><br/>\"하지만 계속 배워도 끝이 없는 것 같아요.\"<br/>\"계속 막히면 내가 알려주면 되잖아\"<br/><br/>곰의 말에 강아지는 용기가 생겼다.<br/><br/>\"제가 한번 스스로 타볼래요.\"<br/><br/>서커스단 모두가 강아지를 지켜봤다.<br/>모두 강아지가 성공하길 바랐다.<br/><br/>\"저 스스로 해냈어요!\"<br/><br/>강아지는 외발 자전거를 타고 서커스 단 내부를 한 바퀴 돌았다.<br/><br/>\"내일 공연도 문제 없겠군 한숨 쉬지 그래?\"<br/><br/>사자가 박수를 치면서 말했다.','Bicycle.jpg',24),(174,'Game','쉬고 온 덕분에 긴장하지 않고 서커스를 무사히 마쳤다.<br/>외발자전거를 타고 묘기를 부리는 강아지의 모습은 동물들 사이에서 큰 화제가 되었다.<br/>강아지는 뿌듯한 마음과 함께 다른 곳을 향해 떠났다.',NULL,24),(175,'Game','연습을 많이 한 덕분에 외발자전거의 달견이 되었다.<br/>서커스에서도 멋진 모습을 보였다.<br/>모두가 강아지의 외발자전거 실력에 감탄했다.<br/>강아지는 뿌듯한 마음과 함께 다른 곳을 향해 떠났다.',NULL,24),(176,'Game','강아지는 모종삽을 사용해 잡초를 뿌리까지 열심히 뽑았다.<br/>천막 앞이 깨끗해졌다.<br/><br/>\"잡초를 아주 깨끗하게 잘 뽑았구나\"<br/><br/>곰이 웃으며 말했다.<br/><br/>\"외발자전거 탈 수 있을 정도의 체력은 생겼겠지, 외발자전거 타는 법을 알려주겠다.\"',NULL,24),(177,'Game','일하기 싫은 강아지는 잡초를 뽑지 않고 관찰했다.<br/>잡초들 사이에서 잎 모양이 특이한 식물을 발견했다.<br/>강아지는 특이한 식물을 뽑았다.<br/>뿌리를 보니 산삼처럼 생겼다.<br/><br/>\"심봤다!\"<br/><br/>이 기쁜 소식을 서커스단 동물들에게 말할까?',NULL,24),(178,'Game','\"저 산삼을 발견했어요!\"<br/><br/>강아지는 천막 안으로 들어가서 외쳤다.<br/><br/>\"이 정도면 50년산인데?\"<br/><br/>사자가 산삼을 살펴보면서 말했다.<br/><br/>\"같이 나누어 먹죠\"<br/><br/>곰이 물에 씻은 산삼을 나눠주면서 말했다.<br/>강아지도 산삼을 받아서 먹었다.<br/>쓰지만 건강해지는 느낌이 들었다.<br/><br/>\"산삼을 먹은 기념으로 외발자전거 타는 법을 알려주지\"',NULL,24),(179,'Game','강아지는 산삼을 몰래 시장에 팔았다.<br/>무거워진 돈주머니와 함께 다른 곳을 향해 걸어갔다.',NULL,24),(180,'Game','축제가 진행 중인 마을을 지나가다가 동굴에 있는 문제들을 틀리지 않고 모두 풀어서 탈출하면 상금을 준다는 포스터를 발견했다.<br/>참가비도 없고, 돈을 벌 수 있는 기회다.<br/>도전해볼까?','Cave.jpg',25),(181,'Game','동굴 탈출이라니 듣기만 해도 위험해보인다.<br/>원래 가려고 했던 길을 향해 걸어간다.',NULL,25),(182,'Game','동굴 앞에는 박쥐가 거꾸로 서 있었다.<br/><br/>\"동굴에 있는 문제들을 모두 맞추면 상금을 드립니다~ 참가비는 무료 안전은 스스로 챙겨야합니다. 모두 도전해보세요!\"<br/><br/>동굴 근처에 많은 동물들이 서있지만 아무도 도전은 안하고 구경만 하고 있다.',NULL,25),(183,'Game','강아지에게 모든 동물들의 시선이 집중된다. <br/><br/>\"동굴 안에는 문제 3개가 있어 그걸 모두 풀면 보물상자가 나오는데 거기 안에 상금이 있어\"<br/><br/>박쥐는 날개로 동굴 안을 가리키면서 말했다.<br/>동굴 안은 매우 깜깜하다.<br/><br/>\"너는 무사하길 바랄게\"',NULL,25),(184,'Game','동굴 안으로 들어가니 밖에서 본 것보다 더 어두웠다.<br/>용기를 내서 들어가니 퀴즈가 적혀있는 큰 문과 숫자로 된 버튼이 있었다. <br/><br/>문제 1<br/>8-6=2<br/>8+6=2<br/>9+6=?',NULL,25),(185,'Game','저 멀리서 큰 돌이 강아지를 향해 굴러오고 있다.<br/>강아지는 큰 돌을 피해 동굴 밖으로 달려 나왔다.<br/><br/>\"이번에도 실패했네\"<br/><br/>박쥐가 비웃으면서 말했다.<br/>강아지는 재빠르게 동굴 근처를 벗어났다.<br/>그리고 가려고 했던 길을 향해 걸어간다.',NULL,25),(186,'Game','문이 열리기 시작했다.<br/>그리고 문 안쪽에는 비석과 뭔가 적을 수 있는 석판이 있었고 비석에는 이상한 문자가 적혀있었다. <br/><br/>문제 2 (Python)<br/>a, b = 100, 100<br/>print(a==b)<br/>출력 결과는?',NULL,25),(187,'Game','바닥이 갈라지더니  지하로 가는 계단이 나타났다.<br/>자물쇠가 걸린 보물상자가 쪽지와 함께 있었다.<br/><br/>문제 3<br/>11 x 11 = 4<br/>22 x 22 = 16<br/>33 x 33 = ?',NULL,25),(188,'Game','자물쇠 비밀번호를 36이라고 맞추자 찰칵 소리와 함께 잠금이 풀렸다.<br/>보물상자를 열어보니 현금과 보석들이 들어있었다.<br/>강아지는 보물상자를 껴안고 동굴 밖으로 나왔다.<br/><br/>\"너라면 성공할 줄 알았어\"<br/><br/>박쥐가 웃으면서 말했다.<br/>강아지는 뿌듯한 마음과 무거워진 돈 주머니를 가지고 다른 곳을 향해 떠났다.',NULL,25),(189,'Game','놀이터에 아기 고양이가 시무룩하게 앉아있다.','Kitten.jpg',26),(190,'Game','아기 고양이에겐 미안하지만, 갈 길이 바빠서 그대로 지나쳤다.',NULL,26),(191,'Game','아무래도 고양이는 친구가 없어서 외로워 하는 것 같다.<br/>어떻게 놀아주면 좋을까?',NULL,26),(192,'Game','아기 고양이는 제법 날쌨다.<br/>덕분에 도망친다고 진땀을 뺐다.',NULL,26),(193,'Game','높은 곳을 좋아하는 고양이라서 그런지 한 번 목마를 태웠더니, 내려올 생각을 안 했다.',NULL,26),(194,'Game','고양이가 들어갈 수 있을 만한 모래성을 만들었더니, 아늑하다는 표정으로 들어가 있다.',NULL,26),(195,'Game','놀이터에 솜사탕 장수가 왔다.<br/>고양이가 먹고 싶은지 똘망똘망 쳐다보고 있다.<br/>돈이 없는데 어떡하지?',NULL,26),(196,'Game','애처로운 눈빛을 보냈지만 역시 장사꾼에게 자비란 없었다.<br/>비록 솜사탕은 먹지 못했지만 고양이는 오늘 하루가 꽤 즐거웠는지 배시시 웃었다.<br/>뿌듯한 마음으로 고양이에게 손을 흔들어 주고 다시 길을 떠났다.',NULL,26),(197,'Game','\"맛있는 솜사탕이 왔습니다!\"<br/><br/>놀이터가 떠나가라 쩌렁쩌렁 솜사탕을 홍보했다.<br/>덕분에 아이들이 많이 모여들어 장사가 호황을 이뤘다.<br/><br/>\"덕분에 장사가 잘 되는군. 하나 받게.\"<br/><br/>솜사탕 장수가 솜사탕을 하나 건넸다.<br/>솜사탕을 고양이 발에 쥐어주었다.<br/><br/>\"냠냠.\"<br/><br/>고양이는 오늘 하루가 행복했는지 배시시 웃었다.<br/>뿌듯한 마음으로 고양이의 머리를 쓰다듬고 다시 길을 떠났다.',NULL,26),(198,'Game','개울 근처를 지나는 데 개울 쪽에서 비명 소리가 들린다!',NULL,27),(199,'Game','위험에 처한 동물에게는 미안하지만, 위험한 일에는 휩쓸리지 않는 게 좋을 것 같다.',NULL,27),(200,'Game','물가에 도착하니 염소가 물에 빠져 허우적 대고 있다.<br/>물살이 빠르고, 수심이 깊어 보인다.<br/>어떻게 하면 좋지?','Goat.jpg',27),(201,'Game','\"우리가 도와주지.\"<br/><br/>뒤에서 누군가 어깨를 붙잡았다.<br/>돌아보니 빨간 모자를 쓴 근육질의 펭귄 무리가 서 있었다.<br/>그 중에서도 가장 튼튼해 보이는 펭귄이 망설임 없이 물로 뛰어들었다.<br/><br/>\'풍덩!\'<br/><br/>순식간에 염소가 있는 곳까지 도달해 곧바로 뭍으로 끌어올렸다.<br/><br/>\"켁, 켁, 감사합니다.\"<br/><br/>펭귄들은 감사 인사를 하는 염소에게 젠틀하게 미소 지어 주고는 다시 하류를 향해 열을 맞춰 뛰어갔다.<br/>강아지는 멀어지는 수상 구조대를 동경의 눈빛으로 바라보았다.<br/>수영이 배우고 싶어진 강아지였다.',NULL,27),(202,'Game','\"물에 동물이 빠졌어요! 도와주세요!\"<br/><br/>주변을 향해 애타게 외쳤다.',NULL,27),(203,'Game','강아지는 물가에 떠 있는 연꽃을 염소에게 던졌다.<br/>염소는 바로 옆에 착지한 연꽃 위로 올라와 거친 숨을 내쉬었다.',NULL,27),(204,'Game','\"감사합니다! 제 생명의 은인이세요.\"<br/><br/>물에서 나온 염소는 연신 감사 인사를 했다.<br/>한참 인사를 하다가 인사도 모자랐다고 생각했는지 주머니를 주섬주섬 뒤졌다.<br/><br/>\"큰 돈은 아니지만 부디 받아주세요! 제발요!\"<br/><br/>강아지는 됐다고 몇 차례나 발사래를 쳤지만, 염소는 고집스럽게 강아지의 주머니에 돈을 쑤셔 넣었다.<br/>이대로는 실랑이가 끝나지 않을 것 같아 강아지는 사례금을 결국 받기로 했다.<br/>만족해 하는 염소를 뒤로 하고 다시 여행을 떠났다.',NULL,27),(205,'Game','저 앞에 바닷가가 보인다.',NULL,28),(206,'Game','바다에 갈 이유는 없으니 그냥 지나쳤다.',NULL,28),(207,'Game','자세히 가보니, 서핑 보드가 놓여져 있었다. 상태를 보니 주인이 따로 있는 것 같지는 않다.',NULL,28),(208,'Game','강아지는 조용히 바다를 구경하다가 자리를 떠났다.',NULL,28),(209,'Game','\"그래.. 해보자!\"<br/><br/>강아지는 용기 있게 서핑에 도전했다. 그렇지만 번번이 파도에 휩쓸려 넘어졌다. 시무룩하게 해변에 앉아있는 강아지는 저 멀리 서핑을 즐기고 있는 펭귄을 보았다.',NULL,28),(210,'Game','강아지는 가만히 쉬다가 자리를 떠났다.',NULL,28),(211,'Game','\"저.. 펭귄님 안녕하세요\"<br/><br/>\"..네? 무슨일이시죠?\"<br/><br/>\"서핑을 배우고 싶습니다\"<br/><br/>\"오호 그래? 서핑이라면 어렵지 않아. 일단 균형을 잘 잡는게 중요해. 누워있을 때도, 서있을 때도 마찬가지지... (중략) ...어때? 이제 한 번 파도를 타러 가볼까?\"',NULL,28),(212,'Game','강아지는 펭귄의 강습에 힘을 얻었다. 다시 용감하게 파도 위에 올라갔지만 여전히 파도를 만나면 휘청거리다 넘어지곤 했다. 펭귄은 그런 모습을 보며 대수롭지 않은 듯 말했다.<br/><br/>\"원래 서핑은 한 번에 성공하는게 아니야! 그렇게 넘어지고 넘어지다 보면 어느새 감이라는게 생길거거든. 그러면 이제 파도는 너의 것이 되는거지!\"',NULL,28),(213,'Game','\"그래? 좀만 더 하면 될 것 같은데... 아쉽군\"<br/><br/>펭귄은 그렇게 혼자 서핑을 타러 갔다. 강아지는 해변에 앉아 휴식을 취하다 떠났다.',NULL,28),(214,'Game','강아지는 펭귄의 말을 듣고 몇 번 더 시도해보기로 했다. 그런데 웬걸, 이번에는 바로 성공했다! 뒤이어 온 파도들에서도 연이어 성공하며 강아지는 자신감이 붙었다. 이어 물 만난 물고기처럼, 파도에 몸을 맡기며 서핑을 즐겼다.<br/><br/>\"역시, 내가 잘 가르친 보람이 있구만!\"<br/><br/>펭귄은 흐뭇한 표정을 지으며 말했다. 그렇게 펭귄과 강아지는 자유롭게 서핑을 즐기다가 인사를 하고 떠났다. 물기를 털어내고 다시 길을 나서며, 강아지는 혼잣말로 중얼거렸다.<br/><br/>\'나도 이젠 어엿한 서퍼!\'','Surfing.jpg',28),(215,'Game','새벽에 강아지는 잠을 자다가 눈을 떴다.<br/>오늘따라 공기가 습하다.<br/>다시 자려고 눈을 감는데 강아지처럼 보이는 형체가 보인다.<br/>저건…','Ghost.jpg',29),(216,'Game','그건 색상이 있는 걸 보니 그림자는 아니다.<br/>분명 강아지 귀신이다.<br/>재빠르게 숙소를 벗어났다.<br/>그리고 해가 뜨고 나서 다시 숙소로 찾아갔다.<br/>다행히 귀신의 흔적은 안보였다.<br/>귀신이 무서운 강아지는 짐만 빠르게 챙겨서 도망갔다.',NULL,29),(217,'Game','저건 그림자가 분명하다. <br/>그림자를 없애기 위해 불을 켰지만 사라지지 않는다.',NULL,29),(218,'Game','환기를 하니 안개가 사라졌고, 신기루도 사라졌다.<br/>귀신은 존재하지 않는다.<br/>푹 자고 일어난 다음 준비를 마치고 새로운 곳을 향해 떠났다.',NULL,29),(219,'Game','습하고 안개가 생긴걸 보니 신기루가 분명하다.',NULL,29),(220,'Game','자고 일어나니 강아지 현상은 사라져있었다.<br/>준비를 마치고 새로운 곳을 향해 떠났다.',NULL,29),(221,'Game','길거리에서 늑대가 감미롭게 버스킹을 하고 있다.<br/>신청곡을 받고 있는 것 같은데 한 번 신청해 볼까?','Busking.png',30),(222,'Game','발라드의 진한 여운을 느끼며 눈물을 한 방울 흘렸다.',NULL,30),(223,'Game','신나는 리듬에 몸을 맡긴 채 재미있게 놀았다.',NULL,30),(224,'Game','불량해 보이는 강아지가 앞 길을 가로막고 있다.<br/>외길이라 마주할 수 밖에 없을 것 같다.','Eyepressure.png',31),(225,'Game','\"크와아앙!!!\"<br/><br/>우렁찬 포효를 들은 불량 강아지가 부리나케 도망갔다.',NULL,31),(226,'Game','\"나와라..\"<br/><br/>매서운 눈을 하고 노려보자 불량 강아지가 잔뜩 겁먹고 비켜섰다.',NULL,31),(227,'Game','갑자기 비가 쏟아지기 시작했다.<br/>아직 마을에 도착하지 못했는데 어떡하지?','Rain.png',32),(228,'Game','마을까지 전속력으로 뛰어 도착했다.<br/>비록 몸은 다 젖었지만..',NULL,32),(229,'Game','큰 나무 밑으로 들어가 비를 피했다.<br/>소나기였는지 날이 금방 개었다.',NULL,32),(230,'Game','\"인생은 돈이지!\"<br/><br/>\"명예로운 인생이 진짜지!\"<br/><br/>너구리 두 마리가 언쟁을 벌이고 있다.<br/>왠지 잘못 걸린 것 같다.<br/><br/>\"거기 너! 너는 뭐가 더 인생에서 중요하다고 생각해?\"','Dogvalues.png',33),(231,'Game','\"속물 같은 녀석. 인기나 많아져라.\"',NULL,33),(232,'Game','\"그래서 그렇게 옷차림이 허름한거야..?<br/>이거 받고 힘내..\"',NULL,33),(233,'Game','골목길을 지나는데 아이들이 신나게 놀고 있다.<br/>무리들 중 아기 호랑이가 길을 막아 서더니 초롱초롱 눈을 빛내고 있다.<br/><br/>\"지나가고 싶으면 나랑 카드놀이를 해서 이겨야 해!\"','Tigercard.png',34),(234,'Game','카드를 바꿔치기 했지만, 아기 호랑이는 전혀 눈치채지 못했다.<br/><br/>\"엄청 잘 하잖아! 이런! 다음에 다시 해 !\"<br/><br/>괜히 미안한 마음이 들어 얼른 자리를 떴다.',NULL,34),(235,'Game','부모님과 카드 놀이를 했던 기억을 떠올려 진검승부 끝에 승리했다.<br/><br/>\"으으, 아깝다! 다음에 다시 해!\"<br/><br/>부모님께 감사하며 자리를 떴다.',NULL,34),(236,'Game','아이들이 동물들이 많은 물가에서 물수제비를 하고 있다.<br/>재미있어 보이는 데 어떻게 할까?','Stoneskipping.png',35),(237,'Game','\"얘들아, 다른 분들이 돌에 맞을 수도 있잖아. 조금 장소를 옮기는 게 어떨까?\"<br/><br/>\"앗, 죄송합니다!\"<br/>아이들은 해맑게 자리를 옮겼다.',NULL,35),(238,'Game','\"이얍!\"<br/><br/>힘차게 던진 돌이 하나, 둘, 셋, 넷..<br/>앗, 너무 많이 튕겨서 건너편의 동물이 돌에 맞았다!<br/><br/>\"으앗! 죄송합니다!!!\"<br/><br/>연신 사과하며 급하게 자리를 떴다.',NULL,35),(239,'Game','떠돌이 화가 래서팬더가 자신의 그림을 들이민다.<br/><br/>\"내 그림이 어때? 굉장하지?\"<br/><br/>너무 못 그려서 그림을 이해할 수 없는데 뭐라고 대답할까?','Badpainter.png',36),(240,'Game','\"역시, 난 대단해. 바로 알아볼 정도로 잘 그린다니까. 하하하.\"<br/><br/>눈 씻고 봐도 하마의 흔적은 없지만, 맞춰서 다행이다...',NULL,36),(241,'Game','\"으휴, 한심하긴. 그림 보는 안목이 이렇게 없어서야. 딱 봐도 카피바라잖아?\"<br/><br/>..대체 어디가..?',NULL,36),(242,'Game','숲 속 외딴길을 걷다보니 엄청 큰 폭포를 만나게 되었다.<br/>절경이 아름답고, 굉장히 시원하다.<br/>이것도 기념인데 이 곳에서 뭔가 해볼까?','Waterfall.png',37),(243,'Game','\"아아아악!\"<br/><br/>생각보다 강력한 폭포의 물줄기에 소리를 지르다 득음을 해버렸다.<br/>녹초가 된 채 다시 길을 떠났다.',NULL,37),(244,'Game','시원한 물 속에서 헤엄치고 나니 기운이 났다. 계속 가보자!',NULL,37),(245,'Game','교양을 쌓기 위해 서점에 들렀다.<br/>한 권 정도 사볼까 하는데 어떤 책이 좋을까?','Bookstore.png',38),(246,'Game','강아지는 시간 가는 줄도 모르고 읽다가 해 질 무렵이 되고 나서야 출발했다.',NULL,38),(247,'Game','노트북만 있다면 당장 코딩을 시작할 수 있을 것 같다!',NULL,38),(248,'Game','길을 가다 절벽을 만났다.<br/>건너편으로 넘어가려면 다리를 건너야 할 것 같은데..<br/><br/>\'끼익.. 출렁.. 흔들..\'<br/><br/>다리의 상태가 심상치 않은데, 건너도 괜찮을까?','Bridge.png',39),(249,'Game','다행히 흔들다리와 얼마 떨어지지 않은 곳에 좀 더 튼튼한 다리가 있어 안심하고 건널 수 있었다.',NULL,39),(250,'Game','허겁지겁 다리를 건넜지만, 출렁거리기만 할 뿐 다리는 의외로 튼튼했다!',NULL,39),(251,'Game','길을 걸어가고 있는데 다람쥐가 꼬리로 강아지를 툭툭 친다.<br/><br/>\"저기... 혹시 많이 바쁘신가요?\"<br/>\"음...아니요... 왜요?\"<br/>\"부탁 하나만 들어 주실래요? 수고비도 드릴게요!\"','Squirrel.jpg',40),(252,'Game','\"아...바쁘시군요... 죄송합니다.\"',NULL,40),(253,'Game','\"제가 콩나물을 키우는데 옆마을에 다녀와야 해서요. 혹시 하루만 저희 집에 오셔서 돌봐주실 수 있나요?\"<br/><br/>숙소도 구하고 수고비도 받을 수 있는 기회다. 콩나물을 돌봐줄까?',NULL,40),(254,'Game','다람쥐는 강아지를 이끌고 본인의 집으로 갔다.<br/><br/>\"저기 검정색 통 안에 있는 친구가 콩나물이고요. 4시간 간격으로 물을 주시면 됩니다. 잘 부탁드려요.\"<br/><br/>다람쥐는 고개를 꾸벅 숙이며 인사하고 나갔다. 4시간 후 강아지는 콩나물에게 물을 주다가 검정색 통 안에 있으면 콩나물이 답답할 것 같다는 생각이 들었다.',NULL,40),(255,'Game','하루가 지나고 다람쥐가 돌아왔다. 다람쥐는 돌아오자마자 검정색 통 밖에 있는 콩나물을 발견했다. 콩나물은 초록색으로 변해 있었다.<br/><br/>\"내... 내 콩나물이...\"<br/><br/>강아지는 큰 실수를 했다는 것을 깨달았다.<br/><br/>\"안녕히계세요!\"<br/><br/>다람쥐의 집을 나와서 가야할 길을 향해 뛰었다.',NULL,40),(256,'Game','하루가 지나고 다람쥐가 돌아왔다. 다람쥐는 돌아오자마자 콩나물을 확인했다.<br/><br/>\"콩나물을 건강하게 키워주셔서 감사해요. 적지만 수고비를 받아주세요.\"<br/><br/>강아지는 다람쥐가 기뻐하는 모습을 보니 기분이 좋아졌다. 강아지는 다람쥐에게 인사하고 가야할 길을 향해 떠났다.',NULL,40),(257,'Game','마을에서 패션 대회가 열렸다. 옷은 대회 주최측에서 제공해준다고 한다. 참여해볼까?',NULL,41),(258,'Game','패션 대회를 뒤로 하고 가야 할 길을 향해 떠났다.',NULL,41),(259,'Game','패션 대회에 참여했다. 화관, 리본 넥타이, 베레모가 있다. 어떤 소품을 사용해서 꾸밀까?','Fashion.jpg',41),(260,'Game','화관을 집어 드는데 옆에 있던 아기 다람쥐도 같이 화관을 집었다.<br/><br/>\"화관 쓰고 싶었는데...\"<br/><br/>아기 다람쥐가 울상 지으면서 말한다.',NULL,41),(261,'Game','리본 넥타이를 집어 드는데 옆에 있던 아기 다람쥐도 같이 리본 넥타이를 집었다.<br/><br/>\"리본 넥타이를 매고 싶었는데...\"<br/><br/>아기 다람쥐가 울상 지으면서 말한다.',NULL,41),(262,'Game','베레모를 집어 드는데 옆에 있던 아기 다람쥐도 같이 베레모를 집었다.<br/><br/>\"베레모 쓰고 싶었는데...\"<br/><br/>아기 다람쥐가 울상 지으면서 말한다.',NULL,41),(263,'Game','아기 다람쥐에게 소품을 양보하고 선글라스를 집어 들었다.<br/><br/>\"강아지님 감사합니다.\"<br/>\"대회 우승 응원할게\"<br/>\"강아지님도 우승하세요!\"',NULL,41),(264,'Game','아기 다람쥐와 아기 다람쥐의 친구들이 강아지한테 투표한 강아지는 패션 대회에서 우승했다.<br/><br/>\"축하드려요!\"<br/>\"감사합니다.\"<br/><br/>우승 했다는 기쁜 마음과 함께 가야 할 길을 향해 떠났다.',NULL,41),(265,'Game','\"죄송해요...\"<br/><br/>아기 다람쥐는 옆에 있는 선글라스를 집어 들었다.',NULL,41),(266,'Game','강아지가 선택한 소품은 다른 동물들과 겹쳐서 큰 호응을 얻지 못했다. 강아지는 패션 대회에서 저조한 성적을 얻었고, 아쉬운 마음과 함께 가야 할 길을 향해 떠났다.',NULL,41),(267,'Game','새로운 마을에 도착해서 구경하다가 벼룩시장을 발견했다. 얍삽해 보이는 여우가 강아지가 갖고 싶어했던 한정판 망원경을 팔고 있다.<br/><br/>\"거기 강아지님 바로 구매하시면 싸게 드릴게요~\"','Telescope.jpg',42),(268,'Game','구하기 힘든 망원경을 벼룩시장에서 팔리가 없다. 강아지는 가야 할 길을 향해 떠났다.',NULL,42),(269,'Game','\"박스에 정품 보증서도 들어있고요. 제가 아끼던 건데 돈이 부족해서 팝니다.\"<br/><br/>여우는 정말 말도 안되는 가격에 망원경을 팔았다.<br/><br/>\"와! 감사합니다!\"<br/><br/>여우는 망원경을 팔자마자 급하게 돗자리를 접고 자리를 떠났다. 강아지는 여우가 급하게 떠나는 모습을 보고 불안해서 망원경 박스를 열었고 안에는 돌덩어리만 있었다. 사기 당했다는 배신감과 함께 강아지는 가야 할 길을 향해 떠났다.',NULL,42),(270,'Game','\"네~ 여기 정품 보증서도 있습니다.\"<br/><br/>여우는 박스에서 종이 한장을 꺼내 강아지에게 보여줬다. 망원경의 정품 보증서가 맞았다.<br/><br/>\"지금 구매하시면 반값에 드립니다.\"',NULL,42),(271,'Game','여우는 정말 말도 안되는 가격에 망원경을 팔았다.<br/><br/>\"와! 감사합니다!\"<br/><br/>여우는 망원경을 팔자마자 급하게 돗자리를 접고 자리를 떠났다. 강아지는 여우가 급하게 떠나는 모습을 보고 불안해서 망원경 박스를 열었고 안에는 돌덩어리만 있었다. 사기 당했다는 배신감과 함께 강아지는 가야 할 길을 향해 떠났다.',NULL,42),(272,'Game','강아지는 재빠르게 뛰어가서 여우를 붙잡았다.<br/><br/>\"왜 도망치는거죠?\"<br/><br/>\"사실은... 돈이 너무 급해서 사기를 쳤습니다.\"<br/><br/>\"돈이 급해도 사기는 나빠요!\"<br/><br/>강아지는 여우한테 다시는 사기를 치지 않겠다는 서약서를 받아냈다.<br/><br/>\"앞으로는 착하게 살겠습니다.\"<br/><br/>강아지는 여우가 착하게 살기를 바라면서 가야 할 길을 향해 떠났다.',NULL,42),(273,'Game','오늘은 정말 좋아하는 밴드인 브레멘 음악대의 공연 날이다. 공연을 보기 위해 공연장을 찾았지만, 탬버린 연주자인 강아지 슈나씨가 아파 공연을 쉰다는 소식을 들었다. 공연이 취소되어 숙소로 돌아가려고 하는데 브레멘 음악대의 드러머 당나귀 동키씨가 강아지에게 말을 걸었다.<br/><br/>\"거기 강아지 잠깐 시간 있나?\"',NULL,43),(274,'Game','좋아하는 밴드를 눈앞에서 봐서 그런지 너무 떨려서 말도 못하고 도망쳤다. 동키씨의 싸인이라도 받을걸 후회되었다. 공연을 포기하고 가야 할 길을 향해 떠났다.',NULL,43),(275,'Game','\"우리 밴드의 슈나가 아파서 공연을 못 하는건 알지? 혹시 대신 탬버린 연주를 도와줄 수 있나?\"<br/><br/>\"전 탬버린 잘 못 쳐요...\"<br/><br/>\"슈나도 처음에는 그랬지\"','Tambourine.jpg',43),(276,'Game','\"팬이면 더 좋지. 혹시 탬버린 연주를 대신해서 해줄 생각이 없나?\"<br/><br/>\"제가 슈나님 대신이요?\"<br/><br/>\"그래\"','Tambourine.jpg',43),(277,'Game','\"그래? 아쉽네\"<br/><br/>브레멘 음악대 공연장을 뒤로 한 채 가야 할 길을 향해 떠났다.',NULL,43),(278,'Game','\"좋아 연주법은 알려줄게\"<br/><br/>동키씨는 탬버린 연주법을 열심히 알려줬다.<br/><br/>\"이제 이해되었나?\"',NULL,43),(279,'Game','브레멘 음악대의 음악에 맞춰 탬버린 연주를 했다. 동키씨는 나에게 팬들에게 한마디 할 기회를 주셨다.<br/><br/>\"제 탬버린 연주를 들어주셔서 감사합니다!\"<br/><br/>강아지는 공연장이 무너질 정도로 크게 인사했다.<br/><br/>\"오늘 고생 많았어. 그리고 최고의 연주였어\"<br/><br/>공연의 여운과 함께 강아지는 가야 할 길을 향해 떠났다.',NULL,43),(280,'Game','동키씨는 탬버린 연주법을 아까보다 더 자세하게 알려주셨다.<br/><br/>\"이제 공연하러 갈까?\"',NULL,43),(281,'Game','강아지는 길을 지나가다가 바닥에 버려진 종이를 발견했다. 근처에 쓰레기통이 보인다. 쓰레기를 주워서 버릴까?','Trash.jpg',44),(282,'Game','바닥에 버려진 종이를 외면하면서 가야 할 길을 향해 떠났다.',NULL,44),(283,'Game','종이를 쓰레기통에 버리고 길을 걸어가고 있었다. 길에 망가진 자전거가 있다. 근처에는 분리수거장과 쓰레기통이 보인다. 그대로 두면 통행을 방해할 것 같다.',NULL,44),(284,'Game','자전거의 구조를 생각하면서 분해했다. 제법 쓸만한 부품들도 나왔다. 근처 마을에 기부한다면 도움이 될 것 같다.',NULL,44),(285,'Game','강아지는 부품들을 가지고 마을에 찾아가 기부했다.<br/><br/>\"놀이터를 만들기 위해서 타이어가 필요 했는데 정말 고마워요\"<br/><br/>앵무새가 웃으면서 말했다. 강아지는 다른 동물들에게 도움이 되었다는 사실에 기분이 좋아졌다. 가벼워진 발걸음으로 가야 할 길을 향해 걸어갔다.',NULL,44),(286,'Game','강아지는 마을에 찾아가 부품들을 팔았다. 무거워진 돈 주머니와 함께 가야 할 길을 향해 걸어갔다.',NULL,44),(287,'Game','자전거는 생각보다 무거웠다. 자전거를 쓰레기통까지 겨우 가져왔다. 깨끗해진 길을 보니 강아지는 뿌듯했다. 강아지는 다시 가야 할 길을 향해 걸어갔다.',NULL,44),(288,'Game','버려진 자전거를 무사히 지나쳤다. 그리고 가야 할 길을 향해 걸어갔다',NULL,44),(289,'Game','하루 종일 함박눈이 내려, 길거리마다 하얀 눈이 수북이 쌓였다. 날도 춥고 길도 좋지 않아서, 근처 온천 마을에서 쉬기로 했다. 도착하니 이미 발가락이 꽁꽁 얼어서 너무 춥다. 어느 탕부터 들어가지?','Snow.jpg',45),(290,'Game','따뜻한 물에 몸을 담그니까 피로가 싹 녹는 것 같다. 머리가 핑글핑글 돌 때까지 탕에 있다가 나왔다.',NULL,45),(291,'Game','향기로운 물에 몸을 담그니까 몸에 좋은향기가 밸 것 같다. 탕에서 나오니 다른 동물들이 강아지를 향해 코를 킁킁댄다.',NULL,45),(292,'Game','따뜻한 물에 몸을 담근 채, 차가운 공기를 마시니 기분이 묘하다. 내리는 함박눈을 바라보며 잠시 감상에 젖었다.',NULL,45),(293,'Game','방으로 돌아와서 안내 책자를 보니 굉장히 많은 시설들이 있는 것 같다. 모든 시설을 다 이용하기에는 시간이 부족할 것 같아서 우선순위를 정하면 좋겠다. 어떤 것 부터 하면 좋을까?',NULL,45),(294,'Game','목욕하고 나서 먹는 음식은 더욱 맛있었다. 강아지는 그릇에 머리를 거의 담근채로 정신없이 흡입했다. 그런 모습을 메추리 사장이 흐뭇하게 바라보았다.<br/><br/>\"사장님, 음식이 정말 맛있는 것 같아요.\"<br/>\"그야 물론, 당연하지. 내 요리는 3일 내내 뜨거운 불 앞에서.. 어쩌구.. 저쩌구.. 이러쿵.. 저러쿵..\"<br/><br/>메추리는 신이나서 영업비밀을 주절주절 이야기했다. 덕분에 요리 실력이 상승했다.',NULL,45),(295,'Game','개운한 기분으로 흥얼흥얼 노래를 부르니 더욱 더 신이 났다. 아빠가 왜 예전부터 목욕을 하고 나서 콧노래를 부르셨는지 조금은 이해가 될 것 같았다.<br/><br/>\"아버지 이제야 깨달아요~♬\"<br/><br/>부모님이 더욱 더 보고싶은 순간이었다.',NULL,45),(296,'Game','오락실에는 다양한 게임기들이 가득했다. 그 중에서 강아지는 격투게임 <멍권>을 오늘의 게임으로 선택했다.<br/><br/>\'타라락 탁 타다다닥!\'<br/><br/>처음에는 조작이 어려웠지만, 익숙해질수록 발가락이 조이스틱 위에서 춤을 추었다. 마지막 보스까지 깨고 나서 강아지는 만족스럽게 일어났다.',NULL,45),(297,'Game','방에 돌아와 나머지 시설들도 모두 즐긴 후에야 강아지는 잠자리에 누웠다. 모처럼 신나게 놀고나니 어릴 적 생각도 나고, 더더욱 부모님 생각이 났다.<br/><br/>\"산신견님께 멋진 직업을 받아서 부모님께 돌아가야지!\"<br/><br/>다음 날, 어느새 눈은 그치고 날이 맑개 개었다. 강아지는 재충전한 기운을 가지고 다시 힘차게 길을 나섰다.',NULL,45),(298,'Game','\"..없어! 없다고! 대체 어디로 사라진 거지?\"<br/><br/>작곡가 앵무새가 피아노 앞에서 허둥대고 있다. 무언가를 찾고 있는 것 같아 가까이 가 보았다.<br/><br/>\"어, 어이 거기. 가만히 있지 말고 내 악보 좀 찾아줘. 오늘이 내 신곡 발표 날이란 말이야. 없으면 큰일이야. 분명 여기 있었는데..\"','Parrot.jpg',46),(299,'Game','\"뭐야! 난 지금 장난칠 기분이 아니거든!\"<br/><br/>앵무새에게 부리로 한참 쪼이다가 겨우 달아났다.',NULL,46),(300,'Game','피아노 뒤 쪽 수풀 속에서 악보를 발견했다. 아무래도 바람에 날렸던 것 같다.',NULL,46),(301,'Game','앵무새가 의자에 앉아 절망하고 있다.\n<br/><br/>\n\"앵무새 씨! 이것 보세요.\"\n<br/><br/>앵무새는 강아지의 발을 흘깃 보더니 금방이라도 날아오를 기세로 날개를 파닥였다.<br/><br/>\"정말 고마워, 늦지 않게 공연장에 도착하겠어!\"<br/><br/>앵무새와 함께 공연장으로 서둘러 이동했다. 공연장은 앵무새의 연주를 기다리는 동물들로 가득했다. 덤벙거리지만 실력은 확실한 작곡가인 것 같다. 앵무새의 감미로운 연주를 들으며 공연장을 빠져나왔다. 기분좋게 여행을 할 수 있겠다.',NULL,46),(302,'Game','\"낑낑\"<br/><br/>앵무새의 그랜드 피아노는 생각보다 커서 안을 살펴보기가 힘들었다. 의자를 발판 삼았음에도 넘어질 것 같았다.<br/><br/>\"으앗?!\"<br/>\'우당탕! 딴딴딴~♬ 쾅!\'<br/><br/>그만 발을 헛디뎌 요란스럽게 피아노에서 떨어지고 말았다. 겨우 정신을 차린 강아지는 피아노를 험하게 다뤄 앵무새가 화가 났을까 올려다보았다. 앵무새 얼굴은 경악으로 가득 차 있었다.<br/><br/>\"방금.. 방금, 그 멜로디!! 그 화음!  굉장해! 으오오오 떠오른다 악상이!\"<br/><br/>앵무새는 시간도 잊은 채 갑자기 양피지에 악보를 써 내려가기 시작했다.',NULL,46),(303,'Game','다행히 열심히 뛰어서 공연장에는 늦지 않게 도착했다.<br/><br/>\"다 됐다! 나의 역작이 탄생했어 고맙다. 강아지! 아니, 존경의 의미를 담아서 멍토벤이라고 부르지!\"<br/><br/>앵무새와 함께 공연장으로 입장했다. 공연장은 앵무새의 연주를 기다리는 동물들로 가득했다. 앵무새는 방금 영감이 떠올라 만든 곡을 완벽하고 아름답게 소화해냈다. 덤벙거리지만 실력은 확실한 작곡가인 것 같다. 앵무새의 감미로운 연주를 들으며 공연장을 빠져나왔다. 기분좋게 여행을 할 수 있겠다.',NULL,46),(304,'Game','산길을 지나는 도중 멍멍신의 신상을 만나게 되었다. 멍멍신은 모든 멍멍이들의 근원으로서 태초의 멍멍이라고 불린다. 그래서 멍멍이들은 마을마다 신상을 세워 기리고 있고, 신상을 처음 마주하는 멍멍이들은 반드시 참배를 해야한다.<br/><br/>\"어디보자, 참배를 하려면 꽃과 뼈다귀가 필요한데.. 꽃부터 찾아볼까?\"','Gargoyle.jpg',47),(305,'Game','들판에 도착하니 형형색색의 꽃들이 만개해있었다. 그 중 가장 싱그러운 노란 꽃을 가지고 돌아왔다.',NULL,47),(306,'Game','뼈다귀는 정착한 강아지들은 집에 여러 개를 모아두지만. 여행 중인 강아지들은 구하기가 꽤 어려운 물건이었다. 여행 중인 강아지들이 뼈다귀를 얻으려면 뼈다귀 결투를 해서 얻거나, 강아지들이 묻어 놓고 잊어버린 뼈다귀를 찾아내는 수 밖에 없었다.',NULL,47),(307,'Game','물가에 도착하니 정말 아름답고 희귀한 연보라색 꽃이 한 송이 피어있었다. 강아지와 동시에 근처의 여러 동물들이 꽃을 차지하기 위해 달려들었다. 다행히 전속력으로 달려 꽃을 손에 넣었다.<br/><br/>\"칫, 아까워라. 꽤 빠르군.\"',NULL,47),(308,'Game','마침 지나가는 여행자 강아지가 있어 뼈다귀 결투를 신청했다.<br/><br/>\"나도 뼈다귀가 필요한 참이었는데, 잘 됐군!\"<br/><br/>여행자 강아지는 자신있게 발바닥 젤리를 내밀었다.<br/><br/>\'간질간질간질\'<br/>\"..풉 ..푸하핫!\"<br/><br/>여행자 강아지는 생각보다 강력했다. 간지럼을 10초나 참아내다니 보기 드문 용맹함이었다. 자칫하면 뼈다귀를 역으로 헌납해야 할 수 있는 상황이 되자 강아지는 긴장하며 발바닥 젤리를 내밀었다.<br/><br/>\'간질간질간질\'<br/>\"으읍..! 큽! 풉.. 푸하핫!\"<br/><br/>불굴의 의지로 강아지는 11초를 참아냈다. 여행자 강아지는 박수를 쳐 주었다.<br/><br/>\"너 엄청 용맹하구나! 내가 졌어. 너 같은 강아지에겐 뼈다귀를 줘도 아깝지 않지\"<br/><br/>여행자 강아지는 뼈다귀를 건네주고 다시 길을 떠났다.',NULL,47),(309,'Game','근처에서 가장 크고 높아 보이는 고목나무 앞에 도착했다. 강아지는 그 주위 땅을 뒷발차기로 마구 파냈다.<br/><br/>\'파바바바박 틱!\'<br/><br/>열심히 파내던 도중 발 끝에 무언가 걸리는 느낌이 들었다. 그 부분의 흙을 조심히 파 보니 뼈다귀가 묻혀있었다!',NULL,47),(310,'Game','강아지는 꽃과 뼈다귀를 신상 앞 제단에 경건하게 내려놓았다. 조용히 무릎을 꿇고 눈을 감자, 어디선가 따스한 목소리가 들려왔다.<br/><br/>\"네가 믿는 길로 잘 가고 있구나, 분명히 좋은 결과가 있을게다.\"<br/><br/>강아지는 화들짝 놀라며 눈을 떴지만, 눈 앞에는 아무것도 없었다. 꿈을 꿨나 생각하며 다시 여행길을 떠나는 강아지의 뒤로 멍멍신의 환영이 조용히 미소지었다.',NULL,47),(311,'Game','강아지는 영문 모를 상황을 겪고 있었다. 지도에 있는 마을은 온데 간데 없고 집들의 잔해만 남아 있었다.<br/><br/>\"분명 지도에는 이 곳이 맞는데..\"<br/>\'뚝딱 뚝딱\'<br/><br/>저 멀리 폐허 속에서 집을 복구하는 목수 햄스터들이 보였다.몸집은 작지만 많은 수를 이용해 일사불란하게 작업을 하고 있었다.<br/><br/>\"영차, 영차, 바쁘다 바빠!\"','Hamster.jpg',48),(312,'Game','\"땅, 땅, 땅, 뚝딱, 뚝딱.\"<br/><br/>공구 소리는 한참 동안 등 뒤에서 쉬자않고 들려왔다.',NULL,48),(313,'Game','\"여기는 최근에 수해를 겪었어. 물이 범람해서 많은 동물들이 집을 잃었지. 우리는 그런 동물들을 위해서 복구 작업을 하러왔어!\"<br/><br/>\"좋은 일을 하고 계시는군요.\"<br/><br/>수 많은 햄스터들이 동시에 고개를 끄덕였다.<br/><br/>\"맞아. 그렇지만 너도 봤다시피 고칠 집이 너무 많아서 일손이 부족해. 혹시 도움을 줄 수 있을까?\"',NULL,48),(314,'Game','\"좋아 그럼 저쪽 집을 보수해 줘.\"<br/><br/>무너진 곳을 나무 기둥으로 다시 세우고, 자잘한 부서진 곳들을 보수했다. 처음엔 어려웠지만, 익숙해질수록 속도도 붙고 재미도 있었다. 중간 중간 햄스터들이 맛있는 음식도 전달 해주고, 재미있는 이야기도 해줘서 시간가는 줄도 모르고 일했다. <br/><br/>\"자, 해가 진다! 철수 하자!\"',NULL,48),(315,'Game','강아지는 근처 숲에 도착했다. 이 숲에서 가장 튼튼해 보이는 나무를 베기 위해 도끼질을 시작했다.<br/><br/>\'딱! 딱! 딱!...\'<br/>\"저것 봐. 두 시간 째 도끼질을 하고 있어.\"<br/>\"세상에 엄청난 근성이야. 수해 동물을 돕는 거라면서?\"<br/><br/>어느 새 숲 속 다람쥐들이 모두 모여 강아지를 응원하고 있었다.<br/><br/>\'따악! 우득! 우두둑!\'<br/><br/>마침내 단단하던 나무가 옆으로 쓰러졌다. 다람쥐들은 강아지의 주위를 빙글빙글 돌며 환호했다!<br/><br/>\"너무 멋있었어! 수해 동물들도 이걸로 힘을 낼 거야!\"',NULL,48),(316,'Game','저녁 식사를 하며, 헴스터 대표는 강아지에게 감사 인사를 건넸다.<br/><br/>\"고마워, 네가 도와준 덕분에 복구가 빠르게 진행되었어!\"<br/>\"맞아, 아주 재능이 있던 걸?\"<br/>\"수해 동물도 감사하다고 전해달랬어.\"<br/><br/>강아지는 즐겁게 식사를 마치고 뿌듯하게 잠에 들었다. 물론 다음 날, 출발하는 강아지의 몸은 두 배 더 무거웠지만.',NULL,48),(317,'Game','휴식도 취할 겸 근처에 위치한 놀이 공원에 도착했다. 어렸을 때 부모님 발을 잡고 왔던 게 엊그제 같다. 하지만 이제 강아지는 스스로 클 만큼 컸다고 생각했다.<br/><br/>\"나도 이제 무서운 놀이기구 탈 거야!\"<br/><br/>무서운 놀이기구에 도전하려고 한다. 무엇을 탈까?','Themepark.jpg',49),(318,'Game','\"이제 나도 어른이니까, 무섭지 않아!\"\n<br/>\n\'틱, 틱, 틱...\'<br/><br/>말과는 다르게 코스터가 올라갈 수록 강아지는 미소를 잃어갔다.<br/><br/>\"무섭지.. 않.. 역시 무서..아아아아악!\"<br/>\'...\'<br/><br/>강아지는 탑승이 끝나고 조용히 세수를 하러 갔다.',NULL,49),(319,'Game','\"세상 구경한다고 생각하면 편해!\"<br/>\'우우웅..\'<br/><br/>타워가 상승하는 속도는 강아지의 상상 이상으로 빨랐다.\n<br/><br/>\n\"이, 이거 고장난 건 아니겠지..?\"<br/><br/>타워는 순식간에 정점에 도착했고 하강 카운트가 시작됐다. 여기서 눈을 감지 않아야 진정한 어른!<br/><br/>\'질끈!\'<br/>\'...\'<br/><br/>강아지는 탑승이 끝나고 머쓱하게 퇴장했다',NULL,49),(320,'Game','\"귀신이 어디 있어! 다 분장한 동물들인.. 끼아악!!\"\n<br/><br/>이 놀이공원은 자비가 없었다. 첫 번째 코너를 돌자마자 좀비 떼가 출현했다. 그리고 코너를 돌 때 마다 나타나는 귀신들. 귀신과 강아지의 추격전은 그리 오래가지 않았다.<br/><br/>\'...\'<br/><br/>강아지는 귀신의 집 최단 탈출 기록을 갱신했다.',NULL,49),(321,'Game','한참 놀이기구를 즐기다가, 강아지의 눈에 들어온 것은 먹거리! 놀이 공원의 대명사 츄멍스와 솜사탕이었다.<br/><br/>\'꼬르륵\'<br/><br/>강아지는 둘 다 먹고 싶었지만, 줄이 너무 길어 한 쪽만 선택을 해야하는 상황이다. 어디 둘 다 먹는 좋은 방법 없을까?',NULL,49),(322,'Game','강아지는 츄멍스를 사서 솜사탕 가게 바로 옆에 자리를 잡았다. 그러고서 모두 들리도록 쩌렁쩌렁 이야기했다.\n<br/><br/>\n\"와, 이 츄멍스 진짜 맛있다! 이 놀이공원에서 제일 맛있는 음식인 거 같아..\"<br/><br/>그 말은 솜사탕 장수의 귀에도 당연하게도 들어갔다.<br/><br/>\"뭐, 뭐라고? 츄멍스 따위가..! 빨리 이 솜사탕도 먹어 봐! 츄멍스는 잊어버릴걸?\"<br/><br/>솜사탕 장수는 노발대발하며 강아지의 발에 솜사탕을 쥐어주었다. 강아지는 배부르게 두 음식을 먹었다.',NULL,49),(323,'Game','주위를 둘러보니 강아지와 똑같이 츄멍스와 솜사탕 줄을 번갈아 쳐다보는 사슴이 보였다.<br/><br/>\"저기.. 혹시 제가 츄멍스를 살테니까, 솜사탕을 사서 반 나눠 드실래요?\"<br/>\"앗, 좋아요! 감사합니다.\"<br/><br/>서로 하나씩 사서 사이좋게 나눠 먹었다.',NULL,49),(324,'Game','강아지는 동전을 던져 츄멍스와 솜사탕 중 한 가지를 골라서 먹었다. 무엇을 먹었는지는 비밀이다.',NULL,49),(325,'Game','강아지는 오늘 하루를 정말 알차게 놀았다고 생각했다. 무서운 놀이기구도 도전하면서, 어릴 적 생각이 나는 음식도 먹었다. 어렸던 자신과 성장한 자신을 동시에 볼 수 있었던 좋은 기회였다. 앞으로 성장하면서도 순수한 마음을 잃지 말아야겠다고 다짐하는 강아지였다.',NULL,49),(326,'Game','놀이터에서 고양이들이 놀고 있다.<br/><br/>\"크하하, 심연에 흔들리는 연옥의 업화여! 『크림슨 플레임』!\"<br/>\"크윽, 증오.. 이 증오의 감정.. 이 증오의 맛은 달구나, 크큭!\"<br/><br/>... 뭔가 기대하는 눈빛으로 내 쪽을 쳐다본다.','jung2.jpg',50),(327,'Game','고양이들이 동경의 눈빛으로 쳐다본다.. 수치심과 인기를 맞교환했다.',NULL,50),(328,'Game','\"나도 이제 다 컸으니까..\"<br/><br/>중2병 소굴에서 탈출했다.',NULL,50),(329,'Game','비둘기가 노트북 모니터를 뚫어져라 쳐다보고 있다. 마우스를 쥔 날개에는 땀이 흥건하다. 보아하니 주식을 하고 있는 것 같다.<br/><br/>\"대체, 대체! 어디에 넣으면 좋은걸까?! 도와줘!\"','Stock.jpg',51),(330,'Game','그렇지? 나도 그렇게 생각했어. 앗, 역시 유망하다더니 벌써 올랐네. 자, 가져가 보답이야.<br/>..이렇게 빨리 오르던가?',NULL,51),(331,'Game','\"싫어, IT에 넣을거야.\"<br/><br/>.. 왜 물어본거야.',NULL,51),(332,'Game','\"꺅, 싸인해 줘!!\"<br/><br/>드림멍즈의 팬인 동물들이 알아보고 쫓아오고 있다. 어림잡아 수천 마리는 되어 보인다!!','Fan.jpg',52),(333,'Game','팬들에게 정성껏 싸인해주었다. 다만, 동물들이 너무 많아서 하루를 다 써버렸지만..',NULL,52),(334,'Game','엄청난 달리기 속도로 도망쳤다.<br/><br/>\"꺅, 달리는 것 봐. 귀여워!!\"<br/><br/>팬들은 도망치는 모습마저 사랑했다.',NULL,52),(335,'Game','꾸러기 판다가 초롱초롱한 눈으로 문제를 내 온다.<br/><br/>\"푹신하고, 달콤하고, 매일 먹어도 질리지 않는 건 뭐게?\"','Panda.jpg',53),(336,'Game','\"어떻게 단 번에 알았지? 대단해!\"<br/><br/>운이 좋았다.',NULL,53),(337,'Game','\"아니거든~ 케이크거든~\"<br/><br/>운이 나빴다.',NULL,53),(338,'Game','비버가 달고나 장사를 하고 있다. 우산 모양부터 별 모양, 바람개비 모양까지 다양하다!<br/><br/>\"너도 한 번 해볼래?\"','Dalgona.jpg',54),(339,'Game','사각 사각.. 뚝\'<br/><br/>너무 고난도의 모양이라 얼마 못가 부숴지고 말았다. 새겨진 꽃이 예뻐서 어찌 되든 상관 없는 강아지였다.',NULL,54),(340,'Game','사각 사각\'<br/><br/>오른 앞발에 모든 신경을 집중해서 별을 뽑아냈다! <br/><br/>\"소질이 있구나.\"<br/><br/>뿌듯한 마음으로 길을 떠났다.',NULL,54),(341,'Game','마을 가판대 옆에서 조각가 올빼미가 나무를 조각하고 있다.<br/><br/>\"잠시만 기다려 봐, 너를 조각해 줄게.\"<br/><br/>\'사각 사각\'<br/><br/>잠시 후, 올빼미는 뿌듯한 표정으로 조각을 건넸다. 강아지의 형체는 하나도 찾아볼 수 없다..<br/><br/>\"어때, 잘 만들었지?\"','Owl.jpg',55),(342,'Game','\"거짓말 하지마라. 조각내 버린다.\"<br/><br/>왜 물어본거야..',NULL,55),(343,'Game','\"나도 알고 있다고.. 난 조각에 재능이 없어. 크흑!\"<br/><br/>올빼미를 한참 위로해주다 다시 길을 떠났다.',NULL,55),(344,'Game','원숭이가 나무 밑둥위에서 프라모델을 조립하고 있다. 낑낑대는 걸 보니, 상당히 어려운 모양이다.<br/><br/>\"저기, 이 부분에서 어떻게 해야할까?\"','Monkey.jpg',56),(345,'Game','꽤 복잡한 설명서였지만, 치분히 읽고 이해하니 쉽게 조립할 수 있었다.<br/><br/>\"정말 고마워! 똑똑한 강아지구나!\"',NULL,56),(346,'Game','두 부품의 홈을 맞대니 정확하게 맞아 떨어졌다. 그렇게 몇 번 하고나니 프라모델이 완성되었다.<br/><br/>\"너 되게 감이 좋구나! 굉장해!\"',NULL,56),(347,'Game','마을 어귀에서 소심한 기니피그가 서럽게 울고 있다.<br/><br/>\"흑흑, 여자에게 이번까지 총 10,000번 차였어. 대체 내가 남자로서 뭐가 부족할까...\"','Guinea.jpg',57),(348,'Game','\"고, 고마워! 당장 <여자를 리드하는 101가지 방법>을 사러가야겠어!\"<br/><br/>기니피그는 서점을 향해 달려갔다...저래선 백 날 차일 것 같은데..',NULL,57),(349,'Game','\"고, 고마워! 당장 <여자의 마을을 들여다보는 101가지 방법>을 사러가야겠어!\"<br/><br/>기니피그는 서점을 향해 달려갔다.<br/>..저래선 백 날 차일 것 같은데..',NULL,57),(350,'Game','오리 가족이 개울을 건너려고 하고 있다. 엄마 오리의 뒤를 따라 뛰어든 아기 오리들은 물을 잔뜩 먹은 채 다시 뭍으로 올라왔다. 아기 오리들은 겁에 질린 표정이다.<br/><br/>\'덜덜덜\'<br/><br/>그런 새끼 오리들을 걱정스럽게 엄마 오리가 바라보고 있다.','Duck.jpg',58),(351,'Game','\"정말 고마워요. 아직 아이들이 너무 어려서 겁을 내요.\"<br/><br/>멀어지는 오리 가족을 바라보며 발을 흔들어 주었다.',NULL,58),(352,'Game','근처 나무에서 큼지막한 나뭇잎을 따서 새끼 오리들에게 나누어 주었다. 새끼 오리들은 잎을 잡고 헤엄쳐 개울을 횡단했다.<br/><br/>\"나중엔 잎 없이도 해 볼게요!\"<br/><br/>멀어지는 오리 가족을 바라보며 발을 흔들어 주었다.',NULL,58),(353,'Game','\"후후훗. 하핫.\"<br/><br/>연못 쪽에서 이상한 웃음소리 들린다. 가까이 가보니 공작이 화려한 꼬리를 뽐내며 자아도취에 빠져 있다. 공작 옆을 지나가야 하는데 어떡하지..','Peacock.jpg',59),(354,'Game','\"크윽, 나에게 눈길도 주지 않고 지나간 녀석은 네가 처음이야! 이런 깊고 진한 에스프레소 같은 매력..\"<br/><br/>뭐라고 하는 건지 잘 모르겠다. 도망가자.',NULL,59),(355,'Game','\"하하, 깃털이 멋지시네요.\"<br/><br/>\"그래, 나도 알아. 너도 내 팬인가 보구나. 나도 너의 팬이 되어주마. 하하하!\"<br/><br/>뭐라고 하는 건지 잘 모르겠다.<br/>도망가자.',NULL,59),(356,'Game','어느 마을 앞 바닷가를 구경하게 되었다.<br/>바다는 갯벌이 드러나 작은 게들이 나와 체조를 하고 있다.<br/>앗, 그런데 게들이 갑자기 땅으로 숨고 있다?','Crab.jpg',60),(357,'Game','좋지 못한 예감이 들어 마을로 돌아왔다. 곧 밀물이 들어와 갯벌을 바닷물로 가득 채웠다.<br/><br/>\"휴, 다행이다\"',NULL,60),(358,'Game','갯벌 구경을 하고 있는데 갑자기 바닷물이 점점 밀려왔다. 전속력으로 달려 아슬아슬하게 갯벌을 탈출했다.<br/><br/>\"헉헉, 큰일 날 뻔 했다.\"',NULL,60),(359,'Game','\"이 돈 주머니는 내거야!\"<br/><br/>\"무슨 소리야! 내 거 잖아!\"<br/><br/>싸우는 소리가 들려서 가보니 기린들이 돈 때문에 다투고 있다.<br/><br/>\"싸우지 마세요. 제가 중재해드릴게요.\"','Giraffe.jpg',61),(360,'Game','\"그래 좋아! 반반이라면\"<br/><br/>\"제, 제 돈인데 반반이라뇨! 안 돼요!\"<br/><br/>분할에 찬성한 파렴치한 기린을 혼내주고, 원래 주인인 기린에게 무사히 돈을 돌려 주었다.<br/><br/>\"정말 감사합니다. 옛날 이야기에 나오는 멍로몬 같았어요!\"',NULL,61),(361,'Game','발자국을 흙에 찍어서 비교를 했다. 돈주머니에 선명하게 찍혀 있던 발자국으로 주인인 기린에게 무사히 돈주머니를 돌려주었다.<br/><br/>\"정말 감사합니다! 완전 영화에 나오는 수사관 같았어요!\"',NULL,61),(362,'Game','\"어떡해.. 어떡하면 좋지., 하아..\"<br/><br/>카피바라가 창백한 얼굴로 바닥만 하염없이 바라보고 있다. 보아하니 바닥에 둔 그릇을 밟아 부순 모양이었다.<br/><br/>\"그릇 주인께 사과하면 분명 용서해 줄 거예요.\"<br/><br/>\"이건 사자 밥그릇이란 말이야.. 당장 도망가지 않으면.. 난.. 히익..!\"<br/><br/>카피바라는 무서운 상상이라도 했는지 창백했던 얼굴이 더 창백해졌다.','Bowl.jpg',62),(363,'Game','\"수액으로 잘 붙인 다음, 나무 줄기를 이런식으로..\"<br/><br/>밥그릇이 깔끔하게 고쳐졌다.<br/><br/>\"정말 고마워. 재주가 좋구나. 덕분에 살았어!\"',NULL,62),(364,'Game','\"저기 사자씨, 죄송해요 제가 실수로 밥그릇을 밟아서 망가져버렸어요.\"<br/><br/>\"엉? 아 뭐, 상관없어. 조만간 새로 살려고 했거든. 솔직하게 말해줘서 고맙다. 보통 녀석들은 숨기거나 도망치거든.\"<br/><br/>사자는 카피바라의 생각보다 온화했다.',NULL,62),(365,'Game','큰 공터에서 동물들이 체육 대회를 벌이고 있다. 초식, 육식 가릴 것 없이 모두가 하나되어 운동하는 모습이 보기 좋다.<br/><br/>\"자네도 한 번 참여해보는 게 어때?\"','Sports.jpg',63),(366,'Game','계주에 강아지 대표로 출전해 얼룩말 대표와 치열한 승부 끝에 승리했다!',NULL,63),(367,'Game','강아지 응원단 대표로 나서 열심히 응원했다. 덕분에 강아지 팀이 좋은 성적을 거두었다!',NULL,63),(368,'Game','아기 코알라가 대나무에 매달려 있는 할아버지를 흔들며 조르고 있다.<br/><br/>\"할아버지! 심심해요!\"<br/><br/>\"놀아준지 5분 밖에 안되었잖니. 에구 허리야. 강아지 씨, 미안하지만 우리 손주를 좀 놀아줄 수 없겠나. 부탁하네.\"','Koala.jpg',64),(369,'Game','중간에 몇 번 쓰러지긴 했지만, 성공적으로 코알라 모양으로 도미노를 쌓았다. 아기 코알라도 만족한 모양이다.',NULL,64),(370,'Game','대나무 사이를 넘어다니며 술래잡기를 했다. 아기 코알라는 힘들었는지 잠에 들었지만 입가에는 미소가 지어져있다.',NULL,64),(371,'Game','어느 마을의 유명한 쉐프인 돼지의 가게에 들렀다.<br/><br/>\"거기, 씩씩한 강아지. 음식의 진정한 맛은 어디서 나오는 것이라고 생각하니?\"','Pig.jpg',65),(372,'Game','\"뭘 좀 아는 강아지군! 꿀꿀! 주방으로 와라!\"<br/><br/>돼지는 호탕하게 웃으며 강제로 요리 강습을 시작했다.',NULL,65),(373,'Game','\"물론 그것도 맞지만, 부족해.. 요리는 발맛이야. 똑똑히 알아둬라. 꿀!\"<br/><br/>..요리는 발맛..',NULL,65);
/*!40000 ALTER TABLE `scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selection` (
  `selection_id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `next_scene` bigint DEFAULT NULL,
  `status_value` bigint DEFAULT NULL,
  `scene_id` bigint NOT NULL,
  `status_id` bigint DEFAULT NULL,
  PRIMARY KEY (`selection_id`),
  KEY `FKbctkak8fo6e8ptje41ma76mtv` (`scene_id`),
  KEY `FKmk3qhjwma6hgb59ybaocedn8k` (`status_id`),
  CONSTRAINT `FKbctkak8fo6e8ptje41ma76mtv` FOREIGN KEY (`scene_id`) REFERENCES `scene` (`scene_id`),
  CONSTRAINT `FKmk3qhjwma6hgb59ybaocedn8k` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
INSERT INTO `selection` VALUES (1,'따라 나간다.',2,1,1,3),(2,'\"꼭 가야만 하나요..?\"',3,NULL,2,NULL),(3,'\"네 알겠어요..\"',4,NULL,3,NULL),(4,'일단 잡히는 대로 가방에 넣자',5,1,4,3),(5,'필요할 것 같은 물품만 챙기자',5,1,4,2),(6,'돈만 있으면 돼!',5,1,4,10),(7,'부모님 곁을 떠나본 적이 없는데... 내가 잘 다녀올 수 있을까 걱정되네..',6,1,5,4),(8,'다들 떠나는 여행이니까 나도 괜찮을거야. 화이팅!!',6,1,5,5),(9,'여행을 시작한다.',NULL,NULL,6,NULL),(10,'네.. 너무 힘들었습니다.',8,NULL,7,NULL),(11,'아니요, 괜찮았습니다!',8,NULL,7,NULL),(12,'결과보기',NULL,NULL,8,NULL),(13,'분위기에 취해 노래를 부른다.',10,1,9,7),(14,'생각에 잠긴다.',11,NULL,9,NULL),(15,'잠을 자며 하루가 지났다',NULL,NULL,10,NULL),(16,'잠을 자며 하루가 지났다',NULL,NULL,11,NULL),(17,'올라간다.',13,1,12,9),(18,'지나친다.',14,NULL,12,NULL),(19,'산을 내려온다.',NULL,NULL,13,NULL),(20,'여행을 계속한다.',NULL,NULL,14,NULL),(21,'가본다.',16,NULL,15,NULL),(22,'지나친다.',17,NULL,15,NULL),(23,'1051',18,NULL,16,NULL),(24,'0',18,NULL,16,NULL),(25,'1505',19,1,16,2),(26,'여행을 계속한다.',NULL,NULL,17,NULL),(27,'여행을 계속한다.',NULL,NULL,18,NULL),(28,'여행을 계속한다.',NULL,NULL,19,NULL),(29,'보수를 한다.',21,1,20,8),(30,'무리하다 다치지 말고, 그냥 다른 곳에 가서 잔다.',22,NULL,20,NULL),(31,'여행을 계속한다.',NULL,NULL,21,NULL),(32,'여행을 계속한다.',NULL,NULL,22,NULL),(33,'덩치가 큰 다른 강아지에게 부탁하는 것을 권유하고 지나간다.',24,NULL,23,NULL),(34,'아기 고양이들의 반응에 부응하기 위해,<br/>무리해서 구멍으로 들어가 공을 꺼내는 것을 시도한다.',25,1,23,6),(35,'여행을 계속한다.',NULL,NULL,24,NULL),(36,'여행을 계속한다.',NULL,NULL,25,NULL),(37,'도망친다.',27,1,26,3),(38,'크게 짖으며 맞서 싸운다.',28,NULL,26,NULL),(39,'여행을 계속한다.',NULL,NULL,27,NULL),(40,'여행을 계속한다.',NULL,NULL,28,NULL),(41,'간다.',30,1,29,5),(42,'가지 않는다.',31,NULL,29,NULL),(43,'잠을 청한다.',NULL,NULL,30,NULL),(44,'잠을 청한다.',NULL,NULL,31,NULL),(45,'큰 길로 간다.',33,1,32,4),(46,'작은 길로 간다.',34,1,32,4),(47,'여행을 계속한다.',NULL,NULL,33,NULL),(48,'여행을 계속한다.',NULL,NULL,34,NULL),(49,'진짜 너무 대박 재밌다!',36,1,35,11),(50,'재미있다…?',37,-1,35,11),(51,'여행을 계속한다.',NULL,NULL,36,NULL),(52,'여행을 계속한다.',NULL,NULL,37,NULL),(53,'재빨리 도망간다.',39,1,38,3),(54,'맞서 싸운다.',40,1,38,5),(55,'여행을 계속한다.',NULL,NULL,39,NULL),(56,'여행을 계속한다.',NULL,NULL,40,NULL),(57,'몸통 박치기를 해서 떨어뜨린다.',42,1,41,1),(58,'주변을 탐색해본다.',43,1,41,2),(59,'여행을 계속한다.',NULL,NULL,42,NULL),(60,'여행을 계속한다.',NULL,NULL,43,NULL),(61,'그냥 지나친다.',45,NULL,44,NULL),(62,'가지고 논다.',46,1,44,1),(63,'여행을 계속한다.',NULL,NULL,45,NULL),(64,'여행을 계속한다.',NULL,NULL,46,NULL),(65,'일을 도와드린다.',48,1,47,10),(66,'지나간다.',49,NULL,47,NULL),(67,'과일을 사먹는다.',50,NULL,47,NULL),(68,'여행을 계속한다.',NULL,NULL,48,NULL),(69,'여행을 계속한다.',NULL,NULL,49,NULL),(70,'여행을 계속한다.',NULL,NULL,50,NULL),(71,'쉴때 쉬더라도 편안하게 쉬자!(쉼터 제작)',52,1,51,8),(72,'그냥 쉬자(노숙)',53,1,51,1),(73,'여행을 계속한다.',NULL,NULL,52,NULL),(74,'여행을 계속한다.',NULL,NULL,53,NULL),(75,'말을 걸어본다.',55,NULL,54,NULL),(76,'그냥 지나친다.',56,NULL,54,NULL),(77,'도와드린다.',57,1,55,6),(78,'도와드리지 않고 쉰다.',58,NULL,55,NULL),(79,'여행을 계속한다.',NULL,NULL,56,NULL),(80,'힘든 점은 딱히 없는 것 같아요.',59,NULL,57,NULL),(81,'앞으로 뭘 하면서 살지 걱정돼요.',60,NULL,57,NULL),(82,'여행을 계속한다.',NULL,NULL,58,NULL),(83,'감사합니다.',61,NULL,59,NULL),(84,'그러셨군요.',61,NULL,60,NULL),(85,'주변에 있는 돌을 주워 나뭇가지를 맞춘다.',62,1,61,3),(86,'큰 소리를 내 다람쥐를 놀라게 만든다.',63,1,61,9),(87,'다람쥐를 설득한다.',64,1,61,5),(88,'시계를 드린다.',65,NULL,62,NULL),(89,'시계를 드린다.',65,NULL,63,NULL),(90,'시계를 드린다.',65,NULL,64,NULL),(91,'아니 이건..?',66,NULL,65,NULL),(92,'여행을 계속한다.',NULL,NULL,66,NULL),(93,'\"네? ...저요?\"',68,NULL,67,NULL),(94,'못 들은 척하고 마저 걸어간다.',69,NULL,67,NULL),(95,'\"네 시간은 있는데... 무슨 일이신가요?\"',73,NULL,68,NULL),(96,'\"아니요 죄송해요.. 지금 급한 일이 있어서..\"',72,NULL,68,NULL),(97,'(애써 웃으며) 아...안녕하세요? 무슨일이시죠..?',70,NULL,69,NULL),(98,'\"네? 아니요.. 못들었습니다..\"',71,1,70,4),(99,'\"네.. 무슨 일이신가요?\"',73,NULL,71,NULL),(100,'\"아니요... 지금 급한 일이 있어서..\"',72,NULL,71,NULL),(101,'여행을 계속한다.',NULL,NULL,72,NULL),(102,'\"음.. 죄송해요. 제가 도와드릴 일이 아닌 것 같습니다..\"',74,NULL,73,NULL),(103,'\"네 뭐.. 한 번 찾아보겠습니다.\"',75,NULL,73,NULL),(104,'여행을 계속한다.',NULL,NULL,74,NULL),(105,'\"그게... 호랑씨의 부탁이 있어서...\"',76,NULL,75,NULL),(106,'\"네..\"',77,NULL,76,NULL),(107,'\"죄송해요 호랑씨.. 반지는 못 찾았어요.\"',78,1,77,4),(108,'\"호랑씨.. 혹시 저에게 거짓말 하셨나요?\"',79,NULL,77,NULL),(109,'\"그럼 저한테 거짓말 하신 이유가..?\"',80,NULL,78,NULL),(110,'\"그럼 저한테 거짓말 하신 이유가..?\"',80,1,79,6),(111,'\"그렇군요... 어디에도 털어놓지 못하신 이야기 같은데 그 동안 마음 고생 심했겠어요... 지금은 좀 괜찮으신가요?\"',81,1,80,5),(112,'\"그러면 안되죠! 지금 신부 분은 아무것도 모른 채 결혼식 준비에 한창이실텐데 너무 무책임하신거 아닌가요?\"',82,1,80,2),(113,'\"음... 그러면 결혼을 확신했던 그 순간을 떠올려 보는건 어떨까요? 기억이 나시나요?\"',83,NULL,80,NULL),(114,'\"맞아요.\"',84,NULL,81,NULL),(115,'\"맞아요.\"',84,NULL,82,NULL),(116,'\"맞아요.\"',84,NULL,83,NULL),(117,'\"네, 좋아요!\"',85,NULL,84,NULL),(118,'\"뭐, 그냥 여행을 다니고 있었습니다. 누구를 만나야 해서요.\"',86,NULL,85,NULL),(119,'식장을 나온다.',87,NULL,86,NULL),(120,'여행을 계속한다.',NULL,NULL,87,NULL),(121,'가본다.',89,NULL,88,NULL),(122,'지나친다.',90,NULL,88,NULL),(123,'감자를 서리한다.',91,-1,89,11),(124,'주인이 올 때까지 기다린다.',92,1,89,2),(125,'그냥 지나친다.',93,NULL,89,NULL),(126,'여행을 계속한다.',NULL,NULL,90,NULL),(127,'여행을 계속한다.',NULL,NULL,91,NULL),(128,'\"배가 고픈데, 밥을 좀 주실 수 있나요?\"',94,NULL,92,NULL),(129,'위협한다.',95,-1,92,11),(130,'불쌍한 표정을 한다.',96,NULL,92,NULL),(131,'여행을 계속한다.',NULL,NULL,93,NULL),(132,'허겁지겁 밥을 먹는다.',97,NULL,94,NULL),(133,'여행을 계속한다.',NULL,NULL,95,NULL),(134,'여행을 계속한다.',NULL,NULL,96,NULL),(135,'열심히 하겠습니다!',98,1,97,1),(136,'괜찮다고 한다.',99,NULL,97,NULL),(137,'여행을 계속한다.',NULL,NULL,98,NULL),(138,'여행을 계속한다.',NULL,NULL,99,NULL),(139,'\"거북이..?\"',101,NULL,100,NULL),(140,'\"누구세요..?\"',101,NULL,100,NULL),(141,'\"제가 갈 길이 바빠서 이만..\"',102,NULL,101,NULL),(142,'\"네 좋아요.\"',103,NULL,101,NULL),(143,'여행을 계속한다.',NULL,NULL,102,NULL),(144,'\"아기돼지 삼형제요!\"',104,1,103,2),(145,'\"브레멘 음악대요!\"',105,1,103,7),(146,'\"미운 오리 새끼요!\"',106,1,103,6),(147,'\"명심할게요!\"',107,NULL,104,NULL),(148,'\"명심할게요!\"',107,NULL,105,NULL),(149,'\"명심할게요!\"',107,NULL,106,NULL),(150,'\"...거북 할아버지는 느림보 아니야 말 조심 해.\"',108,NULL,107,NULL),(151,'\"...할아버지 죄송해요...\"',109,NULL,107,NULL),(152,'\"죽음이요?\"',110,1,108,7),(153,'\"무서운 말씀 하지 마세요..\"',111,1,108,4),(154,'여행을 계속한다.',NULL,NULL,109,NULL),(155,'여행을 계속한다.',NULL,NULL,110,NULL),(156,'여행을 계속한다.',NULL,NULL,111,NULL),(157,'주위 사람들에게 물어본다.',113,1,112,6),(158,'혼자 돌아다니며 단서를 찾는다.',114,1,112,3),(159,'광장에서 소리쳐 불러본다.',115,1,112,9),(160,'다음',116,NULL,113,NULL),(161,'다가간다',116,NULL,114,NULL),(162,'다음',116,NULL,115,NULL),(163,'다음',117,NULL,116,NULL),(164,'네 구해볼게요!',118,NULL,117,NULL),(165,'마을 식당 안의 요리사에게 물어본다.',119,1,118,6),(166,'마을 옆의 서쪽 숲 속으로 걸어가 본다.',124,1,118,1),(167,'마을 안의 시장에서 구해본다.',129,1,118,2),(168,'네 좋아요!',120,NULL,119,NULL),(169,'밀가루를 들고 다시 요리사에게 가본다.',121,1,120,1),(170,'요리사에게 밀가루를 건네 준다.',122,NULL,121,NULL),(171,'꿀을 들고 다시 르노 삼촌에게 간다.',123,1,122,6),(172,'다음',125,NULL,124,NULL),(173,'꿀벌들에게 다가가 부탁해본다.',126,1,125,5),(174,'꿀벌들 몰래 꿀벌 집 안의 꿀을 훔친다.',128,1,125,3),(175,'르노 삼촌에게 돌아간다.',123,1,126,6),(176,'조금 맛을 본다.',127,1,126,7),(177,'르노 삼촌에게 돌아간다.',123,1,127,2),(178,'르노 삼촌에게 돌아간다.',123,1,128,6),(179,'르노 삼촌에게 돌아간다.',123,1,129,6),(180,'여행을 계속한다.',NULL,NULL,123,NULL),(181,'기웃 기웃',131,NULL,130,NULL),(182,'여기서 뭐 하고 계세요?',131,NULL,130,NULL),(183,'중요한 날이요?',132,NULL,131,NULL),(184,'걱정 마세요. 제가 도움을 드릴게요.',133,NULL,132,NULL),(185,'그래요. 시간이 걸려도 사랑은 스스로의 힘으로 쟁취해야죠.',134,1,132,5),(186,'여행을 계속한다.',NULL,NULL,134,NULL),(187,'먼저 가서 잘 있는지만 확인하면 되는거죠? 알겠어요!',135,NULL,133,NULL),(188,'돌을 던져서 애벌레를 쫓아내자!',136,1,135,8),(189,'누구라도 좋으니까 도와줘!!',137,1,135,2),(190,'나무를 흔들어서 애벌레를 떨어뜨리자.',138,-1,135,11),(191,'여행을 계속한다.',NULL,NULL,138,NULL),(192,'휴, 다행히 사과를 지켜냈다!',139,NULL,136,NULL),(193,'휴, 어찌됐든 사과를 지켜냈어!',139,NULL,137,NULL),(194,'다음은 벌집인가!',140,NULL,139,NULL),(195,'불곰의 경로에 미리 함정을 파 놓자!',141,1,140,4),(196,'불곰이 흥미를 가질만한 다른 것이 없을까?',142,1,140,9),(197,'불곰을 직접 유인해보자!',143,1,140,3),(198,'여행을 계속한다.',NULL,NULL,143,NULL),(199,'이제 반달곰을 지켜봐주자',144,1,141,7),(200,'이제 반달곰을 지켜봐주자',144,1,142,7),(201,'여행을 계속한다.',NULL,NULL,144,NULL),(202,'왜 울고 있는지 물어보자!',147,NULL,145,NULL),(203,'왠지 골치 아픈 일에 휘말릴 것 같은데.. 그냥 가자.',146,1,145,4),(204,'여행을 계속한다.',NULL,NULL,146,NULL),(205,'여우가 있는 곳으로 안내해 주세요',148,NULL,147,NULL),(206,'말도 안 돼! 분명 오른쪽이었는데?',149,NULL,148,NULL),(207,'우선 정보수집이 먼저다. 조용히 야바위를 지켜보자.',150,1,149,2),(208,'사기 행각을 보고 가만히 있을 수 없어! 당장 따지자!',151,1,149,11),(209,'여행을 계속한다.',NULL,NULL,151,NULL),(210,'이런 들켰나..!',152,NULL,150,NULL),(211,'맞아요, 당장 쥐들을 구해내요!',153,1,152,5),(212,'아니, 일단은 내일을 도모하죠.',155,1,152,2),(213,'이 쥐들이 증언 하면 되잖아!',154,1,153,11),(214,'여행을 계속한다.',NULL,NULL,154,NULL),(215,'흐음, 컵 안에 쥐들이 있다면 당장 경비대를 불러야겠는 걸?',156,NULL,155,NULL),(216,'고마워요, 감사히 잘 쓸게요.',157,1,156,10),(217,'이런 걸 원하고 한 게 아니에요.',158,1,156,6),(218,'여행을 계속한다.',NULL,NULL,157,NULL),(219,'여행을 계속한다.',NULL,NULL,158,NULL),(220,'불법 광고는 제거해야지',161,1,159,11),(221,'무슨 서커스야... 가던 길이나 가자',160,NULL,159,NULL),(222,'내가 발재주는 있지',162,1,159,5),(223,'여행을 계속한다.',NULL,NULL,160,NULL),(224,'여행을 계속한다.',NULL,NULL,161,NULL),(225,'안녕하세요... 서커스단 하고 싶어서 찾아왔어요.',165,NULL,162,NULL),(226,'신입 받아라',163,1,162,9),(227,'잘못 들어왔습니다.',164,1,162,4),(228,'공 물어오기요!',166,NULL,163,NULL),(229,'외발자전거 타기요!',167,NULL,163,NULL),(230,'저글링이요!',168,NULL,163,NULL),(231,'공 물어오기요!',166,NULL,164,NULL),(232,'외발자전거 타기요!',167,NULL,164,NULL),(233,'저글링이요!',168,NULL,164,NULL),(234,'공 물어오기요!',166,NULL,165,NULL),(235,'외발자전거 타기요!',167,NULL,165,NULL),(236,'저글링이요!',168,NULL,165,NULL),(237,'여행을 계속한다.',NULL,NULL,166,NULL),(238,'외발자전거랑 잡초 뽑기가 무슨 상관이 있는 거죠? 부당해요!',169,1,167,5),(239,'네! 바로 나가서 뽑겠습니다!',171,NULL,167,NULL),(240,'여행을 계속한다.',NULL,NULL,168,NULL),(241,'죄송하지만 이건 아닌 것 같아요. 실례했습니다.',170,NULL,169,NULL),(242,'잡초를 뽑으면서 체력을 기르겠습니다.',171,NULL,169,NULL),(243,'여행을 계속한다.',NULL,NULL,170,NULL),(244,'양말',172,1,171,8),(245,'모종삽',176,1,171,2),(246,'잡초를 관찰한다.',177,1,171,4),(247,'네!',173,NULL,172,NULL),(248,'성공한 기념으로 쉬자',174,1,173,6),(249,'연습을 더 하자',175,1,173,8),(250,'여행을 계속한다.',NULL,NULL,174,NULL),(251,'여행을 계속한다.',NULL,NULL,175,NULL),(252,'네!',173,NULL,176,NULL),(253,'말한다.',178,1,177,1),(254,'몰래 판다.',179,1,177,10),(255,'네!',173,NULL,178,NULL),(256,'여행을 계속한다.',NULL,NULL,179,NULL),(257,'무시하고 지나간다.',181,NULL,180,NULL),(258,'도전하기 위해 동굴을 향해 걸어간다.',182,NULL,180,NULL),(259,'여행을 계속한다.',NULL,NULL,181,NULL),(260,'안전을 스스로 챙겨야한다고...? 도전하지 말자',181,NULL,182,NULL),(261,'제가 도전하겠습니다.',183,1,182,6),(262,'동굴 안으로 들어간다.',184,1,183,5),(263,'도망간다.',181,NULL,183,NULL),(264,'1이 적혀있는 버튼을 누른다.',185,NULL,184,NULL),(265,'2이 적혀있는 버튼을 누른다.',185,NULL,184,NULL),(266,'3이 적혀있는 버튼을 누른다.',186,1,184,2),(267,'여행을 계속한다.',NULL,NULL,185,NULL),(268,'석판에 1을 쓴다.',185,NULL,186,NULL),(269,'석판에 true를 쓴다.',185,NULL,186,NULL),(270,'석판에 True를 쓴다.',187,1,186,4),(271,'64',185,NULL,187,NULL),(272,'36',188,1,187,10),(273,'20',185,NULL,187,NULL),(274,'여행을 계속한다.',NULL,NULL,188,NULL),(275,'가본다.',191,NULL,189,NULL),(276,'지나친다.',190,NULL,189,NULL),(277,'여행을 계속한다.',NULL,NULL,190,NULL),(278,'술래잡기를 한다.',192,1,191,3),(279,'목마를 태워준다.',193,1,191,1),(280,'모래성을 만든다.',194,1,191,8),(281,'아기 고양이가 즐거워해서 다행이다.',195,NULL,192,NULL),(282,'아기 고양이가 즐거워해서 다행이다.',195,NULL,193,NULL),(283,'아기 고양이가 즐거워해서 다행이다.',195,NULL,194,NULL),(284,'솜사탕 장수를 똘망똘망 쳐다본다.',196,NULL,195,NULL),(285,'근처 아이들에게 홍보한다.',197,1,195,9),(286,'여행을 계속한다.',NULL,NULL,196,NULL),(287,'여행을 계속한다.',NULL,NULL,197,NULL),(288,'위험할 것 같은데.. 가지말자.',199,-1,198,11),(289,'얼른 구하러 가자!',200,NULL,198,NULL),(290,'여행을 계속한다.',NULL,NULL,199,NULL),(291,'어쩌긴, 바로 뛰어들어 구하자!',201,1,200,7),(292,'주변에 도움을 요청한다.',202,1,200,9),(293,'주변에 던져 줄 만한 것을 찾아본다.',203,1,200,4),(294,'여행을 계속한다.',NULL,NULL,201,NULL),(295,'아무나 도와주세요!',201,1,202,7),(296,'뭍으로 나오길 기다리자.',204,1,203,10),(297,'여행을 계속한다.',NULL,NULL,204,NULL),(298,'바다 구경도 할겸 가본다.',207,NULL,205,NULL),(299,'산신견님은 산에 계신다고 하니 그냥 지나친다.',206,NULL,205,NULL),(300,'여행을 계속한다.',NULL,NULL,206,NULL),(301,'서핑을 타본다.',209,NULL,207,NULL),(302,'조용히 바다만 구경한다.',208,NULL,207,NULL),(303,'여행을 계속한다.',NULL,NULL,208,NULL),(304,'가서 말을 걸어본다.',211,1,209,5),(305,'그냥 혼자 쉰다.',210,NULL,209,NULL),(306,'여행을 계속한다.',NULL,NULL,210,NULL),(307,'네 좋아요',212,NULL,211,NULL),(308,'알겠어요 한 번 더 해볼게요!',214,1,212,1),(309,'전 이제 못하겠어요..',213,NULL,212,NULL),(310,'여행을 계속한다.',NULL,NULL,213,NULL),(311,'여행을 계속한다.',NULL,NULL,214,NULL),(312,'생각할 필요도 없다. 무서우니 도망가자',216,1,215,3),(313,'그림자야',217,1,215,5),(314,'신기루야',219,1,215,2),(315,'여행을 계속한다.',NULL,NULL,216,NULL),(316,'도망가자',216,1,217,3),(317,'창문을 열어보자',218,NULL,217,NULL),(318,'여행을 계속한다.',NULL,NULL,218,NULL),(319,'신기루를 무시하고 잔다.',220,NULL,219,NULL),(320,'창문을 열어 환기하자',218,NULL,219,NULL),(321,'여행을 계속한다.',NULL,NULL,220,NULL),(322,'감미로운 발라드로 부탁해요.',222,1,221,7),(323,'신나는 댄스곡으로 부탁해요.',223,1,221,7),(324,'여행을 계속한다.',NULL,NULL,222,NULL),(325,'여행을 계속한다.',NULL,NULL,223,NULL),(326,'힘껏 짖어서 코를 납작하게 하자',225,1,224,9),(327,'목소리를 깔고 위엄 있게 비키라고 하자',226,1,224,5),(328,'여행을 계속한다.',NULL,NULL,225,NULL),(329,'여행을 계속한다.',NULL,NULL,226,NULL),(330,'마을까지 빠르게 뛰어간다.',228,1,227,3),(331,'비를 피할 곳이 없나 살펴본다.',229,1,227,4),(332,'여행을 계속한다.',NULL,NULL,228,NULL),(333,'여행을 계속한다.',NULL,NULL,229,NULL),(334,'그래도 돈이 있어야겠죠?',231,1,230,6),(335,'명예로운 삶이 가치 있죠?',232,1,230,10),(336,'여행을 계속한다.',NULL,NULL,231,NULL),(337,'여행을 계속한다.',NULL,NULL,232,NULL),(338,'아기들은 눈치 못 챌 기술로 손 쉽게 승리한다.',234,1,233,8),(339,'정정당당히 실력으로 이겨준다.',235,1,233,11),(340,'여행을 계속한다.',NULL,NULL,234,NULL),(341,'여행을 계속한다.',NULL,NULL,235,NULL),(342,'아이들이 하지 못하도록 막는다.',237,1,236,11),(343,'나의 엄청난 실력을 보여준다.',238,-1,236,11),(344,'여행을 계속한다.',NULL,NULL,237,NULL),(345,'여행을 계속한다.',NULL,NULL,238,NULL),(346,'와, 이건 온천욕을 하는 카피바라씨를 그린 것이군요!',240,NULL,239,NULL),(347,'와, 이건 물 먹는 하마씨를 그린 것이군요!',241,NULL,239,NULL),(348,'여행을 계속한다.',NULL,NULL,240,NULL),(349,'여행을 계속한다.',NULL,NULL,241,NULL),(350,'폭포를 맞으며 도를 닦아본다.',243,1,242,9),(351,'폭포 밑 계곡에서 물장구를 친다.',244,NULL,242,NULL),(352,'여행을 계속한다.',NULL,NULL,243,NULL),(353,'여행을 계속한다.',NULL,NULL,244,NULL),(354,'<천방지축 멍개는 못말려!>',246,NULL,245,NULL),(355,'<지금 당신에게 필요한 것은 유머! 깔깔 유머집>',246,NULL,245,NULL),(356,'<당신도 할 수 있다! 자바 프로그래밍!>',247,1,245,2),(357,'여행을 계속한다.',NULL,NULL,246,NULL),(358,'여행을 계속한다.',NULL,NULL,247,NULL),(359,'근처 마을로 돌아가 조언을 구한다.',249,NULL,248,NULL),(360,'죽기 살기로 건너본다.',250,1,248,5),(361,'다른 다리를 찾아서 건넌다.',249,NULL,248,NULL),(362,'여행을 계속한다.',NULL,NULL,249,NULL),(363,'여행을 계속한다.',NULL,NULL,250,NULL),(364,'저도 바빠서요.',252,NULL,251,NULL),(365,'무슨일이죠?',253,NULL,251,NULL),(366,'여행을 계속한다.',NULL,NULL,252,NULL),(367,'네, 돌봐드리겠습니다.',254,1,253,6),(368,'제가 바빠서요.',252,NULL,253,NULL),(369,'콩나물이 햇빛을 받을 수 있도록 검정색 통 밖으로 뺀다.',255,NULL,254,NULL),(370,'콩나물을 검정색 통 안에 그대로 둔다.',256,1,254,10),(371,'여행을 계속한다.',NULL,NULL,255,NULL),(372,'여행을 계속한다.',NULL,NULL,256,NULL),(373,'무시하고 지나간다.',258,NULL,257,NULL),(374,'참여한다.',259,NULL,257,NULL),(375,'화관',260,NULL,259,NULL),(376,'리본 넥타이',261,NULL,259,NULL),(377,'베레모',262,NULL,259,NULL),(378,'여행을 계속한다.',NULL,NULL,258,NULL),(379,'난 다른 소품 사용할게',263,1,260,6),(380,'난 다른 소품 사용할게',263,1,261,6),(381,'난 다른 소품 사용할게',263,1,262,6),(382,'내가 먼저 집었는데?',265,NULL,260,NULL),(383,'내가 먼저 집었는데?',265,NULL,261,NULL),(384,'내가 먼저 집었는데?',265,NULL,262,NULL),(385,'분장을 마치고 무대로 나간다.',264,1,263,7),(386,'여행을 계속한다.',NULL,NULL,264,NULL),(387,'강아지가 선택한 소품은 다른 동물들과 겹쳐서 큰 호응을 얻지 못했다.\n\n강아지는 패션 대회에서 저조한 성적을 얻었고, 아쉬운 마음과 함께 가야 할 길을 향해 떠났다.',266,NULL,265,NULL),(388,'여행을 계속한다.',NULL,NULL,266,NULL),(389,'안 사요.',268,NULL,267,NULL),(390,'정말요? 살래요!',269,1,267,4),(391,'이거 정품 맞아요?',270,1,267,2),(392,'여행을 계속한다.',NULL,NULL,268,NULL),(393,'여행을 계속한다.',NULL,NULL,269,NULL),(394,'구매할래요!',271,NULL,270,NULL),(395,'실물을 보고 싶어요.',272,1,270,3),(396,'여행을 계속한다.',NULL,NULL,271,NULL),(397,'여행을 계속한다.',NULL,NULL,272,NULL),(398,'무시하고 지나간다.',274,NULL,273,NULL),(399,'무슨 일이죠?',275,NULL,273,NULL),(400,'당연하죠. 전 브레멘 음악대의 팬이에요.',276,NULL,273,NULL),(401,'여행을 계속한다.',NULL,NULL,274,NULL),(402,'죄송해요. 부담스러워요',277,NULL,275,NULL),(403,'죄송해요. 부담스러워요',277,NULL,276,NULL),(404,'한번 해보겠습니다.',278,1,275,8),(405,'한번 해보겠습니다.',278,1,276,8),(406,'여행을 계속한다.',NULL,NULL,277,NULL),(407,'네',279,1,278,9),(408,'아니요. 한 번 더 알려주세요',280,1,278,8),(409,'여행을 계속한다.',NULL,NULL,279,NULL),(410,'그냥 지나간다.',282,-1,281,11),(411,'주워서 쓰레기통에 버린다.',283,NULL,281,NULL),(412,'여행을 계속한다.',NULL,NULL,282,NULL),(413,'자전거를 분해해서 분리수거를 한다.',284,1,283,8),(414,'그냥 쓰레기통에 버린다.',287,1,283,1),(415,'무시하고 지나간다.',NULL,NULL,283,NULL),(416,'부품들을 마을에 기부한다.',285,1,284,11),(417,'부품들을 판매한다.',286,1,284,10),(418,'여행을 계속한다.',NULL,NULL,285,NULL),(419,'여행을 계속한다.',NULL,NULL,286,NULL),(420,'여행을 계속한다.',NULL,NULL,287,NULL),(421,'여행을 계속한다.',NULL,NULL,288,NULL),(422,'실내에 가장 따뜻한 탕으로 들어갈래!',290,1,289,1),(423,'꽃잎을 띄워놔서 향기로운 탕으로 들어갈래!',291,1,289,6),(424,'찬 공기와 뜨거운 물의 콜라보, 노천탕에 들어갈래!',292,1,289,7),(425,'이제 방으로 가자!',293,NULL,290,NULL),(426,'이제 방으로 가자!',293,NULL,291,NULL),(427,'이제 방으로 가자!',293,NULL,292,NULL),(428,'목욕을 했더니 배가 고파! 식당부터 갈래',294,1,293,8),(429,'기분도 좋아졌는데 노래방에 가고싶어!',295,1,293,9),(430,'심심하니까 오락실에 가고싶어!',296,1,293,8),(431,'이제 방으로 가자!',297,NULL,294,NULL),(432,'이제 방으로 가자!',297,NULL,295,NULL),(433,'이제 방으로 가자!',297,NULL,296,NULL),(434,'여행을 계속한다.',NULL,NULL,297,NULL),(435,'근처 수풀 사이를 찾아본다.',300,1,298,4),(436,'피아노 안쪽을 찾아본다.',302,1,298,7),(437,'앵무새의 주머니를 뒤져본다.',299,NULL,298,NULL),(438,'여행을 계속한다.',NULL,NULL,299,NULL),(439,'공연을 할 수 있도록 전해주자!',301,1,300,6),(440,'여행을 계속한다.',NULL,NULL,301,NULL),(441,'안 되겠다. 늦기 전에 업어서라도 공연장으로 데려가자.',303,1,302,6),(442,'여행을 계속한다.',NULL,NULL,303,NULL),(443,'꽃이 많을 것 같은 들판 쪽으로 가보자.',305,1,304,2),(444,'예쁜 꽃이 있을 것 같은 물가 쪽으로 가보자.',307,1,304,3),(445,'이제 뼈다귀를 찾아보자!',306,NULL,305,NULL),(446,'휴, 이제 뼈다귀를 찾아보자.',306,NULL,307,NULL),(447,'근처 강아지에게 뼈다귀 결투를 신청하자!',308,1,306,8),(448,'근처 고목나무 근처 땅을 파볼까?',309,1,306,4),(449,'멋진 승부였다! 이제 참배하러 가자.',310,NULL,308,NULL),(450,'좋았어. 이제 참배하러 가자.',310,NULL,309,NULL),(451,'여행을 계속한다.',NULL,NULL,310,NULL),(452,'무엇을 짓고 계시는 거죠?',313,NULL,311,NULL),(453,'바쁘다는 데 빨리 지나가자',312,NULL,311,NULL),(454,'여행을 계속한다.',NULL,NULL,312,NULL),(455,'집을 직접 고쳐볼게요!',314,1,313,8),(456,'나무를 구해 와 볼게요.',315,1,313,5),(457,'벌써 해가 지려고 하다니!',316,1,314,8),(458,'좋아, 해가 지기 전에 돌아가자!',316,1,315,8),(459,'여행을 계속한다.',NULL,NULL,316,NULL),(460,'짜릿한 속도감! 롤러코스터에 도전한다.',318,1,317,5),(461,'엄청난 높이! 드롭 타워에 도전한다.',319,1,317,7),(462,'용기의 대명사! 귀신의 집에 도전한다.',320,1,317,3),(463,'역시.. 타던 거 타자.',321,NULL,318,NULL),(464,'역시.. 타던 거 타자.',321,NULL,319,NULL),(465,'역시.. 타던 거 타자.',321,NULL,320,NULL),(466,'양 쪽 가게를 경쟁을 붙여보자',322,1,321,2),(467,'나처럼 둘 다 먹고 싶어하는 동물 없나..?',323,1,321,4),(468,'그냥 얌전하게 하나만 먹자.',324,NULL,321,NULL),(469,'아~ 배부르다.',325,NULL,322,NULL),(470,'아~ 잘 먹었다.',325,NULL,323,NULL),(471,'나중에 다른 것도 꼭 먹어야지',325,NULL,324,NULL),(472,'여행을 계속한다.',NULL,NULL,325,NULL),(473,'원초를 말하며, 천지는 나뉘고, 무(無)는 개벽을 축복한다. 세계를 가르는 것은 나의 괴리검. 별들을 돌리는 소용돌이, 천상의 지옥이란 창세전야의 종착이니라. 죽음으로써 잠들도록 하라. 『천지를 괴리하는 개벽의 별 에누마 엘리시』!',327,1,326,6),(474,'도.. 도망쳐!',328,NULL,326,NULL),(475,'여행을 계속한다.',NULL,NULL,327,NULL),(476,'여행을 계속한다.',NULL,NULL,328,NULL),(477,'역시 미래 기술은 IT! IT에 넣어보죠',330,1,329,10),(478,'고령화 시대에는 의료! 의료에 넣어보죠',331,NULL,329,NULL),(479,'원래 투자는 장기적인 법! 우주산업에 넣어보죠',331,NULL,329,NULL),(480,'여행을 계속한다.',NULL,NULL,330,NULL),(481,'여행을 계속한다.',NULL,NULL,331,NULL),(482,'팬들에게 붙잡혀 준다.',333,NULL,332,NULL),(483,'여행길이 바쁜데 붙잡힐 수 없어. 도망가자!',334,1,332,3),(484,'여행을 계속한다.',NULL,NULL,333,NULL),(485,'여행을 계속한다.',NULL,NULL,334,NULL),(486,'케..케이크?',336,1,335,4),(487,'마.. 마시멜로우?',337,NULL,335,NULL),(488,'여행을 계속한다.',NULL,NULL,336,NULL),(489,'여행을 계속한다.',NULL,NULL,337,NULL),(490,'어려워도 예쁜 꽃 모양으로 해볼래요.',339,1,338,7),(491,'그래도 할 만한 별 모양으로 해볼래요.',340,1,338,8),(492,'여행을 계속한다.',NULL,NULL,339,NULL),(493,'여행을 계속한다.',NULL,NULL,340,NULL),(494,'와 완전 저랑 똑 닮았어요! 감사합니다.',342,-1,341,11),(495,'저랑 하나도 안 닮았는데요..',343,1,341,11),(496,'여행을 계속한다.',NULL,NULL,342,NULL),(497,'여행을 계속한다.',NULL,NULL,343,NULL),(498,'음, 설명서를 보고 차근차근 해보죠.',345,1,344,2),(499,'음, 이 부분 크기가 비슷한데 한 번 맞춰보죠?',346,1,344,4),(500,'여행을 계속한다.',NULL,NULL,345,NULL),(501,'여행을 계속한다.',NULL,NULL,346,NULL),(502,'역시 남자는 여자를 멋지게 리드할 줄 알아야 하지 않을까요?',348,1,347,5),(503,'역시 남자는 여자의 마음을 섬세하게 들여봐 줘야 하지 않을까요?',349,1,347,4),(504,'여행을 계속한다.',NULL,NULL,348,NULL),(505,'여행을 계속한다.',NULL,NULL,349,NULL),(506,'새끼 오리들을 건너편으로 옮겨주자',351,1,350,1),(507,'근처에 쓸만한 게 없을 지 찾아보자',352,1,350,2),(508,'여행을 계속한다.',NULL,NULL,351,NULL),(509,'여행을 계속한다.',NULL,NULL,352,NULL),(510,'눈길도 주지 않고 지나간다.',354,1,353,5),(511,'적당히 칭찬해 주면서 지나간다.',355,1,353,6),(512,'여행을 계속한다.',NULL,NULL,354,NULL),(513,'여행을 계속한다.',NULL,NULL,355,NULL),(514,'뭐지? 뭔가 불길한데?',357,1,356,4),(515,'부끄러움이 많은 게들이구나.',358,1,356,3),(516,'나도 뒷발차기로 땅을 파보자!',358,1,356,3),(517,'여행을 계속한다.',NULL,NULL,357,NULL),(518,'여행을 계속한다.',NULL,NULL,358,NULL),(519,'둘 모두의 것이니까 반반씩 나눠가지는 것 어떨까요?',360,1,359,2),(520,'돈 주머니에 찍힌 발자국을 살펴보는 것은 어떨까요?',361,1,359,11),(521,'여행을 계속한다.',NULL,NULL,360,NULL),(522,'여행을 계속한다.',NULL,NULL,361,NULL),(523,'제가 한 번 고쳐볼게요.',363,1,362,8),(524,'제가 사자에게 잘 말해볼게요.',364,1,362,5),(525,'여행을 계속한다.',NULL,NULL,363,NULL),(526,'여행을 계속한다.',NULL,NULL,364,NULL),(527,'저도 선수로 참여해보겠습니다!',366,1,365,3),(528,'저는 응원단장을 맡겠습니다!',367,1,365,9),(529,'여행을 계속한다.',NULL,NULL,366,NULL),(530,'여행을 계속한다.',NULL,NULL,367,NULL),(531,'코알라랑 도미노를 한다.',369,1,368,8),(532,'코알라랑 술래잡기를 한다',370,1,368,3),(533,'여행을 계속한다.',NULL,NULL,369,NULL),(534,'여행을 계속한다.',NULL,NULL,370,NULL),(535,'음, 역시 요리는 신선한 재료 아닐까요?',373,NULL,371,NULL),(536,'음, 역시 요리는 발맛 아닐까요?',372,1,371,8),(537,'음, 역시 요리는 적절한 간과 조미료 아닐까요?',373,NULL,371,NULL),(538,'여행을 계속한다.',NULL,NULL,372,NULL),(539,'여행을 계속한다.',NULL,NULL,373,NULL),(540,'네',279,1,280,9);
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `seller_id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  PRIMARY KEY (`seller_id`),
  KEY `FK8xy0y20dnm987syb4xvpkglab` (`member_id`),
  CONSTRAINT `FK8xy0y20dnm987syb4xvpkglab` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'STOUTNESS'),(2,'CLEVER'),(3,'QUICK'),(4,'INTUITION'),(5,'CHARISMA'),(6,'POPULARITY'),(7,'SENSIBILITY'),(8,'FOOTWORK'),(9,'VOICE'),(10,'WEALTH'),(11,'JUSTICE');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `story` (
  `story_id` bigint NOT NULL AUTO_INCREMENT,
  `first_scene` bigint NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`story_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (1,1,'Start.jpg','아기 강아지','START'),(2,7,'Ohmygod.jpg','산신견','END'),(3,9,'Milkyway.png','은하수','SHORT'),(4,12,'Climbing.png','등산','SHORT'),(5,15,'Smartbox.png','영리한 자만이 배부름을 누릴 수 있다.','SHORT'),(6,20,'Oldhouse.png','버려진 집','SHORT'),(7,23,'Threecats.png','아기 고양이 삼형제','SHORT'),(8,26,'Honeycomb.png','벌집','SHORT'),(9,29,'Wisp.png','도깨비 불(?)','SHORT'),(10,32,'Gilchi.png','길치','SHORT'),(11,35,'Godjoke.png','신의 장난','SHORT'),(12,38,'Bully.png','뒤져서 나오면..','SHORT'),(13,41,'Lastapple.png','마지막 사과','SHORT'),(14,44,'Flyingdisk.png','원반던지기','SHORT'),(15,47,'Fruitsales.png','과일과 과일 장수','SHORT'),(16,51,'Movehometown.png','마을 입구','SHORT'),(17,54,'Grandfa.jpg','할아버지의 낡은 시계','LONG'),(18,67,'Tiger.jpg','호랑이 장가가는 날','LONG'),(19,88,'Potato.jpg','감자밭과 농사꾼','NORMAL'),(20,100,'Turtle.jpg','저마다의 속도','LONG'),(21,112,'Leuno.jpg','르노 삼촌의 고민거리','LONG'),(22,130,'Bear.jpg','특명! 멍피트!','LONG'),(23,145,'Fox.jpg','눈이 손보다 빠르다','LONG'),(24,159,'Bicycle.jpg','서커스단 입단?','LONG'),(25,180,'Cave.jpg','동굴 탈출 도전','LONG'),(26,189,'Kitten.jpg','아기 고양이는 심심해','NORMAL'),(27,198,'Goat.jpg','SOS 수상구조대','NORMAL'),(28,205,'Surfing.jpg','I\'m such a good surfer','NORMAL'),(29,215,'Ghost.jpg','강아지 귀신?','NORMAL'),(30,221,'Busking.png','버스킹','SHORT'),(31,224,'Eyepressure.png','기선제압','SHORT'),(32,227,'Rain.png','소나기','SHORT'),(33,230,'Dogvalues.png','가치관','SHORT'),(34,233,'Tigercard.png','지나가고 싶으면..','SHORT'),(35,236,'Stoneskipping.png','물수제비','SHORT'),(36,239,'Badpainter.png','떠돌이 화가','SHORT'),(37,242,'Waterfall.png','폭포','SHORT'),(38,245,'Bookstore.png','서점','SHORT'),(39,248,'Bridge.png','흔들다리','SHORT'),(40,251,'Squirrel.jpg','농장 알바','NORMAL'),(41,257,'Fashion.jpg','패션왕','NORMAL'),(42,267,'Telescope.jpg','벼룩시장','NORMAL'),(43,273,'Tambourine.jpg','일일 밴드','NORMAL'),(44,281,'Trash.jpg','환경 지키미','NORMAL'),(45,289,'Snow.jpg','온천','NORMAL'),(46,298,'Parrot.jpg','멍토벤','NORMAL'),(47,304,'Gargoyle.jpg','멍멍신상 참배','NORMAL'),(48,311,'Hamster.jpg','수해 복구','NORMAL'),(49,317,'Themepark.jpg','놀이 공원','NORMAL'),(50,326,'jung2.jpg','중2병','SHORT'),(51,329,'Stock.jpg','주식투자','SHORT'),(52,332,'Fan.jpg','팬클럽','SHORT'),(53,335,'Panda.jpg','나를 맞춰 봐','SHORT'),(54,338,'Dalgona.jpg','달고나','SHORT'),(55,341,'Owl.jpg','조각 실력','SHORT'),(56,344,'Monkey.jpg','프라모델','SHORT'),(57,347,'Guinea.jpg','남자에게 필요한 건..','SHORT'),(58,350,'Duck.jpg','오리 가족','SHORT'),(59,353,'Peacock.jpg','나르시스트','SHORT'),(60,356,'Crab.jpg','갯벌','SHORT'),(61,359,'Giraffe.jpg','멍로몬의 선택','SHORT'),(62,362,'Bowl.jpg','사자의 밥그릇','SHORT'),(63,365,'Sports.jpg','체육 대회','SHORT'),(64,368,'Koala.jpg','손주','SHORT'),(65,371,'Pig.jpg','진정한 맛','SHORT');
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade` (
  `trade_id` bigint NOT NULL AUTO_INCREMENT,
  `cancel` varchar(255) NOT NULL,
  `contract_id` bigint NOT NULL,
  `end_price` bigint DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `nego_able` varchar(255) NOT NULL,
  `start_price` bigint NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `state` varchar(255) NOT NULL,
  `buyer_id` bigint DEFAULT NULL,
  `nft_id` bigint DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  PRIMARY KEY (`trade_id`),
  UNIQUE KEY `UK_f6bynm0rmv4m4pksuy7puoc7x` (`contract_id`),
  KEY `FKpils00e6wef8o46fbbpox9cv0` (`buyer_id`),
  KEY `FK5jsk62a7pcmxcue8083h1fsry` (`nft_id`),
  KEY `FKfmfm6dno2mrhmp9p56x47sb3h` (`seller_id`),
  CONSTRAINT `FK5jsk62a7pcmxcue8083h1fsry` FOREIGN KEY (`nft_id`) REFERENCES `nft` (`nft_id`),
  CONSTRAINT `FKfmfm6dno2mrhmp9p56x47sb3h` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`),
  CONSTRAINT `FKpils00e6wef8o46fbbpox9cv0` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 11:24:07
