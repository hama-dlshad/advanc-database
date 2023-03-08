
-- Schema test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 ;
USE `test` ;
 
-- -----------------------------------------------------
-- Table `test`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`course` (
  `id` INT(11) NOT NULL,
  `course_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
 
 
-- -----------------------------------------------------
-- Table `test`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`students` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `fees_paid` INT(11) NULL DEFAULT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
 
 
-- -----------------------------------------------------
-- Table `test`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`teacher` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
 
 
-- -----------------------------------------------------
-- Table `test`.`enroll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`enroll` (
  `id` INT(11) NOT NULL,
  `s_id` INT(11) NULL DEFAULT NULL,
  `course_id` INT(11) NULL DEFAULT NULL,
  `teacher_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `enroll_ibfk_1`
    FOREIGN KEY (`s_id`)
    REFERENCES `test`.`students` (`id`),
  CONSTRAINT `enroll_ibfk_2`
    FOREIGN KEY (`course_id`)
    REFERENCES `test`.`course` (`id`),
  CONSTRAINT `enroll_ibfk_3`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `test`.`teacher` (`id`))
ENGINE = InnoDB;
 
 
-- -----------------------------------------------------
-- Table `test`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`student` (
  `id` INT(10) NOT NULL,
  `sName` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `sub1` VARCHAR(45) NOT NULL,
  `sub2` VARCHAR(45) NOT NULL,
  `sub3` VARCHAR(45) NOT NULL,
  `sub4` VARCHAR(45) NOT NULL,
  `teacherName` VARCHAR(45) NOT NULL,
  `teacherAddress` VARCHAR(45) NOT NULL,
  `courseName` VARCHAR(45) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
 
 
-- -----------------------------------------------------
-- Table `test`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`subject` (
  `id` INT(11) NOT NULL,
  `subject_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
 
USE `test` ;
 
-- -----------------------------------------------------
-- Placeholder table for view `test`.`student_enrollment_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`student_enrollment_info` (`student_name` INT, `course_name` INT, `teacher_name` INT);
 
-- -----------------------------------------------------
-- View `test`.`student_enrollment_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test`.`student_enrollment_info`;
USE `test`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test`.`student_enrollment_info` AS select `test`.`students`.`name` AS `student_name`,`test`.`course`.`course_name` AS `course_name`,`test`.`teacher`.`name` AS `teacher_name` from (((`test`.`enroll` join `test`.`students` on(`test`.`enroll`.`s_id` = `test`.`students`.`id`)) join `test`.`course` on(`test`.`enroll`.`course_id` = `test`.`course`.`id`)) join `test`.`teacher` on(`test`.`enroll`.`teacher_id` = `test`.`teacher`.`id`));
