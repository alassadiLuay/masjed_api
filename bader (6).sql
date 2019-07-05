-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2019 at 08:58 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bader`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_activations`
--

CREATE TABLE `admin_activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator', 'administrator@brackets.sk', '$2y$10$k.ZEEuYrRHV67O/qSSbajOXWz7d9.TGvVEY./WlrUQUMsHnu2.yBy', 'zQzCKidmc5QMgo7zGsi38eynp7Bnp3OcOcYsPRiUParfbHVN58YwI1W15Lba', 1, 0, 'en', NULL, '2019-04-17 17:05:39', '2019-04-17 17:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `awqafs`
--

CREATE TABLE `awqafs` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_name` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tester_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awqafs`
--

INSERT INTO `awqafs` (`id`, `test_name`, `date`, `place`, `tester_name`, `created_at`, `updated_at`) VALUES
(1, '1', '10-9-2018', 'وزارة الأوقاف - الطابق 7', 'الشيخ خالد العلبي', '2019-04-25 16:39:01', '2019-04-25 16:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `awqaf_students`
--

CREATE TABLE `awqaf_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `awqaf_id` int(11) NOT NULL,
  `student_mark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_passed` tinyint(1) NOT NULL,
  `full_mark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject_type` enum('juza','surah','page','') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'juza',
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awqaf_students`
--

INSERT INTO `awqaf_students` (`id`, `student_id`, `awqaf_id`, `student_mark`, `is_passed`, `full_mark`, `created_at`, `updated_at`, `subject_type`, `subject_id`) VALUES
(1, 2, 1, '95', 1, '100', '2019-05-01 21:00:00', NULL, 'juza', 1),
(3, 2, 1, '77', 1, '100', '2019-05-28 21:00:00', NULL, 'page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `semester_id` int(11) NOT NULL,
  `course_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `started_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `session_number` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `semester_id`, `course_name`, `description`, `started_at`, `end_at`, `session_number`, `enabled`, `created_at`, `updated_at`) VALUES
(2, 2, 'تحفيظ القرآن الكريم', 'ب', '2019-06-11', '2019-06-28', 15, 1, '2019-04-25 16:24:30', '2019-06-12 00:43:08'),
(3, 2, 'فارس الحديث', NULL, NULL, NULL, 22, 1, '2019-04-25 16:24:45', '2019-04-25 16:24:55'),
(4, 4, 'aaa', NULL, '2019-06-10', '2019-06-29', 8, 1, '2019-06-12 00:43:25', '2019-06-12 00:43:25'),
(5, 4, 'ssss', NULL, NULL, NULL, 9, 1, '2019-06-12 00:55:04', '2019-06-12 00:55:04'),
(6, 5, 'تحفيظ القرآن الكريم - الصف السابع', NULL, '2019-06-02', '2019-06-25', 30, 1, '2019-06-30 14:53:18', '2019-06-30 14:53:18');

-- --------------------------------------------------------

--
-- Table structure for table `course_students`
--

CREATE TABLE `course_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `class_id` int(10) NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_students`
--

INSERT INTO `course_students` (`id`, `course_id`, `student_id`, `class_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, NULL, NULL, NULL),
(4, 2, 5, 1, NULL, NULL, NULL),
(5, 3, 2, 2, NULL, NULL, NULL),
(7, 2, 4, 2, NULL, NULL, NULL),
(8, 2, 3, 1, NULL, NULL, NULL),
(9, 4, 6, 2, NULL, NULL, NULL),
(10, 4, 2, 2, NULL, NULL, NULL),
(11, 4, 4, 2, NULL, NULL, NULL),
(12, 4, 8, 2, NULL, NULL, NULL),
(13, 6, 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(11) NOT NULL,
  `exam_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_max_num` int(11) NOT NULL,
  `exam_min_num` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `course_id`, `exam_name`, `exam_max_num`, `exam_min_num`, `created_at`, `updated_at`) VALUES
(1, 1, 'ttere', 100, 50, '2019-04-20 17:17:47', '2019-04-20 17:17:47'),
(2, 2, 'تسميع معاني المفردات', 100, 50, '2019-04-25 16:25:27', '2019-04-25 16:25:27'),
(3, 2, 'شرح الآيات الكريمة', 100, 50, '2019-04-25 16:25:46', '2019-04-25 16:25:46'),
(4, 3, '100 حديث من سنن الترمذي', 60, 100, '2019-05-13 23:53:52', '2019-05-13 23:53:52'),
(5, 6, 'سبر الجزء', 100, 50, '2019-06-30 14:54:06', '2019-06-30 14:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `juza`
--

CREATE TABLE `juza` (
  `id` int(11) NOT NULL,
  `juza_name` varchar(200) NOT NULL,
  `page_start_num` int(11) NOT NULL,
  `page_end_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `juza`
--

INSERT INTO `juza` (`id`, `juza_name`, `page_start_num`, `page_end_num`) VALUES
(1, 'الجزء الأول', 2, 21);

-- --------------------------------------------------------

--
-- Table structure for table `listened_subjects`
--

CREATE TABLE `listened_subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listened_subjects`
--

INSERT INTO `listened_subjects` (`id`, `student_id`, `student_course_id`, `subject_id`, `subject_type`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 'page', '2019-05-25 21:00:00', NULL),
(3, 1, 1, 1, 'juza', NULL, NULL),
(4, 1, 1, 1, 'juza', NULL, NULL),
(5, 1, 1, 1, 'juza', NULL, NULL),
(6, 1, 1, 1, 'juza', NULL, NULL),
(7, 1, 1, 1, 'juza', NULL, NULL),
(8, 1, 1, 1, 'juza', NULL, NULL),
(9, 1, 1, 1, 'juza', NULL, NULL),
(10, 1, 1, 1, 'juza', NULL, NULL),
(11, 1, 1, 1, 'juza', NULL, NULL),
(12, 1, 1, 1, 'juza', NULL, NULL),
(13, 1, 1, 1, 'juza', NULL, NULL),
(14, 1, 1, 1, 'juza', NULL, NULL),
(15, 1, 1, 1, 'juza', NULL, NULL),
(16, 1, 1, 1, 'juza', NULL, NULL),
(17, 1, 1, 1, 'juza', NULL, NULL),
(18, 1, 1, 1, 'juza', NULL, NULL),
(19, 1, 1, 1, 'juza', NULL, NULL),
(20, 4, 7, 1, 'surah', '2019-05-24 08:20:46', '2019-05-24 08:20:46'),
(21, 2, 1, 1, 'surah', '2019-05-26 01:25:01', '2019-05-26 01:25:01'),
(22, 2, 1, 78, 'surah', '2019-05-26 01:32:11', '2019-05-26 01:32:11'),
(23, 3, 8, 1, 'page', '2019-05-26 01:48:15', '2019-05-26 01:48:15'),
(24, 2, 1, 79, 'surah', '2019-05-26 18:54:32', '2019-05-26 18:54:32'),
(25, 2, 13, 78, 'surah', '2019-06-30 15:36:33', '2019-06-30 15:36:33'),
(26, 2, 13, 79, 'surah', '2019-06-30 16:09:07', '2019-06-30 16:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(10) UNSIGNED NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_student_id` int(11) NOT NULL,
  `mark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `exam_id`, `student_id`, `course_student_id`, `mark`, `notes`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 1, '90', 'Te', NULL, NULL),
(2, 3, 2, 1, '99', 'ss', NULL, NULL),
(3, 2, 5, 4, '80', 'kk', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2019_03_29_190056_create_class_table', 4),
(16, '2019_03_29_193041_fill_permissions_for_class', 5),
(22, '2019_03_29_190056_create_std_class_table', 11),
(23, '2019_03_29_194806_fill_permissions_for_std-class', 11),
(24, '2019_03_29_190056_create_stdclass_table', 12),
(25, '2019_03_29_195019_fill_permissions_for_stdclass', 12),
(38, '2017_08_24_000000_create_activations_table', 13),
(39, '2017_08_24_000000_create_admin_activations_table', 13),
(40, '2017_08_24_000000_create_admin_password_resets_table', 13),
(41, '2017_08_24_000000_create_admin_users_table', 13),
(42, '2018_07_18_000000_create_wysiwyg_media_table', 13),
(43, '2019_03_29_185444_create_media_table', 13),
(44, '2019_03_29_185444_create_permission_tables', 13),
(45, '2019_03_29_185449_fill_default_admin_user_and_permissions', 13),
(46, '2019_03_29_190055_create_translations_table', 13),
(47, '2019_03_29_190056_create_student_class_table', 13),
(48, '2019_03_29_190057_create_course_table', 13),
(49, '2019_03_29_190058_create_exam_table', 13),
(50, '2019_03_29_190059_create_semester_table', 13),
(51, '2019_03_29_190155_create_student_table', 13),
(52, '2019_03_29_190157_create_teacher_table', 13),
(53, '2019_03_29_193111_fill_permissions_for_course', 13),
(54, '2019_03_29_193129_fill_permissions_for_exam', 13),
(55, '2019_03_29_193208_fill_permissions_for_semester', 13),
(56, '2019_03_29_193241_fill_permissions_for_student', 13),
(57, '2019_03_29_193320_fill_permissions_for_teacher', 13),
(58, '2019_03_29_195914_fill_permissions_for_student-class', 13),
(59, '2019_03_29_196257_create_course_teacher_student_table', 13),
(60, '2019_03_29_205542_fill_permissions_for_course-teacher-student', 13),
(61, '2019_04_17_192302_fill_permissions_for_teacher-role', 13),
(62, '2019_04_17_192616_fill_permissions_for_teacher-course', 13),
(63, '2019_04_17_200116_fill_permissions_for_point-type', 13),
(64, '2019_04_17_200207_fill_permissions_for_point-config', 13),
(65, '2019_04_1_196257_create_teacher_role_table', 13),
(66, '2019_04_1_197257_create_teacher_course_table', 13),
(67, '2019_04_2_197257_create_point_type_table', 13),
(68, '2019_04_3_197257_create_point_config_table', 13),
(69, '2019_04_4_188267_create_awqaf_table', 14),
(70, '2019_04_4_189267_create_awqaf_student_table', 14),
(71, '2019_04_4_189387_create_mark_table', 14),
(72, '2019_04_4_199397_create_student_note_table', 14),
(73, '2019_04_4_209397_create_student_attendance_table', 14),
(74, '2019_04_4_209897_create_student_point_table', 14),
(75, '2019_04_25_162831_fill_permissions_for_awqaf', 15),
(76, '2019_04_25_162836_fill_permissions_for_awqaf-student', 16),
(77, '2019_04_25_162846_fill_permissions_for_mark', 17),
(78, '2019_04_25_162857_fill_permissions_for_student-note', 18),
(79, '2019_04_25_162915_fill_permissions_for_student-attendance', 19),
(80, '2019_04_25_162930_fill_permissions_for_student-point', 20),
(81, '2019_04_28_209897_create_listened_subject_table', 21),
(82, '2019_05_03_204513_fill_permissions_for_listened-subject', 22);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `page_name` int(11) NOT NULL,
  `surah_id` int(11) NOT NULL,
  `juza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `page_name`, `surah_id`, `juza_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(2, 'admin.translation.index', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(3, 'admin.translation.edit', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(4, 'admin.translation.rescan', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(5, 'admin.admin-user.index', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(6, 'admin.admin-user.create', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(7, 'admin.admin-user.edit', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(8, 'admin.admin-user.delete', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(9, 'admin.upload', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39'),
(10, 'admin.course', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(11, 'admin.course.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(12, 'admin.course.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(13, 'admin.course.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(14, 'admin.course.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(15, 'admin.course.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(16, 'admin.exam', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(17, 'admin.exam.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(18, 'admin.exam.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(19, 'admin.exam.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(20, 'admin.exam.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(21, 'admin.exam.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(22, 'admin.semester', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(23, 'admin.semester.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(24, 'admin.semester.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(25, 'admin.semester.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(26, 'admin.semester.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(27, 'admin.semester.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(28, 'admin.student', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(29, 'admin.student.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(30, 'admin.student.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(31, 'admin.student.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(32, 'admin.student.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(33, 'admin.student.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(34, 'admin.teacher', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(35, 'admin.teacher.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(36, 'admin.teacher.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(37, 'admin.teacher.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(38, 'admin.teacher.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(39, 'admin.teacher.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(40, 'admin.student-class', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(41, 'admin.student-class.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(42, 'admin.student-class.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(43, 'admin.student-class.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(44, 'admin.student-class.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(45, 'admin.student-class.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(46, 'admin.course-student', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(47, 'admin.course-student.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(48, 'admin.course-student.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(49, 'admin.course-student.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(50, 'admin.course-student.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(51, 'admin.course-student.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(52, 'admin.teacher-role', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(53, 'admin.teacher-role.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(54, 'admin.teacher-role.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(55, 'admin.teacher-role.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(56, 'admin.teacher-role.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(57, 'admin.teacher-role.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(58, 'admin.teacher-course', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(59, 'admin.teacher-course.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(60, 'admin.teacher-course.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(61, 'admin.teacher-course.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(62, 'admin.teacher-course.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(63, 'admin.teacher-course.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(64, 'admin.point-type', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(65, 'admin.point-type.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(66, 'admin.point-type.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(67, 'admin.point-type.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(68, 'admin.point-type.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(69, 'admin.point-type.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(70, 'admin.point-config', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(71, 'admin.point-config.index', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(72, 'admin.point-config.create', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(73, 'admin.point-config.show', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(74, 'admin.point-config.edit', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(75, 'admin.point-config.delete', 'admin', '2019-04-17 17:05:40', '2019-04-17 17:05:40'),
(76, 'admin.awqaf', 'admin', '2019-04-25 13:28:33', '2019-04-25 13:28:33'),
(77, 'admin.awqaf.index', 'admin', '2019-04-25 13:28:33', '2019-04-25 13:28:33'),
(78, 'admin.awqaf.create', 'admin', '2019-04-25 13:28:33', '2019-04-25 13:28:33'),
(79, 'admin.awqaf.show', 'admin', '2019-04-25 13:28:33', '2019-04-25 13:28:33'),
(80, 'admin.awqaf.edit', 'admin', '2019-04-25 13:28:33', '2019-04-25 13:28:33'),
(81, 'admin.awqaf.delete', 'admin', '2019-04-25 13:28:33', '2019-04-25 13:28:33'),
(82, 'admin.awqaf-student', 'admin', '2019-04-25 13:28:42', '2019-04-25 13:28:42'),
(83, 'admin.awqaf-student.index', 'admin', '2019-04-25 13:28:42', '2019-04-25 13:28:42'),
(84, 'admin.awqaf-student.create', 'admin', '2019-04-25 13:28:42', '2019-04-25 13:28:42'),
(85, 'admin.awqaf-student.show', 'admin', '2019-04-25 13:28:42', '2019-04-25 13:28:42'),
(86, 'admin.awqaf-student.edit', 'admin', '2019-04-25 13:28:42', '2019-04-25 13:28:42'),
(87, 'admin.awqaf-student.delete', 'admin', '2019-04-25 13:28:42', '2019-04-25 13:28:42'),
(88, 'admin.mark', 'admin', '2019-04-25 13:28:48', '2019-04-25 13:28:48'),
(89, 'admin.mark.index', 'admin', '2019-04-25 13:28:48', '2019-04-25 13:28:48'),
(90, 'admin.mark.create', 'admin', '2019-04-25 13:28:48', '2019-04-25 13:28:48'),
(91, 'admin.mark.show', 'admin', '2019-04-25 13:28:48', '2019-04-25 13:28:48'),
(92, 'admin.mark.edit', 'admin', '2019-04-25 13:28:48', '2019-04-25 13:28:48'),
(93, 'admin.mark.delete', 'admin', '2019-04-25 13:28:48', '2019-04-25 13:28:48'),
(94, 'admin.student-note', 'admin', '2019-04-25 13:28:59', '2019-04-25 13:28:59'),
(95, 'admin.student-note.index', 'admin', '2019-04-25 13:28:59', '2019-04-25 13:28:59'),
(96, 'admin.student-note.create', 'admin', '2019-04-25 13:28:59', '2019-04-25 13:28:59'),
(97, 'admin.student-note.show', 'admin', '2019-04-25 13:28:59', '2019-04-25 13:28:59'),
(98, 'admin.student-note.edit', 'admin', '2019-04-25 13:28:59', '2019-04-25 13:28:59'),
(99, 'admin.student-note.delete', 'admin', '2019-04-25 13:28:59', '2019-04-25 13:28:59'),
(100, 'admin.student-attendance', 'admin', '2019-04-25 13:29:17', '2019-04-25 13:29:17'),
(101, 'admin.student-attendance.index', 'admin', '2019-04-25 13:29:17', '2019-04-25 13:29:17'),
(102, 'admin.student-attendance.create', 'admin', '2019-04-25 13:29:17', '2019-04-25 13:29:17'),
(103, 'admin.student-attendance.show', 'admin', '2019-04-25 13:29:17', '2019-04-25 13:29:17'),
(104, 'admin.student-attendance.edit', 'admin', '2019-04-25 13:29:17', '2019-04-25 13:29:17'),
(105, 'admin.student-attendance.delete', 'admin', '2019-04-25 13:29:17', '2019-04-25 13:29:17'),
(106, 'admin.student-point', 'admin', '2019-04-25 13:29:32', '2019-04-25 13:29:32'),
(107, 'admin.student-point.index', 'admin', '2019-04-25 13:29:32', '2019-04-25 13:29:32'),
(108, 'admin.student-point.create', 'admin', '2019-04-25 13:29:32', '2019-04-25 13:29:32'),
(109, 'admin.student-point.show', 'admin', '2019-04-25 13:29:32', '2019-04-25 13:29:32'),
(110, 'admin.student-point.edit', 'admin', '2019-04-25 13:29:32', '2019-04-25 13:29:32'),
(111, 'admin.student-point.delete', 'admin', '2019-04-25 13:29:32', '2019-04-25 13:29:32'),
(112, 'admin.listened-subject', 'admin', '2019-05-03 17:45:15', '2019-05-03 17:45:15'),
(113, 'admin.listened-subject.index', 'admin', '2019-05-03 17:45:15', '2019-05-03 17:45:15'),
(114, 'admin.listened-subject.create', 'admin', '2019-05-03 17:45:15', '2019-05-03 17:45:15'),
(115, 'admin.listened-subject.show', 'admin', '2019-05-03 17:45:15', '2019-05-03 17:45:15'),
(116, 'admin.listened-subject.edit', 'admin', '2019-05-03 17:45:15', '2019-05-03 17:45:15'),
(117, 'admin.listened-subject.delete', 'admin', '2019-05-03 17:45:15', '2019-05-03 17:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `point_configs`
--

CREATE TABLE `point_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `point_type_id` int(11) NOT NULL,
  `point_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point_value` int(10) NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_configs`
--

INSERT INTO `point_configs` (`id`, `point_type_id`, `point_name`, `point_value`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 'quran', 5, '1545asdasda', '2019-04-22 15:15:14', '2019-04-22 15:15:14'),
(2, 1, 'sss', 1, 'asdas', '2019-04-22 15:20:41', '2019-04-22 15:20:41'),
(3, 2, 'تسميع سورة نصف صفحة من جزء عم', 3, 'نصف الصفحة', '2019-04-25 16:35:25', '2019-06-14 09:11:37'),
(4, 2, 'تسميع سورة قصيرة من جزء عم', 2, 'ثلث صفحة', '2019-04-25 16:35:54', '2019-06-14 09:10:59'),
(5, 2, 'تسميع سورة طويلة من جزء عم', 9, 'أكثر من صفحة', '2019-04-25 16:36:18', '2019-06-14 09:10:32'),
(6, 3, 'حضور الطالب على الوقت', 5, 'حضر منذ بداية الحصة', '2019-04-25 16:37:03', '2019-04-25 16:37:03'),
(7, 3, 'حضور متأخر', 2, 'حضر قبل نهاية الدرس', '2019-04-25 16:37:25', '2019-04-25 16:37:25'),
(8, 4, 'هدوء في الحصة', 3, '', NULL, NULL),
(9, 4, 'مشاغبة في الحصة', -2, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `point_types`
--

CREATE TABLE `point_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_types`
--

INSERT INTO `point_types` (`id`, `type_name`, `notes`, `created_at`, `updated_at`) VALUES
(2, 'القرآن الكريم', 'نقاط القرآن الكريم', '2019-04-25 16:34:52', '2019-04-25 16:34:52'),
(3, 'الدوام', 'الالتزام بالحضور', '2019-04-25 16:36:38', '2019-04-25 16:36:38'),
(4, 'السلوك', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2019-04-17 17:05:39', '2019-04-17 17:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1);

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(10) UNSIGNED NOT NULL,
  `semester_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `started_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `semester_name`, `description`, `started_at`, `end_at`, `enabled`, `created_at`, `updated_at`) VALUES
(2, 'خريف 2017', 'تجربة 1', '2019-06-02', '2019-06-30', 0, '2019-04-25 16:23:53', '2019-06-30 14:51:59'),
(3, 'صيف 2018', 'تجربة2', NULL, NULL, 0, '2019-04-25 16:24:07', '2019-05-03 09:41:55'),
(5, 'صيف 2019', NULL, '2019-06-02', '2019-08-31', 1, '2019-06-30 14:52:38', '2019-06-30 16:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_fname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_lname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_father_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_father_job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transportation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `has_id` tinyint(1) NOT NULL DEFAULT '1',
  `student_birthdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_fname`, `student_lname`, `student_father_name`, `student_address`, `student_father_job`, `student_nationality`, `father_phone`, `student_phone`, `home_phone`, `transportation`, `student_photo`, `note`, `status`, `has_id`, `student_birthdate`, `created_at`, `updated_at`) VALUES
(2, 'طالب 1', 'تجربة', 'والد الطالب', 'المهاجرين', 'مدرس', 'سوري', '0991647355', '0116347728', '0116347728', 'باص', 'يجب وضع صورة هنا!', 'طالب مو كتير نجيب', 1, 1, NULL, '2019-04-25 16:29:25', '2019-04-25 16:29:25'),
(3, 'طالب2', '', '', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, NULL),
(4, 'طالب3', '', '', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, NULL),
(5, 'طالب4', '', '', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, NULL),
(6, 'طالب5', '', '', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, NULL),
(7, 'طالب6', '', '', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, NULL),
(8, 'طالب7', '', '', '', '', '', '', '', '', '', '', '', 1, 1, NULL, NULL, NULL),
(9, 'we', 'we', 'we', 'iki', 't', NULL, '123', '456', NULL, NULL, 'defualt.jpg', NULL, 0, 0, '2019-06-04', '2019-06-12 00:53:05', '2019-06-12 00:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `students_temp`
--

CREATE TABLE `students_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_fname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_lname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_father_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_father_job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transportation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `has_id` tinyint(1) NOT NULL DEFAULT '1',
  `student_birthdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `school_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_temp`
--

INSERT INTO `students_temp` (`id`, `student_fname`, `student_lname`, `student_father_name`, `student_address`, `student_father_job`, `student_nationality`, `father_phone`, `student_phone`, `home_phone`, `transportation`, `student_photo`, `note`, `status`, `has_id`, `student_birthdate`, `created_at`, `updated_at`, `school_name`) VALUES
(1, 'خالد المبارك', 'عبد الفتاح', NULL, 'الميدان شارع السعادة بناء العمر', 'تاجر', 'سوري', '932441122', NULL, '115416852', ' ', '3', NULL, 0, 0, '2009-01-01', NULL, NULL, 'Monte Cottage'),
(2, 'عمر المبارك', 'عبد الفتاح', NULL, 'الميدان شارع السعادة بناء العمر', 'تاجر', 'سوري', '932441122', '0', '115416832', ' ', '11', 'كرة قدم', 0, 0, '2010-01-01', NULL, NULL, 'Monte Cottage'),
(3, 'زين الدين عابدين', 'مازن', NULL, 'الجاحظ جانب حديقة الجاحظ', 'مهندس تكييف', 'سوري', '9', NULL, '113334715', ' ', '11', NULL, 0, 0, '2008-11-01', NULL, NULL, 'نصوح بابيل'),
(4, 'زين الصباغ', 'معاذ', NULL, 'ساحة الامويين اميرية الطيران', 'صيدلي', 'سوري', '944552636', NULL, '113321668', ' ', '6', NULL, 0, 0, '2010-11-01', NULL, NULL, 'الاخوة'),
(5, 'حازم السعدي', 'وضاح', NULL, 'أبو رمانة - خلف مكتبة الأسد', 'ضابط شرطة', 'سوري', '944056214', '958912193', '113332105', ' ', '11', NULL, 0, 0, '1969-12-31', NULL, NULL, 'البوادر'),
(6, 'ياسر الزعيم', 'سليمان', NULL, 'الجسر الأبيض - جادة نوري باشا', 'تاجر', 'سوري', '933430122', NULL, '113332299', ' ', '11', NULL, 0, 0, '2008-04-09', NULL, NULL, 'دوحة البلابل'),
(7, 'عبد الرحمن الطباع', 'صفوان', NULL, 'مهاجرين', 'طبيب أسنان', 'سوري', '947043372', '0', '113712281', ' ', '6', 'كرة القدم', 0, 0, '2010-08-01', NULL, NULL, 'فجر السعادة'),
(8, 'ياسر صناديقي', 'مهند', NULL, 'طلياني- جانب جامع دك الباب', 'مهندس معماري', 'سوري', '965002020', NULL, '113340647', ' ', '11', NULL, 0, 0, '2008-11-20', NULL, NULL, 'شويفات'),
(9, 'كرم هارون', 'محمد', NULL, 'مالكي - ', 'تاجر دواليب', 'فلسطيني', '940556333', '0', '112228043', ' ', '11', 'قدم', 0, 0, '2009-11-21', NULL, NULL, 'السورية الوطنية'),
(10, 'أنور المصري', 'ناهل', NULL, 'الجسر الأبيض', 'محامي', 'سوري ', '988043575', NULL, '1133355735', ' ', '1', NULL, 0, 0, '2008-11-15', NULL, NULL, 'عصام حسن'),
(11, 'كريم غبور', 'أحمد', NULL, 'مهاجرين', 'فني كمبيوتر', 'سوري', '933778812', NULL, '113337313', ' ', '6', NULL, 0, 0, '2010-06-15', NULL, NULL, 'دوحة المجد'),
(12, 'يامن فلاحة', 'أحمد', NULL, 'صحنايا', 'صاحب مطعم', 'روسي', '947240803', NULL, '0', ' ', '11', NULL, 0, 0, '2008-07-21', NULL, NULL, 'دوحة الأدب'),
(13, 'عمرو السعدي', 'وضاح', NULL, 'أبو رمانة - خلف مكتبة الأسد', 'ضابط شرطة', 'سوري', '944056214', '958912193', '113332105', ' ', '13', NULL, 0, 0, '2005-11-09', NULL, NULL, 'المعهد العربي'),
(14, 'زيد ابو النصر البساتنة', 'ماهر', NULL, 'المزة مواساة', 'محاسب', 'سوري', '933203336', '997686289', '116664882', ' ', '7', 'كرة القدم-السباحة', 0, 0, '2005-12-29', NULL, NULL, 'الوطنية'),
(15, 'خالد الكردي', 'سامر', NULL, 'المالكي سفارة البابوية', 'مهندس مدني', 'سوري', '944319115', '936598176', '113333370', ' ', '7', 'كرة القدم', 0, 0, '2005-04-14', NULL, NULL, 'الشويفات'),
(16, 'مجد هيتو', 'انس', NULL, 'المهاجرين جادة تالتة', 'موظف - اميركا', 'سوري', '960600977', '935810761', '113711261', ' ', '7', NULL, 0, 0, '2005-07-16', NULL, NULL, 'بدر الدين الحسني'),
(17, 'عبد الجليل دياب', 'احمد', NULL, 'مالكي شارع هارون الرشيد', 'مهندس', 'سوري', '933387389', '0', '113335028', ' ', '7', NULL, 0, 0, '2005-02-10', NULL, NULL, 'البشائر العربية'),
(18, 'عبد الهادي دياب', 'احمد', NULL, 'مالكي شارع هارون الرشيد', 'مهندس', 'سوري', '933387389', '0', '113335028', ' ', '7', NULL, 0, 0, '2005-02-10', NULL, NULL, 'البشائر العربية'),
(19, 'معاذ الصباغ', 'فهد', NULL, 'باب سريجة مخبز المصري', 'محاسب', 'سوري', '933888897', '953642740', '112233440', ' ', '13', NULL, 0, 0, '2005-10-02', NULL, NULL, 'حسن الخراط'),
(20, 'ياسر البدوي', 'محمد', NULL, 'الجسر الابيض جانب الدكتورة عنان الحفار', 'مدير مجمع العثمان', 'سوري', '945644272', '944260829', '113310376', ' ', '7', NULL, 0, 0, '2004-06-09', NULL, NULL, 'عمر بن عبد العزيز'),
(21, 'عبد الرحمن اليافي', 'ماهر', NULL, 'المهاجرين جادة سادسة سوبرماركت اليافي', 'مهندي ديكور', 'سوري', '932535757', '0', '113736104', ' ', '4', 'سباحة', 0, 0, '2004-12-12', NULL, NULL, 'رشدي الشمعة'),
(22, 'محمد تيسير حسنين', 'محمد بسام', NULL, 'الجسر الابيض جادة الزهراوي', 'مكتب سياحة', 'سوري', '933363516', '953673007', '113353327', ' ', '7', NULL, 0, 0, '2005-09-12', NULL, NULL, '-'),
(23, 'ماهر باكير', 'ملهم', NULL, 'ابو رمانة مواجه اميرية الطيران', 'تاجر', 'سوري', '933335017', '949002536', '113335017', ' ', '4', NULL, 0, 0, '2004-08-14', NULL, NULL, 'دمشق الوطنية'),
(24, 'بشر السادات', 'وسيم', NULL, 'المهاجرين جادة تالتة', 'دكتور اسنان', 'سوري', '933631263', '0', '113735231', ' ', '4', NULL, 0, 0, '2004-06-10', NULL, NULL, 'بدر الدين الحسني'),
(25, 'عمر الحكيم', 'ماهر', NULL, 'قدسيا جمعيات', 'خياط', 'سوري', '956274713', '993226197', '113233503', ' ', '7', NULL, 0, 0, '2005-01-03', NULL, NULL, 'الثقفي'),
(26, 'رضا الكسم', 'فراس', NULL, 'عفيف', 'دكتور', 'سوري', '933363024', '947274498', '113349324', ' ', '13', 'البطولة الوطنية للروبوتات', 0, 0, '2006-04-04', NULL, NULL, 'فجر السعادة'),
(27, 'يوسف البحرا', 'انس', NULL, 'ضاحية قدسيا', 'محاسب', 'سوري', '944442579', '957610500', '3451902', ' ', '14', NULL, 0, 0, '2005-05-27', NULL, NULL, 'فرنسية'),
(29, 'عمر درويش', 'محمد نهاد', NULL, 'مهاجرين شطا جادة تانية', 'محل نظارات طبية', 'سوري', '933293388', '997613388', '113712698', ' ', '13', 'كرة قدم', 0, 0, '2006-04-11', NULL, NULL, 'اباء العربي'),
(30, 'حمزة موصلي', 'محمد', NULL, 'مزة', 'تاجر', 'سوري', '933485000', '0', '116617847', ' ', '13', NULL, 0, 0, '2005-05-28', NULL, NULL, 'بوادر'),
(31, 'بدر ابو الشامات', 'منار', NULL, 'مزة', 'تاجر', 'سوري', '944772880', '934910418', '116117110', ' ', '14', NULL, 0, 0, '2005-05-28', NULL, NULL, 'رواد المجد'),
(33, 'عبادة المصري', 'ناهل', NULL, 'جسر ابيض', 'محامي', 'سوري', '932498489', '996526479', '113318357', ' ', '14', NULL, 0, 0, '2005-05-28', NULL, NULL, 'عصام حسن'),
(34, 'محمد المبارك', 'عبد الفتاح', NULL, 'ميدان', 'تاجر', 'سوري', '932441122', '993111653', '115416832', ' ', '13', 'رسم - كرة قدم', 0, 0, '2006-03-03', NULL, NULL, 'بناة الاجيال'),
(35, 'ماهر رسلان', 'صفوان', NULL, ' جسر ابيض طلعة جامع الجسر مقابل معهد الادارة العال', 'ورشة', 'سوري', '933386312', '997977180', '113337744', ' ', '13', NULL, 0, 0, '2005-05-28', NULL, NULL, 'النابلسي'),
(36, 'محمد ابو القصب', 'اسامة', NULL, 'ابو رمانة', 'محاسب', 'سوري', '937916846', '944301508', '113311251', ' ', '7', NULL, 0, 0, '2005-05-27', NULL, NULL, 'ثقفي'),
(38, 'رياض اللحام', 'عبد الرحمن', NULL, 'أبو رمانة - حبوبي - بناء اللحام ', 'تاجر', 'سوري', '944730074', '993022910', '113335074', ' ', '13', NULL, 0, 0, '2004-01-11', NULL, NULL, 'المدرسة الفرنسية'),
(39, 'ياسر الصباغ', 'معاذ', NULL, 'جاحظ - نزلة الأركان - جانب مؤسسة الأكرم', 'مساعد صيدلي', 'سوري', '944552636', NULL, '113321668', ' ', '13', 'ة قدم - روبوتك', 0, 0, '2006-04-28', NULL, NULL, 'الأخوة'),
(40, 'يامن الصباغ ', 'معاذ', NULL, 'جاحظ - نزلة الأركان - جانب مؤسسة الأكرم', 'مساعد صيدلي', 'سوري', '944552636', NULL, '113321668', ' ', '13', 'كرة قدم - روبوتيك', 0, 0, '2006-04-28', NULL, NULL, 'الأخوة'),
(41, 'خالد الطرابيشي', 'فادي', NULL, 'مالكي - دخلة مشفى الشامي - مقابل صائب نحاس', 'محاسب', 'سوري', '952444765', '952444763', '113737032', ' ', '13', NULL, 0, 0, '2006-12-10', NULL, NULL, 'دوحة المجد'),
(42, 'فراس خيتي', 'ابراهيم', NULL, 'جديدة الوادي', 'صيانة سيارات', 'سوري', '940120016', '0', '113833165', ' ', '13', 'كرة القدم والسباحة', 0, 0, '2005-01-01', NULL, NULL, 'باسم عرموش'),
(43, 'سامي شموط', 'فيصل', NULL, 'الجسر الأبيض- مقابل مدرسة بور سعيد ', 'تاجر', 'سوري', '944559968', '956675810', '113319183', ' ', '14', NULL, 0, 0, '2007-07-05', NULL, NULL, 'القرية الصغيرة '),
(44, 'فارس حفار', 'منار', NULL, 'الروضة شارع عطا الأيوبي', 'تاجر', 'سوري', '933287625', '932505101', '113313818', ' ', '14', NULL, 0, 0, '2008-01-24', NULL, NULL, 'إيلاف '),
(45, 'رامي الكسم', 'فراس', NULL, 'عفيف جادة الطنطاوي بناء طرحها ط3', 'طبيب أشعة', 'سوري', '933363024', '0', '113349324', ' ', '14', NULL, 0, 0, '2007-07-31', NULL, NULL, 'فجر السعاة'),
(46, 'وليد الكيال', 'رشاد', NULL, 'مهاجرين شطا جادة خامسة ', 'تاجر', 'سوري', '932961843', '0', '113718039', ' ', '14', 'كرة القدم', 0, 0, '2007-02-16', NULL, NULL, 'فجر السعادة'),
(47, 'أحمد الكرش', 'زياد ', NULL, 'الجسر الأبيض ساحة نوري باشا جانب الحلاق طارق', 'مدير معمل', 'سوري', '944390133', NULL, '113333625', ' ', '1', NULL, 0, 0, '2008-02-04', NULL, NULL, 'المعهد العربي'),
(48, 'بشر الغزي', 'مطيع', NULL, 'مهاجرين شورى ', 'مسافر', 'سوري', '92091056', '954124997', '113736242', ' ', '1', NULL, 0, 0, '2007-07-07', NULL, NULL, 'التطبيقات النموذجية '),
(49, 'سامي شخاشيرو', 'ماهر', NULL, 'جامع بدر', 'شيخ جامع', 'سوري', '943356356', NULL, '113326990', ' ', '1', NULL, 0, 0, '2007-11-11', NULL, NULL, 'دوحة الرحاب'),
(50, 'محمد قيس مكي', 'رائد', NULL, 'مزة أوتستراد خلف السفارة الكندية ', 'تاجر عقارات', 'سوري', '933263467', NULL, '116114614', ' ', '1', NULL, 0, 0, '2007-03-03', NULL, NULL, 'روضة الأحداث'),
(51, 'أمجد هارون ', 'محمد', NULL, 'عدنان المالكي ', 'تاجر دواليب', 'فلسطيني', '933330302', NULL, '0', ' ', '1', NULL, 0, 0, '2007-07-20', NULL, NULL, 'الوطنية '),
(52, 'وليد الصباغ', 'مهند', NULL, 'أبو رمانة ساحة المطاعم', 'تاجر', 'سوري', '2147483647', NULL, '113337680', ' ', '1', NULL, 0, 0, '2007-02-01', NULL, NULL, 'الوطنية '),
(53, 'عمر البحرة', 'أنس ', NULL, 'ضاحية قدسيا جانب كشك الجامعة', 'محاسب', 'سوري', '944442589', '957610700', '113451901', ' ', '1', NULL, 0, 0, '2007-05-15', NULL, NULL, 'المدرسة الفرنسية'),
(54, 'منصور حمور', 'مهيمن', NULL, 'مالكي- شارع زنوبيا', 'شركة الطيران السعودية ', 'سوري', '0', '0', '113737552', ' ', '14', NULL, 0, 0, '2006-02-08', NULL, NULL, 'المدرسة الفرنسية'),
(55, 'منذر محملجي', 'عبد الله ', NULL, 'ركن الدين- شارع اسد الدين', 'تاجر مواد بناء', 'سوري', '0', '0', '112716671', ' ', '14', NULL, 0, 0, '2007-11-24', NULL, NULL, 'الفارابي'),
(58, 'بسام القلاع', 'محمد', NULL, 'مزة اتوستراد - خلف بناء  MTN ', 'مدير أعمال', 'سوري', '0', NULL, '116611308', ' ', '11', NULL, 0, 0, '2008-06-20', NULL, NULL, 'فجر التفوق'),
(59, 'كريم الجبة', 'هيثم', NULL, 'مشروع دمر- أبنية التعمير', 'مهندس', 'سوري', '0', NULL, '113111223', ' ', '14', NULL, 0, 0, '2007-01-01', NULL, NULL, 'القرية الصغيرة'),
(60, 'رياض حباب', 'مازن', NULL, 'الروضة ', 'مدير فرع شركة ألبسة', 'سوري', '944585746', '0', '113337516', ' ', '14', NULL, 0, 0, '2007-04-21', NULL, NULL, 'التطبيقات النموذجية'),
(61, 'عمر الموصلي', 'محمد', NULL, 'مزة فيلات غربية مقابل قصر العدل', 'تاجر', 'سوري', '933485000', NULL, '116617847', ' ', '7', NULL, 0, 0, '2004-08-12', NULL, NULL, 'بدر الدين الحسني'),
(62, 'زيد درويش', 'نهاد', NULL, 'مهاجرين شطا جادة 2', 'تاجر نظارات', 'سوري', '933293388', '0', '113712698', ' ', '1', 'الاختراعات ', 0, 0, '2009-01-07', NULL, NULL, 'الإباء'),
(63, 'محمد هاني الكسم', 'أنس ', NULL, 'أبو رمانة خلف السفارة السعودية', 'مهندس', 'سوري', '933422018', NULL, '113318298', ' ', '1', 'كرة القدم', 0, 0, '2008-08-10', NULL, NULL, 'عمر ابن الخطاب'),
(64, 'مجد حلواني', 'نبيل', NULL, 'البرامكة', 'مترجم', 'سوري', '0', '0', '112131510', ' ', '14', NULL, 0, 0, '2006-01-01', NULL, NULL, 'البوادر'),
(65, 'حمزة ناصر', 'أحمد', NULL, 'مهاجرين جادة 3', 'تاجر', 'سوري', '0', '0', '113740257', ' ', '1', NULL, 0, 0, '2007-08-12', NULL, NULL, 'البوادر'),
(66, 'محمد علي الطباع', 'محمد صفوان', NULL, 'مهاجرين مصطبة جادة 4', 'طبيب أسنان', 'سوري', '947043372', '998374535', '113712281', ' ', '14', 'سباحة ', 0, 0, '2007-06-03', NULL, NULL, 'فجر السعادة'),
(67, 'وحيد الحفار', 'منار', NULL, 'روضة ', 'تاجر', 'سوري', '933287625', '0', '113313818', ' ', '14', NULL, 0, 0, '2008-01-24', NULL, NULL, 'إيلاف'),
(68, 'منير المرعي', 'هيثم', NULL, 'مالكي خلف مكتبة الأسد', 'صاحب مقهى', 'سوري', '999267072', NULL, '0', ' ', '14', 'كرة القدم - إنشاد', 0, 0, '2007-05-05', NULL, NULL, 'نصوح بابيل'),
(69, 'فارس الخن', 'بشار', NULL, 'كفرسوسة', 'مهندس', 'سوري', '944334452', '960630630', '2130707', ' ', '1', NULL, 0, 0, '2007-03-01', NULL, NULL, 'شويفات'),
(70, 'عبد الرحمن الكاتب', 'عرفان', NULL, 'مزة', 'مراسل بالبنك', 'سوري', '950504418', '957243206', '6662188', ' ', '13', NULL, 0, 0, '2005-05-27', NULL, NULL, 'الثقفي'),
(71, 'عمر الكاتب', 'عرفان', NULL, 'مزة', 'مراسل بنكي', 'سوري', '950504418', '957243206', '6662188', ' ', '13', NULL, 0, 0, '2005-05-26', NULL, NULL, 'ابو الرشد'),
(74, 'عمر الدبس', 'محمد أسامة', NULL, 'جاحظ- جانب مدرسة ساطع الحصري', 'مهندس مدني', 'سوري', '0', '0', '113334132', ' ', '14', NULL, 0, 0, '2007-09-16', NULL, NULL, 'دوحة المجد'),
(76, 'أحمد مكحل', 'رغيد', NULL, 'مشروع دمر- الجزيرة 10 ', 'تاجر', 'سوري', '0', '0', '0', ' ', '1', NULL, 0, 0, '2008-05-08', NULL, NULL, 'الشويفات'),
(77, 'اسماعيل المكحل', 'رغيد', NULL, 'مشروع دمر- جزيرة 10', 'تاجر', 'لبناني', '0', '0', '0', ' ', '7', NULL, 0, 0, '2005-06-17', NULL, NULL, 'الشويفات'),
(78, 'طارق الخن', 'بشار', NULL, 'تنظيم كفرسوسة', 'مهندس ميكانيك', 'سوري', '0', '0', '112130707', ' ', '13', NULL, 0, 0, '2005-02-11', NULL, NULL, 'الشويفات'),
(79, 'أمين أبو الشامات', 'طارق', NULL, 'مشروع دمر جزيرة  3', 'مدير', 'سوري', '944276644', '950506644', '113142145', ' ', '7', NULL, 0, 0, '2005-07-24', NULL, NULL, 'الشويفات'),
(80, 'عبد الكريم الحموي', 'سامر', NULL, 'مزة فيلات شرقية - جانب البرنس', 'تاجر', 'سوري', '0', '0', '116131293', ' ', '13', NULL, 0, 0, '2005-08-10', NULL, NULL, 'الشويفات'),
(81, 'أحمد غالاتي', 'أيمن', NULL, 'جاحظ مقابل ساطع الحصري', 'موبايلات', 'سوري', '0', '0', '113336387', ' ', '15', NULL, 0, 0, '2002-02-01', NULL, NULL, 'نور فاطر طريز'),
(82, 'نور الدين غالاتي', 'أيمن', NULL, 'جاحظ مقابل ساطع الحصري', 'موبايلات', 'سوري', '0', '0', '113336387', ' ', '8', NULL, 0, 0, '2009-02-14', NULL, NULL, 'نصوح بابيل'),
(83, 'نور الدين درويش', 'أيمن', NULL, 'البرامكة ', 'خياط', 'سوري', '966880222', '0', '112140629', ' ', '8', NULL, 0, 0, '2009-02-01', NULL, NULL, 'الأخوة'),
(84, 'علي دعدوش', 'محمد ماهر', NULL, 'مالكي خلف مكتبة الأسد', 'رجل أعمال', 'سوري', '0', '0', '113314524', ' ', '13', NULL, 0, 0, '2005-09-04', NULL, NULL, 'بدر الدين الحسني'),
(85, 'عبد الرحمن الصباغ', 'ماهر', NULL, 'الشيخ محي الدين', 'موظف شركة تكييف', 'سوري', '0', '949658624', '112771598', ' ', '14', NULL, 0, 0, '1969-12-31', NULL, NULL, 'التطبيقات المسلكية'),
(86, 'كريم عبيد', 'عامر', NULL, 'مواجه موكا', 'تاجر ألبسة', 'سوري', '0', '0', '0', ' ', '14', NULL, 0, 0, '2006-08-22', NULL, NULL, 'شويفات'),
(88, 'حكمت توتنجي', 'شادي', NULL, 'الروضة', 'تاجر', 'سوري', '950406705', '966054645', '113342011', ' ', '14', 'كرة القدم', 0, 0, '2006-02-12', NULL, NULL, 'الأخوة'),
(89, 'أمير موسى', 'صلاح', NULL, 'المالكي جادة البزم جانب مطعم الفاروق', 'تاجر', 'سوري', '944541782', '935150136', '113735689', ' ', '14', NULL, 0, 0, '2007-07-31', NULL, NULL, 'دوحة المجد'),
(90, 'معاذ الكجك', 'باسم', NULL, 'الجسر الابيض نوري باشا جانب مدرسة عصام حسن', 'تاجر', 'سوري', '933646416', '930745987', '113321010', ' ', '14', 'السباحة ', 0, 0, '2007-09-19', NULL, NULL, 'عصام حسن'),
(91, 'مالك غراوي', 'انس', NULL, 'الروضة مقابل المركز الطبي', 'تاجر', 'سوري', '943504674', NULL, '113326140', ' ', '14', 'كرة قدم -قراءة', 0, 0, '2007-01-01', NULL, NULL, 'عصام حسن'),
(92, 'إياد غراوي', 'انس', NULL, 'الروضة مقابل المركز الطبي', 'تاجر', 'سوري', '943504674', NULL, '113326140', ' ', '11', 'كرة قدم', 0, 0, '2009-07-19', NULL, NULL, 'عصام حسن'),
(93, 'عبد الرحمن الدغلي', 'احمد', NULL, 'ابو رمانة', 'مهندس كهرباء', 'سوري', '944414849', NULL, '113336481', ' ', '6', NULL, 0, 0, '2010-05-01', NULL, NULL, 'نصوح بابيل'),
(94, 'شريف المرعاوي', 'اياد', NULL, 'جانب السفارة البابوية', 'سفارة العراقية', 'عراقي', '949780178', '0', '0', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'الاخوة'),
(95, 'عبد الكريم شاشيط', 'احمد', NULL, 'ابو رمانة', 'موظف', 'سوري', '988506079', NULL, '3353630', ' ', '1', 'كرة قدم', 0, 0, '2018-05-03', NULL, NULL, 'نصوح بابيل'),
(96, 'كرم التاجر', 'عمر', NULL, 'مالكي', 'تاجر', 'سوري', '944270600', NULL, '3715976', ' ', '1', 'السباحة و كرة القدم و كرة السلة ', 0, 0, '2005-05-29', NULL, NULL, 'دوحة المجد'),
(97, 'معاذ الخطيب', 'سامر', NULL, 'المهاجرين شطة جادة اولى', 'محامي', 'سوري', '932498765', '954105231', '113718683', ' ', '13', NULL, 0, 0, '1969-12-31', NULL, NULL, 'بدر الدين الحسني'),
(98, 'عمر غبور', 'احمد', NULL, 'مهاجرين', 'فني كومبيوتر', 'سوري', '933778812', NULL, '113337313', ' ', '14', NULL, 0, 0, '2007-01-01', NULL, NULL, 'دوحة المجد'),
(99, 'كريم الشعار', 'محمد', NULL, 'برزة حاميش جادة الصالحية بناء ابو جرش', 'حلاق', 'سوري', '933329111', '0', '115142218', ' ', '6', NULL, 0, 0, '2011-01-01', NULL, NULL, 'التطبيقات النموذجية'),
(100, 'سامي الشعار', 'محمد', NULL, 'برزة حاميش جادة الصالحية بناء ابو جرش', 'حلاق', 'سوري', '933329111', '0', '115142218', ' ', '14', NULL, 0, 0, '2007-11-05', NULL, NULL, 'التطبيقات النموذجية'),
(101, 'يوسف الشربجي', 'احمد', NULL, 'المهاجرين جادة تالتة مصطبة', 'الكترونيات', 'سوري', '994117245', '992374339', '113737731', ' ', '4', NULL, 0, 0, '2004-02-05', NULL, NULL, 'بدر الدين الحسني'),
(102, 'غيث الصفدي', 'يسار', NULL, 'المهاجرين شطة', 'تجارة طبية', 'سوري', '933222062', '0', '113719484', ' ', '13', NULL, 0, 0, '2006-10-26', NULL, NULL, 'بدر الدين الحسني'),
(103, 'يزن قطان', 'احمد', NULL, 'ابو رمانة مواجه حديقة الجاحظ', 'مهندس', 'سوري', '944236609', '992116525', '113339444', ' ', '4', NULL, 0, 0, '2004-08-17', NULL, NULL, 'القرية الصغيرة'),
(104, 'حمزة الكسم', 'احمد', NULL, 'المالكي مواجه الثقفي', 'تاجر', 'سوري', '944406004', '994127757', '113717779', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'الشويفات'),
(105, 'سعيد البني', 'اياد', NULL, 'ابو رمانة ساحة المطاعم', 'تاجر مفروشات', 'سوري', '0', '0', '113313996', ' ', '7', NULL, 0, 0, '2005-06-29', NULL, NULL, 'المعهد العربي'),
(106, 'ابراهيم البني', 'اياد', NULL, 'ابو رمانة ساحة المطاعم', 'تاجر مفروشات', 'سوري', '0', '0', '113313996', ' ', '1', NULL, 0, 0, '2008-08-08', NULL, NULL, 'روضة الاحداث'),
(107, 'حمزة الحلاق-4', 'محمد انور', NULL, 'الطلياني مقابل وزارة التربية', 'مهندس', 'سوري', '944289982', '932692985', '113324417', ' ', '11', NULL, 0, 0, '2009-10-21', NULL, NULL, 'السورية الحديثة'),
(108, 'عبد الرحمن المهايني', 'خالد', NULL, 'المالكي بناء المهايني', 'مهندس', 'سوري', '933336338', '0', '113738562', ' ', '11', NULL, 0, 0, '2009-02-09', NULL, NULL, 'الفرنسية'),
(109, 'حسن حريري', 'صفوان', NULL, 'الروضة جانب المطبوعات المدرسية', 'مدير تنفيذي', 'سوري', '933333020', '938038484', '0', ' ', '1', NULL, 0, 0, '2007-01-01', NULL, NULL, 'دوحة المجد'),
(110, 'فاروق عياش', 'طلال', NULL, 'المهاجرين جانب المخاتر برنبو', 'مهندس', 'سوري', '955443441', '0', '113322038', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'عمر بن عبد العزيز'),
(111, 'كريم الكسم', 'باسل', NULL, 'ضاحية قدسيا برج الصالحية مقابل جامع الاحمد', 'تاجر', 'سوري', '933355307', '932118955', '113450132', ' ', '4', NULL, 0, 0, '2004-01-01', NULL, NULL, 'الدمشقية'),
(112, 'غيث الرفاعي', 'خالد', NULL, 'الروضة جادة الزهراوي', 'مهندس', 'سوري', '944726667', '0', '113334668', ' ', '8', NULL, 0, 0, '2001-10-18', NULL, NULL, 'دوحة المجد'),
(113, 'اسامة الرفاعي', 'خالد', NULL, 'الروضة جادة الزهراوي', 'مهندس', 'سوري', '944726667', '0', '113334668', ' ', '14', '0955726667', 0, 0, '2007-10-18', NULL, NULL, 'دوحة المجد'),
(114, 'بدر كلحو', 'طريف', NULL, 'الجسر الابيض', 'تاجر', 'سوري', '944457576', '0', '112776902', ' ', '4', NULL, 0, 0, '2004-11-23', NULL, NULL, 'القرية الصغيرة'),
(115, 'محمد معتصم افدار', 'حسام', NULL, 'الجاحظ مواجه اميرية الطيران', 'تجارة', 'سوري', '933431040', '0', '113324056', ' ', '1', NULL, 0, 0, '2008-09-20', NULL, NULL, 'عمر بن الخطاب'),
(116, 'صلاح شعبان', 'سامر', NULL, 'الجاحظ ناح السفارة السعودية', 'تاجر سيارات', 'سوري', '943353359', '938322533', '113353359', ' ', '15', NULL, 0, 0, '2004-01-14', NULL, NULL, 'الفرقان'),
(117, 'نبراس الرفاعي', 'بسام', NULL, 'السبكي جانب القطرنجي', 'مهندس كهربا', 'سوري', '962888035', '992168935', '0', ' ', '4', NULL, 0, 0, '2004-05-29', NULL, NULL, 'ابن خلدون'),
(118, 'بشير الغزي', 'مطيع', NULL, 'مهاجرين .شورى .جادة الوزيرة نجاح العطار', 'موظف طيران', 'سوري', '962091056', '0', '113736242', ' ', '14', 'كرة القدم - انشاد ', 0, 0, '2007-07-24', NULL, NULL, 'التطبيقات النموذجية'),
(119, 'رفيق الصفدي', 'توفيق', NULL, 'مهاجرين خورشيد تاني ', 'مهندس', 'سوري', '933371149', '0', '113735821', ' ', '7', NULL, 0, 0, '2005-10-08', NULL, NULL, 'بدر الدين الحسني'),
(120, 'انس عبدالعال', 'مصطفى ', NULL, 'ركن الدين مقابل حديقة شكو بناء سادات وحلو', 'متوفي', 'سوري', '933235298', '0', '112762317', ' ', '7', NULL, 0, 0, '2005-05-08', NULL, NULL, 'التألق النموذجية'),
(121, 'عدنان بقدونس', 'سامر', NULL, 'ركن الدين مقابل حديقة شكو', 'تاجر ادوات منزلية', 'سوري', '999874790', '0', '112778263', ' ', '7', 'سباحة كرة قدم كرة سلة', 0, 0, '2005-04-28', NULL, NULL, 'عبد القادر قويدر'),
(122, 'محمدانس بارودي', 'نذار', NULL, 'كفرسوسه', 'مهندس', 'سوري', '944688092', '0', '112155088', ' ', '14', 'السباحة', 0, 0, '2007-06-29', NULL, NULL, 'الفارابي'),
(123, 'كريم رمضان ', 'وسيم ', NULL, 'قرى الاسد ', 'تاجر ', 'سوري', '933508029', '0', '113919139', ' ', '11', NULL, 0, 0, '2009-02-04', NULL, NULL, 'مدرسة التألق النموذج'),
(124, 'عمر الشاش', 'عصام ', NULL, 'مهاجرين مصطبة جادة ثالثة ', 'مهندس ميكانيك', 'سوري', '933650550', '0', '113730478', ' ', '4', 'السباحة و كرة السلة ', 0, 0, '2004-04-01', NULL, NULL, 'بدر الدين الحسني'),
(125, 'زيد الشاش', 'عصام', NULL, 'مهاجرين مصطبة ', 'مكتب هندسي ', 'سوري', '933650550', '0', '113730471', ' ', '13', 'السباحة و كرة السلة ', 0, 0, '2006-10-30', NULL, NULL, 'فاطمة المخزومية '),
(126, 'يوسف سعده', 'نزار', NULL, 'مهاجرين جادة الوزيرة مصطبة ', 'محاسب', 'سوري', '944336808', '0', '0', ' ', '4', 'السباحة كرة القدم', 0, 0, '2004-02-10', NULL, NULL, 'عبد الفني النابلسي'),
(127, 'يزن سعده', 'نزار ', NULL, 'مهاجرين جادة الوزيرة مصطبة ', 'محاسب', 'سوري', '944336808', '0', '113735401', ' ', '13', 'السباحة كرة القدم', 0, 0, '2005-12-07', NULL, NULL, 'عبد الغني النابلسي'),
(128, 'يزن خضري', 'سمير', NULL, 'مهاجرين باشكاتب', 'مقاولات', 'سوري', '955910567', '113328705', '113328705', ' ', '4', 'الرسم', 0, 0, '2004-02-07', NULL, NULL, 'الثقفي'),
(129, 'يمان خضري', 'سمير', NULL, 'مهاجرين باشكاتب', 'مقاولات', 'سوري', '955910567', '0', '113328705', ' ', '8', 'الرسم ', 0, 0, '2011-08-13', NULL, NULL, 'دار النعيم'),
(130, 'عدنان سلطان', 'غسان', NULL, 'مهاجرين المرابط', 'تاجر', 'سوري', '955991779', '0', '113730501', ' ', '13', 'كرة القدم ', 0, 0, '2006-01-28', NULL, NULL, 'الفارابي'),
(131, 'معاذ شيخو', 'محمد', NULL, 'طلعة المسيات بناء عكيد', 'تاجر سيارات', 'سوري', '932485111', '0', '112756685', ' ', '4', 'كرة القدم', 0, 0, '2005-11-22', NULL, NULL, 'عمر ابن عبد العزيز'),
(132, 'نور سراقبي', 'سامر ', NULL, 'ساحة شمدين', 'كهربجي', 'سوري', '988357366', '0', '112742145', ' ', '15', 'كرة قدم', 0, 0, '2004-01-06', NULL, NULL, 'حسن الملا'),
(133, 'عمر العوا', 'عماد', NULL, 'مشروع دمر جزيرة ١٠', 'تاجر', 'سوري', '944575057', '0', '113120958', ' ', '14', 'سباحة، رسم، كرة سلة، كرة قدم', 0, 0, '2008-01-20', NULL, NULL, 'المرجان مشروع دمر'),
(134, 'أبي بكري', 'سمير', NULL, 'مشروع دمر / جزيرة٧/بناء٢٢', 'تاجر', 'سوري', '933666556', '0', '113116477', ' ', '7', 'التمثيل/ الإنشاد / الخطابة / ركوب الخيل/كرة از', 0, 0, '2005-10-30', NULL, NULL, 'بدر الدين الحسني'),
(135, 'زيد الدروبي', 'حسان', NULL, 'ركن الدين', 'طبيب', 'سوري', '955192505', '0', '115149681', ' ', '14', 'شارك في مسابقة الروبوتيك, كرة القدم', 0, 0, '2007-05-05', NULL, NULL, 'عمر بن عبد العزيز'),
(136, 'عيسى سهلي ', 'بشار', NULL, 'مزة شرقية شارع الفارابي عند حاجز رفعت', 'مهندس', 'سوري', '944611174', '0', '116131127', ' ', '14', 'قدم سلة', 0, 0, '2007-11-15', NULL, NULL, 'البشائر الوطنية'),
(137, 'كريم سهلي', 'بشار', NULL, 'مزة فيلات شرقية شارع الفارابي عند حاجز رفعت ', 'مهندس ', 'سوري', '933547417', '0', '116131127', ' ', '11', 'قدم سله ', 0, 0, '2009-04-29', NULL, NULL, 'البشائر الوطنية '),
(138, 'بشر حفار', 'وسيم', NULL, 'روضة جادة جورجي حداد ', 'مهندس', 'سوري', '944393948', '0', '113320070', ' ', '14', 'سباحة وسلة ورسم', 0, 0, '2007-09-22', NULL, NULL, 'المعهد العربي '),
(139, 'حمزه الحلاق-5', 'فراس', NULL, 'مهاجرين شطا', 'مدرس', 'سوري', '933336116', '0', '113732854', ' ', '1', 'تركيب الليغو', 0, 0, '2008-06-09', NULL, NULL, 'اليقظة الخاصة'),
(140, 'غيث الحلاق', 'فراس', NULL, 'مهاجرين شطا ', 'مدرس', 'سوري', '933336116', '0', '113732854', ' ', '9', 'كرة القدم', 0, 0, '2002-06-11', NULL, NULL, 'دار الحكمه'),
(141, 'احمد الباني', 'وائل', NULL, 'برامكه ملعب تشرين', 'تاجر', 'سوري', '994518948', '0', '11', ' ', '14', 'التمثيل', 0, 0, '2008-02-14', NULL, NULL, 'البوادر'),
(142, 'وسام شحادة آغا الرفاعي', 'غسان', NULL, 'مهاجرين شورى شارع أبراهيم هنانو', 'طبيب جراح', 'سوري', '944788433', '0', '113335629', ' ', '7', NULL, 0, 0, '2005-09-10', NULL, NULL, 'بدر الدين الحسني'),
(143, 'غسان نصري', 'حسان', NULL, 'مالكي عند وزارة الثقافة', 'محامي', 'سوري', '944527777', '0', '113328654', ' ', '13', 'كرة القدم', 0, 0, '2006-01-01', NULL, NULL, 'Monte Cottege '),
(144, 'حسن الدغلي', 'سمير', NULL, 'بجانب ساطع الحصري', 'تاجر', 'سوري ', '933899923', '0', '113314312', ' ', '1', '0', 0, 0, '2002-06-06', NULL, NULL, 'دوحة البلابل'),
(145, 'جود سعدة', 'نزار', NULL, 'المهاجرين ابن العميد بناء غيبة', '0', 'سوري', '944336808', '0', '113735401', ' ', '8', NULL, 0, 0, '2011-02-02', NULL, NULL, 'دوحة المجد '),
(146, 'محمد جوهر ', 'مختار ', NULL, 'ابو رمانة شارع المهدي بن بركة ', 'مهندس ', 'سوري', '966034075', '0', '113320916', ' ', '11', 'كرة القدم', 0, 0, '2009-01-01', NULL, NULL, 'نصوح بابيل'),
(147, 'علي مجاهد', 'انس', NULL, 'مهاجرين شمسية', 'موظف', 'سوري', '944000124', '0', '113731025', ' ', '6', NULL, 0, 0, '2010-01-01', NULL, NULL, 'فجر السعادة'),
(148, 'كرم العشا', 'ماهر ', NULL, 'مهاجرين شورى ', 'دكتور', 'سوري', '991034968', '0', '113322419', ' ', '11', 'رسم ', 0, 0, '2009-06-01', NULL, NULL, 'فاطمة المخزومية '),
(149, 'عبد الرحمن البرغلي', 'محمد', NULL, 'الروضة', 'مهندس كهربا', 'سوري', '932855295', '992334560', '113336180', ' ', '7', 'كرة القدم - سباحة', 0, 0, '2006-01-01', NULL, NULL, 'الأخوة'),
(150, 'وسيم الغزي ', 'مطيع ', NULL, 'مهاجرين جادة الثالثة ', 'مسافر', 'سوري', '0', '955771077', '113736242', ' ', '7', 'كرة سلة ', 0, 0, '2005-08-26', NULL, NULL, 'الفارابي'),
(151, 'عبد الرحمن الزين ', 'حسان ', NULL, 'برامكة جانب جامع الحلبوني ', 'برمجة حواسيب', 'سوري', '947792375', '998379674', '112241490', ' ', '7', 'سباحة ', 0, 0, '2005-11-09', NULL, NULL, 'عباد الرحمن الشرعية '),
(152, 'كنان سامي', 'حسام', NULL, 'مهاجرين', 'تاجر', 'سوري', '933541162', '933150845', '113732137', ' ', '7', 'كرة القدم - سباحة', 0, 0, '2005-02-26', NULL, NULL, 'المعهد العربي'),
(153, 'محمد بشر عصاصة ', 'عبد لله ', NULL, 'المهاجرين جادة تالتة ', 'تاجر ', 'سوري', '0', '957929334', '113732158', ' ', '7', 'سباحة ', 0, 0, '2005-12-01', NULL, NULL, 'بدر الدين الحسني'),
(154, 'خلدون كيالي', 'اياد', NULL, 'الروضة', 'نبيل نفيسة', 'فلسطيني', '957278411', '964367791', '113316339', ' ', '7', 'كرة القدم ', 0, 0, '2005-09-09', NULL, NULL, 'الأخوة'),
(155, 'محمد غياث الفياض', 'محمود ', NULL, 'المالكي جانب جامع بدر ', 'ناطور بناية ', 'سوري ', '940780819', '992753817', '0', ' ', '7', 'كرة القدم', 0, 0, '2005-05-27', NULL, NULL, 'محمد بن قاسم الثقفي '),
(156, 'محمد جعفر المجاهد', 'أنس', NULL, 'المهاجرين', 'محاسب', 'سوري', '988800022', '0', '113731025', ' ', '13', 'كرة القدم -', 0, 0, '2006-01-01', NULL, NULL, 'ابراهيم هنانو'),
(157, 'عبدالله التيناوي ', 'طارق ', NULL, 'المهاجرين', 'تاجر', 'سوري', '944344770', '0', '113349143', ' ', '13', 'ركوب الخيل ', 0, 0, '2006-06-06', NULL, NULL, 'الإباء العربي'),
(158, 'محمد نور الدين مهبالي', 'محمد حسن ', NULL, 'المهاجرين شوى', 'مهندس ', 'سوري ', '932200459', '0', '113335678', ' ', '13', 'سباحة ', 0, 0, '2006-06-01', NULL, NULL, 'الاخوة'),
(159, 'يمان طاهر', 'وسيم', NULL, 'المالكي', 'مدير مطعم', 'سوري', '944771030', '0', '113339593', ' ', '13', 'كرة القدم', 0, 0, '2007-01-01', NULL, NULL, 'المعهد العربي'),
(160, 'معاوية دقماق ', 'ياسر', NULL, 'المالكي جانب عدنان المالكي', 'تاجر ', 'سوري', '933425441', '959907420', '113336326', ' ', '14', 'سباحة ', 0, 0, '2007-06-21', NULL, NULL, 'التألق النموذجية'),
(161, 'عدنان غنمة', 'فايز', NULL, 'ابو رمانة', 'تاجر', 'سوري', '94430111', '967740795', '113337858', ' ', '13', 'كرة القدم', 0, 0, '2006-05-25', NULL, NULL, 'monta cottage'),
(162, 'عبد الرحمن غنمة ', 'مازن ', NULL, 'ابو رمانة جانب السفارة القطرية ', 'مهندس ', 'سوري ', '933430567', '0', '113330021', ' ', '13', 'كرة القدم', 0, 0, '2005-05-29', NULL, NULL, 'نصوح بابيل'),
(163, 'محمد عودة', 'صالح', NULL, 'الطلياني جانب جامع دك الباب ', 'تاجر', 'سوري', '999512908', '0', '114435025', ' ', '1', 'كرة القدم ', 0, 0, '2008-04-30', NULL, NULL, 'الطليعة'),
(164, 'طارق الخولي ', 'علاء ', NULL, 'مشروع دمر الجزيرة العاشرة خلف الاب تاون ', 'تاجر', 'سوري', '944211177', '968262784', '113134202', ' ', '13', 'كرة القدم', 0, 0, '2007-01-20', NULL, NULL, 'الشويفات'),
(165, 'حسن يازجي ', 'بشر  ', NULL, 'المالكي شارع عدنان المالكي ', 'وزير ', 'سوري ', '955424460', '991277674', '113741390', ' ', '13', 'سباحة ', 0, 0, '2006-09-21', NULL, NULL, 'الشويفات '),
(166, 'محمد كحالة', 'شفيق', NULL, 'مهاجرين', 'صيدلي', 'سوري', '944284477', '958355565', '113352257', ' ', '13', 'كرة القدم - روبوتك', 0, 0, '2006-06-25', NULL, NULL, 'الشويفات'),
(167, 'صهيب الحموي', 'ياسر ', NULL, 'المهاجرين', 'تاجر', 'سوري', '931499490', '0', '112755603', ' ', '14', 'كرة القدم ', 0, 0, '2007-01-01', NULL, NULL, 'سنا الشام'),
(168, 'جواد عبد الغني ', 'ناصر ', NULL, 'المزة مقابل حديقة الطلائع ', 'مدير معمل ', 'سوري', '933678334', '992214450', '116632480', ' ', '14', 'كرة القدم', 0, 0, '2007-06-15', NULL, NULL, 'الطوح '),
(169, 'رضا القوتلي ', 'عبد الحميد', NULL, 'مهاجرين', 'طبيب', 'سوري', '944712643', '940463437', '113712643', ' ', '7', 'تمثيل - كرة قدم', 0, 0, '2005-04-07', NULL, NULL, 'الشويفات'),
(170, 'احمد مردم بيك ', 'باسم ', NULL, 'مالكي جانب جامع بدر', 'صيدلي', 'سوري', '0', '942243392', '113353953', ' ', '7', 'كرة القدم ', 0, 0, '2005-08-10', NULL, NULL, 'الثقفي'),
(171, 'يحيى الحبال ', 'محمد طريف ', NULL, 'مالكي ', 'مهندس مدني', 'سوري', '999231251', '0', '113732175', ' ', '15', 'كرة قدم - تمثيل', 0, 0, '2003-08-08', NULL, NULL, 'المونتيسوري'),
(172, 'عبادة حفار ', 'حسان ', NULL, 'ابو رمانة جانب السفارة الباباوية ', 'محامي ', 'سوري', '934028792', '953468753', '113331545', ' ', '7', '0', 0, 0, '2005-11-05', NULL, NULL, 'ثانوية الاخوة الخاصة'),
(173, 'عبد العزيز المرعشلي', 'عمر', NULL, 'المهاجرين جادة 5 ', 'مهندس زراعي', 'سوري', '988161275', '992500649', '113711313', ' ', '26', 'كرة قدم', 0, 0, '2002-08-17', NULL, NULL, 'بورسعيد'),
(174, 'عبد لله طرابيشي', 'محمد وضاح ', NULL, 'مهاجرين جادة الاولى ', 'صيدلي ', 'سوري', '934061318', '941926061', '113719131', ' ', '1', 'كرة القدم ', 0, 0, '2008-03-19', NULL, NULL, 'البوادر'),
(175, 'عدنان الساعور', 'طارق', NULL, 'مزة غربية  جنب برج تالة', 'رجل اعمال', 'سوري', '935761199', '0', '116111557', ' ', '13', NULL, 0, 0, '2006-08-19', NULL, NULL, 'الشويفات'),
(176, 'محمد أيمن المهباني', 'محمد حسن ', NULL, 'المالكي ', 'مهندس', 'سوري', '938247187', '0', '113335678', ' ', '1', 'الرسم ', 0, 0, '2008-03-05', NULL, NULL, 'عصام حسن'),
(177, 'احمد الموصللي', 'عبد الناصر', NULL, 'حلبوني جانب صيدلية الشعلان', 'مدير مبيعات', 'سوري', '996946326', '0', '112241490', ' ', '13', NULL, 0, 0, '2006-11-01', NULL, NULL, 'ابراهيم هنانو'),
(178, 'ياسين بيرقدار ', 'حسام ', NULL, 'مهاجرين جادة خامسة ونص بناء برنبو', 'مدير بنك ', 'سوري ', '944548144', '958497830', '113717878', ' ', '1', 'كرة القدم ', 0, 0, '2009-01-01', NULL, NULL, 'فجر السعادة'),
(179, 'عبد الرحمن تيناوي ', 'طارق ', NULL, 'مهاجرين شورى ', 'تاجر ', 'سوري', '944344770', '0', '113349143', ' ', '1', 'سباحة ', 0, 0, '2008-06-06', NULL, NULL, 'الاباء العربي '),
(180, 'وضاح بهاء الدين ', 'احسان ', NULL, 'طلياني مواجه المدرسة الايطالية ', 'محل موبايلات ', 'سوري', '933548888', '0', '114476061', ' ', '11', 'كرة سلة ', 0, 0, '2009-04-30', NULL, NULL, 'عمر بن عبد العزيز '),
(181, 'زيد نصري ', 'محمد ', NULL, 'المالكي', 'تاجر', 'سوري', '944946633', '952525785', '113341338', ' ', '14', '0', 0, 0, '2007-08-08', NULL, NULL, 'الشويفات'),
(182, 'انس القلاع ', 'احمد ', NULL, 'روضة شارع نوري باشا ', 'موظف بشركة طيران ', 'سوري ', '933227680', '968124572', '113330383', ' ', '14', 'سباحة ', 0, 0, '2007-08-07', NULL, NULL, 'التطبيقات النموذجية '),
(183, 'عبد الرحمن دالاتي ', 'يوسف ', NULL, 'مهاجرين جادة اولى باشكاتب ', 'مدير بشركة هندسة طبية ', 'سوري ', '95554499', '936225562', '113719632', ' ', '14', 'كرة القدم ', 0, 0, '2007-10-24', NULL, NULL, 'عمر بن عبد العزيز '),
(185, 'علي مثقال ', 'غسان ', NULL, 'مهاجرين جادة ثانية', 'بقالية', 'سوري', '0', '937736149', '113342046', ' ', '4', 'ركة قدم', 0, 0, '2004-05-05', NULL, NULL, 'الأخوة '),
(186, 'اسامة كريم ', 'ياسر', NULL, 'ميدان منصور ', 'مدير مصنع الكترونيات ', 'سوري ', '940090009', '940090008', '118823453', ' ', '14', 'كرة القدم ', 0, 0, '2007-03-01', NULL, NULL, 'الباكستانية '),
(187, 'عادل فليون ', 'سامر', NULL, 'مهاجرين جادة 3 ', 'تاجر منظفات', 'سوري', '933448870', '951543166', '113343852', ' ', '4', 'كرة قدم ', 0, 0, '2005-01-09', NULL, NULL, 'عمر بن عبدالعزيز'),
(188, 'كريم حبال', 'محمد طريف	', NULL, 'المالكي شارع قرطبة', 'مهندس مدني	', 'سوري', '999231251', '0', '113732175', ' ', '14', 'كرة القدم', 0, 0, '2001-10-20', NULL, NULL, 'مونتيسوري'),
(189, 'عامر الكجك', 'رضوان', NULL, 'روضة نوري باشا', 'شوفير', 'سوري', '988143767', '947602656', '113321010', ' ', '4', 'كرة القدم', 0, 0, '2004-05-05', NULL, NULL, 'ام البنين'),
(190, 'محمد عبادة الموصللي', 'عبد الناصر', NULL, 'حلبوني ', 'مدير مبيعات	', 'سوري', '996946326', NULL, '11', ' ', '4', 'كومبيوتر ', 0, 0, '2004-07-09', NULL, NULL, 'بدر الدين الحسني'),
(191, 'رغيد حافظ', 'محمد سعدالدين', NULL, 'ابو رمانة نورا ', 'متقاعد', 'سوري', '935944806', '936753008', '113330121', ' ', '4', 'سباحة', 0, 0, '2004-08-08', NULL, NULL, 'ثانوية الغد الشرعية'),
(192, 'محمد يامن باكير ', 'ملهم ', NULL, 'مالكي جانب حديقة الجاحظ ', 'تاجر', 'سوري ', '933335017', NULL, '113335017', ' ', '14', 'سباحة ', 0, 0, '2007-01-01', NULL, NULL, 'دار السلام '),
(193, 'عامر مرزوق', 'حسين', NULL, 'الجاحظ جامع بدر', 'امام مسجد', 'سوري', '932585711', '962804023', '0', ' ', '15', NULL, 0, 0, '2004-01-01', NULL, NULL, 'الثقفي'),
(194, 'قتيبة عواظة', 'محمود', NULL, 'المهاجرين', 'مدرس', 'سوري', '933839360', '0', '0', ' ', '3', NULL, 0, 0, '2012-01-01', NULL, NULL, 'حديقة الاهلية'),
(195, 'محمد شفيق الفرا ', 'فايز', NULL, 'مزة فيلات غربية ', 'مدير شركة', 'سوري', '933768395', '934758040', '0', ' ', '17', 'كرة القدم - ', 0, 0, '2001-06-14', NULL, NULL, 'بناة الأجيال'),
(196, 'محم ابراهيم كوكة', 'محفوظ', NULL, 'الطلياني', 'تاجر', 'سوري', '957378769', '988365668', '114430258', ' ', '17', 'كرة القدم ', 0, 0, '2001-02-01', NULL, NULL, 'السعادة'),
(197, 'يمان الدالاتي', 'يوسف ', NULL, 'مهاجرين', 'مدير ', 'سوري', '955544499', '0', '113719632', ' ', '8', '0', 0, 0, '2012-10-14', NULL, NULL, 'عمر بن عبدالعزيز'),
(199, 'همام مبارك ', 'فؤاد ', NULL, 'مهاجرين ', 'تاجر', 'سوري', '0', '0', '113714409', ' ', '6', '0', 0, 0, '2011-02-02', NULL, NULL, 'دوحة مجد '),
(200, 'رياض مبارك ', 'فؤاد ', NULL, 'مهاجرين', 'تاجر', 'سوري', '938537409', '0', '113714409', ' ', '11', '0', 0, 0, '2010-02-02', NULL, NULL, 'دوحة المجد '),
(201, 'عمر الكردي ', 'عمار ', NULL, 'روضة شارع عطا الايوبي ', 'مدير مبيعات اعمار سوريا ', 'لبناني ', '933355996', '950502000', '113326110', ' ', '4', 'سباحة ', 0, 0, '2004-06-07', NULL, NULL, 'النابلسي '),
(202, 'بشر فليون', 'محمد سامر ', NULL, 'مهاجرين', 'مدير', 'سوري', '933448870', '991996998', '11337518', ' ', '14', 'كرة القدم', 0, 0, '2007-10-04', NULL, NULL, 'عمر بن عبدالعزيز'),
(203, 'حمزة الكردي ', 'عمار ', NULL, 'روضة شارع عطا الايوبي ', 'مدير مبيعات اعمار سوريا ', 'لبناني ', '933355996', '991606060', '113326110', ' ', '14', 'كرة القدم', 0, 0, '2007-09-09', NULL, NULL, 'المعهد العربي '),
(204, 'محمد شبيب', 'فواز', NULL, 'مالكي', 'دكتور ', 'سوري', '969865802', '0', '0', ' ', '33', '0', 0, 0, '2010-01-01', NULL, NULL, 'رابع'),
(205, 'كريم نصري ', 'محمد ', NULL, 'ابو رمانة جانب حديقة الجاحظ ', 'تاجر ', 'سوري ', '944946633', '0', '113341838', ' ', '11', 'ركوب الخيل ', 0, 0, '2010-01-01', NULL, NULL, 'مونتي سوري '),
(206, 'حمزة الحلاق ', 'محمد فراس ', NULL, 'مهاجرين شطا جادة 2 ', 'مدرس ', 'سوري ', '933336116', '0', '113732854', ' ', '1', 'كرة القدم ', 0, 0, '2008-09-06', NULL, NULL, 'اليقظة '),
(207, 'محمد ياسين الناعمة', 'احمد', NULL, 'المهاجرين جادة الوزيرة مرابط', 'مصمم', 'سوري', '944668661', '0', '113736743', ' ', '1', NULL, 0, 0, '2008-08-22', NULL, NULL, 'دوحة المجد'),
(208, 'محمد أبي دوه جي', 'مازن', NULL, 'المهاجرين', 'إمام', 'سوري', '944305465', '0', '113713701', ' ', '11', '0', 0, 0, '2009-05-02', NULL, NULL, 'فجر السعادة'),
(209, 'براء قبطان ', 'زاهر ', NULL, 'مهاجرين جادة خامسة ', 'تاجر ', 'سوري', '944094390', '957443794', '113717614', ' ', '1', 'كرة القدم', 0, 0, '2008-01-01', NULL, NULL, 'فجر السعادة'),
(210, 'موفق أومري', 'محمد فتحي', NULL, 'مهاجرين جادات سلمية', 'مهندس الكترون', 'سوري', '938348234', '0', '113740969', ' ', '7', NULL, 0, 0, '2005-02-20', NULL, NULL, 'الثقفي'),
(211, 'عمر الحجار', 'بهجت', NULL, 'مالكي ', 'تاجر البسة ', 'سوري', '947677081', '0', '113712961', ' ', '14', 'كرة القثدم ', 0, 0, '2007-06-10', NULL, NULL, 'تركيا'),
(212, 'أحمد رمزي ', 'سامر', NULL, 'الزاهرة', 'فنني مخبري', 'سوري', '944474906', '937538239', '0', ' ', '15', 'كرة السلة', 0, 0, '2004-01-20', NULL, NULL, 'الاندلس'),
(213, 'براء الدوجي', 'محمد مازن', NULL, 'شمسية', 'مهندس', 'سوري', '944305465', '937034274', '113713701', ' ', '15', NULL, 0, 0, '2003-02-20', NULL, NULL, 'شريعة'),
(214, 'عدنان السمان ', 'محمد', NULL, 'شعلان', 'مدير شركة', 'سوري', '988802820', '981386840', '113333767', ' ', '4', 'كرة السلة', 0, 0, '2003-09-27', NULL, NULL, '0'),
(215, 'أحمد الصادق ', 'ياسين', NULL, 'الجسر الابيض', 'تاجر غذائيات', 'سوري', '932666751', '0', '113333625', ' ', '13', 'كرة القدم', 0, 0, '2007-02-02', NULL, NULL, 'المعهد العربي'),
(216, 'يزن الحافي', 'عمر', NULL, 'ميدان', 'مدير', 'سوري', '933264254', '0', '0', ' ', '13', 'كرة القدم', 0, 0, '2006-02-21', NULL, NULL, 'مونتي كوليج'),
(217, 'ابراهيم السمان', 'محمد', NULL, 'العشلان', 'مدير ', 'سوري', '0', '0', '11333767', ' ', '14', '0', 0, 0, '2007-01-01', NULL, NULL, '0'),
(218, 'مدثر الحرش', 'سلمة', NULL, 'الميدان', 'تاجر', 'سوري', '933443553', '0', '118886999', ' ', '14', '0', 0, 0, '2007-02-02', NULL, NULL, 'افاق المعرفة'),
(219, 'احمد سلطان', 'فؤاد', NULL, 'قصور', 'تاجر', 'سوري', '944218007', '959218007', '114460353', ' ', '4', 'سباحة', 0, 0, '2004-07-14', NULL, NULL, 'الفرنسية'),
(220, 'ليث الحرش', 'سلمة', NULL, 'ميدان', 'تاجر', 'سوري', '933443553', '941111156', '118886999', ' ', '7', 'كرة القدم', 0, 0, '2005-05-05', NULL, NULL, 'افاق المعرفة'),
(221, 'فارس دعدوش', 'مهند ', NULL, 'المالكي', 'مهندس', 'سوري', '933224445', '969990901', '113731654', ' ', '4', 'سباحة', 0, 0, '2004-03-12', NULL, NULL, 'الفرنسية'),
(222, 'عمر دعدوش', 'مهند', NULL, 'المالكي', 'مهندس', 'سوري', '933224445', '0', '113731654', ' ', '13', 'سباحة', 0, 0, '2006-03-11', NULL, NULL, 'الفرنسية'),
(223, 'علاء القضماني ', 'عمار', NULL, 'ابو رمانة', 'محاسب', 'سوري', '932830080', '934437594', '113326399', ' ', '15', NULL, 0, 0, '2002-11-11', NULL, NULL, 'الاندلس'),
(224, 'عمر اليافي', 'ماهر', NULL, 'مهاجرين', 'مهندس', 'سوري', '932535757', '0', '113736104', ' ', '15', 'كرة القدم', 0, 0, '2003-02-02', NULL, NULL, 'خولة الكندية'),
(225, 'محمد بهاء الدين', 'احسان', NULL, 'طلياني', 'تاجر', 'سوري', '933586656', '0', '114476061', ' ', '8', '0', 0, 0, '2011-02-02', NULL, NULL, 'عمر بن عبد العزيز'),
(226, 'عبد الباسط المحمد ', 'محمد جمعة', NULL, '0', '0', 'سوري', '0', NULL, '0', ' ', '1', NULL, 0, 0, '2008-02-02', NULL, NULL, 'ضاحية قدسيا'),
(227, 'بشير اليافي', 'مهند', NULL, 'مهاجرين جادة سادسة موقف اليافي', 'إكساء', 'سوري', '944778554', '956560985', '113717469', ' ', '1', 'كرة القدم', 0, 0, '2008-05-02', NULL, NULL, 'محمد نجيب حليمة'),
(228, 'بدر الدين النشواتي', 'عبد الوهاب', NULL, 'مالكي ابراهيم هنانو', '0', 'سوري', '933766533', '0', '113315727', ' ', '11', '0', 0, 0, '2009-05-05', NULL, NULL, '0'),
(229, 'مروان ركابي ', 'رفيق', NULL, 'ابو رمانة', '0', 'سوري', '967744133', '0', '113334206', ' ', '11', '0', 0, 0, '2010-01-01', NULL, NULL, 'رابع'),
(230, 'يامن تكريتي', 'مصطفى', NULL, 'شارع الطلياني', 'نجار', 'سوري', '949230368', NULL, '113348164', ' ', '1', ' السباحة و كرة القدم', 0, 0, '2008-06-03', NULL, NULL, 'معهد العربي'),
(231, 'يزن تكريتي', 'مصطفى ', NULL, 'طلياني', 'نجار', 'سوري', '994230368', NULL, '113348164', ' ', '8', NULL, 0, 0, '2011-06-02', NULL, NULL, 'عش البلابل'),
(232, 'محمد خير  صنوفي', 'محمد زاهر', NULL, 'فحامة', 'مدير مدرسة', 'سوري', '940948736', '969023225', '112254436', ' ', '13', 'انشاد', 0, 0, '2006-06-25', NULL, NULL, 'دوحة الحرية'),
(233, 'حمزة طعمة', 'ابراهيم', NULL, 'د', 'ناطور', 'سوري', '0', NULL, '0', ' ', '7', '  سباحةة وكرة القدم', 0, 0, '2003-06-25', NULL, NULL, 'محمدبن القاسم الثثقف'),
(234, 'كريم بيرقدار', 'محمود', NULL, 'جسر الابيض', 'مدير مدرسة', 'سوري', '955712343', '0', '113326300', ' ', '6', 'كرة القدم و السباحة', 0, 0, '2011-06-23', NULL, NULL, 'فارابي'),
(235, 'ماهر بيرقدار', 'محمود', NULL, 'جسر ابيض', 'مدير مدرسة', 'سوري', '955712343', '962342810', '113326300', ' ', '11', 'كرة القدم', 0, 0, '2009-06-03', NULL, NULL, 'فارابي'),
(236, 'يمان حبال', 'محمد', NULL, 'ابو رمانة جانب مروش', 'تاجر', 'سوري', '944409516', '957204632', '113330638', ' ', '7', '  كرة القدم و السباحة', 0, 0, '2006-06-11', NULL, NULL, 'معهد العربي'),
(237, 'رفيق القدسي', 'فراس', NULL, 'طلياني', 'طباعة', 'سوري', '933222456', '0', '114473477', ' ', '7', 'كرة سلة و روبوتيك و سباحة', 0, 0, '2005-02-16', NULL, NULL, 'عمر بن عبد العزيز'),
(238, 'محمد باكير', 'احمد', NULL, 'الشعلان جانب دار السلام', 'محلل', 'سوري', '988249729', NULL, '113345636', ' ', '14', 'كرة القدم و السباحة', 0, 0, '2008-06-04', NULL, NULL, 'دار السلام'),
(239, 'محمد بشر شقلي', 'محمد هشام', NULL, 'ابو رمانة', 'تجارة', 'سوري', '955224543', '0', '113337967', ' ', '14', 'كرة القدم', 0, 0, '2007-06-19', NULL, NULL, 'نصوح بابيل'),
(240, 'ليث الكسم', 'سعيد', NULL, 'روضة', 'تجارة', 'سوري', '952444042', '943339927', '113332334', ' ', '13', 'كرة القدم', 0, 0, '2006-03-18', NULL, NULL, 'ايلاف'),
(241, 'تيم الكسم', 'سعيد', NULL, 'ابو رمانة', 'تجارة', 'سوري', '9', '950051060', '113332334', ' ', '14', NULL, 0, 0, '2007-12-11', NULL, NULL, 'ايلاف'),
(242, 'انور خير الله', 'وسيم', NULL, 'روضة', 'تجارة', 'سوري', '944322553', '0', '113322562', ' ', '14', NULL, 0, 0, '2007-12-11', NULL, NULL, 'ايلاف'),
(243, 'محمد الغفير', 'ماهر', NULL, 'روضة', 'مخلص دمركي', 'سوري', '944509908', '940760090', '113345559', ' ', '26', NULL, 0, 0, '2002-06-18', NULL, NULL, 'دمشق العربية'),
(244, 'بشير غفير', 'ماهر', NULL, 'روضة', 'مخلص جمركي', 'سوري', '944509908', '938400195', '113345559', ' ', '15', NULL, 0, 0, '2003-06-25', NULL, NULL, 'دمشق العربية'),
(245, 'محمد الفاتح شخاشيرو', 'ماهر شخاشيرو', NULL, 'جامع بدر', 'امام المسجد', 'سوري', '943356356', '0', '0', ' ', '2', NULL, 0, 0, '2013-01-01', NULL, NULL, 'دار النعيم'),
(246, 'سامي العقاد', 'مجد', NULL, 'مهاجرين', 'مهندس', 'سوري ', '944442523', '0', '113719624', ' ', '13', 'كرة قدم', 0, 0, '2006-05-05', NULL, NULL, 'نابلسي'),
(247, 'حمزة قيسر', 'اسامة', NULL, 'مشروع دمر', 'مدير', 'سوري', '933134444', '0', '113136500', ' ', '14', 'كرة القدم', 0, 0, '2007-01-01', NULL, NULL, 'الوطنية'),
(248, 'غيث قيسر', 'اسامة', NULL, 'مشروع دمر', 'مدير', 'سوري', '933134444', '991177706', '113136500', ' ', '4', 'كرة القدم', 0, 0, '2003-01-01', NULL, NULL, 'رواد المجد'),
(249, 'هشام الساطي', 'هاني', NULL, 'المالكي', 'مهندس', 'سوري', '933222469', '0', '113323530', ' ', '13', 'كرة القدم', 0, 0, '2005-10-15', NULL, NULL, 'الشويفات'),
(250, 'عبدالله المرعشلي', 'عمر', NULL, 'مهاجرين', 'تاجر', 'سوري', '966944157', '0', '113711313', ' ', '4', 'كرة القدم', 0, 0, '2004-01-01', NULL, NULL, 'خولة الكندي'),
(251, 'زيد دهنة', 'عمار ', NULL, 'مزة', 'مدير تنفذ', 'سوري', '955310046', '949968948', '116669834', ' ', '15', NULL, 0, 0, '2003-01-01', NULL, NULL, 'بناة الاجيال '),
(252, 'عمر شاهين', 'محمد خير', NULL, 'مشروع دمر', 'مهندس', 'سوري', '932333024', '0', '113117434', ' ', '1', 'كرة قدم ', 0, 0, '2008-01-01', NULL, NULL, 'رواد الكجد'),
(253, 'جودي معمة', 'موفق', NULL, 'ابو رمانة', 'مدير', 'سوري', '955951674', '0', '113343336', ' ', '15', 'كرة القدم', 0, 0, '2003-01-01', NULL, NULL, 'دمشق العربية '),
(254, 'علي شاهين', 'محمد خير', NULL, 'مشروع دمر', 'مهنددس', 'سوري', '932333024', '0', '113117434', ' ', '6', 'سباحة', 0, 0, '2011-01-01', NULL, NULL, 'رواد المجد'),
(255, 'كريم معتاد', 'وسيم ', NULL, 'ساحة الميسات', 'تجارة', 'سوري', '955301010', '0', '114446017', ' ', '8', NULL, 0, 0, '2011-06-27', NULL, NULL, 'عمر بن عبد العزيز'),
(256, 'عمر المهدي', 'خالد', NULL, 'شارع العابد', 'مهندس', 'سوري', '956466551', '0', '114417402', ' ', '3', NULL, 0, 0, '2012-06-28', NULL, NULL, 'دوحة المجد'),
(257, 'ابراهيم سمان', 'محمد', NULL, 'ركن الدين', 'مهندس', 'سوري', '0', '0', '0', ' ', '14', NULL, 0, 0, '2007-06-12', NULL, NULL, '0'),
(258, 'حسن صباغ', 'محمد', NULL, 'مالكي', 'مهندس', 'سوري', '944235566', NULL, '0', ' ', '13', NULL, 0, 0, '2018-07-30', NULL, NULL, '.'),
(259, 'احمد فياض الله', 'محمد', NULL, 'مالكي', 'ناطور', 'سوري', '997818570', '0', '0', ' ', '14', NULL, 0, 0, '2005-07-27', NULL, NULL, 'محمد بيروتي'),
(260, 'جودت شيخ نعمة', 'موفق', NULL, 'ابو رمانة', 'مدير معمل', 'سوري', '955951674', '969022764', '113343336', ' ', '1', NULL, 0, 0, '2008-07-31', NULL, NULL, 'نصوح بابيل'),
(261, 'توفيق بقاعي', 'نبيل', NULL, 'مشروع دمر', 'صيدلي', 'سوري', '933208136', '958228325', '113114178', ' ', '13', NULL, 0, 0, '2006-07-27', NULL, NULL, 'رواد المجد'),
(262, 'رياض شويكي', 'فراس', NULL, 'مشروع دمر', 'تجارة', 'سوري', '933433905', '940449596', '113167775', ' ', '7', NULL, 0, 0, '2005-07-31', NULL, NULL, 'رواد المجد'),
(263, 'احمد مهدي', 'خالد', NULL, 'شارع عابد', 'تجارة', 'سوري', '0', NULL, '0', ' ', '1', NULL, 0, 0, '2008-07-21', NULL, NULL, 'دوحة المجد'),
(264, 'سامي نصري', 'وسيم', NULL, 'مالكي', 'مهندس', 'سوري', '947361337', '0', '113335916', ' ', '1', NULL, 0, 0, '2008-07-26', NULL, NULL, 'بدر الدين الحسني'),
(265, 'كريم بازرباشي', 'خلدون', NULL, 'الجسر الابيض نوري باشا', 'تاجر', 'سوري', '933317299', '937573647', '113317299', ' ', '7', NULL, 0, 0, '2005-01-01', NULL, NULL, 'رواد المجد'),
(266, 'عمر الشوا', 'محمود', NULL, 'المزة فيلات متصلة', 'تاجر', 'سوري', '949352257', '945100591', '116628809', ' ', '15', NULL, 0, 0, '2003-07-01', NULL, NULL, 'المتفوقين'),
(267, 'نذير دنان', 'محمد', NULL, 'مهاجرين', '0', 'سوري', '933427216', '0', '0', ' ', '4', NULL, 0, 0, '2008-01-01', NULL, NULL, '0'),
(268, 'كريم هرشو', 'محمد', NULL, 'مالكي', '0', 'سوري', '953999220', '0', '113320047', ' ', '4', '0', 0, 0, '2008-01-01', NULL, NULL, '0'),
(269, 'احمد سليمان', 'محمود', NULL, 'المهاجرين شارع عاطف', 'مهندس مدني', 'سوري', '993994909', '993851851', '113713261', ' ', '13', NULL, 0, 0, '2006-12-06', NULL, NULL, 'عمر بن عبد العزيز'),
(270, 'ماهر وهبة', '-', NULL, 'ساحة الروضة', '-', 'سوري', '944211383', '933944743', '0', ' ', '4', NULL, 0, 0, '2003-09-15', NULL, NULL, '-'),
(271, 'مجد سلو', 'سامر', NULL, 'مهاجرين', 'تاجر', 'سوري', '933353990', '0', '113713141', ' ', '14', NULL, 0, 0, '2007-07-31', NULL, NULL, 'نصوح بابيل'),
(272, 'عبد الرحمن عسة', 'هادي', NULL, 'روضة', 'تجارة', 'سوري', '933309330', '0', '113325330', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'معهد العربي'),
(273, 'بشار عسة', 'هادي', NULL, 'روضة', 'تاجر', 'سوري', '933309330', '0', '113325330', ' ', '1', NULL, 0, 0, '2007-07-18', NULL, NULL, 'طموح'),
(274, ' 2كريم هرشو', 'زكريا', NULL, 'روضة', 'تاجر', 'سوري', '953999220', '0', '113320047', ' ', '1', NULL, 0, 0, '2008-01-01', NULL, NULL, 'عقبة بن نافع'),
(275, 'احمد الشاش', 'سمير', NULL, 'مهاجرين', 'تاجر', 'سوري', '949365482', '0', '113732898', ' ', '15', NULL, 0, 0, '2003-07-10', NULL, NULL, 'معهد العربي'),
(276, 'مهند سلو', 'سامر', NULL, 'مهاجرين', 'تاجر', 'سوري', '933097829', '968241304', '3713141', ' ', '15', NULL, 0, 0, '2003-05-06', NULL, NULL, '-'),
(277, 'عبد القادر القباني', 'مبين', NULL, 'مالكي بناء القباني', 'مدير', 'سوري', '966618580', '934174567', '113734894', ' ', '7', NULL, 0, 0, '2006-01-01', NULL, NULL, 'القرية الصغيرة'),
(278, 'عبد الحكيم الصيرفي', 'عبد اللطيف', NULL, 'الجبة', 'تاجر', 'سوري', '952702937', '936410060', '113335501', ' ', '7', NULL, 0, 0, '2005-01-01', NULL, NULL, 'عمر بن عبد العزيز'),
(279, 'عمر الجركس', 'فراس', NULL, 'كفرسوسة', 'محامي', 'سوري', '933293333', '938313717', '112137555', ' ', '13', NULL, 0, 0, '2007-01-06', NULL, NULL, 'الوطنية'),
(280, 'احمد باكير', 'عبد الرزاق', NULL, 'الطلياني', 'محاسب', 'سوري', '0', '0', '113320414', ' ', '11', NULL, 0, 0, '2009-07-01', NULL, NULL, 'التطبيقات المسلكية'),
(281, 'محمد حبال', 'وليد', NULL, 'ابو رمانة', 'تاجر', 'سوري', '966039906', '938061133', '113333878', ' ', '7', NULL, 0, 0, '2005-07-14', NULL, NULL, 'القرية الصغيرة'),
(282, 'نزار صناديقي', 'طارق', NULL, 'مهاجرين', 'تاجر', 'سوري', '944231002', '944731002', '113714050', ' ', '7', NULL, 0, 0, '2005-07-16', NULL, NULL, 'رواد المجد'),
(283, 'عمر الطواشي', 'توفيق', NULL, 'ركن الدين', 'مهندس', 'سوري', '993997444', '933278932', '112743612', ' ', '15', NULL, 0, 0, '2003-01-21', NULL, NULL, 'سورية الحديثة'),
(284, 'محمد دردري', 'احمد دردلي', NULL, 'روضة', 'مهندس', 'سوري', '988952338', '981576350', '113316110', ' ', '13', 'ركة قدم', 0, 0, '2006-08-01', NULL, NULL, 'دبي'),
(285, 'عمر قشلان', 'شادي', NULL, 'مالكي', 'مهندس', 'سوري', '957875311', '0', '113732168', ' ', '1', 'كرة قدم - روبوتيك', 0, 0, '2008-05-05', NULL, NULL, 'المانيا'),
(286, 'عبد الفتاح الصواف', 'ايمن', NULL, 'ابو رمانة', 'مدير', 'سوري', '944292728', '969188479', '113391060', ' ', '4', NULL, 0, 0, '2004-07-17', NULL, NULL, 'رواد المج'),
(287, 'بشر الحافي', 'عامر', NULL, 'مالكي', 'مهندس', 'سوري', '933706699', '0', '0', ' ', '7', NULL, 0, 0, '2005-07-27', NULL, NULL, 'مصر'),
(288, 'ابراهيم رحيم', 'احمد', NULL, 'مهاجرين', 'مهندس', 'سوري', '0', '0', '113741795', ' ', '14', NULL, 0, 0, '2007-01-01', NULL, NULL, 'طارق بن زياد'),
(290, 'محمد خالد صطيف', 'احمد', NULL, 'جاحظ', 'موظف', 'سوري', '933395000', '930314814', '113330260', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'نصوح بابيل'),
(291, 'بلال بدير', 'عمار', NULL, 'مالكي', 'مدير', 'سوري', '932220300', '0', '113733830', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'بيروت'),
(292, 'جلال حجار', 'حسان', NULL, 'مالكي', 'دكتور', 'سوري', '0', '0', '0', ' ', '13', NULL, 0, 0, '2006-07-26', NULL, NULL, 'اميركا'),
(293, 'عمر ابو القصب', 'اسامة', NULL, 'ابو رمانة', 'محاسب', 'سوري', '937916846', '950094330', '113311251', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, '-'),
(294, 'احمد حمدي', 'محمد', NULL, 'برامكة', 'تجارة', 'سوري', '993399669', '0', '112144144', ' ', '13', NULL, 0, 0, '2007-01-01', NULL, NULL, 'بناة الاجيال'),
(295, 'احمد قره جولي ', 'سامر', NULL, 'برامكة', 'تاجر', 'سوري', '943224517', '0', '112772638', ' ', '13', NULL, 0, 0, '2007-01-01', NULL, NULL, 'برغان شندين'),
(296, 'عمر دياب', 'طلال', NULL, 'مشروع دمر', 'تاجر', 'سوري', '944322233', '0', '113144633', ' ', '7', NULL, 0, 0, '2005-07-30', NULL, NULL, 'وطنية'),
(297, 'عمر قباني', 'محمد علي', NULL, 'مزة', 'تاجر', 'سوري', '0', '0', '116115789', ' ', '7', NULL, 0, 0, '2005-01-01', NULL, NULL, 'وطنية');
INSERT INTO `students_temp` (`id`, `student_fname`, `student_lname`, `student_father_name`, `student_address`, `student_father_job`, `student_nationality`, `father_phone`, `student_phone`, `home_phone`, `transportation`, `student_photo`, `note`, `status`, `has_id`, `student_birthdate`, `created_at`, `updated_at`, `school_name`) VALUES
(298, 'محمد الصوفي', 'لؤي', NULL, 'ابو رمانة', 'دكتور', 'سوري', '944348001', '937278018', '113319759', ' ', '4', NULL, 0, 0, '2004-07-31', NULL, NULL, 'الاندلس'),
(299, 'بهاء الدين زيدان', 'مازن', NULL, 'الروضة', 'تاجر', 'سوري', '0', '0', '113316890', ' ', '1', 'ركة القدم', 0, 0, '2008-05-01', NULL, NULL, 'الفارابي'),
(300, 'يزن فليون', 'محمد تيسير ', NULL, 'مهاجرين', 'موظف', 'سوري', '988450718', '0', '113716894', ' ', '1', NULL, 0, 0, '2008-08-29', NULL, NULL, 'سنا الشام'),
(301, 'محمد كريم', 'زياد', NULL, 'كفرسوسة', 'تجارة', 'سوري', '932424261', '0', '0', ' ', '11', NULL, 0, 0, '2005-01-25', NULL, NULL, '-'),
(302, 'طارق كريم', 'زياد', NULL, 'كفرسوسة', 'تاجر', 'سوري', '932424261', '0', '0', ' ', '14', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(303, 'كريم عزو', 'عمرو جنان', NULL, 'مزة', 'فراسة', 'سوري', '944250452', '932811994', '0', ' ', '7', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(304, 'تيم عزو', 'عمرو جنان', NULL, 'مزة', 'فراسة', 'سوري', '944250452', '932811994', '0', ' ', '1', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(305, 'كريم عربي كاتبي', 'عمرو جنان', NULL, '.', 'فراسة', 'سوري', '0', '932811994', '0', ' ', '14', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(308, 'عبدالله هلالي', 'عمرو جنان', NULL, '.', 'فراسة', 'سوري', '0', '932811994', '0', ' ', '14', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(309, 'تيسير سكر', 'عمرو جنان', NULL, 'روضة', 'فراسة', 'سوري', '933544447', '932811994', '0', ' ', '14', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(310, 'بلال هلالي', 'عمرو جنان', NULL, '.', 'فراسة', 'سوري', '0', '932811994', '0', ' ', '7', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(311, 'وليد عربي كاتبي', 'عمرو جنان', NULL, '.', 'فراسة', 'سوري', '0', '932811994', '0', ' ', '1', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(312, 'يزن مصري', 'عمرو جنان', NULL, 'مهاجرين', 'فراسة', 'سوري', '938065066', '932811994', '0', ' ', '6', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(313, 'اكرم الحرش', 'عمرو جنان', NULL, '.', 'فراسة', 'سوري', '0', '932811994', '0', ' ', '6', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(314, 'كرم غنام', 'عمرو جنان', NULL, 'ميدان', 'فراسة', 'سوري', '988464949', '932811994', '0', ' ', '11', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(315, 'جواد حموي', 'عمرو جنان', NULL, 'كفرسوسة', 'فراسة', 'سوري', '933808055', '932811994', '0', ' ', '1', NULL, 0, 0, '2005-01-01', NULL, NULL, 'البوادر'),
(316, 'هادي الكردي', 'عمرو جنان', NULL, 'مشفى المجتهد', 'فراسة', 'سوري', '991551894', '932811994', '0', ' ', '13', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(317, 'اكرم ابو جيب', 'عمرو جنان', NULL, 'ميدان', 'فراسة', 'سوري', '966274928', '932811994', '0', ' ', '6', NULL, 0, 0, '2005-01-01', NULL, NULL, '-'),
(318, ' عبد الرحمن مطر', 'سامر', NULL, ',', 'تاجر', 'سوري', '935299997', '0', '0', ' ', '13', NULL, 0, 0, '2005-01-01', NULL, NULL, 'سوا'),
(319, 'اسماعيل السبع', 'سامر', NULL, 'مهاجرين', 'تاجر', 'سوري', '966201838', '0', '0', ' ', '1', NULL, 0, 0, '2005-01-01', NULL, NULL, 'معهد المصري'),
(320, 'تيم الحريري', 'سامر', NULL, 'ركن الدين', 'تاجر', 'سوري', '955442817', '0', '0', ' ', '11', NULL, 0, 0, '2009-10-01', NULL, NULL, 'الفارابي'),
(321, 'اياد الكافي', 'ز', NULL, 'عباسيين', 'تاجر', 'سوري', '988606766', '0', '0', ' ', '4', NULL, 0, 0, '2004-08-17', NULL, NULL, 'رواد المجد'),
(322, 'لؤي الزين', 'امير', NULL, 'مزة', 'تاجر', 'سوري', '944345900', '0', '116123457', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'شويفات'),
(323, 'يوسف الكيال', 'محمد', NULL, 'زراعة', '.', 'سوري', '944334900', '0', '0', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'محمدبن القاسم الثقفي'),
(324, 'غالب رفاعي', 'وسيم', NULL, 'عدوي', 'تاجر', 'سوري', '2147483647', '994968965', '0', ' ', '7', NULL, 0, 0, '2006-11-07', NULL, NULL, 'مونتي كوتج'),
(325, 'عمر قبلان', 'عبد القادر', NULL, 'جبة', 'محامي', 'سوري', '955555150', '0', '0', ' ', '1', NULL, 0, 0, '2008-01-01', NULL, NULL, 'مشعل الحرية'),
(326, 'علي قبلان', 'عبد القادر', NULL, 'جبة', 'محامي', 'سوري', '955555150', '0', '0', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'مشعل الحرية'),
(327, 'خالد المغربي', 'ناصر', NULL, 'شارع الباكستان مقابل مطعم مرايا', 'طبيب', 'سوري', '933560933', '956569357', '114412974', ' ', '14', NULL, 0, 0, '2007-08-23', NULL, NULL, 'دوحة التربية'),
(328, 'رياض حميد', 'سامر', NULL, 'كفرسوسة جانب مشفى الاندلس', 'صيدلي', 'سوري', '0', '0', '0', ' ', '32', NULL, 0, 0, '2011-03-04', NULL, NULL, 'الثاني'),
(329, 'جاد الزين', 'حسان', NULL, 'كفرسوسة جانب الشام سنتر', '-', 'سوري', '0', '0', '0', ' ', '3', NULL, 0, 0, '2012-08-13', NULL, NULL, 'القرية الصغيرة'),
(330, 'ورد منصور', 'ابراهيم', NULL, 'الحمرا جانب زارا', 'كومبيوتر', 'سوري', '933222269', '0', '0', ' ', '11', NULL, 0, 0, '2009-11-24', NULL, NULL, 'الفرنسية'),
(331, 'يحيى ابو سمرة', 'موفق', NULL, 'مشروع دمر التعمير', 'محل موبايلات', 'سوري', '933422766', '953220226', '113121188', ' ', '11', NULL, 0, 0, '2009-04-19', NULL, NULL, 'الشويفات'),
(332, 'كرم غنام', 'مهدي', NULL, 'الميدان كورنيش', 'تاجر ورق', 'سوري', '0', '0', '118844510', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'البوادر'),
(333, 'كنان حافي', 'حسام', NULL, 'كفرسوسة', 'تاجر', 'سوري', '0', '0', '112121344', ' ', '3', NULL, 0, 0, '2012-11-21', NULL, NULL, 'مونتيسوري'),
(334, 'جاد حميد', 'سامر', NULL, 'كفرسوسة', 'تاجر', 'سوري', '0', '0', '0', ' ', '3', NULL, 0, 0, '2012-11-16', NULL, NULL, '-'),
(335, 'كريم شويكي', 'غيث', NULL, 'مهاجرين', 'تاجر', 'سوري', '0', '0', '0', ' ', '8', NULL, 0, 0, '2011-11-15', NULL, NULL, 'دار الفرح'),
(336, 'معاذ قهوجي', 'رشاد', NULL, 'جسر الابيض', 'تاجر', 'سوري', '933000185', '0', '0', ' ', '8', NULL, 0, 0, '2011-11-01', NULL, NULL, 'بشائر'),
(337, 'ادم  خضري', 'محمد', NULL, 'مهاجرين', 'تاجر', 'سوري', '0', '0', '0', ' ', '3', NULL, 0, 0, '2012-11-15', NULL, NULL, 'مونتيسوري'),
(338, 'ليث الحفار', 'غيث', NULL, 'مهاجرين', 'تاجر', 'سوري', '0', '0', '0', ' ', '3', NULL, 0, 0, '2012-11-06', NULL, NULL, 'سورية الحديثة'),
(339, 'يحيى العجلاني', 'محمد', NULL, 'مزة فارابي - مالكي جامع انس', 'مدير اعمال', 'سوري', '930244717', '936477774', '0', ' ', '7', NULL, 0, 0, '2005-05-22', NULL, NULL, 'الشويفات'),
(340, 'جاد جمعة', 'عزت', NULL, 'ضاحية قدسيا جزيرة بي 1', 'تاجر', 'سوري', '932572293', '0', '113445123', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'التالق'),
(341, 'حمزة هبة', 'فادي', NULL, 'مهاجرين', 'تجارة', 'سوري', '993994000', '0', '0', ' ', '13', NULL, 0, 0, '2006-12-21', NULL, NULL, 'عمر بن عبد العزيز'),
(342, 'كريم رمضان', 'وسيم', NULL, 'قرى الاسد', 'تاجر', 'سوري', '944910421', '0', '0', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'التألق'),
(343, 'يحيى جويجاتي', 'عبد الرحمن ', NULL, 'نهر عيشة', 'مهندس', 'سوري', '932893988', '0', '0', ' ', '6', NULL, 0, 0, '2010-12-09', NULL, NULL, 'محمد مصطفى'),
(344, 'محمد علي الجليلاتي', 'محمود', NULL, 'كفرسوسة جانب جامع الرفاعي', 'تاجر', 'سوري', '944213399', '994042770', '112124915', ' ', '7', NULL, 0, 0, '2005-08-02', NULL, NULL, 'عباس الحامض'),
(345, 'عمر الجليلاتي', 'محمود', NULL, 'كفرسوسة جانب جامع الرفاعي', 'تاجر', 'سوري', '944213399', '0', '112124915', ' ', '8', NULL, 0, 0, '1969-12-31', NULL, NULL, 'البوادر'),
(346, 'يمان القباني', 'نورس', NULL, 'مهاجرين الجادة الخامسة', 'خياط', 'سوري', '945267880', '0', '113742689', ' ', '11', NULL, 0, 0, '2009-02-27', NULL, NULL, 'الاخوة الخاصة'),
(347, 'احمد عودة', 'مهند', NULL, 'المهاجرين جادة ثانية', 'تجارة', 'سوري', '944095583', '0', '113732619', ' ', '14', NULL, 0, 0, '2007-01-01', NULL, NULL, 'روضة الاحداث'),
(348, 'طارق خباز', 'عمار', NULL, 'شرقي ركن الدين', 'الاسواق الحرة', 'سوري', '933602185', '0', '112715406', ' ', '14', NULL, 0, 0, '2007-10-20', NULL, NULL, 'التطبيقات النمودجية'),
(349, 'عبد الرحمن هبا', 'محمد', NULL, 'مالكي', 'محامي', 'سوري', '933333487', '0', '0', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'سوا'),
(350, 'محمد مفعلاني', 'اسامة', NULL, 'مالكي', 'مهندس', 'سوري', '941114440', '0', '0', ' ', '13', NULL, 0, 0, '2006-01-01', NULL, NULL, 'سورية العلمية'),
(351, 'مجد سكر', 'خالد', NULL, 'مالكي', 'تاجر', 'سوري', '955529026', '0', '0', ' ', '7', NULL, 0, 0, '2005-08-17', NULL, NULL, 'بدر الدين الحسني'),
(352, 'جاد طباع', 'ماهر', NULL, 'ابو رمانة', 'تاجر', 'سوري', '933212198', '944702595', '0', ' ', '7', NULL, 0, 0, '2005-01-01', NULL, NULL, 'شويفات'),
(353, 'طارق الصعيدي', 'عماد', NULL, 'ابو رمانة', 'مهندس', 'سوري', '966571504', '0', '0', ' ', '14', NULL, 0, 0, '2008-01-01', NULL, NULL, 'نصوح بابيل'),
(354, 'احمد الخطيب', 'مؤمن', NULL, 'كفرسوسة', 'مهندس', 'سوري', '988888588', '0', '0', ' ', '1', NULL, 0, 0, '2008-01-01', NULL, NULL, 'القرية الصغيرة'),
(355, 'كرم خليلي', 'احمد', NULL, 'مزة', 'محامي', 'سوري', '940964342', '0', '0', ' ', '6', NULL, 0, 0, '2010-01-01', NULL, NULL, 'شويفات'),
(356, ' 2عبد الرحمن برغلي', 'بسام', NULL, 'ابو رمانة', 'تاجر', 'سوري', '992018871', '0', '113334386', ' ', '14', NULL, 0, 0, '2007-01-01', NULL, NULL, 'نصوح بابيل'),
(357, 'يمان خلف', 'حسان', NULL, 'مساكن برزة', 'مهندس', 'سوري', '944626590', '0', '0', ' ', '14', NULL, 0, 0, '2007-01-01', NULL, NULL, 'فارابي'),
(358, 'ليث عبد الواحد', 'باسل', NULL, 'مهاجرين', 'تاجر', 'سوري', '944282094', '0', '0', ' ', '14', NULL, 0, 0, '2008-01-01', NULL, NULL, 'دوحة المجد'),
(359, 'بلال داهرلي', 'محمد', NULL, 'مالكي', 'صباغة', 'سوري', '933071120', '0', '0', ' ', '11', NULL, 0, 0, '2009-01-01', NULL, NULL, 'محمد اسامة البيروتي'),
(360, 'زيد الحلاق ', 'محمد عبد الحميد', NULL, 'مهاجرين باشكاتب ', 'مدير معمل', 'سوري', '944874260', '955425364', '113710193', ' ', '15', NULL, 0, 0, '2003-05-06', NULL, NULL, 'سامي دروبي '),
(361, 'خضر عبسة', 'محمد عيد', NULL, 'المهاجرين شطا ', 'متههد', 'سوري', '936452400', '947857587', '113713214', ' ', '15', NULL, 0, 0, '2003-09-10', NULL, NULL, 'سامي دروبي'),
(362, 'عمر الصيرفي', 'اسامة', NULL, 'مهاجرين', 'تاجر', 'سوري', '944325462', '962922347', '113737468', ' ', '15', NULL, 0, 0, '2003-05-06', NULL, NULL, 'سامي دروبي'),
(363, 'عبادة الطحان', 'محمد', NULL, 'مشروع دمر', 'تاجر', 'سوري', '944447004', '965508323', '113127843', ' ', '15', NULL, 0, 0, '2003-05-06', NULL, NULL, 'التالق'),
(364, 'احمد الغميان', 'حمدي', NULL, 'الصبورة', 'تاجر', 'سوري', '988790101', '958257587', '113932616', ' ', '0', NULL, 0, 0, '2007-05-18', NULL, NULL, 'افاق المعرفة');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendances`
--

CREATE TABLE `student_attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_course_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_late` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_attendances`
--

INSERT INTO `student_attendances` (`id`, `student_id`, `student_course_id`, `is_late`, `created_at`, `updated_at`) VALUES
(1, 3, '6', 1, '2019-05-09 21:00:00', NULL),
(2, 2, '1', 0, '2019-05-28 21:00:00', NULL),
(3, 2, '5', 0, '2019-06-06 21:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `class_name`, `created_at`, `updated_at`) VALUES
(1, 'dsfsd 1', NULL, NULL),
(2, 'الصف السابع 4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_notes`
--

CREATE TABLE `student_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_notes`
--

INSERT INTO `student_notes` (`id`, `student_id`, `notes`, `created_at`, `updated_at`) VALUES
(2, 2, 'طالب مشاكس', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_points`
--

CREATE TABLE `student_points` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `point_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_points`
--

INSERT INTO `student_points` (`id`, `student_id`, `point_id`, `created_at`, `updated_at`) VALUES
(21, 1, '6', '2019-05-24 10:20:58', '2019-05-24 10:20:58'),
(22, 6, '6', '2019-05-24 10:20:58', '2019-05-24 10:20:58'),
(25, 1, '8', '2019-05-26 02:24:20', '2019-05-26 02:24:20'),
(26, 1, '9', '2019-05-26 02:28:42', '2019-05-26 02:28:42'),
(27, 1, '8', '2019-05-26 02:30:57', '2019-05-26 02:30:57'),
(28, 1, '8', '2019-05-26 02:34:35', '2019-05-26 02:34:35'),
(29, 1, '9', '2019-05-26 02:34:48', '2019-05-26 02:34:48'),
(30, 1, '8', '2019-05-26 02:35:07', '2019-05-26 02:35:07'),
(31, 1, '8', '2019-05-26 02:36:37', '2019-05-26 02:36:37'),
(32, 1, '8', '2019-05-26 02:36:41', '2019-05-26 02:36:41'),
(33, 1, '8', '2019-05-26 18:54:21', '2019-05-26 18:54:21'),
(34, 13, '4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `surah`
--

CREATE TABLE `surah` (
  `id` int(11) NOT NULL,
  `surah_name` varchar(200) NOT NULL,
  `surah_details` varchar(200) NOT NULL,
  `start_page_num` int(11) NOT NULL,
  `end_page_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `surah`
--

INSERT INTO `surah` (`id`, `surah_name`, `surah_details`, `start_page_num`, `end_page_num`) VALUES
(78, 'سورة عم', '', 582, 583),
(79, 'سورة النازعات', '', 583, 584),
(80, 'عبس', '', 585, 586),
(81, 'التكوير', '', 586, 587),
(82, 'سورة الانفطار', '', 587, 587),
(83, 'سورة المطففين', '', 587, 589),
(84, 'الانشقاق', '', 589, 590),
(85, 'البروج', '', 590, 591),
(86, 'الطارق', '', 591, 591),
(87, 'الأعلى', '', 591, 592),
(88, 'الغاشية', '', 592, 593),
(89, 'الفجر', '', 593, 594),
(90, 'البلد', '', 594, 595),
(91, 'الشمس', '', 595, 595),
(92, 'الليل', '', 595, 596),
(93, 'الضحى', '', 596, 596),
(94, 'الشرح', '', 596, 597),
(95, 'التين', '', 597, 597),
(96, 'العلق', '', 597, 598),
(97, 'القدر', '', 598, 598),
(98, 'البينة', '', 598, 599),
(99, 'الزلزلة', '', 599, 599),
(100, 'العاديات', '', 599, 600),
(101, 'القارعة', '', 600, 600),
(102, 'التكاثر', '', 600, 600),
(103, 'العصر', '', 601, 601),
(104, 'الهمزة', '', 601, 601),
(105, 'الفيل', '', 601, 601),
(106, 'قريش', '', 602, 602),
(107, 'الماعون', '', 602, 602),
(108, 'الكوثر', '', 602, 602),
(109, 'الكافرون', '', 603, 603),
(110, 'النصر', '', 603, 603),
(111, 'المسد', '', 603, 603),
(112, 'الاخلاص', '', 604, 604),
(113, 'الفلق', '', 604, 604),
(114, 'الناس', '', 604, 604);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) UNSIGNED NOT NULL,
  `teacher_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_study` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_speciality` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_work` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_extras` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `teacher_name`, `teacher_address`, `teacher_study`, `teacher_speciality`, `teacher_work`, `teacher_extras`, `teacher_note`, `teacher_mobile`, `teacher_phone`, `birthdate`, `created_at`, `updated_at`, `username`, `password`) VALUES
(2, 'أنس', 'عفيف', 'IT', 'تجربة', 'تجربة', 'تجربة', 'تجربة', '0991647355', '011634725288', NULL, '2019-04-25 16:31:06', '2019-04-25 16:31:06', '', ''),
(3, 'لؤي', 'قاسيون', 'IT', 'SE', 'SE', 'TT', 'N', '0991647355', '011', NULL, '2019-05-03 09:34:45', '2019-05-03 09:34:45', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_courses`
--

CREATE TABLE `teacher_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_courses`
--

INSERT INTO `teacher_courses` (`id`, `teacher_id`, `course_id`, `created_at`, `updated_at`) VALUES
(3, 2, 2, '2019-04-25 16:41:49', '2019-04-25 16:41:49'),
(4, 3, 3, '2019-05-03 09:35:20', '2019-05-03 09:35:20'),
(5, 2, 6, '2019-06-30 14:54:39', '2019-06-30 14:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_roles`
--

CREATE TABLE `teacher_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_roles`
--

INSERT INTO `teacher_roles` (`id`, `role_name`, `notes`, `created_at`, `updated_at`) VALUES
(2, 'مدرس', 'مسؤول عن الحصة', '2019-04-25 16:40:42', '2019-04-25 16:40:42'),
(3, 'مسمع', 'يسمع للطلاب', '2019-04-25 16:40:56', '2019-04-25 16:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '{\"en\":\"\\u062a\\u0645\\u062a \\u0627\\u0644\\u0639\\u0645\\u0644\\u064a\\u0629 \\u0628\\u0646\\u062c\\u0627\\u062d\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(2, '*', 'admin', 'awqaf-student.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(3, 'brackets/admin-ui', 'admin', 'btn.save', '{\"en\":\"\\u062d\\u0641\\u0638\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(4, '*', 'admin', 'awqaf-student.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(5, '*', 'admin', 'awqaf-student.actions.index', '{\"en\":\"\\u0637\\u0644\\u0627\\u0628 \\u0627\\u0644\\u0623\\u0648\\u0642\\u0627\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(6, 'brackets/admin-ui', 'admin', 'placeholder.search', '{\"en\":\"\\u0627\\u0644\\u0628\\u062d\\u062b\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(7, 'brackets/admin-ui', 'admin', 'btn.search', '{\"en\":\"\\u0628\\u062d\\u062b\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(8, 'brackets/admin-ui', 'admin', 'btn.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(9, 'brackets/admin-ui', 'admin', 'btn.delete', '{\"en\":\"\\u062d\\u0630\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(10, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(11, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(12, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(13, '*', 'admin', 'awqaf.columns.test_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0641\\u062d\\u0635\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(14, '*', 'admin', 'awqaf.columns.date', '{\"en\":\"\\u0627\\u0644\\u062a\\u0627\\u0631\\u064a\\u062e\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(15, '*', 'admin', 'awqaf.columns.place', '{\"en\":\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(16, '*', 'admin', 'awqaf.columns.tester_name', '{\"en\":\"tester_name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(17, '*', 'admin', 'awqaf.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(18, '*', 'admin', 'awqaf.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(19, '*', 'admin', 'awqaf.actions.index', '{\"en\":\"\\u0627\\u0645\\u062a\\u062d\\u0627\\u0646\\u0627\\u062a \\u0627\\u0644\\u0623\\u0648\\u0642\\u0627\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(20, '*', 'admin', 'awqaf.columns.id', '{\"en\":\"id\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(21, '*', 'admin', 'course-teacher-student.actions.create', '[]', NULL, '2019-04-25 13:32:44', '2019-05-02 16:38:16', '2019-05-02 16:38:16'),
(22, '*', 'admin', 'course-teacher-student.actions.edit', '[]', NULL, '2019-04-25 13:32:44', '2019-05-02 16:38:16', '2019-05-02 16:38:16'),
(23, '*', 'admin', 'course-student.actions.index', '{\"en\":\"\\u062d\\u0644\\u0642\\u0627\\u062a \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(24, '*', 'admin', 'course-student.actions.create', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0627\\u0644\\u0628 \\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(25, '*', 'admin', 'course.columns.semester_id', '{\"en\":\"semester_id\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(26, '*', 'admin', 'course.columns.course_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(27, '*', 'admin', 'course.columns.description', '{\"en\":\"\\u0627\\u0644\\u0648\\u0635\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(28, '*', 'admin', 'course.columns.started_at', '{\"en\":\"\\u062a\\u0628\\u062f\\u0623 \\u0628\\u062a\\u0627\\u0631\\u064a\\u062e\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(29, 'brackets/admin-ui', 'admin', 'forms.select_a_date', '{\"en\":\"\\u0627\\u062e\\u062a\\u0631 \\u0627\\u0644\\u062a\\u0627\\u0631\\u064a\\u062e\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(30, '*', 'admin', 'course.columns.end_at', '{\"en\":\"\\u062a\\u0646\\u062a\\u0647\\u064a \\u0628\\u062a\\u0627\\u0631\\u064a\\u062e\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(31, '*', 'admin', 'course.columns.session_number', '{\"en\":\"\\u0639\\u062f\\u062f \\u0627\\u0644\\u062c\\u0644\\u0633\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(32, '*', 'admin', 'course.columns.enabled', '{\"en\":\"\\u0627\\u0644\\u062a\\u0641\\u0639\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(33, '*', 'admin', 'course.actions.create', '{\"en\":\"\\u062d\\u0644\\u0642\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(34, '*', 'admin', 'course.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(35, '*', 'admin', 'course.actions.index', '{\"en\":\"\\u0627\\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(36, '*', 'admin', 'course.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(37, '*', 'admin', 'exam.columns.course_id', '{\"en\":\"\\u0627\\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(38, '*', 'admin', 'exam.columns.exam_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0627\\u0645\\u062a\\u062d\\u0627\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(39, '*', 'admin', 'exam.columns.exam_max_num', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0639\\u0638\\u0645\\u0649\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(40, '*', 'admin', 'exam.columns.exam_min_num', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u062f\\u0646\\u064a\\u0627\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(41, '*', 'admin', 'exam.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621 \\u0627\\u0645\\u062a\\u062d\\u0627\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(42, '*', 'admin', 'exam.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(43, '*', 'admin', 'exam.actions.index', '{\"en\":\"\\u0627\\u0644\\u0627\\u0645\\u062a\\u062d\\u0627\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(44, '*', 'admin', 'exam.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(45, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '{\"en\":\"\\u0627\\u0644\\u062d\\u0633\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(46, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '{\"en\":\"\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062e\\u0631\\u0648\\u062c\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(47, 'brackets/admin-ui', 'admin', 'sidebar.content', '{\"en\":\"\\u0627\\u0644\\u0639\\u0645\\u0644\\u064a\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(48, '*', 'admin', 'course.title', '{\"en\":\"\\u0627\\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(49, '*', 'admin', 'exam.title', '{\"en\":\"\\u0627\\u0644\\u0627\\u0645\\u062a\\u062d\\u0627\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(50, '*', 'admin', 'semester.title', '{\"en\":\"\\u0627\\u0644\\u0641\\u0635\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(51, '*', 'admin', 'student.title', '{\"en\":\"\\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(52, '*', 'admin', 'teacher.title', '{\"en\":\"\\u0627\\u0644\\u0623\\u0633\\u062a\\u0627\\u0630\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(53, '*', 'admin', 'student-class.title', '{\"en\":\"\\u0635\\u0641\\u0648\\u0641 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(54, '*', 'admin', 'course-student.title', '{\"en\":\"\\u0637\\u0644\\u0627\\u0628 \\u0627\\u0644\\u062d\\u0644\\u0642\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(55, '*', 'admin', 'teacher-role.title', '{\"en\":\"\\u0645\\u0647\\u0645\\u0627\\u062a \\u0627\\u0644\\u0623\\u0633\\u0627\\u062a\\u0630\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(56, '*', 'admin', 'teacher-course.title', '{\"en\":\"\\u0627\\u0644\\u062d\\u0644\\u0642\\u0627\\u062a \\u0648\\u0627\\u0644\\u0623\\u0633\\u0627\\u062a\\u0630\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(57, '*', 'admin', 'point-type.title', '{\"en\":\"\\u0623\\u0646\\u0648\\u0627\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(58, '*', 'admin', 'point-config.title', '{\"en\":\"\\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(59, '*', 'admin', 'awqaf.title', '{\"en\":\"\\u0627\\u0644\\u0623\\u0648\\u0642\\u0627\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(60, '*', 'admin', 'awqaf-student.title', '{\"en\":\"\\u0637\\u0644\\u0627\\u0628 \\u0627\\u0644\\u0623\\u0648\\u0642\\u0627\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(61, '*', 'admin', 'mark.title', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(62, '*', 'admin', 'student-note.title', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a \\u062d\\u0648\\u0644 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(63, '*', 'admin', 'student-attendance.title', '{\"en\":\"\\u062d\\u0636\\u0648\\u0631 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(64, '*', 'admin', 'student-point.title', '{\"en\":\"\\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(65, 'brackets/admin-ui', 'admin', 'sidebar.settings', '{\"en\":\"\\u0627\\u0644\\u0627\\u0639\\u062f\\u0627\\u062f\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(66, '*', 'admin', 'mark.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(67, '*', 'admin', 'mark.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(68, '*', 'admin', 'mark.actions.index', '{\"en\":\"\\u0627\\u0644\\u0627\\u0645\\u062a\\u062d\\u0627\\u0646\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(69, '*', 'admin', 'point-config.columns.point_type_id', '{\"en\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(70, '*', 'admin', 'point-config.columns.point_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(71, '*', 'admin', 'point-config.columns.point_value', '{\"en\":\"\\u0642\\u064a\\u0645\\u0629 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(72, '*', 'admin', 'point-config.columns.notes', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(73, '*', 'admin', 'point-config.actions.create', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(74, '*', 'admin', 'point-config.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(75, '*', 'admin', 'point-config.actions.index', '{\"en\":\"\\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(76, '*', 'admin', 'point-config.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(77, '*', 'admin', 'point-type.columns.type_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0646\\u0648\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(78, '*', 'admin', 'point-type.columns.notes', '{\"en\":\"\\u0627\\u0644\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(79, '*', 'admin', 'point-type.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(80, '*', 'admin', 'point-type.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(81, '*', 'admin', 'point-type.actions.index', '{\"en\":\"\\u0623\\u0646\\u0648\\u0627\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(82, '*', 'admin', 'point-type.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(83, '*', 'admin', 'semester.columns.semester_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0641\\u0635\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(84, '*', 'admin', 'semester.columns.description', '{\"en\":\"\\u0627\\u0644\\u0648\\u0635\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(85, '*', 'admin', 'semester.columns.started_at', '{\"en\":\"\\u064a\\u0628\\u062f\\u0623 \\u0628\\u062a\\u0627\\u0631\\u064a\\u062e\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(86, '*', 'admin', 'semester.columns.end_at', '{\"en\":\"\\u064a\\u0646\\u062a\\u0647\\u064a \\u0628\\u062a\\u0627\\u0631\\u064a\\u062e\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(87, '*', 'admin', 'semester.columns.enabled', '{\"en\":\"\\u0627\\u0644\\u062a\\u0641\\u0639\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(88, '*', 'admin', 'semester.actions.create', '{\"en\":\"\\u0641\\u0635\\u0644 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(89, '*', 'admin', 'semester.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(90, '*', 'admin', 'semester.actions.index', '{\"en\":\"\\u0627\\u0644\\u0641\\u0635\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(91, '*', 'admin', 'semester.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(92, '*', 'admin', 'student-attendance.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(93, '*', 'admin', 'student-attendance.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(94, '*', 'admin', 'student-attendance.actions.index', '{\"en\":\"\\u062d\\u0636\\u0648\\u0631 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(95, '*', 'admin', 'student-class.columns.school_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0633\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(96, '*', 'admin', 'student-class.columns.class_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0635\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(97, '*', 'admin', 'student-class.actions.create', '{\"en\":\"\\u0635\\u0641\\u0648\\u0641 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(98, '*', 'admin', 'student-class.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(99, '*', 'admin', 'student-class.actions.index', '{\"en\":\"\\u0635\\u0641\\u0648\\u0641 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(100, '*', 'admin', 'student-class.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(101, '*', 'admin', 'student-note.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(102, '*', 'admin', 'student-note.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(103, '*', 'admin', 'student-note.actions.index', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a \\u062d\\u0648\\u0644 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(104, '*', 'admin', 'student-point.actions.create', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0646\\u0642\\u0627\\u0637\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(105, '*', 'admin', 'student-point.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(106, '*', 'admin', 'student-point.actions.index', '{\"en\":\"\\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(107, '*', 'admin', 'student.columns.student_fname', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(108, '*', 'admin', 'student.columns.student_lname', '{\"en\":\"\\u0627\\u0644\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0623\\u062e\\u064a\\u0631\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(109, '*', 'admin', 'student.columns.student_father_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0623\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(110, '*', 'admin', 'student.columns.student_address', '{\"en\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(111, '*', 'admin', 'student.columns.student_father_job', '{\"en\":\"\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0623\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(112, '*', 'admin', 'student.columns.student_nationality', '{\"en\":\"\\u062c\\u0646\\u0633\\u064a\\u0629 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(113, '*', 'admin', 'student.columns.father_phone', '{\"en\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0623\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(114, '*', 'admin', 'student.columns.student_phone', '{\"en\":\"\\u0631\\u0642\\u0645 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(115, '*', 'admin', 'student.columns.home_phone', '{\"en\":\"\\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0645\\u0646\\u0632\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(116, '*', 'admin', 'student.columns.transportation', '{\"en\":\"\\u0627\\u0644\\u0645\\u0648\\u0627\\u0635\\u0644\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(117, '*', 'admin', 'student.columns.student_photo', '{\"en\":\"\\u0635\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(118, '*', 'admin', 'student.columns.note', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(119, '*', 'admin', 'student.columns.status', '{\"en\":\"\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(120, '*', 'admin', 'student.columns.has_id', '{\"en\":\"\\u0644\\u062f\\u064a\\u0647 \\u0645\\u0639\\u0631\\u0641\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(121, '*', 'admin', 'student.columns.student_birthdate', '{\"en\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0645\\u064a\\u0644\\u0627\\u062f\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(122, '*', 'admin', 'student.actions.create', '{\"en\":\"\\u0637\\u0627\\u0644\\u0628 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(123, '*', 'admin', 'student.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(124, '*', 'admin', 'student.actions.index', '{\"en\":\"\\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(125, '*', 'admin', 'student.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(126, '*', 'admin', 'teacher-course.columns.teacher_id', '{\"en\":\"\\u0627\\u0644\\u0623\\u0633\\u062a\\u0627\\u0630\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(127, '*', 'admin', 'teacher-course.actions.create', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0623\\u0633\\u062a\\u0627\\u0630 \\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(128, '*', 'admin', 'teacher-course.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(129, '*', 'admin', 'teacher-course.actions.index', '{\"en\":\"\\u0627\\u0644\\u0623\\u0633\\u0627\\u062a\\u0630\\u0629 \\u0648\\u0627\\u0644\\u062d\\u0644\\u0642\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(130, '*', 'admin', 'teacher-course.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(131, '*', 'admin', 'teacher.columns.teacher_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0623\\u0633\\u062a\\u0627\\u0630\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(132, '*', 'admin', 'teacher.columns.teacher_mobile', '{\"en\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0627\\u0633\\u062a\\u0627\\u0630\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(133, '*', 'admin', 'teacher-role.columns.role_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0645\\u0647\\u0645\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(134, '*', 'admin', 'teacher-role.columns.notes', '{\"en\":\"\\u0627\\u0644\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(135, '*', 'admin', 'teacher-role.actions.create', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0645\\u0647\\u0645\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(136, '*', 'admin', 'teacher-role.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(137, '*', 'admin', 'teacher-role.actions.index', '{\"en\":\"\\u0645\\u0647\\u0645\\u0627\\u062a \\u0627\\u0644\\u0623\\u0633\\u0627\\u062a\\u0630\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(138, '*', 'admin', 'teacher-role.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(139, '*', 'admin', 'teacher.columns.user_id', '{\"en\":\"\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(140, '*', 'admin', 'teacher.columns.teacher_address', '{\"en\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u0623\\u0633\\u062a\\u0627\\u0630\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(141, '*', 'admin', 'teacher.columns.teacher_study', '{\"en\":\"\\u0627\\u0644\\u062f\\u0631\\u062c\\u0629 \\u0627\\u0644\\u0639\\u0644\\u0645\\u064a\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(142, '*', 'admin', 'teacher.columns.teacher_speciality', '{\"en\":\"\\u0627\\u0644\\u0627\\u062e\\u062a\\u0635\\u0627\\u0635\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(143, '*', 'admin', 'teacher.columns.teacher_work', '{\"en\":\"\\u0627\\u0644\\u0639\\u0645\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(144, '*', 'admin', 'teacher.columns.teacher_extras', '{\"en\":\"\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0623\\u062e\\u0631\\u0649\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(145, '*', 'admin', 'teacher.columns.teacher_note', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(146, '*', 'admin', 'teacher.columns.teacher_phone', '{\"en\":\"\\u0631\\u0642\\u0645 \\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0623\\u0631\\u0636\\u064a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(147, '*', 'admin', 'teacher.columns.birthdate', '{\"en\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0645\\u064a\\u0644\\u0627\\u062f\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(148, '*', 'admin', 'teacher.actions.create', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0623\\u0633\\u062a\\u0627\\u0630\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(149, '*', 'admin', 'teacher.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(150, '*', 'admin', 'teacher.actions.index', '{\"en\":\"\\u0627\\u0644\\u0623\\u0633\\u0627\\u062a\\u0630\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(151, '*', 'admin', 'teacher.columns.id', '[]', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(152, '*', 'admin', 'user.columns.roles', '{\"en\":\"\\u0627\\u0644\\u0645\\u0647\\u0645\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(153, 'brackets/admin-ui', 'admin', 'forms.select_options', '{\"en\":\"\\u0627\\u0644\\u0631\\u062c\\u0627\\u0621 \\u0627\\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(154, '*', 'admin', 'user.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(155, '*', 'admin', 'user.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(156, '*', 'admin', 'user.actions.index', '{\"en\":\"\\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(157, 'brackets/admin-ui', 'admin', 'btn.new', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:31', NULL),
(158, '*', '*', 'Translations', '{\"en\":\"\\u0627\\u0644\\u062a\\u0631\\u062c\\u0645\\u0629\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(159, '*', '*', 'Manage users', '{\"en\":\"\\u0625\\u062f\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(160, '*', '*', 'Configuration', '{\"en\":\"\\u0627\\u0644\\u0627\\u0639\\u062f\\u0627\\u062f\\u0627\\u062a\"}', NULL, '2019-04-25 13:32:44', '2019-06-14 08:47:32', NULL),
(161, '*', 'admin', 'student.columns.student_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-05-02 16:38:16', '2019-06-14 08:47:31', NULL),
(162, '*', 'admin', 'course-student.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644 :name\"}', NULL, '2019-05-02 16:38:16', '2019-06-14 08:47:31', NULL),
(163, '*', 'admin', 'course-student.actions.create-multi', '{\"en\":\"\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0627\\u0644\\u0628 \\u0644\\u062d\\u0644\\u0642\\u0629\"}', NULL, '2019-05-02 16:38:16', '2019-06-14 08:47:31', NULL),
(164, '*', 'admin', 'course-student.columns.id', '[]', NULL, '2019-05-02 16:38:16', '2019-06-14 08:47:31', NULL),
(165, '*', 'admin', 'admin_users.columns.roles', '{\"en\":\"\\u0627\\u0644\\u0645\\u0647\\u0645\\u0627\\u062a\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(166, '*', 'admin', 'admin_users.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(167, '*', 'admin', 'admin_users.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(168, '*', 'admin', 'admin_users.actions.index', '{\"en\":\"\\u0627\\u0644\\u0645\\u062f\\u0631\\u0627\\u0621\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(169, '*', 'admin', 'awaqafs.columns.test_name', '{\"en\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0627\\u062e\\u062a\\u0628\\u0627\\u0631\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(170, '*', 'admin', 'awaqaf-student.columns.student_mark', '{\"en\":\"\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(171, '*', 'admin', 'student_mark.columns.student_mark', '{\"en\":\"\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(172, '*', 'admin', 'awaqaf-student.columns.full_mark', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0646\\u0647\\u0627\\u0626\\u064a\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(173, '*', 'admin', 'full_mark.columns.full_mark', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0643\\u0644\\u064a\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(174, '*', 'admin', 'awaqaf-student.columns.is_passed', '{\"en\":\"\\u0646\\u0627\\u062c\\u062d\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(175, '*', 'admin', 'semester.columns.created_at', '{\"en\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(176, '*', 'admin', 'teacher-course.columns.subject_type', '{\"en\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(177, '*', 'admin', 'awqaf-student.columns.student_mark', '{\"en\":\"\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0637\\u0627\\u0644\\u0628\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(178, '*', 'admin', 'awqaf-student.columns.is_passed', '{\"en\":\"\\u0646\\u0627\\u062c\\u062d\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(179, '*', 'admin', 'awqaf-student.columns.full_mark', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0629 \\u0627\\u0644\\u0643\\u0627\\u0645\\u0644\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(180, '*', 'admin', 'awqaf-student.columns.subject_type', '{\"en\":\"\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0645\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0645\\u0639\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(181, '*', 'admin', 'awqaf-student.columns.subject', '{\"en\":\"\\u0627\\u0644\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0645\\u0633\\u0645\\u0639\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(182, '*', 'admin', 'student.columns.notes', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(183, '*', 'admin', 'listened-subject.title', '{\"en\":\"\\u0627\\u0644\\u0635\\u0641\\u062d\\u0627\\u062a \\u0648\\u0627\\u0644\\u0623\\u062c\\u0632\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0633\\u0645\\u0639\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-30 15:05:32', NULL),
(184, '*', 'admin', 'admin_users.title', '{\"en\":\"\\u0639\\u0646\\u0648\\u0627\\u0646\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(185, '*', 'admin', 'listened-subject.columns.created_at', '{\"en\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u062a\\u0633\\u0645\\u064a\\u0639\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(186, '*', 'admin', 'listened-subject.actions.create', '{\"en\":\"\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(187, '*', 'admin', 'listened-subject.actions.edit', '{\"en\":\"\\u062a\\u0639\\u062f\\u064a\\u0644\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(188, '*', 'admin', 'listened-subject.actions.index', '{\"en\":\"\\u0627\\u0644\\u0645\\u0633\\u0645\\u0639\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(189, '*', 'admin', 'mark.columns.notes', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0627\\u062a\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(190, '*', 'admin', 'mark.columns.mark', '{\"en\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(191, '*', 'admin', 'student-attendance.columns.created_at', '{\"en\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u062d\\u0636\\u0648\\u0631\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(192, '*', 'admin', 'student-note.columns.note', '{\"en\":\"\\u0645\\u0644\\u0627\\u062d\\u0638\\u0629\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL),
(193, '*', 'admin', 'student-note.columns.created_at', '{\"en\":\"\\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0644\\u0625\\u0646\\u0634\\u0627\\u0621\"}', NULL, '2019-06-12 02:06:22', '2019-06-14 08:47:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg_media`
--

CREATE TABLE `wysiwyg_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) UNSIGNED DEFAULT NULL,
  `wysiwygable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD KEY `activations_email_index` (`email`);

--
-- Indexes for table `admin_activations`
--
ALTER TABLE `admin_activations`
  ADD KEY `admin_activations_email_index` (`email`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `awqafs`
--
ALTER TABLE `awqafs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `awqaf_students`
--
ALTER TABLE `awqaf_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_students`
--
ALTER TABLE `course_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_teacher_students_course_id_foreign` (`course_id`),
  ADD KEY `course_teacher_students_student_id_foreign` (`student_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `juza`
--
ALTER TABLE `juza`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listened_subjects`
--
ALTER TABLE `listened_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_configs`
--
ALTER TABLE `point_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `point_types`
--
ALTER TABLE `point_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students_temp`
--
ALTER TABLE `students_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendances`
--
ALTER TABLE `student_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_notes`
--
ALTER TABLE `student_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_points`
--
ALTER TABLE `student_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surah`
--
ALTER TABLE `surah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_roles`
--
ALTER TABLE `teacher_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_namespace_index` (`namespace`),
  ADD KEY `translations_group_index` (`group`);

--
-- Indexes for table `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awqafs`
--
ALTER TABLE `awqafs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awqaf_students`
--
ALTER TABLE `awqaf_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `course_students`
--
ALTER TABLE `course_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `juza`
--
ALTER TABLE `juza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `listened_subjects`
--
ALTER TABLE `listened_subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `point_configs`
--
ALTER TABLE `point_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `point_types`
--
ALTER TABLE `point_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students_temp`
--
ALTER TABLE `students_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `student_attendances`
--
ALTER TABLE `student_attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_notes`
--
ALTER TABLE `student_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_points`
--
ALTER TABLE `student_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `surah`
--
ALTER TABLE `surah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teacher_courses`
--
ALTER TABLE `teacher_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teacher_roles`
--
ALTER TABLE `teacher_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_students`
--
ALTER TABLE `course_students`
  ADD CONSTRAINT `course_teacher_students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `course_teacher_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
