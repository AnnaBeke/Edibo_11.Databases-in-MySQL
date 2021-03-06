-- MySQL Script generated by MySQL Workbench
-- Mon Jul  5 18:23:18 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema music_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema music_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `music_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `music_shop` ;

-- -----------------------------------------------------
-- Table `music_shop`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`artists` (
  `ArtistId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`ArtistId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`albums` (
  `AlbumId` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(160) CHARACTER SET 'utf8' NOT NULL,
  `ArtistId` INT NOT NULL,
  PRIMARY KEY (`AlbumId`),
  INDEX `IFK_AlbumArtistId` (`ArtistId` ASC) VISIBLE,
  CONSTRAINT `albums_ibfk_1`
    FOREIGN KEY (`ArtistId`)
    REFERENCES `music_shop`.`artists` (`ArtistId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`employees` (
  `EmployeeId` INT NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `FirstName` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `Title` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `ReportsTo` INT NULL DEFAULT NULL,
  `BirthDate` DATETIME NULL DEFAULT NULL,
  `HireDate` DATETIME NULL DEFAULT NULL,
  `Address` VARCHAR(70) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `City` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `State` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Country` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `PostalCode` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Phone` VARCHAR(24) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Fax` VARCHAR(24) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Email` VARCHAR(60) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  INDEX `IFK_EmployeeReportsTo` (`ReportsTo` ASC) VISIBLE,
  CONSTRAINT `employees_ibfk_1`
    FOREIGN KEY (`ReportsTo`)
    REFERENCES `music_shop`.`employees` (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`customers` (
  `CustomerId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(40) CHARACTER SET 'utf8' NOT NULL,
  `LastName` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `Company` VARCHAR(80) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Address` VARCHAR(70) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `City` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `State` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Country` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `PostalCode` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Phone` VARCHAR(24) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Fax` VARCHAR(24) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Email` VARCHAR(60) CHARACTER SET 'utf8' NOT NULL,
  `SupportRepId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  INDEX `IFK_CustomerSupportRepId` (`SupportRepId` ASC) VISIBLE,
  CONSTRAINT `customers_ibfk_1`
    FOREIGN KEY (`SupportRepId`)
    REFERENCES `music_shop`.`employees` (`EmployeeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`genres` (
  `GenreId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`GenreId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`invoices` (
  `InvoiceId` INT NOT NULL AUTO_INCREMENT,
  `CustomerId` INT NOT NULL,
  `InvoiceDate` DATETIME NOT NULL,
  `BillingAddress` VARCHAR(70) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `BillingCity` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `BillingState` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `BillingCountry` VARCHAR(40) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `BillingPostalCode` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  INDEX `CustomerId` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `invoices_ibfk_1`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `music_shop`.`customers` (`CustomerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`media_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`media_types` (
  `MediaTypeId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`MediaTypeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`tracks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`tracks` (
  `TrackId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) CHARACTER SET 'utf8' NOT NULL,
  `AlbumId` INT NULL DEFAULT NULL,
  `MediaTypeId` INT NOT NULL,
  `GenreId` INT NULL DEFAULT NULL,
  `Composer` VARCHAR(220) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `Milliseconds` INT NOT NULL,
  `Bytes` INT NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`TrackId`),
  INDEX `AlbumId` (`AlbumId` ASC) VISIBLE,
  INDEX `GenreId` (`GenreId` ASC) VISIBLE,
  INDEX `MediaTypeId` (`MediaTypeId` ASC) VISIBLE,
  CONSTRAINT `tracks_ibfk_1`
    FOREIGN KEY (`AlbumId`)
    REFERENCES `music_shop`.`albums` (`AlbumId`),
  CONSTRAINT `tracks_ibfk_2`
    FOREIGN KEY (`GenreId`)
    REFERENCES `music_shop`.`genres` (`GenreId`),
  CONSTRAINT `tracks_ibfk_3`
    FOREIGN KEY (`MediaTypeId`)
    REFERENCES `music_shop`.`media_types` (`MediaTypeId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`invoice_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`invoice_items` (
  `InvoiceLineId` INT NOT NULL AUTO_INCREMENT,
  `InvoiceId` INT NOT NULL,
  `TrackId` INT NOT NULL,
  `UnitPrice` DECIMAL(10,2) NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`InvoiceLineId`),
  INDEX `IFK_InvoiceLineInvoiceId` (`InvoiceId` ASC) VISIBLE,
  INDEX `IFK_InvoiceLineTrackId` (`TrackId` ASC) VISIBLE,
  CONSTRAINT `invoice_items_ibfk_1`
    FOREIGN KEY (`InvoiceId`)
    REFERENCES `music_shop`.`invoices` (`InvoiceId`),
  CONSTRAINT `invoice_items_ibfk_2`
    FOREIGN KEY (`TrackId`)
    REFERENCES `music_shop`.`tracks` (`TrackId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`playlists` (
  `PlaylistId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`PlaylistId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `music_shop`.`playlist_track`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_shop`.`playlist_track` (
  `PlaylistId` INT NOT NULL,
  `TrackId` INT NOT NULL,
  PRIMARY KEY (`PlaylistId`, `TrackId`),
  INDEX `IFK_PlaylistTrackTrackId` (`TrackId` ASC) VISIBLE,
  CONSTRAINT `playlist_track_ibfk_1`
    FOREIGN KEY (`PlaylistId`)
    REFERENCES `music_shop`.`playlists` (`PlaylistId`),
  CONSTRAINT `playlist_track_ibfk_2`
    FOREIGN KEY (`TrackId`)
    REFERENCES `music_shop`.`tracks` (`TrackId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
