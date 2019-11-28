-- MySQL Script generated by MySQL Workbench
-- Thu 28 Nov 2019 02:13:34 PM CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proyecto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proyecto` (
  `idProyecto` INT NOT NULL,
  `colonia` VARCHAR(45) NULL,
  `delegación` VARCHAR(45) NULL,
  `activo` VARCHAR(45) NULL,
  `finalizado` VARCHAR(45) NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Notificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Notificacion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Notificacion` (
  `idNotificacion` INT NOT NULL,
  `activa` TINYINT(1) NULL,
  `idProyecto` INT NULL,
  `idUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idNotificacion`),
  INDEX `fk_Notificacion_Proyecto_idx` (`idProyecto` ASC),
  CONSTRAINT `fk_Notificacion_Proyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `mydb`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Avance` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Avance` (
  `idProyecto` INT NULL,
  `fecha` DATE NOT NULL,
  `finalizaProyecto` TINYINT(1) NULL,
  `nombreFoto` VARCHAR(256) NULL,
  INDEX `fk_Avance_Proyecto_idx` (`idProyecto` ASC),
  CONSTRAINT `fk_Avance_Proyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `mydb`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `correo` VARCHAR(254) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Comentario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Comentario` (
  `idComentario` INT NOT NULL,
  `idProyecto` INT NULL,
  `idUsuario` INT NULL,
  `texto` VARCHAR(280) NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Proyecto_idx` (`idProyecto` ASC, `idUsuario` ASC),
  CONSTRAINT `fk_Comentario_Proyecto`
    FOREIGN KEY (`idProyecto` , `idUsuario`)
    REFERENCES `mydb`.`Proyecto` (`idProyecto` , `idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Usuario`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Usuario` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
