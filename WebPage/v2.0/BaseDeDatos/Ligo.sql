-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2017 at 05:18 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ligo`
--
DROP DATABASE `Ligo`;
CREATE DATABASE IF NOT EXISTS `Ligo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Ligo`;

-- --------------------------------------------------------

--
-- Table structure for table `Reporte`
--

CREATE TABLE `Reporte` (
  `Id` int(2) NOT NULL,
  `Nombre` varchar(140) NOT NULL,
  `Descripcion` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reporte`
--

INSERT INTO `Reporte` (`Id`, `Nombre`, `Descripcion`) VALUES
(1, 'Lenguaje Inapropiado', 'El usuario empleo un lenguaje indebido en el area publica '),
(2, 'Producto Falso', 'El usuario compartio un producto que no era lo mencionado'),
(3, 'Mal Vendedor', 'El Vendedor no cumplio con la transaccion '),
(4, 'Producto No Entregado', 'El usuario no entrego el producto acordado');

-- --------------------------------------------------------

--
-- Table structure for table `ReporteUsuario`
--

CREATE TABLE `ReporteUsuario` (
  `Id` int(10) NOT NULL,
  `U_Reportador` varchar(25) NOT NULL,
  `U_Reportado` varchar(25) NOT NULL,
  `P_Reportado` int(15) DEFAULT NULL,
  `Tipo_Reporte` int(2) NOT NULL,
  `Descripcion` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ReporteUsuario`
--

INSERT INTO `ReporteUsuario` (`Id`, `U_Reportador`, `U_Reportado`, `P_Reportado`, `Tipo_Reporte`, `Descripcion`) VALUES
(22, 'Atom', 'rcortese', 41, 2, 'No fue como esperaba'),
(23, 'Atom', 'MarioGG', 65, 3, 'Estaba horrible '),
(24, 'Atom', 'MarioGG', NULL, 3, 'Realmente no cocina como menciona');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(15) NOT NULL,
  `Nombre_Categoria` varchar(15) NOT NULL,
  `Descripcion_Categoria` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`Id_Categoria`, `Nombre_Categoria`, `Descripcion_Categoria`) VALUES
(2, 'Comida', 'Desayunos, bebidas, postres y antojitos'),
(3, 'Accesorios', 'En general'),
(4, 'Autos', 'Carritos run run'),
(5, 'Mascotas', 'Perritos'),
(6, 'Para ellas', 'Articulos femeninos'),
(7, 'Para ellos', 'Articulos masculinos'),
(8, 'Servicios', 'servicios ofrecidos'),
(9, 'TecnologÃ­a', 'Computadoras, celulares y demÃ¡s electrÃ³nicos');

-- --------------------------------------------------------

--
-- Table structure for table `comentariosperfil`
--

CREATE TABLE `comentariosperfil` (
  `Emisor` varchar(25) NOT NULL,
  `Receptor` varchar(25) NOT NULL,
  `Texto` varchar(420) NOT NULL,
  `Fecha_Registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentariosperfil`
--

INSERT INTO `comentariosperfil` (`Emisor`, `Receptor`, `Texto`, `Fecha_Registro`, `Id_comentario`) VALUES
('Samantha', 'Atom', 'Hola me interesaria hacerte un pedido grande de costillas, te dejo mi correo samsam@hotmail.com ', '2017-11-22 18:22:12', 9),
('Samantha', 'MigueNM', 'Hola, me parece que ese es mi iphone >:(', '2017-11-22 18:22:44', 10),
('Samantha', 'MemoCarso21', 'Oye de que sabores hay pizza', '2017-11-22 18:23:13', 11),
('Samantha', 'rcortese', 'Te cambio tu auto por un minicooper', '2017-11-22 18:23:43', 12),
('MemoCarso21', 'MigueNM', 'Le pague en linea y no me entrego', '2017-11-22 18:24:26', 13),
('Prinxexitta', 'MigueNM', 'ia bente a acerte krgo de thu hijo', '2017-11-22 18:28:33', 14),
('MemoCarso21', 'Atom', 'Las mejores fundas del campus', '2017-11-22 18:30:12', 15),
('MigueNM', 'Samantha', 'Oye bendes a tu perro para peliarlo?', '2017-11-22 18:31:52', 16),
('MMBatali', 'Atom', 'Bueno no tan buenos productos', '2017-11-22 21:16:58', 19),
('RobertoR', 'rcortese', 'Me agradan tus cachorros podriamos contactarnos', '2017-11-22 21:48:04', 21),
('Atom', 'MemoCarso21', 'Loco', '2017-11-28 18:45:06', 22),
('Atom', 'Atom', 'EstÃ¡n super bien', '2017-11-29 15:16:54', 23);

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `type`) VALUES
(1, 'Edifico 3', '\r\nEpigmenio González 500, San Pablo, 76130 Santiago de Querétaro, Qro.', 20.614330, -100.403275, 'Ingenierias'),
(2, 'Edificio 2', 'Epigmenio González 500, San Pablo, 76130 Santiago de Querétaro, Qro.', 20.614552, -100.403046, '');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `Id_Producto` int(15) NOT NULL,
  `Nombre_Producto` varchar(50) NOT NULL,
  `Descripcion_Producto` varchar(140) DEFAULT NULL,
  `Nombre_Usuario` varchar(25) NOT NULL,
  `Id_Categoria` int(5) NOT NULL,
  `Precio_Producto` decimal(12,2) NOT NULL,
  `Calificacion_Producto` decimal(2,0) NOT NULL DEFAULT '0',
  `Fecha_Registro_Producto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_Promo` int(11) DEFAULT NULL,
  `Img_Nom` varchar(500) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`Id_Producto`, `Nombre_Producto`, `Descripcion_Producto`, `Nombre_Usuario`, `Id_Categoria`, `Precio_Producto`, `Calificacion_Producto`, `Fecha_Registro_Producto`, `Id_Promo`, `Img_Nom`) VALUES
(41, 'Jetta 2017', 'Vendo Jetta 2017 perfectas condiciones ', 'rcortese', 4, '450000.00', '0', '2017-11-22 18:13:07', NULL, 'rcortese_5a15be332fe177.40631343.png'),
(42, 'Ramon', 'Busco cruzar a mi perrito bulldog', 'Samantha', 5, '0.00', '0', '2017-11-22 18:13:35', NULL, 'Samantha_5a15be4f8aa4c3.24803447.jpg'),
(43, 'Cachorros Husky', 'Cachorros Husky en AdopciÃ³n', 'rcortese', 5, '0.00', '0', '2017-11-22 18:14:46', NULL, 'rcortese_5a15be96701f41.12029312.jpg'),
(46, 'Costillas BBQ', 'Costillas hechas en casa 100% sabrosas', 'Atom', 2, '150.00', '0', '2017-11-29 15:17:14', NULL, 'Atom_5a15c008dac338.84614248.png'),
(47, 'Iphone 6s', 'Iphone 6s en perfecto estado', 'MigueNM', 3, '8500.00', '0', '2017-11-22 18:21:28', NULL, 'MigueNM_5a15c028836091.16166054.jpg'),
(48, 'Pizza', 'Pizza horneada en casa', 'MemoCarso21', 2, '125.00', '0', '2017-11-22 18:21:50', NULL, 'MemoCarso21_5a15c03e4b9ad0.17048414.png'),
(49, 'Iphone 6 con iCloud', 'No lo rove, me lo bendieron i me lo blokiaron', 'MigueNM', 3, '7500.00', '0', '2017-11-22 18:22:41', NULL, 'MigueNM_5a15c071f37e71.05845187.jpg'),
(50, 'Fundas de Celulares', 'Fundas Iphone 7', 'Atom', 3, '450.00', '0', '2017-11-22 18:22:52', NULL, 'Atom_5a15c07ccb3086.24370817.png'),
(51, 'Tacos Mercurial', '2016 nuevos', 'MemoCarso21', 7, '1100.00', '0', '2017-11-22 18:23:38', NULL, 'MemoCarso21_5a15c0aa3dd711.62033408.jpg'),
(52, 'Italika tuneada', 'Tiene reporte de robo', 'MigueNM', 4, '60000.00', '0', '2017-11-22 18:23:48', NULL, 'MigueNM_5a15c0b466d906.69550911.jpg'),
(53, 'Listones Mujer', 'Lindos listones para seÃ±oritas', 'Atom', 6, '125.00', '0', '2017-11-29 15:17:23', NULL, 'Atom_5a15c0ca68fc05.93020307.jpg'),
(54, 'Fuska', 'Es cruzada, me la regalÃ³ un primo. Regalo cartuchos.', 'MigueNM', 6, '3500.00', '0', '2017-11-22 18:24:56', NULL, 'MigueNM_5a15c0f8ad17a1.50965006.jpg'),
(55, 'Dibujos', 'Dibujos y caricaturas personalizadas', 'JPPrado', 8, '100.00', '0', '2017-11-22 18:26:47', NULL, 'JPPrado_5a15c167cd9c70.37114012.png'),
(56, 'Canon DSRL', 'nueva  y ademas tiene una memoria sd de 64gb ', 'MemoCarso21', 3, '15000.00', '0', '2017-11-22 18:32:01', NULL, 'MemoCarso21_5a15c2a1a37c17.38985437.png'),
(65, 'Pasta', 'Pasta con albondigas', 'MarioGG', 2, '45.00', '0', '2017-11-22 21:31:26', NULL, 'MarioGG_5a15ecae37dc39.76112983.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `promocion`
--

CREATE TABLE `promocion` (
  `Id_Promo` int(11) NOT NULL,
  `nombre_P` varchar(25) NOT NULL,
  `Descripcion_P` varchar(140) NOT NULL,
  `modificador` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promocion`
--

INSERT INTO `promocion` (`Id_Promo`, `nombre_P`, `Descripcion_P`, `modificador`) VALUES
(1, '5% de descuento', '', 0.95),
(2, '10% de descuento', '', 0.9),
(5, '15% de descuento', '', 0.85),
(6, '20% de descuento', '', 0.8),
(7, '25% de descuento', '', 0.75),
(8, '30% de descuento', '', 0.7),
(9, '35% de descuento', '', 0.65),
(15, '40% de descuento', '', 0.6),
(16, '45% de descuento', '', 0.55),
(17, '50% de descuento', '', 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int(3) NOT NULL,
  `NombreRol` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`Id_Rol`, `NombreRol`) VALUES
(1, 'Grupo Estudiantil'),
(2, 'Usuario Generico'),
(3, 'Administrador'),
(4, 'Usuario registrado'),
(5, 'Super Usuario');

-- --------------------------------------------------------

--
-- Table structure for table `solicitud`
--

CREATE TABLE `solicitud` (
  `FechaGeneracion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Id_solicitud` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `Nombre_Usuario` varchar(25) NOT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT '1',
  `Vendedor` varchar(25) NOT NULL,
  `FechaLeido` timestamp NULL DEFAULT NULL,
  `Leido` tinyint(1) NOT NULL DEFAULT '0',
  `Aceptado` tinyint(1) DEFAULT NULL,
  `Toasted` tinyint(1) DEFAULT '0',
  `Descripción` varchar(128) DEFAULT NULL,
  `Latitud` double NOT NULL,
  `Longitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solicitud`
--

INSERT INTO `solicitud` (`FechaGeneracion`, `Id_solicitud`, `Id_Producto`, `Nombre_Usuario`, `Cantidad`, `Vendedor`, `FechaLeido`, `Leido`, `Aceptado`, `Toasted`, `Descripción`, `Latitud`, `Longitud`) VALUES
('2017-11-22 19:33:50', 36, 53, 'MigueNM', 1, 'Atom', NULL, 0, 0, 0, NULL, 20.61305181225725, -100.40654729101561),
('2017-11-22 19:34:02', 37, 54, 'Atom', 1, 'MigueNM', NULL, 0, 1, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-22 19:34:37', 38, 53, 'MigueNM', 1, 'Atom', NULL, 0, 0, 0, NULL, 20.61433, -100.403275),
('2017-11-22 19:34:58', 39, 53, 'MigueNM', 1, 'Atom', NULL, 0, 0, 0, NULL, 20.614552, -100.403046),
('2017-11-22 21:10:19', 40, 56, 'alelucia', 1, 'MemoCarso21', NULL, 0, 0, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-22 21:10:26', 41, 55, 'alelucia', 1, 'JPPrado', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-22 21:17:32', 42, 56, 'MMBatali', 1, 'MemoCarso21', NULL, 0, 0, 0, NULL, 20.61433, -100.403275),
('2017-11-22 21:33:17', 43, 56, 'MarioGG', 1, 'MemoCarso21', NULL, 0, 1, 0, NULL, 20.6134142, -100.40367570000001),
('2017-11-22 21:39:54', 44, 55, 'EmyFlores', 1, 'JPPrado', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-22 21:40:08', 45, 55, 'EmyFlores', 20, 'JPPrado', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-22 21:47:29', 46, 65, 'RobertoR', 2, 'MarioGG', NULL, 0, NULL, 0, NULL, 20.61306185422607, -100.40438006613158),
('2017-11-30 02:17:39', 49, 52, 'iampablop', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.61854187200901, -100.41124819759034),
('2017-11-30 02:34:21', 50, 56, 'EmyFlores', 158, 'MemoCarso21', NULL, 0, NULL, 0, NULL, 20.61485182459015, -100.40589014980696),
('2017-11-30 02:38:18', 51, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-30 02:38:20', 52, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-30 02:38:20', 53, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-30 02:38:24', 54, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-30 02:38:32', 55, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-30 02:38:33', 56, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999),
('2017-11-30 02:38:35', 57, 54, 'EmyFlores', 1, 'MigueNM', NULL, 0, NULL, 0, NULL, 20.613815, -100.40517399999999);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Nombre_Usuario` varchar(25) NOT NULL,
  `Contrasena` varchar(25) NOT NULL,
  `Correo` varchar(254) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido_P` varchar(40) NOT NULL,
  `Apellido_M` varchar(40) NOT NULL,
  `Anio_Ing` varchar(4) NOT NULL,
  `Semestre` int(1) NOT NULL,
  `Calificacion` int(2) NOT NULL DEFAULT '0',
  `Fecha_Registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_rol` int(11) DEFAULT '4',
  `Img_Nom_U` varchar(500) NOT NULL DEFAULT 'DefaultU.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Nombre_Usuario`, `Contrasena`, `Correo`, `Nombre`, `Apellido_P`, `Apellido_M`, `Anio_Ing`, `Semestre`, `Calificacion`, `Fecha_Registro`, `Id_rol`, `Img_Nom_U`) VALUES
('alelucia', 'Gone.09', 'A01701380@itesm.mx', 'Alejandra', 'LÃ³pez', 'Carvajal', '2017', 2, 0, '2017-11-22 21:09:18', 4, '_5a15e77e496ec6.33561191.jpg'),
('Atom', 'ManuelGH', 'manuelgh@hotmail.com', 'Manuel', 'Garcia', 'Huerta', '2016', 2, 0, '2017-11-22 00:47:21', 5, 'defaultU.png'),
('EmyFlores', 'Gashet1ta.', 'gfemily_22@itesm.mx', 'Emily', 'GarcÃ­a', 'Flores', '2016', 2, 0, '2017-11-22 21:34:01', 4, '_5a15ed498172c1.47934223.jpeg'),
('iampablop', 'Pablo090997', 'pablompa07@hotmail.com', 'Pablo', 'Pozos', 'Aguilar', '2017', 2, 0, '2017-11-30 02:16:58', 4, '_5a1f6a1a446dc6.17626372.png'),
('JPPrado', 'Proyecto', 'jppadro@gmail.com', 'Jose Pablo', 'Prado', 'Ayala', '2016', 2, 0, '2017-11-22 00:47:24', 5, 'defaultU.png'),
('manuelgh', '1234567890', 'manuelgh98@hotmail.com', 'Manuel', 'Garcia', 'Huerta', '1998', 2, 0, '2017-11-22 15:33:09', 4, 'manuelgh.jpg'),
('MarioGG', '12345', 'MGG@ITESM.mx', 'Mario', 'GarcÃ­a', 'Gonzalez', '2017', 1, 0, '2017-11-22 21:30:24', 4, '_5a15ec70ca0c04.56938500.png'),
('MemoCarso', '123456', 'mcarsolio44@gmail.com', 'Guillermo', 'Carsolio', 'Gonzalez', '2016', 2, 0, '2017-11-22 15:22:40', 4, ' _5a159640db6011.47888095.jpg'),
('MemoCarso21', '12345', 'mcarsolio44@gmail.com', 'Memo', 'Carsolio', 'Gonzalez', '2016', 2, 0, '2017-11-22 18:19:36', 4, '_5a15bfb84ac906.08562513.jpg'),
('Miguelxngx', 'Manuhuelefeo', 'yo@gmail.com', 'Miguel', 'Navarro', 'Mata', '1560', 2, 99, '2017-11-22 00:47:36', 5, 'defaultU.png'),
('MigueNM', 'HolaSam', 'miguel.nvr98@gmail.com', 'Miguel Angel', 'Navarro', 'Mata', '2017', 2, 0, '2017-11-22 18:12:13', 4, '_5a15bdfd029b25.24001617.png'),
('MMBatali', '12345', 'bataliMM@gmail.com', 'Mario', 'Morelos', 'Batali', '2017', 1, 0, '2017-11-22 21:16:06', 4, '_5a15e91650e303.28646045.png'),
('Prinxexitta', 'HolaSam', 'miguel.nvr98@gmail.com', 'La Britanny Guadalupe', 'Martinez', 'Sanchez', '2017', 2, 0, '2017-11-22 18:28:07', 4, '_5a15c1b767d1d6.07967931.jpg'),
('rcortese', '1234567890', 'rcortese@itesm.mx', 'Ricardo', 'CortÃ©s', 'Espinosa', '1989', 2, 0, '2017-11-22 18:11:02', 4, '_5a15bdb6eea182.38309899.jpg'),
('RobertoR', '1234567890', 'manuelgh98@hotmail.com', 'Roberto', 'Rojas', 'Ramirez', '2003', 2, 0, '2017-11-22 21:47:00', 4, '_5a15f054314b19.71119174.png'),
('RobRojas', 'RamirezRR', 'robertoroj@gmail.com', 'Roberto', 'Rojas', 'Ramirez', '2013', 1, 0, '2017-11-22 00:47:32', 4, 'defaultU.png'),
('Samantha', 'SAMANTHA', 'mochis_ola@hotmail.com', 'Samantha', 'HernÃ¡ndez', 'HernÃ¡ndez', '2017', 2, 0, '2017-11-22 18:12:31', 4, '_5a15be0f377232.75639861.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Reporte`
--
ALTER TABLE `Reporte`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ReporteUsuario`
--
ALTER TABLE `ReporteUsuario`
  ADD PRIMARY KEY (`Id`,`U_Reportador`,`U_Reportado`,`Tipo_Reporte`),
  ADD KEY `fk_U_Reportador` (`U_Reportador`),
  ADD KEY `fk_U_Reportado` (`U_Reportado`),
  ADD KEY `fk_Tipo_Reporte` (`Tipo_Reporte`),
  ADD KEY `fk_P_Reportado` (`P_Reportado`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indexes for table `comentariosperfil`
--
ALTER TABLE `comentariosperfil`
  ADD PRIMARY KEY (`Id_comentario`),
  ADD KEY `EmisorFk` (`Emisor`),
  ADD KEY `ReceptorFk` (`Receptor`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `Id_Categoria` (`Id_Categoria`),
  ADD KEY `Nombre_Usuario` (`Nombre_Usuario`),
  ADD KEY `Id_Promo` (`Id_Promo`);

--
-- Indexes for table `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`Id_Promo`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indexes for table `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`Id_solicitud`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Nombre_Usuario` (`Nombre_Usuario`),
  ADD KEY `Vendedor` (`Vendedor`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Nombre_Usuario`),
  ADD KEY `usuario_ibfk_1` (`Id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Reporte`
--
ALTER TABLE `Reporte`
  MODIFY `Id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ReporteUsuario`
--
ALTER TABLE `ReporteUsuario`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_Categoria` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `comentariosperfil`
--
ALTER TABLE `comentariosperfil`
  MODIFY `Id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `Id_Producto` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `promocion`
--
ALTER TABLE `promocion`
  MODIFY `Id_Promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `Id_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ReporteUsuario`
--
ALTER TABLE `ReporteUsuario`
  ADD CONSTRAINT `fk_P_Reportado` FOREIGN KEY (`P_Reportado`) REFERENCES `producto` (`Id_Producto`),
  ADD CONSTRAINT `fk_Tipo_Reporte` FOREIGN KEY (`Tipo_Reporte`) REFERENCES `Reporte` (`Id`),
  ADD CONSTRAINT `fk_U_Reportado` FOREIGN KEY (`U_Reportado`) REFERENCES `usuario` (`Nombre_Usuario`),
  ADD CONSTRAINT `fk_U_Reportador` FOREIGN KEY (`U_Reportador`) REFERENCES `usuario` (`Nombre_Usuario`);

--
-- Constraints for table `comentariosperfil`
--
ALTER TABLE `comentariosperfil`
  ADD CONSTRAINT `comentariosperfil_ibfk_1` FOREIGN KEY (`Emisor`) REFERENCES `usuario` (`Nombre_Usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentariosperfil_ibfk_2` FOREIGN KEY (`Receptor`) REFERENCES `usuario` (`Nombre_Usuario`) ON DELETE CASCADE;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Nombre_Usuario`) REFERENCES `usuario` (`Nombre_Usuario`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`Id_Promo`) REFERENCES `promocion` (`Id_Promo`) ON DELETE SET NULL;

--
-- Constraints for table `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_Producto`),
  ADD CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`Nombre_Usuario`) REFERENCES `usuario` (`Nombre_Usuario`),
  ADD CONSTRAINT `solicitud_ibfk_3` FOREIGN KEY (`Vendedor`) REFERENCES `usuario` (`Nombre_Usuario`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_rol`) REFERENCES `rol` (`Id_Rol`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for Reporte
--

--
-- Metadata for ReporteUsuario
--

--
-- Metadata for categoria
--

--
-- Metadata for comentariosperfil
--

--
-- Metadata for markers
--

--
-- Metadata for producto
--

--
-- Metadata for promocion
--

--
-- Metadata for rol
--

--
-- Metadata for solicitud
--

--
-- Metadata for usuario
--

--
-- Metadata for Ligo
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
