-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movilCaja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movilCaja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movilCaja` DEFAULT CHARACTER SET utf8 ;
USE `movilCaja` ;


-- -----------------------------------------------------
-- Table `movilCaja`.`estaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`estaciones` (
  `NumeroEstacion` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `activo` INT NULL,
  `vistaprevia` INT NULL,
  `tecladovirtual` INT NULL,
  `nombretipo` INT NULL,
  `nombreproducto` INT NULL,
  PRIMARY KEY (`NumeroEstacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`aperturacaja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`aperturacaja` (
  `idregistro` INT NOT NULL,
  `caja` INT NULL,
  `estacion` INT NULL,
  `fechahora` DATE NULL,
  `cierre` INT NULL,
  `monto` DOUBLE NULL,
  `fechaapertura` DATE NULL,
  `estaciones_NumeroEstacion` INT NOT NULL,
  PRIMARY KEY (`idregistro`),
  INDEX `fk_aperturacaja_estaciones1_idx` (`estaciones_NumeroEstacion` ASC) VISIBLE,
  CONSTRAINT `fk_aperturacaja_estaciones1`
    FOREIGN KEY (`estaciones_NumeroEstacion`)
    REFERENCES `movilCaja`.`estaciones` (`NumeroEstacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`detalle_aperturacaja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`detalle_aperturacaja` (
  `idregistro` INT NOT NULL,
  `idapertura` INT NULL,
  `iddenominacion` INT NULL,
  `cantidad` INT NULL,
  `monto` DOUBLE NULL,
  `aperturacaja_idregistro` INT NOT NULL,
  PRIMARY KEY (`idregistro`),
  INDEX `fk_detalle_aperturacaja_aperturacaja1_idx` (`aperturacaja_idregistro` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_aperturacaja_aperturacaja1`
    FOREIGN KEY (`aperturacaja_idregistro`)
    REFERENCES `movilCaja`.`aperturacaja` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`monedas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`monedas` (
  `idregistro` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `simbolo` VARCHAR(45) NULL,
  `cambio` DOUBLE NULL,
  `nacional` INT NULL,
  PRIMARY KEY (`idregistro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`denominacionmonedas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`denominacionmonedas` (
  `idregistro` INT NOT NULL,
  `moneda` INT NULL,
  `denominacion` VARCHAR(25) NULL,
  `valor` DOUBLE NULL,
  `tipo` VARCHAR(45) NULL,
  `monedas_idregistro` INT NOT NULL,
  PRIMARY KEY (`idregistro`),
  INDEX `fk_denominacionmonedas_monedas1_idx` (`monedas_idregistro` ASC) VISIBLE,
  CONSTRAINT `fk_denominacionmonedas_monedas1`
    FOREIGN KEY (`monedas_idregistro`)
    REFERENCES `movilCaja`.`monedas` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`detalle_cierrecaja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`detalle_cierrecaja` (
  `idregistro` INT NOT NULL,
  `idcierre` INT NULL,
  `iddenominacion` INT NULL,
  `cantidad` INT NULL,
  `monto` DOUBLE NULL,
  `detalle_aperturacaja_idregistro` INT NOT NULL,
  `denominacionmonedas_idregistro` INT NOT NULL,
  PRIMARY KEY (`idregistro`),
  INDEX `fk_detalle_cierrecaja_detalle_aperturacaja1_idx` (`detalle_aperturacaja_idregistro` ASC) VISIBLE,
  INDEX `fk_detalle_cierrecaja_denominacionmonedas1_idx` (`denominacionmonedas_idregistro` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_cierrecaja_detalle_aperturacaja1`
    FOREIGN KEY (`detalle_aperturacaja_idregistro`)
    REFERENCES `movilCaja`.`detalle_aperturacaja` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_cierrecaja_denominacionmonedas1`
    FOREIGN KEY (`denominacionmonedas_idregistro`)
    REFERENCES `movilCaja`.`denominacionmonedas` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`cierrecaja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`cierrecaja` (
  `idregistro` INT NOT NULL,
  `caja` INT NULL,
  `usuario` INT NULL,
  `estacion` INT NULL,
  `apertura` INT NULL,
  `fechahora` DATE NULL,
  `efectivoreal` DOUBLE NULL,
  `efectivosistema` DOUBLE NULL,
  `tarjetadevolucionreal` DOUBLE NULL,
  `tarjetamontoreal` DOUBLE NULL,
  `tarjetamontosistema` DOUBLE NULL,
  `ventasefectivo` DOUBLE NULL,
  `ventastarjeta` DOUBLE NULL,
  `egresos` DOUBLE NULL,
  `propina` DOUBLE NULL,
  `descuento` DOUBLE NULL,
  `impuesto15` DOUBLE NULL,
  `impuesto18` DOUBLE NULL,
  `exento` DOUBLE NULL,
  `fechacierre` DATE NULL,
  `aperturacaja_idregistro` INT NOT NULL,
  PRIMARY KEY (`idregistro`),
  INDEX `fk_cierrecaja_aperturacaja_idx` (`aperturacaja_idregistro` ASC) VISIBLE,
  CONSTRAINT `fk_cierrecaja_aperturacaja`
    FOREIGN KEY (`aperturacaja_idregistro`)
    REFERENCES `movilCaja`.`aperturacaja` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`cajas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`cajas` (
  `estacion` INT NOT NULL,
  `activo` INT NULL,
  `fechahora` DATE NULL,
  `estado` VARCHAR(45) NULL,
  `cierrecaja_idregistro` INT NOT NULL,
  PRIMARY KEY (`estacion`),
  INDEX `fk_cajas_cierrecaja1_idx` (`cierrecaja_idregistro` ASC) VISIBLE,
  CONSTRAINT `fk_cajas_cierrecaja1`
    FOREIGN KEY (`cierrecaja_idregistro`)
    REFERENCES `movilCaja`.`cierrecaja` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movilCaja`.`detallecierrecajapos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movilCaja`.`detallecierrecajapos` (
  `idregistro` INT NOT NULL,
  `idcierre` INT NULL,
  `idtipos` INT NULL,
  `devolucion` DOUBLE NULL,
  `monto` DOUBLE NULL,
  `cierrecaja_idregistro` INT NOT NULL,
  PRIMARY KEY (`idregistro`),
  INDEX `fk_detallecierrecajapos_cierrecaja1_idx` (`cierrecaja_idregistro` ASC) VISIBLE,
  CONSTRAINT `fk_detallecierrecajapos_cierrecaja1`
    FOREIGN KEY (`cierrecaja_idregistro`)
    REFERENCES `movilCaja`.`cierrecaja` (`idregistro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
