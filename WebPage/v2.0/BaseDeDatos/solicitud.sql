-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2017 a las 04:09:00
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
-- Base de datos: `ligo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE `solicitud` (
  `FechaGeneracion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Id_solicitud` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `Nombre_Usuario` varchar(25) NOT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT '1',
  `Vendedor` varchar(25) NOT NULL,
  `FechaLeido` timestamp NULL DEFAULT NULL,
  `Id_Ubicacion` int(11) NOT NULL,
  `Leido` tinyint(1) NOT NULL DEFAULT '0',
  `Aceptado` tinyint(1) DEFAULT NULL,
  `Toasted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELACIONES PARA LA TABLA `solicitud`:
--   `Id_Producto`
--       `producto` -> `Id_Producto`
--   `Nombre_Usuario`
--       `usuario` -> `Nombre_Usuario`
--   `Vendedor`
--       `usuario` -> `Nombre_Usuario`
--   `Id_Ubicacion`
--       `markers` -> `id`
--

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`FechaGeneracion`, `Id_solicitud`, `Id_Producto`, `Nombre_Usuario`, `Cantidad`, `Vendedor`, `FechaLeido`, `Id_Ubicacion`, `Leido`, `Aceptado`, `Toasted`) VALUES
('2017-11-08 07:15:48', 6, 4, 'Atom', 2, 'Miguelxngx', NULL, 1, 1, 1, 0),
('2017-11-08 07:42:36', 7, 4, 'Atom', 2, 'Miguelxngx', NULL, 1, 0, NULL, 0),
('2017-11-08 07:46:21', 8, 3, 'Miguelxngx', 2, 'Atom', NULL, 2, 0, NULL, 0),
('2017-11-08 07:48:10', 9, 4, 'Atom', 2, 'Miguelxngx', NULL, 1, 0, NULL, 0),
('2017-11-08 07:51:05', 10, 4, 'Atom', 1, 'Miguelxngx', NULL, 1, 0, NULL, 0),
('2017-11-08 07:52:36', 11, 4, 'Atom', 2, 'Miguelxngx', NULL, 1, 0, NULL, 0),
('2017-11-08 16:58:35', 12, 3, 'Miguelxngx', 2, 'Atom', NULL, 2, 0, NULL, 0),
('2017-11-08 17:09:04', 14, 2, 'Atom', 1, 'Miguelxngx', NULL, 2, 0, NULL, 0),
('2017-11-08 17:09:10', 15, 2, 'Atom', 1, 'Miguelxngx', NULL, 1, 0, NULL, 0),
('2017-11-14 16:03:37', 22, 3, 'Miguelxngx', 2, 'Atom', NULL, 1, 0, NULL, 0),
('2017-11-19 03:01:10', 23, 2, 'Atom', 2, 'Miguelxngx', NULL, 1, 0, NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`Id_solicitud`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Nombre_Usuario` (`Nombre_Usuario`),
  ADD KEY `Vendedor` (`Vendedor`),
  ADD KEY `Id_Ubicacion` (`Id_Ubicacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `Id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`),
  ADD CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`Nombre_Usuario`) REFERENCES `usuario` (`Nombre_Usuario`),
  ADD CONSTRAINT `solicitud_ibfk_3` FOREIGN KEY (`Vendedor`) REFERENCES `usuario` (`Nombre_Usuario`),
  ADD CONSTRAINT `solicitud_ibfk_4` FOREIGN KEY (`Id_Ubicacion`) REFERENCES `markers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
