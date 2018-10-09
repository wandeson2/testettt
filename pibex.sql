DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `USER_NOME` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `USER_EMAIL` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `USER_LOGIN` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `USER_SENHA` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `estado_civil`;

CREATE TABLE `estado_civil` (
  `id_estado` int(110) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_est` varchar(45) COLLATE utf8_unicode_ci NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `estado_civil` (`id_estado`, `nome_est`) VALUES
(1,'Solteiro(A)'),
(2,'Casado(A)'),
(3,'Divorciado(A)'),
(4,'Viuvo(A)');


DROP TABLE IF EXISTS `pescadores`;

CREATE TABLE `pescadores` (
  `pescador_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `matricula` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco`varchar(245)NOT NULL,
  `bairro` varchar(45)NOT NULL,
  `estado` varchar(45)NOT NULL,
  `cpf` varchar(255)NOT NULL,
  `titulo` varchar(255)NOT NULL,
  `profissional` varchar(255)NOT NULL,
  `pis` varchar(255)NOT NULL,
  `nascimento` varchar (255) NOT NULL,
  `rgp` varchar(255)NOT NULL,
  `nome_pai` varchar(255) NOT NULL,
  `nome_mae` varchar(255) NOT NULL,
  `dependente` varchar(255)NOT NULL,
  `data_ins` varchar (255) NOT NULL,
  `insc_inss` varchar(255)NOT NULL,
  `rg` varchar (255) NOT NULL,
  `orgao` varchar (255) NOT NULL,
  -- `assinatura_socio` varchar(255)NOT NULL,
  -- `assinatura_presidente`varchar(255)NOT NULL,
  `id_estado` int(11) NOT NULL,
  `ARQUIVO` longblob,
  FOREIGN KEY (id_estado) REFERENCES estado_civil(id_estado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `TB_NOTICIAS`;
CREATE TABLE `TB_NOTICIAS` (
  `ID_NOT` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `CATEGORIA` varchar(255) NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `SUBTITULO` varchar(255) DEFAULT NULL,
  `TEXTO` text NOT NULL,
  `ARQUIVO` longblob,
  `PUBLICADO` tinyint(1) DEFAULT NULL,
  `DATA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATA_ED` datetime DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `TB_COMENTARIO`;
CREATE TABLE `TB_COMENTARIO` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `COM_NOME` varchar(255) NOT NULL,
  `COM_COMENTARIO` varchar(255) NOT NULL,
  `ID_NOT` int(11) NOT NULL,
  FOREIGN KEY (ID_NOT) REFERENCES TB_NOTICIAS(ID_NOT)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;