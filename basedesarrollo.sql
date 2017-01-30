-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-01-2017 a las 05:17:12
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.9

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAutomovil` (IN `ciusuario` CHAR(10), IN `matricula` CHAR(8))  NO SQL
BEGIN
	DELETE FROM matricula WHERE ciusuario = ciusuario AND matricula = matricula;
    DELETE FROM automovil WHERE matricula = matricula;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `desocuparPuesto` (IN `id` INT)  BEGIN
update puesto
set puesto.estado = 0
where puesto.nropuesto = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getEntrada` ()  BEGIN
select * from entrada;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSalida` ()  BEGIN
select * from salida;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAutomovil` (IN `matricula` CHAR(8), IN `modelo` CHAR(20), IN `ano` INT(11), IN `color` CHAR(15))  BEGIN
insert into automovil(matricula,modelo,ano,color)
values(matricula,modelo,ano,color);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEntrada` (IN `matriculaauto` CHAR(8))  NO SQL
BEGIN
insert into entrada(matriculaauto,fecha,hora)
VALUES(matriculaauto,CURRENT_DATE,CURRENT_TIME);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertMatricula` (IN `ciusuario` CHAR(10), IN `matriculaauto` CHAR(8), IN `parentesco` CHAR(1))  BEGIN
insert into matricula(ciusuario,matriculaauto,parentesco)
values(ciusuario,matriculaauto,parentesco);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalida` (`matricula` VARCHAR(8))  BEGIN
insert into salida(matricula,fecha,hora)
values(matricula,CURDATE(),CURTIME());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUsuario` (IN `cedula` CHAR(10), IN `nroexp` CHAR(8), IN `nombre` CHAR(15), IN `apellido` CHAR(15), IN `correo` CHAR(20), IN `tlf` CHAR(15), IN `clave` CHAR(5))  BEGIN
insert into usuario(ci,nroexp,nombre,apellido,email,telefono,clave)
values(cedula,nroexp,nombre,apellido,correo,tlf,clave);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login2` (IN `correo` CHAR(20), IN `pas` CHAR(5))  BEGIN
	select ci, nombre from usuario 
	where usuario.clave = pas AND usuario.email = correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ocuparPuesto` (IN `id` INT)  BEGIN
update puesto
set puesto.estado = 1
where puesto.nropuesto = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `puestosLibres` ()  BEGIN
select * 
from puesto;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `login` (`correo` VARCHAR(12), `pas` VARCHAR(10)) RETURNS VARCHAR(10) CHARSET latin1 BEGIN
	declare algo varchar(10); 
	select ci from usuario 
	where usuario.clave = pas AND usuario.email = correo
  into algo;
  return algo;
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
('AAAB81JA', 'uncarro', 2017, 'negro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `numero` int(11) NOT NULL,
  `matriculaauto` char(8) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`numero`, `matriculaauto`, `fecha`, `hora`) VALUES
(169, 'AAAB81JA', '2017-01-27', '13:33:18');

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
('20504717', 'AAAB81JA', 'v');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `nropuesto` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`nropuesto`, `estado`) VALUES
(0, 1),
(1, 1),
(2, 1),
(3, 1),
(4, 0),
(5, 0),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `numero` int(11) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`numero`, `matricula`, `fecha`, `hora`) VALUES
(3, 'AAAB81JA', '2017-01-27', '13:35:42');

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
('2', '2', '2', '2', '2', '2', '2', NULL),
('20504717', '326', 'reissy', 'torres', 'rt', '04148986671', '12345', 'E'),
('2403762', '234', 'luis', 'hernandez', 'jjj', '1234', '1234', NULL),
('24037627', '12345', 'Luis', 'hernadez', 'kelaenn@gmail.com', '1234', '1234', NULL);

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
  ADD KEY `fkmatricula` (`matriculaauto`);

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
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `matricula` (`matricula`);

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
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fkmatricula` FOREIGN KEY (`matriculaauto`) REFERENCES `automovil` (`matricula`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fkauto` FOREIGN KEY (`matriculaauto`) REFERENCES `automovil` (`matricula`),
  ADD CONSTRAINT `fkusuario` FOREIGN KEY (`ciusuario`) REFERENCES `usuario` (`ci`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `matricula` (`matriculaauto`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
