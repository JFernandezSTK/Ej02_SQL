CREATE SEQUENCE contador_id_socios;
CREATE TABLE IF NOT EXISTS socio
(
	id_socio int NOT NULL DEFAULT nextval ('contador_id_socios'),
	dni varchar(10) NOT NULL,
	nombre varchar(50) NOT NULL,
	apellidos varchar(50) NOT NULL,
	telefono varchar(9) NOT NULL,
	avalador int NOT NULL,
	id_poblacion int NOT NULL,
	constraint PK_id_socio PRIMARY KEY (id_socio) 
);

CREATE SEQUENCE contador_id_poblacion;
CREATE TABLE poblacion
(
	id_poblacion int NOT NULL DEFAULT nextval ('contador_id_poblacion'),
	nombre varchar(50) NOT NULL,
	habitantes int NOT NULL,
	pais varchar(50) NOT NULL,
	id_provincia int NOT NULL,
	constraint PK_id_poblacion PRIMARY KEY (id_poblacion) 
);

CREATE SEQUENCE contador_id_provincia;
CREATE TABLE provincia
(
	id_provincia int NOT NULL DEFAULT nextval ('contador_id_provincia'),
	nombre varchar(50) NOT NULL,
	ext int NOT NULL,
	id_almacen int NOT NULL,
	constraint PK_id_provincia PRIMARY KEY (id_provincia) 
);

CREATE SEQUENCE contador_id_almacenes;
CREATE TABLE almacen
(
	id_almacen int NOT NULL DEFAULT nextval ('contador_id_almacenes'),
	direccion varchar(50) NOT NULL,
	fecha date NOT NULL,
	constraint PK_id_almacen PRIMARY KEY (id_almacen) 
);

CREATE TABLE libro
(
	isbn varchar(20) NOT NULL,
	titulo varchar(50) NOT NULL,
	editorial varchar(50) NOT NULL,
	id_coleccion int NOT NULL,
	constraint PK_isbn PRIMARY KEY (isbn) 
);

CREATE SEQUENCE contador_id_coleccion;
CREATE TABLE colecciones
(
	id_coleccion int NOT NULL DEFAULT nextval ('contador_id_coleccion'),
	volumentes int NOT NULL,
	constraint PK_id_coleccion PRIMARY KEY (id_coleccion) 
);

CREATE SEQUENCE contador_id_pedido;
CREATE TABLE pedido
(
	id_pedido int NOT NULL DEFAULT nextval ('contador_id_pedido'),
	forma_envio varchar(50) NOT NULL,
	forma_pago varchar(50) NOT NULL,
	id_socio int NOT NULL,
	constraint PK_id_pedido PRIMARY KEY (id_pedido),
	constraint un_id_socio UNIQUE (id_socio)
);

CREATE SEQUENCE contador_id_detalles;
CREATE TABLE detalles_pedido
(
	id_detalles_pedido int NOT NULL DEFAULT nextval ('contador_id_detalles'),
	cantidad int NOT NULL,
	isbn varchar(50) NOT NULL,
	id_pedido int NOT NULL,
	constraint PK_id_detalles_pedido PRIMARY KEY (id_detalles_pedido) 
);

CREATE SEQUENCE contador_id_libroalmacen;
CREATE TABLE libro_almacen
(
	id_libro_almacen int NOT NULL DEFAULT nextval ('contador_id_libroalmacen'),
	cantidad int NOT NULL,
	isbn varchar(20) NOT NULL,
	id_almacen int NOT NULL,
	constraint PK_id_libro_almacen PRIMARY KEY (id_libro_almacen) 
);

ALTER TABLE IF EXISTS socio 
	add constraint FK_id_poblacion FOREIGN KEY (id_poblacion)
		REFERENCES poblacion (id_poblacion)
		ON UPDATE CASCADE ON DELETE CASCADE,
	add constraint FK_avalador FOREIGN KEY (avalador)
		REFERENCES socio (id_socio)
		ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE IF EXISTS poblacion 
	add constraint FK_id_provincia FOREIGN KEY (id_provincia)
		REFERENCES provincia (id_provincia)
		ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE IF EXISTS provincia 
	add constraint FK_id_almacen FOREIGN KEY (id_almacen)
		REFERENCES almacen (id_almacen)
		ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE IF EXISTS libro 
	add constraint FK_id_coleccion FOREIGN KEY (id_coleccion)
		REFERENCES colecciones (id_coleccion)
		ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE IF EXISTS pedido 
	add constraint FK_id_socio FOREIGN KEY (id_socio)
		REFERENCES socio (id_socio)
		ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE IF EXISTS detalles_pedido 
	add constraint FK_id_pedido FOREIGN KEY (id_pedido)
		REFERENCES pedido (id_pedido)
		ON UPDATE CASCADE ON DELETE CASCADE,
	add constraint FK_isbn FOREIGN KEY (isbn)
		REFERENCES libro (isbn)
		ON UPDATE CASCADE ON DELETE CASCADE
;

ALTER TABLE IF EXISTS libro_almacen 
	add constraint FK_id_almacen FOREIGN KEY (id_almacen)
		REFERENCES almacen (id_almacen)
		ON UPDATE CASCADE ON DELETE CASCADE,
	add constraint FK_isbn FOREIGN KEY (isbn)
		REFERENCES libro (isbn)
		ON UPDATE CASCADE ON DELETE CASCADE
;