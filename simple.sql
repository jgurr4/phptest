DROP DATABASE IF EXISTS phptest;
CREATE DATABASE phptest;
USE phptest;

CREATE TABLE `task` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(255) UNIQUE NOT NULL,
	`order` int(10) unsigned,
    `cityOrder` int(10) unsigned,
	`rank` enum('A','B','C','D','E','F','G','H') NOT NULL DEFAULT 'A',
	`user_author` varchar(40) NOT NULL,
	`purpose` text NOT NULL,
	`instructions` text NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE InnoDB;

CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) not null,
  `password` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE InnoDB;

CREATE TABLE `supply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned,
  `name` varchar(50) NOT NULL,
  `base_material` varchar(50) NOT NULL,
  `secondary_material` varchar(50) DEFAULT NULL,
  `description` text,
  `common` enum('Y','N') DEFAULT 'N',
  `howToGet` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE InnoDB;

CREATE TABLE taskCompletion(
  `user_id` int unsigned,
  `task_id` int unsigned,
  `dateCompleted` datetime not null default current_timestamp,
  PRIMARY KEY (`user_id`, `task_id`)
 ) ENGINE InnoDB;

CREATE TABLE `source` (
  `method_id` int(10) unsigned DEFAULT NULL,
  `source1` text NOT NULL,
  `source2` text,
  `source3` text,
  `source4` text,
  `source5` text,
  `extraInfo` text
) ENGINE InnoDB;
