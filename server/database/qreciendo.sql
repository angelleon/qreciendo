-- MySQL Script generated by MySQL Workbench
-- Wed 04 Dec 2019 01:39:06 PM CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema qreciendo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `qreciendo` ;

-- -----------------------------------------------------
-- Schema qreciendo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qreciendo` DEFAULT CHARACTER SET utf8 ;
USE `qreciendo` ;

-- -----------------------------------------------------
-- Table `qreciendo`.`Proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qreciendo`.`Proyecto` ;

CREATE TABLE IF NOT EXISTS `qreciendo`.`Proyecto` (
  `idProyecto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `delegacion` VARCHAR(45) NOT NULL,
  `activo` TINYINT(1) NULL DEFAULT 1,
  `finalizado` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qreciendo`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qreciendo`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `qreciendo`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `correo` VARCHAR(256) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qreciendo`.`Notificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qreciendo`.`Notificacion` ;

CREATE TABLE IF NOT EXISTS `qreciendo`.`Notificacion` (
  `idNotificacion` INT NOT NULL AUTO_INCREMENT,
  `activa` TINYINT(1) NULL,
  `idProyecto` INT NULL,
  `idUsuario` INT NULL,
  PRIMARY KEY (`idNotificacion`),
  INDEX `fk_Notificacion_Proyecto_idx` (`idProyecto` ASC),
  INDEX `fk_Notificacion_Usuario_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Notificacion_Proyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `qreciendo`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notificacion_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `qreciendo`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qreciendo`.`Avance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qreciendo`.`Avance` ;

CREATE TABLE IF NOT EXISTS `qreciendo`.`Avance` (
  `idProyecto` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `finalizaProyecto` TINYINT(1) NULL,
  `nombreFoto` VARCHAR(256) NULL,
  INDEX `fk_Avance_Proyecto_idx` (`idProyecto` ASC),
  CONSTRAINT `fk_Avance_Proyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `qreciendo`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qreciendo`.`Comentario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `qreciendo`.`Comentario` ;

CREATE TABLE IF NOT EXISTS `qreciendo`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `idProyecto` INT NULL,
  `idUsuario` INT NULL,
  `texto` VARCHAR(280) NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Proyecto_idx` (`idProyecto` ASC),
  INDEX `fk_Comentario_Usuario_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Comentario_Proyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `qreciendo`.`Proyecto` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `qreciendo`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO qreciendo_dev;
DROP USER qreciendo_dev;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'qreciendo_dev' IDENTIFIED BY 'qreciendo';

GRANT ALL ON `qreciendo`.* TO 'qreciendo_dev';
GRANT SELECT ON TABLE `qreciendo`.* TO 'qreciendo_dev';
GRANT SELECT, INSERT, TRIGGER ON TABLE `qreciendo`.* TO 'qreciendo_dev';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `qreciendo`.* TO 'qreciendo_dev';

DROP USER 'qreciendo_dev'@'localhost';
CREATE USER 'qreciendo_dev'@'localhost' IDENTIFIED WITH mysql_native_password BY 'qreciendo';
GRANT ALL ON qreciendo.* TO 'qreciendo_dev'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
