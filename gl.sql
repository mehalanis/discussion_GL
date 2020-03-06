-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 09 fév. 2020 à 23:48
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.1.26

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

drop trigger if exists Trigger_1;

CREATE TABLE `bug` (
  `id_bug` int(11) NOT NULL,
  `id_rapport` int(11) DEFAULT NULL,
  `id_probleme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bug`
--

INSERT INTO `bug` (`id_bug`, `id_rapport`, `id_probleme`) VALUES
(1, 3, 2),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `discussion`
--

CREATE TABLE `discussion` (
  `id_discussion` int(11) NOT NULL,
  `id_joueur_1` int(11) NOT NULL,
  `id_joueur_2` int(11) NOT NULL,
  `id_message` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discussion`
--

INSERT INTO `discussion` (`id_discussion`, `id_joueur_1`, `id_joueur_2`, `id_message`) VALUES
(1, 2, 1, 17),
(2, 2, 1, NULL),
(3, 2, 1, NULL),
(4, 2, 1, NULL),
(5, 2, 1, NULL),
(6, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `sender` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `guild`
--

CREATE TABLE `guild` (
  `ID_Guild` int(11) NOT NULL,
  `Nom_Guild` varchar(25) DEFAULT NULL,
  `For_ce_Guild` int(11) DEFAULT NULL,
  `ID_Mond` int(11) DEFAULT NULL,
  `Members` text,
  `Admin` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `id_joueur` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `Point` int(11) NOT NULL DEFAULT 0,
 `ID_Guild` int(11) DEFAULT NULL,
  `friends` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`id_joueur`, `username`, `password`, `friends`) VALUES
(1, 'test1', '1', 'a:1:{i:0;s:1:\"2\";}'),
(2, 'test2', '2', 'a:1:{i:0;s:1:\"1\";}'),
(3, 'test3', '3', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int(11) NOT NULL,
  `id_joueur` int(11) DEFAULT NULL,
  `id_discussion` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `time_send` datetime DEFAULT NULL,
  `time_vu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id_message`, `id_joueur`, `id_discussion`, `message`, `time_send`, `time_vu`) VALUES
(1, 1, 1, 'test1 to test2', '2020-02-09 22:50:14', NULL),
(2, 2, 1, 'test1 to test2t', '2020-02-09 22:50:18', NULL),
(3, 2, 1, 'm', '2020-02-09 23:42:25', NULL),
(4, 1, 1, 'm', '2020-02-09 23:42:57', NULL),
(5, 1, 1, 'anis', '2020-02-09 23:43:05', NULL),
(6, 2, 1, 'ok', '2020-02-09 23:43:08', NULL),
(7, 2, 1, 'o', '2020-02-09 23:43:22', NULL),
(8, 1, 1, 'd', '2020-02-09 23:43:29', NULL),
(9, 2, 1, 'e', '2020-02-09 23:43:37', NULL),
(10, 1, 1, 'anis', '2020-02-09 23:45:14', NULL),
(11, 2, 1, 'm', '2020-02-09 23:45:21', NULL),
(12, 1, 1, 'ok', '2020-02-09 23:45:26', NULL),
(13, 2, 1, 'ac', '2020-02-09 23:45:57', NULL),
(14, 1, 1, 'anis', '2020-02-09 23:46:01', NULL),
(15, 2, 1, 'o', '2020-02-09 23:46:06', NULL),
(16, 1, 1, 'anis', '2020-02-09 23:46:11', NULL),
(17, 2, 1, 'm', '2020-02-09 23:46:16', NULL);

--
-- Déclencheurs `message`
--
DELIMITER $$
CREATE TRIGGER `before_insert_message` AFTER INSERT ON `message` FOR EACH ROW BEGIN
   UPDATE `discussion` SET  `id_message`=NEW.id_message WHERE id_discussion=NEW.id_discussion;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `probleme`
--

CREATE TABLE `probleme` (
  `id_probleme` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `probleme`
--

INSERT INTO `probleme` (`id_probleme`, `nom`) VALUES
(1, 'Erreurs sur la carte'),
(2, 'Déplacements anormaux'),
(3, 'Erreur d\'affichage de la mini-carte');

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `id_rapport` int(11) NOT NULL,
  `id_joueur` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rapport`
--

INSERT INTO `rapport` (`id_rapport`, `id_joueur`, `description`, `date_send`) VALUES
(1, 1, 'anis', '2020-02-09 19:14:45'),
(2, 1, 'gfdsq', '2020-02-09 19:15:31'),
(3, 1, 'anis', '2020-02-09 19:43:56'),
(4, 1, 'anus', '2020-02-09 21:27:02'),
(5, 1, 'sdfgfdsh', '2020-02-09 21:27:36');

-- --------------------------------------------------------

--
-- Structure de la table `signal_`
--

CREATE TABLE `signal_` (
  `id_signal` int(11) NOT NULL,
  `id_joueur_signal` int(11) DEFAULT NULL,
  `id_rapport` int(11) DEFAULT NULL,
  `id_sprobleme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `signal_`
--

INSERT INTO `signal_` (`id_signal`, `id_joueur_signal`, `id_rapport`, `id_sprobleme`) VALUES
(1, 1, 2, 2),
(2, 2, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `sprobleme`
--

CREATE TABLE `sprobleme` (
  `id_sprobleme` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sprobleme`
--

INSERT INTO `sprobleme` (`id_sprobleme`, `nom`) VALUES
(1, 'Violence'),
(2, 'Vol ou vandalisme'),
(3, 'NuditÃ© ou contenu Ã  caractÃ¨re sexuel');

-- --------------------------------------------------------

--
-- Structure de la table `suspendre`
--

CREATE TABLE `suspendre` (
  `id_suspendre` int(11) NOT NULL,
  `id_signal` int(11) DEFAULT NULL,
  `id_joueur` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `suspendre`
--

INSERT INTO `suspendre` (`id_suspendre`, `id_signal`, `id_joueur`, `date_debut`, `date_fin`) VALUES
(1, 2, 2, '2020-02-09', '0000-00-00'),
(2, 1, 1, '2020-02-09', '0000-00-00'),
(3, 1, 1, '2020-02-09', '0000-00-00'),
(4, 1, 1, '2020-02-09', '0000-00-00'),
(5, 1, 1, '2020-02-09', '0000-00-00'),
(6, 2, 2, '2020-02-09', '0000-00-00'),
(7, 2, 2, '2020-02-09', '2020-03-10');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bug`
--
ALTER TABLE `bug`
  ADD PRIMARY KEY (`id_bug`),
  ADD KEY `FK_Reference_10` (`id_probleme`),
  ADD KEY `FK_Reference_7` (`id_rapport`);

--
-- Index pour la table `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`id_discussion`),
  ADD KEY `FK_Reference_3` (`id_joueur_1`),
  ADD KEY `FK_Reference_4` (`id_joueur_2`),
  ADD KEY `FK_Reference_5` (`id_message`);

--
-- Index pour la table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `guild`
--
ALTER TABLE `guild`
  ADD PRIMARY KEY (`ID_Guild`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`id_joueur`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `FK_Reference_1` (`id_joueur`),
  ADD KEY `FK_Reference_13` (`id_discussion`);

--
-- Index pour la table `probleme`
--
ALTER TABLE `probleme`
  ADD PRIMARY KEY (`id_probleme`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`id_rapport`),
  ADD KEY `FK_Reference_6` (`id_joueur`);

--
-- Index pour la table `signal_`
--
ALTER TABLE `signal_`
  ADD PRIMARY KEY (`id_signal`),
  ADD KEY `FK_Reference_14` (`id_sprobleme`),
  ADD KEY `FK_Reference_8` (`id_joueur_signal`),
  ADD KEY `FK_Reference_9` (`id_rapport`);

--
-- Index pour la table `sprobleme`
--
ALTER TABLE `sprobleme`
  ADD PRIMARY KEY (`id_sprobleme`);

--
-- Index pour la table `suspendre`
--
ALTER TABLE `suspendre`
  ADD PRIMARY KEY (`id_suspendre`),
  ADD KEY `FK_Reference_11` (`id_signal`),
  ADD KEY `FK_Reference_12` (`id_joueur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bug`
--
ALTER TABLE `bug`
  MODIFY `id_bug` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `discussion`
--
ALTER TABLE `discussion`
  MODIFY `id_discussion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `guild`
--
ALTER TABLE `guild`
  MODIFY `ID_Guild` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `id_joueur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `probleme`
--
ALTER TABLE `probleme`
  MODIFY `id_probleme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rapport`
--
ALTER TABLE `rapport`
  MODIFY `id_rapport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `signal_`
--
ALTER TABLE `signal_`
  MODIFY `id_signal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sprobleme`
--
ALTER TABLE `sprobleme`
  MODIFY `id_sprobleme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `suspendre`
--
ALTER TABLE `suspendre`
  MODIFY `id_suspendre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bug`
--
ALTER TABLE `bug`
  ADD CONSTRAINT `FK_Reference_10` FOREIGN KEY (`id_probleme`) REFERENCES `probleme` (`id_probleme`),
  ADD CONSTRAINT `FK_Reference_7` FOREIGN KEY (`id_rapport`) REFERENCES `rapport` (`id_rapport`);

--
-- Contraintes pour la table `discussion`
--
ALTER TABLE `discussion`
  ADD CONSTRAINT `FK_Reference_3` FOREIGN KEY (`id_joueur_1`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_Reference_4` FOREIGN KEY (`id_joueur_2`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_Reference_5` FOREIGN KEY (`id_message`) REFERENCES `message` (`id_message`) ON DELETE SET NULL;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_Reference_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_Reference_13` FOREIGN KEY (`id_discussion`) REFERENCES `discussion` (`id_discussion`);

--
-- Contraintes pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD CONSTRAINT `FK_Reference_6` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`);

--
-- Contraintes pour la table `signal_`
--
ALTER TABLE `signal_`
  ADD CONSTRAINT `FK_Reference_14` FOREIGN KEY (`id_sprobleme`) REFERENCES `sprobleme` (`id_sprobleme`),
  ADD CONSTRAINT `FK_Reference_8` FOREIGN KEY (`id_joueur_signal`) REFERENCES `joueur` (`id_joueur`),
  ADD CONSTRAINT `FK_Reference_9` FOREIGN KEY (`id_rapport`) REFERENCES `rapport` (`id_rapport`);

--
-- Contraintes pour la table `suspendre`
--
ALTER TABLE `suspendre`
  ADD CONSTRAINT `FK_Reference_11` FOREIGN KEY (`id_signal`) REFERENCES `signal_` (`id_signal`),
  ADD CONSTRAINT `FK_Reference_12` FOREIGN KEY (`id_joueur`) REFERENCES `joueur` (`id_joueur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
