CREATE DATABASE phptest;
USE phptest;

CREATE TABLE `task` ( 
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`description` text NOT NULL,
	`rank` set('A','B','C','D','E','F','G','H') NOT NULL DEFAULT 'A',
	`user_author` varchar(40) DEFAULT NULL, 
	`purpose` text NOT NULL, 
	`method_ids` INT UNSIGNED, 
	PRIMARY KEY (`id`) 
) ENGINE myisam;

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB

CREATE TABLE `method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `required_mat` varchar(100) NOT NULL,
  `required_tools` varchar(100) NOT NULL,
  `optional_mat` varchar(100) DEFAULT NULL,
  `optional_tools` varchar(100) DEFAULT NULL,
  `pros` text,
  `cons` text,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM

CREATE TABLE `resources` (
  `name` varchar(50) NOT NULL,
  `supplies_provided` varchar(200) NOT NULL,
  `renewable` enum('y','n') DEFAULT 'n',
  `total` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM

CREATE TABLE `source` (
  `method_id` int(10) unsigned DEFAULT NULL,
  `source1` text NOT NULL,
  `source2` text,
  `source3` text,
  `source4` text,
  `source5` text
) ENGINE=MyISAM

CREATE TABLE `supplies` (
  `name` varchar(50) NOT NULL,
  `base_material` varchar(50) NOT NULL,
  `secondary_material` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM
