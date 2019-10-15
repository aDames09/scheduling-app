-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: craft3
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `craft_assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assets`
--

DROP TABLE IF EXISTS `craft_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assets_folderId_idx` (`folderId`),
  KEY `craft_assets_volumeId_idx` (`volumeId`),
  KEY `craft_assets_volumeId_keptFile_idx` (`volumeId`,`keptFile`),
  CONSTRAINT `craft_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assets`
--

LOCK TABLES `craft_assets` WRITE;
/*!40000 ALTER TABLE `craft_assets` DISABLE KEYS */;
INSERT INTO `craft_assets` VALUES (7,1,3,'facebook.svg','image',15,31,945,NULL,NULL,NULL,'2018-05-14 18:48:21','2018-05-14 18:48:21','2018-05-14 18:48:21','66887ccd-b22d-4d7b-94bb-d0dd5e0301fa'),(9,1,3,'New-Homepage-5-1440x500-1.jpg','image',1440,500,123096,NULL,NULL,NULL,'2018-05-14 19:22:54','2018-05-14 19:22:54','2018-05-14 19:22:54','6bac54a2-4e05-418a-896a-6fce424bf496');
/*!40000 ALTER TABLE `craft_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
INSERT INTO `craft_assettransformindex` VALUES (1,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_landscapeExtraLarge',1,1,0,'2018-05-14 19:23:18','2018-05-14 19:23:18','2018-05-14 19:23:19','9d4d6987-ea23-41eb-b8cc-4e7f6397c0a2'),(2,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_landscapeLarge',1,1,0,'2018-05-14 19:23:18','2018-05-14 19:23:18','2018-05-14 19:23:19','1f2c21d7-3190-4baa-bb50-1191be2f5330'),(3,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_landscapeMedium',1,1,0,'2018-05-14 19:23:18','2018-05-14 19:23:18','2018-05-14 19:23:19','3c59ea52-16c4-4939-b313-5577947a84c2'),(4,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_landscapeSmall',1,1,0,'2018-05-14 19:23:18','2018-05-14 19:23:18','2018-05-14 19:23:19','aec60d99-07c6-4991-9633-01429d677f7c'),(5,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_standardSmall',1,1,0,'2018-05-14 20:30:13','2018-05-14 20:30:13','2018-05-14 20:30:14','5c22c641-7691-4662-a494-a255957a7a09'),(6,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_standardMedium',1,1,0,'2018-05-14 20:30:13','2018-05-14 20:30:13','2018-05-14 20:30:14','e15e3637-fac0-44a8-b7c6-59ce3b710d65'),(7,9,'New-Homepage-5-1440x500-1.jpg',NULL,'_standardLarge',1,1,0,'2018-05-14 20:30:13','2018-05-14 20:30:13','2018-05-14 20:30:14','349d505c-9650-4642-a0af-790461a22ad8');
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
INSERT INTO `craft_assettransforms` VALUES (8,'Standard Large','standardLarge','fit','center-center',800,800,NULL,82,'none','2018-05-14 15:46:08','2018-05-14 15:46:08','2018-05-14 15:46:08','768e4597-9401-4261-ae74-2b72e019e9be'),(9,'Standard Medium','standardMedium','fit','center-center',600,600,NULL,82,'none','2018-05-14 15:46:29','2018-05-14 15:46:29','2018-05-14 15:46:29','f9898e0f-51c4-493f-91e2-dc4f2d2fad3f'),(10,'Standard Small','standardSmall','fit','center-center',400,400,NULL,82,'none','2018-05-14 20:30:09','2018-05-14 20:30:09','2018-05-14 20:30:09','17e4c2fb-e33b-450a-ad55-db54cc20ce8a');
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_idx` (`groupId`),
  KEY `craft_categories_parentId_fk` (`parentId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
INSERT INTO `craft_categories` VALUES (18,1,NULL,NULL,'2018-05-14 20:50:49','2018-05-14 20:50:49','42751fd1-ba7d-43f6-9aff-9fc2c87dbacc');
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categorygroups_structureId_idx` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_categorygroups_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_categorygroups_name_idx` (`name`),
  KEY `craft_categorygroups_handle_idx` (`handle`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
INSERT INTO `craft_categorygroups` VALUES (1,1,1,'Categories','categories','2018-05-11 21:18:44','2018-05-11 21:18:44',NULL,'323d26da-669b-4127-aebc-6b98cebd6f87');
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_sites`
--

DROP TABLE IF EXISTS `craft_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `craft_categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `craft_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_sites`
--

LOCK TABLES `craft_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_sites` DISABLE KEYS */;
INSERT INTO `craft_categorygroups_sites` VALUES (1,1,1,1,'categories/{slug}','editorial/_category.html','2018-05-11 21:18:44','2018-05-11 21:18:44','97682665-b353-434a-a8c7-2771cbcb206b');
/*!40000 ALTER TABLE `craft_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_cloudflare_rules`
--

DROP TABLE IF EXISTS `craft_cloudflare_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_cloudflare_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int(11) NOT NULL,
  `trigger` varchar(255) NOT NULL,
  `urlsToClear` varchar(255) NOT NULL,
  `refresh` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_cloudflare_rules_siteId_fk` (`siteId`),
  CONSTRAINT `craft_cloudflare_rules_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_cloudflare_rules`
--

LOCK TABLES `craft_cloudflare_rules` WRITE;
/*!40000 ALTER TABLE `craft_cloudflare_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_cloudflare_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body` text,
  `field_seo` text,
  `field_address` text,
  `field_copyrightInformation` text,
  `field_email` varchar(255) DEFAULT NULL,
  `field_googleAnalyticsId` text,
  `field_phoneNumber` text,
  `field_blurb` text,
  `field_customTitle` text,
  `field_excerpt` text,
  `field_navigationLink` text,
  `field_defaultField1` varchar(255) DEFAULT NULL,
  `field_linkUrl` text,
  `field_thirdPartyCode` text,
  `field_headline` text,
  `field_alignment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_content_siteId_idx` (`siteId`),
  KEY `craft_content_title_idx` (`title`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,1,NULL,'2018-05-11 17:24:17','2019-04-17 16:01:07','a2d77e3e-70b1-4662-8fa9-574e416d9af0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,'Homepage','2018-05-14 14:59:28','2019-05-16 20:36:28','995ce39d-8bc7-4cb2-a2c9-9537dcb1996c',NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.','Siren Framework',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,NULL,'2018-05-14 15:30:58','2018-05-14 18:48:27','8bd38403-fbf7-489b-bf2d-4d7465cc32e5',NULL,NULL,'[{\"col1\":\"Address Line 1\"},{\"col1\":\"Address Line 2\"}]','Zachary Brady','zachary@suits-sandals.com',NULL,'3155584577',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,1,'Home','2018-05-14 18:29:48','2019-05-16 20:23:46','9ba84b44-4aa6-4089-8df5-7701460fae6a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"}',NULL,NULL,NULL,NULL,NULL),(5,5,1,'Test Page','2018-05-14 18:36:12','2019-05-16 20:14:54','eddb03d0-5030-446b-a1f6-6d631626a2ea',NULL,'{\"titleRaw\":{\"1\":\"Test Page \"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Test Page\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Test Page\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.','My Page',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,6,1,'Privacy Policy','2018-05-14 18:36:43','2019-05-16 20:21:54','4dfa0d50-6a00-4eb0-b834-e8d2e30a4d3d','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\n<p>Proin vulputate venenatis tortor quis lobortis. Proin nec tellus vestibulum, ultrices velit vitae, scelerisque neque. Duis accumsan neque varius tellus convallis, sed cursus eros dictum. Sed vulputate mi et odio eleifend faucibus. Nulla sit amet aliquam quam. Integer cursus ipsum et lectus imperdiet sodales. Etiam luctus malesuada risus, sit amet ultricies felis laoreet sed. Quisque consequat vel nibh at eleifend. Integer mollis a urna id malesuada. Vivamus blandit eget ipsum a sollicitudin. Fusce molestie lorem porta bibendum vehicula. Vivamus sapien sem, malesuada id diam ac, condimentum volutpat neque. Duis quis urna aliquam, auctor ligula quis, tincidunt urna.</p>\n<p>Integer convallis lectus non ex vehicula ultricies. Fusce et dictum enim. Phasellus vel ante sit amet metus porta molestie. Curabitur laoreet metus eu lacus dignissim dignissim. Sed sapien est, consequat eget pharetra et, consectetur vitae lacus. Duis sed blandit magna. Maecenas id elementum purus. Aliquam metus quam, fringilla ut tempus eget, lacinia vulputate massa.</p>\n<p>Donec faucibus elit suscipit eros porttitor, id faucibus purus aliquet. Phasellus lectus dui, accumsan ut ex ac, imperdiet bibendum augue. Suspendisse leo nulla, molestie a mauris id, tempor euismod urna. Donec in nisi lacus. Praesent lobortis eu neque vitae molestie. Sed ut lobortis quam, ut tempus odio. Curabitur sodales vehicula eros, id blandit nisi pharetra in.</p>\n<p>Ut rhoncus dictum lorem quis dictum. Nunc mauris enim, lacinia eget massa eu, varius egestas sapien. Vivamus quis venenatis massa. Aliquam condimentum, dolor at auctor bibendum, elit orci cursus magna, euismod tincidunt quam erat at risus. Mauris auctor ullamcorper nulla, ac posuere neque varius ac. Aliquam sit amet rhoncus urna, nec efficitur sem. Vestibulum imperdiet imperdiet sem eu pretium.</p>','{\"titleRaw\":{\"1\":\"Privacy Policy \"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Privacy Policy\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Privacy Policy\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,7,1,'Facebook','2018-05-14 18:48:21','2018-05-14 18:48:21','f569bafa-5cf9-46c5-b808-0b83014b4ec6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,9,1,'New Homepage 5 1440X500 1','2018-05-14 19:22:54','2018-05-14 19:22:54','df6c908c-ecd4-4525-9910-513674b25342',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,10,1,'Page','2018-05-14 19:30:32','2019-05-16 20:23:46','604a1a5a-5c81-41a8-8165-f50ebad6789c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"5\"}',NULL,NULL,NULL,NULL,NULL),(10,18,1,'Category Test','2018-05-14 20:50:49','2018-05-14 20:50:49','03dcc74b-9bb5-4a83-9079-8170ef5b9d0f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,19,1,'Test Entry','2018-05-14 20:50:52','2019-05-16 20:12:45','009c381e-aab3-41b2-b3cc-7b23aceb9aac','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\n<p>Proin vulputate venenatis tortor quis lobortis. Proin nec tellus vestibulum, ultrices velit vitae, scelerisque neque. Duis accumsan neque varius tellus convallis, sed cursus eros dictum. Sed vulputate mi et odio eleifend faucibus. Nulla sit amet aliquam quam. Integer cursus ipsum et lectus imperdiet sodales. Etiam luctus malesuada risus, sit amet ultricies felis laoreet sed. Quisque consequat vel nibh at eleifend. Integer mollis a urna id malesuada. Vivamus blandit eget ipsum a sollicitudin. Fusce molestie lorem porta bibendum vehicula. Vivamus sapien sem, malesuada id diam ac, condimentum volutpat neque. Duis quis urna aliquam, auctor ligula quis, tincidunt urna.</p>\n<p>Integer convallis lectus non ex vehicula ultricies. Fusce et dictum enim. Phasellus vel ante sit amet metus porta molestie. Curabitur laoreet metus eu lacus dignissim dignissim. Sed sapien est, consequat eget pharetra et, consectetur vitae lacus. Duis sed blandit magna. Maecenas id elementum purus. Aliquam metus quam, fringilla ut tempus eget, lacinia vulputate massa.</p>\n<p>Donec faucibus elit suscipit eros porttitor, id faucibus purus aliquet. Phasellus lectus dui, accumsan ut ex ac, imperdiet bibendum augue. Suspendisse leo nulla, molestie a mauris id, tempor euismod urna. Donec in nisi lacus. Praesent lobortis eu neque vitae molestie. Sed ut lobortis quam, ut tempus odio. Curabitur sodales vehicula eros, id blandit nisi pharetra in.</p>\n<p>Ut rhoncus dictum lorem quis dictum. Nunc mauris enim, lacinia eget massa eu, varius egestas sapien. Vivamus quis venenatis massa. Aliquam condimentum, dolor at auctor bibendum, elit orci cursus magna, euismod tincidunt quam erat at risus. Mauris auctor ullamcorper nulla, ac posuere neque varius ac. Aliquam sit amet rhoncus urna, nec efficitur sem. Vestibulum imperdiet imperdiet sem eu pretium.</p>','{\"titleRaw\":{\"1\":\"Test Entry \"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Test Entry\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Test Entry\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.',NULL,NULL,NULL,NULL,NULL,NULL),(12,20,1,'Editorial','2018-05-14 20:52:14','2019-05-16 20:23:46','a2413716-d4dd-435f-ac28-eb87a181bc15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"url\",\"value\":\"http://craft3.test/editorial\"}',NULL,NULL,NULL,NULL,NULL),(13,21,1,'Editorial Archive','2019-03-08 18:52:04','2019-05-16 20:36:18','576de2e2-7334-4f04-8cc5-a6b7097adf8d',NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Editorial Archive\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Editorial Archive\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_craftidtokens`
--

DROP TABLE IF EXISTS `craft_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craft_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_craftidtokens`
--

LOCK TABLES `craft_craftidtokens` WRITE;
/*!40000 ALTER TABLE `craft_craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elementindexsettings`
--

DROP TABLE IF EXISTS `craft_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elementindexsettings`
--

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;
INSERT INTO `craft_elementindexsettings` VALUES (1,'craft\\elements\\Asset','{\"sources\":{\"folder:f1ce0547-9993-4969-900a-c6324146574f\":{\"tableAttributes\":{\"1\":\"filename\",\"2\":\"size\",\"3\":\"dateModified\",\"4\":\"usage\"}}}}','2019-02-05 16:54:41','2019-02-05 16:54:41','8c8bb7a7-f8c2-4771-8a6b-e06dd97089fb');
/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `craft_elements_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `craft_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,NULL,'craft\\elements\\User',1,0,'2018-05-11 17:24:17','2019-04-17 16:01:07',NULL,'0bb460eb-82d9-4492-bf04-c2902d3c5407'),(2,9,'craft\\elements\\Entry',1,0,'2018-05-14 14:59:28','2019-05-16 20:36:27',NULL,'bf888b68-2abb-40b1-aa5c-e69c772e46ef'),(3,14,'craft\\elements\\GlobalSet',1,0,'2018-05-14 15:30:58','2018-05-14 18:48:27',NULL,'f0679e94-3a8a-4b11-8810-9f48450190eb'),(4,13,'craft\\elements\\Entry',1,0,'2018-05-14 18:29:48','2019-05-16 20:23:46',NULL,'6e8b72bc-5cfa-45ae-9035-0ce66341efab'),(5,10,'craft\\elements\\Entry',1,0,'2018-05-14 18:36:12','2019-05-16 20:14:54',NULL,'0cafb8a7-a9f8-40ba-9355-a38c9cf3e201'),(6,11,'craft\\elements\\Entry',1,0,'2018-05-14 18:36:43','2019-05-16 20:21:54',NULL,'eefb193a-5140-48e1-baa1-1d5684cb32b2'),(7,15,'craft\\elements\\Asset',1,0,'2018-05-14 18:48:21','2018-05-14 18:48:21',NULL,'7c92ca7a-6927-44e1-ad95-3db70eb33bbb'),(8,2,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2018-05-14 18:48:27','2018-05-14 18:48:27',NULL,'d782543a-d0d5-4096-a33f-27a66cabe35e'),(9,15,'craft\\elements\\Asset',1,0,'2018-05-14 19:22:54','2018-05-14 19:22:54',NULL,'cbd8a1e5-0c1b-4e91-b7c4-78bc86360f8e'),(10,13,'craft\\elements\\Entry',1,0,'2018-05-14 19:30:32','2019-05-16 20:23:46',NULL,'0d537745-e5e0-4b6e-a3dc-be99d21c93bb'),(11,3,'craft\\elements\\MatrixBlock',1,0,'2018-05-14 20:07:38','2019-05-16 20:14:54',NULL,'041d44eb-a003-41f7-925d-22084ab78cd4'),(12,17,'barrelstrength\\sproutforms\\elements\\Form',1,0,'2018-05-14 20:12:13','2018-05-14 20:13:00',NULL,'e4092bc1-3c75-47c0-8eac-8a07592ba24a'),(13,4,'craft\\elements\\MatrixBlock',1,0,'2018-05-14 20:20:49','2019-05-16 20:14:54',NULL,'eeedb308-4005-42a1-b7dc-bb1b45251e41'),(14,6,'craft\\elements\\MatrixBlock',1,0,'2018-05-14 20:20:49','2019-05-16 20:14:54',NULL,'adac29e3-ea14-4735-89cb-66a90b73ca9d'),(15,5,'verbb\\supertable\\elements\\SuperTableBlockElement',1,0,'2018-05-14 20:20:49','2019-05-16 20:14:54',NULL,'a083c34c-0505-49e0-9643-0f171af0e76c'),(16,7,'craft\\elements\\MatrixBlock',1,0,'2018-05-14 20:20:49','2019-05-16 20:14:54',NULL,'c0a573a1-a8f3-4c50-849d-663dd34b4667'),(17,8,'craft\\elements\\MatrixBlock',1,0,'2018-05-14 20:20:49','2019-05-16 20:14:54',NULL,'7a7ad00a-7c30-410e-8975-3747942522b6'),(18,1,'craft\\elements\\Category',1,0,'2018-05-14 20:50:49','2018-05-14 20:50:49',NULL,'a758e6c8-c60a-4e2e-a3df-4809a2ba3909'),(19,12,'craft\\elements\\Entry',1,0,'2018-05-14 20:50:52','2019-05-16 20:12:45',NULL,'458e4e92-dc16-458f-86de-777953f821c0'),(20,13,'craft\\elements\\Entry',1,0,'2018-05-14 20:52:14','2019-05-16 20:23:46',NULL,'bbb04231-1ff0-4800-905d-e27a7946d3de'),(21,18,'craft\\elements\\Entry',1,0,'2019-03-08 18:52:04','2019-05-16 20:36:18',NULL,'962f9b66-f390-4ca4-b146-8f6bb65d276a');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_sites`
--

DROP TABLE IF EXISTS `craft_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_elements_sites_siteId_idx` (`siteId`),
  KEY `craft_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `craft_elements_sites_enabled_idx` (`enabled`),
  KEY `craft_elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `craft_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_sites`
--

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;
INSERT INTO `craft_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2018-05-11 17:24:17','2019-04-17 16:01:07','3dc4e8cf-4818-4726-8752-de9c19ede71c'),(2,2,1,'homepage','__home__',1,'2018-05-14 14:59:28','2019-05-16 20:36:27','3317dda0-470b-40f5-9751-adb28c4616d1'),(3,3,1,NULL,NULL,1,'2018-05-14 15:30:58','2018-05-14 18:48:27','e583c175-f857-413b-90dd-bb0991a588b2'),(4,4,1,'home',NULL,1,'2018-05-14 18:29:48','2019-05-16 20:23:46','04a1e8e0-d783-4755-b6aa-3fef6cc4e159'),(5,5,1,'test-page','test-page',1,'2018-05-14 18:36:12','2019-05-16 20:14:54','d5b5ff09-1c10-43d7-b46e-13638275c0ae'),(6,6,1,'privacy-policy','privacy-policy',1,'2018-05-14 18:36:43','2019-05-16 20:21:54','5f4f33f6-7813-49e2-bc94-3514de541c91'),(7,7,1,NULL,NULL,1,'2018-05-14 18:48:21','2018-05-14 18:48:21','a2212d19-1b39-425a-9aa5-f190ec5cc7af'),(8,8,1,NULL,NULL,1,'2018-05-14 18:48:27','2018-05-14 18:48:27','ba4bbfae-2c86-43f1-a54a-af81243c9fd1'),(9,9,1,NULL,NULL,1,'2018-05-14 19:22:54','2018-05-14 19:22:54','cda6191f-aa81-420b-9d51-de1aa7831af2'),(10,10,1,'page',NULL,1,'2018-05-14 19:30:32','2019-05-16 20:23:46','a9b318f3-cbf2-4f0b-b122-e87299e84689'),(11,11,1,NULL,NULL,1,'2018-05-14 20:07:38','2019-05-16 20:14:54','e6a6a4b8-196d-4c4d-8196-72031bc49dc2'),(12,12,1,NULL,NULL,1,'2018-05-14 20:12:13','2018-05-14 20:13:00','6475be33-c0f5-47bc-8f96-6cd40b59b900'),(13,13,1,NULL,NULL,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','be867a7c-444d-4f3a-9071-93d2d68b2d05'),(14,14,1,NULL,NULL,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','d0427ac2-e682-4d7a-8a05-7cff3e80b86c'),(15,15,1,NULL,NULL,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','526e6b7c-073f-4455-8ddd-5c4d8abd45fc'),(16,16,1,NULL,NULL,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','af93d1d4-bc72-42f0-9d19-5e86a20a97fb'),(17,17,1,NULL,NULL,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','91c0a0bc-c151-44ca-8335-680df3a4f3c5'),(18,18,1,'category-test','categories/category-test',1,'2018-05-14 20:50:49','2018-05-14 20:50:53','56e2ef82-1d1c-4c17-9fac-12b738cd54c8'),(19,19,1,'test-entry','editorial/test-entry',1,'2018-05-14 20:50:52','2019-05-16 20:12:45','31e85c57-92e2-48f2-97ab-7c399a975a0a'),(20,20,1,'editorial',NULL,1,'2018-05-14 20:52:14','2019-05-16 20:23:46','705fe99f-baed-4426-829a-75a609c61c5e'),(21,21,1,'editorial-archive','editorial',1,'2019-03-08 18:52:04','2019-05-16 20:36:18','762c2a3d-0d2d-40e8-9642-2b9aab95d4a4');
/*!40000 ALTER TABLE `craft_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_idx` (`authorId`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_parentId_fk` (`parentId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
INSERT INTO `craft_entries` VALUES (2,1,NULL,1,NULL,'2018-05-14 14:59:28',NULL,NULL,'2018-05-14 14:59:28','2019-05-16 20:36:28','5f3b443f-30a0-46ca-bab1-1770765f6313'),(4,5,NULL,5,1,'2018-05-14 18:29:48',NULL,NULL,'2018-05-14 18:29:48','2019-05-16 20:23:46','b3690a43-ecca-4c47-a52f-5237cb81a0bd'),(5,2,NULL,2,1,'2018-05-14 18:36:00',NULL,NULL,'2018-05-14 18:36:12','2019-05-16 20:14:54','b4cd3f94-f5b2-42ce-99ff-beef6f473265'),(6,3,NULL,3,1,'2018-05-14 18:36:43',NULL,NULL,'2018-05-14 18:36:43','2019-05-16 20:21:54','d5d96691-c9c3-4a8e-af10-6a478f8859ac'),(10,5,NULL,5,1,'2018-05-14 19:30:32',NULL,NULL,'2018-05-14 19:30:32','2019-05-16 20:23:46','68224efd-0320-474a-87b3-b87d0f8f9897'),(19,4,NULL,4,1,'2018-05-14 20:50:52',NULL,NULL,'2018-05-14 20:50:52','2019-05-16 20:12:45','27fdbcce-c8cf-413e-9eab-c98f8a654901'),(20,5,NULL,5,1,'2018-05-14 20:52:14',NULL,NULL,'2018-05-14 20:52:14','2019-05-16 20:23:46','c8ea7734-a895-4522-a115-09969ecc9ff8'),(21,6,NULL,6,NULL,'2019-03-08 18:52:00',NULL,NULL,'2019-03-08 18:52:04','2019-05-16 20:36:18','8f52c8f9-4ce2-49e8-ae3b-5b2bef857046');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrydrafts`
--

DROP TABLE IF EXISTS `craft_entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_sectionId_idx` (`sectionId`),
  KEY `craft_entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `craft_entrydrafts_siteId_idx` (`siteId`),
  KEY `craft_entrydrafts_creatorId_idx` (`creatorId`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrydrafts`
--

LOCK TABLES `craft_entrydrafts` WRITE;
/*!40000 ALTER TABLE `craft_entrydrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrytypes_sectionId_idx` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_entrytypes_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `craft_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
INSERT INTO `craft_entrytypes` VALUES (1,1,9,'Homepage','homepage',0,'','{section.name|raw}',1,'2018-05-14 14:59:28','2019-05-16 20:36:27',NULL,'330a6ca0-1879-4280-89f4-41840669c8e3'),(2,2,10,'Standard','standard',1,'Title','',1,'2018-05-14 15:04:42','2019-05-16 20:36:02',NULL,'2577637e-2710-4745-a39e-6e5f2af6e29a'),(3,3,11,'Legal','legal',1,'Title','',1,'2018-05-14 15:06:57','2019-05-16 20:21:53',NULL,'5573181d-8830-4398-b2a6-56afb1fec4a5'),(4,4,12,'Editorial','editorial',1,'Title','',1,'2018-05-14 15:17:05','2019-05-16 20:50:10',NULL,'c59c9bf5-4b65-4e9f-8622-facfbe978893'),(5,5,13,'Navigation','navigation',1,'Title','',1,'2018-05-14 15:23:14','2019-05-16 20:23:45',NULL,'76cd67ce-8f48-436f-b8af-f149e9dc51e9'),(6,6,18,'Editorial Archive','editorialArchive',0,'','{section.name|raw}',1,'2019-03-08 18:52:04','2019-05-16 20:36:18',NULL,'c9b6c951-3d3a-4e93-a14c-35e0ddb5feda'),(7,2,19,'With Thirdparty Code','withCode',1,'Title','',2,'2019-05-16 20:21:34','2019-05-16 20:36:43',NULL,'934add47-15af-44e1-9de0-151206bbe75d');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entryversions`
--

DROP TABLE IF EXISTS `craft_entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_sectionId_idx` (`sectionId`),
  KEY `craft_entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `craft_entryversions_siteId_idx` (`siteId`),
  KEY `craft_entryversions_creatorId_idx` (`creatorId`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entryversions`
--

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;
INSERT INTO `craft_entryversions` VALUES (1,4,5,1,1,1,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"home\",\"postDate\":1526322588,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"59\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"2\"}}}','2018-05-14 18:29:48','2018-05-14 18:29:48','28df330d-3875-4eaf-bbc1-dc5c8afc5862'),(2,5,2,1,1,1,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Test Page\",\"slug\":\"test-page\",\"postDate\":1526322972,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"55\":[],\"54\":[],\"53\":[],\"56\":\"light\",\"15\":[],\"4\":{\"title\":\"Test Page \",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}','2018-05-14 18:36:12','2018-05-14 18:36:12','9ecdc1b3-be5b-4ad8-a001-8715324746de'),(3,6,3,1,1,1,'','{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Privacy Policy\",\"slug\":\"privacy-policy\",\"postDate\":1526323003,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"1\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\\n<p>Proin vulputate venenatis tortor quis lobortis. Proin nec tellus vestibulum, ultrices velit vitae, scelerisque neque. Duis accumsan neque varius tellus convallis, sed cursus eros dictum. Sed vulputate mi et odio eleifend faucibus. Nulla sit amet aliquam quam. Integer cursus ipsum et lectus imperdiet sodales. Etiam luctus malesuada risus, sit amet ultricies felis laoreet sed. Quisque consequat vel nibh at eleifend. Integer mollis a urna id malesuada. Vivamus blandit eget ipsum a sollicitudin. Fusce molestie lorem porta bibendum vehicula. Vivamus sapien sem, malesuada id diam ac, condimentum volutpat neque. Duis quis urna aliquam, auctor ligula quis, tincidunt urna.</p>\\n<p>Integer convallis lectus non ex vehicula ultricies. Fusce et dictum enim. Phasellus vel ante sit amet metus porta molestie. Curabitur laoreet metus eu lacus dignissim dignissim. Sed sapien est, consequat eget pharetra et, consectetur vitae lacus. Duis sed blandit magna. Maecenas id elementum purus. Aliquam metus quam, fringilla ut tempus eget, lacinia vulputate massa.</p>\\n<p>Donec faucibus elit suscipit eros porttitor, id faucibus purus aliquet. Phasellus lectus dui, accumsan ut ex ac, imperdiet bibendum augue. Suspendisse leo nulla, molestie a mauris id, tempor euismod urna. Donec in nisi lacus. Praesent lobortis eu neque vitae molestie. Sed ut lobortis quam, ut tempus odio. Curabitur sodales vehicula eros, id blandit nisi pharetra in.</p>\\n<p>Ut rhoncus dictum lorem quis dictum. Nunc mauris enim, lacinia eget massa eu, varius egestas sapien. Vivamus quis venenatis massa. Aliquam condimentum, dolor at auctor bibendum, elit orci cursus magna, euismod tincidunt quam erat at risus. Mauris auctor ullamcorper nulla, ac posuere neque varius ac. Aliquam sit amet rhoncus urna, nec efficitur sem. Vestibulum imperdiet imperdiet sem eu pretium.</p>\",\"4\":{\"title\":\"Privacy Policy \",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}','2018-05-14 18:36:43','2018-05-14 18:36:43','60e9783d-88ce-4713-ae02-fb69f026073c'),(4,2,1,1,1,1,'Revision from May 14, 2018, 12:18:21 PM','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1526309968,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"55\":[],\"54\":[],\"53\":[],\"15\":[],\"4\":{\"title\":\"\",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"title\":\"\",\"image\":null,\"description\":\"\"},\"facebook\":{\"title\":\"\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[]}}}}','2018-05-14 19:23:05','2018-05-14 19:23:05','6678c91c-be4c-4dfe-8fc5-856a59b6e42b'),(5,2,1,1,1,2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1526309968,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"60\":\"left\",\"55\":[\"9\"],\"54\":[\"9\"],\"53\":[\"9\"],\"56\":\"light\",\"15\":[],\"57\":\"Siren Framework\",\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"4\":{\"title\":\"\",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}','2018-05-14 19:23:06','2018-05-14 19:23:06','c769c236-dec9-4e3f-b232-483daef70173'),(6,10,5,1,1,1,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Page\",\"slug\":\"page\",\"postDate\":1526326232,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"59\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"5\"}}}','2018-05-14 19:30:32','2018-05-14 19:30:32','a5faaf95-dd7a-4705-bc8d-14c9ec4bc62c'),(7,5,2,1,1,2,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Test Page\",\"slug\":\"test-page\",\"postDate\":1526322960,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"60\":\"left\",\"55\":[\"9\"],\"54\":[\"9\"],\"53\":[\"9\"],\"15\":{\"11\":{\"type\":\"standardContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentTitle\":\"Title\",\"contentContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"contentLink\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"6\"},\"contentLinkText\":\"Learn More\",\"contentAlignment\":\"left\",\"contentTheme\":\"light\",\"contentAnimationStyle\":\"none\"}}},\"57\":\"My Page\",\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"4\":{\"title\":\"Test Page \",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}},\"56\":\"light\"}}','2018-05-14 20:07:38','2018-05-14 20:07:38','4db59183-b071-489f-bbc4-4274b4877e3c'),(8,5,2,1,1,3,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Test Page\",\"slug\":\"test-page\",\"postDate\":1526322960,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"60\":\"left\",\"55\":[\"9\"],\"54\":[\"9\"],\"53\":[\"9\"],\"15\":{\"11\":{\"type\":\"standardContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentTitle\":\"Title\",\"contentContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"contentLink\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"6\"},\"contentLinkText\":\"Learn More\",\"contentAlignment\":\"left\",\"contentTheme\":\"light\",\"contentAnimationStyle\":\"none\"}},\"13\":{\"type\":\"imageAndContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"icpTitle\":\"ICP\",\"icpImage\":[\"9\"],\"icpContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"icpLink\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"6\"},\"icpLinkText\":\"Learn More\",\"icpPositionOfImage\":\"left\",\"icpTheme\":\"light\",\"icpAnimationStyle\":\"none\"}},\"14\":{\"type\":\"columns\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"columnsTitle\":\"Columns\",\"columns\":{\"15\":{\"type\":\"2\",\"fields\":{\"columnTitle\":\"One Column\",\"columnContent\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"columnIcon\":[\"7\"],\"columnLink\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"2\"},\"columnLinkText\":\"Learn More\"}}},\"columnCount\":null,\"columnsColorScheme\":\"light\",\"columnsAnimationStyles\":\"none\"}},\"16\":{\"type\":\"callToAction\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"ctaTitle\":\"CTA\",\"ctaText\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"ctaLink\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"entry\",\"value\":\"2\"},\"ctaLinkText\":\"Learn More\",\"ctaBackgroundImage\":[],\"ctaContentAlignment\":\"left\",\"ctaTheme\":\"light\"}},\"17\":{\"type\":\"form\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"formTitle\":\"Form\",\"form\":[\"12\"],\"formContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.</p>\",\"formPositionOfContent\":\"left\",\"formTheme\":\"light\",\"formAnimation\":\"none\"}}},\"57\":\"My Page\",\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"4\":{\"title\":\"Test Page \",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}},\"56\":\"light\"}}','2018-05-14 20:20:49','2018-05-14 20:20:49','6d7857b2-6c87-4e32-9637-6a253fd7a8d2'),(9,19,4,1,1,1,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Test Entry\",\"slug\":\"test-entry\",\"postDate\":1526331052,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"1\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\\n<p>Proin vulputate venenatis tortor quis lobortis. Proin nec tellus vestibulum, ultrices velit vitae, scelerisque neque. Duis accumsan neque varius tellus convallis, sed cursus eros dictum. Sed vulputate mi et odio eleifend faucibus. Nulla sit amet aliquam quam. Integer cursus ipsum et lectus imperdiet sodales. Etiam luctus malesuada risus, sit amet ultricies felis laoreet sed. Quisque consequat vel nibh at eleifend. Integer mollis a urna id malesuada. Vivamus blandit eget ipsum a sollicitudin. Fusce molestie lorem porta bibendum vehicula. Vivamus sapien sem, malesuada id diam ac, condimentum volutpat neque. Duis quis urna aliquam, auctor ligula quis, tincidunt urna.</p>\\n<p>Integer convallis lectus non ex vehicula ultricies. Fusce et dictum enim. Phasellus vel ante sit amet metus porta molestie. Curabitur laoreet metus eu lacus dignissim dignissim. Sed sapien est, consequat eget pharetra et, consectetur vitae lacus. Duis sed blandit magna. Maecenas id elementum purus. Aliquam metus quam, fringilla ut tempus eget, lacinia vulputate massa.</p>\\n<p>Donec faucibus elit suscipit eros porttitor, id faucibus purus aliquet. Phasellus lectus dui, accumsan ut ex ac, imperdiet bibendum augue. Suspendisse leo nulla, molestie a mauris id, tempor euismod urna. Donec in nisi lacus. Praesent lobortis eu neque vitae molestie. Sed ut lobortis quam, ut tempus odio. Curabitur sodales vehicula eros, id blandit nisi pharetra in.</p>\\n<p>Ut rhoncus dictum lorem quis dictum. Nunc mauris enim, lacinia eget massa eu, varius egestas sapien. Vivamus quis venenatis massa. Aliquam condimentum, dolor at auctor bibendum, elit orci cursus magna, euismod tincidunt quam erat at risus. Mauris auctor ullamcorper nulla, ac posuere neque varius ac. Aliquam sit amet rhoncus urna, nec efficitur sem. Vestibulum imperdiet imperdiet sem eu pretium.</p>\",\"2\":[\"18\"],\"58\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"3\":[],\"4\":{\"title\":\"Test Entry \",\"description\":\"\",\"keywords\":\"\",\"score\":\"neutral\",\"social\":{\"twitter\":{\"image\":null,\"title\":\"\",\"description\":\"\"},\"facebook\":{\"image\":null,\"title\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}}}}','2018-05-14 20:50:52','2018-05-14 20:50:52','49d3950a-8cc7-47e5-905e-71f7f015da34'),(10,20,5,1,1,1,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Editorial\",\"slug\":\"editorial\",\"postDate\":1526331134,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"59\":{\"allowCustomText\":\"\",\"allowTarget\":\"\",\"customText\":null,\"defaultText\":\"\",\"target\":null,\"type\":\"url\",\"value\":\"http://craft3.test/editorial\"}}}','2018-05-14 20:52:14','2018-05-14 20:52:14','ec36aad9-fa03-4fc8-a6df-0a2766017f4e'),(11,5,2,1,1,4,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Test Page\",\"slug\":\"test-page\",\"postDate\":1526322960,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"60\":\"left\",\"55\":[\"9\"],\"54\":[\"9\"],\"53\":[\"9\"],\"15\":{\"11\":{\"type\":\"standardContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentTitle\":\"Title\",\"contentContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"contentLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"6\"},\"contentLinkText\":\"Learn More\",\"contentAlignment\":\"left\",\"contentTheme\":\"light\",\"contentAnimationStyle\":\"none\"}},\"13\":{\"type\":\"imageAndContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"icpTitle\":\"ICP\",\"icpImage\":[\"9\"],\"icpContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"icpLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"6\"},\"icpLinkText\":\"Learn More\",\"icpPositionOfImage\":\"left\",\"icpTheme\":\"light\",\"icpAnimationStyle\":\"none\"}},\"14\":{\"type\":\"columns\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"columnsTitle\":\"Columns\",\"columns\":{\"15\":{\"type\":\"2\",\"fields\":{\"columnTitle\":\"One Column\",\"columnContent\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"columnIcon\":[],\"columnLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"},\"columnLinkText\":\"Learn More\"}}},\"columnCount\":null,\"columnsTheme\":\"light\",\"columnsAnimationStyle\":\"none\"}},\"16\":{\"type\":\"callToAction\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"ctaTitle\":\"CTA\",\"ctaText\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"ctaLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"},\"ctaLinkText\":\"Learn More\",\"ctaBackgroundImage\":[],\"ctaContentAlignment\":\"left\",\"ctaTheme\":\"light\"}},\"17\":{\"type\":\"form\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"formTitle\":\"Form\",\"form\":null,\"formContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.</p>\",\"formPositionOfContent\":\"left\",\"formTheme\":\"light\",\"formAnimation\":\"none\"}}},\"57\":\"My Page\",\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"4\":{\"titleRaw\":{\"1\":\"Test Page \"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Test Page\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Test Page\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}},\"56\":\"light\"}}','2019-03-08 16:01:38','2019-03-08 16:01:38','4f2acb30-cbba-4393-9df4-50ffc18ec340'),(12,5,2,1,1,5,'','{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"Test Page\",\"slug\":\"test-page\",\"postDate\":1526322960,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"60\":\"left\",\"55\":[\"9\"],\"54\":[\"9\"],\"53\":[\"9\"],\"15\":{\"11\":{\"type\":\"standardContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentTitle\":\"Title\",\"contentContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"contentLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"6\"},\"contentLinkText\":\"Learn More\",\"contentAlignment\":\"left\",\"contentTheme\":\"light\",\"contentAnimationStyle\":\"none\"}},\"13\":{\"type\":\"imageAndContent\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"icpTitle\":\"ICP\",\"icpImage\":[\"9\"],\"icpContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>\",\"icpLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"6\"},\"icpLinkText\":\"Learn More\",\"icpPositionOfImage\":\"right\",\"icpTheme\":\"light\",\"icpAnimationStyle\":\"none\"}},\"14\":{\"type\":\"columns\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"columnsTitle\":\"Columns\",\"columns\":{\"15\":{\"type\":\"2\",\"fields\":{\"columnTitle\":\"One Column\",\"columnContent\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"columnIcon\":[],\"columnLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"},\"columnLinkText\":\"Learn More\"}}},\"columnCount\":null,\"columnsTheme\":\"light\",\"columnsAnimationStyle\":\"none\"}},\"16\":{\"type\":\"callToAction\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"ctaTitle\":\"CTA\",\"ctaText\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"ctaLink\":{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"},\"ctaLinkText\":\"Learn More\",\"ctaBackgroundImage\":[],\"ctaContentAlignment\":\"left\",\"ctaTheme\":\"light\"}},\"17\":{\"type\":\"form\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"formTitle\":\"Form\",\"form\":null,\"formContent\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.</p>\",\"formPositionOfContent\":\"left\",\"formTheme\":\"light\",\"formAnimation\":\"none\"}}},\"57\":\"My Page\",\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"4\":{\"titleRaw\":{\"1\":\"Test Page \"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Test Page\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Test Page\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}},\"56\":\"light\"}}','2019-03-12 18:53:10','2019-03-12 18:53:10','22c086b9-de63-4f69-942e-1ce503f15d6e'),(13,2,1,1,1,3,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1526309968,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"15\":[],\"57\":\"Siren Framework\",\"4\":{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}}}','2019-05-16 20:07:10','2019-05-16 20:07:10','7c7549e4-bed1-49d2-a2d7-845dec9f5da9'),(14,2,1,1,1,4,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1526309968,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"15\":[],\"57\":\"Siren Framework\",\"4\":{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}}}','2019-05-16 20:07:10','2019-05-16 20:07:10','3cc6530d-1757-4699-901a-026f313bc5a8'),(15,21,6,1,1,1,'Revision from Mar 8, 2019, 11:14:20 AM','{\"typeId\":\"6\",\"authorId\":null,\"title\":\"Editorial Archive\",\"slug\":\"editorial-archive\",\"postDate\":1552071120,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":null}}','2019-05-16 20:11:21','2019-05-16 20:11:21','24466d31-8151-42c0-ac4f-706776d732bf'),(16,21,6,1,1,2,NULL,'{\"typeId\":\"6\",\"authorId\":null,\"title\":\"Editorial Archive\",\"slug\":\"editorial-archive\",\"postDate\":1552071120,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":null,\"57\":null,\"3\":[],\"4\":{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Editorial Archive\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Editorial Archive\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}}}','2019-05-16 20:36:18','2019-05-16 20:36:18','e3de5a79-cc2c-4813-9b2b-f55b2609ef9b'),(17,21,6,1,1,3,NULL,'{\"typeId\":\"6\",\"authorId\":null,\"title\":\"Editorial Archive\",\"slug\":\"editorial-archive\",\"postDate\":1552071120,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":null,\"57\":null,\"3\":[],\"4\":{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Editorial Archive\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Editorial Archive\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}}}','2019-05-16 20:36:18','2019-05-16 20:36:18','12d04838-67bf-42d1-a1a0-78aa4e9136c5'),(18,2,1,1,1,5,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1526309968,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"1\":null,\"15\":[],\"57\":\"Siren Framework\",\"3\":[],\"67\":null,\"4\":{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}}}','2019-05-16 20:36:27','2019-05-16 20:36:27','7ca66074-64f3-42b8-ac79-617a88af7b3c'),(19,2,1,1,1,6,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1526309968,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":{\"14\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.\",\"1\":null,\"15\":[],\"57\":\"Siren Framework\",\"3\":[],\"67\":null,\"4\":{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}}}','2019-05-16 20:36:28','2019-05-16 20:36:28','efcf35e0-b85c-4d42-87cc-7df725655ee9');
/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_feedme_feeds`
--

DROP TABLE IF EXISTS `craft_feedme_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_feedme_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `feedUrl` text NOT NULL,
  `feedType` varchar(255) DEFAULT NULL,
  `primaryElement` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) NOT NULL,
  `elementGroup` text,
  `siteId` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `duplicateHandle` text,
  `paginationNode` text,
  `fieldMapping` text,
  `fieldUnique` text,
  `passkey` varchar(255) NOT NULL,
  `backup` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_feedme_feeds`
--

LOCK TABLES `craft_feedme_feeds` WRITE;
/*!40000 ALTER TABLE `craft_feedme_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_feedme_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (1,'Common','2018-05-11 17:24:17','2019-02-01 16:43:31','1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca'),(3,'SEO','2018-05-11 21:29:07','2019-02-01 16:43:31','a64bbc54-2902-411c-9cb8-b771c3d1bc1b'),(4,'Global Content','2018-05-11 21:29:47','2019-02-01 16:43:31','83751e07-9cd8-4496-9fd5-cfe2a48a0dcd'),(5,'Header','2018-05-11 21:34:33','2019-02-01 16:43:31','52f336bf-c786-4a66-b3a3-5139a97fa3cd'),(6,'Navigation','2018-05-14 15:20:18','2019-02-01 16:43:31','99e32bdf-5545-43f4-8be7-1d745d981d84'),(7,'Taxonomies','2019-05-16 19:50:46','2019-05-16 19:50:46','ccd5bc31-2dd5-420d-9fee-3f4264fb8370');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `craft_fieldlayoutfields` VALUES (92,14,32,5,0,1,'2018-05-14 15:30:58','2018-05-14 15:30:58','515d0d52-b4df-4ca1-86a5-7510bb578d62'),(93,14,32,6,0,2,'2018-05-14 15:30:58','2018-05-14 15:30:58','53238e3a-f329-4bfb-ae4c-7e72461d5949'),(94,14,32,7,0,3,'2018-05-14 15:30:58','2018-05-14 15:30:58','cc7e39f9-9681-4730-b2b8-43d2d5c978e7'),(95,14,32,9,0,4,'2018-05-14 15:30:58','2018-05-14 15:30:58','d8cf7ccd-6d26-4d45-b670-b78b371adaf3'),(96,14,32,10,0,5,'2018-05-14 15:30:58','2018-05-14 15:30:58','75f681a2-a101-4fb7-b03d-6b461303418b'),(97,14,32,8,0,6,'2018-05-14 15:30:58','2018-05-14 15:30:58','82f9b243-142f-42fe-b839-86e724547d3a'),(390,17,85,63,0,1,'2018-05-14 20:13:00','2018-05-14 20:13:00','c676b1be-f639-487e-b1ef-691568b21c2f'),(391,17,85,64,0,2,'2018-05-14 20:13:00','2018-05-14 20:13:00','8a1e3969-07e3-4732-a935-8f9be78b6751'),(548,3,114,16,0,1,'2019-05-14 19:35:06','2019-05-14 19:35:06','0dc359fe-f027-4a69-8273-fc54bc6c1e66'),(549,3,114,17,1,2,'2019-05-14 19:35:06','2019-05-14 19:35:06','b23d6025-9125-474d-9d18-1497b237cc20'),(550,3,114,20,0,3,'2019-05-14 19:35:06','2019-05-14 19:35:06','dc055e54-dc8e-43df-b85c-0090a796f792'),(551,3,114,21,0,4,'2019-05-14 19:35:06','2019-05-14 19:35:06','2a0e4f5a-e97e-4aa5-87ea-420f7a388523'),(552,3,114,22,0,5,'2019-05-14 19:35:06','2019-05-14 19:35:06','b9681619-3003-49af-b1b1-5b1dee9373ed'),(553,4,115,23,0,1,'2019-05-14 19:35:07','2019-05-14 19:35:07','3f76bfd4-0527-48d3-9edf-1b44dceccde4'),(554,4,115,24,1,2,'2019-05-14 19:35:07','2019-05-14 19:35:07','256613aa-55ab-4a91-89b9-960a56b4cee1'),(555,4,115,25,1,3,'2019-05-14 19:35:07','2019-05-14 19:35:07','6b8e875a-3ddd-4cb7-b7d5-174cc44e7f1f'),(556,4,115,28,0,4,'2019-05-14 19:35:07','2019-05-14 19:35:07','b0fb35f7-9144-4187-a3f8-4c2aa31599f7'),(557,4,115,29,0,5,'2019-05-14 19:35:07','2019-05-14 19:35:07','3754069d-0687-4b22-89d3-377d910a7d26'),(558,4,115,30,0,6,'2019-05-14 19:35:07','2019-05-14 19:35:07','a3eaf422-b0b3-4884-a87d-1ef81a853108'),(559,5,116,33,0,1,'2019-05-14 19:35:07','2019-05-14 19:35:07','bb29fe47-04b5-4a99-9ae8-bd2ec13784da'),(560,5,116,34,0,2,'2019-05-14 19:35:07','2019-05-14 19:35:07','6827c111-7417-4c1c-8e58-c0bea8cf0af5'),(561,5,116,35,0,3,'2019-05-14 19:35:07','2019-05-14 19:35:07','5b481ff6-5ef8-42e2-a326-f38cc4168073'),(562,5,116,36,0,4,'2019-05-14 19:35:07','2019-05-14 19:35:07','35f023b8-4cc6-4582-86b5-a48a8eb8d89f'),(563,6,117,31,0,1,'2019-05-14 19:35:07','2019-05-14 19:35:07','b0a40059-1ddf-43fa-ab19-7501c85f625f'),(564,6,117,32,0,2,'2019-05-14 19:35:07','2019-05-14 19:35:07','e3b4e6bf-e4f5-4af1-aa38-e2c356eb94f6'),(565,6,117,38,0,3,'2019-05-14 19:35:08','2019-05-14 19:35:08','55f31d1a-4e01-40b1-acd7-4ce247464401'),(566,6,117,39,0,4,'2019-05-14 19:35:08','2019-05-14 19:35:08','7c22bca7-b8f8-49da-a31e-db4e2f9c52dd'),(567,6,117,40,0,5,'2019-05-14 19:35:08','2019-05-14 19:35:08','87806717-11fe-4a4c-bae8-1f0e12392776'),(568,7,118,41,0,1,'2019-05-14 19:35:08','2019-05-14 19:35:08','510ed73c-d46c-453e-a38d-edb362311ef7'),(569,7,118,42,0,2,'2019-05-14 19:35:08','2019-05-14 19:35:08','37cba214-1532-4de9-b841-2056d196b74c'),(570,7,118,43,1,3,'2019-05-14 19:35:08','2019-05-14 19:35:08','063ccc9e-0c7b-4223-9325-a0dbc10bf0a5'),(571,7,118,45,0,4,'2019-05-14 19:35:08','2019-05-14 19:35:08','56c701c6-404e-4551-b954-5ec0245b56dd'),(572,7,118,46,0,5,'2019-05-14 19:35:08','2019-05-14 19:35:08','cf9b26f2-8c70-45da-9797-54d86b32393b'),(573,7,118,61,0,6,'2019-05-14 19:35:08','2019-05-14 19:35:08','19936a28-24c5-42c3-a7f1-4af56a451548'),(574,8,119,47,0,1,'2019-05-14 19:35:08','2019-05-14 19:35:08','8c30d38a-b767-4456-b835-bd3d1177311c'),(575,8,119,48,0,2,'2019-05-14 19:35:08','2019-05-14 19:35:08','d9111472-d217-46e9-a656-d5022f2ef81a'),(576,8,119,49,0,3,'2019-05-14 19:35:08','2019-05-14 19:35:08','85aad622-7092-4cff-9361-b081e4863f68'),(577,8,119,50,0,4,'2019-05-14 19:35:08','2019-05-14 19:35:08','0e94c4a1-7489-4e9f-86f5-68e49405d98e'),(578,8,119,51,0,5,'2019-05-14 19:35:08','2019-05-14 19:35:08','743cc234-dca4-437a-a85d-fc7b7d822ba2'),(579,8,119,52,0,6,'2019-05-14 19:35:08','2019-05-14 19:35:08','2e083c48-763a-47ab-9961-1907c531fac0'),(580,2,120,11,1,1,'2019-05-16 19:56:03','2019-05-16 19:56:03','dde758b9-054f-4bfa-a9b7-5dd232a6b776'),(581,2,120,12,1,2,'2019-05-16 19:56:03','2019-05-16 19:56:03','1522a38e-09e8-4b63-89b6-85854a16aef2'),(582,2,120,13,1,3,'2019-05-16 19:56:03','2019-05-16 19:56:03','141043f7-ba1f-4155-bc5f-b3c972e7c94a'),(612,11,138,1,0,1,'2019-05-16 20:21:53','2019-05-16 20:21:53','ba2f8d64-cb78-46fd-becf-b648b5337fc6'),(613,11,138,66,0,2,'2019-05-16 20:21:53','2019-05-16 20:21:53','08ffcb8d-7543-4804-82b2-422ba68e3137'),(614,11,139,4,0,1,'2019-05-16 20:21:53','2019-05-16 20:21:53','8e823ac0-76b5-40f4-a6bc-085681fe9664'),(615,13,140,59,0,1,'2019-05-16 20:23:45','2019-05-16 20:23:45','0e252c9f-ccdd-49aa-8f8d-18e22e0a7890'),(616,10,141,57,0,1,'2019-05-16 20:36:02','2019-05-16 20:36:02','bf4b3d60-a853-4a99-aa08-cdbe4141d3bd'),(617,10,141,14,0,2,'2019-05-16 20:36:02','2019-05-16 20:36:02','f69178bd-be0c-400e-bd67-8f811fdcb79c'),(618,10,141,3,0,3,'2019-05-16 20:36:02','2019-05-16 20:36:02','0f6e542e-9e61-4dd6-b840-bbc9ba037247'),(619,10,141,68,0,4,'2019-05-16 20:36:02','2019-05-16 20:36:02','6e015c93-a1f3-4c66-80c6-01522d94e12c'),(620,10,142,15,0,1,'2019-05-16 20:36:02','2019-05-16 20:36:02','1f00e2f2-3172-49d0-a2cf-4e94c6683bea'),(621,10,143,4,0,1,'2019-05-16 20:36:02','2019-05-16 20:36:02','91b88269-cce8-4d9c-9554-756d82fd821d'),(630,18,148,57,0,1,'2019-05-16 20:36:18','2019-05-16 20:36:18','495e4b34-d681-4138-b6f2-ad4a3eb336b7'),(631,18,148,14,0,2,'2019-05-16 20:36:18','2019-05-16 20:36:18','8218edd1-6c2c-4254-8659-328055b7eff8'),(632,18,148,3,0,3,'2019-05-16 20:36:18','2019-05-16 20:36:18','2bf78d0f-9cd3-4b6d-81f0-de92c2e1662a'),(633,18,148,68,0,4,'2019-05-16 20:36:18','2019-05-16 20:36:18','ae4c2922-218b-4abf-86c1-db7ef6fc2d37'),(634,18,149,4,0,1,'2019-05-16 20:36:18','2019-05-16 20:36:18','6bda6c8c-1626-41c3-95a7-c790d3e27ce8'),(635,9,150,57,0,1,'2019-05-16 20:36:27','2019-05-16 20:36:27','f27a72af-e87f-4fd0-bf8a-c2cbd5ee70ba'),(636,9,150,14,0,2,'2019-05-16 20:36:27','2019-05-16 20:36:27','a40df4c1-896e-4023-b305-5c986a0a44e7'),(637,9,150,3,0,3,'2019-05-16 20:36:27','2019-05-16 20:36:27','b8f0bc98-4acc-47da-9e02-459dab3f7c35'),(638,9,150,68,0,4,'2019-05-16 20:36:27','2019-05-16 20:36:27','434634a4-c562-41c1-91ac-d9b31c628883'),(639,9,151,67,0,1,'2019-05-16 20:36:27','2019-05-16 20:36:27','c89b0cb1-7709-4d3f-8ecb-4afbf1de13e9'),(640,9,151,1,0,2,'2019-05-16 20:36:27','2019-05-16 20:36:27','c3a3c0c7-2971-41a4-ac4b-bf2e02b82d00'),(641,9,152,15,0,1,'2019-05-16 20:36:27','2019-05-16 20:36:27','e47676fa-5277-4e9c-936c-5ba98ba4537a'),(642,9,153,4,0,1,'2019-05-16 20:36:27','2019-05-16 20:36:27','f3903aba-6d05-4c8d-ad8c-5da691e87ffc'),(643,19,154,57,0,1,'2019-05-16 20:36:43','2019-05-16 20:36:43','2ba6131a-618d-44e9-8b42-739e0cdbd98a'),(644,19,154,14,0,2,'2019-05-16 20:36:43','2019-05-16 20:36:43','64edd245-ce5b-4282-bab1-d8521b69b6d2'),(645,19,154,3,0,3,'2019-05-16 20:36:43','2019-05-16 20:36:43','01622d4a-4e2d-4c37-80bf-cd2a008ef96f'),(646,19,154,68,0,4,'2019-05-16 20:36:43','2019-05-16 20:36:43','8addd321-81b2-4247-93db-7e168adc3fe3'),(647,19,155,15,0,1,'2019-05-16 20:36:43','2019-05-16 20:36:43','19a50c55-c5d2-490b-93fd-4456e86f503b'),(648,19,156,66,0,1,'2019-05-16 20:36:43','2019-05-16 20:36:43','12b38a15-b2d7-414a-8db8-1e6dc38d4ed8'),(649,19,157,4,0,1,'2019-05-16 20:36:43','2019-05-16 20:36:43','7c77e449-b5b1-4af4-bf30-6ff48ef671b6'),(650,12,158,57,0,1,'2019-05-16 20:50:10','2019-05-16 20:50:10','18bb9e76-ddec-4646-8561-37ad6986efb9'),(651,12,158,3,0,2,'2019-05-16 20:50:10','2019-05-16 20:50:10','e7886b48-4dd6-4035-9aaf-0f0da20cc9f7'),(652,12,158,68,0,3,'2019-05-16 20:50:10','2019-05-16 20:50:10','78257fc9-ff64-4377-9499-c67a3c542669'),(653,12,159,58,0,1,'2019-05-16 20:50:10','2019-05-16 20:50:10','a6674fab-8c8f-49b2-9e80-e88be0fffe43'),(654,12,159,15,0,2,'2019-05-16 20:50:10','2019-05-16 20:50:10','93ec5aec-3782-41ef-8122-809583260dcf'),(655,12,160,2,0,1,'2019-05-16 20:50:10','2019-05-16 20:50:10','23bc8517-33ad-433a-bda9-b1b6e14e8cf6'),(656,12,161,4,0,1,'2019-05-16 20:50:10','2019-05-16 20:50:10','6ce67d20-211d-4eed-8b6f-e9893f6268e5');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`),
  KEY `craft_fieldlayouts_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouts` VALUES (1,'craft\\elements\\Category','2018-05-11 21:18:44','2018-05-11 21:18:44',NULL,'b7615ce6-e10f-4ef9-959d-59a3e3223e61'),(2,'verbb\\supertable\\elements\\SuperTableBlockElement','2018-05-11 21:33:58','2019-05-16 19:56:03',NULL,'9d3fbd7f-982f-4d7d-9cc0-436aeea65277'),(3,'craft\\elements\\MatrixBlock','2018-05-11 21:55:51','2019-05-14 19:35:06',NULL,'50e9c9ad-4f49-417f-af33-b52bc374c040'),(4,'craft\\elements\\MatrixBlock','2018-05-11 21:55:51','2019-05-14 19:35:07',NULL,'d20a1cad-d43d-48e8-89da-1c99a932ff1b'),(5,'verbb\\supertable\\elements\\SuperTableBlockElement','2018-05-11 21:55:51','2019-05-14 19:35:07',NULL,'df1ce051-b5f2-4828-a942-c11ae215b802'),(6,'craft\\elements\\MatrixBlock','2018-05-11 21:55:51','2019-05-14 19:35:07',NULL,'f9a72095-233b-453b-94a0-1cb95a4563f8'),(7,'craft\\elements\\MatrixBlock','2018-05-11 21:55:51','2019-05-14 19:35:08',NULL,'6f4a765d-210d-41d6-bba9-c84e3fa09007'),(8,'craft\\elements\\MatrixBlock','2018-05-11 21:55:52','2019-05-14 19:35:08',NULL,'5bf0d3be-806f-4d36-a087-834c2c5b0c53'),(9,'craft\\elements\\Entry','2018-05-14 14:59:28','2019-05-16 20:36:27',NULL,'70db9947-6e7d-42a3-b538-60b3d7989188'),(10,'craft\\elements\\Entry','2018-05-14 15:04:42','2019-05-16 20:36:02',NULL,'61765146-63b7-4cc3-950a-c25a88abc2c3'),(11,'craft\\elements\\Entry','2018-05-14 15:06:57','2019-05-16 20:21:53',NULL,'ac873075-60da-4963-b1c7-5127da148f22'),(12,'craft\\elements\\Entry','2018-05-14 15:17:05','2019-05-16 20:50:10',NULL,'759646fa-3664-4ea0-bdef-d94ebaea73f1'),(13,'craft\\elements\\Entry','2018-05-14 15:23:14','2019-05-16 20:23:45',NULL,'d50a1693-f901-4856-acb0-68de049ea3fa'),(14,'craft\\elements\\GlobalSet','2018-05-14 15:30:58','2018-05-14 15:30:58',NULL,'397af85f-1f0b-429f-9071-c0a2c9764809'),(15,'craft\\elements\\Asset','2018-05-14 15:32:29','2018-05-14 18:45:03',NULL,'3cfb1d71-7d9b-479c-86c7-54e923837a75'),(17,'barrelstrength\\sproutforms\\elements\\Form','2018-05-14 20:13:00','2018-05-14 20:13:00',NULL,'c0c0e91b-4c05-4bbf-9dba-5825f65b673f'),(18,'craft\\elements\\Entry','2019-03-08 18:52:52','2019-05-16 20:36:18',NULL,'29bb2b6d-7cdb-44fc-86c2-2185b49eae11'),(19,'craft\\elements\\Entry','2019-05-16 20:21:34','2019-05-16 20:36:43',NULL,'cb439362-f517-49f9-ad3b-0841508172c9');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouttabs` VALUES (32,14,'Global Content',1,'2018-05-14 15:30:58','2018-05-14 15:30:58','9d833c84-f091-45c6-aefa-4ca6f315583a'),(85,17,'Tab 1',1,'2018-05-14 20:13:00','2018-05-14 20:13:00','f30d662f-631f-4e94-9d3f-d4aeada3c0bc'),(114,3,'Content',1,'2019-05-14 19:35:06','2019-05-14 19:35:06','cf01843e-fc65-4411-a589-c4be901705dc'),(115,4,'Content',1,'2019-05-14 19:35:07','2019-05-14 19:35:07','8fe41a25-5e53-4e4b-81a9-a72d82c9f68d'),(116,5,'Content',1,'2019-05-14 19:35:07','2019-05-14 19:35:07','0a349050-ed07-418c-a6e2-3c01f8e91b52'),(117,6,'Content',1,'2019-05-14 19:35:07','2019-05-14 19:35:07','e799f08c-b74c-4181-8c34-ab1b5905306e'),(118,7,'Content',1,'2019-05-14 19:35:08','2019-05-14 19:35:08','529685cf-71d9-4464-bfb2-cae96c67a48a'),(119,8,'Content',1,'2019-05-14 19:35:08','2019-05-14 19:35:08','1f6e83e1-80ff-42a7-a7fd-e183a9717b1d'),(120,2,'Content',1,'2019-05-16 19:56:03','2019-05-16 19:56:03','852f58c8-929d-4bd0-83d1-0063c141a13a'),(138,11,'Content',1,'2019-05-16 20:21:53','2019-05-16 20:21:53','a3fbb43f-5fa8-40c7-b660-aaae52cfb6eb'),(139,11,'SEO',2,'2019-05-16 20:21:53','2019-05-16 20:21:53','7510de67-0471-4e58-a300-957ede551f30'),(140,13,'Link',1,'2019-05-16 20:23:45','2019-05-16 20:23:45','01fee16d-2a20-4e7b-b3ee-c55a24690802'),(141,10,'Header',1,'2019-05-16 20:36:02','2019-05-16 20:36:02','95775c05-a30a-49c6-b580-707bb791c4e2'),(142,10,'Content',2,'2019-05-16 20:36:02','2019-05-16 20:36:02','747a82f9-e38c-4c49-b8c1-453c4bbd574f'),(143,10,'SEO',3,'2019-05-16 20:36:02','2019-05-16 20:36:02','244f18a5-5ea7-4bb0-a4a8-d9cd95b51120'),(148,18,'Header',1,'2019-05-16 20:36:18','2019-05-16 20:36:18','b1f9cadb-92da-4a6f-a6d9-883cb4dca24c'),(149,18,'SEO',2,'2019-05-16 20:36:18','2019-05-16 20:36:18','08217b39-7fd7-447d-b272-581ce641670e'),(150,9,'Header',1,'2019-05-16 20:36:27','2019-05-16 20:36:27','f92ec830-b377-45c3-afaf-71e6509acf5b'),(151,9,'A Section',2,'2019-05-16 20:36:27','2019-05-16 20:36:27','17c874ce-bec6-4754-89b9-ecd235b8e77c'),(152,9,'Content',3,'2019-05-16 20:36:27','2019-05-16 20:36:27','37e6f402-8f73-4caf-8d9a-06c94d67c545'),(153,9,'SEO',4,'2019-05-16 20:36:27','2019-05-16 20:36:27','ce8df6f1-4ee5-4956-bbdb-4ce3aca3fb2c'),(154,19,'Header',1,'2019-05-16 20:36:43','2019-05-16 20:36:43','f6834feb-fd53-4c72-b078-2e68a40c7431'),(155,19,'Content',2,'2019-05-16 20:36:43','2019-05-16 20:36:43','d612e71d-1979-485e-948a-924389bae0d3'),(156,19,'Code',3,'2019-05-16 20:36:43','2019-05-16 20:36:43','8a4612f7-3094-4821-98a0-22116c44340f'),(157,19,'SEO',4,'2019-05-16 20:36:43','2019-05-16 20:36:43','2c1b96c2-e30a-4371-8be1-1f2ced00e3a9'),(158,12,'Header',1,'2019-05-16 20:50:10','2019-05-16 20:50:10','e1d4a175-f981-4edb-93cd-c8c9340bf8cf'),(159,12,'Content',2,'2019-05-16 20:50:10','2019-05-16 20:50:10','43bac58c-1d7d-45bf-a68e-cd5c2fa6d312'),(160,12,'Categories',3,'2019-05-16 20:50:10','2019-05-16 20:50:10','2dd21d1e-b65b-4804-9e5e-ec93c55d5b02'),(161,12,'SEO',4,'2019-05-16 20:50:10','2019-05-16 20:50:10','107384ed-5508-47a7-a6cb-a1bc127d11c5');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_groupId_idx` (`groupId`),
  KEY `craft_fields_context_idx` (`context`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
INSERT INTO `craft_fields` VALUES (1,1,'Body','body','global','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2018-05-11 21:28:20','2019-05-16 19:50:40','e267f965-256f-41c1-9ccb-8c91d439a39e'),(2,7,'Categories','categories','global','',1,'site',NULL,'craft\\fields\\Categories','{\"branchLimit\":\"\",\"sources\":\"*\",\"source\":\"group:323d26da-669b-4127-aebc-6b98cebd6f87\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-05-11 21:28:37','2019-05-16 19:50:59','3a218bd1-4fff-4124-a4fb-805a86239988'),(3,5,'Featured Image','featuredImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-05-11 21:28:59','2019-05-16 19:51:46','2190ab65-3804-4128-90aa-411c9aa4ec7e'),(4,3,'SEO','seo','global','',1,'none',NULL,'ether\\seo\\fields\\SeoField','{\"titleSuffix\":\"\",\"suffixAsPrefix\":\"\",\"title\":[{\"key\":\"1\",\"template\":\"{title}\",\"locked\":false}],\"description\":null,\"socialImage\":null,\"hideSocial\":\"\",\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}','2018-05-11 21:29:38','2019-02-01 16:43:31','1135c680-b3de-4280-8fb3-b5fa62751729'),(5,4,'Address','address','global','',1,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a row\",\"maxRows\":\"\",\"minRows\":\"\",\"columns\":{\"col1\":{\"heading\":\"Address Line\",\"handle\":\"addressLine\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":null,\"columnType\":\"text\"}','2018-05-11 21:30:13','2018-05-11 21:30:13','30b2a43a-c406-418f-8b0a-d6511a5da70b'),(6,4,'Copyright Information','copyrightInformation','global','Exclude Date',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:30:41','2018-05-11 21:30:41','e0e054f3-4c78-4cc5-a14e-a240d874ee18'),(7,4,'Email','email','global','',1,'none',NULL,'craft\\fields\\Email','[]','2018-05-11 21:31:22','2018-05-11 21:31:22','bd7485f0-a8ac-4498-87b9-e2ff4b27b74f'),(8,4,'Google Analytics ID','googleAnalyticsId','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:31:37','2018-05-11 21:31:37','c55c6ce6-e4d9-4340-a8f7-8ea0305bf9ab'),(9,4,'Phone Number','phoneNumber','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:31:48','2018-05-11 21:31:48','26087618-9f03-46d8-990a-1265251747da'),(10,4,'Social Media','socialMedia','global','',1,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"minRows\":\"\",\"maxRows\":\"\",\"contentTable\":\"{{%stc_socialmedia}}\",\"localizeBlocks\":false,\"staticField\":\"\",\"columns\":{\"11\":{\"width\":\"\"},\"12\":{\"width\":\"\"},\"13\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"selectionLabel\":\"\"}','2018-05-11 21:33:57','2019-05-16 19:56:02','34e35771-dc3e-413a-a053-399986a4d61a'),(11,NULL,'Link','networkLink','superTableBlockType:03e085a2-6e6c-4f47-a4dd-64adf65badb0','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\",\"maxLength\":\"255\"}','2018-05-11 21:33:58','2019-05-16 19:56:02','835d31bc-a712-456a-9ff5-77b5715bbb84'),(12,NULL,'Network Name','networkName','superTableBlockType:03e085a2-6e6c-4f47-a4dd-64adf65badb0','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:33:58','2019-05-16 19:56:02','e78f1b7b-de5c-48ba-a302-7dc555c4c6ad'),(13,NULL,'Icon','networkIcon','superTableBlockType:03e085a2-6e6c-4f47-a4dd-64adf65badb0','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-05-11 21:33:58','2019-05-16 19:56:02','f4648925-192c-4707-af3e-049af7900b7d'),(14,5,'Blurb','blurb','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:35:08','2019-05-16 19:57:12','c5326bc4-845f-47d9-aaf7-a4cd20b126d9'),(15,1,'Content','contentOptions','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_contentoptions}}\",\"localizeBlocks\":false}','2018-05-11 21:55:50','2019-05-14 19:35:06','c5151553-9805-4587-97c9-86eb7bf6df8d'),(16,NULL,'Title','contentTitle','matrixBlockType:42d3f561-e744-4ccd-a2ba-fa2141145f01','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:06','09d032ea-e926-4d23-af3e-f93573601926'),(17,NULL,'Content','contentContent','matrixBlockType:42d3f561-e744-4ccd-a2ba-fa2141145f01','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2018-05-11 21:55:51','2019-05-14 19:35:06','6281a520-7a62-4450-a89d-b35b1cb8bbb7'),(20,NULL,'Content Alignment','contentAlignment','matrixBlockType:42d3f561-e744-4ccd-a2ba-fa2141145f01','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:06','3e2a5363-527c-48c5-b0db-96632596da03'),(21,NULL,'Theme','contentTheme','matrixBlockType:42d3f561-e744-4ccd-a2ba-fa2141145f01','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Light\",\"value\":\"light\",\"default\":\"\"},{\"label\":\"Dark\",\"value\":\"dark\",\"default\":\"\"},{\"label\":\"Stripped\",\"value\":\"stripped\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:06','40152c94-468d-4556-83da-aafb52d73cd9'),(22,NULL,'Animation Style','contentAnimationStyle','matrixBlockType:42d3f561-e744-4ccd-a2ba-fa2141145f01','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Fade In\",\"value\":\"fadeIn\",\"default\":\"\"},{\"label\":\"Fade Up\",\"value\":\"fadeUp\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:06','e8f47125-180a-40b3-890f-689abe4c58cf'),(23,NULL,'Title','icpTitle','matrixBlockType:7026f589-a794-480d-8525-7bcfbffc210b','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:06','d37dc137-c3e7-4b7d-b372-70c0c0667b5d'),(24,NULL,'Image','icpImage','matrixBlockType:7026f589-a794-480d-8525-7bcfbffc210b','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-05-11 21:55:51','2019-05-14 19:35:06','beb114be-2742-42b9-b11b-d03ced4a8457'),(25,NULL,'Content','icpContent','matrixBlockType:7026f589-a794-480d-8525-7bcfbffc210b','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2018-05-11 21:55:51','2019-05-14 19:35:06','5c8ed304-1f93-4047-88cc-d65d3544845c'),(28,NULL,'Position of Image','icpPositionOfImage','matrixBlockType:7026f589-a794-480d-8525-7bcfbffc210b','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Left of Content\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right of Content\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Above Content\",\"value\":\"above\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:07','f21907c8-e5a8-49cf-8d4d-d88684a4acbf'),(29,NULL,'Theme','icpTheme','matrixBlockType:7026f589-a794-480d-8525-7bcfbffc210b','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Light\",\"value\":\"light\",\"default\":\"\"},{\"label\":\"Dark\",\"value\":\"dark\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:07','7d720da0-8003-42b4-a11f-a8ef6e0f573f'),(30,NULL,'Animation Style','icpAnimationStyle','matrixBlockType:7026f589-a794-480d-8525-7bcfbffc210b','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Fade In\",\"value\":\"fadeIn\",\"default\":\"\"},{\"label\":\"Fade Up\",\"value\":\"fadeUp\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:07','27fdd618-9b5a-4ff7-ab93-0d028aaa1277'),(31,NULL,'Title','columnsTitle','matrixBlockType:102b59cb-35d1-401f-aaaf-be2afb993c3c','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:07','6c7c4a60-4464-4b19-a90b-460f5c9beaa5'),(32,NULL,'Columns','columns','matrixBlockType:102b59cb-35d1-401f-aaaf-be2afb993c3c','',1,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"minRows\":\"\",\"maxRows\":\"\",\"contentTable\":\"{{%stc_3_columns}}\",\"localizeBlocks\":false,\"staticField\":\"\",\"columns\":{\"33\":{\"width\":\"\"},\"34\":{\"width\":\"\"},\"35\":{\"width\":\"\"},\"36\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"selectionLabel\":\"\"}','2018-05-11 21:55:51','2019-05-14 19:35:07','72a2c624-0173-43b5-87e4-046ac88fd9b3'),(33,NULL,'Title','columnTitle','superTableBlockType:5f1a587e-e57f-4299-9424-8cce435477b8','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:07','36865e3f-b021-43f6-8553-1e5d5fd859fb'),(34,NULL,'Content','columnContent','superTableBlockType:5f1a587e-e57f-4299-9424-8cce435477b8','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:07','032c1e08-d8f5-418e-9db4-384b54881263'),(35,NULL,'Icon','columnIcon','superTableBlockType:5f1a587e-e57f-4299-9424-8cce435477b8','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-05-11 21:55:51','2019-05-14 19:35:07','79e8c6f2-6075-41b2-9879-3c4262bc2c63'),(36,NULL,'Link','columnLink','superTableBlockType:5f1a587e-e57f-4299-9424-8cce435477b8','',1,'none',NULL,'typedlinkfield\\fields\\LinkField','{\"allowCustomText\":\"1\",\"allowedLinkNames\":{\"3\":\"entry\",\"6\":\"custom\",\"7\":\"email\",\"8\":\"tel\",\"9\":\"url\"},\"allowTarget\":\"1\",\"autoNoReferrer\":\"\",\"defaultLinkName\":\"url\",\"defaultText\":\"\",\"enableAriaLabel\":\"\",\"enableTitle\":\"\",\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"category\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"entry\":{\"sources\":[\"singles\",\"section:d51d9643-6d8e-4c3b-9fcd-a685f036f407\",\"section:cd800274-c8bb-466b-ad46-9c01b222c6f6\",\"section:162013e0-f191-4fca-a9bf-5d8a49c574e7\"],\"allowCustomQuery\":\"\"},\"site\":{\"sites\":\"*\"},\"user\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"custom\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"email\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"tel\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"url\":{\"disableValidation\":\"\",\"allowAliases\":\"\"}}}','2018-05-11 21:55:51','2019-05-14 19:35:07','32e24e2c-e245-4614-b21c-a3a427326d32'),(38,NULL,'Column Count','columnCount','matrixBlockType:102b59cb-35d1-401f-aaaf-be2afb993c3c','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"3\",\"value\":\"\",\"default\":\"\"},{\"label\":\"4\",\"value\":\"\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:07','18a7d2f2-28de-4155-94e0-485098cc7694'),(39,NULL,'Theme','columnsTheme','matrixBlockType:102b59cb-35d1-401f-aaaf-be2afb993c3c','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Light\",\"value\":\"light\",\"default\":\"\"},{\"label\":\"Dark\",\"value\":\"dark\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:07','c1c044b1-c39f-4b4e-9035-eaaf9b26ddb9'),(40,NULL,'Animation Styles','columnsAnimationStyle','matrixBlockType:102b59cb-35d1-401f-aaaf-be2afb993c3c','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Fade In\",\"value\":\"fadeIn\",\"default\":\"\"},{\"label\":\"Fade Up\",\"value\":\"fadeUp\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:07','27a6b29f-1742-4dc5-a85c-635f2ea6ca8c'),(41,NULL,'Title','ctaTitle','matrixBlockType:051d05ee-f0e4-4cc4-916d-d0d79941e3c0','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:08','d1e17199-ca47-4faa-a957-fca3496733e2'),(42,NULL,'Text','ctaText','matrixBlockType:051d05ee-f0e4-4cc4-916d-d0d79941e3c0','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:08','91371eaf-c6e1-4ac4-8501-10c5b9daf201'),(43,NULL,'Link','ctaLink','matrixBlockType:051d05ee-f0e4-4cc4-916d-d0d79941e3c0','',1,'none',NULL,'typedlinkfield\\fields\\LinkField','{\"allowCustomText\":\"1\",\"allowedLinkNames\":{\"3\":\"entry\",\"6\":\"custom\",\"7\":\"email\",\"8\":\"tel\",\"9\":\"url\"},\"allowTarget\":\"1\",\"autoNoReferrer\":\"\",\"defaultLinkName\":\"url\",\"defaultText\":\"\",\"enableAriaLabel\":\"\",\"enableTitle\":\"\",\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"category\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"entry\":{\"sources\":[\"singles\",\"section:d51d9643-6d8e-4c3b-9fcd-a685f036f407\",\"section:cd800274-c8bb-466b-ad46-9c01b222c6f6\",\"section:162013e0-f191-4fca-a9bf-5d8a49c574e7\"],\"allowCustomQuery\":\"\"},\"site\":{\"sites\":\"*\"},\"user\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"custom\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"email\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"tel\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"url\":{\"disableValidation\":\"\",\"allowAliases\":\"\"}}}','2018-05-11 21:55:51','2019-05-14 19:35:08','771a02c0-92fb-4a24-9008-164d16755e02'),(45,NULL,'Background Image','ctaBackgroundImage','matrixBlockType:051d05ee-f0e4-4cc4-916d-d0d79941e3c0','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2018-05-11 21:55:51','2019-05-14 19:35:08','dfa58ec7-e02e-4ea1-98c4-ad7b602e68f2'),(46,NULL,'Content Alignment','ctaContentAlignment','matrixBlockType:051d05ee-f0e4-4cc4-916d-d0d79941e3c0','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:08','5c17a5ea-fe86-47a0-a2c9-df1465d7579c'),(47,NULL,'Title','formTitle','matrixBlockType:bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:08','72ff9eea-1166-40ed-be70-a4dc3abd50d4'),(48,NULL,'Form','form','matrixBlockType:bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-11 21:55:51','2019-05-14 19:35:08','f5a5f427-da5a-4441-b84c-bc5e439b565d'),(49,NULL,'Content','formContent','matrixBlockType:bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2018-05-11 21:55:51','2019-05-14 19:35:08','b1b31e81-d0dc-48cc-bd01-30cef55e1dc4'),(50,NULL,'Position of Content','formPositionOfContent','matrixBlockType:bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Left of Form\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right of Form\",\"value\":\"right\",\"default\":\"\"},{\"label\":\"Above Form\",\"value\":\"above\",\"default\":\"\"}]}','2018-05-11 21:55:51','2019-05-14 19:35:08','bad4fcdb-940c-4dbf-8ebb-b6c7cde431c9'),(51,NULL,'Theme','formTheme','matrixBlockType:bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Light\",\"value\":\"light\",\"default\":\"\"},{\"label\":\"Dark\",\"value\":\"dark\",\"default\":\"\"}]}','2018-05-11 21:55:52','2019-05-14 19:35:08','8d34d69c-1bb0-49fb-8af0-0112ba48e487'),(52,NULL,'Animation','formAnimation','matrixBlockType:bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":\"\"},{\"label\":\"Fade In\",\"value\":\"fadeIn\",\"default\":\"\"},{\"label\":\"Fade Up\",\"value\":\"fadeUp\",\"default\":\"\"}]}','2018-05-11 21:55:52','2019-05-14 19:35:08','27c77dcf-de41-42ba-855d-f5bedfeff24a'),(57,5,'Custom Title','customTitle','global','Will be used in the header in place of the page title.',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-14 15:02:36','2018-05-14 15:03:29','4aa573ae-3f1e-4ed8-b948-72619d90bf8b'),(58,1,'Excerpt','excerpt','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2018-05-14 15:18:30','2019-05-16 19:52:03','cb963363-bf23-44b7-a28b-2be99804d07d'),(59,6,'Link','navigationLink','global','',1,'none',NULL,'typedlinkfield\\fields\\LinkField','{\"allowCustomText\":\"\",\"allowedLinkNames\":[\"url\",\"category\",\"entry\"],\"allowTarget\":\"\",\"defaultLinkName\":\"entry\",\"defaultText\":\"\",\"typeSettings\":{\"url\":{\"disableValidation\":\"\"},\"email\":{\"disableValidation\":\"1\"},\"tel\":{\"disableValidation\":\"1\"},\"asset\":{\"sources\":\"\"},\"category\":{\"sources\":\"*\"},\"entry\":{\"sources\":[\"singles\",\"section:4\",\"section:3\",\"section:2\"]},\"globalset\":{\"sources\":\"\"}}}','2018-05-14 15:22:21','2018-05-14 19:31:11','af0df129-5f1a-4988-9b96-6af4602b2a8f'),(61,NULL,'Theme','ctaTheme','matrixBlockType:051d05ee-f0e4-4cc4-916d-d0d79941e3c0','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Light\",\"value\":\"light\",\"default\":\"\"},{\"label\":\"Dark\",\"value\":\"dark\",\"default\":\"\"}]}','2018-05-14 19:57:58','2019-05-14 19:35:08','d2a8e5ff-729c-4ca6-a68b-b66db300c673'),(63,NULL,'Name','name1','sproutForms:12','',1,'none',NULL,'barrelstrength\\sproutforms\\fields\\formfields\\Name','{\"cssClasses\":null,\"displayMultipleFields\":null,\"displayMiddleName\":null,\"displayPrefix\":null,\"displaySuffix\":null}','2018-05-14 20:12:53','2018-05-14 20:12:53','823bc82c-d7dc-4e74-bb0e-9f189024381c'),(64,NULL,'Checkboxes','checkboxes1','sproutForms:12','',1,'none',NULL,'barrelstrength\\sproutforms\\fields\\formfields\\Checkboxes','{\"cssClasses\":null,\"options\":[]}','2018-05-14 20:12:58','2018-05-14 20:12:58','aa0a5965-5bcd-4d3a-9bd4-841b09dd0362'),(65,1,'Link','linkUrl','global','',1,'none',NULL,'typedlinkfield\\fields\\LinkField','{\"allowCustomText\":\"1\",\"allowedLinkNames\":{\"3\":\"entry\",\"6\":\"custom\",\"7\":\"email\",\"8\":\"tel\",\"9\":\"url\"},\"allowTarget\":\"1\",\"autoNoReferrer\":\"\",\"defaultLinkName\":\"asset\",\"defaultText\":\"\",\"enableAriaLabel\":\"\",\"enableTitle\":\"\",\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"category\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"entry\":{\"sources\":[\"singles\",\"section:d51d9643-6d8e-4c3b-9fcd-a685f036f407\",\"section:cd800274-c8bb-466b-ad46-9c01b222c6f6\",\"section:162013e0-f191-4fca-a9bf-5d8a49c574e7\"],\"allowCustomQuery\":\"\"},\"site\":{\"sites\":\"*\"},\"user\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"custom\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"email\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"tel\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"url\":{\"disableValidation\":\"\",\"allowAliases\":\"\"}}}','2019-05-16 19:52:51','2019-05-16 19:52:51','82ae06c2-3a25-4640-a900-028408b901bc'),(66,1,'Third Party Code','thirdPartyCode','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-16 19:53:38','2019-05-16 19:53:38','585a95bd-22d6-4056-8602-b50d9f744d38'),(67,1,'Headline','headline','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-16 19:54:07','2019-05-16 19:54:07','25b8d0e1-eb03-4d5d-ae0b-3ccafb57929b'),(68,5,'Alignment','alignment','global','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"}]}','2019-05-16 20:35:36','2019-05-16 20:35:36','7658813e-75b0-48d1-9890-30da927750b6');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_globalsets_name_idx` (`name`),
  KEY `craft_globalsets_handle_idx` (`handle`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
INSERT INTO `craft_globalsets` VALUES (3,'Global Content','globalContent',14,'2018-05-14 15:30:58','2018-05-14 15:30:58','bf84af81-bf5a-42a6-b886-5047fd0fcf3b');
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'3.1.27','3.1.28',0,'a:18:{s:12:\"dateModified\";i:1558040123;s:10:\"siteGroups\";a:1:{s:36:\"ef50568e-a83f-4fcf-9f52-d997980e32e2\";a:1:{s:4:\"name\";s:6:\"Craft3\";}}s:5:\"sites\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:8:{s:4:\"name\";s:6:\"Craft3\";s:6:\"handle\";s:7:\"default\";s:8:\"language\";s:5:\"en-US\";s:7:\"hasUrls\";s:1:\"1\";s:7:\"baseUrl\";s:5:\"@web/\";s:9:\"sortOrder\";s:1:\"1\";s:7:\"primary\";s:1:\"1\";s:9:\"siteGroup\";s:36:\"ef50568e-a83f-4fcf-9f52-d997980e32e2\";}}s:8:\"sections\";a:6:{s:36:\"162013e0-f191-4fca-a9bf-5d8a49c574e7\";a:8:{s:4:\"name\";s:5:\"Pages\";s:6:\"handle\";s:5:\"pages\";s:4:\"type\";s:9:\"structure\";s:16:\"enableVersioning\";b:1;s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:9:\"uriFormat\";s:6:\"{slug}\";s:8:\"template\";s:17:\"_pages/index.html\";}}s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"24e3e58e-98de-4eb5-a1e9-9dfd7df4e7b1\";s:9:\"maxLevels\";N;}s:10:\"entryTypes\";a:2:{s:36:\"2577637e-2710-4745-a39e-6e5f2af6e29a\";a:7:{s:4:\"name\";s:8:\"Standard\";s:6:\"handle\";s:8:\"standard\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"61765146-63b7-4cc3-950a-c25a88abc2c3\";a:1:{s:4:\"tabs\";a:3:{i:0;a:3:{s:4:\"name\";s:6:\"Header\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"4aa573ae-3f1e-4ed8-b948-72619d90bf8b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c5326bc4-845f-47d9-aaf7-a4cd20b126d9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"2190ab65-3804-4128-90aa-411c9aa4ec7e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"7658813e-75b0-48d1-9890-30da927750b6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}i:1;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:1:{s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:2;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:3;s:6:\"fields\";a:1:{s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}s:36:\"934add47-15af-44e1-9de0-151206bbe75d\";a:7:{s:4:\"name\";s:20:\"With Thirdparty Code\";s:6:\"handle\";s:8:\"withCode\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:2;s:12:\"fieldLayouts\";a:1:{s:36:\"cb439362-f517-49f9-ad3b-0841508172c9\";a:1:{s:4:\"tabs\";a:4:{i:0;a:3:{s:4:\"name\";s:6:\"Header\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"4aa573ae-3f1e-4ed8-b948-72619d90bf8b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c5326bc4-845f-47d9-aaf7-a4cd20b126d9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"2190ab65-3804-4128-90aa-411c9aa4ec7e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"7658813e-75b0-48d1-9890-30da927750b6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}i:1;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:1:{s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:2;a:3:{s:4:\"name\";s:4:\"Code\";s:9:\"sortOrder\";i:3;s:6:\"fields\";a:1:{s:36:\"585a95bd-22d6-4056-8602-b50d9f744d38\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:3;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:4;s:6:\"fields\";a:1:{s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}}s:36:\"cd800274-c8bb-466b-ad46-9c01b222c6f6\";a:8:{s:4:\"name\";s:5:\"Legal\";s:6:\"handle\";s:5:\"legal\";s:4:\"type\";s:9:\"structure\";s:16:\"enableVersioning\";s:1:\"1\";s:16:\"propagateEntries\";s:1:\"1\";s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"dc7d29b9-3dc6-4e25-9991-cfe81e1c8cd2\";s:9:\"maxLevels\";s:1:\"1\";}s:10:\"entryTypes\";a:1:{s:36:\"5573181d-8830-4398-b2a6-56afb1fec4a5\";a:7:{s:4:\"name\";s:5:\"Legal\";s:6:\"handle\";s:5:\"legal\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"ac873075-60da-4963-b1c7-5127da148f22\";a:1:{s:4:\"tabs\";a:2:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:2:{s:36:\"e267f965-256f-41c1-9ccb-8c91d439a39e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"585a95bd-22d6-4056-8602-b50d9f744d38\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}}}i:1;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:1:{s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:4:{s:16:\"enabledByDefault\";s:1:\"1\";s:7:\"hasUrls\";s:1:\"1\";s:9:\"uriFormat\";s:6:\"{slug}\";s:8:\"template\";s:11:\"_legal.html\";}}}s:36:\"5046c0f8-6fc8-47cf-93e0-9acc35eb7dae\";a:8:{s:4:\"name\";s:10:\"Navigation\";s:6:\"handle\";s:10:\"navigation\";s:4:\"type\";s:9:\"structure\";s:16:\"enableVersioning\";s:1:\"1\";s:16:\"propagateEntries\";s:1:\"1\";s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"650f6d1a-f1f0-4cf3-a445-bde722f52a83\";s:9:\"maxLevels\";s:1:\"2\";}s:10:\"entryTypes\";a:1:{s:36:\"76cd67ce-8f48-436f-b8af-f149e9dc51e9\";a:7:{s:4:\"name\";s:10:\"Navigation\";s:6:\"handle\";s:10:\"navigation\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"d50a1693-f901-4856-acb0-68de049ea3fa\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:4:\"Link\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:1:{s:36:\"af0df129-5f1a-4988-9b96-6af4602b2a8f\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:4:{s:16:\"enabledByDefault\";s:1:\"1\";s:7:\"hasUrls\";s:1:\"0\";s:9:\"uriFormat\";N;s:8:\"template\";N;}}}s:36:\"f1b51cc7-0e15-4a9f-a885-83836e63b9af\";a:7:{s:4:\"name\";s:8:\"Homepage\";s:6:\"handle\";s:8:\"homepage\";s:4:\"type\";s:6:\"single\";s:16:\"enableVersioning\";s:1:\"1\";s:16:\"propagateEntries\";s:1:\"1\";s:10:\"entryTypes\";a:1:{s:36:\"330a6ca0-1879-4280-89f4-41840669c8e3\";a:7:{s:4:\"name\";s:8:\"Homepage\";s:6:\"handle\";s:8:\"homepage\";s:13:\"hasTitleField\";b:0;s:10:\"titleLabel\";s:0:\"\";s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"70db9947-6e7d-42a3-b538-60b3d7989188\";a:1:{s:4:\"tabs\";a:4:{i:0;a:3:{s:4:\"name\";s:6:\"Header\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"4aa573ae-3f1e-4ed8-b948-72619d90bf8b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c5326bc4-845f-47d9-aaf7-a4cd20b126d9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"2190ab65-3804-4128-90aa-411c9aa4ec7e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"7658813e-75b0-48d1-9890-30da927750b6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}i:1;a:3:{s:4:\"name\";s:9:\"A Section\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:2:{s:36:\"25b8d0e1-eb03-4d5d-ae0b-3ccafb57929b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"e267f965-256f-41c1-9ccb-8c91d439a39e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}}}i:2;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:3;s:6:\"fields\";a:1:{s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:3;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:4;s:6:\"fields\";a:1:{s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:4:{s:16:\"enabledByDefault\";s:1:\"1\";s:7:\"hasUrls\";s:1:\"1\";s:9:\"uriFormat\";s:8:\"__home__\";s:8:\"template\";s:10:\"index.html\";}}}s:36:\"d51d9643-6d8e-4c3b-9fcd-a685f036f407\";a:7:{s:4:\"name\";s:9:\"Editorial\";s:6:\"handle\";s:9:\"editorial\";s:4:\"type\";s:7:\"channel\";s:16:\"enableVersioning\";s:1:\"1\";s:16:\"propagateEntries\";s:1:\"1\";s:10:\"entryTypes\";a:1:{s:36:\"c59c9bf5-4b65-4e9f-8622-facfbe978893\";a:7:{s:4:\"name\";s:9:\"Editorial\";s:6:\"handle\";s:9:\"editorial\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"759646fa-3664-4ea0-bdef-d94ebaea73f1\";a:1:{s:4:\"tabs\";a:4:{i:0;a:3:{s:4:\"name\";s:6:\"Header\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"4aa573ae-3f1e-4ed8-b948-72619d90bf8b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"2190ab65-3804-4128-90aa-411c9aa4ec7e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"7658813e-75b0-48d1-9890-30da927750b6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}}}i:1;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:2:{s:36:\"cb963363-bf23-44b7-a28b-2be99804d07d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}}}i:2;a:3:{s:4:\"name\";s:10:\"Categories\";s:9:\"sortOrder\";i:3;s:6:\"fields\";a:1:{s:36:\"3a218bd1-4fff-4124-a4fb-805a86239988\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:3;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:4;s:6:\"fields\";a:1:{s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:4:{s:16:\"enabledByDefault\";s:1:\"1\";s:7:\"hasUrls\";s:1:\"1\";s:9:\"uriFormat\";s:16:\"editorial/{slug}\";s:8:\"template\";s:21:\"editorial/_entry.html\";}}}s:36:\"032c6943-bc7b-4882-95df-47bcd014f98a\";a:7:{s:16:\"enableVersioning\";b:1;s:10:\"entryTypes\";a:1:{s:36:\"c9b6c951-3d3a-4e93-a14c-35e0ddb5feda\";a:7:{s:4:\"name\";s:17:\"Editorial Archive\";s:6:\"handle\";s:16:\"editorialArchive\";s:13:\"hasTitleField\";b:0;s:10:\"titleLabel\";s:0:\"\";s:11:\"titleFormat\";s:18:\"{section.name|raw}\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"29bb2b6d-7cdb-44fc-86c2-2185b49eae11\";a:1:{s:4:\"tabs\";a:2:{i:0;a:3:{s:4:\"name\";s:6:\"Header\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"4aa573ae-3f1e-4ed8-b948-72619d90bf8b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c5326bc4-845f-47d9-aaf7-a4cd20b126d9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"2190ab65-3804-4128-90aa-411c9aa4ec7e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"7658813e-75b0-48d1-9890-30da927750b6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}i:1;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:1:{s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}s:6:\"handle\";s:16:\"editorialArchive\";s:4:\"name\";s:17:\"Editorial Archive\";s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:8:\"template\";s:20:\"editorial/index.html\";s:9:\"uriFormat\";s:9:\"editorial\";}}s:4:\"type\";s:6:\"single\";}}s:11:\"fieldGroups\";a:6:{s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";a:1:{s:4:\"name\";s:6:\"Common\";}s:36:\"a64bbc54-2902-411c-9cb8-b771c3d1bc1b\";a:1:{s:4:\"name\";s:3:\"SEO\";}s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";a:1:{s:4:\"name\";s:14:\"Global Content\";}s:36:\"52f336bf-c786-4a66-b3a3-5139a97fa3cd\";a:1:{s:4:\"name\";s:6:\"Header\";}s:36:\"99e32bdf-5545-43f4-8be7-1d745d981d84\";a:1:{s:4:\"name\";s:10:\"Navigation\";}s:36:\"ccd5bc31-2dd5-420d-9fee-3f4264fb8370\";a:1:{s:4:\"name\";s:10:\"Taxonomies\";}}s:6:\"fields\";a:19:{s:36:\"e267f965-256f-41c1-9ccb-8c91d439a39e\";a:10:{s:4:\"name\";s:4:\"Body\";s:6:\"handle\";s:4:\"body\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";}s:36:\"3a218bd1-4fff-4124-a4fb-805a86239988\";a:10:{s:4:\"name\";s:10:\"Categories\";s:6:\"handle\";s:10:\"categories\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:23:\"craft\\fields\\Categories\";s:8:\"settings\";a:8:{s:11:\"branchLimit\";s:0:\"\";s:7:\"sources\";s:1:\"*\";s:6:\"source\";s:42:\"group:323d26da-669b-4127-aebc-6b98cebd6f87\";s:12:\"targetSiteId\";N;s:8:\"viewMode\";N;s:5:\"limit\";N;s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"ccd5bc31-2dd5-420d-9fee-3f4264fb8370\";}s:36:\"2190ab65-3804-4128-90aa-411c9aa4ec7e\";a:10:{s:4:\"name\";s:14:\"Featured Image\";s:6:\"handle\";s:13:\"featuredImage\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"52f336bf-c786-4a66-b3a3-5139a97fa3cd\";}s:36:\"1135c680-b3de-4280-8fb3-b5fa62751729\";a:10:{s:4:\"name\";s:3:\"SEO\";s:6:\"handle\";s:3:\"seo\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:25:\"ether\\seo\\fields\\SeoField\";s:8:\"settings\";a:7:{s:11:\"titleSuffix\";s:0:\"\";s:14:\"suffixAsPrefix\";s:0:\"\";s:5:\"title\";a:1:{i:0;a:3:{s:3:\"key\";s:1:\"1\";s:8:\"template\";s:7:\"{title}\";s:6:\"locked\";b:0;}}s:11:\"description\";N;s:11:\"socialImage\";N;s:10:\"hideSocial\";s:0:\"\";s:6:\"robots\";a:6:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:0:\"\";}}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"a64bbc54-2902-411c-9cb8-b771c3d1bc1b\";}s:36:\"30b2a43a-c406-418f-8b0a-d6511a5da70b\";a:10:{s:4:\"name\";s:7:\"Address\";s:6:\"handle\";s:7:\"address\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:18:\"craft\\fields\\Table\";s:8:\"settings\";a:6:{s:11:\"addRowLabel\";s:9:\"Add a row\";s:7:\"maxRows\";s:0:\"\";s:7:\"minRows\";s:0:\"\";s:7:\"columns\";a:1:{s:4:\"col1\";a:4:{s:7:\"heading\";s:12:\"Address Line\";s:6:\"handle\";s:11:\"addressLine\";s:5:\"width\";s:0:\"\";s:4:\"type\";s:10:\"singleline\";}}s:8:\"defaults\";N;s:10:\"columnType\";s:4:\"text\";}s:10:\"fieldGroup\";s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";s:17:\"contentColumnType\";s:4:\"text\";}s:36:\"e0e054f3-4c78-4cc5-a14e-a240d874ee18\";a:10:{s:4:\"name\";s:21:\"Copyright Information\";s:6:\"handle\";s:20:\"copyrightInformation\";s:12:\"instructions\";s:12:\"Exclude Date\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:10:\"fieldGroup\";s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";s:17:\"contentColumnType\";s:4:\"text\";}s:36:\"bd7485f0-a8ac-4498-87b9-e2ff4b27b74f\";a:10:{s:4:\"name\";s:5:\"Email\";s:6:\"handle\";s:5:\"email\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:18:\"craft\\fields\\Email\";s:8:\"settings\";a:0:{}s:10:\"fieldGroup\";s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";s:17:\"contentColumnType\";s:6:\"string\";}s:36:\"c55c6ce6-e4d9-4340-a8f7-8ea0305bf9ab\";a:10:{s:4:\"name\";s:19:\"Google Analytics ID\";s:6:\"handle\";s:17:\"googleAnalyticsId\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:10:\"fieldGroup\";s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";s:17:\"contentColumnType\";s:4:\"text\";}s:36:\"26087618-9f03-46d8-990a-1265251747da\";a:10:{s:4:\"name\";s:12:\"Phone Number\";s:6:\"handle\";s:11:\"phoneNumber\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:10:\"fieldGroup\";s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";s:17:\"contentColumnType\";s:4:\"text\";}s:36:\"34e35771-dc3e-413a-a053-399986a4d61a\";a:10:{s:4:\"name\";s:12:\"Social Media\";s:6:\"handle\";s:11:\"socialMedia\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:39:\"verbb\\supertable\\fields\\SuperTableField\";s:8:\"settings\";a:8:{s:7:\"minRows\";s:0:\"\";s:7:\"maxRows\";s:0:\"\";s:12:\"contentTable\";s:20:\"{{%stc_socialmedia}}\";s:14:\"localizeBlocks\";b:0;s:11:\"staticField\";s:0:\"\";s:7:\"columns\";a:3:{i:11;a:1:{s:5:\"width\";s:0:\"\";}i:12;a:1:{s:5:\"width\";s:0:\"\";}i:13;a:1:{s:5:\"width\";s:0:\"\";}}s:11:\"fieldLayout\";s:5:\"table\";s:14:\"selectionLabel\";s:0:\"\";}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"83751e07-9cd8-4496-9fd5-cfe2a48a0dcd\";}s:36:\"c5326bc4-845f-47d9-aaf7-a4cd20b126d9\";a:10:{s:4:\"name\";s:5:\"Blurb\";s:6:\"handle\";s:5:\"blurb\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"52f336bf-c786-4a66-b3a3-5139a97fa3cd\";}s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";a:10:{s:4:\"name\";s:7:\"Content\";s:6:\"handle\";s:14:\"contentOptions\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Matrix\";s:8:\"settings\";a:4:{s:9:\"minBlocks\";s:0:\"\";s:9:\"maxBlocks\";s:0:\"\";s:12:\"contentTable\";s:33:\"{{%matrixcontent_contentoptions}}\";s:14:\"localizeBlocks\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";}s:36:\"4aa573ae-3f1e-4ed8-b948-72619d90bf8b\";a:10:{s:4:\"name\";s:12:\"Custom Title\";s:6:\"handle\";s:11:\"customTitle\";s:12:\"instructions\";s:54:\"Will be used in the header in place of the page title.\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:10:\"fieldGroup\";s:36:\"52f336bf-c786-4a66-b3a3-5139a97fa3cd\";s:17:\"contentColumnType\";s:4:\"text\";}s:36:\"cb963363-bf23-44b7-a28b-2be99804d07d\";a:10:{s:4:\"name\";s:7:\"Excerpt\";s:6:\"handle\";s:7:\"excerpt\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";}s:36:\"af0df129-5f1a-4988-9b96-6af4602b2a8f\";a:10:{s:4:\"name\";s:4:\"Link\";s:6:\"handle\";s:14:\"navigationLink\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";s:1:\"1\";s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:31:\"typedlinkfield\\fields\\LinkField\";s:8:\"settings\";a:6:{s:15:\"allowCustomText\";s:0:\"\";s:16:\"allowedLinkNames\";a:3:{i:0;s:3:\"url\";i:1;s:8:\"category\";i:2;s:5:\"entry\";}s:11:\"allowTarget\";s:0:\"\";s:15:\"defaultLinkName\";s:5:\"entry\";s:11:\"defaultText\";s:0:\"\";s:12:\"typeSettings\";a:7:{s:3:\"url\";a:1:{s:17:\"disableValidation\";s:0:\"\";}s:5:\"email\";a:1:{s:17:\"disableValidation\";s:1:\"1\";}s:3:\"tel\";a:1:{s:17:\"disableValidation\";s:1:\"1\";}s:5:\"asset\";a:1:{s:7:\"sources\";s:0:\"\";}s:8:\"category\";a:1:{s:7:\"sources\";s:1:\"*\";}s:5:\"entry\";a:1:{s:7:\"sources\";a:4:{i:0;s:7:\"singles\";i:1;s:9:\"section:4\";i:2;s:9:\"section:3\";i:3;s:9:\"section:2\";}}s:9:\"globalset\";a:1:{s:7:\"sources\";s:0:\"\";}}}s:10:\"fieldGroup\";s:36:\"99e32bdf-5545-43f4-8be7-1d745d981d84\";s:17:\"contentColumnType\";s:4:\"text\";}s:36:\"82ae06c2-3a25-4640-a900-028408b901bc\";a:10:{s:4:\"name\";s:4:\"Link\";s:6:\"handle\";s:7:\"linkUrl\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:31:\"typedlinkfield\\fields\\LinkField\";s:8:\"settings\";a:9:{s:15:\"allowCustomText\";s:1:\"1\";s:16:\"allowedLinkNames\";a:5:{i:3;s:5:\"entry\";i:6;s:6:\"custom\";i:7;s:5:\"email\";i:8;s:3:\"tel\";i:9;s:3:\"url\";}s:11:\"allowTarget\";s:1:\"1\";s:14:\"autoNoReferrer\";s:0:\"\";s:15:\"defaultLinkName\";s:5:\"asset\";s:11:\"defaultText\";s:0:\"\";s:15:\"enableAriaLabel\";s:0:\"\";s:11:\"enableTitle\";s:0:\"\";s:12:\"typeSettings\";a:9:{s:5:\"asset\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:8:\"category\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:5:\"entry\";a:2:{s:7:\"sources\";a:4:{i:0;s:7:\"singles\";i:1;s:44:\"section:d51d9643-6d8e-4c3b-9fcd-a685f036f407\";i:2;s:44:\"section:cd800274-c8bb-466b-ad46-9c01b222c6f6\";i:3;s:44:\"section:162013e0-f191-4fca-a9bf-5d8a49c574e7\";}s:16:\"allowCustomQuery\";s:0:\"\";}s:4:\"site\";a:1:{s:5:\"sites\";s:1:\"*\";}s:4:\"user\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:6:\"custom\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:5:\"email\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:3:\"tel\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:3:\"url\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}}}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";}s:36:\"585a95bd-22d6-4056-8602-b50d9f744d38\";a:10:{s:4:\"name\";s:16:\"Third Party Code\";s:6:\"handle\";s:14:\"thirdPartyCode\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";}s:36:\"25b8d0e1-eb03-4d5d-ae0b-3ccafb57929b\";a:10:{s:4:\"name\";s:8:\"Headline\";s:6:\"handle\";s:8:\"headline\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"1ec29a3c-1c4e-4d0e-9aa4-48ced060ddca\";}s:36:\"7658813e-75b0-48d1-9890-30da927750b6\";a:10:{s:4:\"name\";s:9:\"Alignment\";s:6:\"handle\";s:9:\"alignment\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:4:\"Left\";s:5:\"value\";s:4:\"left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:6:\"Center\";s:5:\"value\";s:6:\"center\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"52f336bf-c786-4a66-b3a3-5139a97fa3cd\";}}s:16:\"matrixBlockTypes\";a:5:{s:36:\"42d3f561-e744-4ccd-a2ba-fa2141145f01\";a:6:{s:5:\"field\";s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";s:4:\"name\";s:16:\"Standard Content\";s:6:\"handle\";s:15:\"standardContent\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:5:{s:36:\"09d032ea-e926-4d23-af3e-f93573601926\";a:10:{s:4:\"name\";s:5:\"Title\";s:6:\"handle\";s:12:\"contentTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"6281a520-7a62-4450-a89d-b35b1cb8bbb7\";a:10:{s:4:\"name\";s:7:\"Content\";s:6:\"handle\";s:14:\"contentContent\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"3e2a5363-527c-48c5-b0db-96632596da03\";a:10:{s:4:\"name\";s:17:\"Content Alignment\";s:6:\"handle\";s:16:\"contentAlignment\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:4:\"Left\";s:5:\"value\";s:4:\"left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:6:\"Center\";s:5:\"value\";s:6:\"center\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"40152c94-468d-4556-83da-aafb52d73cd9\";a:10:{s:4:\"name\";s:5:\"Theme\";s:6:\"handle\";s:12:\"contentTheme\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:5:\"Light\";s:5:\"value\";s:5:\"light\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:4:\"Dark\";s:5:\"value\";s:4:\"dark\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:8:\"Stripped\";s:5:\"value\";s:8:\"stripped\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"e8f47125-180a-40b3-890f-689abe4c58cf\";a:10:{s:4:\"name\";s:15:\"Animation Style\";s:6:\"handle\";s:21:\"contentAnimationStyle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:4:\"None\";s:5:\"value\";s:4:\"none\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:7:\"Fade In\";s:5:\"value\";s:6:\"fadeIn\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:7:\"Fade Up\";s:5:\"value\";s:6:\"fadeUp\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"50e9c9ad-4f49-417f-af33-b52bc374c040\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:5:{s:36:\"09d032ea-e926-4d23-af3e-f93573601926\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"6281a520-7a62-4450-a89d-b35b1cb8bbb7\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"3e2a5363-527c-48c5-b0db-96632596da03\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"40152c94-468d-4556-83da-aafb52d73cd9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"e8f47125-180a-40b3-890f-689abe4c58cf\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}}}}}}}s:36:\"7026f589-a794-480d-8525-7bcfbffc210b\";a:6:{s:5:\"field\";s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";s:4:\"name\";s:17:\"Image and Content\";s:6:\"handle\";s:15:\"imageAndContent\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:6:{s:36:\"d37dc137-c3e7-4b7d-b372-70c0c0667b5d\";a:10:{s:4:\"name\";s:5:\"Title\";s:6:\"handle\";s:8:\"icpTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"beb114be-2742-42b9-b11b-d03ced4a8457\";a:10:{s:4:\"name\";s:5:\"Image\";s:6:\"handle\";s:8:\"icpImage\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"5c8ed304-1f93-4047-88cc-d65d3544845c\";a:10:{s:4:\"name\";s:7:\"Content\";s:6:\"handle\";s:10:\"icpContent\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"f21907c8-e5a8-49cf-8d4d-d88684a4acbf\";a:10:{s:4:\"name\";s:17:\"Position of Image\";s:6:\"handle\";s:18:\"icpPositionOfImage\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:15:\"Left of Content\";s:5:\"value\";s:4:\"left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:16:\"Right of Content\";s:5:\"value\";s:5:\"right\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:13:\"Above Content\";s:5:\"value\";s:5:\"above\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"7d720da0-8003-42b4-a11f-a8ef6e0f573f\";a:10:{s:4:\"name\";s:5:\"Theme\";s:6:\"handle\";s:8:\"icpTheme\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:5:\"Light\";s:5:\"value\";s:5:\"light\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:4:\"Dark\";s:5:\"value\";s:4:\"dark\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"27fdd618-9b5a-4ff7-ab93-0d028aaa1277\";a:10:{s:4:\"name\";s:15:\"Animation Style\";s:6:\"handle\";s:17:\"icpAnimationStyle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:4:\"None\";s:5:\"value\";s:4:\"none\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:7:\"Fade In\";s:5:\"value\";s:6:\"fadeIn\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:7:\"Fade Up\";s:5:\"value\";s:6:\"fadeUp\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"d20a1cad-d43d-48e8-89da-1c99a932ff1b\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:6:{s:36:\"d37dc137-c3e7-4b7d-b372-70c0c0667b5d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"beb114be-2742-42b9-b11b-d03ced4a8457\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"5c8ed304-1f93-4047-88cc-d65d3544845c\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:3;}s:36:\"f21907c8-e5a8-49cf-8d4d-d88684a4acbf\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"7d720da0-8003-42b4-a11f-a8ef6e0f573f\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"27fdd618-9b5a-4ff7-ab93-0d028aaa1277\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}}}}}}}s:36:\"102b59cb-35d1-401f-aaaf-be2afb993c3c\";a:6:{s:5:\"field\";s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";s:4:\"name\";s:7:\"Columns\";s:6:\"handle\";s:7:\"columns\";s:9:\"sortOrder\";i:3;s:6:\"fields\";a:5:{s:36:\"6c7c4a60-4464-4b19-a90b-460f5c9beaa5\";a:10:{s:4:\"name\";s:5:\"Title\";s:6:\"handle\";s:12:\"columnsTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"72a2c624-0173-43b5-87e4-046ac88fd9b3\";a:10:{s:4:\"name\";s:7:\"Columns\";s:6:\"handle\";s:7:\"columns\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:39:\"verbb\\supertable\\fields\\SuperTableField\";s:8:\"settings\";a:8:{s:7:\"minRows\";s:0:\"\";s:7:\"maxRows\";s:0:\"\";s:12:\"contentTable\";s:18:\"{{%stc_3_columns}}\";s:14:\"localizeBlocks\";b:0;s:11:\"staticField\";s:0:\"\";s:7:\"columns\";a:4:{i:33;a:1:{s:5:\"width\";s:0:\"\";}i:34;a:1:{s:5:\"width\";s:0:\"\";}i:35;a:1:{s:5:\"width\";s:0:\"\";}i:36;a:1:{s:5:\"width\";s:0:\"\";}}s:11:\"fieldLayout\";s:3:\"row\";s:14:\"selectionLabel\";s:0:\"\";}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"18a7d2f2-28de-4155-94e0-485098cc7694\";a:10:{s:4:\"name\";s:12:\"Column Count\";s:6:\"handle\";s:11:\"columnCount\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:1:\"3\";s:5:\"value\";s:0:\"\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:1:\"4\";s:5:\"value\";s:0:\"\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"c1c044b1-c39f-4b4e-9035-eaaf9b26ddb9\";a:10:{s:4:\"name\";s:5:\"Theme\";s:6:\"handle\";s:12:\"columnsTheme\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:5:\"Light\";s:5:\"value\";s:5:\"light\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:4:\"Dark\";s:5:\"value\";s:4:\"dark\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"27a6b29f-1742-4dc5-a85c-635f2ea6ca8c\";a:10:{s:4:\"name\";s:16:\"Animation Styles\";s:6:\"handle\";s:21:\"columnsAnimationStyle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:4:\"None\";s:5:\"value\";s:4:\"none\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:7:\"Fade In\";s:5:\"value\";s:6:\"fadeIn\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:7:\"Fade Up\";s:5:\"value\";s:6:\"fadeUp\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"f9a72095-233b-453b-94a0-1cb95a4563f8\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:5:{s:36:\"6c7c4a60-4464-4b19-a90b-460f5c9beaa5\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"72a2c624-0173-43b5-87e4-046ac88fd9b3\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"18a7d2f2-28de-4155-94e0-485098cc7694\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"c1c044b1-c39f-4b4e-9035-eaaf9b26ddb9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"27a6b29f-1742-4dc5-a85c-635f2ea6ca8c\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}}}}}}}s:36:\"051d05ee-f0e4-4cc4-916d-d0d79941e3c0\";a:6:{s:5:\"field\";s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";s:4:\"name\";s:14:\"Call to Action\";s:6:\"handle\";s:12:\"callToAction\";s:9:\"sortOrder\";i:4;s:6:\"fields\";a:6:{s:36:\"d1e17199-ca47-4faa-a957-fca3496733e2\";a:10:{s:4:\"name\";s:5:\"Title\";s:6:\"handle\";s:8:\"ctaTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"91371eaf-c6e1-4ac4-8501-10c5b9daf201\";a:10:{s:4:\"name\";s:4:\"Text\";s:6:\"handle\";s:7:\"ctaText\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"771a02c0-92fb-4a24-9008-164d16755e02\";a:10:{s:4:\"name\";s:4:\"Link\";s:6:\"handle\";s:7:\"ctaLink\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:31:\"typedlinkfield\\fields\\LinkField\";s:8:\"settings\";a:9:{s:15:\"allowCustomText\";s:1:\"1\";s:16:\"allowedLinkNames\";a:5:{i:3;s:5:\"entry\";i:6;s:6:\"custom\";i:7;s:5:\"email\";i:8;s:3:\"tel\";i:9;s:3:\"url\";}s:11:\"allowTarget\";s:1:\"1\";s:14:\"autoNoReferrer\";s:0:\"\";s:15:\"defaultLinkName\";s:3:\"url\";s:11:\"defaultText\";s:0:\"\";s:15:\"enableAriaLabel\";s:0:\"\";s:11:\"enableTitle\";s:0:\"\";s:12:\"typeSettings\";a:9:{s:5:\"asset\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:8:\"category\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:5:\"entry\";a:2:{s:7:\"sources\";a:4:{i:0;s:7:\"singles\";i:1;s:44:\"section:d51d9643-6d8e-4c3b-9fcd-a685f036f407\";i:2;s:44:\"section:cd800274-c8bb-466b-ad46-9c01b222c6f6\";i:3;s:44:\"section:162013e0-f191-4fca-a9bf-5d8a49c574e7\";}s:16:\"allowCustomQuery\";s:0:\"\";}s:4:\"site\";a:1:{s:5:\"sites\";s:1:\"*\";}s:4:\"user\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:6:\"custom\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:5:\"email\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:3:\"tel\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:3:\"url\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}}}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"dfa58ec7-e02e-4ea1-98c4-ad7b602e68f2\";a:10:{s:4:\"name\";s:16:\"Background Image\";s:6:\"handle\";s:18:\"ctaBackgroundImage\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"5c17a5ea-fe86-47a0-a2c9-df1465d7579c\";a:10:{s:4:\"name\";s:17:\"Content Alignment\";s:6:\"handle\";s:19:\"ctaContentAlignment\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:4:\"Left\";s:5:\"value\";s:4:\"left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:6:\"Center\";s:5:\"value\";s:6:\"center\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"d2a8e5ff-729c-4ca6-a68b-b66db300c673\";a:10:{s:4:\"name\";s:5:\"Theme\";s:6:\"handle\";s:8:\"ctaTheme\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:5:\"Light\";s:5:\"value\";s:5:\"light\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:4:\"Dark\";s:5:\"value\";s:4:\"dark\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"6f4a765d-210d-41d6-bba9-c84e3fa09007\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:6:{s:36:\"d1e17199-ca47-4faa-a957-fca3496733e2\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"91371eaf-c6e1-4ac4-8501-10c5b9daf201\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"771a02c0-92fb-4a24-9008-164d16755e02\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:3;}s:36:\"dfa58ec7-e02e-4ea1-98c4-ad7b602e68f2\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"5c17a5ea-fe86-47a0-a2c9-df1465d7579c\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"d2a8e5ff-729c-4ca6-a68b-b66db300c673\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}}}}}}}s:36:\"bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7\";a:6:{s:5:\"field\";s:36:\"c5151553-9805-4587-97c9-86eb7bf6df8d\";s:4:\"name\";s:4:\"Form\";s:6:\"handle\";s:4:\"form\";s:9:\"sortOrder\";i:5;s:6:\"fields\";a:6:{s:36:\"72ff9eea-1166-40ed-be70-a4dc3abd50d4\";a:10:{s:4:\"name\";s:5:\"Title\";s:6:\"handle\";s:9:\"formTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"f5a5f427-da5a-4441-b84c-bc5e439b565d\";a:10:{s:4:\"name\";s:4:\"Form\";s:6:\"handle\";s:4:\"form\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"b1b31e81-d0dc-48cc-bd01-30cef55e1dc4\";a:10:{s:4:\"name\";s:7:\"Content\";s:6:\"handle\";s:11:\"formContent\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:0:\"\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"bad4fcdb-940c-4dbf-8ebb-b6c7cde431c9\";a:10:{s:4:\"name\";s:19:\"Position of Content\";s:6:\"handle\";s:21:\"formPositionOfContent\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:12:\"Left of Form\";s:5:\"value\";s:4:\"left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:13:\"Right of Form\";s:5:\"value\";s:5:\"right\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:10:\"Above Form\";s:5:\"value\";s:5:\"above\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"8d34d69c-1bb0-49fb-8af0-0112ba48e487\";a:10:{s:4:\"name\";s:5:\"Theme\";s:6:\"handle\";s:9:\"formTheme\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:5:\"Light\";s:5:\"value\";s:5:\"light\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:4:\"Dark\";s:5:\"value\";s:4:\"dark\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"27c77dcf-de41-42ba-855d-f5bedfeff24a\";a:10:{s:4:\"name\";s:9:\"Animation\";s:6:\"handle\";s:13:\"formAnimation\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:21:\"craft\\fields\\Dropdown\";s:8:\"settings\";a:1:{s:7:\"options\";a:3:{i:0;a:3:{s:5:\"label\";s:4:\"None\";s:5:\"value\";s:4:\"none\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:7:\"Fade In\";s:5:\"value\";s:6:\"fadeIn\";s:7:\"default\";s:0:\"\";}i:2;a:3:{s:5:\"label\";s:7:\"Fade Up\";s:5:\"value\";s:6:\"fadeUp\";s:7:\"default\";s:0:\"\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"5bf0d3be-806f-4d36-a087-834c2c5b0c53\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:6:{s:36:\"72ff9eea-1166-40ed-be70-a4dc3abd50d4\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"f5a5f427-da5a-4441-b84c-bc5e439b565d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"b1b31e81-d0dc-48cc-bd01-30cef55e1dc4\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"bad4fcdb-940c-4dbf-8ebb-b6c7cde431c9\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"8d34d69c-1bb0-49fb-8af0-0112ba48e487\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"27c77dcf-de41-42ba-855d-f5bedfeff24a\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}}}}}}}}s:7:\"volumes\";a:1:{s:36:\"60df2139-a9cd-489e-b496-d5d8fe78fb89\";a:8:{s:4:\"name\";s:6:\"Assets\";s:6:\"handle\";s:6:\"assets\";s:4:\"type\";s:19:\"craft\\volumes\\Local\";s:7:\"hasUrls\";s:1:\"1\";s:3:\"url\";s:11:\"@web/assets\";s:8:\"settings\";a:1:{s:4:\"path\";s:15:\"@webroot/assets\";}s:9:\"sortOrder\";s:1:\"1\";s:12:\"fieldLayouts\";a:1:{s:36:\"3cfb1d71-7d9b-479c-86c7-54e923837a75\";a:1:{s:4:\"tabs\";a:0:{}}}}}s:14:\"categoryGroups\";a:1:{s:36:\"323d26da-669b-4127-aebc-6b98cebd6f87\";a:5:{s:4:\"name\";s:10:\"Categories\";s:6:\"handle\";s:10:\"categories\";s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"23a71fe2-e6ca-4e1a-88d1-b2d8041f7950\";s:9:\"maxLevels\";N;}s:12:\"fieldLayouts\";a:1:{s:36:\"b7615ce6-e10f-4ef9-959d-59a3e3223e61\";a:1:{s:4:\"tabs\";a:0:{}}}s:12:\"siteSettings\";a:1:{s:36:\"de65cf13-2b4b-4584-8cfa-7e10f9c19b12\";a:3:{s:7:\"hasUrls\";s:1:\"1\";s:9:\"uriFormat\";s:17:\"categories/{slug}\";s:8:\"template\";s:24:\"editorial/_category.html\";}}}}s:9:\"tagGroups\";a:0:{}s:5:\"users\";a:5:{s:24:\"requireEmailVerification\";b:1;s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:14:\"photoVolumeUid\";N;s:12:\"photoSubpath\";s:0:\"\";}s:10:\"globalSets\";a:1:{s:36:\"bf84af81-bf5a-42a6-b886-5047fd0fcf3b\";a:3:{s:4:\"name\";s:14:\"Global Content\";s:6:\"handle\";s:13:\"globalContent\";s:12:\"fieldLayouts\";a:1:{s:36:\"397af85f-1f0b-429f-9071-c0a2c9764809\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:14:\"Global Content\";s:9:\"sortOrder\";s:1:\"1\";s:6:\"fields\";a:6:{s:36:\"30b2a43a-c406-418f-8b0a-d6511a5da70b\";a:2:{s:8:\"required\";s:1:\"0\";s:9:\"sortOrder\";s:1:\"1\";}s:36:\"e0e054f3-4c78-4cc5-a14e-a240d874ee18\";a:2:{s:8:\"required\";s:1:\"0\";s:9:\"sortOrder\";s:1:\"2\";}s:36:\"bd7485f0-a8ac-4498-87b9-e2ff4b27b74f\";a:2:{s:8:\"required\";s:1:\"0\";s:9:\"sortOrder\";s:1:\"3\";}s:36:\"26087618-9f03-46d8-990a-1265251747da\";a:2:{s:8:\"required\";s:1:\"0\";s:9:\"sortOrder\";s:1:\"4\";}s:36:\"34e35771-dc3e-413a-a053-399986a4d61a\";a:2:{s:8:\"required\";s:1:\"0\";s:9:\"sortOrder\";s:1:\"5\";}s:36:\"c55c6ce6-e4d9-4340-a8f7-8ea0305bf9ab\";a:2:{s:8:\"required\";s:1:\"0\";s:9:\"sortOrder\";s:1:\"6\";}}}}}}}}s:7:\"plugins\";a:18:{s:11:\"element-api\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:7:\"feed-me\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"2.1.2\";}s:7:\"cookies\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:6:\"minify\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:6:\"retcon\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:3:\"seo\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"3.1.0\";}s:12:\"sprout-forms\";a:4:{s:8:\"settings\";a:8:{s:18:\"pluginNameOverride\";s:0:\"\";s:22:\"templateFolderOverride\";s:31:\"sproutforms-accessibletemplates\";s:23:\"enablePayloadForwarding\";i:0;s:14:\"enableSaveData\";i:1;s:26:\"enableSaveDataPerFormBasis\";i:0;s:17:\"saveDataByDefault\";i:1;s:35:\"enablePerFormTemplateFolderOverride\";i:0;s:15:\"captchaSettings\";a:3:{s:28:\"sproutforms-duplicatecaptcha\";a:1:{s:7:\"enabled\";i:1;}s:29:\"sproutforms-javascriptcaptcha\";a:1:{s:7:\"enabled\";i:1;}s:27:\"sproutforms-honeypotcaptcha\";a:3:{s:7:\"enabled\";i:1;s:17:\"honeypotFieldName\";s:9:\"beesknees\";s:27:\"honeypotScreenReaderMessage\";s:22:\"Leave this field blank\";}}}s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"0\";s:13:\"schemaVersion\";s:5:\"3.0.2\";}s:11:\"super-table\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:6:\"2.0.11\";}s:14:\"video-embedder\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:14:\"typedlinkfield\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:8:\"redactor\";a:4:{s:8:\"settings\";N;s:10:\"licenseKey\";N;s:7:\"enabled\";s:1:\"1\";s:13:\"schemaVersion\";s:5:\"2.3.0\";}s:6:\"snitch\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.1.0\";}s:16:\"cp-element-count\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:8:\"sasutils\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:1:\"1\";}s:6:\"pushdb\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:0;s:13:\"schemaVersion\";s:1:\"1\";}s:10:\"assetusage\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.0.0\";}s:10:\"cloudflare\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:0;s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:6:\"imager\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.0.0\";}}s:5:\"email\";a:3:{s:9:\"fromEmail\";s:25:\"zachary@suits-sandals.com\";s:8:\"fromName\";s:6:\"Craft3\";s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";}s:6:\"system\";a:5:{s:7:\"edition\";s:3:\"pro\";s:4:\"live\";b:1;s:4:\"name\";s:6:\"Craft3\";s:8:\"timeZone\";s:19:\"America/Los_Angeles\";s:13:\"schemaVersion\";s:6:\"3.1.28\";}s:15:\"imageTransforms\";a:3:{s:36:\"768e4597-9401-4261-ae74-2b72e019e9be\";a:9:{s:4:\"name\";s:14:\"Standard Large\";s:6:\"handle\";s:13:\"standardLarge\";s:4:\"mode\";s:3:\"fit\";s:8:\"position\";s:13:\"center-center\";s:5:\"width\";s:3:\"800\";s:6:\"height\";s:3:\"800\";s:6:\"format\";N;s:7:\"quality\";s:2:\"82\";s:9:\"interlace\";s:4:\"none\";}s:36:\"f9898e0f-51c4-493f-91e2-dc4f2d2fad3f\";a:9:{s:4:\"name\";s:15:\"Standard Medium\";s:6:\"handle\";s:14:\"standardMedium\";s:4:\"mode\";s:3:\"fit\";s:8:\"position\";s:13:\"center-center\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"600\";s:6:\"format\";N;s:7:\"quality\";s:2:\"82\";s:9:\"interlace\";s:4:\"none\";}s:36:\"17e4c2fb-e33b-450a-ad55-db54cc20ce8a\";a:9:{s:4:\"name\";s:14:\"Standard Small\";s:6:\"handle\";s:13:\"standardSmall\";s:4:\"mode\";s:3:\"fit\";s:8:\"position\";s:13:\"center-center\";s:5:\"width\";s:3:\"400\";s:6:\"height\";s:3:\"400\";s:6:\"format\";N;s:7:\"quality\";s:2:\"82\";s:9:\"interlace\";s:4:\"none\";}}s:6:\"routes\";a:0:{}s:20:\"superTableBlockTypes\";a:2:{s:36:\"03e085a2-6e6c-4f47-a4dd-64adf65badb0\";a:3:{s:5:\"field\";s:36:\"34e35771-dc3e-413a-a053-399986a4d61a\";s:6:\"fields\";a:3:{s:36:\"835d31bc-a712-456a-9ff5-77b5715bbb84\";a:10:{s:4:\"name\";s:4:\"Link\";s:6:\"handle\";s:11:\"networkLink\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:2:{s:11:\"placeholder\";s:0:\"\";s:9:\"maxLength\";s:3:\"255\";}s:17:\"contentColumnType\";s:11:\"string(255)\";s:10:\"fieldGroup\";N;}s:36:\"e78f1b7b-de5c-48ba-a302-7dc555c4c6ad\";a:10:{s:4:\"name\";s:12:\"Network Name\";s:6:\"handle\";s:11:\"networkName\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"f4648925-192c-4707-af3e-049af7900b7d\";a:10:{s:4:\"name\";s:4:\"Icon\";s:6:\"handle\";s:11:\"networkIcon\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"9d3fbd7f-982f-4d7d-9cc0-436aeea65277\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"835d31bc-a712-456a-9ff5-77b5715bbb84\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:1;}s:36:\"e78f1b7b-de5c-48ba-a302-7dc555c4c6ad\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"f4648925-192c-4707-af3e-049af7900b7d\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:3;}}}}}}}s:36:\"5f1a587e-e57f-4299-9424-8cce435477b8\";a:3:{s:5:\"field\";s:36:\"72a2c624-0173-43b5-87e4-046ac88fd9b3\";s:6:\"fields\";a:4:{s:36:\"36865e3f-b021-43f6-8553-1e5d5fd859fb\";a:10:{s:4:\"name\";s:5:\"Title\";s:6:\"handle\";s:11:\"columnTitle\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"032c1e08-d8f5-418e-9db4-384b54881263\";a:10:{s:4:\"name\";s:7:\"Content\";s:6:\"handle\";s:13:\"columnContent\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:1:\"1\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"79e8c6f2-6075-41b2-9879-3c4262bc2c63\";a:10:{s:4:\"name\";s:4:\"Icon\";s:6:\"handle\";s:10:\"columnIcon\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:60df2139-a9cd-489e-b496-d5d8fe78fb89\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"32e24e2c-e245-4614-b21c-a3a427326d32\";a:10:{s:4:\"name\";s:4:\"Link\";s:6:\"handle\";s:10:\"columnLink\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:31:\"typedlinkfield\\fields\\LinkField\";s:8:\"settings\";a:9:{s:15:\"allowCustomText\";s:1:\"1\";s:16:\"allowedLinkNames\";a:5:{i:3;s:5:\"entry\";i:6;s:6:\"custom\";i:7;s:5:\"email\";i:8;s:3:\"tel\";i:9;s:3:\"url\";}s:11:\"allowTarget\";s:1:\"1\";s:14:\"autoNoReferrer\";s:0:\"\";s:15:\"defaultLinkName\";s:3:\"url\";s:11:\"defaultText\";s:0:\"\";s:15:\"enableAriaLabel\";s:0:\"\";s:11:\"enableTitle\";s:0:\"\";s:12:\"typeSettings\";a:9:{s:5:\"asset\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:8:\"category\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:5:\"entry\";a:2:{s:7:\"sources\";a:4:{i:0;s:7:\"singles\";i:1;s:44:\"section:d51d9643-6d8e-4c3b-9fcd-a685f036f407\";i:2;s:44:\"section:cd800274-c8bb-466b-ad46-9c01b222c6f6\";i:3;s:44:\"section:162013e0-f191-4fca-a9bf-5d8a49c574e7\";}s:16:\"allowCustomQuery\";s:0:\"\";}s:4:\"site\";a:1:{s:5:\"sites\";s:1:\"*\";}s:4:\"user\";a:2:{s:7:\"sources\";s:1:\"*\";s:16:\"allowCustomQuery\";s:0:\"\";}s:6:\"custom\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:5:\"email\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:3:\"tel\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}s:3:\"url\";a:2:{s:17:\"disableValidation\";s:0:\"\";s:12:\"allowAliases\";s:0:\"\";}}}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"df1ce051-b5f2-4828-a942-c11ae215b802\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"36865e3f-b021-43f6-8553-1e5d5fd859fb\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"032c1e08-d8f5-418e-9db4-384b54881263\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"79e8c6f2-6075-41b2-9879-3c4262bc2c63\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"32e24e2c-e245-4614-b21c-a3a427326d32\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}}}}}}}',NULL,'LLTv6pWFN98I','2018-05-11 17:24:17','2019-05-16 20:55:23','2f1a48aa-d636-4526-b468-6e70655bb4f8');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
INSERT INTO `craft_matrixblocks` VALUES (11,5,NULL,15,1,1,NULL,'2018-05-14 20:07:38','2019-05-16 20:14:54','c4ee1be3-0566-4b6f-bfaf-9f55bb7e802f'),(13,5,NULL,15,2,2,NULL,'2018-05-14 20:20:49','2019-05-16 20:14:54','d5d6a9fa-02b7-4ada-89d4-177b85bf2723'),(14,5,NULL,15,3,3,NULL,'2018-05-14 20:20:49','2019-05-16 20:14:54','f365f004-b2e0-4ce7-ad92-fc12dadb1714'),(16,5,NULL,15,4,4,NULL,'2018-05-14 20:20:49','2019-05-16 20:14:54','3f05eeda-5043-4a6c-ba48-77f4bf2c8c1a'),(17,5,NULL,15,5,5,NULL,'2018-05-14 20:20:49','2019-05-16 20:14:54','7cfa93dc-ce8e-48f2-b4a9-37c6b4ca4c8b');
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
INSERT INTO `craft_matrixblocktypes` VALUES (1,15,3,'Standard Content','standardContent',1,'2018-05-11 21:55:51','2019-05-14 19:35:06','42d3f561-e744-4ccd-a2ba-fa2141145f01'),(2,15,4,'Image and Content','imageAndContent',2,'2018-05-11 21:55:51','2019-05-14 19:35:07','7026f589-a794-480d-8525-7bcfbffc210b'),(3,15,6,'Columns','columns',3,'2018-05-11 21:55:51','2019-05-14 19:35:08','102b59cb-35d1-401f-aaaf-be2afb993c3c'),(4,15,7,'Call to Action','callToAction',4,'2018-05-11 21:55:51','2019-05-14 19:35:08','051d05ee-f0e4-4cc4-916d-d0d79941e3c0'),(5,15,8,'Form','form',5,'2018-05-11 21:55:51','2019-05-14 19:35:08','bc449c1e-23d2-4b8d-8ce4-ac64ec8906f7');
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_contentoptions`
--

DROP TABLE IF EXISTS `craft_matrixcontent_contentoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_contentoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_standardContent_contentTitle` text,
  `field_standardContent_contentContent` text,
  `field_standardContent_contentAlignment` varchar(255) DEFAULT NULL,
  `field_standardContent_contentTheme` varchar(255) DEFAULT NULL,
  `field_standardContent_contentAnimationStyle` varchar(255) DEFAULT NULL,
  `field_imageAndContent_icpTitle` text,
  `field_imageAndContent_icpContent` text,
  `field_imageAndContent_icpPositionOfImage` varchar(255) DEFAULT NULL,
  `field_imageAndContent_icpTheme` varchar(255) DEFAULT NULL,
  `field_imageAndContent_icpAnimationStyle` varchar(255) DEFAULT NULL,
  `field_columns_columnsTitle` text,
  `field_columns_columnCount` varchar(255) DEFAULT NULL,
  `field_columns_columnsTheme` varchar(255) DEFAULT NULL,
  `field_columns_columnsAnimationStyle` varchar(255) DEFAULT NULL,
  `field_callToAction_ctaTitle` text,
  `field_callToAction_ctaText` text,
  `field_callToAction_ctaLink` text,
  `field_callToAction_ctaContentAlignment` varchar(255) DEFAULT NULL,
  `field_form_formTitle` text,
  `field_form_formContent` text,
  `field_form_formPositionOfContent` varchar(255) DEFAULT NULL,
  `field_form_formTheme` varchar(255) DEFAULT NULL,
  `field_form_formAnimation` varchar(255) DEFAULT NULL,
  `field_callToAction_ctaTheme` varchar(255) DEFAULT NULL,
  `field_form_form` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_contentoptions_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_matrixcontent_contentoptions_siteId_fk` (`siteId`),
  CONSTRAINT `craft_matrixcontent_contentoptions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_contentoptions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_contentoptions`
--

LOCK TABLES `craft_matrixcontent_contentoptions` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_contentoptions` DISABLE KEYS */;
INSERT INTO `craft_matrixcontent_contentoptions` VALUES (1,11,1,'2018-05-14 20:07:38','2019-05-16 20:14:54','d7391452-9279-4f23-b3b9-261d09e5c0a3','Title','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>','left','light','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,13,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','06b33573-28ed-4d26-a126-edd7bc97dc5d',NULL,NULL,NULL,NULL,NULL,'ICP','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl. Praesent sit amet mi eu tortor scelerisque fermentum quis eget dui. Fusce venenatis eleifend turpis sit amet consequat. Suspendisse efficitur, nibh eu maximus vulputate, turpis nisl faucibus magna, vel accumsan turpis elit at elit. Maecenas ut semper erat. Integer elementum pellentesque placerat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis tempor augue non tincidunt. Phasellus arcu mi, varius sed porta quis, sagittis in arcu. Suspendisse ac euismod ipsum, vitae tincidunt magna. Aliquam euismod, dolor quis posuere blandit, dolor sapien tristique tellus, non ultrices eros eros id sapien. Aliquam in lacus non nibh viverra ultricies. Morbi varius libero nec nunc condimentum, quis hendrerit mi ullamcorper. Suspendisse vitae odio tellus.</p>','right','light','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,14,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','88bc128b-9c37-468e-8341-e93dc78819a4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Columns',NULL,'light','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,16,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','211c880d-86c9-466f-8229-d68ad4ca97fe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CTA','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"}','left',NULL,NULL,NULL,NULL,NULL,'light',NULL),(5,17,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','e474d981-5e6d-4586-a4da-8c28cc118da3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Form','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.</p>','left','light','none',NULL,NULL);
/*!40000 ALTER TABLE `craft_matrixcontent_contentoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_migrations_pluginId_idx` (`pluginId`),
  KEY `craft_migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,NULL,'app','Install','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','5a3a4446-19db-4447-b01a-d955dda064f8'),(2,NULL,'app','m150403_183908_migrations_table_changes','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','bec346e4-5b9c-404d-979e-4ee8571bf20b'),(3,NULL,'app','m150403_184247_plugins_table_changes','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','687b0498-ee4f-4bcf-ac5e-59f994a8f3f6'),(4,NULL,'app','m150403_184533_field_version','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','1d8b2269-e42f-4602-b239-ecd94c152674'),(5,NULL,'app','m150403_184729_type_columns','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','fad68dc3-226a-4832-8611-c2964a69dcb5'),(6,NULL,'app','m150403_185142_volumes','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','bd63edee-f53a-4a6c-a7ef-dd72fa5774df'),(7,NULL,'app','m150428_231346_userpreferences','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','a236c9b6-0af3-4a9d-a7dd-f8517816e9a4'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','0a59c0e6-7ccb-4d2a-b9b1-a36c7fc815e0'),(9,NULL,'app','m150617_213829_update_email_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','564c3526-0f55-4e28-9579-b68694e25898'),(10,NULL,'app','m150721_124739_templatecachequeries','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','accc42e3-9f0f-4bdc-9a34-6c1c17980e81'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','7d21288e-99e6-496f-98b0-09f8e69beae4'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','1e918b63-4195-48fd-b73e-5ed537598ee6'),(13,NULL,'app','m151002_095935_volume_cache_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','d6dda174-11e8-4e88-b9d2-a9d3b6c63f2a'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','ef3e4782-bf7a-4cb6-8a20-f5e69c5a3230'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','135aa85f-a0ce-473a-8795-28e3483357a8'),(16,NULL,'app','m151209_000000_move_logo','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','52a02fb2-196c-4467-9299-d407e273639a'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','00327596-81d8-4802-9020-16bbf271419f'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','ae46532c-1cc2-48eb-922b-e71b2dc9cdb5'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','5491c403-9382-47c6-a99d-f94511dfd651'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','65309a3c-cf3c-43f2-b96e-055c76c4e0da'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','deded2e8-0b80-4a2a-a1bc-b2d0412ed01c'),(22,NULL,'app','m160727_194637_column_cleanup','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','916cb4c5-18fe-4b8b-9fd0-e438529dffb8'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','9672e94a-4d36-4ba3-82a7-5419fcfe9fb3'),(24,NULL,'app','m160807_144858_sites','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b2b9e11b-3226-4692-8868-4c6fba374df6'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','99fdae36-233e-4dc0-aca2-16a54300ffb9'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','c086d885-edf0-465b-877a-158fbb7985df'),(27,NULL,'app','m160912_230520_require_entry_type_id','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','e11510b2-fd8f-404f-815a-61596d3faf01'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','ffb9ed2f-6c01-4b8c-9011-67f5ad8ee76f'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','e9630114-5107-451b-8244-319a88bb83db'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','c6f0ee66-710b-407f-b64d-aacb8ffbabcb'),(31,NULL,'app','m160925_113941_route_uri_parts','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','959193e2-bd2e-45e6-9997-6dead8dd9de4'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','eef3166d-4f64-4ba9-b57f-5cb72165eb7a'),(33,NULL,'app','m161007_130653_update_email_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','17bdf5aa-c7e7-4e42-b4b3-b7081035c398'),(34,NULL,'app','m161013_175052_newParentId','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','d0d46907-e69e-4163-a7bd-dacab6cff1d5'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','ebbb202e-92b9-4ee0-b470-c5319c24cf64'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','fa1ed9a1-848f-483d-b120-3b0e3eab1d3a'),(37,NULL,'app','m161025_000000_fix_char_columns','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','e3cdbc34-e322-4389-9989-1b38ff67aca5'),(38,NULL,'app','m161029_124145_email_message_languages','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b91947f3-fe53-47a5-8042-1a653bed2972'),(39,NULL,'app','m161108_000000_new_version_format','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','bb6ff8bf-135b-4d03-a3e4-ef040877fbc8'),(40,NULL,'app','m161109_000000_index_shuffle','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','a2ce0760-d3bc-4c64-9b54-4a2d5024d93c'),(41,NULL,'app','m161122_185500_no_craft_app','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','628228ee-e845-4442-89e9-06ca681c9324'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','9ad7a7a9-45d3-407e-b98e-e77d20b20d11'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','320f0366-dd42-4976-832c-ee724e1847bb'),(44,NULL,'app','m170114_161144_udates_permission','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','5d01b7a3-9406-4181-8a43-6dbdc2d0e744'),(45,NULL,'app','m170120_000000_schema_cleanup','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b672e66e-ceb1-489f-9371-c67a729bdb40'),(46,NULL,'app','m170126_000000_assets_focal_point','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','7e05282d-90d8-4b27-90c6-4d460c16866a'),(47,NULL,'app','m170206_142126_system_name','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','1f9fc58a-0cc9-45ef-ae5b-e00aabef0609'),(48,NULL,'app','m170217_044740_category_branch_limits','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','745c8642-8d12-414e-8793-ee3828698a97'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','cbc52bca-96be-482a-8180-a26f34b32a09'),(50,NULL,'app','m170223_224012_plain_text_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b7da81c5-d429-44bb-951c-ded7573524ac'),(51,NULL,'app','m170227_120814_focal_point_percentage','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','006cc121-abd5-41de-87a5-5ffc90291372'),(52,NULL,'app','m170228_171113_system_messages','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','53b4ae47-9bd4-433b-8fc6-e3e1195fde89'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','8966c068-45b0-47e5-b712-ef6a0fc7259f'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','387ac593-6562-4f2e-8df4-f60f8355e20c'),(55,NULL,'app','m170414_162429_rich_text_config_setting','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','214a4d8e-7e73-48f4-ad3b-5cbf044edb3f'),(56,NULL,'app','m170523_190652_element_field_layout_ids','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','1f4a9161-939c-42df-99eb-b39a02097265'),(57,NULL,'app','m170612_000000_route_index_shuffle','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','4d8b152e-09c4-429c-aa11-0435c52b570e'),(58,NULL,'app','m170621_195237_format_plugin_handles','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','0c848658-5db9-4067-8fcf-333b4fe32e1a'),(59,NULL,'app','m170630_161028_deprecation_changes','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','f4f434cd-5670-4400-8dff-920730223632'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b4facbf6-f322-41cb-9b1d-b7925e13afbb'),(61,NULL,'app','m170704_134916_sites_tables','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','caed1376-14c2-415e-8fb8-82ccf01dbde7'),(62,NULL,'app','m170706_183216_rename_sequences','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','9ad57974-a1a4-4b80-871e-ce09e7e8ef64'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','0c0d9e55-6353-42c9-90fd-e45de7048014'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','2410e699-9ac9-449e-ae16-84a593cdcca0'),(65,NULL,'app','m170810_201318_create_queue_table','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','43a73dca-92bb-4d2d-924e-6bbc07baed29'),(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b44579c9-01f7-42ff-98fd-cdd5df46637f'),(67,NULL,'app','m170821_180624_deprecation_line_nullable','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','eb9f3f7e-0c84-48d1-9313-37569640640e'),(68,NULL,'app','m170903_192801_longblob_for_queue_jobs','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','d89ff8ed-41a2-4e35-b151-c9a6c727670b'),(69,NULL,'app','m170914_204621_asset_cache_shuffle','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','8900d56e-e34a-49d4-b2bc-60e750160130'),(70,NULL,'app','m171011_214115_site_groups','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','0cd8a305-a335-49ca-b94f-abd780b2a4dc'),(71,NULL,'app','m171012_151440_primary_site','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','5e611140-8cec-4d2c-a796-50baf179de4a'),(72,NULL,'app','m171013_142500_transform_interlace','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','3f7093b4-0993-449d-9a37-1f39476e5f05'),(73,NULL,'app','m171016_092553_drop_position_select','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','7f5895b5-3573-4917-87e7-88ceb7cf8617'),(74,NULL,'app','m171016_221244_less_strict_translation_method','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','3e04e870-e6ad-44c1-8902-9dfb3f22b6f5'),(75,NULL,'app','m171107_000000_assign_group_permissions','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','563283ea-b200-4200-9a08-5eefe5f9ce48'),(76,NULL,'app','m171117_000001_templatecache_index_tune','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','e5a10795-2943-426a-921f-c758d919dfa8'),(77,NULL,'app','m171126_105927_disabled_plugins','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','567bdc1b-acca-40fd-ac89-35b670f9d67c'),(78,NULL,'app','m171130_214407_craftidtokens_table','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','37932046-51ce-4e88-98e7-fa234058258c'),(79,NULL,'app','m171202_004225_update_email_settings','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','ac7cee80-cf76-4dfb-adad-dbd1df39fea6'),(80,NULL,'app','m171204_000001_templatecache_index_tune_deux','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b71ace41-2f28-4931-8069-3717ed0d1f95'),(81,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','70213754-e54e-4b5a-99f7-01238be4d3f8'),(82,NULL,'app','m171218_143135_longtext_query_column','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','740917b1-6d7d-4db4-bf0a-d889b3f3682f'),(83,NULL,'app','m171231_055546_environment_variables_to_aliases','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','fd2c3023-1e26-4ba3-83f4-3eb2fe534661'),(84,NULL,'app','m180113_153740_drop_users_archived_column','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','02181e66-afc6-491d-8224-a7623d9f499c'),(85,NULL,'app','m180122_213433_propagate_entries_setting','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','8b2e92e4-f4e0-434d-b143-19e2e876b311'),(86,NULL,'app','m180124_230459_fix_propagate_entries_values','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','7e309f23-d2e7-4405-b714-05ca2f7a8134'),(87,NULL,'app','m180128_235202_set_tag_slugs','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','d36fa3a9-a0e4-4392-a3ce-a9477dbcb89f'),(88,NULL,'app','m180202_185551_fix_focal_points','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','5c878b5f-ca21-44b9-9e0c-bfd3380d54bc'),(89,NULL,'app','m180217_172123_tiny_ints','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','efb50e44-26ca-4409-a744-8ee8491a006e'),(90,NULL,'app','m180321_233505_small_ints','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','61a6c34d-cfb8-4383-81ac-1f544987ff55'),(91,NULL,'app','m180328_115523_new_license_key_statuses','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','e249f363-28df-40a5-b27f-6e8a5ad2b5e7'),(92,NULL,'app','m180404_182320_edition_changes','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','050ef901-315a-4429-8f9a-2523ca6efeb7'),(93,NULL,'app','m180411_102218_fix_db_routes','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','30e46cab-8ee3-4dd2-95f5-e8830496d661'),(94,NULL,'app','m180416_205628_resourcepaths_table','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','422454b8-da6d-47ff-8eb3-c891f92ffe9f'),(95,NULL,'app','m180418_205713_widget_cleanup','2018-05-11 17:24:19','2018-05-11 17:24:19','2018-05-11 17:24:19','b6ba39d3-6b7b-4512-ae14-c8a64658b327'),(96,2,'plugin','Install','2018-05-11 17:27:08','2018-05-11 17:27:08','2018-05-11 17:27:08','b2293cc8-c2ad-493f-9375-2e31145354dc'),(97,2,'plugin','m180305_000000_migrate_feeds','2018-05-11 17:27:08','2018-05-11 17:27:08','2018-05-11 17:27:08','5e500b5e-b02e-4535-ae7d-b70734601f73'),(98,6,'plugin','Install','2018-05-11 17:29:12','2018-05-11 17:29:12','2018-05-11 17:29:12','012e4f9d-35c2-4423-bff9-3aceb7839d66'),(99,7,'plugin','Install','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','931efb64-3a52-4c25-9d22-e74a447b1292'),(100,7,'plugin','m180309_000000_update_data_sources','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','0666b4d9-9260-408f-ab67-865ae2516aeb'),(101,7,'plugin','m180314_161522_sproutforms_plaintext_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','7d7a9eca-fe71-4f79-aa02-3395fe67b31d'),(102,7,'plugin','m180314_161523_sproutforms_dropdown_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','b7e13c3e-9182-428a-8f11-891ea1130ffd'),(103,7,'plugin','m180314_161524_sproutforms_checkboxes_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','8176e414-ac18-4c6e-a562-2dbe4265b6be'),(104,7,'plugin','m180314_161525_sproutforms_multiselect_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','596eb793-6e12-49e4-9a21-978484222bbf'),(105,7,'plugin','m180314_161526_sproutforms_radiobuttons_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','687d429d-936c-4674-87f6-0e8d93e13c03'),(106,7,'plugin','m180314_161527_sproutforms_number_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','abc65287-cbf1-4d91-8279-2ff7f5e4eaab'),(107,7,'plugin','m180314_161528_sproutforms_entries_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','7d410aa1-cdb2-4930-aca9-cb2104a56877'),(108,7,'plugin','m180314_161529_sproutforms_categories_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','919d50e6-7eff-4be6-9d9f-55aafa366ef8'),(109,7,'plugin','m180314_161530_sproutforms_tags_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','715a12c7-85ea-4719-9a13-9f5aeaf8e47a'),(110,7,'plugin','m180314_161531_sproutforms_assets_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','e0dd4d5d-38f4-4909-87bc-b3630e11b8bc'),(111,7,'plugin','m180314_161532_sproutforms_hidden_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','b290487c-dcd2-4f48-8ebf-1af830a82b42'),(112,7,'plugin','m180314_161533_sproutforms_invisible_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','81cfc271-d567-4444-8532-d8fc8682a1c3'),(113,7,'plugin','m180314_161534_sproutforms_link_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','6a87477c-5442-4b7a-b95b-2de249bfd2af'),(114,7,'plugin','m180314_161535_sproutforms_email_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','7d5ac390-c8a7-4bbe-a62a-3cf3d3a1a23c'),(115,7,'plugin','m180314_161536_sproutforms_email_select_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','36583761-2666-4f9a-b76e-c2f4d2b5cfcd'),(116,7,'plugin','m180314_161537_sproutforms_regular_expressions_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','65418a67-1e72-491a-b403-185abcfe6d41'),(117,7,'plugin','m180314_161538_sproutforms_notes_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','bb965771-cebb-444e-96b4-728339c5c969'),(118,7,'plugin','m180314_161539_sproutforms_phone_fields','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','4cbf577f-9700-4af6-830c-ea6ef4b20605'),(119,7,'plugin','m180314_161540_craft2_to_craft3','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','c5bfacf8-91df-44b8-be21-baba46a20152'),(120,7,'plugin','m180412_000000_sproutforms_sprout_email','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','f1da1dd7-3231-4aac-95b6-1e1ecf5c9bc7'),(121,7,'plugin','m180417_000000_sproutforms_craft3_schema_changes','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','ae599c86-9946-4e39-b53e-46b8a56bc091'),(122,7,'plugin','m180417_000000_sproutforms_datasources_pluginid_column','2018-05-11 17:40:04','2018-05-11 17:40:04','2018-05-11 17:40:04','0a72376a-f74c-4f0a-88f1-c8247e681ba1'),(123,8,'plugin','Install','2018-05-11 17:40:20','2018-05-11 17:40:20','2018-05-11 17:40:20','5a848e55-9bbc-430a-b518-90a25475b7cb'),(124,8,'plugin','m180210_000000_migrate_content_tables','2018-05-11 17:40:20','2018-05-11 17:40:20','2018-05-11 17:40:20','0aa1839e-8ea8-4fc9-9c1a-7c121b8cfb55'),(125,8,'plugin','m180211_000000_type_columns','2018-05-11 17:40:20','2018-05-11 17:40:20','2018-05-11 17:40:20','d41151b8-8e49-46a5-a8d6-e877b378c9f1'),(126,8,'plugin','m180219_000000_sites','2018-05-11 17:40:20','2018-05-11 17:40:20','2018-05-11 17:40:20','674ac82b-f708-44e1-b1e7-ba24d8404a10'),(127,8,'plugin','m180220_000000_fix_context','2018-05-11 17:40:20','2018-05-11 17:40:20','2018-05-11 17:40:20','8a3bd1e1-2abe-4c4b-a9e2-caf9d8e197ed'),(128,11,'plugin','m180430_204710_remove_old_plugins','2018-05-11 21:26:01','2018-05-11 21:26:01','2018-05-11 21:26:01','dc4159ac-72d5-437b-9990-b34420478c20'),(129,11,'plugin','Install','2018-05-11 21:26:01','2018-05-11 21:26:01','2018-05-11 21:26:01','185f6151-9f73-4355-b6a9-d1dbb3ebb80e'),(130,7,'plugin','m180515_000000_schema_version_v302','2018-05-29 18:39:57','2018-05-29 18:39:57','2018-05-29 18:39:57','4a7daaaf-1900-4cc4-9f49-2666936e212d'),(131,7,'plugin','m180515_000001_update_field_types','2018-05-29 18:39:57','2018-05-29 18:39:57','2018-05-29 18:39:57','f14b8e7f-24c7-4f6f-a69a-78c0efd292ac'),(132,NULL,'app','m180824_193422_case_sensitivity_fixes','2018-12-14 16:35:05','2018-12-14 16:35:05','2018-12-14 16:35:05','27c322f0-b297-461c-90b3-b5d88e3d4565'),(133,NULL,'app','m180901_151639_fix_matrixcontent_tables','2018-12-14 16:35:05','2018-12-14 16:35:05','2018-12-14 16:35:05','f97ad14c-8d3f-4688-b1f1-7af9ab691973'),(134,NULL,'app','m181112_203955_sequences_table','2018-12-14 16:35:05','2018-12-14 16:35:05','2018-12-14 16:35:05','8d41c2e5-e386-4766-a60c-2734c73da3d4'),(135,2,'plugin','m181113_000000_add_paginationNode','2018-12-14 16:35:05','2018-12-14 16:35:05','2018-12-14 16:35:05','f7437c79-2c49-4f29-ab8b-90a8564d8b30'),(136,6,'plugin','m180906_152947_add_site_id_to_redirects','2018-12-14 16:35:05','2018-12-14 16:35:05','2018-12-14 16:35:05','f71d1a96-f5b8-4df8-8149-bff9d0c3f552'),(137,NULL,'app','m170630_161027_deprecation_line_nullable','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','8e1ede5b-b83e-45ef-8677-4f7a134fa914'),(138,NULL,'app','m180425_203349_searchable_fields','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','76753708-3330-4db2-8790-cff2600c498d'),(139,NULL,'app','m180516_153000_uids_in_field_settings','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','f3d8c9d9-ae0a-4c5d-bcb0-f7b2575cc70a'),(140,NULL,'app','m180517_173000_user_photo_volume_to_uid','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','cc0da71e-6349-4fb8-b487-bfcddfd5baad'),(141,NULL,'app','m180518_173000_permissions_to_uid','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','65986fd3-e795-4709-9f0b-a1b2e38709a1'),(142,NULL,'app','m180520_173000_matrix_context_to_uids','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','c7d5c729-c32c-4494-a2ca-e182be820804'),(143,NULL,'app','m180521_173000_initial_yml_and_snapshot','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','371af3dc-6b6a-40ae-b77e-4feefcceffab'),(144,NULL,'app','m180731_162030_soft_delete_sites','2019-02-01 16:43:29','2019-02-01 16:43:29','2019-02-01 16:43:29','99c22b0c-7316-4a5d-84e7-f2725c25d4c5'),(145,NULL,'app','m180810_214427_soft_delete_field_layouts','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','e8d14b65-8362-450f-9cbc-36dabb2c2964'),(146,NULL,'app','m180810_214439_soft_delete_elements','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','1d2ee396-7c59-4c9f-ab3c-1f23e7bf719d'),(147,NULL,'app','m180904_112109_permission_changes','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','4b170825-3227-4dcf-9c6e-7160f4ace74d'),(148,NULL,'app','m180910_142030_soft_delete_sitegroups','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','66ef49eb-9424-49f2-b270-19e6038c663b'),(149,NULL,'app','m181011_160000_soft_delete_asset_support','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','75c4ba06-8c37-4df1-b4f0-c3d11332d75e'),(150,NULL,'app','m181016_183648_set_default_user_settings','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','e765ea0b-ffbc-4f25-a8a4-ddefa2933990'),(151,NULL,'app','m181017_225222_system_config_settings','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','a9c8bd1f-f4cb-43be-b4fc-18276ee56225'),(152,NULL,'app','m181018_222343_drop_userpermissions_from_config','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','13a426ea-9435-49e3-9de3-b4338d63a135'),(153,NULL,'app','m181029_130000_add_transforms_routes_to_config','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','716cc1e4-1c92-4a03-866c-450163339e33'),(154,NULL,'app','m181121_001712_cleanup_field_configs','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','deb6a3b8-e0f8-4d9f-98f0-0f5725bea759'),(155,NULL,'app','m181128_193942_fix_project_config','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','8672998d-d5cc-410f-a5c6-373a92adfc61'),(156,NULL,'app','m181130_143040_fix_schema_version','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','3eb18ed2-0a0a-4a36-99e7-9f4cb778b395'),(157,NULL,'app','m181211_143040_fix_entry_type_uids','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','ddf50118-5292-4dcb-98ee-6372eddaa635'),(158,NULL,'app','m181213_102500_config_map_aliases','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','6c1339f1-f1af-4131-aa68-0fe816ced746'),(159,NULL,'app','m181217_153000_fix_structure_uids','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','450cb1c5-82d9-49c7-bb61-4b4af02ce65a'),(160,NULL,'app','m190104_152725_store_licensed_plugin_editions','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','7f9b45d2-7282-4b7e-bef1-e9f67fa89b26'),(161,NULL,'app','m190108_110000_cleanup_project_config','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','ddbf37fb-2c74-4fc5-b91b-b6f4788625ad'),(162,NULL,'app','m190108_113000_asset_field_setting_change','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','c1a67797-6ca4-4414-8459-4308ed9dc6c2'),(163,NULL,'app','m190109_172845_fix_colspan','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','c6fb5e24-be4c-4c3e-bcb4-760c03ad1a4f'),(164,NULL,'app','m190110_150000_prune_nonexisting_sites','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','77c06eca-2bf0-4c22-aab7-a2185f6611a7'),(165,NULL,'app','m190110_214819_soft_delete_volumes','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','af15a243-0164-4a18-872e-033fb5f1ff34'),(166,NULL,'app','m190112_124737_fix_user_settings','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','50f9c2cf-7e6b-4a64-bccf-f2b3d6128620'),(167,NULL,'app','m190112_131225_fix_field_layouts','2019-02-01 16:43:30','2019-02-01 16:43:30','2019-02-01 16:43:30','8cd9c394-2a1d-4f5d-8274-39d907fac4cb'),(168,NULL,'app','m190112_201010_more_soft_deletes','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','e4e5b810-69f9-4ecf-ac5d-b46701a33e41'),(169,NULL,'app','m190114_143000_more_asset_field_setting_changes','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','719f1619-2a03-437e-b6f0-92be45d0950c'),(170,NULL,'app','m190121_120000_rich_text_config_setting','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','0945fb3f-a3b2-48f0-8d35-8d3f5265d4ba'),(171,NULL,'app','m190125_191628_fix_email_transport_password','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','294c3bfc-8a1b-4217-b759-63103d2e78cf'),(172,NULL,'app','m190128_181422_cleanup_volume_folders','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','e78e291e-7759-4c82-aff6-7e29d26dda54'),(173,NULL,'app','m190218_143000_element_index_settings_uid','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','6dcd7e46-ed93-4ab2-ba59-a45c4b2dc3a8'),(174,11,'plugin','m181101_110000_ids_in_settings_to_uids','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','095bb582-9607-4dd6-9dff-5e95736ba934'),(175,6,'plugin','m190114_152300_upgrade_to_new_data_format','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','3b5304c1-749a-4538-847e-c1016408e501'),(176,8,'plugin','m190117_000000_soft_deletes','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','17a7fab4-4999-412c-be03-3f30e2bfaa5d'),(177,8,'plugin','m190117_000001_context_to_uids','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','38c8a899-2820-4523-b42b-289b6d3c55f2'),(178,8,'plugin','m190120_000000_fix_supertablecontent_tables','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','227f4947-7048-4994-9b3b-ccf4662b2268'),(179,8,'plugin','m190131_000000_fix_supertable_missing_fields','2019-02-01 16:43:31','2019-02-01 16:43:31','2019-02-01 16:43:31','38e8014e-0dba-4544-91c6-2a47bb8d6c6f'),(180,2,'plugin','m190201_000000_update_asset_feeds','2019-02-05 16:35:33','2019-02-05 16:35:33','2019-02-05 16:35:33','c199f4f7-9ec1-4857-acc8-887f92a21dc4'),(181,13,'plugin','Install','2019-02-05 16:42:41','2019-02-05 16:42:41','2019-02-05 16:42:41','068621b0-1ddb-486f-a4ce-1ca346f00aa3'),(182,18,'plugin','Install','2019-02-05 16:57:39','2019-02-05 16:57:39','2019-02-05 16:57:39','feb71b0e-3158-4515-8094-7c26c61f82de'),(183,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2019-02-13 21:41:32','2019-02-13 21:41:32','2019-02-13 21:41:32','89f6b83c-ccea-49e9-8f4f-1419cc6c1c43'),(184,NULL,'app','m190208_140000_reset_project_config_mapping','2019-02-13 21:41:32','2019-02-13 21:41:32','2019-02-13 21:41:32','ad70e043-6a2f-434c-a0fe-06ffbba99b24'),(185,8,'plugin','m190227_100000_fix_project_config','2019-03-06 21:42:59','2019-03-06 21:42:59','2019-03-06 21:42:59','e033e0a4-93fc-4d3f-91ef-fac81b409bff'),(186,NULL,'app','m190401_223843_drop_old_indexes','2019-04-17 15:55:25','2019-04-17 15:55:25','2019-04-17 15:55:25','0489d23f-718b-4781-8486-06a5ccdfe94a'),(187,NULL,'app','m190416_014525_drop_unique_global_indexes','2019-04-17 15:55:25','2019-04-17 15:55:25','2019-04-17 15:55:25','61026052-7bdf-4ef4-a4d8-3980c5f9b94a'),(188,2,'plugin','m190320_000000_renameLocale','2019-04-17 15:55:25','2019-04-17 15:55:25','2019-04-17 15:55:25','5fc7f101-a970-4ab7-be6e-f10fc2589b48'),(189,2,'plugin','m190406_000000_sortOrder','2019-04-17 15:55:25','2019-04-17 15:55:25','2019-04-17 15:55:25','0fd94e4f-2aea-4fdd-984a-c4887fa0bd7d'),(190,11,'plugin','m190225_003922_split_cleanup_html_settings','2019-05-02 16:10:07','2019-05-02 16:10:07','2019-05-02 16:10:07','56fb2489-87ee-48b0-a079-7821b142f4ca'),(191,NULL,'app','m190502_122019_store_default_user_group_uid','2019-05-16 19:39:33','2019-05-16 19:39:33','2019-05-16 19:39:33','b82bd847-4a26-48b6-b048-e83b4db7037a'),(192,8,'plugin','m190511_100000_fix_project_config','2019-05-16 19:39:33','2019-05-16 19:39:33','2019-05-16 19:39:33','76a70d6f-cb06-44ab-940d-a396456f2509'),(193,13,'plugin','m190408_195351_support_multiple_types','2019-05-16 20:28:36','2019-05-16 20:28:36','2019-05-16 20:28:36','dfc3593c-54c6-407b-bb69-25b9b9816783');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
INSERT INTO `craft_plugins` VALUES (1,'element-api','2.5.4','1.0.0','unknown',NULL,'2018-05-11 17:26:00','2018-05-11 17:26:00','2019-05-16 20:28:40','0a9df9f0-8e2e-4e5c-bcf2-21fd78285e98'),(2,'feed-me','4.1.0','2.1.2','unknown',NULL,'2018-05-11 17:27:08','2018-05-11 17:27:08','2019-05-16 20:28:40','21ed2c90-ec75-4417-ba9f-0e8db435f03e'),(3,'cookies','1.1.11','1.0.0','unknown',NULL,'2018-05-11 17:27:30','2018-05-11 17:27:30','2019-05-16 20:28:40','61e8aeeb-ad20-4668-8695-9bb4c269f771'),(4,'minify','1.2.9','1.0.0','unknown',NULL,'2018-05-11 17:27:58','2018-05-11 17:27:58','2019-05-16 20:28:40','edb8c40f-0b5b-4c17-a97d-b06958aa88b8'),(5,'retcon','2.0.12','1.0.0','unknown',NULL,'2018-05-11 17:28:11','2018-05-11 17:28:11','2019-05-16 20:28:40','b2c47009-e6f2-4b2a-bc9d-ae129906d7c2'),(6,'seo','3.5.4','3.1.0','unknown',NULL,'2018-05-11 17:29:12','2018-05-11 17:29:12','2019-05-16 20:28:40','01f05d8e-c46b-4571-b147-7989ceb84073'),(7,'sprout-forms','3.0.0-beta.16','3.0.2','invalid',NULL,'2018-05-11 17:40:03','2018-05-11 17:40:03','2019-05-16 20:28:40','ffc853c2-2611-4fff-9e5e-2fd377789423'),(8,'super-table','2.1.19','2.0.11','unknown',NULL,'2018-05-11 17:40:20','2018-05-11 17:40:20','2019-05-16 20:28:40','c96e8e41-313e-4515-9d2f-5386715f32f7'),(9,'video-embedder','1.1.1','1.0.0','unknown',NULL,'2018-05-11 17:40:48','2018-05-11 17:40:48','2019-05-16 20:28:40','1e2fce69-ff70-4318-b5e3-c50cfd1a6e68'),(10,'typedlinkfield','1.0.19','1.0.0','unknown',NULL,'2018-05-11 17:41:38','2018-05-11 17:41:38','2019-05-16 20:28:40','f45a2914-ab1d-4ba9-9ffe-129ec19ff87d'),(11,'redactor','2.3.3.2','2.3.0','unknown',NULL,'2018-05-11 21:26:01','2018-05-11 21:26:01','2019-05-16 20:28:40','5c7aaf1d-c239-4dd8-8096-fc95d8d85dcc'),(13,'snitch','2.1.2','2.1.0','unknown',NULL,'2019-02-05 16:42:41','2019-02-05 16:42:41','2019-05-16 20:28:40','52eb521c-3357-481d-bbbf-bab7b1b48f7b'),(14,'cp-element-count','1.1.0','1.0.0','unknown',NULL,'2019-02-05 16:43:36','2019-02-05 16:43:36','2019-05-16 20:28:40','0177e312-8d17-40cf-b2c8-23b2f5c3d674'),(15,'sasutils','1','1','unknown',NULL,'2019-02-05 16:47:08','2019-02-05 16:47:08','2019-05-16 20:28:40','176ebd0b-65a1-40e1-ad3a-cbada8a46410'),(16,'pushdb','1.0','1','unknown',NULL,'2019-02-05 16:47:13','2019-02-05 16:47:13','2019-05-16 20:28:40','d9e75e51-7610-401f-8bd7-1d540bacce37'),(17,'assetusage','2.0.1','2.0.0','unknown',NULL,'2019-02-05 16:53:21','2019-02-05 16:53:21','2019-05-16 20:28:40','032aae85-8253-439e-8909-486e8b13e2e8'),(18,'cloudflare','0.2.6','1.0.0','unknown',NULL,'2019-02-05 16:57:39','2019-02-05 16:57:39','2019-05-16 20:28:40','77c4b4b9-cff7-4a29-a34a-13fba1bd6340'),(19,'imager','v2.1.10','2.0.0','unknown',NULL,'2019-02-13 22:04:08','2019-02-13 22:04:08','2019-05-16 20:28:40','97bec546-67f1-4944-b750-dbdde14a145e');
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_queue`
--

DROP TABLE IF EXISTS `craft_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `craft_queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_queue`
--

LOCK TABLES `craft_queue` WRITE;
/*!40000 ALTER TABLE `craft_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_relations_sourceId_idx` (`sourceId`),
  KEY `craft_relations_targetId_idx` (`targetId`),
  KEY `craft_relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
INSERT INTO `craft_relations` VALUES (1,13,8,NULL,7,1,'2018-05-14 18:48:27','2018-05-14 18:48:27','5631edac-70e1-47c6-b34a-1316309e0fce'),(13,48,17,NULL,12,1,'2018-05-14 20:20:49','2018-05-14 20:20:49','7c8b5c49-5d00-4940-a84c-6837aacc52a8'),(32,2,19,NULL,18,1,'2019-05-16 20:12:45','2019-05-16 20:12:45','be45bfad-7919-4869-a059-fb7d470fc7c3'),(33,24,13,NULL,9,1,'2019-05-16 20:14:54','2019-05-16 20:14:54','95af2468-6acc-4c96-b334-fbb5388c566f');
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_resourcepaths`
--

DROP TABLE IF EXISTS `craft_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_resourcepaths`
--

LOCK TABLES `craft_resourcepaths` WRITE;
/*!40000 ALTER TABLE `craft_resourcepaths` DISABLE KEYS */;
INSERT INTO `craft_resourcepaths` VALUES ('102baa71','@lib/fabric'),('10953fa4','@app/web/assets/updateswidget/dist'),('10accbd','@craft/web/assets/matrixsettings/dist'),('10ee639c','@craft/web/assets/fields/dist'),('1155f76a','@craft/web/assets/utilities/dist'),('11ec693','@lib/fileupload'),('12c5e3b1','@app/web/assets/deprecationerrors/dist'),('12ed0b7d','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\fileupload'),('133a2120','@craft/web/assets/userpermissions/dist'),('1359f1b4','@app/web/assets/dashboard/dist'),('13c48196','@lib/jquery-touch-events'),('142f8479','@lib/element-resize-detector'),('143edffa','@app/web/assets/fields/dist'),('1447c4bc','@lib'),('1460bd54','@lib/picturefill'),('167533d1','@bower/jquery/dist'),('1675569d','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\marionnewlevant\\snitch\\src\\assetbundles\\snitch\\dist'),('1753e73c','@lib/d3'),('1807d166','@app/web/assets/recententries/dist'),('19f6c76d','@lib/picturefill'),('1a197e2','@aelvan/cpelementcount/resources'),('1a303697','@craft/web/assets/updateswidget/dist'),('1aa99b73','@verbb/supertable/resources/dist'),('1ac59d05','@lib/d3'),('1bcebfa8','@typedlinkfield/resources'),('1d28d639','@lib/element-resize-detector'),('1d59206b','@lib/jquery-ui'),('1e079365','@app/web/assets/craftsupport/dist'),('1e20e346','@lib/fabric'),('1e52fbaf','@lib/jquery-touch-events'),('1e72bbc0','@app/web/assets/pluginstore/dist'),('1ec02fd1','@craft/web/assets/dashboard/dist'),('1ee52aab','@craft/web/assets/fields/dist'),('1ee622bf','@verbb/supertable/resources/dist'),('2059e165','@craft/web/assets/plugins/dist'),('209d4866','@lib/fileupload'),('20b1ca09','@app/web/assets/updates/dist'),('20e476fb','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\sebastianlenz\\linkfield\\src\\resources'),('213e2798','@bower/jquery/dist'),('2143c12d','@craft/web/assets/deprecationerrors/dist'),('21c55dd1','@lib/jquery.payment'),('21d91192','@barrelstrength/sproutforms/web/assets/charts/dist'),('224790ce','@lib/selectize'),('22a0164b','@craft/web/assets/pluginstore/dist'),('22c55758','@typedlinkfield/resources'),('23378ab1','@lib/velocity'),('236f8f3b','@typedlinkfield/resources'),('23b7e36d','@app/web/assets/tablesettings/dist'),('248a74f9','@craft/web/assets/recententries/dist'),('24eef0ba','@lib/garnishjs'),('26163385','@verbb/supertable/resources/dist'),('26bd9308','@app/web/assets/updateswidget/dist'),('27117087','@craft/web/assets/updates/dist'),('279847f5','@lib/xregexp'),('282bd444','@lib/xregexp'),('282f3fc9','@app/web/assets/craftsupport/dist'),('29788a83','@lib/garnishjs'),('2a30d8f1','@lib/velocity'),('2a9d8d32','@app/web/assets/utilities/dist'),('2c208f46','@vendor/craftcms/redactor/lib/redactor'),('2c4b1b06','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\jquery-ui'),('2c6d0544','@bower/jquery/dist'),('2c967f0d','@lib/jquery.payment'),('2d4932a6','@craft/web/assets/updater/dist'),('2df4037f','@lib/selectize'),('2e2f7dca','@app/web/assets/recententries/dist'),('2e5b97c3','@marionnewlevant/snitch/assetbundles/snitch/dist'),('2e827de','@craft/web/assets/craftsupport/dist'),('2e960151','@lib/fileupload'),('2f28fc95','@app/web/assets/feed/dist'),('2f5e1a2c','@barrelstrength/sproutforms/web/assets/base/dist'),('304bd1ed','@craft/web/assets/login/dist'),('30b1d0e5','@lib/velocity'),('30d6799f','@craft/web/assets/utilities/dist'),('31a5ffa7','@craft/web/assets/updateswidget/dist'),('31a82484','@lib/fabric'),('31da3c6d','@lib/jquery-touch-events'),('31fd841d','@app/web/assets/feed/dist'),('32b87dcc','@bower/jquery/dist'),('33625a47','@app/web/assets/cp/dist'),('33f2d6b0','@lib/timepicker'),('33ff33b4','@app/web/assets/editentry/dist'),('3448f5ba','@app/web/assets/utilities/dist'),('34d2f301','@marionnewlevant/snitch/assetbundles/snitch/dist'),('35ce0e29','@marionnewlevant/snitch/assetbundles/snitch/dist'),('36177719','@lib/jquery.payment'),('367e00af','@lib/picturefill'),('36d069c9','@lib/d3'),('36f798de','@craft/web/assets/tablesettings/dist'),('375c4f39','@app/web/assets/login/dist'),('37d072','@app/web/assets/matrixsettings/dist'),('384d6620','@craft/web/assets/craftsupport/dist'),('38754998','@lib/picturefill'),('38db20fe','@lib/d3'),('38fcd1e9','@craft/web/assets/tablesettings/dist'),('39d27697','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\element-resize-detector'),('3bbf2f8c','@bower/jquery/dist'),('3bf812f4','@app/web/assets/plugins/dist'),('3c3e5ebd','@lib/fabric'),('3cdd1180','@app/web/assets/matrix/dist'),('3d577fd3','@lib/prismjs'),('3d907893','@craft/web/assets/updates/dist'),('3de2f239','@lib/velocity'),('3dfd1a9a','@craft/web/assets/feed/dist'),('3edb6bf5','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\xregexp'),('3edd30a8','@craft/web/assets/utilities/dist'),('3ee750d4','@lib/jquery-ui'),('3f102559','@lib/jquery.payment'),('3f4c0578','@app/web/assets/dashboard/dist'),('3f658c61','@craft/redactor/assets/field/dist'),('3fd1755a','@lib/jquery-touch-events'),('3fdaeb1','@lib/element-resize-detector'),('401e90d0','@lib/selectize'),('40c9100a','@app/web/assets/clearcaches/dist'),('42173c4a','@craft/web/assets/craftsupport/dist'),('423f11e1','@vendor/craftcms/redactor/lib/redactor'),('427f4cb3','@bower/jquery/dist'),('42e8ca17','@app/web/assets/updates/dist'),('43153b5','@app/web/assets/generalsettings/dist'),('44127c5','@craft/web/assets/dashboard/dist'),('4492192c','@lib/garnishjs'),('44be3c51','@craft/web/assets/dashboard/dist'),('466667dd','@lib/velocity'),('47239cf5','@craft/web/assets/updater/dist'),('479e1521','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\login\\dist'),('47e4ae63','@lib/xregexp'),('48e6cfa3','@app/web/assets/cp/dist'),('4928d5c2','@craft/web/assets/updater/dist'),('4a72d45a','@lib/xregexp'),('4a7911f9','@app/web/assets/feed/dist'),('4af7e635','@lib/fileupload'),('4b218a9d','@lib/garnishjs'),('4b7e90a6','@app/web/assets/recententries/dist'),('4ba7cfa0','@craft/web/assets/cp/dist'),('4bd8b395','@app/icons'),('4c8578d6','@ether/seo/web/assets'),('4cd8dadd','@app/web/assets/login/dist'),('4cde235d','@craft/icons'),('4d0bfa00','@app/web/assets/pluginstore/dist'),('4d88eae9','@lib/selectize'),('4e5197f9','@lib/element-resize-detector'),('4ee0daaa','@craft/web/assets/recententries/dist'),('4eef06','@craft/web/assets/cp/dist'),('4fd71426','@lib/jquery.payment'),('50908393','@craft/web/assets/login/dist'),('517a12c6','@craft/redactor/assets/field/dist'),('5192bca7','@app/web/assets/plugins/dist'),('51d4cd12','@lib/fabric'),('51d91631','@craft/web/assets/updateswidget/dist'),('520da255','@app/web/assets/login/dist'),('521fe7cb','@lib/picturefill'),('52967fba','@craft/web/assets/tablesettings/dist'),('52e7cb44','@craft/web/assets/editcategory/dist'),('53de8288','@app/web/assets/pluginstore/dist'),('53f0bbce','@lib/velocity'),('54af6eb','@app/web/assets/cp/dist'),('550dcb1d','@app/icons'),('55abe82e','@app/web/assets/recententries/dist'),('55bbdb09','@lib/jquery-touch-events'),('5633b72b','@app/web/assets/cp/dist'),('56d7e4f','@lib/garnishjs'),('573dd180','@lib/prismjs'),('579331d4','@lib/timepicker'),('57e990a0','@bower/jquery/dist'),('5896345e','@craft/web/assets/craftsupport/dist'),('599878e3','@lib/timepicker'),('59ebfdf4','@lib'),('5a41c835','@lib/jquery.payment'),('5abcd7cc','@craft/web/assets/utilities/dist'),('5b74df3d','@craft/web/assets/matrixsettings/dist'),('5cbac79a','@lib/d3'),('5cd35a9d','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\dashboard\\dist'),('5d150566','@app/web/assets/dashboard/dist'),('5e675ea3','@lib/fabric'),('5ebdbfaf','@craft/web/assets/editentry/dist'),('5f607b76','@doublesecretagency/matrixcolors/resources'),('5fb93f22','@craft/web/assets/edituser/dist'),('61622f05','@lib/fileupload'),('61c13c0c','@bower/jquery/dist'),('61d19ec3','@craft/web/assets/matrixsettings/dist'),('62002d2b','@lib/selectize'),('635f7128','@craft/web/assets/pluginstore/dist'),('642f0862','@craft/web/assets/cp/dist'),('64994354','@lib/jquery-ui'),('65830681','@app/web/assets/craftsupport/dist'),('65cca839','@app/web/assets/routes/dist'),('661ca4f','@lib/selectize'),('66672096','@lib/xregexp'),('66a01200','@craft/web/assets/updater/dist'),('66ce9096','@app/web/assets/updates/dist'),('6731b47a','@app/web/assets/utilities/dist'),('6748add','@app/icons'),('674bea6d','@craft/icons'),('6783091a','@craft/web/assets/feed/dist'),('686c69a1','@lib/xregexp'),('6a244155','@craft/web/assets/cp/dist'),('6b11aa40','@app/web/assets/updateswidget/dist'),('6b15f2ed','@app/web/assets/edittransform/dist'),('6be83bf8','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\timepicker'),('6c0b641c','@lib/selectize'),('6c696499','@lib/jquery.payment'),('6cbb8f71','@typedlinkfield/resources'),('6cf6f308','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\picturefill'),('6d9e1114','@lib/jquery-ui'),('6dcfb96','@craft/web/assets/updater/dist'),('6defe746','@lib/element-resize-detector'),('6ed1bcb4','@lib/fileupload'),('6f07d01c','@lib/garnishjs'),('6f63545f','@craft/web/assets/recententries/dist'),('6fc35158','@lib'),('704ecb71','@lib/velocity'),('705a98c4','@craft/web/assets/updateswidget/dist'),('71291efc','@craft/web/assets/utilities/dist'),('719d8188','@lib/jquery-touch-events'),('734b699c','@lib/jquery-ui'),('74c8a49d','@cpelementcount/resources'),('74cdd8b0','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\craftsupport\\dist'),('7585b64','@craft/web/assets/feed/dist'),('75c4d2c8','@app/web/assets/updateswidget/dist'),('7639bd4a','@lib/picturefill'),('772f0eaa','@lib/d3'),('77ce345a','@craft/redactor/assets/field/dist'),('77d9fb1c','@sproutbase/web/assets/sproutfields/selectother/dist'),('78793b55','@lib/element-resize-detector'),('789c9d1b','@lib/d3'),('79335fe7','@app/web/assets/dashboard/dist'),('798a2efb','@lib/picturefill'),('7a410422','@lib/fabric'),('7a558d4b','@lib'),('7a84cdcf','@craft/web/assets/fields/dist'),('7a9066ec','@sproutformslib/dragula'),('7b44f87f','@app/web/assets/updater/dist'),('7b567e09','@app/web/assets/craftsupport/dist'),('7b9f4f8d','@barrelstrength/sproutforms/web/assets/forms/dist'),('7c51bd55','@app/web/assets/feed/dist'),('7d02010e','@craft/web/assets/feed/dist'),('7d66b2e3','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\cp\\dist'),('7d6f6307','@craft/web/assets/updates/dist'),('7e184b40','@lib/jquery-ui'),('7e1b7daf','@craft/web/assets/dashboard/dist'),('7e2e1239','@lib/jquery-touch-events'),('8061df19','@craft/web/assets/matrixsettings/dist'),('8193b794','@lib/jquery-ui'),('8289fdda','@craft/web/assets/feed/dist'),('82fefdd0','@lib'),('830a769c','@lib/garnishjs'),('83556ca7','@app/web/assets/recententries/dist'),('848cf5b4','@app/web/assets/plugins/dist'),('84d30c97','@lib/velocity'),('84f078c','@ether/seo/resources'),('8551c529','@lib/xregexp'),('855a008a','@app/web/assets/feed/dist'),('859f49b8','@craft/web/assets/cp/dist'),('85b72020','@ether/seo/resources'),('85caf8f6','@lib/fabric'),('8653b25b','@barrelstrength/sproutforms/web/assets/fontawesome/dist'),('87445ed5','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\jquery.payment'),('8899da2a','@lib/fabric'),('894576ae','@lib/velocity'),('899c2677','@app/web/assets/updater/dist'),('89c8bb71','@typedlinkfield/resources'),('89f2a4e1','@craft/web/assets/updates/dist'),('8a0d24dc','@lib/garnishjs'),('8a9395b0','@app/web/assets/pluginstore/dist'),('8bb4433c','@sproutbase/web/assets/sproutbase/groups/dist'),('8beb81ef','@app/web/assets/dashboard/dist'),('8c8631f0','@lib/timepicker'),('8c8cafa1','@app/web/assets/fields/dist'),('8cf5b4e7','@lib'),('8cffc78','@lib/jquery-ui'),('8d424050','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\updateswidget\\dist'),('8dd16a8b','@verbb/supertable/resources/dist'),('8e6a962e','@craft/web/assets/matrixsettings/dist'),('8f3d81a3','@lib/selectize'),('908c2cc8','@lib/garnishjs'),('90c7193a','@lib/xregexp'),('91a07542','@craft/web/assets/dashboard/dist'),('91abd89b','@app/web/assets/cp/dist'),('923dd5e6','@craft/web/assets/updater/dist'),('9295a4ad','@app/icons'),('935df7b','@craft/web/assets/pluginstore/dist'),('94164e9e','@app/web/assets/updates/dist'),('94a2eb62','@app/web/assets/deprecationerrors/dist'),('953ef967','@app/web/assets/dashboard/dist'),('954497dd','@lib/element-resize-detector'),('955cfbea','@bower/jquery/dist'),('9562d946','@lib/jquery.payment'),('960909ae','@craft/web/assets/craftsupport/dist'),('960bc2ec','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\fields\\dist'),('964ca2a2','@lib/fabric'),('975bd889','@app/web/assets/craftsupport/dist'),('9885a029','@app/web/assets/matrixsettings/dist'),('98ca81d3','@bower/jquery/dist'),('98f4a37f','@lib/jquery.payment'),('99de73ce','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\jquery-touch-events'),('9aab5db0','@lib/selectize'),('9b4fdeea','@lib/element-resize-detector'),('9bfe93b9','@craft/web/assets/recententries/dist'),('9ddf0e14','@lib/garnishjs'),('9e184b2a','@app/web/assets/cp/dist'),('9e3a09a5','@app/web/assets/utilities/dist'),('9f2d0625','@craft/web/assets/plugins/dist'),('9f4bf0e2','@lib/fabric'),('9f70c46','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\d3'),('9f8e390f','@craft/web/assets/fields/dist'),('9fe19029','@craft/web/assets/updateswidget/dist'),('a028d289','@craft/web/assets/deprecationerrors/dist'),('a0c739c3','@lib/picturefill'),('a1065c80','@app/web/assets/pluginstore/dist'),('a15bd247','@craft/web/assets/recententries/dist'),('a3313b4e','@lib/d3'),('a465afe1','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\ether\\seo\\src\\web\\assets'),('a46f61db','@app/web/assets/matrix/dist'),('a5372b18','@craft/web/assets/utilities/dist'),('a544d1d7','@craft/web/assets/updateswidget/dist'),('a5508262','@lib/velocity'),('a5b5ed15','@lib/jquery-ui'),('a5e50f88','@lib/prismjs'),('a67a6323','@craft/web/assets/updates/dist'),('a6fa40b5','@lib/fileupload'),('a7630501','@lib/jquery-touch-events'),('a7733626','@app/web/assets/recententries/dist'),('a8989418','@craft/web/assets/updater/dist'),('a91c34ea','@craft/web/assets/feed/dist'),('a92bc34','@lib'),('a94a9da','@vendor/craftcms/redactor/lib/redactor'),('a94ff446','@app/web/assets/feed/dist'),('aa067ea4','@lib/jquery-ui'),('aa3027dd','@lib/jquery-touch-events'),('ab24f8c4','@craft/web/assets/edituser/dist'),('ab4d43ef','@app/web/assets/editentry/dist'),('ab5bcb55','@lib/velocity'),('ab875a99','@verbb/supertable/resources/dist'),('abb122a1','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\fabric'),('abb966dd','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\selectize'),('ad763a12','@lib'),('ad941b1f','@lib/picturefill'),('adba7cf6','@app/web/assets/updater/dist'),('ae621992','@lib/d3'),('aee9013','@craft/web/assets/login/dist'),('af38414f','@lib/timepicker'),('af670df4','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\velocity'),('affd12f5','@lib/fileupload'),('b023fbb7','@craft/web/assets/dashboard/dist'),('b0b12fc9','@lib/jquery-touch-events'),('b0b7611a','@lib/d3'),('b187f9d9','@storage/rebrand/logo'),('b2236c7e','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\matrixsettings\\dist'),('b22ffd69','@app/web/assets/utilities/dist'),('b3796985','@lib/xregexp'),('b37d8208','@app/web/assets/craftsupport/dist'),('b3f8023e','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\recententries\\dist'),('b426ad33','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\verbb\\super-table\\src\\resources\\dist'),('b4df751f','@bower/jquery/dist'),('b5685834','@aelvan/cpelementcount/resources'),('b57c1ae1','@lib/fileupload'),('b59a7753','@craft/web/assets/login/dist'),('b641383b','@craft/web/assets/pluginstore/dist'),('b663778','@lib/garnishjs'),('b715130b','@lib/picturefill'),('b75a2a26','@lib/element-resize-detector'),('b77c64bd','@lib/jquery.payment'),('b79c8b7a','@craft/web/assets/tablesettings/dist'),('b82f383d','@lib/fileupload'),('b9006d9d','@app/icons'),('b9152d0f','@lib/selectize'),('b9772d8a','@lib/jquery.payment'),('b9b0335a','@lib/d3'),('b9b67d89','@lib/jquery-touch-events'),('ba3e11ab','@app/web/assets/cp/dist'),('bacc501f','@lib/element-resize-detector'),('bad43c28','@bower/jquery/dist'),('bb059336','@app/web/assets/tablesettings/dist'),('bc70065f','@marionnewlevant/snitch/assetbundles/snitch/dist'),('bd9cc09e','@craft/web/assets/craftsupport/dist'),('bdef2ec9','@app/web/assets/updateswidget/dist'),('be12414b','@lib/picturefill'),('bf3a0846','@craft/web/assets/cp/dist'),('bfb6230c','@craft/web/assets/utilities/dist'),('c0016b4b','@cpelementcount/resources'),('c00c04c4','@typedlinkfield/resources'),('c0705065','@lib/d3'),('c0d8ec5','@lib/xregexp'),('c12a08b8','@lib/timepicker'),('c1808039','@craft/web/assets/recententries/dist'),('c21b8447','@craft/web/assets/updates/dist'),('c282c160','@app/web/assets/assetindexes/dist'),('c2df7c8e','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\lib\\garnishjs'),('c3255a15','@app/web/assets/feed/dist'),('c3abadd9','@lib/fileupload'),('c535e362','@lib/fabric'),('c5e4097d','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\tablesettings\\dist'),('c5f02a8f','@craft/web/assets/fields/dist'),('c647b8a7','@app/web/assets/dashboard/dist'),('c6a27d85','@app/web/assets/sites/dist'),('c7eced0b','@lib/jquery-ui'),('c843c666','@craft/web/assets/updater/dist'),('c88bcaa','@lib/fileupload'),('c920ccfc','@app/web/assets/plugins/dist'),('c960dd7c','@craft/web/assets/feed/dist'),('c9714cf6','@lib/jquery-touch-events'),('ca7a9732','@lib/jquery-ui'),('cb6cf2d3','@app/web/assets/pluginstore/dist'),('cbf7467f','@lib/prismjs'),('cd0ad384','@lib'),('cd199875','@app/web/assets/recententries/dist'),('ceaed687','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\aelvan\\craft-cp-element-count\\src\\resources'),('ced57034','@lib/picturefill'),('cf3a2c31','@lib/velocity'),('cfe37ce8','@app/web/assets/updater/dist'),('d054bff8','@app/web/assets/cp/dist'),('d05f1221','@craft/web/assets/dashboard/dist'),('d073375c','@lib/garnishjs'),('d1248216','@app/web/assets/craftsupport/dist'),('d2c2ce72','@craft/web/assets/updater/dist'),('d31d83d9','@lib/jquery.payment'),('d360ef44','@barrelstrength/sproutforms/web/assets/entries/dist'),('d46aaa86','@app/web/assets/login/dist'),('d5032a38','@lib/element-resize-detector'),('d5e68c76','@lib/d3'),('d63d71ca','@lib/fileupload'),('d6a33a48','@ether/seo/web/assets'),('d6f82270','@lib/timepicker'),('d747d904','@craft/web/assets/tablesettings/dist'),('d7b6a50b','@craft/web/assets/matrix/dist'),('d7f5b474','@app/web/assets/plugins/dist'),('d7f66ecd','@craft/web/assets/craftsupport/dist'),('d845533a','@app/web/assets/utilities/dist'),('d9ba77d6','@app/web/assets/updates/dist'),('dab0b989','@lib/element-resize-detector'),('db01882d','@craft/web/assets/recententries/dist'),('db43ac27','@lib/picturefill'),('dce790e5','@lib/jquery-touch-events'),('dd358c38','@runtime/assets/thumbs/9'),('deb5db4c','@bower/jquery/dist'),('df6d7172','@craft/web/assets/utilities/dist'),('dfb62ed7','@app/web/assets/updateswidget/dist'),('e0002845','@lib/xregexp'),('e0839cc6','@verbb/feedme/web/assets/feedme/dist'),('e10c6cb9','@app/web/assets/recententries/dist'),('e36b3e8f','@lib/selectize'),('e3ce20da','@lib/d3'),('e3f68824','@app/web/assets/updater/dist'),('e400387d','@craft/web/assets/matrixsettings/dist'),('e4afe501','@lib/velocity'),('e4be6701','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\utilities\\dist'),('e5441bc6','@craft/web/assets/cp/dist'),('e5bbca43','@craft/web/assets/updateswidget/dist'),('e5c8308c','@craft/web/assets/utilities/dist'),('e5f250f0','@lib/jquery-ui'),('e65b9bf0','@lib/garnishjs'),('e68b93dd','@lib/fabric'),('e69f1ab4','@lib'),('e7030094','@app/web/assets/feed/dist'),('e707b60a','@app/web/assets/generalsettings/dist'),('e7a7e6c6','@craft/web/assets/userpermissions/dist'),('e8e35389','@craft/web/assets/feed/dist'),('e9077a05','@lib/xregexp'),('e98e4d77','@craft/web/assets/updates/dist'),('ea6c6ccf','@lib/selectize'),('eacf3c49','@lib/jquery-touch-events'),('eae8c6d','@lib/element-resize-detector'),('eb1c76b0','@lib/velocity'),('ebf919c7','@lib/jquery-ui'),('ed6b008b','@lib/picturefill'),('ede298fa','@craft/web/assets/tablesettings/dist'),('f06f140b','@app/web/assets/dashboard/dist'),('f0e32a07','@sproutbaselib/quill'),('f12570b9','@lib/element-resize-detector'),('f1fbdc9','@craft/web/assets/recententries/dist'),('f296310e','@craft/web/assets/cp/dist'),('f31d4fce','@lib/fabric'),('f3867211','@lib/xregexp'),('f3a3da1b','@app/web/assets/updateswidget/dist'),('f3a782b6','@app/web/assets/edittransform/dist'),('f3cd47e3','@lib/garnishjs'),('f4b91447','@lib/selectize'),('f520127c','@bower/jquery/dist'),('f547a876','@craft/web/assets/plugins/dist'),('f5830175','@lib/fileupload'),('f675e038','@craft/web/assets/craftsupport/dist'),('f73bd958','@lib/jquery.payment'),('f87f5e4a','@app/web/assets/login/dist'),('f8884ae9','@lib/jquery.payment'),('f9ea369b','@lib/selectize'),('fa12a63a','C:\\Users\\zacha\\Sites\\siren-craft3\\vendor\\craftcms\\cms\\src\\web\\assets\\feed\\dist'),('fa9381cd','@bower/jquery/dist'),('fb86c42b','@runtime/assets/thumbs/7'),('fbcadb11','@craft/web/assets/dashboard/dist'),('fc414b34','@app/web/assets/cp/dist'),('fc6309bb','@app/web/assets/utilities/dist'),('fd3176da','@app/web/assets/craftsupport/dist'),('fe7357f5','@craft/web/assets/login/dist'),('fed550cd','@lib/xregexp'),('ff3ac257','@craft/web/assets/updateswidget/dist'),('ff556b71','@craft/web/assets/fields/dist'),('ffc513d2','@craft/web/assets/cp/dist');
/*!40000 ALTER TABLE `craft_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' zachary suits sandals com '),(1,'slug',0,1,''),(2,'slug',0,1,' homepage '),(2,'title',0,1,' homepage '),(2,'field',14,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl '),(2,'field',55,1,' new homepage 5 1440x500 1 '),(2,'field',54,1,' new homepage 5 1440x500 1 '),(2,'field',53,1,' new homepage 5 1440x500 1 '),(2,'field',56,1,' light '),(2,'field',15,1,''),(2,'field',4,1,' homepage '),(2,'field',57,1,' siren framework '),(3,'field',5,1,' address line 1 address line 1 address line 2 address line 2 '),(3,'field',6,1,' zachary brady '),(3,'field',7,1,' zachary suits sandals com '),(3,'field',9,1,' 3155584577 '),(3,'field',10,1,' facebook https www facebook com zack brady facebook '),(3,'field',8,1,''),(3,'slug',0,1,''),(4,'field',59,1,' http craft3 test '),(4,'slug',0,1,' home '),(4,'title',0,1,' home '),(5,'field',57,1,' my page '),(5,'field',14,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl '),(5,'field',53,1,' new homepage 5 1440x500 1 '),(5,'field',54,1,' new homepage 5 1440x500 1 '),(5,'field',55,1,' new homepage 5 1440x500 1 '),(5,'field',56,1,' light '),(5,'field',15,1,' none lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl praesent sit amet mi eu tortor scelerisque fermentum quis eget dui fusce venenatis eleifend turpis sit amet consequat suspendisse efficitur nibh eu maximus vulputate turpis nisl faucibus magna vel accumsan turpis elit at elit maecenas ut semper erat integer elementum pellentesque placerat orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus nulla facilisis tempor augue non tincidunt phasellus arcu mi varius sed porta quis sagittis in arcu suspendisse ac euismod ipsum vitae tincidunt magna aliquam euismod dolor quis posuere blandit dolor sapien tristique tellus non ultrices eros eros id sapien aliquam in lacus non nibh viverra ultricies morbi varius libero nec nunc condimentum quis hendrerit mi ullamcorper suspendisse vitae odio tellus left light title none lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl praesent sit amet mi eu tortor scelerisque fermentum quis eget dui fusce venenatis eleifend turpis sit amet consequat suspendisse efficitur nibh eu maximus vulputate turpis nisl faucibus magna vel accumsan turpis elit at elit maecenas ut semper erat integer elementum pellentesque placerat orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus nulla facilisis tempor augue non tincidunt phasellus arcu mi varius sed porta quis sagittis in arcu suspendisse ac euismod ipsum vitae tincidunt magna aliquam euismod dolor quis posuere blandit dolor sapien tristique tellus non ultrices eros eros id sapien aliquam in lacus non nibh viverra ultricies morbi varius libero nec nunc condimentum quis hendrerit mi ullamcorper suspendisse vitae odio tellus new homepage 5 1440x500 1 right light icp none lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl http craft3 test one column light columns left http craft3 test lorem ipsum dolor sit amet consectetur adipiscing elit light cta none lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl left light form '),(6,'field',66,1,''),(21,'field',57,1,''),(5,'field',4,1,' test page '),(5,'slug',0,1,' test page '),(5,'title',0,1,' test page '),(6,'field',1,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl praesent sit amet mi eu tortor scelerisque fermentum quis eget dui fusce venenatis eleifend turpis sit amet consequat suspendisse efficitur nibh eu maximus vulputate turpis nisl faucibus magna vel accumsan turpis elit at elit maecenas ut semper erat integer elementum pellentesque placerat orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus nulla facilisis tempor augue non tincidunt phasellus arcu mi varius sed porta quis sagittis in arcu suspendisse ac euismod ipsum vitae tincidunt magna aliquam euismod dolor quis posuere blandit dolor sapien tristique tellus non ultrices eros eros id sapien aliquam in lacus non nibh viverra ultricies morbi varius libero nec nunc condimentum quis hendrerit mi ullamcorper suspendisse vitae odio tellus proin vulputate venenatis tortor quis lobortis proin nec tellus vestibulum ultrices velit vitae scelerisque neque duis accumsan neque varius tellus convallis sed cursus eros dictum sed vulputate mi et odio eleifend faucibus nulla sit amet aliquam quam integer cursus ipsum et lectus imperdiet sodales etiam luctus malesuada risus sit amet ultricies felis laoreet sed quisque consequat vel nibh at eleifend integer mollis a urna id malesuada vivamus blandit eget ipsum a sollicitudin fusce molestie lorem porta bibendum vehicula vivamus sapien sem malesuada id diam ac condimentum volutpat neque duis quis urna aliquam auctor ligula quis tincidunt urna integer convallis lectus non ex vehicula ultricies fusce et dictum enim phasellus vel ante sit amet metus porta molestie curabitur laoreet metus eu lacus dignissim dignissim sed sapien est consequat eget pharetra et consectetur vitae lacus duis sed blandit magna maecenas id elementum purus aliquam metus quam fringilla ut tempus eget lacinia vulputate massa donec faucibus elit suscipit eros porttitor id faucibus purus aliquet phasellus lectus dui accumsan ut ex ac imperdiet bibendum augue suspendisse leo nulla molestie a mauris id tempor euismod urna donec in nisi lacus praesent lobortis eu neque vitae molestie sed ut lobortis quam ut tempus odio curabitur sodales vehicula eros id blandit nisi pharetra in ut rhoncus dictum lorem quis dictum nunc mauris enim lacinia eget massa eu varius egestas sapien vivamus quis venenatis massa aliquam condimentum dolor at auctor bibendum elit orci cursus magna euismod tincidunt quam erat at risus mauris auctor ullamcorper nulla ac posuere neque varius ac aliquam sit amet rhoncus urna nec efficitur sem vestibulum imperdiet imperdiet sem eu pretium '),(6,'field',4,1,' privacy policy '),(6,'slug',0,1,' privacy policy '),(6,'title',0,1,' privacy policy '),(7,'filename',0,1,' facebook svg '),(7,'extension',0,1,' svg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' facebook '),(8,'field',11,1,' https www facebook com zack brady '),(8,'field',12,1,' facebook '),(8,'field',13,1,' facebook '),(8,'slug',0,1,''),(2,'field',60,1,' left '),(5,'field',60,1,' left '),(9,'filename',0,1,' new homepage 5 1440x500 1 jpg '),(9,'extension',0,1,' jpg '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' new homepage 5 1440x500 1 '),(10,'field',59,1,' http craft3 test test page '),(10,'slug',0,1,' page '),(10,'title',0,1,' page '),(11,'field',16,1,' title '),(11,'field',17,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl praesent sit amet mi eu tortor scelerisque fermentum quis eget dui fusce venenatis eleifend turpis sit amet consequat suspendisse efficitur nibh eu maximus vulputate turpis nisl faucibus magna vel accumsan turpis elit at elit maecenas ut semper erat integer elementum pellentesque placerat orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus nulla facilisis tempor augue non tincidunt phasellus arcu mi varius sed porta quis sagittis in arcu suspendisse ac euismod ipsum vitae tincidunt magna aliquam euismod dolor quis posuere blandit dolor sapien tristique tellus non ultrices eros eros id sapien aliquam in lacus non nibh viverra ultricies morbi varius libero nec nunc condimentum quis hendrerit mi ullamcorper suspendisse vitae odio tellus '),(11,'field',18,1,' http craft3 test privacy policy '),(11,'field',19,1,' learn more '),(11,'field',20,1,' left '),(11,'field',21,1,' light '),(11,'field',22,1,' none '),(11,'slug',0,1,''),(12,'name',0,1,' form 1 '),(12,'handle',0,1,' form1 '),(12,'slug',0,1,''),(13,'field',23,1,' icp '),(13,'field',24,1,' new homepage 5 1440x500 1 '),(13,'field',25,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl praesent sit amet mi eu tortor scelerisque fermentum quis eget dui fusce venenatis eleifend turpis sit amet consequat suspendisse efficitur nibh eu maximus vulputate turpis nisl faucibus magna vel accumsan turpis elit at elit maecenas ut semper erat integer elementum pellentesque placerat orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus nulla facilisis tempor augue non tincidunt phasellus arcu mi varius sed porta quis sagittis in arcu suspendisse ac euismod ipsum vitae tincidunt magna aliquam euismod dolor quis posuere blandit dolor sapien tristique tellus non ultrices eros eros id sapien aliquam in lacus non nibh viverra ultricies morbi varius libero nec nunc condimentum quis hendrerit mi ullamcorper suspendisse vitae odio tellus '),(13,'field',26,1,' http craft3 test privacy policy '),(13,'field',27,1,' learn more '),(13,'field',28,1,' right '),(13,'field',29,1,' light '),(13,'field',30,1,' none '),(13,'slug',0,1,''),(14,'field',31,1,' columns '),(14,'field',32,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl http craft3 test one column '),(14,'field',38,1,''),(14,'field',39,1,' light '),(14,'field',40,1,' none '),(15,'field',33,1,' one column '),(15,'field',34,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl '),(15,'field',35,1,''),(15,'field',36,1,' http craft3 test '),(15,'field',37,1,' learn more '),(15,'slug',0,1,''),(14,'slug',0,1,''),(16,'field',41,1,' cta '),(16,'field',42,1,' lorem ipsum dolor sit amet consectetur adipiscing elit '),(16,'field',43,1,' http craft3 test '),(16,'field',44,1,' learn more '),(16,'field',45,1,''),(16,'field',46,1,' left '),(16,'field',61,1,' light '),(16,'slug',0,1,''),(17,'field',47,1,' form '),(17,'field',48,1,''),(17,'field',49,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl '),(17,'field',50,1,' left '),(17,'field',51,1,' light '),(17,'field',52,1,' none '),(17,'slug',0,1,''),(18,'slug',0,1,' category test '),(18,'title',0,1,' category test '),(19,'field',3,1,''),(19,'field',58,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl '),(19,'field',1,1,' lorem ipsum dolor sit amet consectetur adipiscing elit nunc ex arcu dignissim consequat enim sed laoreet suscipit sapien nulla nec nunc scelerisque semper nisl eu laoreet nisl praesent sit amet mi eu tortor scelerisque fermentum quis eget dui fusce venenatis eleifend turpis sit amet consequat suspendisse efficitur nibh eu maximus vulputate turpis nisl faucibus magna vel accumsan turpis elit at elit maecenas ut semper erat integer elementum pellentesque placerat orci varius natoque penatibus et magnis dis parturient montes nascetur ridiculus mus nulla facilisis tempor augue non tincidunt phasellus arcu mi varius sed porta quis sagittis in arcu suspendisse ac euismod ipsum vitae tincidunt magna aliquam euismod dolor quis posuere blandit dolor sapien tristique tellus non ultrices eros eros id sapien aliquam in lacus non nibh viverra ultricies morbi varius libero nec nunc condimentum quis hendrerit mi ullamcorper suspendisse vitae odio tellus proin vulputate venenatis tortor quis lobortis proin nec tellus vestibulum ultrices velit vitae scelerisque neque duis accumsan neque varius tellus convallis sed cursus eros dictum sed vulputate mi et odio eleifend faucibus nulla sit amet aliquam quam integer cursus ipsum et lectus imperdiet sodales etiam luctus malesuada risus sit amet ultricies felis laoreet sed quisque consequat vel nibh at eleifend integer mollis a urna id malesuada vivamus blandit eget ipsum a sollicitudin fusce molestie lorem porta bibendum vehicula vivamus sapien sem malesuada id diam ac condimentum volutpat neque duis quis urna aliquam auctor ligula quis tincidunt urna integer convallis lectus non ex vehicula ultricies fusce et dictum enim phasellus vel ante sit amet metus porta molestie curabitur laoreet metus eu lacus dignissim dignissim sed sapien est consequat eget pharetra et consectetur vitae lacus duis sed blandit magna maecenas id elementum purus aliquam metus quam fringilla ut tempus eget lacinia vulputate massa donec faucibus elit suscipit eros porttitor id faucibus purus aliquet phasellus lectus dui accumsan ut ex ac imperdiet bibendum augue suspendisse leo nulla molestie a mauris id tempor euismod urna donec in nisi lacus praesent lobortis eu neque vitae molestie sed ut lobortis quam ut tempus odio curabitur sodales vehicula eros id blandit nisi pharetra in ut rhoncus dictum lorem quis dictum nunc mauris enim lacinia eget massa eu varius egestas sapien vivamus quis venenatis massa aliquam condimentum dolor at auctor bibendum elit orci cursus magna euismod tincidunt quam erat at risus mauris auctor ullamcorper nulla ac posuere neque varius ac aliquam sit amet rhoncus urna nec efficitur sem vestibulum imperdiet imperdiet sem eu pretium '),(19,'field',2,1,' category test '),(19,'field',4,1,' test entry '),(19,'slug',0,1,' test entry '),(19,'title',0,1,' test entry '),(20,'field',59,1,' http craft3 test editorial '),(20,'slug',0,1,' editorial '),(20,'title',0,1,' editorial '),(21,'slug',0,1,' editorial archive '),(21,'title',0,1,' editorial archive '),(21,'field',56,1,''),(21,'field',14,1,''),(19,'field',14,1,''),(19,'field',57,1,''),(19,'field',15,1,''),(5,'field',3,1,''),(21,'field',3,1,''),(21,'field',4,1,' editorial archive '),(2,'field',3,1,''),(2,'field',67,1,''),(2,'field',1,1,'');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sections_structureId_idx` (`structureId`),
  KEY `craft_sections_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_sections_name_idx` (`name`),
  KEY `craft_sections_handle_idx` (`handle`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
INSERT INTO `craft_sections` VALUES (1,NULL,'Homepage','homepage','single',1,1,'2018-05-14 14:59:28','2019-05-16 20:36:27',NULL,'f1b51cc7-0e15-4a9f-a885-83836e63b9af'),(2,2,'Pages','pages','structure',1,1,'2018-05-14 15:04:42','2019-05-16 20:55:23',NULL,'162013e0-f191-4fca-a9bf-5d8a49c574e7'),(3,3,'Legal','legal','structure',1,1,'2018-05-14 15:06:57','2019-05-16 20:21:53',NULL,'cd800274-c8bb-466b-ad46-9c01b222c6f6'),(4,NULL,'Editorial','editorial','channel',1,1,'2018-05-14 15:17:05','2019-05-16 20:50:10',NULL,'d51d9643-6d8e-4c3b-9fcd-a685f036f407'),(5,4,'Navigation','navigation','structure',1,1,'2018-05-14 15:23:14','2019-05-16 20:23:45',NULL,'5046c0f8-6fc8-47cf-93e0-9acc35eb7dae'),(6,NULL,'Editorial Archive','editorialArchive','single',1,1,'2019-03-08 18:52:04','2019-05-16 20:36:18',NULL,'032c6943-bc7b-4882-95df-47bcd014f98a');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_sites`
--

DROP TABLE IF EXISTS `craft_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `craft_sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `craft_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_sites`
--

LOCK TABLES `craft_sections_sites` WRITE;
/*!40000 ALTER TABLE `craft_sections_sites` DISABLE KEYS */;
INSERT INTO `craft_sections_sites` VALUES (1,1,1,1,'__home__','index.html',1,'2018-05-14 14:59:28','2019-05-16 20:36:27','1e0383aa-87f6-4edf-ae84-8af7a763ef10'),(2,2,1,1,'{slug}','_pages/index.html',1,'2018-05-14 15:04:42','2019-05-16 20:55:23','bfa3d824-c719-4241-8fbc-3ecb373692cc'),(3,3,1,1,'{slug}','_legal.html',1,'2018-05-14 15:06:57','2019-05-16 20:21:53','b02e1d6e-5c95-45e0-a11f-f62b7426eb9a'),(4,4,1,1,'editorial/{slug}','editorial/_entry.html',1,'2018-05-14 15:17:05','2019-05-16 20:50:10','9699ac88-dcc6-4456-a97a-aab9c241357c'),(5,5,1,0,NULL,NULL,1,'2018-05-14 15:23:14','2019-05-16 20:23:45','8f0ee632-4c5f-4090-a8ee-98d4dcee5b45'),(6,6,1,1,'editorial','editorial/index.html',1,'2019-03-08 18:52:04','2019-05-16 20:36:18','c8bf445a-b074-45be-b57b-fdf4e348b935');
/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_seo_redirects`
--

DROP TABLE IF EXISTS `craft_seo_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_seo_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `type` enum('301','302') NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `siteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_seo_redirects`
--

LOCK TABLES `craft_seo_redirects` WRITE;
/*!40000 ALTER TABLE `craft_seo_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_seo_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_seo_sitemap`
--

DROP TABLE IF EXISTS `craft_seo_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_seo_sitemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` enum('sections','categories','customUrls') NOT NULL,
  `url` varchar(255) NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_seo_sitemap`
--

LOCK TABLES `craft_seo_sitemap` WRITE;
/*!40000 ALTER TABLE `craft_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_seo_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sequences`
--

DROP TABLE IF EXISTS `craft_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sequences`
--

LOCK TABLES `craft_sequences` WRITE;
/*!40000 ALTER TABLE `craft_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_idx` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (116,1,'N3CviJKz7auPb2EA-xTZ_VmYoXsqMzzaT4FccDQSZLVA4fGSQ4J0w85Qfxq4V6g9zlSiMAY0Si3UrsR3BpYMkh8CnbOS_V4SqOSJ','2019-04-17 16:01:09','2019-04-17 16:01:13','cd2e629f-cef0-47ca-9a3f-6436b22c3829'),(117,1,'2mbwnB2a95ZUV8LWhi5rDmTeI2zEJa6YX88K-PDPXyTSXlHYr2gaO7oeUQ1wSfoKbPhYX8LjrLmdIy5wlLnbqz06qF0KmDalnFj2','2019-04-17 16:01:23','2019-04-18 15:14:29','e45c5df8-cb07-4620-9c26-15f6a705ec4d'),(118,1,'AyHS8Wne2E9KmJOgBJXa6FJpzps_HCm5iY3V2_Ja5VOsmb7rtvmI5zHdqINssEY3co2Pko0G2Gx8zXKznXMzWFQqc2u5OwgPkN6p','2019-04-18 15:14:41','2019-04-18 15:23:14','0f93236f-b040-47ec-99d1-a94cf69ba472'),(119,1,'N_kmyBpWy8rbw-w6jyvr9nFEkNKURoFGGIfUs7NjP17BWv0IZKO1DkK_QADolkNn4XeEKr03-nMgubwWBBIqkiUunuRgjYwed5tF','2019-05-02 16:09:19','2019-05-02 16:10:12','18a479c7-50e1-47ef-9b38-3436de205752'),(120,1,'mnx89MgMHaW0RDtMsJbXiWPSBRo8k08CGHylkP5rYChfU0XQRXEwBS2MziAn7_RoI0_4f43Y8Xo9EFIT8Y-DuR4i-cfzZ769-Cm-','2019-05-14 19:29:26','2019-05-14 19:37:41','70a64385-0d7c-4d85-8589-b1dfd2b4b8f5'),(121,1,'G4xBgSAjUdjpO0kRmSl58RfCITVPheeLJq08EiXs4j_Mg1VnErSNQhdHSZto0OHmmq5OQoq5tSa1RUow273YC-_-cpBaJTGIvhGG','2019-05-16 19:38:34','2019-05-16 21:01:19','40d13b7c-5713-488a-bff0-86e343c20ce6');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sitegroups`
--

DROP TABLE IF EXISTS `craft_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sitegroups_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sitegroups`
--

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;
INSERT INTO `craft_sitegroups` VALUES (1,'Craft3','2018-05-11 17:24:17','2018-05-11 17:24:17',NULL,'ef50568e-a83f-4fcf-9f52-d997980e32e2');
/*!40000 ALTER TABLE `craft_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sites`
--

DROP TABLE IF EXISTS `craft_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sites_sortOrder_idx` (`sortOrder`),
  KEY `craft_sites_groupId_fk` (`groupId`),
  KEY `craft_sites_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_sites_handle_idx` (`handle`),
  CONSTRAINT `craft_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sites`
--

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;
INSERT INTO `craft_sites` VALUES (1,1,1,'Craft3','default','en-US',1,'@web/',1,'2018-05-11 17:24:17','2018-05-11 17:24:17',NULL,'de65cf13-2b4b-4584-8cfa-7e10f9c19b12');
/*!40000 ALTER TABLE `craft_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_snitch_collisions`
--

DROP TABLE IF EXISTS `craft_snitch_collisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_snitch_collisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snitchId` int(11) NOT NULL,
  `snitchType` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `whenEntered` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_snitch_collisions_userId_fk` (`userId`),
  CONSTRAINT `craft_snitch_collisions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_snitch_collisions`
--

LOCK TABLES `craft_snitch_collisions` WRITE;
/*!40000 ALTER TABLE `craft_snitch_collisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_snitch_collisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutemail_notificationemails`
--

DROP TABLE IF EXISTS `craft_sproutemail_notificationemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutemail_notificationemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginHandle` varchar(255) DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `emailTemplateId` varchar(255) DEFAULT NULL,
  `eventId` varchar(255) DEFAULT NULL,
  `settings` text,
  `subjectLine` varchar(255) NOT NULL,
  `defaultBody` text,
  `recipients` varchar(255) DEFAULT NULL,
  `listSettings` text,
  `fromName` varchar(255) DEFAULT NULL,
  `fromEmail` varchar(255) DEFAULT NULL,
  `replyToEmail` varchar(255) DEFAULT NULL,
  `enableFileAttachments` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `craft_sproutemail_notificationemails_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutemail_notificationemails`
--

LOCK TABLES `craft_sproutemail_notificationemails` WRITE;
/*!40000 ALTER TABLE `craft_sproutemail_notificationemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sproutemail_notificationemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutforms_entries`
--

DROP TABLE IF EXISTS `craft_sproutforms_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutforms_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `userAgent` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sproutforms_entries_formId_fk` (`formId`),
  CONSTRAINT `craft_sproutforms_entries_formId_fk` FOREIGN KEY (`formId`) REFERENCES `craft_sproutforms_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_sproutforms_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutforms_entries`
--

LOCK TABLES `craft_sproutforms_entries` WRITE;
/*!40000 ALTER TABLE `craft_sproutforms_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sproutforms_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutforms_entrystatuses`
--

DROP TABLE IF EXISTS `craft_sproutforms_entrystatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutforms_entrystatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'blue',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutforms_entrystatuses`
--

LOCK TABLES `craft_sproutforms_entrystatuses` WRITE;
/*!40000 ALTER TABLE `craft_sproutforms_entrystatuses` DISABLE KEYS */;
INSERT INTO `craft_sproutforms_entrystatuses` VALUES (1,'Unread','unread','blue',1,1,'2018-05-11 17:40:04','2018-05-11 17:40:04','328f26a4-86fa-4d07-a56f-9c87dc3f91b4'),(2,'Read','read','grey',2,0,'2018-05-11 17:40:04','2018-05-11 17:40:04','777dee83-09d9-4592-b0d6-4563fb98314e');
/*!40000 ALTER TABLE `craft_sproutforms_entrystatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutforms_formgroups`
--

DROP TABLE IF EXISTS `craft_sproutforms_formgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutforms_formgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutforms_formgroups`
--

LOCK TABLES `craft_sproutforms_formgroups` WRITE;
/*!40000 ALTER TABLE `craft_sproutforms_formgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sproutforms_formgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutforms_forms`
--

DROP TABLE IF EXISTS `craft_sproutforms_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutforms_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `titleFormat` varchar(255) NOT NULL,
  `displaySectionTitles` tinyint(1) DEFAULT '0',
  `redirectUri` varchar(255) DEFAULT NULL,
  `submitAction` varchar(255) DEFAULT NULL,
  `submitButtonText` varchar(255) DEFAULT NULL,
  `saveData` tinyint(1) DEFAULT '0',
  `templateOverridesFolder` varchar(255) DEFAULT NULL,
  `enableFileAttachments` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sproutforms_forms_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_sproutforms_forms_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_sproutforms_forms_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutforms_forms`
--

LOCK TABLES `craft_sproutforms_forms` WRITE;
/*!40000 ALTER TABLE `craft_sproutforms_forms` DISABLE KEYS */;
INSERT INTO `craft_sproutforms_forms` VALUES (12,17,NULL,'Form 1','form1','{dateCreated|date(\'D, d M Y H:i:s\')}',NULL,'',NULL,'',0,NULL,NULL,'2018-05-14 20:12:13','2018-05-14 20:13:00','de35342d-f7a5-47d0-8990-b7e09e61be60');
/*!40000 ALTER TABLE `craft_sproutforms_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutformscontent_form1`
--

DROP TABLE IF EXISTS `craft_sproutformscontent_form1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutformscontent_form1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_name1` varchar(255) DEFAULT NULL,
  `field_checkboxes1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sproutformscontent_form1_elementId_siteId_idx` (`elementId`,`siteId`),
  KEY `craft_sproutformscontent_form1_siteId_fk` (`siteId`),
  CONSTRAINT `craft_sproutformscontent_form1_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_sproutformscontent_form1_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutformscontent_form1`
--

LOCK TABLES `craft_sproutformscontent_form1` WRITE;
/*!40000 ALTER TABLE `craft_sproutformscontent_form1` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sproutformscontent_form1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutreports_datasources`
--

DROP TABLE IF EXISTS `craft_sproutreports_datasources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutreports_datasources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `allowNew` tinyint(1) DEFAULT NULL,
  `pluginHandle` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutreports_datasources`
--

LOCK TABLES `craft_sproutreports_datasources` WRITE;
/*!40000 ALTER TABLE `craft_sproutreports_datasources` DISABLE KEYS */;
INSERT INTO `craft_sproutreports_datasources` VALUES (1,'barrelstrength\\sproutforms\\integrations\\sproutreports\\datasources\\EntriesDataSource',1,'sprout-forms','2018-05-11 17:40:04','2018-05-11 17:40:04','8d69234e-3dbd-4b7e-92f1-f62478f98682');
/*!40000 ALTER TABLE `craft_sproutreports_datasources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutreports_reportgroups`
--

DROP TABLE IF EXISTS `craft_sproutreports_reportgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutreports_reportgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sproutreports_reportgroups_name_fk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutreports_reportgroups`
--

LOCK TABLES `craft_sproutreports_reportgroups` WRITE;
/*!40000 ALTER TABLE `craft_sproutreports_reportgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sproutreports_reportgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sproutreports_reports`
--

DROP TABLE IF EXISTS `craft_sproutreports_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sproutreports_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataSourceId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `hasNameFormat` tinyint(1) DEFAULT NULL,
  `nameFormat` varchar(255) DEFAULT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `allowHtml` tinyint(1) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sproutreports_reports_handle_unq_fk` (`handle`),
  UNIQUE KEY `craft_sproutreports_reports_name_unq_fk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sproutreports_reports`
--

LOCK TABLES `craft_sproutreports_reports` WRITE;
/*!40000 ALTER TABLE `craft_sproutreports_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sproutreports_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_stc_3_columns`
--

DROP TABLE IF EXISTS `craft_stc_3_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_stc_3_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_columnTitle` text,
  `field_columnContent` text,
  `field_columnLink` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_stc_3_columns_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_stc_3_columns_siteId_fk` (`siteId`),
  CONSTRAINT `craft_stc_3_columns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_stc_3_columns_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_stc_3_columns`
--

LOCK TABLES `craft_stc_3_columns` WRITE;
/*!40000 ALTER TABLE `craft_stc_3_columns` DISABLE KEYS */;
INSERT INTO `craft_stc_3_columns` VALUES (1,15,1,'2018-05-14 20:20:49','2019-05-16 20:14:54','739728f6-81d5-4c90-89fc-908343d07324','One Column','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ex arcu, dignissim consequat enim sed, laoreet suscipit sapien. Nulla nec nunc scelerisque, semper nisl eu, laoreet nisl.','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"2\"}');
/*!40000 ALTER TABLE `craft_stc_3_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_stc_socialmedia`
--

DROP TABLE IF EXISTS `craft_stc_socialmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_stc_socialmedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_networkLink` varchar(255) DEFAULT NULL,
  `field_networkName` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_stc_socialmedia_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `craft_stc_socialmedia_siteId_fk` (`siteId`),
  CONSTRAINT `craft_stc_socialmedia_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_stc_socialmedia_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_stc_socialmedia`
--

LOCK TABLES `craft_stc_socialmedia` WRITE;
/*!40000 ALTER TABLE `craft_stc_socialmedia` DISABLE KEYS */;
INSERT INTO `craft_stc_socialmedia` VALUES (1,8,1,'2018-05-14 18:48:27','2018-05-14 18:48:27','00758950-d8ff-4dff-a858-87c7ce594fe7','https://www.facebook.com/zack.brady','Facebook');
/*!40000 ALTER TABLE `craft_stc_socialmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
INSERT INTO `craft_structureelements` VALUES (1,4,NULL,1,1,8,0,'2018-05-14 18:29:48','2018-05-14 20:52:14','b1db68ed-4924-4010-9f48-2feb514321f2'),(2,4,4,1,2,3,1,'2018-05-14 18:29:48','2018-05-14 18:29:48','569960ee-d7bb-4085-b9d3-013d30eb3ae8'),(3,2,NULL,3,1,4,0,'2018-05-14 18:36:12','2018-05-14 18:36:12','6e92c2f5-7d0b-48be-9e11-89a7057aeb42'),(4,2,5,3,2,3,1,'2018-05-14 18:36:12','2018-05-14 18:36:12','04e3839b-16cb-4cbd-824d-101aea2d60d6'),(5,3,NULL,5,1,4,0,'2018-05-14 18:36:43','2018-05-14 18:36:43','6b92314f-0391-4a58-8dde-44d1d8846837'),(6,3,6,5,2,3,1,'2018-05-14 18:36:43','2018-05-14 18:36:43','ffd847de-8533-46c6-a8e1-d4c2500fa8f8'),(7,4,10,1,4,5,1,'2018-05-14 19:30:32','2018-05-14 19:30:32','f4520059-f00e-4fd9-b469-4d45a615f483'),(8,1,NULL,8,1,4,0,'2018-05-14 20:50:49','2018-05-14 20:50:49','d33ff871-96cf-41bf-8238-7709e4d90821'),(9,1,18,8,2,3,1,'2018-05-14 20:50:49','2018-05-14 20:50:49','8f7807ac-91a0-4c49-943a-6ef0e7b0c17e'),(10,4,20,1,6,7,1,'2018-05-14 20:52:14','2018-05-14 20:52:14','4c49db26-9b0e-4462-83f3-38ff1a708c7b');
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
INSERT INTO `craft_structures` VALUES (1,NULL,'2018-05-11 21:18:44','2018-05-11 21:18:44',NULL,'23a71fe2-e6ca-4e1a-88d1-b2d8041f7950'),(2,NULL,'2018-05-14 15:04:42','2019-05-16 20:55:23',NULL,'24e3e58e-98de-4eb5-a1e9-9dfd7df4e7b1'),(3,1,'2018-05-14 15:06:57','2019-05-16 20:21:53',NULL,'dc7d29b9-3dc6-4e25-9991-cfe81e1c8cd2'),(4,2,'2018-05-14 15:23:14','2019-05-16 20:23:45',NULL,'650f6d1a-f1f0-4cf3-a445-bde722f52a83');
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_supertableblocks`
--

DROP TABLE IF EXISTS `craft_supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocks_ownerId_idx` (`ownerId`),
  KEY `craft_supertableblocks_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocks_typeId_idx` (`typeId`),
  KEY `craft_supertableblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `craft_supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_supertableblocks`
--

LOCK TABLES `craft_supertableblocks` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocks` DISABLE KEYS */;
INSERT INTO `craft_supertableblocks` VALUES (8,3,NULL,10,1,1,NULL,'2018-05-14 18:48:27','2018-05-14 18:48:27','da5d3238-3d94-4013-b262-abc081bfe92d'),(15,14,NULL,32,2,1,NULL,'2018-05-14 20:20:49','2019-05-16 20:14:54','00017354-2d71-4399-8948-c4c6dbb83d60');
/*!40000 ALTER TABLE `craft_supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_supertableblocktypes`
--

DROP TABLE IF EXISTS `craft_supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocktypes_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `craft_supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_supertableblocktypes`
--

LOCK TABLES `craft_supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocktypes` DISABLE KEYS */;
INSERT INTO `craft_supertableblocktypes` VALUES (1,10,2,'2018-05-11 21:33:57','2019-05-16 19:56:03','03e085a2-6e6c-4f47-a4dd-64adf65badb0'),(2,32,5,'2018-05-11 21:55:51','2019-05-14 19:35:07','5f1a587e-e57f-4299-9424-8cce435477b8');
/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemmessages`
--

DROP TABLE IF EXISTS `craft_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `craft_systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemmessages`
--

LOCK TABLES `craft_systemmessages` WRITE;
/*!40000 ALTER TABLE `craft_systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  KEY `craft_taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_taggroups_name_idx` (`name`),
  KEY `craft_taggroups_handle_idx` (`handle`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_idx` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachequeries`
--

DROP TABLE IF EXISTS `craft_templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `craft_templatecachequeries_type_idx` (`type`),
  CONSTRAINT `craft_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachequeries`
--

LOCK TABLES `craft_templatecachequeries` WRITE;
/*!40000 ALTER TABLE `craft_templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `craft_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `craft_templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `craft_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
INSERT INTO `craft_tokens` VALUES (1,'abClOTb-fDix9dCK3hWe5dV3TWbIlzau','[\"live-preview/preview\",{\"previewAction\":\"categories/preview-category\",\"userId\":\"1\"}]',NULL,NULL,'2019-03-09 19:17:22','2019-03-08 19:17:22','2019-03-08 19:17:22','6af6bcbe-7984-481a-860c-9fb3e98e5e78');
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpreferences`
--

DROP TABLE IF EXISTS `craft_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpreferences`
--

LOCK TABLES `craft_userpreferences` WRITE;
/*!40000 ALTER TABLE `craft_userpreferences` DISABLE KEYS */;
INSERT INTO `craft_userpreferences` VALUES (1,'{\"language\":\"en-US\",\"weekStartDay\":\"0\",\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false}');
/*!40000 ALTER TABLE `craft_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_photoId_fk` (`photoId`),
  KEY `craft_users_email_idx` (`email`),
  KEY `craft_users_username_idx` (`username`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'admin',NULL,'','','zachary@suits-sandals.com','$2y$13$uevLAPXeYDVWum96QUV3jOtxTsZwkaH8h0NW0jlnwYzYofZf5eaBu',1,0,0,0,'2019-05-16 19:38:34','::1',NULL,NULL,'2019-05-16 19:37:42',NULL,1,NULL,NULL,NULL,0,'2019-04-17 16:01:09','2018-05-11 17:24:19','2019-05-16 19:38:34','d17044e2-3200-4f80-b248-9f0b819c3a01');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumefolders`
--

DROP TABLE IF EXISTS `craft_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `craft_volumefolders_parentId_idx` (`parentId`),
  KEY `craft_volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `craft_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumefolders`
--

LOCK TABLES `craft_volumefolders` WRITE;
/*!40000 ALTER TABLE `craft_volumefolders` DISABLE KEYS */;
INSERT INTO `craft_volumefolders` VALUES (1,NULL,NULL,'Temporary source',NULL,'2018-05-11 21:23:51','2018-05-11 21:23:51','e7362f8c-3e7b-4087-9e5e-127d1f618eb6'),(2,1,NULL,'user_1','user_1/','2018-05-11 21:23:51','2018-05-11 21:23:51','81b45f1f-0e8b-4fa2-b038-3b148c09b800'),(3,NULL,1,'Assets','','2018-05-14 15:32:29','2018-05-14 15:32:29','f1ce0547-9993-4969-900a-c6324146574f');
/*!40000 ALTER TABLE `craft_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumes`
--

DROP TABLE IF EXISTS `craft_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `craft_volumes_dateDeleted_idx` (`dateDeleted`),
  KEY `craft_volumes_name_idx` (`name`),
  KEY `craft_volumes_handle_idx` (`handle`),
  CONSTRAINT `craft_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumes`
--

LOCK TABLES `craft_volumes` WRITE;
/*!40000 ALTER TABLE `craft_volumes` DISABLE KEYS */;
INSERT INTO `craft_volumes` VALUES (1,15,'Assets','assets','craft\\volumes\\Local',1,'@web/assets','{\"path\":\"@webroot/assets\"}',1,'2018-05-14 15:32:29','2018-05-14 18:45:03',NULL,'60df2139-a9cd-489e-b496-d5d8fe78fb89');
/*!40000 ALTER TABLE `craft_volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_idx` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,0,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2018-05-11 17:24:20','2018-05-11 17:24:20','6cc1710d-22e8-4c6c-9394-9ff5abb121e9'),(2,1,'craft\\widgets\\CraftSupport',2,0,'[]',1,'2018-05-11 17:24:20','2018-05-11 17:24:20','b4aba9b7-5bc1-45f8-a6dd-140a4b404ce2'),(3,1,'craft\\widgets\\Updates',3,0,'[]',1,'2018-05-11 17:24:20','2018-05-11 17:24:20','f13c385a-0eaa-4d37-a1c9-a260a5b97d0d'),(4,1,'craft\\widgets\\Feed',4,0,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2018-05-11 17:24:20','2018-05-11 17:24:20','13cd5344-990c-4b1e-9c1d-f233f2eec2df');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16 17:06:03
