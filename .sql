-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/02/2025 às 21:09
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sa_estoquesuplementos`
--
DROP DATABASE IF EXISTS `sa_estoquesuplementos`;
CREATE DATABASE IF NOT EXISTS `sa_estoquesuplementos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sa_estoquesuplementos`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `mySp_fornecedorInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_fornecedorInsert` (`v_nome_fornecedor` VARCHAR(50), `v_telefone_fornecedor` VARCHAR(20), `v_endereco` VARCHAR(50), `v_avaliacao` DECIMAL(10,1))   BEGIN
IF ((v_nome_fornecedor != '') && (v_telefone_fornecedor != '') && (v_telefone_fornecedor != '') && (v_endereco!= '') && (v_avaliacao!= '')) THEN
INSERT INTO fornecedor
(nome_fornecedor,telefone_fornecedor,endereco,avaliacao)
VALUES
(v_nome_fornecedor,v_telefone_fornecedor,v_endereco,v_avaliacao);
ELSE
SELECT 'NOME, TELEFONE , ENDEREÇO e AVALIAÇÃO devem ser fornecidos para o cadastro!'
AS Msg;
END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_funcionarioUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_funcionarioUpdate` (`v_id_funcionario` INT, `v_nome_funcionario` VARCHAR(50), `v_salario_funcionario` DECIMAL(10,2), `v_taxa_comissao` CHAR(2), `v_telefone_funcionario` VARCHAR(20))   BEGIN
IF (((v_id_funcionario > 0) && (v_id_funcionario != '') ) && (v_nome_funcionario != '') &&
(v_salario_funcionario != '') && (v_taxa_comissao != '') &&
(v_telefone_funcionario != '')) THEN
UPDATE funcionario SET nome_funcionario =v_nome_funcionario,
salario_funcionario =v_salario_funcionario,
taxa_comissao =v_taxa_comissao,
telefone_funcionario =v_telefone_funcionario
WHERE id_funcionario =v_id_funcionario;
ELSE
SELECT 'O novos NOME, Salario, Taxa Comissão e Telefone devem ser informados!'
AS Msg;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o id do cliente',
  `nome_cliente` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar o nome do cliente',
  `cpf_cliente` varchar(14) NOT NULL COMMENT 'Este campo é responsável por armazenar o cpf do cliente',
  `telefone_cliente` varchar(20) NOT NULL COMMENT 'Este campo é responsável por armazenar o telefone do cliente',
  `endereco` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar o endereço do funcionário'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `cpf_cliente`, `telefone_cliente`, `endereco`) VALUES
(1, 'Ana Souza', '123.456.789-01', '(11) 99999-1234', 'Rua das Flores, 123'),
(2, 'Carlos Lima', '234.567.890-12', '(21) 98888-5678', 'Av. Paulista, 456'),
(3, 'Maria Oliveira', '345.678.901-23', '(31) 97777-3456', 'Rua do Sol, 789'),
(4, 'José Santos', '456.789.012-34', '(41) 96666-2345', 'Av. Brasil, 321'),
(5, 'Fernanda Costa', '567.890.123-45', '(51) 95555-6789', 'Rua Verde, 654'),
(6, 'Paulo Rocha', '678.901.234-56', '(61) 94444-7890', 'Rua Azul, 987'),
(7, 'Juliana Mendes', '789.012.345-67', '(71) 93333-1234', 'Av. Central, 111'),
(8, 'Roberto Nunes', '890.123.456-78', '(81) 92222-5678', 'Rua dos Pinheiros, 222'),
(9, 'Camila Ferreira', '901.234.567-89', '(91) 91111-3456', 'Travessa Alegre, 333'),
(10, 'Ricardo Almeida', '012.345.678-90', '(11) 90000-2345', 'Rua das Palmeiras, 444'),
(11, 'Lucas Martins', '123.987.654-32', '(21) 98877-1234', 'Av. Nova, 555'),
(12, 'Tatiane Silva', '234.876.543-21', '(31) 97766-5678', 'Rua da Paz, 666'),
(13, 'Cláudio Pereira', '345.765.432-10', '(41) 96655-3456', 'Rua do Campo, 777'),
(14, 'Larissa Lima', '456.654.321-09', '(51) 95544-2345', 'Av. Principal, 888'),
(15, 'Fernando Melo', '567.543.210-98', '(61) 94433-6789', 'Rua Bela Vista, 999'),
(16, 'Patrícia Torres', '678.432.109-87', '(71) 93322-7890', 'Rua Nova Era, 100'),
(17, 'Adriana Santos', '789.321.098-76', '(81) 92211-1234', 'Av. das Águas, 200'),
(18, 'Anderson Oliveira', '890.210.987-65', '(91) 91100-5678', 'Rua Jardim Botânico, 300'),
(19, 'Isabela Castro', '901.109.876-54', '(11) 90099-3456', 'Rua Bela Aliança, 400'),
(20, 'Thiago Souza', '012.098.765-43', '(21) 98888-2345', 'Rua da Liberdade, 500'),
(21, 'Carla Mendes', '123.087.654-32', '(31) 97777-1234', 'Rua Primavera, 600'),
(22, 'Felipe Gomes', '234.076.543-21', '(41) 96666-5678', 'Rua Esperança, 700'),
(23, 'Vanessa Lima', '345.065.432-10', '(51) 95555-3456', 'Av. do Sol, 800'),
(24, 'Diego Martins', '456.054.321-09', '(61) 94444-2345', 'Rua dos Girassóis, 900'),
(25, 'Juliana Lopes', '567.043.210-98', '(71) 93333-6789', 'Travessa dos Sonhos, 1000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o id do fornecedor',
  `nome_fornecedor` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar o nome do fornecedor',
  `telefone_fornecedor` varchar(20) NOT NULL COMMENT 'Este campo é responsável por armazenar o telefone do fornecedor',
  `endereco` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar o endereço do fornecedor',
  `avaliacao` decimal(10,1) NOT NULL COMMENT 'Este campo é responsável por armazenar a avaliação do fornecedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `nome_fornecedor`, `telefone_fornecedor`, `endereco`, `avaliacao`) VALUES
(1, 'Power Suplementos', '(11) 98765-4321', 'Rua Musculação, 100', 4.8),
(2, 'Nutri Force', '(21) 97654-3210', 'Av. Proteína, 200', 4.0),
(3, 'Top Whey Distribuidora', '(31) 96543-2109', 'Rua Creatina, 300', 4.7),
(4, 'VitaMax Suplementos', '(41) 95432-1098', 'Av. Saúde, 400', 3.0),
(5, 'Pro Fit Suplementos', '(51) 94321-0987', 'Rua Energia, 500', 4.4),
(6, 'John Suplements', '(47)98456-8789', 'Rua Carajas,140', 9.0),
(7, 'SuplementsLife', '(47)98456-2387', 'Rua Santa Monica,219', 10.0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar  o id do funcionario',
  `nome_funcionario` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar o nome do funcionario',
  `salario_funcionario` decimal(10,2) NOT NULL COMMENT 'Este campo é responsável por armazenar o salário',
  `taxa_comissao` char(2) NOT NULL COMMENT 'Este campo é responsável por armazenar a taxa de comissão do funcionário',
  `telefone_funcionario` varchar(20) NOT NULL COMMENT 'Este campo é responsável por armazenar o telefone do funcionario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome_funcionario`, `salario_funcionario`, `taxa_comissao`, `telefone_funcionario`) VALUES
(1, 'Nathalia Silva', 5000.99, '10', '(47)95007-2112'),
(2, 'Pedro Henrique', 4500.99, '8', '(47)95667-2112'),
(3, 'Carlos Mendes', 2800.00, '8', '(31) 96666-3456'),
(4, 'Fernanda Souza', 3000.00, '10', '(41) 95555-2345'),
(5, 'Lucas Lima', 2700.00, '9', '(51) 94444-6789'),
(6, 'Patrícia Torres', 3500.00, '15', '(61) 93333-7890');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_de_pedido`
--

DROP TABLE IF EXISTS `item_de_pedido`;
CREATE TABLE `item_de_pedido` (
  `qtde` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar a quantidade do item da pedido',
  `produto_id_produto` int(11) NOT NULL,
  `produto_funcionario_id_funcionario` int(11) NOT NULL,
  `pedido_id_pedido` int(11) NOT NULL,
  `pedido_cliente_id_cliente` int(11) NOT NULL,
  `pedido_funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_de_pedido`
--

INSERT INTO `item_de_pedido` (`qtde`, `produto_id_produto`, `produto_funcionario_id_funcionario`, `pedido_id_pedido`, `pedido_cliente_id_cliente`, `pedido_funcionario_id_funcionario`) VALUES
(2, 101, 1, 1001, 1, 1),
(1, 102, 2, 1002, 2, 2),
(3, 103, 3, 1003, 3, 3),
(1, 104, 4, 1004, 4, 4),
(5, 105, 5, 1005, 5, 5),
(2, 106, 6, 1006, 6, 6),
(4, 107, 1, 1007, 7, 1),
(1, 108, 2, 1008, 8, 2),
(2, 109, 3, 1009, 9, 3),
(3, 110, 4, 1010, 10, 4),
(1, 111, 5, 1011, 11, 5),
(2, 112, 6, 1012, 12, 6),
(4, 113, 1, 1013, 13, 1),
(1, 114, 2, 1014, 14, 2),
(3, 115, 3, 1015, 15, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o id do pedido',
  `num_pedido` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o número do pedido ',
  `prazo_entrega` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o prazo de entrega',
  `cliente_id_cliente` int(11) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `num_pedido`, `prazo_entrega`, `cliente_id_cliente`, `funcionario_id_funcionario`) VALUES
(1001, 5001, 3, 1, 1),
(1002, 5002, 5, 2, 2),
(1003, 5003, 2, 3, 3),
(1004, 5004, 4, 4, 4),
(1005, 5005, 6, 5, 5),
(1006, 5006, 3, 6, 6),
(1007, 5007, 7, 7, 1),
(1008, 5008, 2, 8, 2),
(1009, 5009, 4, 9, 3),
(1010, 5010, 5, 10, 4),
(1011, 5011, 3, 11, 5),
(1012, 5012, 6, 12, 6),
(1013, 5013, 2, 13, 1),
(1014, 5014, 4, 14, 2),
(1015, 5015, 3, 15, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar o id do produto',
  `nome_produto` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar o nome do produto ',
  `descricao_produto` varchar(50) NOT NULL COMMENT 'Este campo é responsável por armazenar a descrição do produto',
  `quantidade_produto` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar a quantidade do produto ',
  `preco` decimal(10,2) NOT NULL COMMENT 'Este campo é responsável por armazenar o preço do produto',
  `funcionario_id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome_produto`, `descricao_produto`, `quantidade_produto`, `preco`, `funcionario_id_funcionario`) VALUES
(101, 'Whey Protein', 'Proteína sabor baunilha', 50, 120.00, 1),
(102, 'Creatina Monohidratada', 'Suplemento para ganho de força', 40, 90.00, 2),
(103, 'BCAA', 'Aminoácidos essenciais', 60, 70.00, 3),
(104, 'Glutamina', 'Suplemento para recuperação muscular', 30, 80.00, 4),
(105, 'Pré-treino Explosive', 'Energia para treino intenso', 25, 150.00, 5),
(106, 'Hipercalórico', 'Ganho de massa muscular', 20, 200.00, 6),
(107, 'Óleo de Peixe', 'Ômega 3 para saúde', 70, 50.00, 1),
(108, 'Vitamina D', 'Suplemento para imunidade', 80, 40.00, 2),
(109, 'Colágeno Hidrolisado', 'Saúde da pele e articulações', 50, 60.00, 3),
(110, 'Albumina', 'Proteína para ganho de massa', 30, 55.00, 4),
(111, 'Maltodextrina', 'Fonte de energia rápida', 40, 35.00, 5),
(112, 'ZMA', 'Minerais para recuperação', 20, 90.00, 6),
(113, 'Caseína', 'Proteína de absorção lenta', 25, 130.00, 1),
(114, 'Termogênico', 'Queima de gordura', 30, 110.00, 2),
(115, 'Multivitamínico', 'Completo para saúde diária', 100, 70.00, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_produto`
--

DROP TABLE IF EXISTS `tipo_produto`;
CREATE TABLE `tipo_produto` (
  `qnte` int(11) NOT NULL COMMENT 'Este campo é responsável por armazenar a quantidade do item do produto',
  `fornecedor_id_fornecedor` int(11) NOT NULL,
  `produto_id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_produto`
--

INSERT INTO `tipo_produto` (`qnte`, `fornecedor_id_fornecedor`, `produto_id_produto`) VALUES
(100, 1, 101),
(90, 1, 106),
(80, 2, 102),
(110, 2, 107),
(120, 3, 103),
(60, 3, 108),
(70, 4, 104),
(75, 4, 109),
(50, 5, 105),
(85, 5, 110);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices de tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD PRIMARY KEY (`produto_id_produto`,`produto_funcionario_id_funcionario`,`pedido_id_pedido`,`pedido_cliente_id_cliente`,`pedido_funcionario_id_funcionario`),
  ADD KEY `fk_item_de_pedido_pedido1` (`pedido_id_pedido`,`pedido_cliente_id_cliente`,`pedido_funcionario_id_funcionario`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`,`cliente_id_cliente`,`funcionario_id_funcionario`),
  ADD KEY `fk_pedido_cliente` (`cliente_id_cliente`),
  ADD KEY `fk_pedido_funcionario1` (`funcionario_id_funcionario`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`,`funcionario_id_funcionario`),
  ADD KEY `fk_produto_funcionario1` (`funcionario_id_funcionario`);

--
-- Índices de tabela `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD PRIMARY KEY (`fornecedor_id_fornecedor`,`produto_id_produto`),
  ADD KEY `fk_item_pedido_produto1` (`produto_id_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo é responsável por armazenar o id do cliente', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo é responsável por armazenar o id do fornecedor', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo é responsável por armazenar  o id do funcionario', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo é responsável por armazenar o id do pedido', AUTO_INCREMENT=1016;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `fk_item_de_pedido_pedido1` FOREIGN KEY (`pedido_id_pedido`,`pedido_cliente_id_cliente`,`pedido_funcionario_id_funcionario`) REFERENCES `pedido` (`id_pedido`, `cliente_id_cliente`, `funcionario_id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_de_pedido_produto1` FOREIGN KEY (`produto_id_produto`,`produto_funcionario_id_funcionario`) REFERENCES `produto` (`id_produto`, `funcionario_id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_funcionario1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_funcionario1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tipo_produto`
--
ALTER TABLE `tipo_produto`
  ADD CONSTRAINT `fk_item_pedido_fornecedor1` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_pedido_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
