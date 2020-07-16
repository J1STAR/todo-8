-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`todoList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`todoList` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `permission` VARCHAR(255) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `user_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_todoList_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_todoList_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`column`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`column` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `todoList_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_column_todoList1_idx` (`todoList_id` ASC),
  CONSTRAINT `fk_column_todoList1`
    FOREIGN KEY (`todoList_id`)
    REFERENCES `mydb`.`todoList` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`card` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `column_id` INT(20) NOT NULL,
  `user_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_card_column1_idx` (`column_id` ASC),
  INDEX `fk_card_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_card_column1`
    FOREIGN KEY (`column_id`)
    REFERENCES `mydb`.`column` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`log` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `contents` VARCHAR(255) NULL,
  `created_at` DATETIME(6) NULL,
  `updated_at` DATETIME(6) NULL,
  `todoList_id` INT(20) NOT NULL,
  `user_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_todoList1_idx` (`todoList_id` ASC),
  INDEX `fk_log_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_log_todoList1`
    FOREIGN KEY (`todoList_id`)
    REFERENCES `mydb`.`todoList` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
