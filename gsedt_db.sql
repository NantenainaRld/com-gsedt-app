-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 24, 2026 at 09:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsedt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `COURS`
--

CREATE TABLE `COURS` (
  `id_cours` int(11) NOT NULL,
  `code_cours` varchar(8) DEFAULT NULL COMMENT 'ex: CR2610000',
  `etat_cours` enum('confirmé','en attente','annulé') NOT NULL,
  `date_cours` datetime NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `fkc_id_niveau` int(11) NOT NULL,
  `fkc_id_utilisateur` int(11) DEFAULT NULL,
  `fkc_id_matiere` int(11) NOT NULL,
  `fkc_id_salle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GROUPE`
--

CREATE TABLE `GROUPE` (
  `id_groupe` int(11) NOT NULL,
  `nom_groupe` varchar(25) NOT NULL,
  `fkg_id_niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `G_COURS`
--

CREATE TABLE `G_COURS` (
  `id_gcours` int(11) NOT NULL,
  `fkgc_id_groupe` int(11) NOT NULL,
  `fkgc_id_cours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MATIERE`
--

CREATE TABLE `MATIERE` (
  `id_matiere` int(11) NOT NULL,
  `code_matiere` varchar(6) DEFAULT NULL COMMENT 'ex: M26100',
  `nom_matiere` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NIVEAU`
--

CREATE TABLE `NIVEAU` (
  `id_niveau` int(11) NOT NULL,
  `niveau` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SALLE`
--

CREATE TABLE `SALLE` (
  `id_salle` int(11) NOT NULL,
  `nom_salle` int(50) NOT NULL,
  `capacite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `id_utilisateur` int(11) NOT NULL,
  `code_utilisateur` varchar(8) DEFAULT NULL COMMENT 'ex: U2610000',
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mdp` varchar(255) NOT NULL,
  `matricule` varchar(8) DEFAULT NULL,
  `type` enum('admin','enseignant','etudiant') NOT NULL DEFAULT 'etudiant',
  `email` varchar(100) NOT NULL,
  `sexe` enum('m','f') NOT NULL DEFAULT 'm',
  `mdp_oublie` varchar(255) DEFAULT NULL,
  `date_mdp_oublie` datetime DEFAULT NULL COMMENT '<= 15 minutes',
  `etat_compte` enum('en attente','approuvé','rejeté') NOT NULL DEFAULT 'en attente',
  `fku_id_groupe` int(11) DEFAULT NULL,
  `fku_id_niveau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `U_MATIERE`
--

CREATE TABLE `U_MATIERE` (
  `id_umatiere` int(11) NOT NULL,
  `fkum_id_utilisateur` int(11) NOT NULL,
  `fkum_id_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `COURS`
--
ALTER TABLE `COURS`
  ADD PRIMARY KEY (`id_cours`),
  ADD KEY `fkc_id_niveau` (`fkc_id_niveau`),
  ADD KEY `fkc_id_matiere` (`fkc_id_matiere`),
  ADD KEY `fkc_id_utilisateur` (`fkc_id_utilisateur`),
  ADD KEY `fkc_id_salle` (`fkc_id_salle`);

--
-- Indexes for table `GROUPE`
--
ALTER TABLE `GROUPE`
  ADD PRIMARY KEY (`id_groupe`),
  ADD KEY `fkg_id_niveau` (`fkg_id_niveau`);

--
-- Indexes for table `G_COURS`
--
ALTER TABLE `G_COURS`
  ADD PRIMARY KEY (`id_gcours`),
  ADD KEY `fkgc_id_groupe` (`fkgc_id_groupe`),
  ADD KEY `fkgc_id_cours` (`fkgc_id_cours`);

--
-- Indexes for table `MATIERE`
--
ALTER TABLE `MATIERE`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Indexes for table `NIVEAU`
--
ALTER TABLE `NIVEAU`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Indexes for table `SALLE`
--
ALTER TABLE `SALLE`
  ADD PRIMARY KEY (`id_salle`);

--
-- Indexes for table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email_utilisateur` (`email`),
  ADD KEY `fku_id_niveau` (`fku_id_niveau`),
  ADD KEY `fku_id_groupe` (`fku_id_groupe`);

--
-- Indexes for table `U_MATIERE`
--
ALTER TABLE `U_MATIERE`
  ADD PRIMARY KEY (`id_umatiere`),
  ADD KEY `fkum_id_utilisateur` (`fkum_id_utilisateur`),
  ADD KEY `fkum_id_matiere` (`fkum_id_matiere`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `COURS`
--
ALTER TABLE `COURS`
  MODIFY `id_cours` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GROUPE`
--
ALTER TABLE `GROUPE`
  MODIFY `id_groupe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `G_COURS`
--
ALTER TABLE `G_COURS`
  MODIFY `id_gcours` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MATIERE`
--
ALTER TABLE `MATIERE`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `NIVEAU`
--
ALTER TABLE `NIVEAU`
  MODIFY `id_niveau` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SALLE`
--
ALTER TABLE `SALLE`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `U_MATIERE`
--
ALTER TABLE `U_MATIERE`
  MODIFY `id_umatiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `COURS`
--
ALTER TABLE `COURS`
  ADD CONSTRAINT `fkc_id_matiere` FOREIGN KEY (`fkc_id_matiere`) REFERENCES `MATIERE` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkc_id_niveau` FOREIGN KEY (`fkc_id_niveau`) REFERENCES `NIVEAU` (`id_niveau`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkc_id_salle` FOREIGN KEY (`fkc_id_salle`) REFERENCES `SALLE` (`id_salle`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fkc_id_utilisateur` FOREIGN KEY (`fkc_id_utilisateur`) REFERENCES `UTILISATEUR` (`id_utilisateur`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `GROUPE`
--
ALTER TABLE `GROUPE`
  ADD CONSTRAINT `fkg_id_niveau` FOREIGN KEY (`fkg_id_niveau`) REFERENCES `NIVEAU` (`id_niveau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `G_COURS`
--
ALTER TABLE `G_COURS`
  ADD CONSTRAINT `fkgc_id_cours` FOREIGN KEY (`fkgc_id_cours`) REFERENCES `COURS` (`id_cours`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkgc_id_groupe` FOREIGN KEY (`fkgc_id_groupe`) REFERENCES `GROUPE` (`id_groupe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD CONSTRAINT `fku_id_groupe` FOREIGN KEY (`fku_id_groupe`) REFERENCES `GROUPE` (`id_groupe`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fku_id_niveau` FOREIGN KEY (`fku_id_niveau`) REFERENCES `NIVEAU` (`id_niveau`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `U_MATIERE`
--
ALTER TABLE `U_MATIERE`
  ADD CONSTRAINT `fkum_id_matiere` FOREIGN KEY (`fkum_id_matiere`) REFERENCES `MATIERE` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkum_id_utilisateur` FOREIGN KEY (`fkum_id_utilisateur`) REFERENCES `UTILISATEUR` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
