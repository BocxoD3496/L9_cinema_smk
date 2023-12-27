-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Дек 26 2023 г., 19:48
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
(1, 'Action'),
(2, 'Thriller'),
(4, 'Comedy'),
(5, 'Adventure'),
(6, 'Superhero'),
(7, 'Drama');

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
(1, 2, 1),
(5, 1, 4),
(3, 1, 2),
(4, 5, 2),
(6, 1, 3),
(7, 2, 3),
(8, 7, 1),
(9, 4, 2),
(10, 7, 4),
(12, 6, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`movieID`, `movieTitle`, `movieInfo`, `movieImg`, `movieCost`) VALUES
(1, 'Oppenheimer', 'История жизни американского физика Роберта Оппенгеймера, который стоял во главе первых разработок ядерного оружия.', 'https://4kwallpapers.com/images/walls/thumbs_2t/11403.jpg', '650'),
(2, 'Guardians of the Galaxy vol. 3', 'Питер Квилл никак не может смириться с потерей Гаморы и теперь вместе со Стражами Галактики вынужден отправиться на очередную миссию по защите Вселенной', 'https://cdn.marvel.com/content/1x/sdcc_gotgv3.jpg', '380'),
(3, 'John Wick Chapter 4', 'Джон Уик находит способ одержать победу над Правлением Кланов. Однако, прежде чем он сможет заслужить свою свободу, ему предстоит сразиться с новым врагом и его могущественными союзниками.', 'https://www.fonstola.ru/images/202010/fonstola.ru_411065.jpg', '590'),
(4, 'The Gentlemen', 'Талантливый выпускник Оксфорда, применив свой уникальный ум и невиданную дерзость, придумал нелегальную схему обогащения, используя поместья обедневшей английской аристократии.', 'https://posterspy.com/wp-content/uploads/2019/12/The-Gentlemen-LA_Template_PosterSpy.jpg', '600');

-- --------------------------------------------------------

--
-- Структура таблицы `movie_ratings`
--

CREATE TABLE `movie_ratings` (
  `ratingID` int NOT NULL,
  `movieID` int NOT NULL,
  `userID` int NOT NULL,
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `movie_ratings`
--

INSERT INTO `movie_ratings` (`ratingID`, `movieID`, `userID`, `rating`) VALUES
(2, 1, 2, 5),
(4, 2, 1, 3),
(5, 2, 2, 3),
(7, 3, 1, 4),
(8, 3, 2, 4),
(10, 4, 1, 5),
(11, 4, 2, 5);

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
(1, 'Наш прекрасный кинотеатр начал своё замечательное путешествие вместе с вами, надеемся на ваше наиприятнейшее времяпрепровождение, а наша команда SMK поможет вам в этом и подарит отличное настроение и отменный опыт', '2023-12-08 08:27:00', 'Великое начало', '', 1),
(3, 'Недавно вышел интереснейший автобиографический фильм Oppenheimer, команда SMK настоятельно рекомендует данный фильм к просмотру, также была окончена в честь 100 человек, так как началась новая, в честь 500 человек', '2023-12-08 00:00:00', 'Oppenheimer', '', 1),
(2, 'Сегодня, впервые, у нас в кинотеатре собралось более 100 человек одновременно, в честь этого мы дарим вам один бесплатный средний попкорн при покупке фильма в течение следующей недели ', '2023-12-07 19:31:00', 'Первая сотня клиентов', '', 2);

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
(2, 4, 1, 2, 'sold'),
(3, 4, 1, 3, 'sold'),
(4, 4, 1, 4, 'sold'),
(5, 4, 1, 5, 'sold'),
(6, 4, 1, 6, 'sold'),
(7, 4, 1, 7, 'sold'),
(8, 4, 1, 8, 'sold'),
(9, 4, 1, 9, 'sold'),
(10, 4, 1, 10, 'available'),
(11, 4, 2, 1, 'available'),
(12, 4, 2, 2, 'available'),
(13, 4, 2, 3, 'sold'),
(14, 4, 2, 4, 'sold'),
(15, 4, 2, 5, 'sold'),
(16, 4, 2, 6, 'available'),
(17, 4, 2, 7, 'available'),
(18, 4, 2, 8, 'sold'),
(19, 4, 2, 9, 'available'),
(20, 4, 2, 10, 'sold'),
(21, 4, 3, 1, 'available'),
(22, 4, 3, 2, 'sold'),
(23, 4, 3, 3, 'sold'),
(24, 4, 3, 4, 'available'),
(25, 4, 3, 5, 'sold'),
(26, 4, 3, 6, 'available'),
(27, 4, 3, 7, 'available'),
(28, 4, 3, 8, 'available'),
(29, 4, 3, 9, 'available'),
(30, 4, 3, 10, 'available'),
(31, 4, 4, 1, 'available'),
(32, 4, 4, 2, 'sold'),
(33, 4, 4, 3, 'available'),
(34, 4, 4, 4, 'available'),
(35, 4, 4, 5, 'sold'),
(36, 4, 4, 6, 'available'),
(37, 4, 4, 7, 'available'),
(38, 4, 4, 8, 'sold'),
(39, 4, 4, 9, 'available'),
(40, 4, 4, 10, 'available'),
(41, 4, 5, 1, 'available'),
(42, 4, 5, 2, 'sold'),
(43, 4, 5, 3, 'available'),
(44, 4, 5, 4, 'available'),
(45, 4, 5, 5, 'available'),
(46, 4, 5, 6, 'sold'),
(47, 4, 5, 7, 'available'),
(48, 4, 5, 8, 'sold'),
(49, 4, 5, 9, 'sold'),
(50, 4, 5, 10, 'sold'),
(51, 4, 6, 1, 'available'),
(52, 4, 6, 2, 'available'),
(53, 4, 6, 3, 'available'),
(54, 4, 6, 4, 'available'),
(55, 4, 6, 5, 'available'),
(56, 4, 6, 6, 'available'),
(57, 4, 6, 7, 'available'),
(58, 4, 6, 8, 'available'),
(59, 4, 6, 9, 'available'),
(60, 4, 6, 10, 'available'),
(61, 4, 7, 1, 'available'),
(62, 4, 7, 2, 'available'),
(63, 4, 7, 3, 'available'),
(64, 4, 7, 4, 'available'),
(65, 4, 7, 5, 'available'),
(66, 4, 7, 6, 'available'),
(67, 4, 7, 7, 'available'),
(68, 4, 7, 8, 'available'),
(69, 4, 7, 9, 'available'),
(70, 4, 7, 10, 'available'),
(71, 4, 8, 1, 'available'),
(72, 4, 8, 2, 'available'),
(73, 4, 8, 3, 'available'),
(74, 4, 8, 4, 'available'),
(75, 4, 8, 5, 'available'),
(76, 4, 8, 6, 'available'),
(77, 4, 8, 7, 'available'),
(78, 4, 8, 8, 'available'),
(79, 4, 8, 9, 'available'),
(80, 4, 8, 10, 'available'),
(81, 4, 9, 1, 'available'),
(82, 4, 9, 2, 'available'),
(83, 4, 9, 3, 'available'),
(84, 4, 9, 4, 'available'),
(85, 4, 9, 5, 'available'),
(86, 4, 9, 6, 'available'),
(87, 4, 9, 7, 'available'),
(88, 4, 9, 8, 'available'),
(89, 4, 9, 9, 'available'),
(90, 4, 9, 10, 'available'),
(91, 4, 10, 1, 'available'),
(92, 4, 10, 2, 'available'),
(93, 4, 10, 3, 'available'),
(94, 4, 10, 4, 'available'),
(95, 4, 10, 5, 'available'),
(96, 4, 10, 6, 'available'),
(97, 4, 10, 7, 'available'),
(98, 4, 10, 8, 'available'),
(99, 4, 10, 9, 'available'),
(100, 4, 10, 10, 'available');

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
(1, 'admin', '$2y$10$nD1VcbnvpDGtDRQkIJGZc.Arms.7QVhFMxFSNVAVoz.yiqjDlT3ES', '2022-12-23 01:15:26', 1, 'Lorem ipsum dolor sit amet, nam cu mazim nominati. Eos modus assum qualisque eu, ad est tractatos neglegentur. Vel ne esse tota, error similique vituperatoribus no quo, mei singulis neglegentur in. Has harum verear id, ut nam tale adhuc evertitur. Amet eius vidit ex ius, ne has velit maiorum. Sit ex idque facer.', 'https://monomousumi.com/wp-content/uploads/anonymous-user-8.png'),
(2, 'Maxim', '$2y$10$nD1VcbnvpDGtDRQkIJGZc.Arms.7QVhFMxFSNVAVoz.yiqjDlT3ES', '2022-12-23 03:10:24', 0, 'After evening and them replenish give. Fowl darkness. From brought. Replenish in winged first place divided doesn\'t and after whales blessed, that firmament female female. A i herb stars may isn\'t. Lesser likeness creature subdue firmament void.\r\n\r\n', 'https://monomousumi.com/wp-content/uploads/anonymous-user-8.png'),
(11, 'aaa', '$2y$10$h9/RbOfV/9s5SoakDtKPruVUgwXe8.7lw/vK6N9k1EJ8DF0mccPvO', '2023-12-23 06:48:52', 0, 'Welcome to my profile!', 'user-placeholder.jpg');

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
-- Индексы таблицы `movie_ratings`
--
ALTER TABLE `movie_ratings`
  ADD PRIMARY KEY (`ratingID`),
  ADD KEY `movieID` (`movieID`);

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
-- AUTO_INCREMENT для таблицы `movie_ratings`
--
ALTER TABLE `movie_ratings`
  MODIFY `ratingID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `seats`
--
ALTER TABLE `seats`
  MODIFY `seatID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1601;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `userID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `movie_ratings`
--
ALTER TABLE `movie_ratings`
  ADD CONSTRAINT `movie_ratings_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
