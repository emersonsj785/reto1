CREATE OR REPLACE PROCEDURE SP_HOSPITAL_ACTUALIZAR(
    p_hospital IN NUMBER,
    p_nombre IN VARCHAR,
    p_gerente IN NUMBER,
    p_condicion IN NUMBER,
    p_distrito IN NUMBER,
    v_mensaje OUT VARCHAR
) 
IS
    CURSOR distritos IS
        SELECT idDistrito FROM DISTRITO;
        
    v_sede NUMBER;
BEGIN

    FOR distrito_record IN distritos LOOP
        
        IF distrito_record.idDistrito = p_distrito THEN
            
            CASE p_distrito
                WHEN 1 THEN v_sede := 1;
                WHEN 2 THEN v_sede := 2;
                WHEN 3 THEN v_sede := 3;
                WHEN 4 THEN v_sede := 4;
                WHEN 5 THEN v_sede := 5;
                ELSE v_sede := 1;
            END CASE;
        END IF;
    END LOOP;

    
    UPDATE HOSPITAL
    SET iddistrito = p_distrito,
        nombre = UPPER(p_nombre),
        idsede = v_sede,
        idgerente = p_gerente,
        idcondicion = p_condicion,
        fecharegistro = last_day(sysdate)
    WHERE idhospital = p_hospital;

    v_mensaje := 'Actualización de Hospitales completada.';
EXCEPTION
    WHEN OTHERS THEN
        v_mensaje := 'Error: ' || SQLERRM;
END;