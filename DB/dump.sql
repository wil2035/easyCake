-- MySQL Script generated by MySQL Workbench
-- Tue Sep 25 05:49:01 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema easyCake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema easyCake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `easyCake` DEFAULT CHARACTER SET utf8 ;
USE `easyCake` ;

-- -----------------------------------------------------
-- Table `easyCake`.`bakery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`bakery` (
  `nit` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `registered_name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `activity` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `address` VARCHAR(60) CHARACTER SET 'utf8' NOT NULL,
  `neighborhood` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `telephone` DECIMAL(12,0) NULL DEFAULT NULL,
  `cellphone` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `web_page` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`nit`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`ingredient` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `description` VARCHAR(45) NULL,
  `cost` DECIMAL(10) UNSIGNED NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  `ingredient_type_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `ingredient_type_id`),
  INDEX `fk_ingredient_ingredient_type1_idx` (`ingredient_type_id` ASC),
  CONSTRAINT `fk_ingredient_ingredient_type1`
    FOREIGN KEY (`ingredient_type_id`)
    REFERENCES `easyCake`.`ingredient_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`order` (
  `id` INT NOT NULL,
  `id_user` INT NOT NULL,
  `nit_bakery` INT NOT NULL,
  `id_product` INT NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  `cost` DECIMAL(10) UNSIGNED NOT NULL,
  `state` CHAR(1) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  `ingredient_id` INT NOT NULL,
  PRIMARY KEY (`id`, `ingredient_id`),
  INDEX `fk_order_ingredient1_idx` (`ingredient_id` ASC),
  CONSTRAINT `fk_order_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `easyCake`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`product` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `code` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `description` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `cost` DECIMAL(10,0) UNSIGNED NULL DEFAULT NULL,
  `image` BLOB NULL DEFAULT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `order_id` INT NOT NULL,
  `order_ingredient_id` INT NOT NULL,
  PRIMARY KEY (`id`, `order_id`, `order_ingredient_id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC),
  INDEX `fk_product_order1_idx` (`order_id` ASC, `order_ingredient_id` ASC),
  CONSTRAINT `fk_product_order1`
    FOREIGN KEY (`order_id` , `order_ingredient_id`)
    REFERENCES `easyCake`.`order` (`id` , `ingredient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`user_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`user_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `easyCake`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`user` (
  `id` INT(11) NOT NULL,
  `namel` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `surname` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `sex` CHAR(1) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `city` VARCHAR(60) CHARACTER SET 'utf8' NOT NULL,
  `adress` VARCHAR(60) CHARACTER SET 'utf8' NOT NULL,
  `neighborhood` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `phone` INT(12) NULL DEFAULT NULL,
  `password` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `code_user_type` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `user_type_id` INT(11) NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_type_id`, `order_id`),
  INDEX `fk_user_user_type1_idx` (`user_type_id` ASC),
  INDEX `fk_user_order1_idx` (`order_id` ASC),
  CONSTRAINT `fk_user_user_type1`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `easyCake`.`user_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `easyCake`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`ingredient_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`ingredient_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `easyCake`.`order_bakery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`order_bakery` (
  `bakery_nit` INT(11) NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`bakery_nit`, `order_id`),
  INDEX `fk_bakery_has_order_order1_idx` (`order_id` ASC),
  INDEX `fk_bakery_has_order_bakery_idx` (`bakery_nit` ASC),
  CONSTRAINT `fk_bakery_has_order_bakery`
    FOREIGN KEY (`bakery_nit`)
    REFERENCES `easyCake`.`bakery` (`nit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bakery_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `easyCake`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`ingredient` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `description` VARCHAR(45) NULL,
  `cost` DECIMAL(10) UNSIGNED NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  `ingredient_type_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `ingredient_type_id`),
  INDEX `fk_ingredient_ingredient_type1_idx` (`ingredient_type_id` ASC),
  CONSTRAINT `fk_ingredient_ingredient_type1`
    FOREIGN KEY (`ingredient_type_id`)
    REFERENCES `easyCake`.`ingredient_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `easyCake`.`product_ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `easyCake`.`product_ingredient` (
  `product_id` INT(11) NOT NULL,
  `ingredient_id` INT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `update_date` DATETIME NULL,
  PRIMARY KEY (`product_id`, `ingredient_id`),
  INDEX `fk_product_has_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  INDEX `fk_product_has_ingredient_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_product_has_ingredient_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `easyCake`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `easyCake`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
