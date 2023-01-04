CREATE SCHEMA IF NOT EXISTS generarion_schema;
CREATE TABLE `generarion_schema`.`Articulo`(
`articulo_id` INT NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(20) NOT NULL,
`precio` INT NOT NULL,
PRIMARY KEY (`articulo_id`));

CREATE TABLE `generarion_schema`.`cliente`(
`cliente_id`INT NOT NULL auto_increment,
`nombre`VARCHAR(20) NOT NULL,
`email` VARCHAR(20) NOT NULL,
`fechaNacimiento`DATE NOT NULL,
`rut`VARCHAR(15) NOT NULL,
primary key(`cliente_id`));

CREATE TABLE `generarion_schema`.`historial`(
`historial_id`INT NOT NULL auto_increment,
PRIMARY KEY (`historial_id`));

ALTER TABLE generarion_schema.cliente ADD historial_id INT NOT NULL;
ALTER TABLE generarion_schema.cliente ADD constraint clienteHistorial foreign key (historial_id) references generarion_schema.historial(historial_id);
#eliminar primero las foreing key#
ALTER TABLE generarion_schema.cliente drop foreign key clienteHistorial;
ALTER TABLE generarion_schema.historial drop foreign key clienteHistorial;
#luego sí se puede eliminar las tablas#
drop table generarion_schema.historial;
