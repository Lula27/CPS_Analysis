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
    `SchoolName` VARCHAR(50) NOT NULL, 
    `Probation` ENUM('No', 'Yes'), 
    `ProbationYears` TINYINT(2), 
    `AvgDaysSuspension` DECIMAL(2,1), 
    `HealthySchoolCertified` ENUM('No', 'Pending', 'Yes'), 
    `Latitude` DECIMAL(6,4), 
    `Longitude` DECIMAL(7,5), 
    PRIMARY KEY(`Zipcode`, `SchoolID`)) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

# load data into table
 #use import csv functionality in mysql to upload data
LOAD DATA LOCAL INFILE 'C:/Users/loret/Desktop/UChicago MScA/DataEngineeringPlatforms/FinalProject/CPS_Analysis/EducationDatasets/clean_eduction/elementry.csv' INTO TABLE elementry FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';



CREATE TABLE IF NOT EXISTS `chicago`.`high`(
	`Zipcode` MEDIUMINT(5) ZEROFILL NOT NULL,  
    `SchoolID` MEDIUMINT(6) ZEROFILL NOT NULL, 
    `SchoolName` VARCHAR(50) NOT NULL, 
	`HealthySchoolCertified` ENUM('No', 'Pending', 'Yes'), 
	`4-YearGraduationRatePercentage_2013` DECIMAL(3,1), 
    `CollegeEnrollmentRatePercentage_2013` DECIMAL(3,1),
	`SuspensionsPer100_2013` DECIMAL(4,1),
	`AvgDaysSuspension` DECIMAL(3,1), 
    `Latitude` DECIMAL(6,4), 
    `Longitude` DECIMAL(7,5), 
	PRIMARY KEY(`Zipcode`, `SchoolID`), 
	CONSTRAINT `Zipcode`
    FOREIGN KEY (`Zipcode`)
    REFERENCES `chicago`.`elementry` (`Zipcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;




    