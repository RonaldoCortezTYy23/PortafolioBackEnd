-- MySQL Script generated by MySQL Workbench
-- Tue Jun 27 20:11:15 2023
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sakila` ;

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sakila` ;
USE `sakila` ;

-- -----------------------------------------------------
-- Table `sakila`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`Persona` (
  `id` INT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `Acerca de` VARCHAR(255) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IMG` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `sakila`.`Redes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`Redes` (
  `id` INT NULL,
  `nombre` VARCHAR(50) NULL,
  `link` VARCHAR(150) NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  CONSTRAINT `fk_Redes_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `sakila`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_Redes_Persona1_idx` ON `sakila`.`Redes` (`Persona_id` ASC);


-- -----------------------------------------------------
-- Table `sakila`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`educacion` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`educacion_Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`educacion_Persona` (
  `educacion_id` INT NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`educacion_id`, `Persona_id`),
  CONSTRAINT `fk_educacion_Persona_educacion1`
    FOREIGN KEY (`educacion_id`)
    REFERENCES `sakila`.`educacion` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_Persona_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `sakila`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_educacion_Persona_Persona1_idx` ON `sakila`.`educacion_Persona` (`Persona_id` ASC);


-- -----------------------------------------------------
-- Table `sakila`.`Persona_hys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`Persona_hys` (
  `hys_id` INT NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`hys_id`, `Persona_id`),
  CONSTRAINT `fk_Persona_hys_hys1`
    FOREIGN KEY (`hys_id`)
    REFERENCES `sakila`.`hys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_hys_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `sakila`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_hys_hys1_idx` ON `sakila`.`Persona_hys` (`hys_id` ASC);

CREATE INDEX `fk_Persona_hys_Persona1_idx` ON `sakila`.`Persona_hys` (`Persona_id` ASC);


-- -----------------------------------------------------
-- Table `sakila`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`experiencia` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  CONSTRAINT `fk_experiencia_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `sakila`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_experiencia_Persona1_idx` ON `sakila`.`experiencia` (`Persona_id` ASC);


-- -----------------------------------------------------
-- Table `sakila`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`proyectos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila`.`Persona_proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`Persona_proyectos` (
  `proyectos_id` INT NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`proyectos_id`, `Persona_id`),
  CONSTRAINT `fk_Persona_proyectos_proyectos1`
    FOREIGN KEY (`proyectos_id`)
    REFERENCES `sakila`.`proyectos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_proyectos_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `sakila`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Persona_proyectos_proyectos1_idx` ON `sakila`.`Persona_proyectos` (`proyectos_id` ASC);

CREATE INDEX `fk_Persona_proyectos_Persona1_idx` ON `sakila`.`Persona_proyectos` (`Persona_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
