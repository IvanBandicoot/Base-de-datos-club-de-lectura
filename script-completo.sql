#use data base

use club_lectura;

#borrar base de datos

drop database club_lectura;

#Se crea las tablas

create database club_lectura;

create table idioma(

	id int,
    nombre varchar(50) not null
);

create table obra(

	id_obra int,
    precio numeric(5,2) not null,
    nombre_obra varchar(50) not null,
    resumen varchar(900) not null,
    duracion int not null,
    estatus_activa boolean not null,
	fk_practican int not null

);

create table espacio(

	id_espacio int,
    capacidad int not null,
    condicion varchar(30) not null /*check*/,
    nombre varchar(30) not null,
	fk_tiene_espacio int not null,
    fk_posee_sala int
    
);

create table calendario_presentacion(

	fecha date,
    hora_inicio time not null,
	estatus_realizada varchar(10) not null /*check*/,
    valoracion float,
    cantidad_asistentes int,
	fk_calendario int not null /*debil*/

);

create table representante(

	docdeidentidad int,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    correo varchar(150) not null,
    telefono numeric(13)

);

create table personaje(

	id_presonaje int,
    descripcion varchar(200),
    nombre_personaje varchar(200) not null,
    tipo varchar(30) not null, /*check*/
	fk_actor_obra int not null /*debil*/
    
);

create table institucion(
	
    id_institucion int,
    nombre varchar(50) not null,
    tipo varchar(30) not null, /*check*/
	fk_ciudad_lugar int not null

);

create table club(

	id_club int,
    nombre_club varchar(50),
    cuota boolean,
    direccion varchar(100) not null,
    cod_post int not null,
	fk_ciudad_club int not null,
    fk_organizacion int,
    fk_habla int not null
    
);

create table grupo(

	id_grupo int,
    dia varchar(10) not null,
    hora_inicio time not null,
    identificador_g varchar(1) not null,/*check*/
    hora_final time,
    fk_asociar_club int not null /*debil*/

);

create table miembro(

	docdeindentidad int,
    nombre varchar(30) not null,
    nombre2 varchar(30),
    apellido varchar(30) not null,
    apellido2 varchar(30) not null,
    genero varchar(10) not null /*check*/,
    fecha_nacimiento date not null,
    telefono numeric(13),
    fk_pertenece_lugar int not null,
    fk_club int not null,
    fk_representante int,
    fk_responsable int

);

create table lugar(
	
    id_lugar int,
    nombre_lugar varchar(30) not null,
    tipo varchar(50) not null, /*check*/
    moneda varchar(20),
    nacionalidad varchar(15),
    fk_busqueda int
    
);

create table pago(

	id_pago int,
    fecha date not null,
    fk_pago_realizado int not null, /*debil*/
	fk_pago_realizado2 int not null, /*debil*/
    fk_pago_realizado3 date not null /*debil*/

);

create table historico_membresia(

	fechai date,
    fechaf date,
    estatus varchar(30) not null, /*check*/
    motivo_retiro varchar(30), /*check*/
	fk_verificar_club int not null, /*debil*/
    fk_reg_his int not null /*debil*/

);

create table asociacion(

	fk_asocia int not null, /*debil*/
	fk_asocia2 int not null /*debil*/

);

create table mejor_actor(

	fk_elegir_actor int not null, /*debil*/
    fk_elegir_actor2 int not null, /*debil*/
    fk_elegir_actor3 int not null, /*debil*/
    fk_elegir_actor4 int not null, /*debil*/
    fk_elegir_actor5 date not null, /*debil*/
	fk_actor_presenta int not null, /*debil*/
    fk_actor_presenta2 date not null /*debil*/

);

create table o_m(

	valoracion float,
	fk_participa_ahora int not null, /*debil*/
    fk_participa_ahora2 int not null, /*debil*/
	fk_ver_pertenece int not null, /*debil*/
    fk_ver_pertenece2 int not null, /*debil*/
    fk_ver_pertenece3 date not null /*debil*/

);

create table c_o(
     
     fk_valorar int not null, /*Primary key*/
     fk_criterio int not null /*Primary key*/

);

create table o_l (
    
    fk_tiene_lib int not null, /*Primary key*/
    fk_tiene_obra numeric(13) not null /*Primary key*/
 
);

create table g_l (

    fecha_inicio date not null,
    fecha_f date,
    fk_verificar_grupo_1 date not null, /*Primary key*/
    fk_verificar_grupo_2 int not null,  /*Primary key*/
    fk_verificar_grupo_3 int not null,  /*Primary key*/
    fk_reg_grupo_1 int not null, /*Primary key*/
    fk_reg_grupo_2 int not null /*Primary key*/

);

create table reunion (

    fecha date, /*Primary key*/
    conclusiones varchar(200),
    valoracion float,
    fk_moderador_1 date not null,
    fk_moderador_2 int not null,
    fk_moderador_3 int not null,
    fk_moderador_4 int not null,
    fk_moderador_5 int not null,
    fk_se_usa numeric(13) not null,
    fk_tiene_reunion_1 int not null, /*Primary key*/
    fk_tiene_reunion_2 int not null /*Primary key*/
    
);

create table asistencia (

    fk_se_hace_1 date not null, /*Primary key*/
    fk_se_hace_2 int not null, /*Primary key*/
    fk_se_hace_3 int not null, /*Primary key*/
    fk_se_hace_4 int not null, /*Primary key*/
    fk_se_hace_5 int not null, /*Primary key*/
    fk_asiste_1 int not null, /*Primary key*/
    fk_asiste_2 int not null,  /*Primary key*/
    fk_asiste_3 date not null  /*Primary key*/

);

create table editorial(
	
    id_editorial int,
    nombre varchar(50) not null,
    total_paginas int not null,
    fk_fundada_lugar int not null
);

create table clasificacion(
	
    id int,
    nombre varchar(50) not null,
    tipo varchar(3) not null,/*^check*/
    fk_varios_recursiva int
);

create table libro(
	
    ISBN numeric(13),
    titulo_original varchar(150) not null,
    url varchar(500),
    tema varchar(50),
    titulo_espanol varchar(150),
    ano int not null,
    fk_publica_editorial int not null,
    fk_valorarlib_clasificacion int not null,
    fk_continuar_libro numeric(13)
);

create table estructura(
	
    id_estructura int,
    nombre varchar(50) not null,
    titulo varchar(100),
    tipo varchar(3) not null/*check*/,
    fk_divide_estructura_recursiva int,
    fk_informacion_libro numeric(13) not null/*debil*/
);

create table libros_preferidos(
	
    posicion int not null,
    fk_analisis_miembro int not null,/*debil*/
    fk_preferidos_libro numeric(13) not null/*debil*/
);

/*======================primary keys y constrains checks abajo===============================*/

/*idioma*/
alter table idioma add( constraint id_idioma primary key (id));
alter table idioma modify id int auto_increment;
/*Miembro*/
alter table miembro add( constraint id_miembro primary key (docdeindentidad) );
alter table miembro add( constraint sexo check(genero in('hombre','mujer')));
/*club modificar*/
alter table club add( constraint idclub primary key (id_club) );
alter table club modify id_club int auto_increment;
/*institucion*/
alter table institucion add (constraint pk_org primary key (id_institucion));
alter table institucion modify id_institucion int auto_increment;
#alter table institucion add (constraint tipo_institucion check(tipo in('biblioteca','universidad','privada','publica')));
/*lugar*/
alter table lugar add( constraint idlugar primary key (id_lugar) );
alter table lugar modify id_lugar int auto_increment;
alter table lugar add( constraint zona check(tipo in('pais','estado','parroquia','urbanizacion','ciudad')));
/*personaje*/
alter table personaje add( constraint idpresonaje primary key (id_presonaje,fk_actor_obra) );
alter table personaje modify id_presonaje int auto_increment;
alter table personaje add(constraint tipo_personaje check(tipo in('principal','secundario','villano')));
/*pago*/
alter table pago add( constraint idpago primary key (id_pago,fk_pago_realizado,fk_pago_realizado2,fk_pago_realizado3) );
alter table pago modify id_pago int auto_increment;
/*historico membresia*/
alter table historico_membresia add ( constraint idfecha_fk1_fk2 primary key (fechai,fk_verificar_club,fk_reg_his));
alter table historico_membresia add( constraint estado check(estatus in('activo','retirado')));
alter table historico_membresia add( constraint motivo check(motivo_retiro in('asistencia','pago','voluntario')));
#Tabla Asociacion
alter table asociacion add(constraint pk_asocia primary key (fk_asocia, fk_asocia2));
#Tabla Grupo
alter table grupo add(constraint pk_id_grupo primary key (id_grupo, fk_asociar_club));
alter table grupo modify id_grupo int auto_increment;
alter table grupo add( constraint identificador check(identificador_g in('m','n')));/*m = mayor, n = niño*/
#Tabla Representante
alter table representante add(constraint pk_docdeidentidad primary key (docdeidentidad));
#Tabla g_l
alter table g_l add(constraint pk_verificar_reg primary key (fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2));
#Tabla Asistencia
alter table asistencia add(constraint pk_hace_asiste primary key (fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3));
#Tabla c_o
alter table c_o add(constraint pk_valorar_criterio primary key (fk_valorar, fk_criterio));
#Tabla o_l
alter table o_l add(constraint pk_tiene primary key (fk_tiene_lib, fk_tiene_obra));
#Tabla o_m
alter table o_m add(constraint pk_participa_pertenece primary key (fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3));
#Tabla Obra
alter table obra add(constraint pk_obra primary key (id_obra));
alter table obra modify id_obra int auto_increment;
/*calisificacion*/
alter table clasificacion add( constraint id_clasificacion primary key (id));
alter table clasificacion add( constraint tipo check(tipo in('oda','sat','epo','rom','fab','tra','com','cue','bib','ens','cro','mem')));
alter table clasificacion modify id int auto_increment;
/*editorial*/
alter table editorial add( constraint id_editorial primary key (id_editorial));
alter table editorial modify id_editorial int auto_increment;
/*libro*/
alter table libro add( constraint id_libro primary key (ISBN));
/*estructura*/
alter table estructura add( constraint id_estructura primary key (id_estructura,fk_informacion_libro));
alter table estructura add( constraint tipo_estructura check(tipo in('cap','scp','act')));
alter table estructura modify id_estructura int auto_increment;
/*espacio*/
alter table espacio add( constraint id_espacio primary key (id_espacio));
alter table espacio add( constraint condicion_espacio check(condicion in('alquilado','propiedad')));
alter table espacio modify id_espacio int auto_increment;
/*calendario_presentacion*/
alter table calendario_presentacion add( constraint id_calendario_presentacion primary key (fecha,fk_calendario));
alter table calendario_presentacion add( constraint estatus_realizada_calendario_presentacion check(estatus_realizada in('activa','no activa')));
/*libros_preferidos*/
alter table libros_preferidos add( constraint id_libros_preferidos primary key (fk_analisis_miembro,fk_preferidos_libro));
/*reunion*/
alter table reunion add( constraint id_reunion primary key (fecha,fk_tiene_reunion_1,fk_tiene_reunion_2));
/*mejor_actor*/
alter table mejor_actor add( constraint id_mejor_actor primary key (fk_elegir_actor,fk_elegir_actor2,fk_elegir_actor3,fk_elegir_actor4,fk_elegir_actor5,fk_actor_presenta,fk_actor_presenta2));

/*==============================FOREIGN KEY==============================*/

/*obra con espacio*/
alter table obra add( constraint practican foreign key (fk_practican) references espacio(id_espacio) );
/*espacio con lugar y club*/
alter table espacio add( constraint tiene_espacio foreign key (fk_tiene_espacio) references lugar(id_lugar) );
alter table espacio add( constraint posee_sala foreign key (fk_posee_sala) references club(id_club) );
/*editorial con lugar*/
alter table editorial add( constraint fundanda foreign key (fk_fundada_lugar) references lugar(id_lugar));
/*libro con clasificacion y editorial y consigo misma*/
alter table libro add( constraint publica foreign key (fk_publica_editorial) references editorial(id_editorial));
alter table libro add( constraint valorar_lib foreign key (fk_valorarlib_clasificacion) references clasificacion(id) );
alter table libro add( constraint continuar foreign key (fk_continuar_libro) references libro (ISBN));
/*clasificacion consigo misma*/
alter table clasificacion add( constraint varios foreign key (fk_varios_recursiva) references clasificacion(id) );
/*lugar consigo misma*/
alter table lugar add( constraint busqueda foreign key (fk_busqueda) references lugar(id_lugar) );
/*institucion con lugar*/
alter table institucion add( constraint ciudad_ins foreign key (fk_ciudad_lugar) references lugar(id_lugar));
/*club con idioma, institucion y lugar*/
alter table club add( constraint habla foreign key (fk_habla) references idioma(id));
alter table club add( constraint organizacion foreign key (fk_organizacion) references institucion(id_institucion) );
alter table club add( constraint ciudad_club foreign key (fk_ciudad_club) references lugar(id_lugar) );
/*miembro con club,lugar,representante y consigo misma*/
alter table miembro add( constraint pertenece foreign key (fk_pertenece_lugar) references lugar(id_lugar));
alter table miembro add( constraint tiene foreign key (fk_club) references club(id_club) );
alter table miembro add( constraint pago_responsable foreign key (fk_responsable) references representante(docdeidentidad));
alter table miembro add( constraint representante foreign key (fk_representante) references miembro(docdeindentidad) );
/*estructura consigo misma y con lirbo (debil)*/
alter table estructura add( constraint informacion foreign key (fk_informacion_libro) references libro(ISBN) );
alter table estructura add( constraint divide foreign key (fk_divide_estructura_recursiva) references estructura(id_estructura) );
/*personaje con obra*/
alter table personaje add( constraint actuar foreign key (fk_actor_obra) references obra(id_obra));
/*calendario_presentacion con obra*/
alter table calendario_presentacion add( constraint planificar foreign key (fk_calendario) references obra(id_obra) );
/*grupo con club*/
alter table grupo add( constraint asociar foreign key (fk_asociar_club) references club(id_club) );
/*pago con historico de membresia*/
alter table pago add( constraint pago_realizado foreign key (fk_pago_realizado3,fk_pago_realizado2,fk_pago_realizado) references  historico_membresia(fechai,fk_verificar_club,fk_reg_his));
/*historico_membresia con miembro y con club*/
alter table historico_membresia add( constraint registro_his foreign key (fk_reg_his) references miembro(docdeindentidad) );
alter table historico_membresia add( constraint verificar_club foreign key (fk_verificar_club) references club(id_club) );
/*asociacion recursiva con club*/
alter table asociacion add( constraint asocia foreign key (fk_asocia) references club(id_club) );
alter table asociacion add( constraint asocia2 foreign key (fk_asocia2) references club(id_club) );
/*c_o con club y obra*/
alter table c_o add( constraint criterio foreign key (fk_criterio) references club(id_club) );
alter table c_o add( constraint valorar foreign key (fk_valorar) references obra(id_obra) );
/*o_l con obra y libro*/
alter table o_l add( constraint tiene_lib foreign key (fk_tiene_lib) references obra(id_obra) );
alter table o_l add( constraint tiene_obra foreign key (fk_tiene_obra) references libro(ISBN) );
/*o_m con personaje e historico de membresia*/
alter table o_m add( constraint practica_obra foreign key (fk_participa_ahora,fk_participa_ahora2) references personaje(id_presonaje,fk_actor_obra) );
alter table o_m add( constraint ver_a_pertenece foreign key (fk_ver_pertenece3,fk_ver_pertenece2,fk_ver_pertenece) references historico_membresia(fechai,fk_verificar_club,fk_reg_his));
/*mejor actor con o_m y con calendario presentacion*/
alter table mejor_actor add( constraint actor_presento foreign key (fk_actor_presenta2,fk_actor_presenta) references calendario_presentacion(fecha,fk_calendario));
alter table mejor_actor add( constraint elegir_actor foreign key (fk_elegir_actor,fk_elegir_actor2,fk_elegir_actor3,fk_elegir_actor4, fk_elegir_actor5) references o_m(fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3) );
/*libro preferido con miembro y con libro*/
alter table libros_preferidos add( constraint preferidos foreign key (fk_preferidos_libro) references libro(ISBN));
alter table libros_preferidos add( constraint analisis foreign key (fk_analisis_miembro) references miembro(docdeindentidad));
/*G_l con grupo y historico membresia*/
alter table g_l add( constraint rg_grupo foreign key (fk_reg_grupo_1,fk_reg_grupo_2) references grupo(id_grupo, fk_asociar_club));
alter table g_l add( constraint verificar_grupo foreign key (fk_verificar_grupo_1,fk_verificar_grupo_2,fk_verificar_grupo_3) references historico_membresia(fechai,fk_verificar_club,fk_reg_his) );
/*reunion con g_l, libro y grupo*/
alter table reunion add( constraint se_usa foreign key (fk_se_usa) references libro(ISBN) );
alter table reunion add( constraint tiene_reunion foreign key (fk_tiene_reunion_1, fk_tiene_reunion_2) references grupo(id_grupo, fk_asociar_club) );
alter table reunion add( constraint moderador foreign key (fk_moderador_1,fk_moderador_2,fk_moderador_3,fk_moderador_4,fk_moderador_5) references g_l(fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) );
/*asistencia con reunion y g_l*/
alter table asistencia add( constraint asiste foreign key (fk_asiste_3,fk_asiste_2,fk_asiste_1) references reunion(fecha,fk_tiene_reunion_1,fk_tiene_reunion_2));
alter table asistencia add( constraint se_hace foreign key (fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5) references g_l(fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2));

/*============================INSERTS======================*/
/*ORDEN DE INSERCION:
-IDIOMA
-LUGAR
-INSTITUCION
-CLUB
-GRUPO
-MIEMBRO
-HISTORICO_MEMBRESIA
-PAGO
-ESPACIO
-OBRA
-PERSONAJE
-CALENDARIO PRESENTACION
-CLASIFICACION
-EDITORIAL
-ESTRUCTURA
-LIBRO
-LIBROS_PREFERIDOS
-C_O
-O_L
*/

use club_lectura;

#/////////////////////Tabla Idioma//////////////////////////////

INSERT INTO idioma (`nombre`) VALUES ('Español');
INSERT INTO idioma (`nombre`) VALUES ('Inglés');
INSERT INTO idioma (`nombre`) VALUES ('Francés');
INSERT INTO idioma (`nombre`) VALUES ('Portugués');
INSERT INTO idioma (`nombre`) VALUES ('Alemán');
INSERT INTO idioma (`nombre`) VALUES ('Chino');
INSERT INTO idioma (`nombre`) VALUES ('Italiano');
INSERT INTO idioma (`nombre`) VALUES ('Árabe');

#///////////Tabla Lugar ///////////////////////////////

insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Caracas', 'ciudad', 'Bolívar', 'Venezolana', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('New York', 'ciudad', 'Dólar', 'Estado Unidense', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Roma', 'ciudad', 'Euro', 'Italiana', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('París', 'ciudad', 'Euro', 'Francesa', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Zulia', 'ciudad', 'Bolívar', 'Venezolana', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Washington D.C', 'ciudad', 'Dólar', 'Estado Unidense', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Turín', 'ciudad', 'Euro', 'Italiana', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Lyon', 'ciudad', 'Euro', 'Francesa', NULL);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Venezuela', 'pais', 'Bolívar', 'Venezolana', 1);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Venezuela', 'pais', 'Bolívar', 'Venezolana', 5);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Estados Unidos', 'pais', 'Dólar', 'Estado Unidense', 2);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Estados Unidos', 'pais', 'Dólar', 'Estado Unidense', 6);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Italia', 'pais', 'Euro', 'Italiana', 3);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Italia', 'pais', 'Euro', 'Italiana', 7);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Francia', 'pais', 'Euro', 'Francia', 4);
insert into lugar (`nombre_lugar`, `tipo`, `moneda`, `nacionalidad`, `fk_busqueda`) values ('Francia', 'pais', 'Euro', 'Francia', 8);

#////////////Tabla Institucion//////////////////////// 

insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('Universidad católica Andrés Bello', 'universidad', 1);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('Universidad del Zulia', 'universidad', 5);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('Roma La Sapienza', 'universidad', 3);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('Salesiane di DON Bosco', 'colegio', 7);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('Bibliothèque nationale de France', 'biblioteca', 4);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('École nationale des travaux publics de lÉtat', 'universidad', 8);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('Maryel School of New York', 'colegio', 2);
insert into institucion (`nombre`, `tipo`, `fk_ciudad_lugar`) values ('James Madison memorial building', 'biblioteca', 6);

#///////////////Tabla Club////////////////////////////////

INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('The art of poems', true, 'Lexington Avenue y 42 Street', 33110, 2, 7, 2); 
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('The mistery of books', false, 'Avenida Connecticut', 33109, 2, null, 2);
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('La bella signora di amore', false, 'Via della Conciliazione', 19138, 3, 3, 7);
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('La storia della verità dei libri', true, 'Corso Vittorio Emanuele II', 19139, 3, 4, 7);
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('La guerra de los libros', false, 'Boulevard Sabana Grande', 1010, 1, 1, 1);
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('El baile de los libros', true, 'Boulevard de Santa Lucía', 1011, 1, 2, 1);
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('Bonne lecture', true, 'Rue Saint-Lazare', 52150, 4, 5, 3);
INSERT INTO club (`nombre_club`, `cuota`, `direccion`, `cod_post`, `fk_ciudad_club`, `fk_organizacion`, `fk_habla`) VALUES ('Les guerriers de la vérité', false, 'Saint Jean', 52151, 4, null, 3);

#///////////////Tabla Grupos/////////////////////////////

insert into grupo (`dia`, `hora_inicio`, `hora_final`, `identificador_g`, `fk_asociar_club`) values ('Miercoles', '08:22:00', '06:41:00','m', 1);
insert into grupo (`dia`, `hora_inicio`, `hora_final`, `identificador_g`, `fk_asociar_club`) values ('Jueves', '8:19:00', '6:39:00', 'n', 2);
insert into grupo (`dia`, `hora_inicio`, `hora_final`, `identificador_g`, `fk_asociar_club`) values ('miercoles', '10:00:00', '12:00:00', 'n', 8);

/*representante*/

insert into representante (`docdeidentidad`, `nombre`, `apellido`, `correo`, `telefono`) VALUES (16745210, 'José', 'Guevara', 'jose_guevara@gmail.com', NULL);
insert into representante (`docdeidentidad`, `nombre`, `apellido`, `correo`, `telefono`) VALUES (18901675, 'María', 'Gutiérrez', 'maria_gutierrez@hotmail.com', 584243437015);
insert into representante (`docdeidentidad`, `nombre`, `apellido`, `correo`, `telefono`) VALUES (15076356, 'Manuel', 'Pérez', 'manuel_perez@yahoo.com', NULL);
insert into representante (`docdeidentidad`, `nombre`, `apellido`, `correo`, `telefono`) VALUES (19321874, 'José', 'Maldonado', 'jose_maldonado@gmail.com', NULL);
insert into representante (`docdeidentidad`, `nombre`, `apellido`, `correo`, `telefono`) VALUES (100000001, 'Carmen', 'Jazmín', 'carmen_jazmin@gmail.com', 584148934567);

#//////////////Tabla Miembros///////////////////////////

#(HOMBRES)

insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (24469981, 'Neville', 'Grange', 'Geleman', 'Pau', 'hombre', '1997-11-13', 7051283566, 2, 1, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (18580181, 'Karlens', 'Delmer', 'Wulfinger', 'Thibodeaux', 'hombre', '1982-02-08', 6790613837, 2, 1, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (70250552, 'Allin', 'Pacorro', 'Izaks', 'Moody', 'hombre', '1989-04-17', 8919534345, 2, 1, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (41158936, 'Montgomery', 'Waylan', 'Philippault', 'Applegarth', 'hombre', '1987-01-12', 1256443652, 2, 1, null, null);

insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (41258788, 'Lucas', 'Milo', 'Phulthu', 'Aplaces', 'hombre', '1981-01-10', 2415587799, 3, 8, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (33335544, 'Luciano', 'Lacar', 'thurus', 'Moreno', 'hombre', '1994-05-01', null, 3, 8, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (88251000, 'Giorno', 'Golden', 'Wind', 'Futureath', 'hombre', '1981-05-10', 2477889921, 3, 8, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (41258708, 'Martin', 'loli', 'Bashggra', 'Acuare', 'hombre', '1987-02-07', 0479113451, 3, 8, null, null);

#(MUJERES)

insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (23996038, 'Shela', 'Tabina', 'Stork', 'Dwelley', 'mujer', '1992-02-08', 2559343654, 2, 1, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (27515873, 'Odella', 'Dyana', 'Ayling', 'Maidens', 'mujer', '1999-11-19', 812210734, 2, 1, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (42576799, 'Kylie', 'Lottie', 'Littleover', 'Hellens', 'mujer', '1974-08-08', 7444017417, 2, 1, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (72277354, 'Alma', 'Agathe', 'Grevatt', 'McEniry', 'mujer', '1986-06-07', 4713477464, 2, 1, null, null);

insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (23232333, 'Lucia', 'Maria', 'Cardoso', 'degubeia', 'mujer', '1978-01-10', null, 3, 8, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (33331000, 'Ivana', 'Alejandra', 'Moreno', 'Quintero', 'mujer', '1954-05-01', null, 3, 8, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (222113333, 'Giorllina', 'Sam', 'Laugiorna', 'Langosta','mujer', '1979-05-10', 40050880, 3, 8, null, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (55541111, 'Martina', 'Lolina', 'Bashnar', 'Acuarya', 'mujer', '1993-07-14', 80805555, 3, 8, null, null);

#NIñOS con responsable

insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (61260780, 'Nanete', 'Chiquia', 'Westwater', 'Noakes', 'mujer', '2012-07-23', null, 2, 2, null, 16745210);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (48074557, 'Leela', 'Colette', 'Ralphs', 'Howsego', 'mujer', '2008-03-07', null, 2, 2, null, 18901675);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (41866006, 'Binni', 'Gloriane', 'Harcase', 'Hamil', 'mujer', '2007-02-13', null, 2, 2, null, 15076356);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (51643094, 'Rozanne', 'Sena', 'Sartin', 'Flaws', 'mujer', '2003-05-27', null, 2, 2, null, 19321874);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (46817561, 'Jdavie', 'Ewell', 'Wollrauch', 'Blaase', 'hombre', '2011-02-02', null, 2, 2, null, 100000001);

#NIñOS con representante

insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (35739191, 'Lara', 'Florrie', 'Luna', 'Tewkesbury.', 'mujer', '2006-01-07', null, 1, 2, 24469981, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (67496700, 'Florence', 'Camile', 'Cuppitt', 'Greson', 'mujer', '2008-01-16', null, 1, 2, 18580181, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (28569796, 'Addia', 'Britteny', 'Jesteco', 'Regus', 'mujer', '2006-03-10', null, 1, 2, 70250552, null);
insert into miembro (`docdeindentidad`, `nombre`, `nombre2`, `apellido`, `apellido2`, `genero`, `fecha_nacimiento`, `telefono`, `fk_pertenece_lugar`, `fk_club`, `fk_representante`, `fk_responsable`) values (33261590, 'Kym', 'Rubia', 'Fenge', 'Lathan', 'mujer', '2003-05-31', null, 1, 2, 41158936, null);

/*============Historico Membresia=====*/
/*adultos*/
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 41258788);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 33335544);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 88251000);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 41258708);

insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 23232333);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 33331000);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 222113333);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-26', null, 'activo', null, 8, 55541111);

insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 24469981);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 18580181);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 70250552);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 41158936);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 23996038);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 27515873);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 42576799);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 1, 72277354);

/*niños con responsable*/
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 61260780);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 48074557);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 41866006);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 51643094);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 46817561);
/*niños con representante*/
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 35739191);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 67496700);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 28569796);
insert into historico_membresia (fechai, fechaf, estatus, motivo_retiro, fk_verificar_club, fk_reg_his) values ('2019-12-17', null, 'activo', null, 2, 33261590);

/*===============Pago===============*/

insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 41258788, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 33335544, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 88251000, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 41258708, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 23232333, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 33331000, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 222113333, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-10', 55541111, 8, '2019-12-26');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 24469981, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 18580181, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 70250552, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 41158936, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 23996038, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 27515873, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 42576799, 1, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 72277354, 1, '2019-12-17');

/*Pago de niños con responsable*/

insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 61260780, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 48074557, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 41866006, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 51643094, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 46817561, 2, '2019-12-17');

/*Pago de niños con representante*/

insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 35739191, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 67496700, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 28569796, 2, '2019-12-17');
insert into pago (fecha, fk_pago_realizado, fk_pago_realizado2, fk_pago_realizado3) values ('2019-12-17', 33261590, 2, '2019-12-17');

/*=======Espacio=============*/

insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (150, 'alquilado', 'Teatro Simón Bolívar', 1,5);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (1.000 ,'alquilado','Teatro Baralt', 5,6);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (1.865, 'alquilado', 'Teatro Bouwerie Lane', 2,null);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (1900, 'alquilado', 'Teatro Ford', 6,2);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (630, 'alquilado', 'Teatro Salone Margherita', 3,3);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (1800, 'alquilado', 'Teatro Sistina', 7,null);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (797, 'alquilado', 'Teatro del Ambigu-Comique', 4, null);
insert into espacio (capacidad, condicion, nombre, fk_tiene_espacio, fk_posee_sala) values (2.804, 'alquilado', 'Opéra Nouvel Lyon', 8,8);

/*=======OBRA======*/

insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (800, 'La furia y los colores','El joven José Miguel ya ha terminado la universidad y empieza su etapa como médico en prácticas. España vivía en una dictadura; ir a la universidad franquista era toda una aventura. Hijo de una familia numerosa de clase media, tenía prisa por salir y vivir lo que en este país de tonos grises estaba vedado. El extranjero, como metáfora de libertad, y la farándula, como alternativa de una existencia en tecnicolor, se convierten en opciones al alcance de su mano.', 2, true, 1);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (250, 'The Cambridge Economic History of Australia', 'La historia económica de Australia es la historia de la transformación de una economía indígena y un pequeño asentamiento de convictos, en una nación de casi 23 millones de personas con estructuras económicas, sociales y políticas avanzadas. Es una historia de vastas tierras con recursos ricos y explotables, de adversidad en la guerra, y prosperidad y construcción de la nación. También es una historia del comportamiento humano y las instituciones creadas para aprovechar y gobernar el esfuerzo humano.', 2, true, 4);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (300, 'Shangrila Malcolm Knox', 'Dennis Keith, también conocido como DK, cincuenta y ocho, ciento quince libras, vive detrás de su Ray-Ban y se retiró a una aldea de retiro con su vieja madre, trastorno obsesivo compulsivo y paranoia. La llegada de una joven periodista perturba su rutina: planea escribir su biografía para finalmente alegrarle el pasado y el mito de su carrera. Porque DK, joven prodigio de Gold Coast y primer campeón mundial de surf, fue una leyenda en la década de 1970.', 2,true, 4);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (500, 'Heinrich Mann (1871-1950). Entre "Poder de la bondad" y "Dictadura de la razón". Retratos humanísticos', 'El trabajo literario y periodístico de Heinrich Mann (1871-1950) está profundamente influenciado por los impulsos humanistas. La humanidad está en estrecha relación con la razón, la bondad, la democracia, la libertad, la verdad y la paz, y tiene un carácter decididamente combativo (hasta la demanda de una "dictadura de la razón"). El escritor fue un crítico agudo del Imperio y se convirtió en un representante intelectual de la República de Weimar, pero al mismo tiempo también un fiscal de sus debilidades. Aborreció el movimiento nazi desde su inicio y se exilió en febrero de 1933 (Francia, 1940, EE. UU.).', 2, false, 1);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (350, 'ESSA GENTE Chico Buarque', 'Un escritor decadente enfrenta una crisis financiera y emocional cuando Río de Janeiro se derrumba a su alrededor. Tragicomedia urgente, la nueva novela de Chico Buarque es la primera gran obra literaria que enfrenta Brasil ahora.', 5, false, 2);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (350,'Cahier Segalen', 'Este Cahier reúne una serie de homenajes firmados por escritores que tienen una relación especial con Segalen. ', 2, false, 2);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (200, 'La tormenta de reunión', 'El primer volumen de las memorias de seis volúmenes de Winston Churchill como estadista y líder durante la Segunda Guerra Mundial, The Gathering Storm comienza con sus pensamientos sobre la Primera Guerra Mundial, y cómo su finalización sentó las bases para el próximo conflicto global.', 2, true, 7);
insert into obra (precio, nombre_obra, resumen, duracion, estatus_activa, fk_practican) values (150, 'La Basílica de María Auxiliadora de Lima: cronología (1916-2016)', 'describe cronológicamente los principales hechos que marcaron la historia de esta Iglesia, desde la colocación de la primera piedra, su inauguración como parte de las celebraciones del centenario de la Independencia patria, hasta los acontecimientos más destacados en el  2016.', 3, true,1);

/*============Personaje============*/

insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values ('El joven José Miguel ya ha terminado la universidad y empieza su etapa como médico en prácticas.', 'José Miguel ', 'principal',1);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values ('obeso, mentalmente enfermo y viviendo en una aldea de retiro con su madre.', 'Dennis Keith', 'principal', 3);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values ('Dennis es un niño pobre de Gold Coast que misteriosamente fue encontrado y adoptado por su madre "Mo" Keith.', 'Dennis', 'secundario', 3);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values (null, 'Megan - (la "Bi-Fricken-Ographer")', 'secundario', 3);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values (null, 'Rodney Keith - hermano de Dennis', 'secundario', 3);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values (null, 'Manuel Duarte', 'principal', 5);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values (null,'Lisa Exmire - cantante, novia de Dennis.','secundario',3);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values (null, 'FJ - amigo, surfista', 'secundario', 3);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values ('El juego hecho de metal', 'Inosuyke', 'secundario', 4);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values ('El maestro de la fuerza de serpiente', 'Bang', 'secundario', 4);
insert into personaje (descripcion, nombre_personaje, tipo, fk_actor_obra) values ('Cyborg Demoniaco', 'Genos', 'principal', 4);

/*===========calendario_presentacion*/

insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-7-10', '18:48:00', 'activa', 4.6, 20, 1);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-3-11', '20:38:00', 'no activa', 4.2, null, 2);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-5-23', '12:51:00', 'activa', 3.4, 30, 3);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-8-15', '10:04:00', 'activa', 4.0, 20, 4);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-5-16', '11:13:00', 'no activa', 2.6, 66, 5);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-5-24', '10:29:00', 'no activa', 3.1, 65, 6);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-10-24', '17:48:00', 'activa', 2.9, 10, 7);
insert into calendario_presentacion (fecha, hora_inicio, estatus_realizada, valoracion, cantidad_asistentes, fk_calendario) values ('2020-3-3', '15:17:00', 'no activa', 1.5, 30, 8);

/*===========clasificacion*/

insert into clasificacion (nombre,tipo,fk_varios_recursiva) values("Terror","com",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("Thriller","oda",1);
insert into clasificacion (nombre,tipo,fk_varios_recursiva) values("Fantasia","sat",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva) values("Novela de aventuras","rom",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva) values("Novela gotica","tra",2);
insert into clasificacion (nombre,tipo,fk_varios_recursiva) values("Romance paranormal","epo",4);
insert into clasificacion (nombre,tipo,fk_varios_recursiva) values("Novela","rom",5);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("Fantasia","rom",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("rock and roll","bib",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("autoayuda","ens",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("economia","cro",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("politica","bib",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("ficcion","cue",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("tragedia","mem",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("tragedia","mem",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("viaje","bib",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("historico","cro",NULL);
insert into clasificacion (nombre,tipo,fk_varios_recursiva)	values("novela","cue",NULL);

/*===========editorial*/

insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ('Editorial Planeta',416, 1);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ('Rosetta Books',  381,2);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ('Cambridge University Press', 624,2);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ('Königshausen & Neumann', 82,8);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ('Asphalte éditions', 416, 7);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ('Companhia das Letras',200, 6);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values (' Editorial Salesiana', 354, 1);
insert into editorial (nombre, total_paginas, fk_fundada_lugar) values ("Éditions de l'Herne", 288, 7);

/*===========libro*/

insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (97499912, "La furia y los colores", null, null, null, 2019, 1, 1, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (18934512, "Terra Alta", null, null, null, 2019, 1, 18, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (77506636, 'La tormenta de reunión', null, null, null, 1953, 2, 17, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (32465086, 'The Cambridge Economic History of Australia', null, null, null, 2014, 3, 11, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (00497985, 'Heinrich Mann (1871-1950). Entre "Poder de la bondad" y "Dictadura de la razón". Retratos humanísticos', null, null, null, 2019, 4, 12, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (11598107, 'Shangrila Malcolm Knox', null, null, null, 2019, 5, 13, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (82511290, 'ESSA GENTE Chico Buarque', null, null, null, 2019,6, 14, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (33785559, 'La Basílica de María Auxiliadora de Lima: cronología (1916-2016)', null, null, null, 2016, 7, 16, null);
insert into libro (ISBN, titulo_original, url, tema, titulo_espanol, ano, fk_publica_editorial, fk_valorarlib_clasificacion, fk_continuar_libro) values (11712070, 'Cahier Segalen', null, null, null, 1998, 8, 17, null);

/*===================ESTRUCTURA======================*/

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', 'Viaje por Europa', 'cap',null, 97499912);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'Universidad', 'cap',null, 97499912);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'Los bares','cap',null, 97499912);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 4', 'El rastro','cap',null, 97499912);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 5', 'Rockeros', 'cap',null, 97499912);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 6', 'Es una mierda este Madrid', 'cap',null, 97499912);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 7', 'Subiendo a respirar','cap',null, 97499912);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 8', 'Al otro lado del espejo','cap',null, 97499912);
/*------*/

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', 'Un crimen terrible', 'cap', null, 18934512);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'Terra Alta', 'cap', null, 18934512);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'Barcelona', 'cap', null, 18934512);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 4', 'Melchor Marín', 'cap', null, 18934512);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 5', 'Los miserables', 'cap', null, 18934512);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 6', 'Cosette', 'cap', null, 18934512);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 1', 'McLean’s', 'cap', null, 32465086);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 2', 'Chronologically', 'cap', null, 32465086);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 3', 'Australian Aborigines', 'cap', null, 32465086);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 4', 'European population', 'cap', null, 32465086);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 5', 'Melbourne', 'cap', null, 32465086);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', 'Cultura de Lima', 'act' , null, 33785559);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'Lo que se necesita', 'scp' , null, 33785559);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'Lo que puedas pensar', 'cap' , null, 33785559);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', 'Con consciencia', 'cap', null, 77506636);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'Introduccion al sentido', 'cap', 1, 77506636);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'En el comienzo', 'cap', 2, 77506636);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 4', 'Principal de la cabeza de salmar', 'cap', null, 77506636);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 5', 'El escondite de franco', 'act', null, 77506636);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 6', 'El que divide', 'scp', null, 77506636);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', 'El invensible renace', 'cap', null, '82511290');
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'El kyubi nace', 'cap', null, '82511290');
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'Quien es naruto?', 'cap', null, '82511290');
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 4', 'Madara Uchiha', 'cap', null, '82511290');
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 5', 'Las mil lunas', 'cap', null, '82511290');

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 1', 'Ce Cahier', 'cap', null, 11712070);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 2', 'Victor Segalen', 'cap', null, 11712070);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 3', 'milieux qu’il fréquente', 'cap', null, 11712070);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Chapter 4', 'Grande Statuaire', 'cap', null, 11712070);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', 'Materialien','cap',null, 497985);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'Leben und Werk','cap',null, 497985);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'Geschichte und Probleme der Forschung','cap',null, 497985);

insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 1', '»Was ist eigentlich ein Schriftsteller?«','cap',null, 11598107);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 2', 'Demokratischer Dichter und universeller Intellektueller im Kaiserreich','cap',null, 11598107);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 3', 'Literarischer Repräsentant der Weimarer Republik','cap',null, 11598107);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 4', 'Front gegen den Faschismus aus dem Exil','cap',null, 11598107);
insert into estructura (nombre, titulo, tipo, fk_divide_estructura_recursiva, fk_informacion_libro) values ('Capitulo 5', 'Zeitalter und Zeitgenossenschaft','cap',null, 11598107);

/*==============Libros Preferidos==============*/

insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 24469981, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 24469981, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 24469981, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 18580181, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 18580181, 00497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 18580181, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 70250552, 82511290);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 70250552, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 70250552, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 41158936, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 41158936, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 41158936, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 23996038, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 23996038, 00497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 23996038, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 27515873, 82511290);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 27515873, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 27515873, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 42576799, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 42576799, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 42576799, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 72277354, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 72277354, 82511290);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 72277354, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 28569796, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 28569796, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 28569796, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 33261590, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 33261590, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 33261590, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 35739191, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 35739191, 82511290);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 35739191, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 41866006, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 41866006, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 41866006, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 46817561, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 46817561, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 46817561, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 48074557, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 48074557, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 48074557, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 51643094, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 51643094, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 51643094, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 61260780, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 61260780, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 61260780, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 67496700, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 67496700, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 67496700, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 23232333, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 23232333, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 23232333, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 33331000, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 33331000, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 33331000, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 222113333, 11598107);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 222113333, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 222113333, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 55541111, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 55541111, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 55541111, 11712070);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 41258788, 82511290);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 41258788, 32465086);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 41258788, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 33335544, 33785559);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 33335544, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 33335544, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 88251000, 18934512);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 88251000, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 88251000, 77506636);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (1, 41258708, 97499912);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (2, 41258708, 497985);
insert into libros_preferidos (posicion, fk_analisis_miembro, fk_preferidos_libro) values (3, 41258708, 33785559);

/*////////////////////Tabla c_o /////////////////////////////////*/

insert into c_o (`fk_valorar`,`fk_criterio`) values (1,1);
insert into c_o (`fk_valorar`,`fk_criterio`) values (2,2);
insert into c_o (`fk_valorar`,`fk_criterio`) values (3,3);
insert into c_o (`fk_valorar`,`fk_criterio`) values (4,4);
insert into c_o (`fk_valorar`,`fk_criterio`) values (5,5);
insert into c_o (`fk_valorar`,`fk_criterio`) values (6,6);
insert into c_o (`fk_valorar`,`fk_criterio`) values (7,7);
insert into c_o (`fk_valorar`,`fk_criterio`) values (8,8);

/*==================O_L=====================*/

insert into o_l (fk_tiene_lib,fk_tiene_obra) values (1,97499912);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (2,32465086);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (3,11598107);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (4,00497985);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (5,82511290);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (6,11712070);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (7,77506636);
insert into o_l (fk_tiene_lib,fk_tiene_obra) values (8,33785559);

/*=====================g_l adultos==================*/

insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', null, '2019-12-17', 1, 24469981, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', null, '2019-12-17', 1, 18580181, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', null, '2019-12-17', 1, 70250552, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', '2020-02-11', '2019-12-17', 1, 41158936, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', '2020-02-25', '2019-12-17', 1, 23996038, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', null, '2019-12-17', 1, 27515873, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', '2020-02-18', '2019-12-17', 1, 42576799, 1, 1);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2020-01-01', '2020-02-12', '2019-12-17', 1, 72277354, 1, 1);

insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 41258788, 3, 8);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 33335544, 3, 8);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 88251000, 3, 8);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 41258708, 3, 8);

insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 23232333, 3, 8);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 33331000, 3, 8);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 222113333, 3, 8);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-12-30', null, '2019-12-26', 8, 55541111, 3, 8);

/*=====================g_l niños con responsable==================*/

insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 61260780, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 48074557, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 41866006, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 51643094, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 46817561, 2, 2);

/*=====================g_l niños con representante==================*/

insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 35739191, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 67496700, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 28569796, 2, 2);
insert into g_l (fecha_inicio, fecha_f, fk_verificar_grupo_1, fk_verificar_grupo_2, fk_verificar_grupo_3, fk_reg_grupo_1, fk_reg_grupo_2) 
values ('2019-03-01', null, '2019-12-17', 2, 33261590, 2, 2);

/*=================Reunion Adultos =====================*/

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-01','Muy rara y robusta', 2.1, '2019-12-17', 1, 72277354, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-08','No se que comentar pero estuvo bueno', 4.9, '2019-12-17', 1, 41158936, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-15','Conclusion aceptada', 3.7, '2019-12-17', 1, 27515873, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-22','Ya quiero que sea las 12', 4.4, '2019-12-17', 1, 70250552, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2019-12-25','Feliz Navidad', 3.4, '2019-12-17', 1, 42576799, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-29','Muy mentalista', 3.4, '2019-12-17', 1, 18580181, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-02-05','Muy filosofico osi osi', 3.1, '2019-12-17', 1, 23996038, 1, 1, 97499912, 1, 1);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-02-12','Increible la ciencia de los colores', 4.2, '2019-12-17', 1, 24469981, 1, 1, 97499912, 1, 1);

/*=================Reunion niños con representante =====================*/

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-09','No entendi aiuda', 4.0, '2019-12-17', 2, 35739191, 2, 2, 18934512, 2, 2);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-16','Intersante palabras para aprender su significado', 3.2, '2019-12-17', 2, 67496700, 2, 2, 18934512, 2, 2);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-02','Intersante palabras para buscar', 4.6, '2019-12-17', 2, 28569796, 2, 2, 18934512, 2, 2);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2) 
values
('2020-01-23','Compasion y sentimientos encontrados en este libro', 4.9, '2019-12-17', 2, 33261590, 2, 2, 18934512, 2, 2);

/*=================Reunion niños con responsable =====================*/

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2)
values
('2020-01-30','Me parecio bonita', 4.7, '2019-12-17', 2, 61260780,2,2,18934512,2,2);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2)
values
('2020-02-06','Me parecio normal', 3.7, '2019-12-17',2,48074557,2,2,18934512,2,2);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2)
values
('2020-02-13','Nada entretenida', 1.7, '2019-12-17',2,41866006,2,2,18934512,2,2);

insert into reunion
(fecha, conclusiones, valoracion, fk_moderador_1, fk_moderador_2, fk_moderador_3, fk_moderador_4, fk_moderador_5, fk_se_usa, fk_tiene_reunion_1, fk_tiene_reunion_2)
values
('2019-12-26','Prefiero Harry potter', 2.0, '2019-12-17',2,46817561,2,2,18934512,2,2);

/*======================Asistencia con adultos=================*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 23996038, 1, 1, 1, 1, '2019-12-25');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 24469981, 1, 1, 1, 1, '2019-12-25');

/*1 enero*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2020-01-01');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-01-01');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-01-01');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-01-01');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-01-01');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2020-01-01');

/*8 enero*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2020-01-08');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-01-08');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-01-08');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-01-08');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-01-08');

/*15 de enero*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 23996038, 1, 1, 1, 1, '2020-01-15');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 24469981, 1, 1, 1, 1, '2020-01-15');

/*22 de enero*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2020-01-22');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-01-22');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-01-22');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-01-22');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-01-22');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2020-01-22');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 23996038, 1, 1, 1, 1, '2020-01-22');

/*29 de enero*/

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-01-29');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-01-29');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-01-29');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-01-29');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2020-01-29');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 23996038, 1, 1, 1, 1, '2020-01-29');

/*5 de febrero*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2020-02-05');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-02-05');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-02-05');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-02-05');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-02-05');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2020-02-05');

/*12 de febrero*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17', 1, 72277354, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 41158936, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 27515873, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 70250552, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 42576799, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 18580181, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 23996038, 1, 1, 1, 1, '2020-02-12');

insert into asistencia 
(fk_se_hace_1, fk_se_hace_2, fk_se_hace_3, fk_se_hace_4, fk_se_hace_5, fk_asiste_1, fk_asiste_2, fk_asiste_3) 
values 
('2019-12-17', 1, 24469981, 1, 1, 1, 1, '2020-02-12');

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 46817561,2,2,2,2,'2019-12-26');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 35739191,2,2,2,2,'2019-12-26');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 67496700,2,2,2,2,'2019-12-26');

/*2 de enero*/

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2020-01-02');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2020-01-02');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2020-01-02');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2020-01-02');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 46817561,2,2,2,2,'2020-01-02');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2020-01-02');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2020-01-02');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 35739191,2,2,2,2,'2020-01-02');

/*9 de enero*/

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2020-01-09');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2020-01-09');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2020-01-09');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2020-01-09');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2020-01-09');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2020-01-09');

/*16 de enero de enero*/

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 46817561,2,2,2,2,'2020-01-16');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 35739191,2,2,2,2,'2020-01-16');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 67496700,2,2,2,2,'2020-01-16');

/*30 de enero*/

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 46817561,2,2,2,2,'2020-01-30');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 35739191,2,2,2,2,'2020-01-30');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 67496700,2,2,2,2,'2020-01-30');

/*6 de febrero*/

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2020-02-06');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2020-02-06');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2020-02-06');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2020-02-06');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2020-02-06');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2020-02-06');

/*13 de febrero*/

/*=============Asistencia con niños y su responsables===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 61260780,2,2,2,2,'2020-02-13');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 48074557,2,2,2,2,'2020-02-13');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 41866006,2,2,2,2,'2020-02-13');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 51643094,2,2,2,2,'2020-02-13');

/*=============Asistencia con niños y su representantes===========*/

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 28569796,2,2,2,2,'2020-02-13');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 33261590,2,2,2,2,'2020-02-13');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 35739191,2,2,2,2,'2020-02-13');

insert into asistencia 
(`fk_se_hace_1`, `fk_se_hace_2`, `fk_se_hace_3`, `fk_se_hace_4`, `fk_se_hace_5`, `fk_asiste_1`, `fk_asiste_2`, `fk_asiste_3`) 
values 
('2019-12-17',2, 67496700,2,2,2,2,'2020-02-13');

/*======================Tabla o_m=============================*/

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(4.5, 9, 4, 33261590, 2, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(4.2, 10, 4, 41866006, 2, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(3.2, 11, 4, 61260780, 2, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(3.5, 2, 3, 24469981, 1, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(4.2, 3, 3, 46817561, 2, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(3.7, 4, 3, 23996038, 1, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(4.5, 5, 3, 35739191, 2, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(2.8, 6, 5, 70250552, 1, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(3.3, 1, 1, 18580181, 1, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(4.1, 7, 3, 72277354, 1, '2019-12-17');

insert into o_m
(valoracion, fk_participa_ahora, fk_participa_ahora2, fk_ver_pertenece, fk_ver_pertenece2, fk_ver_pertenece3)
values
(3.6, 8, 3, 41158936, 1, '2019-12-17');

/*=====================Tabla mejor actor======================*/

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(2, 3, 24469981, 1, '2019-12-17', 1, '2020-07-10');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(3, 3, 46817561, 2, '2019-12-17', 2, '2020-03-11');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(4, 3, 23996038, 1, '2019-12-17', 3, '2020-05-23');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(5, 3, 35739191, 2, '2019-12-17', 4, '2020-08-15');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(1, 1, 18580181, 1, '2019-12-17', 5, '2020-05-16');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(6, 5, 70250552, 1, '2019-12-17', 6, '2020-05-24');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(7, 3, 72277354, 1, '2019-12-17', 7, '2020-10-24');

insert into mejor_actor
(fk_elegir_actor, fk_elegir_actor2, fk_elegir_actor3, fk_elegir_actor4, fk_elegir_actor5, fk_actor_presenta, fk_actor_presenta2)
values
(8, 3, 41158936, 1, '2019-12-17', 8, '2020-03-03');

/*=====================Asociacion===========================*/

insert into asociacion (fk_asocia, fk_asocia2) values (1, 2);
insert into asociacion (fk_asocia, fk_asocia2) values (1, 3);
insert into asociacion (fk_asocia, fk_asocia2) values (1, 4);
insert into asociacion (fk_asocia, fk_asocia2) values (2, 4);
insert into asociacion (fk_asocia, fk_asocia2) values (2, 6);
insert into asociacion (fk_asocia, fk_asocia2) values (2, 5);
insert into asociacion (fk_asocia, fk_asocia2) values (3, 7);
insert into asociacion (fk_asocia, fk_asocia2) values (3, 8);
insert into asociacion (fk_asocia, fk_asocia2) values (8, 3);
insert into asociacion (fk_asocia, fk_asocia2) values (8, 4);