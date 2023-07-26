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
  `characteristic` VARCHAR(900) NULL,
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
INSERT INTO `address` (`id`, `city`, `state`, `country`, `zipcode`, `phone_number`, `street`) VALUES (1, 'Denver', 'CO', 'USA', '80108', NULL, '123 Fake st.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `user` (`id`, `username`, `password`, `role`, `picture_url`, `description`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`) VALUES (3, 'admin', 'admin', 'ADMIN', NULL, 'HBIC', NULL, NULL, NULL, 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `picture_url`, `description`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`) VALUES (1, 'chicken_lover', 'ilovechicks', 'USER', 'https://media.istockphoto.com/id/1147495352/photo/senior-farmer-holding-chickens-on-farm.jpg?s=612x612&w=0&k=20&c=ncgNcfKYv5-I0UoFI739kU7NqVJrpjgE11S6qdDx4Ik=', 'Just a man who loves chickens', NULL, NULL, NULL, 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `picture_url`, `description`, `create_date`, `first_name`, `last_name`, `address_id`, `enabled`) VALUES (2, 'EricTheGreat', 'SD', 'USER', 'https://kubrick.htvapps.com/htv-prod-media.s3.amazonaws.com/images/chicken-man-returns-1566939091.jpg?crop=1.00xw:1.00xh;0,0&resize=1200:*', 'King of chickens', NULL, NULL, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `breed`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (1, 'Silkie', 'Silkie chickens have a reputation for standing out due to their fluffy and puffy plumage! Some of you may be imagining a brown or black mess of feathers, but silkie chickens have style in spades compared to some of their cousins, like ISA browns and australorps. Silkies may be small in stature, only weighing approximately 1.5 to 2 kilos, but they always leave a big impression because of their discrete resemblance to celebrities like Lady Gaga, Jimmy Hendrix and Vivienne Westwood. Silkie chickens are such a remarkable breed that the great merchant and traveller Marco Polo, after encountering them in China, felt compelled to bring some back to the west with him. What would other visionaries like Albert Einstein, Andy Warhol and Coco Chanel have made of silkie chickens? One can only assume that they would have been humbled by the brilliance of these unique birds. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/silkie-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (2, 'ISA Brown', 'The ISA Brown is a humble chook. The name ISA Brown is not actually a breed name, but a copyrighted brand name. The breed was developed and patented by a French company in 1978 for optimum egg production and since then their popularity has grown to great heights. They are a well-known choice for backyard chicken coop keepers and farmers alike, and these gorgeous girls are a renowned favourite for a bunch of reasons. We love the ISA Brown for her gentle nature, her resilience and her egg-straordinary egg laying talents that leave all other hens in the dust-bath! ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/isa-brown-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (3, 'Plymouth Rock', 'The Plymouth Rock chicken is a wonderful breed of chook for first time keepers and seasoned Chicken Ladies and Lads alike. They are relaxed, resplendent and responsive and make any coop a more loving and fun place to be. Introduced in the late 1900s, the breed was named after the town of its origin and quickly rose in popularity across America due to their egg-cellent egg laying skills and their laid back look on life. Plymouth Rock hens make great additions to backyard chicken coops and our egg-sperts just love their chilled out vibe and kid-friendly nature.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/plymouth-rock-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (4, 'Barnevelder', 'The Dutch bred barnevelder breed has to be one of the most popular, distinctive and attractive types of backyard chickens in Australia. Though breeds like ISA Browns, Australorps and Orpingtons are of course intensely popular due to their high egg yield, barnevelders are still a standout breed due to its unique plumage, quirky personality and of course those pretty and peculiar eggs that they lay. But, for most Chicken Ladies, it will be love at first sight when they see the iridescent green tinge in the feathers of a barnevelder chook. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/barnevelder-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (5, 'Australorp', 'Aussie, Aussie, Aussie – cluck, cluck, cluck! That’s the response you’ll get if you have a coop full of frisky, friendly and fabulous australorps! The locally bred australorps are a favourite in many Australian backyards due to their brilliant black, white or blue plumage, eggceptional egg laying talents and their characteristic happy-go-clucky Aussie attitude. Though we absolutely love chickens from all over the world, from the elegant English orpingtons to the alluring American Rhode Island Reds, there is something special about a homebred lady. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/australorp-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (6, 'Naked Neck', 'Most Chicken Ladies will never forget the first time they their lay eyes upon a distinctive, quirky and downright bizarre naked neck chicken. When animal lovers first see a naked neck chicken most, without meaning to cause offense, say, “what’s wrong with that chicken?” Yes, these girls sure look peculiar, but it’s the way nature made them. Originating from Transylvania, naked neck chickens are famous for having featherless necks, which sort of make them look like turkeys. There has been some rabble that naked necks are in fact a cross between a turkey and a chicken, however this conspiracy theory has long since been debunked by scientists. Naked neck chickens are undeniably different on their own terms, like Cyndi Lauper or Freddy Mercury, which only makes this exceptional breed all the more loveable.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/naked-neck-chicken-in-backyard1.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (7, 'Orpington', 'The cute, courteous and courtly orpington chicken might very well be one of the best mother’s in all of the animal kingdom. Created by British poultry breeders at the turn of the 20th century, the orpington chicken was designed to be a hardy breed that can endure England’s most bitter winters, whilst still laying at an unstoppable rate. These heavy-set, fluffy and cuddly ladies will be a figure of grace and dignity in any coop. Orpington chickens may seem homely and commonplace however these powerhouse egg laying wonders will make an eggstraordinary addition to any chicken lovers flock.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/orpington-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (8, 'New Hampshire Red', 'The New Hampshire chicken breed is a reliable and robust hen that doesn’t disappoint when it comes to producing delicious eggs or forming wonderful feathered friendships. These girls are gentle and warm, make egg-cellent mums and are quietly beautiful. Think of the New Hampshire chook as the hen-next-door, an unassuming chicken that is definitely more worthy of your attention than her looks let on. The breed was developed in the early 1900s by New Hampshire farmers who wanted to improve on the existing Rhode Island Reds and have a chicken breed to call their very own. The farmers focused on breeding hens that were fast growing, early to lay and hardy in the bitterly cold winters of the north-eastern US state. The resulting delightful bird was officially coined the New Hampshire in 1935.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/new-hampshire-red-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (9, 'Frizzle', 'The dramatic and stunning Frizzle chicken is a curious looking chook with a warm temperament and a surprising amount of grit for someone so glamourous! These girls come in standard and bantam sizes and have unique feathers that curl outwards instead of lying flat. To the untrained eye, these Frizzle feathers give them the appearance of someone who has had an unfortunate blow dry, but these girls are ahead of the times! They know they are setting trends with their uncommon looks and wear their frazzled and fluffy feathers with pride. These ladies can usually be found parading around a show ring, taking home ribbons for their frizzle factor, but they aren’t just the next starlet in line to fall from grace! The Frizzle chicken is not above joining the common backyard flock and makes a wonderful choice of pet for your family and a great addition to your coop. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/frizzle-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (10, 'Belgian d’Uccle', 'The Belgian d’Uccle chicken is one of the sweetest, loveliest and cuddliest pets in the whole wide world. Originating from Uccle in Belgium these vibrant ladies come in many different shapes, colours and sizes. Whether you’re looking for a chicken that looks as stunning and stylish as a casino dancer or if you are simply looking for a chook that’s sleek, elegant and classic, you’ll surely be able to find a Belgian d’Uccle that suits your unique taste.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/belgian-duccle-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (11, 'Rhode Island Red', 'Rhode Island Reds are the go-to chicken breed for backyard chook keepers who want a laidback layer to add to their flock. These hens are renowned for their hardiness in any type of environment. Rain or shine, snow or summer sun, the Rhode Island Red is happy-go-clucky in any type of backyard! They are a girl with grit, but don’t let that robust demeanour fool you, these ruby red ladies also possess a lot of heart! They make the perfect companion pet for any Chicken Lady or Lad and a great friend for kids, both big and small. Developed on the poultry farms in Little Compton, Rhode Island in the late 1800s, the Rhode Island Red breed grew in popularity throughout the United States, eventually becoming the state bird of… you guessed it - Rhode Island! A well-deserved honour for such a friendly and easy to care for chook! ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/rhode-island-red-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (12, 'Polish', 'Love may be blind but style has twenty-twenty vision and Polish chickens have exceptional senses when it comes to fashion! Beauty may only be only skin deep but these glamorous girls are gorgeous inside and out. Stunning looks, sweet personality, mysterious history, polish chickens are a real catch when it comes to backyard chooks. If you’re looking for a glamorous chicken to love than look no further than these fabulously feathered friends.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/polish-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (13, 'Cochin', 'It might be hard for modern day chicken ladies and lads to believe, but there was a time when people weren’t as crazy for chickens as we are today! YES! In fact, prior to the 1800s, chickens were seen as part of the farming landscape, existing to provide eggs and Sunday dinner and not much else. Definitely not the adored and spoiled backyard girls we raise today! Cochins played a big part in starting the modern day craze of keeping chickens and their friendly nature and unique looks still inspire chicken keepers today. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/cochin-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (14, 'Leghorn', 'Leghorn chickens are adventurous, spirited, friendly and wondrous egg-layers. First developed in Livorno (Italian for “Leghorn”) in Tuscany and brought to Britain in the late 1800s, they became a popular purebred chicken in America and later Australia. The Leghorn chickens’ egg laying prowess, savvy attitudes and bold personalities made them the most common purebred fowl in Australia in the early to mid 1900s.', 'https://m.media-amazon.com/images/M/MV5BZWQ2Njg2MTEtMDg1Ni00YmVkLWJlMjgtYzk0OTgyZmZjZjk4XkEyXkFqcGdeQXVyNDgyODgxNjE@._V1_.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (15, 'Sussex', 'Sussex chickens are a brilliant addition to any backyard chicken coop looking for a chook with grace, a friendly nature and a little grit. Their long and distinguished family background and kind and curious nature make Sussex chickens perfect for novice chicken keepers and those wanting a friendly hen to add to their growing backyard menagerie. You’ll never be alone with a Sussex chicken, these girls make wonderful companion birds. They enjoy the spoils of being part of their beloved family, foraging alongside you and taking a turn about the garden grounds, but are just as content when mingling with their fellow splendid fowls in the garden, the coop or the chicken run and finding their place in the pecking order of society. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/sussex-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (16, 'Araucana', 'Araucanas are eye-catching chickens that always leave an impression in or outside the coop. These uniquely feathered blue egg laying beauties sure know how to stand out in a world cluck-full of all kinds of pretty poultry. From their energetic personalities to their distinctive featherings, there is simply nothing ordinary about Araucana chickens – these girls were made to stand out! ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/aracauna-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (17, 'Wyandotte', 'Wyandotte chickens are bold, beautiful and brassy birds both inside and out. The Wyandotte breed was first established in 1883 in North America. Having admired the perfect plumage of the British Sebright chicken, American breeders set out to create a practical, but no less pretty, version to suit the new world. Popularity was slow growing, but eventually Wyandotte chickens became main players on the dual purpose scene, providing meat and eggs for a fast moving America. Their bold temperaments and stunning array of plumage colours make them a great choice for backyard chicken keepers who want an easy going and easy on the eye chook to add to their flock.', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/wyandotte-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (18, ' Minorca', 'Minorca chickens are graceful and energetic senoritas that share their name with a beautiful island off the west coast of Spain. Adopted by the British in the late 18th century these sleek ladies with spicy personalities were hugely popular for approximately 100 years before being trumped by hybrid breeds and other more prolific laying hens in the later 20th century. Now on the verge of extinction, these truly remarkable ladies deserve to have their names up in lights in backyard coops all over the world!', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/minorca-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (19, 'Faverolles', 'Developed in Northern France at the turn of the 20th century, Faverolles are a fluffy and feathery breed famous for their genial nature and good looks. Faverolles is a composite breed created from a combination of Cochins, Houdans and Dorkings that is big, strong and healthy in size, as well as being regular and reliable layers. Other popular composite breeds from this period include Rhode Island Reds, Plymouth Rock, Wyandotte and Barnevelders. However, Faverolles are definitely one of the most fabulous. It will only take a matter of moments for these friendly french ladies to soar into your hearts and minds. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/faverolles-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (20, 'Sebright', 'Sebright chickens are unique and exotic looking ladies with sweet temperaments and a penchant for curiosity. In the early 1800s Sir John Sebright – a member of the British Parliament and avid animal keeper – set out to create his vision of the perfect chicken. The resulting fantastically feathered fowl was the Sebright bantam and these small but perfectly formed birds became popular with highfalutin poultry fanciers across the British isles and beyond. Sir John took the formula for creating the Sebright breed to his grave, but it is rumored that they were developed from a mix of the Polish, Nankin and Hamburg breeds of chicken. These rare and individual birds can be hard to find, but once you’ve owned a Sebright chicken, you’ll forever be changed. ', 'https://cdn.shopify.com/s/files/1/0039/4647/9689/files/sebright-chicken-in-backyard.jpg');
INSERT INTO `breed` (`id`, `name`, `characteristic`, `picture_url`) VALUES (21, 'Other', 'Cock-a-doodle-doo Bwak! Bwwwaaaaaaaaaak Honk cluck Cluckity Bok Cluck-cluck-cluck Pukaaak Honk Gobble-gobble Gobble-gobble cluck-a-buh-gawk? Cock-a-doodle-doo Puk. Bwwwaaaaaaaaaak bok Cluck-a-buh-gawk Cluck-a-buh-gawk Puk cluck-a-buh-gawk Cluck-a-buh-gawk Honk... Cluckity Bok bok. Waaak Cluck! Pukaaak Waaak honk Bwak honk Gobble-gobble Pukaaak Cluck-cluck-cluck cluck-a-buh-gawk bwwwaaaaaaaaaak Bok Puk Bwok cluck Bwok cluck cluck-a-buh-gawk Bwwwaaaaaaaaaak... Cock-a-doodle-doo Honk Cluck-cluck-cluck... Pukaaak! Cock-a-doodle-doo Waaak cluck-a-buh-gawk Cock-a-doodle-doo Cluck-a-buh-gawk bwwwaaaaaaaaaak Puk Cluck-cluck-cluck Pukaaak puk Puk Bwwwaaaaaaaaaak cluck-a-buh-gawk bwak gobble-gobble Pukaaak bwwwaaaaaaaaaak bwak Gobble-gobble Gobble-gobble Bwwwaaaaaaaaaak Gobble-gobble Gobble-gobble Pukaaak bok?', 'https://st3.depositphotos.com/5247073/16951/v/450/depositphotos_169512116-stock-illustration-cockatrice-silhouette-ancient-mythology-fantasy.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `chicken`
-- -----------------------------------------------------
START TRANSACTION;
USE `chickendb`;
INSERT INTO `chicken` (`id`, `name`, `birthday`, `inches`, `gender`, `music_taste`, `wants_chicks`, `user_id`, `picture_url`, `breed_id`, `description`, `create_date`) VALUES (1, 'Bernice', '1990-12-25', 72, 'F', 'Heavy metal', 1, 1, 'https://media.istockphoto.com/id/176802518/photo/raw-chicken-on-cutting-board.jpg?s=612x612&w=0&k=20&c=f6BVBxu9r0-nEtwlce926KO_n3H26m0xU_f7Cz7B7EU=', 1, 'Likes long walks on the beach', NULL);
INSERT INTO `chicken` (`id`, `name`, `birthday`, `inches`, `gender`, `music_taste`, `wants_chicks`, `user_id`, `picture_url`, `breed_id`, `description`, `create_date`) VALUES (2, 'A-aron', '1890-07-23', 36, 'M', 'Classical', 0, 1, 'https://media.springernature.com/full/springer-static/image/art%3A10.1038%2F529270a/MediaObjects/41586_2016_Article_BF529270a_Figa_HTML.jpg', 1, 'Likes to party', NULL);
INSERT INTO `chicken` (`id`, `name`, `birthday`, `inches`, `gender`, `music_taste`, `wants_chicks`, `user_id`, `picture_url`, `breed_id`, `description`, `create_date`) VALUES (3, 'Bernicer', '1990-5-22', 27, 'M', 'Heavy metal', 1, 2, 'https://cdn.britannica.com/07/183407-050-C35648B5/Chicken.jpg', 1, 'Likes long walks on the beach', NULL);
INSERT INTO `chicken` (`id`, `name`, `birthday`, `inches`, `gender`, `music_taste`, `wants_chicks`, `user_id`, `picture_url`, `breed_id`, `description`, `create_date`) VALUES (4, 'B-Becky', '1890-1-25', 63, 'F', 'Classical', 0, 2, 'https://media.istockphoto.com/id/1420724418/photo/hen-hatching-eggs-in-nest-of-straw-inside-chicken-coop.jpg?b=1&s=170667a&w=0&k=20&c=cF-mIk0JXIZ3IixapvlHvBNx3lvg48GSK2KGQzwph4g=', 1, 'Likes to party', NULL);

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

