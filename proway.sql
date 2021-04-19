-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Abr-2021 às 21:48
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `proway`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`, `state`) VALUES
(1, 'Cidade A', 'Noroeste', 1),
(2, 'Cidade B', 'Sudoeste', 1),
(3, 'Cidade C', 'Norte', 1),
(4, 'Cidade D', 'Sudeste', 1),
(6, 'Cidade E', 'Sul', 1),
(7, 'Cidade F', 'Noroeste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotels`
--

CREATE TABLE `hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `classify` int(11) DEFAULT NULL,
  `slots` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `has_academy` tinyint(1) DEFAULT NULL,
  `has_pool` tinyint(1) DEFAULT NULL,
  `has_breakfast` tinyint(1) DEFAULT NULL,
  `city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `classify`, `slots`, `price`, `has_academy`, `has_pool`, `has_breakfast`, `city`) VALUES
(1, 'hutson', 2, 3, 2, 1, 1, 1, 1),
(2, 'varginha', 4, 1, 0.5, 0, 0, 0, 7),
(3, 'sacolao', 5, 10, 1.99, 0, 1, 0, 3),
(4, 'blablabla', 5, 4, 567, 1, 1, 1, 1),
(5, 'jdwwdawd', 4, 4, 567, 1, 1, 1, 1),
(6, 'sefsef', 4, 4, 567, 1, 1, 1, 1),
(7, 'awdasdsf', 2, 4, 567, 1, 1, 1, 1),
(8, 'blablasdgdrgbla', 1, 4, 567, 1, 1, 1, 1),
(9, 'sfedgvdsg', 4, 4, 567, 1, 1, 1, 1),
(10, 'sefesfdsfef', 2, 4, 567, 1, 1, 1, 1),
(11, 'sdfse', 1, 4, 567, 1, 1, 1, 1),
(12, 'sefsefesf', 1, 4, 567, 1, 1, 1, 1),
(13, 'blablabla', 4, 4, 567, 1, 1, 1, 1),
(14, 'blablabla', 4, 4, 567, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(1, 'Estado A'),
(2, 'Estado B');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_FK` (`state`);

--
-- Índices para tabela `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotels_FK` (`city`);

--
-- Índices para tabela `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_FK` FOREIGN KEY (`state`) REFERENCES `states` (`id`);

--
-- Limitadores para a tabela `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_FK` FOREIGN KEY (`city`) REFERENCES `cities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
