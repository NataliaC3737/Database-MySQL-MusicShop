-- -----------------------------------------------------
-- CONSULTAS PARA DATOS PERTINENTES
-- -----------------------------------------------------

-- BÚSQUEDA Y SEGUIMIENTO

-- Búsqueda de producto concreto en inventario por código (ejemplo)
SELECT * FROM tienda_musica.producto WHERE idproducto = 'prod_001';

-- Búsqueda de producto concreto en inventario por tipo (ejemplo)
SELECT * FROM tienda_musica.producto WHERE tipo = 'Amplificador de Guitarra';

-- Búsqueda de producto concreto en inventario por marca (ejemplo)
SELECT * FROM tienda_musica.producto WHERE marca = 'VOX';

-- Búsqueda de producto concreto en inventario por modelo (ejemplo)
SELECT * FROM tienda_musica.producto WHERE producto = 'AV30';

-- Seguimiento de los niveles de inventario
SELECT * FROM tienda_musica.producto;

-- Búsqueda de cliente concreto por código (ejemplo)
SELECT * FROM tienda_musica.cliente WHERE idcliente = '51';

-- Búsqueda de cliente concreto por nombre y apellidos (ejemplo)
SELECT * FROM tienda_musica.cliente WHERE nombre = 'Narciso' and apellidos = 'Cortina Macías';

-- Búsqueda de cliente concreto por telefono (ejemplo)
SELECT * FROM tienda_musica.cliente WHERE telefono = '662304149';

-- Seguimiento de clientes
SELECT * FROM tienda_musica.cliente; 

-- NUEVOS REGISTROS 

-- Registro de cliente
INSERT INTO `cliente` (`nombre`,`apellidos`,`telefono`) VALUES ('Fernandita ','Suárez','698239864');
SELECT * FROM tienda_musica.cliente WHERE idcliente = '75'; -- comprobación de dato introducido


-- Registro de producto
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) VALUES ('prod_101','Modelo X',1,'Bajo eléctrico','Yamaha', 1532.65);
SELECT * FROM tienda_musica.producto WHERE idproducto = 'prod_101'; -- comprobación de dato introducido


-- Registro de venta 
INSERT INTO `venta` (`id_cliente`,`fecha_venta`) VALUES (3,'2023-02-02'); -- nota: fecha con formato (aaaa-mm-dd)
SELECT * FROM tienda_musica.venta WHERE idventa = '96';
INSERT INTO `detalle_venta` (`id_producto`,`id_venta`,`cantidad_venta`) VALUES ('prod_003', 96, 5);
SELECT * FROM tienda_musica.detalle_venta WHERE iddetalle_venta = '96';