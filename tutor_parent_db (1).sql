-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2025 at 04:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutor_parent_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `id` int(11) NOT NULL,
  `parent_user_id` int(11) NOT NULL,
  `areaOfStudy` varchar(255) DEFAULT NULL,
  `schoolBoard` varchar(255) DEFAULT NULL,
  `selectedSubjects` varchar(255) DEFAULT NULL,
  `tutorGender` varchar(255) DEFAULT NULL,
  `tuitionMode` varchar(255) DEFAULT NULL,
  `classesPerWeek` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `childName` varchar(255) NOT NULL,
  `childAge` int(11) DEFAULT NULL,
  `childClass` varchar(255) DEFAULT NULL,
  `childGender` varchar(255) DEFAULT NULL,
  `otherInfo` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`id`, `parent_user_id`, `areaOfStudy`, `schoolBoard`, `selectedSubjects`, `tutorGender`, `tuitionMode`, `classesPerWeek`, `startDate`, `endDate`, `state`, `city`, `pincode`, `location`, `childName`, `childAge`, `childClass`, `childGender`, `otherInfo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Language Skilld', 'CBSE', 'Maths', 'Female Tutor', 'Online Tuition', '1 Day a Week', '2025-09-01 00:00:00', '0000-00-00 00:00:00', 'Rajasthan', 'Kota', '324005', 'Near Allen', 'Ashu', 12, '1st - 5th Classes', 'Male', 'Need sincear teacher', '2025-08-31 13:58:42', '2025-08-31 13:58:42'),
(2, 1, 'IT Software & Hardware', 'CBSE', 'Python', 'Female Tutor', 'Offline Tuition', '5 Day a Week', '2025-09-01 00:00:00', '2025-09-30 00:00:00', 'Chandigarh', 'Chandigarh', '324005', 'Near cgc university', 'Pragyansh ', 21, '12th Class', 'Male', 'Need an experienced teacher', '2025-08-31 14:00:48', '2025-08-31 14:00:48'),
(3, 1, 'IT Software & Hardware', 'ICSE/ISC', 'Python', 'Male Tutor', 'Offline Tuition', '5 Day a Week', '2025-10-08 00:00:00', '2025-11-06 00:00:00', 'Chandigarh', 'Chandigarh', '324005', 'Near cgc university', 'Pragyansh ', 21, '12th Class', 'Male', 'Need Extra attention', '2025-09-06 06:36:27', '2025-09-06 06:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `parents_users`
--

CREATE TABLE `parents_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `special_request` text DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `type` enum('parent','tutor') DEFAULT 'parent',
  `activation_status` enum('inactive','active') DEFAULT 'inactive',
  `created_by` varchar(255) DEFAULT 'user',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parents_users`
--

INSERT INTO `parents_users` (`id`, `first_name`, `last_name`, `mobile_number`, `gender`, `password`, `country`, `state`, `city`, `pincode`, `street`, `special_request`, `profile_photo`, `type`, `activation_status`, `created_by`, `created_at`, `updated_at`, `username`, `email_address`) VALUES
(1, 'Parent', '1', '1234567890', 'male', 'parent1', 'India', 'Rajasthan', 'Kota', '324005', 'C-165 talwandi Kota', 'I am parent 1', NULL, 'parent', 'inactive', 'user', '2025-08-30 12:32:15', '2025-08-30 12:32:15', 'parent1', '');

-- --------------------------------------------------------

--
-- Table structure for table `tutor_documents`
--

CREATE TABLE `tutor_documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `size_bytes` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutor_users`
--

CREATE TABLE `tutor_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `mode_of_teaching` enum('Online','Offline','Both') DEFAULT NULL,
  `teaching_experience` varchar(255) DEFAULT NULL,
  `custom_experience` varchar(255) DEFAULT NULL,
  `job_type` enum('Part-time','Full-time','Both') DEFAULT NULL,
  `time_from` varchar(255) DEFAULT NULL,
  `time_to` varchar(255) DEFAULT NULL,
  `special_request` text DEFAULT NULL,
  `academic_background` varchar(255) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `type` enum('parent','tutor') DEFAULT 'parent',
  `activation_status` enum('inactive','active') DEFAULT 'inactive',
  `created_by` varchar(255) DEFAULT 'user',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_user_id` (`parent_user_id`);

--
-- Indexes for table `parents_users`
--
ALTER TABLE `parents_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email_address` (`email_address`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `email_address_2` (`email_address`),
  ADD UNIQUE KEY `username_4` (`username`),
  ADD UNIQUE KEY `email_address_3` (`email_address`),
  ADD UNIQUE KEY `username_5` (`username`),
  ADD UNIQUE KEY `email_address_4` (`email_address`),
  ADD UNIQUE KEY `username_6` (`username`),
  ADD UNIQUE KEY `email_address_5` (`email_address`),
  ADD UNIQUE KEY `username_7` (`username`),
  ADD UNIQUE KEY `email_address_6` (`email_address`),
  ADD UNIQUE KEY `username_8` (`username`),
  ADD UNIQUE KEY `email_address_7` (`email_address`),
  ADD UNIQUE KEY `username_9` (`username`),
  ADD UNIQUE KEY `email_address_8` (`email_address`),
  ADD UNIQUE KEY `username_10` (`username`),
  ADD UNIQUE KEY `email_address_9` (`email_address`),
  ADD UNIQUE KEY `username_11` (`username`),
  ADD UNIQUE KEY `email_address_10` (`email_address`),
  ADD UNIQUE KEY `username_12` (`username`),
  ADD UNIQUE KEY `email_address_11` (`email_address`),
  ADD UNIQUE KEY `username_13` (`username`),
  ADD UNIQUE KEY `email_address_12` (`email_address`),
  ADD UNIQUE KEY `username_14` (`username`),
  ADD UNIQUE KEY `email_address_13` (`email_address`),
  ADD UNIQUE KEY `username_15` (`username`),
  ADD UNIQUE KEY `email_address_14` (`email_address`),
  ADD UNIQUE KEY `username_16` (`username`),
  ADD UNIQUE KEY `email_address_15` (`email_address`),
  ADD UNIQUE KEY `username_17` (`username`),
  ADD UNIQUE KEY `email_address_16` (`email_address`),
  ADD UNIQUE KEY `username_18` (`username`),
  ADD UNIQUE KEY `email_address_17` (`email_address`),
  ADD UNIQUE KEY `username_19` (`username`),
  ADD UNIQUE KEY `email_address_18` (`email_address`),
  ADD UNIQUE KEY `username_20` (`username`),
  ADD UNIQUE KEY `email_address_19` (`email_address`),
  ADD UNIQUE KEY `username_21` (`username`),
  ADD UNIQUE KEY `email_address_20` (`email_address`),
  ADD UNIQUE KEY `username_22` (`username`),
  ADD UNIQUE KEY `email_address_21` (`email_address`),
  ADD UNIQUE KEY `username_23` (`username`),
  ADD UNIQUE KEY `email_address_22` (`email_address`),
  ADD UNIQUE KEY `username_24` (`username`),
  ADD UNIQUE KEY `email_address_23` (`email_address`);

--
-- Indexes for table `tutor_documents`
--
ALTER TABLE `tutor_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tutor_users`
--
ALTER TABLE `tutor_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email_address` (`email_address`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `email_address_2` (`email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admissions`
--
ALTER TABLE `admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parents_users`
--
ALTER TABLE `parents_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tutor_documents`
--
ALTER TABLE `tutor_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutor_users`
--
ALTER TABLE `tutor_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admissions`
--
ALTER TABLE `admissions`
  ADD CONSTRAINT `admissions_ibfk_1` FOREIGN KEY (`parent_user_id`) REFERENCES `parents_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutor_documents`
--
ALTER TABLE `tutor_documents`
  ADD CONSTRAINT `tutor_documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tutor_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
