create schema if not exists `joseMarket_schema`;
create table `joseMarket_schema`.`proveedor`(
`proveedor_id` int not null auto_increment,
`nombre` varchar(30),
`rut` varchar(15),
`telefono` int not null,
primary key(`proveedor_id`));

create table `joseMarket_schema`.`cliente`(
`cliente_id` int not null auto_increment,
`nombre` varchar(30),
`rut` varchar(15),
`telefono` int not null,
primary key(`cliente_id`));

create table `joseMarket_schema`.`DocumentoVenta`(
`documentoVenta_id` int not null auto_increment,
`tipoDocumento` varchar(30),
`fecha` date,
primary key(`documentoVenta_id`));

create table `joseMarket_schema`.`DocumentoCompra`(
`documentoCompra_id` int not null auto_increment,
`tipoDocumento` varchar(30),
`fecha` date,
primary key(`documentoCompra_id`));

create table `joseMarket_schema`.`DetalleVenta`(
`detalleVenta_id` int not null auto_increment,
`cantidad` int not null,
`valor` int not null,
primary key(`detalleVenta_id`));

create table `joseMarket_schema`.`DetalleCompra`(
`detalleCompra_id` int not null auto_increment,
`cantidad` int not null,
`valor` int not null,
primary key(`detalleCompra_id`));

create table `joseMarket_schema`.`Producto`(
`producto_id` int not null auto_increment,
`nombre` varchar(30),
`stock` int not null,
primary key(`producto_id`));

create table `joseMarket_schema`.`TipoProducto`(
`tipoProducto_id` int not null auto_increment,
`categoria` varchar(20),
`subcategoria` varchar(20),
primary key(`tipoProducto_id`));

create table `joseMarket_schema`.`Historico`(
`historico_id` int not null auto_increment,
`año` date,
primary key(`historico_id`));

ALTER TABLE josemarket_schema.producto ADD tipoProducto_id INT NOT NULL;
ALTER TABLE josemarket_schema.producto ADD constraint productoTipoProducto foreign key (tipoProducto_id) references josemarket_schema.tipoproducto(tipoproducto_id);

ALTER TABLE josemarket_schema.documentoventa ADD cliente_id INT NOT NULL;
ALTER TABLE josemarket_schema.documentoventa ADD constraint documentoventacliente foreign key (cliente_id) references josemarket_schema.cliente(cliente_id);

ALTER TABLE josemarket_schema.detallecompra ADD documentocompra_id INT NOT NULL;
ALTER TABLE josemarket_schema.detallecompra ADD constraint detalledocumentocompra foreign key (documentocompra_id) references josemarket_schema.documentocompra(documentocompra_id);

ALTER TABLE josemarket_schema.detalleventa ADD documentoventa_id INT NOT NULL;
ALTER TABLE josemarket_schema.detalleventa ADD constraint detalledocumentoventa foreign key (documentoventa_id) references josemarket_schema.documentoventa(documentoventa_id);

ALTER TABLE josemarket_schema.detallecompra ADD producto_id INT NOT NULL;
ALTER TABLE josemarket_schema.detallecompra ADD constraint detallecompraproducto foreign key (producto_id) references josemarket_schema.producto(producto_id);

ALTER TABLE josemarket_schema.detalleventa ADD producto_id INT NOT NULL;
ALTER TABLE josemarket_schema.detalleventa ADD constraint detalleventaproducto foreign key (producto_id) references josemarket_schema.producto(producto_id);

ALTER TABLE josemarket_schema.detallecompra ADD historico_id INT NOT NULL;
ALTER TABLE josemarket_schema.detallecompra ADD constraint detallecomprahistorico foreign key (historico_id) references josemarket_schema.historico(historico_id);

ALTER TABLE josemarket_schema.detalleventa ADD historico_id INT NOT NULL;
ALTER TABLE josemarket_schema.detalleventa ADD constraint detalleventahistorico foreign key (historico_id) references josemarket_schema.historico(historico_id);

ALTER TABLE josemarket_schema.historico ADD detalleVenta_id INT NOT NULL;
ALTER TABLE josemarket_schema.historico ADD constraint historicoDetalleventa foreign key (detalleVenta_id) references josemarket_schema.detalleVenta(detalleVenta_id);

insert into josemarket_schema.tipoproducto (categoria, subcategoria) values ('congelados', 'carnes');
insert into josemarket_schema.tipoproducto (categoria, subcategoria) values ('congelados', 'vegetales');
insert into josemarket_schema.tipoproducto (categoria, subcategoria) values ('congelados', 'helados');
insert into josemarket_schema.tipoproducto (categoria, subcategoria) values ('refrigerados', 'quesos');
insert into josemarket_schema.tipoproducto (categoria, subcategoria) values ('refrigerados', 'jamones');

insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('queso parmesano', 2 , 4);
insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('truto entero', 4 , 1);
insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('choclo', 3 , 2);
insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('helado de fresa', 3 , 3);
insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('jamon colonial', 1 , 5);
insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('queso fresco', 5 , 4);
insert into josemarket_schema.producto (nombre, stock, tipoProducto_id) values ('pechuga entera', 3 , 1);

insert into josemarket_schema.proveedor (nombre, rut, telefono) values ('Jumbo', '98.234.765-k' , 943217654);

insert into josemarket_schema.documentocompra (tipoDocumento, fecha, proveedor_id) values ('Factura', '2022-11-10' , 1);

insert into josemarket_schema.historico (año) values ('2022-12-31');

insert into josemarket_schema.cliente (nombre, rut, telefono) values ('Jose Vidal', '12.654.876-9', 923457654);
insert into josemarket_schema.documentoventa (tipodocumento, fecha, cliente_id) values ('Boleta', '2022-11-11', 1);

insert into josemarket_schema.detallecompra (cantidad, valor, documentocompra_id, producto_id, historico_id) values (2, 1500 , 1, 4, 1);
insert into josemarket_schema.detallecompra (cantidad, valor, documentocompra_id, producto_id, historico_id) values (1, 2500 , 1, 6, 1);

insert into josemarket_schema.detalleventa (cantidad, valor, documentoventa_id, producto_id, historico_id) values (1, 2500 , 1, 4, 1);
insert into josemarket_schema.detalleventa (cantidad, valor, documentoventa_id, producto_id, historico_id) values (1, 4000 , 1, 6, 1);

#se le cambia el nombre al nombre del proveedor de la tabla de proveedor para evitar confusiones#
alter table josemarket_schema.proveedor change column nombre nombreProveedor varchar(30);

#se le cambia el nombre al nombre producto de la tabla de producto para evitar confusiones#
alter table josemarket_schema.producto change column nombre nombreProducto varchar(50);

#se le cambia el nombre al nombre del cliente de la tabla de cliente para evitar confusiones#
alter table josemarket_schema.cliente change column nombre nombreCliente varchar(30);

#este join permite ver los productos que se han comprado y a qué proveedor#
select distinct producto.nombreproducto, producto.tipoProducto_id, detallecompra.valor, detallecompra.cantidad, detallecompra.documentocompra_id, proveedor.nombreproveedor from josemarket_schema.detallecompra 
 join josemarket_schema.producto join josemarket_schema.documentocompra JOIN josemarket_schema.proveedor on josemarket_schema.detallecompra.producto_id = josemarket_schema.producto.producto_id;

#este join permite ver las compras y ventas de los productos, una vez que el stock tenga funcionalidad se podría agregar#
select distinct producto.nombreproducto, detallecompra.detalleCompra_id, detallecompra.cantidad, detallecompra.valor, detalleventa.detalleVenta_id, detalleventa.cantidad, detalleventa.valor, historico.año 
from josemarket_schema.producto inner join josemarket_schema.detallecompra on josemarket_schema.producto.producto_id = josemarket_schema.detallecompra.producto_id
inner join josemarket_schema.detalleventa on josemarket_schema.detalleventa.producto_id = josemarket_schema.detalleventa.producto_id join josemarket_schema.historico where detallecompra.historico_id=1;

select producto.nombreproducto from josemarket_schema.producto
join josemarket_schema.detallecompra on josemarket_schema.producto.producto_id = josemarket_schema.detallecompra.producto_id;

select * from josemarket_schema.tipoproducto;
select * from josemarket_schema.producto;
select * from josemarket_schema.proveedor;
select * from josemarket_schema.documentocompra;
select * from josemarket_schema.historico;
select * from josemarket_schema.detallecompra;
select * from josemarket_schema.detalleventa;