create schema if not exists baseinicial_schema;
create table `baseinicial_schema`.`usuario`(
`usuario_id` int not null auto_increment,
`nombre completo` varchar(50),
`correo` varchar(30),
`fechaNacimiento` date,
`telefono` int not null,
`pais` varchar(30),
`region` varchar(30),
`comuna/distrito` varchar(30),
primary key(`usuario_id`));

create table `baseinicial_schema`.`interesUsuario`(
`interesUsuario_id` int not null auto_increment,
`respuesta1` varchar(50),
`respuesta2` varchar(50),
primary key(`interesUsuario_id`));

create table `baseinicial_schema`.`perfil`(
`perfil_id` int not null auto_increment,
`tipoDeperfil` varchar(50),
primary key(`perfil_id`));

create table `baseinicial_schema`.`progreProteMone`(
`progreProteMone_id` int not null auto_increment,
`EstafasPiramidales` int,
`EstafasPorLlamadas` int,
`EstafasDigitales` int,
`CambiarTuContraseña` int,
primary key(`progreProteMone_id`));

ALTER TABLE baseinicial_schema.usuario ADD perfil_id int not null;
ALTER TABLE baseinicial_schema.usuario ADD constraint usuarioPerfil foreign key (perfil_id) references baseinicial_schema.perfil(perfil_id);

ALTER TABLE baseinicial_schema.interesusuario ADD usuario_id int not null;
ALTER TABLE baseinicial_schema.interesusuario ADD constraint interesusuarioUsuario foreign key (usuario_id) references baseinicial_schema.usuario(usuario_id);

ALTER TABLE baseinicial_schema.progreProteMone ADD usuario_id int not null;
ALTER TABLE baseinicial_schema.progreProteMone ADD constraint ProgreProteMoneUsuario foreign key (usuario_id) references baseinicial_schema.usuario(usuario_id);

alter table baseinicial_schema.progreprotemone drop foreign key ProgreProteMoneUsuario;

ALTER TABLE baseinicial_schema.progreprotemone DROP COLUMN usuario_id;

ALTER TABLE baseinicial_schema.Usuario ADD progreProteMone_id int not null;
ALTER TABLE baseinicial_schema.Usuario ADD constraint UsuarioProgreProteMone foreign key (progreProteMone_id) references baseinicial_schema.progreprotemone(progreProteMone_id);