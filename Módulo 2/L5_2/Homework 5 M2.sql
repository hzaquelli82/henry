DROP DATABASE henry;
CREATE DATABASE henry;

USE henry;

CREATE TABLE Carrera (
    id_carrera INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_carrera)
);

CREATE TABLE Instructores (
    id_instructor INT NOT NULL AUTO_INCREMENT,
    cedula_identidad INT NOT NULL,
    nombre_instructor VARCHAR(20) NOT NULL,
    apellido_instructor VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_incorporacion DATE,
    PRIMARY KEY (id_instructor)
);

CREATE TABLE Cohorte (
    id_cohorte INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    carrera INT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    instructor INT,
    PRIMARY KEY (id_cohorte),
    FOREIGN KEY (carrera) REFERENCES Carrera(id_carrera),
    FOREIGN KEY (instructor) REFERENCES Instructores(id_instructor)
);


CREATE TABLE Alumnos (
    id_alumno INT NOT NULL AUTO_INCREMENT,
    cedula_identidad INT NOT NULL,
    nombre_alumno VARCHAR(30) NOT NULL,
    apellido_alumno VARCHAR(20) NOT NULL,
    fecha_nacimiento_alumno DATE NOT NULL,
    fecha_ingreso_alumno DATE NOT NULL,
    cohorte INT,
    PRIMARY KEY (id_alumno),
    FOREIGN KEY (cohorte) REFERENCES Cohorte(id_cohorte)
);