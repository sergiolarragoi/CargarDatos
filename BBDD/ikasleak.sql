-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2017 a las 10:35:27
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ikasleak`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_borrarIkasleak` (IN `pid` INT)  NO SQL
DELETE
FROM ikaslea
WHERE id = pid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarIkasleak` (IN `pnombre` VARCHAR(40), IN `papellido1` VARCHAR(40), IN `papellido2` VARCHAR(40), IN `pciclo` VARCHAR(40), IN `pcurso` VARCHAR(40))  NO SQL
BEGIN
DECLARE azkenId INT;
INSERT INTO `ikaslea`(`nombre`, `apellido1`, `apellido2`, `ciclo`, `curso`) VALUES (pnombre,papellido1,papellido2,pciclo,pcurso);
SET azkenId =(SELECT MAX(id) FROM ikaslea);
SELECT id FROM ikaslea WHERE id=azkenId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificarIkasleak` (IN `pid` INT, IN `pnombre` VARCHAR(40), IN `papellido` VARCHAR(40), IN `papellido2` VARCHAR(40), IN `pciclo` VARCHAR(40), IN `pcurso` VARCHAR(40))  NO SQL
UPDATE `ikaslea` SET `id`=pid,`nombre`=pnombre,`apellido1`=papellido,`apellido2`=papellido2,`ciclo`=pciclo,`curso`=pcurso WHERE `id`=pid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrarIkasleak` ()  NO SQL
SELECT
	*
FROM
	ikaslea$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ikaslea`
--

CREATE TABLE `ikaslea` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciclo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `curso` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ikaslea`
--

INSERT INTO `ikaslea` (`id`, `nombre`, `apellido1`, `apellido2`, `ciclo`, `curso`) VALUES
(1, 'ANA', 'ANSOLA', 'BARTET', 'APLICACIONES WEB', 'primero'),
(2, 'SARA', 'ANSUATEGI', 'ETXABE', 'APLICACIONES WEB', 'segundo'),
(3, 'ENEKO', 'ARRIETA', 'GABIOLA', 'APLICACIONES WEB', 'segundo'),
(4, 'MIREN', 'BALZATEGI', 'ZUMELAGA', 'CUIDADOS AUX ENF', 'primero'),
(5, 'ASIER', 'ETXEANDIA', 'RASIER', 'SOLDADURA', 'segundo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ikaslea`
--
ALTER TABLE `ikaslea`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ikaslea`
--
ALTER TABLE `ikaslea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
