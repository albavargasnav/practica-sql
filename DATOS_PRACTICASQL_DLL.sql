create schema DATOS_PRACTICASQL_DLL authorization frxvforn;

--Creo la tabla grupos
create table DATOS_PRACTICASQL_DLL.grupos(
	id_grupo varchar(100) not null, --PK
	nombre_grupo varchar(100) not null 
);


--Añado la PK de la tabla grupos
alter table DATOS_PRACTICASQL_DLL.grupos
add constraint idgrupo_PK primary key (id_grupo);


--Añado los datos de la tabla grupos
insert into DATOS_PRACTICASQL_DLL.grupos 
(id_grupo, nombre_grupo)
values ('001', 'RENAULT'),
('002', 'RENAULT'),
('003', 'VOLKSWAGEN'),
('004', 'VOLKSWAGEN'),
('005', 'PSA'),
('006', 'PSA')
;


--Creo la tabla marcas
create table DATOS_PRACTICASQL_DLL.marcas(
	id_marca varchar(100) not null, --PK
	nombre_marcas varchar(100) not null 
);


--Añado la PK de la tabla marcas
alter table DATOS_PRACTICASQL_DLL.marcas
add constraint idmarca_PK primary key (id_marca);


--Añado la FK de la tabla marcas
alter table DATOS_PRACTICASQL_DLL.marcas
add constraint marcas_grupos_FK foreign key (id_marca)
references DATOS_PRACTICASQL_DLL.grupos(id_grupo);


--Añado los datos de la tabla marcas
insert into DATOS_PRACTICASQL_DLL.marcas 
(id_marca, nombre_marcas)
values ('001', 'RENAULT'),
('002', 'RENAULT'),
('003', 'VOLKSWAGEN'),
('004', 'SEAT'),
('005', 'OPEL'),
('006', 'OPEL')
;


--Creo la tabla modelos
create table DATOS_PRACTICASQL_DLL.modelos(
	id_modelo varchar(100) not null, --PK
	nombre_modelos varchar(100) not null 
);


--Añado la PK de la tabla modelos
alter table DATOS_PRACTICASQL_DLL.modelos
add constraint idmodelo_PK primary key (id_modelo);


--Añado la FK de modelos
alter table DATOS_PRACTICASQL_DLL.modelos
add constraint modelos_marcas_FK foreign key (id_modelo)
references DATOS_PRACTICASQL_DLL.marcas(id_marca);


--Añado los datos de la tabla modelos
insert into DATOS_PRACTICASQL_DLL.modelos
(id_modelo, nombre_modelos)
values ('001', 'CLIO'),
('002', 'CAPTUR'),
('003', 'GOLF'),
('004', 'ALTEA'),
('005', 'ASTRA'),
('006', 'CORSA')
;


--Creo la tabla aseguradora
create table DATOS_PRACTICASQL_DLL.aseguradora(
	id_aseguradora varchar(100) not null, --PK
	nombre_aseguradora varchar(100) not null,
	fecha_activo date not null,
	activo varchar(100) not null
);


--Añado la PK de la tabla aseguradora
alter table DATOS_PRACTICASQL_DLL.aseguradora
add constraint idaseguradora_PK primary key (id_aseguradora);


--Añado los datos de la tabla aseguradora
insert into DATOS_PRACTICASQL_DLL.aseguradora
(id_aseguradora, nombre_aseguradora, fecha_activo, activo)
values ('001', 'AXA', '2008-11-12', 'SI'),
('002', 'GENESIS', '2022-07-03', 'SI'),
('003', 'MAPFRE', '2022-04-02', 'SI'),
('004', 'LINEA DIRECTA', '2022-01-10', 'SI'),
('005', 'AXA', '2022-06-04', 'SI'),
('006', 'MAPFRE', '2022-01-06', 'NO')
;


--Creo la tabla monedas
create table DATOS_PRACTICASQL_DLL.monedas(
	nombre_monedas varchar(100) not null --PK
);


--Añado la PK de la tabla monedas
alter table DATOS_PRACTICASQL_DLL.monedas
add constraint idmoneda_PK primary key (nombre_monedas);


--Añado los datos de la tabla monedas
insert into DATOS_PRACTICASQL_DLL.monedas (nombre_monedas)
values ('EURO'), ('DOLAR AMERICANO'), ('LIBRA'), ('YEN'), ('FRANCO SUIZO');


--Creo la tabla revision
create table DATOS_PRACTICASQL_DLL.revision(
	id_revision varchar(100) not null, --PK
	fecha_revision date not null,
	km_actuales varchar(100) not null,
	importe varchar(100) not null,
	moneda varchar(100) not null
);


--Añado la PK de la tabla revision
alter table DATOS_PRACTICASQL_DLL.revision
add constraint idrevision_PK primary key (id_revision);


--Añado los datos de la tabla revision
insert into DATOS_PRACTICASQL_DLL.revision 
(id_revision, fecha_revision, km_actuales, importe, moneda)
values ('001', '2023-01-02', 80000, '16875', 'EURO'),
('002', '2023-01-03', 100000, '5000', 'EURO'),
('003', '2023-01-04', 50400, '12400', 'EURO'),
('004', '2023-01-05', 20300, '16800', 'EURO'),
('005', '2023-01-06', 70000, '11200', 'EURO'),
('006', '2023-01-07', 33500, '15940', 'EURO');


--Añado la FK de revision 
alter table DATOS_PRACTICASQL_DLL.revision
add constraint revision_monedas_FK foreign key (moneda)
references DATOS_PRACTICASQL_DLL.monedas(nombre_monedas);


--Creo la tabla colores
create table DATOS_PRACTICASQL_DLL.colores(
	id_color varchar(100) not null, --PK
	nombre_colores varchar(100) not null
);


--Añado la PK de la tabla colores
alter table DATOS_PRACTICASQL_DLL.colores
add constraint colores_PK primary key (id_color);


--Añado los datos de la tabla colores
insert into DATOS_PRACTICASQL_DLL.colores (id_color, nombre_colores)
values ('001', 'BLANCO'),
('002', 'ROJO'),
('003', 'AZUL'),
('004', 'NEGRO'),
('005', 'GRIS'),
('006', 'BLANCO')
;


--Creo la tabla vehiculos
create table DATOS_PRACTICASQL_DLL.vehiculos(
	id_vehiculo varchar(10) not null, --PK
	modelo varchar(100) not null, --FK
	color varchar(100) not null, --FK
	fecha_compra date not null,
	matricula varchar(100) not null,
	total_km varchar(400) not null,
	poliza varchar(100) not null
);


--Añado la PK de la tabla vehiculos
alter table DATOS_PRACTICASQL_DLL.vehiculos 
add constraint vehiculos_PK primary key (id_vehiculo);


--Añado los datos de la tabla vehiculos
insert into DATOS_PRACTICASQL_DLL.vehiculos 
(id_vehiculo, modelo, color, fecha_compra, matricula, total_km, poliza)
values ('001', '001', 'BLANCO', '2008-11-11', '5575LYL', 80000, '89373'),
('002', '002', 'ROJO', '2022-07-02', '8035YEA', 100000, '34876'),
('003', '003', 'AZUL', '2022-04-01', '5865JJC', 50400, '75486'),
('004', '004', 'NEGRO', '2022-01-09', '4687YBQ', 20300, '16523'),
('005', '005', 'GRIS', '2022-06-03', '2754PVZ', 70000, '36925'),
('006', '006', 'BLANCO', '2022-01-05', '7478QJT', 33500, '15964')
;


--Añado la FK de vehiculos -> modelos
alter table DATOS_PRACTICASQL_DLL.vehiculos
add constraint vehiculos_modelos_FK foreign key (modelo)
references DATOS_PRACTICASQL_DLL.modelos(id_modelo);


--Añado la FK de vehiculos -> revision
alter table DATOS_PRACTICASQL_DLL.vehiculos
add constraint vehiculos_revision_FK foreign key (id_vehiculo)
references DATOS_PRACTICASQL_DLL.revision(id_revision);


--Añado la FK de vehiculo -> aseguradora
alter table DATOS_PRACTICASQL_DLL.vehiculos
add constraint vehiculos_aseguradora_FK foreign key (id_vehiculo)
references DATOS_PRACTICASQL_DLL.aseguradora(id_aseguradora);


--Añado la FK de vehiculo -> colores
alter table DATOS_PRACTICASQL_DLL.vehiculos
add constraint vehiculos_colores_FK foreign key(id_vehiculo)
references DATOS_PRACTICASQL_DLL.colores(id_color);




