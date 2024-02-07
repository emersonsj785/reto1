CREATE TABLE PROVINCIA(
    idProvincia     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descProvincia   VARCHAR(50),
    fechaRegistro   DATE NOT NULL
);

CREATE TABLE GERENTE(
    idGerente       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descGerente     VARCHAR(50),
    fechaRegistro   DATE NOT NULL
);

CREATE TABLE CONDICION(
    idCondicion     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descCondicion   VARCHAR(50),
    fechaRegistro   DATE NOT NULL
);

CREATE TABLE SEDE(
    idSede          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descSede        VARCHAR(50),
    fechaRegistro   DATE NOT NULL
);

CREATE TABLE DISTRITO(
    idDistrito      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idProvincia     INT NOT NULL,
    descDistrito    VARCHAR(50),
    fechaRegistro   DATE NOT NULL,
    CONSTRAINT FK_PROVINCIA FOREIGN KEY (idProvincia) REFERENCES PROVINCIA(idProvincia)
);

CREATE TABLE HOSPITAL(
    idHospital      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idDistrito      INT NOT NULL,
    nombre          VARCHAR(70),
    antiguedad      INT,
    area            DECIMAL(5,2) NOT NULL,
    idSede          INT NOT NULL,
    idGerente       INT NOT NULL,
    idCondicion     INT NOT NULL,
    fechaRegistro   DATE NOT NULL,
    CONSTRAINT FK_DISTRITO FOREIGN KEY (idDistrito) REFERENCES DISTRITO(idDistrito),
    CONSTRAINT FK_SEDE FOREIGN KEY (idSede) REFERENCES SEDE(idSede),
    CONSTRAINT FK_GERENTE FOREIGN KEY (idGerente) REFERENCES GERENTE(idGerente),
    CONSTRAINT FK_CONDICION FOREIGN KEY (idCondicion) REFERENCES CONDICION(idCondicion)
);

COMMIT;