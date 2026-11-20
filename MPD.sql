SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role_level` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC));

-- -----------------------------------------------------
-- Table `mydb`.`Exercice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exercice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Result` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Users_id` INT NOT NULL,
  `Exercices_idExercices` INT NOT NULL,
  `date_time` DATETIME NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `nb_tries` INT NOT NULL,
  `nb_win` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Results_Users_idx` (`Users_id` ASC),
  INDEX `fk_Results_Exercices1_idx` (`Exercices_idExercices` ASC),
  CONSTRAINT `fk_Results_Users`
    FOREIGN KEY (`Users_id`)
    REFERENCES `mydb`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Results_Exercices1`
    FOREIGN KEY (`Exercices_idExercices`)
    REFERENCES `mydb`.`Exercice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;