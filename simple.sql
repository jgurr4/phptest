DROP DATABASE IF EXISTS phptest;
CREATE DATABASE phptest;
USE phptest;

CREATE TABLE `task` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name` text NOT NULL,
	`order` int(10) unsigned NOT NULL,
	`rank` enum('A','B','C','D','E','F','G','H') NOT NULL DEFAULT 'A',
	`user_author` varchar(40) NOT NULL,
	`purpose` text NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE MyISAM;

CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE MyISAM;

CREATE TABLE `method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pros` text,
  `cons` text,
  `instructions` text NOT NULL,
  `task_id` int unsigned,
  PRIMARY KEY (`id`)
) ENGINE MyISAM;

CREATE TABLE `supply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `base_material` varchar(50) NOT NULL,
  `secondary_material` varchar(50) DEFAULT NULL,
  `description` text DEFAULT '',
  `common` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE MyISAM;

CREATE TABLE `resource` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE MyISAM;

CREATE TABLE `source` (
  `method_id` int(10) unsigned DEFAULT NULL,
  `source1` text NOT NULL,
  `source2` text,
  `source3` text,
  `source4` text,
  `source5` text
) ENGINE MyISAM;
