-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 17 mars 2020 à 19:58
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
-- Base de données :  `corazon`
--

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
CREATE TABLE IF NOT EXISTS `joueurs` (
  `id` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `steam` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `live` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbox` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ban` int(10) NOT NULL DEFAULT 0,
  `firstConnection` int(11) NOT NULL DEFAULT 1,
  `charID` int(11) DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`id`, `license`, `steam`, `live`, `xbox`, `discord`, `ban`, `firstConnection`, `charID`) VALUES
(NULL, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, NULL, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d1_perso`
--

DROP TABLE IF EXISTS `joueurs_d1_perso`;
CREATE TABLE IF NOT EXISTS `joueurs_d1_perso` (
  `license` varchar(50) NOT NULL,
  `dataPed` longtext DEFAULT NULL,
  `dataSkin` longtext DEFAULT NULL,
  `pEspece` int(11) NOT NULL DEFAULT 1000,
  `pBanque` int(11) NOT NULL DEFAULT 500,
  `pSale` int(11) NOT NULL DEFAULT 0,
  `pJob` varchar(50) DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLieu` varchar(100) DEFAULT NULL,
  `iJour` int(11) DEFAULT NULL,
  `iMois` varchar(50) DEFAULT NULL,
  `iAnnée` int(11) DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT 0,
  `ipCamion` int(11) NOT NULL DEFAULT 0,
  `ipVoiture` int(11) NOT NULL DEFAULT 0,
  `ipMoto` int(11) NOT NULL DEFAULT 0,
  `fNom` varchar(50) DEFAULT NULL,
  `fLieu` varchar(100) DEFAULT NULL,
  `fJour` int(11) DEFAULT NULL,
  `fMois` varchar(50) DEFAULT NULL,
  `fAnnée` int(11) DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT 0,
  `fpCamion` int(11) NOT NULL DEFAULT 0,
  `fpVoiture` int(11) NOT NULL DEFAULT 0,
  `fpMoto` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueurs_d1_perso`
--

INSERT INTO `joueurs_d1_perso` (`license`, `dataPed`, `dataSkin`, `pEspece`, `pBanque`, `pSale`, `pJob`, `sPerm`, `iNom`, `iLieu`, `iJour`, `iMois`, `iAnnée`, `ipArme`, `ipCamion`, `ipVoiture`, `ipMoto`, `fNom`, `fLieu`, `fJour`, `fMois`, `fAnnée`, `fJob`, `fpArme`, `fpCamion`, `fpVoiture`, `fpMoto`) VALUES
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, '{\"eyebrows_1\":1,\"watches_1\":-1,\"shoes_2\":0,\"moles_2\":1,\"arms\":0,\"sex\":0,\"beard_3\":7,\"pants_1\":0,\"ears_1\":-1,\"ears_2\":-1,\"chain_1\":0,\"complexion_2\":1,\"chain_2\":0,\"skin\":4,\"helmet_2\":-1,\"torso_2\":0,\"hair_1\":6,\"glasses_2\":0,\"glasses_1\":0,\"hair_color_1\":7,\"beard_1\":1,\"tshirt_1\":0,\"watches_2\":-1,\"pants_2\":0,\"helmet_1\":-1,\"hair_color_2\":7,\"eye_color\":2,\"hair_2\":0,\"shoes_1\":0,\"face\":3,\"beard_4\":7,\"tshirt_2\":0,\"arms_2\":0,\"torso_1\":0}', 1000, 500, 0, NULL, NULL, 'Corazon', 'Los Santos', 28, 'Septembre', 2006, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d2_perso`
--

DROP TABLE IF EXISTS `joueurs_d2_perso`;
CREATE TABLE IF NOT EXISTS `joueurs_d2_perso` (
  `license` varchar(50) NOT NULL,
  `dataPed` longtext DEFAULT NULL,
  `dataSkin` longtext DEFAULT NULL,
  `pEspece` int(11) NOT NULL DEFAULT 1000,
  `pBanque` int(11) NOT NULL DEFAULT 500,
  `pSale` int(11) NOT NULL DEFAULT 0,
  `pJob` varchar(50) DEFAULT NULL,
  `sPerm` varchar(50) DEFAULT NULL,
  `iNom` varchar(50) DEFAULT NULL,
  `iLieu` varchar(100) DEFAULT NULL,
  `iJour` int(11) DEFAULT NULL,
  `iMois` varchar(50) DEFAULT NULL,
  `iAnnée` int(11) DEFAULT NULL,
  `ipArme` int(11) NOT NULL DEFAULT 0,
  `ipCamion` int(11) NOT NULL DEFAULT 0,
  `ipVoiture` int(11) NOT NULL DEFAULT 0,
  `ipMoto` int(11) NOT NULL DEFAULT 0,
  `fNom` varchar(50) DEFAULT NULL,
  `fLieu` varchar(100) DEFAULT NULL,
  `fJour` int(11) DEFAULT NULL,
  `fMois` varchar(50) DEFAULT NULL,
  `fAnnée` int(11) DEFAULT NULL,
  `fJob` varchar(50) DEFAULT NULL,
  `fpArme` int(11) NOT NULL DEFAULT 0,
  `fpCamion` int(11) NOT NULL DEFAULT 0,
  `fpVoiture` int(11) NOT NULL DEFAULT 0,
  `fpMoto` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `joueurs_d2_perso`
--

INSERT INTO `joueurs_d2_perso` (`license`, `dataPed`, `dataSkin`, `pEspece`, `pBanque`, `pSale`, `pJob`, `sPerm`, `iNom`, `iLieu`, `iJour`, `iMois`, `iAnnée`, `ipArme`, `ipCamion`, `ipVoiture`, `ipMoto`, `fNom`, `fLieu`, `fJour`, `fMois`, `fAnnée`, `fJob`, `fpArme`, `fpCamion`, `fpVoiture`, `fpMoto`) VALUES
('license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, 1000, 500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
