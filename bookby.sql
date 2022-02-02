-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 02 2022 г., 18:02
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookby`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `ISBN` int(11) NOT NULL,
  `Title` text DEFAULT NULL,
  `Author` text DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`ISBN`, `Title`, `Author`, `Price`) VALUES
(1, 'Толстой', 'Война и мир', 35),
(2, 'Булгаков', 'Мастер и Маргарита', 25),
(3, 'Лермантов', 'Избранные произведения', 25),
(4, 'Пушкин', 'Евгений Онегин', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `book_reviews`
--

CREATE TABLE `book_reviews` (
  `ISBN` int(11) NOT NULL,
  `Reviews` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `book_reviews`
--

INSERT INTO `book_reviews` (`ISBN`, `Reviews`) VALUES
(6723248, 'Супер книга! Всем рекомендую!'),
(6723249, 'Не понравилось. Не стоит покупать.');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(6) NOT NULL,
  `Name` tinytext DEFAULT NULL,
  `Address` tinytext DEFAULT NULL,
  `City` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Address`, `City`) VALUES
(1, 'Иванов И.И.', 'пр Пушкина 32', 'Минск'),
(3, 'Петров И.И.', 'пр Рокоссовского 10', 'Минск'),
(4, 'Сидоров А.В.', 'Ул Цветочная 18', 'Пинск');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(6) NOT NULL,
  `Amount` int(11) NOT NULL,
  `CustomerID` int(6) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`OrderID`, `Amount`, `CustomerID`, `Date`) VALUES
(1, 3, 70, '0000-00-00 00:00:00'),
(2, 1, 50, '0000-00-00 00:00:00'),
(3, 2, 75, '0000-00-00 00:00:00'),
(4, 3, 25, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_items`
--

CREATE TABLE `orders_items` (
  `Order_ID` int(6) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `Quantity` tinyint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `orders_items`
--

INSERT INTO `orders_items` (`Order_ID`, `ISBN`, `Quantity`) VALUES
(1, 0, 2),
(2, 0, 1),
(3, 0, 1),
(4, 0, 1),
(5, 0, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Индексы таблицы `book_reviews`
--
ALTER TABLE `book_reviews`
  ADD PRIMARY KEY (`ISBN`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Индексы таблицы `orders_items`
--
ALTER TABLE `orders_items`
  ADD PRIMARY KEY (`Order_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `ISBN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `book_reviews`
--
ALTER TABLE `book_reviews`
  MODIFY `ISBN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6723250;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders_items`
--
ALTER TABLE `orders_items`
  MODIFY `Order_ID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `orders` (`OrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
