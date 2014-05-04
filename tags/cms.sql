-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 04 Mai 2014 à 14:39
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `cms`
--
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cms`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `contenu` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `redacteur_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `redacteur_id` (`redacteur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `contenu`, `date`, `redacteur_id`) VALUES
(1, 'presse libre', '<p>Il faut se rendre à l''évidence qu''aucune société ne peut progresser \r\ndurablement vers le bien être des populations si elle ne garantit pas la\r\n liberté d''information. Ce n''est pas un fait du hasard si le premier \r\namendement à la Constitution des Etats Unis a consisté à interdire \r\nl''adoption de lois restreignant l''exercice de cette liberté.  \r\nAujourd''hui comme hier, les nations qui ont admis et mis en oeuvre  le \r\nprincipe de la liberté d''information et du droit d''accès à l''information\r\n sont les plus prospères ou du moins sont celles dont la prospérité \r\nrepose sur des fondements  solides.</p>\r\n\r\n<p>La liberté d''information donne du sens au droit au suffrage des \r\ncitoyens en ce que la presse par son action quotidienne peut contribuer à\r\n dénoncer les manquements graves aux principes de la bonne gouvernance.</p>\r\n\r\n<p>.</p>', '2014-05-04 14:10:30', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(200) NOT NULL,
  `contenu` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `pseudo`, `contenu`, `date`, `article_id`) VALUES
(2, 'alex', 'j aime bien votre article', '2014-05-04 14:33:28', 1);

-- --------------------------------------------------------

--
-- Structure de la table `redacteur`
--

CREATE TABLE IF NOT EXISTS `redacteur` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `motPasse` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profil` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `redacteur`
--

INSERT INTO `redacteur` (`id`, `nom`, `prenom`, `mail`, `motPasse`, `date`, `profil`) VALUES
(1, 'nagalo', 'alexis', 'nagalo@alexis.fr', 'esigelec', '2014-05-04 13:08:51', 'admin'),
(2, 'goyat', 'helene', 'goyat@helene.fr', 'UCYWU\\US', '2014-05-04 13:45:12', 'admin'),
(3, 'goyat', 'helene', 'g@h.fr', '12345', '2014-05-04 13:56:22', 'redacteur'),
(4, 'goyat', 'helene', 'g@h.fr', '12345', '2014-05-04 13:56:43', 'redacteur');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_id_redacteur` FOREIGN KEY (`redacteur_id`) REFERENCES `redacteur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `fk_commentaire` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
