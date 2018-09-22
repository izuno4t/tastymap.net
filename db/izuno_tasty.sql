-- MySQL dump 10.11
--
-- Host: localhost    Database: izuno_tasty
-- ------------------------------------------------------
-- Server version	5.0.87-community

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(80) collate utf8_bin NOT NULL default '',
  `salted_password` varchar(40) collate utf8_bin NOT NULL default '',
  `email` varchar(60) collate utf8_bin NOT NULL default '',
  `firstname` varchar(40) collate utf8_bin default NULL,
  `lastname` varchar(40) collate utf8_bin default NULL,
  `salt` varchar(40) collate utf8_bin NOT NULL default '',
  `verified` int(11) default '0',
  `role` varchar(40) collate utf8_bin default NULL,
  `security_token` varchar(40) collate utf8_bin default NULL,
  `token_expiry` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `logged_in_at` datetime default NULL,
  `deleted` int(11) default '0',
  `delete_after` datetime default NULL,
  `logged_in_from` varchar(20) collate utf8_bin default NULL,
  `user_agent` varchar(255) collate utf8_bin default NULL,
  `screenname` varchar(40) collate utf8_bin default NULL,
  `buddyicon` varchar(255) collate utf8_bin default NULL,
  `description` text collate utf8_bin,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `login`, `salted_password`, `email`, `firstname`, `lastname`, `salt`, `verified`, `role`, `security_token`, `token_expiry`, `created_at`, `updated_at`, `logged_in_at`, `deleted`, `delete_after`, `logged_in_from`, `user_agent`, `screenname`, `buddyicon`, `description`) VALUES (1,'izuno','7e83817e2b1127a10a8f0016fe482f5f1d448290','izuno4t@gmail.com','','','f189d8ebc8ab9f5c6da6143d88c38db3bba3381f',1,NULL,'4f17bd3296100b358421fd84d8664e98138b08fc','2007-12-04 04:14:31','2007-12-03 04:14:31','2010-04-15 06:00:57','2010-04-15 06:00:57',0,NULL,'222.229.217.89','Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 GTB6 (.NET CLR 3.5.30729)','いづの','1.jpg',''),(2,'matsumura','ea5f110e484c0764282fd9b7cc242f85c85ae2a2','matsumura@nri-net.com','','','440c28c1f0193ebbd3549598f3bbb13375e939fb',1,NULL,'804cb244f41052d272d82e6622e796b427eb24f0','2007-06-15 21:00:03','2007-06-14 21:00:00','2009-05-19 00:09:55','2009-05-19 00:09:55',0,NULL,'202.48.99.236','Mozilla/5.0 (Windows; U; Windows NT 5.1; ja; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10','','2.jpg',''),(3,'lyo','1da78407776c96cd1f317f6cd7b6116ae7e7918c','izuno@noworks.net',NULL,NULL,'b81384a95d810863c3595cf92a85016548ea6542',1,NULL,'9cb826bf1971eceda230e17de03678ff8a6e470b','2007-06-15 21:04:10','2007-06-14 21:04:10','2007-06-14 21:04:10',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'noworks','da200bf01980f6a1b3b4c17d843634dceddc2cb8','izuno4t@noworks.net',NULL,NULL,'9c113c624e5445bcc7acc9fd6d9189a83c6f0900',1,NULL,'3941408586412a107586c3f70db7cb1309b574a1','2007-06-24 02:49:15','2007-06-23 02:49:15','2007-06-25 17:40:39','2007-06-25 17:40:39',0,NULL,'124.26.165.230','Mozilla/5.0 (Macintosh; U; Intel Mac OS X; ja-JP-mac; rv:1.8.1.4) Gecko/20070515 Firefox/2.0.0.4',NULL,NULL,NULL),(5,'timtsai','4de2849e5fc894ee8fbb3e1a6f256b81dc6487cf','timtsai@atimi.ca',NULL,NULL,'625cd64436f103f86801148a6389349214079759',1,NULL,'5d1fa4061068f5cb43eb76fdf769f017c4908daf','2008-06-12 19:52:08','2008-06-11 19:52:08','2008-06-13 04:54:18','2008-06-13 04:54:18',0,NULL,'24.87.58.92','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14',NULL,NULL,NULL),(6,'atimi','39c9c4879302529e3aadc4ac460316190abcd79b','sayhi_timtsai@hotmail.com',NULL,NULL,'9a9cc4f88449e1f1f3d81d2426d1cf45df756786',1,NULL,'bae0cf777063363982bfc0f09e490a2b90a84ad5','2008-07-05 12:11:08','2008-07-04 12:11:08','2008-07-04 12:11:16','2008-07-04 12:11:16',0,NULL,'24.87.50.187','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.15) Gecko/20080623 Firefox/2.0.0.15',NULL,NULL,NULL),(7,'lyolyo','182560facb5a7a359c0f7de73882981e18eab902','lyo.takaoka@gmail.com',NULL,NULL,'9d0ed3c7023e2799b2114ae4344d65919a80644a',1,NULL,'6a1d4ae0d2b60d5488c1fd1d3b0d3a13e773f7c2','2008-08-21 09:08:40','2008-08-20 09:08:40','2008-08-20 09:08:49','2008-08-20 09:08:49',0,NULL,'122.50.36.208','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_4; ja-jp) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.2 Safari/525.20.1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `store_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  KEY `index_favorites_on_store_id` (`store_id`),
  KEY `index_favorites_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` (`store_id`, `user_id`) VALUES (46,1),(45,1),(44,1),(42,1),(41,1),(43,1),(1,1),(47,1),(7,1),(8,1),(5,1),(2,1),(4,1),(3,1),(48,1),(50,1),(51,1),(52,1),(53,1),(42,4),(43,4),(51,4),(54,4),(55,4),(55,1),(54,1),(56,1),(57,1),(58,1),(49,1),(59,1),(60,1),(61,1),(62,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(73,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(76,5),(82,1),(81,1),(83,1);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL,
  `title` varchar(255) collate utf8_bin default NULL,
  `description` text collate utf8_bin,
  `filename` varchar(255) collate utf8_bin NOT NULL default '',
  `created_at` datetime default NULL,
  `created_by` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` (`id`, `store_id`, `title`, `description`, `filename`, `created_at`, `created_by`) VALUES (1,2,'imgcnv.jpeg','','8eb307ccd3f3eccf3169c92ed9ad726d.jpeg','2007-06-22 03:29:18',1),(3,4,'看板','','7f720a62e3311b8bfb6d558a51fd338c.jpg','2007-06-22 03:32:39',1),(4,4,'イカとイクラ','','485384161c0d7ca7e704512689bd5a54.jpg','2007-06-22 03:34:18',1),(5,4,'とよ','','d43b52ef488f4a7e9eb6771d6d46860d.jpg','2007-06-22 03:34:56',1),(6,1,'タコライス','今は亡き','bba5d1b22d503c9c4dc500593bd6983d.jpg','2007-06-22 03:44:39',1),(7,3,'sora-1.jpg','','cd7cc4f87481a15fca06d0ba2703892f.jpg','2007-06-22 03:46:49',1),(8,3,'sora-2.jpg','','8efff7bf052bbdf7c4ff775cf7e04da0.jpg','2007-06-22 03:47:07',1),(9,5,'イカ','','d5de16f7c676300b89ee1624509fae96.jpg','2007-06-22 04:04:36',1),(11,7,'内装','昔(室町の時)の内装みたい','f539c31bbb5cfd9208046828941908eb.jpg','2007-06-22 20:49:12',1),(12,8,'uchida01.jpg','','3d1f339575048e48bd9d97867b6dcfc4.jpg','2007-06-22 20:50:54',1),(13,8,'uchida02.jpg','','fed24ea9a3bdc039df9abfbf34425252.jpg','2007-06-22 20:51:09',1),(14,41,'10008463906.jpg','','1a714b307d604279e4b90dcbb3fc91c4.jpg','2007-06-23 02:12:40',1),(15,42,'538920873_25f8a59ec4_o.jpg','','c98faceab9da8aca600261e8bdb98960.jpg','2007-06-23 02:35:30',1),(16,45,'G0000773_1.jpg','','40c85efc660676346147c49da419a83c.jpg','2007-06-23 02:36:53',1),(17,46,'1330.jpg','','fe51510c80bfd6e5d78a164cd5b1f688.jpg','2007-06-23 02:41:26',1),(18,35,'看板','','b8d81a73d5e858ec6492a6b887f86929.JPG','2007-06-24 22:24:44',1),(19,47,'おにぎり','','4efd1e930b579304b6aa99d384378789.jpg','2007-06-24 22:52:38',1),(20,46,'天ずっぽう','','06ca655e1cff36fe062f783aa99f7c34.jpg','2007-06-25 00:00:59',1),(21,54,'たぬき','','8eb307ccd3f3eccf3169c92ed9ad726d.jpeg','2007-06-25 17:55:23',4),(22,52,'玄関','','043a067ec6a64d9b259cbb2bf55bd065.jpg','2007-06-25 18:12:32',1),(23,53,'朝食','','7a7a50520849856c92e6cbcf46f74c23.jpg','2007-06-25 18:15:43',1),(24,48,'153427.jpg','','eee25e2bc159bec2476332e680bf8ea8.jpg','2007-07-05 11:41:21',1),(25,44,'あごすじ','','13ae5ae7d53aff22b0cfb2a6d3525e1f.jpg','2007-07-07 23:30:52',1),(26,1,'ミラーボール','','433d4001849dd694b6b8675a155a305d.jpg','2007-07-07 23:32:35',1),(27,60,'769318857_129e644925_b.jpg','','000f81dfe5bb3f283c7cc54aa26d67d3.jpg','2007-08-12 11:27:46',1),(28,60,'769358841_71b8e04854_b.jpg','','e4df670fb89ac3f830bcb67dd2b7111f.jpg','2007-08-12 11:28:05',1),(29,60,'770209930_deccf67a21_b.jpg','','01d19025a2beed024c1e491f293a3d80.jpg','2007-08-12 11:28:25',1),(30,60,'Terunura','','a6ede7974d858f6e6e3fc32d3092cdda.jpg','2007-08-12 11:28:47',1),(31,57,'p711.jpg','','7efd80ecfd956213c0b65473a967c5ad.jpg','2007-08-12 11:30:24',1),(33,65,'G0000707_0.jpg','','f3ad614fa5d92a69d03ae093c3d14bad.jpg','2007-08-12 11:54:39',1),(34,1,'チョコ','','224e3bc6e524095d7a13b4a897fbcbac.JPG','2007-08-28 02:09:22',1),(35,2,'lebistrotdeparisnamecard','','f7fa8c2b53193bb1f45bbe51cc57d159.gif','2007-09-16 23:49:35',1),(36,69,'280374051_586124e8a0_o.jpg','','64821e1977aaf0003eae4eed6ea882cb.jpg','2007-09-16 23:54:07',1),(38,69,'280373644_def3ca9ed2_o.jpg','','c98e1b019d16fb5629ef786e72a8d607.jpg','2007-09-16 23:57:41',1),(39,77,'RiveGache','','fd00ace8de8c0df328226f47de1eafa7.bmp','2007-11-19 04:09:03',2),(40,71,'CIMG0016.JPG','','c25fb74af7477a69a70591e5fded87f8.JPG','2007-11-29 21:54:56',1),(41,71,'CIMG0019.JPG','','9e7aa6e6ff2d3379a1d3a0dc0ebcc38b.JPG','2007-11-29 21:55:21',1),(44,82,'入り口','','9c156653d889d37811915236feed8660.jpg','2008-03-10 00:08:05',2);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_schema_info`
--

DROP TABLE IF EXISTS `plugin_schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_schema_info` (
  `plugin_name` varchar(255) collate utf8_bin default NULL,
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_schema_info`
--

LOCK TABLES `plugin_schema_info` WRITE;
/*!40000 ALTER TABLE `plugin_schema_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_info`
--

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` (`version`) VALUES (6);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_bin NOT NULL default '',
  `category` varchar(255) collate utf8_bin NOT NULL default '',
  `lat` varchar(255) collate utf8_bin NOT NULL default '',
  `lng` varchar(255) collate utf8_bin NOT NULL default '',
  `url` varchar(255) collate utf8_bin default NULL,
  `review` varchar(255) collate utf8_bin default NULL,
  `note` text collate utf8_bin,
  `address` varchar(255) collate utf8_bin default NULL,
  `tel` varchar(20) collate utf8_bin default NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `open` varchar(255) collate utf8_bin default NULL,
  `close` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`id`, `name`, `category`, `lat`, `lng`, `url`, `review`, `note`, `address`, `tel`, `created_at`, `updated_at`, `user_id`, `open`, `close`) VALUES (1,'アチャコ','居酒屋','34.689864','135.504746','','','','大阪市中央区高麗橋2-4-12','06-6202-7188','2007-06-01 00:00:00','2007-06-24 22:26:26',1,'17:00〜24:00','土・日・祝'),(2,'Le Bistrot de Paris パリのビストロ­','フレンチ','34.69892','135.50823','','','','','06-6363-4310','2007-06-01 00:00:00','2007-09-16 23:47:08',1,'',''),(3,'空　なんば店','焼肉・ホルモン','34.668803','135.498956','','','','','06-6213-9929','2007-06-01 00:00:00','2007-06-24 22:59:17',1,'',''),(4,'京橋マグロ屋台　とよ','居酒屋','34.697207','135.535343','','','','','06-6882-5768','2007-06-01 00:00:00','2007-06-22 21:31:45',1,NULL,NULL),(5,'河太郎','活イカ','33.545284','129.891612','http://www.kawatarou.com/','','','佐賀県唐津市呼子町呼子1789-2','0955-82-3208','2007-06-22 04:03:29','2007-06-24 23:57:08',1,'',''),(7,'長寿庵孫助','居酒屋','35.007841','135.763846','','','','','075-223-5599','2007-06-22 20:48:37','2007-06-24 23:55:50',1,'',''),(8,'うちだ','居酒屋','35.642353','139.66889','','','','世田谷区三軒茶屋2-10-14','03-3414-0917','2007-06-22 20:50:39','2007-06-24 23:55:17',1,'午後5時半〜午前１２時','日曜・祭日'),(10,'大昌園','焼き肉','35.73689','139.74860','','','',NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(11,'EJ kitchen','和食','35.73671','139.74969','','','',NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(12,'立吉','串あげ','35.69040','139.70317','','','',NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(13,'せいざん','和食','35.65793','139.72321','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(14,'サンタンジェロ','イタリアン','35.63430','139.71216','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(15,'萬寿野','しゃぶしゃぶ','35.61927','139.72606','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(16,'河童子','ラーメン','35.55253','139.68018','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(17,'大成食堂','もつ焼','35.73444','139.73871','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(18,'本陣','すっぽん','35.71201','139.70806','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(19,'おかめ','てっちり','35.71109','139.79262','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(20,'叢林','もつ鍋','35.67213','139.73853','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(21,'根の津','うどん','35.71988','139.76268','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(22,'あつた 蓬莱軒','ひつまぶし','35.12020','136.90702','http://www.houraiken.com/','','','','','2007-06-01 00:00:00','2007-06-23 11:26:49',1,NULL,NULL),(23,'愛玉子','愛玉子(おーぎょーちー)','35.72164','139.77075','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(24,'とんかつ北品川','とんかつ','35.62176','139.73936','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(25,'わに屋','居酒屋','35.62670','139.72637','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(26,'天下一品本店','ラーメン','35.03945','135.79163','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(27,'天華','中華','35.62926','139.74257','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(28,'味どころ　遊','定食','35.62917','139.74208','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(29,'ゆかり','お好み焼き','34.700904','135.500576','','','',NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(30,'串あれ','串かつ','34.70092','135.50143','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(31,'五行','ラーメン','35.66197','139.724196','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(32,'猿のしっぽ','地鶏料理','35.657349','139.73255','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(33,'鮨処 銀座 福助','寿司','35.6724456','139.762820','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(34,'一八寿し','寿司','40.827303','140.7396698','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(35,'たちよりSee-Bar','Bar','40.8273357','140.73955178','','','','青森県青森市新町１-１０-１２','017-718-7220 ','2007-06-01 00:00:00','2007-06-24 22:24:12',1,'16:00〜24:00',''),(36,'銭形平二','居酒屋','40.8260936','140.74712634','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(37,'レストラン山崎','フランス料理','40.60241898','140.47031164','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(38,'アウガ新鮮市場','市場','40.82747376','140.736376','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(39,'桔梗','和食','35.663012','139.710133','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(40,'波奈','寿司','35.3814313','139.92980897','','',NULL,NULL,NULL,'2007-06-01 00:00:00','0000-00-00 00:00:00',1,NULL,NULL),(41,'よしだパパ','居酒屋','35.004873','135.758939','','',' 営業時間： 18：00〜24：00（日・祝休み）　','京都市中京区錦小路通烏丸西入ル占出山町','075-255-4678','2007-06-23 02:10:21','2007-06-23 02:10:21',1,NULL,NULL),(42,'湯浅港','居酒屋','34.698872','135.496419','','','','大阪市北区梅田１−３−１　 大阪駅前第１ビル地下１階 ','０６−６３４６−７５７６ ','2007-06-23 02:16:11','2007-06-24 22:40:45',1,'１６時３０分〜２２時３０分(土曜日は１５時〜２１時)','日祝'),(43,'アポロ','居酒屋','35.060848','135.751047','','','','京都市北区上賀茂朝露ヶ原町１７−７ ','075-723-0740','2007-06-23 02:18:31','2007-06-23 02:18:31',1,NULL,NULL),(44,'がるぼ','お好み焼き','34.696149','135.498057','','','','大阪府大阪市北区堂島1丁目4-26','06-6343-1155','2007-06-23 02:19:34','2007-06-24 22:35:19',1,'',''),(45,'パリの食堂','','35.0118197','135.7565803','','','','京都市中京区新町通四条上ル一筋目東入ル','075-256-1825','2007-06-23 02:22:08','2009-01-23 06:58:20',1,'11：30AM〜1：30PM　5：30PM〜9：30PM','月休（祝日の場合は翌日休）'),(46,'喜久三亭川福','手打ちうどん','34.651487','135.518059','','','','大阪市天王寺区大道2-11-6　中井ビル1F','06-6779-9200','2007-06-23 02:41:10','2007-06-24 22:33:25',1,'１１：００〜１５：００、１７：００〜２２：００（日・祝日〜２１：３０）','月曜（月曜が祝日の場合は火曜）'),(47,'土房','焼き肉','32.785313','130.698401','http://www.sairo-tobou.jp/','','','熊本市世安340-1','','2007-06-24 22:47:41','2007-07-07 23:35:09',1,'11:30~15:00、17:00~22:30',''),(48,'やきとり　ばかや','焼き鳥','34.674395','135.505268','','','','大阪府大阪市中央区東心斎橋1丁目9-4 伊賀ビル','06-6252-0020','2007-06-24 23:00:53','2007-07-05 11:42:11',1,'18:00〜02:00','月休（祝日の場合は翌日休）'),(49,'焼き鳥居酒屋 尚','焼き鳥','34.682838','135.508312','','','','大阪府大阪市中央区南本町1-5-3 ','06-6263-5514','2007-06-24 23:05:08','2007-06-24 23:05:08',1,'月〜金　17:30〜24:00(L.O.23:00)　<br />土　　　17:30〜23:00(L.O.22:30)　','日・祝'),(50,'米沢屋','焼き肉','35.616768','139.660009','','','','世田谷区深沢３−３−１３ ','03-5707-5575','2007-06-24 23:07:44','2007-06-24 23:09:02',1,'[月〜土] 18:00〜翌2:00 [日・祝] 18:00〜22:00','火曜日'),(51,'ビストロ・ダ・アンジュ','フレンチ','34.670268','135.500935','','','','大阪市中央区心斎橋筋2-6-18 心斎橋早川ビルB1F','06-6211-6085','2007-06-25 00:04:09','2007-06-25 00:04:09',1,'',''),(52,'茂兵衛','そば','35.468726','134.871753','http://members.at.infoseek.co.jp/mohee/','','','兵庫県豊岡市出石町町分２０５−２','０７９６−５２−４５６０','2007-06-25 00:10:14','2007-06-25 18:13:16',1,'ＡＭ１０：００〜ＰＭ８：００',''),(53,'レセプションガーデン久美浜','フレンチ','35.612014','134.909674','','','','京都府京丹後市久美浜町向磯38-22','','2007-06-25 00:15:10','2007-06-25 18:10:28',1,'',''),(54,'そば処よし川','そば','34.686801','135.836682','','','','奈良県奈良市水門町50','0742-22-0448 ','2007-06-25 17:55:02','2007-06-25 17:55:02',4,'11:00〜売り切れしだい終了','月・火曜（祝日の場合は営業）'),(55,'かき峰','牡蠣','34.820972','135.425448','','','創業大正13年。10月中旬〜3月末日の季節のみ営業。\r\nメニューはカキづくしのコース（酢ガキ、カキフライ、土手鍋、カキめし）のみ。','池田市呉服町2-10','0727-51-3735','2007-06-25 17:59:42','2007-06-25 17:59:42',4,'10月中旬〜3月末日　16：00〜21：00',''),(56,'グリル　じゅんさい','洋食','35.063549','135.785586','','','','京都府京都市左京区岩倉南大鷺町22','075-721-1035','2007-07-07 23:14:39','2007-07-07 23:35:29',1,'11:30〜14:00、17:00〜21:00','水曜（祝日の場合は翌日休）'),(57,'Mago’s','サンドウィッチ','35.051568','135.785569','','','','京都市左京区松ヶ崎小脇町8-1','075-721-3443','2007-07-07 23:16:46','2007-07-07 23:35:56',1,'朝11:30〜夜10:30','月曜日'),(58,'グリル はせがわ','洋食','35.044079','135.761457','','','','京都府京都市北区小山下内河原町68','075-491-8835','2007-07-07 23:18:38','2007-12-10 18:19:51',1,'',''),(59,'Poquito','バール','35.01035','135.769479','','','','京都市中京区河原町通三条上ル下丸屋町401-10','075-212-8450','2007-08-12 11:18:06','2007-08-12 11:18:29',1,'6：00PM〜1：00AM',''),(60,'Terunura','バール','35.006326','135.765335','','','','京都市中京区蛸薬師通麩屋町西入ル油屋町１４６  ラポルトビル　２Ｆ','075-213-0220　','2007-08-12 11:24:24','2007-08-12 11:31:14',1,'11:30〜23:59　','第３水曜日　'),(61,'IL PIATTO','イタリア','35.018791','135.734145','','','','京都市中京区西ノ京西鹿垣町6 林ビル1F','075-842-1890','2007-08-12 11:33:47','2007-08-12 11:33:47',1,'',''),(62,'エルラコーデン・タケウチ','','34.693627','135.188765','','','','神戸市中央区下山手通2-13-13 クロワッサンビル1F','078-391-5723','2007-08-12 11:37:46','2007-08-12 11:37:46',1,'',''),(63,'CASA PEPE','スペイン','34.677065','135.495516','','','','大阪市西区新町1-20-16','06-6536-6681','2007-08-12 11:43:56','2007-08-12 11:43:56',1,'',''),(64,'黒龍天神樓','中国','34.704488','135.512501','','','','大阪市北区天神橋4-2-12 ','06-6353-9614','2007-08-12 11:45:56','2007-08-12 11:45:56',1,'',''),(65,'COPPA 100','','34.674051','135.502257','','','','大阪市中央区心斎橋筋1-3-3　久栄ビル 2F','06-6245-5839','2007-08-12 11:54:07','2007-08-12 11:54:20',1,'5：30PM〜0：30AM',''),(66,'オステリア・バスティーユ','イタリアン','35.006278','135.760788','http://www.bastille.jp','','','京都市中京区蛸薬師烏丸東入ル一蓮社町310　メゾン高見1F','075-222-0788','2007-09-16 23:37:12','2007-09-16 23:37:12',1,'','火曜日'),(67,'北浜　ひな','和食','34.691107','135.505501','','','','大阪市中央区北浜2-4-14','06-6202-5252','2007-09-16 23:39:02','2007-09-16 23:39:02',1,'','日曜'),(68,'がんこラーメン十八代目','ラーメン','34.664568','135.503667','','','','大阪市中央区難波千日前10-13','','2007-09-16 23:41:08','2007-09-16 23:41:08',1,'',''),(69,'THE DINER','','34.695476','135.495257','','','','大阪市北区堂島浜2-1-31','06-6341-3831','2007-09-16 23:43:32','2007-09-16 23:43:32',1,'',''),(70,'せいざん','和食','35.657906','139.723223','','','','港区西麻布4-3-10　B1','03-5468-3257','2007-09-16 23:59:35','2007-09-16 23:59:35',1,'',''),(71,'Takeuchi','カフェ,パン','34.684591','135.494208','','','','大阪市西区靱本町1-16-14','06-6444-2118','2007-09-17 00:01:04','2007-09-17 00:01:04',1,'',''),(72,'ぶどう亭','洋食','34.698843','135.499232','','','','大阪市北区梅田1-1-3 大阪駅前第３ビルB2','06-6342-5211','2007-09-17 03:21:52','2007-09-17 03:21:52',1,'',''),(73,'Ristorante Salire','','34.689777','135.491838','http://www.salire.jp/','','','大阪市西区土佐堀1-6-18 ','06-6443-3600','2007-09-20 04:34:43','2007-09-20 04:34:43',2,'Lunch　11:30～15:00 (L.O 14:00)','第2・第3月曜日'),(74,'kitchen cotocoto','洋食,カフェ','34.698926','135.507417','','','','大阪市北区西天満5-11-3','06-6311-0350','2007-09-26 03:54:46','2007-09-26 03:54:46',1,'','日曜日'),(75,'A table!','フランス料理','35.011986','135.767107','http://gourmet.yahoo.co.jp/0006713573/P006485/','','ランチ\r\nA:1400円\r\nB:1800円\r\nC:2800円','京都市中京区寺町通押小路西入る北側3軒目','075-223-6066','2007-10-28 20:47:58','2007-10-28 20:51:41',2,'','毎週水曜日、第3木曜日毎週木曜日のランチ'),(76,'長秀屋','焼肉','34.550164','135.797062','','','','奈良県磯城郡田原本町大字阪手639','07443-3-5688','2007-10-28 22:46:21','2007-10-28 22:46:21',2,'15:00～24:00',''),(77,'Rive gauche','フランス料理','35.01322','135.772801','http://gourmet.yahoo.co.jp/0005144774/0009638636/','','','京都市左京区川端二条東入（二条通面ス）','075-752-8028','2007-11-19 04:06:17','2007-11-19 04:08:07',2,'11:30~14:00　17:30～21:00',''),(78,'SAKANAZA','','34.674622','135.502758','http://r.gnavi.co.jp/k209300/','','','大阪府大阪市中央区東心斎橋1-19-19　KATIE’S(ケイティーズ)心斎橋2F','06-6245-5717','2007-11-19 04:11:24','2007-11-19 04:12:29',2,'11:30～14:00　17:00～21:00','月曜日'),(79,'スフィーダ　アル・チェントロ','イタリア料理','34.702384','135.514883','http://www.al-centro.com/top.html','','','大阪市北区同心2-4-25 T.D.M.1F','06-4800-4888','2007-11-20 02:36:06','2007-11-20 02:37:37',2,'',''),(80,'Le Vieux Logis (ル　ヴュー　ロジ)','フランス料理','34.680936','135.494811','http://le-vieux-logis.com/','','','大阪市西区阿波座１丁目１１−６ 電機器材会館１階','06-6531-3336','2007-11-22 01:09:29','2007-11-22 01:09:29',2,'昼食：土･日･祝祭日のみ営業 12:00pm〜13:30pm(L.O.)   夕食：18:00pm〜21:00pm(L.O.) ','火･水曜日'),(81,'AIDA','カフェ','34.710415','135.799338','http://gourmet.yahoo.co.jp/0006712796/M0029010198/','','','奈良県奈良市左京1-8-10','0742-70-3888 ','2007-11-26 18:43:10','2007-11-26 18:43:10',2,'11:00～16:00','水曜'),(82,'トラットリア・マルコ ','イタリア料理','34.691904','135.187568','http://r.tabelog.com/hyogo/rstdtl/28001962/','','ランチ：1500円or1800円','神戸市中央区下山手通３－６－','078-332-4758','2008-03-10 00:01:45','2008-03-10 00:01:45',2,'',''),(83,'IL GHIOTTONE','イタリア料理','34.998348','135.775186','http://www.ilghiottone.com/home.html','','','京都市東山区下河原通塔ノ前下ル八坂上町388-1','075-532-2550','2008-05-07 00:23:37','2008-05-07 01:00:14',2,'12:00～14:30　18:00～21:30','火曜');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `taggable_type` varchar(255) collate utf8_bin default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type` (`taggable_id`,`taggable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` (`id`, `tag_id`, `taggable_id`, `taggable_type`, `created_at`) VALUES (1,1,35,'Store','2007-06-24 22:24:12'),(2,2,35,'Store','2007-06-24 22:24:12'),(3,3,18,'Photo','2007-06-24 22:24:44'),(4,1,1,'Store','2007-06-24 22:26:26'),(5,4,1,'Store','2007-06-24 22:26:26'),(6,5,46,'Store','2007-06-24 22:33:25'),(7,6,46,'Store','2007-06-24 22:33:25'),(8,7,44,'Store','2007-06-24 22:35:19'),(9,8,45,'Store','2007-06-24 22:40:06'),(10,9,19,'Photo','2007-06-24 22:52:38'),(11,10,2,'Store','2007-06-24 22:58:20'),(12,11,3,'Store','2007-06-24 22:59:17'),(13,12,50,'Store','2007-06-24 23:09:02'),(14,13,8,'Store','2007-06-24 23:55:17'),(15,14,8,'Store','2007-06-24 23:55:17'),(16,15,8,'Store','2007-06-24 23:55:17'),(17,16,7,'Store','2007-06-24 23:55:50'),(18,17,5,'Store','2007-06-24 23:57:08'),(19,18,20,'Photo','2007-06-25 00:00:59'),(20,19,21,'Photo','2007-06-25 17:55:23'),(21,20,53,'Store','2007-06-25 18:09:45'),(22,21,53,'Store','2007-06-25 18:09:45'),(23,22,53,'Store','2007-06-25 18:09:45'),(24,23,22,'Photo','2007-06-25 18:12:32'),(25,24,52,'Store','2007-06-25 18:13:16'),(26,25,52,'Store','2007-06-25 18:13:16'),(27,26,23,'Photo','2007-06-25 18:15:43'),(28,27,24,'Photo','2007-07-05 11:41:21'),(29,28,48,'Store','2007-07-05 11:42:11'),(30,29,48,'Store','2007-07-05 11:42:11'),(31,30,25,'Photo','2007-07-07 23:30:52'),(32,31,26,'Photo','2007-07-07 23:32:35'),(33,32,47,'Store','2007-07-07 23:35:09'),(34,33,47,'Store','2007-07-07 23:35:09'),(35,34,56,'Store','2007-07-07 23:35:29'),(36,35,56,'Store','2007-07-07 23:35:29'),(37,36,57,'Store','2007-07-07 23:35:56'),(38,37,57,'Store','2007-07-07 23:35:56'),(39,34,58,'Store','2007-07-07 23:36:32'),(40,38,58,'Store','2007-07-07 23:36:32'),(41,39,59,'Store','2007-08-12 11:18:29'),(42,40,59,'Store','2007-08-12 11:18:29'),(43,41,27,'Photo','2007-08-12 11:27:46'),(44,41,28,'Photo','2007-08-12 11:28:05'),(45,41,29,'Photo','2007-08-12 11:28:25'),(46,41,30,'Photo','2007-08-12 11:28:47'),(47,42,31,'Photo','2007-08-12 11:30:24'),(48,34,60,'Store','2007-08-12 11:31:14'),(49,39,60,'Store','2007-08-12 11:31:14'),(50,40,60,'Store','2007-08-12 11:31:14'),(52,44,65,'Store','2007-08-12 11:54:20'),(53,45,33,'Photo','2007-08-12 11:54:39'),(54,31,34,'Photo','2007-08-28 02:09:22'),(55,46,35,'Photo','2007-09-16 23:49:35'),(56,47,36,'Photo','2007-09-16 23:54:07'),(58,47,38,'Photo','2007-09-16 23:57:41'),(59,48,39,'Photo','2007-11-19 04:09:03'),(60,49,40,'Photo','2007-11-29 21:54:57'),(61,49,41,'Photo','2007-11-29 21:55:21'),(62,50,58,'Store','2007-12-10 18:19:51'),(65,51,44,'Photo','2008-03-10 00:08:05');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`) VALUES (1,'GUINNESS'),(2,'青森'),(3,'たちよりSee-Bar'),(4,'たこ焼き'),(5,'豚キムチ'),(6,'天ずっぽう'),(7,'ずり塩'),(8,'フレンチ'),(9,'土房'),(10,'生ハム'),(11,'ホルモン'),(12,'レバ刺し'),(13,'おばんざい'),(14,'豆腐'),(15,'魚'),(16,'焼酎'),(17,'活イカ'),(18,'喜久三亭川福'),(19,'そば処よし川'),(20,'カフェ'),(21,'ホテル'),(22,'Bshop'),(23,'茂兵衛'),(24,'出石そば'),(25,'城之崎'),(26,'レセプションガーデン久美浜'),(27,'やきとり　ばかや'),(28,'焼鳥'),(29,'心斎橋'),(30,'がるぼ'),(31,'アチャコ'),(32,'焼肉'),(33,'熊本'),(34,'京都'),(35,'宝ヶ池'),(36,'生パインジュース'),(37,'ホットドッグ'),(38,'唐揚げ'),(39,'スペイン'),(40,'ポルトガル'),(41,'Terunura'),(42,'Mago’s'),(43,'IL PIATTO'),(44,'カルボナーラ'),(45,'COPPA 100'),(46,'Le Bistrot de Paris パリのビストロ­'),(47,'THE DINER'),(48,'Rive gauche'),(49,'Takeuchi'),(50,'お弁当'),(51,'トラットリア・マルコ'),(52,'AIDA');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'izuno_tasty'
--
DELIMITER ;;
DELIMITER ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-02  4:12:14
