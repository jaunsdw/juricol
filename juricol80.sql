-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2018 a las 14:03:31
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
  `FechaCreacion` date NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`Id`, `Descripcion`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Encargado de area penal', '2018-11-27', NULL),
(2, 'Recepcionista', '2018-11-27', NULL),
(3, 'Encargado del area civill', '2018-11-27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(35) NOT NULL,
  `Departamentos_id` int(11) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`Id`, `Descripcion`, `Departamentos_id`, `FechaInhabilitacion`) VALUES
(1, 'Ibague', 1, NULL),
(2, 'Espinal', 1, NULL),
(3, 'Chaparrall', 1, NULL);

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
  `Estado` enum('Activo','Inactivo') NOT NULL,
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

INSERT INTO `clientes` (`Id`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Documento`, `Telefono`, `Celular`, `Direccion`, `Estado`, `Correo`, `FechaNacimiento`, `FechaCreacion`, `FechaInhabilitacion`, `TipoDocumento_id`, `CiudadResidencia_id`, `InstitucionLaboral_id`, `NombreSustituto`, `CelularSustituto`, `CorreoSustituto`, `TipoDocumentoSustituto_id`, `DocumentoSustituto`, `Parentesco_id`) VALUES
(2, 'LUZ', 'NIDIA', 'LONDOÃ‘O', 'TAMAYO', 11105232021, 3122546, 235465777, 'Av siempre viva', 'Activo', 'Yo@gmail.com', '1988-05-05', '2018-11-27', NULL, 1, 1, 1, 'Maria Paula MariÃ±o', 3216546844, 'yo@gmail.com', 1, 2156546874, 3),
(3, 'FERDINAN', '', 'YATE', 'CASTAÃ‘O', 8475623198, 3126, 23547, 'Apre viva', 'Activo', 'Yodf@gmail.com', '1988-08-08', '2018-11-27', NULL, 1, 1, 2, 'Maria Paula MariÃ±o', 3216546844, 'yo@gmail.com', 1, 2987446874, 3),
(4, 'ANA', 'SOFIA', 'RAMOS', 'ALVAREZ', 8888888, NULL, 2358777, 'Apre vivaaaaaaaaa', 'Activo', 'Yodssssssf@gmail.com', '1987-06-07', '2018-11-27', NULL, 1, 1, 2, 'Maria Paula MariÃ±o', 3246844, 'yoss@gmail.com', 1, 29888874, 4),
(5, 'FABIAN ', 'CAMILO', 'MARTINEZ', 'AMOROCHO', 132456789, 232165464, 31232154, 'sfdfgdfgdfgdf', 'Activo', 'rtertertert', '2018-12-03', '2018-12-27', NULL, 1, 3, 1, 'sdfsdfdsf', 43456456, 'dsdfsdfsdf', 1, 7887789, 4),
(6, 'KEVIN', 'JULIAN', 'BONILLA', 'PEREZ', 65787844, 32132132, 231313213, 'kjsdhkfjhskdjfksd', 'Activo', 'sdfsdfsdfsdfsdfsdf', '1990-02-26', '2018-12-02', NULL, 1, 1, 3, 'ghjgjgjhgjhgyy', 56654654, 'jhgjhgjhgjh', 2, 8897989, 2),
(7, 'STEFANNY', 'ALEJANDRA ', 'VARGAS', 'ORTEGA', 88979844, 321315, 654841, 'LKMLKOOIPEPK', 'Activo', 'JKHKJHKJHKJ', '1987-06-27', '2018-12-02', NULL, 1, 1, 3, 'DFGDFGDFG', 654651511, 'SDSDFDSFSDF', 1, 646565454, 4),
(8, 'DAVOR', 'JAVIER', 'CORTEZ', 'CASTRO', 87984456, 212221, 3213232, 'JLHFUWHHWHH', 'Activo', 'DSFSDFEEEWEFF', '1976-04-25', '2018-12-02', NULL, 1, 2, 2, 'DRERGERGERGERGERGEGR', 321321344, 'SDSDFSDFSDF', 1, 654654652111, 4),
(9, 'SARA ', 'SOFIA', 'CASTRO', 'BRINES', 6565484, 3113211, 1233221, 'fgfghfhftt', 'Activo', 'dfgdfdfgdffbbb', '1970-10-16', '2018-12-02', NULL, 1, 3, 2, 'dfghfghfgh', 778786786, 'ghfghfhfghfgh', 1, 786786, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demandas`
--

CREATE TABLE `demandas` (
  `Id` int(11) NOT NULL,
  `Clientes_id` int(11) NOT NULL,
  `NumDemanda` varchar(50) DEFAULT NULL,
  `TiposDemandas_id` int(11) NOT NULL,
  `TiposProcesos_id` int(11) NOT NULL,
  `Juzgado_id` int(11) DEFAULT NULL,
  `Titular_id` int(11) NOT NULL,
  `Suplente_id` int(11) NOT NULL,
  `Demandado` varchar(255) NOT NULL,
  `Descripcion` varchar(80) NOT NULL,
  `EstadosProcesos_id` int(11) NOT NULL,
  `Categoria` tinyint(1) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `Finalizada` tinyint(1) NOT NULL,
  `Observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `demandas`
--

INSERT INTO `demandas` (`Id`, `Clientes_id`, `NumDemanda`, `TiposDemandas_id`, `TiposProcesos_id`, `Juzgado_id`, `Titular_id`, `Suplente_id`, `Demandado`, `Descripcion`, `EstadosProcesos_id`, `Categoria`, `FechaCreacion`, `Finalizada`, `Observacion`) VALUES
(2, 2, '73001333300120160026900', 4, 4, 1, 1, 2, 'MUNICIPIO DE IBAGUE', 'ASDEDEFWEWEFEVV', 1, 1, '2018-11-28', 0, ''),
(3, 3, '73001333300120170040700', 5, 3, 1, 1, 2, 'LA NACION- MINISTERIO DE EDUCACION- MINISTERIO DE IBAGUE- FONDO NACIONAL DE PRESTACIONES SOCIALES DE', 'ASDEDEFWEWEFEVV', 1, 1, '2018-11-28', 0, ''),
(4, 4, '73001333300120180005500', 5, 3, 1, 1, 3, 'NACION- MINISTERIO DE EDUCACION NACIONAL', 'eerergertttert', 1, 1, '2018-11-28', 0, ''),
(5, 4, '730899885555565660003800', 4, 4, 1, 1, 3, 'jljljlkjkjlhljhkj', 'uoiuouououoiuoiuououi', 4, 1, '2018-12-02', 0, ''),
(6, 5, '73001333999999999999700', 2, 3, 1, 1, 2, 'lklklkjljlkjlk', 'ppoipipoihhhhjhjhj', 4, 0, '2018-12-02', 0, ''),
(7, 6, '730013338888888888888800', 4, 1, 3, 1, 3, 'uyguguyguyguygu', 'joijoijoijojioi', 1, 0, '2018-12-02', 0, ''),
(8, 6, '7600133333333333333330', 5, 4, 2, 1, 2, 'gigiuiuhiuhn', 'uiuiuiuihhh', 1, 0, '2018-12-02', 0, ''),
(9, 7, '7300133777777777777777700', 3, 1, 3, 1, 3, 'ertertertertreter', 'erterterterterter', 2, 1, '2018-12-02', 0, ''),
(10, 8, '700025698452164644444444444', 2, 4, 1, 1, 3, 'jkjhkjsdkjsdhfkjhsdkfjhskdjfhk', 'sdhsdhsdhjdsdhjdshjhskdjhfkjsdfkj', 1, 1, '2018-12-02', 0, ''),
(11, 8, '73001336666666666666700', 3, 3, 2, 1, 3, 'jkhkjkjhkjhkhkhkhjkjhkyiyiuyiy', 'iouoiuoiuoiuouiuoioiiuiouoiuoi', 1, 0, '2018-12-02', 0, ''),
(12, 9, '730015555555555555555550', 4, 2, 2, 1, 2, 'kjhkjhkuiutetre', 'fsdfsdfsdfsdfsdfsd', 1, 1, '2018-12-02', 1, 'cvxcvxcvxcvxcvxcvxcvxcvxcvxvxcvxcvxcvxc'),
(13, 9, '76001333333333333333308877', 2, 1, 1, 1, 3, 'hfhgfghfgh', 'fghfghfgfh', 1, 1, '2018-12-02', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(35) NOT NULL,
  `Paises_id` int(11) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`Id`, `Descripcion`, `Paises_id`, `FechaInhabilitacion`) VALUES
(1, 'Tolima', 1, NULL),
(3, 'Cundinamarca', 1, NULL),
(4, 'Antioquia', 1, NULL);

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
  `Documento` bigint(15) NOT NULL,
  `TipoDocumento_id` int(11) NOT NULL,
  `TarjetaProfesional` bigint(20) NOT NULL,
  `Especialidad` int(11) NOT NULL,
  `Estados` enum('Activo','Desactivo') NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Cargos_id` int(11) NOT NULL,
  `Titular` tinyint(1) NOT NULL,
  `CiudadResidencia_id` int(11) NOT NULL,
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

INSERT INTO `empleados` (`Id`, `PrimerNombre`, `SegundoNombre`, `PrimerApellido`, `SegundoApellido`, `Documento`, `TipoDocumento_id`, `TarjetaProfesional`, `Especialidad`, `Estados`, `FechaNacimiento`, `Cargos_id`, `Titular`, `CiudadResidencia_id`, `Direccion`, `Correo`, `Celular`, `Telefono`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Edwin', 'Fernando', 'LondoÃ±o', 'Jaramillo', 98745562, 1, 9874556255, 1, 'Activo', '1987-06-07', 1, 1, 1, 'Apre vivaaaaaaaaa', 'Yodssssssf@gmail.com', 2358777, NULL, '2018-11-28', NULL),
(2, 'Juan', 'Carlos', 'Bustos', 'Tobio', 100740786, 1, 9871441155, 2, 'Activo', '1990-07-02', 2, 0, 1, 'Apre mmaaaaaa', 'Yodssssssf@gmail.com', 239877, NULL, '2018-11-28', NULL),
(3, 'sdffdgdfg', 'dsfgdfg', 'dsfgdfg', 'dsfgdfsgdf', 9879845, 1, 9898794654654, 1, 'Activo', '0000-00-00', 3, 0, 1, 'sdfsdfsdf', 'sdfsdfsdf', 9898, 98798, '2018-11-27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`Id`, `Descripcion`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Juridico', '2018-11-27', NULL),
(2, 'Penal', '2018-11-27', NULL),
(3, 'Familiaa', '2018-11-27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosdemandas`
--

CREATE TABLE `estadosdemandas` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `DiasLimite` smallint(6) NOT NULL,
  `Tipo` enum('Fase','EstadoElectronico') NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadosdemandas`
--

INSERT INTO `estadosdemandas` (`Id`, `Descripcion`, `FechaCreacion`, `DiasLimite`, `Tipo`, `FechaInhabilitacion`) VALUES
(5, 'Auto ordena oficiar', '2018-11-28', 5, 'EstadoElectronico', NULL),
(12, 'Admite Demanda', '2018-11-28', 5, 'EstadoElectronico', NULL),
(13, 'Agotamiento', '2018-11-29', 90, 'Fase', NULL),
(14, 'Procuraduria', '2018-11-29', 120, 'Fase', NULL),
(15, 'Auto Resuelve ReposiciÃ³n', '2018-11-29', 13, 'EstadoElectronico', NULL),
(16, 'Auto reconoce personerÃ­a', '2018-11-29', 13, 'EstadoElectronico', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosprocesos`
--

CREATE TABLE `estadosprocesos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadosprocesos`
--

INSERT INTO `estadosprocesos` (`Id`, `Descripcion`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(1, 'Admitida', '2018-11-27', NULL),
(2, 'Rechazada', '2018-11-27', NULL),
(3, 'Inactivaa', '2018-11-27', NULL),
(4, 'Activa', '2018-11-28', NULL),
(5, 'Finalizada', '2018-12-01', '2018-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucionlaboral`
--

CREATE TABLE `institucionlaboral` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  `CiudadResidencia_id` int(11) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucionlaboral`
--

INSERT INTO `institucionlaboral` (`Id`, `Descripcion`, `CiudadResidencia_id`, `FechaInhabilitacion`) VALUES
(1, 'Colegio Anita', 1, NULL),
(2, 'Colegio Fatima', 2, NULL),
(3, 'Colegio Sagrada Familia', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgados`
--

CREATE TABLE `juzgados` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juzgados`
--

INSERT INTO `juzgados` (`Id`, `Descripcion`, `FechaInhabilitacion`) VALUES
(1, '01 administrativo de ibague', NULL),
(2, '02 administrativo de ibague', NULL),
(3, '07 administrativo de ibague', NULL);

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

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`Id`, `Demandas_id`, `EstadosDemandas_id`, `FechaMovimiento`, `Descripcion`, `FechaLimite`) VALUES
(1, 2, 13, '2017-10-10', 'tythtyhtyhtyhtyh', '2017-10-25'),
(3, 3, 12, '2018-01-30', 'qerqwerqwe', '2018-02-08'),
(4, 3, 15, '2018-03-14', '', '2018-11-29'),
(5, 4, 15, '2018-04-11', 'xxxfdfgdfgd', '2018-11-29'),
(6, 4, 5, '2018-11-29', '2342345', '2019-02-23'),
(7, 5, 12, '2018-03-12', 'klkjlkjlkjlkjlkjlkj', '2018-12-02'),
(8, 6, 12, '2017-09-05', 'lkjlkjlkjljlkjlkj', '2018-01-03'),
(9, 6, 16, '2018-04-03', 'sfsdfsdf', '2018-05-20'),
(10, 6, 5, '2018-07-12', 'ret4564564', '2018-12-02'),
(11, 7, 12, '2018-10-03', 'dfgdfg', '2018-12-02'),
(12, 8, 16, '2018-09-16', 'uiyiuyiuhhhhuhuh', '2018-10-10'),
(13, 8, 5, '2018-11-05', 'uiuyiuyiuyiuyiu', '2018-12-02'),
(14, 9, 12, '2018-12-02', 'hhgjygyyjygh', '2018-12-17'),
(15, 10, 13, '2018-06-17', 'iuiuhiuhiuhihihiuhiu', '2018-07-20'),
(16, 10, 14, '2018-08-16', 'sdfsdfsdfsdfsfsfsdfsd', '2018-12-02'),
(17, 11, 12, '2018-12-02', 'ertertertertertt', '2018-12-28'),
(18, 12, 13, '2018-12-02', '', '2018-12-29'),
(19, 13, 12, '2017-03-21', 'hgkjhkjhkhkjhkjkyyyh', '2017-05-25'),
(20, 13, 13, '2017-07-20', '56756756rtyrtyrtyrtyrtthhh', '2017-10-25'),
(21, 13, 14, '2018-01-09', 'gfghfghfghfgffghfhfgh', '2018-04-03'),
(22, 13, 16, '2018-05-03', 'gfghfghfyyyrtyry', '2018-06-15'),
(23, 13, 15, '2018-10-10', 'fdfgdfgdg', '2018-12-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(35) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`Id`, `Descripcion`, `FechaInhabilitacion`) VALUES
(1, 'Colombia', NULL),
(2, 'PerÃº', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(15) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parentesco`
--

INSERT INTO `parentesco` (`Id`, `Descripcion`, `FechaInhabilitacion`) VALUES
(2, 'Padre', NULL),
(3, 'Hijo', NULL),
(4, 'conyuge', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoprocesos`
--

CREATE TABLE `tipoprocesos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoprocesos`
--

INSERT INTO `tipoprocesos` (`Id`, `Descripcion`, `FechaInhabilitacion`) VALUES
(1, 'Homologacion', NULL),
(2, 'Sancion cesantias parciales', NULL),
(3, 'Ejecutivo', NULL),
(4, 'Ejecutivo prima de servicioss', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdemandas`
--

CREATE TABLE `tiposdemandas` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdemandas`
--

INSERT INTO `tiposdemandas` (`Id`, `Descripcion`, `FechaCreacion`, `FechaInhabilitacion`) VALUES
(2, 'Civil', '2018-11-27', NULL),
(3, 'Penal', '2018-11-27', NULL),
(4, 'Administrativa', '2018-11-27', NULL),
(5, 'Judicialll', '2018-11-27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumentos`
--

CREATE TABLE `tiposdocumentos` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `FechaInhabilitacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposdocumentos`
--

INSERT INTO `tiposdocumentos` (`Id`, `Descripcion`, `FechaInhabilitacion`) VALUES
(1, 'Cedula de ciudadania', NULL),
(2, 'Extranjeria', NULL),
(3, 'Tarjeta', '2018-12-04'),
(4, 'eeeee', '2018-12-04'),
(5, 'yuyukyukyuk', '2018-12-04'),
(6, 'juujujujujuj', '2018-12-04'),
(7, 'ujujujujujujujj', '2018-12-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposusuarios`
--

CREATE TABLE `tiposusuarios` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposusuarios`
--

INSERT INTO `tiposusuarios` (`Id`, `Descripcion`) VALUES
(3, 'Abogado'),
(1, 'Administrador'),
(2, 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Usuario` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Empleados_id` int(11) DEFAULT NULL,
  `TiposUsuarios_id` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `CodigoAsociado` smallint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Usuario`, `Password`, `Empleados_id`, `TiposUsuarios_id`, `FechaCreacion`, `CodigoAsociado`) VALUES
(1, 123456789, '25f9e794323b453885f5181f1b624d0b', NULL, 1, '2018-11-27', NULL),
(2, 98745562, '987654321', 1, 2, '2018-11-28', NULL);

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
  ADD UNIQUE KEY `NumDemanda` (`NumDemanda`),
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
  ADD KEY `empleados_ibfk_3` (`TipoDocumento_id`),
  ADD KEY `CiudadResidencia_id` (`CiudadResidencia_id`);

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
  ADD KEY `Ciudad_id` (`CiudadResidencia_id`);

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
-- Indices de la tabla `tiposusuarios`
--
ALTER TABLE `tiposusuarios`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Descripcion` (`Descripcion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Usuario` (`Usuario`),
  ADD KEY `usuarios_ibfk_1` (`Empleados_id`),
  ADD KEY `TiposUsuarios_id` (`TiposUsuarios_id`);

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `demandas`
--
ALTER TABLE `demandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estadosdemandas`
--
ALTER TABLE `estadosdemandas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `estadosprocesos`
--
ALTER TABLE `estadosprocesos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tiposusuarios`
--
ALTER TABLE `tiposusuarios`
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
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`TipoDocumento_id`) REFERENCES `tiposdocumentos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`CiudadResidencia_id`) REFERENCES `ciudades` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `institucionlaboral`
--
ALTER TABLE `institucionlaboral`
  ADD CONSTRAINT `institucionlaboral_ibfk_1` FOREIGN KEY (`CiudadResidencia_id`) REFERENCES `ciudades` (`Id`);

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
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Empleados_id`) REFERENCES `empleados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`TiposUsuarios_id`) REFERENCES `tiposusuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
