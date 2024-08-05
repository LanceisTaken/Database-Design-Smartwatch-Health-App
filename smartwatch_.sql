-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2024 at 11:42 AM
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
-- Database: `smartwatch_`
--

-- --------------------------------------------------------

--
-- Table structure for table `alarms`
--

CREATE TABLE `alarms` (
  `AlarmID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AlarmName` varchar(30) NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alarms`
--

INSERT INTO `alarms` (`AlarmID`, `UserID`, `AlarmName`, `Time`) VALUES
(1, 1, 'Morning Jog', '08:00:00'),
(2, 2, 'Workout Reminder', '07:30:00'),
(3, 3, 'Breakfast Time', '08:00:00'),
(4, 4, 'Medication Reminder', '05:00:00'),
(5, 5, 'Water Break', '10:00:00'),
(6, 6, 'Lunch Time', '12:00:00'),
(7, 7, 'Afternoon Stretch', '14:00:00'),
(8, 8, 'Gym Reminder', '15:30:00'),
(9, 9, 'Snack Time', '16:00:00'),
(10, 10, 'Snack Time', '18:00:00'),
(11, 11, 'Dinner Time', '19:00:00'),
(12, 12, 'Evening Walk', '19:30:00'),
(13, 13, 'Gaining Time', '20:00:00'),
(14, 14, 'Workout Time', '21:00:00'),
(15, 15, 'Bedtime Reminder', '22:00:00'),
(16, 16, 'Wash gym clothes', '20:30:00'),
(17, 17, 'Drink Water', '17:00:00'),
(18, 18, 'Exercise Time', '19:30:00'),
(19, 19, 'Exercise Class', '17:30:00'),
(20, 20, 'Squat Reminder', '08:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `BadgeID` int(11) NOT NULL,
  `BadgeName` varchar(50) NOT NULL,
  `Requirement` varchar(100) NOT NULL,
  `CategoryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`BadgeID`, `BadgeName`, `Requirement`, `CategoryName`) VALUES
(1, 'Marathonner', 'Complete a marathon (42km)', 'Endurance'),
(2, 'Sprinter', 'Run 100 meters in under 10 seconds', 'Speed'),
(3, 'Walker', 'Walk 10,000 steps in a day', 'Activity'),
(4, 'Swimmer', 'Swim 1km without stopping', 'Endurance'),
(5, 'Weightlifter', 'Lift your body weight in bench press', 'Strength'),
(6, 'Yoga-er', 'Complete 30 consecutive days of yoga practice', 'Consistency'),
(7, 'HIIT Master', 'Complete a high-intensity interval training session', 'Intensity'),
(8, 'Mountain Climber', 'Climb a mountain over 2000 meters', 'Adventure'),
(9, 'Cycler', 'Bike 10 km in a single ride', 'Endurance'),
(10, 'Step Master', 'Reach 100,000 steps in a week', 'Activity'),
(11, 'Trailblazer', 'Hike 20 km in a single day', 'Endurance'),
(12, 'Pilater', 'Master all pilates exercises', 'Flexibility'),
(13, 'Gym-er', 'Work out at the gym 5 days a week for a month', 'Consistency'),
(14, 'Calisthenic-er', 'Complete 100 consecutive push-ups', 'Strength'),
(15, 'Meditation Master', 'Meditate for 30 minutes daily for a month', 'Mindfulness'),
(16, 'Healthy Eater', 'Eat 5 servings of fruits and vegetables daily for a month', 'Nutrition'),
(17, 'Fitness Fanatic-er', 'Attend 30 fitness classes in a month', 'Consistency'),
(18, 'Dare-er', 'Complete a tough obstacle course race', 'Adventure'),
(19, 'Zumba Dancer', 'Dance in a Zumba class for 1 hour', 'Fun'),
(20, 'Martial Artist', 'Earn a black belt in any martial art', 'Discipline');

-- --------------------------------------------------------

--
-- Table structure for table `badgesunlocked`
--

CREATE TABLE `badgesunlocked` (
  `UserID` int(11) NOT NULL,
  `BadgesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `badgesunlocked`
--

INSERT INTO `badgesunlocked` (`UserID`, `BadgesID`) VALUES
(1, 1),
(2, 4),
(3, 9),
(4, 5),
(5, 6),
(6, 12),
(7, 17),
(8, 5),
(9, 7),
(10, 3),
(11, 16),
(12, 18),
(13, 19),
(14, 20),
(15, 11),
(16, 8),
(17, 13),
(18, 17),
(19, 18),
(20, 18);

-- --------------------------------------------------------

--
-- Table structure for table `bloodoxygenlevel`
--

CREATE TABLE `bloodoxygenlevel` (
  `OxygenLevelID` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `OxygenSaturationLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodoxygenlevel`
--

INSERT INTO `bloodoxygenlevel` (`OxygenLevelID`, `TimeStamp`, `OxygenSaturationLevel`) VALUES
(1, '2024-03-06 22:30:00', 98),
(2, '2024-03-06 23:15:00', 97),
(3, '2024-03-06 23:30:00', 95),
(4, '2024-03-07 00:15:00', 96),
(5, '2024-03-07 00:30:00', 98),
(6, '2024-03-07 01:00:00', 99),
(7, '2024-03-07 01:30:00', 97),
(8, '2024-03-07 02:15:00', 98),
(9, '2024-03-07 02:30:00', 96),
(10, '2024-03-07 03:15:00', 95),
(11, '2024-03-07 03:30:00', 97),
(12, '2024-03-07 04:15:00', 98),
(13, '2024-03-07 04:45:00', 99),
(14, '2024-03-07 05:00:00', 98),
(15, '2024-03-07 06:00:00', 96),
(16, '2024-03-07 06:30:00', 97),
(17, '2024-03-07 06:45:00', 98),
(18, '2024-03-07 07:00:00', 95),
(19, '2024-03-07 07:30:00', 96),
(20, '2024-03-07 08:00:00', 97),
(21, '2024-03-07 23:45:00', 98),
(22, '2024-03-07 22:30:00', 99),
(23, '2024-03-08 00:15:00', 97),
(24, '2024-03-08 01:30:00', 98),
(25, '2024-03-08 02:45:00', 96),
(26, '2024-03-08 03:45:00', 95),
(27, '2024-03-08 05:00:00', 97),
(28, '2024-03-08 06:15:00', 98),
(29, '2024-03-08 07:30:00', 99),
(30, '2024-03-08 08:45:00', 98),
(31, '2024-03-08 10:00:00', 96),
(32, '2024-03-08 11:15:00', 97),
(33, '2024-03-08 12:30:00', 98),
(34, '2024-03-08 13:45:00', 95),
(35, '2024-03-08 15:00:00', 96),
(36, '2024-03-08 16:15:00', 97),
(37, '2024-03-08 17:30:00', 98),
(38, '2024-03-08 18:45:00', 99),
(39, '2024-03-08 20:00:00', 98),
(40, '2024-03-08 21:15:00', 96),
(41, '2024-03-07 02:00:00', 98),
(42, '2024-03-07 01:45:00', 99),
(43, '2024-03-07 02:30:00', 99),
(44, '2024-03-07 04:00:00', 97),
(45, '2024-03-06 17:00:00', 98);

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `ExerciseID` int(11) NOT NULL,
  `ExerciseTypeID` int(11) NOT NULL,
  `ExerciseName` varchar(30) NOT NULL,
  `Equipment` enum('Yes','No') NOT NULL,
  `Difficulty` enum('easy','medium','hard','advanced') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`ExerciseID`, `ExerciseTypeID`, `ExerciseName`, `Equipment`, `Difficulty`) VALUES
(1, 1, 'Morning Run', 'No', 'medium'),
(2, 2, 'Freestyle Swimming', 'No', 'hard'),
(3, 3, 'Stationary Bike', 'Yes', 'easy'),
(4, 4, 'Dumbbell Squats', 'Yes', 'medium'),
(5, 5, 'Vinyasa Flow Yoga', 'Yes', 'medium'),
(6, 6, 'Mat Pilates', 'Yes', 'easy'),
(7, 7, 'Tabata Workout', 'No', 'hard'),
(8, 8, 'Deadlifts', 'Yes', 'advanced'),
(9, 9, 'Boxing Training', 'Yes', 'medium'),
(10, 10, 'Brisk Walk', 'No', 'easy'),
(11, 11, 'Rowing Machine', 'Yes', 'hard'),
(12, 12, 'Circuit Training', 'Yes', 'medium'),
(13, 13, 'Zumba Dance', 'No', 'medium'),
(14, 14, 'Karate', 'No', 'hard'),
(15, 15, 'Trail Hike', 'No', 'medium'),
(16, 16, 'Indoor Rock Climbing', 'Yes', 'advanced'),
(17, 17, 'Jump Rope', 'Yes', 'medium'),
(18, 18, 'Jackknife', 'No', 'medium'),
(19, 19, 'Downhill Skiing', 'Yes', 'hard'),
(20, 20, 'Snowboarding Tricks', 'Yes', 'hard'),
(21, 21, 'Sleeping', 'No', 'easy');

-- --------------------------------------------------------

--
-- Table structure for table `exercisetype`
--

CREATE TABLE `exercisetype` (
  `ExerciseTypeID` int(11) NOT NULL,
  `ExerciseCategory` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercisetype`
--

INSERT INTO `exercisetype` (`ExerciseTypeID`, `ExerciseCategory`) VALUES
(1, 'Running'),
(2, 'Swimming'),
(3, 'Cycling'),
(4, 'Weightlifting'),
(5, 'Yoga'),
(6, 'Pilates'),
(7, 'HIIT'),
(8, 'CrossFit'),
(9, 'Boxing'),
(10, 'Walking'),
(11, 'Rowing'),
(12, 'Circuit Training'),
(13, 'Dancing'),
(14, 'Martial Arts'),
(15, 'Hiking'),
(16, 'Rock Climbing'),
(17, 'Jump Rope'),
(18, 'Jackknife'),
(19, 'Skiing'),
(20, 'Snowboarding'),
(21, 'Sleep');

-- --------------------------------------------------------

--
-- Table structure for table `heartrate`
--

CREATE TABLE `heartrate` (
  `HeartRateID` int(11) NOT NULL,
  `UserExerciseID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `HeartRateValue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `heartrate`
--

INSERT INTO `heartrate` (`HeartRateID`, `UserExerciseID`, `UserID`, `TimeStamp`, `HeartRateValue`) VALUES
(1, 1, NULL, '2024-03-06 22:30:00', 75),
(2, 2, NULL, '2024-03-06 23:15:00', 80),
(3, 3, NULL, '2024-03-06 23:30:00', 78),
(4, 4, NULL, '2024-03-07 00:15:00', 82),
(5, 5, NULL, '2024-03-07 00:30:00', 85),
(6, 6, NULL, '2024-03-07 01:00:00', 90),
(7, 7, NULL, '2024-03-07 01:30:00', 88),
(8, 8, NULL, '2024-03-07 02:15:00', 86),
(9, 9, NULL, '2024-03-07 02:30:00', 84),
(10, 10, NULL, '2024-03-07 03:15:00', 87),
(11, 11, NULL, '2024-03-07 03:30:00', 92),
(12, 12, NULL, '2024-03-07 04:15:00', 95),
(13, 13, NULL, '2024-03-07 04:45:00', 98),
(14, 14, NULL, '2024-03-07 05:00:00', 96),
(15, 15, NULL, '2024-03-07 06:00:00', 94),
(16, 16, NULL, '2024-03-07 06:30:00', 91),
(17, 17, NULL, '2024-03-07 06:45:00', 89),
(18, 18, NULL, '2024-03-07 07:00:00', 87),
(19, 19, NULL, '2024-03-07 07:30:00', 85),
(20, 20, NULL, '2024-03-07 08:00:00', 83),
(21, 21, NULL, '2024-03-07 21:00:00', 88),
(22, 22, NULL, '2024-03-07 21:15:00', 92),
(23, 23, NULL, '2024-03-07 21:30:00', 94),
(24, 24, NULL, '2024-03-07 21:45:00', 90),
(25, 25, NULL, '2024-03-07 22:00:00', 85),
(26, 26, NULL, '2024-03-07 22:15:00', 87),
(27, 27, NULL, '2024-03-07 22:30:00', 91),
(28, 28, NULL, '2024-03-07 22:45:00', 95),
(29, 29, NULL, '2024-03-07 23:00:00', 98),
(30, 30, NULL, '2024-03-07 23:15:00', 96),
(31, 31, NULL, '2024-03-07 23:30:00', 93),
(32, 32, NULL, '2024-03-07 23:45:00', 89),
(33, 33, NULL, '2024-03-08 00:00:00', 86),
(34, 34, NULL, '2024-03-08 00:15:00', 84),
(35, 35, NULL, '2024-03-08 00:30:00', 82),
(36, 36, NULL, '2024-03-08 00:45:00', 80),
(37, 37, NULL, '2024-03-08 01:00:00', 78),
(38, 38, NULL, '2024-03-08 01:15:00', 76),
(39, 39, NULL, '2024-03-08 01:30:00', 79),
(40, 40, NULL, '2024-03-08 01:45:00', 81),
(41, 41, NULL, '2024-03-08 02:00:00', 82),
(42, 42, NULL, '2024-03-08 01:45:00', 90),
(43, 43, NULL, '2024-03-08 02:30:00', 84),
(44, 44, NULL, '2024-03-08 04:00:00', 87),
(45, 45, NULL, '2024-03-07 17:00:00', 81),
(46, NULL, 1, '2024-03-07 00:30:00', 100),
(47, NULL, 2, '2024-03-07 01:45:00', 90),
(48, 1, NULL, '2024-03-06 22:10:00', 88),
(49, NULL, 4, '2024-03-07 04:30:00', 101),
(50, NULL, 5, '2024-03-07 06:45:00', 111);

-- --------------------------------------------------------

--
-- Table structure for table `menuaccessed`
--

CREATE TABLE `menuaccessed` (
  `MenuActivityID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `MenuName` varchar(20) NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `duration` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuaccessed`
--

INSERT INTO `menuaccessed` (`MenuActivityID`, `UserID`, `MenuName`, `StartTime`, `duration`) VALUES
(1, 1, 'User profile', '2024-03-07 02:00:00', '00:10:00'),
(2, 2, 'Settings', '2024-03-20 03:00:00', '00:02:00'),
(3, 3, 'Home', '2024-03-21 04:00:00', '00:00:30'),
(4, 4, 'Workouts', '2024-03-19 02:00:00', '01:00:00'),
(5, 5, 'Statistics', '2024-03-16 05:30:00', '00:04:00'),
(6, 6, 'Workout History', '2024-03-14 07:45:00', '00:15:00'),
(7, 7, 'Badges', '2024-03-13 09:55:00', '00:03:00'),
(8, 8, 'Feedback', '2024-03-11 00:05:00', '00:15:00'),
(9, 9, 'Support', '2024-02-29 16:02:00', '00:30:00'),
(10, 10, 'Together', '2024-03-05 16:25:00', '01:30:00'),
(11, 11, 'Badges', '2024-03-07 15:20:50', '00:10:00'),
(12, 12, 'Weekly summary', '2024-03-17 16:00:50', '00:05:00'),
(13, 13, 'Statistics', '2024-03-27 11:00:00', '00:00:20'),
(14, 14, 'For you page', '2024-03-30 02:09:00', '00:00:10'),
(15, 15, 'Terms and conditions', '2024-03-23 03:19:10', '00:00:01'),
(16, 16, 'Privacy', '2024-03-21 17:02:13', '00:00:10'),
(17, 17, 'Events', '2024-03-01 17:02:03', '00:00:45'),
(18, 18, 'User profile', '2024-03-02 16:01:01', '00:01:30'),
(19, 19, 'Notices', '2024-03-11 01:49:00', '00:00:30'),
(20, 20, 'Settings', '2024-03-21 12:29:00', '00:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchasewatchface`
--

CREATE TABLE `purchasewatchface` (
  `UserID` int(11) NOT NULL,
  `WatchfaceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchasewatchface`
--

INSERT INTO `purchasewatchface` (`UserID`, `WatchfaceID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 7),
(2, 1),
(2, 2),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 4),
(4, 7),
(5, 5),
(6, 1),
(6, 2),
(6, 6),
(7, 3),
(7, 7),
(8, 1),
(8, 8),
(9, 2),
(9, 9),
(10, 3),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 1),
(14, 14),
(15, 2),
(15, 15),
(16, 3),
(16, 16),
(17, 1),
(17, 17),
(18, 2),
(18, 18),
(19, 3),
(19, 19),
(20, 1),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `sleep`
--

CREATE TABLE `sleep` (
  `SleepID` int(11) NOT NULL,
  `UserExerciseID` int(11) DEFAULT NULL,
  `TimeWindow` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SleepType` enum('Light sleep','Deep sleep','REM sleep') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sleep`
--

INSERT INTO `sleep` (`SleepID`, `UserExerciseID`, `TimeWindow`, `SleepType`) VALUES
(1, 21, '2024-03-07 14:00:00', 'Light sleep'),
(2, 21, '2024-03-07 15:30:00', 'Deep sleep'),
(3, 21, '2024-03-07 17:30:00', 'REM sleep'),
(4, 22, '2024-03-07 14:15:00', 'Light sleep'),
(5, 22, '2024-03-07 15:45:00', 'Deep sleep'),
(6, 22, '2024-03-07 17:45:00', 'REM sleep'),
(7, 23, '2024-03-07 14:30:00', 'Light sleep'),
(8, 23, '2024-03-07 16:00:00', 'Deep sleep'),
(9, 23, '2024-03-07 18:00:00', 'REM sleep'),
(10, 24, '2024-03-07 14:45:00', 'Light sleep'),
(11, 24, '2024-03-07 16:15:00', 'Deep sleep'),
(12, 24, '2024-03-07 18:15:00', 'REM sleep'),
(13, 25, '2024-03-07 15:00:00', 'Light sleep'),
(14, 25, '2024-03-07 16:30:00', 'Deep sleep'),
(15, 25, '2024-03-07 18:30:00', 'REM sleep'),
(16, 26, '2024-03-07 15:15:00', 'Light sleep'),
(17, 26, '2024-03-07 16:45:00', 'Deep sleep'),
(18, 26, '2024-03-07 18:45:00', 'REM sleep'),
(19, 27, '2024-03-07 15:30:00', 'Light sleep'),
(20, 27, '2024-03-07 17:00:00', 'Deep sleep'),
(21, 27, '2024-03-07 19:00:00', 'REM sleep'),
(22, 28, '2024-03-07 15:45:00', 'Light sleep'),
(23, 28, '2024-03-07 17:15:00', 'Deep sleep'),
(24, 28, '2024-03-07 19:15:00', 'REM sleep'),
(25, 29, '2024-03-07 16:00:00', 'Light sleep'),
(26, 29, '2024-03-07 17:30:00', 'Deep sleep'),
(27, 29, '2024-03-07 19:30:00', 'REM sleep'),
(28, 30, '2024-03-07 16:15:00', 'Light sleep'),
(29, 30, '2024-03-07 17:45:00', 'Deep sleep'),
(30, 30, '2024-03-07 19:45:00', 'REM sleep'),
(31, 31, '2024-03-07 16:30:00', 'Light sleep'),
(32, 31, '2024-03-07 18:00:00', 'Deep sleep'),
(33, 31, '2024-03-07 20:00:00', 'REM sleep'),
(34, 32, '2024-03-07 16:45:00', 'Light sleep'),
(35, 32, '2024-03-07 18:15:00', 'Deep sleep'),
(36, 32, '2024-03-07 20:15:00', 'REM sleep'),
(37, 33, '2024-03-07 17:00:00', 'Light sleep'),
(38, 33, '2024-03-07 18:30:00', 'Deep sleep'),
(39, 33, '2024-03-07 20:30:00', 'REM sleep'),
(40, 34, '2024-03-07 17:15:00', 'Light sleep'),
(41, 34, '2024-03-07 18:45:00', 'Deep sleep'),
(42, 34, '2024-03-07 20:45:00', 'REM sleep'),
(43, 35, '2024-03-07 17:30:00', 'Light sleep'),
(44, 35, '2024-03-07 19:00:00', 'Deep sleep'),
(45, 35, '2024-03-07 21:00:00', 'REM sleep'),
(46, 36, '2024-03-07 17:45:00', 'Light sleep'),
(47, 36, '2024-03-07 19:15:00', 'Deep sleep'),
(48, 36, '2024-03-07 21:15:00', 'REM sleep'),
(49, 37, '2024-03-07 18:00:00', 'Light sleep'),
(50, 37, '2024-03-07 19:30:00', 'Deep sleep'),
(51, 37, '2024-03-07 21:30:00', 'REM sleep'),
(52, 38, '2024-03-07 18:15:00', 'Light sleep'),
(53, 38, '2024-03-07 19:45:00', 'Deep sleep'),
(54, 38, '2024-03-07 21:45:00', 'REM sleep'),
(55, 39, '2024-03-07 18:30:00', 'Light sleep'),
(56, 39, '2024-03-07 20:00:00', 'Deep sleep'),
(57, 39, '2024-03-07 22:00:00', 'REM sleep'),
(58, 40, '2024-03-07 18:45:00', 'Light sleep'),
(59, 40, '2024-03-07 20:15:00', 'Deep sleep'),
(60, 40, '2024-03-07 22:15:00', 'REM sleep');

-- --------------------------------------------------------

--
-- Table structure for table `stepcount`
--

CREATE TABLE `stepcount` (
  `StepCountID` int(11) NOT NULL,
  `ExerciseID` int(11) NOT NULL,
  `StepCount` int(11) NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `EndTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stepcount`
--

INSERT INTO `stepcount` (`StepCountID`, `ExerciseID`, `StepCount`, `StartTime`, `EndTime`) VALUES
(1, 1, 3949, '2024-03-07 00:00:00', '2024-03-07 00:30:00'),
(2, 2, 1900, '2024-03-07 01:15:00', '2024-03-07 02:00:00'),
(3, 3, 3400, '2024-03-07 05:45:00', '2024-03-07 07:00:00'),
(4, 4, 4200, '2024-03-07 04:15:00', '2024-03-07 05:45:00'),
(5, 5, 2700, '2024-03-07 06:00:00', '2024-03-07 07:15:00'),
(6, 6, 3850, '2024-03-07 07:30:00', '2024-03-07 08:45:00'),
(7, 7, 2150, '2024-03-07 09:00:00', '2024-03-07 10:15:00'),
(8, 8, 4900, '2024-03-07 10:30:00', '2024-03-07 11:45:00'),
(9, 9, 3700, '2024-03-07 12:00:00', '2024-03-07 13:15:00'),
(10, 10, 2800, '2024-03-07 13:30:00', '2024-03-07 14:45:00'),
(11, 11, 4200, '2024-03-07 15:00:00', '2024-03-07 16:15:00'),
(12, 12, 3100, '2024-03-07 16:30:00', '2024-03-07 17:45:00'),
(13, 13, 3600, '2024-03-07 18:00:00', '2024-03-07 19:15:00'),
(14, 14, 2450, '2024-03-07 19:30:00', '2024-03-07 20:45:00'),
(15, 15, 4100, '2024-03-07 21:00:00', '2024-03-07 22:15:00'),
(16, 16, 3300, '2024-03-07 22:30:00', '2024-03-07 23:45:00'),
(17, 17, 2800, '2024-03-08 00:00:00', '2024-03-08 01:15:00'),
(18, 18, 3900, '2024-03-08 01:30:00', '2024-03-08 02:45:00'),
(19, 19, 4550, '2024-03-08 03:00:00', '2024-03-08 04:15:00'),
(20, 20, 2950, '2024-03-08 04:30:00', '2024-03-08 05:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `userexercise`
--

CREATE TABLE `userexercise` (
  `UserExerciseID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ExerciseID` int(11) NOT NULL,
  `OxygenLevelID` int(11) NOT NULL,
  `CalorieBurnt` int(11) NOT NULL,
  `DistanceTravelled` int(11) DEFAULT NULL,
  `StartTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EndTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userexercise`
--

INSERT INTO `userexercise` (`UserExerciseID`, `UserID`, `ExerciseID`, `OxygenLevelID`, `CalorieBurnt`, `DistanceTravelled`, `StartTime`, `EndTime`) VALUES
(1, 1, 1, 1, 400, 5000, '2024-03-06 22:00:00', '2024-03-06 22:30:00'),
(2, 2, 2, 2, 263, 1500, '2024-03-06 22:30:00', '2024-03-06 23:15:00'),
(3, 3, 3, 3, 210, 10000, '2024-03-06 23:00:00', '2024-03-06 23:30:00'),
(4, 4, 4, 4, 131, 8000, '2024-03-06 23:30:00', '2024-03-07 00:15:00'),
(5, 5, 5, 5, 105, 6000, '2024-03-07 00:00:00', '2024-03-07 00:30:00'),
(6, 6, 6, 6, 123, 2000, '2024-03-07 00:30:00', '2024-03-07 01:00:00'),
(7, 7, 7, 7, 225, 3000, '2024-03-07 01:00:00', '2024-03-07 01:30:00'),
(8, 8, 8, 8, 263, 4000, '2024-03-07 01:30:00', '2024-03-07 02:15:00'),
(9, 9, 9, 9, 140, 7000, '2024-03-07 02:00:00', '2024-03-07 02:30:00'),
(10, 10, 10, 10, 220, 5500, '2024-03-07 02:30:00', '2024-03-07 03:15:00'),
(11, 11, 11, 11, 180, 9000, '2024-03-07 03:00:00', '2024-03-07 03:30:00'),
(12, 12, 12, 12, 263, 7500, '2024-03-07 03:30:00', '2024-03-07 04:15:00'),
(13, 13, 13, 13, 175, 8500, '2024-03-07 04:00:00', '2024-03-07 04:45:00'),
(14, 14, 14, 14, 188, 4200, '2024-03-07 04:30:00', '2024-03-07 05:00:00'),
(15, 15, 15, 15, 420, 6300, '2024-03-07 05:00:00', '2024-03-07 06:00:00'),
(16, 16, 16, 16, 560, 7800, '2024-03-07 05:30:00', '2024-03-07 06:30:00'),
(17, 17, 17, 17, 540, 5700, '2024-03-07 06:00:00', '2024-03-07 06:45:00'),
(18, 18, 18, 18, 105, 4900, '2024-03-07 06:30:00', '2024-03-07 07:00:00'),
(19, 19, 19, 19, 420, 8200, '2024-03-07 07:00:00', '2024-03-07 07:30:00'),
(20, 20, 20, 20, 315, 6800, '2024-03-07 07:30:00', '2024-03-07 08:00:00'),
(21, 1, 21, 21, 400, 0, '2024-03-07 13:00:00', '2024-03-07 21:00:00'),
(22, 2, 21, 22, 400, 0, '2024-03-23 10:04:21', '2024-03-07 21:15:00'),
(23, 3, 21, 23, 400, 0, '2024-03-23 10:04:21', '2024-03-07 21:30:00'),
(24, 4, 21, 24, 400, 0, '2024-03-23 10:04:21', '2024-03-07 21:45:00'),
(25, 5, 21, 25, 400, 0, '2024-03-23 10:04:21', '2024-03-07 22:00:00'),
(26, 6, 21, 26, 400, 0, '2024-03-23 10:04:21', '2024-03-07 22:15:00'),
(27, 7, 21, 27, 400, 0, '2024-03-23 10:04:21', '2024-03-07 22:30:00'),
(28, 8, 21, 28, 400, 0, '2024-03-23 10:04:21', '2024-03-07 22:45:00'),
(29, 9, 21, 29, 400, 0, '2024-03-23 10:04:21', '2024-03-07 23:00:00'),
(30, 10, 21, 30, 400, 0, '2024-03-23 10:04:21', '2024-03-07 23:15:00'),
(31, 11, 21, 31, 400, 0, '2024-03-23 10:04:21', '2024-03-07 23:30:00'),
(32, 12, 21, 32, 400, 0, '2024-03-23 10:04:21', '2024-03-07 23:45:00'),
(33, 13, 21, 33, 400, 0, '2024-03-23 10:04:21', '2024-03-08 00:00:00'),
(34, 14, 21, 34, 400, 0, '2024-03-23 10:04:21', '2024-03-08 00:15:00'),
(35, 15, 21, 35, 400, 0, '2024-03-23 10:04:21', '2024-03-08 00:30:00'),
(36, 16, 21, 36, 400, 0, '2024-03-23 10:04:21', '2024-03-08 00:45:00'),
(37, 17, 21, 37, 400, 0, '2024-03-23 10:04:21', '2024-03-08 01:00:00'),
(38, 18, 21, 38, 400, 0, '2024-03-23 10:04:21', '2024-03-08 01:15:00'),
(39, 19, 21, 39, 400, 0, '2024-03-23 10:04:21', '2024-03-08 01:30:00'),
(40, 20, 21, 40, 400, 0, '2024-03-23 10:04:21', '2024-03-08 01:45:00'),
(41, 5, 9, 41, 231, 0, '2024-03-08 01:00:00', '2024-03-08 02:00:00'),
(42, 6, 4, 42, 211, 0, '2024-03-08 01:15:00', '2024-03-08 01:45:00'),
(43, 8, 9, 43, 228, 0, '2024-03-08 02:00:00', '2024-03-08 02:30:00'),
(44, 11, 8, 44, 230, 0, '2024-03-08 03:15:00', '2024-03-08 04:00:00'),
(45, 12, 9, 45, 225, 0, '2024-03-08 04:00:00', '2024-03-07 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userhistory`
--

CREATE TABLE `userhistory` (
  `LogID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `LastLoginDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userhistory`
--

INSERT INTO `userhistory` (`LogID`, `UserID`, `LastLoginDate`) VALUES
(1, 1, '2024-03-07'),
(2, 2, '2024-03-07'),
(3, 3, '2024-03-07'),
(4, 4, '2024-03-07'),
(5, 5, '2024-03-07'),
(6, 6, '2024-03-07'),
(7, 7, '2024-03-07'),
(8, 8, '2024-03-07'),
(9, 9, '2024-03-07'),
(10, 10, '2024-03-07'),
(11, 11, '2024-03-07'),
(12, 12, '2024-03-07'),
(13, 13, '2024-03-07'),
(14, 14, '2024-03-07'),
(15, 15, '2024-03-07'),
(16, 16, '2024-03-07'),
(17, 17, '2024-03-07'),
(18, 18, '2024-03-07'),
(19, 19, '2024-03-07'),
(20, 20, '2024-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `userpreference`
--

CREATE TABLE `userpreference` (
  `UserPreferenceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `WatchfaceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpreference`
--

INSERT INTO `userpreference` (`UserPreferenceID`, `UserID`, `WatchfaceID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Nickname` varchar(20) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Height` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `userSource` enum('Original','BrandX','PostMerge') DEFAULT 'PostMerge'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Nickname`, `Gender`, `Height`, `Weight`, `Birthday`, `Email`, `Password`, `PhoneNumber`, `userSource`) VALUES
(1, 'Mario', 'Male', 155, 70, '1985-09-13', 'mario@gmail.com', '1upmushroom', '+60123456789', 'Original'),
(2, 'Zelda', 'Female', 165, 55, '1986-02-21', 'zelda@hotmail.com', 'triforce', '+60198765432', 'Original'),
(3, 'MasterChief', 'Male', 190, 90, '2000-03-07', 'masterchief@outlook.com', 'halo123', '+60111223344', 'Original'),
(4, 'LaraCroft', 'Female', 175, 65, '1996-10-25', 'lara.croft@yahoo.com', 'tombraider', '+60195428763', 'Original'),
(5, 'Sonic', 'Male', 100, 35, '1991-06-23', 'sonic@gmail.com', 'gottagofast', '+60135579246', 'Original'),
(6, 'Samus', 'Female', 185, 80, '1986-08-06', 'samus@live.com', 'metroid123', '+60176813429', 'Original'),
(7, 'Link', 'Male', 170, 75, '1986-02-21', 'link@yahoomail.com', 'hyrule', '+60104467823', 'Original'),
(8, 'Kratos', 'Male', 180, 100, '2005-03-22', 'kratos@outlook.com', 'spartan', '+60112345678', 'Original'),
(9, 'NathanDrake', 'Male', 178, 80, '2007-11-19', 'nathan.drake@gmail.com', 'uncharted', '+60123456789', 'Original'),
(10, 'ChunLi', 'Female', 165, 55, '1991-02-14', 'chun.li@hotmail.com', 'spinningbirdkick', '+60134567890', 'Original'),
(11, 'Snake', 'Male', 180, 80, '1987-07-12', 'snake@outlook.com', 'solid', '+60167892345', 'Original'),
(12, 'Pikachu', 'Male', 40, 6, '1996-02-27', 'pikachu@yahoo.com', 'pika', '+60189043276', 'Original'),
(13, 'Yoshi', 'Male', 100, 50, '1990-08-14', 'yoshi@gmail.com', 'eggs', '+60122334567', 'Original'),
(14, 'Cloud', 'Male', 173, 70, '1997-01-31', 'cloud@hotmail.com', 'buster', '+60111223344', 'Original'),
(15, 'PrincessPeach', 'Female', 165, 60, '1985-09-13', 'peach@live.com', 'mushroomkingdom', '+60192384756', 'Original'),
(16, 'Squall', 'Male', 175, 70, '1999-02-11', 'squall@outlook.com', 'lionheart', '+60176543210', 'Original'),
(17, 'Aloy', 'Female', 170, 60, '2017-02-28', 'aloy@gmail.com', 'horizon', '+60121234567', 'Original'),
(18, 'Ezio', 'Male', 180, 75, '2007-11-17', 'ezio@yahoo.com', 'assassino', '+60134567890', 'Original'),
(19, 'Bayonetta', 'Female', 180, 70, '2009-10-29', 'bayonetta@outlook.com', 'umbra', '+60178901234', 'Original'),
(20, 'Doomguy', 'Male', 190, 95, '1993-12-10', 'doomguy@gmail.com', 'ripandtear', '+60109876543', 'Original'),
(21, 'Bowser', 'Male', 200, 500, '1985-09-13', 'bowser@gmail.com', 'koopaking', '+60121234567', 'BrandX'),
(22, 'Chell', 'Female', 170, 60, '1985-02-14', 'chell@gmail.com', 'portalgun', '+60132345678', 'BrandX'),
(23, 'Dovahkiin', 'Male', 180, 80, '1986-08-06', 'dovahkiin@gmail.com', 'fusrodah', '+60143456789', 'BrandX'),
(24, 'EzioAuditore', 'Male', 180, 75, '2007-11-17', 'ezio.auditore@gmail.com', 'assassino', '+60154567890', 'BrandX'),
(25, 'IsaacClarke', 'Male', 185, 85, '1984-03-22', 'isaac@gmail.com', 'deadsp4ce', '+60165678901', 'BrandX'),
(26, 'JillValentine', 'Female', 170, 60, '1979-06-28', 'jill@rpd.com', 'stars', '+60176789012', 'BrandX'),
(27, 'Kerrigan', 'Female', 180, 65, '1988-11-03', 'kerrigan@outlook.com', 'queenofblades', '+60187890123', 'BrandX'),
(28, 'MaxCaulfield', 'Female', 165, 55, '1995-09-21', 'max@hotmail.com', 'timepower', '+60198901234', 'BrandX'),
(29, 'NathanDrake', 'Male', 178, 80, '2007-11-19', 'nathan.drake@outlook.com', 'uncharted', '+60101012345', 'BrandX'),
(30, 'PhoenixWright', 'Male', 180, 75, '1976-10-04', 'phoenix@yahoo.com', 'objection', '+60111223456', 'BrandX'),
(31, 'Cortana', 'Female', 170, 55, '2002-10-20', 'cortana@hotmail.com', 'haloAI', '+60135579246', 'PostMerge');

-- --------------------------------------------------------

--
-- Table structure for table `watchface`
--

CREATE TABLE `watchface` (
  `WatchfaceID` int(11) NOT NULL,
  `WatchfaceName` varchar(50) NOT NULL,
  `WatchfaceColour` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchface`
--

INSERT INTO `watchface` (`WatchfaceID`, `WatchfaceName`, `WatchfaceColour`) VALUES
(1, 'Digital Green', 'Green'),
(2, 'Analog Blue', 'Blue'),
(3, 'Sporty Red', 'Red'),
(4, 'Elegant Gold', 'Gold'),
(5, 'Classic Black', 'Black'),
(6, 'Modern Silver', 'Silver'),
(7, 'Hazy Purple', 'Purple'),
(8, 'Minimalist White', 'White'),
(9, 'Ocean Blue', 'Blue'),
(10, 'Sunset Orange', 'Orange'),
(11, 'Glowing Yellow', 'Yellow'),
(12, 'Pastel Pink', 'Pink'),
(13, 'Midnight Navy', 'Navy'),
(14, 'Forest Green', 'Green'),
(15, 'Desert Sand', 'Sand'),
(16, 'Retro Brown', 'Brown'),
(17, 'Neon Pink', 'Pink'),
(18, 'Chrome Grey', 'Grey'),
(19, 'Sky Blue', 'Blue'),
(20, 'Sunshine Yellow', 'Yellow');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alarms`
--
ALTER TABLE `alarms`
  ADD PRIMARY KEY (`AlarmID`),
  ADD KEY `Alarms_User` (`UserID`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`BadgeID`);

--
-- Indexes for table `badgesunlocked`
--
ALTER TABLE `badgesunlocked`
  ADD PRIMARY KEY (`UserID`,`BadgesID`),
  ADD KEY `BadgesUnlocked_Badges` (`BadgesID`);

--
-- Indexes for table `bloodoxygenlevel`
--
ALTER TABLE `bloodoxygenlevel`
  ADD PRIMARY KEY (`OxygenLevelID`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`ExerciseID`),
  ADD KEY `Exercises_ExerciseType` (`ExerciseTypeID`);

--
-- Indexes for table `exercisetype`
--
ALTER TABLE `exercisetype`
  ADD PRIMARY KEY (`ExerciseTypeID`);

--
-- Indexes for table `heartrate`
--
ALTER TABLE `heartrate`
  ADD PRIMARY KEY (`HeartRateID`),
  ADD KEY `HeartRate_UserExercise` (`UserExerciseID`),
  ADD KEY `HeartRate_Users` (`UserID`);

--
-- Indexes for table `menuaccessed`
--
ALTER TABLE `menuaccessed`
  ADD PRIMARY KEY (`MenuActivityID`),
  ADD KEY `MenuAccessed_User` (`UserID`);

--
-- Indexes for table `purchasewatchface`
--
ALTER TABLE `purchasewatchface`
  ADD PRIMARY KEY (`UserID`,`WatchfaceID`),
  ADD KEY `PurchaseWatchFace_WatchFace` (`WatchfaceID`);

--
-- Indexes for table `sleep`
--
ALTER TABLE `sleep`
  ADD PRIMARY KEY (`SleepID`),
  ADD KEY `Sleep_UserExercise` (`UserExerciseID`);

--
-- Indexes for table `stepcount`
--
ALTER TABLE `stepcount`
  ADD PRIMARY KEY (`StepCountID`),
  ADD KEY `StepCount_Exercises` (`ExerciseID`);

--
-- Indexes for table `userexercise`
--
ALTER TABLE `userexercise`
  ADD PRIMARY KEY (`UserExerciseID`),
  ADD KEY `UserExercise_BloodOxygenLevel` (`OxygenLevelID`),
  ADD KEY `UserExercise_Exercises` (`ExerciseID`),
  ADD KEY `fk_UserExercise_UserID` (`UserID`);

--
-- Indexes for table `userhistory`
--
ALTER TABLE `userhistory`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `UserHistory_UserID` (`UserID`);

--
-- Indexes for table `userpreference`
--
ALTER TABLE `userpreference`
  ADD PRIMARY KEY (`UserPreferenceID`),
  ADD KEY `UserPreference_User` (`UserID`),
  ADD KEY `UserPreference_WatchFace` (`WatchfaceID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `watchface`
--
ALTER TABLE `watchface`
  ADD PRIMARY KEY (`WatchfaceID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alarms`
--
ALTER TABLE `alarms`
  MODIFY `AlarmID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `BadgeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bloodoxygenlevel`
--
ALTER TABLE `bloodoxygenlevel`
  MODIFY `OxygenLevelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `ExerciseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `exercisetype`
--
ALTER TABLE `exercisetype`
  MODIFY `ExerciseTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `heartrate`
--
ALTER TABLE `heartrate`
  MODIFY `HeartRateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `menuaccessed`
--
ALTER TABLE `menuaccessed`
  MODIFY `MenuActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sleep`
--
ALTER TABLE `sleep`
  MODIFY `SleepID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `stepcount`
--
ALTER TABLE `stepcount`
  MODIFY `StepCountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `userexercise`
--
ALTER TABLE `userexercise`
  MODIFY `UserExerciseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `userhistory`
--
ALTER TABLE `userhistory`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `userpreference`
--
ALTER TABLE `userpreference`
  MODIFY `UserPreferenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `watchface`
--
ALTER TABLE `watchface`
  MODIFY `WatchfaceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alarms`
--
ALTER TABLE `alarms`
  ADD CONSTRAINT `Alarms_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `badgesunlocked`
--
ALTER TABLE `badgesunlocked`
  ADD CONSTRAINT `BadgesUnlocked_Badges` FOREIGN KEY (`BadgesID`) REFERENCES `badges` (`BadgeID`),
  ADD CONSTRAINT `BadgesUnlocked_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `Exercises_ExerciseType` FOREIGN KEY (`ExerciseTypeID`) REFERENCES `exercisetype` (`ExerciseTypeID`);

--
-- Constraints for table `heartrate`
--
ALTER TABLE `heartrate`
  ADD CONSTRAINT `HeartRate_UserExercise` FOREIGN KEY (`UserExerciseID`) REFERENCES `userexercise` (`UserExerciseID`),
  ADD CONSTRAINT `HeartRate_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `menuaccessed`
--
ALTER TABLE `menuaccessed`
  ADD CONSTRAINT `MenuAccessed_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `purchasewatchface`
--
ALTER TABLE `purchasewatchface`
  ADD CONSTRAINT `PurchaseWatchFace_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `PurchaseWatchFace_WatchFace` FOREIGN KEY (`WatchfaceID`) REFERENCES `watchface` (`WatchfaceID`);

--
-- Constraints for table `sleep`
--
ALTER TABLE `sleep`
  ADD CONSTRAINT `Sleep_UserExercise` FOREIGN KEY (`UserExerciseID`) REFERENCES `userexercise` (`UserExerciseID`);

--
-- Constraints for table `stepcount`
--
ALTER TABLE `stepcount`
  ADD CONSTRAINT `StepCount_Exercises` FOREIGN KEY (`ExerciseID`) REFERENCES `exercises` (`ExerciseID`);

--
-- Constraints for table `userexercise`
--
ALTER TABLE `userexercise`
  ADD CONSTRAINT `UserExercise_BloodOxygenLevel` FOREIGN KEY (`OxygenLevelID`) REFERENCES `bloodoxygenlevel` (`OxygenLevelID`),
  ADD CONSTRAINT `UserExercise_Exercises` FOREIGN KEY (`ExerciseID`) REFERENCES `exercises` (`ExerciseID`),
  ADD CONSTRAINT `fk_UserExercise_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `userhistory`
--
ALTER TABLE `userhistory`
  ADD CONSTRAINT `UserHistory_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `userpreference`
--
ALTER TABLE `userpreference`
  ADD CONSTRAINT `UserPreference_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `UserPreference_WatchFace` FOREIGN KEY (`WatchfaceID`) REFERENCES `watchface` (`WatchfaceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
