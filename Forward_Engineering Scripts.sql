-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema assignment2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignment2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `assignment2` ;

-- -----------------------------------------------------
-- Table `assignment2`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`department` (
  `Dep_Name` INT NOT NULL,
  `Dept_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Dept_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`doctor` (
  `Doc_FName` VARCHAR(50) NOT NULL,
  `Doc_LName` VARCHAR(50) NOT NULL,
  `Doctor_ID` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Pincode` INT NOT NULL,
  `Specialization` VARCHAR(100) NOT NULL,
  `Dept_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  INDEX `Dept_ID` (`Dept_ID` ASC) VISIBLE,
  CONSTRAINT `doctor_ibfk_1`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `assignment2`.`department` (`Dept_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`patient` (
  `Patient_ID` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `PinCode` INT NOT NULL,
  `Patient_FName` VARCHAR(50) NOT NULL,
  `Patient_LName` VARCHAR(50) NOT NULL,
  `Age` INT NOT NULL,
  `Gender` CHAR(10) NOT NULL,
  `Dept_ID` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  INDEX `Dept_ID` (`Dept_ID` ASC) VISIBLE,
  CONSTRAINT `patient_ibfk_1`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `assignment2`.`department` (`Dept_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`prescription` (
  `Prescription_ID` VARCHAR(50) NOT NULL,
  `Details` VARCHAR(200) NOT NULL,
  `Hospitalization_Status` CHAR(1) NOT NULL,
  `Patient_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Prescription_ID`),
  INDEX `Patient_ID` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `prescription_ibfk_1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `assignment2`.`patient` (`Patient_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`appointment` (
  `Date` INT NOT NULL,
  `Appointment_ID` VARCHAR(50) NOT NULL,
  `Appointment_Reason` VARCHAR(100) NOT NULL,
  `Doctor_ID` VARCHAR(50) NOT NULL,
  `Patient_ID` VARCHAR(50) NOT NULL,
  `Dept_ID` VARCHAR(50) NOT NULL,
  `Prescription_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Appointment_ID`),
  INDEX `Doctor_ID` (`Doctor_ID` ASC) VISIBLE,
  INDEX `Patient_ID` (`Patient_ID` ASC) VISIBLE,
  INDEX `Dept_ID` (`Dept_ID` ASC) VISIBLE,
  INDEX `Prescription_ID` (`Prescription_ID` ASC) VISIBLE,
  CONSTRAINT `appointment_ibfk_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `assignment2`.`doctor` (`Doctor_ID`),
  CONSTRAINT `appointment_ibfk_2`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `assignment2`.`patient` (`Patient_ID`),
  CONSTRAINT `appointment_ibfk_3`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `assignment2`.`department` (`Dept_ID`),
  CONSTRAINT `appointment_ibfk_4`
    FOREIGN KEY (`Prescription_ID`)
    REFERENCES `assignment2`.`prescription` (`Prescription_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`doctor_contact_no`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`doctor_contact_no` (
  `Contact_No` INT NOT NULL,
  `Doctor_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Contact_No`, `Doctor_ID`),
  INDEX `Doctor_ID` (`Doctor_ID` ASC) VISIBLE,
  CONSTRAINT `doctor_contact_no_ibfk_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `assignment2`.`doctor` (`Doctor_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`ward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`ward` (
  `Ward_Name` VARCHAR(50) NOT NULL,
  `Ward_ID` VARCHAR(50) NOT NULL,
  `Capacity` INT NOT NULL,
  PRIMARY KEY (`Ward_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`has`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`has` (
  `Dept_ID` VARCHAR(50) NOT NULL,
  `Ward_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Dept_ID`, `Ward_ID`),
  INDEX `Ward_ID` (`Ward_ID` ASC) VISIBLE,
  CONSTRAINT `has_ibfk_1`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `assignment2`.`department` (`Dept_ID`),
  CONSTRAINT `has_ibfk_2`
    FOREIGN KEY (`Ward_ID`)
    REFERENCES `assignment2`.`ward` (`Ward_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`patient_contact_no`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`patient_contact_no` (
  `Contact_No` INT NOT NULL,
  `Patient_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Contact_No`, `Patient_ID`),
  INDEX `Patient_ID` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `patient_contact_no_ibfk_1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `assignment2`.`patient` (`Patient_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`payment` (
  `Payment_ID` VARCHAR(50) NOT NULL,
  `Payment_Amount` INT NOT NULL,
  `Payment_Method` VARCHAR(50) NOT NULL,
  `Payment_Date` INT NOT NULL,
  `Patient_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  INDEX `Patient_ID` (`Patient_ID` ASC) VISIBLE,
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `assignment2`.`patient` (`Patient_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`prescribes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`prescribes` (
  `Prescription_ID` VARCHAR(50) NOT NULL,
  `Doctor_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Prescription_ID`, `Doctor_ID`),
  INDEX `Doctor_ID` (`Doctor_ID` ASC) VISIBLE,
  CONSTRAINT `prescribes_ibfk_1`
    FOREIGN KEY (`Prescription_ID`)
    REFERENCES `assignment2`.`prescription` (`Prescription_ID`),
  CONSTRAINT `prescribes_ibfk_2`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `assignment2`.`doctor` (`Doctor_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`staff` (
  `Staff_ID` VARCHAR(50) NOT NULL,
  `Staff_FName` VARCHAR(50) NOT NULL,
  `Staff_LName` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  `pincode` INT NOT NULL,
  `Dept_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  INDEX `Dept_ID` (`Dept_ID` ASC) VISIBLE,
  CONSTRAINT `staff_ibfk_1`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `assignment2`.`department` (`Dept_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`staff_staff_contactno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`staff_staff_contactno` (
  `Staff_ContactNo` INT NOT NULL,
  `Staff_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Staff_ContactNo`, `Staff_ID`),
  INDEX `Staff_ID` (`Staff_ID` ASC) VISIBLE,
  CONSTRAINT `staff_staff_contactno_ibfk_1`
    FOREIGN KEY (`Staff_ID`)
    REFERENCES `assignment2`.`staff` (`Staff_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`treatment` (
  `Treatment_Name` VARCHAR(50) NOT NULL,
  `Treatment_ID` VARCHAR(50) NOT NULL,
  `Diagnostics` VARCHAR(50) NOT NULL,
  `Date` DATE NOT NULL,
  `Cost` INT NOT NULL,
  `Status` CHAR(10) NOT NULL,
  `Notes` VARCHAR(200) NOT NULL,
  `Ward_ID` VARCHAR(50) NOT NULL,
  `Dept_ID` VARCHAR(50) NOT NULL,
  `Patient_ID` VARCHAR(50) NOT NULL,
  `Prescription_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Treatment_ID`),
  INDEX `Dept_ID` (`Dept_ID` ASC) VISIBLE,
  INDEX `Patient_ID` (`Patient_ID` ASC) VISIBLE,
  INDEX `Prescription_ID` (`Prescription_ID` ASC) VISIBLE,
  CONSTRAINT `treatment_ibfk_1`
    FOREIGN KEY (`Dept_ID`)
    REFERENCES `assignment2`.`department` (`Dept_ID`),
  CONSTRAINT `treatment_ibfk_2`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `assignment2`.`patient` (`Patient_ID`),
  CONSTRAINT `treatment_ibfk_3`
    FOREIGN KEY (`Prescription_ID`)
    REFERENCES `assignment2`.`prescription` (`Prescription_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment2`.`treating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignment2`.`treating` (
  `Doctor_ID` VARCHAR(50) NOT NULL,
  `Treatment_ID` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Doctor_ID`, `Treatment_ID`),
  INDEX `Treatment_ID` (`Treatment_ID` ASC) VISIBLE,
  CONSTRAINT `treating_ibfk_1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `assignment2`.`doctor` (`Doctor_ID`),
  CONSTRAINT `treating_ibfk_2`
    FOREIGN KEY (`Treatment_ID`)
    REFERENCES `assignment2`.`treatment` (`Treatment_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
