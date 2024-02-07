-- Insertando datos en la tabla PROVINCIA
INSERT INTO PROVINCIA (descProvincia, fechaRegistro) VALUES ('Lima',                SYSDATE);
INSERT INTO PROVINCIA (descProvincia, fechaRegistro) VALUES ('Arequipa',            SYSDATE);
INSERT INTO PROVINCIA (descProvincia, fechaRegistro) VALUES ('Cusco',               SYSDATE);
INSERT INTO PROVINCIA (descProvincia, fechaRegistro) VALUES ('Piura',               SYSDATE);
INSERT INTO PROVINCIA (descProvincia, fechaRegistro) VALUES ('La Libertad',         SYSDATE);

-- Insertando datos en la tabla GERENTE
INSERT INTO GERENTE (descGerente, fechaRegistro) VALUES    ('Gerente 1',            SYSDATE);
INSERT INTO GERENTE (descGerente, fechaRegistro) VALUES    ('Gerente 2',            SYSDATE);
INSERT INTO GERENTE (descGerente, fechaRegistro) VALUES    ('Gerente 3',            SYSDATE);
INSERT INTO GERENTE (descGerente, fechaRegistro) VALUES    ('Gerente 4',            SYSDATE);
INSERT INTO GERENTE (descGerente, fechaRegistro) VALUES    ('Gerente 5',            SYSDATE);

-- Insertando datos en la tabla CONDICION
INSERT INTO CONDICION (descCondicion, fechaRegistro) VALUES    ('Condicion 1',          SYSDATE);
INSERT INTO CONDICION (descCondicion, fechaRegistro) VALUES    ('Condicion 2',          SYSDATE);
INSERT INTO CONDICION (descCondicion, fechaRegistro) VALUES    ('Condicion 3',          SYSDATE);
INSERT INTO CONDICION (descCondicion, fechaRegistro) VALUES    ('Condicion 4',          SYSDATE);
INSERT INTO CONDICION (descCondicion, fechaRegistro) VALUES    ('Condicion 5',          SYSDATE);

-- Insertando datos en la tabla SEDE
INSERT INTO SEDE (descSede, fechaRegistro)  VALUES    ('Hospital de Lima',     SYSDATE);
INSERT INTO SEDE (descSede, fechaRegistro)  VALUES    ('Hospital de Arequipa', SYSDATE);
INSERT INTO SEDE (descSede, fechaRegistro)  VALUES    ('Hospital de Cusco',    SYSDATE);
INSERT INTO SEDE (descSede, fechaRegistro)  VALUES    ('Hospital de Piura',    SYSDATE);
INSERT INTO SEDE (descSede, fechaRegistro)  VALUES    ('Hospital de Trujillo', SYSDATE);

-- Insertando datos en la tabla DISTRITO
INSERT INTO DISTRITO (idProvincia, descDistrito, fechaRegistro) VALUES    (1, 'Miraflores',       SYSDATE);
INSERT INTO DISTRITO (idProvincia, descDistrito, fechaRegistro) VALUES    (1, 'San Isidro',       SYSDATE);
INSERT INTO DISTRITO (idProvincia, descDistrito, fechaRegistro) VALUES    (2, 'Yanahuara',        SYSDATE);
INSERT INTO DISTRITO (idProvincia, descDistrito, fechaRegistro) VALUES    (2, 'Cayma',            SYSDATE);
INSERT INTO DISTRITO (idProvincia, descDistrito, fechaRegistro) VALUES    (3, 'Cusco',            SYSDATE);

COMMIT;
