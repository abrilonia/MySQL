INSERT INTO generarion_schema.ARTICULO (nombre, precio) values ('notebook', '450000');
INSERT INTO generarion_schema.ARTICULO (nombre, precio) values ('lapiz tinta', '450');
INSERT INTO generarion_schema.ARTICULO (nombre, precio) values ('marcador', '2000');

INSERT INTO generarion_schema.ARTICULO (articulo_id,nombre, precio) values (4,'lapiz tinta roja', '450')
on duplicate key update nombre = 'lapiz tinta azul', precio = 550;

update generarion_schema.articulo set nombre = 'notebook gamer', precio = 12500000 where articulo_id = 1;

update generarion_schema.articulo set nombre = 'lapiz amarillo', precio = 1250 where nombre = 'lapiz tinta azul';

SET SQL_SAFE_UPDATES = 0;


select * from generarion_schema.articulo;