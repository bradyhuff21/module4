-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BradyModel
-- -----------------------------------------------------
-- 
-- 

-- -----------------------------------------------------
-- Schema BradyModel
--
-- 
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BradyModel` DEFAULT CHARACTER SET utf8 ;
USE `BradyModel` ;

-- -----------------------------------------------------
-- Table `BradyModel`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`Country` (
  `CountryID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`CountryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BradyModel`.`Territory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`Territory` (
  `Territory ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Country_CountryID` INT NOT NULL,
  PRIMARY KEY (`Territory ID`),
  INDEX `fk_Territory_Country1_idx` (`Country_CountryID` ASC) VISIBLE,
  CONSTRAINT `fk_Territory_Country1`
    FOREIGN KEY (`Country_CountryID`)
    REFERENCES `BradyModel`.`Country` (`CountryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BradyModel`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`Location` (
  `LocationID` INT NOT NULL,
  `CustomerID` INT NULL,
  `AddressLine1` VARCHAR(45) NULL,
  `AddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` CHAR(2) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Territory_Territory ID` INT NOT NULL,
  PRIMARY KEY (`LocationID`),
  INDEX `fk_Location_Territory1_idx` (`Territory_Territory ID` ASC) VISIBLE,
  CONSTRAINT `fk_Location_Territory1`
    FOREIGN KEY (`Territory_Territory ID`)
    REFERENCES `BradyModel`.`Territory` (`Territory ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BradyModel`.`Order Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`Order Details` (
  `OrderIDNumber` INT NOT NULL,
  `CustomerID` INT NULL,
  `OrderNumber` INT NULL,
  `OrderLineNumber` INT NULL,
  `OrderDate` DATE NULL,
  `Price` DECIMAL(2) NULL,
  `Sales` DECIMAL(2) NULL,
  PRIMARY KEY (`OrderIDNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BradyModel`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`Product` (
  `ProductID` INT NOT NULL,
  `OrderNumberID` INT NULL,
  `ProductLine` VARCHAR(45) NULL,
  `MSRP` INT NULL,
  `Deal Size` DECIMAL(2) NULL,
  `ProductCode` CHAR(5) NULL,
  `OrderDetails_ID` INT NOT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_Product_Order Details1_idx` (`OrderDetails_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Order Details1`
    FOREIGN KEY (`OrderDetails_ID`)
    REFERENCES `BradyModel`.`Order Details` (`OrderIDNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BradyModel`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `ContactLastName` VARCHAR(45) NULL,
  `ContactFirstName` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `Product_ProductID` INT NOT NULL,
  `Location_LocationID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `fk_Customer_Product_idx` (`Product_ProductID` ASC) VISIBLE,
  INDEX `fk_Customer_Location1_idx` (`Location_LocationID` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Product`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `BradyModel`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Location1`
    FOREIGN KEY (`Location_LocationID`)
    REFERENCES `BradyModel`.`Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BradyModel`.`OrderDate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`OrderDate` (
  `OrderDateID` INT NOT NULL,
  `OrderNumberID` INT NULL,
  `Status` VARCHAR(45) NULL,
  `QtrID` INT NULL,
  `MonthID` INT NULL,
  `YearID` INT NULL,
  `OrderDetails_ID` INT NOT NULL,
  PRIMARY KEY (`OrderDateID`),
  INDEX `fk_OrderDate_Order Details1_idx` (`OrderDetails_ID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDate_Order Details1`
    FOREIGN KEY (`OrderDetails_ID`)
    REFERENCES `BradyModel`.`Order Details` (`OrderIDNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `BradyModel` ;

-- -----------------------------------------------------
-- Placeholder table for view `BradyModel`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BradyModel`.`view1` (`id` INT);

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

DELIMITER $$
USE `BradyModel`$$
$$

DELIMITER ;

-- -----------------------------------------------------
-- View `BradyModel`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BradyModel`.`view1`;
USE `BradyModel`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
