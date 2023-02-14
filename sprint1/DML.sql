/*
INCESRCIÓN DE DATOS PARA LAS TABLAS
*/
INSERT INTO Turista (id_Turista, nombre, pais, sexo, edad)VALUES(1, 'Pepe','Honduras','M', 35);
INSERT INTO Turista (id_Turista, nombre, pais, sexo, edad)VALUES(2, 'Alphonso','Canadá','M', 18);
INSERT INTO Turista (id_Turista, nombre, pais, sexo, edad)VALUES(3, 'Mary','Inglaterra','F', 25);

INSERT INTO Recorrido (id_Recorrido, nombre, descripcion)VALUES(1, 'Aguas','Recorrido en bicicleta aguas termales');
INSERT INTO Recorrido (id_Recorrido, nombre, descripcion)VALUES(2, 'Cerro','Camping en el Cerro "Yaxcalanté"');
INSERT INTO Recorrido (id_Recorrido, nombre, descripcion)VALUES(3, 'Volcán','Ascenso al Volcán Tajumulco');

INSERT INTO Bitacora (id_Bitacora, id_Turista, id_Recorrido, fecha, karma) VALUES ('1', '1', '1', '2023-02-10', 'Excelente');
INSERT INTO Bitacora (id_Bitacora, id_Turista, id_Recorrido, fecha, karma) VALUES ('2', '2', '2', '2023-02-09', 'Podría Mejorar');
INSERT INTO Bitacora (id_Bitacora, id_Turista, id_Recorrido, fecha, karma) VALUES ('3', '3', '3', '2023-02-11', 'Bien');

INSERT INTO Idioma (id_Idioma, nombre_Idioma) VALUES ('1','Español');
INSERT INTO Idioma (id_Idioma, nombre_Idioma) VALUES ('2','Francés');
INSERT INTO Idioma (id_Idioma, nombre_Idioma) VALUES ('3','Inglés');

/*
Alteración Dablas
*/

ALTER TABLE Recorrido ADD Duracion INT;
ALTER TABLE Turista MODIFY pais VARCHAR(100);
ALTER TABLE Turista ADD  id_Idioma INT NOT NULL;
UPDATE Turista SET id_Idioma = '1' WHERE id_Turista = 1;
UPDATE Turista SET id_Idioma = '2' WHERE id_Turista = 2;
UPDATE Turista SET id_Idioma = '3' WHERE id_Turista = 3;
ALTER TABLE Turista ADD FOREIGN KEY (id_Idioma) REFERENCES Idioma(id_Idioma);

/*
Seleccióny visualización de tablas
*/
SELECT * FROM Turista;
SELECT * FROM Bitacora;
SELECT * FROM Idioma;
SELECT * FROM Recorrido;
