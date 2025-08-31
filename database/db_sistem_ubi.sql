/*
 Navicat Premium Dump SQL

 Source Server         : my database
 Source Server Type    : MySQL
 Source Server Version : 90001 (9.0.1)
 Source Host           : localhost:3306
 Source Schema         : db_sistem_ubi

 Target Server Type    : MySQL
 Target Server Version : 90001 (9.0.1)
 File Encoding         : 65001

 Date: 31/08/2025 16:38:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `password_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (9, '123123123', 'andrisyahputra2209@gmail.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (8, '123123123', 'andrisyahputra2209@gmail.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (7, '123123123', 'andrisyahputra2209@gmail.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (6, 'andri syahputra', 'andrimc@gmail.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (5, 'andriziro@gmail.com', 'andriziro2@gmail.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (4, 'andriziro@asd', 'andriziro@gmail.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (3, '', '', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (2, '', '', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', NULL, NULL);
INSERT INTO `admins` (`id`, `nama`, `email`, `password`, `created_at`, `password_at`) VALUES (1, 'andri', 'andri@gmai.com', '$2y$10$AQctUEx8oQpZWLrYpEaUPe895RU7tC6S/vyajVKYyVM655U0pDUj.', '2024-10-15 03:10:29', '2024-10-15 03:10:32');
COMMIT;

-- ----------------------------
-- Table structure for applylokers
-- ----------------------------
DROP TABLE IF EXISTS `applylokers`;
CREATE TABLE `applylokers` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `loker_id` int NOT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of applylokers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_groups_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE `auth_groups_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_groups_users
-- ----------------------------
BEGIN;
INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES (1, 1, 'user', '2024-10-06 16:12:40');
INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES (2, 2, 'user', '2025-08-23 09:36:47');
COMMIT;

-- ----------------------------
-- Table structure for auth_identities
-- ----------------------------
DROP TABLE IF EXISTS `auth_identities`;
CREATE TABLE `auth_identities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `secret2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `force_reset` tinyint(1) NOT NULL DEFAULT '0',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_secret` (`type`,`secret`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_identities
-- ----------------------------
BEGIN;
INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES (1, 1, 'email_password', NULL, 'andrimc@gmail.com', '$2y$12$X5Wk3C6hKtqDH1WrpBJhLO1lWSHxJV/DAXxUb/TzzhQ7jwNPSeZWu', NULL, NULL, 0, '2024-10-28 13:27:28', '2024-10-06 16:12:40', '2024-10-28 13:27:28');
INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES (2, 2, 'email_password', NULL, 'renika@gmail.com', '$2y$12$s2Wbcm/N9cI5pi07I/.ltecrxGGZUijYBjnK189vV/mrnX0Lg70ey', NULL, NULL, 0, '2025-08-23 10:17:56', '2025-08-23 09:36:46', '2025-08-23 10:17:56');
COMMIT;

-- ----------------------------
-- Table structure for auth_logins
-- ----------------------------
DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE `auth_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_logins
-- ----------------------------
BEGIN;
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', NULL, '2024-10-06 16:48:25', 0);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-06 16:48:34', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-06 17:32:27', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andri@gmail.com', NULL, '2024-10-07 17:25:11', 0);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andri@gmail.com', NULL, '2024-10-07 17:25:28', 0);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (6, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-07 17:25:33', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (7, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andri@gmail.com', NULL, '2024-10-08 17:27:58', 0);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (8, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-08 17:28:05', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (9, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andri@gmail.com', NULL, '2024-10-08 17:47:01', 0);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (10, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-08 17:47:08', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (11, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-14 18:19:54', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (12, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'email_password', 'andrimc@gmail.com', 1, '2024-10-28 13:27:28', 1);
INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES (13, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'email_password', 'renika@gmail.com', 2, '2025-08-23 10:17:56', 1);
COMMIT;

-- ----------------------------
-- Table structure for auth_permissions_users
-- ----------------------------
DROP TABLE IF EXISTS `auth_permissions_users`;
CREATE TABLE `auth_permissions_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_permissions_users_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_permissions_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_remember_tokens
-- ----------------------------
DROP TABLE IF EXISTS `auth_remember_tokens`;
CREATE TABLE `auth_remember_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hashedValidator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `auth_remember_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_remember_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_token_logins
-- ----------------------------
DROP TABLE IF EXISTS `auth_token_logins`;
CREATE TABLE `auth_token_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_identifier` (`id_type`,`identifier`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of auth_token_logins
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for basispengetahuans
-- ----------------------------
DROP TABLE IF EXISTS `basispengetahuans`;
CREATE TABLE `basispengetahuans` (
  `kode_pengetahuan` int NOT NULL AUTO_INCREMENT,
  `kode_penyakit` varchar(10) NOT NULL,
  `kode_gejala` varchar(10) NOT NULL,
  `mb` decimal(3,2) NOT NULL,
  `md` decimal(3,2) NOT NULL,
  `cf` decimal(3,2) NOT NULL,
  PRIMARY KEY (`kode_pengetahuan`),
  UNIQUE KEY `unique_rule` (`kode_penyakit`,`kode_gejala`),
  KEY `idx_knowledge_disease` (`kode_penyakit`),
  KEY `idx_knowledge_symptom` (`kode_gejala`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of basispengetahuans
-- ----------------------------
BEGIN;
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (1, 'P01', 'G01', 0.90, 0.10, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (2, 'P01', 'G02', 0.85, 0.05, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (3, 'P01', 'G03', 0.80, 0.10, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (4, 'P01', 'G04', 0.75, 0.15, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (5, 'P01', 'G05', 0.80, 0.20, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (6, 'P02', 'G06', 0.90, 0.10, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (7, 'P02', 'G07', 0.85, 0.15, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (8, 'P02', 'G08', 0.80, 0.10, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (9, 'P02', 'G09', 0.70, 0.20, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (10, 'P02', 'G15', 0.65, 0.25, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (11, 'P03', 'G10', 0.90, 0.10, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (12, 'P03', 'G11', 0.85, 0.05, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (13, 'P03', 'G12', 0.80, 0.20, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (14, 'P03', 'G13', 0.75, 0.15, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (15, 'P03', 'G14', 0.70, 0.20, 0.00);
INSERT INTO `basispengetahuans` (`kode_pengetahuan`, `kode_penyakit`, `kode_gejala`, `mb`, `md`, `cf`) VALUES (27, 'P01', 'G16', 0.02, 0.01, 0.01);
COMMIT;

-- ----------------------------
-- Table structure for diagnosis_results
-- ----------------------------
DROP TABLE IF EXISTS `diagnosis_results`;
CREATE TABLE `diagnosis_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `alamat_lahan` varchar(200) DEFAULT NULL,
  `luas_lahan` varchar(50) DEFAULT NULL,
  `tanggal_diagnosis` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hasil_diagnosis` json DEFAULT NULL,
  `penyakit_terdiagnosis` varchar(10) DEFAULT NULL,
  `nilai_cf_tertinggi` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penyakit_terdiagnosis` (`penyakit_terdiagnosis`),
  KEY `idx_diagnosis_user` (`user_id`),
  KEY `idx_diagnosis_date` (`tanggal_diagnosis`),
  CONSTRAINT `diagnosis_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`) ON DELETE SET NULL,
  CONSTRAINT `diagnosis_results_ibfk_2` FOREIGN KEY (`penyakit_terdiagnosis`) REFERENCES `penyakits` (`kode_penyakit`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of diagnosis_results
-- ----------------------------
BEGIN;
INSERT INTO `diagnosis_results` (`id`, `user_id`, `nama_pasien`, `alamat_lahan`, `luas_lahan`, `tanggal_diagnosis`, `hasil_diagnosis`, `penyakit_terdiagnosis`, `nilai_cf_tertinggi`) VALUES (4, NULL, 'Lysandra George', 'Voluptatem laborum f', '76', '2025-08-31 09:31:44', '{\"P01\": {\"cf\": 0.91373824, \"name\": \"Busuk Umbi\", \"detail\": \"Penyakit busuk umbi disebabkan oleh jamur Rhizopus stolonifer yang menyerang umbi ubi jalar. Gejala utama meliputi bercak coklat kehitaman pada umbi, tekstur umbi menjadi lunak dan berair, serta munculnya miselium jamur berwarna putih hingga abu-abu pada permukaan umbi yang terinfeksi.\", \"percentage\": 91.373824, \"total_symptoms\": 5, \"recommendations\": [\"Pengendalian: 1) Panen umbi pada kondisi cuaca kering, 2) Hindari luka pada umbi saat panen, 3) Simpan umbi di tempat kering dan berventilasi baik, 4) Pisahkan umbi yang terinfeksi, 5) Gunakan fungisida berbahan aktif mankozeb atau klorotalonil, 6) Rotasi tanaman dengan tanaman non-solanaceae.\"], \"matching_symptoms\": 4}, \"P02\": {\"cf\": 0.871344, \"name\": \"Hawar Daun\", \"detail\": \"Penyakit hawar daun disebabkan oleh jamur Alternaria bataticola yang menyerang bagian daun tanaman ubi jalar. Gejala meliputi bercak coklat dengan lingkaran konsentris pada daun, daun menguning dan mengering, serta defoliasi prematur yang dapat mengurangi hasil panen.\", \"percentage\": 87.1344, \"total_symptoms\": 5, \"recommendations\": [\"Pengendalian: 1) Gunakan varietas tahan penyakit, 2) Atur jarak tanam yang optimal untuk sirkulasi udara, 3) Hindari penyiraman berlebihan, 4) Aplikasi fungisida berbahan aktif mankozeb atau propineb, 5) Sanitasi kebun dengan membuang sisa tanaman terinfeksi, 6) Rotasi tanaman.\"], \"matching_symptoms\": 4}, \"P03\": {\"cf\": 0.48016, \"name\": \"Kudis (Scab)\", \"detail\": \"Penyakit kudis disebabkan oleh bakteri Streptomyces ipomoeae yang menyerang umbi ubi jalar. Gejala berupa bercak-bercak kasar berwarna coklat pada permukaan umbi, permukaan umbi menjadi kasar seperti gabus, dan dalam kondisi parah dapat menyebabkan retak-retak pada umbi.\", \"percentage\": 48.016, \"total_symptoms\": 5, \"recommendations\": [\"Pengendalian: 1) Gunakan bibit sehat dan bersertifikat, 2) Hindari penanaman di tanah yang terlalu asam (pH < 5.5), 3) Perbaiki drainase tanah, 4) Rotasi tanaman dengan tanaman non-solanaceae, 5) Aplikasi kapur untuk menaikkan pH tanah, 6) Hindari luka pada umbi saat panen dan penanganan.\"], \"matching_symptoms\": 3}}', 'P01', 0.9137);
COMMIT;

-- ----------------------------
-- Table structure for gejala
-- ----------------------------
DROP TABLE IF EXISTS `gejala`;
CREATE TABLE `gejala` (
  `kode_gejala` varchar(10) NOT NULL,
  `nama_gejala` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_gejala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of gejala
-- ----------------------------
BEGIN;
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G01', 'Bercak coklat kehitaman pada umbi', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G02', 'Umbi menjadi lunak dan berair', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G03', 'Miselium jamur putih hingga abu-abu pada umbi', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G04', 'Bau busuk pada umbi', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G05', 'Umbi mudah hancur saat ditekan', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G06', 'Bercak coklat dengan lingkaran konsentris pada daun', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G07', 'Daun menguning dan mengering', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G08', 'Defoliasi (gugur daun) prematur', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G09', 'Pertumbuhan tanaman terhambat', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G10', 'Bercak kasar berwarna coklat pada permukaan umbi', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G11', 'Permukaan umbi kasar seperti gabus', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G12', 'Retak-retak pada umbi', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G13', 'Umbi berukuran kecil dan tidak normal', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G14', 'Akar tanaman berwarna coklat kehitaman', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `gejala` (`kode_gejala`, `nama_gejala`, `created_at`, `updated_at`) VALUES ('G15', 'Tanaman layu pada siang hari', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
COMMIT;

-- ----------------------------
-- Table structure for kategoris
-- ----------------------------
DROP TABLE IF EXISTS `kategoris`;
CREATE TABLE `kategoris` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of kategoris
-- ----------------------------
BEGIN;
INSERT INTO `kategoris` (`id`, `nama`, `created_at`, `updated_at`) VALUES (1, 'Programming', NULL, NULL);
INSERT INTO `kategoris` (`id`, `nama`, `created_at`, `updated_at`) VALUES (2, 'Desainer', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for kondisi
-- ----------------------------
DROP TABLE IF EXISTS `kondisi`;
CREATE TABLE `kondisi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of kondisi
-- ----------------------------
BEGIN;
INSERT INTO `kondisi` (`id`, `kondisi`) VALUES (1, 'Tidak Yakin');
INSERT INTO `kondisi` (`id`, `kondisi`) VALUES (2, 'Kurang Yakin');
INSERT INTO `kondisi` (`id`, `kondisi`) VALUES (3, 'Cukup Yakin');
INSERT INTO `kondisi` (`id`, `kondisi`) VALUES (4, 'Yakin');
INSERT INTO `kondisi` (`id`, `kondisi`) VALUES (5, 'Sangat Yakin');
COMMIT;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of login
-- ----------------------------
BEGIN;
INSERT INTO `login` (`id`, `username`, `password`, `nama_lengkap`, `role`, `created_at`, `updated_at`) VALUES (1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'admin', '2025-08-28 02:01:54', '2025-08-28 02:01:54');
INSERT INTO `login` (`id`, `username`, `password`, `nama_lengkap`, `role`, `created_at`, `updated_at`) VALUES (2, 'user', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'User Demo', 'user', '2025-08-28 02:01:54', '2025-08-28 02:01:54');
COMMIT;

-- ----------------------------
-- Table structure for lokers
-- ----------------------------
DROP TABLE IF EXISTS `lokers`;
CREATE TABLE `lokers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_kategori` int DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `logo_perusahaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `publish` varchar(255) DEFAULT NULL,
  `slot` int DEFAULT NULL,
  `lama_pengalaman` varchar(255) DEFAULT NULL,
  `gaji` varchar(255) DEFAULT NULL,
  `jk` varchar(255) DEFAULT NULL,
  `batas_waktu` varchar(255) DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tanggung_jawab` text,
  `pendidikan_terakhir` text,
  `manfaat_lainnya` text,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lokers
-- ----------------------------
BEGIN;
INSERT INTO `lokers` (`id`, `id_kategori`, `judul`, `gambar`, `logo_perusahaan`, `lokasi`, `nama_perusahaan`, `type`, `publish`, `slot`, `lama_pengalaman`, `gaji`, `jk`, `batas_waktu`, `deskripsi`, `tanggung_jawab`, `pendidikan_terakhir`, `manfaat_lainnya`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 1, 'Product Designer', 'job_single_img_1.jpg', 'job_logo_1.jpg', 'New York City', 'Puma', 'Full Time', 'April 14, 2019', 20, '2 to 3 year(s)', '$60k - $100k', 'Any', 'April 28, 2019', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus.\n\nVelit unde aliquam et voluptas reiciendis non sapiente labore, deleniti asperiores blanditiis nihil quia officiis dolor vero iste dolore vel molestiae saepe. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!', 'Necessitatibus quibusdam facilis\nVelit unde aliquam et voluptas reiciendis n Velit unde aliquam et voluptas reiciendis non sapiente labore\nCommodi quae ipsum quas est itaque\nLorem ipsum dolor sit amet, consectetur adipisicing elit\nDeleniti asperiores blanditiis nihil quia officiis dolor\n', 'Necessitatibus quibusdam facilis\nVelit unde aliquam et voluptas reiciendis non sapiente labore\nCommodi quae ipsum quas est itaque\nLorem ipsum dolor sit amet, consectetur adipisicing elit\nDeleniti asperiores blanditiis nihil quia officiis dolor\n', 'Necessitatibus quibusdam facilis\nVelit unde aliquam et voluptas reiciendis non sapiente labore\nCommodi quae ipsum quas est itaque\nLorem ipsum dolor sit amet, consectetur adipisicing elit\nDeleniti asperiores blanditiis nihil quia officiis dolor', NULL, '2024-10-07 03:21:12', '2024-10-07 03:21:12', NULL);
INSERT INTO `lokers` (`id`, `id_kategori`, `judul`, `gambar`, `logo_perusahaan`, `lokasi`, `nama_perusahaan`, `type`, `publish`, `slot`, `lama_pengalaman`, `gaji`, `jk`, `batas_waktu`, `deskripsi`, `tanggung_jawab`, `pendidikan_terakhir`, `manfaat_lainnya`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 1, 'Product Designer', 'job_single_img_1.jpg', 'job_logo_1.jpg', 'New York City', 'Puma', 'Full Time', 'April 14, 2019', 20, '2 to 3 year(s)', '$60k - $100k', 'Any', 'April 28, 2019', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis illum fuga eveniet. Deleniti asperiores, commodi quae ipsum quas est itaque, ipsa, dolore beatae voluptates nemo blanditiis iste eius officia minus.\n\nVelit unde aliquam et voluptas reiciendis non sapiente labore, deleniti asperiores blanditiis nihil quia officiis dolor vero iste dolore vel molestiae saepe. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!', 'Necessitatibus quibusdam facilis\nVelit unde aliquam et voluptas reiciendis n Velit unde aliquam et voluptas reiciendis non sapiente labore\nCommodi quae ipsum quas est itaque\nLorem ipsum dolor sit amet, consectetur adipisicing elit\nDeleniti asperiores blanditiis nihil quia officiis dolor\n', 'Necessitatibus quibusdam facilis\nVelit unde aliquam et voluptas reiciendis non sapiente labore\nCommodi quae ipsum quas est itaque\nLorem ipsum dolor sit amet, consectetur adipisicing elit\nDeleniti asperiores blanditiis nihil quia officiis dolor\n', 'Necessitatibus quibusdam facilis\nVelit unde aliquam et voluptas reiciendis non sapiente labore\nCommodi quae ipsum quas est itaque\nLorem ipsum dolor sit amet, consectetur adipisicing elit\nDeleniti asperiores blanditiis nihil quia officiis dolor', NULL, '2024-10-07 03:21:12', '2024-10-07 03:21:12', NULL);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES (1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1728230871, 1);
INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES (2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1728230871, 1);
INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES (3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1728230871, 1);
COMMIT;

-- ----------------------------
-- Table structure for penyakits
-- ----------------------------
DROP TABLE IF EXISTS `penyakits`;
CREATE TABLE `penyakits` (
  `kode_penyakit` varchar(10) NOT NULL,
  `nama_penyakit` varchar(100) NOT NULL,
  `det_penyakit` text NOT NULL,
  `srn_penyakit` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kode_penyakit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of penyakits
-- ----------------------------
BEGIN;
INSERT INTO `penyakits` (`kode_penyakit`, `nama_penyakit`, `det_penyakit`, `srn_penyakit`, `created_at`, `updated_at`) VALUES ('P01', 'Busuk Umbi', 'Penyakit busuk umbi disebabkan oleh jamur Rhizopus stolonifer yang menyerang umbi ubi jalar. Gejala utama meliputi bercak coklat kehitaman pada umbi, tekstur umbi menjadi lunak dan berair, serta munculnya miselium jamur berwarna putih hingga abu-abu pada permukaan umbi yang terinfeksi.', 'Pengendalian: 1) Panen umbi pada kondisi cuaca kering, 2) Hindari luka pada umbi saat panen, 3) Simpan umbi di tempat kering dan berventilasi baik, 4) Pisahkan umbi yang terinfeksi, 5) Gunakan fungisida berbahan aktif mankozeb atau klorotalonil, 6) Rotasi tanaman dengan tanaman non-solanaceae.', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `penyakits` (`kode_penyakit`, `nama_penyakit`, `det_penyakit`, `srn_penyakit`, `created_at`, `updated_at`) VALUES ('P02', 'Hawar Daun', 'Penyakit hawar daun disebabkan oleh jamur Alternaria bataticola yang menyerang bagian daun tanaman ubi jalar. Gejala meliputi bercak coklat dengan lingkaran konsentris pada daun, daun menguning dan mengering, serta defoliasi prematur yang dapat mengurangi hasil panen.', 'Pengendalian: 1) Gunakan varietas tahan penyakit, 2) Atur jarak tanam yang optimal untuk sirkulasi udara, 3) Hindari penyiraman berlebihan, 4) Aplikasi fungisida berbahan aktif mankozeb atau propineb, 5) Sanitasi kebun dengan membuang sisa tanaman terinfeksi, 6) Rotasi tanaman.', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
INSERT INTO `penyakits` (`kode_penyakit`, `nama_penyakit`, `det_penyakit`, `srn_penyakit`, `created_at`, `updated_at`) VALUES ('P03', 'Kudis (Scab)', 'Penyakit kudis disebabkan oleh bakteri Streptomyces ipomoeae yang menyerang umbi ubi jalar. Gejala berupa bercak-bercak kasar berwarna coklat pada permukaan umbi, permukaan umbi menjadi kasar seperti gabus, dan dalam kondisi parah dapat menyebabkan retak-retak pada umbi.', 'Pengendalian: 1) Gunakan bibit sehat dan bersertifikat, 2) Hindari penanaman di tanah yang terlalu asam (pH < 5.5), 3) Perbaiki drainase tanah, 4) Rotasi tanaman dengan tanaman non-solanaceae, 5) Aplikasi kapur untuk menaikkan pH tanah, 6) Hindari luka pada umbi saat panen dan penanganan.', '2025-08-27 23:58:08', '2025-08-27 23:58:08');
COMMIT;

-- ----------------------------
-- Table structure for savelokers
-- ----------------------------
DROP TABLE IF EXISTS `savelokers`;
CREATE TABLE `savelokers` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `loker_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`,`loker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of savelokers
-- ----------------------------
BEGIN;
INSERT INTO `savelokers` (`id`, `user_id`, `loker_id`, `created_at`, `updated_at`) VALUES (0, 1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for searches
-- ----------------------------
DROP TABLE IF EXISTS `searches`;
CREATE TABLE `searches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of searches
-- ----------------------------
BEGIN;
INSERT INTO `searches` (`id`, `keyword`, `created_at`, `updated_at`) VALUES (1, 'programmer', '2024-10-28 17:24:24', '2024-10-28 17:24:24');
INSERT INTO `searches` (`id`, `keyword`, `created_at`, `updated_at`) VALUES (2, 'programmer', '2024-10-28 17:29:29', '2024-10-28 17:29:29');
INSERT INTO `searches` (`id`, `keyword`, `created_at`, `updated_at`) VALUES (3, 'developer', '2024-10-28 17:29:36', '2024-10-28 17:29:36');
COMMIT;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_symptoms_input
-- ----------------------------
DROP TABLE IF EXISTS `user_symptoms_input`;
CREATE TABLE `user_symptoms_input` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diagnosis_id` int NOT NULL,
  `kode_gejala` varchar(10) NOT NULL,
  `nilai_user` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_gejala` (`kode_gejala`),
  KEY `idx_user_input_diagnosis` (`diagnosis_id`),
  CONSTRAINT `user_symptoms_input_ibfk_1` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis_results` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_symptoms_input_ibfk_2` FOREIGN KEY (`kode_gejala`) REFERENCES `gejala` (`kode_gejala`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_symptoms_input
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `cv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `linked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ig` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `cv`, `type`, `email`, `last_active`, `foto`, `bio`, `fb`, `twitter`, `linked`, `ig`, `nama`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'andrimc', NULL, NULL, 1, '3.png', 'FULLSTACK DEVELOPER', 'tes@gmail.com', NULL, 'person_2.jpg', '                                                                                                Necessitatibus quibusdam facilis\r\nVelit unde aliquam et voluptas reiciendis non sapiente labore\r\nCommodi quae ipsum quas est itaque\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit\r\nDeleniti asperiores blanditiis nihil quia officiis dolor                                                                                    ', 'andri', 'andri', NULL, 'andri', 'Andri Syahputra S.Kom', '2024-10-06 16:12:40', '2024-10-06 16:12:40', NULL);
INSERT INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `cv`, `type`, `email`, `last_active`, `foto`, `bio`, `fb`, `twitter`, `linked`, `ig`, `nama`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'renika', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-23 09:36:46', '2025-08-23 09:36:47', NULL);
COMMIT;

-- ----------------------------
-- View structure for v_diagnosis_summary
-- ----------------------------
DROP VIEW IF EXISTS `v_diagnosis_summary`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_diagnosis_summary` AS select `dr`.`id` AS `id`,`dr`.`nama_pasien` AS `nama_pasien`,`dr`.`tanggal_diagnosis` AS `tanggal_diagnosis`,`p`.`nama_penyakit` AS `nama_penyakit`,`dr`.`nilai_cf_tertinggi` AS `nilai_cf_tertinggi`,`l`.`nama_lengkap` AS `diagnosed_by` from ((`diagnosis_results` `dr` left join `penyakit` `p` on((`dr`.`penyakit_terdiagnosis` = `p`.`kode_penyakit`))) left join `login` `l` on((`dr`.`user_id` = `l`.`id`))) order by `dr`.`tanggal_diagnosis` desc;

-- ----------------------------
-- View structure for v_knowledge_base
-- ----------------------------
DROP VIEW IF EXISTS `v_knowledge_base`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_knowledge_base` AS select `bp`.`kode_pengetahuan` AS `kode_pengetahuan`,`p`.`nama_penyakit` AS `nama_penyakit`,`g`.`nama_gejala` AS `nama_gejala`,`bp`.`mb` AS `mb`,`bp`.`md` AS `md`,`bp`.`cf` AS `cf` from ((`basis_pengetahuan` `bp` join `penyakit` `p` on((`bp`.`kode_penyakit` = `p`.`kode_penyakit`))) join `gejala` `g` on((`bp`.`kode_gejala` = `g`.`kode_gejala`))) order by `p`.`nama_penyakit`,`g`.`kode_gejala`;

SET FOREIGN_KEY_CHECKS = 1;
