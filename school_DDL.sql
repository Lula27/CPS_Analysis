/***********************************************
**                MSc ANALYTICS 
**     DATA ENGINEERING PLATFORMS (MSCA 31012)
** File:   chi_town DDL - final group project
** Desc:   Creating the database to store our group work 
** Auth:   Loretta Agyemang
** Date:   11/25/2018
************************************************/

-- -----------------------------------------------------
-- Create schema chi_town
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `chi_town` DEFAULT CHARACTER SET latin1;
USE `chi_town`;


-- -----------------------------------------------------
-- Table `sakila_snowflake`.`dim_actor`
-- Dim refers to dimension table which stores data about ways data in fact talbe can be analyzed
-- -----------------------------------------------------