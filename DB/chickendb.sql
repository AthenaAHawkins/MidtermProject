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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `photo_url` VARCHAR(500) NULL,
  `description` TEXT(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chicken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chicken` ;

CREATE TABLE IF NOT EXISTS `chicken` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NULL,
  `breed` VARCHAR(45) NOT NULL,
  `height` VARCHAR(20) NULL,
  `city` VARCHAR(100) NULL,
  `gender` VARCHAR(1) NOT NULL,
  `music_taste` VARCHAR(500) NULL,
  `wants_chicks` VARCHAR(10) NULL,
  `astrology` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `pic_url` VARCHAR(600) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chicken_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_chicken_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `events` ;

CREATE TABLE IF NOT EXISTS `events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NULL,
  `location` VARCHAR(200) NOT NULL,
  `time` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL,
  `admission_cost` VARCHAR(200) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_events_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_events_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `forum` ;

CREATE TABLE IF NOT EXISTS `forum` (
  `id` INT NOT NULL,
  `title` VARCHAR(55) NOT NULL,
  `body` VARCHAR(2000) NOT NULL,
  `user_id` INT NOT NULL,
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

SET SQL_MODE = '';
DROP USER IF EXISTS chickenuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'chickenuser'@'localhost' IDENTIFIED BY 'chickenuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'chickenuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`, `photo_url`, `description`) VALUES (3, 'admin', 'admin', 'ADMIN', 1, NULL, 'HBIC');
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`, `photo_url`, `description`) VALUES (1, 'chicken_lover', 'ilovechicks', 'USER', 1, 'https://media.istockphoto.com/id/1147495352/photo/senior-farmer-holding-chickens-on-farm.jpg?s=612x612&w=0&k=20&c=ncgNcfKYv5-I0UoFI739kU7NqVJrpjgE11S6qdDx4Ik=', 'Just a man who loves chickens');
INSERT INTO `user` (`id`, `username`, `password`, `role`, `enabled`, `photo_url`, `description`) VALUES (2, 'EricTheGreat', 'SD', 'USER', 1, 'https://hotpot.ai/s/art-generator/8-a58UmC2ze756cKJ', 'King of chickens');

COMMIT;


-- -----------------------------------------------------
-- Data for table `chicken`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `chicken` (`id`, `name`, `age`, `breed`, `height`, `city`, `gender`, `music_taste`, `wants_chicks`, `astrology`, `user_id`, `pic_url`) VALUES (1, 'Bernice', 5, 'Ganoi', '6 foot', 'Denver', 'F', 'Heavy metal', 'yes', 'Gemini', 1, 'https://media.istockphoto.com/id/176802518/photo/raw-chicken-on-cutting-board.jpg?s=612x612&w=0&k=20&c=f6BVBxu9r0-nEtwlce926KO_n3H26m0xU_f7Cz7B7EU=');
INSERT INTO `chicken` (`id`, `name`, `age`, `breed`, `height`, `city`, `gender`, `music_taste`, `wants_chicks`, `astrology`, `user_id`, `pic_url`) VALUES (2, 'A-aron', 6, 'Feral', '3 foot', 'Mexico City', 'M', 'Classical', 'no', 'Aquarius', 2, 'https://media.springernature.com/full/springer-static/image/art%3A10.1038%2F529270a/MediaObjects/41586_2016_Article_BF529270a_Figa_HTML.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `events`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `events` (`id`, `title`, `location`, `time`, `description`, `admission_cost`, `user_id`) VALUES (1, 'Eggercise In the park', 'Lincoln park', '8:00 am', 'Come do yolkga in the park', '1 egg', 1);
INSERT INTO `events` (`id`, `title`, `location`, `time`, `description`, `admission_cost`, `user_id`) VALUES (2, 'Eggscaperoom', 'Bejing', '11:59pm', 'Put your escape skills to the test', '40 Yuan', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `forum`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `forum` (`id`, `title`, `body`, `user_id`) VALUES (1, 'Why are chickens so cute?', 'I love them', 1);
INSERT INTO `forum` (`id`, `title`, `body`, `user_id`) VALUES (2, 'Falcon defense tips', 'buy a bigger friendlier falcon', 2);

COMMIT;

