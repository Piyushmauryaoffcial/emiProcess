-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2024 at 03:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emi_process`
--

-- --------------------------------------------------------

--
-- Table structure for table `emi_details`
--

CREATE TABLE `emi_details` (
  `clientid` int(11) DEFAULT NULL,
  `2017_Nov` decimal(10,2) DEFAULT 0.00,
  `2017_Dec` decimal(10,2) DEFAULT 0.00,
  `2018_Jan` decimal(10,2) DEFAULT 0.00,
  `2018_Feb` decimal(10,2) DEFAULT 0.00,
  `2018_Mar` decimal(10,2) DEFAULT 0.00,
  `2018_Apr` decimal(10,2) DEFAULT 0.00,
  `2018_May` decimal(10,2) DEFAULT 0.00,
  `2018_Jun` decimal(10,2) DEFAULT 0.00,
  `2018_Jul` decimal(10,2) DEFAULT 0.00,
  `2018_Aug` decimal(10,2) DEFAULT 0.00,
  `2018_Sep` decimal(10,2) DEFAULT 0.00,
  `2018_Oct` decimal(10,2) DEFAULT 0.00,
  `2018_Nov` decimal(10,2) DEFAULT 0.00,
  `2018_Dec` decimal(10,2) DEFAULT 0.00,
  `2019_Jan` decimal(10,2) DEFAULT 0.00,
  `2019_Feb` decimal(10,2) DEFAULT 0.00,
  `2019_Mar` decimal(10,2) DEFAULT 0.00,
  `2019_Apr` decimal(10,2) DEFAULT 0.00,
  `2019_May` decimal(10,2) DEFAULT 0.00,
  `2019_Jun` decimal(10,2) DEFAULT 0.00,
  `2019_Jul` decimal(10,2) DEFAULT 0.00,
  `2019_Aug` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emi_details`
--

INSERT INTO `emi_details` (`clientid`, `2017_Nov`, `2017_Dec`, `2018_Jan`, `2018_Feb`, `2018_Mar`, `2018_Apr`, `2018_May`, `2018_Jun`, `2018_Jul`, `2018_Aug`, `2018_Sep`, `2018_Oct`, `2018_Nov`, `2018_Dec`, `2019_Jan`, `2019_Feb`, `2019_Mar`, `2019_Apr`, `2019_May`, `2019_Jun`, `2019_Jul`, `2019_Aug`) VALUES
(1001, 129.17, 129.17, 129.17, 129.17, 129.17, 129.17, 129.17, 129.17, 129.17, 129.17, 129.17, 129.13, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(1003, 978.85, 978.85, 978.85, 978.85, 978.85, 978.85, 978.84, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(1005, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 105.88, 0.05, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_details`
--

CREATE TABLE `loan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `clientid` int(11) NOT NULL,
  `num_of_payment` int(11) NOT NULL,
  `first_payment_date` date NOT NULL,
  `last_payment_date` date NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_details`
--

INSERT INTO `loan_details` (`id`, `clientid`, `num_of_payment`, `first_payment_date`, `last_payment_date`, `loan_amount`, `created_at`, `updated_at`) VALUES
(1, 1001, 12, '2018-06-29', '2019-05-29', 1550.00, NULL, NULL),
(2, 1003, 7, '2019-02-15', '2019-08-15', 6851.94, NULL, NULL),
(3, 1005, 17, '2017-11-09', '2019-03-09', 1800.01, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2024_11_12_105019_create_loan_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'developer', '$2y$12$wR7P469Vw8yPuoLEchMHbeNqJqqkfAlwXIUHTJ.t10xv39wC1gTF6', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `loan_details`
--
ALTER TABLE `loan_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_details_clientid_unique` (`clientid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_details`
--
ALTER TABLE `loan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
