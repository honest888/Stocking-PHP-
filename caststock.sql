-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 03:56 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caststock`
--

-- --------------------------------------------------------

--
-- Table structure for table `container_devan`
--

CREATE TABLE `container_devan` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `inbound_renban_air_freight_case_number` varchar(100) DEFAULT NULL,
  `shipping_line` varchar(100) DEFAULT NULL,
  `number_of_zr_modules` varchar(255) DEFAULT NULL,
  `container_number` varchar(100) DEFAULT NULL,
  `pentalver_instructions` varchar(100) DEFAULT NULL,
  `departure_inbound_renban` varchar(100) DEFAULT NULL,
  `departure_export_load_reference` varchar(100) DEFAULT NULL,
  `departure_shipping_line` varchar(100) DEFAULT NULL,
  `departure_container_number` varchar(100) DEFAULT NULL,
  `on_dock_inbound_renban` varchar(100) DEFAULT NULL,
  `on_dock_shipping_line` varchar(100) DEFAULT NULL,
  `on_doc_container_number` varchar(100) DEFAULT NULL,
  `in_house_instructions` varchar(100) DEFAULT NULL,
  `confirm_gl_tl_instructions_print_name` varchar(100) DEFAULT NULL,
  `confirm_gl_customs_check_print_name` varchar(100) DEFAULT NULL,
  `confirm_module_condition_quantity` varchar(100) DEFAULT NULL,
  `devan_inbound_renban_no_1` varchar(100) DEFAULT NULL,
  `devan_export_renban` varchar(100) DEFAULT NULL,
  `devan_shipping_line` varchar(100) DEFAULT NULL,
  `devan_zr` varchar(100) DEFAULT NULL,
  `pipcont_pipseal` varchar(255) DEFAULT NULL,
  `in_house_container_number` varchar(100) DEFAULT NULL,
  `expected_seal_no_yse_no` tinyint(1) DEFAULT 0,
  `expected_seal_no` text DEFAULT NULL,
  `deeside_yard_inbound_renban_no_1` varchar(100) DEFAULT NULL,
  `deeside_yard_tapped_modules_no_1` varchar(100) DEFAULT NULL,
  `deeside_yard_container_number_no_1` varchar(100) DEFAULT NULL,
  `deeside_yard_inbound_renban_no_2` varchar(100) DEFAULT NULL,
  `deeside_yard_tapped_modules_no_2` varchar(100) DEFAULT NULL,
  `deeside_yard_container_number_no_2` varchar(100) DEFAULT NULL,
  `deeside_yard_inbound_renban_no_3` varchar(100) DEFAULT NULL,
  `deeside_yard_tapped_modules_no_3` varchar(100) DEFAULT NULL,
  `deeside_yard_container_number_no_3` varchar(100) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `completed_by` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `revan_state` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `container_devan`
--

INSERT INTO `container_devan` (`id`, `date`, `shift`, `time`, `inbound_renban_air_freight_case_number`, `shipping_line`, `number_of_zr_modules`, `container_number`, `pentalver_instructions`, `departure_inbound_renban`, `departure_export_load_reference`, `departure_shipping_line`, `departure_container_number`, `on_dock_inbound_renban`, `on_dock_shipping_line`, `on_doc_container_number`, `in_house_instructions`, `confirm_gl_tl_instructions_print_name`, `confirm_gl_customs_check_print_name`, `confirm_module_condition_quantity`, `devan_inbound_renban_no_1`, `devan_export_renban`, `devan_shipping_line`, `devan_zr`, `pipcont_pipseal`, `in_house_container_number`, `expected_seal_no_yse_no`, `expected_seal_no`, `deeside_yard_inbound_renban_no_1`, `deeside_yard_tapped_modules_no_1`, `deeside_yard_container_number_no_1`, `deeside_yard_inbound_renban_no_2`, `deeside_yard_tapped_modules_no_2`, `deeside_yard_container_number_no_2`, `deeside_yard_inbound_renban_no_3`, `deeside_yard_tapped_modules_no_3`, `deeside_yard_container_number_no_3`, `approved_by`, `created_at`, `updated_at`, `is_completed`, `completed_by`, `completed_at`, `revan_state`) VALUES
(1, '2022-02-28', 'D', '07.30', 'P9739', 'MAERSK', NULL, 'TCKU7011440', 'Exchange & Shunt', 'P9737', NULL, 'MAERSK', 'MRSU3882716', 'P9738', 'MAERSK', 'MRSU4049330', 'Devan - Days', NULL, NULL, NULL, 'P9738', NULL, 'MAERSK', NULL, NULL, 'MRSU4049330', 0, '=IF(AZ27>0,VLOOKUP(AZ27,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9739', NULL, 'TCKU7011440', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(2, '2022-02-28', 'N', '20.30', 'P9740', 'MAERSK', NULL, 'BEAU5748137', 'Exchange & Shunt', 'P9738', NULL, 'MAERSK', 'MRSU4049330', 'P9739', 'MAERSK', 'TCKU7011440', 'Devan - Nights', NULL, NULL, NULL, 'P9739', NULL, 'MAERSK', NULL, NULL, 'TCKU7011440', 0, '=IF(AZ28>0,VLOOKUP(AZ28,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9740', NULL, 'BEAU5748137', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(3, '2022-03-01', 'D', '07.30', 'P9741', 'CMA', NULL, 'TLLU4656816', 'Exchange & Shunt', 'P9739', NULL, 'MAERSK', 'TCKU7011440', 'P9740', 'MAERSK', 'BEAU5748137', 'Devan - Days', NULL, NULL, NULL, 'P9740', NULL, 'MAERSK', NULL, NULL, 'BEAU5748137', 0, '=IF(AZ30>0,VLOOKUP(AZ30,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9741', NULL, 'TLLU4656816', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(4, '2022-03-01', 'N', '20.30', 'P9742', 'CMA', NULL, 'CMAU6937723', 'Exchange & Shunt', 'P9740', NULL, 'MAERSK', 'BEAU5748137', 'P9741', 'CMA', 'TLLU4656816', 'Devan - Nights', NULL, NULL, NULL, 'P9741', NULL, 'CMA', NULL, NULL, 'TLLU4656816', 0, '=IF(AZ31>0,VLOOKUP(AZ31,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9742', NULL, 'CMAU6937723', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(5, '2022-03-02', 'D', '07.30', 'P9743', 'CMA', NULL, 'TCNU4354883', 'Exchange & Shunt', 'P9741', NULL, 'CMA', 'TLLU4656816', 'P9742', 'CMA', 'CMAU6937723', 'Devan - Days', NULL, NULL, NULL, 'P9742', NULL, 'CMA', NULL, NULL, 'CMAU6937723', 0, '=IF(AZ33>0,VLOOKUP(AZ33,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9743', NULL, 'TCNU4354883', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(6, '2022-03-02', 'N', '0.85416666666667', 'P9744', 'CMA', NULL, 'FSCU8609498', 'Exchange & Shunt', 'P9742', NULL, 'CMA', 'CMAU6937723', 'P9743', 'CMA', 'TCNU4354883', 'Devan - Nights', NULL, NULL, NULL, 'P9743', NULL, 'CMA', NULL, NULL, 'TCNU4354883', 0, '=IF(AZ34>0,VLOOKUP(AZ34,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9744', NULL, 'FSCU8609498', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(7, '2022-03-03', 'D', '07.30', 'P9745', 'CMA', NULL, 'CMAU7387880', 'Exchange & Shunt', 'P9743', NULL, 'CMA', 'TCNU4354883', 'P9744', 'CMA', 'FSCU8609498', 'Devan - Days', NULL, NULL, NULL, 'P9744', NULL, 'CMA', NULL, NULL, 'FSCU8609498', 0, '=IF(AZ36>0,VLOOKUP(AZ36,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9745', NULL, 'CMAU7387880', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(8, '2022-03-03', 'N', '20.30', 'P9746', 'CMA', NULL, 'CAIU9162874', 'Exchange & Shunt', 'P9744', NULL, 'CMA', 'FSCU8609498', 'P9745', 'CMA', 'CMAU7387880', 'Devan - Nights', NULL, NULL, NULL, 'P9745', NULL, 'CMA', NULL, NULL, 'CMAU7387880', 0, '=IF(AZ37>0,VLOOKUP(AZ37,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9746', NULL, 'CAIU9162874', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(9, '2022-03-04', 'D', '07.30', 'P9747', 'MAERSK', NULL, 'MSKU1802618', 'Exchange & Shunt', 'P9745', NULL, 'CMA', 'CMAU7387880', 'P9746', 'CMA', 'CAIU9162874', 'Devan - Days', NULL, NULL, NULL, 'P9746', NULL, 'CMA', NULL, NULL, 'CAIU9162874', 0, '=IF(AZ39>0,VLOOKUP(AZ39,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9747', NULL, 'MSKU1802618', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(10, '2022-03-04', 'N', '18.00', 'P9748', 'MAERSK', NULL, 'TCKU7504848', 'Exchange & Shunt', 'P9746', NULL, 'CMA', 'CAIU9162874', 'P9747', 'MAERSK', 'MSKU1802618', 'Devan - Nights', NULL, NULL, NULL, 'P9747', NULL, 'MAERSK', NULL, NULL, 'MSKU1802618', 0, '=IF(AZ40>0,VLOOKUP(AZ40,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9748', NULL, 'TCKU7504848', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(11, '2022-03-07', 'D', '07.30', 'P9749', 'MAERSK', NULL, 'TGBU6846250', 'Exchange & Shunt', 'P9747', NULL, 'MAERSK', 'MSKU1802618', 'P9748', 'MAERSK', 'TCKU7504848', 'Devan - Days', NULL, NULL, NULL, 'P9748', NULL, 'MAERSK', NULL, NULL, 'TCKU7504848', 0, '=IF(AZ42>0,VLOOKUP(AZ42,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9749', NULL, 'TGBU6846250', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(12, '2022-03-07', 'N', '20.30', 'P9750', 'MAERSK', NULL, 'BSIU8057503', 'Exchange & Shunt', 'P9748', NULL, 'MAERSK', 'TCKU7504848', 'P9749', 'MAERSK', 'TGBU6846250', 'Devan - Nights', NULL, NULL, NULL, 'P9749', NULL, 'MAERSK', NULL, NULL, 'TGBU6846250', 0, '=IF(AZ43>0,VLOOKUP(AZ43,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9750', NULL, 'BSIU8057503', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(13, '2022-03-08', 'D', '07.30', 'P9751', 'MAERSK', NULL, 'TCKU6736005', 'Exchange & Shunt', 'P9749', NULL, 'MAERSK', 'TGBU6846250', 'P9750', 'MAERSK', 'BSIU8057503', 'Devan - Days', NULL, NULL, NULL, 'P9750', NULL, 'MAERSK', NULL, NULL, 'BSIU8057503', 0, '=IF(AZ45>0,VLOOKUP(AZ45,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9751', NULL, 'TCKU6736005', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(14, '2022-03-08', 'N', '20.30', 'P9752', 'CMA', NULL, 'CAIU9434334', 'Exchange & Shunt', 'P9750', NULL, 'MAERSK', 'BSIU8057503', 'P9751', 'MAERSK', 'TCKU6736005', 'Devan - Nights', NULL, NULL, NULL, 'P9751', NULL, 'MAERSK', NULL, NULL, 'TCKU6736005', 0, '=IF(AZ46>0,VLOOKUP(AZ46,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9752', NULL, 'CAIU9434334', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(15, '2022-03-09', 'D', '07.30', 'P9753', 'CMA', NULL, 'MAGU5702196', 'Exchange & Shunt', 'P9751', NULL, 'MAERSK', 'TCKU6736005', 'P9752', 'CMA', 'CAIU9434334', 'Devan - Days', NULL, NULL, NULL, 'P9752', NULL, 'CMA', NULL, NULL, 'CAIU9434334', 0, '=IF(AZ48>0,VLOOKUP(AZ48,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9753', NULL, 'MAGU5702196', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(16, '2022-03-09', 'N', '0.85416666666667', 'P9754', 'CMA', NULL, 'TGBU4168683', 'Exchange & Shunt', 'P9752', NULL, 'CMA', 'CAIU9434334', 'P9753', 'CMA', 'MAGU5702196', 'Devan - Nights', NULL, NULL, NULL, 'P9753', NULL, 'CMA', NULL, NULL, 'MAGU5702196', 0, '=IF(AZ49>0,VLOOKUP(AZ49,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9754', NULL, 'TGBU4168683', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(17, '2022-03-10', 'D', '07.30', 'P9755', 'CMA', NULL, 'TCNU3401548', 'Exchange & Shunt', 'P9753', NULL, 'CMA', 'MAGU5702196', 'P9754', 'CMA', 'TGBU4168683', 'Devan - Days', NULL, NULL, NULL, 'P9754', NULL, 'CMA', NULL, NULL, 'TGBU4168683', 0, '=IF(AZ51>0,VLOOKUP(AZ51,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9755', NULL, 'TCNU3401548', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(18, '2022-03-10', 'N', '20.30', 'P9756', 'CMA', NULL, 'TCNU1096065', 'Exchange & Shunt', 'P9754', NULL, 'CMA', 'TGBU4168683', 'P9755', 'CMA', 'TCNU3401548', 'Devan - Nights', NULL, NULL, NULL, 'P9755', NULL, 'CMA', NULL, NULL, 'TCNU3401548', 0, '=IF(AZ52>0,VLOOKUP(AZ52,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9756', NULL, 'TCNU1096065', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(19, '2022-03-11', 'D', '07.30', 'P9757', 'CMA', NULL, 'CMAU4827938', 'Exchange & Shunt', 'P9755', NULL, 'CMA', 'TCNU3401548', 'P9756', 'CMA', 'TCNU1096065', 'Devan - Days', NULL, NULL, NULL, 'P9756', NULL, 'CMA', NULL, NULL, 'TCNU1096065', 0, '=IF(AZ54>0,VLOOKUP(AZ54,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9757', NULL, 'CMAU4827938', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(20, '2022-03-11', 'N', '18.00', 'P9758', 'CMA', NULL, 'CMAU6626721', 'Exchange & Shunt', 'P9756', NULL, 'CMA', 'TCNU1096065', 'P9757', 'CMA', 'CMAU4827938', 'Devan - Nights', NULL, NULL, NULL, 'P9757', NULL, 'CMA', NULL, NULL, 'CMAU4827938', 0, '=IF(AZ55>0,VLOOKUP(AZ55,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9758', NULL, 'CMAU6626721', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(21, '2022-03-14', 'D', '07.30', 'P9759', 'CMA', NULL, 'TCNU4704256', 'Exchange & Shunt', 'P9757', NULL, 'CMA', 'CMAU4827938', 'P9758', 'CMA', 'CMAU6626721', 'Devan - Days', NULL, NULL, NULL, 'P9758', NULL, 'CMA', NULL, NULL, 'CMAU6626721', 0, '=IF(AZ57>0,VLOOKUP(AZ57,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9759', NULL, 'TCNU4704256', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(22, '2022-03-14', 'N', '20.30', 'P9760', 'CMA', NULL, 'CMAU6520468', 'Exchange & Shunt', 'P9758', NULL, 'CMA', 'CMAU6626721', 'P9759', 'CMA', 'TCNU4704256', 'Devan - Nights', NULL, NULL, NULL, 'P9759', NULL, 'CMA', NULL, NULL, 'TCNU4704256', 0, '=IF(AZ58>0,VLOOKUP(AZ58,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9760', NULL, 'CMAU6520468', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(23, '2022-03-15', 'D', '07.30', 'P9761', 'MAERSK', NULL, 'MRSU4904851', 'Exchange & Shunt', 'P9759', NULL, 'CMA', 'TCNU4704256', 'P9760', 'CMA', 'CMAU6520468', 'Devan - Days', NULL, NULL, NULL, 'P9760', NULL, 'CMA', NULL, NULL, 'CMAU6520468', 0, '=IF(AZ60>0,VLOOKUP(AZ60,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9761', NULL, 'MRSU4904851', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(24, '2022-03-15', 'N', '20.30', 'P9762', 'MAERSK', NULL, 'TGBU9663843', 'Exchange & Shunt', 'P9760', NULL, 'CMA', 'CMAU6520468', 'P9761', 'MAERSK', 'MRSU4904851', 'Devan - Nights', NULL, NULL, NULL, 'P9761', NULL, 'MAERSK', NULL, NULL, 'MRSU4904851', 0, '=IF(AZ61>0,VLOOKUP(AZ61,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9762', NULL, 'TGBU9663843', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(25, '2022-03-16', 'D', '07.30', 'P9763', 'MAERSK', NULL, 'TLLU6886361', 'Exchange & Shunt', 'P9761', NULL, 'MAERSK', 'MRSU4904851', 'P9762', 'MAERSK', 'TGBU9663843', 'Devan - Days', NULL, NULL, NULL, 'P9762', NULL, 'MAERSK', NULL, NULL, 'TGBU9663843', 0, '=IF(AZ63>0,VLOOKUP(AZ63,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9763', NULL, 'TLLU6886361', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(26, '2022-03-16', 'N', '0.85416666666667', 'P9764', 'MAERSK', NULL, 'TRHU6180001', 'Exchange & Shunt', 'P9762', NULL, 'MAERSK', 'TGBU9663843', 'P9763', 'MAERSK', 'TLLU6886361', 'Devan - Nights', NULL, NULL, NULL, 'P9763', NULL, 'MAERSK', NULL, NULL, 'TLLU6886361', 0, '=IF(AZ64>0,VLOOKUP(AZ64,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9764', NULL, 'TRHU6180001', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(27, '2022-03-17', 'D', '13.00', 'NORTH AMERICA CONTAINER NO. HLXU1174225 LIVE DEVAN', '', NULL, '', '', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(28, '2022-03-17', 'D', '13.00', 'NORTH AMERICA CONTAINER NO. HLXU1174225 LIVE DEVAN', '', NULL, '', '', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(29, '2022-03-17', 'N', '20.30', 'P9766', 'MAERSK', NULL, 'TLLU6854410', 'Exchange & Shunt', 'P9764', NULL, 'MAERSK', 'TRHU6180001', 'P9765', 'MAERSK', 'MRSU5066183', 'Devan - Nights', NULL, NULL, NULL, 'P9765', NULL, 'MAERSK', NULL, NULL, 'MRSU5066183', 0, '=IF(AZ68>0,VLOOKUP(AZ68,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9766', NULL, 'TLLU6854410', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(30, '2022-03-18', 'D', '07.30', 'P9767', 'ONE', NULL, 'FDCU0460937', 'Exchange & Shunt', 'P9765', NULL, 'MAERSK', 'MRSU5066183', 'P9766', 'MAERSK', 'TLLU6854410', 'Devan - Days', NULL, NULL, NULL, 'P9766', NULL, 'MAERSK', NULL, NULL, 'TLLU6854410', 0, '=IF(AZ70>0,VLOOKUP(AZ70,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9767', NULL, 'FDCU0460937', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(31, '2022-03-18', 'N', '18.00', 'P9768', 'ONE', NULL, 'BEAU5269242', 'Exchange & Shunt', 'P9766', NULL, 'MAERSK', 'TLLU6854410', 'P9767', 'ONE', 'FDCU0460937', 'Devan - Nights', NULL, NULL, NULL, 'P9767', NULL, 'ONE', NULL, NULL, 'FDCU0460937', 0, '=IF(AZ71>0,VLOOKUP(AZ71,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9768', NULL, 'BEAU5269242', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(32, '2022-03-21', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', 'P9768', 'ONE', 'BEAU5269242', 'Devan - Days', NULL, NULL, NULL, 'P9768', NULL, 'ONE', NULL, NULL, 'BEAU5269242', 0, '=IF(AZ73>0,VLOOKUP(AZ73,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9769', NULL, 'TLLU5527217', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(33, '2022-03-21', 'N', '20.30', 'P9770', 'CMA', NULL, 'CMAU6825683', 'Exchange & Shunt', 'P9767', NULL, 'ONE', 'FDCU0460937', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ74>0,VLOOKUP(AZ74,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9770', NULL, 'CMAU6825683', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(34, '2022-03-22', 'D', '12.00', 'P9771', 'CMA', NULL, 'TCNU5569090', 'Exchange & Shunt', 'P9769', NULL, 'ONE', 'TLLU5527217', 'P9770', 'CMA', 'CMAU6825683', 'Devan - Days', NULL, NULL, NULL, 'P9770', NULL, 'CMA', NULL, NULL, 'CMAU6825683', 0, '=IF(AZ77>0,VLOOKUP(AZ77,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9772', NULL, 'BEAU5245575', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(35, '2022-03-22', 'D', '12.00', 'P9771', 'CMA', NULL, 'TCNU5569090', 'Exchange & Shunt', 'P9769', NULL, 'ONE', 'TLLU5527217', 'P9770', 'CMA', 'CMAU6825683', 'Devan - Days', NULL, NULL, NULL, 'P9770', NULL, 'CMA', NULL, NULL, 'CMAU6825683', 0, '=IF(AZ77>0,VLOOKUP(AZ77,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9772', NULL, 'BEAU5245575', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(36, '2022-03-22', 'N', '20.30', 'P9772', 'ONE', NULL, 'BEAU5245575', 'Exchange & Shunt', 'P9769', NULL, 'ONE', 'TLLU5527217', 'P9771', 'CMA', 'TCNU5569090', 'Devan - Nights', NULL, NULL, NULL, 'P9771', NULL, 'CMA', NULL, NULL, 'TCNU5569090', 0, '=IF(AZ78>0,VLOOKUP(AZ78,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9772', NULL, 'BEAU5245575', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(37, '2022-03-23', 'D', '07.30', 'P9773', 'ONE', NULL, 'FFAU1861840', 'Exchange & Shunt', 'P9771', NULL, 'CMA', 'TCNU5569090', 'P9772', 'ONE', 'BEAU5245575', 'Devan - Days', NULL, NULL, NULL, 'P9772', NULL, 'ONE', NULL, NULL, 'BEAU5245575', 0, '=IF(AZ80>0,VLOOKUP(AZ80,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9773', NULL, 'FFAU1861840', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(38, '2022-03-23', 'N', '0.85416666666667', 'P9774', 'MAERSK', NULL, 'TCKU6438675', 'Exchange & Shunt', 'P9772', NULL, 'ONE', 'BEAU5245575', 'P9773', 'ONE', 'FFAU1861840', 'Devan - Nights', NULL, NULL, NULL, 'P9773', NULL, 'ONE', NULL, NULL, 'FFAU1861840', 0, '=IF(AZ81>0,VLOOKUP(AZ81,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9774', NULL, 'TCKU6438675', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(39, '2022-03-24', 'D', '07.30', 'P9775', 'MAERSK', NULL, 'TCKU7033136', 'Exchange & Shunt', 'P9773', NULL, 'ONE', 'FFAU1861840', 'P9774', 'MAERSK', 'TCKU6438675', 'Devan - Days', NULL, NULL, NULL, 'P9774', NULL, 'MAERSK', NULL, NULL, 'TCKU6438675', 0, '=IF(AZ83>0,VLOOKUP(AZ83,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9775', NULL, 'TCKU7033136', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(40, '2022-03-24', 'N', '20.30', 'P9776', 'MAERSK', NULL, 'BEAU6268847', 'Exchange & Shunt', 'P9774', NULL, 'MAERSK', 'TCKU6438675', 'P9775', 'MAERSK', 'TCKU7033136', 'Devan - Nights', NULL, NULL, NULL, 'P9775', NULL, 'MAERSK', NULL, NULL, 'TCKU7033136', 0, '=IF(AZ84>0,VLOOKUP(AZ84,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9776', NULL, 'BEAU6268847', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(41, '2022-03-25', 'D', '07.30', 'P9777', 'CMA', NULL, 'CMAU6958650', 'Exchange & Shunt', 'P9775', NULL, 'MAERSK', 'TCKU7033136', 'P9776', 'MAERSK', 'BEAU6268847', 'Devan - Days', NULL, NULL, NULL, 'P9776', NULL, 'MAERSK', NULL, NULL, 'BEAU6268847', 0, '=IF(AZ86>0,VLOOKUP(AZ86,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9777', NULL, 'CMAU6958650', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(42, '2022-03-25', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ87>0,VLOOKUP(AZ87,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(43, '2022-03-28', 'D', '07.30', 'P9778', 'CMA', NULL, 'TRLU7372157', 'Exchange & Shunt', 'P9776', NULL, 'MAERSK', 'BEAU6268847', 'P9777', 'CMA', 'CMAU6958650', 'Devan - Days', NULL, NULL, NULL, 'P9777', NULL, 'CMA', NULL, NULL, 'CMAU6958650', 0, '=IF(AZ89>0,VLOOKUP(AZ89,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9778', NULL, 'TRLU7372157', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(44, '2022-03-28', 'N', '20.30', 'P9779', 'CMA', NULL, 'CMAU4427187', 'Exchange & Shunt', 'P9777', NULL, 'CMA', 'CMAU6958650', 'P9778', 'CMA', 'TRLU7372157', 'Devan - Nights', NULL, NULL, NULL, 'P9778', NULL, 'CMA', NULL, NULL, 'TRLU7372157', 0, '=IF(AZ90>0,VLOOKUP(AZ90,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9779', NULL, 'CMAU4427187', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(45, '2022-03-29', 'D', '07.30', 'P9780', 'CMA', NULL, 'TLLU7892332', 'Exchange & Shunt', 'P9778', NULL, 'CMA', 'TRLU7372157', 'P9779', 'CMA', 'CMAU4427187', 'Devan - Days', NULL, NULL, NULL, 'P9779', NULL, 'CMA', NULL, NULL, 'CMAU4427187', 0, '=IF(AZ92>0,VLOOKUP(AZ92,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9780', NULL, 'TLLU7892332', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(46, '2022-03-29', 'N', '20.30', 'P9781', 'ONE', NULL, 'MOTU0780262', 'Exchange & Shunt', 'P9779', NULL, 'CMA', 'CMAU4427187', 'P9780', 'CMA', 'TLLU7892332', 'Devan - Nights', NULL, NULL, NULL, 'P9780', NULL, 'CMA', NULL, NULL, 'TLLU7892332', 0, '=IF(AZ93>0,VLOOKUP(AZ93,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9781', NULL, 'MOTU0780262', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(47, '2022-03-30', 'D', '07.30', 'P9782', 'ONE', NULL, 'KKFU8111040', 'Exchange & Shunt', 'P9780', NULL, 'CMA', 'TLLU7892332', 'P9781', 'ONE', 'MOTU0780262', 'Devan - Days', NULL, NULL, NULL, 'P9781', NULL, 'ONE', NULL, NULL, 'MOTU0780262', 0, '=IF(AZ95>0,VLOOKUP(AZ95,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9782', NULL, 'KKFU8111040', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(48, '2022-03-30', 'N', '0.85416666666667', 'P9783', 'ONE', NULL, 'TCNU2108181', 'Exchange & Shunt', 'P9781', NULL, 'ONE', 'MOTU0780262', 'P9782', 'ONE', 'KKFU8111040', 'Devan - Nights', NULL, NULL, NULL, 'P9782', NULL, 'ONE', NULL, NULL, 'KKFU8111040', 0, '=IF(AZ96>0,VLOOKUP(AZ96,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9783', NULL, 'TCNU2108181', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(49, '2022-03-31', 'D', '07.30', 'P9784', 'MAERSK', NULL, 'FFAU2350187', 'Exchange & Shunt', 'P9782', NULL, 'ONE', 'KKFU8111040', 'P9783', 'ONE', 'TCNU2108181', 'Devan - Days', NULL, NULL, NULL, 'P9783', NULL, 'ONE', NULL, NULL, 'TCNU2108181', 0, '=IF(AZ98>0,VLOOKUP(AZ98,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9784', NULL, 'FFAU2350187', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(50, '2022-03-31', 'N', '20.30', 'P9785', 'MAERSK', NULL, 'CAAU6636853', 'Exchange & Shunt', 'P9783', NULL, 'ONE', 'TCNU2108181', 'P9784', 'MAERSK', 'FFAU2350187', 'Devan - Nights', NULL, NULL, NULL, 'P9784', NULL, 'MAERSK', NULL, NULL, 'FFAU2350187', 0, '=IF(AZ99>0,VLOOKUP(AZ99,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9785', NULL, 'CAAU6636853', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(51, '2022-04-01', 'D', '07.30', 'P9786', 'MAERSK', NULL, 'MRSU4380482', 'Exchange & Shunt', 'P9784', NULL, 'MAERSK', 'FFAU2350187', 'P9785', 'MAERSK', 'CAAU6636853', 'Devan - Days', NULL, NULL, NULL, 'P9785', NULL, 'MAERSK', NULL, NULL, 'CAAU6636853', 0, '=IF(AZ101>0,VLOOKUP(AZ101,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9786', NULL, 'MRSU4380482', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(52, '2022-04-01', 'N', '18.00', 'P9787', 'MAERSK', NULL, 'MRSU4320225', 'Exchange & Shunt', 'P9785', NULL, 'MAERSK', 'CAAU6636853', 'P9786', 'MAERSK', 'MRSU4380482', 'Devan - Nights', NULL, NULL, NULL, 'P9786', NULL, 'MAERSK', NULL, NULL, 'MRSU4380482', 0, '=IF(AZ102>0,VLOOKUP(AZ102,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', 'P9787', NULL, 'MRSU4320225', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(53, '2022-04-04', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ104>0,VLOOKUP(AZ104,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(54, '2022-04-04', 'N', '20.30', 'P9788', 'CMA', NULL, 'BEAU6111673', 'Exchange & Shunt', 'P9786', NULL, 'MAERSK', 'MRSU4380482', 'P9787', 'MAERSK', 'MRSU4320225', 'Devan - Nights', NULL, NULL, NULL, 'P9787', NULL, 'MAERSK', NULL, NULL, 'MRSU4320225', 0, '=IF(AZ105>0,VLOOKUP(AZ105,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(55, '2022-04-05', 'D', '07.30', 'P9789', 'CMA', NULL, 'TLLU5776800', 'Exchange & Shunt', 'P9787', NULL, 'MAERSK', 'MRSU4320225', 'P9788', 'CMA', 'BEAU6111673', 'Devan - Days', NULL, NULL, NULL, 'P9788', NULL, 'CMA', NULL, NULL, 'BEAU6111673', 0, '=IF(AZ107>0,VLOOKUP(AZ107,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(56, '2022-04-05', 'N', '20.30', 'P9790', 'CMA', NULL, 'TCNU3339694', 'Exchange & Shunt', 'P9788', NULL, 'CMA', 'BEAU6111673', 'P9789', 'CMA', 'TLLU5776800', 'Devan - Nights', NULL, NULL, NULL, 'P9789', NULL, 'CMA', NULL, NULL, 'TLLU5776800', 0, '=IF(AZ108>0,VLOOKUP(AZ108,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(57, '2022-04-06', 'D', '07.30', 'P9791', 'MAERSK', NULL, 'MRSU3329866', 'Exchange & Shunt', 'P9789', NULL, 'CMA', 'TLLU5776800', 'P9790', 'CMA', 'TCNU3339694', 'Devan - Days', NULL, NULL, NULL, 'P9790', NULL, 'CMA', NULL, NULL, 'TCNU3339694', 0, '=IF(AZ110>0,VLOOKUP(AZ110,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(58, '2022-04-06', 'N', '0.85416666666667', 'P9792', 'MAERSK', NULL, 'MRSU4970529', 'Exchange & Shunt', 'P9790', NULL, 'CMA', 'TCNU3339694', 'P9791', 'MAERSK', 'MRSU3329866', 'Devan - Nights', NULL, NULL, NULL, 'P9791', NULL, 'MAERSK', NULL, NULL, 'MRSU3329866', 0, '=IF(AZ111>0,VLOOKUP(AZ111,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(59, '2022-04-07', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ113>0,VLOOKUP(AZ113,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(60, '2022-04-07', 'N', '20.30', 'P9793', 'MSC', NULL, 'MSDU8252441', 'Exchange & Shunt', 'P9791', NULL, 'MAERSK', 'MRSU3329866', 'P9792', 'MAERSK', 'MRSU4970529', 'Devan - Nights', NULL, NULL, NULL, 'P9792', NULL, 'MAERSK', NULL, NULL, 'MRSU4970529', 0, '=IF(AZ114>0,VLOOKUP(AZ114,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(61, '2022-04-08', 'D', '07.30', 'P9794', 'MSC', NULL, 'MEDU8941361', 'Exchange & Shunt', 'P9792', NULL, 'MAERSK', 'MRSU4970529', 'P9793', 'MSC', 'MSDU8252441', 'Devan - Days', NULL, NULL, NULL, 'P9793', NULL, 'MSC', NULL, NULL, 'MSDU8252441', 0, '=IF(AZ116>0,VLOOKUP(AZ116,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(62, '2022-04-08', 'N', '18.00', 'P9795', 'MSC', NULL, 'FBLU0173457', 'Exchange & Shunt', 'P9793', NULL, 'MSC', 'MSDU8252441', 'P9794', 'MSC', 'MEDU8941361', 'Devan - Nights', NULL, NULL, NULL, 'P9794', NULL, 'MSC', NULL, NULL, 'MEDU8941361', 0, '=IF(AZ117>0,VLOOKUP(AZ117,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(63, '2022-04-11', 'D', '07.30', 'P9796', 'MAERSK', NULL, 'MRSU4779894', 'Exchange & Shunt', 'P9794', NULL, 'MSC', 'MEDU8941361', 'P9795', 'MSC', 'FBLU0173457', 'Devan - Days', NULL, NULL, NULL, 'P9795', NULL, 'MSC', NULL, NULL, 'FBLU0173457', 0, '=IF(AZ119>0,VLOOKUP(AZ119,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(64, '2022-04-11', 'N', '20.30', 'P9797', 'MAERSK', NULL, 'MRSU4222403', 'Exchange & Shunt', 'P9795', NULL, 'MSC', 'FBLU0173457', 'P9796', 'MAERSK', 'MRSU4779894', 'Devan - Nights', NULL, NULL, NULL, 'P9796', NULL, 'MAERSK', NULL, NULL, 'MRSU4779894', 0, '=IF(AZ120>0,VLOOKUP(AZ120,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(65, '2022-04-12', 'D', '07.30', 'P9798', 'CMA', NULL, 'TRHU4770884', 'Exchange & Shunt', 'P9796', NULL, 'MAERSK', 'MRSU4779894', 'P9797', 'MAERSK', 'MRSU4222403', 'Devan - Days', NULL, NULL, NULL, 'P9797', NULL, 'MAERSK', NULL, NULL, 'MRSU4222403', 0, '=IF(AZ122>0,VLOOKUP(AZ122,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(66, '2022-04-12', 'N', '20.30', 'P9799', 'CMA', NULL, 'TCNU2717280', 'Exchange & Shunt', 'P9797', NULL, 'MAERSK', 'MRSU4222403', 'P9798', 'CMA', 'TRHU4770884', 'Devan - Nights', NULL, NULL, NULL, 'P9798', NULL, 'CMA', NULL, NULL, 'TRHU4770884', 0, '=IF(AZ123>0,VLOOKUP(AZ123,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(67, '2022-04-13', 'D', '07.30', 'P9800', 'CMA', NULL, 'TCKU6219358', 'Exchange & Shunt', 'P9798', NULL, 'CMA', 'TRHU4770884', 'P9799', 'CMA', 'TCNU2717280', 'Devan - Days', NULL, NULL, NULL, 'P9799', NULL, 'CMA', NULL, NULL, 'TCNU2717280', 0, '=IF(AZ125>0,VLOOKUP(AZ125,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(68, '2022-04-13', 'N', '0.85416666666667', 'P9801', 'CMA', NULL, 'CMAU6350130', 'Exchange & Shunt', 'P9799', NULL, 'CMA', 'TCNU2717280', 'P9800', 'CMA', 'TCKU6219358', 'Devan - Nights', NULL, NULL, NULL, 'P9800', NULL, 'CMA', NULL, NULL, 'TCKU6219358', 0, '=IF(AZ126>0,VLOOKUP(AZ126,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(69, '2022-04-14', 'D', '07.30', 'P9802', 'ONE', NULL, 'TEMU7475106', 'Exchange & Shunt', 'P9800', NULL, 'CMA', 'TCKU6219358', 'P9801', 'CMA', 'CMAU6350130', 'Devan - Days', NULL, NULL, NULL, 'P9801', NULL, 'CMA', NULL, NULL, 'CMAU6350130', 0, '=IF(AZ128>0,VLOOKUP(AZ128,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(70, '2022-04-14', 'N', '18.00', 'P9803', 'ONE', NULL, 'FFAU1807509', 'Exchange & Shunt', 'P9801', NULL, 'CMA', 'CMAU6350130', 'P9802', 'ONE', 'TEMU7475106', 'Devan - Nights', NULL, NULL, NULL, 'P9802', NULL, 'ONE', NULL, NULL, 'TEMU7475106', 0, '=IF(AZ129>0,VLOOKUP(AZ129,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(71, '2022-04-15', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(72, '2022-04-15', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(73, '2022-04-18', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ134>0,VLOOKUP(AZ134,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(74, '2022-04-18', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ135>0,VLOOKUP(AZ135,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(75, '2022-04-19', 'D', '07.30', 'P9804', 'MAERSK', NULL, 'MRSU4417998', 'Exchange & Shunt', 'P9802', NULL, 'ONE', 'TEMU7475106', 'P9803', 'ONE', 'FFAU1807509', 'Devan - Days', NULL, NULL, NULL, 'P9803', NULL, 'ONE', NULL, NULL, 'FFAU1807509', 0, '=IF(AZ137>0,VLOOKUP(AZ137,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(76, '2022-04-19', 'N', '20.30', 'P9805', 'MAERSK', NULL, 'MRSU4337871', 'Exchange & Shunt', 'P9803', NULL, 'ONE', 'FFAU1807509', 'P9804', 'MAERSK', 'MRSU4417998', 'Devan - Nights', NULL, NULL, NULL, 'P9804', NULL, 'MAERSK', NULL, NULL, 'MRSU4417998', 0, '=IF(AZ138>0,VLOOKUP(AZ138,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(77, '2022-04-20', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN UACU3634984', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(78, '2022-04-20', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN UACU3634984', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(79, '2022-04-20', 'N', '0.85416666666667', 'P9807', 'MAERSK', NULL, 'CAAU6638970', 'Exchange & Shunt', 'P9805', NULL, 'MAERSK', 'MRSU4337871', 'P9806', 'MAERSK', 'MRSU4189943', 'Devan - Nights', NULL, NULL, NULL, 'P9806', NULL, 'MAERSK', NULL, NULL, 'MRSU4189943', 0, '=IF(AZ142>0,VLOOKUP(AZ142,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(80, '2022-04-21', 'D', '07.30', 'P9808', 'CMA', NULL, 'TCNU5805410', 'Exchange & Shunt', 'P9806', NULL, 'MAERSK', 'MRSU4189943', 'P9807', 'MAERSK', 'CAAU6638970', 'Devan - Days', NULL, NULL, NULL, 'P9807', NULL, 'MAERSK', NULL, NULL, 'CAAU6638970', 0, '=IF(AZ144>0,VLOOKUP(AZ144,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(81, '2022-04-21', 'N', '20.30', 'P9809', 'CMA', NULL, 'CMAU6947172', 'Exchange & Shunt', 'P9807', NULL, 'MAERSK', 'CAAU6638970', 'P9808', 'CMA', 'TCNU5805410', 'Devan - Nights', NULL, NULL, NULL, 'P9808', NULL, 'CMA', NULL, NULL, 'TCNU5805410', 0, '=IF(AZ145>0,VLOOKUP(AZ145,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(82, '2022-04-22', 'D', '07.30', 'P9810', 'CMA', NULL, 'TCLU1605885', 'Exchange & Shunt', 'P9808', NULL, 'CMA', 'TCNU5805410', 'P9809', 'CMA', 'CMAU6947172', 'Devan - Days', NULL, NULL, NULL, 'P9809', NULL, 'CMA', NULL, NULL, 'CMAU6947172', 0, '=IF(AZ147>0,VLOOKUP(AZ147,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(83, '2022-04-22', 'N', '18.00', 'P9811', 'CMA', NULL, 'CMAU8419852', 'Exchange & Shunt', 'P9809', NULL, 'CMA', 'CMAU6947172', '-', '-', '-', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ148>0,VLOOKUP(AZ148,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(84, '2022-04-25', 'D', '07.30', '-', '-', NULL, '-', 'Exchange & Shunt', '-', NULL, '-', '-', '-', '-', '-', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ150>0,VLOOKUP(AZ150,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(85, '2022-04-25', 'N', '20.30', '-', '-', NULL, '-', 'Exchange & Shunt', '-', NULL, '-', '-', 'P9810', 'CMA', 'TCLU1605885', 'Devan - Nights', NULL, NULL, NULL, 'P9810', NULL, 'CMA', NULL, NULL, 'TCLU1605885', 0, '=IF(AZ151>0,VLOOKUP(AZ151,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(86, '2022-04-26', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN HLBU1730306', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(87, '2022-04-26', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN HLBU1730306', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(88, '2022-04-26', 'N', '20.30', 'P9813', 'ONE', NULL, 'TRHU5190561', 'Exchange & Shunt', 'P9811', NULL, 'CMA', 'CMAU8419852', 'P9812', 'ONE', 'DRYU6046275', 'Devan - Nights', NULL, NULL, NULL, 'P9812', NULL, 'ONE', NULL, NULL, 'DRYU6046275', 0, '=IF(AZ155>0,VLOOKUP(AZ155,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(89, '2022-04-27', 'D', '07.30', 'P9814', 'MAERSK', NULL, 'MRSU5067786', 'Exchange & Shunt', 'P9812', NULL, 'ONE', 'DRYU6046275', 'P9813', 'ONE', 'TRHU5190561', 'Devan - Days', NULL, NULL, NULL, 'P9813', NULL, 'ONE', NULL, NULL, 'TRHU5190561', 0, '=IF(AZ157>0,VLOOKUP(AZ157,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(90, '2022-04-27', 'N', '0.85416666666667', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ158>0,VLOOKUP(AZ158,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(91, '2022-04-28', 'D', '07.30', 'P9815', 'MAERSK', NULL, 'MRSU4457178', 'Exchange & Shunt', 'P9813', NULL, 'ONE', 'TRHU5190561', 'P9814', 'MAERSK', 'MRSU5067786', 'Devan - Days', NULL, NULL, NULL, 'P9814', NULL, 'MAERSK', NULL, NULL, 'MRSU5067786', 0, '=IF(AZ160>0,VLOOKUP(AZ160,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(92, '2022-04-28', 'N', '20.30', 'P9816', 'MAERSK', NULL, 'TRHU8308025', 'Exchange & Shunt', 'P9814', NULL, 'MAERSK', 'MRSU5067786', 'P9815', 'MAERSK', 'MRSU4457178', 'Devan - Nights', NULL, NULL, NULL, 'P9815', NULL, 'MAERSK', NULL, NULL, 'MRSU4457178', 0, '=IF(AZ161>0,VLOOKUP(AZ161,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(93, '2022-04-29', 'D', '07.30', 'P9817', 'MAERSK', NULL, 'CAAU5784856', 'Exchange & Shunt', 'P9815', NULL, 'MAERSK', 'MRSU4457178', 'P9816', 'MAERSK', 'TRHU8308025', 'Devan - Days', NULL, NULL, NULL, 'P9816', NULL, 'MAERSK', NULL, NULL, 'TRHU8308025', 0, '=IF(AZ163>0,VLOOKUP(AZ163,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(94, '2022-04-29', 'N', '18.00', 'P9818', 'CMA', NULL, 'BEAU5972126', 'Exchange & Shunt', 'P9816', NULL, 'MAERSK', 'TRHU8308025', 'P9817', 'MAERSK', 'CAAU5784856', 'Devan - Nights', NULL, NULL, NULL, 'P9817', NULL, 'MAERSK', NULL, NULL, 'CAAU5784856', 0, '=IF(AZ164>0,VLOOKUP(AZ164,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(95, '2022-05-02', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ166>0,VLOOKUP(AZ166,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(96, '2022-05-02', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ167>0,VLOOKUP(AZ167,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(97, '2022-05-03', 'D', '07.30', 'P9819', 'CMA', NULL, 'CMAU7393769', 'Exchange & Shunt', 'P9817', NULL, 'MAERSK', 'CAAU5784856', 'P9818', 'CMA', 'BEAU5972126', 'Devan - Days', NULL, NULL, NULL, 'P9818', NULL, 'CMA', NULL, NULL, 'BEAU5972126', 0, '=IF(AZ169>0,VLOOKUP(AZ169,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(98, '2022-05-03', 'N', '20.30', 'P9820', 'CMA', NULL, 'TCLU1852838', 'Exchange & Shunt', 'P9818', NULL, 'CMA', 'BEAU5972126', 'P9819', 'CMA', 'CMAU7393769', 'Devan - Nights', NULL, NULL, NULL, 'P9819', NULL, 'CMA', NULL, NULL, 'CMAU7393769', 0, '=IF(AZ170>0,VLOOKUP(AZ170,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(99, '2022-05-04', 'D', '07.30', 'P9821', 'CMA', NULL, 'TCKU6322216', 'Exchange & Shunt', 'P9819', NULL, 'CMA', 'CMAU7393769', 'P9820', 'CMA', 'TCLU1852838', 'Devan - Days', NULL, NULL, NULL, 'P9820', NULL, 'CMA', NULL, NULL, 'TCLU1852838', 0, '=IF(AZ172>0,VLOOKUP(AZ172,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(100, '2022-05-04', 'N', '0.85416666666667', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ173>0,VLOOKUP(AZ173,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(101, '2022-05-05', 'D', '07.30', 'P9822', 'MSC', NULL, 'TCLU5899469', 'Exchange & Shunt', 'P9820', NULL, 'CMA', 'TCLU1852838', 'P9821', 'CMA', 'TCKU6322216', 'Devan - Days', NULL, NULL, NULL, 'P9821', NULL, 'CMA', NULL, NULL, 'TCKU6322216', 0, '=IF(AZ175>0,VLOOKUP(AZ175,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(102, '2022-05-05', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ176>0,VLOOKUP(AZ176,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(103, '2022-05-06', 'D', '07.30', 'P9823', 'MSC', NULL, 'MSMU7182460', 'Exchange & Shunt', 'P9821', NULL, 'CMA', 'TCKU6322216', 'P9822', 'MSC', 'TCLU5899469', 'Devan - Days', NULL, NULL, NULL, 'P9822', NULL, 'MSC', NULL, NULL, 'TCLU5899469', 0, '=IF(AZ178>0,VLOOKUP(AZ178,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(104, '2022-05-06', 'N', '18.00', 'P9824', 'MSC', NULL, 'TRHU8551760', 'Exchange & Shunt', 'P9822', NULL, 'MSC', 'TCLU5899469', 'P9823', 'MSC', 'MSMU7182460', 'Devan - Nights', NULL, NULL, NULL, 'P9823', NULL, 'MSC', NULL, NULL, 'MSMU7182460', 0, '=IF(AZ179>0,VLOOKUP(AZ179,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(105, '2022-05-09', 'D', '07.30', 'P9825', 'MAERSK', NULL, 'TRHU6823849', 'Exchange & Shunt', 'P9823', NULL, 'MSC', 'MSMU7182460', 'P9824', 'MSC', 'TRHU8551760', 'Devan - Days', NULL, NULL, NULL, 'P9824', NULL, 'MSC', NULL, NULL, 'TRHU8551760', 0, '=IF(AZ181>0,VLOOKUP(AZ181,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(106, '2022-05-09', 'N', '20.30', 'P9826', 'MAERSK', NULL, 'TCKU7420881', 'Exchange & Shunt', 'P9824', NULL, 'MSC', 'TRHU8551760', 'P9825', 'MAERSK', 'TRHU6823849', 'Devan - Nights', NULL, NULL, NULL, 'P9825', NULL, 'MAERSK', NULL, NULL, 'TRHU6823849', 0, '=IF(AZ182>0,VLOOKUP(AZ182,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(107, '2022-05-10', 'D', '07.30', 'P9827', 'MAERSK', NULL, 'TRHU4398294', 'Exchange & Shunt', 'P9825', NULL, 'MAERSK', 'TRHU6823849', 'P9826', 'MAERSK', 'TCKU7420881', 'Devan - Days', NULL, NULL, NULL, 'P9826', NULL, 'MAERSK', NULL, NULL, 'TCKU7420881', 0, '=IF(AZ184>0,VLOOKUP(AZ184,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(108, '2022-05-10', 'N', '20.30', 'P9828', 'CMA', NULL, 'TCKU7143658', 'Exchange & Shunt', 'P9826', NULL, 'MAERSK', 'TCKU7420881', 'P9827', 'MAERSK', 'TRHU4398294', 'Devan - Nights', NULL, NULL, NULL, 'P9827', NULL, 'MAERSK', NULL, NULL, 'TRHU4398294', 0, '=IF(AZ185>0,VLOOKUP(AZ185,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(109, '2022-05-11', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ187>0,VLOOKUP(AZ187,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(110, '2022-05-11', 'N', '0.85416666666667', 'P9829', 'CMA', NULL, 'FDCU0269540', 'Exchange & Shunt', 'P9827', NULL, 'MAERSK', 'TRHU4398294', 'P9828', 'CMA', 'TCKU7143658', 'Devan - Nights', NULL, NULL, NULL, 'P9828', NULL, 'CMA', NULL, NULL, 'TCKU7143658', 0, '=IF(AZ188>0,VLOOKUP(AZ188,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(111, '2022-05-12', 'D', '07.30', 'P9830', 'CMA', NULL, 'TRHU5121200', 'Exchange & Shunt', 'P9828', NULL, 'CMA', 'TCKU7143658', 'P9829', 'CMA', 'FDCU0269540', 'Devan - Days', NULL, NULL, NULL, 'P9829', NULL, 'CMA', NULL, NULL, 'FDCU0269540', 0, '=IF(AZ190>0,VLOOKUP(AZ190,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(112, '2022-05-12', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ191>0,VLOOKUP(AZ191,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(113, '2022-05-13', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ193>0,VLOOKUP(AZ193,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(114, '2022-05-13', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(115, '2022-05-16', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ196>0,VLOOKUP(AZ196,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(116, '2022-05-16', 'N', '20.30', 'P9831', 'CMA', NULL, 'BHCU5034270', 'Exchange & Shunt', 'P9829', NULL, 'CMA', 'FDCU0269540', 'P9830', 'CMA', 'TRHU5121200', 'Devan - Nights', NULL, NULL, NULL, 'P9830', NULL, 'CMA', NULL, NULL, 'TRHU5121200', 0, '=IF(AZ197>0,VLOOKUP(AZ197,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(117, '2022-05-17', 'D', '07.30', 'P9832', 'MSC', NULL, 'FCIU9807729', 'Exchange & Shunt', 'P9830', NULL, 'CMA', 'TRHU5121200', 'P9831', 'CMA', 'BHCU5034270', 'Devan - Days', NULL, NULL, NULL, 'P9831', NULL, 'CMA', NULL, NULL, 'BHCU5034270', 0, '=IF(AZ199>0,VLOOKUP(AZ199,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(118, '2022-05-17', 'N', '20.30', 'P9833', 'MSC', NULL, 'MSDU7588920', 'Exchange & Shunt', 'P9831', NULL, 'CMA', 'BHCU5034270', 'P9832', 'MSC', 'FCIU9807729', 'Devan - Nights', NULL, NULL, NULL, 'P9832', NULL, 'MSC', NULL, NULL, 'FCIU9807729', 0, '=IF(AZ200>0,VLOOKUP(AZ200,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(119, '2022-05-18', 'D', '07.30', 'P9834', 'MSC', NULL, 'TRHU8729209', 'Exchange & Shunt', 'P9832', NULL, 'MSC', 'FCIU9807729', 'P9833', 'MSC', 'MSDU7588920', 'Devan - Days', NULL, NULL, NULL, 'P9833', NULL, 'MSC', NULL, NULL, 'MSDU7588920', 0, '=IF(AZ202>0,VLOOKUP(AZ202,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(120, '2022-05-18', 'N', '0.85416666666667', 'P9835', 'MAERSK', NULL, 'MRSU4471197', 'Exchange & Shunt', 'P9833', NULL, 'MSC', 'MSDU7588920', 'P9834', 'MSC', 'TRHU8729209', 'Devan - Nights', NULL, NULL, NULL, 'P9834', NULL, 'MSC', NULL, NULL, 'TRHU8729209', 0, '=IF(AZ203>0,VLOOKUP(AZ203,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(121, '2022-05-19', 'D', '07.30', 'P9836', 'MAERSK', NULL, 'MRSU4648261', 'Exchange & Shunt', 'P9834', NULL, 'MSC', 'TRHU8729209', 'P9835', 'MAERSK', 'MRSU4471197', 'Devan - Days', NULL, NULL, NULL, 'P9835', NULL, 'MAERSK', NULL, NULL, 'MRSU4471197', 0, '=IF(AZ205>0,VLOOKUP(AZ205,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(122, '2022-05-19', 'N', '18.00', 'P9837', 'CMA', NULL, 'CMAU8537006', 'Exchange & Shunt', 'P9835', NULL, 'MAERSK', 'MRSU4471197', 'P9836', 'MAERSK', 'MRSU4648261', 'Devan - Nights', NULL, NULL, NULL, 'P9836', NULL, 'MAERSK', NULL, NULL, 'MRSU4648261', 0, '=IF(AZ206>0,VLOOKUP(AZ206,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(123, '2022-05-20', 'D', '07.30', 'P9838', 'CMA', NULL, 'TLLU7545185', 'Exchange & Shunt', 'P9836', NULL, 'MAERSK', 'MRSU4648261', 'P9837', 'CMA', 'CMAU8537006', 'Devan - Days', NULL, NULL, NULL, 'P9837', NULL, 'CMA', NULL, NULL, 'CMAU8537006', 0, '=IF(AZ208>0,VLOOKUP(AZ208,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(124, '2022-05-20', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `container_devan` (`id`, `date`, `shift`, `time`, `inbound_renban_air_freight_case_number`, `shipping_line`, `number_of_zr_modules`, `container_number`, `pentalver_instructions`, `departure_inbound_renban`, `departure_export_load_reference`, `departure_shipping_line`, `departure_container_number`, `on_dock_inbound_renban`, `on_dock_shipping_line`, `on_doc_container_number`, `in_house_instructions`, `confirm_gl_tl_instructions_print_name`, `confirm_gl_customs_check_print_name`, `confirm_module_condition_quantity`, `devan_inbound_renban_no_1`, `devan_export_renban`, `devan_shipping_line`, `devan_zr`, `pipcont_pipseal`, `in_house_container_number`, `expected_seal_no_yse_no`, `expected_seal_no`, `deeside_yard_inbound_renban_no_1`, `deeside_yard_tapped_modules_no_1`, `deeside_yard_container_number_no_1`, `deeside_yard_inbound_renban_no_2`, `deeside_yard_tapped_modules_no_2`, `deeside_yard_container_number_no_2`, `deeside_yard_inbound_renban_no_3`, `deeside_yard_tapped_modules_no_3`, `deeside_yard_container_number_no_3`, `approved_by`, `created_at`, `updated_at`, `is_completed`, `completed_by`, `completed_at`, `revan_state`) VALUES
(125, '2022-05-23', 'D', '07.30', 'P9839', 'CMA', NULL, 'CAIU9577886', 'Exchange & Shunt', 'P9837', NULL, 'CMA', 'CMAU8537006', 'P9838', 'CMA', 'TLLU7545185', 'Devan - Days', NULL, NULL, NULL, 'P9838', NULL, 'CMA', NULL, NULL, 'TLLU7545185', 0, '=IF(AZ211>0,VLOOKUP(AZ211,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(126, '2022-05-23', 'N', '20.30', 'P9840', 'CMA', NULL, 'TCNU3605536', 'Exchange & Shunt', 'P9838', NULL, 'CMA', 'TLLU7545185', 'P9839', 'CMA', 'CAIU9577886', 'Devan - Nights', NULL, NULL, NULL, 'P9839', NULL, 'CMA', NULL, NULL, 'CAIU9577886', 0, '=IF(AZ212>0,VLOOKUP(AZ212,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(127, '2022-05-24', 'D', '07.30', 'P9841', 'CMA', NULL, 'TRHU7089513', 'Exchange & Shunt', 'P9839', NULL, 'CMA', 'CAIU9577886', 'P9840', 'CMA', 'TCNU3605536', 'Devan - Days', NULL, NULL, NULL, 'P9840', NULL, 'CMA', NULL, NULL, 'TCNU3605536', 0, '=IF(AZ214>0,VLOOKUP(AZ214,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(128, '2022-05-24', 'N', '20.30', 'P9842', 'ONE', NULL, 'GCXU5214482', 'Exchange & Shunt', 'P9840', NULL, 'CMA', 'TCNU3605536', 'P9841', 'CMA', 'TRHU7089513', 'Devan - Nights', NULL, NULL, NULL, 'P9841', NULL, 'CMA', NULL, NULL, 'TRHU7089513', 0, '=IF(AZ215>0,VLOOKUP(AZ215,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(129, '2022-05-25', 'D', '07.30', 'P9843', 'ONE', NULL, 'ONEU0255902', 'Exchange & Shunt', 'P9841', NULL, 'CMA', 'TRHU7089513', 'P9842', 'ONE', 'GCXU5214482', 'Devan - Days', NULL, NULL, NULL, 'P9842', NULL, 'ONE', NULL, NULL, 'GCXU5214482', 0, '=IF(AZ217>0,VLOOKUP(AZ217,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(130, '2022-05-25', 'N', '0.85416666666667', 'P9844', 'ONE', NULL, 'FDCU0447724', 'Exchange & Shunt', 'P9842', NULL, 'ONE', 'GCXU5214482', 'P9843', 'ONE', 'ONEU0255902', 'Devan - Nights', NULL, NULL, NULL, 'P9843', NULL, 'ONE', NULL, NULL, 'ONEU0255902', 0, '=IF(AZ218>0,VLOOKUP(AZ218,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(131, '2022-05-26', 'D', '07.30', 'P9845', 'ONE', NULL, 'SEKU4424839', 'Exchange & Shunt', 'P9843', NULL, 'ONE', 'ONEU0255902', 'P9844', 'ONE', 'FDCU0447724', 'Devan - Days', NULL, NULL, NULL, 'P9844', NULL, 'ONE', NULL, NULL, 'FDCU0447724', 0, '=IF(AZ220>0,VLOOKUP(AZ220,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(132, '2022-05-26', 'N', '20.30', 'P9846', 'MAERSK', NULL, 'MRSU4693635', 'Exchange & Shunt', 'P9844', NULL, 'ONE', 'FDCU0447724', 'P9845', 'ONE', 'SEKU4424839', 'Devan - Nights', NULL, NULL, NULL, 'P9845', NULL, 'ONE', NULL, NULL, 'SEKU4424839', 0, '=IF(AZ221>0,VLOOKUP(AZ221,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(133, '2022-05-27', 'D', '07.30', 'P9847', 'MAERSK', NULL, 'MRSU4523500', 'Exchange & Shunt', 'P9845', NULL, 'ONE', 'SEKU4424839', 'P9846', 'MAERSK', 'MRSU4693635', 'Devan - Days', NULL, NULL, NULL, 'P9846', NULL, 'MAERSK', NULL, NULL, 'MRSU4693635', 0, '=IF(AZ223>0,VLOOKUP(AZ223,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(134, '2022-05-27', 'N', '18.00', 'P9848', 'MAERSK', NULL, 'TRHU6934354', 'Exchange & Shunt', 'P9846', NULL, 'MAERSK', 'MRSU4693635', 'P9847', 'MAERSK', 'MRSU4523500', 'Devan - Nights', NULL, NULL, NULL, 'P9847', NULL, 'MAERSK', NULL, NULL, 'MRSU4523500', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(135, '2022-05-30', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ226>0,VLOOKUP(AZ226,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(136, '2022-05-30', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ227>0,VLOOKUP(AZ227,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(137, '2022-05-31', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ229>0,VLOOKUP(AZ229,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(138, '2022-05-31', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ230>0,VLOOKUP(AZ230,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(139, '2022-06-01', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - HCIU2003335', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(140, '2022-06-01', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - HCIU2003335', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(141, '2022-06-01', 'N', '0.85416666666667', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ234>0,VLOOKUP(AZ234,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(142, '2022-06-02', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ236>0,VLOOKUP(AZ236,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(143, '2022-06-02', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ237>0,VLOOKUP(AZ237,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(144, '2022-06-03', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ239>0,VLOOKUP(AZ239,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(145, '2022-06-03', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(146, '2022-06-06', 'D', '07.30', 'P9849', 'CMA', NULL, 'CMAU7650358', 'Exchange & Shunt', 'P9847', NULL, 'MAERSK', 'MRSU4523500', 'P9848', 'MAERSK', 'TRHU6934354', 'Devan - Days', NULL, NULL, NULL, 'P9848', NULL, 'MAERSK', NULL, NULL, 'TRHU6934354', 0, '=IF(AZ242>0,VLOOKUP(AZ242,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(147, '2022-06-06', 'N', '20.30', 'P9850', 'CMA', NULL, 'TEMU7282724', 'Exchange & Shunt', 'P9848', NULL, 'MAERSK', 'TRHU6934354', 'P9849', 'CMA', 'CMAU7650358', 'Devan - Nights', NULL, NULL, NULL, 'P9849', NULL, 'CMA', NULL, NULL, 'CMAU7650358', 0, '=IF(AZ243>0,VLOOKUP(AZ243,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(148, '2022-06-07', 'D', '07.30', 'P9851', 'CMA', NULL, 'CMAU8919689', 'Exchange & Shunt', 'P9849', NULL, 'CMA', 'CMAU7650358', 'P9850', 'CMA', 'TEMU7282724', 'Devan - Days', NULL, NULL, NULL, 'P9850', NULL, 'CMA', NULL, NULL, 'TEMU7282724', 0, '=IF(AZ245>0,VLOOKUP(AZ245,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(149, '2022-06-07', 'N', '20.30', 'P9852', 'ONE', NULL, 'FDCU0533606', 'Exchange & Shunt', 'P9850', NULL, 'CMA', 'TEMU7282724', 'P9851', 'CMA', 'CMAU8919689', 'Devan - Nights', NULL, NULL, NULL, 'P9851', NULL, 'CMA', NULL, NULL, 'CMAU8919689', 0, '=IF(AZ246>0,VLOOKUP(AZ246,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(150, '2022-06-08', 'D', '07.30', 'P9853', 'MAERSK', NULL, 'MRSU4761278', 'Exchange & Shunt', 'P9851', NULL, 'CMA', 'CMAU8919689', 'P9852', 'ONE', 'FDCU0533606', 'Devan - Days', NULL, NULL, NULL, 'P9852', NULL, 'ONE', NULL, NULL, 'FDCU0533606', 0, '=IF(AZ248>0,VLOOKUP(AZ248,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(151, '2022-06-08', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ249>0,VLOOKUP(AZ249,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(152, '2022-06-09', 'D', '07.30', 'P9854', 'CMA', NULL, 'CMAU7990105', 'Exchange & Shunt', 'P9852', NULL, 'ONE', 'FDCU0533606', 'P9853', 'MAERSK', 'MRSU4761278', 'Devan - Days', NULL, NULL, NULL, 'P9853', NULL, 'MAERSK', NULL, NULL, 'MRSU4761278', 0, '=IF(AZ251>0,VLOOKUP(AZ251,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(153, '2022-06-09', 'N', '20.30', 'P9855', 'CMA', NULL, 'CMAU6698866', 'Exchange & Shunt', 'P9853', NULL, 'MAERSK', 'MRSU4761278', 'P9854', 'CMA', 'CMAU7990105', 'Devan - Nights', NULL, NULL, NULL, 'P9854', NULL, 'CMA', NULL, NULL, 'CMAU7990105', 0, '=IF(AZ252>0,VLOOKUP(AZ252,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(154, '2022-06-10', 'D', '07.30', 'P9856', 'CMA', NULL, 'TRHU8953862', 'Exchange & Shunt', 'P9854', NULL, 'CMA', 'CMAU7990105', 'P9855', 'CMA', 'CMAU6698866', 'Devan - Days', NULL, NULL, NULL, 'P9855', NULL, 'CMA', NULL, NULL, 'CMAU6698866', 0, '=IF(AZ254>0,VLOOKUP(AZ254,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(155, '2022-06-10', 'N', '18.00', 'P9857', 'ONE', NULL, 'FDCU0454868', 'Exchange & Shunt', 'P9855', NULL, 'CMA', 'CMAU6698866', 'P9856', 'CMA', 'TRHU8953862', 'Devan - Nights', NULL, NULL, NULL, 'P9856', NULL, 'CMA', NULL, NULL, 'TRHU8953862', 0, '=IF(AZ255>0,VLOOKUP(AZ255,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(156, '2022-06-13', 'D', '07.30', '-', '-', NULL, '', 'Exchange & Shunt', '-', NULL, '-', '', 'P9857', 'ONE', 'FDCU0454868', 'Devan - Days', NULL, NULL, NULL, 'P9857', NULL, 'ONE', NULL, NULL, 'FDCU0454868', 0, '=IF(AZ257>0,VLOOKUP(AZ257,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(157, '2022-06-13', 'N', '23.59', 'P9860', 'MAERSK', NULL, 'MRSU4993139', '', 'P9857', NULL, 'ONE', 'FDCU0454868', '-', '-', '-', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(158, '2022-06-13', 'N', '23.59', 'P9860', 'MAERSK', NULL, 'MRSU4993139', '', 'P9857', NULL, 'ONE', 'FDCU0454868', '-', '-', '-', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(159, '2022-06-14', 'D', '09.00', 'P9858', 'ONE', NULL, 'SEKU4416432', 'Exchange & Shunt', 'P9859', NULL, 'MAERSK', 'TRHU6306044', 'P9858', 'ONE', 'SEKU4416432', 'Devan - Days', NULL, NULL, NULL, 'P9858', NULL, 'ONE', NULL, NULL, 'SEKU4416432', 0, '=IF(AZ261>0,VLOOKUP(AZ261,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(160, '2022-06-14', 'N', '20.30', 'P9861', 'CMA', NULL, 'SEKU4528900', 'Exchange & Shunt', 'P9858', NULL, 'ONE', 'SEKU4416432', 'P9860', 'MAERSK', 'MRSU4993139', 'Devan - Nights', NULL, NULL, NULL, 'P9860', NULL, 'MAERSK', NULL, NULL, 'MRSU4993139', 0, '=IF(AZ262>0,VLOOKUP(AZ262,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(161, '2022-06-15', 'D', '07.30', 'P9862', 'CMA', NULL, 'TCNU5194202', 'Exchange & Shunt', 'P9860', NULL, 'MAERSK', 'MRSU4993139', 'P9861', 'CMA', 'SEKU4528900', 'Devan - Days', NULL, NULL, NULL, 'P9861', NULL, 'CMA', NULL, NULL, 'SEKU4528900', 0, '=IF(AZ264>0,VLOOKUP(AZ264,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(162, '2022-06-15', 'N', '20.30', 'P9863', 'ONE', NULL, 'TRHU5318420', 'Exchange & Shunt', 'P9861', NULL, 'CMA', 'SEKU4528900', 'P9862', 'CMA', 'TCNU5194202', 'Devan - Nights', NULL, NULL, NULL, 'P9862', NULL, 'CMA', NULL, NULL, 'TCNU5194202', 0, '=IF(AZ265>0,VLOOKUP(AZ265,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(163, '2022-06-16', 'D', '07.30', 'P9885', 'MAERSK', NULL, 'TRHU4586645', 'Exchange & Shunt', 'P9862', NULL, 'CMA', 'TCNU5194202', 'P9885', 'MAERSK', 'TRHU4586645', 'Devan - Days', NULL, NULL, NULL, 'P9885', NULL, 'MAERSK', NULL, NULL, 'TRHU4586645', 0, '=IF(AZ267>0,VLOOKUP(AZ267,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(164, '2022-06-16', 'N', '20.30', 'P9864', 'ONE', NULL, 'TRHU6204340', 'Exchange & Shunt', 'P9885', NULL, 'MAERSK', 'TRHU4586645', 'P9863', 'ONE', 'TRHU5318420', 'Devan - Nights', NULL, NULL, NULL, 'P9863', NULL, 'ONE', NULL, NULL, 'TRHU5318420', 0, '=IF(AZ268>0,VLOOKUP(AZ268,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(165, '2022-06-17', 'D', '07.30', 'P9865', 'ONE', NULL, 'TRHU5888444', 'Exchange & Shunt', 'P9863', NULL, 'ONE', 'TRHU5318420', 'P9864', 'ONE', 'TRHU6204340', 'Devan - Days', NULL, NULL, NULL, 'P9864', NULL, 'ONE', NULL, NULL, 'TRHU6204340', 0, '=IF(AZ270>0,VLOOKUP(AZ270,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(166, '2022-06-17', 'N', '18.00', 'P9866', 'MAERSK', NULL, 'MRSU4404579', 'Exchange & Shunt', 'P9864', NULL, 'ONE', 'TRHU6204340', 'P9865', 'ONE', 'TRHU5888444', 'Devan - Nights', NULL, NULL, NULL, 'P9865', NULL, 'ONE', NULL, NULL, 'TRHU5888444', 0, '=IF(AZ271>0,VLOOKUP(AZ271,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(167, '2022-06-20', 'D', '07.30', 'P9867', 'MAERSK', NULL, 'HASU4543867', 'Exchange & Shunt', 'P9865', NULL, 'ONE', 'TRHU5888444', 'P9866', 'MAERSK', 'MRSU4404579', 'Devan - Days', NULL, NULL, NULL, 'P9866', NULL, 'MAERSK', NULL, NULL, 'MRSU4404579', 0, '=IF(AZ273>0,VLOOKUP(AZ273,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(168, '2022-06-20', 'N', '20.30', 'P9868', 'MAERSK', NULL, 'HASU4533719', 'Exchange & Shunt', 'P9866', NULL, 'MAERSK', 'MRSU4404579', 'P9867', 'MAERSK', 'HASU4543867', 'Devan - Nights', NULL, NULL, NULL, 'P9867', NULL, 'MAERSK', NULL, NULL, 'HASU4543867', 0, '=IF(AZ274>0,VLOOKUP(AZ274,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(169, '2022-06-21', 'D', '07.30', 'P9869', 'ONE', NULL, 'TRHU5225740', 'Exchange & Shunt', 'P9867', NULL, 'MAERSK', 'HASU4543867', 'P9868', 'MAERSK', 'HASU4533719', 'Devan - Days', NULL, NULL, NULL, 'P9868', NULL, 'MAERSK', NULL, NULL, 'HASU4533719', 0, '=IF(AZ276>0,VLOOKUP(AZ276,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(170, '2022-06-21', 'N', '20.30', 'P9870', 'ONE', NULL, 'TCLU5468158', 'Exchange & Shunt', 'P9868', NULL, 'MAERSK', 'HASU4533719', 'P9869', 'ONE', 'TRHU5225740', 'Devan - Nights', NULL, NULL, NULL, 'P9869', NULL, 'ONE', NULL, NULL, 'TRHU5225740', 0, '=IF(AZ277>0,VLOOKUP(AZ277,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(171, '2022-06-22', 'D', '07.30', 'P9871', 'MAERSK', NULL, 'TCKU7453144', 'Exchange & Shunt', 'P9869', NULL, 'ONE', 'TRHU5225740', 'P9870', 'ONE', 'TCLU5468158', 'Devan - Days', NULL, NULL, NULL, 'P9870', NULL, 'ONE', NULL, NULL, 'TCLU5468158', 0, '=IF(AZ279>0,VLOOKUP(AZ279,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(172, '2022-06-22', 'N', '20.30', 'P9872', 'MAERSK', NULL, 'MRSU4970581', 'Exchange & Shunt', 'P9870', NULL, 'ONE', 'TCLU5468158', 'P9871', 'MAERSK', 'TCKU7453144', 'Devan - Nights', NULL, NULL, NULL, 'P9871', NULL, 'MAERSK', NULL, NULL, 'TCKU7453144', 0, '=IF(AZ280>0,VLOOKUP(AZ280,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(173, '2022-06-23', 'D', '07.30', 'P9873', 'MAERSK', NULL, 'TXGU5263646', 'Exchange & Shunt', 'P9871', NULL, 'MAERSK', 'TCKU7453144', 'P9872', 'MAERSK', 'MRSU4970581', 'Devan - Days', NULL, NULL, NULL, 'P9872', NULL, 'MAERSK', NULL, NULL, 'MRSU4970581', 0, '=IF(AZ282>0,VLOOKUP(AZ282,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(174, '2022-06-23', 'N', '20.30', 'P9874', 'CMA', NULL, 'BEAU5611036', 'Exchange & Shunt', 'P9872', NULL, 'MAERSK', 'MRSU4970581', 'P9873', 'MAERSK', 'TXGU5263646', 'Devan - Nights', NULL, NULL, NULL, 'P9873', NULL, 'MAERSK', NULL, NULL, 'TXGU5263646', 0, '=IF(AZ283>0,VLOOKUP(AZ283,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(175, '2022-06-24', 'D', '07.30', 'P9875', 'CMA', NULL, 'TRHU6104233', 'Exchange & Shunt', 'P9873', NULL, 'MAERSK', 'TXGU5263646', 'P9874', 'CMA', 'BEAU5611036', 'Devan - Days', NULL, NULL, NULL, 'P9874', NULL, 'CMA', NULL, NULL, 'BEAU5611036', 0, '=IF(AZ285>0,VLOOKUP(AZ285,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(176, '2022-06-24', 'N', '18.00', 'P9876', 'MAERSK', NULL, 'MRSU4909935', 'Exchange & Shunt', 'P9874', NULL, 'CMA', 'BEAU5611036', 'P9875', 'CMA', 'TRHU6104233', 'Devan - Nights', NULL, NULL, NULL, 'P9875', NULL, 'CMA', NULL, NULL, 'TRHU6104233', 0, '=IF(AZ286>0,VLOOKUP(AZ286,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(177, '2022-06-27', 'D', '07.30', 'P9877', 'MAERSK', NULL, 'TCKU7129161', 'Exchange & Shunt', 'P9875', NULL, 'CMA', 'TRHU6104233', 'P9876', 'MAERSK', 'MRSU4909935', 'Devan - Days', NULL, NULL, NULL, 'P9876', NULL, 'MAERSK', NULL, NULL, 'MRSU4909935', 0, '=IF(AZ288>0,VLOOKUP(AZ288,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(178, '2022-06-27', 'N', '20.30', 'P9878', 'MAERSK', NULL, 'TRHU7613873', 'Exchange & Shunt', 'P9876', NULL, 'MAERSK', 'MRSU4909935', 'P9877', 'MAERSK', 'TCKU7129161', 'Devan - Nights', NULL, NULL, NULL, 'P9877', NULL, 'MAERSK', NULL, NULL, 'TCKU7129161', 0, '=IF(AZ289>0,VLOOKUP(AZ289,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(179, '2022-06-28', 'D', '07.30', 'P9879', 'ONE', NULL, 'TRHU7315009', 'Exchange & Shunt', 'P9877', NULL, 'MAERSK', 'TCKU7129161', 'P9878', 'MAERSK', 'TRHU7613873', 'Devan - Days', NULL, NULL, NULL, 'P9878', NULL, 'MAERSK', NULL, NULL, 'TRHU7613873', 0, '=IF(AZ291>0,VLOOKUP(AZ291,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(180, '2022-06-28', 'N', '20.30', 'P9880', 'ONE', NULL, 'BEAU5378990', 'Exchange & Shunt', 'P9878', NULL, 'MAERSK', 'TRHU7613873', 'P9879', 'ONE', 'TRHU7315009', 'Devan - Nights', NULL, NULL, NULL, 'P9879', NULL, 'ONE', NULL, NULL, 'TRHU7315009', 0, '=IF(AZ292>0,VLOOKUP(AZ292,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(181, '2022-06-29', 'D', '07.30', 'P9881', 'CMA', NULL, 'FFAU4508409', 'Exchange & Shunt', 'P9879', NULL, 'ONE', 'TRHU7315009', 'P9880', 'ONE', 'BEAU5378990', 'Devan - Days', NULL, NULL, NULL, 'P9880', NULL, 'ONE', NULL, NULL, 'BEAU5378990', 0, '=IF(AZ294>0,VLOOKUP(AZ294,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(182, '2022-06-29', 'N', '18.00', 'P9882', 'CMA', NULL, 'CMAU6536612', 'Exchange & Shunt', 'P9880', NULL, 'ONE', 'BEAU5378990', '-', '-', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ295>0,VLOOKUP(AZ295,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(183, '2022-06-30', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ297>0,VLOOKUP(AZ297,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(184, '2022-06-30', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ298>0,VLOOKUP(AZ298,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(185, '2022-07-01', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ300>0,VLOOKUP(AZ300,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(186, '2022-07-01', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(187, '1970-01-01', '', '', '', '', NULL, '', '', '', NULL, '', '', '', '', '', 'TMUK-D SUMMER SHUTDOWN 01/08-12/08: NO DELIVERIES', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(188, '2022-07-04', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ304>0,VLOOKUP(AZ304,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(189, '2022-07-04', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ305>0,VLOOKUP(AZ305,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(190, '2022-07-05', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ307>0,VLOOKUP(AZ307,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(191, '2022-07-05', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ308>0,VLOOKUP(AZ308,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(192, '2022-07-06', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ310>0,VLOOKUP(AZ310,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(193, '2022-07-06', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ311>0,VLOOKUP(AZ311,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(194, '2022-07-07', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ313>0,VLOOKUP(AZ313,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(195, '2022-07-07', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ314>0,VLOOKUP(AZ314,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(196, '2022-07-08', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ316>0,VLOOKUP(AZ316,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(197, '2022-07-08', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(198, '2022-07-11', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - NIDU2372939', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(199, '2022-07-11', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - NIDU2372939', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(200, '2022-07-11', 'N', '20.30', 'P9883', 'CMA', NULL, 'BMOU6984830', 'Exchange & Shunt', 'P9881', NULL, 'CMA', 'FFAU4508409', 'P9882', 'CMA', 'CMAU6536612', 'Devan - Nights', NULL, NULL, NULL, 'P9882', NULL, 'CMA', NULL, NULL, 'CMAU6536612', 0, '=IF(AZ321>0,VLOOKUP(AZ321,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(201, '2022-07-12', 'D', '07.30', 'P9884', 'CMA', NULL, 'SEKU5500260', 'Exchange & Shunt', 'P9882', NULL, 'CMA', 'CMAU6536612', 'P9883', 'CMA', 'BMOU6984830', 'Devan - Days', NULL, NULL, NULL, 'P9883', NULL, 'CMA', NULL, NULL, 'BMOU6984830', 0, '=IF(AZ323>0,VLOOKUP(AZ323,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(202, '2022-07-12', 'N', '20.30', 'P9886', 'MAERSK', NULL, 'MRSU4702824', 'Exchange & Shunt', 'P9883', NULL, 'CMA', 'BMOU6984830', 'P9884', 'CMA', 'SEKU5500260', 'Devan - Nights', NULL, NULL, NULL, 'P9884', NULL, 'CMA', NULL, NULL, 'SEKU5500260', 0, '=IF(AZ324>0,VLOOKUP(AZ324,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(203, '2022-07-13', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ326>0,VLOOKUP(AZ326,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(204, '2022-07-13', 'N', '20.30', 'P9887', 'MAERSK', NULL, 'MRSU4267630', 'Exchange & Shunt', 'P9884', NULL, 'CMA', 'SEKU5500260', 'P9886', 'MAERSK', 'MRSU4702824', 'Devan - Nights', NULL, NULL, NULL, 'P9886', NULL, 'MAERSK', NULL, NULL, 'MRSU4702824', 0, '=IF(AZ327>0,VLOOKUP(AZ327,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(205, '2022-07-14', 'D', '07.30', 'P9888', 'MAERSK', NULL, 'CAAU6377222', 'Exchange & Shunt', 'P9886', NULL, 'MAERSK', 'MRSU4702824', 'P9887', 'MAERSK', 'MRSU4267630', 'Devan - Days', NULL, NULL, NULL, 'P9887', NULL, 'MAERSK', NULL, NULL, 'MRSU4267630', 0, '=IF(AZ329>0,VLOOKUP(AZ329,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(206, '2022-07-14', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ330>0,VLOOKUP(AZ330,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(207, '2022-07-15', 'D', '07.30', 'P9889', 'ONE', NULL, 'TRHU8250983', 'Exchange & Shunt', 'P9887', NULL, 'MAERSK', 'MRSU4267630', 'P9888', 'MAERSK', 'CAAU6377222', 'Devan - Days', NULL, NULL, NULL, 'P9888', NULL, 'MAERSK', NULL, NULL, 'CAAU6377222', 0, '=IF(AZ332>0,VLOOKUP(AZ332,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(208, '2022-07-15', 'N', '18.00', 'P9890', 'ONE', NULL, 'GAOU6562618', 'Exchange & Shunt', 'P9888', NULL, 'MAERSK', 'CAAU6377222', 'P9889', 'ONE', 'TRHU8250983', 'Devan - Nights', NULL, NULL, NULL, 'P9889', NULL, 'ONE', NULL, NULL, 'TRHU8250983', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(209, '2022-07-18', 'D', '07.30', 'P9891', 'CMA', NULL, 'TCNU5961557', 'Exchange & Shunt', 'P9889', NULL, 'ONE', 'TRHU8250983', 'P9890', 'ONE', 'GAOU6562618', 'Devan - Days', NULL, NULL, NULL, 'P9890', NULL, 'ONE', NULL, NULL, 'GAOU6562618', 0, '=IF(AZ335>0,VLOOKUP(AZ335,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(210, '2022-07-18', 'N', '20.30', 'P9892', 'CMA', NULL, 'SEKU5523651', 'Exchange & Shunt', 'P9890', NULL, 'ONE', 'GAOU6562618', 'P9891', 'CMA', 'TCNU5961557', 'Devan - Nights', NULL, NULL, NULL, 'P9891', NULL, 'CMA', NULL, NULL, 'TCNU5961557', 0, '=IF(AZ336>0,VLOOKUP(AZ336,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(211, '2022-07-19', 'D', '07.30', 'P9893', 'CMA', NULL, 'SEGU6434683', 'Exchange & Shunt', 'P9891', NULL, 'CMA', 'TCNU5961557', 'P9892', 'CMA', 'SEKU5523651', 'Devan - Days', NULL, NULL, NULL, 'P9892', NULL, 'CMA', NULL, NULL, 'SEKU5523651', 0, '=IF(AZ338>0,VLOOKUP(AZ338,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(212, '2022-07-19', 'N', '20.30', 'P9894', 'MAERSK', NULL, 'CAAU6495122', 'Exchange & Shunt', 'P9892', NULL, 'CMA', 'SEKU5523651', 'P9893', 'CMA', 'SEGU6434683', 'Devan - Nights', NULL, NULL, NULL, 'P9893', NULL, 'CMA', NULL, NULL, 'SEGU6434683', 0, '=IF(AZ339>0,VLOOKUP(AZ339,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(213, '2022-07-20', 'D', '07.30', '-', '', NULL, '', 'Exchange & Shunt', '-', NULL, '', '', '-', '', '', 'Devan - Days', NULL, NULL, NULL, '-', NULL, '', NULL, NULL, '', 0, '=IF(AZ341>0,VLOOKUP(AZ341,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(214, '2022-07-20', 'N', '0.85416666666667', 'P9895', 'MAERSK', NULL, 'MRSU5408985', 'Exchange & Shunt', 'P9893', NULL, 'CMA', 'SEGU6434683', 'P9894', 'MAERSK', 'CAAU6495122', 'Devan - Nights', NULL, NULL, NULL, 'P9894', NULL, 'MAERSK', NULL, NULL, 'CAAU6495122', 0, '=IF(AZ342>0,VLOOKUP(AZ342,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(215, '2022-07-21', 'D', '07.30', 'P9896', 'MAERSK', NULL, 'MRSU5013706', 'Exchange & Shunt', 'P9894', NULL, 'MAERSK', 'CAAU6495122', 'P9895', 'MAERSK', 'MRSU5408985', 'Devan - Days', NULL, NULL, NULL, 'P9895', NULL, 'MAERSK', NULL, NULL, 'MRSU5408985', 0, '=IF(AZ344>0,VLOOKUP(AZ344,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(216, '2022-07-21', 'N', '20.30', 'P9897', 'MAERSK', NULL, 'GCXU5658445', 'Exchange & Shunt', 'P9895', NULL, 'MAERSK', 'MRSU5408985', 'P9896', 'MAERSK', 'MRSU5013706', 'Devan - Nights', NULL, NULL, NULL, 'P9896', NULL, 'MAERSK', NULL, NULL, 'MRSU5013706', 0, '=IF(AZ345>0,VLOOKUP(AZ345,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(217, '2022-07-22', 'D', '07.30', 'P9898', 'ONE', NULL, 'TLLU5577368', 'Exchange & Shunt', 'P9896', NULL, 'MAERSK', 'MRSU5013706', 'P9897', 'MAERSK', 'GCXU5658445', 'Devan - Days', NULL, NULL, NULL, 'P9897', NULL, 'MAERSK', NULL, NULL, 'GCXU5658445', 0, '=IF(AZ347>0,VLOOKUP(AZ347,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(218, '2022-07-22', 'N', '18.00', 'P9899', 'ONE', NULL, 'TRHU5220500', 'Exchange & Shunt', 'P9897', NULL, 'MAERSK', 'GCXU5658445', 'P9898', 'ONE', 'TLLU5577368', 'Devan - Nights', NULL, NULL, NULL, 'P9898', NULL, 'ONE', NULL, NULL, 'TLLU5577368', 0, '=IF(AZ348>0,VLOOKUP(AZ348,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(219, '2022-07-25', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ350>0,VLOOKUP(AZ350,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(220, '2022-07-25', 'N', '20.30', 'P9900', 'CMA', NULL, 'CMAU8961591', 'Exchange & Shunt', 'P9898', NULL, 'ONE', 'TLLU5577368', 'P9899', 'ONE', 'TRHU5220500', 'Devan - Nights', NULL, NULL, NULL, 'P9899', NULL, 'ONE', NULL, NULL, 'TRHU5220500', 0, '=IF(AZ351>0,VLOOKUP(AZ351,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(221, '2022-07-26', 'D', '07.30', 'P9901', 'CMA', NULL, 'TRHU6381217', 'Exchange & Shunt', 'P9899', NULL, 'ONE', 'TRHU5220500', 'P9900', 'CMA', 'CMAU8961591', 'Devan - Days', NULL, NULL, NULL, 'P9900', NULL, 'CMA', NULL, NULL, 'CMAU8961591', 0, '=IF(AZ353>0,VLOOKUP(AZ353,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(222, '2022-07-26', 'N', '20.30', 'P9902', 'CMA', NULL, 'FFAU4500331', 'Exchange & Shunt', 'P9900', NULL, 'CMA', 'CMAU8961591', 'P9901', 'CMA', 'TRHU6381217', 'Devan - Nights', NULL, NULL, NULL, 'P9901', NULL, 'CMA', NULL, NULL, 'TRHU6381217', 0, '=IF(AZ354>0,VLOOKUP(AZ354,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(223, '2022-07-27', 'D', '07.30', 'P9903', 'CMA', NULL, 'TCNU5721685', 'Exchange & Shunt', 'P9901', NULL, 'CMA', 'TRHU6381217', 'P9902', 'CMA', 'FFAU4500331', 'Devan - Days', NULL, NULL, NULL, 'P9902', NULL, 'CMA', NULL, NULL, 'FFAU4500331', 0, '=IF(AZ356>0,VLOOKUP(AZ356,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(224, '2022-07-27', 'N', '20.30', 'P9904', 'MAERSK', NULL, 'MRSU4960393', 'Exchange & Shunt', 'P9902', NULL, 'CMA', 'FFAU4500331', 'P9903', 'CMA', 'TCNU5721685', 'Devan - Nights', NULL, NULL, NULL, 'P9903', NULL, 'CMA', NULL, NULL, 'TCNU5721685', 0, '=IF(AZ357>0,VLOOKUP(AZ357,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(225, '2022-07-28', 'D', '07.30', 'P9905', 'MAERSK', NULL, 'MRSU5483269', 'Exchange & Shunt', 'P9903', NULL, 'CMA', 'TCNU5721685', 'P9904', 'MAERSK', 'MRSU4960393', 'Devan - Days', NULL, NULL, NULL, 'P9904', NULL, 'MAERSK', NULL, NULL, 'MRSU4960393', 0, '=IF(AZ359>0,VLOOKUP(AZ359,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(226, '2022-07-28', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ360>0,VLOOKUP(AZ360,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(227, '2022-07-29', 'D', '07.30', 'P9906', 'MAERSK', NULL, 'MRSU5147140', 'Exchange & Shunt', 'P9904', NULL, 'MAERSK', 'MRSU4960393', 'P9905', 'MAERSK', 'MRSU5483269', 'Devan - Days', NULL, NULL, NULL, 'P9905', NULL, 'MAERSK', NULL, NULL, 'MRSU5483269', 0, '=IF(AZ362>0,VLOOKUP(AZ362,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(228, '2022-07-29', 'N', '18.00', 'P9907', 'MAERSK', NULL, 'TRHU7145324', 'Exchange & Shunt', 'P9905', NULL, 'MAERSK', 'MRSU5483269', 'P9906', 'MAERSK', 'MRSU5147140', 'Devan - Nights', NULL, NULL, NULL, 'P9906', NULL, 'MAERSK', NULL, NULL, 'MRSU5147140', 0, '=IF(AZ363>0,VLOOKUP(AZ363,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(229, '1970-01-01', '', '', '', '', NULL, '', '', '', NULL, '', '', '', '', '', 'TMUK-D SUMMER SHUTDOWN 01/08-12/08: NO DELIVERIES', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(230, '2022-08-15', 'D', '07.30', 'P9908', 'MAERSK', NULL, 'TRHU6181857', 'Exchange & Shunt', 'P9906', NULL, 'MAERSK', 'MRSU5147140', 'P9907', 'MAERSK', 'TRHU7145324', 'Devan - Days', NULL, NULL, NULL, 'P9907', NULL, 'MAERSK', NULL, NULL, 'TRHU7145324', 0, '=IF(AZ367>0,VLOOKUP(AZ367,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(231, '2022-08-15', 'N', '20.30', 'P9909', 'CMA', NULL, 'FCIU9008147', 'Exchange & Shunt', 'P9907', NULL, 'MAERSK', 'TRHU7145324', 'P9908', 'MAERSK', 'TRHU6181857', 'Devan - Nights', NULL, NULL, NULL, 'P9908', NULL, 'MAERSK', NULL, NULL, 'TRHU6181857', 0, '=IF(AZ368>0,VLOOKUP(AZ368,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(232, '2022-08-16', 'D', '07.30', 'P9910', 'CMA', NULL, 'CMAU7683520', 'Exchange & Shunt', 'P9908', NULL, 'MAERSK', 'TRHU6181857', 'P9909', 'CMA', 'FCIU9008147', 'Devan - Days', NULL, NULL, NULL, 'P9909', NULL, 'CMA', NULL, NULL, 'FCIU9008147', 0, '=IF(AZ370>0,VLOOKUP(AZ370,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(233, '2022-08-16', 'N', '20.30', 'P9911', 'CMA', NULL, 'TCNU3550808', 'Exchange & Shunt', 'P9909', NULL, 'CMA', 'FCIU9008147', 'P9910', 'CMA', 'CMAU7683520', 'Devan - Nights', NULL, NULL, NULL, 'P9910', NULL, 'CMA', NULL, NULL, 'CMAU7683520', 0, '=IF(AZ371>0,VLOOKUP(AZ371,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(234, '2022-08-17', 'D', '07.30', 'P9912', 'CMA', NULL, 'BEAU6300548', 'Exchange & Shunt', 'P9910', NULL, 'CMA', 'CMAU7683520', 'P9911', 'CMA', 'TCNU3550808', 'Devan - Days', NULL, NULL, NULL, 'P9911', NULL, 'CMA', NULL, NULL, 'TCNU3550808', 0, '=IF(AZ373>0,VLOOKUP(AZ373,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(235, '2022-08-17', 'N', '20.30', 'P9913', 'MAERSK', NULL, 'CAAU5226860', 'Exchange & Shunt', 'P9911', NULL, 'CMA', 'TCNU3550808', 'P9912', 'CMA', 'BEAU6300548', 'Devan - Nights', NULL, NULL, NULL, 'P9912', NULL, 'CMA', NULL, NULL, 'BEAU6300548', 0, '=IF(AZ374>0,VLOOKUP(AZ374,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(236, '2022-08-18', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - TCLU2862403', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(237, '2022-08-18', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - TCLU2862403', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(238, '2022-08-18', 'N', '20.30', 'P9915', 'MAERSK', NULL, 'MRSU4234338', 'Exchange & Shunt', 'P9913', NULL, 'MAERSK', 'CAAU5226860', 'P9914', 'MAERSK', 'TRHU7608603', 'Devan - Nights', NULL, NULL, NULL, 'P9914', NULL, 'MAERSK', NULL, NULL, 'TRHU7608603', 0, '=IF(AZ378>0,VLOOKUP(AZ378,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(239, '2022-08-19', 'D', '10.00', 'NORTH AMERICA LIVE DEVAN - UACU3922830', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(240, '2022-08-19', 'D', '10.00', 'NORTH AMERICA LIVE DEVAN - UACU3922830', '', NULL, '', '', '', NULL, '', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(241, '2022-08-19', 'N', '18.00', 'P9917', 'ONE', NULL, 'GCXU5397594', 'Exchange & Shunt', 'P9915', NULL, 'MAERSK', 'MRSU4234338', 'P9916', 'MAERSK', 'TRHU8432798', 'Devan - Nights', NULL, NULL, NULL, 'P9916', NULL, 'MAERSK', NULL, NULL, 'TRHU8432798', 0, '=IF(AZ382>0,VLOOKUP(AZ382,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(242, '2022-08-22', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ384>0,VLOOKUP(AZ384,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(243, '2022-08-22', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ385>0,VLOOKUP(AZ385,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(244, '2022-08-23', 'D', '07.30', 'P9918', 'ONE', NULL, 'MOTU6701580', 'Exchange & Shunt', 'P9916', NULL, 'MAERSK', 'TRHU8432798', 'P9917', 'ONE', 'GCXU5397594', 'Devan - Days', NULL, NULL, NULL, 'P9917', NULL, 'ONE', NULL, NULL, 'GCXU5397594', 0, '=IF(AZ387>0,VLOOKUP(AZ387,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(245, '2022-08-23', 'N', '20.30', 'P9919', 'CMA', NULL, 'DRYU9980070', 'Exchange & Shunt', 'P9917', NULL, 'ONE', 'GCXU5397594', 'P9918', 'ONE', 'MOTU6701580', 'Devan - Nights', NULL, NULL, NULL, 'P9918', NULL, 'ONE', NULL, NULL, 'MOTU6701580', 0, '=IF(AZ388>0,VLOOKUP(AZ388,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(246, '2022-08-24', 'D', '07.30', 'P9920', 'CMA', NULL, 'CMAU8684500', 'Exchange & Shunt', 'P9918', NULL, 'ONE', 'MOTU6701580', 'P9919', 'CMA', 'DRYU9980070', 'Devan - Days', NULL, NULL, NULL, 'P9919', NULL, 'CMA', NULL, NULL, 'DRYU9980070', 0, '=IF(AZ390>0,VLOOKUP(AZ390,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(247, '2022-08-24', 'N', '20.30', 'P9921', 'CMA', NULL, 'CAAU5960641', 'Exchange & Shunt', 'P9919', NULL, 'CMA', 'DRYU9980070', 'P9920', 'CMA', 'CMAU8684500', 'Devan - Nights', NULL, NULL, NULL, 'P9920', NULL, 'CMA', NULL, NULL, 'CMAU8684500', 0, '=IF(AZ391>0,VLOOKUP(AZ391,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(248, '2022-08-25', 'D', '07.30', 'P9922', 'CMA', NULL, 'TLLU7937020', 'Exchange & Shunt', 'P9920', NULL, 'CMA', 'CMAU8684500', 'P9921', 'CMA', 'CAAU5960641', 'Devan - Days', NULL, NULL, NULL, 'P9921', NULL, 'CMA', NULL, NULL, 'CAAU5960641', 0, '=IF(AZ393>0,VLOOKUP(AZ393,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(249, '2022-08-25', 'N', '18.00', 'P9923', 'MAERSK', NULL, 'TRHU5099750', 'Exchange & Shunt', 'P9921', NULL, 'CMA', 'CAAU5960641', 'P9922', 'CMA', 'TLLU7937020', 'Devan - Nights', NULL, NULL, NULL, 'P9922', NULL, 'CMA', NULL, NULL, 'TLLU7937020', 0, '=IF(AZ394>0,VLOOKUP(AZ394,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(250, '2022-08-26', 'D', '07.30', '-', '-', NULL, '-', 'Exchange & Shunt', '-', NULL, '-', '-', 'P9923', 'MAERSK', 'TRHU5099750', 'Devan - Days', NULL, NULL, NULL, 'P9923', NULL, 'MAERSK', NULL, NULL, 'TRHU5099750', 0, '=IF(AZ396>0,VLOOKUP(AZ396,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(251, '2022-08-26', 'N', '18.00', 'P9924', 'MAERSK', NULL, 'MRSU4561958', 'Exchange & Shunt', 'P9922', NULL, 'CMA', 'TLLU7937020', '-', '-', '-', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ397>0,VLOOKUP(AZ397,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(252, '2022-08-29', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ399>0,VLOOKUP(AZ399,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(253, '2022-08-29', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ400>0,VLOOKUP(AZ400,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(254, '2022-08-30', 'D', '07.30', 'P9925', 'MAERSK', NULL, 'TRHU4844544', 'Exchange & Shunt', 'P9923', NULL, 'MAERSK', 'TRHU5099750', 'P9924', 'MAERSK', 'MRSU4561958', 'Devan - Days', NULL, NULL, NULL, 'P9924', NULL, 'MAERSK', NULL, NULL, 'MRSU4561958', 0, '=IF(AZ402>0,VLOOKUP(AZ402,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(255, '2022-08-30', 'N', '20.30', 'P9926', 'MAERSK', NULL, 'TCKU7549523', 'Exchange & Shunt', 'P9924', NULL, 'MAERSK', 'MRSU4561958', 'P9925', 'MAERSK', 'TRHU4844544', 'Devan - Nights', NULL, NULL, NULL, 'P9925', NULL, 'MAERSK', NULL, NULL, 'TRHU4844544', 0, '=IF(AZ403>0,VLOOKUP(AZ403,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, '');
INSERT INTO `container_devan` (`id`, `date`, `shift`, `time`, `inbound_renban_air_freight_case_number`, `shipping_line`, `number_of_zr_modules`, `container_number`, `pentalver_instructions`, `departure_inbound_renban`, `departure_export_load_reference`, `departure_shipping_line`, `departure_container_number`, `on_dock_inbound_renban`, `on_dock_shipping_line`, `on_doc_container_number`, `in_house_instructions`, `confirm_gl_tl_instructions_print_name`, `confirm_gl_customs_check_print_name`, `confirm_module_condition_quantity`, `devan_inbound_renban_no_1`, `devan_export_renban`, `devan_shipping_line`, `devan_zr`, `pipcont_pipseal`, `in_house_container_number`, `expected_seal_no_yse_no`, `expected_seal_no`, `deeside_yard_inbound_renban_no_1`, `deeside_yard_tapped_modules_no_1`, `deeside_yard_container_number_no_1`, `deeside_yard_inbound_renban_no_2`, `deeside_yard_tapped_modules_no_2`, `deeside_yard_container_number_no_2`, `deeside_yard_inbound_renban_no_3`, `deeside_yard_tapped_modules_no_3`, `deeside_yard_container_number_no_3`, `approved_by`, `created_at`, `updated_at`, `is_completed`, `completed_by`, `completed_at`, `revan_state`) VALUES
(256, '2022-08-31', 'D', '07.30', 'P9927', 'MAERSK', NULL, 'CAAU6644226', 'Exchange & Shunt', 'P9925', NULL, 'MAERSK', 'TRHU4844544', 'P9926', 'MAERSK', 'TCKU7549523', 'Devan - Days', NULL, NULL, NULL, 'P9926', NULL, 'MAERSK', NULL, NULL, 'TCKU7549523', 0, '=IF(AZ405>0,VLOOKUP(AZ405,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(257, '2022-08-31', 'N', '0.85416666666667', 'P9928', 'ONE', NULL, 'DFSU7830683', 'Exchange & Shunt', 'P9926', NULL, 'MAERSK', 'TCKU7549523', 'P9927', 'MAERSK', 'CAAU6644226', 'Devan - Nights', NULL, NULL, NULL, 'P9927', NULL, 'MAERSK', NULL, NULL, 'CAAU6644226', 0, '=IF(AZ406>0,VLOOKUP(AZ406,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(258, '2022-09-01', 'D', '07.30', 'P9929', 'ONE', NULL, 'TRHU5391397', 'Exchange & Shunt', 'P9927', NULL, 'MAERSK', 'CAAU6644226', 'P9928', 'ONE', 'DFSU7830683', 'Devan - Days', NULL, NULL, NULL, 'P9928', NULL, 'ONE', NULL, NULL, 'DFSU7830683', 0, '=IF(AZ408>0,VLOOKUP(AZ408,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(259, '2022-09-01', 'N', '20.30', 'P9930', 'CMA', NULL, 'CMAU7838643', 'Exchange & Shunt', 'P9928', NULL, 'ONE', 'DFSU7830683', 'P9929', 'ONE', 'TRHU5391397', 'Devan - Nights', NULL, NULL, NULL, 'P9929', NULL, 'ONE', NULL, NULL, 'TRHU5391397', 0, '=IF(AZ409>0,VLOOKUP(AZ409,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(260, '2022-09-02', 'D', '07.30', 'P9931', 'CMA', NULL, 'BMOU6721325', 'Exchange & Shunt', 'P9929', NULL, 'ONE', 'TRHU5391397', 'P9930', 'CMA', 'CMAU7838643', 'Devan - Days', NULL, NULL, NULL, 'P9930', NULL, 'CMA', NULL, NULL, 'CMAU7838643', 0, '=IF(AZ411>0,VLOOKUP(AZ411,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(261, '2022-09-02', 'N', '18.00', 'P9932', 'CMA', NULL, 'CMAU7942508', 'Exchange & Shunt', 'P9930', NULL, 'CMA', 'CMAU7838643', 'P9931', 'CMA', 'BMOU6721325', 'Devan - Nights', NULL, NULL, NULL, 'P9931', NULL, 'CMA', NULL, NULL, 'BMOU6721325', 0, '=IF(AZ412>0,VLOOKUP(AZ412,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(262, '2022-09-05', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ414>0,VLOOKUP(AZ414,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(263, '2022-09-05', 'N', '20.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ415>0,VLOOKUP(AZ415,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(264, '2022-09-06', 'D', '07.30', 'P9933', 'CMA', NULL, 'TRHU7979158', 'Exchange & Shunt', 'P9931', NULL, 'CMA', 'BMOU6721325', 'P9932', 'CMA', 'CMAU7942508', 'Devan - Days', NULL, NULL, NULL, 'P9932', NULL, 'CMA', NULL, NULL, 'CMAU7942508', 0, '=IF(AZ417>0,VLOOKUP(AZ417,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(265, '2022-09-06', 'N', '20.30', 'P9934', 'CMA', NULL, 'BEAU4029843', 'Exchange & Shunt', 'P9932', NULL, 'CMA', 'CMAU7942508', 'P9933', 'CMA', 'TRHU7979158', 'Devan - Nights', NULL, NULL, NULL, 'P9933', NULL, 'CMA', NULL, NULL, 'TRHU7979158', 0, '=IF(AZ418>0,VLOOKUP(AZ418,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(266, '2022-09-07', 'D', '07.30', 'P9935', 'MAERSK', NULL, 'MSKU1789645', 'Exchange & Shunt', 'P9933', NULL, 'CMA', 'TRHU7979158', 'P9934', 'CMA', 'BEAU4029843', 'Devan - Days', NULL, NULL, NULL, 'P9934', NULL, 'CMA', NULL, NULL, 'BEAU4029843', 0, '=IF(AZ420>0,VLOOKUP(AZ420,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(267, '2022-09-07', 'N', '20.30', 'P9936', 'MAERSK', NULL, 'CIPU5057747', 'Exchange & Shunt', 'P9934', NULL, 'CMA', 'BEAU4029843', 'P9935', 'MAERSK', 'MSKU1789645', 'Devan - Nights', NULL, NULL, NULL, 'P9935', NULL, 'MAERSK', NULL, NULL, 'MSKU1789645', 0, '=IF(AZ421>0,VLOOKUP(AZ421,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(268, '2022-09-08', 'D', '07.30', 'P9937', 'MAERSK', NULL, 'TRHU6182339', 'Exchange & Shunt', 'P9935', NULL, 'MAERSK', 'MSKU1789645', 'P9936', 'MAERSK', 'CIPU5057747', 'Devan - Days', NULL, NULL, NULL, 'P9936', NULL, 'MAERSK', NULL, NULL, 'CIPU5057747', 0, '=IF(AZ423>0,VLOOKUP(AZ423,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(269, '2022-09-08', 'N', '20.30', 'P9962', 'ONE', NULL, 'GAOU6533760', 'Exchange & Shunt', 'P9936', NULL, 'MAERSK', 'CIPU5057747', 'P9962', 'ONE', 'GAOU6533760', 'Devan - Nights', NULL, NULL, NULL, 'P9962', NULL, 'ONE', NULL, NULL, 'GAOU6533760', 0, '=IF(AZ424>0,VLOOKUP(AZ424,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(270, '2022-09-09', 'D', '07.30', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ426>0,VLOOKUP(AZ426,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(271, '2022-09-09', 'N', '18.00', 'P9938', 'MAERSK', NULL, 'TRHU7290960', 'Exchange & Shunt', 'P9962', NULL, 'ONE', 'GAOU6533760', 'P9937', 'MAERSK', 'TRHU6182339', 'Devan - Nights', NULL, NULL, NULL, 'P9937', NULL, 'MAERSK', NULL, NULL, 'TRHU6182339', 0, '=IF(AZ427>0,VLOOKUP(AZ427,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(272, '2022-09-12', 'D', '06.00', 'P9939', 'MAERSK', NULL, 'MRSU4676793', 'Exchange & Shunt', 'P9937', NULL, 'MAERSK', 'TRHU6182339', 'P9938', 'MAERSK', 'TRHU7290960', 'Devan - Days', NULL, NULL, NULL, '=AF429', NULL, '=AI429', NULL, NULL, '=AQ429', 0, '=IF(AZ429>0,VLOOKUP(AZ429,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(273, '2022-09-12', 'N', '18.00', 'P9940', 'ONE', NULL, 'TRHU4348082', 'Exchange & Shunt', 'P9938', NULL, 'MAERSK', 'TRHU7290960', 'P9939', 'MAERSK', 'MRSU4676793', 'Devan - Nights', NULL, NULL, NULL, '=AF430', NULL, '=AI430', NULL, NULL, '=AQ430', 0, '=IF(AZ430>0,VLOOKUP(AZ430,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(274, '2022-09-13', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - TRHU1911490', '', NULL, '', '', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(275, '2022-09-13', 'D', '13.00', 'NORTH AMERICA LIVE DEVAN - TRHU1911490', '', NULL, '', '', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(276, '2022-09-13', 'N', '18.00', 'P9941', 'ONE', NULL, 'GAOU6537641', 'Exchange & Shunt', 'P9939', NULL, 'MAERSK', 'MRSU4676793', 'P9940', 'ONE', 'TRHU4348082', 'Devan - Nights', NULL, NULL, NULL, '=AF434', NULL, '=AI434', NULL, NULL, '=AQ434', 0, '=IF(AZ434>0,VLOOKUP(AZ434,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(277, '2022-09-14', 'D', '06.00', 'P9942', 'CMA', NULL, 'CMAU6446000', 'Exchange & Shunt', 'P9940', NULL, 'ONE', 'TRHU4348082', 'P9941', 'ONE', 'GAOU6537641', 'Devan - Days', NULL, NULL, NULL, '=AF436', NULL, '=AI436', NULL, NULL, '=AQ436', 0, '=IF(AZ436>0,VLOOKUP(AZ436,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(278, '2022-09-14', 'N', '18.00', 'P9943', 'CMA', NULL, 'CMAU7938832', 'Exchange & Shunt', 'P9941', NULL, 'ONE', 'GAOU6537641', 'P9942', 'CMA', 'CMAU6446000', 'Devan - Nights', NULL, NULL, NULL, '=AF437', NULL, '=AI437', NULL, NULL, '=AQ437', 0, '=IF(AZ437>0,VLOOKUP(AZ437,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(279, '2022-09-15', 'D', '06.00', 'P9944', 'CMA', NULL, 'CMAU6662164', 'Exchange & Shunt', 'P9942', NULL, 'CMA', 'CMAU6446000', 'P9943', 'CMA', 'CMAU7938832', 'Devan - Days', NULL, NULL, NULL, '=AF439', NULL, '=AI439', NULL, NULL, '=AQ439', 0, '=IF(AZ439>0,VLOOKUP(AZ439,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(280, '2022-09-15', 'N', '18.00', 'P9945', 'CMA', NULL, 'CMAU6918050', 'Exchange & Shunt', 'P9943', NULL, 'CMA', 'CMAU7938832', 'P9944', 'CMA', 'CMAU6662164', 'Devan - Nights', NULL, NULL, NULL, '=AF440', NULL, '=AI440', NULL, NULL, '=AQ440', 0, '=IF(AZ440>0,VLOOKUP(AZ440,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(281, '2022-09-16', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ442>0,VLOOKUP(AZ442,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(282, '2022-09-16', 'N', '18.00', 'P9946', 'MAERSK', NULL, 'MRSU5314145', 'Exchange & Shunt', 'P9944', NULL, 'CMA', 'CMAU6662164', 'P9945', 'CMA', 'CMAU6918050', 'Devan - Nights', NULL, NULL, NULL, '=AF443', NULL, '=AI443', NULL, NULL, '=AQ443', 0, '=IF(AZ443>0,VLOOKUP(AZ443,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(283, '2022-09-19', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ445>0,VLOOKUP(AZ445,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(284, '2022-09-19', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ446>0,VLOOKUP(AZ446,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(285, '2022-09-20', 'D', '06.00', 'P9947', 'MAERSK', NULL, 'TCKU7448106', 'Exchange & Shunt', 'P9945', NULL, 'CMA', 'CMAU6918050', 'P9946', 'MAERSK', 'MRSU5314145', 'Devan - Days', NULL, NULL, NULL, '=AF448', NULL, '=AI448', NULL, NULL, '=AQ448', 0, '=IF(AZ448>0,VLOOKUP(AZ448,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(286, '2022-09-20', 'N', '18.00', 'P9948', 'MAERSK', NULL, 'CAAU6484961', 'Exchange & Shunt', 'P9946', NULL, 'MAERSK', 'MRSU5314145', 'P9947', 'MAERSK', 'TCKU7448106', 'Devan - Nights', NULL, NULL, NULL, '=AF449', NULL, '=AI449', NULL, NULL, '=AQ449', 0, '=IF(AZ449>0,VLOOKUP(AZ449,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(287, '2022-09-21', 'D', '06.00', 'P9949', 'MAERSK', NULL, 'TCKU7863431', 'Exchange & Shunt', 'P9947', NULL, 'MAERSK', 'TCKU7448106', 'P9948', 'MAERSK', 'CAAU6484961', 'Devan - Days', NULL, NULL, NULL, '=AF451', NULL, '=AI451', NULL, NULL, '=AQ451', 0, '=IF(AZ451>0,VLOOKUP(AZ451,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(288, '2022-09-21', 'N', '18.00', 'P9950', 'ONE', NULL, 'TCLU4913752', 'Exchange & Shunt', 'P9948', NULL, 'MAERSK', 'CAAU6484961', 'P9949', 'MAERSK', 'TCKU7863431', 'Devan - Nights', NULL, NULL, NULL, '=AF452', NULL, '=AI452', NULL, NULL, '=AQ452', 0, '=IF(AZ452>0,VLOOKUP(AZ452,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(289, '2022-09-22', 'D', '06.00', 'P9951', 'ONE', NULL, 'FFAU1841118', 'Exchange & Shunt', 'P9949', NULL, 'MAERSK', 'TCKU7863431', 'P9950', 'ONE', 'TCLU4913752', 'Devan - Days', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ454>0,VLOOKUP(AZ454,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(290, '2022-09-22', 'N', '18.00', 'P9952', 'CMA', NULL, 'FCIU7305953', 'Exchange & Shunt', 'P9950', NULL, 'ONE', 'TCLU4913752', 'P9951', 'ONE', 'FFAU1841118', 'Devan - Nights', NULL, NULL, NULL, '=AF455', NULL, '=AI455', NULL, NULL, '=AQ455', 0, '=IF(AZ455>0,VLOOKUP(AZ455,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(291, '2022-09-23', 'D', '06.00', 'P9953', 'CMA', NULL, 'BEAU5622133', 'Exchange & Shunt', 'P9951', NULL, 'ONE', 'FFAU1841118', 'P9952', 'CMA', 'FCIU7305953', 'Devan - Days', NULL, NULL, NULL, '=AF457', NULL, '=AI457', NULL, NULL, '=AQ457', 0, '=IF(AZ457>0,VLOOKUP(AZ457,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(292, '2022-09-23', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '', NULL, '', NULL, NULL, '', 0, '=IF(AZ458>0,VLOOKUP(AZ458,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(293, '2022-09-26', 'D', '06.00', 'P9954', 'MAERSK', NULL, 'MRSU4609814', 'Exchange & Shunt', 'P9952', NULL, 'CMA', 'FCIU7305953', 'P9953', 'CMA', 'BEAU5622133', 'Devan - Days', NULL, NULL, NULL, '=AF460', NULL, '=AI460', NULL, NULL, '=AQ460', 0, '=IF(AZ460>0,VLOOKUP(AZ460,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(294, '2022-09-26', 'N', '18.00', 'P9955', 'ONE', NULL, 'BEAU5354663', 'Exchange & Shunt', 'P9953', NULL, 'CMA', 'BEAU5622133', 'P9954', 'MAERSK', 'MRSU4609814', 'Devan - Nights', NULL, NULL, NULL, '=AF461', NULL, '=AI461', NULL, NULL, '=AQ461', 0, '=IF(AZ461>0,VLOOKUP(AZ461,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(295, '2022-09-27', 'D', '06.00', 'P9956', 'CMA', NULL, 'TEMU7391366', 'Exchange & Shunt', 'P9954', NULL, 'MAERSK', 'MRSU4609814', 'P9955', 'ONE', 'BEAU5354663', 'Devan - Days', NULL, NULL, NULL, '=AF463', NULL, '=AI463', NULL, NULL, '=AQ463', 0, '=IF(AZ463>0,VLOOKUP(AZ463,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 53, '2022-09-27 12:26:18', 'completed'),
(296, '2022-09-27', 'N', '18.00', 'P9957', 'MAERSK', NULL, 'MRSU4953199', 'Exchange & Shunt', 'P9955', NULL, 'ONE', 'BEAU5354663', 'P9956', 'CMA', 'TEMU7391366', 'Devan - Nights', NULL, NULL, NULL, '=AF464', NULL, '=AI464', NULL, NULL, '=AQ464', 0, '=IF(AZ464>0,VLOOKUP(AZ464,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 46, '2022-09-27 13:30:25', 'completed'),
(297, '2022-09-28', 'D', '06.00', 'P9958', 'MAERSK', NULL, 'MRSU5324570', 'Exchange & Shunt', 'P9956', NULL, 'CMA', 'TEMU7391366', 'P9957', 'MAERSK', 'MRSU4953199', 'Devan - Days', NULL, NULL, NULL, '=AF466', NULL, '=AI466', NULL, NULL, '=AQ466', 0, '=IF(AZ466>0,VLOOKUP(AZ466,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 46, '2022-09-27 13:31:49', 'completed'),
(298, '2022-09-28', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF467', NULL, '=AI467', NULL, NULL, '=AQ467', 0, '=IF(AZ467>0,VLOOKUP(AZ467,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(299, '2022-09-29', 'D', '06.00', 'P9959', 'CMA', NULL, 'TCKU6316065', 'Exchange & Shunt', 'P9957', NULL, 'MAERSK', 'MRSU4953199', 'P9958', 'MAERSK', 'MRSU5324570', 'Devan - Days', NULL, NULL, NULL, '=AF469', NULL, '=AI469', NULL, NULL, '=AQ469', 0, '=IF(AZ469>0,VLOOKUP(AZ469,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 46, '2022-09-27 13:34:27', 'completed'),
(300, '2022-09-29', 'N', '18.00', 'P9960', 'CMA', NULL, 'CMAU4942886', 'Exchange & Shunt', 'P9958', NULL, 'MAERSK', 'MRSU5324570', 'P9959', 'CMA', 'TCKU6316065', 'Devan - Nights', NULL, NULL, NULL, '=AF470', NULL, '=AI470', NULL, NULL, '=AQ470', 0, '=IF(AZ470>0,VLOOKUP(AZ470,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 46, '2022-09-27 13:35:17', 'completed'),
(301, '2022-09-30', 'D', '06.00', 'P9961', 'MAERSK', NULL, 'MRSU5408115', 'Exchange & Shunt', 'P9959', NULL, 'CMA', 'TCKU6316065', 'P9960', 'CMA', 'CMAU4942886', 'Devan - Days', NULL, NULL, NULL, '=AF472', NULL, '=AI472', NULL, NULL, '=AQ472', 0, '=IF(AZ472>0,VLOOKUP(AZ472,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 09:38:15', 'completed'),
(302, '2022-09-30', 'N', '18.00', 'P9963', 'CMA', NULL, 'BEAU4130777', 'Exchange & Shunt', 'P9960', NULL, 'CMA', 'CMAU4942886', 'P9961', 'MAERSK', 'MRSU5408115', 'Devan - Nights', NULL, NULL, NULL, '=AF473', NULL, '=AI473', NULL, NULL, '=AQ473', 0, '=IF(AZ473>0,VLOOKUP(AZ473,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 09:39:31', 'completed'),
(303, '2022-10-03', 'D', '06.00', 'P21', 'P21', 'P21', 'P21', 'Exchange & Shunt', 'P20', 'P21', 'P21', 'P21', 'P22', 'P21', 'P21', 'Devan - Days', NULL, NULL, NULL, '=AF475', NULL, '=AI475', NULL, NULL, '=AQ475', 0, '=IF(AZ475>0,VLOOKUP(AZ475,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 09:39:41', 'completed'),
(304, '2022-10-03', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF476', NULL, '=AI476', NULL, NULL, '=AQ476', 0, '=IF(AZ476>0,VLOOKUP(AZ476,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(305, '2022-10-04', 'D', '06.00', 'P9964', 'MAERSK', NULL, 'MRSU4822500', 'Exchange & Shunt', 'P9961', NULL, 'MAERSK', 'MRSU5408115', 'P9963', 'CMA', 'BEAU4130777', 'Devan - Days', NULL, NULL, NULL, '=AF478', NULL, '=AI478', NULL, NULL, '=AQ478', 0, '=IF(AZ478>0,VLOOKUP(AZ478,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 09:48:26', 'completed'),
(306, '2022-10-04', 'N', '18.00', 'P9965', 'MAERSK', NULL, 'MRSU3170440', 'Exchange & Shunt', 'P9963', NULL, 'CMA', 'BEAU4130777', 'P9964', 'MAERSK', 'MRSU4822500', 'Devan - Nights', NULL, NULL, NULL, '=AF479', NULL, '=AI479', NULL, NULL, '=AQ479', 0, '=IF(AZ479>0,VLOOKUP(AZ479,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 09:49:13', 'completed'),
(307, '2022-10-05', 'D', '06.00', 'P9966', 'CMA', NULL, 'TGBU6082001', 'Exchange & Shunt', 'P9964', NULL, 'MAERSK', 'MRSU4822500', 'P9965', 'MAERSK', 'MRSU3170440', 'Devan - Days', NULL, NULL, NULL, '=AF481', NULL, '=AI481', NULL, NULL, '=AQ481', 0, '=IF(AZ481>0,VLOOKUP(AZ481,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 09:49:59', 'completed'),
(308, '2022-10-05', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF482', NULL, '=AI482', NULL, NULL, '=AQ482', 0, '=IF(AZ482>0,VLOOKUP(AZ482,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(309, '2022-10-06', 'D', '06.00', 'P9967', 'CMA', NULL, 'TXGU6675273', 'Exchange & Shunt', 'P9965', NULL, 'MAERSK', 'MRSU3170440', 'P9966', 'CMA', 'TGBU6082001', 'Devan - Days', NULL, NULL, NULL, '=AF484', NULL, '=AI484', NULL, NULL, '=AQ484', 0, '=IF(AZ484>0,VLOOKUP(AZ484,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 10:01:20', 'completed'),
(310, '2022-10-06', 'N', '18.00', 'P9968', 'MAERSK', NULL, 'MRSU3698761', 'Exchange & Shunt', 'P9966', NULL, 'CMA', 'TGBU6082001', 'P9967', 'CMA', 'TXGU6675273', 'Devan - Nights', NULL, NULL, NULL, '=AF485', NULL, '=AI485', NULL, NULL, '=AQ485', 0, '=IF(AZ485>0,VLOOKUP(AZ485,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 10:02:05', 'completed'),
(311, '2022-10-07', 'D', '06.00', 'P9969', 'ONE', NULL, 'TCNU2726174', 'Exchange & Shunt', 'P9967', NULL, 'CMA', 'TXGU6675273', 'P9968', 'MAERSK', 'MRSU3698761', 'Devan - Days', NULL, NULL, NULL, '=AF487', NULL, '=AI487', NULL, NULL, '=AQ487', 0, '=IF(AZ487>0,VLOOKUP(AZ487,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 10:03:29', 'completed'),
(312, '2022-10-07', 'N', '18.00', 'P9970', 'CMA', NULL, 'CMAU7656417', 'Exchange & Shunt', 'P9968', NULL, 'MAERSK', 'MRSU3698761', 'P9969', 'ONE', 'TCNU2726174', 'Devan - Nights', NULL, NULL, NULL, '=AF488', NULL, '=AI488', NULL, NULL, '=AQ488', 0, '=IF(AZ488>0,VLOOKUP(AZ488,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 10:03:39', 'completed'),
(313, '2022-10-10', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF490', NULL, '=AI490', NULL, NULL, '=AQ490', 0, '=IF(AZ490>0,VLOOKUP(AZ490,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(314, '2022-10-10', 'N', '18.00', 'P9971', 'CMA', NULL, 'CMAU6664948', 'Exchange & Shunt', 'P9969', NULL, 'ONE', 'TCNU2726174', 'P9970', 'CMA', 'CMAU7656417', 'Devan - Nights', NULL, NULL, NULL, '=AF491', NULL, '=AI491', NULL, NULL, '=AQ491', 0, '=IF(AZ491>0,VLOOKUP(AZ491,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 1, 43, '2022-09-30 10:04:30', 'completed'),
(315, '2022-10-11', 'D', '06.00', 'P9972', 'MAERSK', NULL, 'MRSU5239756', 'Exchange & Shunt', 'P9970', NULL, 'CMA', 'CMAU7656417', 'P9971', 'CMA', 'CMAU6664948', 'Devan - Days', NULL, NULL, NULL, '=AF493', NULL, '=AI493', NULL, NULL, '=AQ493', 0, '=IF(AZ493>0,VLOOKUP(AZ493,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 08:55:51', 'completed'),
(316, '2022-10-11', 'N', '18.00', 'P9973', 'MAERSK', NULL, 'MRSU4119036', 'Exchange & Shunt', 'P9971', NULL, 'CMA', 'CMAU6664948', 'P9972', 'MAERSK', 'MRSU5239756', 'Devan - Nights', NULL, NULL, NULL, '=AF494', NULL, '=AI494', NULL, NULL, '=AQ494', 0, '=IF(AZ494>0,VLOOKUP(AZ494,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 08:56:02', 'completed'),
(317, '2022-10-12', 'D', '06.00', 'P9974', 'CMA', NULL, 'CMAU6638548', 'Exchange & Shunt', 'P9972', NULL, 'MAERSK', 'MRSU5239756', 'P9973', 'MAERSK', 'MRSU4119036', 'Devan - Days', NULL, NULL, NULL, '=AF496', NULL, '=AI496', NULL, NULL, '=AQ496', 0, '=IF(AZ496>0,VLOOKUP(AZ496,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 09:15:38', 'completed'),
(318, '2022-10-12', 'N', '18.00', 'P9975', 'CMA', NULL, 'FFAU4420072', 'Exchange & Shunt', 'P9973', NULL, 'MAERSK', 'MRSU4119036', 'P9974', 'CMA', 'CMAU6638548', 'Devan - Nights', NULL, NULL, NULL, '=AF497', NULL, '=AI497', NULL, NULL, '=AQ497', 0, '=IF(AZ497>0,VLOOKUP(AZ497,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 09:15:59', 'completed'),
(319, '2022-10-13', 'D', '06.00', 'P9976', 'MAERSK', NULL, 'MRSU4102630', 'Exchange & Shunt', 'P9974', NULL, 'CMA', 'CMAU6638548', 'P9975', 'CMA', 'FFAU4420072', 'Devan - Days', NULL, NULL, NULL, '=AF499', NULL, '=AI499', NULL, NULL, '=AQ499', 0, '=IF(AZ499>0,VLOOKUP(AZ499,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 09:18:37', 'completed'),
(320, '2022-10-13', 'N', '18.00', 'P9977', 'MAERSK', NULL, 'MRSU3429696', 'Exchange & Shunt', 'P9975', NULL, 'CMA', 'FFAU4420072', 'P9976', 'MAERSK', 'MRSU4102630', 'Devan - Nights', NULL, NULL, NULL, '=AF500', NULL, '=AI500', NULL, NULL, '=AQ500', 0, '=IF(AZ500>0,VLOOKUP(AZ500,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 09:21:39', 'completed'),
(321, '2022-10-14', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF502', NULL, '=AI502', NULL, NULL, '=AQ502', 0, '=IF(AZ502>0,VLOOKUP(AZ502,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(322, '2022-10-14', 'N', '18.00', 'P9978', 'ONE', NULL, 'ONEU0302922', 'Exchange & Shunt', 'P9976', NULL, 'MAERSK', 'MRSU4102630', 'P9977', 'MAERSK', 'MRSU3429696', 'Devan - Nights', NULL, NULL, NULL, '=AF503', NULL, '=AI503', NULL, NULL, '=AQ503', 0, '=IF(AZ503>0,VLOOKUP(AZ503,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, 43, '2022-09-30 09:25:23', 'completed'),
(323, '2022-10-17', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF505', NULL, '=AI505', NULL, NULL, '=AQ505', 0, '=IF(AZ505>0,VLOOKUP(AZ505,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(324, '2022-10-17', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF506', NULL, '=AI506', NULL, NULL, '=AQ506', 0, '=IF(AZ506>0,VLOOKUP(AZ506,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(325, '2022-10-18', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF508', NULL, '=AI508', NULL, NULL, '=AQ508', 0, '=IF(AZ508>0,VLOOKUP(AZ508,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(326, '2022-10-18', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF509', NULL, '=AI509', NULL, NULL, '=AQ509', 0, '=IF(AZ509>0,VLOOKUP(AZ509,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(327, '2022-10-19', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF511', NULL, '=AI511', NULL, NULL, '=AQ511', 0, '=IF(AZ511>0,VLOOKUP(AZ511,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(328, '2022-10-19', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF512', NULL, '=AI512', NULL, NULL, '=AQ512', 0, '=IF(AZ512>0,VLOOKUP(AZ512,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(329, '2022-10-20', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF514', NULL, '=AI514', NULL, NULL, '=AQ514', 0, '=IF(AZ514>0,VLOOKUP(AZ514,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(330, '2022-10-20', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF515', NULL, '=AI515', NULL, NULL, '=AQ515', 0, '=IF(AZ515>0,VLOOKUP(AZ515,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(331, '2022-10-21', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF517', NULL, '=AI517', NULL, NULL, '=AQ517', 0, '=IF(AZ517>0,VLOOKUP(AZ517,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(332, '2022-10-21', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF518', NULL, '=AI518', NULL, NULL, '=AQ518', 0, '=IF(AZ518>0,VLOOKUP(AZ518,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(333, '2022-10-24', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF520', NULL, '=AI520', NULL, NULL, '=AQ520', 0, '=IF(AZ520>0,VLOOKUP(AZ520,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(334, '2022-10-24', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF521', NULL, '=AI521', NULL, NULL, '=AQ521', 0, '=IF(AZ521>0,VLOOKUP(AZ521,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(335, '2022-10-25', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF523', NULL, '=AI523', NULL, NULL, '=AQ523', 0, '=IF(AZ523>0,VLOOKUP(AZ523,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(336, '2022-10-25', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF524', NULL, '=AI524', NULL, NULL, '=AQ524', 0, '=IF(AZ524>0,VLOOKUP(AZ524,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(337, '2022-10-26', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF526', NULL, '=AI526', NULL, NULL, '=AQ526', 0, '=IF(AZ526>0,VLOOKUP(AZ526,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(338, '2022-10-26', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF527', NULL, '=AI527', NULL, NULL, '=AQ527', 0, '=IF(AZ527>0,VLOOKUP(AZ527,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(339, '2022-10-27', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF529', NULL, '=AI529', NULL, NULL, '=AQ529', 0, '=IF(AZ529>0,VLOOKUP(AZ529,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(340, '2022-10-27', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF530', NULL, '=AI530', NULL, NULL, '=AQ530', 0, '=IF(AZ530>0,VLOOKUP(AZ530,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(341, '2022-10-28', 'D', '06.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Days', NULL, NULL, NULL, '=AF532', NULL, '=AI532', NULL, NULL, '=AQ532', 0, '=IF(AZ532>0,VLOOKUP(AZ532,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, ''),
(342, '2022-10-28', 'N', '18.00', '', '', NULL, '', 'Exchange & Shunt', '', NULL, '', '', '', '', '', 'Devan - Nights', NULL, NULL, NULL, '=AF533', NULL, '=AI533', NULL, NULL, '=AQ533', 0, '=IF(AZ533>0,VLOOKUP(AZ533,\'[1]SEAL NO.S\'!$B:$D,3,0),\"\")', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'Josh Robb', NULL, NULL, 0, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `conveyance_picks`
--

CREATE TABLE `conveyance_picks` (
  `id` int(10) UNSIGNED NOT NULL,
  `kanban` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `dolly` varchar(100) DEFAULT NULL,
  `kanban_date` date DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `is_delivered` tinyint(1) DEFAULT 0,
  `is_help` tinyint(1) DEFAULT 0,
  `helped_user` int(11) DEFAULT NULL,
  `imported_at` datetime DEFAULT NULL,
  `picked_at` datetime DEFAULT NULL,
  `deliveried_at` datetime DEFAULT NULL,
  `dolly_location` varchar(100) DEFAULT NULL,
  `part_number` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conveyance_picks`
--

INSERT INTO `conveyance_picks` (`id`, `kanban`, `address`, `location`, `dolly`, `kanban_date`, `shift`, `is_completed`, `is_delivered`, `is_help`, `helped_user`, `imported_at`, `picked_at`, `deliveried_at`, `dolly_location`, `part_number`, `delivery_address`) VALUES
(1, 'R016', 'C-02-01', '1', 'dolly 1', '2022-08-28', NULL, 0, 1, 1, 40, '2022-08-28 09:42:06', '2022-08-28 04:44:34', '2022-08-28 04:58:08', NULL, NULL, NULL),
(2, 'R017', 'C-02-02', '2', 'dolly 2', '2022-08-28', NULL, 1, 1, 0, NULL, '2022-08-28 09:42:06', '2022-08-28 04:13:26', '2022-08-28 04:59:08', NULL, NULL, NULL),
(3, 'R018', 'C-02-03', '3', 'dolly 1', '2022-08-28', NULL, 1, 1, 0, NULL, '2022-08-28 09:42:06', '2022-08-28 04:13:08', '2022-08-28 05:00:26', NULL, NULL, NULL),
(4, 'R019', 'C-02-04', '4', 'dolly 2', '2022-08-28', NULL, 1, 1, 0, NULL, '2022-08-28 09:42:06', '2022-08-28 04:13:19', '2022-08-28 05:04:13', NULL, NULL, NULL),
(5, 'R020', 'C-02-05', '5', 'dolly 3', '2022-08-28', NULL, 1, 1, 0, 34, '2022-08-28 09:42:06', '2022-08-28 04:14:58', '2022-08-28 05:01:56', NULL, NULL, NULL),
(6, 'R021', 'C-02-06', '6', 'dolly 4', '2022-08-28', NULL, 1, 1, 0, NULL, '2022-08-28 09:42:06', '2022-08-28 04:15:00', '2022-08-28 05:02:47', NULL, NULL, NULL),
(7, 'R022', 'C-02-07', '7', 'dolly 5', '2022-08-28', NULL, 1, 1, 0, 43, '2022-08-28 09:42:06', '2022-08-28 04:15:02', '2022-08-28 05:20:24', NULL, NULL, NULL),
(8, 'R023', 'C-02-08', '8', 'dolly 1', '2022-08-28', NULL, 1, 1, 0, NULL, '2022-08-28 09:42:07', '2022-08-28 04:14:14', '2022-08-28 05:21:19', NULL, NULL, NULL),
(9, 'R024', 'C-02-09', '9', 'dolly 2', '2022-08-28', NULL, 1, 1, 0, NULL, '2022-08-28 09:42:07', '2022-08-28 04:14:29', '2022-08-28 05:22:00', NULL, NULL, NULL),
(10, 'R016', 'C-02-01', '1', 'dolly 1', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:26', NULL, NULL, 'd_location16', 'part16', 'delivery_addre16'),
(11, 'R017', 'C-02-02', '2', 'dolly 2', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:26', NULL, NULL, 'd_location17', 'part17', 'delivery_addre17'),
(12, 'R018', 'C-02-03', '3', 'dolly 1', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:26', NULL, NULL, 'd_location18', 'part18', 'delivery_addre18'),
(13, 'R019', 'C-02-04', '4', 'dolly 2', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:27', NULL, NULL, 'd_location19', 'part19', 'delivery_addre19'),
(14, 'R020', 'C-02-05', '5', 'dolly 3', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:27', NULL, NULL, 'd_location20', 'part20', 'delivery_addre20'),
(15, 'R021', 'C-02-06', '6', 'dolly 4', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:27', NULL, NULL, 'd_location21', 'part21', 'delivery_addre21'),
(16, 'R022', 'C-02-07', '7', 'dolly 5', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:27', NULL, NULL, 'd_location22', 'part22', 'delivery_addre22'),
(17, 'R023', 'C-02-08', '8', 'dolly 1', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:27', NULL, NULL, 'd_location23', 'part23', 'delivery_addre23'),
(18, 'R024', 'C-02-09', '9', 'dolly 2', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:21:27', NULL, NULL, 'd_location24', 'part24', 'delivery_addre24'),
(19, 'R016', 'C-02-01', '1', 'dolly 1', '2022-09-08', NULL, 1, 0, 0, NULL, '2022-09-08 07:01:45', '2022-09-08 09:44:43', NULL, 'Test dolly', '', 'delivery_addre16'),
(20, 'R017', 'C-02-02', '2', 'dolly 2', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location17', 'part17', 'delivery_addre17'),
(21, 'R018', 'C-02-03', '3', 'dolly 1', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location18', 'part18', 'delivery_addre18'),
(22, 'R019', 'C-02-04', '4', 'dolly 2', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location19', 'part19', 'delivery_addre19'),
(23, 'R020', 'C-02-05', '5', 'dolly 3', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location20', 'part20', 'delivery_addre20'),
(24, 'R021', 'C-02-06', '6', 'dolly 4', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location21', 'part21', 'delivery_addre21'),
(25, 'R022', 'C-02-07', '7', 'dolly 5', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location22', 'part22', 'delivery_addre22'),
(26, 'R023', 'C-02-08', '8', 'dolly 1', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location23', 'part23', 'delivery_addre23'),
(27, 'R024', 'C-02-09', '9', 'dolly 2', '2022-09-08', NULL, 0, 0, 0, NULL, '2022-09-08 07:01:45', NULL, NULL, 'd_location24', 'part24', 'delivery_addre24'),
(28, 'R016', 'TEST', '', '', '2022-09-16', NULL, 1, 0, 0, NULL, '2022-09-16 07:53:10', '2022-09-16 07:53:44', NULL, '', '', ''),
(29, 'R020', '835300501000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(30, 'R026', '894670222000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(31, 'R028', '896150202000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(32, 'R032', '90105W014000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(33, 'R036', '90119W001600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(34, 'R058', '122620TO8000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(35, 'R090', '162820T10000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(36, 'R101', '90919W100900', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(37, 'R120', '162810T330', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(38, 'R160', '137160T02000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(39, 'R191', '137500T04000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(40, 'R201', '138010T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(41, 'R210', '162670T09000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(42, 'R212', '162610T29000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(43, 'R214', '162640T23000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(44, 'R216', '162830T06000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(45, 'R218', '238260T30000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(46, 'R220', '238270T05000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(47, 'R231', '256010T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(48, 'R240', '162700T01100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(49, 'R326', '162780T02100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(50, 'R327', '162680T320', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(51, 'R342', '132810T03002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(52, 'R343', '132810T03003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(53, 'R350', '122110T01000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(54, 'R351', '132810T06001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(55, 'R352', '132810T06002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(56, 'R353', '132810T06003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(57, 'R360', '122810T04000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(58, 'R362', '122820T04000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(59, 'R405', '156090T08000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(60, 'R410', '125110T02000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(61, 'R420', '220300T11000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(62, 'R421', '117110T03101', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(63, 'R422', '117110T03102', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(64, 'R423', '117110T03103', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(65, 'R424', '117110T03104', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(66, 'R425', '220300T05000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(67, 'R426', '220300T14000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(68, 'R427', '220300T16000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(69, 'R431', '117210T03101', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(70, 'R432', '117210T03102', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(71, 'R433', '117210T03103', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(72, 'R434', '117210T03104', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(73, 'R451', '117110T05101', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(74, 'R452', '117110T05102', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(75, 'R453', '117110T05103', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(76, 'R454', '117110T05104', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(77, 'R458', '121020T04000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(78, 'R461', '117210T05101', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(79, 'R462', '117210T05102', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(80, 'R463', '117210T05103', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(81, 'R464', '117210T05104', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(82, 'R470', '232090T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(83, 'R475', '90910TC00100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(84, 'R480', '153300T05000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(85, 'R490', '153300T06000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(86, 'R502', '130500T08000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(87, 'R503', '130500T07000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(88, 'R510', '130700T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(89, 'R530', '90915CA00300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(90, 'R540', '90311W001100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(91, 'R549', '238180T030', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(92, 'R566', '293000T02000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(93, 'R580', '163210T01000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(94, 'R590', '135520T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(95, 'R620', '135400T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(96, 'R632', '135590T08000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(97, 'R642', '135490T05000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(98, 'R650', '135650T03000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(99, 'R662', '135610T08000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(100, 'R664', '135620T05000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(101, 'R671', '112130T02100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(102, 'R682', '312100237000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(103, 'R692', '312100513200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(104, 'R701', '312500514100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(105, 'R711', '171180T02000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(106, 'R720', '171730T02000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(107, 'R750', '90466W000700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(108, 'R772', '3127002020', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(109, 'R802', '132110T19002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(110, 'R803', '132110T19003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(111, 'R901', '135210T07000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(112, 'R902', '151630T030', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(113, 'R909', '232090T07000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(114, 'R910', '130700T07000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(115, 'R912', '125010T01000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(116, 'R913', '135190T040', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(117, 'R916', '130110T09000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(118, 'R917', '130110T21000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(119, 'R918', '162680T14000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(120, 'R922', '171670T12000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(121, 'R924', '162620T05000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(122, 'R926', '162610T24000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(123, 'R928', '135060T11000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(124, 'R930', '13011OT11000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(125, 'R934', '162680T02000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(126, 'R960', '90105W001700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(127, 'R962', '90105W004400', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(128, 'R963', '90105W009000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(129, 'R964', '90105W012800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(130, 'R964\'', '90105W012800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(131, 'R965', '90105W012900', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(132, 'R966', '90105W019800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(133, 'R967', '90105W020000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(134, 'R968', '90105W020100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(135, 'R968\'', '90105W020100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(136, 'R969', '90105W020200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(137, 'R969\'', '90105W020200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(138, 'R970', '90105W020300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(139, 'R971', '90105W020400', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(140, 'R972', '90105W020500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(141, 'R976', '90119W001000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(142, 'R977', '90119W003000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(143, 'R977\'', '90119W003000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(144, 'R977\'\'', '90119W003000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(145, 'R978', '90119W011800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(146, 'R978\'', '90119W011800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(147, 'R979', '90119W016500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(148, 'R980', '90119W022000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(149, 'R983', '90105W002000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(150, 'R984', '90105W003300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(151, 'R985', '90119W011600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(152, 'R986', '90105W022000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(153, 'R988', '90109W002300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(154, 'R989', '90109W002400', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(155, 'R990', '90105W003200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(156, 'R990\'', '90105W003200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(157, 'R992', '90109W001900', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(158, 'R997', '90119W030800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(159, 'R998', '90119W002600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(160, 'R998\'', '90119W002600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(161, 'S006', '151630H01000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(162, 'S008', '90916A300300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(163, 'Z002', '111153707000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(164, 'Z007', '901050636100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(165, 'Z009', '122043704000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(166, 'Z011', '916718065000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(167, 'Z012', '111153706200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(168, 'Z016', '111593701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(169, 'Z020', '111913701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(170, 'Z025', '903113809600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(171, 'Z037', '135613706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(172, 'Z038', '117913701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(173, 'Z039', '114453701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(174, 'Z047', '122043705000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(175, 'Z049', '114523701100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(176, 'Z055', '122613707000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(177, 'Z063', '904662200500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(178, 'Z065', '123153706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(179, 'Z066', '1231537070', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(180, 'Z071', '132113722001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(181, 'Z072', '132113722002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(182, 'Z073', '132113722003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(183, 'Z075', '130113727000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(184, 'Z078', '114523704000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(185, 'Z080', '121803801000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(186, 'Z082', '122043701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(187, 'Z083', '130503705000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(188, 'Z087', '162973701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(189, 'Z090', '122613704000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(190, 'Z091', '163313709000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(191, 'Z094', '122623702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(192, 'Z095', '163413701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(193, 'Z097', '166713701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(194, 'Z099', '901260806000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(195, 'Z102', '961375170100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(196, 'Z102\'', '961375170100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(197, 'Z106', '123153703000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(198, 'Z111', '257193701100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(199, 'Z112', '915518062500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(200, 'Z116', '162793702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(201, 'Z118', '238183703000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(202, 'Z120', '909101227600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(203, 'Z123', '9155180630', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(204, 'Z126', '909190227200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(205, 'Z128', '9091902277', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(206, 'Z140', '256103702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(207, 'Z142', '256203714000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(208, 'Z144', '256273702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(209, 'Z146', '256343702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(210, 'Z148', '91551J061600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(211, 'Z148\'', '91551J061600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(212, 'Z151', '132113736001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(213, 'Z152', '132113736002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(214, 'Z153', '132113736003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(215, 'Z161', '132113734001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(216, 'Z162', '132113734002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(217, 'Z163', '132113734003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(218, 'Z170', '894675206000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(219, 'Z180', '114463701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(220, 'Z181', '894912809000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(221, 'Z184', '904681500700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(222, 'Z185', '894912809100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(223, 'Z193', '134703706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(224, 'Z200', '135072801000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(225, 'Z202', '173613701100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(226, 'Z204', '135193701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(227, 'Z206', '173613702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(228, 'Z211', '173613707000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(229, 'Z218', '122613709000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(230, 'Z220', '122043706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(231, 'Z222', '909040400600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(232, 'Z224', '162603718000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(233, 'Z226', '163313710000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(234, 'Z227', '162813719100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(235, 'Z230', '162613720000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(236, 'Z232', '162613703100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(237, 'Z234', '162643721000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(238, 'Z236', '162643703100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(239, 'Z238', '894261227000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(240, 'Z240', '909171103000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(241, 'Z242', '173413708000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(242, 'Z246', '827151040000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(243, 'Z249', '256013706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(244, 'Z250', '256203715000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(245, 'Z252', '256103703000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(246, 'Z256', '835301206000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(247, 'Z258', '173613714000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(248, 'Z260', '153013701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(249, 'Z262', '170303702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(250, 'Z264', '821251268000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(251, 'Z279', '157083701200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(252, 'Z281', '132113746001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(253, 'Z282', '162613702200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(254, 'Z283', '132113746002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(255, 'Z285', '132113746003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(256, 'Z290', '162643702200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(257, 'Z292', '162673701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(258, 'Z298', '162683707000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(259, 'Z306', '163252801000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(260, 'Z308', '901595004800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(261, 'Z311', '132512203001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(262, 'Z312', '132512203002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(263, 'Z313', '132512203003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(264, 'Z315', '171383701100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(265, 'Z334', '238273702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(266, 'Z336', '238273706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(267, 'Z338', '193153702000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(268, 'Z340', '1931537030', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(269, 'Z349', '232912301000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(270, 'Z353', '238143705100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(271, 'Z357', '238263702100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(272, 'Z358', '238263719000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(273, 'Z360', '238913701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(274, 'Z365', '257613701100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(275, 'Z368', '257613708000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(276, 'Z371', '132113742001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(277, 'Z372', '132113742002', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(278, 'Z373', '132113742003', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(279, 'Z375', '134703704200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(280, 'Z376', '827151289000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(281, 'Z382', '8271512A0100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(282, 'Z384', '827152A30-00', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(283, 'Z388', '827156A46000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(284, 'Z392', '894223303000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(285, 'Z398', '901050845500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(286, 'Z402', '901090638500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(287, 'Z406', '901100604000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(288, 'Z412', '9011908B4700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(289, 'Z414', '9011908C8700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(290, 'Z414\'', '9011908C8700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(291, 'Z416', '901191410600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(292, 'Z422', '901260602600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(293, 'Z425', '901260602800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(294, 'Z432', '901260602900', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(295, 'Z436', '901260802601', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(296, 'Z440', '901260805200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(297, 'Z440\'', '901260805200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(298, 'Z444', '901790632600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(299, 'Z448', '901790900400', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(300, 'Z452', '902011034401', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(301, 'Z456', '902100601301', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(302, 'Z461', '162583701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(303, 'Z464', '902500409700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(304, 'Z471', '902500812001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(305, 'Z476', '902501003000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(306, 'Z480', '902501011301', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(307, 'Z484', '902531102100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(308, 'Z488', '902531200200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(309, 'Z492', '902531300100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(310, 'Z504', '903411202601', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(311, 'Z508', '903455300600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(312, 'Z512', '904301002400', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(313, 'Z516', '904301203100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(314, 'Z520', '904301222100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(315, 'Z520\'', '904301222100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(316, 'Z524', '904671512000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(317, 'Z528', '904672100400', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(318, 'Z536', '905202006401', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(319, 'Z548', '909100216600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(320, 'Z554', '909130102700', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(321, 'Z568', '909190506000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(322, 'Z570', '9091905091', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(323, 'Z586', '901790810100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(324, 'Z642', '321011210000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(325, 'Z646', '321161203000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(326, 'Z648', '321171204000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(327, 'Z652', '901051009501', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(328, 'Z660', '941518060000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(329, 'Z660\'', '941518060000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(330, 'Z664', '941518080000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(331, 'Z664\'', '941518080000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(332, 'Z664\'\'', '941518080000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(333, 'Z680', '961374150100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(334, 'Z680\'', '961374150100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(335, 'Z684', '967211901001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(336, 'Z688', '967212401500', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(337, 'Z696', '967232402000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(338, 'Z716', '135232205000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(339, 'Z726', '114093701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(340, 'Z730', '160313701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(341, 'Z731', '171403708000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(342, 'Z790', '915511081800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(343, 'Z796', '909190225800', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(344, 'Z800', '122613705000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(345, 'Z802', '111863701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(346, 'Z804', '122623703000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(347, 'Z806', '125513701000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(348, 'Z817', '162643704200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(349, 'Z819', '162683706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(350, 'Z824', '173413706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(351, 'Z828', '173423705000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(352, 'Z834', '173423706000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(353, 'Z836', '238263705000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(354, 'Z838', '173433704000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(355, 'Z846', '8271512R1000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(356, 'Z852', '894212603000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(357, 'Z856', '894262808000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(358, 'Z868', '903013801000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(359, 'Z872', '909171102200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(360, 'Z879', '122623707100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(361, 'Z883', '909160315100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(362, 'Z885', '166203704000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(363, 'Z887', '173443704000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(364, 'Z888', '139083701200', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(365, 'Z889', '173613712000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(366, 'Z891', '238263733100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(367, 'Z893', '257613704100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(368, 'Z895', '894291201000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(369, 'Z9CX', '312704707000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(370, 'ZM04', '115113702100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(371, 'ZM06', '115123702100', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(372, 'ZM08', '909100216300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(373, 'ZM10', '964111200001', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(374, 'ZM12', '964111250000', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(375, 'ZM20', '902800400300', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(376, 'ZM98', '901050848600', '', '', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:10', NULL, NULL, '', '', ''),
(377, 'R016', 'C-02-01', '1', 'dolly 1', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location16', 'part16', 'delivery_addre16'),
(378, 'R017', 'C-02-02', '2', 'dolly 2', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location17', 'part17', 'delivery_addre17'),
(379, 'R018', 'C-02-03', '3', 'dolly 1', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location18', 'part18', 'delivery_addre18'),
(380, 'R019', 'C-02-04', '4', 'dolly 2', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location19', 'part19', 'delivery_addre19'),
(381, 'R020', 'C-02-05', '5', 'dolly 3', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location20', 'part20', 'delivery_addre20'),
(382, 'R021', 'C-02-06', '6', 'dolly 4', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location21', 'part21', 'delivery_addre21'),
(383, 'R022', 'C-02-07', '7', 'dolly 5', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location22', 'part22', 'delivery_addre22'),
(384, 'R023', 'C-02-08', '8', 'dolly 1', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location23', 'part23', 'delivery_addre23'),
(385, 'R024', 'C-02-09', '9', 'dolly 2', '2022-09-16', NULL, 0, 0, 0, NULL, '2022-09-16 07:53:16', NULL, NULL, 'd_location24', 'part24', 'delivery_addre24');

-- --------------------------------------------------------

--
-- Table structure for table `dolly`
--

CREATE TABLE `dolly` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dolly`
--

INSERT INTO `dolly` (`id`, `name`, `color`) VALUES
(2, 'dolly 1', '#E33131'),
(3, 'dolly 2', '#2E489A'),
(4, 'dolly 3', '#1B9248'),
(5, 'dolly 4', '#D7BF31'),
(6, 'dolly 5', '#735343'),
(7, 'asd', '#B23030');

-- --------------------------------------------------------

--
-- Table structure for table `help_alarm`
--

CREATE TABLE `help_alarm` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `clicked_time` datetime DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `help_alarm`
--

INSERT INTO `help_alarm` (`id`, `user_id`, `clicked_time`, `is_confirm`) VALUES
(1, 45, '2022-03-31 02:33:04', 1),
(2, 45, '2022-03-31 02:56:31', 1),
(3, 47, '2022-03-31 20:04:08', 1),
(4, 43, '2022-04-14 21:30:01', 1),
(5, 46, '2022-04-20 17:13:17', 1),
(6, 46, '2022-04-20 17:15:56', 1),
(7, 46, '2022-04-20 17:30:26', 1),
(8, 46, '2022-04-20 17:30:58', 1),
(9, 46, '2022-04-20 17:31:49', 1),
(10, 46, '2022-04-20 20:11:05', 1),
(11, 46, '2022-04-20 20:11:12', 1),
(12, 46, '2022-04-20 20:11:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `page` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  `part_number` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `overstock`
--

CREATE TABLE `overstock` (
  `id` int(10) UNSIGNED NOT NULL,
  `part` varchar(100) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `overstock`
--

INSERT INTO `overstock` (`id`, `part`, `page`, `created_at`) VALUES
(2, 'bh01', 'Stocking', '2022-09-08 06:48:09'),
(4, 'BH01', 'Stocking', '2022-09-08 09:46:57'),
(5, 'bh02', 'Stocking', '2022-09-08 09:47:07'),
(6, 'BH02', 'Stocking', '2022-09-08 09:47:09'),
(7, 'BH02', 'Stocking', '2022-09-08 09:47:27'),
(8, 'BH02', 'Stocking', '2022-09-08 09:47:29'),
(9, 'BH02', 'Stocking', '2022-09-08 09:47:31'),
(10, 'bh06', 'Stocking', '2022-09-08 09:51:27'),
(11, 'bh02', 'Stocking', '2022-09-08 09:51:40'),
(12, 'bh06', 'Stocking', '2022-09-08 09:51:52'),
(13, 'bh06', 'Stocking', '2022-09-08 09:52:00'),
(14, 'bh02', 'Stocking', '2022-09-08 09:52:09'),
(15, 'bh02', 'Stocking', '2022-09-08 09:53:23'),
(16, 'bh', 'Stocking', '2022-09-17 01:33:28'),
(17, '123', 'Stocking', '2022-09-29 10:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `over_stocking`
--

CREATE TABLE `over_stocking` (
  `id` int(10) UNSIGNED NOT NULL,
  `part` varchar(100) DEFAULT NULL,
  `booked_in` tinyint(1) DEFAULT NULL,
  `booked_out` tinyint(1) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `shift_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booked_in_time` datetime DEFAULT NULL,
  `out_user_id` int(11) DEFAULT NULL,
  `booked_out_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `over_stocking`
--

INSERT INTO `over_stocking` (`id`, `part`, `booked_in`, `booked_out`, `page`, `shift`, `shift_date`, `user_id`, `booked_in_time`, `out_user_id`, `booked_out_time`) VALUES
(46, 'SP02', 1, 1, 'Stocking', NULL, NULL, 47, '2022-09-06 15:52:46', 47, '2022-09-06 18:12:27'),
(47, 'SP02', 1, 1, 'Stocking', NULL, NULL, 47, '2022-09-06 15:57:07', 47, '2022-09-06 18:20:05'),
(48, 'SP02', 1, 1, 'Stocking', NULL, NULL, 47, '2022-09-06 17:34:13', 47, '2022-09-06 18:34:58'),
(49, 'SP02', 1, 1, 'Stocking', NULL, NULL, 47, '2022-09-06 17:39:45', 47, '2022-09-06 18:44:35'),
(50, 'SP02', 1, 1, 'Stocking', NULL, NULL, 47, '2022-09-06 18:03:46', 47, '2022-09-06 19:59:38'),
(51, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:06:25', NULL, NULL),
(52, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:08:33', NULL, NULL),
(53, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:10:18', NULL, NULL),
(54, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:11:57', NULL, NULL),
(55, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:34:27', NULL, NULL),
(56, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:44:20', NULL, NULL),
(57, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:58:13', NULL, NULL),
(58, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 18:58:18', NULL, NULL),
(59, 'SP02', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 19:59:02', NULL, NULL),
(60, 'bh01', 1, 0, 'Stocking', NULL, NULL, 47, '2022-09-06 21:09:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `id` int(10) UNSIGNED NOT NULL,
  `part_no` varchar(255) DEFAULT NULL,
  `part_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sf` tinyint(1) DEFAULT NULL,
  `ps` tinyint(1) DEFAULT NULL,
  `fl` tinyint(1) DEFAULT NULL,
  `color` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `part_no`, `part_name`, `amount`, `sf`, `ps`, `fl`, `color`) VALUES
(49, '1', '111', 111, 1, 1, 0, '#47913E'),
(50, '2323', '2323', 2323, 1, 1, 0, '#4E634F');

-- --------------------------------------------------------

--
-- Table structure for table `part_to_kanban`
--

CREATE TABLE `part_to_kanban` (
  `id` int(10) UNSIGNED NOT NULL,
  `kanban` varchar(100) DEFAULT NULL,
  `part_number` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `part_to_kanban`
--

INSERT INTO `part_to_kanban` (`id`, `kanban`, `part_number`) VALUES
(6, 'R016', 'test'),
(8, 'R018', 'C-02-03'),
(9, 'R019', 'C-02-04'),
(10, 'R020', 'C-02-05'),
(11, 'R021', 'C-02-06'),
(12, 'R022', 'C-02-07'),
(13, 'R023', 'C-02-08'),
(14, 'R024', 'C-02-09'),
(376, 'R02844', '4444444444'),
(373, 'R01611', '123456789'),
(364, '', ''),
(19, 'R032	90105W014000', ''),
(20, 'R036	90119W001600', ''),
(21, 'R058	122620TO8000', ''),
(22, 'R090	162820T10000', ''),
(23, 'R101	90919W100900', ''),
(24, 'R120	162810T330', ''),
(25, 'R160	137160T02000', ''),
(26, 'R191	137500T04000', ''),
(27, 'R201	138010T03000', ''),
(28, 'R210	162670T09000', ''),
(29, 'R212	162610T29000', ''),
(30, 'R214	162640T23000', ''),
(31, 'R216	162830T06000', ''),
(32, 'R218	238260T30000', ''),
(33, 'R220	238270T05000', ''),
(34, 'R231	256010T03000', ''),
(35, 'R240	162700T01100', ''),
(36, 'R326	162780T02100', ''),
(37, 'R327	162680T320', ''),
(38, 'R342	132810T03002', ''),
(39, 'R343	132810T03003', ''),
(40, 'R350	122110T01000', ''),
(41, 'R351	132810T06001', ''),
(42, 'R352	132810T06002', ''),
(43, 'R353	132810T06003', ''),
(44, 'R360	122810T04000', ''),
(45, 'R362	122820T04000', ''),
(46, 'R405	156090T08000', ''),
(47, 'R410	125110T02000', ''),
(48, 'R420	220300T11000', ''),
(49, 'R421	117110T03101', ''),
(50, 'R422	117110T03102', ''),
(51, 'R423	117110T03103', ''),
(52, 'R424	117110T03104', ''),
(53, 'R425	220300T05000', ''),
(54, 'R426	220300T14000', ''),
(55, 'R427	220300T16000', ''),
(56, 'R431	117210T03101', ''),
(57, 'R432	117210T03102', ''),
(58, 'R433	117210T03103', ''),
(59, 'R434	117210T03104', ''),
(60, 'R451	117110T05101', ''),
(61, 'R452	117110T05102', ''),
(62, 'R453	117110T05103', ''),
(63, 'R454	117110T05104', ''),
(64, 'R458	121020T04000', ''),
(65, 'R461	117210T05101', ''),
(66, 'R462	117210T05102', ''),
(67, 'R463	117210T05103', ''),
(68, 'R464	117210T05104', ''),
(69, 'R470	232090T03000', ''),
(70, 'R475	90910TC00100', ''),
(71, 'R480	153300T05000', ''),
(72, 'R490	153300T06000', ''),
(73, 'R502	130500T08000', ''),
(74, 'R503	130500T07000', ''),
(75, 'R510	130700T03000', ''),
(76, 'R530	90915CA00300', ''),
(77, 'R540	90311W001100', ''),
(78, 'R549	238180T030', ''),
(79, 'R566	293000T02000', ''),
(80, 'R580	163210T01000', ''),
(81, 'R590	135520T03000', ''),
(82, 'R620	135400T03000', ''),
(83, 'R632	135590T08000', ''),
(84, 'R642	135490T05000', ''),
(85, 'R650	135650T03000', ''),
(86, 'R662	135610T08000', ''),
(87, 'R664	135620T05000', ''),
(88, 'R671	112130T02100', ''),
(89, 'R682	3.121E+11', ''),
(90, 'R692	3.12101E+11', ''),
(91, 'R701	3.12501E+11', ''),
(92, 'R711	171180T02000', ''),
(93, 'R720	171730T02000', ''),
(94, 'R750	90466W000700', ''),
(95, 'R772	3127002020', ''),
(96, 'R802	132110T19002', ''),
(97, 'R803	132110T19003', ''),
(98, 'R901	135210T07000', ''),
(99, 'R902	151630T030', ''),
(100, 'R909	232090T07000', ''),
(101, 'R910	130700T07000', ''),
(102, 'R912	125010T01000', ''),
(103, 'R913	135190T040', ''),
(104, 'R916	130110T09000', ''),
(105, 'R917	130110T21000', ''),
(106, 'R918	162680T14000', ''),
(107, 'R922	171670T12000', ''),
(108, 'R924	162620T05000', ''),
(109, 'R926	162610T24000', ''),
(110, 'R928	135060T11000', ''),
(111, 'R930	13011OT11000', ''),
(112, 'R934	162680T02000', ''),
(113, 'R960	90105W001700', ''),
(114, 'R962	90105W004400', ''),
(115, 'R963	90105W009000', ''),
(116, 'R964	90105W012800', ''),
(117, 'R964\'	90105W012800', ''),
(118, 'R965	90105W012900', ''),
(119, 'R966	90105W019800', ''),
(120, 'R967	90105W020000', ''),
(121, 'R968	90105W020100', ''),
(122, 'R968\'	90105W020100', ''),
(123, 'R969	90105W020200', ''),
(124, 'R969\'	90105W020200', ''),
(125, 'R970	90105W020300', ''),
(126, 'R971	90105W020400', ''),
(127, 'R972	90105W020500', ''),
(128, 'R976	90119W001000', ''),
(129, 'R977	90119W003000', ''),
(130, 'R977\'	90119W003000', ''),
(131, 'R977\'\'	90119W003000', ''),
(132, 'R978	90119W011800', ''),
(133, 'R978\'	90119W011800', ''),
(134, 'R979	90119W016500', ''),
(135, 'R980	90119W022000', ''),
(136, 'R983	90105W002000', ''),
(137, 'R984	90105W003300', ''),
(138, 'R985	90119W011600', ''),
(139, 'R986	90105W022000', ''),
(140, 'R988	90109W002300', ''),
(141, 'R989	90109W002400', ''),
(142, 'R990	90105W003200', ''),
(143, 'R990\'	90105W003200', ''),
(144, 'R992	90109W001900', ''),
(145, 'R997	90119W030800', ''),
(146, 'R998	90119W002600', ''),
(147, 'R998\'	90119W002600', ''),
(148, 'S006	151630H01000', ''),
(149, 'S008	90916A300300', ''),
(150, 'Z002	1.11154E+11', ''),
(151, 'Z007	9.01051E+11', ''),
(152, 'Z009	1.22044E+11', ''),
(153, 'Z011	9.16718E+11', ''),
(154, 'Z012	1.11154E+11', ''),
(155, 'Z016	1.11594E+11', ''),
(156, 'Z020	1.11914E+11', ''),
(157, 'Z025	9.03114E+11', ''),
(158, 'Z037	1.35614E+11', ''),
(159, 'Z038	1.17914E+11', ''),
(160, 'Z039	1.14454E+11', ''),
(161, 'Z047	1.22044E+11', ''),
(162, 'Z049	1.14524E+11', ''),
(163, 'Z055	1.22614E+11', ''),
(164, 'Z063	9.04662E+11', ''),
(165, 'Z065	1.23154E+11', ''),
(166, 'Z066	1231537070', ''),
(167, 'Z071	1.32114E+11', ''),
(168, 'Z072	1.32114E+11', ''),
(169, 'Z073	1.32114E+11', ''),
(170, 'Z075	1.30114E+11', ''),
(171, 'Z078	1.14524E+11', ''),
(172, 'Z080	1.21804E+11', ''),
(173, 'Z082	1.22044E+11', ''),
(174, 'Z083	1.30504E+11', ''),
(175, 'Z087	1.62974E+11', ''),
(176, 'Z090	1.22614E+11', ''),
(177, 'Z091	1.63314E+11', ''),
(178, 'Z094	1.22624E+11', ''),
(179, 'Z095	1.63414E+11', ''),
(180, 'Z097	1.66714E+11', ''),
(181, 'Z099	9.01261E+11', ''),
(182, 'Z102	9.61375E+11', ''),
(183, 'Z102\'	9.61375E+11', ''),
(184, 'Z106	1.23154E+11', ''),
(185, 'Z111	2.57194E+11', ''),
(186, 'Z112	9.15518E+11', ''),
(187, 'Z116	1.62794E+11', ''),
(188, 'Z118	2.38184E+11', ''),
(189, 'Z120	9.09101E+11', ''),
(190, 'Z123	9155180630', ''),
(191, 'Z126	9.0919E+11', ''),
(192, 'Z128	9091902277', ''),
(193, 'Z140	2.56104E+11', ''),
(194, 'Z142	2.56204E+11', ''),
(195, 'Z144	2.56274E+11', ''),
(196, 'Z146	2.56344E+11', ''),
(197, 'Z148	91551J061600', ''),
(198, 'Z148\'	91551J061600', ''),
(199, 'Z151	1.32114E+11', ''),
(200, 'Z152	1.32114E+11', ''),
(201, 'Z153	1.32114E+11', ''),
(202, 'Z161	1.32114E+11', ''),
(203, 'Z162	1.32114E+11', ''),
(204, 'Z163	1.32114E+11', ''),
(205, 'Z170	8.94675E+11', ''),
(206, 'Z180	1.14464E+11', ''),
(207, 'Z181	8.94913E+11', ''),
(208, 'Z184	9.04682E+11', ''),
(209, 'Z185	8.94913E+11', ''),
(210, 'Z193	1.34704E+11', ''),
(211, 'Z200	1.35073E+11', ''),
(212, 'Z202	1.73614E+11', ''),
(213, 'Z204	1.35194E+11', ''),
(214, 'Z206	1.73614E+11', ''),
(215, 'Z211	1.73614E+11', ''),
(216, 'Z218	1.22614E+11', ''),
(217, 'Z220	1.22044E+11', ''),
(218, 'Z222	9.0904E+11', ''),
(219, 'Z224	1.62604E+11', ''),
(220, 'Z226	1.63314E+11', ''),
(221, 'Z227	1.62814E+11', ''),
(222, 'Z230	1.62614E+11', ''),
(223, 'Z232	1.62614E+11', ''),
(224, 'Z234	1.62644E+11', ''),
(225, 'Z236	1.62644E+11', ''),
(226, 'Z238	8.94261E+11', ''),
(227, 'Z240	9.09171E+11', ''),
(228, 'Z242	1.73414E+11', ''),
(229, 'Z246	8.27151E+11', ''),
(230, 'Z249	2.56014E+11', ''),
(231, 'Z250	2.56204E+11', ''),
(232, 'Z252	2.56104E+11', ''),
(233, 'Z256	8.35301E+11', ''),
(234, 'Z258	1.73614E+11', ''),
(235, 'Z260	1.53014E+11', ''),
(236, 'Z262	1.70304E+11', ''),
(237, 'Z264	8.21251E+11', ''),
(238, 'Z279	1.57084E+11', ''),
(239, 'Z281	1.32114E+11', ''),
(240, 'Z282	1.62614E+11', ''),
(241, 'Z283	1.32114E+11', ''),
(242, 'Z285	1.32114E+11', ''),
(243, 'Z290	1.62644E+11', ''),
(244, 'Z292	1.62674E+11', ''),
(245, 'Z298	1.62684E+11', ''),
(246, 'Z306	1.63253E+11', ''),
(247, 'Z308	9.01595E+11', ''),
(248, 'Z311	1.32512E+11', ''),
(249, 'Z312	1.32512E+11', ''),
(250, 'Z313	1.32512E+11', ''),
(251, 'Z315	1.71384E+11', ''),
(252, 'Z334	2.38274E+11', ''),
(253, 'Z336	2.38274E+11', ''),
(254, 'Z338	1.93154E+11', ''),
(255, 'Z340	1931537030', ''),
(256, 'Z349	2.32912E+11', ''),
(257, 'Z353	2.38144E+11', ''),
(258, 'Z357	2.38264E+11', ''),
(259, 'Z358	2.38264E+11', ''),
(260, 'Z360	2.38914E+11', ''),
(261, 'Z365	2.57614E+11', ''),
(262, 'Z368	2.57614E+11', ''),
(263, 'Z371	1.32114E+11', ''),
(264, 'Z372	1.32114E+11', ''),
(265, 'Z373	1.32114E+11', ''),
(266, 'Z375	1.34704E+11', ''),
(267, 'Z376	8.27151E+11', ''),
(268, 'Z382	8271512A0100', ''),
(269, 'Z384	827152A30-00', ''),
(270, 'Z388	827156A46000', ''),
(271, 'Z392	8.94223E+11', ''),
(272, 'Z398	9.01051E+11', ''),
(273, 'Z402	9.01091E+11', ''),
(274, 'Z406	9.01101E+11', ''),
(275, 'Z412	9011908B4700', ''),
(276, 'Z414	9011908C8700', ''),
(277, 'Z414\'	9011908C8700', ''),
(278, 'Z416	9.01191E+11', ''),
(279, 'Z422	9.01261E+11', ''),
(280, 'Z425	9.01261E+11', ''),
(281, 'Z432	9.01261E+11', ''),
(282, 'Z436	9.01261E+11', ''),
(283, 'Z440	9.01261E+11', ''),
(284, 'Z440\'	9.01261E+11', ''),
(285, 'Z444	9.01791E+11', ''),
(286, 'Z448	9.01791E+11', ''),
(287, 'Z452	9.02011E+11', ''),
(288, 'Z456	9.02101E+11', ''),
(289, 'Z461	1.62584E+11', ''),
(290, 'Z464	9.025E+11', ''),
(291, 'Z471	9.02501E+11', ''),
(292, 'Z476	9.02501E+11', ''),
(293, 'Z480	9.02501E+11', ''),
(294, 'Z484	9.02531E+11', ''),
(295, 'Z488	9.02531E+11', ''),
(296, 'Z492	9.02531E+11', ''),
(297, 'Z504	9.03411E+11', ''),
(298, 'Z508	9.03455E+11', ''),
(299, 'Z512	9.04301E+11', ''),
(300, 'Z516	9.04301E+11', ''),
(301, 'Z520	9.04301E+11', ''),
(302, 'Z520\'	9.04301E+11', ''),
(303, 'Z524	9.04672E+11', ''),
(304, 'Z528	9.04672E+11', ''),
(305, 'Z536	9.05202E+11', ''),
(306, 'Z548	9.091E+11', ''),
(307, 'Z554	9.0913E+11', ''),
(308, 'Z568	9.09191E+11', ''),
(309, 'Z570	9091905091', ''),
(310, 'Z586	9.01791E+11', ''),
(311, 'Z642	3.21011E+11', ''),
(312, 'Z646	3.21161E+11', ''),
(313, 'Z648	3.21171E+11', ''),
(314, 'Z652	9.01051E+11', ''),
(315, 'Z660	9.41518E+11', ''),
(316, 'Z660\'	9.41518E+11', ''),
(317, 'Z664	9.41518E+11', ''),
(318, 'Z664\'	9.41518E+11', ''),
(319, 'Z664\'\'	9.41518E+11', ''),
(320, 'Z680	9.61374E+11', ''),
(321, 'Z680\'	9.61374E+11', ''),
(322, 'Z684	9.67212E+11', ''),
(323, 'Z688	9.67212E+11', ''),
(324, 'Z696	9.67232E+11', ''),
(325, 'Z716	1.35232E+11', ''),
(326, 'Z726	1.14094E+11', ''),
(327, 'Z730	1.60314E+11', ''),
(328, 'Z731	1.71404E+11', ''),
(329, 'Z790	9.15511E+11', ''),
(330, 'Z796	9.0919E+11', ''),
(331, 'Z800	1.22614E+11', ''),
(332, 'Z802	1.11864E+11', ''),
(333, 'Z804	1.22624E+11', ''),
(334, 'Z806	1.25514E+11', ''),
(335, 'Z817	1.62644E+11', ''),
(336, 'Z819	1.62684E+11', ''),
(337, 'Z824	1.73414E+11', ''),
(338, 'Z828	1.73424E+11', ''),
(339, 'Z834	1.73424E+11', ''),
(340, 'Z836	2.38264E+11', ''),
(341, 'Z838	1.73434E+11', ''),
(342, 'Z846	8271512R1000', ''),
(343, 'Z852	8.94213E+11', ''),
(344, 'Z856	8.94263E+11', ''),
(345, 'Z868	9.03014E+11', ''),
(346, 'Z872	9.09171E+11', ''),
(347, 'Z879	1.22624E+11', ''),
(348, 'Z883	9.0916E+11', ''),
(349, 'Z885	1.66204E+11', ''),
(350, 'Z887	1.73444E+11', ''),
(351, 'Z888	1.39084E+11', ''),
(352, 'Z889	1.73614E+11', ''),
(353, 'Z891	2.38264E+11', ''),
(354, 'Z893	2.57614E+11', ''),
(355, 'Z895	8.94291E+11', ''),
(356, 'Z9CX	3.12705E+11', ''),
(357, 'ZM04	1.15114E+11', ''),
(358, 'ZM06	1.15124E+11', ''),
(359, 'ZM08	9.091E+11', ''),
(360, 'ZM10	9.64111E+11', ''),
(361, 'ZM12	9.64111E+11', ''),
(362, 'ZM20	9.028E+11', ''),
(363, 'ZM98	9.01051E+11', ''),
(375, 'R02633', '3333333333'),
(374, 'R02022', '22222222');

-- --------------------------------------------------------

--
-- Table structure for table `scan_log`
--

CREATE TABLE `scan_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `part` varchar(100) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  `lane_id_fl` int(11) DEFAULT NULL,
  `booked_in` tinyint(1) DEFAULT NULL,
  `booked_out` tinyint(1) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `shift_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booked_in_time` datetime DEFAULT NULL,
  `out_user_id` int(11) DEFAULT NULL,
  `booked_out_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scan_log`
--

INSERT INTO `scan_log` (`id`, `part`, `lane_id`, `lane_id_fl`, `booked_in`, `booked_out`, `page`, `shift`, `shift_date`, `user_id`, `booked_in_time`, `out_user_id`, `booked_out_time`) VALUES
(1, 'zrb', 17, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-13', 45, '2022-10-14 01:29:43', 45, '2022-10-14 01:30:34'),
(2, 'zrkc', 16, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-13', 45, '2022-10-14 01:30:18', 44, '2022-10-16 13:52:22'),
(3, 'zrb', 5, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-13', 43, '2022-10-14 01:34:00', 44, '2022-10-16 13:51:26'),
(4, 'zrb', 17, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:17:17', 44, '2022-10-16 13:51:57'),
(5, 'zrb', 17, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:17:33', 44, '2022-10-16 13:52:02'),
(6, 'zrb', 17, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:17:37', 44, '2022-10-16 13:52:32'),
(7, 'ZRKB', 34, NULL, 1, 1, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:19:20', 45, '2022-10-15 21:19:56'),
(8, 'ZRKB', 34, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:19:35', NULL, NULL),
(9, 'ZRKB', 34, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:19:38', NULL, NULL),
(10, 'ZRKB', 34, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:19:46', NULL, NULL),
(11, 'ZRB', 34, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-15', 45, '2022-10-15 21:23:32', NULL, NULL),
(12, 'ZRB', 4, NULL, 1, 0, 'Stocking', 'shift1', '2022-10-16', 44, '2022-10-16 13:50:55', NULL, NULL),
(13, 'zrb', 17, NULL, 1, 1, 'Stocking', 'shift1', '2022-10-16', 44, '2022-10-16 13:53:01', 44, '2022-10-18 22:07:13'),
(14, 'zrb', 16, NULL, 1, 1, 'Stocking', 'shift1', '2022-10-16', 44, '2022-10-16 13:53:08', 46, '2022-10-19 00:21:09'),
(15, 'zrb', 4, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 44, '2022-10-18 22:07:30', NULL, NULL),
(16, 'zrb', 16, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:22:19', NULL, NULL),
(17, 'zrb', 17, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:25:49', NULL, NULL),
(18, 'zrb', 5, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:25:54', NULL, NULL),
(19, 'zrb', 33, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:26:20', NULL, NULL),
(20, 'zrb', 32, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:26:28', NULL, NULL),
(21, 'zrb', 31, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:26:35', NULL, NULL),
(22, 'zrb', 30, NULL, 1, 0, 'Stocking', 'shift2', '2022-10-18', 46, '2022-10-19 00:26:48', NULL, NULL),
(23, 'ZRKC', 4, NULL, 1, 0, 'Stocking', 'shift1', '2023-01-31', 42, '2023-01-31 11:25:47', NULL, NULL),
(24, 'ZRC', 17, NULL, 1, 0, 'Stocking', 'shift1', '2023-02-01', 45, '2023-02-01 09:34:23', NULL, NULL),
(25, 'ZRC', 17, NULL, 1, 0, 'Stocking', 'shift1', '2023-02-01', 45, '2023-02-01 09:42:54', NULL, NULL),
(26, 'ZRKC', 17, NULL, 1, 1, 'Stocking', 'shift1', '2023-02-08', 46, '2023-02-08 15:07:01', 46, '2023-02-08 15:08:06'),
(27, 'ZRKC', 17, NULL, 1, 0, 'Stocking', 'shift1', '2023-02-08', 46, '2023-02-08 15:07:15', NULL, NULL),
(28, 'ZRKC', 17, NULL, 1, 0, 'Stocking', 'shift1', '2023-02-08', 46, '2023-02-08 15:07:45', NULL, NULL),
(29, '1', 41, NULL, 1, 0, 'Stocking', 'shift1', '2023-02-22', 45, '2023-02-22 14:08:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scan_logold`
--

CREATE TABLE `scan_logold` (
  `id` int(10) UNSIGNED NOT NULL,
  `part` varchar(100) DEFAULT NULL,
  `lane_id` int(11) DEFAULT NULL,
  `booked_in` tinyint(1) DEFAULT NULL,
  `booked_out` tinyint(1) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `shift_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booked_in_time` datetime DEFAULT NULL,
  `out_user_id` int(11) DEFAULT NULL,
  `booked_out_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scan_logold`
--

INSERT INTO `scan_logold` (`id`, `part`, `lane_id`, `booked_in`, `booked_out`, `page`, `shift`, `shift_date`, `user_id`, `booked_in_time`, `out_user_id`, `booked_out_time`) VALUES
(1, 'AS 01', 1, 1, 1, 'Stocking', 'shift1', '2022-03-30', 46, '2022-03-31 01:40:14', 46, '2022-03-31 01:41:37'),
(2, 'AS 02', 2, 1, 0, 'Stocking', 'shift1', '2022-03-30', 46, '2022-03-31 01:40:22', NULL, NULL),
(3, 'AS 01', 1, 1, 1, 'Stocking', 'shift1', '2022-03-30', 46, '2022-03-31 01:40:35', 45, '2022-03-31 01:46:29'),
(4, 'AS 003', 6, 1, 0, 'Stocking', 'shift1', '2022-03-30', 46, '2022-03-31 01:42:37', NULL, NULL),
(5, 'As 04', 2, 1, 0, 'Stocking', 'shift1', '2022-03-30', 46, '2022-03-31 01:44:17', NULL, NULL),
(6, 'AS004', 1, 1, 0, 'Stocking', 'shift1', '2022-03-30', 45, '2022-03-31 01:45:39', NULL, NULL),
(7, 'As001', 1, 1, 1, 'Stocking', 'shift2', '2022-03-30', 45, '2022-03-31 02:55:09', 45, '2022-03-31 02:56:00'),
(8, 'AS 02', 2, 1, 0, 'Stocking', 'shift2', '2022-03-30', 45, '2022-03-31 02:55:18', NULL, NULL),
(9, 'AS 03', 6, 1, 0, 'Stocking', 'shift2', '2022-03-30', 45, '2022-03-31 02:55:29', NULL, NULL),
(10, 'as001', 8, 1, 0, 'Stocking', 'shift1', '2022-03-31', 43, '2022-03-31 23:41:29', NULL, NULL),
(11, 'AS 01', 4, 1, 0, 'Stocking', 'shift1', '2022-03-31', 43, '2022-03-31 23:41:57', NULL, NULL),
(12, 'ADM001', 8, 1, 0, 'Stocking', 'shift1', '2022-03-31', 43, '2022-04-01 00:07:07', NULL, NULL),
(13, 'test', 10, 1, 1, 'Stocking', 'shift2', '2022-03-31', 47, '2022-03-31 20:49:48', 47, '2022-03-31 21:03:30'),
(14, 'test2', 10, 1, 0, 'Stocking', 'shift2', '2022-03-31', 47, '2022-03-31 20:51:29', NULL, NULL),
(15, 'hugiy', 10, 1, 0, 'Stocking', 'shift2', '2022-03-31', 47, '2022-03-31 21:03:09', NULL, NULL),
(16, 'as 01', 1, 1, 0, 'Stocking', 'shift1', '2022-04-01', 41, '2022-04-01 23:49:53', NULL, NULL),
(17, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 02:54:46', NULL, NULL),
(18, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 02:57:01', NULL, NULL),
(19, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 02:58:57', NULL, NULL),
(20, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:06:23', NULL, NULL),
(21, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:06:32', NULL, NULL),
(22, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:07:25', NULL, NULL),
(23, 'BH02', 14, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:07:54', NULL, NULL),
(24, 'BH03', 14, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:09:56', NULL, NULL),
(25, 'BH02', 14, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:10:19', NULL, NULL),
(26, 'BH02', 13, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:11:11', NULL, NULL),
(27, 'BH01', 15, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:31:33', NULL, NULL),
(28, 'BH03', 14, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:31:43', NULL, NULL),
(29, 'BH02', 14, 1, 0, 'Stocking', 'shift2', '2022-04-13', 41, '2022-04-14 03:32:16', NULL, NULL),
(30, 'BH00', 1, 1, 0, 'Stocking', 'shift2', '2022-04-13', 42, '2022-04-14 03:41:15', NULL, NULL),
(31, 'BH06', 1, 1, 0, 'Stocking', 'shift2', '2022-04-13', 42, '2022-04-14 03:41:26', NULL, NULL),
(32, 'BH01', 1, 1, 1, 'L/P', 'shift1', '2022-04-14', 43, '2022-04-14 21:48:01', 47, '2022-09-05 13:30:49'),
(33, 'BH01', 1, 1, 1, 'Stocking', 'shift1', '2022-09-05', 47, '2022-09-05 13:11:41', 47, '2022-09-05 13:32:48'),
(34, 'BH01', 7, 1, 1, 'Stocking', 'shift1', '2022-09-05', 47, '2022-09-05 13:13:15', 46, '2022-09-08 06:48:38'),
(35, 'BH01', 7, 1, 1, 'Stocking', 'shift1', '2022-09-05', 46, '2022-09-05 15:23:49', 46, '2022-09-08 06:48:51'),
(36, 'bh01', 7, 1, 1, 'Stocking', 'shift2', '2022-09-07', 46, '2022-09-08 06:47:26', 47, '2022-09-08 15:51:55'),
(37, 'bh01', 7, 1, 1, 'Stocking', 'shift2', '2022-09-07', 46, '2022-09-08 06:47:59', 47, '2022-09-15 00:34:06'),
(38, 'BH01', 7, 1, 1, 'Stocking', 'shift1', '2022-09-08', 47, '2022-09-08 15:52:40', 47, '2022-09-15 10:31:45'),
(39, 'bh01', 7, 1, 1, 'Stocking', 'shift1', '2022-09-15', 47, '2022-09-15 10:34:52', 47, '2022-09-15 10:53:44'),
(40, 'bh01', 7, 1, 1, 'Stocking', 'shift1', '2022-09-15', 47, '2022-09-15 10:35:31', 46, '2022-09-16 08:00:07'),
(41, 'bh01', 7, 1, 0, 'Stocking', 'shift1', '2022-09-16', 46, '2022-09-16 07:59:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `set_value` text CHARACTER SET latin1 DEFAULT NULL,
  `set_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `set_value`, `set_type`) VALUES
(1, '{\"shift1\":{\"start\":\"07:30:00\",\"end\":\"17:48:00\",\"breaks\":{\"start1\":\"09:45:00\",\"end1\":\"10:00:00\",\"start2\":\"12:00:00\",\"end2\":\"12:30:00\",\"start3\":\"14:35:00\",\"end3\":\"14:45:00\",\"start4\":\"16:58:00\",\"end4\":\"17:03:00\"}},\"shift2\":{\"start\":\"20:30:00\",\"end\":\"06:48:00\",\"breaks\":{\"start1\":\"22:45:00\",\"end1\":\"23:00:00\",\"start2\":\"01:00:00\",\"end2\":\"01:30:00\",\"start3\":\"03:35:00\",\"end3\":\"03:45:00\",\"start4\":\"05:49:00\",\"end4\":\"06:03:00\"}},\"shift3\":{\"start\":\"01:01:00\",\"end\":\"06:05:00\",\"breaks\":{\"start1\":\"00:00:00\",\"end1\":\"00:00:00\",\"start2\":\"00:00:00\",\"end2\":\"00:00:00\",\"start3\":\"00:00:00\",\"end3\":\"00:00:00\",\"start4\":\"00:00:00\",\"end4\":\"00:00:00\"}}}', 'shift'),
(2, '{\"shift1\":{\"start\":\"07:30:00\",\"end\":\"17:48:00\",\"breaks\":{\"start1\":\"09:45:00\",\"end1\":\"10:00:00\",\"start2\":\"12:00:00\",\"end2\":\"12:30:00\",\"start3\":\"14:35:00\",\"end3\":\"14:45:00\",\"start4\":\"16:58:00\",\"end4\":\"17:03:00\"}},\"shift2\":{\"start\":\"20:30:00\",\"end\":\"06:48:00\",\"breaks\":{\"start1\":\"22:45:00\",\"end1\":\"23:00:00\",\"start2\":\"01:00:00\",\"end2\":\"01:30:00\",\"start3\":\"03:35:00\",\"end3\":\"03:45:00\",\"start4\":\"05:48:00\",\"end4\":\"06:03:00\"}},\"shift3\":{\"start\":\"07:05:00\",\"end\":\"07:05:00\",\"breaks\":{\"start1\":\"00:00:00\",\"end1\":\"00:00:00\",\"start2\":\"00:00:00\",\"end2\":\"00:00:00\",\"start3\":\"00:00:00\",\"end3\":\"00:00:00\",\"start4\":\"00:00:00\",\"end4\":\"00:00:00\"}}}', 'friday_shift'),
(3, '{\"shift1\":{\"start\":\"06:00:00\",\"end\":\"17:48:00\",\"breaks\":{\"start1\":\"09:45:00\",\"end1\":\"10:00:00\",\"start2\":\"12:00:00\",\"end2\":\"12:30:00\",\"start3\":\"14:35:00\",\"end3\":\"14:45:00\"}},\"shift2\":{\"start\":\"20:30:00\",\"end\":\"06:48:00\",\"breaks\":{\"start1\":\"22:45:00\",\"end1\":\"23:00:00\",\"start2\":\"01:02:00\",\"end2\":\"01:30:00\",\"start3\":\"03:35:00\",\"end3\":\"03:45:00\"}},\"shift3\":{\"start\":\"18:00:00\",\"end\":\"04:19:00\",\"breaks\":{\"start1\":\"20:15:00\",\"end1\":\"20:27:00\",\"start2\":\"22:30:00\",\"end2\":\"23:00:00\",\"start3\":\"01:05:00\",\"end3\":\"01:15:00\"}}}', 'shift2'),
(4, '{\"shift1\":{\"start\":\"06:30:00\",\"end\":\"14:00:00\",\"breaks\":{\"start1\":\"09:45:00\",\"end1\":\"10:00:00\",\"start2\":\"12:00:00\",\"end2\":\"12:30:00\",\"start3\":\"14:35:00\",\"end3\":\"14:45:00\"}},\"shift2\":{\"start\":\"14:00:00\",\"end\":\"22:00:00\",\"breaks\":{\"start1\":\"22:45:00\",\"end1\":\"23:00:00\",\"start2\":\"01:00:00\",\"end2\":\"01:30:00\",\"start3\":\"03:35:00\",\"end3\":\"03:45:00\"}},\"shift3\":{\"start\":\"22:00:00\",\"end\":\"06:30:00\",\"breaks\":{\"start1\":\"00:00:00\",\"end1\":\"00:06:00\",\"start2\":\"00:00:00\",\"end2\":\"00:00:00\",\"start3\":\"00:00:00\",\"end3\":\"00:00:00\"}}}', 'shift3'),
(5, '1', 'system_fill_buffer_value'),
(6, '20', 'system_fill_target_value'),
(7, '16', 'conveyance_buffer_value'),
(8, '20', 'conveyance_target_value'),
(9, '14', 'conveyance_cycle_setting'),
(10, '1', 'casting_buffer_time'),
(11, '20', 'casting_target_time'),
(12, '1', 'cam_internal_buffer_time'),
(13, '20', 'cam_internal_target_time'),
(14, '3 shifts', 'L/P Shift Pattern'),
(15, '3 shifts', 'Conveyance Shift Pattern'),
(16, '2 shifts', 'CAM Internal Shift Pattern'),
(17, '2 shifts', 'Casting Shift Pattern'),
(18, '{\"shift1\":{\"start\":\"07:30:00\",\"end\":\"17:48:00\",\"breaks\":{\"start1\":\"09:45:00\",\"end1\":\"10:00:00\",\"start2\":\"12:00:00\",\"end2\":\"12:30:00\",\"start3\":\"14:35:00\",\"end3\":\"14:45:00\"}},\"shift2\":{\"start\":\"20:30:00\",\"end\":\"06:48:00\",\"breaks\":{\"start1\":\"22:45:00\",\"end1\":\"23:00:00\",\"start2\":\"01:02:00\",\"end2\":\"01:30:00\",\"start3\":\"03:35:00\",\"end3\":\"03:45:00\"}},\"shift3\":{\"start\":\"18:00:00\",\"end\":\"04:19:00\",\"breaks\":{\"start1\":\"20:15:00\",\"end1\":\"20:27:00\",\"start2\":\"22:30:00\",\"end2\":\"23:00:00\",\"start3\":\"01:05:00\",\"end3\":\"01:15:00\"}}}', '2 shifts'),
(19, '{\"shift1\":{\"start\":\"06:30:00\",\"end\":\"14:00:00\",\"breaks\":{\"start1\":\"09:45:00\",\"end1\":\"10:00:00\",\"start2\":\"12:00:00\",\"end2\":\"12:30:00\",\"start3\":\"14:35:00\",\"end3\":\"14:45:00\"}},\"shift2\":{\"start\":\"14:00:00\",\"end\":\"22:00:00\",\"breaks\":{\"start1\":\"22:45:00\",\"end1\":\"23:00:00\",\"start2\":\"01:00:00\",\"end2\":\"01:30:00\",\"start3\":\"03:35:00\",\"end3\":\"03:45:00\"}},\"shift3\":{\"start\":\"22:00:00\",\"end\":\"06:30:00\",\"breaks\":{\"start1\":\"00:00:00\",\"end1\":\"00:06:00\",\"start2\":\"00:00:00\",\"end2\":\"00:00:00\",\"start3\":\"00:00:00\",\"end3\":\"00:00:00\"}}}', '3 shifts'),
(20, 'ZR_Assembly.Andon.R_Total_CountZR', 'amount_tag'),
(21, '2 shifts', 'Shift Pattern'),
(22, 'EM097', 'renban_no_prefix');

-- --------------------------------------------------------

--
-- Table structure for table `stocking`
--

CREATE TABLE `stocking` (
  `id` int(10) UNSIGNED NOT NULL,
  `lane_no` int(11) DEFAULT NULL,
  `barcode_in` varchar(100) DEFAULT NULL,
  `barcode_out` varchar(100) DEFAULT NULL,
  `allocation` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `area` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stocking`
--

INSERT INTO `stocking` (`id`, `lane_no`, `barcode_in`, `barcode_out`, `allocation`, `height`, `area`) VALUES
(44, 4, 'Lane04', '', 1, 4, 'L/P'),
(43, 3, 'Lane03', '', 2, 4, 'L/P'),
(42, 2, 'Lane02', '', 36, 4, 'L/P'),
(41, 1, 'Lane01', '', 36, 4, 'L/P'),
(26, 9, 'LANE H9', '', 16, 2, 'H/P'),
(27, 8, 'LANE H8', '', 16, 2, 'H/P'),
(28, 7, 'LANE H7', '', 32, 4, 'H/P'),
(29, 6, 'LANE H6', '', 32, 4, 'H/P'),
(30, 5, 'LANE H5', '', 32, 4, 'H/P'),
(31, 4, 'LANE H4', '', 32, 4, 'H/P'),
(32, 3, 'LANE H3', '', 32, 4, 'H/P'),
(33, 2, 'LANE H2', '', 32, 4, 'H/P'),
(34, 1, 'LANE H1', '', 32, 4, 'H/P'),
(45, 11, 'LANE 1E', '', 18, 2, 'H/P'),
(46, 12, 'LANE 2E', '', 18, 2, 'H/P');

-- --------------------------------------------------------

--
-- Table structure for table `stocking_total`
--

CREATE TABLE `stocking_total` (
  `id` int(11) NOT NULL,
  `action_date` date NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `part` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stocking_total`
--

INSERT INTO `stocking_total` (`id`, `action_date`, `total`, `part`) VALUES
(1, '2022-10-15', 11, 'ZRB'),
(2, '2022-10-15', 3, 'ZRKB'),
(3, '2022-10-16', 10, 'ZRB'),
(4, '2022-10-16', -1, 'ZRKC'),
(5, '2022-10-18', 10, 'ZRB'),
(6, '2022-10-19', 16, 'ZRB'),
(7, '2023-01-31', 0, 'ZRKC'),
(8, '2023-02-01', 2, 'ZRC'),
(9, '2023-02-08', 2, 'ZRKC'),
(10, '2023-02-22', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `system_fill`
--

CREATE TABLE `system_fill` (
  `id` int(10) UNSIGNED NOT NULL,
  `lane_no` int(11) DEFAULT NULL,
  `barcode_in` varchar(100) DEFAULT NULL,
  `barcode_out` varchar(100) DEFAULT NULL,
  `allocation` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `area` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_fill`
--

INSERT INTO `system_fill` (`id`, `lane_no`, `barcode_in`, `barcode_out`, `allocation`, `height`, `area`) VALUES
(1, 1, '0001IN', '0001OUT', 24, 3, 'L/P'),
(2, 2, '0002IN', '0002OUT', 10, 2, 'L/P'),
(4, 1, '0011IN', '0011OUT', 12, 3, 'H/P'),
(6, 3, '0003IN', '0003OUT', 11, 3, 'L/P'),
(7, 4, '0004IN', '0004OUT', 15, 4, 'L/P'),
(8, 2, '0012IN', '0012OUT', 13, 3, 'H/P'),
(10, 5, '0005IN', '0005OUT', 12, 3, 'L/P'),
(11, 6, '0006IN', '0006OUT', 12, 3, 'L/P'),
(12, 7, '0007IN', '0007OUT', 12, 3, 'L/P'),
(13, 8, '0008IN', '0008OUT', 12, 3, 'L/P'),
(14, 9, '0009IN', '0009OUT', 12, 3, 'L/P');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `staff` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `staff`, `type`, `last_login`) VALUES
(43, 'Steven Bennett', '', '6583', 1, '2022-01-15 11:52:26'),
(54, 'dev', NULL, '11', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `container_devan`
--
ALTER TABLE `container_devan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conveyance_picks`
--
ALTER TABLE `conveyance_picks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dolly`
--
ALTER TABLE `dolly`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_alarm`
--
ALTER TABLE `help_alarm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overstock`
--
ALTER TABLE `overstock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `over_stocking`
--
ALTER TABLE `over_stocking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `part_to_kanban`
--
ALTER TABLE `part_to_kanban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan_log`
--
ALTER TABLE `scan_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan_logold`
--
ALTER TABLE `scan_logold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocking`
--
ALTER TABLE `stocking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocking_total`
--
ALTER TABLE `stocking_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_fill`
--
ALTER TABLE `system_fill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `container_devan`
--
ALTER TABLE `container_devan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `conveyance_picks`
--
ALTER TABLE `conveyance_picks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT for table `dolly`
--
ALTER TABLE `dolly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `help_alarm`
--
ALTER TABLE `help_alarm`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `overstock`
--
ALTER TABLE `overstock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `over_stocking`
--
ALTER TABLE `over_stocking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `part_to_kanban`
--
ALTER TABLE `part_to_kanban`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT for table `scan_log`
--
ALTER TABLE `scan_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `scan_logold`
--
ALTER TABLE `scan_logold`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `stocking`
--
ALTER TABLE `stocking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `stocking_total`
--
ALTER TABLE `stocking_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_fill`
--
ALTER TABLE `system_fill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
