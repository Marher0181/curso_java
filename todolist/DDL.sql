CREATE DATABASE IF NOT EXISTS TODOLIST;

USE TODOLIST;

CREATE TABLE IF NOT EXISTS USUARIO(
	id_Usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    pass VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS TAREA(
	id_Tarea INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    finalizado BOOLEAN NOT NULL, 
    id_Usuario INT,
    fecha_Creacion TIMESTAMP,
    FOREIGN KEY(id_Usuario) REFERENCES USUARIO (id_Usuario)
);
