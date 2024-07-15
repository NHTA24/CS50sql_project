CREATE DATABASE `linkedin`;
USE `linkedin`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `pass_word` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools_universities` (
    `id` INT AUTO_INCREMENT,
    `school_name` VARCHAR(255) NOT NULL,
    `school_location` VARCHAR(255) NOT NULL,
    `school_year` DATE,
    `school_type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `company_name` VARCHAR(255) NOT NULL,
    `company_industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `company_location` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `user_connection` (
    `user_A` INT,
    `user_B` INT,
    PRIMARY KEY (`user_A`, `user_B`),
    FOREIGN KEY (`user_A`) REFERENCES `users`(`id`),
    FOREIGN KEY (`user_B`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connection` (
    `user_id` INT,
    `school_id` INT,
    `start_date` DATETIME,
    `end_date` DATETIME,
    `degree` VARCHAR(255),
    PRIMARY KEY (`user_id`, `school_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools_universities`(`id`)
);

CREATE TABLE `company_connection` (
    `user_id` INT,
    `company_id` INT,
    `start_date` DATETIME,
    `end_date` DATETIME,
    PRIMARY KEY (`user_id`, `company_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);
