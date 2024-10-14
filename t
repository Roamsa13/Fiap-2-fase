-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'produtores'
-- 
-- ---

DROP TABLE IF EXISTS `produtores`;
		
CREATE TABLE `produtores` (
  `id_produtor` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Chave Primária (PK)',
  `nome` VARCHAR(100) NOT NULL COMMENT 'Nome do produtor',
  `email` VARCHAR(100) NOT NULL COMMENT 'E-mail do produtor',
  `telefone` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Telefone do produtor',
  PRIMARY KEY (`id_produtor`)
);

-- ---
-- Table 'Culturas'
-- 
-- ---

DROP TABLE IF EXISTS `Culturas`;
		
CREATE TABLE `Culturas` (
  `id_cultura` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL COMMENT 'Chave Primária (PK)',
  `tipo_cultura` VARCHAR(100) NOT NULL COMMENT 'Tipo da cultura agrícola',
  `data_plantio` DATE NOT NULL DEFAULT 'NULL' COMMENT 'Data de plantio',
  `data_colheita` DATE NULL DEFAULT NULL COMMENT 'Data de colheita (opcional)',
  `id_produtor` INTEGER NOT NULL COMMENT 'Chave Estrangeira (FK) para produtores',
  PRIMARY KEY (`id_cultura`)
);

-- ---
-- Table 'sensores'
-- 
-- ---

DROP TABLE IF EXISTS `sensores`;
		
CREATE TABLE `sensores` (
  `id_sensor` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL COMMENT 'Chave Primária (PK)',
  `tipo_sensor` ENUM NOT NULL DEFAULT NULL COMMENT 'Tipo do sensor (S1, S2, S3)',
  `localizacao` VARCHAR(100) NOT NULL COMMENT 'Localização do sensor',
  `data_instalacao` DATE NOT NULL DEFAULT 'NULL' COMMENT 'Data de instalação do sensor',
  `id_cultura` INTEGER NOT NULL COMMENT 'Chave Estrangeira (FK) para culturas',
  PRIMARY KEY (`id_sensor`)
);

-- ---
-- Table 'Leituras'
-- 
-- ---

DROP TABLE IF EXISTS `Leituras`;
		
CREATE TABLE `Leituras` (
  `id_leitura` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Chave Primária (PK)',
  `data_hora` DATETIME NOT NULL DEFAULT 'NULL' COMMENT 'Data e hora da leitura',
  `valor_umidade` DOUBLE NULL DEFAULT NULL COMMENT 'Valor de umidade (S1)',
  `valor_pH` DOUBLE NULL DEFAULT NULL COMMENT 'Valor de pH (S2)',
  `valor_P` DOUBLE NULL DEFAULT NULL COMMENT 'Valor de fósforo (S3)',
  `valor_K` DOUBLE NULL DEFAULT NULL COMMENT 'Valor de potássio (S3)',
  `valor_N` DOUBLE NULL DEFAULT NULL COMMENT 'Valor de nitrogênio (S3)',
  `valor_temp_solo` DOUBLE NULL DEFAULT NULL COMMENT 'Temperatura do solo (opcional)',
  `id_sensor` INTEGER NOT NULL DEFAULT NULL COMMENT 'Chave Estrangeira (FK) para sensores',
  PRIMARY KEY (`id_leitura`)
);

-- ---
-- Table 'ajuste_irrigacao'
-- 
-- ---

DROP TABLE IF EXISTS `ajuste_irrigacao`;
		
CREATE TABLE `ajuste_irrigacao` (
  `id_ajuste_irrigacao` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Chave Primária (PK)',
  `data_hora` DATETIME NOT NULL COMMENT 'Data e hora do ajuste de irrigação',
  `quantidade_agua` DOUBLE NOT NULL COMMENT 'Quantidade de água aplicada',
  `id_cultura` INTEGER NOT NULL COMMENT 'Chave Estrangeira (FK) para culturas',
  PRIMARY KEY (`id_ajuste_irrigacao`)
);

-- ---
-- Table 'ajustes_nutrientes'
-- 
-- ---

DROP TABLE IF EXISTS `ajustes_nutrientes`;
		
CREATE TABLE `ajustes_nutrientes` (
  `id_ajuste_nutrientes` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Chave Primária (PK)',
  `data_hora` DATETIME NOT NULL COMMENT 'Data e hora do ajuste de nutrientes',
  `quantidade_P` DOUBLE NOT NULL COMMENT 'Quantidade de fósforo aplicada',
  `quantidade_K` DOUBLE NOT NULL COMMENT 'Quantidade de potássio aplicada',
  `quantidade_N` DOUBLE NOT NULL COMMENT 'Quantidade de nitrogênio aplicada',
  `id_cultura` INTEGER NOT NULL COMMENT 'Chave Estrangeira (FK) para culturas',
  PRIMARY KEY (`id_ajuste_nutrientes`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Culturas` ADD FOREIGN KEY (id_produtor) REFERENCES `produtores` (`id_produtor`);
ALTER TABLE `sensores` ADD FOREIGN KEY (id_cultura) REFERENCES `Culturas` (`id_cultura`);
ALTER TABLE `Leituras` ADD FOREIGN KEY (id_sensor) REFERENCES `sensores` (`id_sensor`);
ALTER TABLE `ajuste_irrigacao` ADD FOREIGN KEY (id_cultura) REFERENCES `Culturas` (`id_cultura`);
ALTER TABLE `ajustes_nutrientes` ADD FOREIGN KEY (id_cultura) REFERENCES `Culturas` (`id_cultura`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `produtores` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Culturas` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sensores` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Leituras` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ajuste_irrigacao` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ajustes_nutrientes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `produtores` (`id_produtor`,`nome`,`email`,`telefone`) VALUES
-- ('','','','');
-- INSERT INTO `Culturas` (`id_cultura`,`tipo_cultura`,`data_plantio`,`data_colheita`,`id_produtor`) VALUES
-- ('','','','','');
-- INSERT INTO `sensores` (`id_sensor`,`tipo_sensor`,`localizacao`,`data_instalacao`,`id_cultura`) VALUES
-- ('','','','','');
-- INSERT INTO `Leituras` (`id_leitura`,`data_hora`,`valor_umidade`,`valor_pH`,`valor_P`,`valor_K`,`valor_N`,`valor_temp_solo`,`id_sensor`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `ajuste_irrigacao` (`id_ajuste_irrigacao`,`data_hora`,`quantidade_agua`,`id_cultura`) VALUES
-- ('','','','');
-- INSERT INTO `ajustes_nutrientes` (`id_ajuste_nutrientes`,`data_hora`,`quantidade_P`,`quantidade_K`,`quantidade_N`,`id_cultura`) VALUES
-- ('','','','','','');
