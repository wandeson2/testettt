-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: colonia
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `TB_COMENTARIO`
--

DROP TABLE IF EXISTS `TB_COMENTARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_COMENTARIO` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_NOME` varchar(255) NOT NULL,
  `COM_COMENTARIO` varchar(255) NOT NULL,
  `ID_NOT` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `ID_NOT` (`ID_NOT`),
  CONSTRAINT `TB_COMENTARIO_ibfk_1` FOREIGN KEY (`ID_NOT`) REFERENCES `TB_NOTICIAS` (`ID_NOT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_COMENTARIO`
--

LOCK TABLES `TB_COMENTARIO` WRITE;
/*!40000 ALTER TABLE `TB_COMENTARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_COMENTARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_NOTICIAS`
--

DROP TABLE IF EXISTS `TB_NOTICIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_NOTICIAS` (
  `ID_NOT` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORIA` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITULO` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBTITULO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEXTO` text COLLATE utf8_unicode_ci NOT NULL,
  `ARQUIVO` longblob,
  `PUBLICADO` tinyint(1) DEFAULT NULL,
  `DATA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATA_ED` datetime DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_NOT`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `TB_NOTICIAS_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_NOTICIAS`
--

LOCK TABLES `TB_NOTICIAS` WRITE;
/*!40000 ALTER TABLE `TB_NOTICIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_NOTICIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_civil` (
  `id_estado` int(110) NOT NULL AUTO_INCREMENT,
  `nome_est` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE KEY `nome_est` (`nome_est`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (2,'Casado(A)'),(3,'Divorciado(A)'),(1,'Solteiro(A)'),(4,'Viuvo(A)');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pescadores`
--

DROP TABLE IF EXISTS `pescadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pescadores` (
  `pescador_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(245) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profissional` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pis` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nascimento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rgp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nome_pai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nome_mae` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dependente` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_ins` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `insc_inss` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `orgao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_estado` int(11) NOT NULL,
  `ARQUIVO` longblob,
  PRIMARY KEY (`pescador_id`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `pescadores_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado_civil` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pescadores`
--

LOCK TABLES `pescadores` WRITE;
/*!40000 ALTER TABLE `pescadores` DISABLE KEYS */;
INSERT INTO `pescadores` VALUES (1,1212121,'arroz','joaoa','joajaojoa','joajsjaosoa','121.212.121-21','','121199','121.23','2018-10-10','998995','ajsaosjaos','joasoasjoa','joasjaosa','2018-10-09','21.212.12121/21','9.999.999','sdds',2,''),(2,121212121,'wwww','joaoa','cruz','pe','111.111.111-11','1111.1111.1111','111111111','111.11111.11-1','2018-10-09','11111111111111','wwwwwwwww','wwwwwwwwwwwwww','wwwwwwwwwwwwww','2018-10-09','11.111.11111/11','1.111.111','wwwwwwwww',1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1!%)+...3=3,8(-.-\n\n\n\r.% %--------------------------------------------------ÿÀ\0\0\á\0\á\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0I\0\0\0\0\0!1A\"Qaq2BR‘¡±#3bs²r’¢Á\Ñğ%5S‚“\Â\Ò$4Cc\Ó\áTƒÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\05\0\0\0\0\0!12AQ\"aq‘¡ğ3B±Á\Ñ\áR’ñ‚rÿ\Ú\0\0\0?\0\î4€P\n@cÍŠ\nlm\ï ½¿K‚¡‰_\æ\Ô¿HZ\İòö\Ğ\ïW¶€oW¶€oW¶€ó~¾° =Ş¯h \Õ\íz½´›\å\í <ß¯oÀ\Ğˆ^\ÚŸ¥/óo\ã@xqKü‘@	¶—E\0 €P\n@(\0 \İ\Äd’;ğ`\Ã\Ú-üj:q·p5¦F–\áñ (°ì®ƒ\Ğutà°¥ÁP¿òipø\Ò\çlY–x\×\Î|¾,G\Ì\×R“\Ùm-\Ù`m,7¤\'ùŸû©dŸFG<:£&¢o6Uo¿\ï¨\ê·D“L¼`>>\Óüj7;b“ì®œ±\êF½‚€©£^@{…AQ\Ù\\:PTsöi\\`«g¶i	õo\Ê\Úşş5(£Œ–©œ€P\n@(\0 €…\é>x±jAuö\ê1ÿ\0H®I\\[6{­³\\ƒmm};OmT‰™¿“Îº\á@Z|J­Ô€K\à8\Ñ+‚7o\í¨pŠ*Ãšù#Qy-\Ç$c‡:}mVF›nÈ‹’J\ì\çûS\Ê,\ïq†…b^RNwÒ‘Û»V‡õ«},|zªcR\àW5¼^\Ü\Å\Éö˜¹›»9Eÿ\0-,¿\n\Ù=8ò2ÊµYùBSÈŸy«l¹d\êV1z\íï¥\Ş(o_\×oy®\å*uQ—„\Û˜¾\Ï*÷6ıS¥BT)Ë‰\"P\Ä\Î<,Ù¶W”ŒLvªÌ½¾kü4?\n\ÅWÀ\íú¨\ãg´\ÕÎ‡°:G‡Å­\â~°\ãh\ã\Ù\ÏÆ¼ê”§Møğ©«¢]¸\ÔI@b\âñTñùüµ¨6}\Åo\ZM4[~&\å¿\ÛVGcŒ\Ù*G\0 €P\n@(\0 ,cGP\×5|\×^>\0s¿¶\ã\İUs$I)\ìõ\ĞY\ÄLtD¤m\0\ä9\Ü÷\n’\Î\\„\éŸHSe\Æ0$\ÆLRÚ…Q\ÆF£‚ƒ©ö‘}*N£²+©QA]œŸg`1X\ìCd\Ï<ï¬’1\à/Å›‚ ¾Š<\0¯Mwt\"`p©Yİ“?ü2óı\rq\Øf\ÅØÀŠ™B\åV¶¶65W\Æ-\ì\ìZ°©s5\ÌN\r\ãwAgF*Ã±”Ø‹ó­ñ+£Y÷n\Ìğ%Z¢d•fÊ‚\×lT\ä\Øj\ëRË½U)©Q\æ]À`æ™Š\Ã’.B+1´\ØiT\Êq[»\Z\á†^\ÈI³\Ş“x‡\ĞV,†ö\Ôq¨¶µ\É(µ\âØ‹›OÂµ:\ßDúFq»”e™4 ‹^\ÇScÁ´\ÔwW•^ƒ¦ô\Ø\ÛBºª­\Íğ\ã¯o!\ìÒ³š\r¦:§Cß¥ıİ•\Í{¡0e‰\É\â^\Ş6¼öšœN3b©€P\n@(\0 €\éş‹=¸ˆ¤#\Ä)\"º·8ö8şkb‘ÁLD–*­”œ\ëÃ±®+r¥NKX˜gVqwLÙ¶oI1$€\Â6¡cğ |*2\ÂS¶—9U\\\Öv#k\è\É\Şg`/›v½€\0­\âO\ìŠ\É8¨\èñwW8OLö›b1ø©MÍ¥hs	\ÕG‰\Ö\ís^\Z9a~¦jº\Ê\ÇF\ÚúdªGaŒ\ÄYs$e»?zÆ·µô½½cYu\ê\Û\îÅ­ªP»4Nˆ\íÓ€v’,:\Í+uC»µ\Æcv°\0\æf<Oy¾ú¸[\ÅF.\Éu<bSm«²c\ÑqYv–4E‰Ä¹a\nBó\ÈY\Úç¨­p6\ì\ZT1J$\íÌL#ªó\Í\ÚåtLá§‡\n“	±‹\î\Õ2„[\Ø31c`HnCEcÊ¯¥ŒS½Õ’2\ÖÀ¸Z\Îí½Œ¸:’aŸ˜ø\n\Æ\Ådb¬°¶\ÎVs\ç~!lN—ª\ßh+ğ»ÿ\0ù\ÜZcz«…\\b\í>\ä€w#\ÊM®\ç1¾€X\\\Ô^>ú8—C³\Ôu¹\Ò~…&<X\Å\Ç4r•J\æ)ed9aa~ZkJx¥9e±¡\ĞÊŒ‹†\Ç`pGhÃ‰\æÊ»¶\\\î\ç;\"YJ\Úşsšnj\\*MSb9¡4OtrV\Ùû2}¥+\Äâ¢-Å™\Ø\äb;ÙCoEGeW[\Å5J;#”XJ¬¹\êjıÆ´N’f%»ukùÄdÜš\×^št\ÜLxi¾ñO©\Ò1\Û~e¶@€5\ÊIùÚ°\Ó\ÃA«³elEH»+\Z¦\ßÚ˜†B¬‹dø¨¬T)\ÇòUjKvn>HTÿ\0G+1,ZY\É$›HSRF³V\â5R\á7Z¬°P\n@(\0 €P\nhEš)\ÖFõ\"‹pq\nj ñ û4¯F¨ó\ê«3a\Ù\É\Ö9lSOˆ\Üú(\Ë4~’JM¾\ë¨ û\ÃeyõxR;o¤\Û;\è›UÃ \Ä. s¼o ”\Øs±Î¾*k}\çF\Ë\ÍkK,õ7+›>lD˜Y\àFšÜZ0d\0¹F¿Vú2ª\Øğ\ê\ÕX\'\É\æ9R”‰…\ä\ï£\è˜\Èş”BÍ•¤‡~\Ğ·\×H¾€êƒ©:\Ú\ËVbñ7X|\ÙF\n\âó\Ï\ä‰.l¹§Ú³ã±¨Sv\ÒncpCˆ\äBˆudPC\ZgZ³¹Fr\Çw¿¡©FS­™\í½zš¾#<\ï$™J\âö“d‰!\à\Â—3G2…@t\ĞJÂ­„VUKY~Èªry\Üù½#û²{¦¸{œÀ\Â£\Ì@\à%sò‘÷¶ª¦óIÕ–\Ë\í\Z%±T\Ñ\çL \\f?± 6\Ã\áÂ´\Ö<2¥\Â\ß\Öüe•F›µ\ê\Ë\í–h­S\ÓL˜ı£\Æ¤y\ØF–K±z\ï—*-¸u\Ï\nR’‚s{ò;%}\İ7ÃœV:\rŒ8,.\éY\È*†IBª$f\İf\ÈÁ\ê\í4\×h\ÉBõü½z•U‹ ¶\æcyJs.)aeh°X$\\Ï–\Ê]\ÔYc¾ùrÆ€sv\ä\rK\Ôo7«\äWˆƒšT\Ö\Ü\Í. \êÁJ±µ”N¼5kmI\ŞŒôi8\ÉE\Zlvòª)«D\î!øˆM®½C\áI\É|Yvl\æS\ï™\Ía«\Ä\ÍôÕ¢mUb€P\n@(\0 €P1 8\ŞÒˆ.:U.Hö’}m¢ü&LBÔ‘‹B\r_¹fH®5\áu\ÅD3Xe–1\Å\ã\ã§,À\ê=£K\Öj¾†úU.‰”l(6¶%‚E\Ş-\ÌRrû\ÑH8q¨\â¤p\â\rtjºR\×bU©*‘±\Ç\çlf\r›e\ÄaÏ¥\Z\Ê\èºß¬¡Z\Ö:õ—zJ\Z¾#\Ìu+\Òğ\ÜÀ\ÃHQó£²½óo˜I›\Ö\Ï|\Ä÷Ş­\î\á—-´+r«›=õ2#\ÇL%3\ï\æ\ß—{½s&^9s\Şù~\ï\n\â\ÃRµ¬W,]l\×\ÌQô‡d\ŞI¼mL¹\ßzI¹’ù¸iÇ…Oº„c•-*\Õ\'QM½Lo¤È¬]e”;qHûÓ \ZÉ›1\ĞÇ€K¥²¥¡\é\Âro3z–£™\Õ÷‹$‚K\æ\Şm\æcÅ·—\Í~û\×;¸\Û-´\'W¹^/4®²K<²:\êò;2\Ô$õƒQnÑ„vDI2¬n:iŠ´\Ó\Ë)_4\É#¾^õõOxÖ‘£\ìˆÎ¤š=\Æc%˜©ie\É\æ\ï$wá˜›ú”iB\Z¤FU$Õ›6.‡\ì\Â\ïô©o‘|\Ì\Ü\\ö\ëÊ¨“Syc±g\Í-Í†L^w&­q²09\ç‘cjı™ğª$kÑ¼‹l\ì7\è\ïf?¾±T\âf\èp£b¨€P\n@(\0 €ğ\Ğoh½ñ…¤	÷“[)+D\Í[VI0Ò®‰kB\Âc\Ìgº®È¤Œñ­‘—ğ¡\Õ\ÌøDr^#¬2şšvı\ác\ßm+5Z=OF&2Fv;¤X,Jv¶ÀÚ!\â\ÖI\Ô^>•‡y¬\éN›¼Y¡¨\Íjkø\ï&\×}³ñQ\Ï\ÕC0½»¥K«{‡h†3ü\ÑDğ\×Z\Z\Ö?¢ø\Ø>\Ó(²®ñY.n†\"œ¶hòª\áj\'±4€hM0t>\ê²R\è(\Ói\êb™mVz\n%&U\íú\á\Û2G±±3}–W°F\É\ír2i¨:‘\í\É#&\rŒ3eiUŸû¨-ˆ{ƒb¬\êwH|^ıÆªx˜şUsª‹{»¢h-&$Q¨‹6v\'ï½€o\0 wTySq)S¥ªÜ«km{õ#Q …n§EE>#\æ\ì6k\ÕUK0\è\Ì\Ú\Ç\êÏ…eg¥¤ô\rm³ğ£ş\Òüu¬58™²<(Ÿ¨’€P\n@(\0 €ğ\ĞK%ñJ{P‰­\Ø\Í5©6Í¥MM[E\ëe#Ì®ˆ\è1Ì†\êkVU%©…UœŒŸ\Ât–U;\Å\ê‰\á\Ø\ÛK´­\ÄV»?!\Ïxñx]¢ozk4ğ²G£O´!.d„MO±Ú’\êÈ±IûL…¾5á¼+Ì®lv\Ôm\Ø)ß€Ÿ“\Ô~®¤–\"™\"c˜\ÜÇ³Ñ‰>:½;™ug{øn±¿ı\Èaü<+\î,¬G¾¤¨2/bböl\r®+6\'\î\É#2{#¾Q\ìl0¯¡ELtK\í¨b\\°FÀV¨a:}^\Óÿ\0hm7\êkLa\ìyÓ¯:›‘…õ¤™\ØD˜\ÙMXª3Ö¡Cj}™¬­›â¥\Ñ‡+\Ãt–ğµcŸ5Gbb¢tP\n@(\0 €P\n\Ç\àh\ÍõñØ–şú\×Š&‰\É_JœJ¦{i\ËZ\é³Ï¯–ú;²$\ÅÉ•tQl\Íkñ\ày\×Ãf\í>Õ	F9ªKHÇ¯›òEX.\Ïx™6İ¢·|Í›k\ìıŸƒ’8%ò\Én¢	dp	\ãeô¸X­ùzñ~ÕŸŠ¥u(\Å[\ë¹\îG³°iYS¿›f3lXqò`™…’%BxF\ë-\ï¥ô5»\r\ÚøšQ\ÅZpzfŠ³]/k\Í1}‹NIÊ†rn\éú>¤\Ş7€Ù¡Ä>!¸!7¹±=Tä ‹f#¿\ÃN#RO\Â\ì‰\á{.œ#\âYŸ™™ÑŸ\Ğ\Âı!£H·…·{‘‘£\ÊÌf,—\"ü-T\Ñ\Å×„®\İ\×F_[Bq²W\Õhi[W}‡™\àw\Õ\r¯È‹\\\â5ôe\nSKs\åñ\n­\Z[»\ÙYsH½´\"÷\Ó\Ñ\ã\é/.b§\áN\ÅiU’½Ù\"¿0İ¼	\å\Ü}Æ™¢sºŸFX`Ş©\å\Èó\áó\Ç$IS—CI*-–F% \ÕL¤l¥L™\ÙOYf\ÏFœI=¤~¬øVi3dQ\Ô:\rıŸ…üùVIñ2ø\ìN\ÔNŠ@(\0 €P\n@xEÁæˆ®)E­õkÇ¸‘Z\âô*h–\ÄÉ¥N%rF¯´\æ\ãZ`c«Ÿ\ä£$¶¬Xß¿1%Q_?Uw½¥V¤¿\"ŒW–™Ÿ½\ÏG˜X¥\Î\íş‡%\é6\ÜtÛ“¾ıI4h\ä\İV\Ú=™|\ß\äÔ«+\Ó\Ó\×Ce)Zh\è{\'¤‚<ò\ÎP)•˜†˜uH(¢:\İSÀ¹køy“\Å\Ó\Éß™°:G+o\È<Œ†tUlS›£G”¾‚Clºq6Ôš¶u,\ì™\ÊÓ†cn\èv,.%d\Ëªû\È[@1\Ê7ñ`@ÄÍ::«fF¥&\îÑ­ùI\Å+c\Ü/¢ˆ­úV\Íò`+\èğTUúŸ%Ú–•}9$G\ìW‹¨\\«˜f±½\Ú\ÚÀ\å\Ö×·ueg•\áÔš\Óm~¥\é\ßƒ“ª¢\æ\Í{¸`I\ã`º\î\Ãjü\Zn^\ÕMvÿ\0£gH\É\êY­pü²•°\í°c­\ï\Â\ÚE8¶N\ÓQ\å¢5,úU²–¶*§H ½VÙ²%öC\Öy³T\"L\íõgÂ³½\Í)hu.ƒÿ\0g\á??\Ê+4ø™bØ¨€P\n@(\0 €P[oÿ\0\Î \ì‰G\ÄÖ˜\ìA”cŸJ²$$KhI©­(œnL\àz_>eM\äorA\Õ\"{\ŞKq6s”Û†`MÆ•\â\ã)÷X·&ü5-ş\ÉZ\ß8Ù¯Fk\ÂMd\Ê÷\èÿ\0²\î\0\Ã&qD‰—ª&\Ş´’K+/V\ìüo\İÆ±JW—SÕ‚ğ]\ìj;kf1¢cfŞªb¹fÔ”\Ê\r¸—¹C\ÜkU,Ó÷±¼Te¦\ÆÍµz?6\Ït—0\Äo2«\Ä\Ø0=B€\\\İu\Ö÷·.\Ëk\á­\×\Õ}Ø¯^Ò·&J6Ô’L^*\Û\Õ_ø\\0\Ò\×\á<ÀpQ\è‚n\×\ä5©`pr¯\â\Äqø\åA8Ã‰šş\Z­6÷K‚\Å\Øófóµ\Ğ\Ü¡ñ¯oª÷\ZRµ——\Õj·ù5G+ª§V\ínf¤8qyC.m@9¹İ”8¦\\· \×\å >lñ8¹\Öt\è\É;iË•“m;\ÚW½“vÓ\î¶F†S\Í4\Õÿ\0\êù[w¹hO„\0\Ú\×!†¢CÅ—Q\È6Rö¬	7Ò»(\ã\å%w¢i\é•r{éª½¯\ê\ÒZ#±Xd—\ë÷\èYgÁ\ë\Ûs—\írù¬Vú\\-òu&\í`¢Æ—\Çé¯¯U¯e¢\Ñ]½I¨aõ\Óõûõù˜;C§*\ÆN\íCeˆ\Ì\ì\Æıö\Ê/÷Geh\Ã\Âq\Í*¼N\×k\É%\í{¿Äš‹²\Ëo›ÿ\0†z¹²q‰5±\ÛZªE\ÑD\æ8ıYğ¬\ïr\äu^ƒg\á??\Ê+<ø™%±;Q:(\0 €P\n@(\0 8†\Õ{\ã[îª…h[-m7Ò­‰j8\×Ö¯EM0¸·Ä‘±V^{ˆ#hA\Ğ\ÔjÒ…h:u\Ó\ß\ïô|ˆ«\Å\Ş:2{	·ğú x˜_\ÊÀ\0ò•\áU\ìZ\éŞ…T\×I«¿ö¯\Ø\ßO´¥$Œı´¶z\â*LD\ï#.@Øˆ•Œc‡Q£\Ñ´óx_…\ÍW,7iSœ#/ş%g\í+_\Ü\ìqte;\Êÿ\05¡?¶±JQúü³ƒV\ë+JT\ëZ\âH\ĞË¯œ\06#M˜º°µGd¯{\èÕ¹?2¬KŒ^j|ı;ú3Xb1\ÌQ\Îf‘Ôœ÷\Úó½z8œLV÷RW\å©\å\Ç\ÜóM¶\Ä\Ä\Èo\Zw$\ä[_A{\Úü;‡mg\Ãö)k¦—\Ş\ïøód¥†m¶¹˜[ce\â0¬FH¸\'U\"Ù´qu6\Ö\à5¯J5c.Wğ\î;¢<N:\í\É(#\ÂõË–(¨Ü±D¤5p’D\æ\Æ:Š®EˆÇŸ«>CÜ™\Ö:\rıŸ„üÿ\0(¬\Ó\âd‘;\\:(\0 €P\n@(\0 8.û>.fûÕ¥lD«j*È‘f¤\ĞI,«J^Gl¨£‰\'\ä8’y\0M[t•\ÙW\ä«±*\Ï$¯-ºî‘ss\n¶:ık\Ä\ÔoM‰÷q)o$XFó18…ñİ°°+¿>iJ%[;\ÉF7¼\ÓK8\ä–\İ/øˆ\Ôû¤±s\Ú(*16“³R8‡\ÉyYR\Ê\r™\Ëjn\Ú\Øşú\ÅW=Kİ–e\Ò\È\Öp¦H\ç\\\Z¹°\ÌA\ä\àœÍœ[ª\r\Øxû\Ö(R”g•2:§cÍ½†8x\ÊD\ÄF\î0-q¦ˆ¤“”j@\Ö\Õ*±\î\ãh\ì\ÄÕ–†gD¶Ì…·Y]ÑµÏ™T\à	\0¶š\r8T¨NWµ´õôĞ™\Û;Œ\Ó\n3r‘z²\í\âØŸÕºgu\Å=\Í\"O#„³Ç€—9F\à³};\İl4¿:Ô±zpıJû¤]\É\í1“÷Qçš¸ñr\è÷h…\éÏ“\Å\ÂAôœ,’H‰ö\ÊùK¨&\ÂE*£ª8\ŞÀÕ”«¹¼² 6!\áVÈŠ\'¶ú³\áT=Ég ¿\Ù\ØOÀòŠ\Í>&IµÀ(\0 €P\n@(\0 8&\Ê\Ãfb\Ón=Æ½\çEfy\ë«R\Ì\È\Û87\0\Ø\íş58Ğ›\Ø\ì±ôk\äm>M:,pñœ\\\Ëi\å <cŠÿ\0™\ì	\î\Ê;k\"m\Ë\'Ce6œT—3s¶³–\én\Üùq÷š‹`\Å|Mµ:{Ç‡gg\ZÎ˜òH	\â=£…¯À_¾¸l É™n\Ïkf·#­ôF‡KW-©\Ó!\ÕX… [5\ìu&\Ü-\ß]°,,‘GtE\n/©^\\Mø^ü**\Ëc¶fTx Uc÷—‡´ŸRO¡\Ã,b@Ğ}·©\\\á[±+¥¾z\×QÂ˜\Ô0!€*A§PAĞ‚;-R8r=¡\Ñg\Âb\Şû\"s\ÄI\×v\Ü\ïSu\ïµù×£N2«\È\ÇWJ”òN÷\ßb\î\ÔÁ»…sº\×VA\ãS^ûO¡Q\åÀa\å_”V:œL\Ù\ÜSd\İ@˜ €P\n@(\0 €\á}_¬—ñ\æk\×KDxW”½I\ï£\ïfŠ#Á\äP|/sğ­R\É	K¢3\Î\åHAókù:{F9r\å\Ù^ôû˜\×\Ê56Í¯\\‘\ÔGbq¢ö¿_•\ï\ßn¨\Õ\É$Yİ ø‘}M»n4øW50@,%\Ì	¿¥~|¬5\îu%\èWµŠŒ\Ö{\Ø)¶º±6°\áî®¦p.Fb\rˆ€õ€µ\É\æF\Ş\Ë!©Pˆ\ë;-ˆ±&Ã¢\ä^\ÜE-©\ŞE\×\àX­—\ÒA©$\Ø§?\Z\é§\ÄA\ÊX\æ¹¹$†\Ôint¹\Ò\æ]Py\ê*KcŒ™\ÃE\Ìüj\Ä@×º{¾\Çºû\ró\Zôp2\â^G“\ÚpñS—;µô4İ®¹–\Ü/¥Y-\Ê\àì\ÑAlÙòŠóg\Ä\Ïb(–¨’€P\n@(\0 €P\'£‡¯\'\é·\Ì×²¶GÎ¾)z’øÉ™\nÈ†ÌŒOx7«\é\ÅI8½™–´¥¥Ó¹·lş\áWxDrz@\Ü/ˆ{Z\Ş6¯.¶¬…]\Ş´¨\ÕK3\Êşù“\Ğ\í(d<ô#õ\Å\ÅbzhÕEj®µ)›gG \ê¹^õ#O W2£·dl½˜\Ç*“{õ\Ã¥€\îu¹‹Rl¼a\Z\îIı\"İ’™$v\è™ˆa•‘\0\íšüµ\Õ\Ç.€\ÙS‘¬iD+…[wõy\Ó#‘^e\â4\r\Z¨,Ï”ó±+Ãº»‘ŒÈº»rÁŒÈ¶c\Ğv^í­½”\ÈúŒ\ÈÈ‹aÖ–R\ÇÀ\"ø[²»“©\Ì\Å\É1xxı1§ø†ŸÆ»tY³N˜aœ\ÏÀx’xX(\çW\Ò\ÃÕ©\Ãû«b\èRO4—§3X\Ú;]±r‡\ÊV5F§¼Y»Í‡…«Ó§EQ·osÅ©‰xš™­d¶_»\"¶\ëY	\î®%vJN\Ñ:wE\Zø,1\í†3û¼ºª\Ók\Ìö¨;Ó‹òD­@¸P\n@(\0 €P\n@p„m,¿¦\ß3^\Ú\Ù3}_©Ÿ´¤Ò´SFz®æ»ˆ7«\Ê±V2[#‘n\Âü@ö\ÕS£\î\ÄÊÌ–ƒ¥x•óû\ì	øØŸÖ¬U;:›\ÙX\İKµª.#)|£bPù™‡nb‡õNf—g>R6Cµ\"÷‰—•yû27ûj—ª¹£LqÔ¥²eñ\åqy\Å\'\ê\'şJ\Â\Öò÷.U\é°|¯GıÔŸ¨Ÿù+Ÿ\r[\Ë\Ü\ï{\Ô\ŞVıHd÷F?y®¬%W\Ğ\ã¯MØ)Ø¦óc#\Åÿ\0r¨«!€›\ŞFz˜\êp[³t«\'Q\ì\'óZ¡\Ù\Ôùİ˜*v¬ÿ\0-‘ø™¤ó\äc\İ{pÒ·R\ÃS§\ÃÌ¯Œ«WŠL\ÊÀ\áõÖ®fT®Í—µŠ¡\éQVDwIZ\È|*µ¹løY\Ô:\àp¿\ä\å\ÖüIz\Şğ£è‰Š¬¸P\n@(\0 €P\n@p]~¶_\Óo™¯r;#\æ9³#i½hdI\Í\\R\Ù%³vX’¦y2d…\æ‰,u‚–n\Åf%G2C\\•1N3QŠ\Òöfú8*NSz\Ú\èÀ\ÎmÖÅ¯~©\ÒË˜\ßNK¯†µ§¾‡S\Â\Õ\\ŠJ\ß5£s”f`U\"\á›Mµ¹®:”úµôEœN”h¤Eo5™U¹\èH±¨©S“²e\İ\Õjk4‘›\Ğı“#\Z‘LŒñ\åf` lK;\rr¹+­¯YqmÓ…\âz]û\Ç\â$F\Ï\ÃK.V\ÂÇ‡A\\\â\Í4—!\0\ç{{õ}.\ãYS’qI\İó\èAÙ§ue\È\Ö\r\Ğ1x\İB6G%H\nürk\î\ã^„]7mO·\é¡ û=\ãM\ãÁ*¦v‚\ë\ÃR9ò\í©Æ­&\ìš2T\Ã\â-™¦\\12\ç\Íƒv@’\èÀ!<›uoqÇ¶¬jn\Ö{\ìU,5uv\ÑTyŠ4‹˜\×Î+_µ…jiå¾§\Z«khga€²4R,m¢\ÈQ‚71f\"Æ \ê\ÂO*zT*\ÆÒ’Ğ\Ãğ¬²\Ü\ßOb¤òuMAnN|,\ëÿ\0\Â~_W—[ñ%\ê{”?>„\ÕVZ(\0 €P\n@(\0 8\Ìo­“ôÎ½\Èò>c¯©™‹[Ö˜#-V`©ˆH›\é2Ff!s–Ë®@¼.xk§oe+¹(\Ú+RX5T¼ŞˆšÀt‹*Ï¿8U\ÎcV\'\è\é-\Ú.6°UQ`mX\'‡œr\å\×{¼1T\å›>›{\\¶:_#ı*GûGpñX\ãu‘Èµ‹\nºñ\ÌyiRø>¾l«\ãÕ¥\'òExFb\Ã\æ\ÄI¼±€‹nŒ\Ò?	q\ß\"‹Ü…½ª/\r5)Z:rô\éó/.›Šyµ\çüüˆ\î“\í4`‘a\äS‡¹{\rá™¤\0.ó\Ò(fb¤Z\ÚhG*³\rM©9Mkôùcj§=>÷%º)³\æ\\óáŠœN!· \ï%\'3’Xc©\Ó_0\Õ8š‰\ÕJ[/©«	K%\Çvg`\Û»ˆñ8¥\ÅO…2b¥˜1—*¢\é‡I[W\ë26[ÿ\0\Ó:\r*–¦\îâ¬Ÿ\Ùvh+);\ÛR\×F6Ä˜©qb$H\Ô\ÏUaYIl®\Íkœ¤’I\æÀò²½\ê1J÷z7\äf¡ˆ\ï¥&Ş‹‘~\Ã\åÂ‰\'\ŞFD\Ø\ìL§Œ\ï	Ê¨ \Ş\ÉØƒK\ÔZ•\åeg¤W•\Ë/F\î\ëY?;p›Hb¡]û…CT k,P\Ãv+únUT·¼€W%O»“Ê¸WÕNò>\'\ÄşˆÇ†›i¤sº$HÎ\á.Ak\ÕÌ \å\Ø\Êu \éj“yh·¯7\æ\Èe\ÍY)=9/$`m,t…¤Yœ4\Ò\Ê\ÑX:Ae·p‚:¹®Ä8Ôš¾Œ’Š\Ñ/v÷2\âf\Òq“Õ¿d¶2ğ\ï¥Y-YDtF½\Òw\Ğ\×\Ô\ä\İ\Ñ\×ú«ğŸ\å\äV\ã~§¿Gğ\ã\èNUe¢€P\n@(\0 €P\Zç½«9û\Ç\ç^\í5¡òõ\ZMØ˜ÄŠ\ÕF`ÅŠ0\È\Ò*wRª/vd!Mfÿ\0\rCñJ\Ü\Í\nŠœ›½´%1£g\ç%\ì\Ì\Ù$œA&6*\Ä=bak\Ö:Ú°C¿¶œ¾÷\Üõj|=ü_¿\Ş\Û\"Q¹…i™®\0 9@ °m~u«u(\ÉTr~G™‰©J1™9°¶L]¥\Í`	9N¶\ç@.j\ëN;`ğ´\çÈšÿ\0\ã\Û#¨™Yù–\ê,[3HÃ·˜‡\â«rıO\àhı°\İ\Ø\Ä\ë ¿\ãş>\ã\î=†¹ñ5º}	|-5¢¿¹”z#²”)-`nT™,@ö\Ó\â\ërı¼\r½ı\Ìu\Ù[b\ä\Í\ç=‰\ËÄ¨\â\Ş\Î\ÛqÒ¤ñUö\ÓØ‚\ì\êkû”OÑS<7:£†¶ap\r®/\àj\ÊXŠÙ¥\ìS[MGKûš+ˆ@xû_\ä=\Õ\é\Å_Vx’””œS\Ñ“B€ZÂº\ìr.M\î]\Ù\êT\Ì\×\ÛVl0¾•Eµ.r\Ğ\ÖúK&”j\ÄS¹\Ùú«°Ÿ‚Ÿ*ñ*ñ¿S\é(ğ/Bz X(\0 €P\n@(L‡C\áCŒù÷£¼\ë\è`´>F£%\ç5|Ql\ÃuX@´\"QÀPo¹3\×	¤m½†\à.4ş5\çbY\î\à\ãh#c\Æ`‘VU‡\0—\\«\É\Õwr°P<Õ½\Ë_ˆ#A­`½Ş¬ô\ËR©\"\Çe\Ô\Zf[XfeCd¶k³{kŸúe\Û1›.ar-\Ë	\Æ\ÙH`W(6·;]µ¿0*L\æC}˜ ¬„\ê‚\Ã;0Kö,,<H®\èé“Á¬QdEP8œª>sXp¹¹«\è;³&#cc\Ş\Ì\Ş5\íGd|Ì“\ÎÈ—{š‹eô\âfàª¶[r_yaU¥©\Öô5Í¾\×Ù­\Ó~#·ôÿ\0Wa?>V¯·>ô\'\ê²\Ñ@(\0 €P\n@(ö´n{\ìš\ìwDg\Â\Î°\ÚÂ¾C\ã\ê=IY\Z®Ef;T#\Zy(É¤`»\ÔYdQ\ÛØ˜¾\ÎK…O\ÌUR¡	\îQ\ÅT‚²d¬}2\Çÿ\0û	şÚ‚ÁQ\éúœ—h\×_˜\È^˜c¿¾ı„ÿ\0mK\àhÿ\0\êVûOş_D]^•c\Ï		ğOúj	†[¥\ïı’Xüc\Úş\ß\Ñu:E´\çÿ\0\É\ÛPt°Kv½ÿ\0²Åˆ\í²\ëı±;Sh¿Uƒ\íĞ¿å¢–\n;I{ÿ\0g[\í	\ï¯ôAbp8—\×s!\ï\njÏŒÃ¯Î½\Ê\Öõp—³1F\Ë\Äq/ùmü)ñ4\ç^\è³á«¯\Èı™‘/aó\Üğ–\Ò^\åRE¼_±rLP\áSP\æT\ê-ˆ¦n¦“„\í)x\İ\ä\é\ï³p¿‡os0ı\ÕóÕ¿ŸWCğÑ²UE¢€P\n@(\0 €P~L¸iÛ²)\ì\Zœ\äŠ\ê»A¿&pŸM÷\ë_II]^V‘d¿\n²\ÖWf|Ù’<\Ú\n°ª¶!÷y…\Ò03L\êt\r8õ˜‹\Û@k4ñJùi«¾¼½\ÏJgM¬\Õ^Uõ\"]¨­\æG\íf\ÍòoET¨÷~\È\Õğ”c\Ë\İÿ\0ûö\nšs\êW(\ÑZ$Ll}¥.\"\'úa\ÉQ\â -/Æ±\â\'ŠZÓ’öÿ\0¦\Ü>%\ã‹÷7ˆ°˜\\¹–(²,\Z\ÌARÙ‰\×N\Úò^+\'g7c\ÒX<4U\Ô\ê{.;«\"…=[Z2¹Ci\ç\0A\â;­ssjŒ\ãU\îß¹dU$¼1K\äz6ª¹knF¬®\Ê8\\ú§\ã\á·Ô³¼±\ë\íXó\Ù\ìBrZö¹6\æ4NÁ\Ùr¡&®:š–\ÓiB\×\Ê–\İk5\îA±\Ñl;­©#…«®„¬wˆÈƒ\Z0R.5\ÌA\\À•¶¤q±´p½FT\Üw$¤Å™6Ñ»|«¥ÅŠJ\æ÷¶„v\ŞÂ¥Ü»nE\Ô2¤²©Sf¸P½RnÄ­\ìM\Ô÷^¸¨¦÷%\Ş2\ÜÒ¤Š¨\0€À°¿+•\Ésm/\Â\ãs\Å£9h\Éj‘‡>\È\ÃJŒw+”©[¯[\Ä[Myüj\èbë­¦şz”O‡‘|´7^ƒÀ#ÁE\Z\ŞËu\î‘\ënO3,ŒTVTOP €P\n@(\0 ~ßŒ4‡ƒ§À\Âõ\Õ\'tFPSN/fi²\à\"Í¹Œ‘`·Ô±·\Ş\Ğ\Ïe%Š¬ô\Ì\ìV°˜t\ï‘_Ü«ªf†6Œg»\r°R<@÷ïª•\æ\ï\'Rô”…[\Ğ\Ò\äY\í\Åev\Æ61°À€K\á\ã³1u¶ªJªÆ­\Èc^¤T^H^Ñµß™¬\ÜT¥w±“µö>e3bo7p\ém\ÑfK…[†iBÄ¥™óõš\Ê8\×i\×\Èò\ÂÖ¿=şúVÃª‹4\ï{/O¾¥-\Ñ|9qoÕ³\Çú\È\ì!›ÿ\0Hõa-\Ï79t\ã]xÊ–\Ù}ü\ÉSÀSNú–¶V\ÂH•]\ã2%Ÿc‘#.È®b\ÂD[.`\Î\Ì\ZE\nˆ¨J³“\ÓN_Ï±s…½7/t.Whq·¢\×RQX‚H\0p[Ø€4Ö³\ãTUXµĞ–7vóu%w\Æ\ëÿ\0,@\0²0!¹’Öµ\í~\î©õµ©\ÇG\âÿ\0…\×\ÛB¤—10\â\ê¦\Ú\ß.—[\Ò{9\ÜR\Ö\ŞC\ä\Zg\ÌF\çQ•X„l¤©m\ÛA\á\Õ\ÒúQ$õ\Ìk‘šp\nudAp@\Ì,8i¥Sšk™;.‚c\0•@—6\ã\Ú9ü+N[³©$c\ã\Ğ‰Æ»Ã«:»)\0\Ü+\0\Êä‹“\ÏCSƒğ\ÊO—§ğF\\‘b,DYH(\Ìs¸R·õ¤u¸\Õl\æÇ¬.njrRÍ£¶\ß3Š\Ö2S N¹\êf$Z\â\â\àco`\ïªe{»“[‚AÌ£V>•ˆ#\Ø4<ûôÖ£\Ì¯E\ã\ËQ\Ã;\àNo\Şj\å±bº\0 €P\n@(\0 #¶ì–\Ûò¸ö:\"\\H{€t\Z\æ¶e\×K_Ç•TH·$Æ·\"\Å7º°¶ ƒmyz\'gs„oH6rb®ó«E=€8ˆĞºJ\0\ÓõƒZ\Ã2ß‡\r´q94z®öfj¸u=og\å\Ì\Öd\è\Æ$y¼<É”6š‹¤…\\{«Ğ†*‹\Õ\èı:¦¶m6õ0\ÇEq\×\Ö,§´\Ëñ\ã\é\Ô]z=W±²4\æ´I’x\'ø\Çó™QmbnH\0ñüÁ\íªe‹¦¸U\É÷–\ì\İvwG„41‘\Ö\ìF¬\ÇC~ÁòöW)\Ês\Ï#Lb£\"¯\è<F¥eU%B³…[’l¸\Ø\Úúv÷TóCš9fU6È˜\Ü\ïµ6Anµ\ÅÍ†º\Ş]•\Ä\á\Ğ4\ÊFÅ”ª\ŞS™{\ÉĞ…\rf:ƒ\Õ\å\ß\ãG(ô}Cl7\İ\å.¯›]E\ìÚ†+{’o\İÊ‰\ÅJ\éh\ZmXC±\æ\Ï(b°$–µÁQl\Ş6\ï\Ë{Üšä¤¹/»Ió<ŸgJÌƒ2ˆÁR\Ê\æ,Œ\Ä\Øªò\åk‹\Ôb\ÔSv\×ù\Ğ\ëÔ…\Ål‰bŒ,d—eu[FY3:\"³\æÑ±tsp:\Ú\Zº3S•\ä´ÓŸG§¯B.6Z\ÎÀi¯TXsZ\àhyiY‰—0\î¬2·Tr\î¹<r\Ês\èş‘\Û\ß\ãVD\ã%*G\0 €P\n@(\0 5î”±b‘‚\0Ô·m¹|EBGQ¸h\í\ÖbG~Ÿ+w\ëQ±Ò£\"\×<;\Åô\×^\ßıWA‘Ğş]ÿ\0\Ï\n\è/}!;¯C…BUD#¼)\ÔxÚ€ğ\âGªT\Ğ‰Ïªßªhtõd¶¹\ÜoC‡‚n{¶ö@xg<\Ğş©ı\ÃZ“0æ§;0Óóje\æ\Ühp¶òF}+x]”:YF\Úg[v\ß\áÆšƒ†\r u>\Ñ…rÀ·.+c\í\ï\ìğ¥/\Ñyœ3D\ã•\Ôë­¹Z\ÚZ\â»Œ\Ø\êg\0 €P\n@(\0 01›*9;‹\èğ¿orÀñv<#\Ñ\åş²\ÕÙ±DWlƒƒ\Ñøš¡‡OTPnW\Õ\ê\Í\Âz«\î»µ\ì\êº_T{…\0¯ª=Â€nW\Õ\á@y¸_T{¨7\êŠÃ†NÏ\á\Â\'«ó ,É²\â<W\ä~b€¡¶<GŠƒ\ârÀ¹‡\ÙÑ£U\0\Ëóö\ÒÀÌ®@(\0 €P\n@(\0 €P\n@(\0 €P\n@(\0 €P\n@(ÿ\Ù'),(3,111111111,'wwwwwww','wwwwwww','wwwwww','wwwwwwww','111.111.111-11','1111.1111.11','1110','111.11111.11-1','2018-10-09','111111111111111111','wwww','wwwwwwww','wwwwwwww','2018-10-09','11.111.11111/11','1.111.111','sds',2,'');
/*!40000 ALTER TABLE `pescadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NOME` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `USER_EMAIL` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `USER_LOGIN` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `USER_SENHA` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ww','wandeson@gmail.com','tro','1234'),(2,'ww','wandeson@gmail.com','tro','1234');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-09 20:18:24
