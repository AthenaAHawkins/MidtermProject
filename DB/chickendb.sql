-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema chickendb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `chickendb` ;

-- -----------------------------------------------------
-- Schema chickendb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chickendb` DEFAULT CHARACTER SET utf8 ;
USE `chickendb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zipcode` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `street` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `picture_url` VARCHAR(2000) NULL,
  `description` TEXT NOT NULL,
  `create_date` DATETIME NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `breed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `breed` ;

CREATE TABLE IF NOT EXISTS `breed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(600) NULL,
  `characteristic` VARCHAR(200) NULL,
  `picture_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chicken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chicken` ;

CREATE TABLE IF NOT EXISTS `chicken` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `birthday` DATETIME NULL,
  `inches` DOUBLE NULL,
  `gender` CHAR(1) NOT NULL,
  `music_taste` VARCHAR(500) NULL,
  `wants_chicks` TINYINT NULL,
  `user_id` INT NOT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `breed_id` INT NOT NULL,
  `description` TEXT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chicken_user1_idx` (`user_id` ASC),
  INDEX `fk_chicken_breed1_idx` (`breed_id` ASC),
  CONSTRAINT `fk_chicken_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chicken_breed1`
    FOREIGN KEY (`breed_id`)
    REFERENCES `breed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NULL,
  `start_time` TIME NOT NULL,
  `end_time` TIME NULL,
  `event_date` DATE NOT NULL,
  `description` TEXT NULL,
  `address_id` INT NOT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `creator_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_address1_idx` (`address_id` ASC),
  INDEX `fk_event_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_event_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `content` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  `post_date` DATETIME NULL,
  `picture_url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_forum_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_forum_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chicken_owner_has_chicken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chicken_owner_has_chicken` ;

CREATE TABLE IF NOT EXISTS `chicken_owner_has_chicken` (
  `chicken_owner_id` INT NOT NULL,
  `chicken_id` INT NOT NULL,
  PRIMARY KEY (`chicken_owner_id`, `chicken_id`),
  INDEX `fk_chicken_owner_has_chicken_chicken1_idx` (`chicken_id` ASC),
  CONSTRAINT `fk_chicken_owner_has_chicken_chicken1`
    FOREIGN KEY (`chicken_id`)
    REFERENCES `chicken` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `currency` ;

CREATE TABLE IF NOT EXISTS `currency` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_currency` ;

CREATE TABLE IF NOT EXISTS `event_currency` (
  `currency_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `amount` INT NULL,
  PRIMARY KEY (`currency_id`, `event_id`),
  INDEX `fk_currency_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_currency_has_event_currency1_idx` (`currency_id` ASC),
  CONSTRAINT `fk_currency_has_event_currency1`
    FOREIGN KEY (`currency_id`)
    REFERENCES `currency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_currency_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_comment` ;

CREATE TABLE IF NOT EXISTS `post_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_date` DATETIME NULL,
  `post_content` TEXT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_post_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_post_comment_post_comment1_idx` (`in_reply_to_id` ASC),
  CONSTRAINT `fk_post_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_comment_post_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `post_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_attendee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_attendee` ;

CREATE TABLE IF NOT EXISTS `event_attendee` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_date` DATETIME NULL,
  `post_content` TEXT NULL,
  `user_id` INT NOT NULL,
  `picture_url` VARCHAR(2000) NULL,
  `in_reply_to_id` INT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_post_comment_post_comment1_idx` (`in_reply_to_id` ASC),
  INDEX `fk_event_comment_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_post_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_comment_post_comment10`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `event_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_comment_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_like` ;

CREATE TABLE IF NOT EXISTS `post_like` (
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `love` TINYINT NULL,
  PRIMARY KEY (`post_id`, `user_id`),
  INDEX `fk_post_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_post_has_user_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_user_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_image` ;

CREATE TABLE IF NOT EXISTS `post_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `picture_url` VARCHAR(2000) NULL,
  `caption` VARCHAR(100) NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_image_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_image_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS chickenuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'chickenuser'@'localhost' IDENTIFIED BY 'chickenuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'chickenuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `address` (`id`, `city`, `state`, `country`, `zipcode`, `phone_number`, `street`) VALUES (1, 'Denver', 'CO', 'USA', '80108', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `user` (`id`, `username`, `password`, `role`, `picture_url`, `description`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`) VALUES (3, 'admin', 'admin', 'ADMIN', NULL, 'HBIC', NULL, NULL, NULL, 1, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `picture_url`, `description`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`) VALUES (1, 'chicken_lover', 'ilovechicks', 'USER', 'https://media.istockphoto.com/id/1147495352/photo/senior-farmer-holding-chickens-on-farm.jpg?s=612x612&w=0&k=20&c=ncgNcfKYv5-I0UoFI739kU7NqVJrpjgE11S6qdDx4Ik=', 'Just a man who loves chickens', NULL, NULL, NULL, 1, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `picture_url`, `description`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`) VALUES (2, 'EricTheGreat', 'SD', 'USER', 'https://kubrick.htvapps.com/htv-prod-media.s3.amazonaws.com/images/chicken-man-returns-1566939091.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*', 'King of chickens', NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `breed`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (1, 'Silkie', 'Fluffy', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `chicken`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `chicken` (`id`, `name`, `birthday`, `inches`, `gender`, `music_taste`, `wants_chicks`, `user_id`, `picture_url`, `breed_id`, `description`, `create_date`) VALUES (1, 'Bernice', '1990-12-25', 72, 'F', 'Heavy metal', 1, 1, 'https://media.istockphoto.com/id/176802518/photo/raw-chicken-on-cutting-board.jpg?s=612x612&w=0&k=20&c=f6BVBxu9r0-nEtwlce926KO_n3H26m0xU_f7Cz7B7EU=', 1, NULL, NULL);
INSERT INTO `chicken` (`id`, `name`, `birthday`, `inches`, `gender`, `music_taste`, `wants_chicks`, `user_id`, `picture_url`, `breed_id`, `description`, `create_date`) VALUES (2, 'A-aron', '1890-07-23', 36, 'M', 'Classical', 0, 2, 'https://media.springernature.com/full/springer-static/image/art%3A10.1038%2F529270a/MediaObjects/41586_2016_Article_BF529270a_Figa_HTML.jpg', 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `event` (`id`, `title`, `start_time`, `end_time`, `event_date`, `description`, `address_id`, `picture_url`, `creator_id`, `create_date`, `last_update`) VALUES (1, 'Eggercise In the park', '08:00:00', NULL, '2023-08-28', 'Come do yolkga in the park', 1, NULL, 1, NULL, NULL);
INSERT INTO `event` (`id`, `title`, `start_time`, `end_time`, `event_date`, `description`, `address_id`, `picture_url`, `creator_id`, `create_date`, `last_update`) VALUES (2, 'Eggscaperoom', '23:00:00', NULL, '2024-11-05', 'Put your escape skills to the test', 1, NULL, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `post` (`id`, `title`, `content`, `user_id`, `post_date`, `picture_url`) VALUES (1, 'Why are chickens so cute?', 'I love them', 1, NULL, NULL);
INSERT INTO `post` (`id`, `title`, `content`, `user_id`, `post_date`, `picture_url`) VALUES (2, 'Falcon defense tips', 'Buy a bigger friendlier falcon', 2, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `currency`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `currency` (`id`, `type`) VALUES (1, 'egg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_currency`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `event_currency` (`currency_id`, `event_id`, `amount`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `post_comment` (`id`, `comment_date`, `post_content`, `user_id`, `post_id`, `picture_url`, `in_reply_to_id`) VALUES (1, NULL, 'cool chickens!', 1, 1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_attendee`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `event_attendee` (`user_id`, `event_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `event_comment` (`id`, `comment_date`, `post_content`, `user_id`, `picture_url`, `in_reply_to_id`, `event_id`) VALUES (1, '2019-11-11', 'event was lit', 1, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_like`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `post_like` (`post_id`, `user_id`, `love`) VALUES (1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `post_image` (`id`, `picture_url`, `caption`, `post_id`) VALUES (1, NULL, 'test pic', 1);

COMMIT;

