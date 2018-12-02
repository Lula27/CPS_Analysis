/***********************************************
**                MSc ANALYTICS 
**     DATA ENGINEERING PLATFORMS (MSCA 31012)
** File:   chi_town DDL - final group project
** Desc:   Creating the database to store our group work 
** Auth:   Loretta Agyemang
** Date:   11/25/2018
************************************************/

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- -----------------------------------------------------
-- Create schema chicago 
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `chicago` DEFAULT CHARACTER SET latin1;
USE `chicago`;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_actor`
-- Dim refers to dimension table which stores data about ways data in fact talbe can be analyzed
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chicago`.`elementry`( 
	`Zipcode` MEDIUMINT(5) ZEROFILL NOT NULL,  
    `SchoolID` MEDIUMINT(6) ZEROFILL NOT NULL, 
    `SchoolName` VARCHAR(45) NOT NULL, 
    `STATE` CHAR(2) NOT NULL, 
    `Probation` ENUM('No', 'Yes'), 
    `ProbationYears` TINYINT(2), 
    