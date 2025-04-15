-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 20 2018 г., 20:31
-- Версия сервера: 5.6.34
-- Версия PHP: 7.1.0

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
  `currency` varchar(5) NOT NULL,
  `percent` float NOT NULL COMMENT 'процент на момент покупки',
  `btc` float NOT NULL,
  `quantity` float NOT NULL COMMENT 'колличество продаваемой валюты по отношению к BTC',
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

INSERT INTO `buy_currency` (`id`, `twitter_id`, `currency`, `percent`, `btc`, `quantity`, `date`, `status`, `code`, `msg`, `order_id`, `was_sell`) VALUES
(1, 8, 'ICX', 0.244792, 0.0004095, 2.442, '2018-04-19 15:49:11', 'NEW', '', '', 9079, 0),
(2, 3, 'BTG', 0.02847, 0.007027, 0.142308, '2018-04-19 15:49:13', 'NEW', '', '', 7127, 0),
(3, 25, 'ONT', 0.056485, 0.0005314, 1.88182, '2018-04-19 15:49:12', 'NEW', '', '', 9190, 0),
(4, 12, 'ETH', 0.129528, 0.066481, 0.0150419, '2018-04-19 15:49:13', 'NEW', '', '', 2515, 0),
(5, 28, 'TRX', 0.167224, 0.00000598, 167.224, '2018-04-19 15:49:13', 'NEW', '', '', 9031, 0),
(6, 26, 'OMG', 0.053163, 0.001882, 0.53135, '2018-04-19 15:49:15', 'NEW', '', '', 5141, 0),
(7, 23, 'EOS', 0.142234, 0.0011265, 0.887705, '2018-04-19 15:49:13', 'NEW', '', '', 2919, 0),
(8, 2, 'XRP', 0.135947, 0.00008838, 11.3148, '2018-04-19 15:49:13', 'NEW', '', '', 6622, 0),
(9, 20, 'XEM', 0.065076, 0.00004612, 21.6826, '2018-04-19 15:49:13', 'NEW', '', '', 6899, 0),
(10, 15, 'NANO', 0.071081, 0.0008447, 1.18385, '2018-04-19 15:49:15', 'NEW', '', '', 2804, 0),
(11, 9, 'LSK', 0.014245, 0.0014042, 0.712149, '2018-04-19 15:49:12', 'NEW', '', '', 5474, 0),
(12, 18, 'ETC', 0.045641, 0.002192, 0.456204, '2018-04-19 15:49:15', 'NEW', '', '', 5334, 0),
(13, 6, 'XMR', 0.161664, 0.0285, 0.0350877, '2018-04-19 15:49:16', 'NEW', '', '', 1628, 0),
(14, 22, 'ZEC', 0.106651, 0.030975, 0.0322841, '2018-04-19 15:49:15', 'NEW', '', '', 5226, 0),
(15, 13, 'NEO', 0.079176, 0.008848, 0.11302, '2018-04-19 15:49:16', 'NEW', '', '', 4421, 0),
(16, 19, 'DGD', 0.105032, 0.030499, 0.032788, '2018-04-19 15:49:16', 'NEW', '', '', 9217, 0),
(17, 10, 'IOTA', 0.00962, 0.0002079, 4.81, '2018-04-19 15:49:20', 'NEW', '', '', 8759, 0),
(18, 5, 'STRAT', 0.043314, 0.0006929, 1.44321, '2018-04-19 15:49:16', 'NEW', '', '', 3701, 0),
(19, 14, 'VEN', 0.324123, 0.00044261, 2.25933, '2018-04-19 15:49:17', 'NEW', '', '', 6228, 0),
(20, 4, 'LTC', 0.069719, 0.017224, 0.0580585, '2018-04-19 15:50:17', 'NEW', '', '', 4362, 0),
(21, 17, 'DASH', 0.372887, 0.051413, 0.0194503, '2018-04-19 15:50:19', 'NEW', '', '', 308, 0),
(22, 16, 'PPT', 0.592152, 0.0029898, 0.334471, '2018-04-19 15:50:19', 'NEW', '', '', 1761, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE `history` (
  `id` int(10) NOT NULL,
  `buy_id` int(10) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `btc` float NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

INSERT INTO `sell_currency` (`id`, `buy_id`, `currency`, `btc`, `price`, `quantity_btc`, `quantity_price`, `quantity_price_commission`, `quantity_binance`, `cause`, `status`, `code`, `msg`, `order_id`, `date`) VALUES
(1, 18, 'STRAT', 0.0006929, 0.0006861, 1.44285, 1.45751, 1.45715, 1.46, 'Валюта упала на 0.1 % ', 'NEW', '', '', 764, '2018-04-20 17:05:19'),
(2, 1, 'ICX', 0.0004095, 0.0003983, 2.44139, 2.51067, 2.51004, 2.51, 'Валюта упала на 0.1 % ', 'NEW', '', '', 6464, '2018-04-20 17:05:18'),
(3, 6, 'OMG', 0.001882, 0.001864, 0.53122, 0.53648, 0.53635, 0.54, 'Валюта упала на 0.1 % ', 'NEW', '', '', 7503, '2018-04-20 17:05:19'),
(4, 9, 'XEM', 0.00004612, 0.00004547, 21.6772, 21.9925, 21.987, 21.99, 'Валюта упала на 0.1 % ', 'NEW', '', '', 7449, '2018-04-20 17:05:18'),
(5, 3, 'ONT', 0.0005314, 0.0004931, 1.88135, 2.02799, 2.02748, 2.03, 'Валюта упала на 0.1 % ', 'NEW', '', '', 9169, '2018-04-20 17:05:19'),
(6, 10, 'NANO', 0.0008447, 0.0008393, 1.18356, 1.19147, 1.19117, 1.19, 'Валюта упала на 0.1 % ', 'NEW', '', '', 7776, '2018-04-20 17:05:20'),
(7, 2, 'BTG', 0.007027, 0.007697, 0.14227, 0.12992, 0.12989, 0.13, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 3440, '2018-04-20 17:06:17'),
(8, 12, 'ETC', 0.002192, 0.002229, 0.45609, 0.44863, 0.44852, 0.45, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 6190, '2018-04-20 17:06:17'),
(9, 15, 'NEO', 0.008848, 0.008898, 0.11299, 0.11238, 0.11236, 0.11, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 7924, '2018-04-20 17:06:17'),
(10, 20, 'LTC', 0.017224, 0.017586, 0.05804, 0.05686, 0.05685, 0.06, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 2055, '2018-04-20 17:06:17'),
(11, 16, 'DGD', 0.030499, 0.030551, 0.03278, 0.03273, 0.03272, 0.03, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 4994, '2018-04-20 17:06:17'),
(12, 19, 'VEN', 0.00044261, 0.00044503, 2.25876, 2.24704, 2.24648, 2.25, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 4921, '2018-04-20 17:06:17'),
(13, 11, 'LSK', 0.0014042, 0.0014094, 0.71197, 0.70952, 0.70934, 0.71, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 8285, '2018-04-20 17:06:17'),
(14, 21, 'DASH', 0.051413, 0.051716, 0.01945, 0.01934, 0.01933, 0.02, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 102, '2018-04-20 17:06:18'),
(15, 8, 'XRP', 0.00008838, 0.0001009, 11.3119, 9.9108, 9.90833, 9.91, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 3341, '2018-04-20 17:06:18'),
(16, 17, 'IOTA', 0.0002079, 0.00022969, 4.8088, 4.35369, 4.35261, 4.35, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 6859, '2018-04-20 17:06:18'),
(17, 5, 'TRX', 0.00000598, 0.00000607, 167.182, 164.745, 164.703, 164.7, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 2235, '2018-04-20 17:06:18'),
(18, 4, 'ETH', 0.066481, 0.069201, 0.01504, 0.01445, 0.01445, 0.01, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 3296, '2018-04-20 17:06:18'),
(19, 13, 'XMR', 0.0285, 0.029438, 0.03508, 0.03397, 0.03396, 0.03, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 829, '2018-04-20 17:06:18'),
(20, 22, 'PPT', 0.0029898, 0.0031419, 0.33439, 0.31828, 0.3182, 0.32, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 8236, '2018-04-20 17:06:18'),
(21, 7, 'EOS', 0.0011265, 0.001303, 0.88748, 0.76746, 0.76727, 0.77, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 735, '2018-04-20 17:06:18'),
(22, 14, 'ZEC', 0.030975, 0.031787, 0.03228, 0.03146, 0.03145, 0.03, 'Валюта продана по истечению 60 сек.', 'NEW', '', '', 3750, '2018-04-20 17:06:18');

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
(1, 'https://twitter.com/QtumOfficial', 'Singapore, April 19th:Come meet with #Qtum, @PundiXLabs and @EnergoOfficial Click the #Meetup link below to register!https://www.meetup.com/QTUM-x-Pundi-X-Singapore-Meetup/events/249594043/ …#Bitcoin #Blockchain #Singapore #Fintech #Cryptocurrency #ETHEREUMpic.twitter.com/P6ZucJgBUo', '', '2018-04-19 15:48:53'),
(2, 'https://twitter.com/Ripple', 'We’ve noticed an increase in fraudulent accounts claiming to be @Ripple or members of the Ripple Team offering giveaways. Be on alert - they are not official accounts.', '', '2018-04-19 15:48:52'),
(3, 'https://twitter.com/bitcoingold', 'Pool Operators: Add your pool to the official explorer!  https://forum.bitcoingold.org/t/pool-operators-add-your-pool-to-the-official-explorer/1139 …#BTG #mining #btc #bitcoingold #bitcoin #blockchain #1cpu1votepic.twitter.com/WQW1haNkIm', 'https://forum.bitcoingold.org/t/pool-operators-add-your-pool-to-the-official-explorer/1139', '2018-04-19 15:48:52'),
(4, 'https://twitter.com/LitecoinProject', 'Litecoin Core v0.15.1 released! All users are advised to upgrade.https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc …', 'https://blog.litecoin.org/litecoin-core-v0-15-1-release-d2a400cb78bc', '2018-04-19 15:48:52'),
(5, 'https://twitter.com/stratisplatform', 'Stratis Roadmap Update: https://stratisplatform.com/2018/02/13/stratis-development-roadmap-update/ … #blockchain #roadmap #bitcoin #dotnet $STRATpic.twitter.com/WnWKnQttpr', 'https://stratisplatform.com/2018/02/13/stratis-development-roadmap-update/', '2018-04-19 15:48:52'),
(6, 'https://twitter.com/monerocurrency', 'A Scheduled Network Upgrade is Planned for April 6:https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html …', 'https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html', '2018-04-19 15:48:52'),
(7, 'https://twitter.com/CardanoStiftung', 'We, or any of the Cardano affiliated organizations/personnel, will never ask you to send us Ada or any other asset. Please be vigilant and use common sense! For more information on staying safe online, please read our Help Centre article here:http://ow.ly/mOsN30j9A2x ', 'http://ow.ly/mOsN30j9A2x', '2018-04-19 15:48:52'),
(8, 'https://twitter.com/helloiconworld', 'ICON and AD4th co-founded “Deblock” (http://www.deblock.co.kr ), a blockchain accelerator to discover, invest and support blockchain projects.http://www.getnews.co.kr/news/articleView.html?idxno=63676 …', 'http://www.deblock.co.kr', '2018-04-19 15:48:52'),
(9, 'https://twitter.com/LiskHQ', 'Create the #Future with #Lisk.  https://youtu.be/rTgAC-XTInI ', '', '2018-04-19 15:48:52'),
(10, 'https://twitter.com/iotatoken', '#tsmmsFRAGT Was macht #IOTA so interessant für #IOT? Welche Vorteile bietet es ggü bekannten #Blockchain Technologien? Mehr dazu morgen 10 Uhr im Live #Webinar. #Industrie40 https://bit.ly/2EWvYG4 pic.twitter.com/oysZhK1qKD', '', '2018-04-19 15:48:52'),
(11, 'https://twitter.com/steemit', 'Opportunities For Blockchain Based Social Appshttps://www.forbes.com/sites/ksamani/2018/04/09/opportunities-for-blockchain-based-social-apps/2/#7fa3b7a03b79 …', 'https://www.forbes.com/sites/ksamani/2018/04/09/opportunities-for-blockchain-based-social-apps/2/#7fa3b7a03b79', '2018-04-19 15:48:53'),
(12, 'https://twitter.com/ethereum', 'Ethereum: the World Computerhttps://www.youtube.com/watch?v=j23HnORQXvs …', 'https://www.youtube.com/watch?v=j23HnORQXvs', '2018-04-19 15:48:53'),
(13, 'https://twitter.com/NEO_Blockchain', 'Also there is a meetup the day after: https://www.meetup.com/cryptoparency/events/249761774/ …https://twitter.com/NEO_Blockchain/status/986138825423511552 …', 'https://www.meetup.com/cryptoparency/events/249761774/', '2018-04-19 15:48:52'),
(14, 'https://twitter.com/vechainofficial', 'The 101 VeChain Thrudheim (Authority) Masternodes Selection Process Begins - #GoVeChainhttps://medium.com/@vechainofficial/https-medium-com-vechainofficial-authority-masternodes-4c1233c6f18e …', '', '2018-04-19 15:48:52'),
(15, 'https://twitter.com/nanocurrency', 'The Nano Core Team is excited to share our roadmap and vision for the future of Nano:https://developers.nano.org/roadmap ', 'https://developers.nano.org/roadmap', '2018-04-19 15:48:52'),
(16, 'https://twitter.com/BitPopulous', 'https://medium.com/@BitPopulous/populous-beta-set-to-go-live-may-1st-2018-b5161c925268 …', 'https://medium.com/@BitPopulous/populous-beta-set-to-go-live-may-1st-2018-b5161c925268', '2018-04-19 15:48:52'),
(17, 'https://twitter.com/Dashpay', '#NeptuneDash Extends Fractional #Masternode Ownership to US and EU Market#Dash #DigitalCash #Cryptohttps://www.dashforcenews.com/neptune-dash-extends-fractional-masternode-ownership-to-us-and-eu-market/ …', '', '2018-04-19 15:48:53'),
(18, 'https://twitter.com/eth_classic', 'Whats next for Classic- Revamped Reddithttps://www.reddit.com/r/EthereumClassic/ …- ETC Forum http://forum.ethereumclassic.org  - 2017 Dev Recap http://bit.ly/2017ETCRecap - January Projects Update  http://bit.ly/ETCProjectsUpdate …- 2018 Detailed Roadmap http://bit.ly/2018Roadmap  #ClassicIsComingpic.twitter.com/EAg8XddgGO', 'https://www.reddit.com/r/EthereumClassic/', '2018-04-19 15:48:53'),
(19, 'https://twitter.com/DigixGlobal', 'Our co-founder @bobbyong moderating a session at SUSS on the topic of Zero knowledge and Scaling with @zcoinofficial @DigixGlobal @sendyojee #pathbreakerpic.twitter.com/KWierS76FW', '', '2018-04-19 15:48:53'),
(20, 'https://twitter.com/NEMofficial', 'CATAPULT ANNOUNCEMENT: NEM officially launches Catapult Beta. Apply to participate in the early access program! Read the official press release here: http://bit.ly/Catapult-Beta #NEM #Catapult #mijinpic.twitter.com/IjBuiOAMpr', 'http://bit.ly/Catapult-Beta', '2018-04-19 15:48:53'),
(21, 'https://twitter.com/bitshares', 'https://www.youtube.com/watch?v=t2K9PWqXhyU …', 'https://www.youtube.com/watch?v=t2K9PWqXhyU', '2018-04-19 15:48:53'),
(22, 'https://twitter.com/zcashco', 'The NPR show, @Radiolab did a podcast featuring #Zcash and the MPC Ceremony. Listen to the story here:http://www.radiolab.org/story/ceremony/ ', '', '2018-04-19 15:48:53'),
(23, 'https://twitter.com/EOS_io', 'EOSIO Dawn 3.0 Now Available #EOSIOhttps://medium.com/eosio/eosio-dawn-3-0-now-available-49a3b99242d7 …', '', '2018-04-19 15:48:53'),
(24, 'https://twitter.com/vergecurrency', '#VergeDay is upon us! Your favorite adult brands are now accepting @vergecurrency to pay for memberships +more and to celebrate we’re giving away over 300K $XVG! RT and follow @vergecurrency to WIN! #vergefampic.twitter.com/32Rl2WOHMg', '', '2018-04-19 15:48:53'),
(25, 'https://twitter.com/OntologyNetwork', 'Ontologys first projects are now live on GitHub (https://github.com/ontio/ )! Read our open letter to the tech community here: https://medium.com/@OntologyNetwork/the-first-open-letter-to-the-ontology-technology-community-a65fe024ae1f …. ONT Block Explorer is also live (https://explorer.ont.io/ ). If youre not on Discord, come join us: https://discord.gg/4TQujHj/ ! $ONTpic.twitter.com/rVecaaRIcT', 'https://github.com/ontio/', '2018-04-19 15:48:53'),
(26, 'https://twitter.com/omise_go', 'Keep up the great work @ethstatus!https://twitter.com/ethstatus/status/986641480646320131 …', '', '2018-04-19 15:48:53'),
(27, 'https://twitter.com/StellarOrg', 'If youre in #Dubai and into #blockchain, @StellarOrg is hosting \"An Evening of Blockchain and #Fintech\" on May 1st! (with @nestorious828 and lots of great guests!)More details here:https://www.meetup.com/Stellar-Dubai-Blockchain-Cryptocurrency-Fintech-Meetup/events/249867119/ … #Meetup', '', '2018-04-19 15:48:52'),
(28, 'https://twitter.com/Tronfoundation', '$TRX #TRX The #TRON Programming Contest starts to recieve applications from 17 of April 2018! For more details please refer to the link below. Please take THIS as the final standard of Contest Timeline. @justinsuntron #TRONSRhttps://medium.com/@Tronfoundation/tron-programming-contest-252fc9fb8c94 …pic.twitter.com/8iSPfh0Iyt', '', '2018-04-19 15:48:53');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sell_currency`
--
ALTER TABLE `sell_currency`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `twitter`
--
ALTER TABLE `twitter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
