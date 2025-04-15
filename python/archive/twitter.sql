-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 27 2018 г., 19:31
-- Версия сервера: 5.6.34
-- Версия PHP: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `twitter_id` int(10) NOT NULL,
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

INSERT INTO `buy_currency` (`id`, `twitter_id`, `currency`, `percent`, `btc`, `quantity`, `quantity_binance`, `amount`, `amount_binance`, `amount_dollar_binance`, `date`, `status`, `code`, `msg`, `order_id`, `was_sell`) VALUES
(1, 1, 'LTC', 0.147122, 0.016337, 0.061, 1, 0.000996557, 0.016337, 151.072, '2018-04-27 16:26:51', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(2, 5, 'XLM', 0.045444, 0.00004402, 22.717, 23, 0.001, 0.00101246, 9.36242, '2018-04-27 16:26:55', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(3, 4, 'TRX', 0.235571, 0.0000085, 117.647, 118, 0.000999999, 0.001003, 9.27494, '2018-04-27 16:26:55', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(4, 7, 'XMR', 0.007123, 0.028079, 0.036, 1, 0.00101084, 0.028079, 259.652, '2018-04-27 16:26:55', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(5, 8, 'IOTA', 0.027647, 0.00021707, 4.607, 5, 0.00100004, 0.00108535, 10.0364, '2018-04-27 16:26:57', 'NEW', '', '', 6494, 1),
(6, 11, 'ETC', 0.086281, 0.00232, 0.431, 1, 0.00099992, 0.00232, 21.4535, '2018-04-27 16:27:01', 'NEW', '', '', 3393, 1),
(7, 17, 'EOS', 0.168276, 0.0018453, 0.542, 1, 0.00100015, 0.0018453, 17.0639, '2018-04-27 16:27:04', 'NEW', '', '', 9936, 1),
(8, 15, 'OMG', 0.201004, 0.001994, 0.502, 1, 0.00100099, 0.001994, 18.4389, '2018-04-27 16:27:01', 'NEW', '', '', 1684, 1),
(9, 20, 'ONT', 0.617273, 0.0005868, 1.704, 2, 0.000999907, 0.0011736, 10.8525, '2018-04-27 16:27:05', 'NEW', '', '', 4077, 1),
(10, 19, 'BTG', 0.073946, 0.00812, 0.123, 1, 0.00099876, 0.00812, 75.0873, '2018-04-27 16:27:06', 'NEW', '', '', 7256, 1),
(11, 28, 'LSK', 0.008031, 0.0012452, 0.803, 1, 0.000999896, 0.0012452, 11.5146, '2018-04-27 16:27:07', 'NEW', '', '', 9537, 1),
(12, 22, 'NANO', 0.379502, 0.0007935, 1.26, 2, 0.00099981, 0.001587, 14.6753, '2018-04-27 16:27:05', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(13, 24, 'STEEM', 2.99368, 0.000461, 2.169, 3, 0.000999909, 0.001383, 12.7889, '2018-04-27 16:27:08', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(14, 3, 'ETH', 0.064339, 0.073098, 0.014, 1, 0.00102337, 0.073098, 675.952, '2018-04-27 16:27:12', 'NEW', '', '', 7508, 1),
(15, 25, 'STRAT', 0.04393, 0.0006832, 1.464, 2, 0.0010002, 0.0013664, 12.6354, '2018-04-27 16:27:19', 'NEW', '', '', 1525, 1),
(16, 12, 'ADA', 0.061576, 0.00003249, 30.779, 31, 0.00100001, 0.00100719, 9.31369, '2018-04-27 16:27:20', 'error', '-1021', 'Timestamp for this request is outside of the recvWindow.', 0, 0),
(17, 14, 'BTS', 0.066778, 0.00002996, 33.378, 34, 0.001, 0.00101864, 9.41957, '2018-04-27 16:27:27', 'NEW', '', '', 9262, 1),
(18, 2, 'DASH', 0.068481, 0.052605, 0.019, 1, 0.000999495, 0.052605, 486.449, '2018-04-27 16:27:27', 'NEW', '', '', 6098, 1);

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
(1, 5, 'IOTA', 0.00021723, 0, '2018-04-27 16:27:25'),
(2, 6, 'ETC', 0.002316, 1, '2018-04-27 16:27:26'),
(3, 7, 'EOS', 0.0018489, 0, '2018-04-27 16:27:30'),
(4, 8, 'OMG', 0.001994, 0, '2018-04-27 16:27:29'),
(5, 11, 'LSK', 0.001242, 1, '2018-04-27 16:27:31'),
(6, 10, 'BTG', 0.008119, 0, '2018-04-27 16:27:31'),
(7, 9, 'ONT', 0.0005876, 0, '2018-04-27 16:27:33'),
(8, 14, 'ETH', 0.073061, 0, '2018-04-27 16:27:34'),
(9, 5, 'IOTA', 0.00021725, 0, '2018-04-27 16:27:40'),
(10, 7, 'EOS', 0.0018489, 0, '2018-04-27 16:27:42'),
(11, 10, 'BTG', 0.008119, 0, '2018-04-27 16:27:46'),
(12, 15, 'STRAT', 0.0006853, 0, '2018-04-27 16:27:42'),
(13, 14, 'ETH', 0.073077, 0, '2018-04-27 16:27:47'),
(14, 8, 'OMG', 0.001994, 0, '2018-04-27 16:27:46'),
(15, 9, 'ONT', 0.0005877, 0, '2018-04-27 16:27:48'),
(16, 17, 'BTS', 0.00002989, 1, '2018-04-27 16:27:50'),
(17, 18, 'DASH', 0.052608, 0, '2018-04-27 16:27:53'),
(18, 5, 'IOTA', 0.00021727, 0, '2018-04-27 16:27:54'),
(19, 7, 'EOS', 0.0018504, 0, '2018-04-27 16:27:55'),
(20, 10, 'BTG', 0.00812, 0, '2018-04-27 16:27:57'),
(21, 15, 'STRAT', 0.0006853, 0, '2018-04-27 16:27:58'),
(22, 14, 'ETH', 0.073074, 0, '2018-04-27 16:27:59'),
(23, 8, 'OMG', 0.001993, 0, '2018-04-27 16:27:59'),
(24, 9, 'ONT', 0.0005877, 0, '2018-04-27 16:28:00'),
(25, 18, 'DASH', 0.052608, 0, '2018-04-27 16:28:02'),
(26, 5, 'IOTA', 0.0002172, 0, '2018-04-27 16:28:03'),
(27, 7, 'EOS', 0.0018515, 0, '2018-04-27 16:28:04'),
(28, 10, 'BTG', 0.00812, 0, '2018-04-27 16:28:07'),
(29, 15, 'STRAT', 0.0006836, 0, '2018-04-27 16:28:10'),
(30, 8, 'OMG', 0.001994, 0, '2018-04-27 16:28:12'),
(31, 14, 'ETH', 0.073152, 0, '2018-04-27 16:28:11'),
(32, 18, 'DASH', 0.052608, 0, '2018-04-27 16:28:13'),
(33, 7, 'EOS', 0.0018502, 0, '2018-04-27 16:28:14'),
(34, 5, 'IOTA', 0.00021729, 0, '2018-04-27 16:28:13'),
(35, 9, 'ONT', 0.0005881, 0, '2018-04-27 16:28:13'),
(36, 10, 'BTG', 0.00812, 0, '2018-04-27 16:28:16'),
(37, 8, 'OMG', 0.001994, 0, '2018-04-27 16:28:21'),
(38, 15, 'STRAT', 0.0006836, 0, '2018-04-27 16:28:22'),
(39, 14, 'ETH', 0.073093, 0, '2018-04-27 16:28:24'),
(40, 5, 'IOTA', 0.00021729, 1, '2018-04-27 16:28:13'),
(41, 7, 'EOS', 0.0018492, 0, '2018-04-27 16:28:24'),
(42, 18, 'DASH', 0.052608, 0, '2018-04-27 16:28:24'),
(43, 8, 'OMG', 0.001994, 1, '2018-04-27 16:28:21'),
(44, 9, 'ONT', 0.000589, 0, '2018-04-27 16:28:25'),
(45, 10, 'BTG', 0.008125, 0, '2018-04-27 16:28:26'),
(46, 14, 'ETH', 0.073093, 1, '2018-04-27 16:28:24'),
(47, 7, 'EOS', 0.0018492, 1, '2018-04-27 16:28:24'),
(48, 15, 'STRAT', 0.0006836, 0, '2018-04-27 16:28:33'),
(49, 10, 'BTG', 0.008125, 1, '2018-04-27 16:28:26'),
(50, 9, 'ONT', 0.000589, 1, '2018-04-27 16:28:25'),
(51, 18, 'DASH', 0.052608, 0, '2018-04-27 16:28:36'),
(52, 15, 'STRAT', 0.0006836, 1, '2018-04-27 16:28:33'),
(53, 18, 'DASH', 0.052574, 0, '2018-04-27 16:28:47'),
(54, 18, 'DASH', 0.052574, 1, '2018-04-27 16:28:47');

-- --------------------------------------------------------

--
-- Структура таблицы `sell_currency`
--

CREATE TABLE `sell_currency` (
  `id` int(10) NOT NULL,
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

INSERT INTO `sell_currency` (`id`, `buy_id`, `currency`, `btc`, `price`, `quantity_btc`, `quantity_price`, `quantity_price_commission`, `quantity_binance`, `amount`, `amount_binance`, `amount_dollar_binance`, `profit`, `profit_commission`, `cause`, `status`, `code`, `msg`, `order_id`, `date`) VALUES
(1, 6, 'ETC', 0.00232, 0.002316, 0.43103, 0.43178, 0.43167, 1, 0.00100147, 0.00232, 21.4535, 0.000119104, -0.00223671, 'Валюта упала на 0.1 % ', 'NEW', '', '', 8304, '2018-04-27 16:27:26'),
(2, 11, 'LSK', 0.0012452, 0.001242, 0.80308, 0.80515, 0.80494, 1, 0.00100231, 0.0012452, 11.5146, 0.000010024, -0.00240183, 'Валюта упала на 0.1 % ', 'NEW', '', '', 7081, '2018-04-27 16:27:31'),
(3, 17, 'BTS', 0.00002996, 0.00002989, 33.3778, 33.456, 33.4473, 34, 0.00100208, 0.00101864, 9.41957, 0.000000485478, -0.00240418, 'Валюта упала на 0.1 % ', 'NEW', '', '', 9903, '2018-04-27 16:27:50'),
(4, 5, 'IOTA', 0.00021707, 0.00021729, 4.60681, 4.60214, 4.60095, 5, 0.000998728, 0.00108535, 10.0364, -0.0000115229, -0.00240262, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 7244, '2018-04-27 16:28:13'),
(5, 8, 'OMG', 0.001994, 0.001994, 0.5015, 0.5015, 0.50137, 1, 0.000999732, 0.001994, 18.4389, 0, -0.00239706, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 6520, '2018-04-27 16:28:21'),
(6, 14, 'ETH', 0.073098, 0.073093, 0.01368, 0.01368, 0.01368, 1, 0.000999981, 0.073098, 675.952, -0.000632508, -0.000632508, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 4793, '2018-04-27 16:28:24'),
(7, 7, 'EOS', 0.0018453, 0.0018492, 0.54192, 0.54077, 0.54063, 1, 0.000997625, 0.0018453, 17.0639, -0.000121064, -0.00251505, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 7225, '2018-04-27 16:28:24'),
(8, 10, 'BTG', 0.00812, 0.008125, 0.12315, 0.12308, 0.12304, 1, 0.000999085, 0.00812, 75.0873, 0.000434618, -0.00257072, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 2526, '2018-04-27 16:28:26'),
(9, 9, 'ONT', 0.0005868, 0.000589, 1.70416, 1.69779, 1.69735, 2, 0.000996005, 0.0011736, 10.8525, -0.0000256887, -0.00242219, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 9664, '2018-04-27 16:28:25'),
(10, 15, 'STRAT', 0.0006832, 0.0006836, 1.4637, 1.46284, 1.46246, 2, 0.000999153, 0.0013664, 12.6354, -0.0000223412, -0.00242447, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 6469, '2018-04-27 16:28:33'),
(11, 18, 'DASH', 0.052605, 0.052574, 0.01901, 0.01902, 0.01902, 1, 0.00100055, 0.052605, 486.449, -0.000587845, -0.000587845, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 389, '2018-04-27 16:28:47');

-- --------------------------------------------------------

--
-- Структура таблицы `twitter`
--

CREATE TABLE `twitter` (
  `id` int(10) NOT NULL,
  `url` varchar(200) NOT NULL,
  `theme` text NOT NULL,
  `url_news` varchar(500) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `twitter`
--

INSERT INTO `twitter` (`id`, `url`, `theme`, `url_news`, `date`) VALUES
(1, 'https://twitter.com/LitecoinProject', 'Litecoin Core v0.15.1 released! All users are advised to upgrade.https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc …', 'https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc', '2018-04-27 16:26:41'),
(2, 'https://twitter.com/Dashpay', 'Please VOTE !3 days to go until end of #Dash Budget Cycle#DigitalCash #Crypto https://www.dashcentral.org/budget pic.twitter.com/Kt40e4Yih9', '', '2018-04-27 16:26:43'),
(3, 'https://twitter.com/ethereum', 'Ethereum: the World Computerhttps://www.youtube.com/watch?v=j23HnORQXvs …', 'https://www.youtube.com/watch?v=j23HnORQXvs', '2018-04-27 16:26:43'),
(4, 'https://twitter.com/Tronfoundation', '$TRX #TRX The #TRON Programming Contest starts to recieve applications from 17 of April 2018! For more details please refer to the link below. Please take THIS as the final standard of Contest Timeline. @justinsuntron #TRONSRhttps://medium.com/@Tronfoundation/tron-programming-contest-252fc9fb8c94 …pic.twitter.com/8iSPfh0Iyt', '', '2018-04-27 16:26:43'),
(5, 'https://twitter.com/StellarOrg', 'Reminder: Only a few days left to register for our #Blockchain & #Fintech Meetup in Dubai: https://www.meetup.com/Stellar-Dubai-Blockchain-Cryptocurrency-Fintech-Meetup/events/249867119/ …The agenda is up and full of great speakers! Check it out.', '', '2018-04-27 16:26:44'),
(6, 'https://twitter.com/QtumOfficial', '#Qtum Community Updates for March/April 2018https://medium.com/@Qtum/qtum-community-development-updates-dd72f97e0f2c …#Bitcoin #Blockchain #Fintech #Cryptocurrency', '', '2018-04-27 16:26:44'),
(7, 'https://twitter.com/monerocurrency', 'A Scheduled Network Upgrade is Planned for April 6:https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html …', 'https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html', '2018-04-27 16:26:44'),
(8, 'https://twitter.com/iotatoken', 'Really cool IOTA community project: FogNethttps://fognet.world/ #IOTA #FogNet', 'https://fognet.world/', '2018-04-27 16:26:44'),
(9, 'https://twitter.com/Ripple', 'We’ve noticed an increase in fraudulent accounts claiming to be @Ripple or members of the Ripple Team offering giveaways. Be on alert - they are not official accounts.', '', '2018-04-27 16:26:44'),
(10, 'https://twitter.com/NEO_Blockchain', 'Our NEO blockchain explorer https://scan.nel.group/#mainnet  and light wallet https://wallet.nel.group/  go live. And our light wallet will integrate our NNS service on the testnet soon.pic.twitter.com/ebLF1xNevb', 'https://scan.nel.group/#mainnet', '2018-04-27 16:26:44'),
(11, 'https://twitter.com/eth_classic', 'Whats next for Classic- Revamped Reddithttps://www.reddit.com/r/EthereumClassic/ …- ETC Forum http://forum.ethereumclassic.org  - 2017 Dev Recap http://bit.ly/2017ETCRecap - January Projects Update  http://bit.ly/ETCProjectsUpdate …- 2018 Detailed Roadmap http://bit.ly/2018Roadmap  #ClassicIsComingpic.twitter.com/EAg8XddgGO', 'https://www.reddit.com/r/EthereumClassic/', '2018-04-27 16:26:44'),
(12, 'https://twitter.com/CardanoStiftung', 'We, or any of the Cardano affiliated organizations/personnel, will never ask you to send us Ada or any other asset. Please be vigilant and use common sense! For more information on staying safe online, please read our Help Centre article here:http://ow.ly/mOsN30j9A2x ', 'http://ow.ly/mOsN30j9A2x', '2018-04-27 16:26:44'),
(13, 'https://twitter.com/vechainofficial', 'The 101 VeChain Thrudheim (Authority) Masternodes Selection Process Begins - #GoVeChainhttps://medium.com/@vechainofficial/https-medium-com-vechainofficial-authority-masternodes-4c1233c6f18e …', '', '2018-04-27 16:26:45'),
(14, 'https://twitter.com/bitshares', 'https://www.youtube.com/watch?v=t2K9PWqXhyU …', 'https://www.youtube.com/watch?v=t2K9PWqXhyU', '2018-04-27 16:26:44'),
(15, 'https://twitter.com/omise_go', 'ElectrifyAsia is live now! Follow Juns live AMA session#electrifyasia #OmiseGO #OMG #liveAMAhttps://twitter.com/ElectrifyAsia/status/989808986168868864 …', '', '2018-04-27 16:26:45'),
(16, 'https://twitter.com/helloiconworld', '“Pantera has about 10 percent of its investments in Bitcoins... But the fund’s single largest bet is on Icon” $icx #blockchain #cryptocurrencyhttps://www.bloomberg.com/news/articles/2018-04-26/pantera-s-morehead-says-bitcoin-is-screaming-buy-bets-on-icon?srnd=cryptocurriences …', '', '2018-04-27 16:26:45'),
(17, 'https://twitter.com/EOS_io', 'EOSIO Dawn 3.0 Now Available #EOSIOhttps://medium.com/eosio/eosio-dawn-3-0-now-available-49a3b99242d7 …', '', '2018-04-27 16:26:45'),
(18, 'https://twitter.com/vergecurrency', '#VergeDay is upon us! Your favorite adult brands are now accepting @vergecurrency to pay for memberships +more and to celebrate we’re giving away over 300K $XVG! RT and follow @vergecurrency to WIN! #vergefampic.twitter.com/32Rl2WOHMg', '', '2018-04-27 16:26:45'),
(19, 'https://twitter.com/bitcoingold', 'Why do miners mine? And what is mining, really?For a simple answer, watch the full video  https://youtu.be/vEpKS2KRJMo #bitcoingold #bitcoin #blockchain #btg #btc #cryptocurrencynews #cryptocurrencypic.twitter.com/HXEOSiFMhf', 'https://youtu.be/vEpKS2KRJMo', '2018-04-27 16:26:46'),
(20, 'https://twitter.com/OntologyNetwork', 'Ontologys first projects are now live on GitHub (https://github.com/ontio/ )! Read our open letter to the tech community here: https://medium.com/@OntologyNetwork/the-first-open-letter-to-the-ontology-technology-community-a65fe024ae1f …. ONT Block Explorer is also live (https://explorer.ont.io/ ). If youre not on Discord, come join us: https://discord.gg/4TQujHj/ ! $ONTpic.twitter.com/rVecaaRIcT', 'https://github.com/ontio/', '2018-04-27 16:26:45'),
(21, 'https://twitter.com/zcashco', 'The NPR show, @Radiolab did a podcast featuring #Zcash and the MPC Ceremony. Listen to the story here:http://www.radiolab.org/story/ceremony/ ', '', '2018-04-27 16:26:46'),
(22, 'https://twitter.com/nanocurrency', 'The Nano Core Team is excited to share our roadmap and vision for the future of Nano:https://developers.nano.org/roadmap ', 'https://developers.nano.org/roadmap', '2018-04-27 16:26:46'),
(23, 'https://twitter.com/NEMofficial', 'CATAPULT ANNOUNCEMENT: NEM officially launches Catapult Beta. Apply to participate in the early access program! Read the official press release here: http://bit.ly/Catapult-Beta #NEM #Catapult #mijinpic.twitter.com/IjBuiOAMpr', 'http://bit.ly/Catapult-Beta', '2018-04-27 16:26:45'),
(24, 'https://twitter.com/steemit', 'Opportunities For Blockchain Based Social Appshttps://www.forbes.com/sites/ksamani/2018/04/09/opportunities-for-blockchain-based-social-apps/2/#7fa3b7a03b79 …', 'https://www.forbes.com/sites/ksamani/2018/04/09/opportunities-for-blockchain-based-social-apps/2/#7fa3b7a03b79', '2018-04-27 16:26:46'),
(25, 'https://twitter.com/stratisplatform', 'Stratis Roadmap Update: https://stratisplatform.com/2018/02/13/stratis-development-roadmap-update/ … #blockchain #roadmap #bitcoin #dotnet $STRATpic.twitter.com/WnWKnQttpr', 'https://stratisplatform.com/2018/02/13/stratis-development-roadmap-update/', '2018-04-27 16:26:46'),
(26, 'https://twitter.com/DigixGlobal', 'We spoke with Shaun Djie , Co-Founder & COO of Digix Global, at The Safe Vault in Singapore where Digix stores the gold for its DGX tokens. Shaun talks about the DigixDAO, DGX and the focus for the company in 2018. @DigixGlobalhttps://youtu.be/6rJ3H6BjyVw ', '', '2018-04-27 16:26:46'),
(27, 'https://twitter.com/BitPopulous', 'We are now operating in Beta-Live mode, invoice purchasing has commenced on platform, to purchase invoices setup a new account @ https://beta.populous.co  & complete KYC #populous_platformpic.twitter.com/XEmQCI9x3C', 'https://beta.populous.co', '2018-04-27 16:26:46'),
(28, 'https://twitter.com/LiskHQ', 'Create the #Future with #Lisk.  https://youtu.be/rTgAC-XTInI ', '', '2018-04-27 16:26:46');

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
-- Индексы таблицы `sell_currency`
--
ALTER TABLE `sell_currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `twitter`
--
ALTER TABLE `twitter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buy_currency`
--
ALTER TABLE `buy_currency`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT для таблицы `sell_currency`
--
ALTER TABLE `sell_currency`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `twitter`
--
ALTER TABLE `twitter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
