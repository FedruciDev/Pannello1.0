# ************************************************************
# Sequel Ace SQL dump
# Version 20062
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.30)
# Database: Portale
# Generation Time: 2023-11-28 16:22:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Permission`;

CREATE TABLE `Permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `model` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `read` tinyint(1) NOT NULL,
  `write` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Role_fk` (`role`),
  CONSTRAINT `Role_fk` FOREIGN KEY (`role`) REFERENCES `Roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;

INSERT INTO `Permission` (`id`, `role`, `model`, `read`, `write`)
VALUES
	(1,1,'User',1,1),
	(2,1,'Role',1,1),
	(3,1,'Routes',1,1),
	(4,1,'Permission',1,1),
	(5,2,'User',1,1),
	(6,2,'Role',1,1),
	(7,2,'Routes',1,1),
	(8,2,'Permission',1,1);

/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Roles`;

CREATE TABLE `Roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(222) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;

INSERT INTO `Roles` (`id`, `name`)
VALUES
	(1,'Amministratore'),
	(2,'User');

/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Routes`;

CREATE TABLE `Routes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `allowed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_fk_fk` (`role`),
  CONSTRAINT `role_fk_fk` FOREIGN KEY (`role`) REFERENCES `Roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Routes` WRITE;
/*!40000 ALTER TABLE `Routes` DISABLE KEYS */;

INSERT INTO `Routes` (`id`, `role`, `path`, `allowed`)
VALUES
	(3,1,'/',1),
	(4,1,'/product',1),
	(6,1,'/security/users',1),
	(7,1,'/security/roles',1),
	(8,2,'/',1),
	(9,2,'/product',1),
	(10,2,'/security/users',1),
	(11,2,'/security/roles',1);

/*!40000 ALTER TABLE `Routes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkroles` (`role`),
  CONSTRAINT `fkroles` FOREIGN KEY (`role`) REFERENCES `Roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`id`, `email`, `password`, `username`, `role`)
VALUES
	(3,'federico@gmail.com','1q2w3e4r1q2w3e4r','Federico',1),
	(9,'user@user.it','1q2w3e4r1q2w3e4r','User',2);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
