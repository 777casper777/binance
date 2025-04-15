-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 29 2018 г., 13:26
-- Версия сервера: 5.7.20
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
-- База данных: `binance`
--

-- --------------------------------------------------------

--
-- Структура таблицы `buy`
--

CREATE TABLE `buy` (
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
-- Дамп данных таблицы `buy`
--

INSERT INTO `buy` (`id`, `news_id`, `currency`, `percent`, `btc`, `quantity`, `quantity_binance`, `amount`, `amount_binance`, `amount_dollar_binance`, `date`, `status`, `code`, `msg`, `order_id`, `was_sell`) VALUES
(1, 2, 'LTC', 0.37799, 0.016199, 0.062, 1, 0.00100434, 0.016199, 122.321, '2018-05-24 16:20:14', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(2, 19, 'XVG', 0.365631, 0.00000548, 182.482, 183, 0.001, 0.00100284, 7.57259, '2018-05-24 16:20:14', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(3, 8, 'WAN', 0.489361, 0.0005955, 1.679, 2, 0.000999845, 0.001191, 8.99341, '2018-05-24 16:20:19', 'error', '-2010', 'Rest API trading is not enabled.', 0, 0),
(4, 28, 'VEN', 0.024917, 0.00048171, 2.076, 3, 0.00100003, 0.00144513, 10.9124, '2018-05-24 16:20:25', 'error', '-2010', 'Rest API trading is not enabled.', 0, 0),
(5, 20, 'EOS', 0.664469, 0.0015301, 0.654, 1, 0.00100069, 0.0015301, 11.554, '2018-05-24 16:20:19', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(6, 22, 'ETH', 0.186844, 0.07775, 0.013, 1, 0.00101075, 0.07775, 587.101, '2018-05-24 16:20:13', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(7, 9, 'ONT', 0.428068, 0.0008915, 1.122, 2, 0.00100026, 0.001783, 13.4637, '2018-05-24 16:20:11', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(8, 18, 'XMR', 0.439889, 0.022148, 0.045, 1, 0.00099666, 0.022148, 167.243, '2018-05-24 16:20:18', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(9, 7, 'OMG', 0.416086, 0.001448, 0.691, 1, 0.00100057, 0.001448, 10.9341, '2018-05-24 16:20:18', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(10, 16, 'IOTA', 0.23147, 0.00019918, 5.021, 6, 0.00100008, 0.00119508, 9.02422, '2018-05-24 16:20:18', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(11, 12, 'DGD', 0.138832, 0.019475, 0.051, 1, 0.000993225, 0.019475, 147.058, '2018-05-24 16:20:16', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(12, 24, 'ZRX', 0.215668, 0.00017192, 5.817, 6, 0.00100006, 0.00103152, 7.78915, '2018-05-24 16:20:18', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(13, 11, 'BTS', 0.15273, 0.00002622, 38.139, 39, 0.001, 0.00102258, 7.72164, '2018-05-24 16:20:18', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(14, 21, 'NEO', 0.014104, 0.007091, 0.141, 1, 0.000999831, 0.007091, 53.5024, '2018-05-24 16:21:07', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(15, 27, 'ZEC', 1.06501, 0.039002, 0.026, 1, 0.00101405, 0.039002, 294.51, '2018-05-24 16:20:24', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(16, 25, 'XRP', 0.012268, 0.00008151, 12.268, 13, 0.000999965, 0.00105963, 8.00141, '2018-05-24 16:20:25', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(17, 30, 'LSK', 0.347564, 0.0012126, 0.825, 1, 0.0010004, 0.0012126, 9.15651, '2018-05-24 16:20:26', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(18, 14, 'XLM', 0.534616, 0.0000376, 26.596, 27, 0.00100001, 0.0010152, 7.6598, '2018-05-24 16:20:52', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(19, 10, 'TRX', 0.10627, 0.00000941, 106.27, 107, 0.001, 0.00100687, 7.59694, '2018-05-24 16:21:09', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(20, 6, 'STRAT', 0.014124, 0.0007081, 1.412, 2, 0.000999837, 0.0014162, 10.6854, '2018-05-24 16:21:03', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(21, 3, 'XEM', 0.085788, 0.00003499, 28.58, 29, 0.00100001, 0.00101471, 7.6561, '2018-05-24 16:20:55', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(22, 23, 'ICX', 0.084008, 0.0003574, 2.798, 3, 0.00100001, 0.0010722, 8.08987, '2018-05-24 16:21:40', 'error', '-2010', 'Rest API trading is not enabled.', 0, 0),
(23, 17, 'PPT', 0.185649, 0.0018348, 0.545, 1, 0.000999966, 0.0018348, 13.8438, '2018-05-24 16:21:41', 'error', '-2010', 'Rest API trading is not enabled.', 0, 0),
(24, 15, 'ADA', 0.075216, 0.0000266, 37.594, 38, 0.001, 0.0010108, 7.6266, '2018-05-24 16:21:07', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(25, 31, 'AE', 0.04796, 0.0004172, 2.397, 3, 0.00100003, 0.0012516, 9.44346, '2018-05-24 16:21:43', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(26, 4, 'BTG', 0.016332, 0.006124, 0.163, 1, 0.000998212, 0.006124, 46.2063, '2018-05-24 16:21:40', 'error', '-1007', 'Timeout waiting for response from backend server. Send status unknown; execution status unknown.', 0, 0),
(27, 32, 'VEN', 0.146043, 0.00048, 2.083, 3, 0.00099984, 0.00144, 10.8102, '2018-05-24 17:18:39', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(28, 33, 'VEN', 0.158664, 0.00047975, 2.084, 3, 0.000999799, 0.00143925, 10.8046, '2018-05-24 17:19:26', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(29, 34, 'VEN', 0.158664, 0.00047975, 2.084, 3, 0.000999799, 0.00143925, 10.8046, '2018-05-24 17:19:53', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(30, 35, 'VEN', 0.158664, 0.00047975, 2.084, 3, 0.000999799, 0.00143925, 10.8046, '2018-05-24 17:20:09', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0),
(31, 36, 'VEN', 0.025122, 0.00047777, 2.093, 3, 0.000999973, 0.00143331, 10.7806, '2018-05-24 17:32:12', 'error', '-2010', 'Account has insufficient balance for requested action.', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `history_buy`
--

CREATE TABLE `history_buy` (
  `id` int(10) NOT NULL,
  `news_id` int(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `percent` float NOT NULL,
  `price` float NOT NULL,
  `history_buy` tinyint(2) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `history_buy`
--

INSERT INTO `history_buy` (`id`, `news_id`, `currency`, `percent`, `price`, `history_buy`, `date`) VALUES
(1, 22, 'ETH', 0.186844, 0.07775, 0, '2018-05-24 16:20:13'),
(2, 9, 'ONT', 0.428068, 0.0008915, 0, '2018-05-24 16:20:11'),
(3, 2, 'LTC', 0.37799, 0.016199, 0, '2018-05-24 16:20:14'),
(4, 1, 'NANO', -0.553775, 0.0005926, 0, '2018-05-24 16:20:12'),
(5, 14, 'XLM', 0, 0.0000376, 0, '2018-05-24 16:20:14'),
(6, 19, 'XVG', 0.365631, 0.00000548, 0, '2018-05-24 16:20:14'),
(7, 16, 'IOTA', 0.23147, 0.00019918, 0, '2018-05-24 16:20:18'),
(8, 5, 'STEEM', -0.026405, 0.0003786, 0, '2018-05-24 16:20:15'),
(9, 6, 'STRAT', -0.014122, 0.000708, 0, '2018-05-24 16:20:16'),
(10, 4, 'BTG', -0.228646, 0.006109, 0, '2018-05-24 16:20:16'),
(11, 3, 'XEM', -0.028563, 0.00003499, 0, '2018-05-24 16:20:15'),
(12, 11, 'BTS', 0.15273, 0.00002622, 0, '2018-05-24 16:20:18'),
(13, 7, 'OMG', 0.416086, 0.001448, 0, '2018-05-24 16:20:18'),
(14, 12, 'DGD', 0.138832, 0.019475, 0, '2018-05-24 16:20:16'),
(15, 18, 'XMR', 0.439889, 0.022148, 0, '2018-05-24 16:20:18'),
(16, 17, 'PPT', -0.010921, 0.0018311, 0, '2018-05-24 16:20:18'),
(17, 13, 'DASH', -0.222603, 0.044823, 0, '2018-05-24 16:20:18'),
(18, 15, 'ADA', -0.037594, 0.00002658, 0, '2018-05-24 16:20:20'),
(19, 24, 'ZRX', 0.215668, 0.00017192, 0, '2018-05-24 16:20:18'),
(20, 20, 'EOS', 0.664469, 0.0015301, 0, '2018-05-24 16:20:19'),
(21, 23, 'ICX', -0.055974, 0.0003571, 0, '2018-05-24 16:20:20'),
(22, 8, 'WAN', 0.489361, 0.0005955, 0, '2018-05-24 16:20:19'),
(23, 29, 'ETC', 0, 0.002036, 0, '2018-05-24 16:20:23'),
(24, 21, 'NEO', -0.042289, 0.007091, 0, '2018-05-24 16:20:21'),
(25, 27, 'ZEC', 1.06501, 0.039002, 0, '2018-05-24 16:20:24'),
(26, 30, 'LSK', 0.347564, 0.0012126, 0, '2018-05-24 16:20:26'),
(27, 26, 'QTUM', 0, 0.001784, 0, '2018-05-24 16:20:24'),
(28, 25, 'XRP', 0.012268, 0.00008151, 0, '2018-05-24 16:20:25'),
(29, 28, 'VEN', 0.024917, 0.00048171, 0, '2018-05-24 16:20:25'),
(30, 10, 'TRX', -0.106157, 0.0000094, 0, '2018-05-24 16:20:23'),
(31, 31, 'AE', -0.311146, 0.0004165, 0, '2018-05-24 16:20:25'),
(32, 2, 'LTC', 0.37799, 0.016199, 1, '2018-05-24 16:20:14'),
(33, 22, 'ETH', 0.186844, 0.07775, 1, '2018-05-24 16:20:13'),
(34, 19, 'XVG', 0.365631, 0.00000548, 1, '2018-05-24 16:20:14'),
(35, 9, 'ONT', 0.428068, 0.0008915, 1, '2018-05-24 16:20:11'),
(36, 7, 'OMG', 0.416086, 0.001448, 1, '2018-05-24 16:20:18'),
(37, 16, 'IOTA', 0.23147, 0.00019918, 1, '2018-05-24 16:20:18'),
(38, 18, 'XMR', 0.439889, 0.022148, 1, '2018-05-24 16:20:18'),
(39, 12, 'DGD', 0.138832, 0.019475, 1, '2018-05-24 16:20:16'),
(40, 11, 'BTS', 0.15273, 0.00002622, 1, '2018-05-24 16:20:18'),
(41, 24, 'ZRX', 0.215668, 0.00017192, 1, '2018-05-24 16:20:18'),
(42, 8, 'WAN', 0.489361, 0.0005955, 1, '2018-05-24 16:20:19'),
(43, 27, 'ZEC', 1.06501, 0.039002, 1, '2018-05-24 16:20:24'),
(44, 20, 'EOS', 0.664469, 0.0015301, 1, '2018-05-24 16:20:19'),
(45, 30, 'LSK', 0.347564, 0.0012126, 1, '2018-05-24 16:20:26'),
(46, 25, 'XRP', 0.012268, 0.00008151, 1, '2018-05-24 16:20:25'),
(47, 28, 'VEN', 0.024917, 0.00048171, 1, '2018-05-24 16:20:25'),
(48, 14, 'XLM', 0.534616, 0.0000376, 0, '2018-05-24 16:20:52'),
(49, 1, 'NANO', -0.486487, 0.0005932, 0, '2018-05-24 16:20:53'),
(50, 3, 'XEM', 0.085788, 0.00003499, 0, '2018-05-24 16:20:55'),
(51, 6, 'STRAT', 0.014124, 0.0007081, 0, '2018-05-24 16:21:03'),
(52, 15, 'ADA', 0.075216, 0.0000266, 0, '2018-05-24 16:21:07'),
(53, 4, 'BTG', -0.228646, 0.006109, 0, '2018-05-24 16:21:03'),
(54, 5, 'STEEM', 0, 0.0003786, 0, '2018-05-24 16:21:03'),
(55, 21, 'NEO', 0.014104, 0.007091, 0, '2018-05-24 16:21:07'),
(56, 17, 'PPT', -0.016381, 0.0018311, 0, '2018-05-24 16:21:04'),
(57, 23, 'ICX', 0, 0.0003571, 0, '2018-05-24 16:21:05'),
(58, 31, 'AE', -0.477886, 0.0004165, 0, '2018-05-24 16:21:08'),
(59, 29, 'ETC', -0.196077, 0.002036, 0, '2018-05-24 16:21:09'),
(60, 10, 'TRX', 0.10627, 0.00000941, 0, '2018-05-24 16:21:09'),
(61, 14, 'XLM', 0.534616, 0.0000376, 1, '2018-05-24 16:20:52'),
(62, 13, 'DASH', -0.235928, 0.044823, 0, '2018-05-24 16:21:08'),
(63, 26, 'QTUM', 0, 0.001784, 0, '2018-05-24 16:21:09'),
(64, 6, 'STRAT', 0.014124, 0.0007081, 1, '2018-05-24 16:21:03'),
(65, 3, 'XEM', 0.085788, 0.00003499, 1, '2018-05-24 16:20:55'),
(66, 15, 'ADA', 0.075216, 0.0000266, 1, '2018-05-24 16:21:07'),
(67, 21, 'NEO', 0.014104, 0.007091, 1, '2018-05-24 16:21:07'),
(68, 10, 'TRX', 0.10627, 0.00000941, 1, '2018-05-24 16:21:09'),
(69, 1, 'NANO', -0.604219, 0.0005922, 0, '2018-05-24 16:21:33'),
(70, 4, 'BTG', 0.016332, 0.006124, 0, '2018-05-24 16:21:40'),
(71, 23, 'ICX', 0.084008, 0.0003574, 0, '2018-05-24 16:21:40'),
(72, 31, 'AE', 0.04796, 0.0004172, 0, '2018-05-24 16:21:43'),
(73, 17, 'PPT', 0.185649, 0.0018348, 0, '2018-05-24 16:21:41'),
(74, 26, 'QTUM', 0, 0.001784, 0, '2018-05-24 16:21:43'),
(75, 5, 'STEEM', 0, 0.0003786, 0, '2018-05-24 16:21:42'),
(76, 29, 'ETC', -0.392155, 0.002032, 0, '2018-05-24 16:21:45'),
(77, 13, 'DASH', -0.202551, 0.044836, 0, '2018-05-24 16:21:47'),
(78, 23, 'ICX', 0.084008, 0.0003574, 1, '2018-05-24 16:21:40'),
(79, 4, 'BTG', 0.016332, 0.006124, 1, '2018-05-24 16:21:40'),
(80, 31, 'AE', 0.04796, 0.0004172, 1, '2018-05-24 16:21:43'),
(81, 17, 'PPT', 0.185649, 0.0018348, 1, '2018-05-24 16:21:41'),
(82, 32, 'VEN', -0.073043, 0.00047881, 0, '2018-05-24 17:17:36'),
(83, 32, 'VEN', -0.073043, 0.00047881, 0, '2018-05-24 17:18:06'),
(84, 32, 'VEN', 0.146043, 0.00048, 0, '2018-05-24 17:18:39'),
(85, 32, 'VEN', 0.146043, 0.00048, 1, '2018-05-24 17:18:39'),
(86, 33, 'VEN', 0.158664, 0.00047975, 0, '2018-05-24 17:19:26'),
(87, 33, 'VEN', 0.158664, 0.00047975, 1, '2018-05-24 17:19:26'),
(88, 34, 'VEN', 0.158664, 0.00047975, 0, '2018-05-24 17:19:53'),
(89, 34, 'VEN', 0.158664, 0.00047975, 1, '2018-05-24 17:19:53'),
(90, 35, 'VEN', 0.158664, 0.00047975, 0, '2018-05-24 17:20:09'),
(91, 35, 'VEN', 0.158664, 0.00047975, 1, '2018-05-24 17:20:09'),
(92, 36, 'VEN', 0.025122, 0.00047777, 0, '2018-05-24 17:32:12'),
(93, 36, 'VEN', 0.025122, 0.00047777, 1, '2018-05-24 17:32:12');

-- --------------------------------------------------------

--
-- Структура таблицы `history_sells`
--

CREATE TABLE `history_sells` (
  `id` int(10) NOT NULL,
  `buy_id` int(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `percent` float NOT NULL,
  `price` float NOT NULL COMMENT 'цена валюты на данный момент',
  `history_sells` tinyint(1) NOT NULL COMMENT 'была ли продажа',
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
(1, 'https://twitter.com/nanocurrency', 'Weve moved to @Nano, see you there!', '', '2018-05-24 16:19:38'),
(2, 'https://twitter.com/LitecoinProject', 'Litecoin Core v0.15.1 released! All users are advised to upgrade.https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc …', 'https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc', '2018-05-24 16:19:39'),
(3, 'https://twitter.com/NEMofficial', 'ANNOUNCEMENT: Catapult is now on private network! More info: http://bit.ly/Tech-Bureau-Releases-Catapult …pic.twitter.com/F7yzlyIVhC', 'http://bit.ly/Tech-Bureau-Releases-Catapult', '2018-05-24 16:19:39'),
(4, 'https://twitter.com/bitcoingold', 'The BTG team was busy for 3 full days at Consensus 2018 - nearly all the projects and players were here, with 8,500 paying attendees all wanting to talk! Great week full of new connections, capped by the invite-only United by Decentral closing event. #unitedbyDecentral #1CPU1VOTEpic.twitter.com/sU7Pn4iFau', '', '2018-05-24 16:19:39'),
(5, 'https://twitter.com/steemit', 'Ned Scott Explains Steem and Smart Media Tokens at @gopax_kr Meetup in Seoul: https://steemit.com/steem/@steemitblog/ned-talks-steem-steemit-and-smts … #steem #steemit #blockchain #cryptocurrency #smartmediatokens #smt #gopax', '', '2018-05-24 16:19:39'),
(6, 'https://twitter.com/stratisplatform', 'Stratis | Smart Contracts in C# alpha release https://youtu.be/dx_iCKGX6kc  via @YouTube', 'https://youtu.be/dx_iCKGX6kc', '2018-05-24 16:19:39'),
(7, 'https://twitter.com/omise_go', 'Ethereum Community Fund @ethereumecf & other grant-giving / research project-supporting funds in the Ethereum space, and a few beyond. Plus @ethstatus joins ECF! https://twitter.com/gabriellemic/status/998917529593696256 …', '', '2018-05-24 16:19:39'),
(8, 'https://twitter.com/wanchain_org', 'We are happy to announce our invitation-only Alpha Testnet for Wanchain 2.0.To view the criteria and sign up for Alpha testing, please register here: https://goo.gl/forms/4DI0dwCrb2QYIdPl1 … We will contact selected testers by the end of next week (up to 50). Thanks!', 'https://goo.gl/forms/4DI0dwCrb2QYIdPl1', '2018-05-24 16:19:39'),
(9, 'https://twitter.com/OntologyNetwork', 'Ontology Holds First European Meetup in London https://medium.com/ontologynetwork/ontology-holds-first-european-meetup-in-london-8f9eb50bbdfc … $ONT', 'https://medium.com/ontologynetwork/ontology-holds-first-european-meetup-in-london-8f9eb50bbdfc', '2018-05-24 16:19:39'),
(10, 'https://twitter.com/Tronfoundation', '$TRX #TRX The #TRON Programming Contest starts to recieve applications from 17 of April 2018! For more details please refer to the link below. Please take THIS as the final standard of Contest Timeline. @justinsuntron #TRONSRhttps://medium.com/@Tronfoundation/tron-programming-contest-252fc9fb8c94 …pic.twitter.com/8iSPfh0Iyt', '', '2018-05-24 16:19:39'),
(11, 'https://twitter.com/bitshares', 'https://www.youtube.com/watch?v=t2K9PWqXhyU …', 'https://www.youtube.com/watch?v=t2K9PWqXhyU', '2018-05-24 16:19:39'),
(12, 'https://twitter.com/DigixGlobal', '“DigixDAO Governance Model — Update #3” https://medium.com/@Digix/digixdao-governance-model-update-3-2202cd117d24 … #ethereumproject', 'https://medium.com/@Digix/digixdao-governance-model-update-3-2202cd117d24', '2018-05-24 16:19:39'),
(13, 'https://twitter.com/Dashpay', 'General Info:there is NO eth giveaway ! do not fall for it - we are being spammed like any other coin on Twitter these days !!#dash #digitalcash #crypto', '', '2018-05-24 16:19:39'),
(14, 'https://twitter.com/StellarOrg', 'The submission form will open on June 1st (so check back then), but developers can start announcing their projects on https://GalacticTalk.org  today!', 'https://GalacticTalk.org', '2018-05-24 16:19:39'),
(15, 'https://twitter.com/CardanoStiftung', 'We, or any of the Cardano affiliated organizations/personnel, will never ask you to send us Ada or any other asset. Please be vigilant and use common sense! For more information on staying safe online, please read our Help Centre article here:http://ow.ly/mOsN30j9A2x ', 'http://ow.ly/mOsN30j9A2x', '2018-05-24 16:19:39'),
(16, 'https://twitter.com/iotatoken', 'Welcome Jakub Cech to the IOTA Foundationhttps://blog.iota.org/welcome-jakub-cech-to-the-iota-foundation-2c74d47e5fb5 …#IOTA', 'https://blog.iota.org/welcome-jakub-cech-to-the-iota-foundation-2c74d47e5fb5', '2018-05-24 16:19:39'),
(17, 'https://twitter.com/BitPopulous', 'https://medium.com/@BitPopulous/a-legal-opinion-on-populous-world-ltd-uk-f15f3575a483 …', 'https://medium.com/@BitPopulous/a-legal-opinion-on-populous-world-ltd-uk-f15f3575a483', '2018-05-24 16:19:39'),
(18, 'https://twitter.com/monerocurrency', 'A Scheduled Network Upgrade is Planned for April 6:https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html …', 'https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html', '2018-05-24 16:19:39'),
(19, 'https://twitter.com/vergecurrency', 'it appears some mining pools are under ddos attack, and we are experiencing a delay in our blocks, we are working to resolve this.', '', '2018-05-24 16:19:39'),
(20, 'https://twitter.com/EOS_io', 'EOSIO 1.0 Release Updatehttps://block.one/eosio-1-0-release-update/ …', 'https://block.one/eosio-1-0-release-update/', '2018-05-24 16:19:39'),
(21, 'https://twitter.com/NEO_Blockchain', 'NEO Foundation and Ontology Foundation to Co-Fund a Joint Task Forcehttps://neo.org/blog/Details/3084 …', 'https://neo.org/blog/Details/3084', '2018-05-24 16:19:39'),
(22, 'https://twitter.com/ethereum', 'Ethereum: the World Computerhttps://www.youtube.com/watch?v=j23HnORQXvs …', 'https://www.youtube.com/watch?v=j23HnORQXvs', '2018-05-24 16:19:40'),
(23, 'https://twitter.com/helloiconworld', 'Exactly 1 year ago, I took a screenshot of @helloiconworld website launch. This is all we had. We’ve come a long way. #flashback #proud #warmfuzzyfeeling #thankyoupic.twitter.com/DokKA5Jam1', '', '2018-05-24 16:19:40'),
(24, 'https://twitter.com/0xProject', 'https://blog.0xproject.com/governance-in-0x-protocol-86779ae5809e …', 'https://blog.0xproject.com/governance-in-0x-protocol-86779ae5809e', '2018-05-24 16:19:40'),
(25, 'https://twitter.com/Ripple', 'We’ve noticed an increase in fraudulent accounts claiming to be @Ripple or members of the Ripple Team offering giveaways. Be on alert - they are not official accounts.', '', '2018-05-24 16:19:40'),
(26, 'https://twitter.com/QtumOfficial', 'I just published “Qtum at Blockchain Week NYC”https://medium.com/p/qtum-at-blockchain-week-nyc-a0da8d4ad01e …', 'https://medium.com/p/qtum-at-blockchain-week-nyc-a0da8d4ad01e', '2018-05-24 16:19:40'),
(27, 'https://twitter.com/zcashco', 'The NPR show, @Radiolab did a podcast featuring #Zcash and the MPC Ceremony. Listen to the story here:http://www.radiolab.org/story/ceremony/ ', '', '2018-05-24 16:19:40'),
(28, 'https://twitter.com/vechainofficial', '#VeChain is among 30 of 800+ hand-picked startups to compete for the second edition of the LVMH Innovation Award at #VivaTech! Come to meet @JeromeGrilleres & @mspandorah at Booth J36-028 in @LVMH Luxury Lab.pic.twitter.com/sx6gkPC2ye', '', '2018-05-24 16:19:40'),
(29, 'https://twitter.com/eth_classic', 'Whats next for Classic- Revamped Reddithttps://www.reddit.com/r/EthereumClassic/ …- ETC Forum http://forum.ethereumclassic.org  - 2017 Dev Recap http://bit.ly/2017ETCRecap - January Projects Update  http://bit.ly/ETCProjectsUpdate …- 2018 Detailed Roadmap http://bit.ly/2018Roadmap  #ClassicIsComingpic.twitter.com/EAg8XddgGO', 'https://www.reddit.com/r/EthereumClassic/', '2018-05-24 16:19:40'),
(30, 'https://twitter.com/LiskHQ', ' In an ongoing effort to update you on our development progress, heres a comprehensive blog post to address the status of #Lisk Core 1.0 & Beta Testing.  https://blog.lisk.io/development-update-lisk-core-1-0-beta-testing-f03d876646de …', '', '2018-05-24 16:19:40'),
(31, 'https://twitter.com/aeternity', ' Major announcement everyone! #aeternity launches #Starfleet #Incubator for #Blockchain #Innovation Get the details in the dedicated @BitcoinMagazine article:http://bit.ly/2kfjPE4 ', '', '2018-05-24 16:19:40'),
(32, 'https://twitter.com/vechainofficial', 'Come visit @JeromeGrilleres and @mspandorah at booth J35-028 here at @VivaTech. See for yourself how VeChain IS pioneering a global collaborative ecosystem built on public blockchain technology. #VivaTech#ViVaTech2018 #ViVaTechnology2018pic.twitter.com/sHizcPFihv', '', '2018-05-24 17:17:20'),
(33, 'https://twitter.com/vechainofficial', 'Come visit @JeromeGrilleres and @mspandorah at booth J35-028 here at @VivaTech. See for yourself how VeChain IS pioneering a global collaborative ecosystem built on public blockchain technology. #VivaTech #ViVaTech2018 #ViVaTechnology2018pic.twitter.com/iegZeGmIGu', '', '2018-05-24 17:19:03'),
(34, 'https://twitter.com/vechainofficial', 'D-1 #VeChainThor #LVMHtech #VivaTechnologypic.twitter.com/MZ12evXCuT', '', '2018-05-24 17:19:30'),
(35, 'https://twitter.com/vechainofficial', 'T- 1 day! Extremely excited @vechainofficial is one of 30 startups selected for the LVMH innovation award #GoVeChain #VeChainThor #LVMHTech #FutureofLuxury #Blockchain #VivaTechpic.twitter.com/Uz2wsNqyAK', '', '2018-05-24 17:19:45'),
(36, 'https://twitter.com/vechainofficial', 'We are very proud to announce another exciting token adoption. Welcome to the most private instant exchange @vechainofficial Start flypping your $crypto to $VEN instantly!Discover all the details on https://steemit.com/vechain/@flypme/start-flypping-vechain-is-here … @Vechain1 @VeChainThorpic.twitter.com/5X2L5gLieF', '', '2018-05-24 17:31:50');

-- --------------------------------------------------------

--
-- Структура таблицы `sells`
--

CREATE TABLE `sells` (
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
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `history_buy`
--
ALTER TABLE `history_buy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `history_sells`
--
ALTER TABLE `history_sells`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buy`
--
ALTER TABLE `buy`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `history_buy`
--
ALTER TABLE `history_buy`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT для таблицы `history_sells`
--
ALTER TABLE `history_sells`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `sells`
--
ALTER TABLE `sells`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
