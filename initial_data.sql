CREATE DATABASE IF NOT EXISTS tiny_record;

use tiny_record

DROP TABLE IF EXISTS `posts`;
-- ["id", "title", "content", "author", "comment_count"]
CREATE TABLE `posts` (
  `id` INT(6) AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(255),
  `content` varchar(255),
  `author` varchar(255),
  `comment_count` INT(6)
);

DROP TABLE IF EXISTS `users`;
-- ["id", "title", "content", "author", "comment_count"]
CREATE TABLE `users` (
  `id` INT(6) AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255),
  `sex` INT(1)
);
