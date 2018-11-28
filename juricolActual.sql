-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2018 a las 20:17:08
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
  `Documento` bigint(15) NOT NULL,
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
  `CelularSustituto` bigint(15) NOT NULL,
  `CorreoSustituto` varchar(100) NOT NULL,
  `TipoDocumentoSustituto_id` int(11) NOT NULL,
  `DocumentoSustituto` bigint(15) NOT NULL,
  `Parentesco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Documento`, `Telefono`, `Celular`, `Direccion`, `Correo`, `FechaNacimiento`, `FechaCreacion`, `FechaInhabilitacion`, `TipoDocumento_id`, `CiudadResidencia_id`, `InstitucionLaboral_id`, `NombreSustituto`, `CelularSustituto`, `CorreoSustituto`, `TipoDocumentoSustituto_id`, `DocumentoSustituto`, `Parentesco_id`) VALUES
(2, 'LUZ', 'NIDIA', 'LONDOÃ‘O', 'TAMAYO', 11105232021, 3122546, 235465777, 'Av siempre viva', 'Yo@gmail.com', '1988-05-05', '2018-11-27', NULL, 1, 1, 1, 'Maria Paula MariÃ±o', 3216546844, 'yo@gmail.com', 1, 2156546874, 3),
(3, 'FERDINAN', '', 'YATE', 'CASTAÃ‘O', 8475623198, 3126, 23547, 'Apre viva', 'Yodf@gmail.com', '1988-08-08', '2018-11-27', NULL, 1, 1, 2, 'Maria Paula MariÃ±o', 3216546844, 'yo@gmail.com', 1, 2987446874, 3),
(4, 'ANA', 'SOFIA', 'RAMOS', 'ALVAREZ', 8888888, NULL, 2358777, 'Apre vivaaaaaaaaa', 'Yodssssssf@gmail.com', '1987-06-07', '2018-11-27', NULL, 1, 1, 2, 'Maria Paula MariÃ±o', 3246844, 'yoss@gmail.com', 1, 29888874, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demandas`
--

CREATE TABLE `demandas` (
  `Id` int(11) NOT NULL,
  `Clientes_id` int(11) NOT NULL,
  `NumDemanda` varchar(50) NOT NULL,
  `TiposDemandas_id` int(11) NOT NULL,
  `TiposProcesos_id` int(11) NOT NULL,
  `Juzgado_id` int(11) NOT NULL,
  `Titular_id` int(11) NOT NULL,
  `Suplente_id` int(11) NOT NULL,
  `Demandado` varchar(255) NOT NULL,
  `Descripcion` varchar(80) NOT NULL,
  `EstadosProcesos_id` int(11) NOT NULL,
  `Categoria` tinyint(1) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `demandas`
--

INSERT INTO `demandas` (`Id`, `Clientes_id`, `NumDemanda`, `TiposDemandas_id`, `TiposProcesos_id`, `Juzgado_id`, `Titular_id`, `Suplente_id`, `Demandado`, `Descripcion`, `EstadosProcesos_id`, `Categoria`, `FechaCreacion`) VALUES
(2, 2, '73001333300120160026900', 4, 4, 1, 1, 2, 'MUNICIPIO DE IBAGUE', 'ASDEDEFWEWEFEVV', 1, 1, '2018-11-28'),
(3, 3, '73001333300120170040700', 5, 3, 1, 1, 2, 'LA NACION- MINISTERIO DE EDUCACION- MINISTERIO DE IBAGUE- FONDO NACIONAL DE PRESTACIONES SOCIALES DE', 'ASDEDEFWEWEFEVV', 1, 1, '2018-11-28'),
(4, 4, '73001333300120180005500', 5, 3, 1, 1, 2, 'NACION- MINISTERIO DE EDUCACION NACIONAL', 'eerergertttert', 1, 1, '2018-11-28');

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

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Documento`, `TipoDocumento_id`, `TarjetaProfecional`, `Especialidad`, `Estados`, `FechaNacimiento`, `Cargos_id`, `Titular`, `Direccion`, `Correo`, `Celular`, `Telefono`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Edwin', 'Fernando', 'LondoÃ±o', 'Jaramillo', 98745562, 1, 9874556255, 1, 'Activo', '1987-06-07', 1, 1, 'Apre vivaaaaaaaaa', 'Yodssssssf@gmail.com', 2358777, NULL, '2018-11-28', NULL),
(2, 'Juan', 'Carlos', 'Bustos', 'Tobio', 100740786, 1, 9871441155, 2, 'Activo', '1990-07-02', 2, 0, 'Apre mmaaaaaa', 'Yodssssssf@gmail.com', 239877, NULL, '2018-11-28', NULL);

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

--
-- Volcado de datos para la tabla `estadosdemandas`
--

INSERT INTO `estadosdemandas` (`Id`, `Descripcion`, `FechaCreacion`, `DiasLimite`, `Tipo`) VALUES
(1, 'Auto reconoce personerÃ­a', '2018-11-28', 10, ''),
(2, 'Admite Demanda', '2018-11-28', 20, 'EstadoElectronico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosprocesos`
--

CREATE TABLE `estadosprocesos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadosprocesos`
--

INSERT INTO `estadosprocesos` (`Id`, `Descripcion`, `FechaCreacion`) VALUES
(1, 'Admitida', '2018-11-27'),
(2, 'Rechazada', '2018-11-27'),
(3, 'Inactivaa', '2018-11-27'),
(4, 'Activa', '2018-11-28');

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

--
-- Volcado de datos para la tabla `juzgados`
--

INSERT INTO `juzgados` (`Id`, `Descripcion`) VALUES
(1, '01 administrativo de ibague'),
(2, '02 administrativo de ibague'),
(3, '07 administrativo de ibague');

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
-- Estructura de tabla para la tabla `tipoprocesos`
--

CREATE TABLE `tipoprocesos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoprocesos`
--

INSERT INTO `tipoprocesos` (`Id`, `Descripcion`) VALUES
(3, 'Ejecutivo'),
(4, 'Ejecutivo prima de servicioss'),
(1, 'Homologacion'),
(2, 'Sancion cesantias parciales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdemandas`
--

CREATE TABLE `tiposdemandas` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdemandas`
--

INSERT INTO `tiposdemandas` (`Id`, `Descripcion`, `FechaCreacion`) VALUES
(2, 'Civil', '2018-11-27'),
(3, 'Penal', '2018-11-27'),
(4, 'Administrativa', '2018-11-27'),
(5, 'Judicialll', '2018-11-27');

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
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Usuario`, `Password`, `Empleados_id`, `FechaCreacion`, `CodigoAsociado`) VALUES
(1, 123456789, '123456789', NULL, '2018-11-27', NULL),
(2, 98745562, '987654321', 1, '2018-11-28', NULL);

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
  ADD KEY `TipoDocumento_id` (`TipoDocumento_id`),
  ADD KEY `TipoDocumentoSustituto_id` (`TipoDocumentoSustituto_id`);

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
  ADD KEY `demandas_ibfk_9` (`Juzgado_id`),
  ADD KEY `TiposProcesos_id` (`TiposProcesos_id`);

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
-- Indices de la tabla `tipoprocesos`
--
ALTER TABLE `tipoprocesos`
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `demandas`
--
ALTER TABLE `demandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estadosdemandas`
--
ALTER TABLE `estadosdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadosprocesos`
--
ALTER TABLE `estadosprocesos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `institucionlaboral`
--
ALTER TABLE `institucionlaboral`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `juzgados`
--
ALTER TABLE `juzgados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT de la tabla `tipoprocesos`
--
ALTER TABLE `tipoprocesos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiposdemandas`
--
ALTER TABLE `tiposdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tiposdocumentos`
--
ALTER TABLE `tiposdocumentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`TipoDocumento_id`) REFERENCES `tiposdocumentos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_5` FOREIGN KEY (`TipoDocumentoSustituto_id`) REFERENCES `tiposdocumentos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `demandas`
--
ALTER TABLE `demandas`
  ADD CONSTRAINT `demandas_ibfk_10` FOREIGN KEY (`TiposProcesos_id`) REFERENCES `tipoprocesos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_3` FOREIGN KEY (`TiposDemandas_id`) REFERENCES `tiposdemandas` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_4` FOREIGN KEY (`Titular_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_5` FOREIGN KEY (`Suplente_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_7` FOREIGN KEY (`EstadosProcesos_id`) REFERENCES `estadosprocesos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_8` FOREIGN KEY (`Clientes_id`) REFERENCES `clientes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_9` FOREIGN KEY (`Juzgado_id`) REFERENCES `juzgados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
