CREATE DATABASE IF NOT EXISTS `redm_extended`;
USE `redm_extended`;

CREATE TABLE `users` (
	`identifier` VARCHAR(40) NOT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`group` VARCHAR(50) NULL DEFAULT 'user',
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT(11) NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`position` VARCHAR(53) NULL DEFAULT '{"x":-328.02,"y":775.91,"z":120.63,"heading":194.99}',

	PRIMARY KEY (`identifier`)
);

CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT(11) NOT NULL DEFAULT 1,
	`rare` TINYINT(1) NOT NULL DEFAULT 0,
	`can_remove` TINYINT(1) NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
);

CREATE TABLE `job_grades` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT(11) NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `jobs` VALUES ('unemployed','Unemployed');
