-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 22 2023 г., 13:42
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `your_database`
--

-- --------------------------------------------------------

--
-- Структура таблицы `errors`
--

CREATE TABLE `errors` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `short_description` varchar(255) NOT NULL,
  `detailed_description` text NOT NULL,
  `user` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `urgency` varchar(255) NOT NULL,
  `severity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `errors`
--

INSERT INTO `errors` (`id`, `number`, `date`, `short_description`, `detailed_description`, `user`, `status`, `urgency`, `severity`) VALUES
(1, 1, '2000-12-11 21:00:00', 'error', 'qweqweqwqwe', 'NikitaU', 'Новая', 'Очень срочно', 'Критичная'),
(2, 2, '2000-12-11 21:00:00', 'error', 'qweqweqwqwe', 'NikitaU', 'Новая', 'Не срочно', 'Некритичная'),
(3, 3, '2020-02-11 21:00:00', 'qwdwqdw', 'wquydvuqwvduvqwiduvuiqviduvwiuvqywvdyveyquyvdqvuwdvuqwidvuwvq', 'Stas', 'Новая', 'Совсем не срочно', 'Запрос на изменение');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `password`) VALUES
(6, 'NikitaU', 'Nikita', 'Umerenkov', 'qwerty'),
(7, 'Stas', 'Stas', 'Sars', 'qaz');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `errors`
--
ALTER TABLE `errors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `errors`
--
ALTER TABLE `errors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
