-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.23 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para goodwe
DROP DATABASE IF EXISTS `goodwe`;
CREATE DATABASE IF NOT EXISTS `goodwe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `goodwe`;

-- Copiando estrutura para tabela goodwe.dados_inversor
DROP TABLE IF EXISTS `dados_inversor`;
CREATE TABLE IF NOT EXISTS `dados_inversor` (
  `data_hora_leitura` datetime DEFAULT NULL,
  `modo_operacao` char(1) DEFAULT 'N' COMMENT 'N = Normal; W = Wait',
  `v_mppt_1(v)` double(9,2) DEFAULT NULL,
  `i_mppt_1(a)` double(9,2) DEFAULT NULL,
  `uav` double(9,2) DEFAULT NULL,
  `i_ac_1(a)` double(9,2) DEFAULT NULL,
  `f_ac_1(hz)` double(9,2) DEFAULT NULL,
  `potencia` double(9,2) DEFAULT NULL,
  `temperatura` double(9,2) DEFAULT NULL,
  `producao_dia` double(9,2) DEFAULT NULL,
  `geracao_total` double(9,2) DEFAULT NULL,
  `h_total` int DEFAULT NULL,
  `rssi` int DEFAULT NULL,
  `pf` double(12,5) DEFAULT NULL,
  `reactive_power` double(12,5) DEFAULT NULL,
  `leakage_current(ma)` int DEFAULT NULL,
  `iso_limit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela goodwe.dados_inversor: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela goodwe.inversores
DROP TABLE IF EXISTS `inversores`;
CREATE TABLE IF NOT EXISTS `inversores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `planta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__plantas` (`planta`),
  CONSTRAINT `FK__plantas` FOREIGN KEY (`planta`) REFERENCES `plantas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela goodwe.inversores: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela goodwe.plantas
DROP TABLE IF EXISTS `plantas`;
CREATE TABLE IF NOT EXISTS `plantas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_planta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela goodwe.plantas: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
