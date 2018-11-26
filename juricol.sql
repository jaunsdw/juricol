-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2018 a las 06:38:43
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
(1, 'Jefe de contaduria', '2018-09-12'),
(2, 'Recepcionista', '2018-09-12'),
(3, 'Jefe de pruebas', '2018-09-13'),
(4, 'Jefe de pruebas2', '2018-09-13'),
(5, 'Jefe de pruebas3', '2018-09-13'),
(6, 'Jefe de pruebas4', '2018-09-13'),
(7, 'Brisniiiiiii', '2018-09-21');

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
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Documento`, `Telefono`, `Celular`, `Direccion`, `Correo`, `FechaNacimiento`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Edwin', 'Fernando', 'Londono', 'Jaramillo', 753159654, 235698, 3138185957, 'poipoiipoipoi', 'poipoi@hotmail.com', '1758-02-03', '2018-09-14', NULL),
(2, 'Juan', 'Diego', 'Moreno', 'Marroquin', 1234644360, NULL, 3138087186, 'Av siempre viva 25-36', 'faltron@misena.edu.co', '1999-05-24', '2018-09-14', NULL),
(4, 'Carlos', 'Andres', 'Ramirez', 'Ramirez', 741852963, 4561233625, 32165658744, 'Calle 34 Numero 23 a', 'prueba2@gmail.com', '1989-05-14', '2018-10-16', NULL),
(6, 'Carlos', 'Andres', 'Ramirez', 'Ramirez', 2147483647, 3213, 32165658744, 'Calle 34 Numero 23 a', 'prueba2@gmail.com', '1989-05-14', '2018-10-23', NULL),
(9, 'Carlos', 'Andres', 'Ramirez', 'Ramirez', 741873, NULL, 32165658744, 'Calle 34 Numero 23 a', 'prueba2@gmail.com', '1989-05-14', '2018-10-23', '2018-10-24'),
(10, 'LUZ ', 'NIDIA ', 'LONDOÑO ', 'TAMAYO ', 1745963251, NULL, 318185957, 'qweert', 'werwer', '1986-11-20', '2018-11-20', NULL),
(11, 'FERDINAN ', '', 'YATE ', 'CASTAÑO', 1478965, NULL, 122457, 'khjkhjk', 'hjkhjkhjk', '1975-08-08', '2018-11-20', NULL),
(12, 'ANA ', 'SOFIA ', 'RAMOS ', 'ALVAREZ', 85274193, NULL, 786453, 'utyutyur', 'rurtyrtyrfg', '1990-08-01', '2018-11-20', NULL),
(13, 'MARGARITA', '', 'LOZANO DE ', 'TORRES', 984651327, NULL, 3215545, 'erterterg', 'dfgdfgdrtet', '1974-02-05', '2018-11-22', NULL),
(14, 'JORGE', '', ' ELIECER ', ' MARTINEZ ', 753654159, NULL, 987654, 'wertwertertwer', 'westertwertwert', '1977-11-11', '2018-11-22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demandas`
--

CREATE TABLE `demandas` (
  `Id` int(11) NOT NULL,
  `Clientes_id` int(11) NOT NULL,
  `NumDemanda` varchar(50) NOT NULL,
  `TiposDemandas_id` int(11) NOT NULL,
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

INSERT INTO `demandas` (`Id`, `Clientes_id`, `NumDemanda`, `TiposDemandas_id`, `Titular_id`, `Suplente_id`, `Demandado`, `Descripcion`, `EstadosProcesos_id`, `Categoria`, `FechaCreacion`) VALUES
(4, 10, '73001333300120160026900', 2, 3, 1, 'MUNICIPIO DE IBAGUE', 'serterdfg', 2, 1, '2018-11-20'),
(5, 11, '73001333300120170040700', 1, 9, 5, 'LA NACION- MINISTERIO DE EDUCACION', 'gdfgdfbfbdfdgdfgd', 1, 1, '2018-11-20'),
(6, 12, '73001333300120180005500', 2, 10, 1, 'NACION- MINISTERIO DE EDUCACION NACIONAL', 'dgdfgdfgdfgdfgdfg', 1, 1, '2018-11-20'),
(7, 13, '73001333300120160003800', 2, 4, 8, 'UNIDAD DE GESTION PENSIONAL Y PARAFISCALES', 'sdfgsdfgsdfgdfgdfbbdfbdfbdfbdf', 1, 1, '2018-11-22'),
(8, 14, '76001333301320130005700', 1, 10, 4, 'INSTITUTO NACIONAL PENITENCIARIO Y CARCELARIO', 'sdsdfwefwefwef', 2, 1, '2018-11-22');

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

INSERT INTO `empleados` (`Id`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Documento`, `Especialidad`, `Estados`, `FechaNacimiento`, `Cargos_id`, `Titular`, `Direccion`, `Correo`, `Celular`, `Telefono`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Juan', 'Carlos', 'Bustos', 'Tobio', 123456789, 1, 'Activo', '1999-05-24', 3, 1, 'asdasdas', 'aasdasdasd@hotmail.com', 3138185957, 235698, '2018-09-14', NULL),
(2, 'Juan', 'Esteban ', 'Parra', 'Ducuara', 987654321, 3, 'Activo', '1999-05-18', 4, 1, 'qwqweqweqwe', 'qweqweqweqwe@hotmail.com', 3138185957, 235698, '2018-09-14', NULL),
(3, 'Prueba2', 'prueba2', '', '', 159753, 1, 'Activo', '1999-05-24', 1, 1, 'prueba2', 'prueba2', 321654, 321654, '2018-10-03', NULL),
(4, 'P', 'pr', 'p', 'pr', 333333333, 1, 'Activo', '1999-05-24', 1, 1, 'pr', 'pru', 321654, 321654, '2018-11-15', NULL),
(5, 'Juricol', 'Juricol', 'Juricol', 'Juricol', 2147483647, 1, 'Activo', '1987-02-12', 1, 1, 'Calle 2 tres 23 ', 'juricol@hotmail.com', 3213654986, 20352147, '2018-11-15', NULL),
(8, 'Juricol', 'Juricol', 'Juricol', 'Juricol', 787545, 1, 'Activo', '1987-02-12', 1, 1, 'Calle 2 tres 23 ', 'juricol@hotmail.com', 3213654986, 20352147, '2018-11-19', NULL),
(9, 'Juricol', 'Juricol', 'Juricol', 'Juricol', 71151196, 1, 'Activo', '1987-02-12', 1, 1, 'Calle 2 tres 23 ', 'juricol@hotmail.com', 3213654986, 20352147, '2018-11-19', NULL),
(10, 'Juricol', 'Juricol', 'Juricol', 'Juricol', 1234644310, 1, 'Activo', '1987-02-12', 1, 1, 'Calle 2 tres 23 ', 'juricol@hotmail.com', 3213654986, 20352147, '2018-11-19', NULL),
(11, 'Juricol', 'Juricol', 'Juricol', 'Juricol', 87563214, 1, 'Activo', '1987-02-12', 1, 1, 'Calle 2 tres 23 ', 'juricol@hotmail.com', 3213654986, 20352147, '2018-11-20', NULL),
(12, 'Juricol', 'Juricol', 'Juricol', 'Juricol', 87, 1, 'Activo', '1987-02-12', 1, 1, 'Calle 2 tres 23 ', 'juricol@hotmail.com', 3213654986, 20352147, '2018-11-20', NULL);

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
(1, 'Penal', '2018-09-14'),
(2, 'Civil', '2018-09-14'),
(3, 'Administrativo', '2018-09-14'),
(4, 'Familia', '2018-09-14'),
(5, 'Economico', '2018-09-14');

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
(5, 'Agotamiento', '2018-11-20', 90, 'Fase'),
(6, 'Procuraduria', '2018-11-20', 120, 'Fase'),
(7, 'Aprueba Costas', '2018-11-20', 3, 'EstadoElectronico'),
(8, 'Auto obedézcase y cúmplase', '2018-11-20', 8, 'EstadoElectronico'),
(9, 'Inadmite Demanda', '2018-11-20', 15, 'EstadoElectronico'),
(10, 'Rechaza Demanda', '2018-11-20', 3, 'EstadoElectronico'),
(11, 'Admite Demanda', '2018-11-20', 15, 'EstadoElectronico'),
(12, 'Auto Resuelve Reposición', '2018-11-20', 20, 'EstadoElectronico'),
(13, 'Auto reconoce personería', '2018-11-20', 6, 'EstadoElectronico'),
(14, 'Auto ordena oficiar', '2018-11-20', 8, 'EstadoElectronico'),
(15, 'Auto fija fecha audiencia y/o diligencia', '2018-11-22', 54, 'EstadoElectronico');

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
(1, 'Estado 1', '0000-00-00'),
(2, 'Estado 2', '0000-00-00');

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
-- Estructura de tabla para la tabla `semaforo`
--

CREATE TABLE `semaforo` (
  `Id` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `DiasColorAdvertencia` varchar(20) NOT NULL,
  `DiasColorPeligro` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Penal', '2018-10-03'),
(2, 'Administrativo', '2018-10-03'),
(3, 'Civil', '2018-10-03');

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
(1, 123456789, '987654321', 1, '2018-09-12', NULL);

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
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Documento` (`Documento`);

--
-- Indices de la tabla `demandas`
--
ALTER TABLE `demandas`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `NumDemanda_2` (`NumDemanda`),
  ADD KEY `demandas_ibfk_3` (`TiposDemandas_id`),
  ADD KEY `demandas_ibfk_4` (`Titular_id`),
  ADD KEY `demandas_ibfk_5` (`Suplente_id`),
  ADD KEY `demandas_ibfk_7` (`EstadosProcesos_id`),
  ADD KEY `demandas_ibfk_8` (`Clientes_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Documento` (`Documento`),
  ADD KEY `empleados_ibfk_1` (`Cargos_id`),
  ADD KEY `empleados_ibfk_2` (`Especialidad`);

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
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `movimientos_ibfk_1` (`Demandas_id`),
  ADD KEY `movimientos_ibfk_2` (`EstadosDemandas_id`);

--
-- Indices de la tabla `semaforo`
--
ALTER TABLE `semaforo`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tiposdemandas`
--
ALTER TABLE `tiposdemandas`
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `demandas`
--
ALTER TABLE `demandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estadosdemandas`
--
ALTER TABLE `estadosdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estadosprocesos`
--
ALTER TABLE `estadosprocesos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `semaforo`
--
ALTER TABLE `semaforo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdemandas`
--
ALTER TABLE `tiposdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `auditorias_ibfk_1` FOREIGN KEY (`Usuarios_id`) REFERENCES `usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `demandas`
--
ALTER TABLE `demandas`
  ADD CONSTRAINT `demandas_ibfk_3` FOREIGN KEY (`TiposDemandas_id`) REFERENCES `tiposdemandas` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_4` FOREIGN KEY (`Titular_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_5` FOREIGN KEY (`Suplente_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_7` FOREIGN KEY (`EstadosProcesos_id`) REFERENCES `estadosprocesos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `demandas_ibfk_8` FOREIGN KEY (`Clientes_id`) REFERENCES `clientes` (`Id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Cargos_id`) REFERENCES `cargos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`Especialidad`) REFERENCES `especialidades` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
