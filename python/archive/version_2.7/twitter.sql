-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 04 2018 г., 18:17
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
-- Структура таблицы `twitter`
--

CREATE TABLE `twitter` (
  `id` int(10) NOT NULL,
  `url` varchar(200) NOT NULL,
  `theme` text NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `twitter`
--

INSERT INTO `twitter` (`id`, `url`, `theme`, `added_date`) VALUES
(57, 'https://twitter.com/rianru', '<a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/%D0%9F%D0%A0%D0%AF%D0%9C%D0%90%D0%AF%D0%A2%D0%A0%D0%90%D0%9D%D0%A1%D0%9B%D0%AF%D0%A6%D0%98%D0%AF?src=hash\"><s>#</s><b>ПРЯМАЯТРАНСЛЯЦИЯ</b></a> Еженедельный брифинг Марии Захаровой<a class=\"twitter-timeline-link u-hidden\" data-expanded-url=\"https://www.pscp.tv/w/bZS4TDFyYVFaREJaTWdQanp8MW1ueGVYVmFid1FKWA1NMr3-J-fnOSjib_HSjLRmIWvrzq8i2aqDIfQNttFS\" dir=\"ltr\" href=\"https://t.co/TEIeA6LXj8\" rel=\"nofollow noopener\" target=\"_blank\" title=\"https://www.pscp.tv/w/bZS4TDFyYVFaREJaTWdQanp8MW1ueGVYVmFid1FKWA1NMr3-J-fnOSjib_HSjLRmIWvrzq8i2aqDIfQNttFS\"><span class=\"tco-ellipsis\"></span><span class=\"invisible\">https://www.</span><span class=\"js-display-url\">pscp.tv/w/bZS4TDFyYVFa</span><span class=\"invisible\">REJaTWdQanp8MW1ueGVYVmFid1FKWA1NMr3-J-fnOSjib_HSjLRmIWvrzq8i2aqDIfQNttFS</span><span class=\"tco-ellipsis\"><span class=\"invisible\"> </span>…</span></a>', '2018-04-04 17:38:08'),
(58, 'https://twitter.com/Ripple', 'We’ve noticed an increase in fraudulent accounts claiming to be <a class=\"twitter-atreply pretty-link js-nav\" data-mentioned-user-id=\"1051053836\" dir=\"ltr\" href=\"/Ripple\"><s>@</s><b>Ripple</b></a> or members of the Ripple Team offering giveaways. Be on alert - they are not official accounts.', '2018-04-04 17:38:13'),
(59, 'https://twitter.com/NEMofficial', 'CATAPULT ANNOUNCEMENT: NEM officially launches Catapult Beta. Apply to participate in the early access program! Read the official press release here: <a class=\"twitter-timeline-link\" data-expanded-url=\"http://bit.ly/Catapult-Beta\" dir=\"ltr\" href=\"https://t.co/JT1VvoiVDL\" rel=\"nofollow noopener\" target=\"_blank\" title=\"http://bit.ly/Catapult-Beta\"><span class=\"tco-ellipsis\"></span><span class=\"invisible\">http://</span><span class=\"js-display-url\">bit.ly/Catapult-Beta</span><span class=\"invisible\"></span><span class=\"tco-ellipsis\"><span class=\"invisible\"> </span></span></a><a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/NEM?src=hash\"><s>#</s><b>NEM</b></a> <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Catapult?src=hash\"><s>#</s><b>Catapult</b></a> <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/mijin?src=hash\"><s>#</s><b>mijin</b></a><a class=\"twitter-timeline-link u-hidden\" data-pre-embedded=\"true\" dir=\"ltr\" href=\"https://t.co/IjBuiOAMpr\">pic.twitter.com/IjBuiOAMpr</a>', '2018-04-04 17:38:17'),
(60, 'https://twitter.com/omise_go', 'Moderator-less panel, most fun one of the week. <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Ethereum?src=hash\"><s>#</s><b>Ethereum</b></a> consensus designers talk about how their personal life experiences influence their mechanism design visions.(And 4 out of 5 happen to be incredibly valuable <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/OMG?src=hash\"><s>#</s><b>OMG</b></a> advisors - yes even the indomitable <a class=\"twitter-atreply pretty-link js-nav\" data-mentioned-user-id=\"139487079\" dir=\"ltr\" href=\"/VladZamfir\"><s>@</s><b>VladZamfir</b></a>)<a class=\"twitter-timeline-link u-hidden\" data-pre-embedded=\"true\" dir=\"ltr\" href=\"https://t.co/OIEP3p0kJ6\">pic.twitter.com/OIEP3p0kJ6</a>', '2018-04-04 17:38:21'),
(61, 'https://twitter.com/monerocurrency', 'A Scheduled Network Upgrade is Planned for April 6:<a class=\"twitter-timeline-link u-hidden\" data-expanded-url=\"https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html\" dir=\"ltr\" href=\"https://t.co/1JQwQlA5di\" rel=\"nofollow noopener\" target=\"_blank\" title=\"https://getmonero.org/2018/03/28/a-scheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html\"><span class=\"tco-ellipsis\"></span><span class=\"invisible\">https://</span><span class=\"js-display-url\">getmonero.org/2018/03/28/a-s</span><span class=\"invisible\">cheduled-protocol-upgrade-is-planned-for-April-6-2018-03-28.html</span><span class=\"tco-ellipsis\"><span class=\"invisible\"> </span>…</span></a>', '2018-04-04 17:38:26'),
(62, 'https://twitter.com/QtumOfficial', 'Did you know you can follow the <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Qtum?src=hash\"><s>#</s><b>Qtum</b></a> development teams progress on <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Github?src=hash\"><s>#</s><b>Github</b></a>? Check out our commits:<a class=\"twitter-timeline-link\" data-expanded-url=\"https://github.com/qtumproject/qtum/commits/master?before=5a80ca6ee9381a98a55efed429da1e64cf3e9af8+35\" dir=\"ltr\" href=\"https://t.co/Wv504RBcm5\" rel=\"nofollow noopener\" target=\"_blank\" title=\"https://github.com/qtumproject/qtum/commits/master?before=5a80ca6ee9381a98a55efed429da1e64cf3e9af8+35\"><span class=\"tco-ellipsis\"></span><span class=\"invisible\">https://</span><span class=\"js-display-url\">github.com/qtumproject/qt</span><span class=\"invisible\">um/commits/master?before=5a80ca6ee9381a98a55efed429da1e64cf3e9af8+35</span><span class=\"tco-ellipsis\"><span class=\"invisible\"> </span>…</span></a><a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Bitcoin?src=hash\"><s>#</s><b>Bitcoin</b></a> <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Blockchain?src=hash\"><s>#</s><b>Blockchain</b></a> <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Fintech?src=hash\"><s>#</s><b>Fintech</b></a> <a class=\"twitter-hashtag pretty-link js-nav\" data-query-source=\"hashtag_click\" dir=\"ltr\" href=\"/hashtag/Cryptocurrency?src=hash\"><s>#</s><b>Cryptocurrency</b></a><a class=\"twitter-timeline-link u-hidden\" data-pre-embedded=\"true\" dir=\"ltr\" href=\"https://t.co/4WNwKQ1A76\">pic.twitter.com/4WNwKQ1A76</a>', '2018-04-04 17:38:30'),
(63, 'https://twitter.com/rianru', 'Британский МИД объяснил, почему удалил твит с обвинениями в адрес России <a class=\"twitter-timeline-link\" data-expanded-url=\"https://ria.ru/world/20180404/1517930850.html\" dir=\"ltr\" href=\"https://t.co/p7KU8AqCCe\" rel=\"nofollow noopener\" target=\"_blank\" title=\"https://ria.ru/world/20180404/1517930850.html\"><span class=\"tco-ellipsis\"></span><span class=\"invisible\">https://</span><span class=\"js-display-url\">ria.ru/world/20180404</span><span class=\"invisible\">/1517930850.html</span><span class=\"tco-ellipsis\"><span class=\"invisible\"> </span>…</span></a><a class=\"twitter-timeline-link u-hidden\" data-pre-embedded=\"true\" dir=\"ltr\" href=\"https://t.co/n2pSfwPOWx\">pic.twitter.com/n2pSfwPOWx</a>', '2018-04-04 18:01:29'),
(64, 'https://twitter.com/rianru', 'Решение о высылке российских дипломатов из Италии принято правительством, которое уходит в отставку. У победивших на парламентских выборах правоцентристов это вызвало возмущение: еще не сформированному новому кабинету министров уже создали проблемы<a class=\"twitter-timeline-link\" data-expanded-url=\"https://ria.ru/world/20180404/1517861251.html\" dir=\"ltr\" href=\"https://t.co/phXCPTAI2s\" rel=\"nofollow noopener\" target=\"_blank\" title=\"https://ria.ru/world/20180404/1517861251.html\"><span class=\"tco-ellipsis\"></span><span class=\"invisible\">https://</span><span class=\"js-display-url\">ria.ru/world/20180404</span><span class=\"invisible\">/1517861251.html</span><span class=\"tco-ellipsis\"><span class=\"invisible\"> </span>…</span></a><a class=\"twitter-timeline-link u-hidden\" data-pre-embedded=\"true\" dir=\"ltr\" href=\"https://t.co/nzEh0bX1E8\">pic.twitter.com/nzEh0bX1E8</a>', '2018-04-04 18:14:05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `twitter`
--
ALTER TABLE `twitter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `twitter`
--
ALTER TABLE `twitter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
