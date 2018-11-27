-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2018 a las 14:21:22
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juricol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

CREATE TABLE `auditorias` (
  `Id` int(11) NOT NULL,
  `Registro_id` int(11) NOT NULL,
  `Accion` varchar(25) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Usuarios_id` int(11) NOT NULL,
  `Tabla` varchar(17) NOT NULL,
  `Datos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`Id`, `Descripcion`, `FechaCreacion`) VALUES
(1, 'Encargado de area penal', '2018-11-27'),
(2, 'Recepcionista', '2018-11-27'),
(3, 'Encargado del area civill', '2018-11-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(35) NOT NULL,
  `Departamentos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`Id`, `Descripcion`, `Departamentos_id`) VALUES
(1, 'Ibague', 1),
(2, 'Espinal', 1),
(3, 'Chaparrall', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id` int(11) NOT NULL,
  `PrimerNombre` varchar(20) NOT NULL,
  `SegundoNombre` varchar(20) NOT NULL,
  `PrimerApellido` varchar(20) NOT NULL,
  `SegundoApellido` varchar(20) NOT NULL,
  `Documento` int(11) NOT NULL,
  `Telefono` bigint(15) DEFAULT NULL,
  `Celular` bigint(15) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL,
  `TipoDocumento_id` int(11) NOT NULL,
  `CiudadResidencia_id` int(11) NOT NULL,
  `InstitucionLaboral_id` int(11) NOT NULL,
  `NombreSustituto` varchar(60) NOT NULL,
  `TelefonoCelularSustituto` bigint(15) NOT NULL,
  `CorreoSustituto` varchar(100) NOT NULL,
  `DocumentoSustituto` bigint(15) NOT NULL,
  `Parentesco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demandas`
--

CREATE TABLE `demandas` (
  `Id` int(11) NOT NULL,
  `Clientes_id` int(11) NOT NULL,
  `NumDemanda` varchar(50) NOT NULL,
  `TiposDemandas_id` int(11) NOT NULL,
  `Juzgado_id` int(11) NOT NULL,
  `Titular_id` int(11) NOT NULL,
  `Suplente_id` int(11) NOT NULL,
  `Demandado` varchar(255) NOT NULL,
  `Descripcion` varchar(80) NOT NULL,
  `EstadosProcesos_id` int(11) NOT NULL,
  `Categoria` tinyint(1) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(35) NOT NULL,
  `Paises_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`Id`, `Descripcion`, `Paises_id`) VALUES
(1, 'Tolima', 1),
(2, 'Tacamandapio', 2),
(3, 'Cundinamarca', 1),
(4, 'Antioquia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Id` int(11) NOT NULL,
  `PrimerNombre` varchar(20) NOT NULL,
  `SegundoNombre` varchar(20) DEFAULT NULL,
  `PrimerApellido` varchar(20) NOT NULL,
  `SegundoApellido` varchar(20) NOT NULL,
  `Documento` int(11) NOT NULL,
  `TipoDocumento_id` int(11) NOT NULL,
  `TarjetaProfecional` bigint(20) NOT NULL,
  `Especialidad` int(11) NOT NULL,
  `Estados` enum('Activo','Desactivo') NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Cargos_id` int(11) NOT NULL,
  `Titular` tinyint(1) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Celular` bigint(15) NOT NULL,
  `Telefono` bigint(15) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`Id`, `Descripcion`, `FechaCreacion`) VALUES
(1, 'Juridico', '2018-11-27'),
(2, 'Penal', '2018-11-27'),
(3, 'Familiaa', '2018-11-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosdemandas`
--

CREATE TABLE `estadosdemandas` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `DiasLimite` smallint(6) NOT NULL,
  `Tipo` enum('Fase','EstadoElectronico') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosprocesos`
--

CREATE TABLE `estadosprocesos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucionlaboral`
--

CREATE TABLE `institucionlaboral` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  `Ciudad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucionlaboral`
--

INSERT INTO `institucionlaboral` (`Id`, `Descripcion`, `Ciudad_id`) VALUES
(1, 'Colegio Anita', 1),
(2, 'Colegio Fatima', 2),
(3, 'Colegio Sagrada Familia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgados`
--

CREATE TABLE `juzgados` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `Id` int(11) NOT NULL,
  `Demandas_id` int(11) NOT NULL,
  `EstadosDemandas_id` int(11) NOT NULL,
  `FechaMovimiento` date NOT NULL,
  `Descripcion` text NOT NULL,
  `FechaLimite` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`Id`, `Descripcion`) VALUES
(1, 'Colombia'),
(2, 'PerÃº');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`Id`, `Descripcion`) VALUES
(4, 'conyuge'),
(3, 'Hijo'),
(2, 'Padre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdemandas`
--

CREATE TABLE `tiposdemandas` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdocumentos`
--

INSERT INTO `tiposdocumentos` (`Id`, `Descripcion`) VALUES
(1, 'Cedula de ciudadania'),
(2, 'Extranjeria'),
(3, 'Tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Usuario` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Empleados_id` int(11) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `CodigoAsociado` smallint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `auditorias_ibfk_1` (`Usuarios_id`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ciudades_ibfk_1` (`Departamentos_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Documento` (`Documento`),
  ADD KEY `Parentesco_id` (`Parentesco_id`),
  ADD KEY `CiudadResidencia_id` (`CiudadResidencia_id`),
  ADD KEY `InstitucionLaboral_id` (`InstitucionLaboral_id`),
  ADD KEY `TipoDocumento_id` (`TipoDocumento_id`);

--
-- Indices de la tabla `demandas`
--
ALTER TABLE `demandas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `demandas_ibfk_3` (`TiposDemandas_id`),
  ADD KEY `demandas_ibfk_4` (`Titular_id`),
  ADD KEY `demandas_ibfk_5` (`Suplente_id`),
  ADD KEY `demandas_ibfk_7` (`EstadosProcesos_id`),
  ADD KEY `demandas_ibfk_8` (`Clientes_id`),
  ADD KEY `Juzgado_id` (`Juzgado_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `departamentos_ibfk_1` (`Paises_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Documento` (`Documento`),
  ADD KEY `empleados_ibfk_1` (`Cargos_id`),
  ADD KEY `empleados_ibfk_2` (`Especialidad`),
  ADD KEY `TipoDocumento_id` (`TipoDocumento_id`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `estadosdemandas`
--
ALTER TABLE `estadosdemandas`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `estadosprocesos`
--
ALTER TABLE `estadosprocesos`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `institucionlaboral`
--
ALTER TABLE `institucionlaboral`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Ciudad_id` (`Ciudad_id`);

--
-- Indices de la tabla `juzgados`
--
ALTER TABLE `juzgados`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `movimientos_ibfk_1` (`Demandas_id`),
  ADD KEY `movimientos_ibfk_2` (`EstadosDemandas_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `tiposdemandas`
--
ALTER TABLE `tiposdemandas`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Usuario` (`Usuario`),
  ADD KEY `usuarios_ibfk_1` (`Empleados_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `demandas`
--
ALTER TABLE `demandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estadosdemandas`
--
ALTER TABLE `estadosdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadosprocesos`
--
ALTER TABLE `estadosprocesos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `institucionlaboral`
--
ALTER TABLE `institucionlaboral`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `juzgados`
--
ALTER TABLE `juzgados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiposdemandas`
--
ALTER TABLE `tiposdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `auditorias_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`Departamentos_id`) REFERENCES `departamentos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Parentesco_id`) REFERENCES `parentesco` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`CiudadResidencia_id`) REFERENCES `ciudades` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`InstitucionLaboral_id`) REFERENCES `institucionlaboral` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`TipoDocumento_id`) REFERENCES `tiposdocumentos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `demandas`
--
ALTER TABLE `demandas`
  ADD CONSTRAINT `demandas_ibfk_3` FOREIGN KEY (`TiposDemandas_id`) REFERENCES `tiposdemandas` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_4` FOREIGN KEY (`Titular_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_5` FOREIGN KEY (`Suplente_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_7` FOREIGN KEY (`EstadosProcesos_id`) REFERENCES `estadosprocesos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_8` FOREIGN KEY (`Clientes_id`) REFERENCES `clientes` (`Id`),
  ADD CONSTRAINT `demandas_ibfk_9` FOREIGN KEY (`Juzgado_id`) REFERENCES `juzgados` (`Id`);

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`Paises_id`) REFERENCES `paises` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Cargos_id`) REFERENCES `cargos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`Especialidad`) REFERENCES `especialidades` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`TipoDocumento_id`) REFERENCES `tiposdocumentos` (`Id`);

--
-- Filtros para la tabla `institucionlaboral`
--
ALTER TABLE `institucionlaboral`
  ADD CONSTRAINT `institucionlaboral_ibfk_1` FOREIGN KEY (`Ciudad_id`) REFERENCES `ciudades` (`Id`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`Demandas_id`) REFERENCES `demandas` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`EstadosDemandas_id`) REFERENCES `estadosdemandas` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Empleados_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
