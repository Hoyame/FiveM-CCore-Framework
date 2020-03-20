-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 20 mars 2020 à 23:03
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


-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d1_perso`
--

DROP TABLE IF EXISTS `joueurs_d1_perso`;
CREATE TABLE IF NOT EXISTS `joueurs_d1_perso` (
  `license` varchar(50) NOT NULL,
  `lastPos` longtext DEFAULT NULL,
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
-- --------------------------------------------------------

--
-- Structure de la table `joueurs_d2_perso`
--

DROP TABLE IF EXISTS `joueurs_d2_perso`;
CREATE TABLE IF NOT EXISTS `joueurs_d2_perso` (
  `license` varchar(50) NOT NULL,
  `lastPos` longtext DEFAULT NULL,
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
