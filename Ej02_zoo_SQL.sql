CREATE SEQUENCE contador_id_zoo;
CREATE TABLE zoo
(
	id_zoo int NOT NULL DEFAULT nextval ('contador_id_zoo'),
	ciudad varchar(50) NOT NULL,
	nombre varchar(50) NOT NULL,
	tamano varchar(50) NOT NULL,
	pais varchar(50) NOT NULL,
	presupuesto int NOT NULL,
	constraint PK_id_zoo PRIMARY KEY (id_zoo) 
);

CREATE SEQUENCE contador_id_especie;
CREATE TABLE especie
(
	id_especie int NOT NULL DEFAULT nextval ('contador_id_especie'),
	nombre_cientifico varchar(50) NOT NULL,
	nombre_vulgar varchar(50) NOT NULL,
	familia varchar(50) NOT NULL,
	extincion boolean,
	constraint PK_id_especie PRIMARY KEY (id_especie) 
);

CREATE SEQUENCE contador_id_animal;
CREATE TABLE animal
(
	id_animal int NOT NULL DEFAULT nextval ('contador_id_animal'),
	sexo varchar(1) NOT NULL,
	especie varchar(50) NOT NULL,
	fecha_nacimiento date NOT NULL,
	continente varchar(50) NOT NULL,
	pais varchar(50) NOT NULL,
	id_zoo int NOT NULL,
	id_especie int NOT NULL,
	constraint PK_id_animal PRIMARY KEY (id_animal),
	constraint FK_id_zoo FOREIGN KEY (id_zoo)
		REFERENCES zoo (id_zoo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	constraint FK_id_especie FOREIGN KEY (id_especie)
		REFERENCES especie (id_especie)
		ON UPDATE CASCADE ON DELETE CASCADE
);