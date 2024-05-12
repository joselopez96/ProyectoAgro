-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2020 a las 06:57:51
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba1`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `adduser` (IN `_nombre` VARCHAR(20), IN `_contra` VARCHAR(15), IN `_dni` VARCHAR(8), IN `_correo` VARCHAR(30), IN `_telefono` VARCHAR(12), IN `_direccion` VARCHAR(40))  insert into usuarios(nombre,contra,dni,correo,telefono,direccion)VALUES (_nombre,_contra,_dni,_correo,_telefono,_direccion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscaid` (IN `_iduser` VARCHAR(4))  select *from usuarios where idusuario=_iduser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkuser` (IN `_correo` VARCHAR(25), IN `_contra` VARCHAR(16))  SELECT * from usuarios where correo=_correo and contra=_contra$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteuser` (IN `_iduser` INT)  update usuarios set estado=0 where idusuario=_iduser$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `empleado` ()  SELECT *from usuarios where tipousuario=0 and estado=1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateuser` (IN `_id` INT, IN `_nombre` VARCHAR(20), IN `_contra` VARCHAR(15), IN `_dni` VARCHAR(8), IN `_correo` VARCHAR(30), IN `_telefono` VARCHAR(9), IN `_direccion` VARCHAR(40))  UPDATE usuarios set nombre=_nombre,contra=_contra,dni=_dni,correo=_correo,telefono=_telefono,direccion=_direccion where idusuario=_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `contra` varchar(16) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `tipousuario` int(11) DEFAULT 0,
  `estado` int(11) DEFAULT 1,
  `telefono` varchar(12) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `contra`, `dni`, `correo`, `tipousuario`, `estado`, `telefono`, `direccion`) VALUES
(3, 'joselopez', '123456', '75014941', 'joselopez@gmail.com', 1, 1, '555555555', 'Av. faucett 451 San miguel'),
(5, 'pepe', 'etesech', '11111111', 'elpepe@gmail.com', 1, 1, '991579456', 'Av. pacasmayo 120 San martin p'),
(9, 'waldir Sotelo', 'waldo123', '12345678', 'waldo@agrotec.com', 0, 1, '998564723', 'Calle coropuna 120 San miguel'),
(16, 'Alexander Gomez', '11111111', '12345678', 'gomezbolanos@agrotec.com', 0, 0, '991579412', 'av alamos 120 smp'),
(17, 'Alexander Gomez', 'shavo111', '12345678', 'gomezbolanos@agrotec.com', 0, 1, '991579412', 'av alamos 120 smp'),
(18, 'Jose Pacherrez', 'kabuto12', '75412368', 'pacherres995@agrotec.com', 0, 0, '994751654', 'av. los almirantes la victoria'),
(19, 'Ernesto Ocampo', 'nomejalespe', '99999999', 'ernesto.ocampo@upn.pe', 0, 0, '995478125', 'su jato ps'),
(20, 'Luis Suarez', 'qlonsuarez', '11111111', 'luis.suarez@agrotec.com', 0, 0, '998574125', 'av. larco 159 lurigancho');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
