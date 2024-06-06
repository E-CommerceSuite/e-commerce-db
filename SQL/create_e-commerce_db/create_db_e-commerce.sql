-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e-commerce` ;
-- -----------------------------------------------------
-- Schema e-commerce-db
-- -----------------------------------------------------
USE `e-commerce` ;

-- -----------------------------------------------------
-- Table `e-commerce`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(500) NOT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `cellphone` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `role_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_users_roles_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `e-commerce`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`permission_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`permission_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `permission_type` VARCHAR(100) NOT NULL,
  `description` VARCHAR(150) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `permission_type_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_permission_permission_types_idx` (`permission_type_id` ASC) VISIBLE,
  INDEX `fk_permission_types_roles_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_permission_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `e-commerce`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_permission_types`
    FOREIGN KEY (`permission_type_id`)
    REFERENCES `e-commerce`.`permission_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(150) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categorie_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `photo` VARCHAR(300) NOT NULL,
  `stock` INT NOT NULL,
  `price` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_categories_idx` (`categorie_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`categorie_id`)
    REFERENCES `e-commerce`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`cart_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`cart_statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(150) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`shopping_carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`shopping_carts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `cart_status_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shopping_carts_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_shopping_carts_cart_statuses_idx` (`cart_status_id` ASC) VISIBLE,
  CONSTRAINT `fk_shopping_carts_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `e-commerce`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_carts_cart_statuses`
    FOREIGN KEY (`cart_status_id`)
    REFERENCES `e-commerce`.`cart_statuses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `unit_price` INT NOT NULL,
  `total_price` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_shopping_carts1_idx` (`shopping_cart_id` ASC) VISIBLE,
  INDEX `fk_items_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_shopping_carts`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `e-commerce`.`shopping_carts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`order_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`order_statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` VARCHAR(150) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shopping_cart_id` INT NOT NULL,
  `total` INT NOT NULL,
  `order_status_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `address` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_shopping_carts_idx` (`shopping_cart_id` ASC) VISIBLE,
  INDEX `fk_orders_order_statuses_idx` (`order_status_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_shopping_carts`
    FOREIGN KEY (`shopping_cart_id`)
    REFERENCES `e-commerce`.`shopping_carts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_order_statuses`
    FOREIGN KEY (`order_status_id`)
    REFERENCES `e-commerce`.`order_statuses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`subcategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`subcategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `description` VARCHAR(400) NULL,
  `categorie_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subcategories_categories_idx` (`categorie_id` ASC) VISIBLE,
  CONSTRAINT `fk_subcategories_categories`
    FOREIGN KEY (`categorie_id`)
    REFERENCES `e-commerce`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`attributes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`product_attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`product_attributes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(250) NOT NULL,
  `attribute_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_attributes_attributes_idx` (`attribute_id` ASC) VISIBLE,
  INDEX `fk_product_attributes_products_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_attributes_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `e-commerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_attributes_attributes`
    FOREIGN KEY (`attribute_id`)
    REFERENCES `e-commerce`.`attributes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
