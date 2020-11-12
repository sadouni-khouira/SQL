-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/* REQUETTES*/
-- Listage de la structure de la table bddexercice1. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `num_f` int(8) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `ville` varchar(40) NOT NULL DEFAULT 'LYON',
  PRIMARY KEY (`num_f`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table bddexercice1.fournisseur : ~2 rows (environ)
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` (`num_f`, `nom`, `ville`) VALUES
	(3, 'alfred1', 'GRASSE'),
	(6, 'CHARLY', 'GRASSE'),
	(9, 'HIND', 'LYON');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;

-- Listage de la structure de la table bddexercice1. fournitures
CREATE TABLE IF NOT EXISTS `fournitures` (
  `num_f` int(8) NOT NULL,
  `code_p` int(8) NOT NULL,
  `quantite` int(8) NOT NULL,
  PRIMARY KEY (`num_f`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table bddexercice1.fournitures : ~4 rows (environ)
/*!40000 ALTER TABLE `fournitures` DISABLE KEYS */;
INSERT INTO `fournitures` (`num_f`, `code_p`, `quantite`) VALUES
	(10, 201, 5),
	(20, 321, 6),
	(30, 524, 10),
	(40, 584, 11);
/*!40000 ALTER TABLE `fournitures` ENABLE KEYS */;

-- Listage de la structure de la table bddexercice1. produits
CREATE TABLE IF NOT EXISTS `produits` (
  `code_p` int(8) NOT NULL,
  `libelle` varchar(40) NOT NULL,
  `originr` varchar(40) NOT NULL,
  `couleur` varchar(40) NOT NULL DEFAULT 'rouge',
  PRIMARY KEY (`code_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table bddexercice1.produits : ~0 rows (environ)
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` (`code_p`, `libelle`, `originr`, `couleur`) VALUES
	(2, 'abc', 'def', 'noir\r\n'),
	(4, 'ghi', 'jkl', 'bleu'),
	(6, 'mno', 'pqr', 'rouge'),
	(8, 'stu', 'vwx', 'rouge');
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
