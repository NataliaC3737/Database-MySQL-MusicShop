-- -----------------------------------------------------
-- CONSULTAS PARA DATOS PERTINENTES
-- -----------------------------------------------------

-- BÚSQUEDAS Y SEGUIMIENTO

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

-- Resgistro de proveedor
INSERT INTO `proveedor` (`idproveedor`,`proveedor`,`correo_electronico`,`telefono`,`direccion`,`ciudad`,`codigo_postal`) 
VALUES ('prov_004','PRUEBA','prueba.contact@gmail.com','925780921','Calle Prueba, 1','Ciudad', 79900);
SELECT * FROM tienda_musica.proveedor WHERE idproveedor = 'prov_004'; -- comprobación de dato introducido

-- Registro de producto
INSERT INTO `producto` (`idproducto`,`producto`,`stock`,`tipo`,`marca`,`precio_producto`) 
VALUES ('prod_101','Modelo X',1,'Bajo eléctrico','Yamaha', 1532.65);
SELECT * FROM tienda_musica.producto WHERE idproducto = 'prod_101'; -- comprobación de dato introducido

-- Registro de compra
INSERT INTO `compra` (`id_proveedor`,`fecha_compra`) VALUES ('prov_001','2023-02-04'); -- nota: fecha con formato (aaaa-mm-dd)
SELECT * FROM tienda_musica.compra WHERE idcompra = '101';
INSERT INTO `detalle_compra` (`id_producto`,`id_compra`,`cantidad_compra`,`precio_compra`) VALUES ('prod_001', 101, 2, 335.91);
SELECT * FROM tienda_musica.detalle_compra WHERE iddetalle_compra = '101';

-- Registro de venta 
INSERT INTO `venta` (`id_cliente`,`fecha_venta`) VALUES (3,'2023-02-02'); -- nota: fecha con formato (aaaa-mm-dd)
SELECT * FROM tienda_musica.venta WHERE idventa = '96';
INSERT INTO `detalle_venta` (`id_producto`,`id_venta`,`cantidad_venta`) VALUES ('prod_003', 96, 5);
SELECT * FROM tienda_musica.detalle_venta WHERE iddetalle_venta = '96';

-- -----------------------------------------------------
-- CONSULTAS PERTINENTES PARA EL ANALISIS DE DATOS
-- -----------------------------------------------------

-- Hacer pedidos a los proveedores de manera oportuna (cuando el stock sea menor o igual a 2)
SELECT * FROM tienda_musica.producto WHERE stock <= 2 order by stock asc;

-- Búsqueda de todos los datos de venta (joins de varias tablas)
SELECT vt.idventa, vt.id_cliente, vt.fecha_venta, dt.id_producto, dt.cantidad_venta, cl.nombre, cl.apellidos 
from tienda_musica.venta vt 
left join tienda_musica.detalle_venta dt on vt.idventa = dt.id_venta 
left join tienda_musica.cliente cl on id_cliente = cl.idcliente;

-- Búsqueda de todos los datos de compra (joins de varias tablas)
SELECT cp.idcompra, cp.id_proveedor, cp.fecha_compra, dc.id_producto, dc.cantidad_compra, pv.proveedor
from tienda_musica.compra cp 
left join tienda_musica.detalle_compra dc on cp.idcompra = dc.id_compra
left join tienda_musica.proveedor pv on id_proveedor = pv.idproveedor;

-- Productos más vendidos (de mayor a menor)
SELECT 
producto, marca, tipo, count(cantidad_venta) as venta_totales
from tienda_musica.venta vt 
left join tienda_musica.detalle_venta dt on vt.idventa = dt.id_venta 
left join tienda_musica.cliente cl on id_cliente = cl.idcliente 
left join tienda_musica.producto pt on id_producto = pt.idproducto
group by producto, marca, tipo order by venta_totales desc;

-- Productos menos vendidos (de menor a mayor)
SELECT 
producto, marca, tipo, count(cantidad_venta) as venta_totales
from tienda_musica.venta vt 
left join tienda_musica.detalle_venta dt on vt.idventa = dt.id_venta 
left join tienda_musica.cliente cl on id_cliente = cl.idcliente 
left join tienda_musica.producto pt on id_producto = pt.idproducto
group by producto, marca, tipo order by venta_totales asc;

-- Día de más ventas (de mayor a menos)
select vt.fecha_venta, sum(dt.cantidad_venta) as ventas_totales from tienda_musica.venta vt
left join tienda_musica.detalle_venta dt on vt.idventa = dt.id_venta
left join tienda_musica.producto pt on dt.id_producto = pt.idproducto
group by vt.fecha_venta order by ventas_totales asc;

-- Día de menos ventas (de menor a mayor)
SELECT vt.fecha_venta, sum(dt.cantidad_venta) as ventas_totales from tienda_musica.venta vt
left join tienda_musica.detalle_venta dt on vt.idventa = dt.id_venta
left join tienda_musica.producto pt on dt.id_producto = pt.idproducto
group by vt.fecha_venta order by ventas_totales desc;

-- Total de gastos mensual
SELECT sum(cantidad_compra * precio_compra) as Gasto_Mensual FROM tienda_musica.detalle_compra;

-- Total de ingresos mensual
select sum(precio_producto * cantidad_venta) as Ingreso_Mensual 
from tienda_musica.detalle_venta dt
left join tienda_musica.producto pt on dt.id_producto = pt.idproducto;

-- Total de beneficios mensual
select ((select sum(precio_producto * cantidad_venta) as Ingreso_Mensual 
from tienda_musica.detalle_venta dt
left join tienda_musica.producto pt 
on dt.id_producto = pt.idproducto)
 - 
 (SELECT sum(cantidad_compra * precio_compra) 
 as Gasto_Mensual FROM tienda_musica.detalle_compra)) as Beneficio_Mensual;
