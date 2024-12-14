-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: sistema_ventas0
-- Source Schemata: sistema_ventas1
-- Created: Fri Dec 13 16:37:27 2024
-- Workbench Version: 8.0.36
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema sistema_ventas0
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `sistema_ventas1` ;
CREATE SCHEMA IF NOT EXISTS `sistema_ventas1` ;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas0.clientes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dni` BIGINT NULL DEFAULT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` BIGINT NULL DEFAULT NULL,
  `direccion` VARCHAR(150) NULL DEFAULT NULL,
  `razon` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas1.config
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`config` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `ruc` VARCHAR(200) NOT NULL,
  `telefono` VARCHAR(200) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  `razon` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas0.detalle
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`detalle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cod_pro` VARCHAR(100) NULL DEFAULT NULL,
  `fecha` VARCHAR(150) NULL DEFAULT NULL,
  `cantidad` BIGINT NULL DEFAULT NULL,
  `precio` DECIMAL(10,4) NULL DEFAULT NULL,
  `idVenta` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ventas` (`idVenta` ASC) VISIBLE,
  INDEX `cod_pro` (`cod_pro` ASC) VISIBLE,
  CONSTRAINT `detalle_ibfk_1`
    FOREIGN KEY (`cod_pro`)
    REFERENCES `sistema_ventas0`.`productos` (`codigo`),
  CONSTRAINT `fk_ventas`
    FOREIGN KEY (`idVenta`)
    REFERENCES `sistema_ventas0`.`ventas` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas1.productos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(100) NULL DEFAULT NULL,
  `nombre` VARCHAR(150) NULL DEFAULT NULL,
  `proveedor` VARCHAR(150) NULL DEFAULT NULL,
  `stock` BIGINT NULL DEFAULT NULL,
  `precio` DECIMAL(10,4) NULL DEFAULT NULL,
  `idProv` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas1.proveedores
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ruc` VARCHAR(250) NOT NULL,
  `nombre` VARCHAR(250) NOT NULL,
  `telefono` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `razon` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas1.usuarios
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `pass` VARCHAR(100) NULL DEFAULT NULL,
  `rol` VARCHAR(100) NULL DEFAULT NULL,
  `estado` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table sistema_ventas0.ventas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas1`.`ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente` VARCHAR(100) NULL DEFAULT NULL,
  `vendedor` VARCHAR(100) NULL DEFAULT NULL,
  `fecha` VARCHAR(150) NULL DEFAULT NULL,
  `total` DECIMAL(10,4) NULL DEFAULT NULL,
  `idCli` INT NULL DEFAULT NULL,
  `idVend` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_ventas_clientes` (`idCli` ASC) VISIBLE,
  INDEX `FK_ventas_usuarios` (`idVend` ASC) VISIBLE,
  CONSTRAINT `FK_ventas_clientes`
    FOREIGN KEY (`idCli`)
    REFERENCES `sistema_ventas0`.`clientes` (`id`),
  CONSTRAINT `FK_ventas_usuarios`
    FOREIGN KEY (`idVend`)
    REFERENCES `sistema_ventas0`.`usuarios` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET FOREIGN_KEY_CHECKS = 1;
