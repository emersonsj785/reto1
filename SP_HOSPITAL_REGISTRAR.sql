CREATE OR REPLACE PROCEDURE SP_HOSPITAL_REGISTRAR(
    p_nombre IN VARCHAR,
    p_sede IN NUMBER,
    p_gerente IN NUMBER,
    p_condicion IN NUMBER,
    v_mensaje OUT VARCHAR) 
IS
    CURSOR provincias IS
        SELECT idProvincia, descProvincia 
        FROM provincia;

    v_nombreDistrito VARCHAR2(50);
    v_distrito NUMBER;
    v_area DECIMAL(5,2);
BEGIN
    v_nombreDistrito := 'Lima';
    v_area := 100;
    
    FOR prov IN provincias LOOP
        IF prov.descProvincia = v_nombreDistrito THEN
            SELECT d.idDistrito
            INTO v_distrito
            FROM distrito d
            WHERE d.idProvincia = prov.idProvincia AND ROWNUM = 1; -- Agregar ROWNUM = 1
            EXIT; 
        END IF;
    END LOOP;
    
    INSERT INTO HOSPITAL (idDistrito, nombre, area, idSede, idGerente, idCondicion, fechaRegistro)
    VALUES (v_distrito, p_nombre, v_area, p_sede, p_gerente, p_condicion, SYSDATE);
    
    v_mensaje := 'Hospital Agregado a la Base de Datos';
EXCEPTION
    WHEN OTHERS THEN
        v_mensaje := 'Error: ' || SQLERRM;
END;