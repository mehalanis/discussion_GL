-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 08 fév. 2020 à 19:07
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
-- Structure de la table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
CREATE TABLE IF NOT EXISTS `discussion` (
  `id_discussion` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur_1` int(11) DEFAULT NULL,
  `id_joueur_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_discussion`),
  KEY `FK_Reference_3` (`id_joueur_1`),
  KEY `FK_Reference_4` (`id_joueur_2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discussion`
--

INSERT INTO `discussion` (`id_discussion`, `id_joueur_1`, `id_joueur_2`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE IF NOT EXISTS `friend_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `friend_requests_ibfk_1` (`sender`),
  KEY `friend_requests_ibfk_2` (`recipient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `sender`, `recipient`) VALUES
(4, 4, 1),
(5, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `id_joueur` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_joueur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`id_joueur`, `username`, `password`) VALUES
(1, 'test1', 'test1'),
(2, 'test2', 'test2'),
(3, 'mehdi', 'mehdi'),
(4, 'anis', 'anis');

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `friends` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `members`
--

INSERT INTO `members` (`id`, `username`, `friends`) VALUES
(1, 'test1', 'a:2:{i:0;s:1:\"3\";i:1;s:1:\"2\";}'),
(2, 'test2', 'a:1:{i:0;s:1:\"1\";}'),
(3, 'mehdi', 'a:1:{i:0;s:1:\"1\";}'),
(4, 'anis', '');

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
  KEY `FK_Reference_2` (`id_discussion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id_message`, `id_joueur`, `id_discussion`, `message`, `time_send`, `time_vu`) VALUES
(1, 1, 1, 'slt cv', '2020-02-05 00:00:00', NULL),
(2, 2, 1, 'cv bien', '2020-02-05 00:00:00', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `discussion`
--
ALTER TABLE `discussion`
  ADD CONSTRAINT `FK_Reference_3` FOREIGN KEY (`id_joueur_1`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_Reference_4` FOREIGN KEY (`id_joueur_2`) REFERENCES `joueur` (`id_joueur`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_Reference_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_Reference_2` FOREIGN KEY (`id_discussion`) REFERENCES `discussion` (`id_discussion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
