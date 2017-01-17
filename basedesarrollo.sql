-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2016 a las 02:05:11
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basedesarrollo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `desocuparPuesto` (IN `id` INT)  BEGIN
update puesto
set puesto.estado = 0
where puesto.nropuesto = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAutomovil` (IN `matricula` CHAR(8), IN `modelo` CHAR(20), IN `ano` INT(11), IN `color` CHAR(15))  BEGIN
insert into automovil(matricula,modelo,ano,color)
values(matricula,modelo,ano,color);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEntrada` (IN `matriculaauto` CHAR(8), IN `nropuesto` INT)  NO SQL
BEGIN
insert into entrada(matriculaauto,nropuesto,fecha,hora)
VALUES(matriculaauto,nropuesto,CURRENT_DATE,CURRENT_TIME);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMatricula` (IN `ciusuario` CHAR(10), IN `matriculaauto` CHAR(8), IN `parentesco` CHAR(1))  BEGIN
insert into matricula(ciusuario,matriculaauto,parentesco)
values(ciusuario,matriculaauto,parentesco);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUsuario` (IN `cedula` CHAR(10), IN `nroexp` CHAR(8), IN `nombre` CHAR(15), IN `apellido` CHAR(15), IN `correo` CHAR(20), IN `tlf` CHAR(15), IN `clave` CHAR(5))  BEGIN
insert into usuario(ci,nroexp,nombre,apellido,email,telefono,clave)
values(cedula,nroexp,nombre,apellido,correo,tlf,clave);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ocuparPuesto` (IN `id` INT)  BEGIN
update puesto
set puesto.estado = 1
where puesto.nropuesto = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puestosLibres` ()  BEGIN
select puesto.nropuesto 
from puesto
where puesto.estado = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automovil`
--

CREATE TABLE `automovil` (
  `matricula` char(8) NOT NULL,
  `modelo` char(20) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `color` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `automovil`
--

INSERT INTO `automovil` (`matricula`, `modelo`, `ano`, `color`) VALUES
('AAA135Y', 'TRAIL BLAZER', 2007, 'GRIS'),
('lal', 'lala', 6325, 'lala'),
('lala', 'lala', 2325, 'lala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `numero` int(11) NOT NULL,
  `matriculaauto` char(8) NOT NULL,
  `nropuesto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`numero`, `matriculaauto`, `nropuesto`, `fecha`, `hora`) VALUES
(1, 'lala', 3, '2016-02-02', '13:00:00'),
(2, 'lala', 3, '2016-02-02', '13:00:00'),
(3, 'lala', 3, '2016-02-02', '13:00:00'),
(4, 'lala', 3, '2016-12-05', '14:17:44'),
(5, 'lala', 3, '2016-12-05', '15:01:52'),
(6, 'AAA135Y', 1, '2016-12-05', '15:01:52'),
(7, 'lala', 3, '2016-12-05', '15:15:05'),
(8, 'AAA135Y', 1, '2016-12-05', '15:15:05'),
(9, 'AAA135Y', 1, '2016-12-05', '15:18:57'),
(10, 'AAA135Y', 2, '2016-12-05', '17:04:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `ciusuario` char(10) NOT NULL,
  `matriculaauto` char(8) NOT NULL,
  `parentesco` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`ciusuario`, `matriculaauto`, `parentesco`) VALUES
('20504717', 'AAA135Y', 'V'),
('lala', 'lala', 'c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `nropuesto` int(11) NOT NULL,
  `ubicacion` char(30) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`nropuesto`, `ubicacion`, `estado`) VALUES
(1, '', 1),
(2, '', 0),
(3, '', 0),
(4, '', 1),
(5, '', 1),
(6, '', 1),
(7, '', 0),
(8, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ci` char(10) NOT NULL,
  `nroexp` char(8) NOT NULL,
  `nombre` char(15) NOT NULL,
  `apellido` char(15) NOT NULL,
  `email` char(20) NOT NULL,
  `telefono` char(15) NOT NULL,
  `clave` char(5) NOT NULL,
  `tipo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ci`, `nroexp`, `nombre`, `apellido`, `email`, `telefono`, `clave`, `tipo`) VALUES
('1', '2', '3', '4', '6', '5', '7', NULL),
('20504717', '263985O', 'REISSY', 'TORRES', 'REJGE@GMAIL.COM', '04148986671', 'reiss', NULL),
('lala', 'lala', 'lala', 'lala', 'lala', 'lala', 'lala', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `automovil`
--
ALTER TABLE `automovil`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fkmatricula` (`matriculaauto`),
  ADD KEY `fkcedula` (`nropuesto`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`ciusuario`,`matriculaauto`),
  ADD KEY `fkauto` (`matriculaauto`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`nropuesto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ci`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fkcedula` FOREIGN KEY (`nropuesto`) REFERENCES `puesto` (`nropuesto`),
  ADD CONSTRAINT `fkmatricula` FOREIGN KEY (`matriculaauto`) REFERENCES `automovil` (`matricula`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fkauto` FOREIGN KEY (`matriculaauto`) REFERENCES `automovil` (`matricula`),
  ADD CONSTRAINT `fkusuario` FOREIGN KEY (`ciusuario`) REFERENCES `usuario` (`ci`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
