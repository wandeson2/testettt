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
INSERT INTO `pescadores` VALUES (1,1212121,'arroz','joaoa','joajaojoa','joajsjaosoa','121.212.121-21','','121199','121.23','2018-10-10','998995','ajsaosjaos','joasoasjoa','joasjaosa','2018-10-09','21.212.12121/21','9.999.999','sdds',2,''),(2,121212121,'wwww','joaoa','cruz','pe','111.111.111-11','1111.1111.1111','111111111','111.11111.11-1','2018-10-09','11111111111111','wwwwwwwww','wwwwwwwwwwwwww','wwwwwwwwwwwwww','2018-10-09','11.111.11111/11','1.111.111','wwwwwwwww',1,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z%!1!%)+...3=3,8(-.-\n\n\n\r.% %--------------------------------------------------��\0\0\�\0\�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0I\0\0\0\0\0!1A\"Qaq2BR����#3bs�r���\��%5S��\�\�$4Cc\�\�T��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\05\0\0\0\0\0!12AQ\"aq����3B��\�\�R��r�\�\0\0\0?\0\�4�P\n@c͊\nlm\���K���_\�\��HZ\���\�\�W��oW��oW���~���=ޯh�\�\�z���\�\�<߯o�\��^\���/�o\�@xqK��@	��E\0��P\n@(\0�\�\�d�;�`\�\�-�j:�q�p5�F�\��(�쮃\�utథ�P��ip�\�\�lY�x\�\�|�,G\�\�R�\�m-\�`m,7�\'����d�FG<:�&�o6Uo�\�\�D�L�`>>\��j7;b�쮜�\�F�����^@{�AQ\�\\:PTs�i\\`�g�i	�o\�\���5(������P\n@(\0���\�>x�jAu�\�1�\0H�I\\[6{��\\�mm};OmT����κ\�@Z|J��ԝ�K\�8\�+�7o\�p�*Ú�#Q�y-\�$c�:�}mVF�nȋ�J\�\��S\�,\�q��b^RNwґۻV���},|z�cR\�W5�^\�\�\������9E�\0-,�\n\�=8�2ʵY�BSȟy�l�d\�V1z\�漏\�(o_\�oy�\�*uQ��\���\�*�6�S�BT)ˉ\"P\�\�<,ٶW��Lv�̽�k�4?\n\�W�\���\�g�\�·�:G�ŭ\�~�\�h\�\�\�ƼꔧM�����]��\�I�@b\��T�����6}\�o\ZM4[~&\�\�VGc�\�*G\0��P\n@(\0�,cGP\�5|\�^>\0s��\�\�Us$I)\��\�Y\�LtD�m\0\�9\��\n��\�\\�\�HSe\�0$\�LRڅQ\�F������}*N��+�QA]��g`1X\�Cd\�<﬒1\�/ś� ��<\0�Mwt\"`p�Yݓ?�2��\rq\�f\�؝���B\�V��65W\�-\�\�Z��s5\�N\r\�w�AgF*ñ�؋��+�Y�n\��%Z�d�fʂ\�lT\�\�j\�R˽U)�Q\�]�`晊\��.B+1�\�iT\�q[�\Z\��^\�I�\��x�\�V,��\�q���\�(�\�؋�Oµ:\�D�Fq��e�4 �^\�Sc��\�wW�^���\�\�B���\��\�o!\�ҳ�\r�:�Cߥ�ݕ\�{�0e�\�\�^\�6����N3b��P\n@(\0���\���=���#\�)\"��8�8�kb��LD�*���\�ñ�+r�NKX�gVqwLٶoI1$�\�6�c� |*2\�S��9U\\\�v#k\�\�\�g`/�v��\0�\�O\�\�8�\��wW8OL��b1��Mͥh�s	\�G�\�\�s^�\Z9a~�j�\�\�F\��d�Ga�\�Ys$e�?zƷ����cYu\�\�\�ŭ�P�4N�\�Ӏv�,:\�+uC��\�cv�\0\�f<Oy���[\�F.\�u<bSm��c\�qYv�4E�Ĺa\nB�\�Y\�稭p6\�\Z�T1J$\�̝L#��\�\�厐tLᧇ\n�	��\�\�2�[\�31c`HnCEcʯ��S�Ւ2\���Z\���:�a���\n\�\�db���\�Vs\�~!lN��\�h+��\0��\�Z�cz��\\b\�>\�w�#\�M�\�1��X\\\�^>�8�C�\�u�\�~�&<X\�\�4r�J\�)ed9�aa~ZkJx�9e��\�ʌ���\�`pGhÉ�\�ʻ�\\\�\�;\"YJ\��s�nj\\*MSb9�4OtrV\��2}�+\�⍢-ř\�\�b;ٞCoEGeW[\�5J;#��XJ��\�j�ƴN�f%��uk�Ğdܚ\�^�t\�Lxi��O�\�1\�~e�@�5\�I�ڰ\�\�A��elEH�+\Z�\�ژ�B���d���T)\��UjKvn>HT�\0G+1,ZY�\�$�HSRF�V\�5R\�7Z��P\n@(\0��P\nhE�)\�F�\"�pq\nj����4�F���\�3a\�\�\�9lSO�\��(\�4~�JM�\� �\�ey�x�R;o�\�;\�UÎ�\�. s�o �\�s�ξ*k}\�F\�\�kK,�7+�>lD�Y\�F�܁Z0d\0�F�V�2�\��\�\�X\'\�\�9�R���\�\�\�\���B͕��~\��\�H��ꃩ:\�\�Vb�7�X|\�F\n\��\�\�.�l��ڳ㱨Sv\�ncpC�\�B�udPC\Zg�Z��Fr\�w���FS��\��z��#<\�$�J\���d�!\�\��3G2�@t\�J­�VUKY~Ȫry\���#��{��{��\��\�@\�%s������IՖ\�\�\Z%�T\�\�L \\f?� 6\�\�´\�<2�\�\�\��e�F��\�\�\�h�S\�L���\��y\�F�K�z\�*-�u\�\nR��s{�;%}\�7ÜV:\r�8,.\�Y\�*�IB�$f\�f\��\�\�4\�h\�B���z�U����\�cyJs.)aeh�X$\\ϖ\�]\�Yc���rƀsv\�\rK\�o7�\�W���T\�\�\�. \��J����N�5kmI\���i8\�E�\Zlv�)�D\�!��M��C\�I\�|Yvl\�S\�\�a�\�\��բmUb�P\n@(\0��P1�8\�҈.:U.H��}m��&LBԑ�B\r_��fH�5\�u\�D3Xe�1\�\�\�,�\�=�K\�j����U.��l(6�%�E\�-\�Rr�\�H8�q�\�p\�\rtj�R\�bU�*��\�\�lf\r�e\�aϥ\Z\�\�߬�Z\�:���zJ�\Z�#\�u+\��\��\�HQ󣲽�o�I�\�\�|\��ޭ\�\�-�+r��=�2#\�L%3\�\�\��{�s&^9s\��~\�\n\�\�R��W,]l\�\�Q�d\�I�mL�\�zI����iǅO��c�-*\�\'QM�Lo�Ȭ]e�;q�H�Ӡ\Zɛ1\�ǀK����\�\�ro3z���\���$�K\�\�m\�cŷ�\�~�\�;�\�-�\'�W�^/4��K<�:\��;2\�$��QnфvD�I2�n:i��\�\�)_4\�#�^��Ox֑�\�Τ�=\�c%���ie\�\�\�$wᘛ��iB\Z�FU$՛6.�\�\�\���o�|\�\�\\�\�ʨ�Syc�g\�-͆L^w&�q�09\�cj���$k�Ѽ��l\�7\�\�f?��T\�f\�p�b��P\n@(\0���\�oh�񅏤	��[)+D\�[VI0Ү��kB\�c\�g��Ȥ�񭑗�\�\��Dr^#�2��v�\�c\�m+5Z=OF�&2Fv;�X,Jv��ځ!\�\�I\�^>��y�\�N��Y��\�jk�\�&\�}��Q\�\�C0���K�{��h�3�\�D�\�Z\Z\�?��\�>\�(���Y.n�\"��h�\�j\'�4�hM�0t>\�R\�(\�i\�b�mVz\n%&U\��\�\�2G��3}�W�F\�\�r2�i�:��\�\�#&\r�3eiU���-�{�b�\�wH|^�ƪx��Us��{��h-&$Q��6v\'｀o\0�wTySq)S��ܫkm{�#Q��n�EE>#\�\�6k\�UK0\�\�\�\�\�υeg���\rm���\��u�58��<(����P\n@(\0���\�K%�J{P���\�\�5�6ͥMM[E\�e#̮�\�1̆\�kVU%��U���\�t��U;\�\�\�\�\�K��\�V�?!\�x�x]�oz�k4�G�O�!.d�MO�ڒ\�ȱI�L��5�Ἅ+̮lv\�m\�)߀��\�~���\"��\"c�\�ǳщ>:�;�ug{�n���\�a�<+\�,�G���2/bb�l\r�+6\'\�\�#2{#�Q\�l0��ELtK\�b\\�F�V�a:�}^\��\0hm7�\�kLa\�yӯ:������\�D�\�MX�3֡Cj}����⎥\��+\�t��c�5Gbb�tP\n@(\0��P\n\�\�h\���ؖ��\��&�\�_J�J��{i\�Z\�ϯ��;�$\�ɕtQl\�k�\�y\�Íf\�>Վ	F9�KHǯ��EX.\�x�6ݢ�|͛k\�����8%�\�n�	dp	\�e��X��z�~՟��u(\�[\�\�G��iYS��f3lXq�`����%BxF\�-\��5�\r\���Q\�Zpzf��]/k\�1}�NIʆ�rn\��>�\�7�ِ�ā>!�!7��=T䠋f#�\�N#RO\�\�\�{.�#\�Y���ѝ�\�\��!�H���{���\�̝f,�\"�-T\�\�ׄ�\�\�F_[Bq��W\�hi[W}��\�w\�\r�ȋ\\\�5�e\n�SKs\��\n�\Z�[�\�YsH��\"�\�\�\�\�/.b�\�N\�iU��ُ\"�0ݼ	\�\�}ƙ�s��FX`ީ\�\��\��\�$IS�CI*-�F%�\�L�l�L�\�OYf\�F�I=�~��Vi3dQ\�:\r�����VI�2�\�N\�N�@(\0��P\n@xE�戮)E��kǸ�Z\��*h�\�ɥN%rF��\�\�Z`c��\��$��X߿1%Q_?Uw��V��\"�W����\�G�X�\�\���%\�6\�tۓ��I4h\�\�V\�=�|\�\�ԫ+\�\�\�Ce)Zh\�{\'��<�\�P)����uH(�:\�S�����k�y�\�\�\�ߙ�:G+o�\�<��tUlS��G���Cl�q6Ԛ�u,\�\�ӆcn\�v,.%�d\���\�[@1\�7�`@ĝ͏:�:�fF�&\�ѭ�I\�+c\�/����V\��`+\��TU��%ږ�}9$G\�W���\\��f��\�\��\�\�׷ueg�\�Ԛ\�m~�\�\�����\�\�{�`I\�`��\�\�j�\Zn^\�Mv�\0�gH\�\�Y�p����\�c�\�\�\�E8�N\�Q\�5,�U���*�H��Vٲ%�C\�y�T\"L\��g³�\�)hu.��\0g\�??\�+4��b؝���P\n@(\0��P[o�\0\� \�G\�֘\�A�c�J�$$�KhI��(�nL\�z_>eM\�orA\�\"{\�Kq6s�ۆ`Mƕ\�\�)�X�&�5-�\�Z\�8ٯFk\�Md\���\��\0�\�\0\�&qD���&\���K+/V\��o\�ƱJW��SՂ�]\�j;kf1�cfުb�fԔ\�\r���C\�kU,Ӎ�����Te�\�͵z?6\�t�0\�o2�\�\�0=B�\\\�u\���.\�k\�\�\�}د^ҷ&J6ԒL^*\�\�_�\\0\�\�\�<�pQ\�n\�\�5�`pr�\�\�q�\�A8É��\Z�6�K�\�\��f�\�\���o��\ZR���\�j��5G+��V\�nf�8qyC.m@9�ݔ8�\\� \�\�>l�8�\�t\�\�;i˕�m;\�W��vӝ\�F�S\�4\��\0\��[w�hO�\0\�\�!��CŗQ\�6R��	7һ(\�\�%w�i\�r{骽�\�\�Z#�Xd��\��\�Yg�\�\�s�\�r��V�\\-�u&\�`�Ɨ\�鯯U��e�\�]�I�a�\������;C�*\�N\�Ce�\�\�\���\�/�Geh\�\�q\�*�N\�k\�%\�{��Ě���\�o��\0�z��q�5�\�Z�E\�D\�8�Y�\�r\�u^�g\�??\�+<��%�;Q:(\0��P\n@(\0�8�\�{\�[�h[-m7ҭ�j8\�֯EM0���đ�V^{�#�hA\�\�j҅h:u\�\�\��|��\�\�:2{	��� x�_\����\0��\�U\�Z\�ޅT\�I�����\�\�O��$�����z\�*LD\�#.@؈��c�Q�\���x_�\�W,7iS��#/�%g\�+_\�\�qte;\��\05�?��J�Q����V\�+JT�\�Z\�H\�˯�\06#M����Gd�{\�չ?2�K�^j|��;�3Xb1\�Q\�f�Ԝ�\��z8�LV�RW\�\�\�\��M�\�\�\�o\Zw$\�[_A{\��;�mg\���)k��\�\���d��m���[ce\�0�FH�\'U\"ٴqu6\�\�5�J5c.W�\�;�<N:\�\�(#\��˖(�ܱD�5p�D\�\�:��E��ǟ�>Cܙ\�:\r�����\0(�\�\�d�;\\:(\0��P\n@(\0�8.�>.f�եlD�j�*ȑf�\�I,�J^Gl���\'\�8�y\0M[t�\�W\��*\�$�-�ss\n�:�k\�\�oM��q)o$XF�18��ݰ�+�>iJ%[;\�F7�\�K8\�\�/��\����s\�(*16��R8�\�yYR\�\r��\�jn\�\���\�W=Kݖe\�\�\�p�H\�\\\Z��\�A\�\��͜[�\r\�x��\�(R�g�2:�cͽ�8x\�D\�F\�0-q�����j@\�\�*�\�\�h\�\�Ֆ�gD�̅�Y]ѵϙT\�	\0��\r8T�NW����Й\�;�\�\n3r�z�\�\�؟պgu\�=\�\"O#��ǀ�9F\�};\�l4�:Աzp�J��]�\�\�1��Q皸�r\��h�\�ϓ\�\�A��,�H��\��K�&\�E*���8\��Ք���� 6!\�VȊ\'����\�T=ɝg��\�\�O���\�>&I��(\0��P\n@(\0�8&\�\�f�b\�n=ƽ\�Efy\��R�\�\�\�87\0\�\��58Л\�\��k\�m>M:,p�\\\�i\� <c��\0�\�	\�\�;k\"m\�\'Ce6�T�3s���\�n\��q���`\�|M�:{Ǉgg\Z�Θ�H	\�=����_��l�ən\�kf�#���F�KW-�\�!\�X� [5\�u&\�-\�]�,,�GtE\n/�^\\M��^�**\�c�fTx��Uc�����RO�\�,b@Н}��\\\�[�+��z\�Q\�0!�*A�PAЂ;-R8r=�\�g\�b\��\"s\�I\�v\�\�Su\��ףN2�\�\�WJ��N�\�b\�\����s�\�VA\�S^��O�Q\��a\�_�V:�L\�\�Sd\�@���P\n@(\0��\�}_���\�k\�KDxW��I\�\�f�#�\�P|/s��R\�	K�3\�\�HA�k�:{F9r\�\�^���\�\�56ͯ\\�\�Gbq���_�\�\�n�\�\�$Y�ݐ���}M�n4�W50@,%\�	��~|�5\�u%\�W���\�{\�)���6�\�p.Fb\r�����\�\�F�\�\�!�P�\�;-��&Î�\�^\�E-�\�E\�\�X��\�A�$\��?\Z\��\�A\�X\��$�\�int�\�\�]Py\�*Kc��\�E\��j\�@׺{�\���\r�\Z�p2\�^G�\�p�S�;��4ݮ��\�/�Y-\�\�쎝\�Alُ��g\�\�b(����P\n@(\0��P\'���\'\�\�ײ�Gξ)z��ə\nȆ̌Ox7�\�\�I8������ӹ�l��\�WxDrz@\�/�{Z\�6�.���]\���\�K3\����\�\�(d<�#�\�\�bzhՏEj��)�gG \�^�#O W2��dl��\�*�{�\���\�u��Rl�a\Z\�I�\"ݒ�$v\���a��\0\����\�\�.�\�S��iD+�[w�y\�#�^e\�4\r\Z�,ϔ�+ú���Ⱥ�r��ȶc\�v^��\���\�ȋa֖R\��\"�[����\�\�\�1xx�1�����ƻt�Y�N�a�\��x�xX(\�W\�\�թ\���b\�RO4��3X\�;]�r�\�V5F���Y�͇��ӧEQ��osũ�x���d�_�\"�\�Y	\�%vJN\�:wE\Z�,1\�3����\�k\���;Ӌ�D�@�P\n@(\0��P\n@p��m,��\�3^\�\�3}_����ҴSFz�滈7�\��V2[#�n\��@�\�S�\�\�ʞ̖��x���\�	�؟֬U;:�\�X\�K��.#)|�bP���nb��N�f�g>R6C�\"����y��27�j�����Lqԥ�e�\�qy\�\'\�\'�J�\�\���.U\�|�G�ԟ���+�\r[\�\�\�{\�\�V�Hd�F?y��%W\�\�M؏)ئ�c#\��\0r��!��\�Fz�\�p[�t�\'Q\�\'�Z�\�\��ݘ*v��\0-������\�c\�{pҷR\�S�\�̯��W�L\��\��֮fT�͗���\�QVDwIZ\�|*��l�Y\�:\�p��\�\�\��Iz�\��艊��P\n@(\0��P\n@p]�~�_\�o��r;#\�9�#i�h��dI\�\\R\�%�vX��y2d�\�,u���n\�f%G2C\\�1N3Q�\��f�8*NSz\�\��\�m֍ů~�\�˘\�NK������S\�\�\\�J\�5�s�f`�U\"\�M���:������E�N�h�Eo5�U�\�H���S��e\�\�jk4��\���#\Z�L��\�f` lK;\rr��+��YqmӅ\�z]��\�\�$F\�\�K.V\�Ǉ�A\\�\�\�4�!\0\�{{�}.\�YS�qI\��\�A٧ue\�\�\r\�1x\�B6G%H\n�rk\�\�^�]7mO�\� �=\�M\��*��v��\�\�R9�\�ƭ&\�2T\�\�-��\\12\�\��v@�\��!<�uoqǶ��jn\�{\�U,5uv\�Ty�4��\�ΐ+_��ji徧\Z��khga��4R,m�\�Q�71f\"Ơ\�\�O*z�T*\�ҒО\��\�\�Ob��uMAnN|,\��\0�\�~_�W�[�%\�{�?>�\�VZ(\0��P\n@(\0�8\�o���ν\��>c����[֘#-V`��H�\�2Ff!s�ˮ@�.xk�oe+�(\�+RX5T�ވ��t�*Ͽ�8U\�cV\'\�\�-\�.6�UQ`mX\'��r\�\�{�1T\�>�{\\�:_#�*G�Gp�X\�u�ȵ�\n��\�yiR�>�l�\�ե\'�Ex��Fb\�\�\�I����n�\�?	q\�\"�܅��/\r5)Z:r�\��/�.��y�\����\�\�4`�a\�S��{\rᙤ\0.�\�(fb�Z\�hG*�\rM�9Mk��cj�=>�%�)�\�\\�ኜN!� \�%\'3�Xc�\�_0\�8��\�J[/��	K%\�vg`\����8�\�O�2b��1�*�\�I[W\�26[�\0\�:\r*��\�⬞�\�vh+);\�R\�F6Ę�qb$H\�\�UaYIl�\�k���I\�����\�1J�z7\�f��\�&ދ�~\�\�\'\�FD\�\�L��\�	ʨ�\�\�؃K\�Z�\�eg�W�\�/F\�\�Y?;p�Hb�]��CT�k,P\�v+�nUT���W%O��ʸW՝�N�>\'\���ǆ�i�s�$Hΐ\�.Ak\�̠\�\�\�u \�j�yh��7\�\�e\�Y)=9/$`m,t��Y�4\�\�\�X:Ae�p�:��Đ8Ԛ����\�/v�2\�f\�q�տd�2�\�Y-YDtF�\�w\�\�\�\�\�\�\����\�\�V\�~��G�\�\�NUe��P\n@(\0��P\Z罁�9�\�\�^\�5���\ZMؘĊ\�F`Ŋ0\�\�*wR��/vd!Mf�\0\rC�J\�\�\n�����%1�g\�%\�\�\�$�A&6*\�=��ba�k\�:ڰC������\��j|=�_�\�\�\"Q��i��\0 9@��m�~u�u(\�Tr~G���J1��9��L]�\�`	9N�\�@.j\�N;`�\�Ț�\0\�\�#��Y��\�,[3H÷��\�r�O\�h��\�\�\�\� �\��>\�\�=���5�}	|-5����z#��)-`nT�,�@�\�\�\�r��\r��\�u\�[�b\�\�\�=�\�Ĩ\�\�\�\�qҤ�U�\�؂\�\�k��Oѝ�S<7:���ap\r�/\�j\�X��٥\�S[MGK���+��@x�_\�=\�\�\�_Vx����S\��B�Zº\�r.M\�]\�\�T\�\�\�Vl0��E�.r\�\��K&�j\�S�\�������*�*�S\�(�/Bz�X(\0��P\n@(L�C\�C�����\�\�`�>F�%\�5|Q�l\�u�X@�\"Q�Po��3\�	�m��\�.4�5\�bY\�\�\�h#c\�`�VU�\0�\\�\�\�wr�P<ս\�_�#A�`�ެ�\�R�\"\�e\�\Zf[XfeCd�k�{k��e\�1�.ar-\�	\�\�H`W(6�;]��0*L\�C}����\��\�;0K�,,<H�\�铎��QdEP8��>sXp���\�;�&#c�c\�\�\�5\�Gd|̓\�ȗ{��e�\�fશ[r_yaU��\��5;\�٭\�~#���\0Wa?>V��>���\'\�\�@(\0��P\n@(��n{�\�\�wDg\�\��\�¾�C\�\�=IY\Z�Ef;T�#\Zy(ɤ`�\�YdQ��\�ؘ�\�K�O\�UR�	\�Q\�T��d�}2\��\0�	�ڂ�Q\����h\�_�\�^�c�����\0mK\�h�\0�\�V�O�_D]^�c\�		��O�j	�[�\���X�c\��\�\�u:E��\��\0\�\�Pt�Kv��\0�ň\��\���;Sh�U��\�п墖\n;I{�\0g[\�	\���Abp8�\�s!\�\njόïν\�\��p��1F\�\�q/�m�)�4\�^\�᫯\����/��a�\��\�^\�R�E�_�rLP\�SP\�T\�-���n����\�)x�\�\�\�\�p��os0�\��տ�WC�ѲUE��P\n@(\0��P~L�i۲)\�\Z�\�\�A�&p��M���\�_II]^V��d�\n�\�Wf|ٝ�<\�\n���!�y�\�03L\�t\r��8���\�@k4�J�i����\�J�gM�\�^U�\"]��\�G\�f\��o�ET��~\�\��c\�\��\0���\n�s\�W(\�Z$Ll}��.\"\'�a\�Q\�-/Ʊ\�\'�ZӒ��\0�\�>%\��7���\\��(�,\Z\�ARى\�N\��^+\'g7c\�X<4U\�\�{.;�\"�=[Z2�Ci\�\0A\�;�ssj�\�U\�߹dU$�1K\�z6��knF���\�8\\��\�\�Գ��\�\�X�\�\�B�r�Z��6\�4N�\�r�&��:��\�iB\�\��\�k5\�A�\�l;��#������w�ȃ\Z0R.5\�A\\����q��p�FT\�w$��ř6ѻ|��Ŋ�J\����v\�¥ܻnE\�2���Sf�P�Rnā�\�M\��^����%\�2\�Ҥ��\0����+�\�sm/\�\�s\��9h\�j��>\�\�J�w+���[�[\�[My�j\�b뭦�z�O��|�7^��#�E\Z\�˝u\�\�nO3,�TVTOP���P\n@(\0�~ߌ4�����\��\�\'tFPSN/fi�\�\"͹��`�Ա�\�\�\�e%���\�\�V��t\�_ܫ�f�6�g�\r��R<@�歹\�\�\'R���[\�\�\�Y\�\�ev\�61���K\�\�1u��J�ƭ\�c^�T^H^ѵߙ��\�T�w����>e3bo7p\�m\�fK�[�iBĥ����\�8\�i\�\��\�ֿ=��Vê�4\�{/O��-\�|9qoճ\��\�\�!��\0H�a�-\�79t\�]xʖ\�}�\�S�SN���V\�H�]\�2%�c�#.Ȯb\�D[.`\�\�\ZE\n��J��\�N_ϱs��7/t.Whq��\�RQX�H\0p[؀4ֳ\�TUX�Ж7v�u%w\�\��\0,@\0�0!��ֵ\�~\����\�G\��\0�\�\�B��10\�\�\�\�.�[\�{9\�R\�\�C\�\Zg\�F\�Q�X�l��m\�A\�\�\��Q$�\�k��p\nudAp@\�,8i�S�k�;.�c\0�@�6\�\�9�+�N[��$c\�\��ƻë:�)\0\�+\0\�䋓\�CS��\�O���F\\�b,DYH(\�s�R���u�\�l\�Ǭ.njrRͣ�\�3�\�2S �N�\�f$Z\�\�\��co`\�e{��[�ẠV>��#\�4<��֣\��E\�\�Q\�;\�No\�j\�b�\0��P\n@(\0�#�얏\����:�\"\\H{�t\Z\�e\�K_ǕTH�$Ʒ\"\�7�����myz\'gs�oH6rb��E=�8�кJ\0\���Z\�2߇\r�q94z���fj�u=og\�\�\�d\�\�$y��<ɔ6����\\{�І*�\�\��:��m6�0\�Eq\�\�,��\��\�\�\�]z=W��4\�I�x\'�\��QmbnH\0���\�e���U\���\�\�vwG�41�\�\�F�\�C~���W�)\�s\�#Lb�\"�\�<F�eU%B��[�l�\�\��v�T�C�9fU6Ș\�\��6An�\�͆��\�]�\�\�\�4\�FŔ�\�S�{\�Ѕ\rf:�\�\�\�\�G(�}Cl7\�\�.��]E\�چ+{�o\�ʉ\�J\�h\ZmXC�\�\�(b�$���Ql\�6\�\�{ܚ䤹/��I�<�gJ̃2��R\�\�,�\�\���\�k�\�b\�Sv\��\�\�ԅ\�l�b�,d�eu[FY3:\"�\�ѱtsp:\�\Z�3S�\�ӟG��B.6Z\��i�TXsZ\�hyiY��0\�2�Tr\�<r\�s\���\�\�\�VD\�%*G\0��P\n@(\0�5b��\0Էm�|EBGQ�h\�\�bG~�+w\�Q�ң\"\�<;\��\�^\��WA�Ў�]�\0\�\n\�/}!;��C�BUD#�)\�xڀ�\�G�T\��Ϫߪht�d��\�oC��n{��@xg<\����\�Z�0捧;0ӏ�je\�\�hp��F}+x�]�:Y�F\�g[v\�\�ƚ��\r�u>\��r��.�+c\�\�\��/\�y�3D\�\�뭹Z\�Z\��\�\�g\0��P\n@(\0�01�*9;�\��o�r��v<#\�\���\�ٱDWl��\�����OTPnW\�\�\�\�z�\���\�\��_T{�\0��=nW\�\�@y�_T{�7\�ÆNϝ\�\�\'��,ɲ\�<W\�~b���<G��\�r���\�ѣU\0�\���\��̮�@(\0��P\n@(\0��P\n@(\0��P\n@(\0��P\n@(�\�'),(3,111111111,'wwwwwww','wwwwwww','wwwwww','wwwwwwww','111.111.111-11','1111.1111.11','1110','111.11111.11-1','2018-10-09','111111111111111111','wwww','wwwwwwww','wwwwwwww','2018-10-09','11.111.11111/11','1.111.111','sds',2,'');
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
