-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 09 fév. 2020 à 12:47
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gl`
--

-- --------------------------------------------------------

--
-- Structure de la table `bug`
--

DROP TABLE IF EXISTS `bug`;
CREATE TABLE IF NOT EXISTS `bug` (
  `id_bug` int(11) NOT NULL AUTO_INCREMENT,
  `id_rapport` int(11) DEFAULT NULL,
  `id_probleme` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bug`),
  KEY `FK_Reference_10` (`id_probleme`),
  KEY `FK_Reference_7` (`id_rapport`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
CREATE TABLE IF NOT EXISTS `discussion` (
  `id_discussion` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur_1` int(11) NOT NULL,
  `id_joueur_2` int(11) NOT NULL,
  `id_message` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_discussion`),
  KEY `FK_Reference_3` (`id_joueur_1`),
  KEY `FK_Reference_4` (`id_joueur_2`),
  KEY `FK_Reference_5` (`id_message`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE IF NOT EXISTS `friend_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `sender`, `recipient`) VALUES
(8, 4, 1),
(9, 3, 1),
(10, 2, 1),
(11, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `guild`
--

DROP TABLE IF EXISTS `guild`;
CREATE TABLE IF NOT EXISTS `guild` (
  `ID_Guild` int(3) NOT NULL AUTO_INCREMENT,
  `Nom_Guild` varchar(15) NOT NULL,
  `For_ce_Guild` int(2) NOT NULL,
  `ID_Mond` int(2) NOT NULL,
  `Members` text NOT NULL,
  `Admin` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Guild`),
  KEY `ID_Mond` (`ID_Mond`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `guild`
--

INSERT INTO `guild` (`ID_Guild`, `Nom_Guild`, `For_ce_Guild`, `ID_Mond`, `Members`, `Admin`) VALUES
(1, 'Heroes', 300, 1, 'a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}	', '1');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `id_joueur` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `friends` text DEFAULT NULL,
  `Point` int(11) NOT NULL DEFAULT 0,
  `ID_Guild` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_joueur`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`id_joueur`, `username`, `password`, `friends`, `Point`, `ID_Guild`) VALUES
(1, 'anis', 'anis', '', 200, 1),
(2, 'mehdi', 'mehdi', '', 150, 1),
(3, 'malek', 'malek', '', 50, 1),
(4, 'abdou', 'abdou', '', 0, NULL),
(5, 'mounir', 'mounir', NULL, 0, NULL),
(6, 'sofiane', 'sofiane', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur` int(11) DEFAULT NULL,
  `id_discussion` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `time_send` datetime DEFAULT NULL,
  `time_vu` datetime DEFAULT NULL,
  PRIMARY KEY (`id_message`),
  KEY `FK_Reference_1` (`id_joueur`),
  KEY `FK_Reference_13` (`id_discussion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `probleme`
--

DROP TABLE IF EXISTS `probleme`;
CREATE TABLE IF NOT EXISTS `probleme` (
  `id_probleme` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_probleme`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

DROP TABLE IF EXISTS `rapport`;
CREATE TABLE IF NOT EXISTS `rapport` (
  `id_rapport` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rapport`),
  KEY `FK_Reference_6` (`id_joueur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `signal_`
--

DROP TABLE IF EXISTS `signal_`;
CREATE TABLE IF NOT EXISTS `signal_` (
  `id_signal` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur_signal` int(11) DEFAULT NULL,
  `id_rapport` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_signal`),
  KEY `FK_Reference_8` (`id_joueur_signal`),
  KEY `FK_Reference_9` (`id_rapport`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `suspendre`
--

DROP TABLE IF EXISTS `suspendre`;
CREATE TABLE IF NOT EXISTS `suspendre` (
  `id_suspendre` int(11) NOT NULL AUTO_INCREMENT,
  `id_signal` int(11) DEFAULT NULL,
  `id_joueur` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id_suspendre`),
  KEY `FK_Reference_11` (`id_signal`),
  KEY `FK_Reference_12` (`id_joueur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
