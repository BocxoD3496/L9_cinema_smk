-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 22 2023 г., 22:12
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cinema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `catID` int NOT NULL,
  `catName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`catID`, `catName`) VALUES
(1, 'Экшен'),
(2, 'Триллер'),
(3, 'Семейный'),
(4, 'Комедия'),
(5, 'Приключения'),
(6, 'Супергерои'),
(7, 'Драма');

-- --------------------------------------------------------

--
-- Структура таблицы `connections`
--

CREATE TABLE `connections` (
  `conID` int NOT NULL,
  `conCatID` int DEFAULT NULL,
  `conMovieID` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `connections`
--

INSERT INTO `connections` (`conID`, `conCatID`, `conMovieID`) VALUES
(1, 1, 1),
(5, 3, 4),
(3, 1, 2),
(4, 2, 2),
(6, 3, 3),
(7, 4, 3),
(8, 6, 1),
(9, 5, 1),
(10, 5, 4),
(11, 7, 5),
(12, 6, 3),
(13, 7, 6),
(14, 3, 7),
(15, 1, 8),
(16, 5, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `movies`
--

CREATE TABLE `movies` (
  `movieID` int NOT NULL,
  `movieTitle` varchar(50) NOT NULL,
  `movieInfo` varchar(250) NOT NULL,
  `movieImg` varchar(300) DEFAULT NULL,
  `movieCost` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`movieID`, `movieTitle`, `movieInfo`, `movieImg`, `movieCost`) VALUES
(1, 'Мстители: Финал', 'Оставшиеся в живых члены команды Мстителей и их союзники должны разработать новый план, который поможет противостоять разрушительным действиям могущественного титана Таноса', 'https://cdn.vox-cdn.com/thumbor/iqbKqSTMnIh5kMdWAw0M0qIAORM=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15969338/surprise_marvel_releases_a_new_full_trailer_and_poster_for_avengers_endgame_social.jpg', '250'),
(2, 'Джон Уик 3', 'Суперкиллер Джон Уик после нарушения кодекса тайной гильдии ассасинов получает статус изгоя — экскомьюникадо. За его голову назначена цена в 14 миллионов долларов.', 'https://static.adweek.com/adweek.com-prod/wp-content/uploads/2019/05/john-wick-poster-qa-hed-page-2019.jpg', '240'),
(3, 'Шазам!', 'Благодаря древнему волшебнику 14-летний парень превращается во вполне себе взрослого супергероя Шазама. В душе он остается ребенком, поэтому ведёт себя соответствующе и оттягивается на полную катушку.', 'https://images.iptv.rt.ru/images/c70apajir4ssllu15rf0.jpg', '300'),
(4, 'Аладдин', 'Молодой воришка по имени Аладдин хочет стать принцем, чтобы жениться на принцессе Жасмин. Тем временем визирь Аграбы Джафар намеревается захватить власть над Аграбой.', 'https://images.kinorium.com/movie/poster/1604671/w1500_50268986.jpg', '120'),
(5, 'Рокетмен', 'История превращения застенчивого парня Реджинальда Дуайта, талантливого музыканта из маленького городка, в суперзвезду и культовую фигуру мировой поп-музыки Элтона Джона. ', 'https://i.etsystatic.com/15375993/r/il/8579cf/1878002290/il_fullxfull.1878002290_n33h.jpg', '270'),
(6, 'Толкин', 'Картина рассказывает о том, как молодой писатель, будучи изгоем во время обучения, находит дружбу, любовь и вдохновение. Фильм затронет участие Толкина в Первой мировой войне — он служил в британских войсках с 1916-го по 1920-й. ', 'https://static1.srcdn.com/wordpress/wp-content/uploads/2019/05/Tolkien-movie-poster.jpg', '280'),
(7, 'Тайная жизнь домашних животных 2', 'Хозяева Макса уезжают за город в гости на ранчо и берут его с собой. Тем временем, в городе у Снежка и Гиджет свои приключения.', 'http://www.desdehollywood.com/http://desdehollywood.com/wp-content/uploads/2019/04/THE-SECRET-LIFE-OF-PETS-2.jpg', '210'),
(8, 'Годзилла 2: Король монстров', 'История рассказывает о героических усилиях криптозоологического агентства «Монарх» по сдерживанию гигантских монстров. В этот раз против могучего Годзиллы выступают Родан и ультимативный кайдзю — трёхголовый монстр Кинг Гидора. ', 'https://assets1.ignimgs.com/2019/03/20/kingofmonsterssetvisit-blogroll-1553124612455_1280w.jpg', '230');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `postID` int NOT NULL,
  `postComment` varchar(2000) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `postTitle` varchar(50) DEFAULT NULL,
  `postImg` varchar(2000) DEFAULT 'sample.jpg',
  `userId` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`postID`, `postComment`, `postDate`, `postTitle`, `postImg`, `userId`) VALUES
(7, 'Таким образом, начало повседневной работы по формированию позиции обеспечивает широкому кругу специалистов участие в формировании всесторонне сбалансированных нововведений. Равным образом консультация с профессионалами из IT обеспечивает широкому кругу специалистов участие в формировании существующих финансовых и административных условий? Равным образом новая модель организационной деятельности играет важную роль в формировании соответствующих условий активизации. Соображения высшего порядка, а также курс на социально-ориентированный национальный проект влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствующей насущным потребностям. Соображения высшего порядка, а также повышение уровня гражданского сознания играет важную роль в формировании соответствующих условий активизации. С другой стороны дальнейшее развитие различных форм деятельности играет...', '2026-07-15 08:27:00', 'Купи два получи один', 'https://images.unsplash.com/photo-1510130315046-1e47cc196aa0?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80', 10),
(11, 'Соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности создаёт предпосылки качественно новых шагов для позиций, занимаемых участниками в отношении поставленных задач! С другой стороны выбранный нами инновационный путь в значительной степени обуславливает создание системы масштабного изменения ряда параметров? Таким образом, повышение уровня гражданского сознания представляет собой интересный эксперимент проверки ключевых компонентов планируемого обновления! Значимость этих проблем настолько очевидна, что начало повседневной работы по формированию позиции играет важную роль в формировании направлений прогрессивного развития. Практический опыт показывает, что постоянный количественный рост и сфера нашей активности создаёт предпосылки качественно новых шагов для соответствующих условий активизации! Значимость этих проблем...', '2026-07-07 00:00:00', 'День кино', 'https://experienceluxury.co/wp-content/uploads/2016/08/private-cinema.jpg', 10),
(16, 'Дорогие друзья, постоянное информационно-техническое обеспечение нашей деятельности обеспечивает актуальность позиций, занимаемых участниками в отношении поставленных задач! Повседневная практика показывает, что выбранный нами инновационный путь требует от нас анализа всесторонне сбалансированных нововведений. Повседневная практика показывает, что реализация намеченного плана развития влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствующей насущным потребностям. Практический опыт показывает, что консультация с профессионалами из IT способствует повышению актуальности системы масштабного изменения ряда параметров. Задача организации, в особенности же постоянное информационно-техническое обеспечение нашей деятельности играет важную роль в формировании системы обучения кадров, соответствующей насущным потребностям? Значимость этих проблем настолько очевидна, что сложившаяся структура организации обеспечивает...', '1900-01-10 00:00:00', 'Мстители! Твой билет!', 'https://empirecinema.com.mt/wp-content/uploads/2019/03/Avengers-Endgame-2019-Desktop-Movie-Wallpapers-HD-4-1.jpg', 10),
(13, 'Равным образом выбранный нами инновационный путь требует от нас системного анализа существующих финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции позволяет выполнить важнейшие задания по разработке ключевых компонентов планируемого обновления? С другой стороны повышение уровня гражданского сознания создаёт предпосылки качественно новых шагов для позиций, занимаемых участниками в отношении поставленных задач? Равным образом курс на социально-ориентированный национальный проект способствует подготовке и реализации модели развития? С другой стороны постоянный количественный рост и сфера нашей активности напрямую зависит от экономической целесообразности принимаемых решений. Практический...', '1900-01-11 00:00:00', 'Топ 10 голосуй', 'https://thisisyork.org/wp-content/uploads/2019/01/Top-10.jpg', 10),
(14, 'Таким образом, постоянное информационно-техническое обеспечение нашей деятельности в значительной степени обуславливает создание позиций, занимаемых участниками в отношении поставленных задач. Практический опыт показывает, что повышение уровня гражданского сознания влечет за собой процесс внедрения и модернизации экономической целесообразности принимаемых решений. Практический опыт показывает, что начало повседневной работы по формированию позиции позволяет выполнить важнейшие задания по разработке модели развития. Значимость этих проблем настолько очевидна, что курс на социально-ориентированный национальный проект играет важную роль в формировании всесторонне сбалансированных нововведений? Дорогие друзья, сложившаяся структура организации способствует подготовке и реализации дальнейших направлений развитая системы массового участия. Равным образом рамки и место обучения кадров требует определения и...', '1900-01-03 00:00:00', 'Лучшее', 'https://www.flatpanelshd.com/pictures/disney_investor-day_2019%207_large.jpg', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `seats`
--

CREATE TABLE `seats` (
  `seatID` int NOT NULL,
  `movieID` int NOT NULL,
  `row` int NOT NULL,
  `seatNumber` int NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `seats`
--

INSERT INTO `seats` (`seatID`, `movieID`, `row`, `seatNumber`, `status`) VALUES
(1, 4, 1, 1, 'sold'),
(2, 4, 1, 2, 'available'),
(3, 4, 1, 3, 'available'),
(4, 4, 1, 4, 'available'),
(5, 4, 1, 5, 'available'),
(6, 4, 1, 6, 'available'),
(7, 4, 1, 7, 'available'),
(8, 4, 1, 8, 'available'),
(9, 4, 1, 9, 'available'),
(10, 4, 1, 10, 'available'),
(11, 4, 2, 1, 'available'),
(12, 4, 2, 2, 'available'),
(13, 4, 2, 3, 'sold'),
(14, 4, 2, 4, 'sold'),
(15, 4, 2, 5, 'available'),
(16, 4, 2, 6, 'available'),
(17, 4, 2, 7, 'available'),
(18, 4, 2, 8, 'sold'),
(19, 4, 2, 9, 'available'),
(20, 4, 2, 10, 'available'),
(21, 4, 3, 1, 'available'),
(22, 4, 3, 2, 'available'),
(23, 4, 3, 3, 'available'),
(24, 4, 3, 4, 'available'),
(25, 4, 3, 5, 'available'),
(26, 4, 3, 6, 'available'),
(27, 4, 3, 7, 'available'),
(28, 4, 3, 8, 'available'),
(29, 4, 3, 9, 'available'),
(30, 4, 3, 10, 'available'),
(31, 4, 4, 1, 'available'),
(32, 4, 4, 2, 'available'),
(33, 4, 4, 3, 'available'),
(34, 4, 4, 4, 'available'),
(35, 4, 4, 5, 'available'),
(36, 4, 4, 6, 'available'),
(37, 4, 4, 7, 'available'),
(38, 4, 4, 8, 'available'),
(39, 4, 4, 9, 'available'),
(40, 4, 4, 10, 'available'),
(41, 4, 5, 1, 'available'),
(42, 4, 5, 2, 'available'),
(43, 4, 5, 3, 'available'),
(44, 4, 5, 4, 'available'),
(45, 4, 5, 5, 'available'),
(46, 4, 5, 6, 'available'),
(47, 4, 5, 7, 'available'),
(48, 4, 5, 8, 'available'),
(49, 4, 5, 9, 'available'),
(50, 4, 5, 10, 'available');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `userID` int NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `userGroup` int NOT NULL DEFAULT '0',
  `userDesc` varchar(400) DEFAULT 'Welcome to my profile!',
  `userImg` varchar(2000) DEFAULT 'user-placeholder.jpg'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`userID`, `userName`, `userPassword`, `userCreated`, `userGroup`, `userDesc`, `userImg`) VALUES
(1, 'administrator', '$2y$10$nD1VcbnvpDGtDRQkIJGZc.Arms.7QVhFMxFSNVAVoz.yiqjDlT3ES', '2019-05-09 15:01:24', 1, 'Admin', 'https://www.magazin-naturist.com/resources/lucrand-acasa-computer-81118.jpg'),
(10, 'user', '$2y$10$AIJOYwxSmUDV9rmVcIT0Eu3ZrDsLIqARojWAegFzf4fJ49rUoGyqm', '2023-12-22 19:24:08', 0, 'Это мой профиль!', 'user-placeholder.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`catID`),
  ADD UNIQUE KEY `catName` (`catName`);

--
-- Индексы таблицы `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`conID`),
  ADD KEY `conCatID` (`conCatID`),
  ADD KEY `conMovieID` (`conMovieID`);

--
-- Индексы таблицы `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieID`),
  ADD UNIQUE KEY `movieName` (`movieTitle`),
  ADD UNIQUE KEY `movieImg` (`movieImg`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `userId` (`userId`);

--
-- Индексы таблицы `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seatID`),
  ADD UNIQUE KEY `unique_seat` (`movieID`,`row`,`seatNumber`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `catID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `connections`
--
ALTER TABLE `connections`
  MODIFY `conID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `seats`
--
ALTER TABLE `seats`
  MODIFY `seatID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1601;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `userID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
