-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 06 mars 2023 à 13:36
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dsfinalapi`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `idMessage` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`idMessage`, `content`) VALUES
(1, 'C\'est le message A');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `idPost` int(11) NOT NULL,
  `titre` text NOT NULL,
  `contenuPost` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`idPost`, `titre`, `contenuPost`) VALUES
(1, 'postA', 'contentPostA');

-- --------------------------------------------------------

--
-- Structure de la table `post_message`
--

CREATE TABLE `post_message` (
  `idPost` int(11) NOT NULL,
  `idMessage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUser` int(11) NOT NULL,
  `pseudo` text NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUser`, `pseudo`, `login`, `password`) VALUES
(1, 'PseudoA', 'LoginA', 'mdpA'),
(2, 'oui', 'non', 'oui'),
(3, 'undefined', 'undefined', 'undefined'),
(4, 'ouidz', 'nondz', 'ouiz'),
(5, 'ouidzz', 'nondzz', 'ouizdzd'),
(6, 'undefined', 'undefined', 'undefined'),
(7, 'undefined', 'undefined', 'undefined'),
(8, 'undefined', 'undefined', 'undefined'),
(9, 'undefined', 'undefined', 'undefined'),
(10, 'undefined', 'undefined', 'undefined'),
(11, 'undefined', 'undefined', 'undefined'),
(12, 'undefined', 'undefined', 'undefined'),
(13, 'undefined', 'undefined', 'undefined'),
(14, 'undefined', 'undefined', 'undefined'),
(15, 'bnv', 'vbnv', 'vbnv');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_post`
--

CREATE TABLE `utilisateur_post` (
  `idUser` int(11) NOT NULL,
  `idPost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`idMessage`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idPost`);

--
-- Index pour la table `post_message`
--
ALTER TABLE `post_message`
  ADD KEY `idMessage` (`idMessage`),
  ADD KEY `idPost` (`idPost`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- Index pour la table `utilisateur_post`
--
ALTER TABLE `utilisateur_post`
  ADD KEY `idPost` (`idPost`),
  ADD KEY `idUser` (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `idPost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post_message`
--
ALTER TABLE `post_message`
  ADD CONSTRAINT `post_message_ibfk_1` FOREIGN KEY (`idMessage`) REFERENCES `message` (`idMessage`),
  ADD CONSTRAINT `post_message_ibfk_2` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`);

--
-- Contraintes pour la table `utilisateur_post`
--
ALTER TABLE `utilisateur_post`
  ADD CONSTRAINT `utilisateur_post_ibfk_1` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`),
  ADD CONSTRAINT `utilisateur_post_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
