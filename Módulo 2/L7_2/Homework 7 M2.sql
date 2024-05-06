-- Ejercicio 1
USE henry;

SELECT COUNT(nombre)
FROM carrera;
-- Henry tiene 2 carreras

-- Ejercicio 2
SELECT COUNT(cedulaIdentidad)
FROM alumno;
-- Hay en total 180 alumnos

-- Ejercicio 3
SELECT COUNT(cedulaIdentidad), idCohorte
FROM alumno
GROUP BY (idCohorte);
-- Hay 20 alumnos en cada cohorte

-- Ejercicio 4
SELECT fechaIngreso, CONCAT(apellido, " ", nombre) AS apellido_y_nombre
FROM alumno
ORDER BY fechaIngreso DESC;

-- Ejercicio 5 y 6
SELECT fechaIngreso, CONCAT(apellido, " ", nombre) AS apellido_y_nombre
FROM alumno
ORDER BY fechaIngreso ASC
LIMIT 1;
-- El primer alumno en ingresar fue Gardner Beverly y lo hizo el 4 de diciembre de 2019

-- Ejercicio 7
SELECT fechaIngreso, CONCAT(apellido, " ", nombre) AS apellido_y_nombre
FROM alumno
ORDER BY fechaIngreso DESC
LIMIT 1;
-- El último alumno en ingresar fue Harmon Jason

-- Ejercicio 8
SELECT YEAR(fechaIngreso) AS añoIngreso, COUNT(cedulaIdentidad)
FROM alumno
GROUP BY añoIngreso
ORDER BY añoIngreso ASC;

-- Ejercicio 9
SELECT YEAR(fechaIngreso) AS añoIngreso, 
	WEEKOFYEAR(fechaIngreso) AS semana,
    COUNT(cedulaIdentidad)
FROM alumno
GROUP BY añoIngreso, semana
ORDER BY añoIngreso;

-- Ejercicio 10
SELECT YEAR(fechaIngreso) AS añoIngreso, COUNT(cedulaIdentidad) AS cantidad
FROM alumno
GROUP BY añoIngreso
HAVING cantidad > 20;
-- Los años en los que ingresaron más de 20 alumnos fueron 2020, 2021 y 2022

-- Ejercicio 11
SELECT CONCAT(apellido,', ',nombre) AS apellidoNombre,
	TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad,
    DATE_ADD(fechaNacimiento, INTERVAL TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) YEAR) AS comprobarAño
FROM instructor;

-- Ejercicio 12
SELECT CONCAT(apellido,', ',nombre) AS apellidoNombre,
	TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad
FROM alumno;

SELECT AVG(TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE())) AS edadMedia
FROM alumno;
-- La edad promedio de los alumnos es de 33 años

SELECT AVG(TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE())) AS edadMedia, idCohorte
FROM alumno
GROUP BY idCohorte;

-- Ejercicio 13
SELECT CONCAT(apellido, ', ', nombre) AS apellidoNombre,
    TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad,
    (SELECT AVG(TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE())) FROM alumno) AS edadMedia
FROM alumno
HAVING edad > edadMedia;