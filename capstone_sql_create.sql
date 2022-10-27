-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capstone` DEFAULT CHARACTER SET utf8 ;
USE `capstone` ;

-- -----------------------------------------------------
-- Table `capstone`.`Restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Restaurant` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Restaurant` (
  `Rest_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`Rest_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`user` ;

CREATE TABLE IF NOT EXISTS `capstone`.`user` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `log_name` VARCHAR(45) NULL,
  `log_password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`order` ;

CREATE TABLE IF NOT EXISTS `capstone`.`order` (
  `order_id` INT NOT NULL,
  `rest_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `payment_cd` CHAR NULL,
  `delivery_cd` CHAR NULL,
  `order_date` DATETIME NULL,
  `order_total` DOUBLE NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_rest_id_idx` (`rest_id` ASC) VISIBLE,
  INDEX `fk_order_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_rest_id`
    FOREIGN KEY (`rest_id`)
    REFERENCES `capstone`.`Restaurant` (`Rest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `capstone`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Restaurant_Item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`Restaurant_Item` ;

CREATE TABLE IF NOT EXISTS `capstone`.`Restaurant_Item` (
  `rest_item_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `price` DOUBLE NULL,
  `Rest_id` INT NOT NULL,
  PRIMARY KEY (`rest_item_id`),
  INDEX `fk_Restaurant_Item_Restaurant1_idx` (`Rest_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_Item_Restaurant1`
    FOREIGN KEY (`Rest_id`)
    REFERENCES `capstone`.`Restaurant` (`Rest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`order_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `capstone`.`order_detail` ;

CREATE TABLE IF NOT EXISTS `capstone`.`order_detail` (
  `order_detail_id` INT NOT NULL,
  `rest_id` INT NULL,
  `restaurant_item_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  INDEX `fk_order_detail_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_detail_restaurant_idx` (`rest_id` ASC) VISIBLE,
  INDEX `fk_order_detail_rest_item_idx` (`restaurant_item_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_detail_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `capstone`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_restaurant`
    FOREIGN KEY (`rest_id`)
    REFERENCES `capstone`.`Restaurant` (`Rest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_rest_item`
    FOREIGN KEY (`restaurant_item_id`)
    REFERENCES `capstone`.`Restaurant_Item` (`rest_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `capstone`.`Restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `capstone`;
INSERT INTO `capstone`.`Restaurant` (`Rest_id`, `name`, `address`, `postal_code`) VALUES (001, 'Pizza Pizza', '1 Pizza Street', 'K1K 2W3');
INSERT INTO `capstone`.`Restaurant` (`Rest_id`, `name`, `address`, `postal_code`) VALUES (002, 'Green Fresh', '222 Arthur Street', 'K2K 3R3');
INSERT INTO `capstone`.`Restaurant` (`Rest_id`, `name`, `address`, `postal_code`) VALUES (003, 'Lone Star', '123 March Rd', 'K2W 1C8');

COMMIT;


-- -----------------------------------------------------
-- Data for table `capstone`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `capstone`;
INSERT INTO `capstone`.`user` (`user_id`, `first_name`, `last_name`, `log_name`, `log_password`, `email`, `address`, `postal_code`) VALUES (001, 'John', 'Lagarde', 'jlagarde', 'password', 'jlargade@gmail.com', '2 Klondike Rd', 'K2W 1E3');
INSERT INTO `capstone`.`user` (`user_id`, `first_name`, `last_name`, `log_name`, `log_password`, `email`, `address`, `postal_code`) VALUES (002, 'Gina', 'Marconi', 'gmarconi', 'password', 'gmarconi@gmail.com', '45 Garrity Crescent', 'K2J 3T4');
INSERT INTO `capstone`.`user` (`user_id`, `first_name`, `last_name`, `log_name`, `log_password`, `email`, `address`, `postal_code`) VALUES (003, 'Bambi', 'Tooti', 'btooti', 'password', 'btooti@gmail.com', '145 Morrison Drive', 'K7M 5T8');
INSERT INTO `capstone`.`user` (`user_id`, `first_name`, `last_name`, `log_name`, `log_password`, `email`, `address`, `postal_code`) VALUES (004, 'Bob', 'Hope', 'bhope', 'password', 'bhope@gmail.com', '298 Riley Ave', 'K7T 7T8');

COMMIT;


-- -----------------------------------------------------
-- Data for table `capstone`.`order`
-- -----------------------------------------------------
START TRANSACTION;
USE `capstone`;
INSERT INTO `capstone`.`order` (`order_id`, `rest_id`, `user_id`, `payment_cd`, `delivery_cd`, `order_date`, `order_total`) VALUES (0001, 001, 001, '1', '0', '2022-10-23', 20);
INSERT INTO `capstone`.`order` (`order_id`, `rest_id`, `user_id`, `payment_cd`, `delivery_cd`, `order_date`, `order_total`) VALUES (0002, 002, 002, '1', '0', '2022-10-26', 30);
INSERT INTO `capstone`.`order` (`order_id`, `rest_id`, `user_id`, `payment_cd`, `delivery_cd`, `order_date`, `order_total`) VALUES (003, 003, 003, '1', '1', '2022-10-26', 66);

COMMIT;


-- -----------------------------------------------------
-- Data for table `capstone`.`Restaurant_Item`
-- -----------------------------------------------------
START TRANSACTION;
USE `capstone`;
INSERT INTO `capstone`.`Restaurant_Item` (`rest_item_id`, `name`, `price`, `Rest_id`) VALUES (001, 'House Special Combo ', 15, 001);
INSERT INTO `capstone`.`Restaurant_Item` (`rest_item_id`, `name`, `price`, `Rest_id`) VALUES (002, 'Deluxe Pizza', 12, 001);
INSERT INTO `capstone`.`Restaurant_Item` (`rest_item_id`, `name`, `price`, `Rest_id`) VALUES (003, 'Veggie Burger', 10, 002);
INSERT INTO `capstone`.`Restaurant_Item` (`rest_item_id`, `name`, `price`, `Rest_id`) VALUES (004, 'Veggie Hot Dog', 9, 002);
INSERT INTO `capstone`.`Restaurant_Item` (`rest_item_id`, `name`, `price`, `Rest_id`) VALUES (005, 'Miso Soup', 6, 003);
INSERT INTO `capstone`.`Restaurant_Item` (`rest_item_id`, `name`, `price`, `Rest_id`) VALUES (006, 'Sushi Box', 12, 003);

COMMIT;


-- -----------------------------------------------------
-- Data for table `capstone`.`order_detail`
-- -----------------------------------------------------
START TRANSACTION;
USE `capstone`;
INSERT INTO `capstone`.`order_detail` (`order_detail_id`, `rest_id`, `restaurant_item_id`, `order_id`) VALUES (0001, 001, 001, 0001);
INSERT INTO `capstone`.`order_detail` (`order_detail_id`, `rest_id`, `restaurant_item_id`, `order_id`) VALUES (0002, 001, 002, 0001);
INSERT INTO `capstone`.`order_detail` (`order_detail_id`, `rest_id`, `restaurant_item_id`, `order_id`) VALUES (0003, 001, 003, 0001);

COMMIT;

