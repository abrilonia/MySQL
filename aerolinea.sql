CREATE SCHEMA IF NOT EXISTS aerolinea_schema;
CREATE TABLE `aerolinea_schema`.`cliente`(
`cliente_id`INT NOT NULL auto_increment,
`nombre`varchar(30) NOT NULL,
`rut` varchar(15) not null,
`correo` varchar(40) not null,
`edad` bit not null,
primary key(`cliente_id`));

create table `aerolinea_schema`.`tarjeta`(
`tarjeta_id`int not null auto_increment,
`numeroTarjeta`int not null,
`banco`varchar(30),
primary key(`tarjeta_id`));

create table `aerolinea_schema`.`ticket`(
`ticket_id` int not null auto_increment,
`categoria` varchar(20),
`nroAsiento` varchar(5),
`valor` int not null,
primary key(`ticket_id`));

create table `aerolinea_schema`.`vuelos`(
`vuelos_id` int not null auto_increment,
`destino` varchar(30),
`hora` datetime,
`nombreVuelo` varchar(25),
`origen` varchar(35),
primary key(`vuelos_id`));

create table `aerolinea_schema`.`avion`(
`avion_id` int not null auto_increment,
`nombreAvion` varchar(20),
`capacidad` int not null,
primary key(`avion_id`));

create table `aerolinea_schema`.`maleta`(
`maleta_id` int not null auto_increment,
`tamanio` varchar(10),
`valor` int not null,
`pesoKG` int not null,
primary key(`maleta_id`));

create table `aerolinea_schema`.`tripulacion`(
`tripulacion_id` int not null auto_increment,
`nombreTripulante` varchar(40),
`cargo` varchar(30),
`rut` varchar(20),
primary key(`tripulacion_id`));

create table `aerolinea_schema`.`historial`(
`historial_id` int not null auto_increment,
primary key(`historial_id`));

ALTER TABLE aerolinea_schema.tarjeta ADD cliente_id int not null;
ALTER TABLE aerolinea_schema.tarjeta ADD constraint tarjetaCliente foreign key (cliente_id) references aerolinea_schema.cliente(cliente_id);

ALTER TABLE aerolinea_schema.ticket ADD maleta_id int not null;
ALTER TABLE aerolinea_schema.ticket ADD constraint ticketMaleta foreign key (maleta_id) references aerolinea_schema.ticket(ticket_id);

alter table aerolinea_schema.ticket drop foreign key ticketMaleta;

ALTER TABLE aerolinea_schema.ticket ADD cliente_id int not null;
ALTER TABLE aerolinea_schema.ticket ADD constraint ticketCliente foreign key (cliente_id) references aerolinea_schema.cliente(cliente_id);

ALTER TABLE aerolinea_schema.ticket ADD vuelos_id int not null;
ALTER TABLE aerolinea_schema.ticket ADD constraint ticketVuelo foreign key (vuelos_id) references aerolinea_schema.vuelos(vuelos_id);

ALTER TABLE aerolinea_schema.maleta ADD ticket_id int not null;
ALTER TABLE aerolinea_schema.maleta ADD constraint maletaTicket foreign key (ticket_id) references aerolinea_schema.ticket(ticket_id);

ALTER TABLE aerolinea_schema.vuelos ADD avion_id int not null;
ALTER TABLE aerolinea_schema.vuelos ADD constraint vuelosAvion foreign key (avion_id) references aerolinea_schema.avion(avion_id);

ALTER TABLE aerolinea_schema.vuelos ADD historial_id int not null;
ALTER TABLE aerolinea_schema.vuelos ADD constraint vuelosHistorial foreign key (historial_id) references aerolinea_schema.historial(historial_id);

ALTER TABLE aerolinea_schema.historial ADD cliente_id int not null;
ALTER TABLE aerolinea_schema.historial ADD constraint historialCliente foreign key (cliente_id) references aerolinea_schema.cliente(cliente_id);

ALTER TABLE aerolinea_schema.historial ADD vuelos_id int not null;
ALTER TABLE aerolinea_schema.historial ADD constraint historialVuelos foreign key (vuelos_id) references aerolinea_schema.vuelos(vuelos_id);

ALTER TABLE aerolinea_schema.tripulacion ADD avion_id int not null;
ALTER TABLE aerolinea_schema.tripulacion ADD constraint tripulacionAvion foreign key (avion_id) references aerolinea_schema.avion(avion_id);

ALTER TABLE aerolinea_schema.cliente CHANGE COLUMN EDAD EDAD INT NOT NULL;
ALTER TABLE aerolinea_schema.tarjeta CHANGE COLUMN numeroTarjeta numeroTarjeta INT NOT NULL;
