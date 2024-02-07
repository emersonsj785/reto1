create or replace PROCEDURE SP_HOSPITAL_LISTAR IS
    CURSOR hospital_cursor IS
        SELECT 
            H.idHospital,
            H.nombre AS nombre_hospital,
            D.descDistrito AS nombre_distrito,
            S.descSede AS nombre_sede,
            G.descGerente AS nombre_gerente,
            C.descCondicion AS nombre_condicion
        FROM 
            HOSPITAL H
        INNER JOIN 
            DISTRITO D ON H.idDistrito = D.idDistrito
        INNER JOIN 
            SEDE S ON H.idSede = S.idSede
        INNER JOIN 
            GERENTE G ON H.idGerente = G.idGerente
        INNER JOIN 
            CONDICION C ON H.idCondicion = C.idCondicion;

    v_hospital_id HOSPITAL.idHospital%TYPE;
    v_hospital_nombre HOSPITAL.nombre%TYPE;
    v_hospital_distrito VARCHAR(50); -- Cambiado el tipo de dato
    v_hospital_sede VARCHAR(50); -- Cambiado el tipo de dato
    v_hospital_gerente VARCHAR(50); -- Cambiado el tipo de dato
    v_hospital_condicion VARCHAR(50); -- Cambiado el tipo de dato
BEGIN
    OPEN hospital_cursor;

    LOOP
        BEGIN
            FETCH hospital_cursor INTO
                v_hospital_id,
                v_hospital_nombre,
                v_hospital_distrito,
                v_hospital_sede,
                v_hospital_gerente,
                v_hospital_condicion;

            EXIT WHEN hospital_cursor%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('ID: ' || v_hospital_id || ', Nombre: ' || v_hospital_nombre || ', Distrito: ' || v_hospital_distrito || ', Sede: ' || v_hospital_sede || ', Gerente: ' || v_hospital_gerente || ', Condición: ' || v_hospital_condicion);

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No hay más hospitales que listar.');
                EXIT;
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error al recuperar datos del hospital: ' || SQLERRM);
                EXIT;
        END;
    END LOOP;

    CLOSE hospital_cursor;
END;