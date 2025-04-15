-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 04 2018 г., 12:47
-- Версия сервера: 5.6.38
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `twitter`
--

-- --------------------------------------------------------

--
-- Структура таблицы `buy_currency`
--

CREATE TABLE `buy_currency` (
  `id` int(10) NOT NULL,
  `news_id` int(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `percent` float NOT NULL COMMENT 'процент на момент покупки',
  `btc` float NOT NULL,
  `quantity` float NOT NULL COMMENT 'колличество продаваемой валюты по отношению к BTC',
  `quantity_binance` float NOT NULL COMMENT 'колличество продаваемой валюты для binance',
  `amount` float NOT NULL COMMENT 'сумма к BTC',
  `amount_binance` float NOT NULL COMMENT 'сумма к BTC для binance',
  `amount_dollar_binance` float NOT NULL COMMENT 'сумма в долларах для binance',
  `date` datetime NOT NULL COMMENT 'когда была покупка',
  `status` varchar(10) NOT NULL COMMENT 'ответ сервера',
  `code` varchar(10) NOT NULL COMMENT 'код возможной ошибки',
  `msg` varchar(100) NOT NULL COMMENT 'комментарий к возможной ошибке',
  `order_id` int(11) NOT NULL,
  `was_sell` tinyint(1) NOT NULL COMMENT 'Был ли потом продан'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `buy_currency`
--

INSERT INTO `buy_currency` (`id`, `news_id`, `currency`, `percent`, `btc`, `quantity`, `quantity_binance`, `amount`, `amount_binance`, `amount_dollar_binance`, `date`, `status`, `code`, `msg`, `order_id`, `was_sell`) VALUES
(1, 1, 'XLM', 0.111062, 0.00004506, 22.193, 23, 0.00100002, 0.00103638, 9.58361, '2018-05-04 09:30:42', 'NEW', '', '', 2266, 1),
(2, 2, 'OMG', 0.161899, 0.001856, 0.539, 1, 0.00100038, 0.001856, 17.1628, '2018-05-04 09:30:44', 'NEW', '', '', 6383, 1),
(3, 6, 'ICX', 0.06818, 0.0004403, 2.271, 3, 0.000999921, 0.0013209, 12.2146, '2018-05-04 09:30:49', 'NEW', '', '', 8717, 1),
(4, 11, 'DASH', 0.265983, 0.051267, 0.02, 1, 0.00102534, 0.051267, 474.076, '2018-05-04 09:30:52', 'NEW', '', '', 6468, 1),
(5, 15, 'XEM', 0.157127, 0.00004461, 22.416, 23, 0.000999978, 0.00102603, 9.4879, '2018-05-04 09:30:53', 'NEW', '', '', 8873, 1),
(6, 9, 'BTS', 0.215285, 0.00003723, 26.86, 27, 0.000999998, 0.00100521, 9.29538, '2018-05-04 09:30:52', 'NEW', '', '', 821, 1),
(7, 10, 'DGD', 0.264713, 0.02765, 0.036, 1, 0.0009954, 0.02765, 255.685, '2018-05-04 09:30:52', 'NEW', '', '', 8026, 1),
(8, 16, 'STRAT', 0.051988, 0.0007698, 1.299, 2, 0.00099997, 0.0015396, 14.237, '2018-05-04 09:30:53', 'NEW', '', '', 4257, 1),
(9, 19, 'XMR', 0.531182, 0.02555, 0.039, 1, 0.00099645, 0.02555, 236.266, '2018-05-04 09:30:56', 'NEW', '', '', 3135, 1),
(10, 22, 'ZEC', 0.57302, 0.031417, 0.032, 1, 0.00100534, 0.031417, 290.519, '2018-05-04 09:31:01', 'NEW', '', '', 9148, 1),
(11, 25, 'IOTA', 0.02804, 0.0002497, 4.005, 5, 0.00100005, 0.0012485, 11.5451, '2018-05-04 09:31:04', 'NEW', '', '', 1581, 1),
(12, 20, 'XVG', 0.122699, 0.00000815, 122.699, 123, 0.000999997, 0.00100245, 9.26986, '2018-05-04 09:31:04', 'NEW', '', '', 6787, 1),
(13, 21, 'ADA', 0.026903, 0.00003717, 26.903, 27, 0.000999985, 0.00100359, 9.2804, '2018-05-04 09:31:21', 'NEW', '', '', 4670, 1),
(14, 14, 'STEEM', 0.049812, 0.0004017, 2.489, 3, 0.000999831, 0.0012051, 11.1438, '2018-05-04 09:31:21', 'NEW', '', '', 8707, 1),
(15, 23, 'NANO', 0.208725, 0.0010082, 0.992, 1, 0.00100013, 0.0010082, 9.32303, '2018-05-04 09:31:26', 'NEW', '', '', 4823, 1),
(16, 27, 'ETH', 0.085316, 0.082118, 0.012, 1, 0.000985416, 0.082118, 759.362, '2018-05-04 09:31:28', 'NEW', '', '', 4287, 1),
(17, 26, 'LSK', 0.101708, 0.0014763, 0.677, 1, 0.000999455, 0.0014763, 13.6516, '2018-05-04 09:31:29', 'NEW', '', '', 9614, 1),
(18, 28, 'EOS', 0.177152, 0.001753, 0.57, 1, 0.00099921, 0.001753, 16.2103, '2018-05-04 09:31:29', 'NEW', '', '', 7069, 1),
(19, 12, 'XRP', 0.021245, 0.00009415, 10.621, 11, 0.000999967, 0.00103565, 9.57686, '2018-05-04 09:32:21', 'NEW', '', '', 3505, 1),
(20, 4, 'ETC', 0.086281, 0.00232, 0.431, 1, 0.00099992, 0.00232, 21.4535, '2018-05-04 09:32:25', 'NEW', '', '', 2919, 1),
(21, 8, 'QTUM', 0.342318, 0.002345, 0.426, 1, 0.00099897, 0.002345, 21.6847, '2018-05-04 09:32:24', 'NEW', '', '', 89, 1),
(22, 17, 'TRX', 0.805524, 0.00000875, 114.286, 115, 0.001, 0.00100625, 9.30499, '2018-05-04 09:32:29', 'NEW', '', '', 9581, 1),
(23, 13, 'LTC', 0.346144, 0.016814, 0.059, 1, 0.000992026, 0.016814, 155.482, '2018-05-04 09:33:16', 'NEW', '', '', 2806, 1),
(24, 24, 'PPT', 0.172688, 0.0022623, 0.442, 1, 0.000999937, 0.0022623, 20.9199, '2018-05-04 09:33:18', 'NEW', '', '', 8007, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE `history` (
  `id` int(10) NOT NULL,
  `buy_id` int(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `price` float NOT NULL COMMENT 'цена валюты на данный момент',
  `history_sell` tinyint(1) NOT NULL COMMENT 'была ли продажа',
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `history`
--

INSERT INTO `history` (`id`, `buy_id`, `currency`, `price`, `history_sell`, `date`) VALUES
(1, 1, 'XLM', 0.000045, 1, '2018-05-04 09:31:10'),
(2, 2, 'OMG', 0.001856, 0, '2018-05-04 09:31:15'),
(3, 3, 'ICX', 0.0004402, 0, '2018-05-04 09:31:16'),
(4, 5, 'XEM', 0.00004465, 0, '2018-05-04 09:31:21'),
(5, 4, 'DASH', 0.051267, 0, '2018-05-04 09:31:21'),
(6, 7, 'DGD', 0.027664, 0, '2018-05-04 09:31:23'),
(7, 6, 'BTS', 0.00003724, 0, '2018-05-04 09:31:22'),
(8, 9, 'XMR', 0.025567, 0, '2018-05-04 09:31:25'),
(9, 8, 'STRAT', 0.0007713, 0, '2018-05-04 09:31:25'),
(10, 11, 'IOTA', 0.00024928, 1, '2018-05-04 09:31:28'),
(11, 10, 'ZEC', 0.031427, 0, '2018-05-04 09:31:28'),
(12, 2, 'OMG', 0.001859, 0, '2018-05-04 09:31:28'),
(13, 3, 'ICX', 0.000441, 0, '2018-05-04 09:31:29'),
(14, 5, 'XEM', 0.00004465, 0, '2018-05-04 09:31:32'),
(15, 12, 'XVG', 0.00000815, 0, '2018-05-04 09:31:32'),
(16, 4, 'DASH', 0.051266, 0, '2018-05-04 09:31:35'),
(17, 7, 'DGD', 0.027661, 0, '2018-05-04 09:31:36'),
(18, 6, 'BTS', 0.00003724, 0, '2018-05-04 09:31:38'),
(19, 9, 'XMR', 0.025581, 0, '2018-05-04 09:31:40'),
(20, 8, 'STRAT', 0.0007708, 0, '2018-05-04 09:31:40'),
(21, 2, 'OMG', 0.001857, 0, '2018-05-04 09:31:46'),
(22, 10, 'ZEC', 0.031321, 1, '2018-05-04 09:31:45'),
(23, 14, 'STEEM', 0.0004021, 0, '2018-05-04 09:31:47'),
(24, 3, 'ICX', 0.0004404, 0, '2018-05-04 09:31:47'),
(25, 13, 'ADA', 0.00003722, 0, '2018-05-04 09:31:46'),
(26, 5, 'XEM', 0.00004468, 0, '2018-05-04 09:31:47'),
(27, 4, 'DASH', 0.051172, 1, '2018-05-04 09:31:49'),
(28, 6, 'BTS', 0.00003724, 0, '2018-05-04 09:31:53'),
(29, 15, 'NANO', 0.0010124, 0, '2018-05-04 09:31:52'),
(30, 12, 'XVG', 0.00000815, 0, '2018-05-04 09:31:49'),
(31, 7, 'DGD', 0.027677, 0, '2018-05-04 09:31:52'),
(32, 9, 'XMR', 0.025527, 0, '2018-05-04 09:31:54'),
(33, 18, 'EOS', 0.0017564, 0, '2018-05-04 09:31:57'),
(34, 17, 'LSK', 0.0014726, 1, '2018-05-04 09:31:57'),
(35, 16, 'ETH', 0.082154, 0, '2018-05-04 09:31:56'),
(36, 8, 'STRAT', 0.0007708, 0, '2018-05-04 09:31:56'),
(37, 2, 'OMG', 0.001858, 0, '2018-05-04 09:31:59'),
(38, 14, 'STEEM', 0.0004021, 0, '2018-05-04 09:32:00'),
(39, 5, 'XEM', 0.00004468, 0, '2018-05-04 09:32:00'),
(40, 3, 'ICX', 0.0004404, 0, '2018-05-04 09:32:00'),
(41, 13, 'ADA', 0.00003722, 0, '2018-05-04 09:32:01'),
(42, 7, 'DGD', 0.027679, 0, '2018-05-04 09:32:05'),
(43, 6, 'BTS', 0.0000373, 0, '2018-05-04 09:32:04'),
(44, 15, 'NANO', 0.0010122, 0, '2018-05-04 09:32:04'),
(45, 12, 'XVG', 0.00000816, 0, '2018-05-04 09:32:04'),
(46, 9, 'XMR', 0.025582, 0, '2018-05-04 09:32:07'),
(47, 16, 'ETH', 0.08215, 0, '2018-05-04 09:32:10'),
(48, 18, 'EOS', 0.0017565, 0, '2018-05-04 09:32:07'),
(49, 8, 'STRAT', 0.0007713, 0, '2018-05-04 09:32:10'),
(50, 3, 'ICX', 0.0004402, 0, '2018-05-04 09:32:13'),
(51, 2, 'OMG', 0.001858, 0, '2018-05-04 09:32:12'),
(52, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:32:11'),
(53, 5, 'XEM', 0.00004463, 0, '2018-05-04 09:32:13'),
(54, 13, 'ADA', 0.00003722, 0, '2018-05-04 09:32:15'),
(55, 7, 'DGD', 0.027661, 0, '2018-05-04 09:32:18'),
(56, 15, 'NANO', 0.001013, 0, '2018-05-04 09:32:20'),
(57, 6, 'BTS', 0.0000373, 0, '2018-05-04 09:32:18'),
(58, 9, 'XMR', 0.025544, 0, '2018-05-04 09:32:20'),
(59, 12, 'XVG', 0.00000816, 0, '2018-05-04 09:32:21'),
(60, 18, 'EOS', 0.0017565, 0, '2018-05-04 09:32:22'),
(61, 16, 'ETH', 0.082209, 0, '2018-05-04 09:32:23'),
(62, 3, 'ICX', 0.0004404, 0, '2018-05-04 09:32:26'),
(63, 2, 'OMG', 0.001858, 0, '2018-05-04 09:32:28'),
(64, 13, 'ADA', 0.00003722, 0, '2018-05-04 09:32:29'),
(65, 8, 'STRAT', 0.0007708, 0, '2018-05-04 09:32:26'),
(66, 5, 'XEM', 0.00004462, 0, '2018-05-04 09:32:28'),
(67, 7, 'DGD', 0.027661, 0, '2018-05-04 09:32:29'),
(68, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:32:28'),
(69, 15, 'NANO', 0.0010114, 0, '2018-05-04 09:32:30'),
(70, 9, 'XMR', 0.025592, 0, '2018-05-04 09:32:32'),
(71, 6, 'BTS', 0.00003724, 0, '2018-05-04 09:32:31'),
(72, 12, 'XVG', 0.00000815, 0, '2018-05-04 09:32:32'),
(73, 16, 'ETH', 0.082196, 0, '2018-05-04 09:32:37'),
(74, 18, 'EOS', 0.0017571, 0, '2018-05-04 09:32:36'),
(75, 3, 'ICX', 0.0004408, 0, '2018-05-04 09:32:39'),
(76, 2, 'OMG', 0.001859, 0, '2018-05-04 09:32:40'),
(77, 8, 'STRAT', 0.0007717, 0, '2018-05-04 09:32:41'),
(78, 13, 'ADA', 0.0000372, 0, '2018-05-04 09:32:41'),
(79, 7, 'DGD', 0.027704, 0, '2018-05-04 09:32:42'),
(80, 5, 'XEM', 0.00004468, 0, '2018-05-04 09:32:41'),
(81, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:32:42'),
(82, 15, 'NANO', 0.0010106, 0, '2018-05-04 09:32:43'),
(83, 20, 'ETC', 0.002317, 1, '2018-05-04 09:32:46'),
(84, 19, 'XRP', 0.00009422, 0, '2018-05-04 09:32:46'),
(85, 12, 'XVG', 0.00000815, 0, '2018-05-04 09:32:48'),
(86, 6, 'BTS', 0.00003724, 0, '2018-05-04 09:32:47'),
(87, 18, 'EOS', 0.0017568, 0, '2018-05-04 09:32:50'),
(88, 9, 'XMR', 0.02557, 0, '2018-05-04 09:32:47'),
(89, 16, 'ETH', 0.082141, 0, '2018-05-04 09:32:49'),
(90, 21, 'QTUM', 0.002339, 1, '2018-05-04 09:32:48'),
(91, 3, 'ICX', 0.0004409, 0, '2018-05-04 09:32:51'),
(92, 22, 'TRX', 0.00000865, 1, '2018-05-04 09:32:53'),
(93, 2, 'OMG', 0.001859, 0, '2018-05-04 09:32:54'),
(94, 7, 'DGD', 0.027704, 0, '2018-05-04 09:32:57'),
(95, 15, 'NANO', 0.0010102, 0, '2018-05-04 09:32:57'),
(96, 5, 'XEM', 0.00004462, 0, '2018-05-04 09:32:56'),
(97, 8, 'STRAT', 0.0007717, 0, '2018-05-04 09:32:56'),
(98, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:32:57'),
(99, 13, 'ADA', 0.00003722, 0, '2018-05-04 09:32:56'),
(100, 19, 'XRP', 0.00009415, 0, '2018-05-04 09:33:00'),
(101, 18, 'EOS', 0.001759, 0, '2018-05-04 09:33:02'),
(102, 12, 'XVG', 0.00000817, 0, '2018-05-04 09:33:01'),
(103, 6, 'BTS', 0.00003738, 0, '2018-05-04 09:33:02'),
(104, 3, 'ICX', 0.0004407, 0, '2018-05-04 09:33:05'),
(105, 9, 'XMR', 0.025565, 0, '2018-05-04 09:33:02'),
(106, 2, 'OMG', 0.001859, 0, '2018-05-04 09:33:06'),
(107, 15, 'NANO', 0.0010098, 0, '2018-05-04 09:33:09'),
(108, 16, 'ETH', 0.082116, 0, '2018-05-04 09:33:04'),
(109, 5, 'XEM', 0.00004462, 0, '2018-05-04 09:33:11'),
(110, 7, 'DGD', 0.027661, 0, '2018-05-04 09:33:08'),
(111, 8, 'STRAT', 0.0007713, 0, '2018-05-04 09:33:09'),
(112, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:33:12'),
(113, 13, 'ADA', 0.00003721, 0, '2018-05-04 09:33:15'),
(114, 19, 'XRP', 0.00009415, 0, '2018-05-04 09:33:16'),
(115, 18, 'EOS', 0.00176, 0, '2018-05-04 09:33:17'),
(116, 6, 'BTS', 0.00003739, 0, '2018-05-04 09:33:17'),
(117, 12, 'XVG', 0.00000817, 0, '2018-05-04 09:33:19'),
(118, 15, 'NANO', 0.0010094, 0, '2018-05-04 09:33:19'),
(119, 2, 'OMG', 0.001854, 1, '2018-05-04 09:33:19'),
(120, 3, 'ICX', 0.0004407, 0, '2018-05-04 09:33:20'),
(121, 9, 'XMR', 0.025559, 0, '2018-05-04 09:33:19'),
(122, 16, 'ETH', 0.082219, 0, '2018-05-04 09:33:22'),
(123, 7, 'DGD', 0.027661, 0, '2018-05-04 09:33:23'),
(124, 5, 'XEM', 0.00004462, 0, '2018-05-04 09:33:23'),
(125, 8, 'STRAT', 0.0007714, 0, '2018-05-04 09:33:23'),
(126, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:33:23'),
(127, 13, 'ADA', 0.00003721, 0, '2018-05-04 09:33:26'),
(128, 19, 'XRP', 0.00009416, 0, '2018-05-04 09:33:27'),
(129, 18, 'EOS', 0.0017603, 0, '2018-05-04 09:33:29'),
(130, 15, 'NANO', 0.0010093, 0, '2018-05-04 09:33:29'),
(131, 6, 'BTS', 0.00003726, 0, '2018-05-04 09:33:30'),
(132, 12, 'XVG', 0.00000817, 0, '2018-05-04 09:33:30'),
(133, 16, 'ETH', 0.082209, 0, '2018-05-04 09:33:32'),
(134, 3, 'ICX', 0.0004407, 0, '2018-05-04 09:33:31'),
(135, 9, 'XMR', 0.025552, 0, '2018-05-04 09:33:31'),
(136, 7, 'DGD', 0.027661, 0, '2018-05-04 09:33:33'),
(137, 5, 'XEM', 0.00004462, 0, '2018-05-04 09:33:36'),
(138, 23, 'LTC', 0.016777, 1, '2018-05-04 09:33:36'),
(139, 13, 'ADA', 0.00003716, 0, '2018-05-04 09:33:38'),
(140, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:33:37'),
(141, 8, 'STRAT', 0.0007716, 0, '2018-05-04 09:33:37'),
(142, 19, 'XRP', 0.00009411, 0, '2018-05-04 09:33:38'),
(143, 18, 'EOS', 0.0017598, 0, '2018-05-04 09:33:39'),
(144, 6, 'BTS', 0.00003726, 0, '2018-05-04 09:33:42'),
(145, 24, 'PPT', 0.0022762, 0, '2018-05-04 09:33:40'),
(146, 15, 'NANO', 0.0010039, 1, '2018-05-04 09:33:40'),
(147, 12, 'XVG', 0.00000816, 0, '2018-05-04 09:33:42'),
(148, 3, 'ICX', 0.0004407, 0, '2018-05-04 09:33:43'),
(149, 7, 'DGD', 0.027609, 1, '2018-05-04 09:33:44'),
(150, 9, 'XMR', 0.025515, 1, '2018-05-04 09:33:44'),
(151, 16, 'ETH', 0.082209, 0, '2018-05-04 09:33:43'),
(152, 5, 'XEM', 0.00004464, 0, '2018-05-04 09:33:46'),
(153, 13, 'ADA', 0.0000372, 0, '2018-05-04 09:33:47'),
(154, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:33:49'),
(155, 19, 'XRP', 0.00009416, 0, '2018-05-04 09:33:50'),
(156, 6, 'BTS', 0.00003726, 0, '2018-05-04 09:33:51'),
(157, 8, 'STRAT', 0.0007716, 0, '2018-05-04 09:33:50'),
(158, 12, 'XVG', 0.00000817, 0, '2018-05-04 09:33:52'),
(159, 18, 'EOS', 0.0017599, 0, '2018-05-04 09:33:50'),
(160, 3, 'ICX', 0.0004406, 0, '2018-05-04 09:33:52'),
(161, 16, 'ETH', 0.082218, 0, '2018-05-04 09:33:54'),
(162, 24, 'PPT', 0.0022757, 0, '2018-05-04 09:33:51'),
(163, 13, 'ADA', 0.00003721, 0, '2018-05-04 09:33:56'),
(164, 5, 'XEM', 0.00004464, 0, '2018-05-04 09:33:56'),
(165, 14, 'STEEM', 0.0004016, 0, '2018-05-04 09:33:57'),
(166, 19, 'XRP', 0.0000941, 0, '2018-05-04 09:34:01'),
(167, 6, 'BTS', 0.00003728, 0, '2018-05-04 09:34:01'),
(168, 8, 'STRAT', 0.0007709, 0, '2018-05-04 09:34:02'),
(169, 18, 'EOS', 0.0017599, 0, '2018-05-04 09:34:03'),
(170, 3, 'ICX', 0.0004408, 0, '2018-05-04 09:34:04'),
(171, 12, 'XVG', 0.00000816, 0, '2018-05-04 09:34:07'),
(172, 16, 'ETH', 0.082217, 0, '2018-05-04 09:34:05'),
(173, 24, 'PPT', 0.0022704, 0, '2018-05-04 09:34:06'),
(174, 6, 'BTS', 0.00003728, 0, '2018-05-04 09:34:10'),
(175, 13, 'ADA', 0.0000372, 0, '2018-05-04 09:34:08'),
(176, 19, 'XRP', 0.0000941, 0, '2018-05-04 09:34:10'),
(177, 5, 'XEM', 0.00004462, 0, '2018-05-04 09:34:09'),
(178, 3, 'ICX', 0.0004408, 1, '2018-05-04 09:34:04'),
(179, 14, 'STEEM', 0.0004021, 0, '2018-05-04 09:34:09'),
(180, 6, 'BTS', 0.00003728, 1, '2018-05-04 09:34:10'),
(181, 5, 'XEM', 0.00004462, 1, '2018-05-04 09:34:09'),
(182, 8, 'STRAT', 0.0007713, 0, '2018-05-04 09:34:14'),
(183, 18, 'EOS', 0.0017588, 0, '2018-05-04 09:34:16'),
(184, 24, 'PPT', 0.0022704, 0, '2018-05-04 09:34:18'),
(185, 16, 'ETH', 0.082217, 0, '2018-05-04 09:34:19'),
(186, 19, 'XRP', 0.0000941, 0, '2018-05-04 09:34:19'),
(187, 12, 'XVG', 0.00000817, 0, '2018-05-04 09:34:18'),
(188, 13, 'ADA', 0.00003721, 0, '2018-05-04 09:34:20'),
(189, 8, 'STRAT', 0.0007713, 1, '2018-05-04 09:34:14'),
(190, 14, 'STEEM', 0.0004021, 0, '2018-05-04 09:34:20'),
(191, 18, 'EOS', 0.0017588, 0, '2018-05-04 09:34:25'),
(192, 24, 'PPT', 0.0022704, 0, '2018-05-04 09:34:28'),
(193, 12, 'XVG', 0.00000817, 1, '2018-05-04 09:34:18'),
(194, 16, 'ETH', 0.082133, 0, '2018-05-04 09:34:29'),
(195, 19, 'XRP', 0.00009414, 0, '2018-05-04 09:34:31'),
(196, 13, 'ADA', 0.00003721, 0, '2018-05-04 09:34:32'),
(197, 14, 'STEEM', 0.000402, 0, '2018-05-04 09:34:33'),
(198, 18, 'EOS', 0.0017568, 0, '2018-05-04 09:34:37'),
(199, 19, 'XRP', 0.0000941, 0, '2018-05-04 09:34:40'),
(200, 16, 'ETH', 0.082151, 0, '2018-05-04 09:34:40'),
(201, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:34:40'),
(202, 18, 'EOS', 0.0017588, 0, '2018-05-04 09:34:46'),
(203, 13, 'ADA', 0.00003718, 0, '2018-05-04 09:34:43'),
(204, 19, 'XRP', 0.0000941, 0, '2018-05-04 09:34:47'),
(205, 14, 'STEEM', 0.0004014, 0, '2018-05-04 09:34:44'),
(206, 16, 'ETH', 0.082151, 1, '2018-05-04 09:34:40'),
(207, 13, 'ADA', 0.00003718, 1, '2018-05-04 09:34:43'),
(208, 18, 'EOS', 0.0017588, 1, '2018-05-04 09:34:46'),
(209, 14, 'STEEM', 0.0004014, 1, '2018-05-04 09:34:44'),
(210, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:34:51'),
(211, 19, 'XRP', 0.0000941, 0, '2018-05-04 09:34:55'),
(212, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:34:58'),
(213, 19, 'XRP', 0.00009412, 0, '2018-05-04 09:35:05'),
(214, 24, 'PPT', 0.0022757, 0, '2018-05-04 09:35:11'),
(215, 19, 'XRP', 0.00009406, 0, '2018-05-04 09:35:13'),
(216, 19, 'XRP', 0.00009411, 0, '2018-05-04 09:35:21'),
(217, 24, 'PPT', 0.0022755, 0, '2018-05-04 09:35:23'),
(218, 19, 'XRP', 0.00009397, 1, '2018-05-04 09:35:28'),
(219, 24, 'PPT', 0.0022755, 0, '2018-05-04 09:35:28'),
(220, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:35:39'),
(221, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:35:46'),
(222, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:35:57'),
(223, 24, 'PPT', 0.0022759, 0, '2018-05-04 09:36:07'),
(224, 24, 'PPT', 0.0022768, 0, '2018-05-04 09:36:17'),
(225, 24, 'PPT', 0.0022768, 0, '2018-05-04 09:36:25'),
(226, 24, 'PPT', 0.002277, 0, '2018-05-04 09:36:33'),
(227, 24, 'PPT', 0.002277, 1, '2018-05-04 09:36:33');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `url` varchar(200) NOT NULL,
  `theme` text NOT NULL,
  `url_news` varchar(500) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `url`, `theme`, `url_news`, `date`) VALUES
(1, 'https://twitter.com/StellarOrg', 'We are pleased to introduce trading for Stellar Lumens (XLM). http://blog.bitfinex.com/announcements/bitfinex-launches-stellar-xlm-trading/ …pic.twitter.com/0DPLXm6Mmp', 'http://blog.bitfinex.com/announcements/bitfinex-launches-stellar-xlm-trading/', '2018-05-04 09:30:32'),
(2, 'https://twitter.com/omise_go', 'A repeat of the question asked at #deconomy2018: \"How do your previous life experiences affect your approach to mechanism design?\"@karl_dot_tech tldr \"Life can be rough but we can figure out ways to make it better for everyone and its important to believe this can be done.\"pic.twitter.com/QYluc4fT8n', '', '2018-05-04 09:30:32'),
(3, 'https://twitter.com/NEO_Blockchain', 'NEO Global Development Monthly Report – Aprilhttps://neo.org/blog/details/3077 …', 'https://neo.org/blog/details/3077', '2018-05-04 09:30:31'),
(4, 'https://twitter.com/eth_classic', 'Whats next for Classic- Revamped Reddithttps://www.reddit.com/r/EthereumClassic/ …- ETC Forum http://forum.ethereumclassic.org  - 2017 Dev Recap http://bit.ly/2017ETCRecap - January Projects Update  http://bit.ly/ETCProjectsUpdate …- 2018 Detailed Roadmap http://bit.ly/2018Roadmap  #ClassicIsComingpic.twitter.com/EAg8XddgGO', 'https://www.reddit.com/r/EthereumClassic/', '2018-05-04 09:30:34'),
(5, 'https://twitter.com/vechainofficial', 'Very excited that @vechainofficial is part of MOBI, can’t wait to share our experience in Blockchain and IoT to develop an ecosystem where mobility is safer and more affordable.https://twitter.com/mobi_connect/status/991681277832019969 …', '', '2018-05-04 09:30:33'),
(6, 'https://twitter.com/helloiconworld', 'Google translate link for article: https://translate.google.co.in/translate?hl=&sl=ko&tl=en&u=https%3A%2F%2Fwww.coindeskkorea.com%2F%25EB%258C%2591-%25EA%25B0%259C%25EB%25B0%259C%25EC%259E%2590%25EB%2593%25A4-%25EC%259D%25B4%25EB%258D%2594%25EB%25A6%25AC%25EC%259B%2580-%25EB%25A7%2590%25EA%25B3%25A0-%25EC%2595%2584%25EC%259D%25B4%25EC%25BD%2598%25EC%259C%25BC%25EB%25A1%259C-%25EC%2598%25A4%25EB%259D%25BC%2F&sandbox=1 …https://twitter.com/coindeskkorea/status/992214410310504448 …', 'https://translate.google.co.in/translate?hl=&sl=ko&tl=en&u=https%3A%2F%2Fwww.coindeskkorea.com%2F%25EB%258C%2591-%25EA%25B0%259C%25EB%25B0%259C%25EC%259E%2590%25EB%2593%25A4-%25EC%259D%25B4%25EB%258D%2594%25EB%25A6%25AC%25EC%259B%2580-%25EB%25A7%2590%25EA%25B3%25A0-%25EC%2595%2584%25EC%259D%25B4%25EC%25BD%2598%25EC%259C%25BC%25EB%25A1%259C-%25EC%2598%25A4%25EB%259D%25BC%2F&sandbox=1', '2018-05-04 09:30:39'),
(7, 'https://twitter.com/bitcoingold', 'BTGs purpose: counter the centralization and control of mining by ASIC/specialty hardware.Our purpose has not changed. We WILL UPGRADE our network to counter them!Money spent on special hardware to mine BTG will be money lost. #1CPU1VOTE #BTG #mining4anyone #Bitcoingoldpic.twitter.com/cQOERCXspc', '', '2018-05-04 09:30:39'),
(8, 'https://twitter.com/QtumOfficial', '#Qtum Community Updates for March/April 2018https://medium.com/@Qtum/qtum-community-development-updates-dd72f97e0f2c …#Bitcoin #Blockchain #Fintech #Cryptocurrency', '', '2018-05-04 09:30:39'),
(9, 'https://twitter.com/bitshares', 'https://www.youtube.com/watch?v=t2K9PWqXhyU …', 'https://www.youtube.com/watch?v=t2K9PWqXhyU', '2018-05-04 09:30:39'),
(10, 'https://twitter.com/DigixGlobal', 'Great Ethereum Singapore meetup with the mega 6 projects, @MakerDAO , @gnosisPM , @melonport , @ConsenLabs , @tenxwallet @AragonProject !pic.twitter.com/Ywp3wbQa6U', '', '2018-05-04 09:30:40'),
(11, 'https://twitter.com/Dashpay', 'Key Reasons Why #Dash (DASH) Should be on Your Investment list in May 2018#DigitalCash #Cryptohttp://technewsleader.com/2018/05/02/key-reasons-why-dash-dash-should-be-on-your-investment-list-in-may-2018/ …', '', '2018-05-04 09:30:40'),
(12, 'https://twitter.com/Ripple', 'We’ve noticed an increase in fraudulent accounts claiming to be @Ripple or members of the Ripple Team offering giveaways. Be on alert - they are not official accounts.', '', '2018-05-04 09:30:40'),
(13, 'https://twitter.com/LitecoinProject', 'Litecoin Core v0.15.1 released! All users are advised to upgrade.https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc …', 'https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc', '2018-05-04 09:30:40'),
(14, 'https://twitter.com/steemit', 'https://www.meetup.com/ko-KR/GOPAX-Meetup/events/249407466/ … #steem #steemit #blockchain #cryptocurrency #bitcoin #smt #GOPAXmeetupsteemit', 'https://www.meetup.com/ko-KR/GOPAX-Meetup/events/249407466/', '2018-05-04 09:30:40'),
(15, 'https://twitter.com/NEMofficial', 'CATAPULT ANNOUNCEMENT: NEM officially launches Catapult Beta. Apply to participate in the early access program! Read the official press release here: http://bit.ly/Catapult-Beta #NEM #Catapult #mijinpic.twitter.com/IjBuiOAMpr', 'http://bit.ly/Catapult-Beta', '2018-05-04 09:30:39'),
(16, 'https://twitter.com/stratisplatform', 'Stratis Roadmap Update: https://stratisplatform.com/2018/02/13/stratis-development-roadmap-update/ … #blockchain #roadmap #bitcoin #dotnet $STRATpic.twitter.com/WnWKnQttpr', 'https://stratisplatform.com/2018/02/13/stratis-development-roadmap-update/', '2018-05-04 09:30:40'),
(17, 'https://twitter.com/Tronfoundation', '$TRX #TRX The #TRON Programming Contest starts to recieve applications from 17 of April 2018! For more details please refer to the link below. Please take THIS as the final standard of Contest Timeline. @justinsuntron #TRONSRhttps://medium.com/@Tronfoundation/tron-programming-contest-252fc9fb8c94 …pic.twitter.com/8iSPfh0Iyt', '', '2018-05-04 09:30:41'),
(18, 'https://twitter.com/OntologyNetwork', 'Ontologys first projects are now live on GitHub (https://github.com/ontio/ )! Read our open letter to the tech community here: https://medium.com/@OntologyNetwork/the-first-open-letter-to-the-ontology-technology-community-a65fe024ae1f …. ONT Block Explorer is also live (https://explorer.ont.io/ ). If youre not on Discord, come join us: https://discord.gg/4TQujHj/ ! $ONTpic.twitter.com/rVecaaRIcT', 'https://github.com/ontio/', '2018-05-04 09:30:40'),
(19, 'https://twitter.com/monerocurrency', 'A Scheduled Network Upgrade is Planned for April 6:https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html …', 'https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html', '2018-05-04 09:30:41'),
(20, 'https://twitter.com/vergecurrency', '#VergeDay is upon us! Your favorite adult brands are now accepting @vergecurrency to pay for memberships +more and to celebrate we’re giving away over 300K $XVG! RT and follow @vergecurrency to WIN! #vergefampic.twitter.com/32Rl2WOHMg', '', '2018-05-04 09:30:41'),
(21, 'https://twitter.com/CardanoStiftung', 'We, or any of the Cardano affiliated organizations/personnel, will never ask you to send us Ada or any other asset. Please be vigilant and use common sense! For more information on staying safe online, please read our Help Centre article here:http://ow.ly/mOsN30j9A2x ', 'http://ow.ly/mOsN30j9A2x', '2018-05-04 09:30:41'),
(22, 'https://twitter.com/zcashco', 'The NPR show, @Radiolab did a podcast featuring #Zcash and the MPC Ceremony. Listen to the story here:http://www.radiolab.org/story/ceremony/ ', '', '2018-05-04 09:30:41'),
(23, 'https://twitter.com/nanocurrency', 'The Nano Core Team is excited to share our roadmap and vision for the future of Nano:https://developers.nano.org/roadmap ', 'https://developers.nano.org/roadmap', '2018-05-04 09:30:41'),
(24, 'https://twitter.com/BitPopulous', 'https://medium.com/@BitPopulous/populous-humble-beginnings-d74fcdc09e49 … ', 'https://medium.com/@BitPopulous/populous-humble-beginnings-d74fcdc09e49', '2018-05-04 09:30:42'),
(25, 'https://twitter.com/iotatoken', 'We are moving rapidly towards the next epoch of IOTA, today the IOTA Foundation is excited and proud to start the official unveiling of Qubic.http://qubic.iota.org #IOTA #Qubic', 'http://qubic.iota.org', '2018-05-04 09:30:41'),
(26, 'https://twitter.com/LiskHQ', 'Create the #Future with #Lisk.  https://youtu.be/rTgAC-XTInI ', '', '2018-05-04 09:30:42'),
(27, 'https://twitter.com/ethereum', 'Ethereum: the World Computerhttps://www.youtube.com/watch?v=j23HnORQXvs …', 'https://www.youtube.com/watch?v=j23HnORQXvs', '2018-05-04 09:30:41'),
(28, 'https://twitter.com/EOS_io', 'EOSIO Dawn 3.0 Now Available #EOSIOhttps://medium.com/eosio/eosio-dawn-3-0-now-available-49a3b99242d7 …', '', '2018-05-04 09:30:42');

-- --------------------------------------------------------

--
-- Структура таблицы `sell_currency`
--

CREATE TABLE `sell_currency` (
  `id` int(10) NOT NULL,
  `news_id` int(11) NOT NULL,
  `buy_id` int(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `btc` float NOT NULL COMMENT 'начальная цена к BTC',
  `price` float NOT NULL COMMENT 'итоговая цена при добавлении к BTC',
  `quantity_btc` float NOT NULL COMMENT 'начальный объем валюты ',
  `quantity_price` float NOT NULL COMMENT 'объем валюты без комиссии',
  `quantity_price_commission` float NOT NULL COMMENT 'конечный объем валюты с комиссией',
  `quantity_binance` float NOT NULL COMMENT 'объем валюты для api binance',
  `amount` float NOT NULL COMMENT 'сумма в BTC',
  `amount_binance` float NOT NULL COMMENT 'сумма в BTC для binance',
  `amount_dollar_binance` float NOT NULL COMMENT 'сумма в $ для binance',
  `profit` float NOT NULL COMMENT 'прибыль в $ по отн.кол.валюты',
  `profit_commission` float NOT NULL COMMENT 'прибыль в $  с учетом комиссии по отн. кол. валюты',
  `cause` varchar(100) NOT NULL COMMENT 'причина продажи',
  `status` varchar(10) NOT NULL,
  `code` varchar(100) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `order_id` int(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `sell_currency`
--

INSERT INTO `sell_currency` (`id`, `news_id`, `buy_id`, `currency`, `btc`, `price`, `quantity_btc`, `quantity_price`, `quantity_price_commission`, `quantity_binance`, `amount`, `amount_binance`, `amount_dollar_binance`, `profit`, `profit_commission`, `cause`, `status`, `code`, `msg`, `order_id`, `date`) VALUES
(1, 1, 1, 'XLM', 0.00004506, 0.000045, 22.1926, 22.2222, 22.2167, 23, 0.00100108, 0.00103638, 9.58361, -0.0000000721282, -0.00230956, 'Валюта упала на 0.1 % ', 'NEW', '', '', 8772, '2018-05-04 09:31:10'),
(2, 25, 11, 'IOTA', 0.0002497, 0.00024928, 4.00481, 4.01155, 4.01055, 5, 0.00100143, 0.0012485, 11.5451, -0.00001732, -0.00232246, 'Валюта упала на 0.1 % ', 'NEW', '', '', 8308, '2018-05-04 09:31:28'),
(3, 22, 10, 'ZEC', 0.031417, 0.031321, 0.03183, 0.03193, 0.03192, 1, 0.00100283, 0.031417, 290.519, 0.000706671, -0.00218964, 'Валюта росла и упала на 0.1 % ', 'NEW', '', '', 4267, '2018-05-04 09:31:45'),
(4, 11, 4, 'DASH', 0.051267, 0.051172, 0.01951, 0.01954, 0.01954, 1, 0.00100176, 0.051267, 474.076, -0.00294329, -0.00294329, 'Валюта росла и упала на 0.1 % ', 'NEW', '', '', 5574, '2018-05-04 09:31:49'),
(5, 26, 17, 'LSK', 0.0014763, 0.0014726, 0.67737, 0.67907, 0.6789, 1, 0.00100226, 0.0014763, 13.6516, -0.0000263453, -0.00234131, 'Валюта упала на 0.1 % ', 'NEW', '', '', 1781, '2018-05-04 09:31:57'),
(6, 4, 20, 'ETC', 0.00232, 0.002317, 0.43103, 0.43159, 0.43148, 1, 0.00100103, 0.00232, 21.4535, 0.0000409651, -0.00231587, 'Валюта упала на 0.1 % ', 'NEW', '', '', 377, '2018-05-04 09:32:46'),
(7, 8, 21, 'QTUM', 0.002345, 0.002339, 0.42644, 0.42753, 0.42743, 1, 0.00100232, 0.002345, 21.6847, -0.0000844269, -0.00224735, 'Валюта упала на 0.1 % ', 'NEW', '', '', 6158, '2018-05-04 09:32:48'),
(8, 17, 22, 'TRX', 0.00000875, 0.00000865, 114.286, 115.607, 115.578, 116, 0.00101131, 0.001015, 9.38591, 0.000000633433, -0.00231183, 'Валюта упала на 0.1 % ', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:32:53'),
(9, 2, 2, 'OMG', 0.001856, 0.001854, 0.53879, 0.53937, 0.53924, 1, 0.00100083, 0.001856, 17.1628, -0.0000208987, -0.00224966, 'Валюта росла и упала на 0.1 % ', 'NEW', '', '', 6904, '2018-05-04 09:33:19'),
(10, 13, 23, 'LTC', 0.016814, 0.016777, 0.05947, 0.05961, 0.05959, 1, 0.00100195, 0.016814, 155.482, 0.00137219, -0.00173061, 'Валюта упала на 0.1 % ', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:33:36'),
(11, 23, 15, 'NANO', 0.0010082, 0.0010039, 0.99187, 0.99612, 0.99587, 1, 0.00100404, 0.0010082, 9.32303, 0.0000141852, -0.00230663, 'Валюта росла и упала на 0.1 % ', 'NEW', '', '', 7879, '2018-05-04 09:33:40'),
(12, 19, 9, 'XMR', 0.02555, 0.025515, 0.03914, 0.03919, 0.03918, 1, 0.00100105, 0.02555, 236.266, -0.000870624, -0.00323005, 'Валюта росла и упала на 0.1 % ', 'NEW', '', '', 703, '2018-05-04 09:33:44'),
(13, 10, 7, 'DGD', 0.02765, 0.027609, 0.03617, 0.03622, 0.03621, 1, 0.00100121, 0.02765, 255.685, -0.000948023, -0.00350108, 'Валюта росла и упала на 0.1 % ', 'NEW', '', '', 8580, '2018-05-04 09:33:44'),
(14, 6, 3, 'ICX', 0.0004403, 0.0004408, 2.27118, 2.2686, 2.26804, 3, 0.000998618, 0.0013209, 12.2146, -0.0000154798, -0.00229813, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:04'),
(15, 9, 6, 'BTS', 0.00003723, 0.00003728, 26.8601, 26.824, 26.8173, 27, 0.000998409, 0.00100521, 9.29538, -0.0000018069, -0.00231154, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:10'),
(16, 15, 5, 'XEM', 0.00004461, 0.00004462, 22.4165, 22.4115, 22.4059, 23, 0.000999526, 0.00102603, 9.4879, -0.00000253003, -0.00231315, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:09'),
(17, 16, 8, 'STRAT', 0.0007698, 0.0007713, 1.29904, 1.29651, 1.29619, 2, 0.000997807, 0.0015396, 14.237, -0.0000261603, -0.00230852, 'Валюта продана по истечению 180 сек.', 'NEW', '', '', 3041, '2018-05-04 09:34:14'),
(18, 20, 12, 'XVG', 0.00000815, 0.00000817, 122.699, 122.399, 122.368, 123, 0.000997303, 0.00100245, 9.26986, -0.000000324577, -0.00231214, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:18'),
(19, 28, 18, 'EOS', 0.001753, 0.0017588, 0.57045, 0.56857, 0.56843, 1, 0.000996458, 0.001753, 16.2103, 0.0000191047, -0.00225785, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:46'),
(20, 21, 13, 'ADA', 0.00003717, 0.00003718, 26.9034, 26.8962, 26.8895, 27, 0.000999481, 0.00100359, 9.2804, -0.00000137783, -0.00231179, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:43'),
(21, 27, 16, 'ETH', 0.082118, 0.082151, 0.01218, 0.01217, 0.01217, 1, 0.000999376, 0.082118, 759.362, -0.00387985, -0.00387985, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:40'),
(22, 14, 14, 'STEEM', 0.0004017, 0.0004014, 2.48942, 2.49128, 2.49066, 3, 0.0010005, 0.0012051, 11.1438, -0.00000205288, -0.00230338, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:34:44'),
(23, 12, 19, 'XRP', 0.00009415, 0.00009397, 10.6214, 10.6417, 10.639, 11, 0.00100166, 0.00103565, 9.57686, -0.00000456072, -0.00231599, 'Валюта росла и упала на 0.1 % ', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:35:28'),
(24, 24, 24, 'PPT', 0.0022623, 0.002277, 0.44203, 0.43917, 0.43906, 1, 0.000993285, 0.0022623, 20.9199, -0.000132965, -0.00244911, 'Валюта продана по истечению 180 сек.', 'error', '-1021', 'Timestamp for this request was 1000ms ahead of the servers time.', 0, '2018-05-04 09:36:33');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `buy_currency`
--
ALTER TABLE `buy_currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sell_currency`
--
ALTER TABLE `sell_currency`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buy_currency`
--
ALTER TABLE `buy_currency`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `sell_currency`
--
ALTER TABLE `sell_currency`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
