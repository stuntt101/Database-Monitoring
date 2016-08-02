SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mine_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mine_management` DEFAULT CHARACTER SET utf8 ;
USE `mine_management` ;

-- -----------------------------------------------------
-- Table `mine_management`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`admin` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`region` (
  `region_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`region_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`mine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`mine` (
  `mine_number` INT(11) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mine_number`),
  INDEX `fk_mine_region_idx` (`region_name` ASC),
  CONSTRAINT `fk_mine_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`boiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`boiler` (
  `boiler_number` INT(11) NOT NULL,
  `mine_number` INT(11) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `new_boiler` VARCHAR(45) NOT NULL,
  `previous_region` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `type_of_boiler` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `country_of_origion` VARCHAR(45) NOT NULL,
  `serial_number` VARCHAR(45) NOT NULL,
  `year_manufactured` INT(11) NOT NULL,
  `year_installed` INT(11) NOT NULL,
  `max_authorized_working_pressure` FLOAT NOT NULL,
  `evaporative_capacity` VARCHAR(45) NOT NULL,
  `source_of_heat` VARCHAR(45) NOT NULL,
  `boiler_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`boiler_number`),
  INDEX `fk_boiler_mine_idx` (`mine_number` ASC),
  INDEX `fk_boiler_region_idx` (`region_name` ASC),
  CONSTRAINT `fk_boiler_mine`
    FOREIGN KEY (`mine_number`)
    REFERENCES `mine_management`.`mine` (`mine_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boiler_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`shaft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`shaft` (
  `shaft_number` INT(11) NOT NULL,
  `shaft_name` VARCHAR(45) NOT NULL,
  `mine_number` INT(11) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `new_shaft` VARCHAR(45) NOT NULL,
  `shaft_status` VARCHAR(45) NOT NULL,
  `shaft_shape` VARCHAR(45) NOT NULL,
  `shaft_dimensions` VARCHAR(45) NOT NULL,
  `ventilation_flow` VARCHAR(45) NOT NULL,
  `shaft_condition` VARCHAR(45) NOT NULL,
  `water_condition` VARCHAR(45) NOT NULL,
  `avg_person_transported_per_day` FLOAT NOT NULL,
  `vertical_shaft_depth` VARCHAR(45) NOT NULL,
  `inclination_length` FLOAT NOT NULL,
  `inclination_angle` FLOAT NOT NULL,
  `number_of_ropes` INT(11) NOT NULL,
  `shaftcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`shaft_number`),
  INDEX `fk_shaft_mine_idx` (`mine_number` ASC),
  INDEX `fk_shaft_region_idx` (`region_name` ASC),
  CONSTRAINT `fk_shaft_mine`
    FOREIGN KEY (`mine_number`)
    REFERENCES `mine_management`.`mine` (`mine_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shaft_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`chairlift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`chairlift` (
  `chairlift_number` INT(11) NOT NULL,
  `mine_number` INT(11) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `new_chairlift` VARCHAR(45) NOT NULL,
  `previous_region` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `shaft_number` INT(11) NOT NULL,
  `shaft_name` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `year manufactured` INT(11) NOT NULL,
  `year_installed` INT(11) NOT NULL,
  `chairliftcol` VARCHAR(45) NOT NULL,
  `distance_between_drive_and_return_sheave` FLOAT NOT NULL,
  `max_no_of_chair` FLOAT NOT NULL,
  `distance_between_chairs` FLOAT NOT NULL,
  `chair_speed` FLOAT NOT NULL,
  `capacity` INT(11) NOT NULL,
  `max_inclination_angle` FLOAT NOT NULL,
  `chair_connection` VARCHAR(45) NOT NULL,
  `chair_type` VARCHAR(45) NOT NULL,
  `power_of_driving_motor` FLOAT NOT NULL,
  `main_break_type` VARCHAR(45) NOT NULL,
  `backup_break_type` VARCHAR(45) NOT NULL,
  `installation_type` VARCHAR(45) NOT NULL,
  `hauling_chain_rope_particulars` VARCHAR(45) NOT NULL,
  `drawings` VARCHAR(45) NOT NULL,
  `manufacturer_specification` VARCHAR(45) NOT NULL,
  `rope_and_chains_particulars` VARCHAR(45) NOT NULL,
  `rope_tensioning_device` VARCHAR(45) NOT NULL,
  `special_carries` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`chairlift_number`),
  INDEX `fk_chairlift_mine_idx` (`mine_number` ASC),
  INDEX `fk_chairlift_region_idx` (`region_name` ASC),
  INDEX `fk_chairlift_shaft_idx` (`shaft_number` ASC),
  CONSTRAINT `fk_chairlift_mine`
    FOREIGN KEY (`mine_number`)
    REFERENCES `mine_management`.`mine` (`mine_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chairlift_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chairlift_shaft`
    FOREIGN KEY (`shaft_number`)
    REFERENCES `mine_management`.`shaft` (`shaft_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`inspector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`inspector` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NULL DEFAULT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  INDEX `fk_inspector_region_idx` (`region_name` ASC),
  CONSTRAINT `fk_inspector_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`lift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`lift` (
  `lift_number` INT(11) NOT NULL,
  `mine_number` INT(11) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `new_lift` VARCHAR(45) NOT NULL,
  `lift_status` VARCHAR(45) NOT NULL,
  `is_lift_installed_in_a_shaft` VARCHAR(45) NOT NULL,
  `shaft_number` INT(11) NOT NULL,
  `conveyance_type` VARCHAR(45) NOT NULL,
  `conveyance_mass` FLOAT NOT NULL,
  `load_mass` FLOAT NOT NULL,
  `load_type` VARCHAR(45) NOT NULL,
  `wind_length` FLOAT NOT NULL,
  `max_winding_speed` FLOAT NOT NULL,
  `number_of_landings` INT(11) NOT NULL,
  PRIMARY KEY (`lift_number`),
  INDEX `fk_lift_mine_idx` (`mine_number` ASC),
  INDEX `fk_lift_region_idx` (`region_name` ASC),
  INDEX `fk_lift_shaft_idx` (`shaft_number` ASC),
  CONSTRAINT `fk_lift_mine`
    FOREIGN KEY (`mine_number`)
    REFERENCES `mine_management`.`mine` (`mine_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lift_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lift_shaft`
    FOREIGN KEY (`shaft_number`)
    REFERENCES `mine_management`.`shaft` (`shaft_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`manager` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NULL DEFAULT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `mine_number` INT(11) NOT NULL,
  PRIMARY KEY (`username`),
  INDEX `fk_manager_region_idx` (`region_name` ASC),
  INDEX `fk_manager_mine_idx` (`mine_number` ASC),
  CONSTRAINT `fk_manager_mine`
    FOREIGN KEY (`mine_number`)
    REFERENCES `mine_management`.`mine` (`mine_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_manager_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mine_management`.`winder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mine_management`.`winder` (
  `winder_number` INT(11) NOT NULL,
  `mine_number` INT(11) NOT NULL,
  `mine_name` VARCHAR(45) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL,
  `previous_region` VARCHAR(45) NOT NULL,
  `new_winder` VARCHAR(45) NOT NULL,
  `previous_number` INT(11) NOT NULL,
  `date_of_application` DATE NOT NULL,
  `winder_type` VARCHAR(45) NOT NULL,
  `shaft_number` INT(11) NOT NULL,
  `shaft_name` VARCHAR(45) NOT NULL,
  `winder_status` VARCHAR(45) NOT NULL,
  `winder_class` VARCHAR(45) NOT NULL,
  `date_permit_issued` DATE NOT NULL,
  `top_clearance` INT(11) NOT NULL,
  `bottom_clearance` INT(11) NOT NULL,
  `sheave_diameter` FLOAT NOT NULL,
  `sheave_or_rope_ratio` FLOAT NOT NULL,
  `max_no_of_persons` INT(11) NOT NULL,
  `max_mass_material` FLOAT NOT NULL,
  `max_mass_mineral` FLOAT NOT NULL,
  `depth_indicate_type` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `year_manufactured` INT(11) NOT NULL,
  `number_of_motors_used` INT(11) NOT NULL,
  `prime_mover` VARCHAR(45) NOT NULL,
  `power_rating` VARCHAR(45) NOT NULL,
  `rpm` VARCHAR(45) NOT NULL,
  `supply_voltage` VARCHAR(45) NOT NULL,
  `mg_set` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`winder_number`),
  INDEX `fk_winder_mine_idx` (`mine_number` ASC),
  INDEX `fk_winder_region_idx` (`region_name` ASC),
  INDEX `fk_winder_shaft_idx` (`shaft_number` ASC),
  CONSTRAINT `fk_winder_mine`
    FOREIGN KEY (`mine_number`)
    REFERENCES `mine_management`.`mine` (`mine_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_winder_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `mine_management`.`region` (`region_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_winder_shaft`
    FOREIGN KEY (`shaft_number`)
    REFERENCES `mine_management`.`shaft` (`shaft_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
