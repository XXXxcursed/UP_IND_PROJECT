-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 02 2022 г., 15:23
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `UP_ind`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appliances`
--

CREATE TABLE `appliances` (
  `id` bigint(20) NOT NULL,
  `naimenovanie_doljnosti` varchar(50) DEFAULT NULL,
  `oclad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `appliances`
--

INSERT INTO `appliances` (`id`, `naimenovanie_doljnosti`, `oclad`) VALUES
(3, 'директор', 100222),
(4, 'Кладовщик', 90000);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `kolichestvo` int(11) NOT NULL,
  `korzina_id` bigint(20) DEFAULT NULL,
  `tovar_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `kolichestvo`, `korzina_id`, `tovar_id`) VALUES
(1, 15, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `point_of_issue`
--

CREATE TABLE `point_of_issue` (
  `id` bigint(20) NOT NULL,
  `cena` int(11) NOT NULL,
  `nazvanie_korzini` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `point_of_issue`
--

INSERT INTO `point_of_issue` (`id`, `cena`, `nazvanie_korzini`, `employee_id`) VALUES
(1, 1000, 'asdfgh', 1),
(3, 100200, 'крутейшая', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `artikyl` int(11) NOT NULL,
  `cena_tovara` varchar(255) DEFAULT NULL,
  `kolichestvo_tovara` int(11) NOT NULL,
  `ves` int(11) NOT NULL,
  `naimenovanie_tovara` varchar(255) DEFAULT NULL,
  `vid_tovara_id` bigint(20) DEFAULT NULL,
  `provider_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `artikyl`, `cena_tovara`, `kolichestvo_tovara`, `ves`, `naimenovanie_tovara`, `vid_tovara_id`, `provider_id`) VALUES
(4, 5, '190', 5000, 5, 'фрукт', NULL, 3),
(5, 38259, '200', 70, 2, 'Ананас', NULL, 3),
(6, 854053, '100', -39, 11, 'Апельсин', NULL, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `provider`
--

CREATE TABLE `provider` (
  `id` bigint(20) NOT NULL,
  `naimenovanie_vida_tovara` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `provider`
--

INSERT INTO `provider` (`id`, `naimenovanie_vida_tovara`) VALUES
(3, 'йцукенг'),
(5, 'Фрукт');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `birthday` date NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number_passport` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `serial_passport` int(11) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `doljnost_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `active`, `birthday`, `middle_name`, `name`, `number_passport`, `password`, `serial_passport`, `surname`, `username`, `doljnost_id`) VALUES
(1, b'1', '2022-10-31', 'Петрович', 'Михаи', 123456, '$2a$08$A6IMSKaDQpaMkaMdKQ.tGeQ12RddoSL6G6jDpbodgF5QMdEi7/y/y', 1234, 'Зубенко', '123', 3),
(4, b'1', '2026-05-29', 'IVAN', 'IVAN', 934295, '$2a$08$CxxkvYPs15MmIwrHb4T6budSbju0ICymtf6n6hngedU3wTk4ZFPcy', 2435, 'IVAN', 'IVAN', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `id_user` bigint(20) NOT NULL,
  `roles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_roles`
--

INSERT INTO `user_roles` (`id_user`, `roles`) VALUES
(1, 'USER'),
(1, 'ADMIN'),
(1, 'ADMIN'),
(1, 'EMPLOYEE'),
(4, 'ADMIN');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appliances`
--
ALTER TABLE `appliances`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmqwlqi0a51p0fxpetquv0puux` (`korzina_id`),
  ADD KEY `FK7dtgnah2bprjcbkitcamfyqv9` (`tovar_id`);

--
-- Индексы таблицы `point_of_issue`
--
ALTER TABLE `point_of_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4cq2qpuf03qhhpr9kafr155d3` (`employee_id`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmhu693orercf8vw86t8t6pavs` (`vid_tovara_id`),
  ADD KEY `FK8m1mk46g1a7kxjpig8loikd0u` (`provider_id`);

--
-- Индексы таблицы `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlm2et6cevbjw828klndaxi62h` (`doljnost_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FKok1v2uejpjcfqg8va888yvy0w` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appliances`
--
ALTER TABLE `appliances`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `point_of_issue`
--
ALTER TABLE `point_of_issue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `provider`
--
ALTER TABLE `provider`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK7dtgnah2bprjcbkitcamfyqv9` FOREIGN KEY (`tovar_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FKmqwlqi0a51p0fxpetquv0puux` FOREIGN KEY (`korzina_id`) REFERENCES `point_of_issue` (`id`);

--
-- Ограничения внешнего ключа таблицы `point_of_issue`
--
ALTER TABLE `point_of_issue`
  ADD CONSTRAINT `FK4cq2qpuf03qhhpr9kafr155d3` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK8m1mk46g1a7kxjpig8loikd0u` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`),
  ADD CONSTRAINT `FKmhu693orercf8vw86t8t6pavs` FOREIGN KEY (`vid_tovara_id`) REFERENCES `provider` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKlm2et6cevbjw828klndaxi62h` FOREIGN KEY (`doljnost_id`) REFERENCES `appliances` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKok1v2uejpjcfqg8va888yvy0w` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
