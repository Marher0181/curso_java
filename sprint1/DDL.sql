CREATE DATABASE IF NOT EXISTS Viajes;

USE Viajes;

CREATE TABLE IF NOT EXISTS Turista(
id_Turista INT(8) NOT NULL PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
pais VARCHAR(50) NOT NULL,
sexo CHAR(1) NOT NULL,
edad INT(3) NOT NULL
);

CREATE TABLE IF NOT EXISTS Recorrido(
id_Recorrido INT(8) NOT NULL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL UNIQUE,
descripcion TEXT NOT NULL 
);

CREATE TABLE IF NOT EXISTS Bitacora(
id_Bitacora INT NOT NULL PRIMARY KEY,
id_Turista INT NOT NULL,
id_Recorrido INT NOT NULL,
fecha DATE,
karma SET ('Excelente', 'Bien', 'Podría Mejorar', 'Malo'),
FOREIGN KEY (id_Turista) REFERENCES Turista(id_Turista),
FOREIGN KEY (id_Recorrido) REFERENCES Recorrido(id_Recorrido)
);

CREATE TABLE IF NOT EXISTS Numeros(
cero INT(5) ZEROFILL,
precio INT DEFAULT 100
);

CREATE TABLE IF NOT EXISTS Idioma(
id_Idioma INT NOT NULL PRIMARY KEY,
nombre_Idioma VARCHAR(25) NOT NULL
);


