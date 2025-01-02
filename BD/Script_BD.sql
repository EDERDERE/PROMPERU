USE master;
DROP DATABASE IF EXISTS TestPromPeru_Dev;
CREATE DATABASE TestPromPeru_Dev;
USE TestPromPeru_Dev;

-- Creación de tablas

CREATE TABLE Multimedia (
    Mult_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_URLImagen VARCHAR(255),
    Mult_URLVideo VARCHAR(255),
    Mult_URLIcon VARCHAR(255),
    Mult_URLFile VARCHAR(255)
);

CREATE TABLE Banner (
    Bann_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Bann_Orden INT,
    Bann_Nombre VARCHAR(50)
);

CREATE TABLE Informacion (
    Info_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Info_Titulo VARCHAR(255),
    Info_Descripcion VARCHAR(MAX)
);

CREATE TABLE Requisito (
    Requ_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Requ_Orden INT,
    Requ_Requisito VARCHAR(50)
);

CREATE TABLE Inscripcion (
    Insc_ID INT IDENTITY(1,1) PRIMARY KEY,
    Etap_ID INT,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Insc_Titulo VARCHAR(50),
    Insc_Contenido VARCHAR(200)
);

CREATE TABLE Beneficio (
    Bene_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Bene_Beneficio VARCHAR(50),
    Bene_Descripcion VARCHAR(200),
    Bene_Orden INT
);

CREATE TABLE CasoExito (
    Cexi_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Cexi_Casos VARCHAR(50),
    Cexi_Orden INT
);

CREATE TABLE EmpresaGraduada (
    Egra_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Egra_NombreEmpresa VARCHAR(50),
    Egra_Orden INT,
    Egra_Descripcion VARCHAR(200)
);

CREATE TABLE Contacto (
    Cont_ID INT IDENTITY(1,1) PRIMARY KEY,
    Cont_Nombre VARCHAR(50),
    Cont_Apellido VARCHAR(50),
    Cont_Correo VARCHAR(50),
    Cont_Mensaje VARCHAR(200)
);

CREATE TABLE Evaluacion (
    Eval_ID INT IDENTITY(1,1) PRIMARY KEY,
    Eval_Alternativa VARCHAR(1),
    Eval_RespuestaCorrecta VARCHAR(500),
    Eval_Aprobado BIT,
    Eval_PuntajePregunta DECIMAL(5,2),
    Eval_PuntajeIndividual DECIMAL(5,2),
    Eval_PuntajeGlobal DECIMAL(5,2)
);

CREATE TABLE Cliente (
    Clie_ID INT IDENTITY(1,1) PRIMARY KEY,
    Clie_RUC VARCHAR(11),
    Clie_RazonSocial VARCHAR(20),
    Clie_NombreComercial VARCHAR(20),
    Clie_Telefono VARCHAR(15),
    Clie_Celular VARCHAR(15),
    Clie_Correo VARCHAR(50),
    Clie_Region VARCHAR(15),
    Clie_Provincia VARCHAR(15)
);

CREATE TABLE Respuesta (
    Resp_ID INT IDENTITY(1,1) PRIMARY KEY,
    Resp_Alternativa VARCHAR(1),
    Resp_Respuesta VARCHAR(500),
    Resp_Orden INT,
    Resp_FechaRespuesta DATETIME
);

CREATE TABLE Pregunta (
    Preg_ID INT IDENTITY(1,1) PRIMARY KEY,
    Resp_ID INT FOREIGN KEY REFERENCES Respuesta(Resp_ID),
    Eval_ID INT FOREIGN KEY REFERENCES Evaluacion(Eval_ID),
    Preg_Pregunta VARCHAR(500),
    Preg_Orden INT,
    Preg_TipoPregunta VARCHAR(50),
    Preg_FechaCreacion DATETIME
);

CREATE TABLE Etapa (
    Etap_ID INT IDENTITY(1,1) PRIMARY KEY,
    Clie_ID INT FOREIGN KEY REFERENCES Cliente(Clie_ID),
    Preg_ID INT FOREIGN KEY REFERENCES Pregunta(Preg_ID),
    Etap_Etapa VARCHAR(50),
    Etap_Descripcion VARCHAR(200),
    Etap_Orden INT,
    Etap_FechaInscripcion DATETIME
);

CREATE TABLE Curso (
    Curs_ID INT IDENTITY(1,1) PRIMARY KEY,
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Preg_ID INT,
    Curs_NombreCurso VARCHAR(50),
    Curs_Descripcion VARCHAR(200),
    Curs_Objetivo VARCHAR(200),
    Curs_FechaInicio DATE,
    Curs_FechaFin DATE,
    Curs_DuracionHoras INT,
    Curs_Modalidad VARCHAR(50)
);

CREATE TABLE Programa (
    Prog_ID INT IDENTITY(1,1) PRIMARY KEY,
    Clie_ID INT FOREIGN KEY REFERENCES Cliente(Clie_ID),
    Bann_ID INT FOREIGN KEY REFERENCES Banner(Bann_ID),
    Info_ID INT FOREIGN KEY REFERENCES Informacion(Info_ID),
    Requ_ID INT FOREIGN KEY REFERENCES Requisito(Requ_ID),
    Insc_ID INT FOREIGN KEY REFERENCES Inscripcion(Insc_ID),
    Bene_ID INT FOREIGN KEY REFERENCES Beneficio(Bene_ID),
    Cexi_ID INT FOREIGN KEY REFERENCES CasoExito(Cexi_ID),
    Egra_ID INT FOREIGN KEY REFERENCES EmpresaGraduada(Egra_ID),
    Cont_ID INT FOREIGN KEY REFERENCES Contacto(Cont_ID),
    Curs_ID INT FOREIGN KEY REFERENCES Curso(Curs_ID),
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Prog_Titulo VARCHAR(50),
    Prog_Contenido VARCHAR(200)
);

CREATE TABLE Usuario (
    Usua_ID INT IDENTITY(1,1) PRIMARY KEY,
    Usua_Usuario VARCHAR(50),
    Usua_Contrasenia VARCHAR(200),
    Usua_Cargo VARCHAR(50)
);

CREATE TABLE Auditoria (
    Audi_ID INT IDENTITY(1,1) PRIMARY KEY,
    Prog_ID INT FOREIGN KEY REFERENCES Programa(Prog_ID),
    Clie_ID INT FOREIGN KEY REFERENCES Cliente(Clie_ID),
    Bann_ID INT FOREIGN KEY REFERENCES Banner(Bann_ID),
    Info_ID INT FOREIGN KEY REFERENCES Informacion(Info_ID),
    Requ_ID INT FOREIGN KEY REFERENCES Requisito(Requ_ID),
    Insc_ID INT FOREIGN KEY REFERENCES Inscripcion(Insc_ID),
    Bene_ID INT FOREIGN KEY REFERENCES Beneficio(Bene_ID),
    Cexi_ID INT FOREIGN KEY REFERENCES CasoExito(Cexi_ID),
    Egra_ID INT FOREIGN KEY REFERENCES EmpresaGraduada(Egra_ID),
    Cont_ID INT FOREIGN KEY REFERENCES Contacto(Cont_ID),
    Curs_ID INT FOREIGN KEY REFERENCES Curso(Curs_ID),
    Mult_ID INT FOREIGN KEY REFERENCES Multimedia(Mult_ID),
    Usua_ID INT FOREIGN KEY REFERENCES Usuario(Usua_ID),
    Preg_ID INT FOREIGN KEY REFERENCES Pregunta(Preg_ID),
    Resp_ID INT FOREIGN KEY REFERENCES Respuesta(Resp_ID),
    Eval_ID INT FOREIGN KEY REFERENCES Evaluacion(Eval_ID),
    Audi_UsuarioCreacion VARCHAR(50),
    Audi_UsuarioEdicion VARCHAR(50),
    Audi_UsuarioEliminacion VARCHAR(50),
    Audi_FechaCreacion DATETIME,
    Audi_FechaEdicion DATETIME,
    Audi_FechaEliminacion DATETIME,
    Audi_IpCreacion VARCHAR(20),
    Audi_IpEdicion VARCHAR(20),
    Audi_IpEliminacion VARCHAR(20)
);
