INSERT into aerolinea_schema.cliente (nombre, rut, correo, edad) values ('Maria Perez', '9.456.987-1', 'mperez1234@gmail.com', 57);
INSERT into aerolinea_schema.cliente (nombre, rut, correo, edad) values ('Mariana Lopez', '19.456.887-2', 'mlopez1234@gmail.com', 25);
INSERT into aerolinea_schema.cliente (nombre, rut, correo, edad) values ('Patricio Vidal', '21.456.887-k', 'pvidal1234@gmail.com', 20);
INSERT into aerolinea_schema.cliente (nombre, rut, correo, edad) values ('Gerardo Lozada', '18.456.857-2', 'glozada1234@gmail.com', 33);
INSERT into aerolinea_schema.cliente (nombre, rut, correo, edad) values ('Mario Fernandez', '19.556.387-2', 'mfernandez1234@gmail.com', 27);

insert into aerolinea_schema.tarjeta (numeroTarjeta, banco, cliente_id) values (123456789, 'santander', 1);
insert into aerolinea_schema.tarjeta (numeroTarjeta, banco, cliente_id) values (123456789, 'estado', 1);
insert into aerolinea_schema.tarjeta (numeroTarjeta, banco, cliente_id) values (123456789, 'banco de chile', 3);

select * from aerolinea_schema.cliente;
select * from aerolinea_schema.tarjeta;