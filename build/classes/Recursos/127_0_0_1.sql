

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `curso_inventario`
--
CREATE DATABASE IF NOT EXISTS `curso_inventario` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `curso_inventario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `rnc` varchar(30) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `persona_id`, `rnc`, `fecha`, `usuario_id`, `visible`) VALUES
(1, 1, 'Cliente1', '2017-07-11 11:39:40', 4, 1),
(2, 2, 'rncCliente2', '2017-07-11 11:40:15', 4, 1),
(3, 3, 'cliente3@cliente.com', '2017-07-11 13:12:02', 4, 1),
(4, 4, 'nue', '2017-07-11 16:21:17', 4, 1),
(5, 5, '2233244434', '2017-07-14 00:52:03', 4, 1),
(6, 6, 'albert', '2017-07-14 11:00:44', 4, 1),
(7, 7, 'prueba', '2017-07-14 11:16:06', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_producto`
--

CREATE TABLE `compra_producto` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `precio_compra` decimal(20,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra_producto`
--

INSERT INTO `compra_producto` (`id`, `producto_id`, `proveedor_id`, `fecha`, `usuario_id`, `precio_compra`, `cantidad`, `visible`) VALUES
(1, 3, 2, '2017-07-16 18:15:39', 4, '12.00', 4, 0),
(2, 6, 4, '2017-07-18 05:09:18', 4, '122.00', 3, 1),
(3, 2, 1, '2017-07-18 05:35:15', 4, '10.00', 5, 1),
(4, 2, 1, '2017-07-18 05:46:16', 4, '12.00', 3, 1),
(5, 2, 1, '2017-07-18 05:52:45', 4, '300.00', 5, 1),
(6, 2, 1, '2017-07-18 05:57:38', 4, '500.00', 3, 0),
(7, 3, 3, '2017-07-18 06:05:31', 4, '800.00', 10, 1),
(8, 5, 6, '2017-07-18 06:19:39', 4, '800.00', 40, 1),
(9, 2, 1, '2017-07-18 12:20:11', 4, '1000.00', 30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `ncf` varchar(60) DEFAULT NULL,
  `tiene_ncf` tinyint(1) DEFAULT '0',
  `sub_total` decimal(20,2) DEFAULT NULL,
  `monto_itbis` decimal(20,2) DEFAULT NULL,
  `monto_apagar` decimal(20,2) DEFAULT NULL,
  `estado` enum('pendiente','pagada','cancelada') DEFAULT NULL,
  `cuadrada` tinyint(1) DEFAULT '0',
  `usuario_id_cuadre` int(11) DEFAULT NULL,
  `usuario_id_cancelado` int(11) DEFAULT NULL,
  `motivo_cancelado` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE `factura_detalle` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `precio` decimal(20,2) DEFAULT NULL,
  `monto` decimal(20,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `factura_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generador_ncf`
--

CREATE TABLE `generador_ncf` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `finalizo` tinyint(1) DEFAULT '0',
  `letra_serie_ncf_inicio` char(5) DEFAULT NULL,
  `letra_serie_ncf_fin` char(5) DEFAULT NULL,
  `division_negocio_ncf_inicio` int(3) DEFAULT NULL,
  `punto_emision_ncf_inicio` int(4) DEFAULT NULL,
  `area_impresion_ncf_inicio` int(4) DEFAULT NULL,
  `tipo_comprobante_fiscal_ncf_inicio` int(3) DEFAULT NULL,
  `secuencial_ncf_inicio` bigint(4) DEFAULT NULL,
  `division_negocio_ncf_fin` int(3) DEFAULT NULL,
  `punto_emision_ncf_fin` int(4) DEFAULT NULL,
  `area_impresion_ncf_fin` int(4) DEFAULT NULL,
  `tipo_comprobante_fiscal_ncf_fin` int(3) DEFAULT NULL,
  `secuencial_ncf_fin` bigint(4) DEFAULT NULL,
  `actual_secuencial_ncf` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) DEFAULT '',
  `apellido` varchar(70) DEFAULT '',
  `cedula` varchar(25) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `cedula`, `fecha`, `usuario_id`, `visible`) VALUES
(1, 'Cliente1', 'Cliente1', 'Cliente1', '2017-07-11 11:39:40', 4, 1),
(2, 'NombreCliente2', 'ApellidoCliente2', 'CedulaCliente2', '2017-07-11 11:40:15', 4, 1),
(3, 'cliente3@cliente.com', 'cliente3@cliente.com', 'cliente3@cliente.com', '2017-07-11 13:12:02', 4, 1),
(4, 'nue', 'nue', 'nue', '2017-07-11 16:21:17', 4, 1),
(5, 'eudy', 'arias', '2333324553', '2017-07-14 00:52:03', 4, 1),
(6, 'albert', 'albert', 'albert', '2017-07-14 11:00:44', 4, 1),
(7, 'prueba', 'prueba Apellido', 'prueba', '2017-07-14 11:16:06', 4, 1),
(8, 'proveedor', 'proveedor', 'proveedor', '2017-07-15 14:47:22', 4, 1),
(9, 'proveedor', 'proveedor', 'proveedor1', '2017-07-15 14:50:26', 4, 1),
(10, 'nuevo', 'nuevo', 'nuevo', '2017-07-15 23:02:07', 4, 1),
(11, 'proveedor2', 'proveedor2', 'proveedor2', '2017-07-16 10:19:42', 4, 1),
(12, 'proveedor3', 'proveedor3', 'proveedor3', '2017-07-16 10:40:49', 4, 1),
(13, 'proveedor4', 'proveedor4', 'proveedor4', '2017-07-16 11:14:14', 4, 1),
(14, 'juan', 'ramirez', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_direccion`
--

CREATE TABLE `persona_direccion` (
  `id` int(11) NOT NULL,
  `direccion` text,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `persona_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona_direccion`
--

INSERT INTO `persona_direccion` (`id`, `direccion`, `fecha`, `usuario_id`, `visible`, `persona_id`) VALUES
(1, 'direccion prueba', '2017-07-12 17:51:51', 4, 1, 4),
(2, 'nueva', '2017-07-12 19:45:46', 4, 1, 4),
(3, 'direcc22', '2017-07-14 00:52:03', 4, 1, 5),
(4, 'albert direccion1', '2017-07-14 11:00:45', 4, 1, 6),
(5, 'albert direccion2', '2017-07-14 11:00:45', 4, 1, 6),
(6, 'prueba direccion1', '2017-07-14 11:16:06', 4, 0, 7),
(7, 'prueba direccion ffffffff', '2017-07-14 11:16:06', 4, 1, 7),
(8, 'prueba direccion3', '2017-07-14 11:16:06', 4, 1, 7),
(9, 'proveedor proveedor', '2017-07-15 14:47:22', 4, 1, 8),
(10, 'proveedorproveedorproveedorproveedorproveedor', '2017-07-15 14:47:22', 4, 1, 8),
(11, 'proveedorproveedorproveedorproveedorproveedorproveedorproveedorproveedorproveedor', '2017-07-15 14:47:22', 4, 1, 8),
(12, 'proveedor', '2017-07-15 14:50:26', 4, 1, 9),
(13, 'proveedor proveedor', '2017-07-15 14:50:26', 4, 1, 9),
(14, 'nuevo', '2017-07-15 23:02:07', 4, 1, 10),
(15, 'proveedor2.co do', '2017-07-16 10:19:43', 4, 1, 11),
(16, 'proveedor2 con', '2017-07-16 10:19:43', 4, 1, 11),
(17, 'direccion1', '2017-07-16 10:40:49', 4, 1, 12),
(18, 'direccion2', '2017-07-16 10:40:49', 4, 1, 12),
(19, 'proveedor4d', '2017-07-16 11:14:14', 4, 1, 13),
(20, 'proveedor4r', '2017-07-16 11:14:14', 4, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_email`
--

CREATE TABLE `persona_email` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `persona_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona_email`
--

INSERT INTO `persona_email` (`id`, `correo`, `fecha`, `usuario_id`, `visible`, `persona_id`) VALUES
(1, 'cliente3@cliente.com', '2017-07-11 13:12:02', 4, 1, 3),
(2, 'cliente3@cliente1.com', '2017-07-11 13:12:02', 4, 0, 3),
(3, 'nosotros@correo.com', '2017-07-11 13:12:02', 4, 1, 3),
(4, 'eudy@correo.com', '2017-07-11 14:07:28', 4, 1, 3),
(5, 'prueba@d.com', '2017-07-11 16:17:41', 4, 1, 3),
(6, 'pro@gm.com', '2017-07-11 16:21:17', 4, 1, 4),
(7, 'nue@inf.com', '2017-07-11 16:21:17', 4, 1, 4),
(8, 'nue23@d.com', '2017-07-11 16:21:17', 4, 1, 4),
(9, 'email1@com1', '2017-07-14 00:52:03', 4, 1, 5),
(10, 'albert@g.vom', '2017-07-14 11:00:44', 4, 1, 6),
(11, 'albert.con@dom.com', '2017-07-14 11:00:45', 4, 1, 6),
(12, 'prueba', '2017-07-14 11:16:06', 4, 0, 7),
(13, 'prueba@', '2017-07-14 11:16:06', 4, 1, 7),
(14, 'proveedor@.vom', '2017-07-15 14:47:22', 4, 1, 8),
(15, 'proveedor@id.com', '2017-07-15 14:47:22', 4, 1, 8),
(16, 'proveedor', '2017-07-15 14:50:26', 4, 1, 9),
(17, 'proveedor1', '2017-07-15 14:50:26', 4, 1, 9),
(18, 'nuevo', '2017-07-15 23:02:07', 4, 1, 10),
(19, 'proveedor2', '2017-07-16 10:19:43', 4, 1, 11),
(20, 'proveedor@co.com', '2017-07-16 10:19:43', 4, 1, 11),
(21, 'emali.com', '2017-07-16 10:40:49', 4, 1, 12),
(22, 'ensicom.comm', '2017-07-16 10:40:49', 4, 1, 12),
(23, 'proveedor4@f.com', '2017-07-16 11:14:14', 4, 1, 13),
(24, 'proveedor40@ac.com', '2017-07-16 11:14:14', 4, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_telefono`
--

CREATE TABLE `persona_telefono` (
  `id` int(11) NOT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `tipo_telefono_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `persona_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona_telefono`
--

INSERT INTO `persona_telefono` (`id`, `telefono`, `tipo_telefono_id`, `fecha`, `usuario_id`, `visible`, `persona_id`) VALUES
(1, '9999999999', 1, '2017-07-13 22:49:58', 4, 0, 4),
(2, '111111111', 1, '2017-07-13 23:06:50', 4, 1, 4),
(3, '33333333', 2, '2017-07-13 23:08:27', 4, 1, 4),
(4, '5555', 4, '2017-07-13 23:19:17', 4, 1, 4),
(5, '2222222', 1, '2017-07-13 23:27:17', 4, 1, 4),
(6, '00000000', 3, '2017-07-13 23:29:43', 4, 0, 4),
(7, '4444444444', 4, '2017-07-13 23:30:09', 4, 1, 4),
(8, '222223', 2, '2017-07-13 23:30:24', 4, 1, 4),
(9, '44444455555', 3, '2017-07-13 23:30:39', 4, 0, 4),
(10, '1222333444555', 4, '2017-07-13 23:30:52', 4, 1, 4),
(11, '1111111', 0, '2017-07-14 00:52:03', 4, 1, 5),
(12, '1111111111', 1, '2017-07-14 11:00:45', 4, 1, 6),
(13, '222222222', 2, '2017-07-14 11:00:45', 4, 1, 6),
(14, '333333333', 3, '2017-07-14 11:00:45', 4, 1, 6),
(15, 'prueba telefono1', 1, '2017-07-14 11:16:06', 4, 0, 7),
(16, '33333333333', 2, '2017-07-14 11:16:06', 4, 1, 7),
(17, '11111111111111', 3, '2017-07-14 11:16:06', 4, 1, 7),
(18, 'prueba telefono4', 4, '2017-07-14 11:18:10', 4, 1, 7),
(19, '11111122222', 8, '2017-07-15 13:53:09', 4, 1, 7),
(20, 'proveedor', 1, '2017-07-15 14:47:22', 4, 1, 8),
(21, 'proveedor', 2, '2017-07-15 14:47:23', 4, 1, 8),
(22, 'proveedor', 3, '2017-07-15 14:47:23', 4, 1, 8),
(23, 'proveedor', 9, '2017-07-15 14:47:23', 4, 1, 8),
(24, '9999999999', 1, '2017-07-15 14:50:27', 4, 1, 9),
(25, 'proveedor2', 10, '2017-07-15 14:50:27', 4, 0, 9),
(26, '3333333', 6, '2017-07-15 14:50:27', 4, 1, 9),
(27, 'nuevo', 4, '2017-07-15 23:02:07', 4, 1, 10),
(28, '00000000', 6, '2017-07-15 23:04:07', 4, 1, 5),
(29, '1111111', 1, '2017-07-16 10:19:43', 4, 1, 11),
(30, '22222222', 1, '2017-07-16 10:19:43', 4, 1, 11),
(31, '22222222', 12, '2017-07-16 10:40:49', 4, 1, 12),
(32, '111111111', 8, '2017-07-16 10:40:49', 4, 1, 12),
(33, '111111111', 3, '2017-07-16 11:14:14', 4, 1, 13),
(34, '2222222', 4, '2017-07-16 11:14:14', 4, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(190) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `precio` decimal(20,2) DEFAULT '0.00',
  `cantidad_almacen` int(11) DEFAULT '0',
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `fecha`, `usuario_id`, `precio`, `cantidad_almacen`, `visible`) VALUES
(1, 'producto12', '2017-07-15 21:15:49', 4, '80.00', 0, 0),
(2, 'prueba', '2017-07-15 21:42:44', 4, '233.00', 30, 1),
(3, 'producto1', '2017-07-16 09:59:43', 4, '1900.00', 6, 1),
(5, 'producto2', '2017-07-16 10:09:54', 4, '100.00', 40, 1),
(6, 'producto3', '2017-07-16 10:15:28', 4, '11.50', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `rnc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `persona_id`, `fecha`, `usuario_id`, `visible`, `rnc`) VALUES
(1, 8, '2017-07-15 14:47:22', 4, 1, 'proveedor'),
(2, 9, '2017-07-15 14:50:26', 4, 1, 'proveedor1'),
(3, 10, '2017-07-15 23:02:07', 4, 1, 'nuevo'),
(4, 11, '2017-07-16 10:19:43', 4, 1, 'proveedor2'),
(5, 12, '2017-07-16 10:40:49', 4, 1, 'proveedor3'),
(6, 13, '2017-07-16 11:14:14', 4, 1, 'proveedor4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefono`
--

CREATE TABLE `tipo_telefono` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_telefono`
--

INSERT INTO `tipo_telefono` (`id`, `nombre`, `fecha`, `usuario_id`, `visible`) VALUES
(1, 'casa', '2017-07-09 15:26:05', 1, 1),
(2, 'celular', '2017-07-09 15:26:05', 1, 1),
(3, 'trabajo', '2017-07-09 15:26:05', 1, 1),
(4, 'whatsapp', '2017-07-09 15:26:05', 1, 1),
(5, 'padre', '2017-07-14 21:09:48', 4, 0),
(6, 'Empresa', '2017-07-14 21:53:29', 4, 1),
(7, 'prueba1', '2017-07-14 21:58:04', 4, 1),
(8, 'prueba2', '2017-07-15 13:52:45', 4, 1),
(9, 'proveedor', '2017-07-15 14:47:02', 4, 1),
(10, 'proveedor1', '2017-07-15 14:48:08', 4, 1),
(11, 'tipo telefono 1', '2017-07-16 10:16:09', 4, 1),
(12, 'telefono2', '2017-07-16 10:39:31', 4, 1),
(13, 'abuela', '2017-07-17 20:14:32', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `clave` varchar(150) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `tipo` enum('cajero','administrador','supervisor') DEFAULT 'cajero',
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `clave`, `fecha`, `usuario_id`, `tipo`, `visible`) VALUES
(1, 'eudy', 'prueba', NULL, NULL, 'cajero', 1),
(2, 'cajero', 'cajero1', '2017-07-10 15:40:25', 0, 'cajero', 1),
(3, 'supervisor', 'supervisor', '2017-07-10 15:40:39', 1, 'supervisor', 1),
(4, 'administrador', 'administrador', '2017-07-10 15:42:33', 1, 'administrador', 1),
(5, 'prueba', 'prueba1', '2017-07-10 15:52:59', 1, 'cajero', 0),
(6, 'alberto', 'ejemplo1', '2017-07-10 18:04:34', 1, 'administrador', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generador_ncf`
--
ALTER TABLE `generador_ncf`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `persona_direccion`
--
ALTER TABLE `persona_direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona_email`
--
ALTER TABLE `persona_email`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona_telefono`
--
ALTER TABLE `persona_telefono`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_telefono`
--
ALTER TABLE `tipo_telefono`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `factura_detalle`
--
ALTER TABLE `factura_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `generador_ncf`
--
ALTER TABLE `generador_ncf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `persona_direccion`
--
ALTER TABLE `persona_direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `persona_email`
--
ALTER TABLE `persona_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `persona_telefono`
--
ALTER TABLE `persona_telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tipo_telefono`
--
ALTER TABLE `tipo_telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
