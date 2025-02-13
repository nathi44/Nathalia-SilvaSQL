-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/02/2025 às 21:13
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nathaliasilvajoin`
--
CREATE DATABASE IF NOT EXISTS `nathaliasilvajoin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nathaliasilvajoin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `branca`
--

CREATE TABLE `branca` (
  `peca` varchar(50) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `branca`
--

INSERT INTO `branca` (`peca`, `qtde`, `material`) VALUES
('Rei', 502, 'Carvalho'),
('Rainha', 398, 'Carvalho'),
('Torre', 1020, 'Carvalho'),
('Bispo', 985, 'Carvalho'),
('Cavaleiro', 950, 'Carvalho'),
('Peão', 431, 'Carvalho');

-- --------------------------------------------------------

--
-- Estrutura para tabela `preta`
--

CREATE TABLE `preta` (
  `peca` varchar(50) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `preta`
--

INSERT INTO `preta` (`peca`, `qtde`, `material`) VALUES
('Rei', 502, 'Ébano'),
('Rainha', 397, 'Ébano'),
('Torre', 1020, 'Ébano'),
('Bispo', 985, 'Ébano'),
('Cavaleiro', 950, 'Ébano'),
('Peão', 453, 'Ébano');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_a`
--

CREATE TABLE `tabela_a` (
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tabela_a`
--

INSERT INTO `tabela_a` (`nome`) VALUES
('Fernanda'),
('Josefa'),
('Luis'),
('Fernando');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_b`
--

CREATE TABLE `tabela_b` (
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tabela_b`
--

INSERT INTO `tabela_b` (`nome`) VALUES
('Carlos'),
('Manoel'),
('Luis'),
('Fernando');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
