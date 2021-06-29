DROP DATABASE IF EXISTS wilderness;
CREATE DATABASE wilderness;
USE wilderness;

SOURCE /sqlScripts/backup.sql;

/*CREATE TABLE `task` (
   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `title` varchar(255) UNIQUE NOT NULL,
   `tech` varchar(150) not null,
   `survival` BOOLEAN,
   `city` BOOLEAN,
   `homestead` BOOLEAN,
   `tOrder` int(10) unsigned DEFAULT NULL,
   `tGroup` varchar(40) DEFAULT NULL,
   `user_author` varchar(40) DEFAULT 'TheGuy',
   `purpose` text DEFAULT NULL,
   `instructions` text DEFAULT NULL,
   `image` VARCHAR(255) DEFAULT '',
   INDEX (`tGroup`),
   PRIMARY KEY (`id`)
) ENGINE InnoDB;

CREATE TABLE `user` (
   `id` int unsigned NOT NULL AUTO_INCREMENT,
   `username` varchar(50) NOT NULL,
   `name` varchar(50) not null,
   `password` varchar(255) NOT NULL,
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
   `timeSpent` time not null,
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
*/

DELIMITER //
CREATE PROCEDURE createNewUser(
    IN username VARCHAR(50), IN name varchar(50), IN pass VARCHAR(255), IN email VARCHAR(50), IN phone VARCHAR(15))
BEGIN
    INSERT INTO user VALUES (0, username, name, pass, email, phone, default, default);
END //

CREATE PROCEDURE retrieveUser(IN uname VARCHAR(50), IN pass VARCHAR(255))
BEGIN
    SELECT * FROM user WHERE username = uname AND password = pass;
END //

CREATE PROCEDURE retrieveUserFromEmail(IN uname VARCHAR(50), IN user_email VARCHAR(50))
BEGIN
    SELECT * FROM user WHERE username = uname AND email = user_email;
END //

CREATE PROCEDURE updateUser(
    IN uname VARCHAR(50), IN newUName VARCHAR(50), IN name varchar(50), IN pass VARCHAR(255), IN email VARCHAR(50), IN phone VARCHAR(15))
BEGIN
    SET @uid = (SELECT `id` FROM `user` WHERE username = uname);
    REPLACE INTO user VALUES (@uid, newUName, name, pass, email, phone, default, default);
END //

CREATE PROCEDURE deleteUser(IN uname VARCHAR(50), IN pass VARCHAR(255))
BEGIN
    SET @uid = (SELECT id FROM user WHERE username = uname AND password = pass FOR UPDATE);
    IF @uid = (SELECT id FROM user WHERE username = uname AND password = pass) THEN
        DELETE FROM user WHERE username = uname AND password = pass;
        DELETE FROM taskCompletion WHERE user_id = @uid;
    ELSE SELECT 'no user found with that username/password' AS message;
    END IF;
END //

CREATE PROCEDURE createNewTask(IN title VARCHAR(255), IN tech VARCHAR(150), IN orderNo INT, IN purpose TEXT, IN instruction TEXT)
BEGIN
    UPDATE task SET `tOrder` = `tOrder` + 1 WHERE `tOrder` >= orderNo;
    INSERT INTO task VALUES (0, title, tech, 1, 1, 1, orderNo, 'TheGuy', purpose, instruction, null);
END //

CREATE PROCEDURE getNextTask(IN u1 VARCHAR(50))
BEGIN
    SELECT * FROM task WHERE id =
        (SELECT task_id FROM taskCompletion WHERE user_id =
            (SELECT id FROM user WHERE username = u1) AND dateCompleted =
                (SELECT MAX(dateCompleted))) + 1;
END //

CREATE PROCEDURE getTasks(IN myOffset int, IN amount int)
BEGIN
    SELECT * FROM task LIMIT myOffset, amount;
end //

CREATE PROCEDURE addImage(IN taskTitle varchar(255), IN imageName varchar(255))
BEGIN
    UPDATE task SET image = imageName WHERE title = taskTitle;
END //

DELIMITER ;

CREATE ROLE IF NOT EXISTS 'app', 'developer','administrator';
GRANT ALL ON *.* TO 'administrator';
GRANT INSERT, UPDATE, DELETE ON wilderness.* TO 'developer';
GRANT EXECUTE ON wilderness.* TO 'app';
CREATE USER IF NOT EXISTS 'jared'@'localhost' IDENTIFIED BY 'super03';
CREATE USER IF NOT EXISTS 'app'@'localhost' IDENTIFIED BY 'password';
GRANT 'app' TO 'app'@'localhost';
GRANT 'administrator' TO 'jared'@'localhost';
FLUSH PRIVILEGES;

# LOAD DATA LOCAL INFILE './sqlScripts/insertTasks.csv' INTO TABLE task FIELDS TERMINATED BY ',' IGNORE 1 LINES;

/* NOTE: You don't need to use quotes around strings or temporal data types in .csv files. Just make sure to escape extra commas with \,
   If you do use quotes, those will appear in the database, which is not what you want. You also do not have to escape quotes inside strings
   such as 'don\'t' since you're not using quotes to specify the start and end of each value.
These don't work in new database structure. Find a alternative methods if these are still needed.
CREATE VIEW `userLastCompletedTask` AS
SELECT username, t1.*
FROM taskCompletion t1 INNER JOIN user ON (id = user_id)
WHERE t1.dateCompleted = (SELECT MAX(t2.dateCompleted)
                          FROM taskCompletion t2
                          WHERE t2.user_id = t1.user_id);

CREATE PROCEDURE removeComplete(IN uname VARCHAR(50), IN tid int unsigned)
BEGIN
    SET @uid = (SELECT id FROM user WHERE username = uname);
    DELETE FROM taskCompletion WHERE user_id = @uid AND task_id = tid;
END //

CREATE PROCEDURE addComplete(IN uname VARCHAR(50), IN tid int unsigned)
BEGIN
    set @uid = (SELECT id FROM user WHERE username = uname);
    INSERT INTO taskCompletion VALUES (@uid, tid, default);
END //
*/
